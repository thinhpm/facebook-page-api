<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include_once '../config/database.php';
include_once '../objects/accesstoken.php';
include_once  '../objects/security.php';

$database = new Database();
$db = $database->getConnection();

$accesstoken = new AccessToken($db);
$security = new Security($db);

$pageNumber = $_GET['page_number'];
$key = $_GET['key'];
$user_id = $security->getUserId($key);

if ($user_id == 0) {
    http_response_code(404);
    echo json_encode(['message' => "Access token not found!"]);
    die;
}


$stmt = $accesstoken->read($pageNumber, $user_id);

$num = $stmt->rowCount();

if ($num > 0) {
    $acessTokensArr = array();
    $accessTokenArr['records'] = array();

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        extract($row);

        $item = array(
            'id' => $id,
            'accesstoken' => $access_token,
            'user_id' => $user_id,
            'page_number' => $page_number
        );

        array_push($acessTokensArr, $item);
    }

    http_response_code(200);
    echo json_encode($acessTokensArr);
} else {
    http_response_code(404);
    echo json_encode(['message' => "Access token not found!"]);
}


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
$accountId = $_GET['account_id'];
$key = $_GET['key'];
$userId = $security->getUserId($key);

if ($userId == 0) {
    http_response_code(404);
    echo json_encode(['message' => "Access token not found!"]);
    die;
}


$stmt = $accesstoken->read($pageNumber, $userId, $accountId);

$num = $stmt->rowCount();

if ($num > 0) {
    $acessTokensArr = array();
    $accessTokenArr['records'] = array();

    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    extract($row);

    $item = array(
        'id' => $row['id'],
        'accesstoken' => $row['access_token'],
        'user_id' => $row['user_id'],
        'page_number' => $row['page_number'],
        'account_id' => $row['account_id'],
        'channel_id' => $row['channel_id']
    );

    http_response_code(200);
    echo json_encode($item);
} else {
    http_response_code(404);
    echo json_encode(['message' => "Access token not found!"]);
}


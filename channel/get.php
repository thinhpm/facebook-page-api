<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include_once '../config/database.php';
include_once '../objects/channel.php';
include_once  '../objects/security.php';

$database = new Database();
$db = $database->getConnection();

$channel = new Channel($db);
$security = new Security($db);

$channelId = $_GET['channel_id'];
$key = $_GET['key'];
$userId = $security->getUserId($key);

if ($userId == 0) {
    http_response_code(404);
    echo json_encode(['message' => "Channel not found!"]);
    die;
}


$stmt = $channel->get($channelId, $userId);

$num = $stmt->rowCount();

if ($num > 0) {
    $channelArr = array();
    $channelArr['records'] = array();

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        extract($row);

        $item = array(
            'source' => $source
        );

        array_push($channelArr["records"], $item);
    }


    http_response_code(200);
    echo json_encode($channelArr);
} else {
    http_response_code(404);
    echo json_encode(['message' => "Channel not found!"]);
}


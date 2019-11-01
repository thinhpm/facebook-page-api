<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include_once '../config/database.php';
include_once '../objects/channel.php';
include_once  '../objects/security.php';
include_once '../objects/data.php';

$database = new Database();
$db = $database->getConnection();

$data = new Data($db);
$security = new Security($db);

$channelId = $_GET['channel_id'];
$key = $_GET['key'];
$userId = $security->getUserId($key);

if ($userId == 0) {
    http_response_code(404);
    echo json_encode(['message' => "Channel not found!"]);
    die;
}

$stmt = $data->get($channelId);

$num = $stmt->rowCount();

if ($num > 0) {
    $dataArr = array();
    $dataArr['records'] = array();

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        extract($row);

        array_push($dataArr["records"], $video_id);
    }

    http_response_code(200);
    echo json_encode($dataArr);
} else {
    $dataArr = array();
    $dataArr['records'] = array();
    http_response_code(200);
    echo json_encode($dataArr);
}


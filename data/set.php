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

$channelId = $_POST['channel_id'];
$key = $_POST['key'];
$videoId = $_POST['video_id'];
$userId = $security->getUserId($key);

if ($userId == 0) {
    http_response_code(404);
    echo json_encode(['message' => "Channel not found!"]);
    die;
}

$check = $data->set($channelId, $videoId);

if (!$check) {
	http_response_code(302);
    echo json_encode(['message' => "Save fail!"]);
    die;
}

http_response_code(200);
echo json_encode(['message' => "Save success!"]);
die;
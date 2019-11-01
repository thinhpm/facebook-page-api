<?php
class Data
{
    private $conn;
    private $tableName = 'datas';

    public function __construct($db)
    {
        $this->conn = $db;
    }

    function get($channelId)
    {
        // select all query
        $query = "SELECT video_id FROM " . $this->tableName . " WHERE channel_id = '" . $channelId . "'";

        // prepare query statement
        $stmt = $this->conn->prepare($query);

        // execute query
        $stmt->execute();

        return $stmt;
    }

    function set($channelId, $videoId)
    {
        // select all query
        $query = "INSERT INTO " . $this->tableName . " (channel_id, video_id) VALUES ('" . $channelId . "', '" . $videoId . "')";

        // prepare query statement
        $stmt = $this->conn->prepare($query);

        // execute query
        if ($stmt->execute()) {
            return true;
        }

        return false;
    }
}
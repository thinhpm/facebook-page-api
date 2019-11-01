<?php
class Channel
{
    private $conn;
    private $tableName = 'channels';

    public function __construct($db)
    {
        $this->conn = $db;
    }

    function get($channelId, $userId)
    {
        // select all query
        $query = "SELECT source FROM " . $this->tableName . " WHERE id = '" . $channelId . "' AND user_id = '" . $userId . "'";

        // prepare query statement
        $stmt = $this->conn->prepare($query);

        // execute query
        $stmt->execute();

        return $stmt;
    }
}
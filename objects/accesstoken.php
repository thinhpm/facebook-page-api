<?php
class AccessToken
{
    private $conn;
    private $tableName = 'access_tokens';
    public $id;
    public $accessToken;
    public $userId;
    public $pageNumber;

    public function __construct($db)
    {
        $this->conn = $db;
    }

    function read($pageNumber, $userId, $accountId)
    {
        // select all query
        $query = "SELECT * FROM " . $this->tableName . " WHERE page_number = '" . $pageNumber . "' AND user_id = '" . $userId . "' AND account_id = '" . $accountId . "'";

        // prepare query statement
        $stmt = $this->conn->prepare($query);

        // execute query
        $stmt->execute();

        return $stmt;
    }
}
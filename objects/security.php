<?php
class Security
{
    private $conn;
    private $table_name = 'securities';

    public function __construct($db)
    {
        $this->conn = $db;
    }

    public function getUserId($key)
    {
        $query = "SELECT user_id FROM " . $this->table_name . " WHERE `key` = '" . $key . "'";

        // prepare query statement
        $stmt = $this->conn->prepare($query);

        // execute query
        $stmt->execute();

        $num = $stmt->rowCount();

        if ($num == 0) {
            return 0;
        }

        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        return $row['user_id'];
    }
}
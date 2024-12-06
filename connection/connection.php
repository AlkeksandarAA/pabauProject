<?php


class Connection
{
    private $host;
    private $dbName;
    private $username;
    private $password;
    private $connection;

    public function __construct($host, $dbName, $username, $password)
    {
        $this->host = $host;
        $this->dbName = $dbName;
        $this->username = $username;
        $this->password = $password;

        $this->connection = new PDO("mysql:host=$host;dbname=$dbName", $username, $password);
    }

    public function getConnection()
    {
        return $this->connection;
    }

}



?>
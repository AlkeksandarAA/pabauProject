<?php


class Categories
{

    private $connection;
    private $query = "SELECT * FROM categories";
    private $statement;


    public function __construct($connection)
    {
        $this->connection = $connection;


        $this->statement = $this->connection->prepare($this->query);
    }

    public function getCategories()
    {
        $this->statement->execute();

        return $this->statement->fetchAll(PDO::FETCH_ASSOC);

    }
}


?>
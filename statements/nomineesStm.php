<?php

class Nominees
{

    private $connection;
    private $query = "SELECT 
                nominees.id AS nominee_id,
                users.id AS user_id,
                users.first_name,
                users.last_name,
                categories.id AS category_id,
                categories.name AS category_name
            FROM 
                nominees
            JOIN 
                users ON nominees.user_id = users.id
            JOIN 
                categories ON nominees.category_id = categories.id";
    private $statement;



    public function __construct($connection)
    {
        $this->connection = $connection;


        $this->statement = $this->connection->prepare($this->query);
    }


    public function getNominees()
    {
        $this->statement->execute();

        return $this->statement->fetchAll(PDO::FETCH_ASSOC);

    }



}


















?>
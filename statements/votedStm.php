<?php

class Vote
{
    private $connection;
    private $query = "INSERT INTO user_vote_nominee (user_id, nominee_id, time_vote, voter_comment) VALUES (:user_id, :nominee_id, NOW(), :voter_comment)";
    private $statement;

    public function __construct($connection)
    {
        $this->connection = $connection;
        $this->statement = $this->connection->prepare($this->query);
    }

    public function bindVoteData($user_id, $nominee_id, $voter_comment)
    {
        // Bind the values to the placeholders in the query
        $this->statement->bindParam(':user_id', $user_id);
        $this->statement->bindParam(':nominee_id', $nominee_id);
        $this->statement->bindParam(':voter_comment', $voter_comment);
    }

    public function submitVote()
    {
        $this->statement->execute();
    }
}




?>
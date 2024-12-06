<?php

require_once "../statements/votedStm.php";
require_once "../connection/connection.php";

$host = "localhost";
$dbName = "pabau_project";
$username = "root";
$password = "";

$connection = new Connection($host, $dbName, $username, $password);
$vote = new Vote($connection->getConnection());

session_start();


$user_id = $_SESSION['id'];



if (isset($_POST['votes'])) {



    $votes = json_decode($_POST['votes'], true);
    $comments = isset($_POST['voter_comments']) ? json_decode($_POST['voter_comments'], true) : [];


    if (is_array($votes)) {
        foreach ($votes as $index => $nominee_id) {

            $voter_comment = isset($comments[$index]) ? $comments[$index] : '';

            $vote->bindVoteData($user_id, $nominee_id, $voter_comment);
            error_log(print_r($comments, true));
            $vote->submitVote();
        }

        echo json_encode(['success' => true, 'message' => 'Votes and comments have been submitted']);
    } else {
        echo json_encode(['success' => false, 'message' => 'Votes data is not an array']);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'No votes submitted']);
}

?>
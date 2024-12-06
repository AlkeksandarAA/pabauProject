<?php

require_once "../connection/connection.php";
require_once "../statements/categoriesStm.php";
require_once "../statements/nomineesStm.php";


$user = [
    'email' => $_POST['email'],
];

$host = "localhost";
$dbName = "pabau_project";
$username = "root";
$password = "";


$connection = new Connection($host, $dbName, $username, $password);

if ($user)
    try {
        $db = $connection->getConnection();
        $query = "SELECT * FROM `users` WHERE `email` = :email";

        $statement = $db->prepare($query);

        $statement->bindParam(':email', $user['email']);

        $statement->execute();

        $userJ = $statement->fetch(PDO::FETCH_ASSOC);

        if ($userJ) {

            session_start();

            $_SESSION['id'] = $userJ['id'];
            $_SESSION['email'] = $userJ['email'];
            $_SESSION['first_name'] = $userJ['first_name'];
            $_SESSION['last_name'] = $userJ['last_name'];

            $categoriesObj = new Categories($connection->getConnection());

            $categories = $categoriesObj->getCategories();

            $nomineeObj = new Nominees($connection->getConnection());

            $nominees = $nomineeObj->getNominees();

            $groupedData = [];
            foreach ($categories as $category) {
                $groupedData[] = [
                    'category_id' => $category['id'],
                    'category_name' => $category['name'],
                    'nominees' => [],
                ];
            }

            $loggedInUserId = $_SESSION['id'];

            $filteredNominees = array_filter($nominees, function ($nominee) use ($loggedInUserId) {
                return $nominee['user_id'] !== $loggedInUserId;
            });


            foreach ($groupedData as &$category) {
                foreach ($filteredNominees as $nominee) {
                    //slot nominees id here 
                    if ($category['category_id'] === $nominee['category_id']) {
                        $category['nominees'][] = [
                            'user_id' => $nominee['user_id'],
                            // 'nominee_id' => $nominee['id'],
                            'first_name' => $nominee['first_name'],
                            'last_name' => $nominee['last_name'],
                        ];
                    }
                }
            }
            echo json_encode(['succsess' => true, 'categories' => $categories, 'groupedData' => $groupedData, 'nominees' => $nominees]);
        } else {
            echo json_encode(['success' => false, 'message' => $user['email'] . 'is not a valid email address']);
        }

    } catch (PDOException $e) {
        echo json_encode(['success' => false, 'message' => 'Database error: ' . $e->getMessage()]);
    }
?>
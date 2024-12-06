<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>

<body class="bg-secondary text-white">
    ->
    <div id="logIn">
        <form action="/formSubmits/userLogin.php" method="POST" id="logInForm"
            class="d-flex justify-content-center align-items-center flex-column">
            <label>Email</label>
            <div class="mb-3 d-flex flex-column align-items-center">
                <input type="email" class="form-control" id="email" aria-describedby="emailHelp" name="email">
                <button type="submit" id="button" class="btn btn-info d-block mt-3">Log in</button>
            </div>
        </form>
    </div>

    <div class="d-flex flex-column justify-content-center align-items-center d-none" id="nominees">
        <form id="submitVotesForm" class="w-100">
            <div id="categories" class="d-flex justify-content-between container h-full fs-2 text"></div>
            <button type="submit" class="d-block btn btn-info mt-5" id="submit">Submit Votes</button>
        </form>
    </div>


    <script src="./index.js"></script>

</html>
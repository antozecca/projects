<?php
session_start();

$valid_users = [
    "Giocatore_1" => "Gaol241",
    "Giocatore_2" => "Gaol242",
    "Giocatore_3" => "Gaol243",
    "Giocatore_4" => "Gaol244"
];

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["username"]) && isset($_POST["password"])) {
    $username = $_POST["username"];
    $password = $_POST["password"];

    if (array_key_exists($username, $valid_users) && $valid_users[$username] === $password) {
        $_SESSION['user_logged_in'] = true;
        $_SESSION['user_id'] = $username;
        $_SESSION['start_time'] = time();
        
        echo "success";
        exit();
    } else {
        echo "Errore! Credenziali errate";
    }
}
?>

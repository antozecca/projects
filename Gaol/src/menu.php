<?php
    require 'login.php';
    
    if (isset($_SESSION['user_id'])) {
        $username = $_SESSION['user_id'];
    }else {
        echo "<script>window.location.href = 'index.html';</script>";
        exit;
    }
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu di Gioco</title>
    <link rel="icon" type="image/x-icon" href="/immagini/favicon.ico">
    <link rel="stylesheet" href="/stili/style.css">
</head>
<body>
    <div class="game-container">
        <div class="container">
            <h1>Menu</h1>
            <div class="menu">
                <button id="playButton" class="menu-button">Gioca Partita</button>
                <button id="classesButton" class="menu-button">Classi</button>
                <button id="progressButton" class="menu-button">Progressi</button>
                <button id="exitButton" class="menu-button">Esci</button>
            </div>
            <div class="username">
                Benvenuto <?php echo $username; ?> !
            </div>
        </div>
    </div>
    <script src="/script/script.js"></script>
</body>
</html>
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
    <title>Classi</title>
    <link rel="icon" type="image/x-icon" href="/immagini/favicon.ico">
    <link rel="stylesheet" href="/stili/style2.css">
</head>
<body>
    <div class="game-container">
        <div class="container">
            <h1>Classi</h1>
            <div class="menu">
                <button class="menu-button">←</button>
            </div>
            <div class="class-box" id="mage">
                <img src="/immagini/stregone.png" alt="Stregone">
                <div class="class-name">Stregone</div>
            </div>
            <div class="class-box" id="knight">
                <img src="/immagini/cavaliere.png" alt="Cavaliere">
                <div class="class-name">Cavaliere</div>
            </div>
            <div class="class-box" id="huntress">
                <img src="/immagini/cacciatrice.png" alt="Cacciatrice">
                <div class="class-name">Cacciatrice</div>
            </div>
            <div class="class-box" id="cleric">
                <img src="/immagini/chierico.png" alt="Chierico">
                <div class="class-name">Chierico</div>
            </div>
            <div class="username"><?php echo $username; ?></div>
        </div>
    </div>
    <script src="/script/script2.js"></script>
    <script src="/script/script3.js"></script>
    <script src="/script/box.js"></script>
</body>
</html>
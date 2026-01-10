<?php
    require 'login.php';
    
    if (isset($_SESSION['user_id'])) {
        $username = $_SESSION['user_id'];
    }else {
        echo "<script>window.location.href = 'index.html';</script>";
        exit;
    }

    include 'stats.php';

    $vigor = $cavaliere_stats['vigore'];
    $intelligence = $cavaliere_stats['intelligenza'];
    $strength = $cavaliere_stats['forza'];
    $resistance = $cavaliere_stats['resistenza'];
    $maxexp = $cavaliere_stats['esperienza_massima'];
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Classe: Cavaliere</title>
    <link rel="icon" type="image/x-icon" href="/immagini/favicon.ico">
    <link rel="stylesheet" href="/stili/style_class.css">
</head>
<body>
    <div class="game-container">
        <div class="container">
            <h1>Cavaliere</h1>
            <div class="menu">
                <button class="menu-button">←</button>
            </div>
            <img src="/immagini/cavaliere.png" alt="Knight" class="image">
            <div class="right-panel">
                <div class="status-container">
                    <div class="status-bar health" style="text-align: center; color: rgb(239, 167, 50); font-family: 'Pixeled_English_Font', sans-serif; display: flex; justify-content: center; align-items: center;"></div>
                    <div class="status-bar mana" style="text-align: center; color: rgb(239, 167, 50); font-family: 'Pixeled_English_Font', sans-serif; display: flex; justify-content: center; align-items: center;"></div>
                    <div class="attribute vigore">
                        <img src="/immagini/vigor_icon.jpg" alt="Vigore" class="attribute-icon">
                        <span></span>
                    </div>
                    <div class="attribute intelligenza">
                        <img src="/immagini/intelligence_icon.jpg" alt="Intelligenza" class="attribute-icon">
                        <span>Intelligenza: <?php echo $intelligence; ?></span>
                    </div>
                    <div class="attribute forza">
                        <img src="/immagini/strength_icon.jpg" alt="Forza" class="attribute-icon">
                        <span></span>
                    </div>
                    <div class="attribute resistenza">
                        <img src="/immagini/resistance_icon.jpg" alt="Resistenza" class="attribute-icon">
                        <span></span>
                    </div>
                </div>
                <h2 style="text-align: center; color: rgb(239, 167, 50); font-family: 'Pixeled_English_Font', sans-serif;">Livello</h2>
                <div class="level-container"></div>
                <div class="experience-sample">
                    <div class="experience-bar"></div>
                    <span class="experience-text"></span>
                </div>
            </div>
            <div class="username"><?php echo $username; ?></div>
        </div>
    </div>
    <script src="/script/script_classi.js"></script>
    <script src="/script/storage.js"></script>
    <script>
        var datiUtente = caricaDati('<?php echo $username; ?>');

        var cavaliereStats = datiUtente.classes.cavaliere;

        var livelloCavaliere = cavaliereStats.livello;
        var esperienzaCavaliere = cavaliereStats.esperienza;

        var cavaliereLivello = Math.min(livelloCavaliere, 5);
        var cavaliereExp = (cavaliereLivello === 5) ? <?php echo $maxexp; ?> : esperienzaCavaliere;
        var expPercentage = (cavaliereExp / <?php echo $maxexp; ?>) * 100;

        document.querySelector('.level-container').innerHTML = '';
        for (var i = 1; i <= 5; i++) {
            var levelClass = (i <= cavaliereLivello) ? '' : 'locked';
            var levelDiv = '<div class="level ' + levelClass + '" data-level="' + i + '">' + i + '</div>';
            if (i < 5) levelDiv += '<span class="divider">•</span>';
            document.querySelector('.level-container').innerHTML += levelDiv;
        }

        document.querySelector('.experience-bar').style.width = expPercentage + '%';
        document.querySelector('.experience-text').innerText = (cavaliereLivello === 5) ? "MAX" : (cavaliereExp + '/' + <?php echo $maxexp; ?>);

        var vigor_base = <?php echo $vigor; ?>;
        var strength_base = <?php echo $strength; ?>;
        var resistance_base = <?php echo $resistance; ?>;

        var vigore_base = vigor_base + (cavaliereLivello - 1) * 2;
        var forza_base = strength_base + (cavaliereLivello - 1) * 2;
        var resistenza_base = resistance_base + (cavaliereLivello - 1) * 1;

        var vita = vigore_base * 12;
        var mana = <?php echo $intelligence; ?>;

        document.querySelector('.status-bar.health').style.width = vita + 'px';
        document.querySelector('.status-bar.mana').style.width = mana + 'px';

        document.querySelector('.status-bar.health').textContent = "Vita: " + vita;

        document.querySelector('.vigore span').textContent = "Vigore: " + vigore_base;
        document.querySelector('.forza span').textContent = "Forza: " + forza_base;
        document.querySelector('.resistenza span').textContent = "Resistenza: " + resistenza_base;
    </script>
</body>
</html>
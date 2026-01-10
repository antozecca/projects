<?php
    require 'login.php';
    
    if (isset($_SESSION['user_id'])) {
        $username = $_SESSION['user_id'];
    }else {
        echo "<script>window.location.href = 'index.html';</script>";
        exit;
    }

    include 'stats.php';

    $vigor = $stregone_stats['vigore'];
    $intelligence = $stregone_stats['intelligenza'];
    $strength = $stregone_stats['forza'];
    $resistance = $stregone_stats['resistenza'];
    $maxexp = $stregone_stats['esperienza_massima'];
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Classe: Stregone</title>
    <link rel="icon" type="image/x-icon" href="/immagini/favicon.ico">
    <link rel="stylesheet" href="/stili/style_class.css">
</head>
<body>
    <div class="game-container">
        <div class="container">
            <h1>Stregone</h1>
            <div class="menu">
                <button class="menu-button">←</button>
            </div>
            <img src="/immagini/stregone.png" alt="Mage" class="image">
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
                        <span></span>
                    </div>
                    <div class="attribute forza">
                        <img src="/immagini/strength_icon.jpg" alt="Forza" class="attribute-icon">
                        <span>Forza: <?php echo $strength; ?></span>
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
    <script src="/script/storage.js"></script>
    <script src="/script/script_classi.js"></script>
    <script>
        var datiUtente = caricaDati('<?php echo $username; ?>');

        var stregoneStats = datiUtente.classes.stregone;

        var livelloStregone = stregoneStats.livello;
        var esperienzaStregone = stregoneStats.esperienza;

        var stregoneLivello = Math.min(livelloStregone, 5);
        var stregoneExp = (stregoneLivello === 5) ? <?php echo $maxexp; ?> : esperienzaStregone;
        var expPercentage = (stregoneExp / <?php echo $maxexp; ?>) * 100;

        document.querySelector('.level-container').innerHTML = '';
        for (var i = 1; i <= 5; i++) {
            var levelClass = (i <= stregoneLivello) ? '' : 'locked';
            var levelDiv = '<div class="level ' + levelClass + '" data-level="' + i + '">' + i + '</div>';
            if (i < 5) levelDiv += '<span class="divider">•</span>';
            document.querySelector('.level-container').innerHTML += levelDiv;
        }

        document.querySelector('.experience-bar').style.width = expPercentage + '%';
        document.querySelector('.experience-text').innerText = (stregoneLivello === 5) ? "MAX" : (stregoneExp + '/' + <?php echo $maxexp; ?>);

        var vigor_base = <?php echo $vigor; ?>;
        var intelligence_base = <?php echo $intelligence; ?>;
        var resistance_base = <?php echo $resistance; ?>;

        var vigore_base = vigor_base + (stregoneLivello - 1) * 1;
        var intelligenza_base = intelligence_base + (stregoneLivello - 1) * 2;
        var resistenza_base = resistance_base + (stregoneLivello - 1) * 2;

        var vita = vigore_base * 12;
        var mana = intelligenza_base * 12;

        document.querySelector('.status-bar.health').style.width = vita + 'px';
        document.querySelector('.status-bar.mana').style.width = mana + 'px';

        document.querySelector('.status-bar.health').textContent = "Vita: " + vita;
        document.querySelector('.status-bar.mana').textContent = "Mana: " + mana;

        document.querySelector('.vigore span').textContent = "Vigore: " + vigore_base;
        document.querySelector('.intelligenza span').textContent = "Intelligenza: " + intelligenza_base;
        document.querySelector('.resistenza span').textContent = "Resistenza: " + resistenza_base;
    </script>
</body>
</html>
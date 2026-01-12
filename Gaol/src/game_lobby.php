<?php
    require 'login.php';
    
    if (isset($_SESSION['user_id'])) {
        $username = $_SESSION['user_id'];
    }else {
        echo "<script>window.location.href = 'index.html';</script>";
        exit;
    } 
    
    include 'stats.php';

    $maxexp = $stregone_stats['esperienza_massima'];
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nuova Partita</title>
    <link rel="icon" type="image/x-icon" href="/immagini/favicon.ico">
    <link rel="stylesheet" href="/stili/style_lobby.css">
</head>
<body>
    <div class="game-container">
        <div class="container">
            <h1>Nuova Partita</h1>
            <div class="menu">
                <button class="menu-button">←</button>
            </div>
            <div id="nuova-partita">
                <div class="personaggio" id="stregone">
                    <img src="/immagini/stregone.png" alt="Stregone" class="character-image">
                    <div class="class-name">Stregone</div>
                    <div class="confirmation-box">✘</div>
                    <div class="level-stregone"></div>
                    <div class="experience-sample">
                        <div class="experience-bar-stregone"></div>
                        <span class="experience-text-stregone"></span>
                    </div>
                </div>
                <div class="personaggio" id="cavaliere">
                    <img src="/immagini/cavaliere.png" alt="Cavaliere" class="character-image">
                    <div class="class-name">Cavaliere</div>
                    <div class="confirmation-box">✘</div>
                    <div class="level-cavaliere"></div>
                    <div class="experience-sample">
                        <div class="experience-bar-cavaliere"></div>
                        <span class="experience-text-cavaliere"></span>
                    </div>
                </div>
                <div class="personaggio" id="cacciatrice">
                    <img src="/immagini/cacciatrice.png" alt="Cacciatrice" class="character-image">
                    <div class="class-name">Cacciatrice</div>
                    <div class="confirmation-box">✘</div>
                    <div class="level-cacciatrice"></div>
                    <div class="experience-sample">
                        <div class="experience-bar-cacciatrice"></div>
                        <span class="experience-text-cacciatrice"></span>
                    </div>
                </div>
                <div class="personaggio" id="chierico">
                    <img src="/immagini/chierico.png" alt="Chierico" class="character-image">
                    <div class="class-name">Chierico</div>
                    <div class="confirmation-box">✘</div>
                    <div class="level-chierico"></div>
                    <div class="experience-sample">
                        <div class="experience-bar-chierico"></div>
                        <span class="experience-text-chierico"></span>
                    </div>
                </div>
            </div>
            <div class="button-wrapper">
                <form id="personaggi-form" method="post" action="game.php">
                    <input type="hidden" id="personaggi-selezionati" name="personaggi">
                    <input type="hidden" id="party-size" name="partySize">
                    <input type="hidden" id="avg-level" name="avgLevel">
                    <button id="pronto-button">Pronto</button>
                </form>

            </div>
            <div class="username"><?php echo $username; ?></div>
        </div>
    </div>
    <script src="/script/script_lobby.js"></script>
    <script src="/script/script2.js"></script>
    <script src="/script/storage.js"></script>
    <script>
        var datiUtente = caricaDati('<?php echo $username; ?>');

        var stregoneStats = datiUtente.classes.stregone;
        var cavaliereStats = datiUtente.classes.cavaliere;
        var cacciatriceStats = datiUtente.classes.cacciatrice;
        var chiericoStats = datiUtente.classes.chierico;

        var livelloStregone = stregoneStats.livello;
        var esperienzaStregone = stregoneStats.esperienza;
        var livelloCavaliere = cavaliereStats.livello;
        var esperienzaCavaliere = cavaliereStats.esperienza;
        var livelloCacciatrice = cacciatriceStats.livello;
        var esperienzaCacciatrice = cacciatriceStats.esperienza;
        var livelloChierico = chiericoStats.livello;
        var esperienzaChierico = chiericoStats.esperienza;

        var stregoneLivello = Math.min(livelloStregone, 5);
        var stregoneExp = (stregoneLivello === 5) ? <?php echo $maxexp; ?> : esperienzaStregone;
        var stregoneExpPercentage = (stregoneExp / <?php echo $maxexp; ?>) * 100;
        var cavaliereLivello = Math.min(livelloCavaliere, 5);
        var cavaliereExp = (cavaliereLivello === 5) ? <?php echo $maxexp; ?> : esperienzaCavaliere;
        var cavaliereExpPercentage = (cavaliereExp / <?php echo $maxexp; ?>) * 100;
        var cacciatriceLivello = Math.min(livelloCacciatrice, 5);
        var cacciatriceExp = (cacciatriceLivello === 5) ? <?php echo $maxexp; ?> : esperienzaCacciatrice;
        var cacciatriceExpPercentage = (cacciatriceExp / <?php echo $maxexp; ?>) * 100;
        var chiericoLivello = Math.min(livelloChierico, 5);
        var chiericoExp = (chiericoLivello === 5) ? <?php echo $maxexp; ?> : esperienzaChierico;
        var chiericoExpPercentage = (chiericoExp / <?php echo $maxexp; ?>) * 100;

        document.querySelector('.experience-bar-stregone').style.width = stregoneExpPercentage + '%';
        document.querySelector('.experience-text-stregone').innerText = (stregoneLivello === 5) ? "MAX" : (stregoneExp + '/' + <?php echo $maxexp; ?>);
        document.querySelector('.experience-bar-cavaliere').style.width = cavaliereExpPercentage + '%';
        document.querySelector('.experience-text-cavaliere').innerText = (cavaliereLivello === 5) ? "MAX" : (cavaliereExp + '/' + <?php echo $maxexp; ?>);
        document.querySelector('.experience-bar-cacciatrice').style.width = cacciatriceExpPercentage + '%';
        document.querySelector('.experience-text-cacciatrice').innerText = (cacciatriceLivello === 5) ? "MAX" : (cacciatriceExp + '/' + <?php echo $maxexp; ?>);
        document.querySelector('.experience-bar-chierico').style.width = chiericoExpPercentage + '%';
        document.querySelector('.experience-text-chierico').innerText = (chiericoLivello === 5) ? "MAX" : (chiericoExp + '/' + <?php echo $maxexp; ?>);
        
        document.querySelector('.level-stregone').textContent = "Livello: " + stregoneLivello;
        document.querySelector('.level-cavaliere').textContent = "Livello: " + cavaliereLivello;
        document.querySelector('.level-cacciatrice').textContent = "Livello: " + cacciatriceLivello;
        document.querySelector('.level-chierico').textContent = "Livello: " + chiericoLivello;
    </script>
    <script>
var prontoButton = document.getElementById('pronto-button');
var personaggiForm = document.getElementById('personaggi-form');
var personaggiSelezionatiInput = document.getElementById('personaggi-selezionati');
var partySizeInput = document.getElementById('party-size');
var avgLevelInput = document.getElementById('avg-level');

prontoButton.addEventListener('click', function(e) {
    e.preventDefault();

    var personaggiSelezionati = [];
    document.querySelectorAll('.personaggio.selected').forEach(function(personaggio) {
        personaggiSelezionati.push(personaggio.id);
    });

    // Sicurezza: obbliga almeno 1 selezione
    if (personaggiSelezionati.length === 0) {
        alert('Seleziona almeno un personaggio');
        return;
    }

    // party size
    var partySize = personaggiSelezionati.length;

    // avg level dal localStorage già caricato (datiUtente)
    var sumLevels = 0;
    personaggiSelezionati.forEach(function(cls) {
        var lv = (datiUtente && datiUtente.classes && datiUtente.classes[cls] && datiUtente.classes[cls].livello)
            ? parseInt(datiUtente.classes[cls].livello, 10)
            : 1;
        sumLevels += lv;
    });

    var avgLevel = Math.round(sumLevels / partySize);

    personaggiSelezionatiInput.value = JSON.stringify(personaggiSelezionati);
    partySizeInput.value = partySize;
    avgLevelInput.value = avgLevel;

    personaggiForm.submit();
});

    </script>
</body>
</html>
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
    <title>Progressi</title>
    <link rel="icon" type="image/x-icon" href="/immagini/favicon.ico">
    <link rel="stylesheet" href="/stili/style3.css">
</head>
<body>
    <div class="game-container">
        <div class="container">
            <h1>Progressi</h1>
            <div class="menu">
                <button class="menu-button">←</button>
            </div>
            <div class="username"><?php echo $username; ?></div>
            <div class="progress-area">
                <div class="stats-column">
                    <p>Punteggio massimo: <span id="punteggioMassimo"></span></p>
                    <p>Danni inflitti: <span id="danniInflitti"></span></p>
                    <p>Danni subiti: <span id="danniSubiti"></span></p>
                    <p>Esperienza totale: <span id="esperienzaTotale"></span></p>
                    <p>Partite giocate: <span id="partiteGiocate"></span></p>
                    <p>Vittorie totali: <span id="vittorieTotali"></span></p>
                    <button onclick="confermaInizializzazione()" class="reset-button">Inizializza Progressi</button>
                </div>
            </div>
        </div>
    </div>
    <script src="/script/script2.js"></script>
    <script src="/script/storage.js"></script>
    <script>
        function caricaDatiUtente() {
            var username = "<?php echo $username; ?>";
            var datiUtente = caricaDati(username);

            document.getElementById("punteggioMassimo").innerText = datiUtente.stats.punteggioMassimo;
            document.getElementById("danniInflitti").innerText = datiUtente.stats.danniInflitti;
            document.getElementById("danniSubiti").innerText = datiUtente.stats.danniSubiti;
            document.getElementById("esperienzaTotale").innerText = datiUtente.stats.esperienzaTotale;
            document.getElementById("partiteGiocate").innerText = datiUtente.stats.partiteGiocate;
            document.getElementById("vittorieTotali").innerText = datiUtente.stats.vittorieTotali;
        }

        function inizializzaProgressiUtente() {
            var username = "<?php echo $username; ?>";
            var datiUtente = {
                stats: {
                    punteggioMassimo: 0,
                    danniInflitti: 0,
                    danniSubiti: 0,
                    esperienzaTotale: 0,
                    partiteGiocate: 0,
                    vittorieTotali: 0
                },
                classes: {
                    stregone: { livello: 1, esperienza: 0 },
                    cavaliere: { livello: 1, esperienza: 0 },
                    cacciatrice: { livello: 1, esperienza: 0 },
                    chierico: { livello: 1, esperienza: 0 }
                }
            };
            localStorage.setItem(username, JSON.stringify(datiUtente));
            caricaDatiUtente(username);
        }

        function confermaInizializzazione() {
            if (confirm("Sei sicuro di voler eliminare tutti i tuoi progressi?")) {
                inizializzaProgressiUtente();
            }
        }

        window.onload = function() {
            caricaDatiUtente();
        };
    </script>
</body>
</html>

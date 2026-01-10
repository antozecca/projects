<?php
require 'login.php';
require 'enemies.php';
require 'moves.php';

if (isset($_SESSION['user_id'])) {
    $username = $_SESSION['user_id'];
}else {
    echo "<script>window.location.href = 'index.html';</script>";
    exit;
}

$mostro = scegliNemicoCasuale();
$personaggi_selezionati = isset($_POST['personaggi']) ? json_decode($_POST['personaggi']) : [];
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Partita</title>
    <link rel="icon" type="image/x-icon" href="/immagini/favicon.ico">
    <link rel="stylesheet" href="/stili/style_game.css">
    <script>

        document.addEventListener("DOMContentLoaded", function() {
            var username = "<?php echo $username; ?>";
            var userData = localStorage.getItem(username);
            var mostro = <?php echo json_encode($mostro); ?>;
            mostro.vitaMax = mostro.vita;
            var personaggiSelezionati = <?php echo json_encode($personaggi_selezionati); ?>;
            var characterData = {};
            var currentIndex = 0;
            var currentAction = '';
            var currentMossa = null;
            var totalDamageInflicted = 0;
            var totalDamageTaken = 0;
            var numberOfAttacksUsed = 0;
            var numberOfCharactersDead = 0;

            if (userData) {
                userData = JSON.parse(userData);

                personaggiSelezionati.forEach(function(personaggio) {
                    if (userData.classes && userData.classes[personaggio]) {
                        characterData[personaggio] = userData.classes[personaggio];
                    }
                });

                var xhr = new XMLHttpRequest();
                xhr.open("POST", "fetch_data.php", true);
                xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
                xhr.send(JSON.stringify({ characterData: characterData }));

                xhr.onreadystatechange = function() {
                    if (xhr.readyState === 4) {
                        if (xhr.status === 200) {
                            try {
                                var response = JSON.parse(xhr.responseText);
                                personaggiSelezionati.forEach(function(personaggio) {
                                    if (response[personaggio]) {
                                        response[personaggio].manaAttuale = response[personaggio].mana;
                                        response[personaggio].vitaAttuale = response[personaggio].vita;
                                    }
                                });
                                renderGame(response);
                            } catch (e) {
                                console.error("Failed to parse response:", e);
                                console.error("Response text:", xhr.responseText);
                            }
                        } else {
                            console.error("Failed to fetch data. Status:", xhr.status);
                        }
                    }
                }
            } else {
                console.error("User data not found in localStorage");
            }

            function renderGame(response) {
                var container = document.querySelector('.container');
                container.innerHTML = '';

                personaggiSelezionati.forEach(function(personaggio) {
                    if (response[personaggio]) {
                        var infoBox = document.createElement('div');
                        infoBox.classList.add('info-box');

                        var nomeClasse = document.createElement('div');
                        nomeClasse.classList.add('nome-classe');
                        nomeClasse.innerHTML = ucfirst(personaggio) + " <span class='level'>Lv. " + response[personaggio].livello + "</span>";

                        var statBarContainer = document.createElement('div');
                        statBarContainer.classList.add('stat-bar-container');

                        var vitaAttuale = response[personaggio].vitaAttuale || response[personaggio].vita;
                        var manaAttuale = response[personaggio].manaAttuale || response[personaggio].mana;

                        var healthBar = createStatBar('health', vitaAttuale, response[personaggio].vita, 'Vita');
                        var manaBar = createStatBar('mana', manaAttuale, response[personaggio].mana, 'Mana');

                        var expBar;
                        if (response[personaggio].livello === 5) {
                            expBar = createMaxExpBar('experience');
                        } else {
                            expBar = createStatBar('experience', response[personaggio].esperienza, 2000, 'Exp');
                        }

                        statBarContainer.appendChild(healthBar);
                        statBarContainer.appendChild(manaBar);
                        statBarContainer.appendChild(expBar);

                        infoBox.appendChild(nomeClasse);
                        infoBox.appendChild(statBarContainer);

                        var personaggioDiv = document.createElement('div');
                        personaggioDiv.classList.add('personaggio', personaggio);
                        personaggioDiv.appendChild(infoBox);

                        container.appendChild(personaggioDiv);
                    }
                });

                var monsterContainer = document.querySelector('.monster-container');
                monsterContainer.innerHTML = '';

                var monsterName = "<?php echo $mostro['nome']; ?>";
                var monsterHealthCurrent = mostro.vita;
                var monsterHealthMax = mostro.vitaMax;

                var monsterNameDiv = document.createElement('div');
                monsterNameDiv.classList.add('monster-name');
                monsterNameDiv.textContent = monsterName;

                var monsterHealthBar = createStatBar('monster-health', monsterHealthCurrent, monsterHealthMax, 'Vita');
                monsterHealthBar.style.width = '400px';
                monsterHealthBar.style.height = '20px';

                var monsterImage = document.createElement('div');
                monsterImage.classList.add('monster-image');
                monsterImage.style.backgroundImage = 'url(<?php echo $mostro['figura']; ?>)';

                monsterContainer.appendChild(monsterNameDiv);
                monsterContainer.appendChild(monsterHealthBar);
                monsterContainer.appendChild(monsterImage);

                initializeActionBox(response);
            }

            function initializeActionBox(response) {
                renderDefaultActions(response);

                document.querySelector('.action-box').addEventListener('click', function(event) {
                    if (event.target.tagName === 'BUTTON') {
                        var action = event.target.textContent;

                        if (action === 'Attacca') {
                            showAttackOptions(response);
                        } else if (action === 'Difendi') {
                            executeDefense(response);
                        } else if (action === 'Passa turno') {
                            passTurn(response);
                        }
                    }
                });

                document.querySelectorAll('.personaggio').forEach(function(personaggioDiv) {
                    personaggioDiv.addEventListener('click', function() {
                        var targetClass = this.classList[1];
                        if (currentAction === 'cura') {
                            executeHealing(targetClass, response);
                        }
                    });
                });
            }

            function showAttackOptions(response) {
                currentAction = 'attacco';
                var actionBox = document.querySelector('.action-box');
                actionBox.innerHTML = '';

                var backButton = document.createElement('backbutton');
                backButton.textContent = 'Indietro';
                backButton.onclick = function() {
                    renderDefaultActions(response);
                };

                var currentClass = personaggiSelezionati[currentIndex];
                var currentClassLevel = response[currentClass].livello;

                if (response[currentClass].vitaAttuale > 0) {
                    var moves = <?php echo json_encode($mosse); ?>;
                    if (moves[currentClass]) {
                        moves[currentClass].forEach(function(mossa) {
                            if (mossa.livello <= currentClassLevel) {
                                var moveButton = document.createElement('button');
                                moveButton.textContent = mossa.nome;
                                if (mossa.tipo === 'magico' || mossa.tipo === 'cura') {
                                    moveButton.textContent += ' (Costo: ' + (mossa.livello * 5) + ' mana)';
                                }
                                moveButton.onclick = function() {
                                    if (mossa.tipo === 'cura') {
                                        currentAction = 'cura';
                                        currentMossa = mossa;
                                        showHealingOptions(mossa, response);
                                    } else {
                                        executeMove(mossa, response);
                                    }
                                };
                                actionBox.appendChild(moveButton);
                            }
                        });
                    }
                }

                actionBox.appendChild(backButton);
            }

            function showHealingOptions(mossa, response) {
                var actionBox = document.querySelector('.action-box');
                actionBox.innerHTML = 'Seleziona il personaggio da curare';

                var backButton = document.createElement('button');
                backButton.textContent = 'Indietro';
                backButton.onclick = function() {
                    renderDefaultActions(response);
                };

                actionBox.appendChild(backButton);

                document.querySelectorAll('.personaggio').forEach(function(personaggioDiv) {
                    personaggioDiv.style.cursor = 'pointer';
                });
            }

            function renderDefaultActions(response) {
                currentAction = '';
                var actionBox = document.querySelector('.action-box');
                actionBox.innerHTML = '';

                var currentClass = personaggiSelezionati[currentIndex];

                if (response[currentClass].vitaAttuale > 0) {
                    var actionTitle = document.createElement('div');
                    actionTitle.classList.add('action-title');
                    actionTitle.textContent = ucfirst(currentClass);

                    var attackButton = document.createElement('button');
                    attackButton.textContent = 'Attacca';

                    var defendButton = document.createElement('button');
                    defendButton.textContent = 'Difendi';

                    var passTurnButton = document.createElement('button');
                    passTurnButton.textContent = 'Passa turno';

                    actionBox.appendChild(actionTitle);
                    actionBox.appendChild(attackButton);
                    actionBox.appendChild(defendButton);
                    actionBox.appendChild(passTurnButton);
                } else {
                    passTurn(response);
                }

                document.querySelectorAll('.personaggio').forEach(function(personaggioDiv) {
                    personaggioDiv.style.cursor = 'default';
                });
            }

            function executeMove(mossa, response) {
                var currentClass = personaggiSelezionati[currentIndex];
                var currentCharacter = response[currentClass];

                if (currentCharacter.vitaAttuale <= 0) {
                    passTurn(response);
                    return;
                }

                var danno = mossa.danno;

                if (Math.random() < 0.05) {
                    danno = Math.ceil(danno * 1.5);
                    showCriticoAnimation('monster');
                }

                if (mossa.tipo === 'magico' || mossa.tipo === 'cura') {
                    var manaCost = mossa.livello * 5;

                    if (currentCharacter.manaAttuale >= manaCost) {
                        currentCharacter.manaAttuale -= manaCost;
                        updateStatBar(currentClass, 'mana', currentCharacter.manaAttuale, currentCharacter.mana, 'Mana');

                        if (mossa.tipo === 'cura') {
                            currentAction = 'cura';
                            currentMossa = mossa;
                            showHealingOptions(mossa, response);
                        } else {
                            mostro.vita = Math.max(0, mostro.vita - danno - currentCharacter.intelligenza);
                            totalDamageInflicted += (danno + currentCharacter.intelligenza);
                            updateStatBar('monster', 'monster-health', mostro.vita, mostro.vitaMax, 'Vita');
                            applyDamageAnimation('monster');
                            checkMostroVita(response);
                            passTurn(response);
                        }
                    } else {
                        alert('Mana insufficiente');
                    }
                } else {
                    mostro.vita = Math.max(0, mostro.vita - danno - currentCharacter.forza);
                    totalDamageInflicted += (danno + currentCharacter.forza);
                    updateStatBar('monster', 'monster-health', mostro.vita, mostro.vitaMax, 'Vita');
                    applyDamageAnimation('monster');
                    checkMostroVita(response);
                    passTurn(response);
                }
                numberOfAttacksUsed++;
            }

            function executeHealing(targetClass, response) {
                var currentClass = personaggiSelezionati[currentIndex];
                var currentCharacter = response[currentClass];
                var targetCharacter = response[targetClass];

                if (currentCharacter.vitaAttuale <= 0) {
                    passTurn(response);
                    return;
                }

                if (targetCharacter.vitaAttuale <= 0) {
                    alert('Il personaggio è morto e non può essere curato');
                    return;
                }

                currentCharacter.manaAttuale -= currentMossa.livello * 5;

                if (targetCharacter.vitaAttuale < targetCharacter.vita) {
                    var healing = Math.min(targetCharacter.vita - targetCharacter.vitaAttuale, -currentMossa.danno + currentCharacter.intelligenza);
                    targetCharacter.vitaAttuale += healing;
                    updateStatBar(targetClass, 'health', targetCharacter.vitaAttuale, targetCharacter.vita, 'Vita');
                    updateStatBar(currentClass, 'mana', currentCharacter.manaAttuale, currentCharacter.mana, 'Mana');
                    passTurn(response);
                } else {
                    alert('Il personaggio è già al massimo della vita');
                }
                numberOfAttacksUsed++;
            }

            function executeDefense(response) {
                var currentClass = personaggiSelezionati[currentIndex];
                var currentCharacter = response[currentClass];

                if (currentCharacter.vitaAttuale <= 0) {
                    passTurn(response);
                    return;
                }

                var vitaRecuperata = Math.floor(currentCharacter.vita * 0.05);
                var manaRecuperato = Math.floor(currentCharacter.mana * 0.10);

                currentCharacter.vitaAttuale = Math.min(currentCharacter.vita, currentCharacter.vitaAttuale + vitaRecuperata);
                currentCharacter.manaAttuale = Math.min(currentCharacter.mana, currentCharacter.manaAttuale + manaRecuperato);

                updateStatBar(currentClass, 'health', currentCharacter.vitaAttuale, currentCharacter.vita, 'Vita');
                updateStatBar(currentClass, 'mana', currentCharacter.manaAttuale, currentCharacter.mana, 'Mana');
                
                passTurn(response);
            }

            function passTurn(response) {
                currentIndex = (currentIndex + 1) % personaggiSelezionati.length;
                if (currentIndex === 0) {
                    setTimeout(function() {
                        monsterAttack(response);
                    }, 500);
                } else if (response[personaggiSelezionati[currentIndex]].vitaAttuale <= 0) {
                    passTurn(response);
                } else {
                    renderDefaultActions(response);
                }
            }

            function monsterAttack(response) {
                if (mostro.vita <= 0) {
                    return;
                }

                var aliveCharacters = personaggiSelezionati.filter(function(personaggio) {
                    return response[personaggio].vitaAttuale > 0;
                });

                if (aliveCharacters.length === 0) {
                    showGameOver();
                    return;
                }

                var attacco1 = mostro.attacco1;
                var attacco2 = mostro.attacco2;
                var attacchi = [attacco1, attacco2];
                var attaccoCasuale = attacchi[Math.floor(Math.random() * attacchi.length)];
                var targetClass = aliveCharacters[Math.floor(Math.random() * aliveCharacters.length)];
                var targetCharacter = response[targetClass];
                var dannoEffettivo = attaccoCasuale;

                if (Math.random() < 0.05) {
                    dannoEffettivo = Math.ceil(dannoEffettivo * 1.5);
                    showCriticoAnimation(targetClass);
                }

                dannoEffettivo = Math.max(0, dannoEffettivo - targetCharacter.resistenza);
                targetCharacter.vitaAttuale -= dannoEffettivo;
                totalDamageTaken += dannoEffettivo;

                if (targetCharacter.vitaAttuale < 0) {
                    targetCharacter.vitaAttuale = 0;
                }

                if (targetCharacter.vitaAttuale === 0) {
                    numberOfCharactersDead++;
                }

                updateStatBar(targetClass, 'health', targetCharacter.vitaAttuale, targetCharacter.vita, 'Vita');
                applyDamageAnimation(targetClass);

                if (aliveCharacters.length === 1 && targetCharacter.vitaAttuale === 0) {
                    showGameOver();
                } else {
                    currentIndex = 0;
                    renderDefaultActions(response);
                }
            }

            function updateStatBar(character, type, currentValue, maxValue, label) {
                var barContainer;
                if (character === 'monster') {
                    barContainer = document.querySelector('.monster-health .fill');
                } else {
                    var characterDiv = document.querySelector('.' + character);
                    barContainer = characterDiv.querySelector('.' + type + ' .fill');
                }
                if (barContainer) {
                    barContainer.style.width = (currentValue / maxValue * 100) + '%';
                    var labelElement = barContainer.parentElement.querySelector('.stat-label');
                    if (labelElement) {
                        if (type === 'experience' && currentValue === 2000) {
                            labelElement.textContent = 'Exp: MAX';
                        } else {
                            labelElement.textContent = label + ': ' + currentValue + '/' + maxValue;
                        }
                    }
                }
            }

            function applyDamageAnimation(character) {
                var characterDiv;
                if (character === 'monster') {
                    characterDiv = document.querySelector('.monster-container');
                } else {
                    characterDiv = document.querySelector('.' + character);
                }
                if (characterDiv) {
                    characterDiv.classList.add('flicker');
                    setTimeout(function() {
                        characterDiv.classList.remove('flicker');
                    }, 2000);
                }
            }

            function showCriticoAnimation(character) {
                var characterDiv;
                if (character === 'monster') {
                    characterDiv = document.querySelector('.monster-container .monster-image');
                }
                if (characterDiv) {
                    var criticoText = document.createElement('div');
                    criticoText.classList.add('critico');
                    criticoText.textContent = 'Critico!';
                    criticoText.style.top = Math.random() * 50 + 'px';
                    criticoText.style.left = Math.random() * 100 + 'px';
                    characterDiv.appendChild(criticoText);
                    setTimeout(function() {
                        criticoText.remove();
                    }, 1000);
                }
            }

            function createStatBar(type, currentValue, maxValue, label) {
                var barContainer = document.createElement('div');
                barContainer.classList.add('stat-bar', type);

                var sampleBar = document.createElement('div');
                sampleBar.classList.add('sample');
                sampleBar.style.width = '100%';

                var fillBar = document.createElement('div');
                fillBar.classList.add('fill');
                fillBar.style.width = (currentValue / maxValue * 100) + '%';

                var labelElement = document.createElement('span');
                labelElement.classList.add('stat-label');
                if (type === 'experience' && currentValue === 2000) {
                    labelElement.textContent = 'Exp: MAX';
                } else {
                    labelElement.textContent = label + ': ' + currentValue + '/' + maxValue;
                }

                barContainer.appendChild(sampleBar);
                barContainer.appendChild(fillBar);
                barContainer.appendChild(labelElement);

                return barContainer;
            }

            function createMaxExpBar(type) {
                var barContainer = document.createElement('div');
                barContainer.classList.add('stat-bar', type);

                var sampleBar = document.createElement('div');
                sampleBar.classList.add('sample');
                sampleBar.style.width = '100%';

                var fillBar = document.createElement('div');
                fillBar.classList.add('fill');
                fillBar.style.width = '100%';

                var labelElement = document.createElement('span');
                labelElement.classList.add('stat-label');
                labelElement.textContent = 'Exp: MAX';

                barContainer.appendChild(sampleBar);
                barContainer.appendChild(fillBar);
                barContainer.appendChild(labelElement);

                return barContainer;
            }

            function ucfirst(string) {
                return string.charAt(0).toUpperCase() + string.slice(1);
            }

            function checkMostroVita(response) {
                if (mostro.vita <= 0) {
                    updateCharacterExperience(response);
                    showVictory(response);
                }
            }

            function updateCharacterExperience(response) {
                personaggiSelezionati.forEach(function(personaggio) {
                    var expGain = mostro.esperienza;
                    var currentCharacter = response[personaggio];
                    var nuovoLivello = currentCharacter.livello;
                    var nuovaEsperienza = currentCharacter.esperienza + expGain;

                    while (nuovoLivello < 5 && nuovaEsperienza >= 2000) {
                        nuovaEsperienza -= 2000;
                        nuovoLivello++;
                    }

                    if (nuovoLivello >= 5) {
                        nuovaEsperienza = 2000;
                    }

                    currentCharacter.livello = nuovoLivello;
                    currentCharacter.esperienza = nuovaEsperienza;
                    updateStorageValues(personaggio, nuovoLivello, nuovaEsperienza);
                    if (nuovoLivello >= 5) {
                        updateStatBar(personaggio, 'experience', 2000, 2000, 'Exp: MAX');
                    } else {
                        updateStatBar(personaggio, 'experience', nuovaEsperienza, 2000, 'Exp');
                    }
                });
                renderGame(response);
            }

            function updateStorageValues(personaggio, livello, esperienza) {
                var userData = JSON.parse(localStorage.getItem(username)) || {};
                userData.classes = userData.classes || {};
                userData.classes[personaggio] = userData.classes[personaggio] || {};
                userData.classes[personaggio].livello = livello;
                userData.classes[personaggio].esperienza = esperienza;
                localStorage.setItem(username, JSON.stringify(userData));
            }

            function calculateScore(isVictory) {
                var punteggio = (totalDamageInflicted - totalDamageTaken) * (100 - numberOfAttacksUsed);
                punteggio += (isVictory ? 1000 : 0) / personaggiSelezionati.length;
                punteggio += mostro.esperienza;
                punteggio -= 150 * numberOfCharactersDead;
                return punteggio;
            }

            function updateStorage(punteggio, danniInflitti, danniSubiti, esperienzaGuadagnata) {
                var userData = localStorage.getItem("<?php echo $username; ?>");
                if (userData) {
                    userData = JSON.parse(userData);
                        
                    if (!userData.stats) {
                        userData.stats = {};
                    }

                    if (punteggio > userData.stats.punteggioMassimo) {
                        userData.stats.punteggioMassimo = punteggio;
                    }
                        
                    userData.stats.danniInflitti = (userData.stats.danniInflitti || 0) + danniInflitti;
                    userData.stats.danniSubiti = (userData.stats.danniSubiti || 0) + danniSubiti;
                    userData.stats.esperienzaTotale = (userData.stats.esperienzaTotale || 0) + parseInt(esperienzaGuadagnata);
                    userData.stats.partiteGiocate = (userData.stats.partiteGiocate || 0) + 1;

                    localStorage.setItem("<?php echo $username; ?>", JSON.stringify(userData));
                }
            }

            function showVictory(response) {
                var punteggio = calculateScore(true);
                var danniInflitti = totalDamageInflicted;
                var danniSubiti = totalDamageTaken;
                var esperienzaGuadagnata = mostro.esperienza * personaggiSelezionati.length;

                updateStorage(punteggio, danniInflitti, danniSubiti, esperienzaGuadagnata);

                var userData = localStorage.getItem("<?php echo $username; ?>");

                if (userData) {
                    userData = JSON.parse(userData);
                    userData.stats.vittorieTotali++;
                    localStorage.setItem("<?php echo $username; ?>", JSON.stringify(userData));
                }

                document.getElementById('end-punteggio').textContent = 'Punteggio: ' + punteggio;
                document.getElementById('end-danni-inflitti').textContent = 'Danni Inflitti: ' + danniInflitti;
                document.getElementById('end-danni-subiti').textContent = 'Danni Subiti: ' + danniSubiti;
                document.getElementById('end-esperienza').textContent = 'Esperienza Guadagnata: ' + esperienzaGuadagnata/personaggiSelezionati.length + " x " + personaggiSelezionati.length;

                document.querySelector('.popup-end h2').textContent = 'Hai vinto!';
                document.getElementById('popup-overlay-end').style.display = 'flex';

                renderGame(response);
            }

            function showGameOver() {
                var punteggio = calculateScore(false);
                var danniInflitti = totalDamageInflicted;
                var danniSubiti = totalDamageTaken;
                var esperienzaGuadagnata = 0;

                updateStorage(punteggio, danniInflitti, danniSubiti, esperienzaGuadagnata);

                document.getElementById('end-punteggio').textContent = 'Punteggio: ' + punteggio;
                document.getElementById('end-danni-inflitti').textContent = 'Danni Inflitti: ' + danniInflitti;
                document.getElementById('end-danni-subiti').textContent = 'Danni Subiti: ' + danniSubiti;
                document.getElementById('end-esperienza').textContent = 'Esperienza Guadagnata: ' + esperienzaGuadagnata;

                document.querySelector('.popup-end h2').textContent = 'Game Over';
                document.getElementById('popup-overlay-end').style.display = 'flex';
            }
        });

        function exitToMenu() {
            window.location.href = 'menu.php';
        }
        
    </script>
</head>
<body>
    <div class="game-container">
        <div class="monster-container"></div>
        <div class="container"></div>
        <div class="username"><?php echo $username; ?></div>
        <div class="popup-overlay-end" id="popup-overlay-end">
            <div class="popup-end">
                <h2>Partita Finita</h2>
                <p id="end-punteggio"></p>
                <p id="end-danni-inflitti"></p>
                <p id="end-danni-subiti"></p>
                <p id="end-esperienza"></p>
                <button onclick="exitToMenu()">Esci</button>
            </div>
        </div>
        <div class="action-box"></div>
    </div>
</body>
</html>
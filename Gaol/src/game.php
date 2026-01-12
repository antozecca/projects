<?php
require 'login.php';
require 'enemies.php';
require 'moves.php';

if (isset($_SESSION['user_id'])) {
    $username = $_SESSION['user_id'];
} else {
    echo "<script>window.location.href = 'index.html';</script>";
    exit;
}

$personaggi_selezionati = isset($_POST['personaggi']) ? json_decode($_POST['personaggi']) : [];

$partySize = isset($_POST['partySize']) ? (int)$_POST['partySize'] : (is_array($personaggi_selezionati) ? count($personaggi_selezionati) : 1);
$avgLevel  = isset($_POST['avgLevel']) ? (int)$_POST['avgLevel'] : 1;

$mostro = scegliNemicoCasuale($partySize, $avgLevel);
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

            var nextMonsterMove = null; // { name, baseDamage }
            var actionBoxListenerAdded = false;

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
                                        response[personaggio].isDead = response[personaggio].vitaAttuale <= 0;
                                        response[personaggio].isDefending = false;

                                        // ===== AGGRO/THREAT: danno totale inflitto dal personaggio =====
                                        response[personaggio].damageDealt = 0;
                                    }
                                });

                                numberOfCharactersDead = personaggiSelezionati.reduce(function(count, p) {
                                    return count + (response[p] && response[p].isDead ? 1 : 0);
                                }, 0);

                                renderGame(response);
                            } catch (e) {
                                console.error("Failed to parse response:", e);
                                console.error("Response text:", xhr.responseText);
                            }
                        } else {
                            console.error("Failed to fetch data. Status:", xhr.status);
                        }
                    }
                };
            } else {
                console.error("User data not found in localStorage");
            }

            function renderGame(response) {
                // Prepara intent se non esiste
                if (!nextMonsterMove) pickNextMonsterMove();

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
                        var manaBar   = createStatBar('mana', manaAttuale, response[personaggio].mana, 'Mana');

                        var expBar;
                        if (response[personaggio].livello === 5) {
                            expBar = createMaxExpBar('experience');
                        } else {
                            expBar = createStatBar('experience', response[personaggio].esperienza, expCap(response[personaggio].livello), 'Exp');
                        }

                        statBarContainer.appendChild(healthBar);
                        statBarContainer.appendChild(manaBar);
                        statBarContainer.appendChild(expBar);

                        infoBox.appendChild(nomeClasse);
                        infoBox.appendChild(statBarContainer);

                        var personaggioDiv = document.createElement('div');
                        personaggioDiv.classList.add('personaggio', personaggio);
                        personaggioDiv.id = 'pg-' + personaggio;
                        personaggioDiv.dataset.cls = personaggio;

                        if (response[personaggio].isDead) {
                            personaggioDiv.classList.add('dead');
                        }
                        if (response[personaggio].isDefending) {
                            personaggioDiv.classList.add('defending');
                        }

                        personaggioDiv.appendChild(infoBox);
                        container.appendChild(personaggioDiv);
                    }
                });

                // ===== MONSTER UI =====
                var monsterContainer = document.querySelector('.monster-container');
                monsterContainer.innerHTML = '';

                var monsterName = "<?php echo $mostro['nome']; ?>";
                var monsterHealthCurrent = mostro.vita;
                var monsterHealthMax = mostro.vitaMax;

                var monsterNameDiv = document.createElement('div');
                monsterNameDiv.classList.add('monster-name');
                monsterNameDiv.textContent = monsterName;

                // Intent (telegraph) — ORA in posizione corretta
                var monsterIntent = document.createElement('div');
                monsterIntent.classList.add('monster-intent');
                monsterIntent.textContent = 'Prossima mossa: ' + nextMonsterMove.name;

                var monsterHealthBar = createStatBar('monster-health', monsterHealthCurrent, monsterHealthMax, 'Vita');
                monsterHealthBar.style.width = '400px';
                monsterHealthBar.style.height = '20px';

                var monsterImage = document.createElement('div');
                monsterImage.classList.add('monster-image');
                monsterImage.style.backgroundImage = 'url(<?php echo $mostro['figura']; ?>)';

                monsterContainer.appendChild(monsterNameDiv);
                monsterContainer.appendChild(monsterIntent);
                monsterContainer.appendChild(monsterHealthBar);
                monsterContainer.appendChild(monsterImage);

                initializeActionBox(response);
            }

            function initializeActionBox(response) {
                renderDefaultActions(response);

                // Evita listener duplicati sulla action-box (renderGame viene richiamata spesso)
                if (!actionBoxListenerAdded) {
                    actionBoxListenerAdded = true;

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
                }

                // Click sui personaggi (elementi ricreati ad ogni render -> ok riattaccare qui)
                document.querySelectorAll('.personaggio').forEach(function(personaggioDiv) {
                    personaggioDiv.addEventListener('click', function() {
                        var targetClass = this.dataset.cls;
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

                if (!response[currentClass].isDead) {

                    // ===== ATTACCO BASE sempre disponibile =====
                    var basicBtn = document.createElement('button');
                    var p = response[currentClass];
                    var base = 14 + (p.livello - 1) * 3;
                    var bonus = (p.forza || 0) * 0.25 + (p.intelligenza || 0) * 0.1;
                    var dmgPreview = Math.max(8, Math.round(base + bonus));
                    basicBtn.textContent = 'Attacco Base (Danno: ' + dmgPreview + ')';
                    basicBtn.onclick = function() {
                        var p = response[currentClass];
                        var base = 14 + (p.livello - 1) * 3;
                        var bonus = (p.forza || 0) * 0.25 + (p.intelligenza || 0) * 0.1;
                        var dmg = Math.max(8, Math.round(base + bonus));

                        var fakeMove = { nome: 'Attacco Base', tipo: 'fisico', danno: dmg, livello: 1 };
                        executeMove(fakeMove, response);
                    };
                    actionBox.appendChild(basicBtn);

                    var moves = <?php echo json_encode($mosse); ?>;
                    if (moves[currentClass]) {
                        moves[currentClass].forEach(function(mossa) {
                            if (mossa.livello <= currentClassLevel) {
                                var moveButton = document.createElement('button');
                                var manaCost = getManaCost(mossa);
                                var baseValue = Math.abs(mossa.danno);
                                var statLabel = (mossa.tipo === 'magico' || mossa.tipo === 'cura') ? '+INT' : '+FOR';
                                var labelType = (mossa.tipo === 'cura') ? 'Cura' : 'Danno';
                                moveButton.textContent = mossa.nome + ' (' + labelType + ': ' + baseValue + statLabel + ')';
                                if (mossa.tipo === 'magico' || mossa.tipo === 'cura') {
                                    moveButton.textContent += ' | Mana: ' + manaCost;
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
                    var cls = personaggioDiv.dataset.cls;
                    personaggioDiv.style.cursor = (response[cls] && !response[cls].isDead) ? 'pointer' : 'default';
                });
            }

            function renderDefaultActions(response) {
                currentAction = '';
                var actionBox = document.querySelector('.action-box');
                actionBox.innerHTML = '';

                var currentClass = personaggiSelezionati[currentIndex];

                document.querySelectorAll('.personaggio').forEach(function(personaggioDiv) {
                    personaggioDiv.classList.remove('active-turn');
                });

                if (personaggiSelezionati.length > 1) {
                    var activeDiv = document.getElementById('pg-' + currentClass);
                    if (activeDiv) activeDiv.classList.add('active-turn');
                }

                if (!response[currentClass].isDead) {
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

                if (currentCharacter.isDead) {
                    passTurn(response);
                    return;
                }

                var danno = mossa.danno;

                // Critico giocatore: meno RNG, impatto più contenuto
                if (Math.random() < 0.03) {
                    danno = Math.ceil(danno * 1.25);
                    showCriticoAnimation('monster');
                }


                if (mossa.tipo === 'magico' || mossa.tipo === 'cura') {
                    var manaCost = getManaCost(mossa);

                    if (currentCharacter.manaAttuale >= manaCost) {
                        if (mossa.tipo === 'cura') {
                            currentAction = 'cura';
                            currentMossa = mossa;
                            showHealingOptions(mossa, response);
                        } else {
                            currentCharacter.manaAttuale -= manaCost;
                            updateStatBar(currentClass, 'mana', currentCharacter.manaAttuale, currentCharacter.mana, 'Mana');
                            var dealt = (danno + currentCharacter.intelligenza);
                            mostro.vita = Math.max(0, mostro.vita - dealt);

                            totalDamageInflicted += dealt;

                            // ===== AGGRO: accumula danno fatto dal personaggio =====
                            currentCharacter.damageDealt = (currentCharacter.damageDealt || 0) + dealt;

                            updateStatBar('monster', 'monster-health', mostro.vita, mostro.vitaMax, 'Vita');
                            applyDamageAnimation('monster');
                            checkMostroVita(response);
                            passTurn(response);
                        }
                    } else {
                        alert('Mana insufficiente');
                    }
                } else {
                    var dealt2 = (danno + currentCharacter.forza);
                    mostro.vita = Math.max(0, mostro.vita - dealt2);

                    totalDamageInflicted += dealt2;

                    // ===== AGGRO =====
                    currentCharacter.damageDealt = (currentCharacter.damageDealt || 0) + dealt2;

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

                if (currentCharacter.isDead) {
                    passTurn(response);
                    return;
                }

                if (targetCharacter.isDead) {
                    alert('Il personaggio è morto e non può essere curato');
                    return;
                }

                var manaCost = getManaCost(currentMossa);
                if (currentCharacter.manaAttuale < manaCost) {
                    alert('Mana insufficiente');
                    return;
                }
                currentCharacter.manaAttuale -= manaCost;

                if (targetCharacter.vitaAttuale < targetCharacter.vita) {
                    var healing = Math.min(
                        targetCharacter.vita - targetCharacter.vitaAttuale,
                        -currentMossa.danno + currentCharacter.intelligenza
                    );

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

                if (currentCharacter.isDead) {
                    passTurn(response);
                    return;
                }

                // Difesa vera: riduce il prossimo danno subito
                currentCharacter.isDefending = true;
                var defDiv = document.getElementById('pg-' + currentClass);
                if (defDiv) defDiv.classList.add('defending');

                // Piccola rigenerazione controllata
                var missingMana = Math.max(0, currentCharacter.mana - currentCharacter.manaAttuale);
                var missingHp = Math.max(0, currentCharacter.vita - currentCharacter.vitaAttuale);
                var manaRecuperato = Math.floor(missingMana * 0.2);
                var vitaRecuperata = Math.floor(missingHp * 0.08);

                currentCharacter.manaAttuale = Math.min(currentCharacter.mana, currentCharacter.manaAttuale + manaRecuperato);
                currentCharacter.vitaAttuale = Math.min(currentCharacter.vita, currentCharacter.vitaAttuale + vitaRecuperata);

                updateStatBar(currentClass, 'mana', currentCharacter.manaAttuale, currentCharacter.mana, 'Mana');
                updateStatBar(currentClass, 'health', currentCharacter.vitaAttuale, currentCharacter.vita, 'Vita');

                passTurn(response);
            }


            function passTurn(response) {
                if (personaggiSelezionati.every(function(p) { return response[p].isDead; })) {
                    showGameOver();
                    return;
                }

                currentIndex = (currentIndex + 1) % personaggiSelezionati.length;

                if (currentIndex === 0) {
                    setTimeout(function() {
                        monsterAttack(response);
                    }, 500);
                    return;
                }

                var tries = 0;
                while (tries < personaggiSelezionati.length && response[personaggiSelezionati[currentIndex]].isDead) {
                    currentIndex = (currentIndex + 1) % personaggiSelezionati.length;
                    tries++;
                    if (currentIndex === 0) {
                        setTimeout(function() {
                            monsterAttack(response);
                        }, 500);
                        return;
                    }
                }

                renderDefaultActions(response);
            }

            function monsterAttack(response) {
                if (mostro.vita <= 0) return;

                var intentEl = document.querySelector('.monster-intent');
                if (intentEl) {
                    intentEl.classList.remove('intent-flash');
                    void intentEl.offsetWidth;
                    intentEl.classList.add('intent-flash');
                }

                var aliveCharacters = personaggiSelezionati.filter(function(personaggio) {
                    return !response[personaggio].isDead;
                });

                if (aliveCharacters.length === 0) {
                    showGameOver();
                    return;
                }

                // ===== Target AGGRO: colpisce chi ha fatto più danni =====
                var targetClass = aliveCharacters[0];
                aliveCharacters.forEach(function(cls) {
                    var a = response[cls].damageDealt || 0;
                    var b = response[targetClass].damageDealt || 0;
                    if (a > b) targetClass = cls;
                });

                // 10% variazione per non essere totalmente scriptato
                if (aliveCharacters.length > 1 && Math.random() < 0.10) {
                    targetClass = aliveCharacters[Math.floor(Math.random() * aliveCharacters.length)];
                }


                var targetCharacter = response[targetClass];

                // usa la mossa annunciata
                if (!nextMonsterMove) pickNextMonsterMove();
                var dannoEffettivo = nextMonsterMove.baseDamage;

                // Critico mostro: più raro e meno swing
                if (Math.random() < 0.02) {
                    dannoEffettivo = Math.ceil(dannoEffettivo * 1.25);
                    showCriticoAnimation(targetClass);
                }


                dannoEffettivo = Math.max(0, dannoEffettivo - targetCharacter.resistenza);

                if (targetCharacter.isDefending) {
                    dannoEffettivo = Math.floor(dannoEffettivo * 0.5);
                    targetCharacter.isDefending = false;
                    var targetDiv = document.getElementById('pg-' + targetClass);
                    if (targetDiv) targetDiv.classList.remove('defending');
                }

                targetCharacter.vitaAttuale -= dannoEffettivo;
                totalDamageTaken += dannoEffettivo;

                if (targetCharacter.vitaAttuale < 0) targetCharacter.vitaAttuale = 0;

                markIfDead(targetClass, response);

                updateStatBar(targetClass, 'health', targetCharacter.vitaAttuale, targetCharacter.vita, 'Vita');
                applyDamageAnimation(targetClass);

                // prepara la prossima mossa del mostro (telegraph)
                pickNextMonsterMove();

                currentIndex = 0;
                renderDefaultActions(response);
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
                        if (type === 'experience' && maxValue === 2000 && currentValue === 2000) {
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

            function markIfDead(personaggio, response) {
                var p = response[personaggio];
                if (!p.isDead && p.vitaAttuale <= 0) {
                    p.isDead = true;
                    numberOfCharactersDead++;

                    var div = document.getElementById('pg-' + personaggio);
                    if (div) div.classList.add('dead');

                    if (personaggiSelezionati.every(function(item) { return response[item].isDead; })) {
                        showGameOver();
                    }
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
                if (type === 'experience' && maxValue === 2000 && currentValue === 2000) {
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

            function expCap(level) {
                var caps = {1: 300, 2: 700, 3: 1200, 4: 1800, 5: 2000};
                return caps[level] || 300;
            }

            function getManaCost(mossa) {
                var baseCost = mossa.livello * 7;
                if (mossa.tipo === 'cura') return baseCost + 2;
                return baseCost;
            }

            function pickNextMonsterMove() {
                // 70% attacco1, 30% attacco2
                var useAtk2 = Math.random() < 0.30;
                var base = useAtk2 ? mostro.attacco2 : mostro.attacco1;
                nextMonsterMove = {
                    name: useAtk2 ? 'Attacco Pesante' : 'Attacco Leggero',
                    baseDamage: base
                };
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

                    while (nuovoLivello < 5) {
                        var cap = expCap(nuovoLivello);
                        if (nuovaEsperienza >= cap) {
                            nuovaEsperienza -= cap;
                            nuovoLivello++;
                        } else {
                            break;
                        }
                    }

                    if (nuovoLivello >= 5) {
                        nuovaEsperienza = 2000;
                    }

                    currentCharacter.livello = nuovoLivello;
                    currentCharacter.esperienza = nuovaEsperienza;
                    updateStorageValues(personaggio, nuovoLivello, nuovaEsperienza);

                    if (nuovoLivello >= 5) {
                        updateStatBar(personaggio, 'experience', 2000, 2000, 'Exp');
                    } else {
                        updateStatBar(personaggio, 'experience', nuovaEsperienza, expCap(nuovoLivello), 'Exp');
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
                document.getElementById('end-esperienza').textContent = 'Esperienza Guadagnata: ' + (esperienzaGuadagnata/personaggiSelezionati.length) + " x " + personaggiSelezionati.length;

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
        <button class="exit-button" onclick="exitToMenu()">Esci</button>

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

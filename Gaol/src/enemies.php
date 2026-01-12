<?php

/**
 * ENEMIES (bilanciati)
 * - I mostri hanno range di attacco (min/max) e HP base.
 * - La funzione scegliNemicoCasuale(partySize, avgLevel):
 *   1) sceglie un tier in base a party + livello medio
 *   2) rolla attacco1/attacco2 dai range
 *   3) applica scaling coerente: a livello basso il danno è ridotto
 */

// ========== DEFINIZIONE MOSTRI (BASE) ==========

$goblin = array(
    'nome' => 'Kilio, leader della tribù',
    'vita' => 950,
    'attacco1_min' => 35, 'attacco1_max' => 50,
    'attacco2_min' => 50, 'attacco2_max' => 65,
    'esperienza_min' => 250, 'esperienza_max' => 300,
    'figura' => './immagini/mostri/goblin.png'
);

$macchina = array(
    'nome' => "Ex_MACHINA, l'errore",
    'vita' => 1650,
    'attacco1_min' => 55, 'attacco1_max' => 75,
    'attacco2_min' => 40, 'attacco2_max' => 60,
    'esperienza_min' => 300, 'esperienza_max' => 350,
    'figura' => './immagini/mostri/macchina.png'
);

$oro = array(
    'nome' => 'Phi, custode della prigione',
    'vita' => 2900,
    'attacco1_min' => 70, 'attacco1_max' => 95,
    'attacco2_min' => 110, 'attacco2_max' => 160,
    'esperienza_min' => 800, 'esperienza_max' => 1000,
    'figura' => './immagini/mostri/oro.png'
);

$sabbia = array(
    'nome' => 'Yul-thurrn, deserto vivente',
    'vita' => 1050,
    'attacco1_min' => 45, 'attacco1_max' => 60,
    'attacco2_min' => 40, 'attacco2_max' => 70,
    'esperienza_min' => 250, 'esperienza_max' => 300,
    'figura' => './immagini/mostri/sabbia.png'
);

$golem = array(
    'nome' => 'Udbrud, golem risvegliato',
    'vita' => 2350,
    'attacco1_min' => 55, 'attacco1_max' => 75,
    'attacco2_min' => 45, 'attacco2_max' => 65,
    'esperienza_min' => 350, 'esperienza_max' => 400,
    'figura' => './immagini/mostri/golem.png'
);

$occhio = array(
    'nome' => 'Oculus, anima solitaria',
    'vita' => 750,
    // ridotta varianza: niente più 1..200 (rompe il bilanciamento)
    'attacco1_min' => 30, 'attacco1_max' => 45,
    'attacco2_min' => 20, 'attacco2_max' => 60,
    'esperienza_min' => 100, 'esperienza_max' => 200,
    'figura' => './immagini/mostri/occhio.png'
);

$tiki = array(
    'nome' => 'Iitk, spirito del legno',
    'vita' => 1150,
    'attacco1_min' => 40, 'attacco1_max' => 60,
    'attacco2_min' => 50, 'attacco2_max' => 70,
    'esperienza_min' => 150, 'esperienza_max' => 250,
    'figura' => './immagini/mostri/tiki.png'
);

$ragno = array(
    'nome' => 'Nidia, regina dei ragni',
    'vita' => 550,
    'attacco1_min' => 25, 'attacco1_max' => 40,
    'attacco2_min' => 35, 'attacco2_max' => 55,
    'esperienza_min' => 50, 'esperienza_max' => 150,
    'figura' => './immagini/mostri/ragno.png'
);

// ========== HELPERS ==========

function clampInt($v, $min, $max) {
    $v = (int)$v;
    if ($v < $min) return $min;
    if ($v > $max) return $max;
    return $v;
}

function rollBetween($min, $max) {
    $min = (int)$min; $max = (int)$max;
    if ($max < $min) { $t = $min; $min = $max; $max = $t; }
    return rand($min, $max);
}

/**
 * Modificatore ATK per livello:
 * - livello 1 => ~0.60 (danni ridotti)
 * - livello 5 => ~1.00
 */
function levelAtkMultiplier($avgLevel) {
    $avgLevel = clampInt($avgLevel, 1, 5);
    return 0.5 + 0.1 * $avgLevel; // 1=>0.6, 5=>1.0
}

/**
 * Modificatore HP per livello (più lieve dell'ATK):
 * - livello 1 => 0.90
 * - livello 5 => 1.10
 */
function levelHpMultiplier($avgLevel) {
    $avgLevel = clampInt($avgLevel, 1, 5);
    return 0.85 + 0.05 * $avgLevel; // 1=>0.90, 5=>1.10
}

/**
 * Modificatori per party size:
 * - più personaggi => mostro un po' più tanky e con danno leggermente maggiore
 */
function partyAtkMultiplier($partySize) {
    $partySize = clampInt($partySize, 1, 4);
    return 1 + 0.05 * ($partySize - 1); // 1=>1.00, 4=>1.15
}

function partyHpMultiplier($partySize) {
    $partySize = clampInt($partySize, 1, 4);
    return 1 + 0.18 * ($partySize - 1); // 1=>1.00, 4=>1.54
}

/**
 * EXP scaling: leggero, per non rompere il grind
 * - livello 1 => ~0.83
 * - livello 5 => ~1.15
 */
function levelExpMultiplier($avgLevel) {
    $avgLevel = clampInt($avgLevel, 1, 5);
    return 0.75 + 0.08 * $avgLevel;
}

function partyExpMultiplier($partySize) {
    $partySize = clampInt($partySize, 1, 4);
    return 1 + 0.08 * ($partySize - 1); // 1=>1.00, 4=>1.24
}


// ========== FUNZIONE PRINCIPALE ==========

function scegliNemicoCasuale($partySize = 1, $avgLevel = 1) {
    global $goblin, $macchina, $golem, $oro, $sabbia, $occhio, $tiki, $ragno;

    $partySize = clampInt($partySize, 1, 4);
    $avgLevel  = clampInt($avgLevel, 1, 5);

    // Tier score: protegge lvl bassi anche con party grande
    // Range: 3..14
    $tierScore = ($avgLevel * 2) + $partySize;

    if ($tierScore <= 5) {
        // Beginner (lvl 1–2)
        $pool = array($ragno, $occhio);
    } elseif ($tierScore <= 8) {
        // Medio leggero
        $pool = array($tiki, $goblin, $sabbia);
    } elseif ($tierScore <= 11) {
        // Medio duro
        $pool = array($macchina, $golem, $goblin, $tiki);
    } else {
        // Late game (solo lvl 4–5 con party grande)
        $pool = array($oro, $golem, $macchina);
    }

    $nemico = $pool[array_rand($pool)];

    // Roll attacchi + exp dal range
    $nemico['attacco1'] = rollBetween($nemico['attacco1_min'], $nemico['attacco1_max']);
    $nemico['attacco2'] = rollBetween($nemico['attacco2_min'], $nemico['attacco2_max']);
    $nemico['esperienza'] = rollBetween($nemico['esperienza_min'], $nemico['esperienza_max']);

    // Scaling coerente
    $atkMult = levelAtkMultiplier($avgLevel) * partyAtkMultiplier($partySize);
    $hpMult  = levelHpMultiplier($avgLevel)  * partyHpMultiplier($partySize);
    $expMult = levelExpMultiplier($avgLevel) * partyExpMultiplier($partySize);

    $nemico['vita']     = (int) round($nemico['vita'] * $hpMult);
    $nemico['attacco1'] = (int) round($nemico['attacco1'] * $atkMult);
    $nemico['attacco2'] = (int) round($nemico['attacco2'] * $atkMult);
    $nemico['esperienza'] = (int) round($nemico['esperienza'] * $expMult);

    // Safety clamp
    $nemico['attacco1'] = max(5, $nemico['attacco1']);
    $nemico['attacco2'] = max(5, $nemico['attacco2']);
    $nemico['esperienza'] = max(10, $nemico['esperienza']);

    return $nemico;
}

?>
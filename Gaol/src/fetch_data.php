<?php
require 'login.php';

if (isset($_SESSION['user_id'])) {
    $username = $_SESSION['user_id'];
}

$base_stats = [
    "stregone" => ["vigore" => 12, "intelligenza" => 20, "forza" => 7, "resistenza" => 11],
    "cavaliere" => ["vigore" => 17, "intelligenza" => 0, "forza" => 17, "resistenza" => 16],
    "cacciatrice" => ["vigore" => 13, "intelligenza" => 11, "forza" => 14, "resistenza" => 12],
    "chierico" => ["vigore" => 17, "intelligenza" => 17, "forza" => 7, "resistenza" => 9]
];

function calculateStregoneStats($level, $base_stats) {
    $vigore = $base_stats['stregone']['vigore'] + ($level - 1) * 1;
    $intelligenza = $base_stats['stregone']['intelligenza'] + ($level - 1) * 2;
    $resistenza = $base_stats['stregone']['resistenza'] + ($level - 1) * 2;
    $vita = $vigore * 12;
    $mana = $intelligenza * 12;
    return ["vita" => $vita, "mana" => $mana, "intelligenza" => $intelligenza, "forza" => $base_stats['stregone']['forza'], "resistenza" => $resistenza];
}

function calculateCavaliereStats($level, $base_stats) {
    $vigore = $base_stats['cavaliere']['vigore'] + ($level - 1) * 2;
    $forza = $base_stats['cavaliere']['forza'] + ($level - 1) * 2;
    $resistenza = $base_stats['cavaliere']['resistenza'] + ($level - 1) * 1;
    $vita = $vigore * 12;
    $mana = 0;
    return ["vita" => $vita, "mana" => $mana, "intelligenza" => $base_stats['cavaliere']['intelligenza'], "forza" => $forza, "resistenza" => $resistenza];
}

function calculateCacciatriceStats($level, $base_stats) {
    $vigore = $base_stats['cacciatrice']['vigore'] + ($level - 1) * 1;
    $intelligenza = $base_stats['cacciatrice']['intelligenza'] + ($level - 1) * 1;
    $forza = $base_stats['cacciatrice']['forza'] + ($level - 1) * 2;
    $resistenza = $base_stats['cacciatrice']['resistenza'] + ($level - 1) * 1;
    $vita = $vigore * 12;
    $mana = $intelligenza * 12;
    return ["vita" => $vita, "mana" => $mana, "intelligenza" => $intelligenza, "forza" => $forza, "resistenza" => $resistenza];
}

function calculateChiericoStats($level, $base_stats) {
    $vigore = $base_stats['chierico']['vigore'] + ($level - 1) * 3;
    $intelligenza = $base_stats['chierico']['intelligenza'] + ($level - 1) * 2;
    $vita = $vigore * 12;
    $mana = $intelligenza * 12;
    return ["vita" => $vita, "mana" => $mana, "intelligenza" => $intelligenza, "forza" => $base_stats['chierico']['forza'], "resistenza" => $base_stats['chierico']['resistenza']];
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $input = file_get_contents('php://input');
    error_log("Received input: " . $input);

    $characterData = json_decode($input, true)['characterData'];
    error_log("Parsed character data: " . print_r($characterData, true));

    $response = [];
    foreach ($characterData as $personaggio => $data) {
        switch ($personaggio) {
            case 'stregone':
                $stats = calculateStregoneStats($data['livello'], $base_stats);
                break;
            case 'cavaliere':
                $stats = calculateCavaliereStats($data['livello'], $base_stats);
                break;
            case 'cacciatrice':
                $stats = calculateCacciatriceStats($data['livello'], $base_stats);
                break;
            case 'chierico':
                $stats = calculateChiericoStats($data['livello'], $base_stats);
                break;
        }
        $response[$personaggio] = [
            'livello' => $data['livello'],
            'esperienza' => $data['esperienza'],
            'intelligenza' => $stats['intelligenza'],
            'forza' => $stats['forza'],
            'resistenza' => $stats['resistenza'],
            'vita' => $stats['vita'],
            'mana' => $stats['mana']
        ];
    }
    echo json_encode($response);
}
?>

<?php

$goblin = array(
    'nome' => 'Kilio, leader della tribù',
    'vita' => 1000,
    'attacco1' => rand(45,65),
    'attacco2' => rand(65,80),
    'esperienza' => rand(250,300),
    'figura' => './immagini/mostri/goblin.png'
);

$macchina = array(
    'nome' => "Ex_MACHINA, l'errore",
    'vita' => 1750,
    'attacco1' => rand(75,95),
    'attacco2' => rand(55,70),
    'esperienza' => rand(300,350),
    'figura' => './immagini/mostri/macchina.png'
);

$oro = array(
    'nome' => 'Phi, custode della prigione',
    'vita' => 3000,
    'attacco1' => rand(70,120),
    'attacco2' => rand(120,220),
    'esperienza' => rand(800,1000),
    'figura' => './immagini/mostri/oro.png'
);

$sabbia = array(
    'nome' => 'Yul-thurrn, deserto vivente',
    'vita' => 1100,
    'attacco1' => rand(70,85),
    'attacco2' => rand(60,95),
    'esperienza' => rand(250,300),
    'figura' => './immagini/mostri/sabbia.png'
);

$golem = array(
    'nome' => 'Udbrud, golem risvegliato',
    'vita' => 2500,
    'attacco1' => rand(70,95),
    'attacco2' => rand(60,80),
    'esperienza' => rand(350,400),
    'figura' => './immagini/mostri/golem.png'
);

$occhio = array(
    'nome' => 'Oculus, anima solitaria',
    'vita' => 800,
    'attacco1' => rand(45,65),
    'attacco2' => rand(1,200),
    'esperienza' => rand(100,200),
    'figura' => './immagini/mostri/occhio.png'
);

$tiki = array(
    'nome' => 'Iitk, spirito del legno',
    'vita' => 1250,
    'attacco1' => rand(50,85),
    'attacco2' => rand(65,95),
    'esperienza' => rand(150,250),
    'figura' => './immagini/mostri/tiki.png'
);

$ragno = array(
    'nome' => 'Nidia, regina dei ragni',
    'vita' => 500,
    'attacco1' => rand(40,65),
    'attacco2' => rand(50,80),
    'esperienza' => rand(50,150),
    'figura' => './immagini/mostri/ragno.png'
);

function scegliNemicoCasuale() {
    global $goblin, $macchina, $golem, $oro, $sabbia, $occhio, $tiki, $ragno;
    $nemici = array($goblin, $macchina, $golem, $oro, $sabbia, $occhio, $tiki, $ragno);
    $nemicoCasuale = $nemici[array_rand($nemici)];
    return $nemicoCasuale;
}

?>




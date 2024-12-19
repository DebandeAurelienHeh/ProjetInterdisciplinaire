<?php

require_once('modelisation/Modele.php');
require_once('requetes/Requete.php');

$requeteHeader = new Requete();
$dataHeader = $requeteHeader->requeteSQLHeader();

?>

<header>
    <h1>Header A CHANGER</h1>
</header>
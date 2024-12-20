<?php
require_once('../modelisation/Modele.php');
require_once('../requetes/Requete.php');

$requetePauseHoraire = new Requete();


if ($_SERVER['REQUEST_METHOD'] === 'POST'){
    $changerCours = isset($_POST['changerCours']);
    $requetePauseHoraire->requeteSQLPauseHoraire($changerCours);
    header('Location: horairesIndex.php');
}
?>


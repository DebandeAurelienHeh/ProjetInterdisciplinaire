<?php
require_once('../modelisation/Modele.php');
require_once('../requetes/Requete.php');

$requeteSelectHoraire = new Requete();
$dataSelectHoraire = $requeteSelectHoraire->requeteSQLSelectHoraire();

?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel ="stylesheet" href="style.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <header>
        <?php
        require_once('../Gabarit/_header.php');
        ?>
    </header>
    <main>
        <a href="horairesModifier.php">Changer l'horaire</a>
        <a href="horairesAjouter.php">Ajouter un cours</a>
        <a href="horairesSupprimer.php">Mettre en pause un cours</a>

        <p>Horaires</p>
        <?php 
        foreach ($dataSelectHoraire as $horaire) {
            echo '<p>' . $horaire['horaire'] . ' - ' . $horaire['nom_cours'] . ' - local: ' . $horaire['numero_salle'] . ' - professeur: ' . $horaire['nom'] . '</p>';
        }

        ?>
    </main>
    <footer>
        <?php
        require_once('../Gabarit/_footer.php');
        ?>
    </footer>
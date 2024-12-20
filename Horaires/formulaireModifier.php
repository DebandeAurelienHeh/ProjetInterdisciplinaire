
<?php
require_once('../modelisation/Modele.php');
require_once('../requetes/Requete.php');

$requeteModifierHoraire = new Requete();


if ($_SERVER['REQUEST_METHOD'] === 'POST'){
    $heure = isset($_POST['choisirHeure']);
    $cours = isset($_POST['modifierCours']);
    $requeteModifierHoraire->requeteSQLModifierHoraire($cours, $heure);
    header('Location: horairesIndex.php');
}
?>




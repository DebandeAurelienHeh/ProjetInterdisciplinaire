<?php
require_once('../modelisation/Modele.php');
require_once('../requetes/Requete.php');

$requeteUpdateStatutSalle = new Requete();
$dataSelectStatutSalle = $requeteUpdateStatutSalle->requeteSQLSelectStatut();

?>

<header>
    <?php
    require_once('../Gabarit/_header.php');
    ?>
</header>
<main>
    <p>Mise à jour de l'incident réussie !</p>  
</main>
</main>
<footer>
    <?php
    require_once('../Gabarit/_footer.php');
    ?>
</footer>
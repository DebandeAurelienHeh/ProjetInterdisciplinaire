<?php

require_once('modelisation/Modele.php');
require_once('requetes/Requete.php');
$requete = new Requete();
$data = $requete->requeteSQLIndex();

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
        require_once('_header.php');
        ?>
    </header>
    <main>
        <nav>
            <ul>
                <li><a href="Horaires/horairesIndex.php">Horaires</a></li>
                <li><a href="Inscriptions/inscriptionsIndex.php">Inscriptions</a></li>
                <li><a href="Ressources/ressourcesIndex.php">Ressources</a></li>
            </ul>
        </nav>
    </main>
    <footer>
        <?php
        require_once('_footer.php');
        ?>
    </footer>
</html>
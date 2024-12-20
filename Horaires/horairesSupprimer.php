<?php
require_once('formulaireSupprimer.php');
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
        <form method="post" action="">
                <label for="changerCours">Entrez l'heure à changer (XX:XX:XX) :</label>
                <input type="text" id="changerCours" name="changerCours" pattern="^\d{2}:\d{2}:\d{2}$" required placeholder="HH:MM:SS">
                <button type="submit">Mise à jour du cours</button>
    </main>
    <footer>
        <?php
        require_once('../Gabarit/_footer.php');
        ?>
    </footer>
</html>
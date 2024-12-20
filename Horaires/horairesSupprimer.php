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
            <input type="text" id="changerCours" name="changerCours" required>
            <button type="submit">Envoyer</button>
    </main>
    <footer>
        <?php
        require_once('../Gabarit/_footer.php');
        ?>
    </footer>
</html>
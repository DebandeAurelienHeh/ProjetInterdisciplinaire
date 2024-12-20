<?php
require_once('formulaireModifier.php');
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
            <label for="choisirHeure">Entrez l'heure du cours à changer (XX:XX:XX) :</label>
            <input type="text" id="choisirHeure" name="choisirHeure" required>
            <label for="modifierCours">Entrez le nouveau cours :</label>
            <input type="text" id="modifierCours" name="modifierCours" required>
            <button type="submit">Mise à jour du cours</button>
    </main>
    <footer>
        <?php
        require_once('../Gabarit/_footer.php');
        ?>
    </footer>
</html>
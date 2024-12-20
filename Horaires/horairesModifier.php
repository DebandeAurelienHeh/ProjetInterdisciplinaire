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
            <label for="choisirHeure">Entrez l'heure du cours à changer :</label>
            <input type="text" id="choisirHeure" name="choisirHeure" 
                    pattern="^\d{2}:\d{2}:\d{2}$" required
                    placeholder="HH:MM:SS">
            <label for="modifierCours">Entrez le nouveau cours :</label>
            <input type="text" id="modifierCours" name="modifierCours" 
                pattern="^[A-Za-zÀ-ÖØ-öø-ÿ ]+$" required
                maxlength="100" 
                placeholder="Nom du cours"
                title="Le nom du cours ne doit contenir que des lettres (sans chiffres ni symboles).">
            <button type="submit">Mise à jour du cours</button>
    </main>
    <footer>
        <?php
        require_once('../Gabarit/_footer.php');
        ?>
    </footer>
</html>
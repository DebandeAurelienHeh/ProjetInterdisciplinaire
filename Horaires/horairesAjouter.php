<?php
require_once('formulaireAjouter.php');

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
    <form action="" method="POST">
        <h3>Professeur</h3>
        <label for="nom_prof">Nom :</label>
        <input type="text" id="nom_prof" name="nom_prof" required><br>
        
        <label for="prenom_prof">Prénom :</label>
        <input type="text" id="prenom_prof" name="prenom_prof" required><br>
        
        <label for="email_prof">Email :</label>
        <input type="email" id="email_prof" name="email_prof" required><br>
        
        <label for="mdp_prof">Mot de passe :</label>
        <input type="password" id="mdp_prof" name="mdp_prof" required><br>
        
        <label for="departement_prof">Département :</label>
        <input type="text" id="departement_prof" name="departement_prof" required><br>
        
        <h3>Salle</h3>
        <label for="numero_salle">Numéro de salle :</label>
        <input type="text" id="numero_salle" name="numero_salle" required><br>
        
        <h3>Cours</h3>
        <label for="nom_cours">Nom du cours :</label>
        <input type="text" id="nom_cours" name="nom_cours" required><br>
        
        <label for="description_cours">Description :</label>
        <textarea id="description_cours" name="description_cours" required></textarea><br>
        
        <h3>Planning</h3>
        <label for="horaire">Horaire (HH:MM:SS) :</label>
        <input type="text" id="horaire" name="horaire" required><br>
        
        <button type="submit">Ajouter</button>
    </form>
    </main>
    <footer>
        <?php
        require_once('../Gabarit/_footer.php');
        ?>
    </footer>
</html>
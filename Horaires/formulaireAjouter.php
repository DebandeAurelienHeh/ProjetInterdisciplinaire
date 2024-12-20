<?php

if ($_SERVER['REQUEST_METHOD'] === 'POST') { // Vérifiez que la méthode de la requête est POST
    $nom_prof = isset($_POST['nom_prof']) ? $_POST['nom_prof'] : '';
    htmlspecialchars(strip_tags($nom_prof));
    $prenom_prof = isset($_POST['prenom_prof']) ? $_POST['prenom_prof'] : '';
    htmlspecialchars(strip_tags($prenom_prof));
    $email_prof = isset($_POST['email_prof']) ? $_POST['email_prof'] : '';
    htmlspecialchars(strip_tags($email_prof));
    $mdp_prof = isset($_POST['mdp_prof']) ? $_POST['mdp_prof'] : '';
    htmlspecialchars(strip_tags(sha1($mdp_prof)));
    $departement_prof = isset($_POST['departement_prof']) ? $_POST['departement_prof'] : '';
    htmlspecialchars(strip_tags($departement_prof));
    $numero_salle = isset($_POST['numero_salle']) ? $_POST['numero_salle'] : '';
    htmlspecialchars(strip_tags(int($numero_salle)));

    $nom_cours = isset($_POST['nom_cours']) ? $_POST['nom_cours'] : '';
    htmlspecialchars(strip_tags($nom_cours));
    $description_cours = isset($_POST['description_cours']) ? $_POST['description_cours'] : '';
    htmlspecialchars(strip_tags($description_cours));

    $horaire = isset($_POST['horaire']) ? $_POST['horaire'] : '';
    htmlspecialchars(strip_tags($horaire));

    try {
        // Démarrer une transaction
        $bd = new PDO("mysql:host=localhost;dbname=ecole_vlan10", "root", "");
        $bd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $bd->beginTransaction();

        // 1. Insérer le professeur
        $stmt = $bd->prepare("INSERT INTO professeurs (nom, prenom, email, mdp, departement, statut) VALUES (?, ?, ?, ?, ?, 1)");
        $stmt->execute([$nom_prof, $prenom_prof, $email_prof, $mdp_prof, $departement_prof]);
        $id_professeur = $bd->lastInsertId();

        // 2. Insérer la salle
        $stmt = $bd->prepare("INSERT INTO salles_globales (numero_salle, statut, departement) VALUES (?, 1, ?)");
        $stmt->execute([$numero_salle, $departement_prof]);
        $id_salle = $bd->lastInsertId();

        // 3. Insérer le cours
        $stmt = $bd->prepare("INSERT INTO cours_global (nom_cours, description, id_professeur, id_salle) VALUES (?, ?, ?, ?)");
        $stmt->execute([$nom_cours, $description_cours, $id_professeur, $id_salle]);
        $id_cours = $bd->lastInsertId();

        // 4. Insérer le planning
        $stmt = $bd->prepare("INSERT INTO plannings_globaux (id_cours, departement, horaire) VALUES (?, ?, ?)");
        $stmt->execute([$id_cours, $departement_prof, $horaire]);

        // Valider la transaction
        $bd->commit();
        header('Location: horairesIndex.php');

        echo "Les données ont été insérées avec succès !";

    } catch (Exception $e) {
        // Annuler la transaction en cas d'erreur
        $bd->rollBack();
        echo "Erreur lors de l'insertion : " . $e->getMessage();
    }
}
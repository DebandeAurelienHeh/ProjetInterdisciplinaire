<?php

require_once '../modelisation/Modele.php';


class Requete extends Modele {

  // Renvoie la liste des data du blog
    public function requeteSQLIndex(){
        $sql = 'SELECT * FROM admins';
        $data = $this->executerRequete($sql);
        return $data;
}

    public function requeteSQLHeader(){
        $sqlHeader = 'SELECT * FROM admins';
        $dataHeader = $this->executerRequete($sqlHeader);
        return $dataHeader;
}

    public function requeteSQLAffichageIncidents(){
        $sqlAffichageIncidents = 'SELECT salles_globales.numero_salle, incidents_globaux.date_signalement, incidents_globaux.description_incident, incidents_globaux.statut FROM incidents_globaux JOIN salles_globales ON incidents_globaux.id_salle=salles_globales.id_salle ORDER BY salles_globales.numero_salle;';
        $dataAffichageSalles = $this->executerRequete($sqlAffichageIncidents);
        return $dataAffichageSalles;
}

    public function requeteSQLAffichageSalles(){
        $sqlAffichageSalles = 'SELECT cours_global.nom_cours, salles_globales.numero_salle, professeurs.nom FROM salles_globales JOIN cours_global ON salles_globales.id_salle=cours_global.id_salle JOIN professeurs ON cours_global.id_professeur=professeurs.id_professeur ORDER BY cours_global.nom_cours ASC;';
        $dataAffichageSalles = $this->executerRequete($sqlAffichageSalles);
        return $dataAffichageSalles;
}
    public function requeteSQLSelectStatut(){
        $sqlSelectStatut = 'UPDATE salles_globales JOIN incidents_globaux ON salles_globales.id_salle = incidents_globaux.id_salle 
                            SET salles_globales.statut = incidents_globaux.statut
                            WHERE salles_globales.statut != incidents_globaux.statut;';
        $dataSelectStatut = $this->executerRequete($sqlSelectStatut);
        return $dataSelectStatut;
}

}
/*
    public function requeteSQLPreparee(){
        $sqlPrepare = 'INSERT INTO etudiants (nom, prenom, email, classe) VALUES (:nom, :prenom, :email, :classe)' ;
        $dataPrepare = $this->executerRequete($sqlPrepare, array(
            ':nom' => $nom,
            ':prenom' => $prenom,
            ':email' => $email,
            ':classe' => $classe));
        return $dataPrepare;
}
*/
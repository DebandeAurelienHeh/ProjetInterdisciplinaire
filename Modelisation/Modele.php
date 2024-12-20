<?php

abstract class Modele {

  // Accès à la BD
    private $bd;

    // Exécute une requête SQL en regardant si elle est préparée ou non
    protected function executerRequete($sql, $params = null) {
        if ($params == null) {
            $resultat = $this->getBd()->query($sql);    // Directe
        }
        else {
            $resultat = $this->getBd()->prepare($sql);  // Préparée
            $resultat->execute($params);
        }
        return $resultat;
    }

    // Creation de la connexion à la BD
    private function getBd() {
        if ($this->bd == null) {
            // Création de la connexion
            $this->bd = new PDO('mysql:host=localhost;dbname=ecole_vlan10;charset=utf8', 'root', '', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
        }
        return $this->bd;
    }
}
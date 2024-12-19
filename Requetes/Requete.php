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

}
    /*
    public function requeteSQLPreparee(){
        $sqlPrepare = //SQL query ;
        $dataPrepare = $this->executerRequete($sqlPrepare, array(
            '' => $variable,
            '' => $variable2,
            '' => $variable3,
            '' => $variable4));
        return $dataPrepare;
    }
}

*/
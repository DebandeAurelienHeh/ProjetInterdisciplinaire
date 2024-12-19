<?php
require_once('../modelisation/Modele.php');
require_once('../requetes/Requete.php');
$requeteAffichageIncidents = new Requete();
$dataAffichageIncidents = $requeteAffichageIncidents->requeteSQLAffichageIncidents();

$requeteAffichageSalles = new Requete();
$dataAffichageSalles = $requeteAffichageSalles->requeteSQLAffichageSalles();
?>

<header>
    <?php
    require_once('../Gabarit/_header.php');
    ?>
</header>
<body>
    <?php
        while($row = $dataAffichageIncidents->fetch()){
            if($row['statut'] == 0){
                echo '<p> local: ' . $row['numero_salle'] . ', date: ' . $row['date_signalement'] . ', problème: ' . $row['description_incident'] . '</p>';
            }
        }

        while($row = $dataAffichageSalles->fetch()){
            echo '<p> ' . $row['nom_cours'] . ', local: ' . $row['numero_salle'] . ', professeur: ' . $row['nom'] . '</p>';
        }
    ?>
</body>
<footer>
    <?php
    require_once('../Gabarit/_footer.php');
    ?>
</footer>
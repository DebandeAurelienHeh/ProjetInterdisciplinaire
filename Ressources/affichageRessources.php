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
                echo '<div class="resource-item">';
                echo '<span class="resource-title">Local: ' . $row['numero_salle'] . '</span>';
                echo '<span class="resource-details">Date: ' . $row['date_signalement'] . '</span>';
                echo '<span class="resource-description">Problème: ' . $row['description_incident'] . '</span>';
                echo '</div>';
            }
        }

        while($row = $dataAffichageSalles->fetch()){
            echo '<div class="resource-item">';
            echo '<span class="resource-title">' . $row['nom_cours'] . '</span>';
            echo '<span class="resource-details">Local: ' . $row['numero_salle'] . '</span>';
            echo '<span class="resource-details">Professeur: ' . $row['nom'] . '</span>';
            echo '</div>';
        }
    ?>
</body>
<footer>
    <?php
    require_once('../Gabarit/_footer.php');
    ?>
</footer>
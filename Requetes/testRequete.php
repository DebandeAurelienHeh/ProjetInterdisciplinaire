<?php

function testRequireOnce() {
    try {
        require_once 'Requetes/Requete.php';
        echo "Requete.php included successfully.\n";
    } catch (Exception $e) {
        echo 'Exception thrown: ' . $e->getMessage() . "\n";
    }
}

testRequireOnce();
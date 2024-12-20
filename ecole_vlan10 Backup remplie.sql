-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 19, 2024 at 04:26 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecole_vlan10`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id_admin` int NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `nom` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `prenom` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mdp` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `departement` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `statut` tinyint(1) DEFAULT NULL,
  `id_planning_admin` int DEFAULT NULL,
  `id_inscriptions_locales` int DEFAULT NULL,
  `id_cours_local` int DEFAULT NULL,
  `id_incident` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id_admin`, `email`, `nom`, `prenom`, `mdp`, `departement`, `statut`, `id_planning_admin`, `id_inscriptions_locales`, `id_cours_local`, `id_incident`) VALUES
(1, 'admin1@mail.com', 'Doe', 'John', 'password1', 'Informatique', 1, 1, 1, 1, 1),
(2, 'admin2@mail.com', 'Smith', 'Jane', 'password2', 'Maths', 1, 2, 2, 2, 2),
(3, 'admin3@mail.com', 'Brown', 'Charlie', 'password3', 'Physique', 0, 3, 3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `cours_global`
--

CREATE TABLE `cours_global` (
  `id_cours` int NOT NULL,
  `nom_cours` varchar(100) DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_professeur` int DEFAULT NULL,
  `id_salle` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cours_global`
--

INSERT INTO `cours_global` (`id_cours`, `nom_cours`, `description`, `id_professeur`, `id_salle`) VALUES
(1, 'Programmation', 'Cours de C', 1, 1),
(2, 'Algèbre', 'Maths avancées', 2, 2),
(3, 'Mécanique', 'Physique appliquée', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `cours_locaux`
--

CREATE TABLE `cours_locaux` (
  `id_cours_local` int NOT NULL,
  `id_enseignant` int DEFAULT NULL,
  `horaire` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cours_locaux`
--

INSERT INTO `cours_locaux` (`id_cours_local`, `id_enseignant`, `horaire`) VALUES
(1, 1, '08:00:00'),
(2, 2, '10:00:00'),
(3, 3, '14:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `etudiants`
--

CREATE TABLE `etudiants` (
  `id_etudiant` int NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mdp` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nom` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `prenom` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `departement` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `statut` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `etudiants`
--

INSERT INTO `etudiants` (`id_etudiant`, `email`, `mdp`, `nom`, `prenom`, `departement`, `statut`) VALUES
(1, 'etudiant1@mail.com', 'etudiantpw1', 'Martin', 'Lucie', 'Informatique', 1),
(2, 'etudiant2@mail.com', 'etudiantpw2', 'Dupont', 'Paul', 'Maths', 1),
(3, 'etudiant3@mail.com', 'etudiantpw3', 'Lambert', 'Anna', 'Physique', 0);

-- --------------------------------------------------------

--
-- Table structure for table `incidents_globaux`
--

CREATE TABLE `incidents_globaux` (
  `id_incident` int NOT NULL,
  `id_salle` int DEFAULT NULL,
  `description_incident` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `date_signalement` date DEFAULT NULL,
  `statut` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `incidents_globaux`
--

INSERT INTO `incidents_globaux` (`id_incident`, `id_salle`, `description_incident`, `date_signalement`, `statut`) VALUES
(1, 1, 'Projecteur défectueux', '2024-01-15', 1),
(2, 2, 'Problème électrique', '2024-02-20', 0),
(3, 3, 'Climatisation hors service', '2024-03-10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `inscriptions_globales`
--

CREATE TABLE `inscriptions_globales` (
  `inscription_globale` int NOT NULL,
  `id_etudiant` int DEFAULT NULL,
  `id_cours` int DEFAULT NULL,
  `statut` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `inscriptions_globales`
--

INSERT INTO `inscriptions_globales` (`inscription_globale`, `id_etudiant`, `id_cours`, `statut`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 0),
(3, 3, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `inscriptions_locales`
--

CREATE TABLE `inscriptions_locales` (
  `inscription` int NOT NULL,
  `id_etudiant` int DEFAULT NULL,
  `id_cours` int DEFAULT NULL,
  `date_inscription` date DEFAULT NULL,
  `id_professeur` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `inscriptions_locales`
--

INSERT INTO `inscriptions_locales` (`inscription`, `id_etudiant`, `id_cours`, `date_inscription`, `id_professeur`) VALUES
(1, 1, 1, '2024-01-10', 1),
(2, 2, 2, '2024-02-01', 2),
(3, 3, 3, '2024-03-05', 3);

-- --------------------------------------------------------

--
-- Table structure for table `plannings_admin`
--

CREATE TABLE `plannings_admin` (
  `id_planning_admin` int NOT NULL,
  `id_planning` int DEFAULT NULL,
  `id_cours` int DEFAULT NULL,
  `departement` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `horaire` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `plannings_admin`
--

INSERT INTO `plannings_admin` (`id_planning_admin`, `id_planning`, `id_cours`, `departement`, `horaire`) VALUES
(1, 1, 1, 'Informatique', '08:00:00'),
(2, 2, 2, 'Maths', '10:00:00'),
(3, 3, 3, 'Physique', '14:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `plannings_globaux`
--

CREATE TABLE `plannings_globaux` (
  `id_planning` int NOT NULL,
  `id_cours` int DEFAULT NULL,
  `departement` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `horaire` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `plannings_globaux`
--

INSERT INTO `plannings_globaux` (`id_planning`, `id_cours`, `departement`, `horaire`) VALUES
(1, 1, 'Informatique', '08:00:00'),
(2, 2, 'Maths', '10:00:00'),
(3, 3, 'Physique', '14:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `professeurs`
--

CREATE TABLE `professeurs` (
  `id_professeur` int NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `nom` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `prenom` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mdp` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `departement` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `statut` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `professeurs`
--

INSERT INTO `professeurs` (`id_professeur`, `email`, `nom`, `prenom`, `mdp`, `departement`, `statut`) VALUES
(1, 'jean.dupont@example.com', 'Dupont', 'Jean', 'password1', 'Mathematiques', 1),
(2, 'anne.durand@example.com', 'Durand', 'Anne', 'password2', 'Physique', 0),
(3, 'paul.martin@example.com', 'Martin', 'Paul', 'password3', 'Informatique', 1);

-- --------------------------------------------------------

--
-- Table structure for table `salles_globales`
--

CREATE TABLE `salles_globales` (
  `id_salle` int NOT NULL,
  `numero_salle` int DEFAULT NULL,
  `statut` tinyint(1) DEFAULT NULL,
  `departement` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `salles_globales`
--

INSERT INTO `salles_globales` (`id_salle`, `numero_salle`, `statut`, `departement`) VALUES
(1, 101, 1, 'Informatique'),
(2, 202, 0, 'Maths'),
(3, 303, 1, 'Physique');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id_admin`),
  ADD KEY `id_planning_admin` (`id_planning_admin`),
  ADD KEY `id_inscriptions_locales` (`id_inscriptions_locales`),
  ADD KEY `id_cours_local` (`id_cours_local`),
  ADD KEY `id_incident` (`id_incident`);

--
-- Indexes for table `cours_global`
--
ALTER TABLE `cours_global`
  ADD PRIMARY KEY (`id_cours`),
  ADD KEY `id_professeur` (`id_professeur`),
  ADD KEY `id_salle` (`id_salle`);

--
-- Indexes for table `cours_locaux`
--
ALTER TABLE `cours_locaux`
  ADD PRIMARY KEY (`id_cours_local`),
  ADD KEY `id_enseignant` (`id_enseignant`);

--
-- Indexes for table `etudiants`
--
ALTER TABLE `etudiants`
  ADD PRIMARY KEY (`id_etudiant`);

--
-- Indexes for table `incidents_globaux`
--
ALTER TABLE `incidents_globaux`
  ADD PRIMARY KEY (`id_incident`),
  ADD KEY `id_salle` (`id_salle`);

--
-- Indexes for table `inscriptions_globales`
--
ALTER TABLE `inscriptions_globales`
  ADD PRIMARY KEY (`inscription_globale`),
  ADD KEY `id_etudiant` (`id_etudiant`),
  ADD KEY `id_cours` (`id_cours`);

--
-- Indexes for table `inscriptions_locales`
--
ALTER TABLE `inscriptions_locales`
  ADD PRIMARY KEY (`inscription`),
  ADD KEY `id_etudiant` (`id_etudiant`),
  ADD KEY `id_cours` (`id_cours`),
  ADD KEY `id_professeur` (`id_professeur`);

--
-- Indexes for table `plannings_admin`
--
ALTER TABLE `plannings_admin`
  ADD PRIMARY KEY (`id_planning_admin`),
  ADD KEY `id_planning` (`id_planning`),
  ADD KEY `id_cours` (`id_cours`);

--
-- Indexes for table `plannings_globaux`
--
ALTER TABLE `plannings_globaux`
  ADD PRIMARY KEY (`id_planning`),
  ADD KEY `id_cours` (`id_cours`);

--
-- Indexes for table `professeurs`
--
ALTER TABLE `professeurs`
  ADD PRIMARY KEY (`id_professeur`);

--
-- Indexes for table `salles_globales`
--
ALTER TABLE `salles_globales`
  ADD PRIMARY KEY (`id_salle`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id_admin` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cours_global`
--
ALTER TABLE `cours_global`
  MODIFY `id_cours` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cours_locaux`
--
ALTER TABLE `cours_locaux`
  MODIFY `id_cours_local` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `etudiants`
--
ALTER TABLE `etudiants`
  MODIFY `id_etudiant` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `incidents_globaux`
--
ALTER TABLE `incidents_globaux`
  MODIFY `id_incident` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `inscriptions_globales`
--
ALTER TABLE `inscriptions_globales`
  MODIFY `inscription_globale` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `inscriptions_locales`
--
ALTER TABLE `inscriptions_locales`
  MODIFY `inscription` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `plannings_admin`
--
ALTER TABLE `plannings_admin`
  MODIFY `id_planning_admin` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `plannings_globaux`
--
ALTER TABLE `plannings_globaux`
  MODIFY `id_planning` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `professeurs`
--
ALTER TABLE `professeurs`
  MODIFY `id_professeur` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `salles_globales`
--
ALTER TABLE `salles_globales`
  MODIFY `id_salle` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`id_planning_admin`) REFERENCES `plannings_admin` (`id_planning_admin`),
  ADD CONSTRAINT `admins_ibfk_2` FOREIGN KEY (`id_inscriptions_locales`) REFERENCES `inscriptions_locales` (`inscription`),
  ADD CONSTRAINT `admins_ibfk_3` FOREIGN KEY (`id_cours_local`) REFERENCES `cours_locaux` (`id_cours_local`),
  ADD CONSTRAINT `admins_ibfk_4` FOREIGN KEY (`id_incident`) REFERENCES `incidents_globaux` (`id_incident`);

--
-- Constraints for table `cours_global`
--
ALTER TABLE `cours_global`
  ADD CONSTRAINT `cours_global_ibfk_1` FOREIGN KEY (`id_professeur`) REFERENCES `professeurs` (`id_professeur`),
  ADD CONSTRAINT `cours_global_ibfk_2` FOREIGN KEY (`id_salle`) REFERENCES `salles_globales` (`id_salle`);

--
-- Constraints for table `cours_locaux`
--
ALTER TABLE `cours_locaux`
  ADD CONSTRAINT `cours_locaux_ibfk_1` FOREIGN KEY (`id_enseignant`) REFERENCES `professeurs` (`id_professeur`);

--
-- Constraints for table `incidents_globaux`
--
ALTER TABLE `incidents_globaux`
  ADD CONSTRAINT `incidents_globaux_ibfk_1` FOREIGN KEY (`id_salle`) REFERENCES `salles_globales` (`id_salle`);

--
-- Constraints for table `inscriptions_globales`
--
ALTER TABLE `inscriptions_globales`
  ADD CONSTRAINT `inscriptions_globales_ibfk_1` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiants` (`id_etudiant`),
  ADD CONSTRAINT `inscriptions_globales_ibfk_2` FOREIGN KEY (`id_cours`) REFERENCES `cours_global` (`id_cours`);

--
-- Constraints for table `inscriptions_locales`
--
ALTER TABLE `inscriptions_locales`
  ADD CONSTRAINT `inscriptions_locales_ibfk_1` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiants` (`id_etudiant`),
  ADD CONSTRAINT `inscriptions_locales_ibfk_2` FOREIGN KEY (`id_cours`) REFERENCES `cours_locaux` (`id_cours_local`),
  ADD CONSTRAINT `inscriptions_locales_ibfk_3` FOREIGN KEY (`id_professeur`) REFERENCES `professeurs` (`id_professeur`);

--
-- Constraints for table `plannings_admin`
--
ALTER TABLE `plannings_admin`
  ADD CONSTRAINT `plannings_admin_ibfk_1` FOREIGN KEY (`id_planning`) REFERENCES `plannings_globaux` (`id_planning`),
  ADD CONSTRAINT `plannings_admin_ibfk_2` FOREIGN KEY (`id_cours`) REFERENCES `cours_global` (`id_cours`);

--
-- Constraints for table `plannings_globaux`
--
ALTER TABLE `plannings_globaux`
  ADD CONSTRAINT `plannings_globaux_ibfk_1` FOREIGN KEY (`id_cours`) REFERENCES `cours_global` (`id_cours`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

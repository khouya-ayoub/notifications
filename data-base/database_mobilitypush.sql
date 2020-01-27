-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  lun. 27 jan. 2020 à 22:02
-- Version du serveur :  8.0.17
-- Version de PHP :  7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `mobilitypush`
--

-- --------------------------------------------------------

--
-- Structure de la table `mb_displays`
--

CREATE TABLE `mb_displays` (
  `MDI_IDDISPLAY` int(11) NOT NULL,
  `MDI_IDUSER` int(11) NOT NULL,
  `MDI_TOCKEN` varchar(150) NOT NULL,
  `MDI_ETATNOTIF` tinyint(1) NOT NULL DEFAULT '0',
  `MDI_QUICREAT` varchar(150) NOT NULL,
  `MDI_DATECREAT` date NOT NULL,
  `MDI_QUIMODIF` varchar(150) DEFAULT NULL,
  `MDI_DATEMODIF` date DEFAULT NULL,
  `MDI_QUISUPPR` varchar(150) DEFAULT NULL,
  `MDI_DATESUPPR` date DEFAULT NULL,
  `MDI_ACTIVESTS` char(1) NOT NULL DEFAULT 'O'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `mb_envoie`
--

CREATE TABLE `mb_envoie` (
  `MEN_IDENVOIE` int(11) NOT NULL,
  `MEN_IDUSER` int(11) NOT NULL,
  `MEN_IDDISPLAY` int(11) NOT NULL,
  `MEN_IDNOTIFICATION` int(11) NOT NULL,
  `MEN_ETATREAD` tinyint(1) NOT NULL DEFAULT '0',
  `MAV_QUICREAT` varchar(150) NOT NULL,
  `MAV_DATECREAT` date NOT NULL,
  `MAV_QUIMODIF` varchar(150) DEFAULT NULL,
  `MAV_DATEMODIF` date DEFAULT NULL,
  `MAV_QUISUPPR` varchar(150) DEFAULT NULL,
  `MAV_DATESUPPR` date DEFAULT NULL,
  `MAV_ACTIVESTS` char(1) NOT NULL DEFAULT 'O'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `mb_notifcations`
--

CREATE TABLE `mb_notifcations` (
  `MNO_IDNOTIFICATION` int(11) NOT NULL,
  `MNO_TITRE` varchar(200) NOT NULL,
  `MNO_DESCRIPTION` varchar(300) NOT NULL,
  `MNO_TYPE` int(11) NOT NULL,
  `MNO_ETAT` tinyint(1) NOT NULL DEFAULT '0',
  `MNO_CIBLE` json NOT NULL,
  `MNO_QUICREAT` varchar(150) NOT NULL,
  `MNO_DATECREAT` date NOT NULL,
  `MNO_QUIMODIF` varchar(150) DEFAULT NULL,
  `MNO_DATEMODIF` date DEFAULT NULL,
  `MNO_QUISUPPR` varchar(150) DEFAULT NULL,
  `MNO_DATESUPPR` date DEFAULT NULL,
  `MNO_ACTIVESTS` char(1) NOT NULL DEFAULT 'O'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `mb_users`
--

CREATE TABLE `mb_users` (
  `MUS_IDUSER` int(11) NOT NULL,
  `MUS_NOM` varchar(100) NOT NULL,
  `MUS_PRENOM` varchar(100) NOT NULL,
  `MUS_LOGIN` varchar(150) NOT NULL,
  `MUS_PASSWORD` varchar(100) NOT NULL,
  `MUS_FONCTION` varchar(100) NOT NULL,
  `MUS_QUICREAT` varchar(150) NOT NULL,
  `MUS_DATECREAT` date NOT NULL,
  `MUS_QUIMODIF` varchar(150) DEFAULT NULL,
  `MUS_DATEMODIF` date DEFAULT NULL,
  `MUS_QUISUPPR` varchar(150) DEFAULT NULL,
  `MUS_DATESUPPR` date DEFAULT NULL,
  `MUS_ACTIVESTS` char(1) NOT NULL DEFAULT 'O'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `mb_displays`
--
ALTER TABLE `mb_displays`
  ADD PRIMARY KEY (`MDI_IDDISPLAY`),
  ADD KEY `MDI_IDUSER` (`MDI_IDUSER`);

--
-- Index pour la table `mb_envoie`
--
ALTER TABLE `mb_envoie`
  ADD PRIMARY KEY (`MEN_IDENVOIE`),
  ADD KEY `MEN_IDUSER` (`MEN_IDUSER`),
  ADD KEY `MEN_IDNOTIFICATION` (`MEN_IDNOTIFICATION`),
  ADD KEY `MEN_IDDISPLAY` (`MEN_IDDISPLAY`);

--
-- Index pour la table `mb_notifcations`
--
ALTER TABLE `mb_notifcations`
  ADD PRIMARY KEY (`MNO_IDNOTIFICATION`);

--
-- Index pour la table `mb_users`
--
ALTER TABLE `mb_users`
  ADD PRIMARY KEY (`MUS_IDUSER`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `mb_displays`
--
ALTER TABLE `mb_displays`
  MODIFY `MDI_IDDISPLAY` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `mb_envoie`
--
ALTER TABLE `mb_envoie`
  MODIFY `MEN_IDENVOIE` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `mb_notifcations`
--
ALTER TABLE `mb_notifcations`
  MODIFY `MNO_IDNOTIFICATION` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `mb_users`
--
ALTER TABLE `mb_users`
  MODIFY `MUS_IDUSER` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `mb_displays`
--
ALTER TABLE `mb_displays`
  ADD CONSTRAINT `mb_displays_ibfk_1` FOREIGN KEY (`MDI_IDUSER`) REFERENCES `mb_users` (`MUS_IDUSER`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `mb_envoie`
--
ALTER TABLE `mb_envoie`
  ADD CONSTRAINT `mb_envoie_ibfk_1` FOREIGN KEY (`MEN_IDUSER`) REFERENCES `mb_users` (`MUS_IDUSER`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `mb_envoie_ibfk_2` FOREIGN KEY (`MEN_IDNOTIFICATION`) REFERENCES `mb_notifcations` (`MNO_IDNOTIFICATION`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `mb_envoie_ibfk_3` FOREIGN KEY (`MEN_IDDISPLAY`) REFERENCES `mb_displays` (`MDI_IDDISPLAY`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

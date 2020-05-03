-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  Dim 03 mai 2020 à 03:40
-- Version du serveur :  10.4.11-MariaDB-log
-- Version de PHP :  7.4.1

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
-- Structure de la table `mb_envoie`
--

CREATE TABLE `mb_envoie` (
  `MEN_IDENVOIE` int(11) NOT NULL,
  `MEN_IDUSER` int(11) NOT NULL,
  `MEN_IDNOTIFICATION` int(11) NOT NULL,
  `MEN_ETATENVOIE` int(11) NOT NULL DEFAULT 0,
  `MEN_ETATREAD` tinyint(1) NOT NULL DEFAULT 0,
  `MAV_QUICREAT` varchar(150) NOT NULL DEFAULT 'ADMIN',
  `MAV_DATECREAT` datetime NOT NULL,
  `MAV_QUIMODIF` varchar(150) DEFAULT NULL,
  `MAV_DATEMODIF` date DEFAULT NULL,
  `MAV_QUISUPPR` varchar(150) DEFAULT NULL,
  `MAV_DATESUPPR` date DEFAULT NULL,
  `MAV_ACTIVESTS` char(1) NOT NULL DEFAULT 'O'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `mb_groupe`
--

CREATE TABLE `mb_groupe` (
  `MGR_IDGROUPE` int(11) NOT NULL,
  `MGR_TITRE` varchar(200) NOT NULL,
  `MGR_DESCRIPTION` varchar(300) NOT NULL,
  `MGR_QUICREAT` varchar(150) NOT NULL,
  `MGR_DATECREAT` date NOT NULL,
  `MGR_QUIMODIF` varchar(150) DEFAULT NULL,
  `MGR_DATEMODIF` date DEFAULT NULL,
  `MGR_QUISUPPR` varchar(150) DEFAULT NULL,
  `MGR_DATESUPPR` date DEFAULT NULL,
  `MGR_ACTIVESTS` char(1) NOT NULL DEFAULT 'O'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `mb_notifications`
--

CREATE TABLE `mb_notifications` (
  `MNO_IDNOTIFICATION` int(11) NOT NULL,
  `MNO_TITRE` varchar(200) NOT NULL,
  `MNO_DESCRIPTION` varchar(300) NOT NULL,
  `MNO_TYPE` int(11) NOT NULL DEFAULT 0,
  `MNO_ETAT` tinyint(1) NOT NULL DEFAULT 0,
  `MNO_CIBLE` int(11) NOT NULL DEFAULT 2,
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
-- Structure de la table `mb_subscriptions`
--

CREATE TABLE `mb_subscriptions` (
  `MSU_IDSUBSCRIPTION` int(11) NOT NULL,
  `MSU_IDUSER` int(11) NOT NULL,
  `MSU_ENDPOINT` varchar(250) NOT NULL,
  `MSU_AUTH` varchar(250) NOT NULL,
  `MSU_P256DH` varchar(250) NOT NULL,
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
-- Structure de la table `mb_users`
--

CREATE TABLE `mb_users` (
  `MUS_IDUSER` int(11) NOT NULL,
  `MUS_NOM` varchar(100) NOT NULL,
  `MUS_PRENOM` varchar(100) NOT NULL,
  `MUS_LOGIN` varchar(150) NOT NULL,
  `MUS_PASSWORD` varchar(100) NOT NULL,
  `MUS_ETATSUBSCRITION` int(11) NOT NULL DEFAULT 0,
  `MUS_GROUP` int(11) DEFAULT NULL,
  `MUS_QUICREAT` varchar(150) NOT NULL,
  `MUS_DATECREAT` date NOT NULL,
  `MUS_QUIMODIF` varchar(150) DEFAULT NULL,
  `MUS_DATEMODIF` date DEFAULT NULL,
  `MUS_QUISUPPR` varchar(150) DEFAULT NULL,
  `MUS_DATESUPPR` date DEFAULT NULL,
  `MUS_ACTIVESTS` char(1) NOT NULL DEFAULT 'O'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `mb_users`
--

INSERT INTO `mb_users` (`MUS_IDUSER`, `MUS_NOM`, `MUS_PRENOM`, `MUS_LOGIN`, `MUS_PASSWORD`, `MUS_ETATSUBSCRITION`, `MUS_GROUP`, `MUS_QUICREAT`, `MUS_DATECREAT`, `MUS_QUIMODIF`, `MUS_DATEMODIF`, `MUS_QUISUPPR`, `MUS_DATESUPPR`, `MUS_ACTIVESTS`) VALUES
(1, 'DUPONT', 'Jean', 'admin@cermix.fr', 'admin', 0, NULL, 'ADMIN', '2020-05-01', NULL, NULL, NULL, NULL, 'O');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `mb_envoie`
--
ALTER TABLE `mb_envoie`
  ADD PRIMARY KEY (`MEN_IDENVOIE`),
  ADD KEY `MEN_IDUSER` (`MEN_IDUSER`),
  ADD KEY `MEN_IDNOTIFICATION` (`MEN_IDNOTIFICATION`);

--
-- Index pour la table `mb_groupe`
--
ALTER TABLE `mb_groupe`
  ADD PRIMARY KEY (`MGR_IDGROUPE`);

--
-- Index pour la table `mb_notifications`
--
ALTER TABLE `mb_notifications`
  ADD PRIMARY KEY (`MNO_IDNOTIFICATION`);

--
-- Index pour la table `mb_subscriptions`
--
ALTER TABLE `mb_subscriptions`
  ADD PRIMARY KEY (`MSU_IDSUBSCRIPTION`);

--
-- Index pour la table `mb_users`
--
ALTER TABLE `mb_users`
  ADD PRIMARY KEY (`MUS_IDUSER`),
  ADD KEY `fk_user_group` (`MUS_GROUP`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `mb_envoie`
--
ALTER TABLE `mb_envoie`
  MODIFY `MEN_IDENVOIE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT pour la table `mb_groupe`
--
ALTER TABLE `mb_groupe`
  MODIFY `MGR_IDGROUPE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT pour la table `mb_notifications`
--
ALTER TABLE `mb_notifications`
  MODIFY `MNO_IDNOTIFICATION` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT pour la table `mb_subscriptions`
--
ALTER TABLE `mb_subscriptions`
  MODIFY `MSU_IDSUBSCRIPTION` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT pour la table `mb_users`
--
ALTER TABLE `mb_users`
  MODIFY `MUS_IDUSER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `mb_envoie`
--
ALTER TABLE `mb_envoie`
  ADD CONSTRAINT `mb_envoie_ibfk_1` FOREIGN KEY (`MEN_IDUSER`) REFERENCES `mb_users` (`MUS_IDUSER`),
  ADD CONSTRAINT `mb_envoie_ibfk_2` FOREIGN KEY (`MEN_IDNOTIFICATION`) REFERENCES `mb_notifications` (`MNO_IDNOTIFICATION`);

--
-- Contraintes pour la table `mb_users`
--
ALTER TABLE `mb_users`
  ADD CONSTRAINT `fk_user_group` FOREIGN KEY (`MUS_GROUP`) REFERENCES `mb_groupe` (`MGR_IDGROUPE`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

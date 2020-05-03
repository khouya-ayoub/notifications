-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  Dim 03 mai 2020 à 07:12
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

--
-- Déchargement des données de la table `mb_envoie`
--

INSERT INTO `mb_envoie` (`MEN_IDENVOIE`, `MEN_IDUSER`, `MEN_IDNOTIFICATION`, `MEN_ETATENVOIE`, `MEN_ETATREAD`, `MAV_QUICREAT`, `MAV_DATECREAT`, `MAV_QUIMODIF`, `MAV_DATEMODIF`, `MAV_QUISUPPR`, `MAV_DATESUPPR`, `MAV_ACTIVESTS`) VALUES
(1984, 1, 1, 0, 1, 'ADMIN', '2020-05-03 00:00:00', NULL, NULL, NULL, NULL, 'O');

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

--
-- Déchargement des données de la table `mb_notifications`
--

INSERT INTO `mb_notifications` (`MNO_IDNOTIFICATION`, `MNO_TITRE`, `MNO_DESCRIPTION`, `MNO_TYPE`, `MNO_ETAT`, `MNO_CIBLE`, `MNO_QUICREAT`, `MNO_DATECREAT`, `MNO_QUIMODIF`, `MNO_DATEMODIF`, `MNO_QUISUPPR`, `MNO_DATESUPPR`, `MNO_ACTIVESTS`) VALUES
(1, 'NOTIFICATION JEAN', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 0, 1, 1, 'SYSTEM', '2020-05-01', NULL, NULL, NULL, NULL, 'O'),
(2, 'NOTIFICATION ETATREAD', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.', 0, 0, 1, 'SYSTEM', '2020-05-02', NULL, NULL, NULL, NULL, 'O'),
(48315, 'Ajouté depuis le client', 'une notification ajoutée depuis le client angular', 0, 0, 1, 'Angular', '2020-02-10', NULL, NULL, NULL, NULL, 'O');

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

--
-- Déchargement des données de la table `mb_subscriptions`
--

INSERT INTO `mb_subscriptions` (`MSU_IDSUBSCRIPTION`, `MSU_IDUSER`, `MSU_ENDPOINT`, `MSU_AUTH`, `MSU_P256DH`, `MDI_QUICREAT`, `MDI_DATECREAT`, `MDI_QUIMODIF`, `MDI_DATEMODIF`, `MDI_QUISUPPR`, `MDI_DATESUPPR`, `MDI_ACTIVESTS`) VALUES
(65, 1, 'https://fcm.googleapis.com/fcm/send/ecGBN_n464E:APA91bHq5WLnxRxWuQXLgPfub_u1rcrcwib8tVLdLo4oSTlBuktcFsRu-ZArGZQ9WVpu8W4W5gw8X23qn_jC4-mLQzuvfeIUS5cpXT8f6AopxGEr0Enn6MmG9i9Vl9g1T447smUoeY2o', 'HP0aZwIBR4tE3X8KmWwJRA', 'BAsWGrtAmcfG7g1dMXSTTBIJIZpjz2Zhs2OPvLONfpS77MB2T7rtaw8DcoyRmmqqTWWNUesHQfS_pXKW2leq0UQ', '', '0000-00-00', NULL, NULL, NULL, NULL, 'O');

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
  `MUS_ETATSUBSCRIPTION` int(11) NOT NULL DEFAULT 0,
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

INSERT INTO `mb_users` (`MUS_IDUSER`, `MUS_NOM`, `MUS_PRENOM`, `MUS_LOGIN`, `MUS_PASSWORD`, `MUS_ETATSUBSCRIPTION`, `MUS_GROUP`, `MUS_QUICREAT`, `MUS_DATECREAT`, `MUS_QUIMODIF`, `MUS_DATEMODIF`, `MUS_QUISUPPR`, `MUS_DATESUPPR`, `MUS_ACTIVESTS`) VALUES
(1, 'DUPONT', 'Jean', 'admin@cermix.fr', '$2b$10$L49X1ZGpvXDA2FJjOCte7O1EV7ScAzAoN3nqYDVy7BGumYS/IBGTu', 1, NULL, 'ADMIN', '2020-05-01', NULL, NULL, NULL, NULL, 'O');

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
  MODIFY `MGR_IDGROUPE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `MUS_IDUSER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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

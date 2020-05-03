-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  jeu. 30 avr. 2020 à 16:02
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
-- Structure de la table `mb_donnees`
--

CREATE TABLE `mb_donnees` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `prix` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `mb_donnees`
--

INSERT INTO `mb_donnees` (`id`, `id_user`, `prix`, `date`) VALUES
(27, 4, 150, '2020-04-19'),
(31, 4, 415, '2020-04-18');

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
(1962, 2, 48311, 1, 0, 'ADMIN', '2020-04-23 00:00:00', NULL, NULL, NULL, NULL, 'O');

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
(48311, 'le titre', 'la description', 0, 1, 2, 'Admin', '2020-04-23', NULL, NULL, NULL, NULL, 'O');

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
(33, 2, 'https://fcm.googleapis.com/fcm/send/ecGBN_n464E:APA91bHq5WLnxRxWuQXLgPfub_u1rcrcwib8tVLdLo4oSTlBuktcFsRu-ZArGZQ9WVpu8W4W5gw8X23qn_jC4-mLQzuvfeIUS5cpXT8f6AopxGEr0Enn6MmG9i9Vl9g1T447smUoeY2o', 'HP0aZwIBR4tE3X8KmWwJRA', 'BAsWGrtAmcfG7g1dMXSTTBIJIZpjz2Zhs2OPvLONfpS77MB2T7rtaw8DcoyRmmqqTWWNUesHQfS_pXKW2leq0UQ', '', '0000-00-00', NULL, NULL, NULL, NULL, 'O'),
(34, 2, 'https://db5p.notify.windows.com/w/?token=BQYAAAArzX8b0LJbB%2frFBRL9pmRXMKJfQ4XzlPOIy8MfwX4PDr4EhXiRqUGBNFq%2fa%2f2I9l9pWGw2SzC8WJ4lxBle%2bawvIxAueEww0XHpoILnYTveJ0yQdsOjHXPg9XZYCyjcKBRHNVi3outZouZ2iSy91H4nQr%2f%2f2wFIo%2b1VqPXlLK4SkgCnUzBv6eIPunPh0qh', '0Ort-L2lYbsOmnDFs2Wh4A', 'BOaCR1scBPAPz2hf2PgDq4erMOnUijtzTflt2AUSkiRm_vh3PQ0HoOMYH5cCHCqeUcirQ8kCMDokuVWPzXVGO3c', '', '0000-00-00', NULL, NULL, NULL, NULL, 'O');

-- --------------------------------------------------------

--
-- Structure de la table `mb_test`
--

CREATE TABLE `mb_test` (
  `id` int(11) NOT NULL,
  `thread` int(11) NOT NULL
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
  `MUS_FONCTION` int(11) NOT NULL,
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

INSERT INTO `mb_users` (`MUS_IDUSER`, `MUS_NOM`, `MUS_PRENOM`, `MUS_LOGIN`, `MUS_PASSWORD`, `MUS_ETATSUBSCRITION`, `MUS_FONCTION`, `MUS_QUICREAT`, `MUS_DATECREAT`, `MUS_QUIMODIF`, `MUS_DATEMODIF`, `MUS_QUISUPPR`, `MUS_DATESUPPR`, `MUS_ACTIVESTS`) VALUES
(2, 'HRAMCHI', 'Hamza', 'hhamza', '$2b$10$BSbpUL75nycKZPrB/AXXpuzbh.ZtGo34tp8v6JUaMQ/U3Cq9pi/Fq', 1, 0, 'Admin', '2020-02-09', NULL, NULL, NULL, NULL, 'O'),
(3, 'MOUSAOUI', 'Yahya', 'myahya', '$2b$10$BSbpUL75nycKZPrB/AXXpuzbh.ZtGo34tp8v6JUaMQ/U3Cq9pi/Fq', 1, 0, 'Admin', '2020-02-17', NULL, NULL, NULL, NULL, 'O'),
(4, 'BOUHLLA', 'Salma', 'bsalma', '$2b$10$BSbpUL75nycKZPrB/AXXpuzbh.ZtGo34tp8v6JUaMQ/U3Cq9pi/Fq', 1, 0, 'Admin', '2020-03-06', NULL, NULL, NULL, NULL, 'O'),
(5, 'Test', 'Root', 'troot', '$2b$10$BSbpUL75nycKZPrB/AXXpuzbh.ZtGo34tp8v6JUaMQ/U3Cq9pi/Fq', 0, 0, 'Admin', '2020-03-06', NULL, NULL, NULL, NULL, 'O');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `mb_donnees`
--
ALTER TABLE `mb_donnees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_donnee_user` (`id_user`);

--
-- Index pour la table `mb_envoie`
--
ALTER TABLE `mb_envoie`
  ADD PRIMARY KEY (`MEN_IDENVOIE`),
  ADD KEY `MEN_IDUSER` (`MEN_IDUSER`),
  ADD KEY `MEN_IDNOTIFICATION` (`MEN_IDNOTIFICATION`);

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
-- Index pour la table `mb_test`
--
ALTER TABLE `mb_test`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `mb_users`
--
ALTER TABLE `mb_users`
  ADD PRIMARY KEY (`MUS_IDUSER`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `mb_donnees`
--
ALTER TABLE `mb_donnees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT pour la table `mb_envoie`
--
ALTER TABLE `mb_envoie`
  MODIFY `MEN_IDENVOIE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1963;

--
-- AUTO_INCREMENT pour la table `mb_notifications`
--
ALTER TABLE `mb_notifications`
  MODIFY `MNO_IDNOTIFICATION` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48312;

--
-- AUTO_INCREMENT pour la table `mb_subscriptions`
--
ALTER TABLE `mb_subscriptions`
  MODIFY `MSU_IDSUBSCRIPTION` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT pour la table `mb_test`
--
ALTER TABLE `mb_test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `mb_users`
--
ALTER TABLE `mb_users`
  MODIFY `MUS_IDUSER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `mb_donnees`
--
ALTER TABLE `mb_donnees`
  ADD CONSTRAINT `fk_donnee_user` FOREIGN KEY (`id_user`) REFERENCES `mb_users` (`MUS_IDUSER`);

--
-- Contraintes pour la table `mb_envoie`
--
ALTER TABLE `mb_envoie`
  ADD CONSTRAINT `mb_envoie_ibfk_1` FOREIGN KEY (`MEN_IDUSER`) REFERENCES `mb_users` (`MUS_IDUSER`),
  ADD CONSTRAINT `mb_envoie_ibfk_2` FOREIGN KEY (`MEN_IDNOTIFICATION`) REFERENCES `mb_notifications` (`MNO_IDNOTIFICATION`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

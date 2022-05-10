-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 10 mai 2022 à 14:26
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bobies_db`
--
CREATE DATABASE IF NOT EXISTS `bobies_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `bobies_db`;

-- --------------------------------------------------------

--
-- Structure de la table `bobies_animals`
--

CREATE TABLE `bobies_animals` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8_bin NOT NULL,
  `age` int(11) NOT NULL,
  `type` varchar(25) COLLATE utf8_bin NOT NULL,
  `image` varchar(250) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `bobies_animals`
--

INSERT INTO `bobies_animals` (`id`, `nom`, `age`, `type`, `image`) VALUES
(12, 'Chien loup', 15, 'chien', '1.jpg'),
(13, 'Luky', 1, 'chat', '2.jpg'),
(14, 'Golden', 2, 'poisson', '3.jpg'),
(15, 'blue', 2, 'cameleon', '4.jpg'),
(16, 'lazy', 2, 'lapin', '5.jpg'),
(20, 'test', 2, 'oiseau', '3.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `bobies_annonces`
--

CREATE TABLE `bobies_annonces` (
  `id` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `idAnimal` int(11) NOT NULL,
  `nom` varchar(20) COLLATE utf8_bin NOT NULL,
  `petiteDescription` varchar(50) COLLATE utf8_bin NOT NULL,
  `description` varchar(250) COLLATE utf8_bin NOT NULL,
  `type` varchar(50) COLLATE utf8_bin NOT NULL,
  `dateAnnonce` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `bobies_annonces`
--

INSERT INTO `bobies_annonces` (`id`, `idUser`, `idAnimal`, `nom`, `petiteDescription`, `description`, `type`, `dateAnnonce`) VALUES
(10, 4, 12, 'Chien a heberger', 'Le Lorem Ipsum est simplement du faux texte emp...', 'Le Lorem Ipsum est simplement du faux texte employ� dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les ann�es 1500, quand un imprimeur anonyme assembla ensemble des morceaux d', 'offreHebergement', '2022-05-25'),
(11, 4, 13, 'Lovely Cat', 'Lovely cat for who wants to adopt it .', 'Le Lorem Ipsum est simplement du faux texte employ? dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les ann?es 1500, quand un imprimeur anonyme assembla ensemble des morceaux d', 'offreAnimal', '2022-05-11'),
(12, 4, 14, 'Lovely Golden Fish', 'Le Lorem Ipsum est simplement du faux texte emp...', 'Le Lorem Ipsum est simplement du faux texte employ� dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les ann�es 1500, quand un imprimeur anonyme assembla ensemble des morceaux d', 'offreHebergement', '2022-05-11'),
(13, 4, 15, 'Blue Cameleon', 'Le Lorem Ipsum est simplement du faux texte emp...', 'Le Lorem Ipsum est simplement du faux texte employ� dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les ann�es 1500, quand un imprimeur anonyme assembla ensemble des morceaux d', 'demandeHebergement', '2022-05-11'),
(14, 4, 16, 'Lazy Rabbit', 'Le Lorem Ipsum est simplement du faux texte emp...', 'Le Lorem Ipsum est simplement du faux texte employ� dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les ann�es 1500, quand un imprimeur anonyme assembla ensemble des morceaux d', 'demandeAdoption', '2022-05-05'),
(16, 4, 20, 'test', 'Le Lorem Ipsum est simplement du faux texte emp...', 'Le Lorem Ipsum est simplement du faux texte employ� dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les ann�es 1500, quand un imprimeur anonyme assembla ensemble des morceaux d', 'offreAnimal', '2022-05-11');

-- --------------------------------------------------------

--
-- Structure de la table `bobies_users`
--

CREATE TABLE `bobies_users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8_bin NOT NULL,
  `nom` varchar(50) COLLATE utf8_bin NOT NULL,
  `prenom` varchar(50) COLLATE utf8_bin NOT NULL,
  `password` varchar(50) COLLATE utf8_bin NOT NULL,
  `email` varchar(50) COLLATE utf8_bin NOT NULL,
  `dateInscription` date NOT NULL,
  `description` varchar(255) COLLATE utf8_bin NOT NULL,
  `image` varchar(250) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `bobies_users`
--

INSERT INTO `bobies_users` (`id`, `username`, `nom`, `prenom`, `password`, `email`, `dateInscription`, `description`, `image`) VALUES
(4, 'i.ghazoui', 'Ghazoui', 'Ilyas', 'ilyas', 'ilyasghazoui@gmail.com', '2022-05-06', 'Hi, i\'m Ghazoui Ilyas', 'https://i.pinimg.com/originals/25/54/40/255440fc3abc7d7f5d5fc1772d372c77.jpg');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `bobies_animals`
--
ALTER TABLE `bobies_animals`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `bobies_annonces`
--
ALTER TABLE `bobies_annonces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`),
  ADD KEY `idAnimal` (`idAnimal`);

--
-- Index pour la table `bobies_users`
--
ALTER TABLE `bobies_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `bobies_animals`
--
ALTER TABLE `bobies_animals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `bobies_annonces`
--
ALTER TABLE `bobies_annonces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `bobies_users`
--
ALTER TABLE `bobies_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `bobies_annonces`
--
ALTER TABLE `bobies_annonces`
  ADD CONSTRAINT `bobies_annonces_ibfk_2` FOREIGN KEY (`idUser`) REFERENCES `bobies_users` (`id`),
  ADD CONSTRAINT `bobies_annonces_ibfk_3` FOREIGN KEY (`idAnimal`) REFERENCES `bobies_animals` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

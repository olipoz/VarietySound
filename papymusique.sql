-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 28 sep. 2021 à 12:39
-- Version du serveur : 10.4.20-MariaDB
-- Version de PHP : 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `papymusique`
--

-- --------------------------------------------------------

--
-- Structure de la table `album`
--

CREATE TABLE `album` (
  `id` int(11) NOT NULL,
  `artiste_id` int(11) DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `album`
--

INSERT INTO `album` (`id`, `artiste_id`, `nom`, `image`) VALUES
(1, 1, 'Les Lacs du Connemara', 'Albumleslacsduconnemara.jpg'),
(2, 3, 'Recto verso', 'AlbumRectoVerso.jpg'),
(3, 3, 'Sur la route', 'albumSurLaRoute.jpg'),
(4, 4, 'Djangology', 'albumDjangology.jpg'),
(5, 4, 'Django in Rome 1949/1950', 'DjangoInRome1949_1950.jpg'),
(6, 5, 'Blues on the Bayou', 'albumBluesOnTheBayou.jpg'),
(7, 6, 'I Am the Blues', 'albumIAmTheBlues.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `artiste`
--

CREATE TABLE `artiste` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `artiste`
--

INSERT INTO `artiste` (`id`, `nom`, `image`) VALUES
(1, 'Michel Sardou', 'michelsardou.jpg'),
(2, 'Claude Nougaro', 'claude_nougaro.jpg'),
(3, 'Zaz', 'Zaz.jpg'),
(4, 'Django Reinhardt', 'Django Reinhardt01.jpg'),
(5, 'B. B. King', 'B_B_King.jpg'),
(6, 'Willie Dixon', 'Willie_Dixon.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210902125413', '2021-09-02 14:59:30', 38),
('DoctrineMigrations\\Version20210902131421', '2021-09-02 15:14:30', 25),
('DoctrineMigrations\\Version20210902133641', '2021-09-02 15:36:52', 24),
('DoctrineMigrations\\Version20210902143048', '2021-09-02 16:30:57', 26),
('DoctrineMigrations\\Version20210907114230', '2021-09-07 13:43:04', 38),
('DoctrineMigrations\\Version20210907115321', '2021-09-07 13:53:42', 40),
('DoctrineMigrations\\Version20210907115844', '2021-09-07 13:58:55', 38),
('DoctrineMigrations\\Version20210907121002', '2021-09-07 14:30:35', 89),
('DoctrineMigrations\\Version20210907131216', '2021-09-07 15:12:25', 169),
('DoctrineMigrations\\Version20210907131601', '2021-09-07 15:16:13', 142),
('DoctrineMigrations\\Version20210910134925', '2021-09-10 15:49:59', 307);

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `genre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `genre`
--

INSERT INTO `genre` (`id`, `genre`) VALUES
(1, 'Variétés'),
(2, 'Blues'),
(3, 'Jazz');

-- --------------------------------------------------------

--
-- Structure de la table `music`
--

CREATE TABLE `music` (
  `id` int(11) NOT NULL,
  `album_id` int(11) DEFAULT NULL,
  `artiste_id` int(11) DEFAULT NULL,
  `genre_id` int(11) DEFAULT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nbre_visionnage` int(11) DEFAULT NULL,
  `lien_yt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sold` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `music`
--

INSERT INTO `music` (`id`, `album_id`, `artiste_id`, `genre_id`, `titre`, `nbre_visionnage`, `lien_yt`, `sold`) VALUES
(1, 1, 1, 1, 'Etre une femme', NULL, 'https://www.youtube.com/watch?v=suEm3aR-2Es', 0),
(2, 7, 6, 2, 'Back door man', NULL, 'https://www.youtube.com/watch?v=O6DAdDyWZaQ', 0),
(3, 6, 5, 2, 'Blues Boys Tune', NULL, 'https://www.youtube.com/watch?v=AU432SxopNM', 0),
(4, 5, 4, 3, 'Over The Rainbow', NULL, 'https://www.youtube.com/watch?v=PULQvLaXkQE', 0),
(5, 1, 1, 1, 'L\'Autre Femme', NULL, 'https://www.youtube.com/watch?v=bpEmjxobvbY', 0),
(6, 1, 1, 1, 'Le Mauvais Homme', NULL, 'https://www.youtube.com/watch?v=GuI1kG9HEtY', 0),
(7, 1, 1, 1, 'Préservation', NULL, 'https://www.youtube.com/watch?v=dwLH6jj8ovU', 0),
(8, 1, 1, 1, 'Les Mamans qui s\'en vont', NULL, 'https://www.youtube.com/watch?v=zNfyJxXcfp8', 0),
(9, 1, 1, 1, 'Musica', NULL, 'https://www.youtube.com/watch?v=mzHKVIOxUfY', 0),
(10, 1, 1, 1, 'Je viens du sud', NULL, 'https://www.youtube.com/watch?v=LXDlGvWukFk', 0),
(11, 1, 1, 1, 'Les Noces de mon père', NULL, 'https://www.youtube.com/watch?v=Y9qAbRCieaY', 0),
(12, 2, 3, 1, 'On ira', NULL, 'https://www.youtube.com/watch?v=8IjWHBGzsu4', 0),
(13, 2, 3, 1, 'Comme ci, comme ça', NULL, 'https://www.youtube.com/watch?v=08VaRJPktBA', 0),
(14, 2, 3, 1, 'Gamine', NULL, 'https://www.youtube.com/watch?v=2aoPrZR3gqM', 0),
(15, 2, 3, 1, 'T\'attends quoi', NULL, 'https://www.youtube.com/watch?v=g5HW3donKoU', 0),
(16, 2, 3, 1, 'La Lessive', NULL, 'https://www.youtube.com/watch?v=SPhbNf8hfNI', 0),
(17, 2, 3, 1, 'J\'ai tant escamoté', NULL, 'https://www.youtube.com/watch?v=NUsYE08fX1I', 0),
(18, 2, 3, 1, 'Déterre', NULL, 'https://www.youtube.com/watch?v=uvCYs67pVJE', 0),
(19, 2, 3, 1, 'Toujours', NULL, 'https://www.youtube.com/watch?v=tM8V9vLlnDc', 0),
(20, 2, 3, 1, 'Si je perds', NULL, 'https://www.youtube.com/watch?v=EqtnewZ1YZs', 0),
(21, 2, 3, 1, 'Si', NULL, 'https://www.youtube.com/watch?v=W4DTYmmTsyQ', 0),
(22, 2, 3, 1, 'Oublie Loulou', NULL, 'https://www.youtube.com/watch?v=3s5CrT1C44c', 0),
(23, 2, 3, 1, 'Cette journée', NULL, 'https://www.youtube.com/watch?v=jWJUhRLoN4w', 0),
(24, 2, 3, 1, 'Nous debout', NULL, 'https://www.youtube.com/watch?v=pOTcQ4v8qCM', 0),
(25, 2, 3, 1, 'La Lune', NULL, 'https://www.youtube.com/watch?v=72pHq1Ucz2w', 0),
(26, 2, 3, 1, 'La Part d\'ombre', NULL, 'https://www.youtube.com/results?search_query=la+part+d%27ombre+zaz', 0),
(27, 2, 3, 1, 'Le Retour du soleil', NULL, 'https://www.youtube.com/watch?v=i0oNMdV247k', 0),
(28, 2, 3, 1, 'Laissez-moi', NULL, 'https://www.youtube.com/watch?v=VJLuJS84QEU', 0),
(29, 3, 3, 1, 'Mon père', NULL, 'https://www.youtube.com/watch?v=O6DAdDyWZaQ', 0);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `email`, `roles`, `password`) VALUES
(9, 'olivierf@sfr.fr', '[\"ROLE_ADMIN\"]', '$2y$13$lFwCXx7A6slXRtPAsRiXK.OB.81V4qcLf2iFbhKvDPmdB5QxE5P8O'),
(11, 'fabienne@free.fr', '[]', '$2y$13$bECHE97gPF0T19FTfIC5Ius02WgF2VFHVqhd4HckmfPXKpnr27iyi'),
(12, 'hector@free.fr', '[]', '$2y$13$FKQmtyPda/ZpIRqHWuBY.ey2p5FNHtkYfzCdmox6MtMOosFrwbp5u'),
(14, 'Alain@laposte.fr', '[]', '$2y$13$fDcXfj/eEdFdVfzZ0kx9Iu8dL6KuJWR3astNhKJpxbrMg9xX3NZ8y'),
(20, 'Philippe@sfr.fr', '[]', '$2y$13$uDZoq2hl/RVoZA5uAlogEeFqc82AMWO6/g9uxugTGxu8hH/W2aHye'),
(22, 'rene@sfr.fr', '[]', '$2y$13$XdjgHBtEZ8yucduB3SATrOwV92r1mUa797fNFnPI0PNILxUEjS55S'),
(23, 'aze@sfr.fr', '[]', '$2y$13$ko1gsk09Lzh/N/ZkGBsf2.1XcljqVDXjMF9kP0AKC6oN9wVZp43F6'),
(29, 'Fabrice@sfr.fr', '[]', '$2y$13$xn1yy5d7s.2wJOBJUzHBMeT0YxzARgFQYfo.QIjyR8DbxSE/dWDmq'),
(36, 'Philippe@sfr.f', '[]', '$2y$13$uDAride7I1kKFqzt711iiO2w1X2UDYPyI6QLa0w0AKzHZy2k4S/lu'),
(41, 'joelle@amour.love', '[]', '$2y$13$Sxe6BPwYjTevR8MhE1BoEeA261Wer1H2A2etYjnZWwagzUu1wXjES'),
(42, 'fabien@de.fr', '[]', '$2y$13$rC6uHek371yNJHQ/yxLeKOFCeZuHcjVmtOIdn6vTLkUKaCrr4M0py'),
(43, 'denis@sfr.fr', '[]', '$2y$13$iY/X/qg6e6aqgb41xJcAFucmgV4mfEpwO.HPcMh11ZknYDom6Cc3.'),
(44, 'Val@sfr.fr', '[]', '$2y$13$p0uVJFJOrceQaNnYzRrmwOEArq0XeuEaA6Q.yC.FsMyHtVR6xwBfu'),
(45, 'muriel@sfr.fr', '[]', '$2y$13$ZQYmCikkmCCi.104MkUBPOZEpI9H/wm8rHTJW0Ei2MfFsmpsiGk0K'),
(46, 'isabelle@sfr.fr', '[]', '$2y$13$QHuUs2JLQOReOYve/tcAa.loQKqU3G9f2BTRL2dR4U9kfbrhjHkum'),
(47, 'jeanne@sfr.fr', '[]', '$2y$13$b6hx9P76aF2eq3b5prI/N.T.Lvusws116TMNU.2LRaEBoi/tqt8z.'),
(48, 'sdf@sfr.fr', '[]', '$2y$13$5tK7n67Eg5aPY/CsrWwkbumQ7PCN.6gwb9hQzMDOQ0k8yZODdYT8C'),
(49, 'sel@sfr.fr', '[]', '$2y$13$9LRdHdp5o96EbdeZ.q2w5.1IA3cZO3Sj4ObdKBRKBzcTr4CGbmYF6'),
(50, 'poivre@sfr.fr', '[]', '$2y$13$yO7G0T1EsCZN2rXB0HjpWOdIa/xXG1/A01Bu7UW2QWXlrJimogp2u'),
(51, 'souris@sfr.fr', '[]', '$2y$13$qfIFqRkJwtv1X56Xi7UsnuCiOadpo3Nyhuh2u/7DwGFIrkGyBPPDW'),
(52, 'AlainDupont@sfr.fr', '[]', '$2y$13$goCpLWhJ0f9b9cMLd0mNhuYSKY1QkC4cUO59.8yhKDfphJ0nP.3sW');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur_music`
--

CREATE TABLE `utilisateur_music` (
  `utilisateur_id` int(11) NOT NULL,
  `music_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `utilisateur_music`
--

INSERT INTO `utilisateur_music` (`utilisateur_id`, `music_id`) VALUES
(9, 2),
(9, 3),
(9, 4),
(12, 2),
(12, 3),
(12, 4),
(12, 10),
(12, 18),
(12, 26),
(52, 1),
(52, 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_39986E4321D25844` (`artiste_id`);

--
-- Index pour la table `artiste`
--
ALTER TABLE `artiste`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `music`
--
ALTER TABLE `music`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_CD52224A1137ABCF` (`album_id`),
  ADD KEY `IDX_CD52224A21D25844` (`artiste_id`),
  ADD KEY `IDX_CD52224A4296D31F` (`genre_id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1D1C63B3E7927C74` (`email`);

--
-- Index pour la table `utilisateur_music`
--
ALTER TABLE `utilisateur_music`
  ADD PRIMARY KEY (`utilisateur_id`,`music_id`),
  ADD KEY `IDX_B977A94FB88E14F` (`utilisateur_id`),
  ADD KEY `IDX_B977A94399BBB13` (`music_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `album`
--
ALTER TABLE `album`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `artiste`
--
ALTER TABLE `artiste`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `music`
--
ALTER TABLE `music`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `FK_39986E4321D25844` FOREIGN KEY (`artiste_id`) REFERENCES `artiste` (`id`);

--
-- Contraintes pour la table `music`
--
ALTER TABLE `music`
  ADD CONSTRAINT `FK_CD52224A1137ABCF` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`),
  ADD CONSTRAINT `FK_CD52224A21D25844` FOREIGN KEY (`artiste_id`) REFERENCES `artiste` (`id`),
  ADD CONSTRAINT `FK_CD52224A4296D31F` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`);

--
-- Contraintes pour la table `utilisateur_music`
--
ALTER TABLE `utilisateur_music`
  ADD CONSTRAINT `FK_B977A94399BBB13` FOREIGN KEY (`music_id`) REFERENCES `music` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_B977A94FB88E14F` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

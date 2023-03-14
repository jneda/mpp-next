-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 14 mars 2023 à 14:59
-- Version du serveur : 8.0.30
-- Version de PHP : 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `mypeacefulplace`
--

-- --------------------------------------------------------

--
-- Structure de la table `authors`
--

CREATE TABLE `authors` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `authors`
--

INSERT INTO `authors` (`id`, `name`) VALUES
(7, 'Pascal'),
(9, 'Coluche'),
(10, 'Confucius');

-- --------------------------------------------------------

--
-- Structure de la table `bgimages`
--

CREATE TABLE `bgimages` (
  `id` int NOT NULL,
  `imagePath` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `imageCredit` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `bgimages`
--

INSERT INTO `bgimages` (`id`, `imagePath`, `imageCredit`) VALUES
(1, 'amy-shamblen-qdPnQuGeuwU-unsplash.jpg', NULL),
(2, 'background-g3981561ff_1920.jpg', NULL),
(3, 'bg01.jpg', NULL),
(4, 'bg02.jpg', NULL),
(5, 'bg03h.jpg', NULL),
(6, 'butterfly-7612383_1920.jpg', NULL),
(7, 'camera-g2bba2c7a9_1920.jpg', NULL),
(8, 'cuff-gd85f0cec2_1920.jpg', NULL),
(9, 'david-clode-9Qw7qrx5uLc-unsplash.jpg', NULL),
(10, 'hd-wallpaper-gc1681c6a7_1920.jpg', NULL),
(11, 'julian-hochgesang-7SV4cz3UFEI-unsplash.jpg', NULL),
(12, 'lars-kuczynski-MEcR55ol3jM-unsplash.jpg', NULL),
(13, 'lotus-gf608a3415_1920.jpg', NULL),
(14, 'marguerite-729510_1920.jpg', NULL),
(15, 'pexels-simon-berger-1323550.jpg', NULL),
(16, 'pexels-ylanite-koppens-776652.jpg', NULL),
(17, 'tyler-nix-j3FidswVdQk-unsplash.jpg', NULL),
(18, 'valentin-beauvais-kDaxao_v_5o-unsplash.jpg', NULL),
(19, 'winter-7593872_1920.jpg', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `colors`
--

CREATE TABLE `colors` (
  `id` int NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `colors`
--

INSERT INTO `colors` (`id`, `color`) VALUES
(1, '#00000'),
(2, '#00000');

-- --------------------------------------------------------

--
-- Structure de la table `diaryentries`
--

CREATE TABLE `diaryentries` (
  `id` int NOT NULL,
  `content` text COLLATE utf8mb4_unicode_520_ci,
  `date` datetime NOT NULL,
  `update` datetime NOT NULL,
  `userId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `diaryentries`
--

INSERT INTO `diaryentries` (`id`, `content`, `date`, `update`, `userId`) VALUES
(1, 'Bonjour tout le monde !', '2023-02-26 15:16:44', '2023-02-26 15:16:44', 1),
(2, 'Note: penser à écrire des notes.', '2023-02-26 15:16:44', '2023-02-26 15:16:44', 1),
(3, 'Aloha ! ', '2023-03-13 08:48:27', '2023-03-13 08:48:27', 1);

-- --------------------------------------------------------

--
-- Structure de la table `fonts`
--

CREATE TABLE `fonts` (
  `id` int NOT NULL,
  `fontPath` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `fonts`
--

INSERT INTO `fonts` (`id`, `fontPath`) VALUES
(1, 'GreatVibes'),
(2, 'caveat');

-- --------------------------------------------------------

--
-- Structure de la table `moods`
--

CREATE TABLE `moods` (
  `id` int NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `quotecategories`
--

CREATE TABLE `quotecategories` (
  `id` int NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `quotelistquoteviews`
--

CREATE TABLE `quotelistquoteviews` (
  `quoteListId` int NOT NULL,
  `quoteViewId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `quotelists`
--

CREATE TABLE `quotelists` (
  `id` int NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `userId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `quotesourcequotecategories`
--

CREATE TABLE `quotesourcequotecategories` (
  `quoteSourceId` int NOT NULL,
  `quoteCategoryId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `quotesources`
--

CREATE TABLE `quotesources` (
  `id` int NOT NULL,
  `content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `authorId` int DEFAULT NULL,
  `userId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `quotesources`
--

INSERT INTO `quotesources` (`id`, `content`, `authorId`, `userId`) VALUES
(1, 'L’amour n’a point d’âge : il est toujours naissant.', 7, NULL),
(2, 'Sois fainéant, tu vivras content.', 9, NULL),
(3, 'La vie est vraiment simple, mais nous insistons pour la rendre compliquée.', 10, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `quoteviews`
--

CREATE TABLE `quoteviews` (
  `id` int NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `date` datetime NOT NULL,
  `quoteSourceId` int DEFAULT NULL,
  `quoteViewStyleId` int DEFAULT NULL,
  `userId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `quoteviews`
--

INSERT INTO `quoteviews` (`id`, `image`, `date`, `quoteSourceId`, `quoteViewStyleId`, `userId`) VALUES
(2, '7318106f-0aa0-43c5-b80f-21e56ae9de65.png', '2023-03-14 14:58:32', 3, 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `quoteviewstyles`
--

CREATE TABLE `quoteviewstyles` (
  `id` int NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `contentFontSize` float NOT NULL,
  `authorFontSize` float NOT NULL,
  `bgImageId` int DEFAULT NULL,
  `contentFontId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `authorFontId` int DEFAULT NULL,
  `contentColorId` int DEFAULT NULL,
  `authorColorId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `quoteviewstyles`
--

INSERT INTO `quoteviewstyles` (`id`, `label`, `contentFontSize`, `authorFontSize`, `bgImageId`, `contentFontId`, `userId`, `authorFontId`, `contentColorId`, `authorColorId`) VALUES
(1, 'valentin-beauvais-kDaxao_v_5o-unsplash', 2, 2, 18, 1, 1, 2, 1, 1),
(2, '3010cdfd-0a4d-41c9-9da9-010a709924e5', 2, 2, 5, 1, 1, 2, 1, 1),
(3, '7318106f-0aa0-43c5-b80f-21e56ae9de65', 2, 2, 5, 1, 1, 2, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `label`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Structure de la table `taskcategories`
--

CREATE TABLE `taskcategories` (
  `id` int NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tasks`
--

CREATE TABLE `tasks` (
  `id` int NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `approved` tinyint(1) DEFAULT '0',
  `taskCategoryId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `tasks`
--

INSERT INTO `tasks` (`id`, `content`, `approved`, `taskCategoryId`) VALUES
(1, 'Promener les poubelles', 0, NULL),
(2, 'Sortir le chien', 0, NULL),
(3, 'Se brosser les pâtes', 0, NULL),
(4, 'Cuire des dents', 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `usermoods`
--

CREATE TABLE `usermoods` (
  `date` datetime NOT NULL,
  `moodId` int NOT NULL,
  `userId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `userquotelists`
--

CREATE TABLE `userquotelists` (
  `quoteListId` int NOT NULL,
  `userId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `avatar` blob,
  `roleId` int DEFAULT NULL,
  `userStyleId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `avatar`, `roleId`, `userStyleId`) VALUES
(1, 'toto', 'toto@youpi.fr', '$2b$10$RSMAzwGnbm9xGL6Wyli1BeUX2IlnWptyG/DN0jnXqzDwpw.LaUDcC', NULL, NULL, NULL),
(2, 'otto', 'otto@youpi.fr', '$2b$10$EhAx1H2cFUYyRUXqmXklmuyUZZTo7vRLdSgy2NnU./.cIA9T190N2', NULL, NULL, NULL),
(3, 'dark_sasuke', 'kevin@dtc.lol', '$2b$10$BR4Oyiu8pX/SqVCv7rJLIeIURut/.R/jlUQwqL2EbA57iRIdsztIm', NULL, NULL, NULL),
(4, 'xena', 'xena@cmp.dtg', '$2b$10$sUPLaHbPvwe.gro1bjlEPeqKhP/Up0NJPrDyKj1SjzOcXkGq99Zd2', NULL, NULL, NULL),
(5, 'gabrielle', 'gabi@love.etc', '$2b$10$SdEH1QrCaAw5jBiH.b.Dwu.a04Z2JMHVRiKHuk8hSnbrhFZOZN8/a', NULL, NULL, NULL),
(6, 'gaston', 'lagaffe@dupuis.com', '$2b$10$wQ.DJAAAu2XBNlCmeCinluaF9fceECyfzS3B7eiOWXaaJ7BjCJRTa', NULL, 2, NULL),
(7, 'babar', 'babar@lajungle.org', '$2b$10$nz9z7I4Jc4Hi3RlGHKOWruk47J0c1HAoMdk/FUD8RfsJCqH04vXdC', NULL, 2, NULL),
(8, 'robocop', 'robocop@detroit.pd', '$2b$10$gdet54VgtF05chxEnL5FTelZ/BMZNhyBJrsTW1xcuWwvw21GCo7Nm', NULL, 2, NULL),
(9, 'pluto', 'pluto@ouaf.org', '$2b$10$ED0iVtwWnqCPS0gUuZFe5Ocrzj9rvWpSiFh1WkvinaEsYdARh4F4K', NULL, 2, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `userstyles`
--

CREATE TABLE `userstyles` (
  `id` int NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `bgImageId` int DEFAULT NULL,
  `fgColorId` int DEFAULT NULL,
  `bgColorId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `usertasks`
--

CREATE TABLE `usertasks` (
  `taskId` int NOT NULL,
  `userId` int NOT NULL,
  `checked` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `usertasks`
--

INSERT INTO `usertasks` (`taskId`, `userId`, `checked`) VALUES
(1, 1, 0),
(2, 1, 0),
(3, 1, 0),
(4, 1, 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `bgimages`
--
ALTER TABLE `bgimages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `diaryentries`
--
ALTER TABLE `diaryentries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Index pour la table `fonts`
--
ALTER TABLE `fonts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `moods`
--
ALTER TABLE `moods`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `quotecategories`
--
ALTER TABLE `quotecategories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `quotelistquoteviews`
--
ALTER TABLE `quotelistquoteviews`
  ADD PRIMARY KEY (`quoteListId`,`quoteViewId`),
  ADD KEY `quoteViewId` (`quoteViewId`);

--
-- Index pour la table `quotelists`
--
ALTER TABLE `quotelists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Index pour la table `quotesourcequotecategories`
--
ALTER TABLE `quotesourcequotecategories`
  ADD PRIMARY KEY (`quoteSourceId`,`quoteCategoryId`),
  ADD KEY `quoteCategoryId` (`quoteCategoryId`);

--
-- Index pour la table `quotesources`
--
ALTER TABLE `quotesources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `authorId` (`authorId`),
  ADD KEY `userId` (`userId`);

--
-- Index pour la table `quoteviews`
--
ALTER TABLE `quoteviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quoteSourceId` (`quoteSourceId`),
  ADD KEY `quoteViewStyleId` (`quoteViewStyleId`),
  ADD KEY `userId` (`userId`);

--
-- Index pour la table `quoteviewstyles`
--
ALTER TABLE `quoteviewstyles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bgImageId` (`bgImageId`),
  ADD KEY `contentFontId` (`contentFontId`),
  ADD KEY `userId` (`userId`),
  ADD KEY `authorFontId` (`authorFontId`),
  ADD KEY `contentColorId` (`contentColorId`),
  ADD KEY `authorColorId` (`authorColorId`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `taskcategories`
--
ALTER TABLE `taskcategories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taskCategoryId` (`taskCategoryId`);

--
-- Index pour la table `usermoods`
--
ALTER TABLE `usermoods`
  ADD PRIMARY KEY (`moodId`,`userId`),
  ADD KEY `userId` (`userId`);

--
-- Index pour la table `userquotelists`
--
ALTER TABLE `userquotelists`
  ADD PRIMARY KEY (`quoteListId`,`userId`),
  ADD KEY `userId` (`userId`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roleId` (`roleId`),
  ADD KEY `userStyleId` (`userStyleId`);

--
-- Index pour la table `userstyles`
--
ALTER TABLE `userstyles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bgImageId` (`bgImageId`),
  ADD KEY `fgColorId` (`fgColorId`),
  ADD KEY `bgColorId` (`bgColorId`);

--
-- Index pour la table `usertasks`
--
ALTER TABLE `usertasks`
  ADD PRIMARY KEY (`taskId`,`userId`),
  ADD KEY `userId` (`userId`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `bgimages`
--
ALTER TABLE `bgimages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `diaryentries`
--
ALTER TABLE `diaryentries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `fonts`
--
ALTER TABLE `fonts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `moods`
--
ALTER TABLE `moods`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `quotecategories`
--
ALTER TABLE `quotecategories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `quotelists`
--
ALTER TABLE `quotelists`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `quotesources`
--
ALTER TABLE `quotesources`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `quoteviews`
--
ALTER TABLE `quoteviews`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `quoteviewstyles`
--
ALTER TABLE `quoteviewstyles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `taskcategories`
--
ALTER TABLE `taskcategories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `userstyles`
--
ALTER TABLE `userstyles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `diaryentries`
--
ALTER TABLE `diaryentries`
  ADD CONSTRAINT `diaryentries_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `quotelistquoteviews`
--
ALTER TABLE `quotelistquoteviews`
  ADD CONSTRAINT `quotelistquoteviews_ibfk_1` FOREIGN KEY (`quoteListId`) REFERENCES `quotelists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `quotelistquoteviews_ibfk_2` FOREIGN KEY (`quoteViewId`) REFERENCES `quoteviews` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `quotelists`
--
ALTER TABLE `quotelists`
  ADD CONSTRAINT `quotelists_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `quotesourcequotecategories`
--
ALTER TABLE `quotesourcequotecategories`
  ADD CONSTRAINT `quotesourcequotecategories_ibfk_1` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `quotesourcequotecategories_ibfk_2` FOREIGN KEY (`quoteCategoryId`) REFERENCES `quotecategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `quotesources`
--
ALTER TABLE `quotesources`
  ADD CONSTRAINT `quotesources_ibfk_61` FOREIGN KEY (`authorId`) REFERENCES `authors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quotesources_ibfk_62` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `quoteviews`
--
ALTER TABLE `quoteviews`
  ADD CONSTRAINT `quoteviews_ibfk_1` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_10` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_11` FOREIGN KEY (`quoteViewStyleId`) REFERENCES `quoteviewstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_13` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_14` FOREIGN KEY (`quoteViewStyleId`) REFERENCES `quoteviewstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_16` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_17` FOREIGN KEY (`quoteViewStyleId`) REFERENCES `quoteviewstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_19` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_2` FOREIGN KEY (`quoteViewStyleId`) REFERENCES `quoteviewstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_20` FOREIGN KEY (`quoteViewStyleId`) REFERENCES `quoteviewstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_22` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_23` FOREIGN KEY (`quoteViewStyleId`) REFERENCES `quoteviewstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_25` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_26` FOREIGN KEY (`quoteViewStyleId`) REFERENCES `quoteviewstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_28` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_29` FOREIGN KEY (`quoteViewStyleId`) REFERENCES `quoteviewstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_31` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_32` FOREIGN KEY (`quoteViewStyleId`) REFERENCES `quoteviewstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_34` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_35` FOREIGN KEY (`quoteViewStyleId`) REFERENCES `quoteviewstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_37` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_38` FOREIGN KEY (`quoteViewStyleId`) REFERENCES `quoteviewstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_4` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_40` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_41` FOREIGN KEY (`quoteViewStyleId`) REFERENCES `quoteviewstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_43` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_44` FOREIGN KEY (`quoteViewStyleId`) REFERENCES `quoteviewstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_46` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_47` FOREIGN KEY (`quoteViewStyleId`) REFERENCES `quoteviewstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_49` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_5` FOREIGN KEY (`quoteViewStyleId`) REFERENCES `quoteviewstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_50` FOREIGN KEY (`quoteViewStyleId`) REFERENCES `quoteviewstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_52` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_53` FOREIGN KEY (`quoteViewStyleId`) REFERENCES `quoteviewstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_55` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_56` FOREIGN KEY (`quoteViewStyleId`) REFERENCES `quoteviewstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_58` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_59` FOREIGN KEY (`quoteViewStyleId`) REFERENCES `quoteviewstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_61` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_62` FOREIGN KEY (`quoteViewStyleId`) REFERENCES `quoteviewstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_64` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_65` FOREIGN KEY (`quoteViewStyleId`) REFERENCES `quoteviewstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_67` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_68` FOREIGN KEY (`quoteViewStyleId`) REFERENCES `quoteviewstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_7` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_70` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_71` FOREIGN KEY (`quoteViewStyleId`) REFERENCES `quoteviewstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_73` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_74` FOREIGN KEY (`quoteViewStyleId`) REFERENCES `quoteviewstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_76` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_77` FOREIGN KEY (`quoteViewStyleId`) REFERENCES `quoteviewstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_79` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_8` FOREIGN KEY (`quoteViewStyleId`) REFERENCES `quoteviewstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_80` FOREIGN KEY (`quoteViewStyleId`) REFERENCES `quoteviewstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_82` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_83` FOREIGN KEY (`quoteViewStyleId`) REFERENCES `quoteviewstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_84` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `quoteviewstyles`
--
ALTER TABLE `quoteviewstyles`
  ADD CONSTRAINT `quoteviewstyles_ibfk_1` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_101` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_107` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_113` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_119` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_125` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_131` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_137` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_143` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_149` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_155` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_161` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_165` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_17` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_171` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_177` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_178` FOREIGN KEY (`contentFontId`) REFERENCES `fonts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_179` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_180` FOREIGN KEY (`authorFontId`) REFERENCES `fonts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_181` FOREIGN KEY (`contentColorId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_182` FOREIGN KEY (`authorColorId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_25` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_33` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_41` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_49` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_53` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_59` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_65` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_71` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_77` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_83` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_89` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_9` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_95` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`taskCategoryId`) REFERENCES `taskcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_10` FOREIGN KEY (`taskCategoryId`) REFERENCES `taskcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_11` FOREIGN KEY (`taskCategoryId`) REFERENCES `taskcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_12` FOREIGN KEY (`taskCategoryId`) REFERENCES `taskcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_13` FOREIGN KEY (`taskCategoryId`) REFERENCES `taskcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_14` FOREIGN KEY (`taskCategoryId`) REFERENCES `taskcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_15` FOREIGN KEY (`taskCategoryId`) REFERENCES `taskcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_16` FOREIGN KEY (`taskCategoryId`) REFERENCES `taskcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_17` FOREIGN KEY (`taskCategoryId`) REFERENCES `taskcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_18` FOREIGN KEY (`taskCategoryId`) REFERENCES `taskcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_19` FOREIGN KEY (`taskCategoryId`) REFERENCES `taskcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`taskCategoryId`) REFERENCES `taskcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_20` FOREIGN KEY (`taskCategoryId`) REFERENCES `taskcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_21` FOREIGN KEY (`taskCategoryId`) REFERENCES `taskcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_22` FOREIGN KEY (`taskCategoryId`) REFERENCES `taskcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_23` FOREIGN KEY (`taskCategoryId`) REFERENCES `taskcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_24` FOREIGN KEY (`taskCategoryId`) REFERENCES `taskcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_25` FOREIGN KEY (`taskCategoryId`) REFERENCES `taskcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_26` FOREIGN KEY (`taskCategoryId`) REFERENCES `taskcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_27` FOREIGN KEY (`taskCategoryId`) REFERENCES `taskcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_3` FOREIGN KEY (`taskCategoryId`) REFERENCES `taskcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_4` FOREIGN KEY (`taskCategoryId`) REFERENCES `taskcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_5` FOREIGN KEY (`taskCategoryId`) REFERENCES `taskcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_6` FOREIGN KEY (`taskCategoryId`) REFERENCES `taskcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_7` FOREIGN KEY (`taskCategoryId`) REFERENCES `taskcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_8` FOREIGN KEY (`taskCategoryId`) REFERENCES `taskcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_9` FOREIGN KEY (`taskCategoryId`) REFERENCES `taskcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `usermoods`
--
ALTER TABLE `usermoods`
  ADD CONSTRAINT `usermoods_ibfk_1` FOREIGN KEY (`moodId`) REFERENCES `moods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usermoods_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `userquotelists`
--
ALTER TABLE `userquotelists`
  ADD CONSTRAINT `userquotelists_ibfk_1` FOREIGN KEY (`quoteListId`) REFERENCES `quotelists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userquotelists_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_10` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_12` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_14` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_16` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_18` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_20` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_22` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_24` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_26` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_28` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_30` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_32` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_34` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_36` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_38` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_4` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_40` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_42` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_44` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_46` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_48` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_50` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_52` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_54` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_56` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_58` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_6` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_60` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_61` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_62` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_8` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `userstyles`
--
ALTER TABLE `userstyles`
  ADD CONSTRAINT `userstyles_ibfk_1` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_10` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_100` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_103` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_104` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_105` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_108` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_109` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_112` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_115` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_118` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_121` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_124` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_127` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_128` FOREIGN KEY (`fgColorId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_129` FOREIGN KEY (`bgColorId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_13` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_16` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_19` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_22` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_25` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_28` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_30` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_31` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_33` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_37` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_38` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_4` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_41` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_43` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_44` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_47` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_50` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_51` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_54` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_55` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_58` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_61` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_62` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_65` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_68` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_7` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_71` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_74` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_77` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_80` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_82` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_85` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_88` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_91` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_94` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_97` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `usertasks`
--
ALTER TABLE `usertasks`
  ADD CONSTRAINT `usertasks_ibfk_1` FOREIGN KEY (`taskId`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usertasks_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

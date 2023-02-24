-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 24 fév. 2023 à 07:42
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

-- --------------------------------------------------------

--
-- Structure de la table `bgimages`
--

CREATE TABLE `bgimages` (
  `id` int NOT NULL,
  `imagePath` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `imageCredit` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `colors`
--

CREATE TABLE `colors` (
  `id` int NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

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
(1, 'Coucou je suis une page de journal test', '2023-02-23 10:20:26', '2023-02-23 10:20:26', 5);

-- --------------------------------------------------------

--
-- Structure de la table `fonts`
--

CREATE TABLE `fonts` (
  `id` int NOT NULL,
  `fontPath` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

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

-- --------------------------------------------------------

--
-- Structure de la table `quoteviewstyles`
--

CREATE TABLE `quoteviewstyles` (
  `id` int NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `contentFontSize` int NOT NULL,
  `authorFontSize` int NOT NULL,
  `bgImageId` int DEFAULT NULL,
  `contentFontId` int DEFAULT NULL,
  `fgColorId` int DEFAULT NULL,
  `fgFontId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `authorFontId` int DEFAULT NULL,
  `bgColorId` int DEFAULT NULL,
  `bgFontId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

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
(1, 'Faire quelque chose', 0, NULL),
(2, 'middleware sur next', 0, NULL),
(3, 'faire la page journal et To Do List', 0, NULL);

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
(4, 'userTest', 'testmail@mail.com', '$2b$10$wX6bMWgOGvvlTLrpo7RXNeFDXZmgcOSRf8FDa0vkDnyy0wOnLQ2rm', NULL, NULL, NULL),
(5, 'user2', 'test2@mail.com', '$2b$10$mm83KtuEuii7K5M.lYmJtuDmVmYh0IrkYYM4sogA9yFdQkZiBo/Py', NULL, NULL, NULL);

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
(1, 5, 0),
(2, 5, 0),
(3, 5, 0);

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
  ADD KEY `fgColorId` (`fgColorId`),
  ADD KEY `fgFontId` (`fgFontId`),
  ADD KEY `userId` (`userId`),
  ADD KEY `authorFontId` (`authorFontId`),
  ADD KEY `bgColorId` (`bgColorId`),
  ADD KEY `bgFontId` (`bgFontId`);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `bgimages`
--
ALTER TABLE `bgimages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `diaryentries`
--
ALTER TABLE `diaryentries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `fonts`
--
ALTER TABLE `fonts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `quoteviews`
--
ALTER TABLE `quoteviews`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `quoteviewstyles`
--
ALTER TABLE `quoteviewstyles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `taskcategories`
--
ALTER TABLE `taskcategories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  ADD CONSTRAINT `quotesources_ibfk_3` FOREIGN KEY (`authorId`) REFERENCES `authors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quotesources_ibfk_4` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `quoteviews`
--
ALTER TABLE `quoteviews`
  ADD CONSTRAINT `quoteviews_ibfk_1` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_2` FOREIGN KEY (`quoteViewStyleId`) REFERENCES `quoteviewstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_4` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_5` FOREIGN KEY (`quoteViewStyleId`) REFERENCES `quoteviewstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_6` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `quoteviewstyles`
--
ALTER TABLE `quoteviewstyles`
  ADD CONSTRAINT `quoteviewstyles_ibfk_1` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_10` FOREIGN KEY (`contentFontId`) REFERENCES `fonts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_11` FOREIGN KEY (`fgColorId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_12` FOREIGN KEY (`fgFontId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_13` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_14` FOREIGN KEY (`authorFontId`) REFERENCES `fonts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_15` FOREIGN KEY (`bgColorId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_16` FOREIGN KEY (`bgFontId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_9` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`taskCategoryId`) REFERENCES `taskcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`taskCategoryId`) REFERENCES `taskcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

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
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_3` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_4` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `userstyles`
--
ALTER TABLE `userstyles`
  ADD CONSTRAINT `userstyles_ibfk_1` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_4` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_5` FOREIGN KEY (`fgColorId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_6` FOREIGN KEY (`bgColorId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

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

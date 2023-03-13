-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 26, 2023 at 04:51 PM
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
-- Database: `mypeacefulplace`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `name`) VALUES
(7, 'Pascal'),
(9, 'Coluche'),
(10, 'Confucius');

-- --------------------------------------------------------

--
-- Table structure for table `bgimages`
--

CREATE TABLE `bgimages` (
  `id` int NOT NULL,
  `imagePath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `imageCredit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int NOT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `diaryentries`
--

CREATE TABLE `diaryentries` (
  `id` int NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `date` datetime NOT NULL,
  `update` datetime NOT NULL,
  `userId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `diaryentries`
--

INSERT INTO `diaryentries` (`id`, `content`, `date`, `update`, `userId`) VALUES
(1, 'Bonjour tout le monde !', '2023-02-26 15:16:44', '2023-02-26 15:16:44', 1),
(2, 'Note: penser à écrire des notes.', '2023-02-26 15:16:44', '2023-02-26 15:16:44', 1);

-- --------------------------------------------------------

--
-- Table structure for table `fonts`
--

CREATE TABLE `fonts` (
  `id` int NOT NULL,
  `fontPath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `moods`
--

CREATE TABLE `moods` (
  `id` int NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotecategories`
--

CREATE TABLE `quotecategories` (
  `id` int NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotelistquoteviews`
--

CREATE TABLE `quotelistquoteviews` (
  `quoteListId` int NOT NULL,
  `quoteViewId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotelists`
--

CREATE TABLE `quotelists` (
  `id` int NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `userId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotesourcequotecategories`
--

CREATE TABLE `quotesourcequotecategories` (
  `quoteSourceId` int NOT NULL,
  `quoteCategoryId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotesources`
--

CREATE TABLE `quotesources` (
  `id` int NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `authorId` int DEFAULT NULL,
  `userId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `quotesources`
--

INSERT INTO `quotesources` (`id`, `content`, `authorId`, `userId`) VALUES
(1, 'L’amour n’a point d’âge : il est toujours naissant.', 7, NULL),
(2, 'Sois fainéant, tu vivras content.', 9, NULL),
(3, 'La vie est vraiment simple, mais nous insistons pour la rendre compliquée.', 10, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quoteviews`
--

CREATE TABLE `quoteviews` (
  `id` int NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `date` datetime NOT NULL,
  `quoteSourceId` int DEFAULT NULL,
  `quoteViewStyleId` int DEFAULT NULL,
  `userId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quoteviewstyles`
--

CREATE TABLE `quoteviewstyles` (
  `id` int NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
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
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `label`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `taskcategories`
--

CREATE TABLE `taskcategories` (
  `id` int NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int NOT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `approved` tinyint(1) DEFAULT '0',
  `taskCategoryId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `content`, `approved`, `taskCategoryId`) VALUES
(1, 'Promener les poubelles', 0, NULL),
(2, 'Sortir le chien', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `usermoods`
--

CREATE TABLE `usermoods` (
  `date` datetime NOT NULL,
  `moodId` int NOT NULL,
  `userId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userquotelists`
--

CREATE TABLE `userquotelists` (
  `quoteListId` int NOT NULL,
  `userId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `avatar` blob,
  `roleId` int DEFAULT NULL,
  `userStyleId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `avatar`, `roleId`, `userStyleId`) VALUES
(1, 'toto', 'toto@youpi.fr', '$2b$10$RSMAzwGnbm9xGL6Wyli1BeUX2IlnWptyG/DN0jnXqzDwpw.LaUDcC', NULL, NULL, NULL),
(2, 'otto', 'otto@youpi.fr', '$2b$10$EhAx1H2cFUYyRUXqmXklmuyUZZTo7vRLdSgy2NnU./.cIA9T190N2', NULL, NULL, NULL),
(3, 'dark_sasuke', 'kevin@dtc.lol', '$2b$10$BR4Oyiu8pX/SqVCv7rJLIeIURut/.R/jlUQwqL2EbA57iRIdsztIm', NULL, NULL, NULL),
(4, 'xena', 'xena@cmp.dtg', '$2b$10$sUPLaHbPvwe.gro1bjlEPeqKhP/Up0NJPrDyKj1SjzOcXkGq99Zd2', NULL, NULL, NULL),
(5, 'gabrielle', 'gabi@love.etc', '$2b$10$SdEH1QrCaAw5jBiH.b.Dwu.a04Z2JMHVRiKHuk8hSnbrhFZOZN8/a', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userstyles`
--

CREATE TABLE `userstyles` (
  `id` int NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `bgImageId` int DEFAULT NULL,
  `fgColorId` int DEFAULT NULL,
  `bgColorId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usertasks`
--

CREATE TABLE `usertasks` (
  `taskId` int NOT NULL,
  `userId` int NOT NULL,
  `checked` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `usertasks`
--

INSERT INTO `usertasks` (`taskId`, `userId`, `checked`) VALUES
(1, 1, 0),
(2, 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bgimages`
--
ALTER TABLE `bgimages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diaryentries`
--
ALTER TABLE `diaryentries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `fonts`
--
ALTER TABLE `fonts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moods`
--
ALTER TABLE `moods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotecategories`
--
ALTER TABLE `quotecategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotelistquoteviews`
--
ALTER TABLE `quotelistquoteviews`
  ADD PRIMARY KEY (`quoteListId`,`quoteViewId`),
  ADD KEY `quoteViewId` (`quoteViewId`);

--
-- Indexes for table `quotelists`
--
ALTER TABLE `quotelists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `quotesourcequotecategories`
--
ALTER TABLE `quotesourcequotecategories`
  ADD PRIMARY KEY (`quoteSourceId`,`quoteCategoryId`),
  ADD KEY `quoteCategoryId` (`quoteCategoryId`);

--
-- Indexes for table `quotesources`
--
ALTER TABLE `quotesources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `authorId` (`authorId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `quoteviews`
--
ALTER TABLE `quoteviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quoteSourceId` (`quoteSourceId`),
  ADD KEY `quoteViewStyleId` (`quoteViewStyleId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `quoteviewstyles`
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
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taskcategories`
--
ALTER TABLE `taskcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taskCategoryId` (`taskCategoryId`);

--
-- Indexes for table `usermoods`
--
ALTER TABLE `usermoods`
  ADD PRIMARY KEY (`moodId`,`userId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `userquotelists`
--
ALTER TABLE `userquotelists`
  ADD PRIMARY KEY (`quoteListId`,`userId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roleId` (`roleId`),
  ADD KEY `userStyleId` (`userStyleId`);

--
-- Indexes for table `userstyles`
--
ALTER TABLE `userstyles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bgImageId` (`bgImageId`),
  ADD KEY `fgColorId` (`fgColorId`),
  ADD KEY `bgColorId` (`bgColorId`);

--
-- Indexes for table `usertasks`
--
ALTER TABLE `usertasks`
  ADD PRIMARY KEY (`taskId`,`userId`),
  ADD KEY `userId` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `bgimages`
--
ALTER TABLE `bgimages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `diaryentries`
--
ALTER TABLE `diaryentries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fonts`
--
ALTER TABLE `fonts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `moods`
--
ALTER TABLE `moods`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotecategories`
--
ALTER TABLE `quotecategories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotelists`
--
ALTER TABLE `quotelists`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotesources`
--
ALTER TABLE `quotesources`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `quoteviews`
--
ALTER TABLE `quoteviews`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quoteviewstyles`
--
ALTER TABLE `quoteviewstyles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `taskcategories`
--
ALTER TABLE `taskcategories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `userstyles`
--
ALTER TABLE `userstyles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `diaryentries`
--
ALTER TABLE `diaryentries`
  ADD CONSTRAINT `diaryentries_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `diaryentries_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `diaryentries_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `diaryentries_ibfk_4` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `diaryentries_ibfk_5` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `diaryentries_ibfk_6` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `quotelistquoteviews`
--
ALTER TABLE `quotelistquoteviews`
  ADD CONSTRAINT `quotelistquoteviews_ibfk_1` FOREIGN KEY (`quoteListId`) REFERENCES `quotelists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `quotelistquoteviews_ibfk_2` FOREIGN KEY (`quoteViewId`) REFERENCES `quoteviews` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quotelists`
--
ALTER TABLE `quotelists`
  ADD CONSTRAINT `quotelists_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quotelists_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quotelists_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quotelists_ibfk_4` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quotelists_ibfk_5` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quotelists_ibfk_6` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `quotesourcequotecategories`
--
ALTER TABLE `quotesourcequotecategories`
  ADD CONSTRAINT `quotesourcequotecategories_ibfk_1` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `quotesourcequotecategories_ibfk_2` FOREIGN KEY (`quoteCategoryId`) REFERENCES `quotecategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quotesources`
--
ALTER TABLE `quotesources`
  ADD CONSTRAINT `quotesources_ibfk_1` FOREIGN KEY (`authorId`) REFERENCES `authors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quotesources_ibfk_10` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quotesources_ibfk_11` FOREIGN KEY (`authorId`) REFERENCES `authors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quotesources_ibfk_12` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quotesources_ibfk_13` FOREIGN KEY (`authorId`) REFERENCES `authors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quotesources_ibfk_14` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quotesources_ibfk_15` FOREIGN KEY (`authorId`) REFERENCES `authors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quotesources_ibfk_16` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quotesources_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quotesources_ibfk_3` FOREIGN KEY (`authorId`) REFERENCES `authors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quotesources_ibfk_4` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quotesources_ibfk_5` FOREIGN KEY (`authorId`) REFERENCES `authors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quotesources_ibfk_6` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quotesources_ibfk_7` FOREIGN KEY (`authorId`) REFERENCES `authors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quotesources_ibfk_8` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quotesources_ibfk_9` FOREIGN KEY (`authorId`) REFERENCES `authors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `quoteviews`
--
ALTER TABLE `quoteviews`
  ADD CONSTRAINT `quoteviews_ibfk_1` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_10` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_11` FOREIGN KEY (`quoteViewStyleId`) REFERENCES `quoteviewstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_12` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_13` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_14` FOREIGN KEY (`quoteViewStyleId`) REFERENCES `quoteviewstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_15` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_16` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_17` FOREIGN KEY (`quoteViewStyleId`) REFERENCES `quoteviewstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_18` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_2` FOREIGN KEY (`quoteViewStyleId`) REFERENCES `quoteviewstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_4` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_5` FOREIGN KEY (`quoteViewStyleId`) REFERENCES `quoteviewstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_6` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_7` FOREIGN KEY (`quoteSourceId`) REFERENCES `quotesources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_8` FOREIGN KEY (`quoteViewStyleId`) REFERENCES `quoteviewstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviews_ibfk_9` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `quoteviewstyles`
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
  ADD CONSTRAINT `quoteviewstyles_ibfk_17` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_18` FOREIGN KEY (`contentFontId`) REFERENCES `fonts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_19` FOREIGN KEY (`fgColorId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_2` FOREIGN KEY (`contentFontId`) REFERENCES `fonts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_20` FOREIGN KEY (`fgFontId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_21` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_22` FOREIGN KEY (`authorFontId`) REFERENCES `fonts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_23` FOREIGN KEY (`bgColorId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_24` FOREIGN KEY (`bgFontId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_25` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_26` FOREIGN KEY (`contentFontId`) REFERENCES `fonts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_27` FOREIGN KEY (`fgColorId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_28` FOREIGN KEY (`fgFontId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_29` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_3` FOREIGN KEY (`fgColorId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_30` FOREIGN KEY (`authorFontId`) REFERENCES `fonts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_31` FOREIGN KEY (`bgColorId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_32` FOREIGN KEY (`bgFontId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_33` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_34` FOREIGN KEY (`contentFontId`) REFERENCES `fonts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_35` FOREIGN KEY (`fgColorId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_36` FOREIGN KEY (`fgFontId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_37` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_38` FOREIGN KEY (`authorFontId`) REFERENCES `fonts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_39` FOREIGN KEY (`bgColorId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_4` FOREIGN KEY (`fgFontId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_40` FOREIGN KEY (`bgFontId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_41` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_42` FOREIGN KEY (`contentFontId`) REFERENCES `fonts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_43` FOREIGN KEY (`fgColorId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_44` FOREIGN KEY (`fgFontId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_45` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_46` FOREIGN KEY (`authorFontId`) REFERENCES `fonts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_47` FOREIGN KEY (`bgColorId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_48` FOREIGN KEY (`bgFontId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_5` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_6` FOREIGN KEY (`authorFontId`) REFERENCES `fonts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_7` FOREIGN KEY (`bgColorId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_8` FOREIGN KEY (`bgFontId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quoteviewstyles_ibfk_9` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`taskCategoryId`) REFERENCES `taskcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`taskCategoryId`) REFERENCES `taskcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_3` FOREIGN KEY (`taskCategoryId`) REFERENCES `taskcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_4` FOREIGN KEY (`taskCategoryId`) REFERENCES `taskcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_5` FOREIGN KEY (`taskCategoryId`) REFERENCES `taskcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_6` FOREIGN KEY (`taskCategoryId`) REFERENCES `taskcategories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `usermoods`
--
ALTER TABLE `usermoods`
  ADD CONSTRAINT `usermoods_ibfk_1` FOREIGN KEY (`moodId`) REFERENCES `moods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usermoods_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `userquotelists`
--
ALTER TABLE `userquotelists`
  ADD CONSTRAINT `userquotelists_ibfk_1` FOREIGN KEY (`quoteListId`) REFERENCES `quotelists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userquotelists_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_10` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_11` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_12` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_13` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_14` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_15` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_16` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_3` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_4` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_5` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_6` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_7` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_8` FOREIGN KEY (`userStyleId`) REFERENCES `userstyles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_9` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `userstyles`
--
ALTER TABLE `userstyles`
  ADD CONSTRAINT `userstyles_ibfk_1` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_10` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_11` FOREIGN KEY (`fgColorId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_12` FOREIGN KEY (`bgColorId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_13` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_14` FOREIGN KEY (`fgColorId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_15` FOREIGN KEY (`bgColorId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_16` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_17` FOREIGN KEY (`fgColorId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_18` FOREIGN KEY (`bgColorId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_19` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_2` FOREIGN KEY (`fgColorId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_20` FOREIGN KEY (`fgColorId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_21` FOREIGN KEY (`bgColorId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_22` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_23` FOREIGN KEY (`fgColorId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_24` FOREIGN KEY (`bgColorId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_25` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_26` FOREIGN KEY (`fgColorId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_27` FOREIGN KEY (`bgColorId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_3` FOREIGN KEY (`bgColorId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_4` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_5` FOREIGN KEY (`fgColorId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_6` FOREIGN KEY (`bgColorId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_7` FOREIGN KEY (`bgImageId`) REFERENCES `bgimages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_8` FOREIGN KEY (`fgColorId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `userstyles_ibfk_9` FOREIGN KEY (`bgColorId`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `usertasks`
--
ALTER TABLE `usertasks`
  ADD CONSTRAINT `usertasks_ibfk_1` FOREIGN KEY (`taskId`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usertasks_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

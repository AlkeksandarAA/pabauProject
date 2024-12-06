-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2024 at 09:46 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pabau_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Team Player'),
(2, 'Culture Champion'),
(3, 'Difference Maker'),
(4, 'Makes Work Fun');

-- --------------------------------------------------------

--
-- Table structure for table `nominees`
--

CREATE TABLE `nominees` (
  `id` tinyint(4) NOT NULL,
  `category_id` tinyint(4) NOT NULL,
  `user_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nominees`
--

INSERT INTO `nominees` (`id`, `category_id`, `user_id`) VALUES
(1, 3, 2),
(2, 4, 1),
(3, 2, 5),
(4, 3, 7),
(7, 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` smallint(6) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`) VALUES
(1, 'Aleksandar', 'Atanasovski', 'aleksandaratanasovski43@gmail.com'),
(2, 'john', 'doe', 'john@example.com'),
(3, 'Jenny', 'Doe', 'jenny@example.com'),
(4, 'Michael', 'Peters', 'Michael@example.com'),
(5, 'Trevor', 'Brook', 'Trevor@example.com'),
(6, 'Franklin', 'Brook', 'frankiln@example.com'),
(7, 'Ivy', 'Oconnell', 'ivy@example.com'),
(8, 'Robert', 'Fails', 'robert@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `user_vote_nominee`
--

CREATE TABLE `user_vote_nominee` (
  `id` int(11) NOT NULL,
  `nominee_id` smallint(6) DEFAULT NULL,
  `user_id` smallint(6) DEFAULT NULL,
  `time_vote` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `voter_comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_vote_nominee`
--

INSERT INTO `user_vote_nominee` (`id`, `nominee_id`, `user_id`, `time_vote`, `voter_comment`) VALUES
(1, 6, 1, '2024-12-06 20:37:26', ''),
(2, 6, 1, '2024-12-06 20:38:14', ''),
(3, 5, 1, '2024-12-06 20:42:14', ''),
(4, 7, 1, '2024-12-06 20:42:14', ''),
(5, 7, 1, '2024-12-06 20:44:45', ''),
(6, 6, 1, '2024-12-06 20:45:05', 'asdasdasdsa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nominees`
--
ALTER TABLE `nominees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_vote_nominee`
--
ALTER TABLE `user_vote_nominee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nominee_id` (`nominee_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `nominees`
--
ALTER TABLE `nominees`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_vote_nominee`
--
ALTER TABLE `user_vote_nominee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `nominees`
--
ALTER TABLE `nominees`
  ADD CONSTRAINT `nominees_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nominees_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_vote_nominee`
--
ALTER TABLE `user_vote_nominee`
  ADD CONSTRAINT `user_vote_nominee_ibfk_1` FOREIGN KEY (`nominee_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_vote_nominee_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 01, 2019 at 01:01 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `api_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `access_tokens`
--

CREATE TABLE `access_tokens` (
  `id` int(11) NOT NULL,
  `access_token` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `page_number` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `access_tokens`
--

INSERT INTO `access_tokens` (`id`, `access_token`, `user_id`, `account_id`, `channel_id`, `page_number`, `created`, `updated`) VALUES
(1, 'EAAGNO4a7r2wBAG4LBVQmplZA6X3aomFkHHlFsQ0Vs38joq2jity1DSRCnX7Lc901aY8PEa44zkbTuegPavOa5R0Ke6YHBQAA4j3f0lfdi2cNSMUYdXAUUZATNFb0zcOj5PSHM5AQQWDZAyD19ZAaMsn2yZCTFhJatF0trIp1nmN06PTewwcsD', 1, 1, 1, 1, '2019-10-31 21:56:42', '2019-10-31 21:56:42'),
(2, 'EAAGNO4a7r2wBANJ6r35PZALBZCLq4zSyNwXRPZBBRWHfjnSYK4bIqDXrOJ5v64pAYJZCZByEkeKpAAOOFkqnyjwBZCZCgB0Wk4lPgYkRxapbWycn9Thgvsg9StMVRg5Xm0qlRQkSQWQF4i5zKcnBqB5q10eLBnY6zEl4eddYWzpT0hcU0VehGSQ', 1, 1, 3, 2, '2019-10-31 23:12:19', '2019-10-31 23:12:19'),
(3, 'EAAGNO4a7r2wBAOk7bXR0UZBQhkuNCZCFTWTZBRnwOB6YvajkNbfnxwruTsU2nWtnsK5t8srhUVyJBNlb8sUdW4NPw9aVBueZBJZAzqQiSTFo2VwaaZAVC5vZBb6751bEnytI3URKrYfWTQaiTDY9hHW2MZBhYRr6u9sRSvhqkj9zBAZDZD', 1, 2, 4, 1, '2019-11-01 06:45:57', '2019-11-01 06:45:57'),
(4, 'EAAGNO4a7r2wBAFKLUVTyKCloiAYqhlwYVo8EP3Jj34JaJFHjiKuk5EFKBQBFm39zyHVt5PDoqjwApzXpFZCG4yGMc9envo0AOZBTka6yi5CqzKqqc57h953AdiZAcFGXukL4u6piEUrjoPPDeFW6Fl3g67nr58giRqqrwVEkgZDZD', 1, 2, 5, 2, '2019-11-01 06:46:41', '2019-11-01 06:46:41');

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `stt` int(11) NOT NULL,
  `info` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `user_id`, `stt`, `info`) VALUES
(1, 1, 1, 'info');

-- --------------------------------------------------------

--
-- Table structure for table `channels`
--

CREATE TABLE `channels` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `channels`
--

INSERT INTO `channels` (`id`, `user_id`, `source`, `status`, `created`, `updated`) VALUES
(1, 1, 'UCgSMDG8aGE3YHfBCXHuPpYA', 1, '2019-10-31 21:57:26', '2019-10-31 21:57:26'),
(3, 1, 'UCOnIJiQuk1fDSp6p1GCZy3A', 1, '2019-10-31 22:56:27', '2019-10-31 22:56:27'),
(4, 1, 'UCV306eHqgo0LvBf3Mh36AHg', 1, '2019-11-01 06:45:05', '2019-11-01 06:45:05'),
(5, 1, 'UC5tuYcCdiKuF5Y2ZonuarwA', 1, '2019-11-01 06:45:24', '2019-11-01 06:45:24');

-- --------------------------------------------------------

--
-- Table structure for table `datas`
--

CREATE TABLE `datas` (
  `id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `video_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `datas`
--

INSERT INTO `datas` (`id`, `channel_id`, `video_id`) VALUES
(7, 1, 'pnnjBldsJnk'),
(8, 1, 'LyM1qZKN_6o'),
(9, 3, 'HbQnslvfnnQ'),
(10, 1, 'zFMRf8beQ5I'),
(11, 3, 'gomqQek5t14'),
(12, 1, 'X86n9iqv65M'),
(13, 3, 'iUNRDLtwiuY'),
(14, 1, '2qrBacIbQDE'),
(15, 3, 'eSWWa-NEsZc'),
(16, 3, 'JwTZbldYdCw'),
(17, 1, '9QlVTf7inOs'),
(18, 3, '8tZCMvds4Dc'),
(19, 1, 'eTMcfznCbi0'),
(20, 3, '0JycWQpByqE'),
(21, 1, 'WwCdX9m54ec'),
(22, 3, 'ZFWIIewpFaY'),
(23, 1, 'vmVkNoLLXek'),
(24, 5, 'kzc6iFQPddc'),
(25, 4, 'HSu2yHShAEc');

-- --------------------------------------------------------

--
-- Table structure for table `securities`
--

CREATE TABLE `securities` (
  `id` int(11) NOT NULL,
  `key` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `securities`
--

INSERT INTO `securities` (`id`, `key`, `user_id`, `created`, `updated`) VALUES
(1, 'key123', 1, '2019-10-13 17:19:20', '2019-10-13 17:19:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_tokens`
--
ALTER TABLE `access_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `channels`
--
ALTER TABLE `channels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `datas`
--
ALTER TABLE `datas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `securities`
--
ALTER TABLE `securities`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_tokens`
--
ALTER TABLE `access_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `channels`
--
ALTER TABLE `channels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `datas`
--
ALTER TABLE `datas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `securities`
--
ALTER TABLE `securities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

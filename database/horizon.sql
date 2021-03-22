-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 22, 2021 at 10:02 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `horizon`
--

-- --------------------------------------------------------

--
-- Table structure for table `channeling`
--

CREATE TABLE `channeling` (
  `p_id` int(11) NOT NULL,
  `d_id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'R',
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `channeling`
--

INSERT INTO `channeling` (`p_id`, `d_id`, `number`, `status`, `timestamp`) VALUES
(0, 0, 0, 'S', '2021-03-08 16:57:19'),
(3, 5, 1, 'C', '2021-03-08 16:57:19'),
(3, 5, 3, 'C', '2021-03-08 16:57:19'),
(3, 5, 4, 'C', '2021-03-08 16:58:08'),
(3, 5, 5, 'C', '2021-03-14 16:10:37'),
(3, 5, 6, 'C', '2021-03-14 16:11:39'),
(3, 5, 7, 'R', '2021-03-14 16:47:55'),
(3, 5, 8, 'R', '2021-03-14 16:50:55'),
(3, 5, 9, 'R', '2021-03-14 17:06:15'),
(3, 5, 10, 'R', '2021-03-14 17:08:46'),
(3, 5, 11, 'R', '2021-03-14 17:10:56'),
(3, 5, 13, 'R', '2021-03-19 07:54:18'),
(3, 5, 14, 'R', '2021-03-19 07:56:30'),
(3, 5, 15, 'R', '2021-03-19 07:59:47'),
(3, 5, 16, 'R', '2021-03-20 14:01:59'),
(30, 5, 12, 'R', '2021-03-16 16:36:49');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `s_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`id`, `name`, `s_id`) VALUES
(1, 'D M Munasinghe', 3),
(2, 'M Rajapaksha', 2);

-- --------------------------------------------------------

--
-- Table structure for table `specelist`
--

CREATE TABLE `specelist` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `specelist`
--

INSERT INTO `specelist` (`id`, `name`) VALUES
(1, 'Allergy and immunologyAnesthesiology'),
(2, 'Anesthesiology'),
(3, 'Dermatology');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `telephone` int(13) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL DEFAULT 'admin',
  `nic` varchar(13) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `age` int(3) NOT NULL,
  `address` text NOT NULL,
  `type` varchar(1) NOT NULL DEFAULT 'P',
  `s_id` int(11) DEFAULT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `telephone`, `email`, `password`, `nic`, `gender`, `age`, `address`, `type`, `s_id`, `status`) VALUES
(1, 'webmaster', 0, 'webmaster@horizen.lk', '21232F297A57A5A743894A0E4A801FC3', '0', 'M', 0, '0', 'W', NULL, 'N'),
(2, 'manuja', 777833833, 'manuja@gmail.com', 'A6A279ABE0B97FF31094A6B074DAFBC5', '997603346V', 'M', 22, '15/1, Sellige Watta, Ampitiya, Kandy, Sri Lanka.', 'S', NULL, 'N'),
(3, 'SANJANA SULAKSHANA WITHARANAGE', 771994147, 'sanjanasulakshanawitharanage@gmail.com', '47E68A6A7F8C3F0589C37C68237880EB', '993581089V', 'M', 22, '15/1, Sellige Wattha', 'P', NULL, 'A'),
(4, 'D M Munasinghe', 778162644, 'munasinge@horizon.lk', '3E932C5349BA40C139A6EBE0B20ADC35', '00000000000', 'M', 37, 'lovers steet, peradeniya', 'D', 3, 'A'),
(5, 'M Rajapakshe', 0, 'mahinda@horizon.lk', 'EAFE15705DC69D6020C170E5B3BC2D6B', '00000000000', 'M', 78, 'hambanthota', 'D', 2, 'A'),
(30, 'SANJANA SULAKSHANA WITHARANAGE', 771994147, 'sanjanasulakshana@outlook.com', 'C5990A201E678B5FF2D3AD5091753F2F', '993581089V', 'M', 22, '15/1, Sellige Watta, Ampitiya, Kandy, Sri Lanka.', 'P', NULL, 'A'),
(32, 'SANJANA SANJANA', 771994147, 'sanjanasulakshana@outlook.com', '06A5622A55DAD9D1BE1345CD77393CB9', '993581089V', 'M', 22, '15/1, Sellige Watta, Ampitiya, Kandy, Sri Lanka.', 'P', NULL, 'A'),
(33, 'Indula Bandara', 771876223, 'indulabandara73@gmail.com', 'C01DAE268A171DEF88259463739BD8FE', '981372940v', 'M', 23, '1st lane, kurunagala.', 'P', NULL, 'N');

-- --------------------------------------------------------

--
-- Table structure for table `verify`
--

CREATE TABLE `verify` (
  `email` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `exp` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `verify`
--

INSERT INTO `verify` (`email`, `key`, `exp`) VALUES
('sanjanasulakshanawitharanage@gmail.com', '4FE87BDA579E7C5ED24F4BF3D8B7C278', '2021-03-17'),
('sanjanasulakshanawitharanage@gmail.com', '4FE87BDA579E7C5ED24F4BF3D8B7C278', '2021-03-17'),
('sanjanasulakshanawitharanage@gmail.com', '4FE87BDA579E7C5ED24F4BF3D8B7C278', '2021-03-17'),
('indulabandara73@gmail.com', 'F9FC6C9DEECD930D387C3289936F6E45', '2021-03-23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `channeling`
--
ALTER TABLE `channeling`
  ADD PRIMARY KEY (`p_id`,`d_id`,`number`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `s_id` (`s_id`);

--
-- Indexes for table `specelist`
--
ALTER TABLE `specelist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `id_2` (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `specelist`
--
ALTER TABLE `specelist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`s_id`) REFERENCES `specelist` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

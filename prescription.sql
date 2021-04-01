-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 01, 2021 at 11:40 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prescription`
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
(0, 0, 0, 'S', '2021-03-08 11:27:19'),
(3, 5, 1, 'C', '2021-03-08 11:27:19'),
(3, 5, 3, 'C', '2021-03-08 11:27:19'),
(3, 5, 4, 'C', '2021-03-08 11:28:08'),
(3, 5, 5, 'C', '2021-03-14 10:40:37'),
(3, 5, 6, 'C', '2021-03-14 10:41:39'),
(3, 5, 7, 'R', '2021-03-14 11:17:55'),
(3, 5, 8, 'R', '2021-03-14 11:20:55'),
(3, 5, 9, 'R', '2021-03-14 11:36:15'),
(3, 5, 10, 'R', '2021-03-14 11:38:46'),
(3, 5, 11, 'R', '2021-03-14 11:40:56'),
(3, 5, 13, 'R', '2021-03-19 02:24:18'),
(3, 5, 14, 'R', '2021-03-19 02:26:30'),
(3, 5, 15, 'R', '2021-03-19 02:29:47'),
(3, 5, 16, 'R', '2021-03-20 08:31:59'),
(30, 5, 12, 'R', '2021-03-16 11:06:49');

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
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `CVC` varchar(255) NOT NULL,
  `Expires` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `drugname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `name`, `CVC`, `Expires`, `price`, `drugname`) VALUES
(2, 'indula', '123', '13/03/2021', '250', 'Abacavir'),
(3, 'indula', '545', '13/03/2021', '250', 'Abacavir'),
(4, 'indula', '567', '13/03/2021', '250', 'Abacavir'),
(5, 'indula', '344', '13/03/2021', '250', 'Abacavir'),
(6, 'indula', '344', '13/03/2021', '250', 'Abacavir'),
(7, 'indula', '456', '13/03/2021', '250', 'Abacavir'),
(8, 'Kavindu silva', '234', '13/03/2021', '225', 'Abacavir'),
(9, 'Movini', '123', '13/03/2021', '225', 'Abacavir'),
(10, 'monn', '321', '2025-03-18T23:15', '175', 'Atovaquone');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `id` int(11) NOT NULL,
  `doc_name` varchar(255) NOT NULL,
  `pname` varchar(255) NOT NULL,
  `drug_name` varchar(255) NOT NULL,
  `tdate` varchar(25) DEFAULT NULL,
  `totalprice` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`id`, `doc_name`, `pname`, `drug_name`, `tdate`, `totalprice`) VALUES
(71, 'M Rajapaksha', 'movini gamage', 'Adderall /-560,sky ,yhtgdrtt,kliou,bnhj, /-550,pendol /-550', '2021-03-25T01:34', 90),
(72, 'M Rajapaksha', 'movini gamage', 'Adderall /-560,Vicodin /-550, Synthroid /-5000Delasone /-5000', '2021-05-29T01:49', 90),
(73, 'M Rajapaksha', 'movini gamage', 'Adderall /-560,Vicodin /-550, Synthroid /-5000Delasone /-5000', '2021-05-29T01:49', 90),
(74, 'M Rajapaksha', 'movini gamage', 'Adderall /-560,Vicodin /-550, Synthroid /-5000Delasone /-5000', '2021-05-29T01:49', 90),
(84, 'M Rajapaksha', 'Indula Bandara', 'Atovaquone /-175,Carboplatin /-175,Cocaine /-320', '2021-04-01T14:50', 400),
(85, 'M Rajapaksha', 'SANJANA SULAKSHANA WITHARANAGE', 'Abacavir /-225,Atovaquone /-175,Carboplatin /-175', '2021-04-01T14:50', 400);

-- --------------------------------------------------------

--
-- Table structure for table `records`
--

CREATE TABLE `records` (
  `id` int(11) NOT NULL,
  `drugsname` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `date` varchar(255) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `brands` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `Mdate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `records`
--

INSERT INTO `records` (`id`, `drugsname`, `price`, `date`, `expdate`, `brands`, `country`, `Mdate`) VALUES
(23, 'Abacavir', 225, '2021-03-25T20:34', '13/03/2021', 'mero', 'England', '13/03/2021'),
(24, 'Atovaquone', 175, '2021-03-24T23:15', '2025-03-18T23:15', 'Sun Text', 'Japan', '2021-03-09T23:16'),
(25, 'Carboplatin', 175, '2021-03-25T17:57', '2024-06-18T17:57', 'Posh', 'Canda', '2021-03-03T17:58'),
(27, 'Cocaine', 320, '2021-03-31T10:07', '2025-06-11T10:08', 'Sofy', 'Canda', '2020-02-12T10:08');

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
(33, 'Indula Bandara', 771876223, 'indulabandara73@gmail.com', 'C01DAE268A171DEF88259463739BD8FE', '981372940v', 'M', 23, '1st lane, kurunagala.', 'P', NULL, 'N'),
(0, 'movini gamage', 717288494, 'mmjune98@gmail.com', 'admin', '3467', 'F', 34, '45657', 'P', 65767, 'N'),
(34, 'movini gamage', 717288494, 'mmjune98@gmail.com', 'admin', '3467', 'F', 34, '45657', 'P', 65767, 'N');

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
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `records`
--
ALTER TABLE `records`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `records`
--
ALTER TABLE `records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

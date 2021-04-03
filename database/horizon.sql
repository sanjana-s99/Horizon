-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 03, 2021 at 06:56 AM
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
-- Table structure for table `ambulance`
--

CREATE TABLE `ambulance` (
  `number` varchar(8) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ambulance`
--

INSERT INTO `ambulance` (`number`, `status`) VALUES
('CAM-8811', 'N'),
('HU-5690', 'N'),
('KA-8841', 'A'),
('KD-8841', 'N'),
('KK-8841', 'N');

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
(0, 0, 0, 'S', '2021-03-25 13:59:43'),
(3, 4, 5, 'R', '2021-03-23 15:40:21'),
(3, 4, 6, 'R', '2021-03-25 15:12:14'),
(3, 4, 7, 'R', '2021-03-25 16:08:15'),
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
(3, 5, 17, 'R', '2021-03-25 15:29:31');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `id` int(11) NOT NULL,
  `nic` varchar(13) NOT NULL,
  `time` varchar(5) DEFAULT NULL,
  `s_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`id`, `nic`, `time`, `s_id`) VALUES
(4, '', '16:30', 3),
(5, '', '17:00', 2),
(33, '', '15:30', 2);

-- --------------------------------------------------------

--
-- Table structure for table `drugs`
--

CREATE TABLE `drugs` (
  `id` int(11) NOT NULL,
  `drugsname` varchar(255) NOT NULL,
  `price` varchar(15) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `expdate` varchar(100) NOT NULL,
  `brands` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `Mdate` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `drugs`
--

INSERT INTO `drugs` (`id`, `drugsname`, `price`, `date`, `expdate`, `brands`, `country`, `Mdate`) VALUES
(1, 'Abacavir', '220', '2021-03-25 15:04:00', '13/03/2021', 'mero', 'England', '13/03/2021'),
(2, 'Atovaquone', '300', '2021-03-25 15:04:00', '13/03/2021', 'Sun Text', 'Japan', '13/03/2021'),
(4, 'test2', '70,000', '2021-04-03 04:30:10', '2021-04-03T09:57', 'Test', 'Sri Lanka', '2021-04-03T09:57'),
(5, 'test1', '70,000', '2021-04-03 04:30:57', '2021-04-03T09:57', 'Test', 'Sri Lanka', '2021-04-03T09:57');

-- --------------------------------------------------------

--
-- Table structure for table `lab`
--

CREATE TABLE `lab` (
  `id` int(11) NOT NULL,
  `Atype` varchar(255) NOT NULL,
  `Price` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lab`
--

INSERT INTO `lab` (`id`, `Atype`, `Price`) VALUES
(1, 'ECG', '1000'),
(2, 'Lab Test(Blood or Urine)', '2000'),
(3, 'Container Pickup / Specimens Drop Off', '5000'),
(4, 'Lab Test & ECG', '1000'),
(5, 'Lab Test Pediatric', '6000');

-- --------------------------------------------------------

--
-- Table structure for table `lab_apo`
--

CREATE TABLE `lab_apo` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `did` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lab_apo`
--

INSERT INTO `lab_apo` (`id`, `pid`, `did`, `type`, `date`, `time`) VALUES
(6, 3, 4, 'Lab Test(blood or urine)', '2021-03-24', '00:18:00'),
(7, 3, 5, 'Container Pick Up/Specimen Drop Off', '2021-03-24', '00:18:00'),
(8, 3, 5, 'ECG', '2021-03-24', '00:18:00'),
(9, 3, 5, 'Lab Test Pediatric', '2021-03-24', '00:18:00'),
(10, 3, 5, 'Lab Test(blood or urine)', '2021-03-24', '18:52:00'),
(13, 3, 33, 'ECG', '2021-03-24', '18:01:00'),
(16, 3, 33, 'Lab Test(blood or urine)', '2021-03-25', '19:35:00'),
(18, 3, 33, 'Lab Test(blood or urine)', '2021-03-24', '19:35:00'),
(19, 3, 33, 'Container Pick Up/Specimen Drop Off', '2021-03-24', '19:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `CVC` varchar(5) NOT NULL,
  `Expires` varchar(10) NOT NULL,
  `price` varchar(10) NOT NULL,
  `drugname` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `name`, `CVC`, `Expires`, `price`, `drugname`) VALUES
(1, 'hvjhvjhv', '675', '13/03/2021', '225', 'Abacavir');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `id` int(11) NOT NULL,
  `doc_name` varchar(100) NOT NULL,
  `pname` varchar(100) NOT NULL,
  `drug_name` varchar(100) NOT NULL,
  `tdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `totalprice` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`id`, `doc_name`, `pname`, `drug_name`, `tdate`, `totalprice`) VALUES
(1, 'SANJANA SULAKSHANA WITHARANAGE', 'Kavindya', 'Abacavir /-225,Atovaquone /-300,test2 /-70,000,test1 /-70,000', '2021-04-03 05:52:00', 550),
(2, 'SANJANA SULAKSHANA WITHARANAGE', 'Kavindya', 'Abacavir /-225,Atovaquone /-300', '2021-04-03 04:04:14', 100),
(5, 'M Rajapakshe', 'SANJANA SULAKSHANA WITHARANAGE', 'Abacavir /-225,Atovaquone /-300,test2 /-70,000,test1 /-70,000', '2021-04-03 04:49:01', 334);

-- --------------------------------------------------------

--
-- Table structure for table `provide_amb`
--

CREATE TABLE `provide_amb` (
  `number` varchar(8) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` int(10) NOT NULL,
  `lan` float NOT NULL,
  `lat` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `provide_amb`
--

INSERT INTO `provide_amb` (`number`, `name`, `phone`, `lan`, `lat`) VALUES
('KA-8841', 'sanjana', 771994147, 10, 22);

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
  `password` varchar(50) NOT NULL DEFAULT '21232F297A57A5A743894A0E4A801FC3',
  `nic` varchar(13) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `age` int(3) NOT NULL,
  `address` text NOT NULL,
  `type` varchar(1) NOT NULL DEFAULT 'P',
  `status` varchar(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `telephone`, `email`, `password`, `nic`, `gender`, `age`, `address`, `type`, `status`) VALUES
(1, 'webmaster', 0, 'webmaster@horizen.lk', '21232F297A57A5A743894A0E4A801FC3', '0', 'M', 0, '0', 'W', 'A'),
(2, 'manuja', 777833833, 'manuja@gmail.com', 'A6A279ABE0B97FF31094A6B074DAFBC5', '997603346V', 'M', 22, '15/1, Sellige Watta, Ampitiya, Kandy, Sri Lanka.', 'S', 'N'),
(3, 'SANJANA SULAKSHANA WITHARANAGE', 771994147, 'sanjanasulakshanawitharanage@gmail.com', 'C5990A201E678B5FF2D3AD5091753F2F', '993581089V', 'M', 22, '15/1, Sellige Wattha', 'P', 'A'),
(4, 'D M Munasinghe', 778162644, 'munasinge@horizon.lk', '3E932C5349BA40C139A6EBE0B20ADC35', '00000000000', 'M', 37, 'lovers steet, peradeniya', 'D', 'A'),
(5, 'M Rajapakshe', 0, 'mahinda@horizon.lk', '21232F297A57A5A743894A0E4A801FC3', '00000000000', 'M', 78, 'hambanthota', 'D', 'A'),
(33, 'Indula Bandara', 771876223, 'indulabandara73@gmail.com', 'C01DAE268A171DEF88259463739BD8FE', '981372940v', 'M', 23, '1st lane, kurunagala.', 'D', 'N'),
(35, 'Namal Rajapaksha', 771191191, 'namal@gmail.com', '21232F297A57A5A743894A0E4A801FC3', '893581099v', 'M', 39, '1st lane, madamulana, hambanthota', 'D', 'A'),
(44, 'Sulakshana Witharanage', 771994147, 's.witharanage@yahoo.com', '2DE5BC15BD50896C961E6C0246675E65', '993581089V', 'M', 22, '15/1, Sellige Wattha', 'P', 'A'),
(45, 'SANJANA SULAKSHANA WITHARANAGE', 771994147, 'sswitharanage@students.nsbm.lk', '21232F297A57A5A743894A0E4A801FC3', '897603346V', 'M', 32, '15/1, Sellige Wattha', 'D', 'N'),
(46, 'SANJANA SULAKSHANA WITHARANAGE', 771994147, 'sswitharanage@students.nsbm.ac.lk', '21232F297A57A5A743894A0E4A801FC3', '897603346V', 'M', 32, '15/1, Sellige Wattha', 'S', 'N'),
(48, 'Kavindya', 771994147, 'kavindyasandeepani1999@gmail.com', '82D747399B8A509BC86A01F2DF898755', '997581089V', 'M', 22, '1st lane, aswaddum uyana, millavitiya', 'P', 'N');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `doc_del` AFTER DELETE ON `users` FOR EACH ROW BEGIN
    IF OLD.type = 'D' THEN
        DELETE FROM doctor
        WHERE id = OLD.id;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `doc_spe` AFTER INSERT ON `users` FOR EACH ROW BEGIN
    IF NEW.type = 'D' THEN
        INSERT INTO doctor(id,nic)
        VALUES(new.id,new.nic);
    END IF;
END
$$
DELIMITER ;

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
-- Indexes for dumped tables
--

--
-- Indexes for table `ambulance`
--
ALTER TABLE `ambulance`
  ADD PRIMARY KEY (`number`);

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
-- Indexes for table `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lab`
--
ALTER TABLE `lab`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lab_apo`
--
ALTER TABLE `lab_apo`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `provide_amb`
--
ALTER TABLE `provide_amb`
  ADD PRIMARY KEY (`number`,`name`,`phone`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `drugs`
--
ALTER TABLE `drugs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lab_apo`
--
ALTER TABLE `lab_apo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `specelist`
--
ALTER TABLE `specelist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

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

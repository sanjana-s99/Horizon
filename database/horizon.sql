-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 11, 2021 at 04:35 PM
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
-- Table structure for table `admit`
--

CREATE TABLE `admit` (
  `id` int(11) NOT NULL,
  `nic` varchar(15) NOT NULL,
  `did` int(11) NOT NULL,
  `type` varchar(7) NOT NULL,
  `bno` int(11) NOT NULL,
  `gname` varchar(100) NOT NULL,
  `gtp` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admit`
--

INSERT INTO `admit` (`id`, `nic`, `did`, `type`, `bno`, `gname`, `gtp`, `time`) VALUES
(21, '993581089V', 5, 'room', 4, 'Malani Fonseka', 771994147, '2021-04-24 15:34:11'),
(22, '997581089V', 4, 'ward', 4, 'Dammika Plliyaguru', 771994147, '2021-04-25 08:54:36'),
(24, '993581089V', 5, 'room', 3, 'kasun', 771994147, '2021-05-10 11:16:50');

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
('KA-8841', 'N'),
('KD-8841', 'N'),
('KK-8841', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `beds`
--

CREATE TABLE `beds` (
  `bid` int(11) NOT NULL,
  `wid` int(11) NOT NULL,
  `bno` int(11) NOT NULL,
  `status` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `beds`
--

INSERT INTO `beds` (`bid`, `wid`, `bno`, `status`) VALUES
(1, 1, 1, 'F'),
(2, 1, 2, 'F'),
(3, 2, 1, 'F'),
(4, 2, 2, 'B');

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
(3, 6, 1, 'R', '2021-05-11 13:58:02'),
(44, 6, 2, 'R', '2021-05-11 13:58:21'),
(52, 6, 4, 'R', '2021-05-11 13:59:54'),
(63, 6, 3, 'R', '2021-05-11 13:59:10');

-- --------------------------------------------------------

--
-- Table structure for table `diseases`
--

CREATE TABLE `diseases` (
  `id` int(11) NOT NULL,
  `disease` varchar(100) NOT NULL,
  `symptom_1` varchar(100) NOT NULL,
  `symptom_2` varchar(100) NOT NULL,
  `symptom_3` varchar(100) NOT NULL,
  `symptom_4` varchar(100) NOT NULL,
  `symptom_5` varchar(100) NOT NULL,
  `symptom_6` varchar(100) NOT NULL,
  `symptom_7` varchar(100) NOT NULL,
  `symptom_8` varchar(100) NOT NULL,
  `symptom_9` varchar(100) NOT NULL,
  `symptom_10` varchar(100) NOT NULL,
  `specialist_id` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `diseases`
--

INSERT INTO `diseases` (`id`, `disease`, `symptom_1`, `symptom_2`, `symptom_3`, `symptom_4`, `symptom_5`, `symptom_6`, `symptom_7`, `symptom_8`, `symptom_9`, `symptom_10`, `specialist_id`) VALUES
(1, 'heart disease', 'Fluttering in your chest', 'Racing heartbeat ', 'Slow heartbeat', 'Chest pain', 'Shortness of breath', 'Lightheadedness', 'Dizziness', 'Fainting', '', '', '4'),
(2, 'diabetes', 'Urinate (pee) a lot', 'very thirsty', 'Lose weight', 'very hungry', 'blurry vision', 'very tired', 'dry skin', '', '', '', '5'),
(3, 'cancer', 'Pain', 'loss weight', 'Fatigue', 'Fever', 'Changes in your skin', 'Sores that don\'t heal', 'Cough', 'Unusual bleeding', '', '', '6'),
(4, 'stroke', 'Sudden numbness or weakness in the face, arm, or leg, especially on one side of the body', 'Sudden confusion, trouble speaking, or difficulty understanding speech', 'Sudden trouble seeing in one or both eyes', 'Sudden trouble walking, dizziness, loss of balance, or lack of coordination', '', '', '', '', '', '', '7'),
(5, 'respiratory disease', 'Difficulty Breathing', 'Stubborn Cough', 'Breathing Noisily', 'Lingering Chest Pain', 'Chronic Mucus', 'Coughing Up Blood', 'Asthma', 'Pneumonia', '', '', '8'),
(6, 'COVID-19', 'fever', 'dry cough', 'tiredness', 'aches and pains', 'sore throat', 'diarrhoea', 'conjunctivitis', 'headache', 'loss of taste or smell', 'difficulty breathing or shortness of breath', '9'),
(7, 'gastritis', 'Stomach upset or pain', 'Belching and hiccups', 'Belly (abdominal) bleeding', 'Nausea and vomiting', 'Feeling of fullness or burning in your stomach', 'Loss of appetite', 'Blood in your vomit or stool', '', '', '', '10'),
(8, 'Kidney disease', 'loss weight', 'swollen ankles, feet or hands', 'shortness of breath', 'tiredness', 'blood in your pee', 'an increased need to pee', 'difficulty sleeping', 'itchy skin', '', '', '11'),
(9, 'cholesterol', 'chest pain', 'nausea', 'extreme fatigue', 'shortness of breath', 'pain in the neck, jaw, upper abdomen, or back', '', '', '', '', '', '12'),
(10, 'pregnancy', 'Missed period', 'Tender, swollen breasts', 'Nausea with or without vomiting', 'Increased urination', 'Fatigue', '', '', '', '', '', '13'),
(11, 'respiratory disease', 'Difficulty Breathing', 'Stubborn Cough', 'Breathing Noisily', 'Lingering Chest Pain', 'Chronic Mucus', 'Coughing Up Blood', 'Asthma', 'Pneumonia', '', '', '8');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `id` int(11) NOT NULL,
  `nic` varchar(15) NOT NULL,
  `time` varchar(5) DEFAULT '16:00',
  `s_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`id`, `nic`, `time`, `s_id`) VALUES
(4, '40000000000', '20:40', 3),
(5, '00000000000', '17:00', 5),
(6, '721048012v', '16:00', 1),
(7, '621048012v', '16:00', 4),
(8, '721788012v', '16:00', 4),
(9, '821048012v', '16:00', 3),
(33, '981372940v', '20:30', 2),
(35, '883581099v', '16:00', 2),
(53, '728131048v', '16:00', 6),
(54, '843581089V', '16:00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `drprescription`
--

CREATE TABLE `drprescription` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `did` int(11) NOT NULL,
  `pres` text NOT NULL,
  `cno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 'Atovaquone', '300', '2021-03-25 15:04:00', '13/03/2021', 'Sun Text', 'Japan', '13/03/2021'),
(2, 'Acetaminophen', '500', '2021-04-03 04:30:10', '2021-04-03T09:57', 'Cylon Med', 'Sri Lanka', '2021-04-03T09:57'),
(6, 'Amoxicillin', '100', '2021-05-11 13:48:43', '2021-05-04T19:20', 'Ceylon Med', 'Sri Lanka', '2021-03-16T07:20'),
(7, 'Atorvastatin', '290', '2021-05-11 13:49:22', '2021-10-21T19:19', 'Helis', 'India', '2021-01-14T19:22'),
(8, 'Zestril', '190', '2021-05-11 13:50:15', '2022-03-17T19:20', 'Helis', 'India', '2020-11-26T19:20');

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
(1, 'ECG', '4000'),
(2, 'Lab Test(Blood or Urine)', '3000'),
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
(31, 3, 4, 'ECG', '2021-05-04', '11:13:00'),
(33, 3, 5, 'Container Pickup / Specimens Drop Off', '2021-03-24', '00:18:00'),
(34, 44, 5, 'ECG', '2021-03-24', '00:18:00'),
(35, 3, 6, 'Lab Test(Blood or Urine)', '2021-05-12', '19:34:00');

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
(1, 'Dayamanthi Pieris', 'SANJANA SULAKSHANA WITHARANAGE', 'Atovaquone /-300,test2 /-70,000', '2021-04-03 05:52:00', 5500),
(2, 'SANJANA SULAKSHANA WITHARANAGE', 'Kavindya', 'Abacavir /-225,Atovaquone /-300', '2021-04-03 04:04:14', 100);

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
('KK-8841', 'Indula', 771191191, 80.0331, 6.83414);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `status` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id`, `price`, `status`) VALUES
(1, 7500, 'F'),
(2, 7500, 'F'),
(3, 7500, 'B'),
(4, 10000, 'B'),
(5, 10000, 'F'),
(6, 10000, 'F'),
(7, 10000, 'F'),
(8, 15000, 'F'),
(9, 15000, 'F'),
(10, 20000, 'F');

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
(3, 'Dermatology'),
(4, 'Cardiologist'),
(5, 'Endocrinologists'),
(6, 'oncologist'),
(7, 'Neurologist'),
(8, 'Pulmonologist '),
(9, 'Infectious Disease Specialist'),
(10, 'gastroenterologist'),
(11, 'Nephrologists'),
(12, 'Lipidologists'),
(13, 'Obstetrician');

-- --------------------------------------------------------

--
-- Table structure for table `symptoms`
--

CREATE TABLE `symptoms` (
  `symptom` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `symptoms`
--

INSERT INTO `symptoms` (`symptom`) VALUES
('Fluttering in your chest'),
('Racing heartbeat '),
('Slow heartbeat'),
('Chest pain'),
('Shortness of breath'),
('Lightheadedness'),
('Dizziness'),
('Fainting'),
('Urinate (pee) a lot'),
('very thirsty'),
('Loss weight'),
('very hungry'),
('blurry vision'),
('very tired'),
('dry skin'),
('Pain'),
('Fatigue'),
('Fever'),
('Changes in your skin'),
('Sores that don\'t heal'),
('Cough'),
('Unusual bleeding'),
('Difficulty Breathing'),
('Stubborn Cough'),
('Breathing Noisily'),
('Lingering Chest Pain'),
('Chronic Mucus'),
('Coughing Up Blood'),
('Asthma'),
('Pneumonia'),
('fever'),
('dry cough'),
('tiredness'),
('aches'),
('sore throat'),
('diarrhoea'),
('conjunctivitis'),
('headache'),
('Stomach upset or pain'),
('Belching and hiccups'),
('Belly (abdominal) bleeding'),
('Nausea and vomiting'),
('Loss of appetite'),
('Blood in your vomit or stool'),
('swollen ankles, feet or hands'),
('shortness of breath'),
('tiredness'),
('blood in your pee'),
('an increased need to pee'),
('difficulty sleeping'),
('itchy skin'),
('chest pain'),
('nausea'),
('extreme fatigue'),
('shortness of breath'),
('Missed period'),
('Tender, swollen breasts'),
('Nausea with or without vomitin'),
('Increased urination'),
('Fatigue'),
('respiratory disease'),
('Difficulty Breathing'),
('Stubborn Cough'),
('Breathing Noisily'),
('Lingering Chest Pain'),
('Chronic Mucus'),
('Coughing Up Blood'),
('Asthma'),
('Pneumonia');

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
(2, 'manuja Mallikarachchi', 777833833, 'manuja@gmail.com', 'A6A279ABE0B97FF31094A6B074DAFBC5', '997603346V', 'M', 22, '15/1, Sellige Watta, Ampitiya, Kandy, Sri Lanka.', 'S', 'N'),
(3, 'Sanjana Sulakshana', 771994147, 'sanjanasulakshanawitharanage@gmail.com', '47E68A6A7F8C3F0589C37C68237880EB', '993581089V', 'M', 22, '15/1, Sellige Wattha', 'P', 'A'),
(4, 'Damitha Munasinghe', 778162644, 'munasinge@horizon.lk', '21232F297A57A5A743894A0E4A801FC3', '40000000000', 'M', 37, 'lovers steet, peradeniya', 'D', 'A'),
(5, 'Mahinda Rajapakshe', 0, 'mahinda@horizon.lk', '21232F297A57A5A743894A0E4A801FC3', '00000000000', 'M', 78, 'hambanthota', 'D', 'A'),
(6, 'Pavithra Wanniarchchi', 778389389, 'pavithra@horizon.lk', '21232F297A57A5A743894A0E4A801FC3', '721048012v', 'F', 60, '712/4, cross street, eheliyagoda.', 'D', 'A'),
(7, 'Maithreepala Sirisena', 726267983, 'maithri@horizon.lk', '21232F297A57A5A743894A0E4A801FC3', '621048012v', 'M', 65, '16, flowers street, polonnaruwa.', 'D', 'A'),
(8, 'Kasun Kalhara', 746782561, 'kasun@horizon.lk', '21232F297A57A5A743894A0E4A801FC3', '721788012v', 'M', 39, '172, Main Street, Kandy', 'D', 'A'),
(9, 'Hirunika Premachandra', 775628261, 'hirunka@horizon.lk', '21232F297A57A5A743894A0E4A801FC3', '821048012v', 'F', 36, '93, bakers street, colombo', 'D', 'A'),
(33, 'Indula Bandara', 771876223, 'indulabandara73@gmail.com', 'C01DAE268A171DEF88259463739BD8FE', '981372940v', 'M', 23, '1st lane, kurunagala.', 'D', 'N'),
(35, 'Namal Rajapaksha', 771191191, 'namal@gmail.com', '21232F297A57A5A743894A0E4A801FC3', '883581099v', 'M', 39, '1st lane, madamulana, hambanthota', 'D', 'A'),
(44, 'Kadun Bandara', 771994147, 's.witharanddage@yahoo.com', '2DE5BC15BD50896C961E6C0246675E65', '993581049V', 'M', 22, '15/1, Sellige Wattha', 'P', 'A'),
(46, 'Sandun Bandara', 771994147, 'sswitharanage@students.nsbm.ac.lk', '21232F297A57A5A743894A0E4A801FC3', '899603346V', 'M', 32, '15/1, Sellige Wattha', 'S', 'N'),
(48, 'Kavindya Sandeepanie', 771994147, 'kavindyasandeepani1999@gmail.com', '82D747399B8A509BC86A01F2DF898755', '997581089V', 'M', 22, '1st lane, aswaddum uyana, millavitiya', 'P', 'N'),
(52, 'Sulakshana Rajapaksha', 771994147, 's.wiitharanage@yahoo.com', '0354D89C28EC399C00D3CB2D094CF093', '993566089V', 'M', 22, '15/1', 'P', 'A'),
(53, 'Dayamanthi Pieris', 771364147, 'dayamanthi@horizon.lk', '21232F297A57A5A743894A0E4A801FC3', '728131048v', 'M', 49, '1st lane, pallegama para ,galagedara', 'D', 'N'),
(54, 'Harin Fernando', 771882728, 'harin@horizon.lk', '21232F297A57A5A743894A0E4A801FC3', '843581089V', 'M', 37, '1st lane, new town, badulla', 'D', 'A'),
(63, 'Sanjula Ranasinghe', 771994147, 's.witharanage@yahoo.com', '0B3E0DD95F943F51B85555ABD36B9462', '981581089V', 'M', 23, '15/1, Sellige Wattha', 'P', 'N'),
(64, 'Sajana Perera', 771994147, 'sanjansanjanaa@gmail.com', 'FCE3A80DCF6E6900F5F8C992043E81F2', '983582089V', 'M', 23, '15/1', 'P', 'N');

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
-- Dumping data for table `verify`
--

INSERT INTO `verify` (`email`, `key`, `exp`) VALUES
('sanjanaefeflakshanawitharanage@gmail.com', '88A591C87D5582F725FC031A71270096', '2021-04-22'),
('dayamanthi@horizon.lk', '5179A34444AEBB8F3E77079212E6E3DA', '2021-04-26'),
('sanjanasulakshanawitharanage@gmail.com', '4FE87BDA579E7C5ED24F4BF3D8B7C278', '2021-04-28'),
('s.witharanage@yahoo.com', 'D7843F6972776C5EF1FA065CD90DC08C', '2021-04-29'),
('s.witharanage@yahoo.com', 'D7843F6972776C5EF1FA065CD90DC08C', '2021-04-29'),
('s.witharanage@yahoo.com', 'D7843F6972776C5EF1FA065CD90DC08C', '2021-04-29'),
('s.witharanage@yahoo.com', 'D7843F6972776C5EF1FA065CD90DC08C', '2021-04-29'),
('sanjansanjanaa@gmail.com', '4DFA08A06B43DADAB9BA75A9F5F8A5FD', '2021-04-29');

-- --------------------------------------------------------

--
-- Table structure for table `ward_types`
--

CREATE TABLE `ward_types` (
  `wid` int(11) NOT NULL,
  `wtype` varchar(50) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ward_types`
--

INSERT INTO `ward_types` (`wid`, `wtype`, `price`) VALUES
(1, 'General Patients', 5000),
(2, 'Younger Physically Disabled', 5000),
(3, 'Neonates', 6000),
(4, 'Maternity', 6000),
(5, 'Psychiatric', 7000),
(6, 'Intensive Care Unit', 10000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admit`
--
ALTER TABLE `admit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nic` (`nic`,`did`),
  ADD KEY `did` (`did`);

--
-- Indexes for table `ambulance`
--
ALTER TABLE `ambulance`
  ADD PRIMARY KEY (`number`);

--
-- Indexes for table `beds`
--
ALTER TABLE `beds`
  ADD PRIMARY KEY (`bid`);

--
-- Indexes for table `channeling`
--
ALTER TABLE `channeling`
  ADD PRIMARY KEY (`p_id`,`d_id`,`number`);

--
-- Indexes for table `diseases`
--
ALTER TABLE `diseases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `s_id` (`s_id`);

--
-- Indexes for table `drprescription`
--
ALTER TABLE `drprescription`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nic` (`nic`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `nic_2` (`nic`),
  ADD KEY `email_2` (`email`);

--
-- Indexes for table `verify`
--
ALTER TABLE `verify`
  ADD KEY `email` (`email`);

--
-- Indexes for table `ward_types`
--
ALTER TABLE `ward_types`
  ADD PRIMARY KEY (`wid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admit`
--
ALTER TABLE `admit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `beds`
--
ALTER TABLE `beds`
  MODIFY `bid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `drprescription`
--
ALTER TABLE `drprescription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `drugs`
--
ALTER TABLE `drugs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `lab_apo`
--
ALTER TABLE `lab_apo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `specelist`
--
ALTER TABLE `specelist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `ward_types`
--
ALTER TABLE `ward_types`
  MODIFY `wid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admit`
--
ALTER TABLE `admit`
  ADD CONSTRAINT `admit_ibfk_1` FOREIGN KEY (`nic`) REFERENCES `users` (`nic`),
  ADD CONSTRAINT `admit_ibfk_2` FOREIGN KEY (`did`) REFERENCES `users` (`id`);

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`s_id`) REFERENCES `specelist` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

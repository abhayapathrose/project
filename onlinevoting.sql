-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 23, 2023 at 09:44 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinevoting`
--

-- --------------------------------------------------------

--
-- Table structure for table `candidates`
--

DROP TABLE IF EXISTS `candidates`;
CREATE TABLE IF NOT EXISTS `candidates` (
  `candidateid` int NOT NULL AUTO_INCREMENT,
  `cid` int NOT NULL,
  `admno` varchar(30) NOT NULL,
  `status` varchar(2) NOT NULL DEFAULT '1',
  `symbol` varchar(100) DEFAULT NULL,
  `std_un` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`candidateid`),
  UNIQUE KEY `symbol` (`symbol`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `candidates`
--

INSERT INTO `candidates` (`candidateid`, `cid`, `admno`, `status`, `symbol`, `std_un`) VALUES
(3, 5, '20RR288', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

DROP TABLE IF EXISTS `complaints`;
CREATE TABLE IF NOT EXISTS `complaints` (
  `cmpid` int NOT NULL AUTO_INCREMENT,
  `time` timestamp(5) NOT NULL DEFAULT CURRENT_TIMESTAMP(5),
  `email` varchar(20) NOT NULL,
  `title` varchar(20) NOT NULL,
  `content` varchar(10) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '0',
  `reply` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cmpid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`cmpid`, `time`, `email`, `title`, `content`, `status`, `reply`) VALUES
(1, '2023-06-23 06:41:08.43780', '20rr184@vjcet.org', 'Class Election', 'jhfjkfzhjk', '0', NULL),
(2, '2023-06-23 06:43:15.39430', '20rr184@vjcet.org', 'kjd', 'uyuiydsuhu', '0', NULL),
(3, '2023-06-23 06:45:35.49731', '20rr079@vjcet.org', 'fdskjkaf', 'jsknzcx', '0', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contest`
--

DROP TABLE IF EXISTS `contest`;
CREATE TABLE IF NOT EXISTS `contest` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `starttime` varchar(10) NOT NULL,
  `endtime` varchar(10) NOT NULL,
  `status` varchar(2) NOT NULL DEFAULT '1',
  `designation` varchar(30) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `contest`
--

INSERT INTO `contest` (`cid`, `name`, `date`, `starttime`, `endtime`, `status`, `designation`) VALUES
(1, 'College Election', '2023-07-25', ' 13', '18', '-1', 'Class Representative'),
(2, 'Class Election', '2023-06-25', ' 15', '16', '1', 'Class Representative'),
(3, 'College Election', '2023-06-23', ' 14', '15', '1', 'Chairman'),
(4, 'Faculty Election', '2023-06-07', ' 12', '15', '2', 'Faculty Rep'),
(5, 'IEEE Election', '2023-06-23', ' 11', '20', '1', 'Chairperson'),
(6, 'College Election', '2023-06-29', ' 14', '15', '1', 'Department Representative ');

-- --------------------------------------------------------

--
-- Table structure for table `electoralroll`
--

DROP TABLE IF EXISTS `electoralroll`;
CREATE TABLE IF NOT EXISTS `electoralroll` (
  `er_id` int NOT NULL AUTO_INCREMENT,
  `admno` varchar(10) NOT NULL,
  `cid` int NOT NULL,
  `candidateid` int DEFAULT '0',
  `votingtime` time(5) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`er_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `electoralroll`
--

INSERT INTO `electoralroll` (`er_id`, `admno`, `cid`, `candidateid`, `votingtime`, `status`) VALUES
(1, '20RR184', 3, 0, NULL, NULL),
(2, '20RR215', 3, 0, NULL, NULL),
(3, '20RR215', 5, 0, NULL, NULL),
(4, '20RR184', 5, 0, NULL, NULL),
(6, '20RR079', 5, 3, NULL, NULL),
(7, '20RR137', 5, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `status` varchar(2) DEFAULT NULL,
  `usertype` varchar(2) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`email`, `password`, `status`, `usertype`) VALUES
('admin@vjcet.org', 'admin123', '1', '0'),
('20rr079@vjcet.org', 'ananya@vjcet', '1', '1'),
('20rr184@vjcet.org', 'megha@vjcet', '1', '1'),
('20rr215@vjcet.org', 'gopika@vjcet', '1', '1'),
('20rr288@vjcet.org', 'abhaya@vjcet', '1', '1'),
('20rr137@vjcet.org', 'eeva@vjcet', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
CREATE TABLE IF NOT EXISTS `registration` (
  `stdid` int NOT NULL AUTO_INCREMENT,
  `email` varchar(30) NOT NULL,
  `admno` varchar(10) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(7) NOT NULL,
  `rollno` int NOT NULL,
  `semester` varchar(5) NOT NULL,
  `branch` varchar(10) NOT NULL,
  `course` varchar(10) NOT NULL,
  `phn` varchar(10) NOT NULL,
  `address` varchar(30) NOT NULL,
  `state` varchar(20) NOT NULL,
  `district` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `pincode` int NOT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `admno` (`admno`),
  UNIQUE KEY `stdid` (`stdid`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`stdid`, `email`, `admno`, `fname`, `lname`, `dob`, `gender`, `rollno`, `semester`, `branch`, `course`, `phn`, `address`, `state`, `district`, `city`, `pincode`) VALUES
(9, '20rr079@vjcet.org', '20RR079', 'Ananya ', 'S', '2002-01-22', 'female', 12, 'S6', 'CSE', 'BTech', '6282273841', 'Mudavoor', 'Kerala', 'Ernakulam ', 'Muvattupuzha', 2147483647),
(3, '20rr184@vjcet.org', '20RR184', 'Megha ', 'Sara', '2002-02-17', 'female', 42, 'S6', 'CSE', 'BTech', '9865768498', 'jfhkjdshkzjf', 'Kerala', 'Ernakulam ', 'Muvattupuzha', 678789),
(6, '20rr215@vjcet.org', '20RR215', 'Gopika', 'Shine', '2002-06-04', 'female', 31, 'S6', 'CSE', 'BTech', '8590935349', 'Kottapady', 'Kerala', 'Ernakulam ', 'Kothamangalam', 686692),
(8, '20rr288@vjcet.org', '20RR288', 'Abhaya ', 'Pathrose', '2002-09-10', 'female', 2, 'S6', 'CSE', 'BTech', '9478563428', 'Kottapady', 'Kerala', 'Ernakulam ', 'Kothamangalam', 686692),
(11, '20rr137@vjcet.org', '20RR137', 'Eeva ', 'E P', '2003-03-23', 'female', 27, 'S6', 'CSE', 'BTech', '6282532680', 'Puthankurush', 'Kerala', 'Ernakulam ', 'Kothamangalam', 686692);

-- --------------------------------------------------------

--
-- Table structure for table `time`
--

DROP TABLE IF EXISTS `time`;
CREATE TABLE IF NOT EXISTS `time` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `time`
--

INSERT INTO `time` (`id`, `data`) VALUES
(1, '00:00'),
(2, '01:00'),
(3, '02:00'),
(4, '03:00'),
(5, '04:00'),
(6, '05:00'),
(7, '06:00'),
(8, '07:00'),
(9, '08:00'),
(10, '09:00'),
(11, '10:00'),
(12, '11:00'),
(13, '12:00'),
(14, '13:00'),
(15, '14:00'),
(16, '15:00'),
(17, '16:00'),
(18, '17:00'),
(19, '18:00'),
(20, '19:00'),
(21, '20:00'),
(22, '21:00'),
(23, '22:00'),
(24, '23:00');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

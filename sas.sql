-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 05, 2019 at 06:39 AM
-- Server version: 5.5.57
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sas`
--

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `email` varchar(30) NOT NULL,
  `password` varchar(8) NOT NULL,
  `user_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`email`, `password`, `user_type`) VALUES
('adff@gmail.xcom', 'abc', 'student'),
('hsilva@gmail.com', 'abc123', 'student'),
('kjanith@gmail.com', 'abc', 'student'),
('db1980@gmail.com', 'banda', 'propertier'),
('rmadhurya@gmail.com', 'r123', 'student'),
('aCosta@gmai.com', 'costa', 'propertier'),
('To@yahoo.com', 'test', 'propertier'),
('To1@yahoo.com', 'test1', 'propertier'),
('lasitha@gmail.com', 'lasitha', 'student'),
('devmin@gmail.com', 'devmin', 'student');

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
CREATE TABLE IF NOT EXISTS `owner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `telephone` int(11) NOT NULL,
  `password` varchar(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`id`, `name`, `email`, `telephone`, `password`) VALUES
(1, 'Don bandara', 'db1980@gmail.com', 112345890, 'banda'),
(2, 'anura Costa', 'aCosta@gmai.com', 112567800, 'costa'),
(3, 'TestOwner', 'To@yahoo.com', 0, 'test'),
(4, 'TestOwner1', 'To1@yahoo.com', 111111111, 'test1');

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
CREATE TABLE IF NOT EXISTS `property` (
  `property_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_address` varchar(50) NOT NULL,
  `type` varchar(30) NOT NULL,
  `number_of_tenance` int(11) NOT NULL,
  `rent` float NOT NULL,
  `owner_telephone` int(11) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`property_id`, `p_address`, `type`, `number_of_tenance`, `rent`, `owner_telephone`, `Email`, `status`) VALUES
(3, 'jaffna', 'flat', 8, 30000, 713466700, ' db1980@gmail.com', NULL),
(8, 'Horana', 'Flat', 4, 15000, 112345678, 'To@yahoo.com', 'Unavailable'),
(9, 'gampaha', 'detached house', 5, 20000, 112343478, 'To@yahoo.com', 'Unavailable'),
(11, 'kottawa', 'Flat', 4, 30000, 112345890, 'To@yahoo.com', 'Unavailable'),
(12, 'Homagama', 'Flat', 4, 30000, 112345890, 'To@yahoo.com', 'Unavailable'),
(13, 'nugegoda', 'Flat', 4, 40000, 112345890, 'To@yahoo.com', 'Unavailable'),
(14, 'wattala', 'detached house', 2, 12000, 756789001, 'To@yahoo.com', 'Available'),
(15, 'kottawa', 'flat', 1, 5000, 98800890, 'To@yahoo.com', 'Unavailable'),
(16, 'Homagama', 'detached house', 6, 35000, 756789001, 'To@yahoo.com', 'Available'),
(17, 'Homagama', 'detached house', 7, 35000, 75677890, 'To@yahoo.com', 'Available'),
(18, 'Homagama', 'detached house', 7, 35000, 75677890, 'To@yahoo.com', 'Available'),
(19, 'godagama', 'flat', 5, 60000, 713466700, 'To@yahoo.com', 'Unavailable'),
(20, 'Horana', 'flat', 5, 56000, 63556, 'To@yahoo.com', 'Unavailable'),
(21, 'Horana', 'flat', 5, 56000, 63556, 'To@yahoo.com', 'Available'),
(22, 'Homagama', 'Flat', 4, 50000, 112345890, 'To@yahoo.com', 'Available'),
(23, 'Homagama', 'Flat', 4, 50000, 112345890, 'To@yahoo.com', 'Available'),
(24, 'godagama', 'Flat', 6, 5000, 772322567, 'To@yahoo.com', 'Available'),
(25, 'Homagama', 'Flat', 5, 54635, 5245255, 'To@yahoo.com', 'Available'),
(26, 'Horana', 'flat', 67, 45677, 45246546, 'To@yahoo.com', 'Available'),
(27, 'gampaha', 'Flat', 5, 42666, 5466, 'To@yahoo.com', 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `student_id` varchar(8) NOT NULL,
  `fname` varchar(15) NOT NULL,
  `lname` varchar(15) NOT NULL,
  `address` varchar(80) NOT NULL,
  `email` varchar(30) NOT NULL,
  `telephone` int(11) NOT NULL,
  `password` varchar(8) NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `fname`, `lname`, `address`, `email`, `telephone`, `password`) VALUES
('ST001', 'kamal', 'perera', 'Colombo-03', 'kamal@gmail.com', 775634789, 'kamal123'),
('ST006', 'Kusal', 'janith', 'colombo 07', 'kjanith@gmail.com', 71234567, 'abc'),
('ST007', 'harsha', 'silva', 'homagama', 'hsilva@gmail.com', 772345678, 'abc123'),
('ST010', 'Ranesha', 'Madhurya', 'Kaluthara South', 'rmadhurya@gmail.com', 771487900, 'r123');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 10, 2017 at 06:31 AM
-- Server version: 5.7.19
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
-- Database: `mobiledb`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `insertUser`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUser` (`iname` VARCHAR(20), `iemail` VARCHAR(30), `pwd` VARCHAR(20), OUT `msg` VARCHAR(50))  BEGIN
          if not exists( select name from user where name =  iname) 
          THEN
               insert into user (name,email,password) values (iname,iemail,pwd);
               set msg = "success";
          ELSE
               set msg = "User already exists";
          END IF;
     END$$

--
-- Functions
--
DROP FUNCTION IF EXISTS `validateUser`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `validateUser` (`iname` VARCHAR(20), `pwd` VARCHAR(20)) RETURNS INT(11) BEGIN
    	  declare uid int;	
    	  set @uid= -1;	
          if exists( select name from user where name=iname and pwd=password) 
          THEN               
               select user_id into uid from user
               where name=iname;
               RETURN uid;
          ELSE
               set @uid= -1;
               RETURN @uid;
          END IF;
     END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
CREATE TABLE IF NOT EXISTS `brand` (
  `BRAND_ID` int(11) NOT NULL,
  `BRAND_NAME` varchar(50) NOT NULL,
  `COUNTRY` varchar(50) NOT NULL,
  PRIMARY KEY (`BRAND_ID`,`BRAND_NAME`),
  UNIQUE KEY `BRAND_ID` (`BRAND_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`BRAND_ID`, `BRAND_NAME`, `COUNTRY`) VALUES
(1, 'APPLE', 'USA'),
(2, 'GOOGLE', 'USA'),
(3, 'SAMSUNG', 'SOUTH KOREA'),
(4, 'LG', 'SOUTH KOREA'),
(5, 'BLACKBERRY', 'CANADA'),
(6, 'HUAWEI', 'CHINA'),
(7, 'LENOVO', 'CHINA'),
(8, 'ONEPLUS', 'CHINA'),
(9, 'VIVO', 'CHINA'),
(10, 'XIAOMI', 'CHINA'),
(11, 'NOKIA', 'FINLAND'),
(12, 'XOLO', 'INDIA'),
(13, 'SONY', 'JAPAN'),
(14, 'ACER', 'TAIWAN'),
(15, 'ASUS', 'TAIWAN'),
(16, 'HTC', 'TAIWAN'),
(17, 'VODAFONE', 'UK'),
(18, 'HP', 'USA'),
(19, 'MICROSOFT', 'USA'),
(20, 'RAZER', 'USA'),
(21, 'MOTOROLA', 'CHINA');

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
CREATE TABLE IF NOT EXISTS `model` (
  `MODEL_ID` int(11) NOT NULL,
  `BRAND_ID` int(11) DEFAULT NULL,
  `MODEL_NAME` varchar(20) NOT NULL,
  `PRICE` int(11) NOT NULL,
  `YEAR` int(11) DEFAULT NULL,
  `RATINGS` varchar(10) DEFAULT NULL,
  `REVIEWS` varchar(100) DEFAULT NULL,
  `WARRANTY` varchar(10) DEFAULT NULL,
  `POPULARITY` int(11) NOT NULL DEFAULT '0',
  `img` varchar(50) DEFAULT '''default.png,',
  PRIMARY KEY (`MODEL_ID`,`MODEL_NAME`,`PRICE`),
  UNIQUE KEY `MODEL_ID` (`MODEL_ID`),
  KEY `BRAND_ID` (`BRAND_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `model`
--

INSERT INTO `model` (`MODEL_ID`, `BRAND_ID`, `MODEL_NAME`, `PRICE`, `YEAR`, `RATINGS`, `REVIEWS`, `WARRANTY`, `POPULARITY`, `img`) VALUES
(1, 21, 'MOTO E4 PLUS', 9999, 2017, '4/5', 'The Moto E4 Plus 32GB is a mid-range price smartphone which packs in a lot of great elements such as', '1 YEAR', 0, 'default.png'),
(2, 10, 'REDMI 4A', 7000, 2017, '3/5', 'The most popular phone priced around Rs. 6,000\"', '1 YEAR', 0, 'default.png'),
(3, 21, 'MOTO C PLUS', 6790, 2017, '3/5', 'The most popular phone with 8 MP camera\"', '1 YEAR', 0, 'default.png'),
(4, 11, '3', 8290, 2017, '3/5', 'The best Nokia phone priced around Rs. 8,000', '1 YEAR', 0, 'default.png'),
(5, 7, 'K6 POWER', 9271, 2017, '4/5', 'The best phone priced around Rs. 8,000 with Octa-Core Processor\"', '1 YEAR', 0, 'default.png'),
(6, 3, 'GALAXY On7 Pro', 8990, 2017, '3/5', 'The most popular Phablet priced around Rs. 8,000\"', '1 YEAR', 0, 'default.png'),
(7, 6, 'HONOR 8', 9599, 2017, '4/5', 'The cheapest phone with 12 MP Camera\"', '1 YEAR', 0, 'default.png'),
(8, 3, 'GALAXY J3 Pro', 7990, 2016, '2/5', 'The fastest Samsung phone priced around Rs. 8,000\"', '6 MONTHS', 0, 'default.png'),
(9, 3, 'GALAXY On5 Pro', 7480, 2016, '3/5', 'The cheapest Samsung phone with 16 GB memory', '6 MONTHS', 0, 'default.png'),
(10, 11, '2', 7490, 2017, '2.5/5', NULL, '1 YEAR', 0, 'default.png'),
(11, 10, 'REDMI NOTE 4', 13999, 2017, '4/5', 'The most popular phone in last 30 days\"', '1 YEAR', 0, 'default.png'),
(12, 3, 'GALAXY J7 PRIME', 11890, 2017, '3.7', 'The most popular phone priced around Rs. 12,000\"', '1 YEAR', 0, 'default.png'),
(13, 11, '6', 14999, 2017, '3.7', 'The most popular Nokia phone\"', '1 YEAR', 0, 'default.png'),
(14, 7, 'K8 PLUS', 10999, 2017, '4.2', 'The most popular phone priced around Rs. 10,000', '1 YEAR', 0, 'default.png'),
(15, 21, 'MOTO G5S PLUS', 14999, 2017, '4.5', 'One of the best camera phones below Rs.15000', '1 YEAR', 0, 'default.png'),
(16, 3, 'GALAXY A9 PRO', 22900, 2016, '4.4/5', 'The most popular phone priced around Rs. 22,000\"', '1 YEAR', 0, 'default.png'),
(17, 21, 'MOTO G5 PLUS', 15999, 2017, '4.5/5', 'One of the best camera phones of the year', '1 YEAR', 0, 'default.png'),
(18, 11, '7', 26990, 2017, NULL, NULL, '1 YEAR', 0, 'default.png'),
(19, 10, 'Mi6', 24990, 2017, '5/5', NULL, '1 YEAR', 0, 'default.png'),
(20, 8, '3T', 27899, 2017, '4.7/5', 'The best phone in terms of specifications priced around Rs. 26,000\"', '1 YEAR', 0, 'default.png'),
(21, 1, 'iPhone 6', 25999, 2015, '3.5/5', 'The thinnest phone priced around Rs. 26,000\"', '1 YEAR', 0, 'default.png'),
(22, 11, '8', 34899, 2017, '3.5/5', 'The Nokia 8 comes with the signature build quality we’ve come to expect from the brand, rocks solid ', '1 YEAR', 0, 'default.png'),
(23, 8, '5', 32999, 2017, '4.5/5', 'The best phone in terms of specifications priced around Rs. 32,000', '1 YEAR', 0, 'default.png'),
(24, 3, 'GALAXY S7', 36890, 2016, '4/5', 'If you can afford it, then the Samsung Galaxy S7 is among the best Android flagships you can current', '1 YEAR', 0, 'default.png'),
(25, 3, 'GALAXY S7 EDGE', 38900, 2016, '4.5/5', NULL, '1 YEAR', 0, 'default.png'),
(26, 4, 'G6', 31999, 2017, '4/5', NULL, '1 YEAR', 0, 'default.png'),
(27, 1, 'iPhone 6S', 36870, 2015, '3.4/5', 'The best phone priced around Rs. 36,000 with Dual-Core processor', '1 YEAR', 0, 'default.png'),
(28, 2, 'PIXEL XL', 39999, 2016, '4.5/5', 'The best phone in terms of specifications priced around Rs. 40,000', '1 YEAR', 0, 'default.png'),
(29, 3, 'GALAXY S6 EDGE ', 32999, 2015, '3.7/5', 'The first smartphone in the world with curved display on both its sides', '1 YEAR', 0, 'default.png'),
(30, 1, 'iPhone 6+', 34990, 2015, '3.5/5', 'The first Apple Smartphone with 5.5 inch display', '1 YEAR', 0, 'default.png'),
(31, 5, 'KEYone', 39900, 2015, '4/5', 'The fastest phone priced around Rs. 40,000\"', '1 YEAR', 0, 'default.png'),
(32, 13, 'Xperia Z5', 33490, 2015, '4/5', 'The phone priced around Rs. 34,000 with the most powerful battery', '1 YEAR', 0, 'default.png'),
(33, 16, '10', 33551, 2015, '4/5', 'The best phone priced around Rs. 34,000 with 12 MP Camera', '1 YEAR', 0, 'default.png'),
(34, 21, 'MOTO TURBO', 31999, 2015, '3.5/5', 'The first smartphone from Motorola to sport 21MP rear camera\"', '1 YEAR', 0, 'default.png'),
(35, 13, 'XZs', 36400, 2017, '4/5', NULL, '1 YEAR', 0, 'default.png'),
(36, 2, 'NEXUS 6', 21999, 2015, '3.5/5', 'The first smartphone from Motorola to sport 21MP rear camera\"', '1 YEAR', 0, 'default.png'),
(37, 2, 'NEXUS 6P', 19911, 2015, '4/5', NULL, '1 YEAR', 0, 'default.png'),
(38, 3, 'GALAXY S8', 49000, 2017, '4.7/5', NULL, '1 YEAR', 0, 'default.png'),
(39, 3, 'GALAXY S8+', 49500, 2017, '5/5', 'ONE OF THE BEST PHONES OUT THIS YEAR', '1 YEAR', 0, 'default.png'),
(40, 1, 'iPhone 7', 44990, 2016, '4.5/5', 'The most popular phone priced around Rs. 44,000', '1 YEAR', 0, 'default.png'),
(41, 2, 'PIXEL', 42499, 2016, '5/5', 'The best phone in terms of specifications priced around Rs. 42,000\"', '1 YEAR', 0, 'default.png'),
(42, 20, 'Phone', 45190, 2018, '4/5', NULL, '1 YEAR', 0, 'default.png'),
(43, 1, 'iPhone 8', 59490, 2017, '4.7/5', 'The fastest phone with Dual-Core processor', '1 YEAR', 0, 'default.png'),
(44, 2, 'PIXEL 2', 59999, 2017, '5/5', '\"The best 5 Inch phone in terms of specifications\"', '2 YEARS', 0, 'default.png'),
(45, 1, 'iPhone 7+', 55125, 2016, '4.5/5', 'The best phone with Quad-Core processor and 3 GB RAM', '1 YEAR', 0, 'default.png'),
(46, 3, 'GALAXY NOTE 8', 64999, 2017, '5/5', 'The best display you\'ll ever see in a mobile phone', '1 YEAR', 0, 'default.png'),
(47, 2, 'PIXEL 2XL', 73000, 2017, '5/5', NULL, '2 YEARS', 0, 'default.png'),
(48, 1, 'iPhone 8+', 73499, 2017, '4.8/5', 'The fastest phone with Dual-Core processor', '1 YEAR', 0, 'default.png'),
(49, 5, 'Porsche', 79999, 2017, '3/5', 'The most high-end phone with 8 MP camera', '1 YEAR', 0, 'default.png'),
(50, 1, 'iPhone X', 89000, 2017, '5/5', 'The Apple iPhone X is one of the most groundbreaking launches from Apple as far as both technology a', '1 YEAR', 0, 'default.png');

-- --------------------------------------------------------

--
-- Table structure for table `operating_system`
--

DROP TABLE IF EXISTS `operating_system`;
CREATE TABLE IF NOT EXISTS `operating_system` (
  `OS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `OS_NAME` varchar(15) DEFAULT NULL,
  `OS_VERSION` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`OS_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `operating_system`
--

INSERT INTO `operating_system` (`OS_ID`, `OS_NAME`, `OS_VERSION`) VALUES
(1, 'ANDROID', '5.0'),
(2, 'ANDROID', '6.0'),
(3, 'ANDROID', '7.0'),
(4, 'ANDROID', '8.0'),
(5, 'IOS', '9.0'),
(6, 'IOS', '10.0'),
(7, 'IOS', '11.0');

-- --------------------------------------------------------

--
-- Table structure for table `processor`
--

DROP TABLE IF EXISTS `processor`;
CREATE TABLE IF NOT EXISTS `processor` (
  `PROCESSOR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROCESSOR_NAME` varchar(25) NOT NULL,
  `P_VENDOR` varchar(15) DEFAULT NULL,
  `GPU` varchar(15) DEFAULT NULL,
  `NO_OF_CORES` int(11) DEFAULT NULL,
  PRIMARY KEY (`PROCESSOR_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `processor`
--

INSERT INTO `processor` (`PROCESSOR_ID`, `PROCESSOR_NAME`, `P_VENDOR`, `GPU`, `NO_OF_CORES`) VALUES
(1, ' SNAPDRAGON 205', 'QUALCOMM', 'ADRENO 304', 2),
(2, 'SNAPDRAGON 427', 'QUALCOMM', 'ADRENO 308', 4),
(3, 'SNAPDRAGON 430', 'QUALCOMM', 'ADRENO 505', 8),
(4, 'SNAPDRAGON 435', 'QUALCOMM', 'ADRENO 505', 8),
(5, 'SNAPDRAGON 450', 'QUALCOMM', 'ADRENO 506', 8),
(6, 'SNAPDRAGON 625', 'QUALCOMM', 'ADRENO 506', 8),
(7, 'SNAPDRAGON 626', 'QUALCOMM', 'ADRENO 506', 8),
(8, 'SNAPDRAGON 630', 'QUALCOMM', 'ADRENO 508', 8),
(9, 'SNAPDRAGON 636', 'QUALCOMM', 'ADRENO 508', 8),
(10, 'SNAPDRAGON 650', 'QUALCOMM', 'ADRENO 510', 6),
(11, 'SNAPDRAGON 652', 'QUALCOMM', 'ADRENO 510', 8),
(12, 'SNAPDRAGON 653', 'QUALCOMM', 'ADRENO 510', 8),
(13, 'SNAPDRAGON 660', 'QUALCOMM', 'ADRENO 512', 8),
(14, 'SNAPDRAGON 820', 'QUALCOMM', 'ADRENO 530', 4),
(15, 'SNAPDRAGON 821', 'QUALCOMM', 'ADRENO 530', 4),
(16, 'SNAPDRAGON 835', 'QUALCOMM', 'ADRENO 540', 8),
(17, 'A7', 'APPLE', 'PowerVRG6430', 2),
(18, 'A8', 'APPLE', 'GX6450', 2),
(19, 'A9', 'APPLE', 'GT7600', 2),
(20, 'A10', 'APPLE', 'PowerVR7XT', 4),
(21, 'A11', 'APPLE', NULL, 6),
(23, 'MEDIATEK MT6737', 'MEDIATEK', 'MALI-T720', 4);

-- --------------------------------------------------------

--
-- Table structure for table `sample`
--

DROP TABLE IF EXISTS `sample`;
CREATE TABLE IF NOT EXISTS `sample` (
  `model` varchar(15) NOT NULL,
  `type` varchar(15) NOT NULL,
  `cost` int(11) NOT NULL,
  `features` varchar(50) NOT NULL,
  PRIMARY KEY (`model`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `specifications`
--

DROP TABLE IF EXISTS `specifications`;
CREATE TABLE IF NOT EXISTS `specifications` (
  `BRAND_ID` int(11) NOT NULL,
  `MODEL_ID` int(11) NOT NULL,
  `P_CAMERA` varchar(10) DEFAULT NULL,
  `S_CAMERA` varchar(10) DEFAULT NULL,
  `RAM` varchar(10) DEFAULT NULL,
  `ROM` varchar(10) DEFAULT NULL,
  `SCREEN_SIZE` varchar(10) DEFAULT NULL,
  `OS_ID` int(11) NOT NULL,
  `BATTERY` varchar(10) DEFAULT NULL,
  `PROCESSOR_ID` int(11) NOT NULL,
  `NO_OF_SIMS` int(11) DEFAULT NULL,
  PRIMARY KEY (`BRAND_ID`,`MODEL_ID`,`OS_ID`,`PROCESSOR_ID`),
  KEY `MODEL_ID` (`MODEL_ID`),
  KEY `PROCESSOR_ID` (`PROCESSOR_ID`),
  KEY `OS_ID` (`OS_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `specifications`
--

INSERT INTO `specifications` (`BRAND_ID`, `MODEL_ID`, `P_CAMERA`, `S_CAMERA`, `RAM`, `ROM`, `SCREEN_SIZE`, `OS_ID`, `BATTERY`, `PROCESSOR_ID`, `NO_OF_SIMS`) VALUES
(1, 50, '12/12', '7', '3gb', '512gb', '5.8', 7, '2716', 21, 1),
(1, 48, '12/12', '7', '3gb', '256gb', '5.5', 7, '2691', 21, 1),
(1, 45, '12/12', '7', '3gb', '256gb', '5.5', 6, '2900', 20, 1),
(1, 43, '12', '7', '2gb', '256gb', '4.7', 7, '1821', 21, 1),
(1, 40, '12', '7', '2gb', '256gb', '4.7', 6, '1960', 20, 1),
(1, 30, '8', '1.2', '1000mb', '128gb', '5.5', 5, '2915', 19, 1),
(1, 27, '12', '5', '2gb', '128gb', '4.7', 5, '1715', 19, 1),
(1, 21, '8', '1.2', '1000mb', '128gb', '4.7', 5, '1810', 19, 1),
(2, 47, '12.2', '8', '4gb', '128gb', '6', 4, '3520', 16, 2),
(2, 44, '12.2', '8', '4gb', '128gb', '5', 4, '2700', 16, 2),
(2, 41, '12.3', '8', '4gb', '128gb', '5', 3, '2770', 15, 2),
(2, 37, '12.3', '8', '3gb', '128gb', '5.7', 2, '3450', 14, 2),
(2, 36, '13', '2', '3gb', '64gb', '5.96', 2, '3220', 14, 2),
(2, 28, '12.3', '8', '4gb', '128gb', '5.5', 3, '3450', 15, 2),
(3, 46, '12/12', '8', '6gb', '256gb', '6.3', 3, '3300', 24, 2),
(3, 39, '12', '8', '6gb', '128gb', '6.2', 3, '3500', 24, 2),
(3, 38, '12', '8', '4gb', '128gb', '5.8', 3, '3000', 24, 2),
(3, 29, '16', '5', '4gb', '64gb', '5.7', 2, '3000', 24, 2),
(3, 25, '12', '5', '4gb', '128gb', '5.5', 2, '3600', 14, 2),
(3, 24, '12', '5', '4gb', '64gb', '5.1', 2, '3000', 24, 2),
(3, 16, '16', '8', '4gb', '32gb', '6', 2, '5000', 11, 2),
(3, 12, '13', '8', '3gb', '32gb', '5.5', 2, '3300', 24, 2),
(3, 9, '8', '5', '2gb', '16gb', '5', 2, '2600', 24, 2),
(3, 8, '13', '5', '2gb', '16gb', '5', 3, '2400', 24, 2),
(3, 6, '13', '8', '3gb', '32gb', '5.5', 2, '3300', 6, 2),
(4, 26, '13/13', '5', '4gb', '32/64/128g', '5.7', 3, '3300', 15, 2),
(5, 49, '5', 'No', '768mb', '8gb', '2.8', 8, '1230', 25, 1),
(5, 31, '12', '8', '4gb', '64gb', '4.5', 3, '3505', 6, 2),
(6, 7, '12/12', '8', '4gb', '32/64gb', '5.2', 2, '3000', 26, 2),
(7, 14, '13/5', '8', '4gb', '32gb', '5.2', 3, '4000', 23, 2),
(7, 5, '13', '8', '3gb', '32gb', '5', 2, '4000', 3, 2),
(8, 23, '16/16', '16', '8gb', '128gb', '5.5', 3, '3300', 16, 2),
(8, 20, '16', '16', '6gb', '64/128gb', '5.5', 2, '3400', 15, 2),
(10, 19, '12/12', '8', '6gb', '64/128gb', '5.15', 3, '3350', 16, 2),
(10, 11, '13', '5', '4gb', '64gb', '5.5', 2, '4100', 6, 2),
(10, 2, '13', '5', '2gb', '16/32gb', '5', 2, '3120', 2, 2),
(11, 22, '13/13', '13', '6gb', '128gb', '5.3', 3, '3090', 16, 2),
(11, 18, '16', '5', '6gb', '64gb', '5.2', 3, '3000', 8, 2),
(11, 13, '16', '8', '4gb', '64gb', '5.5', 3, '3000', 3, 2),
(11, 10, '8', '5', '1000mb', '8gb', '5', 3, '4100', 1, 2),
(11, 4, '8', '8', '2gb', '16gb', '5', 3, '2630', 23, 2),
(13, 35, '19', '13', '4gb', '64gb', '5.2', 3, '2900', 14, 2),
(13, 32, '23', '5.1', '3gb', '32gb', '5.2', 1, '2900', 13, 2),
(16, 33, '12', '5', '4gb', '32/64gb', '5.2', 2, '3000', 14, 1),
(20, 42, '12', '8', '8gb', '64gb', '5.7', 3, '4000', 16, 1),
(21, 34, '21', '2', '3gb', '64gb', '5.2', 1, '3900', 13, 1),
(21, 17, '12', '5', '4gb', '64gb', '5.2', 3, '3000', 6, 2),
(21, 15, '13/13', '8', '4gb', '64gb', '5.5', 3, '3000', 6, 2),
(21, 3, '8', '2', '2gb', '16gb', '5', 3, '4000', 23, 2),
(21, 1, '13', '5', '3gb', '32gb', '5.5', 3, '5000', 23, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(20) NOT NULL,
  `EMAIL` varchar(30) NOT NULL,
  `PASSWORD` varchar(20) NOT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--



-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE IF NOT EXISTS `wishlist` (
  `USER_ID` int(11) DEFAULT NULL,
  `BRAND_NAME` varchar(50) DEFAULT NULL,
  `MODEL_NAME` varchar(50) DEFAULT NULL,
  `PRICE` int(11) DEFAULT NULL,
  `BRAND_ID` int(11) NOT NULL,
  `MODEL_ID` int(11) NOT NULL,
  KEY `BRAND_NAME` (`BRAND_NAME`),
  KEY `MODEL_NAME` (`MODEL_NAME`),
  KEY `PRICE` (`PRICE`),
  KEY `USER_ID` (`USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Triggers `wishlist`
--
DROP TRIGGER IF EXISTS `wishlist_delete`;
DELIMITER $$
CREATE TRIGGER `wishlist_delete` AFTER DELETE ON `wishlist` FOR EACH ROW update model set popularity = popularity - 1 
where model_id = old.model_id
  and brand_id = old.brand_id
  and popularity > 0
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `wishlist_insert`;
DELIMITER $$
CREATE TRIGGER `wishlist_insert` BEFORE INSERT ON `wishlist` FOR EACH ROW update model set popularity = popularity +2 
where model_id = new.model_id
  and brand_id = new.brand_id
$$
DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

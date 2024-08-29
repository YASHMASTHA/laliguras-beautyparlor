-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2024 at 05:30 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bpmsdb`
--
CREATE DATABASE IF NOT EXISTS `bpmsdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bpmsdb`;

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `ID` int(10) NOT NULL,
  `AdminName` char(50) DEFAULT NULL,
  `UserName` char(50) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `AdminRegdate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`ID`, `AdminName`, `UserName`, `MobileNumber`, `Email`, `Password`, `AdminRegdate`) VALUES
(1, 'Admin', 'admin', 7898799798, 'tester1@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2024-05-25 06:21:50');

-- --------------------------------------------------------

--
-- Table structure for table `tblbook`
--

CREATE TABLE `tblbook` (
  `ID` int(10) NOT NULL,
  `UserID` int(10) DEFAULT NULL,
  `AptNumber` int(10) DEFAULT NULL,
  `AptDate` date DEFAULT NULL,
  `AptTime` time DEFAULT NULL,
  `Message` mediumtext DEFAULT NULL,
  `Service` varchar(100) DEFAULT NULL,
  `BookingDate` timestamp NULL DEFAULT current_timestamp(),
  `Remark` varchar(250) DEFAULT NULL,
  `Status` varchar(250) DEFAULT NULL,
  `RemarkDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblbook`
--

INSERT INTO `tblbook` (`ID`, `UserID`, `AptNumber`, `AptDate`, `AptTime`, `Message`, `Service`, `BookingDate`, `Remark`, `Status`, `RemarkDate`) VALUES
(4, 10, 931783426, '2024-05-18', '15:40:00', 'NA', 'Bridal Makeup Package', '2024-05-15 05:04:13', NULL, NULL, '2024-06-17 14:37:22'),
(5, 10, 284544154, '2024-05-18', '15:40:00', 'NA', 'Bridal Makeup Package', '2024-05-15 05:04:13', NULL, NULL, '2024-06-17 14:37:22'),
(6, 10, 494039785, '2024-05-31', '14:47:00', 'NA', 'Bridal Makeup Package', '2024-05-15 05:13:24', NULL, NULL, '2024-06-17 14:37:22'),
(8, 10, 891247645, '2024-05-28', '20:14:00', 'nA', 'Bridal Makeup Package', '2024-05-28 08:43:55', 'Your booking is confirmed.', 'Selected', '2024-06-17 14:37:22'),
(12, 13, 944185651, '2024-06-16', '18:00:00', 'haircut', 'Bridal Makeup Package', '2024-06-12 09:49:42', NULL, NULL, '2024-06-17 14:37:22'),
(13, 14, 908332414, '2024-06-15', '13:00:00', 'pedicure', 'Bridal Makeup Package', '2024-06-14 06:17:15', 'thank you for booking', 'Selected', '2024-06-17 14:37:22'),
(14, 14, 156415530, '2024-06-20', '06:00:00', 'makeup', 'Bridal Makeup Package', '2024-06-14 06:17:41', NULL, NULL, '2024-06-17 14:37:22'),
(15, 14, 339796434, '2024-07-05', '13:10:00', 'haircut', 'Bridal Makeup Package', '2024-06-14 06:18:55', NULL, NULL, '2024-06-17 14:37:22'),
(16, 15, 140399822, '2024-06-29', '06:00:00', 'bridal makeup', 'Bridal Makeup Package', '2024-06-15 15:29:53', 'thank you', 'Selected', '2024-06-17 14:37:22'),
(17, 16, 208847700, '2024-06-30', '10:00:00', 'haircut', 'Bridal Makeup Package', '2024-06-15 15:47:53', 'thank you', 'Selected', '2024-06-17 14:37:22'),
(18, 16, 671584352, '2024-06-17', '16:36:00', 'sdasdassa dasda asdasd', 'Normal Menicure', '2024-06-16 07:48:38', NULL, NULL, NULL),
(19, 16, 665109218, '2024-06-18', '17:00:00', 'thank you', 'Keratine', '2024-06-16 08:00:31', 'thank you', 'Selected', '2024-06-16 08:01:18'),
(20, 17, 234190894, '2024-06-18', '10:30:00', 'i would like to have my hair long', 'U-Shape Hair Cut', '2024-06-16 08:05:58', 'thank you', 'Selected', '2024-06-16 08:07:13'),
(21, 17, 719074866, '2024-06-29', '18:00:00', 'please come on time', 'Bridal Makeup Package', '2024-06-16 08:10:15', NULL, NULL, NULL),
(23, 18, 822778095, '2024-06-20', '09:06:00', 'New update', 'Bridal Makeup Package', '2024-06-17 14:20:57', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcontact`
--

CREATE TABLE `tblcontact` (
  `ID` int(10) NOT NULL,
  `FirstName` varchar(200) DEFAULT NULL,
  `LastName` varchar(200) DEFAULT NULL,
  `Phone` bigint(10) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Message` mediumtext DEFAULT NULL,
  `EnquiryDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `IsRead` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblinvoice`
--

CREATE TABLE `tblinvoice` (
  `id` int(11) NOT NULL,
  `Userid` int(11) DEFAULT NULL,
  `ServiceId` int(11) DEFAULT NULL,
  `BillingId` int(11) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblinvoice`
--

INSERT INTO `tblinvoice` (`id`, `Userid`, `ServiceId`, `BillingId`, `PostingDate`) VALUES
(0, 15, 0, 144418494, '2024-06-15 15:31:16'),
(13, 10, 1, 330026346, '2024-05-28 08:51:42'),
(14, 10, 2, 330026346, '2024-05-28 08:51:42'),
(15, 11, 2, 379060040, '2024-05-29 07:36:17'),
(16, 11, 5, 379060040, '2024-05-29 07:36:18'),
(17, 11, 6, 379060040, '2024-05-29 07:36:18'),
(18, 11, 12, 379060040, '2024-05-29 07:36:18'),
(19, 11, 3, 460087279, '2024-06-01 01:03:58');

-- --------------------------------------------------------

--
-- Table structure for table `tblpage`
--

CREATE TABLE `tblpage` (
  `ID` int(10) NOT NULL,
  `PageType` varchar(200) DEFAULT NULL,
  `PageTitle` mediumtext DEFAULT NULL,
  `PageDescription` mediumtext DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `UpdationDate` date DEFAULT NULL,
  `Timing` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblpage`
--

INSERT INTO `tblpage` (`ID`, `PageType`, `PageTitle`, `PageDescription`, `Email`, `MobileNumber`, `UpdationDate`, `Timing`) VALUES
(1, 'aboutus', 'About Us', '                Welcome to our beauty parlor, where we dedicate every stroke and touch to enhance your natural beauty. Step into our sanctuary and experience the epitome of beauty and relaxation, where every visit is an opportunity to rediscover your inner glow. Our skilled team of stylists and aestheticians is committed to delivering personalized services tailored to your unique preferences and individual beauty goals.&nbsp;Experience the epitome of beauty and relaxation at our beauty parlor, where every visit is an opportunity to indulge in the art of self-care and rediscover your inner glow. ', NULL, NULL, NULL, ''),
(2, 'contactus', 'Contact Us', '        Dhumbarahi Chowk, Kathmandu', 'info@gmail.com', 9841591825, NULL, '10:30 am to 6:30 pm');

-- --------------------------------------------------------

--
-- Table structure for table `tblservices`
--

CREATE TABLE `tblservices` (
  `ID` int(10) NOT NULL,
  `ServiceName` varchar(200) DEFAULT NULL,
  `ServiceDescription` mediumtext DEFAULT NULL,
  `Cost` int(10) DEFAULT NULL,
  `Image` varchar(200) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblservices`
--

INSERT INTO `tblservices` (`ID`, `ServiceName`, `ServiceDescription`, `Cost`, `Image`, `CreationDate`) VALUES
(0, 'Hair style', 'Party hair style', 3000, '176b8c8abe5ae7eefa8ec94cedc9e6e21718117367.jpg', '2024-06-11 14:49:27'),
(1, 'Keratine', 'Hair care for long and shiny hair', 1200, 'bd94debbee82dfa9f1494e2afbf57e3a1718346070jpeg', '2024-01-24 22:37:38'),
(2, 'Fruit Facial', 'Fruit facials contain certain fruit acid like glycolic acid, alpha hydroxyl acid, citric acid, phenolic acid, vitamins and minerals in it. ', 500, 'How-To-Do-Fruit-Facial-At-Home.jpg', '2024-01-24 22:37:53'),
(3, 'Charcol Facial', 'Activated charcoal is created from bone char, coconut shells, peat, petroleum coke, coal, olive pits, bamboo, or sawdust. ', 1000, 'b9fb9d37bdf15a699bc071ce49baea531652852364.jpg', '2024-01-24 22:37:10'),
(4, 'Deluxe Menicure', 'A luxurious treatment including a soak and moisturizing exfoliation, cuticle work, nails clipped and filed, hard skin is removed (pedicure) and a renewing mask is applied. ', 500, 'efc1a80c391be252d7d777a437f868701652852477.jpg', '2024-01-24 22:37:34'),
(5, 'Deluxe Pedicure', 'A luxurious treatment including a soak and moisturizing exfoliation, cuticle work, nails clipped and filed, hard skin is removed (pedicure) and a renewing mask is applied. A short massage and your nails are buffed and ready to paint.', 600, '1e6ae4ada992769567b71815f124fac51652852492.jpg', '2024-01-24 22:37:47'),
(6, 'Normal Menicure', 'A luxurious treatment including a soak and moisturizing exfoliation, cuticle work, nails clipped and filed, hard skin is removed (pedicure) and a renewing mask is applied. A short massage and your nails are buffed and ready to paint.', 300, 'aeed9e1cd8ad59abb9ebb46b08bef81b1718466731jpeg', '2024-01-24 22:37:01'),
(7, 'Normal Pedicure', 'A luxurious treatment including a soak and moisturizing exfoliation, cuticle work, nails clipped and filed, hard skin is removed (pedicure) and a renewing mask is applied. A short massage and your nails are buffed and ready to paint.', 400, '1e6ae4ada992769567b71815f124fac51652852492.jpg', '2024-01-24 22:37:19'),
(8, 'U-Shape Hair Cut', 'U-Shape Hair Cut', 250, 'cff8ad28cf40ebf4fbdd383fe546098d1652852593.jpg', '2024-01-24 22:37:38'),
(9, 'Layer Haircut', 'Layer Haircut', 550, '74375080377499ab76dad37484ee7f151652852649.jpg', '2024-01-24 22:37:53'),
(10, 'Bridal Makeup Package', 'Bride hair and makeup', 40000, '449081367c5e999c215511d8a4e8202b1718346511.jpg', '2024-01-24 22:37:08'),
(11, 'Loreal Hair Color(Full)', 'Loreal Hair Color(Full),Loreal Hair Color(Full),Loreal Hair Color(Full)', 1200, 'images.jpg', '2024-01-24 22:37:35');

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `ID` int(10) NOT NULL,
  `FirstName` varchar(120) DEFAULT NULL,
  `LastName` varchar(250) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`ID`, `FirstName`, `LastName`, `MobileNumber`, `Email`, `Password`, `RegDate`) VALUES
(1, 'aayush', 'Shrestha', 9812345678, 'aayush@gmail.com', '1503eda8d9579434aeb8d217f5f03dcf', '2024-06-12 07:59:52'),
(3, 'Abir Singh', NULL, 2147483649, 'abir@gmail.com', '202cb962ac59075b964b07152d234b70', '2024-03-16 08:55:20'),
(4, 'Test Sample', NULL, 8797977779, 'sample@gmail.com', '202cb962ac59075b964b07152d234b70', '2024-04-08 00:06:06'),
(6, 'ghhg', NULL, 8888888888, 'c@gmail.com', '202cb962ac59075b964b07152d234b70', '2024-12-13 23:42:32'),
(7, 'Tina', 'Khan', 9789797987, 'tina@gmail.com', '202cb962ac59075b964b07152d234b70', '2024-05-11 03:36:46'),
(8, 'Hima', 'Sharma', 8979798789, 'hima@gmail.com', '202cb962ac59075b964b07152d234b70', '2024-05-11 03:38:16'),
(11, 'John', 'Doe', 1452632541, 'johndoe@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2024-05-29 01:48:58'),
(12, 'Khusi', NULL, 8956234569, 'khusi@gmail.com', '202cb962ac59075b964b07152d234b70', '2024-03-16 08:37:03'),
(13, 'juni', 'james', 9845100912, 'juni@gmail.com', '3142b106eb2c7bab1739754757cb33d9', '2024-06-12 09:48:53'),
(14, 'rose', 'jane', 9851002387, 'rose@gmail.com', '337b38e2f3bfe3bf7c11e4cd60835bfe', '2024-06-14 06:16:26'),
(15, 'juni', 'Shrestha', 9842450918, 'junis@gmail.com', '3142b106eb2c7bab1739754757cb33d9', '2024-06-15 15:29:17'),
(16, 'Yashma', 'Shrestha', 9812345021, 'yashmas@gmail.com', 'da1b6e75f509471f56b33aaa4046fb18', '2024-06-15 15:47:14'),
(17, 'prakriti', 'Shrestha', 9812345148, 'prakriti@gmail.com', '25c8d353b8f31ad0463953aa194b865a', '2024-06-16 08:05:05'),
(18, 'Aayush', 'Shrestha', 9812345670, 'aayushstha20@gmail.com', '1503eda8d9579434aeb8d217f5f03dcf', '2024-06-17 13:28:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblbook`
--
ALTER TABLE `tblbook`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblcontact`
--
ALTER TABLE `tblcontact`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblinvoice`
--
ALTER TABLE `tblinvoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `tblpage`
--
ALTER TABLE `tblpage`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblservices`
--
ALTER TABLE `tblservices`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID` (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblbook`
--
ALTER TABLE `tblbook`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

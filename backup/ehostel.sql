-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 25, 2023 at 04:55 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ehostel`
--

-- --------------------------------------------------------

--
-- Table structure for table `admission`
--

CREATE TABLE `admission` (
  `admission_id` int(10) NOT NULL,
  `hostellerid` int(10) NOT NULL,
  `room_id` int(10) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admission`
--

INSERT INTO `admission` (`admission_id`, `hostellerid`, `room_id`, `start_date`, `end_date`, `status`) VALUES
(5, 2, 332, '2023-07-19', '2024-07-19', 'Active'),
(6, 1, 298, '2023-07-19', '2024-07-19', 'Active'),
(7, 3, 332, '2023-07-19', '2024-07-19', 'Active'),
(8, 4, 332, '2023-07-19', '2024-07-19', 'Active'),
(9, 5, 332, '2023-07-19', '2024-07-19', 'Active'),
(10, 6, 298, '2023-07-19', '2024-07-19', 'Active'),
(11, 13, 332, '2023-07-20', '2023-07-25', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendanceid` int(10) NOT NULL,
  `admission_id` int(10) NOT NULL,
  `attdate` date NOT NULL,
  `attendancestatus` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attendanceid`, `admission_id`, `attdate`, `attendancestatus`) VALUES
(893, 5, '2023-07-18', 'Present'),
(894, 6, '2023-07-18', 'Present'),
(895, 7, '2023-07-18', 'Present'),
(896, 8, '2023-07-18', 'Present'),
(897, 9, '2023-07-18', 'Present'),
(898, 10, '2023-07-18', 'Present'),
(899, 5, '2023-07-19', 'Present'),
(900, 6, '2023-07-19', 'Present'),
(901, 7, '2023-07-19', 'Present'),
(902, 8, '2023-07-19', 'Present'),
(903, 9, '2023-07-19', 'Present'),
(904, 10, '2023-07-19', 'Present');

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `billid` int(10) NOT NULL,
  `admission_id` int(10) NOT NULL,
  `guestid` int(10) NOT NULL,
  `bill_type` varchar(50) NOT NULL COMMENT 'Hostel Fees, Mess Bill, Water Electricity bill(Generates on blockwise), Mess Bill Penalty, Hostel Fees Payment, Mess Bill Payment, Water Electricity bill Payment, Mess Bill Penalty Payment, Guest Payment, Maintanance Charge, Maintanance Charge payment,',
  `paid_amt` double(10,2) NOT NULL,
  `paid_date` date NOT NULL,
  `payment_type` varchar(25) NOT NULL,
  `particulars` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `billing`
--

INSERT INTO `billing` (`billid`, `admission_id`, `guestid`, `bill_type`, `paid_amt`, `paid_date`, `payment_type`, `particulars`, `status`) VALUES
(0, 5, 0, 'Hostel Fees Payment', 0.00, '2023-07-20', '', 'a:5:{i:0;s:10:\"2023-07-20\";i:1;s:10:\"2023-07-21\";i:2;s:1:\"2\";i:3;s:17:\"To visit sick son\";i:4;s:6:\"thanks\";}', 'Paid'),
(0, 6, 0, 'Hostel Fees Payment', 0.00, '2023-07-20', '', 'a:5:{i:0;s:10:\"2023-07-20\";i:1;s:10:\"2023-07-21\";i:2;s:1:\"2\";i:3;s:17:\"To visit sick son\";i:4;s:6:\"thanks\";}', 'Paid'),
(0, 7, 0, 'Hostel Fees Payment', 0.00, '2023-07-20', '', 'a:5:{i:0;s:10:\"2023-07-20\";i:1;s:10:\"2023-07-21\";i:2;s:1:\"2\";i:3;s:17:\"To visit sick son\";i:4;s:6:\"thanks\";}', 'Paid'),
(0, 8, 0, 'Hostel Fees Payment', 0.00, '2023-07-20', '', 'a:5:{i:0;s:10:\"2023-07-20\";i:1;s:10:\"2023-07-21\";i:2;s:1:\"2\";i:3;s:17:\"To visit sick son\";i:4;s:6:\"thanks\";}', 'Paid'),
(0, 9, 0, 'Hostel Fees Payment', 0.00, '2023-07-20', '', 'a:5:{i:0;s:10:\"2023-07-20\";i:1;s:10:\"2023-07-21\";i:2;s:1:\"2\";i:3;s:17:\"To visit sick son\";i:4;s:6:\"thanks\";}', 'Paid'),
(0, 10, 0, 'Hostel Fees Payment', 0.00, '2023-07-20', '', 'a:5:{i:0;s:10:\"2023-07-20\";i:1;s:10:\"2023-07-21\";i:2;s:1:\"2\";i:3;s:17:\"To visit sick son\";i:4;s:6:\"thanks\";}', 'Paid'),
(0, 0, 2, 'Guest Payment', 0.00, '2023-07-20', '', 'a:5:{i:0;s:10:\"2023-07-20\";i:1;s:10:\"2023-07-21\";i:2;s:1:\"2\";i:3;s:17:\"To visit sick son\";i:4;s:6:\"thanks\";}', 'Paid'),
(0, 5, 0, 'Mess bill', 1200.00, '2023-07-20', 'Debit card', '2023-07', 'Active'),
(0, 11, 0, 'Hostel Fees Payment', 1000.00, '2023-07-20', 'Debit card', 'Card Holder: raian <br> Card number: 1234123412341234 <br> CVV Number: 123 <br> Expiry Date: ', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `blocks`
--

CREATE TABLE `blocks` (
  `block_id` int(10) NOT NULL,
  `block_name` varchar(25) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `blocks`
--

INSERT INTO `blocks` (`block_id`, `block_name`, `description`, `status`) VALUES
(1, 'GIRLS HOSTEL II', 'FOR FRESHERS ', 'Active'),
(2, 'GIRLS HOSTEL I', 'FOR ALL YEAR STUDENTS', 'Active'),
(5, 'BOYS HOSTEL II', 'FOR ALL YEAR STUDENTS', 'Active'),
(8, 'BOYS HOSTEL I', 'FOR FRESHERS', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` int(10) NOT NULL,
  `emp_name` varchar(50) NOT NULL,
  `login_id` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `emp_type` varchar(20) NOT NULL COMMENT 'Admin, Warden',
  `gender` varchar(10) NOT NULL,
  `designation` varchar(50) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `emp_name`, `login_id`, `password`, `emp_type`, `gender`, `designation`, `status`) VALUES
(12, 'Admin', 'admin', 'admin', 'Admin', 'Male', 'Administrator', 'Active'),
(22, 'mojahed', 'mojahed', '123456', 'Warden', 'Male', 'Guard', 'Active'),
(23, 'raian', '1011', '123456', 'Others', 'Male', 'Cook', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `eventid` int(10) NOT NULL,
  `event_title` varchar(250) NOT NULL,
  `event_banner` text NOT NULL,
  `event_description` text NOT NULL,
  `event_date` date NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=hp8 COLLATE=hp8_english_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`eventid`, `event_title`, `event_banner`, `event_description`, `event_date`, `status`) VALUES
(1048, ' Sheikh Rasel Cricket Tournament', 'a:1:{i:0;s:25:\"1695125087bduhostelup.jpg\";}', 'Cricket tournament of BDU', '2023-07-12', 'Published'),
(1049, 'BDU Fees Committee', 'a:1:{i:0;s:27:\"1874099342Feescommittee.jpg\";}', 'Committee for updating rules and regulation of Hall Fees ', '2023-07-13', 'Published');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(10) NOT NULL,
  `hostellerid` int(10) NOT NULL,
  `feedbackdttime` datetime NOT NULL,
  `feedbacksubject` varchar(150) NOT NULL,
  `feedbackmessage` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `hostellerid`, `feedbackdttime`, `feedbacksubject`, `feedbackmessage`) VALUES
(1, 1, '2023-07-20 09:36:46', 'Water Filter damaged', 'Water Filter of our girls hostel are damaged. Take some necessary steps please');

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `fee_id` int(10) NOT NULL,
  `admission_id` int(10) NOT NULL,
  `fee_str_id` int(10) NOT NULL,
  `total_fees` double(10,2) NOT NULL,
  `invoice_date` date NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`fee_id`, `admission_id`, `fee_str_id`, `total_fees`, `invoice_date`, `status`) VALUES
(1, 5, 1, 1000.00, '2023-07-19', 'Active'),
(2, 6, 2, 1000.00, '2023-07-19', 'Active'),
(3, 7, 1, 1000.00, '2023-07-19', 'Active'),
(4, 8, 1, 1000.00, '2023-07-19', 'Active'),
(5, 9, 1, 1000.00, '2023-07-19', 'Active'),
(6, 10, 2, 1000.00, '2023-07-19', 'Active'),
(7, 11, 1, 1000.00, '2023-07-20', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `fees_structure`
--

CREATE TABLE `fees_structure` (
  `fee_str_id` int(10) NOT NULL,
  `block_id` int(10) NOT NULL,
  `hostellertype` varchar(15) NOT NULL COMMENT 'Employee and Student',
  `room_type` varchar(25) NOT NULL COMMENT 'Single, Double, Thriple',
  `cost` float(10,2) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `fees_structure`
--

INSERT INTO `fees_structure` (`fee_str_id`, `block_id`, `hostellertype`, `room_type`, `cost`, `status`) VALUES
(1, 5, 'Student', 'Single Occupancy', 1000.00, 'Active'),
(2, 2, 'Student', 'Single Occupancy', 1000.00, 'Active'),
(3, 1, 'Student', 'Single Occupancy', 1000.00, 'Active'),
(4, 8, 'Student', 'Single Occupancy', 1000.00, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `gallery_type`
--

CREATE TABLE `gallery_type` (
  `gallery_type_id` int(11) NOT NULL,
  `gallery_type` varchar(200) NOT NULL,
  `gallery_type_description` text NOT NULL,
  `gallery_type_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gallery_type`
--

INSERT INTO `gallery_type` (`gallery_type_id`, `gallery_type`, `gallery_type_description`, `gallery_type_status`) VALUES
(4, 'GIRLS HOSTEL', '', 'Active'),
(5, 'BOYS HOSTEL', 'ALL THE FACILITIES THERE', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `guest`
--

CREATE TABLE `guest` (
  `guestid` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `visitreason` varchar(100) NOT NULL,
  `emailid` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `contactno` varchar(15) NOT NULL,
  `comment` text NOT NULL,
  `fromdate` date NOT NULL,
  `todate` date NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `guest`
--

INSERT INTO `guest` (`guestid`, `name`, `visitreason`, `emailid`, `password`, `contactno`, `comment`, `fromdate`, `todate`, `status`) VALUES
(1, 'Raian', '', '1802047@icte.bdu.ac.', '123456', '01854712369', '', '0000-00-00', '0000-00-00', 'Active'),
(2, 'Imran', 'To visit sick son', 'imran@gmail.com', '123456', '01365874521', 'thanks', '2023-07-20', '2023-07-21', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `hosteller`
--

CREATE TABLE `hosteller` (
  `hostellerid` int(10) NOT NULL,
  `hostellertype` varchar(15) NOT NULL COMMENT 'Student',
  `name` varchar(50) NOT NULL,
  `emailid` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `father_name` varchar(50) NOT NULL,
  `mother_name` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `contact_no` varchar(15) NOT NULL,
  `status` varchar(10) NOT NULL,
  `place_belong` varchar(30) NOT NULL,
  `cocurricular_activities` text NOT NULL,
  `session` varchar(30) NOT NULL,
  `gender` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `hosteller`
--

INSERT INTO `hosteller` (`hostellerid`, `hostellertype`, `name`, `emailid`, `password`, `dob`, `father_name`, `mother_name`, `address`, `contact_no`, `status`, `place_belong`, `cocurricular_activities`, `session`, `gender`) VALUES
(1, 'Student', 'Psychee Zaman', '1802001@icte.bdu.ac.bd', '123456', '1999-09-12', 'GJHGJH', 'jfjghf', 'jfggjh', '01236570125', 'Active', '1802001', 'EdTech', '2018-2019', 'Female'),
(2, 'Student', 'Amit Paul', '1802002@icte.bdu.ac.bd', '123456', '2000-10-25', 'ghjgjhg', 'vvmvnv', 'fhjgjhgjh', '01547896541', 'Active', '1802002', 'EdTech', '2018-2019', 'Male'),
(3, 'Student', 'Masnoor Alam', '1802003@icte.bdu.ac.bd', '123456', '1999-12-26', 'hvu', 'kjgy', 'vhffhgj', '01254651548', 'Active', '1802003', 'EdTech', '2018-2019', 'Male'),
(4, 'Student', 'Redwan ul Kawsar', '1802004@icte.bdu.ac.bd', '123456', '2005-01-25', 'gfkjh', 'sgj', 'lajshdl', '01235486548', 'Active', '1802004', 'EdTech', '2018-2019', 'Male'),
(5, 'Student', 'Taufiq Hasan Tusar', '1802005@icte.bdu.ac.bd', '123456', '2002-10-15', 'hjbg', 'xgh', 'bjvy', '01542635178', 'Active', '1802005', 'EdTech', '2018-2019', 'Male'),
(6, 'Student', 'Mun Ema', '1802006@icte.bdu.ac.bd', '123456', '2002-12-29', 'djslkjd', 'anakf', 'akjfhkaj', '01365200147', 'Active', '1802006', 'EdTech', '2018-2019', 'Female'),
(7, 'Student', 'Abid Hassan Sajib', '1802007@icte.bdu.ac.bd', '123456', '2000-02-14', 'jslkjf', 'sfnksj', 'snfkjsf', '01729908417', 'Active', '1802007', 'EdTech', '2018-2019', 'Male'),
(8, 'Student', 'Shampa Biswas', '1802008@icte.bdu.ac.bd', '123456', '2001-03-01', 'ljfoer', 'rhiuhfj', 'fkhkjsh', '01130012510', 'Active', '1802008', 'EdTech', '2018-2019', 'Female'),
(9, 'Student', 'Ahnaf Sahriar Rafat', '1802009@icte.bdu.ac.bd', '123456', '2000-12-31', 'nfdnf', 'ekrh', 'nsnsfjk', '01022233665', 'Active', '1802009', 'EdTech', '2018-2019', 'Male'),
(10, 'Student', 'Nahid Hassan', '1802010@icte.bdu.ac.bd', '123456', '2000-06-06', 'ljdlkj', 'uroi', 'fjhdjkf', '01820000000', 'Active', '1802010', 'EdTech', '2018-2019', 'Male'),
(11, 'Student', 'Manjil Hassan', '1802011@icte.bdu.ac.bd', '123456', '2000-02-01', 'kfhksj', 'hkahk', 'akhfkajh', '01532104587', 'Active', '1802011', 'EdTech', '2018-2019', 'Male'),
(12, 'Student', 'Fatema Tuz Jahura Meem', '1802013@icte.bdu.ac.bd', '123456', '2000-12-31', 'lskjflks', 'kadh', 'jkshfkjs', '01987102546', 'Active', '1802013', 'EdTech', '2018-2019', 'Female'),
(13, 'Student', 'raian', 'ddd@g.com', '123456', '2000-02-08', 'abc', 'def', 'abcd', '01786225698', 'Active', 'abc', 'EdTech', '2018-2019', 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `hostel_application`
--

CREATE TABLE `hostel_application` (
  `hostel_application_id` bigint(20) NOT NULL,
  `hostellerid` bigint(20) NOT NULL,
  `hostel_type` varchar(50) NOT NULL,
  `room_type` varchar(50) NOT NULL,
  `hostel_status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hostel_application`
--

INSERT INTO `hostel_application` (`hostel_application_id`, `hostellerid`, `hostel_type`, `room_type`, `hostel_status`) VALUES
(1, 1, 'Girls Hostel', 'Single-Occupancy', 'Approved'),
(2, 2, 'Boys Hostel', 'Single-Occupancy', 'Approved'),
(3, 3, 'Boys Hostel', 'Single-Occupancy', 'Approved'),
(4, 4, 'Boys Hostel', 'Single-Occupancy', 'Approved'),
(5, 5, 'Boys Hostel', 'Single-Occupancy', 'Approved'),
(7, 6, 'Boys Hostel', 'Single-Occupancy', 'Approved'),
(8, 7, 'Boys Hostel', 'Single-Occupancy', 'Approved'),
(9, 12, 'Girls Hostel', 'Single-Occupancy', 'Approved'),
(10, 13, 'Boys Hostel', 'Single-Occupancy', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `leave_application`
--

CREATE TABLE `leave_application` (
  `leave_application_id` bigint(20) NOT NULL,
  `hostellerid` bigint(20) NOT NULL,
  `application_dt` date NOT NULL,
  `from_dt` date NOT NULL,
  `to_dt` date NOT NULL,
  `leave_reason` text NOT NULL,
  `person_visiting` text NOT NULL,
  `guardian` text NOT NULL,
  `leave_status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leave_application`
--

INSERT INTO `leave_application` (`leave_application_id`, `hostellerid`, `application_dt`, `from_dt`, `to_dt`, `leave_reason`, `person_visiting`, `guardian`, `leave_status`) VALUES
(1, 3, '2023-07-19', '2023-07-19', '2023-07-20', 'sick', 'parents', 'dsdw', 'Pending'),
(2, 13, '2023-07-20', '2023-07-21', '2023-07-22', 'sickness', 'parents', 'jhgh', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `mess_bill`
--

CREATE TABLE `mess_bill` (
  `mess_bill_id` int(10) NOT NULL,
  `admission_id` int(10) NOT NULL,
  `charge_type` varchar(20) NOT NULL COMMENT 'Monthly mess bill , Penalty 25 per day',
  `date` date NOT NULL,
  `mess_bill` double(10,2) NOT NULL,
  `note` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `mess_bill`
--

INSERT INTO `mess_bill` (`mess_bill_id`, `admission_id`, `charge_type`, `date`, `mess_bill`, `note`, `status`) VALUES
(1, 0, 'Room rent', '2023-07-01', 1000.00, '', 'Charges'),
(8, 0, 'Room rent', '2023-07-01', 1000.00, '', 'Charges'),
(9, 0, 'Mess Bill', '2023-07-01', 3100.00, '', 'Charges'),
(10, 0, 'Water Electricity', '2023-07-01', 0.00, '', 'Charges'),
(11, 0, 'Maintenance', '2023-07-01', 0.00, '', 'Charges'),
(12, 0, 'Total Charges', '2023-07-01', 4100.00, '', 'Charges'),
(13, 5, 'Room Rent', '2023-07-01', 1000.00, 'pay first', 'Active'),
(14, 5, 'Mess Bill', '2023-07-01', 200.00, 'pay first', 'Active'),
(15, 5, 'Water Electricity', '2023-07-01', 0.00, 'pay first', 'Active'),
(16, 5, 'Maintenance', '2023-07-01', 0.00, 'pay first', 'Active'),
(17, 5, 'Total Charges', '2023-07-01', 1200.00, 'pay first', 'Active'),
(18, 6, 'Room Rent', '2023-07-01', 1000.00, 'pay first', 'Active'),
(19, 6, 'Mess Bill', '2023-07-01', 200.00, 'pay first', 'Active'),
(20, 6, 'Water Electricity', '2023-07-01', 0.00, 'pay first', 'Active'),
(21, 6, 'Maintenance', '2023-07-01', 0.00, 'pay first', 'Active'),
(22, 6, 'Total Charges', '2023-07-01', 1200.00, 'pay first', 'Active'),
(23, 7, 'Room Rent', '2023-07-01', 1000.00, 'pay first', 'Active'),
(24, 7, 'Mess Bill', '2023-07-01', 200.00, 'pay first', 'Active'),
(25, 7, 'Water Electricity', '2023-07-01', 0.00, 'pay first', 'Active'),
(26, 7, 'Maintenance', '2023-07-01', 0.00, 'pay first', 'Active'),
(27, 7, 'Total Charges', '2023-07-01', 1200.00, 'pay first', 'Active'),
(28, 8, 'Room Rent', '2023-07-01', 1000.00, 'pay first', 'Active'),
(29, 8, 'Mess Bill', '2023-07-01', 200.00, 'pay first', 'Active'),
(30, 8, 'Water Electricity', '2023-07-01', 0.00, 'pay first', 'Active'),
(31, 8, 'Maintenance', '2023-07-01', 0.00, 'pay first', 'Active'),
(32, 8, 'Total Charges', '2023-07-01', 1200.00, 'pay first', 'Active'),
(33, 9, 'Room Rent', '2023-07-01', 1000.00, 'pay first', 'Active'),
(34, 9, 'Mess Bill', '2023-07-01', 200.00, 'pay first', 'Active'),
(35, 9, 'Water Electricity', '2023-07-01', 0.00, 'pay first', 'Active'),
(36, 9, 'Maintenance', '2023-07-01', 0.00, 'pay first', 'Active'),
(37, 9, 'Total Charges', '2023-07-01', 1200.00, 'pay first', 'Active'),
(38, 10, 'Room Rent', '2023-07-01', 1000.00, 'pay first', 'Active'),
(39, 10, 'Mess Bill', '2023-07-01', 200.00, 'pay first', 'Active'),
(40, 10, 'Water Electricity', '2023-07-01', 0.00, 'pay first', 'Active'),
(41, 10, 'Maintenance', '2023-07-01', 0.00, 'pay first', 'Active'),
(42, 10, 'Total Charges', '2023-07-01', 1200.00, 'pay first', 'Active'),
(79, 5, 'Penalty', '2023-05-01', 975.00, '', 'Active'),
(80, 6, 'Penalty', '2023-05-01', 975.00, '', 'Active'),
(81, 7, 'Penalty', '2023-05-01', 975.00, '', 'Active'),
(82, 8, 'Penalty', '2023-05-01', 975.00, '', 'Active'),
(83, 9, 'Penalty', '2023-05-01', 975.00, '', 'Active'),
(84, 10, 'Penalty', '2023-05-01', 975.00, '', 'Active'),
(121, 5, 'Penalty', '2023-07-01', 0.00, '', 'Active'),
(122, 6, 'Penalty', '2023-07-01', 0.00, '', 'Active'),
(123, 7, 'Penalty', '2023-07-01', 0.00, '', 'Active'),
(124, 8, 'Penalty', '2023-07-01', 0.00, '', 'Active'),
(125, 9, 'Penalty', '2023-07-01', 0.00, '', 'Active'),
(126, 10, 'Penalty', '2023-07-01', 0.00, '', 'Active'),
(133, 0, 'Room rent', '2023-06-01', 1000.00, '', 'Charges'),
(134, 0, 'Mess Bill', '2023-06-01', 3000.00, '', 'Charges'),
(135, 0, 'Water Electricity', '2023-06-01', 0.00, '', 'Charges'),
(136, 0, 'Maintenance', '2023-06-01', 0.00, '', 'Charges'),
(137, 0, 'Total Charges', '2023-06-01', 4000.00, '', 'Charges'),
(138, 5, 'Room Rent', '2023-06-01', 1000.00, '', 'Active'),
(139, 5, 'Mess Bill', '2023-06-01', 0.00, '', 'Active'),
(140, 5, 'Water Electricity', '2023-06-01', 0.00, '', 'Active'),
(141, 5, 'Maintenance', '2023-06-01', 0.00, '', 'Active'),
(142, 5, 'Total Charges', '2023-06-01', 1000.00, '', 'Active'),
(143, 6, 'Room Rent', '2023-06-01', 1000.00, '', 'Active'),
(144, 6, 'Mess Bill', '2023-06-01', 0.00, '', 'Active'),
(145, 6, 'Water Electricity', '2023-06-01', 0.00, '', 'Active'),
(146, 6, 'Maintenance', '2023-06-01', 0.00, '', 'Active'),
(147, 6, 'Total Charges', '2023-06-01', 1000.00, '', 'Active'),
(148, 7, 'Room Rent', '2023-06-01', 1000.00, '', 'Active'),
(149, 7, 'Mess Bill', '2023-06-01', 0.00, '', 'Active'),
(150, 7, 'Water Electricity', '2023-06-01', 0.00, '', 'Active'),
(151, 7, 'Maintenance', '2023-06-01', 0.00, '', 'Active'),
(152, 7, 'Total Charges', '2023-06-01', 1000.00, '', 'Active'),
(153, 8, 'Room Rent', '2023-06-01', 1000.00, '', 'Active'),
(154, 8, 'Mess Bill', '2023-06-01', 0.00, '', 'Active'),
(155, 8, 'Water Electricity', '2023-06-01', 0.00, '', 'Active'),
(156, 8, 'Maintenance', '2023-06-01', 0.00, '', 'Active'),
(157, 8, 'Total Charges', '2023-06-01', 1000.00, '', 'Active'),
(158, 9, 'Room Rent', '2023-06-01', 1000.00, '', 'Active'),
(159, 9, 'Mess Bill', '2023-06-01', 0.00, '', 'Active'),
(160, 9, 'Water Electricity', '2023-06-01', 0.00, '', 'Active'),
(161, 9, 'Maintenance', '2023-06-01', 0.00, '', 'Active'),
(162, 9, 'Total Charges', '2023-06-01', 1000.00, '', 'Active'),
(163, 10, 'Room Rent', '2023-06-01', 1000.00, '', 'Active'),
(164, 10, 'Mess Bill', '2023-06-01', 0.00, '', 'Active'),
(165, 10, 'Water Electricity', '2023-06-01', 0.00, '', 'Active'),
(166, 10, 'Maintenance', '2023-06-01', 0.00, '', 'Active'),
(167, 10, 'Total Charges', '2023-06-01', 1000.00, '', 'Active'),
(168, 11, 'Room Rent', '2023-06-01', 1000.00, '', 'Active'),
(169, 11, 'Mess Bill', '2023-06-01', 0.00, '', 'Active'),
(170, 11, 'Water Electricity', '2023-06-01', 0.00, '', 'Active'),
(171, 11, 'Maintenance', '2023-06-01', 0.00, '', 'Active'),
(172, 11, 'Total Charges', '2023-06-01', 1000.00, '', 'Active'),
(173, 5, 'Penalty', '0000-00-00', 487950.00, '', 'Active'),
(174, 6, 'Penalty', '0000-00-00', 487950.00, '', 'Active'),
(175, 7, 'Penalty', '0000-00-00', 487950.00, '', 'Active'),
(176, 8, 'Penalty', '0000-00-00', 487950.00, '', 'Active'),
(177, 9, 'Penalty', '0000-00-00', 487950.00, '', 'Active'),
(178, 10, 'Penalty', '0000-00-00', 487950.00, '', 'Active'),
(179, 11, 'Penalty', '0000-00-00', 487950.00, '', 'Active'),
(180, 5, 'Penalty', '2023-06-01', 250.00, '', 'Active'),
(181, 6, 'Penalty', '2023-06-01', 250.00, '', 'Active'),
(182, 7, 'Penalty', '2023-06-01', 250.00, '', 'Active'),
(183, 8, 'Penalty', '2023-06-01', 250.00, '', 'Active'),
(184, 9, 'Penalty', '2023-06-01', 250.00, '', 'Active'),
(185, 10, 'Penalty', '2023-06-01', 250.00, '', 'Active'),
(186, 11, 'Penalty', '2023-06-01', 250.00, '', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

CREATE TABLE `photo` (
  `photo_id` int(11) NOT NULL,
  `gallery_type_id` int(11) NOT NULL,
  `photo_title` varchar(100) NOT NULL,
  `photo_img` varchar(300) NOT NULL,
  `photo_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `photo`
--

INSERT INTO `photo` (`photo_id`, `gallery_type_id`, `photo_title`, `photo_img`, `photo_status`) VALUES
(7, 4, 'Girls Hostel ', '875828796gh.png', 'Published'),
(8, 4, 'MESS', '2079655783Girl_2.jpg', 'Published'),
(9, 4, 'STUDY ROOM', '633213291Girl_3.jpg', 'Published'),
(11, 4, 'TV ROOM', '199992883Girl_4.jpg', 'Published'),
(13, 4, 'NIGHTVIEW', '2123474794ghl.png', 'Published'),
(21, 4, 'READING ROOM', '2010324834TV ROOM.jpg', 'Published'),
(32, 5, 'BOYS HOSTEL', '437106425bduhostel.jpg', 'Published'),
(33, 5, 'HOSTEL GROUND 1', '1007513588bh.png', 'Published'),
(34, 5, 'HOSTEL GROUND 2', '97210775roof view.png', 'Published'),
(35, 5, 'DINING', '1096150340Dining.png', 'Published'),
(36, 5, 'BOYS COMMON ROOM', '1405287675tv.png', 'Published'),
(37, 5, 'CORRIDOR', '1004194333cor.png', 'Published');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room_id` int(10) NOT NULL,
  `block_id` int(10) NOT NULL,
  `fee_str_id` int(10) NOT NULL,
  `room_no` int(10) NOT NULL,
  `no_of_beds` int(5) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`room_id`, `block_id`, `fee_str_id`, `room_no`, `no_of_beds`, `description`, `status`) VALUES
(298, 2, 2, 1101, 4, 'Seat:A,B,C,D', 'Active'),
(299, 2, 2, 1102, 4, 'Seat:A,B,C,D', 'Active'),
(300, 2, 2, 1201, 4, 'Seat:A,B,C,D', 'Active'),
(301, 2, 2, 1202, 4, 'Seat:A,B,C,D', 'Active'),
(302, 2, 2, 1301, 4, 'Seat:A,B,C,D', 'Active'),
(303, 2, 2, 1302, 4, 'Seat:A,B,C,D', 'Active'),
(304, 2, 2, 1401, 4, 'Seat:A,B,C,D', 'Active'),
(305, 2, 2, 1402, 4, 'Seat:A,B,C,D', 'Active'),
(306, 2, 2, 1501, 4, 'Seat:A,B,C,D', 'Active'),
(307, 2, 2, 1502, 4, 'Seat:A,B,C,D', 'Active'),
(308, 1, 3, 2101, 3, 'Seat:A,B,C', 'Active'),
(309, 1, 3, 2102, 3, 'Seat:A,B,C', 'Active'),
(310, 1, 3, 2103, 3, 'Seat:A,B,C', 'Active'),
(311, 1, 3, 2201, 3, 'Seat:A,B,C', 'Active'),
(312, 1, 3, 2202, 3, 'Seat:A,B,C', 'Active'),
(313, 1, 3, 2203, 3, 'Seat:A,B,C', 'Active'),
(314, 1, 3, 2301, 3, 'Seat:A,B,C', 'Active'),
(315, 1, 3, 2302, 3, 'Seat:A,B,C', 'Active'),
(316, 1, 3, 2303, 3, 'Seat:A,B,C', 'Active'),
(317, 1, 3, 2401, 3, 'Seat:A,B,C', 'Active'),
(318, 1, 3, 2402, 3, 'Seat:A,B,C', 'Active'),
(319, 1, 3, 2403, 3, 'Seat:A,B,C', 'Active'),
(320, 8, 4, 1101, 2, 'Seat:A,B', 'Active'),
(321, 8, 4, 1102, 2, 'Seat:A,B', 'Active'),
(322, 8, 4, 1103, 2, 'Seat:A,B', 'Active'),
(323, 8, 4, 1104, 2, 'Seat:A,B', 'Active'),
(324, 8, 4, 1105, 2, 'Seat:A,B', 'Active'),
(325, 8, 4, 1106, 2, 'Seat:A,B', 'Active'),
(326, 8, 4, 1107, 2, 'Seat:A,B', 'Active'),
(327, 8, 4, 1108, 2, 'Seat:A,B', 'Active'),
(328, 8, 4, 1109, 2, 'Seat:A,B', 'Active'),
(329, 5, 1, 2101, 5, 'Seat:A,B,C,D,E', 'Inactive'),
(330, 5, 1, 2102, 5, 'Seat:A,B,C,D,E', 'Inactive'),
(331, 5, 1, 2103, 5, 'Seat:A,B,C,D,E', 'Inactive'),
(332, 5, 1, 2104, 5, 'Seat:A,B,C,D,E', 'Active'),
(333, 5, 1, 2105, 5, 'Seat:A,B,C,D,E', 'Active'),
(334, 5, 1, 2106, 5, 'Seat:A,B,C,D,E', 'Active'),
(335, 5, 1, 2107, 5, 'Seat:A,B,C,D,E', 'Active'),
(336, 5, 1, 2108, 2, 'Seat:A,B', 'Active'),
(337, 5, 1, 2109, 4, 'Seat:A,B,C,D', 'Active'),
(338, 5, 1, 2201, 5, 'Seat:A,B,C,D,E', 'Active'),
(339, 5, 1, 2202, 5, 'Seat:A,B,C,D,E', 'Active'),
(340, 5, 1, 2203, 5, 'Seat:A,B,C,D,E', 'Active'),
(341, 5, 1, 2204, 5, 'Seat:A,B,C,D,E', 'Active'),
(342, 5, 1, 2205, 5, 'Seat:A,B,C,D,E', 'Active'),
(343, 5, 1, 2206, 5, 'Seat:A,B,C,D,E', 'Active'),
(344, 5, 1, 2207, 5, 'Seat:A,B,C,D,E', 'Active'),
(345, 5, 1, 2208, 2, 'Seat:A,B', 'Active'),
(346, 5, 1, 2209, 4, 'Seat:A,B,C,D', 'Active'),
(347, 5, 1, 2301, 3, 'Seat:A,B,C', 'Active'),
(348, 5, 1, 2302, 3, 'Seat:A,B,C', 'Active'),
(349, 5, 1, 2303, 3, 'Seat:A,B,C', 'Active'),
(350, 5, 1, 2304, 3, 'Seat:A,B,C', 'Active'),
(351, 5, 1, 2305, 3, 'Seat:A,B,C', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `vacate_room`
--

CREATE TABLE `vacate_room` (
  `vacate_room_id` bigint(20) NOT NULL,
  `admission_id` bigint(20) NOT NULL,
  `from_date` date NOT NULL,
  `enddate` date NOT NULL,
  `paid_amt` double NOT NULL,
  `vacate_date` date NOT NULL,
  `tot_num_days` bigint(20) NOT NULL,
  `tot_refundable_amt` double NOT NULL,
  `vacate_reason` text NOT NULL,
  `refund_status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `vacate_room`
--

INSERT INTO `vacate_room` (`vacate_room_id`, `admission_id`, `from_date`, `enddate`, `paid_amt`, `vacate_date`, `tot_num_days`, `tot_refundable_amt`, `vacate_reason`, `refund_status`) VALUES
(1, 11, '2023-07-20', '2024-07-20', 1000, '2023-07-25', 361, 986, 'house nearby', 'Pending');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admission`
--
ALTER TABLE `admission`
  ADD PRIMARY KEY (`admission_id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendanceid`);

--
-- Indexes for table `blocks`
--
ALTER TABLE `blocks`
  ADD PRIMARY KEY (`block_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`eventid`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`fee_id`);

--
-- Indexes for table `fees_structure`
--
ALTER TABLE `fees_structure`
  ADD PRIMARY KEY (`fee_str_id`);

--
-- Indexes for table `gallery_type`
--
ALTER TABLE `gallery_type`
  ADD PRIMARY KEY (`gallery_type_id`);

--
-- Indexes for table `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`guestid`);

--
-- Indexes for table `hosteller`
--
ALTER TABLE `hosteller`
  ADD PRIMARY KEY (`hostellerid`);

--
-- Indexes for table `hostel_application`
--
ALTER TABLE `hostel_application`
  ADD PRIMARY KEY (`hostel_application_id`);

--
-- Indexes for table `leave_application`
--
ALTER TABLE `leave_application`
  ADD PRIMARY KEY (`leave_application_id`);

--
-- Indexes for table `mess_bill`
--
ALTER TABLE `mess_bill`
  ADD PRIMARY KEY (`mess_bill_id`);

--
-- Indexes for table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`photo_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_id`);

--
-- Indexes for table `vacate_room`
--
ALTER TABLE `vacate_room`
  ADD PRIMARY KEY (`vacate_room_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admission`
--
ALTER TABLE `admission`
  MODIFY `admission_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendanceid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=905;

--
-- AUTO_INCREMENT for table `blocks`
--
ALTER TABLE `blocks`
  MODIFY `block_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `emp_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `eventid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1053;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fees`
--
ALTER TABLE `fees`
  MODIFY `fee_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `fees_structure`
--
ALTER TABLE `fees_structure`
  MODIFY `fee_str_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `gallery_type`
--
ALTER TABLE `gallery_type`
  MODIFY `gallery_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `guest`
--
ALTER TABLE `guest`
  MODIFY `guestid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hosteller`
--
ALTER TABLE `hosteller`
  MODIFY `hostellerid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `hostel_application`
--
ALTER TABLE `hostel_application`
  MODIFY `hostel_application_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `leave_application`
--
ALTER TABLE `leave_application`
  MODIFY `leave_application_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mess_bill`
--
ALTER TABLE `mess_bill`
  MODIFY `mess_bill_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;

--
-- AUTO_INCREMENT for table `photo`
--
ALTER TABLE `photo`
  MODIFY `photo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `room_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=352;

--
-- AUTO_INCREMENT for table `vacate_room`
--
ALTER TABLE `vacate_room`
  MODIFY `vacate_room_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

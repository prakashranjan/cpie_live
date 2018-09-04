-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 04, 2018 at 05:06 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carbon`
--

-- --------------------------------------------------------

--
-- Table structure for table `access`
--

CREATE TABLE `access` (
  `access_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `post_mode` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `wakt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tagless` int(1) NOT NULL DEFAULT '0',
  `personal` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `access`
--

INSERT INTO `access` (`access_id`, `image_id`, `post_mode`, `category_id`, `owner_id`, `wakt`, `tagless`, `personal`) VALUES
(1, 1, 0, 1, 1, '2017-12-13 21:21:15', 1, 1),
(2, 2, 1, 1, 2, '2018-01-16 06:19:23', 0, 1),
(3, 3, 1, 5, 2, '2018-01-20 18:07:31', 0, 0),
(4, 4, 1, 1, 2, '2018-01-20 19:13:38', 0, 1),
(5, 5, 1, 8, 2, '2018-01-20 19:17:41', 0, 1),
(6, 6, 1, 1, 2, '2018-01-20 20:31:00', 0, 0),
(7, 7, 1, 7, 2, '2018-02-09 21:33:33', 0, 1),
(8, 8, 1, 9, 2, '2018-02-09 21:35:37', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `access_mem_p`
--

CREATE TABLE `access_mem_p` (
  `a_mem_p_Id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `access_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `access_mem_p`
--

INSERT INTO `access_mem_p` (`a_mem_p_Id`, `user_id`, `access_id`, `image_id`) VALUES
(1, 2, 1, 1),
(2, 1, 2, 2),
(3, 1, 4, 4),
(4, 1, 5, 5),
(5, 1, 7, 7),
(6, 1, 8, 8);

-- --------------------------------------------------------

--
-- Table structure for table `access_stud`
--

CREATE TABLE `access_stud` (
  `a_stud_id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `year` int(1) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `access_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `tag_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `access_stud`
--

INSERT INTO `access_stud` (`a_stud_id`, `course_id`, `branch_id`, `year`, `section_id`, `access_id`, `image_id`, `tag_type`) VALUES
(1, NULL, 1, NULL, NULL, 2, 2, 3),
(2, NULL, NULL, NULL, 16, 2, 2, 4),
(3, NULL, NULL, NULL, 6, 3, 3, 4),
(4, NULL, NULL, NULL, 10, 4, 4, 4),
(5, NULL, NULL, NULL, 10, 5, 5, 4),
(6, NULL, NULL, NULL, 16, 6, 6, 4),
(7, NULL, 1, 4, NULL, 7, 7, 5),
(8, NULL, 2, 4, NULL, 7, 7, 5),
(9, NULL, NULL, NULL, 8, 7, 7, 4),
(10, NULL, NULL, NULL, 16, 7, 7, 4),
(11, NULL, 1, 4, NULL, 8, 8, 5),
(12, NULL, 2, 4, NULL, 8, 8, 5);

-- --------------------------------------------------------

--
-- Table structure for table `access_teach`
--

CREATE TABLE `access_teach` (
  `teacher_id` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `access_id` int(11) NOT NULL,
  `tag_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `barcode_sign`
--

CREATE TABLE `barcode_sign` (
  `id` int(11) NOT NULL,
  `year` int(2) NOT NULL,
  `branch` varchar(6) NOT NULL,
  `roll_no` int(3) NOT NULL,
  `form_fill` int(1) NOT NULL DEFAULT '0',
  `full_cid` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `branch_id` int(11) NOT NULL,
  `branch_short` varchar(30) NOT NULL,
  `branch_full` varchar(250) NOT NULL,
  `course_id` int(11) NOT NULL,
  `branch_count` int(11) NOT NULL DEFAULT '0',
  `tot_sections` int(11) NOT NULL,
  `views` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`branch_id`, `branch_short`, `branch_full`, `course_id`, `branch_count`, `tot_sections`, `views`) VALUES
(1, 'CSE', 'COMPUTER SCIENCE ENGINEERING', 1, 0, 2, 2),
(2, 'IT', 'INFORMATION TECHNOLOGY', 1, 1, 2, 7),
(3, 'ECE', 'ELECTRONICS AND COMMUNICATION ENGINEERING', 1, 0, 2, 0),
(4, 'EE', 'ELECTRICAL ENGINEERING', 1, 0, 2, 0),
(5, 'CE', 'CIVIL ENGINEERING', 1, 0, 2, 0),
(6, 'IC', 'INSTRUMENTATION AND CONTROL ENGINEERING', 1, 0, 2, 0),
(8, 'ME', 'MECHANICAL ENGINEERING', 1, 0, 3, 0),
(9, 'EEE', 'ELECTRICAL AND ELECTRONICS ENGINEERING', 1, 0, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `broadcast_comments`
--

CREATE TABLE `broadcast_comments` (
  `comment_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `caption` text NOT NULL,
  `eye` int(11) NOT NULL DEFAULT '0',
  `event` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `owner` varchar(30) NOT NULL,
  `anonymous` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `broadcast_comments`
--

INSERT INTO `broadcast_comments` (`comment_id`, `image_id`, `username`, `caption`, `eye`, `event`, `owner`, `anonymous`) VALUES
(1, 1, 'prs786', ' Hi ha ', 0, '2018-01-16 06:40:47', 'prs786', 0),
(2, 6, 'prs786', ' Hell ', 1, '2018-02-05 21:04:14', 'prs786', 0);

-- --------------------------------------------------------

--
-- Table structure for table `broadcast_comment_slam`
--

CREATE TABLE `broadcast_comment_slam` (
  `s_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `comment_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `broadcast_comment_slam`
--

INSERT INTO `broadcast_comment_slam` (`s_id`, `username`, `comment_id`) VALUES
(1, 'prs786', 2);

-- --------------------------------------------------------

--
-- Table structure for table `broadcast_poll_count`
--

CREATE TABLE `broadcast_poll_count` (
  `count_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `event` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `broadcast_poll_count`
--

INSERT INTO `broadcast_poll_count` (`count_id`, `option_id`, `image_id`, `username`, `event`) VALUES
(1, 1, 8, 'prs786', '2018-02-09 21:38:59');

-- --------------------------------------------------------

--
-- Table structure for table `broadcast_poll_option`
--

CREATE TABLE `broadcast_poll_option` (
  `option_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `poll_option` varchar(50) NOT NULL,
  `hits` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `broadcast_poll_option`
--

INSERT INTO `broadcast_poll_option` (`option_id`, `image_id`, `poll_option`, `hits`) VALUES
(1, 8, 'Virat kohli', 1),
(2, 8, 'Steve smith', 0),
(3, 8, 'Joe root', 0);

-- --------------------------------------------------------

--
-- Table structure for table `broadcast_post`
--

CREATE TABLE `broadcast_post` (
  `image_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `category_id` int(11) NOT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  `caption` text,
  `eye` int(11) NOT NULL DEFAULT '0',
  `event` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `file_name` varchar(255) DEFAULT NULL,
  `owner` varchar(30) NOT NULL,
  `anonymous` int(11) NOT NULL DEFAULT '0',
  `thumb_name` varchar(255) DEFAULT NULL,
  `gif_name` varchar(255) DEFAULT NULL,
  `poll_type` int(1) DEFAULT NULL,
  `comment_count` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `broadcast_post`
--

INSERT INTO `broadcast_post` (`image_id`, `username`, `category_id`, `image_name`, `caption`, `eye`, `event`, `file_name`, `owner`, `anonymous`, `thumb_name`, `gif_name`, `poll_type`, `comment_count`) VALUES
(1, 'alpha', 1, 'broadcast_user_files/alpha/thumb/MjAxNy0xMi0xMyAxNjo1MQ==cmagv3m94agn5dksah92tpaqu7/collegeclassroom.jpg', NULL, 1, '2017-12-13 21:21:15', NULL, 'alpha', 0, 'broadcast_user_files/alpha/MjAxNy0xMi0xMyAxNjo1MQ==cmagv3m94agn5dksah92tpaqu7/collegeclassroom.jpg', NULL, NULL, 1),
(2, 'prs786', 1, NULL, 'Social media is also a medium where students can establish beneficial connections for their careers. As an educational institution, it is crucial to be active in many social platforms possible, this helps create better student training strategies and shapes student culture.', 1, '2018-01-16 06:19:23', NULL, 'prs786', 0, NULL, NULL, NULL, 0),
(3, 'prs786', 5, NULL, 'watch this\n<br><iframe style="height:400px; width:100%;" class="img-thumbnail" src="https://www.youtube.com/embed/v-_et7D0H6c" frameborder="0" allowfullscreen></iframe></br>', 0, '2018-01-20 18:07:31', NULL, 'prs786', 0, NULL, NULL, NULL, 0),
(4, 'prs786', 1, NULL, 'must watch\n<br><iframe style="height:400px; width:100%;" class="img-thumbnail" src="https://www.youtube.com/embed/0tunikYq7pQ" frameborder="0" allowfullscreen></iframe></br>', 0, '2018-01-20 19:13:38', NULL, 'prs786', 0, NULL, NULL, NULL, 0),
(5, 'prs786', 8, NULL, 'must watch\n<br><iframe style="height:400px; width:100%;" class="img-thumbnail" src="https://www.youtube.com/embed/0tunikYq7pQ" frameborder="0" allowfullscreen></iframe></br>', 0, '2018-01-20 19:17:41', NULL, 'prs786', 0, NULL, NULL, NULL, 0),
(6, 'prs786', 1, NULL, '<br><iframe style="height:400px; width:100%;" class="img-thumbnail" src="https://www.youtube.com/embed/0tunikYq7pQ" frameborder="0" allowfullscreen></iframe></br>', 0, '2018-01-20 20:31:00', NULL, 'prs786', 0, NULL, NULL, NULL, 1),
(7, 'prs786', 7, 'broadcast_user_files/prs786/thumb/MjAxOC0wMi0wOSAxNzowMw==ntauje6rl0538612krp5msa3b5/screenshot_20180204114756649.jpeg', 'CSR VS SSR', 0, '2018-02-09 21:33:33', NULL, 'prs786', 0, 'broadcast_user_files/prs786/MjAxOC0wMi0wOSAxNzowMw==ntauje6rl0538612krp5msa3b5/screenshot_20180204114756649.jpeg', NULL, NULL, 0),
(8, 'prs786', 9, NULL, 'Best batsman?', 0, '2018-02-09 21:35:37', NULL, 'prs786', 0, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `broadcast_slam`
--

CREATE TABLE `broadcast_slam` (
  `s_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `chat_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `broadcast_slam`
--

INSERT INTO `broadcast_slam` (`s_id`, `topic_id`, `username`, `chat_id`) VALUES
(4, 2, 'prs786', 1),
(2, 2, 'prs786', 2);

-- --------------------------------------------------------

--
-- Table structure for table `broadcast_tags`
--

CREATE TABLE `broadcast_tags` (
  `tag_id` int(11) NOT NULL,
  `tag_name` varchar(80) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `mode` int(11) NOT NULL DEFAULT '0',
  `type` int(3) NOT NULL,
  `ref_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `broadcast_tags`
--

INSERT INTO `broadcast_tags` (`tag_id`, `tag_name`, `count`, `mode`, `type`, `ref_id`) VALUES
(1, 'CSE_1_YR1', 0, 0, 4, 1),
(2, 'CSE_2_YR1', 0, 0, 4, 2),
(3, 'CSE_1_YR2', 0, 0, 4, 3),
(4, 'CSE_2_YR2', 0, 0, 4, 4),
(5, 'CSE_1_YR3', 0, 0, 4, 5),
(6, 'CSE_2_YR3', 0, 0, 4, 6),
(7, 'CSE_1_YR4', 0, 0, 4, 7),
(8, 'CSE_2_YR4', 0, 0, 4, 8),
(9, 'IT_1_YR1', 0, 0, 4, 9),
(10, 'IT_2_YR1', 0, 0, 4, 10),
(11, 'IT_1_YR2', 0, 0, 4, 11),
(12, 'IT_2_YR2', 0, 0, 4, 12),
(13, 'IT_1_YR3', 0, 0, 4, 13),
(14, 'IT_2_YR3', 0, 0, 4, 14),
(15, 'IT_1_YR4', 0, 0, 4, 15),
(16, 'IT_2_YR4', 0, 0, 4, 16),
(17, 'ECE_1_YR1', 0, 0, 4, 17),
(18, 'ECE_2_YR1', 0, 0, 4, 18),
(19, 'ECE_1_YR2', 0, 0, 4, 19),
(20, 'ECE_2_YR2', 0, 0, 4, 20),
(21, 'ECE_1_YR3', 0, 0, 4, 21),
(22, 'ECE_2_YR3', 0, 0, 4, 22),
(23, 'ECE_1_YR4', 0, 0, 4, 23),
(24, 'ECE_2_YR4', 0, 0, 4, 24),
(25, 'EE_1_YR1', 0, 0, 4, 25),
(26, 'EE_2_YR1', 0, 0, 4, 26),
(27, 'EE_1_YR2', 0, 0, 4, 27),
(28, 'EE_2_YR2', 0, 0, 4, 28),
(29, 'EE_1_YR3', 0, 0, 4, 29),
(30, 'EE_2_YR3', 0, 0, 4, 30),
(31, 'EE_1_YR4', 0, 0, 4, 31),
(32, 'EE_2_YR4', 0, 0, 4, 32),
(33, 'CE_1_YR1', 0, 0, 4, 33),
(34, 'CE_2_YR1', 0, 0, 4, 34),
(35, 'CE_1_YR2', 0, 0, 4, 35),
(36, 'CE_2_YR2', 0, 0, 4, 36),
(37, 'CE_1_YR3', 0, 0, 4, 37),
(38, 'CE_2_YR3', 0, 0, 4, 38),
(39, 'CE_1_YR4', 0, 0, 4, 39),
(40, 'CE_2_YR4', 0, 0, 4, 40),
(41, 'IC_1_YR1', 0, 0, 4, 41),
(42, 'IC_2_YR1', 0, 0, 4, 42),
(43, 'IC_1_YR2', 0, 0, 4, 43),
(44, 'IC_2_YR2', 0, 0, 4, 44),
(45, 'IC_1_YR3', 0, 0, 4, 45),
(46, 'IC_2_YR3', 0, 0, 4, 46),
(47, 'IC_1_YR4', 0, 0, 4, 47),
(48, 'IC_2_YR4', 0, 0, 4, 48),
(57, 'ME_1_YR1', 0, 0, 4, 57),
(58, 'ME_2_YR1', 0, 0, 4, 58),
(59, 'ME_1_YR2', 0, 0, 4, 59),
(60, 'ME_2_YR2', 0, 0, 4, 60),
(61, 'ME_1_YR3', 0, 0, 4, 61),
(62, 'ME_2_YR3', 0, 0, 4, 62),
(63, 'ME_1_YR4', 0, 0, 4, 63),
(64, 'ME_2_YR4', 0, 0, 4, 64),
(65, 'EEE_1_YR1', 0, 0, 4, 65),
(66, 'EEE_2_YR1', 0, 0, 4, 66),
(67, 'EEE_1_YR2', 0, 0, 4, 67),
(68, 'EEE_2_YR2', 0, 0, 4, 68),
(69, 'EEE_1_YR3', 0, 0, 4, 69),
(70, 'EEE_2_YR3', 0, 0, 4, 70),
(71, 'EEE_1_YR4', 0, 0, 4, 71),
(72, 'EEE_2_YR4', 0, 0, 4, 72),
(73, 'CO-Bachelor of Technology', 0, 0, 2, 1),
(74, 'CO-Master of Business Administration', 0, 0, 2, 2),
(75, 'CO-Master of Computer Application', 0, 0, 2, 3),
(76, 'BR-COMPUTER SCIENCE ENGINEERING', 0, 0, 3, 1),
(77, 'YR-1_COMPUTER SCIENCE ENGINEERING', 0, 0, 5, 1),
(78, 'YR-2_COMPUTER SCIENCE ENGINEERING', 0, 0, 5, 1),
(79, 'YR-3_COMPUTER SCIENCE ENGINEERING', 0, 0, 5, 1),
(80, 'YR-4_COMPUTER SCIENCE ENGINEERING', 0, 0, 5, 1),
(81, 'BR-INFORMATION TECHNOLOGY', 0, 0, 3, 2),
(82, 'YR-1_INFORMATION TECHNOLOGY', 0, 0, 5, 2),
(83, 'YR-2_INFORMATION TECHNOLOGY', 0, 0, 5, 2),
(84, 'YR-3_INFORMATION TECHNOLOGY', 0, 0, 5, 2),
(85, 'YR-4_INFORMATION TECHNOLOGY', 0, 0, 5, 2),
(86, 'BR-ELECTRONICS AND COMMUNICATION ENGINEERING', 0, 0, 3, 3),
(87, 'YR-1_ELECTRONICS AND COMMUNICATION ENGINEERING', 0, 0, 5, 3),
(88, 'YR-2_ELECTRONICS AND COMMUNICATION ENGINEERING', 0, 0, 5, 3),
(89, 'YR-3_ELECTRONICS AND COMMUNICATION ENGINEERING', 0, 0, 5, 3),
(90, 'YR-4_ELECTRONICS AND COMMUNICATION ENGINEERING', 0, 0, 5, 3),
(91, 'BR-ELECTRICAL ENGINEERING', 0, 0, 3, 4),
(92, 'YR-1_ELECTRICAL ENGINEERING', 0, 0, 5, 4),
(93, 'YR-2_ELECTRICAL ENGINEERING', 0, 0, 5, 4),
(94, 'YR-3_ELECTRICAL ENGINEERING', 0, 0, 5, 4),
(95, 'YR-4_ELECTRICAL ENGINEERING', 0, 0, 5, 4),
(96, 'BR-CIVIL ENGINEERING', 0, 0, 3, 5),
(97, 'YR-1_CIVIL ENGINEERING', 0, 0, 5, 5),
(98, 'YR-2_CIVIL ENGINEERING', 0, 0, 5, 5),
(99, 'YR-3_CIVIL ENGINEERING', 0, 0, 5, 5),
(100, 'YR-4_CIVIL ENGINEERING', 0, 0, 5, 5),
(101, 'BR-INSTRUMENTATION AND CONTROL ENGINEERING', 0, 0, 3, 6),
(102, 'YR-1_INSTRUMENTATION AND CONTROL ENGINEERING', 0, 0, 5, 6),
(103, 'YR-2_INSTRUMENTATION AND CONTROL ENGINEERING', 0, 0, 5, 6),
(104, 'YR-3_INSTRUMENTATION AND CONTROL ENGINEERING', 0, 0, 5, 6),
(105, 'YR-4_INSTRUMENTATION AND CONTROL ENGINEERING', 0, 0, 5, 6),
(111, 'BR-MECHANICAL ENGINEERING', 0, 0, 3, 8),
(112, 'YR-1_MECHANICAL ENGINEERING', 0, 0, 5, 8),
(113, 'YR-2_MECHANICAL ENGINEERING', 0, 0, 5, 8),
(114, 'YR-3_MECHANICAL ENGINEERING', 0, 0, 5, 8),
(115, 'YR-4_MECHANICAL ENGINEERING', 0, 0, 5, 8),
(116, 'BR-ELECTRICAL AND ELECTRONICS ENGINEERING', 0, 0, 3, 9),
(117, 'YR-1_ELECTRICAL AND ELECTRONICS ENGINEERING', 0, 0, 5, 9),
(118, 'YR-2_ELECTRICAL AND ELECTRONICS ENGINEERING', 0, 0, 5, 9),
(119, 'YR-3_ELECTRICAL AND ELECTRONICS ENGINEERING', 0, 0, 5, 9),
(120, 'YR-4_ELECTRICAL AND ELECTRONICS ENGINEERING', 0, 0, 5, 9),
(121, 'YR-1_BTECH', 0, 0, 6, 1),
(122, 'YR-2_BTECH', 0, 0, 6, 1),
(123, 'YR-3_BTECH', 0, 0, 6, 1),
(124, 'YR-4_BTECH', 0, 0, 6, 1),
(125, 'TEACHERS', 0, 2, 1, 0),
(126, 'EVERYONE', 0, 2, 1, 0),
(127, 'STUDENTS', 0, 0, 1, 0),
(128, 'ME_3_YR4', 0, 0, 4, 60),
(129, 'ME_3_YR3', 0, 0, 4, 57),
(130, 'ME_3_YR2', 0, 0, 4, 54),
(131, 'ME_3_YR1', 0, 0, 4, 51);

-- --------------------------------------------------------

--
-- Table structure for table `b_post_index`
--

CREATE TABLE `b_post_index` (
  `bpi_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `mem_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `dexter` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `b_post_index`
--

INSERT INTO `b_post_index` (`bpi_id`, `image_id`, `mem_id`, `category_id`, `dexter`) VALUES
(1, 1, 1, 1, 1),
(2, 1, 2, 1, 1),
(3, 2, 2, 1, 1),
(4, 2, 1, 1, 1),
(5, 3, 2, 5, 1),
(6, 4, 1, 1, 1),
(7, 5, 1, 8, 1),
(8, 4, 2, 1, 1),
(9, 5, 2, 8, 1),
(10, 6, 2, 1, 1),
(11, 8, 2, 9, 1),
(12, 7, 2, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `channel_comments`
--

CREATE TABLE `channel_comments` (
  `comment_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `caption` text,
  `eye` int(11) NOT NULL DEFAULT '0',
  `event` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `owner` varchar(30) NOT NULL,
  `anonymous` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `channel_comment_slam`
--

CREATE TABLE `channel_comment_slam` (
  `s_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `comment_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `channel_favs`
--

CREATE TABLE `channel_favs` (
  `fav_id` int(11) NOT NULL,
  `mem_id` int(11) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `section_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `channel_favs`
--

INSERT INTO `channel_favs` (`fav_id`, `mem_id`, `views`, `section_id`) VALUES
(1, 1, 3, 16);

-- --------------------------------------------------------

--
-- Table structure for table `channel_poll_count`
--

CREATE TABLE `channel_poll_count` (
  `count_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `event` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `channel_poll_option`
--

CREATE TABLE `channel_poll_option` (
  `option_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `poll_option` varchar(50) NOT NULL,
  `hits` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `channel_post`
--

CREATE TABLE `channel_post` (
  `image_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `category` varchar(255) NOT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  `caption` text,
  `eye` int(11) NOT NULL DEFAULT '0',
  `event` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `file_name` varchar(255) DEFAULT NULL,
  `owner` varchar(30) NOT NULL,
  `anonymous` int(11) NOT NULL DEFAULT '0',
  `thumb_name` varchar(255) DEFAULT NULL,
  `gif_name` varchar(255) DEFAULT NULL,
  `poll_type` int(1) DEFAULT NULL,
  `comment_count` int(11) NOT NULL DEFAULT '0',
  `mode_id` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `channel_post`
--

INSERT INTO `channel_post` (`image_id`, `username`, `category`, `image_name`, `caption`, `eye`, `event`, `file_name`, `owner`, `anonymous`, `thumb_name`, `gif_name`, `poll_type`, `comment_count`, `mode_id`) VALUES
(1, 'prs786', 'IT_2_YR4', 'channel_user_files/prs786/IT_2_YR4/thumb/MjAxNy0xMi0xMyAxNjo0Mg==7ukfd6qnmlvc9mon6d6im1e916/1488585080307 2.jpg', NULL, 1, '2017-12-13 21:12:13', NULL, 'prs786', 0, 'channel_user_files/prs786/IT_2_YR4/MjAxNy0xMi0xMyAxNjo0Mg==7ukfd6qnmlvc9mon6d6im1e916/1488585080307 2.jpg', NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `channel_slam`
--

CREATE TABLE `channel_slam` (
  `s_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `chat_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `channel_slam`
--

INSERT INTO `channel_slam` (`s_id`, `topic_id`, `username`, `chat_id`) VALUES
(1, 16, 'prs786', 1);

-- --------------------------------------------------------

--
-- Table structure for table `channel_user_online`
--

CREATE TABLE `channel_user_online` (
  `login_id` int(11) NOT NULL,
  `session` varchar(100) NOT NULL,
  `time` int(11) NOT NULL,
  `mem_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `channel_user_online`
--

INSERT INTO `channel_user_online` (`login_id`, `session`, `time`, `mem_id`, `topic_id`) VALUES
(1, 'g6lgd7tgr24s52hdaga9rhtv14', 1512242281, 1, 0),
(2, 'bs4lucr9a2ikrl87ovaij2phr2', 1512244051, 1, 0),
(3, 'clc4cmj5ucpffvvc783vjusjf4', 1513078280, 1, 16),
(4, '7ukfd6qnmlvc9mon6d6im1e916', 1513166754, 2, 16),
(5, 'cmagv3m94agn5dksah92tpaqu7', 1513180204, 1, 16),
(6, '0h91k5uop7gos2vc1cuh3sm2j5', 1513180744, 2, 0),
(7, '35ddr3h42r71ttoiceg8augut3', 1513181392, 2, 16),
(8, 'bfgme2i6hs15on6eh8plunfch1', 1513189833, 2, 16),
(9, '0i9a575lha82u9enujsrl0r1j7', 1513191047, 2, 16),
(10, '4rff98mot5o2b3r7tf44hj0m82', 1513191218, 1, 13),
(11, 'vsqnnbi8ommvs3f1mldm4m1gp3', 1514927092, 2, 16),
(12, 'aqoer1fq035vtopbnam8fcdpp2', 1514928926, 2, 0),
(13, '09pgsdg7vq8nm25gms7pa88fc0', 1515156115, 2, 0),
(14, '3520fefh3pa47j90tu2jsg5021', 1515161464, 2, 0),
(15, 'klvdb0palhumh5rmp6pdv1cmm7', 1515163021, 2, 0),
(16, 'k3tdsiedbc3cf5v2vbl2mk1pf0', 1515224221, 2, 0),
(17, 'valrf29hrvg9b2e1usj9l5lrn2', 1515248285, 2, 0),
(18, 'feq8fvfvl75tp0qt61ul099315', 1515273299, 2, 16),
(19, 'qu9np7lrfr3vj7bq4b38r9m5r3', 1515275444, 2, 0),
(20, '27cphftmkapd7ra73uf5tbh6n2', 1515336414, 2, 16),
(21, '6llrurn8imvi6f0a1etpcqfq81', 1515342466, 2, 0),
(22, '0jljlotcbnn3brhgkt9n2lh516', 1515351608, 2, 0),
(23, 'vev5hrhajm52lsre2gbtdooph3', 1515351899, 2, 0),
(24, 'ekbqpgp547f9m04ebttt0erdo1', 1515356220, 2, 0),
(25, 'a88vb50otrt1bnq4tu61e3nvi2', 1515359256, 2, 16),
(26, 'csr24geu9ni6ir73tpuae6utp2', 1515414972, 2, 16),
(27, '2surbgoj56oat05jks86s6vuh7', 1515416365, 2, 16),
(28, 'bkvrv1bq1hn6n2bap2dtd48h43', 1515426263, 2, 16),
(29, '6vhrlp7m8e3ke8ieqrdg7746m3', 1515427272, 2, 0),
(30, 'i91g9he96ohc01gv07ui7pudg7', 1515450010, 2, 0),
(31, '1eer4fa5bof5j6q5lrnueqm6o0', 1515455507, 2, 0),
(32, 'e222104egf8fl19empcjgv6lu3', 1515456933, 2, 0),
(33, 'rdngmskpemdf4sk4gmps0tnpu7', 1515457377, 2, 16),
(34, '7ni5n2e9u31amdd9cmje8t1rp3', 1515460605, 1, 0),
(35, '16lefo4l83f20jmoncfube91q7', 1515498609, 2, 0),
(36, '3udeja4kgnn6ankh6rt29bjcl7', 1515506167, 2, 0),
(37, 'pgv46jeeen1hqdi01d06qivn47', 1515774348, 2, 0),
(38, 'ada6ieraahb8uivntsl3psstf6', 1515774792, 2, 0),
(39, '3m4o5ghtmb5fu5jtla3g6hfh04', 1515871777, 2, 0),
(40, 'qpo5eg9mqqa1rtrogs376c91m5', 1516023963, 2, 0),
(41, 'uiq7qpt6qfbbf3hq01tfi56ph7', 1516059239, 2, 0),
(42, 'so0sc76s0cvibullmmoiun69r3', 1516059541, 2, 0),
(43, 'kf7m7s29ob6qbltp6suej52qb5', 1516059940, 2, 0),
(44, '7ctlu4ru0kb5o74r023mfcta40', 1516097523, 2, 0),
(45, 'j8ekoieekf1d5ve6h5fnn7v196', 1516103510, 2, 0),
(46, 'rkg30sue7eeqtrjql9bs9f61u1', 1516108155, 2, 0),
(47, 'ep7kd5gv7cq7gh5acb82ja8pu2', 1516109849, 1, 16),
(48, '76ejjvhfp92e370hirf8n84f13', 1516111178, 2, 0),
(49, 'nvacp89la8nfee7a5bjpq4b9q7', 1516111586, 1, 0),
(50, '42bm515jncec2lhs9ad3kqfha2', 1516111623, 2, 16),
(51, '1jpkibjum2722ch0thm9o3app6', 1516116972, 2, 0),
(52, 'm0icjfrjlkqf7v42q8qhre1h41', 1516197560, 2, 16),
(53, 'a0oaipirf6t6p33cgkqnreo065', 1516205607, 2, 0),
(54, 'j65beja3f3hfkg9hc5vlbqng30', 1516206547, 2, 0),
(55, 'spujha34sqg125u4nm77qqek03', 1516206669, 2, 0),
(56, 'be1568ie3jv3qbavp9mmg76h07', 1516443866, 2, 0),
(57, '9ja1nn4il16d1kqddfkvu89k51', 1516444162, 2, 0),
(58, '1ursnt1kmv7nqgh3kc5q5jd5k1', 1516444316, 2, 0),
(59, '51ol6vdvutt75igt7kiskp2ju7', 1516444551, 2, 0),
(60, 'bgbb02qu6j5cft05erp7onrua0', 1516445100, 2, 0),
(61, 'bp2n96ilqvdsg05gmpclmj7nv6', 1516450824, 2, 0),
(62, '9rlfhmq78hsppequta94tem5a4', 1516451963, 1, 6),
(63, 'ptv1f6mi7so4ud9rj2b9kiffa7', 1516452773, 2, 0),
(64, '7477ter92s9761bd2n9kq3ndp3', 1516453369, 2, 0),
(65, 'uf3f3lu3n2e1u3d14lcjtv3tb1', 1516455873, 1, 0),
(66, 'kocg6niv8hmtluqrv16mbs6v86', 1516456183, 2, 0),
(67, 'ie4qdcpnislve3m6pbq1ptg4n2', 1516459151, 2, 0),
(68, 'hmiduhvvv8g993pdgtdt85kab0', 1516460406, 2, 0),
(69, 'ptqn7pbfosbkfkvsudsq28ljj2', 1516460997, 1, 0),
(70, 'jlsgrd7dt3knlhvfdlqgeaerp1', 1516461786, 2, 0),
(71, 'b2qcdi3bui0e7lkiq374vnt5f2', 1516462513, 1, 16),
(72, 'jjker9ko27768k5h5sca81din5', 1516462951, 2, 0),
(73, 'hb8apuedu09fb9oq8v9cnn2l35', 1516463729, 2, 0),
(74, 'ktkc2hsd4luqptepkeokso5mf4', 1516496727, 2, 0),
(75, 'sqogarjv2upvd8721cm7jruoe3', 1516497150, 1, 0),
(76, 'qiigomirm16dk73osrjr5ov1v7', 1516497765, 2, 0),
(77, 'pqcammep8nmbej41otlvgme7n6', 1516500367, 2, 0),
(78, 'rcg0k5998ka8cip0h9jc25bj62', 1516500431, 2, 0),
(79, '2610kr0qvgva5kmj4bipheev11', 1516500633, 2, 0),
(80, 't15f76njc07n5h64sclr010l07', 1516504118, 2, 0),
(81, 'oftf4t0fdnt504kvrmprq9oli0', 1516504945, 2, 0),
(82, '48013tr08ahnk1tegeqfa4pg27', 1516505008, 2, 0),
(83, '7li2dchlm5mth75nifgrtu48l0', 1516505278, 2, 16),
(84, '22hfkma3ie3qiktheop3pia6g7', 1516526434, 2, 0),
(85, 'm22pojbv0uc9ifdrg7870bfp52', 1516670847, 2, 16),
(86, 'amqiqjc818udhsa3qnulm64rr6', 1516671370, 2, 0),
(87, 'nhtq8aevb6qnb2h97gaia4keu3', 1516673325, 2, 0),
(88, '9ue1jl69pmcinronlfg500u224', 1516945283, 2, 0),
(89, 'ui82bod73oubjne7pu12sg4hd7', 1516946536, 2, 0),
(90, 'r17hnviekff4v4og1854563464', 1516946836, 2, 0),
(91, 'p0o7fnmivq3m5qvo3c76astl07', 1517026152, 2, 0),
(92, 't55vh119rktjpdnihpq2vaqtu6', 1517281018, 2, 0),
(93, 'n69cknj3jvlpfa8tng389evku5', 1517281707, 2, 0),
(94, 'ug5qctjnduecm7kt673vfbm8r1', 1517281843, 2, 0),
(95, '8gvl05797jijpcq1mbnkpovnj4', 1517282029, 1, 0),
(96, 'h9djpe1p5tqsj8bsb7aro9kl00', 1517282157, 2, 0),
(97, 'k64e8kvv83stlv6ocavc0cvjf3', 1517282265, 1, 0),
(98, '4tc8055k3ub9flrlmdk1v14cq5', 1517283049, 2, 16),
(99, 'dfo33avqo2072jfvh078qf8qr3', 1517304485, 2, 0),
(100, 'abv598sdh0m6dg5pj23hobtam0', 1517487825, 2, 0),
(101, 'j3d54pqpf0d401sok58f118b11', 1517566440, 2, 0),
(102, '562f6hs1obnbfl933ongqtuab2', 1517566857, 2, 0),
(103, 'oqphjvb1trnkse638a3eh7ar86', 1517567213, 2, 0),
(104, '1q08gr0bd8pmuiqemtqm460jm2', 1517569866, 2, 0),
(105, 'ffvlbjf29uhsp8tueiou6g4k44', 1517572230, 2, 0),
(106, '5kh63hfcffbn0ilnpk94fttbh5', 1517576784, 2, 0),
(107, 'dkja0jc90qg493ip1quj625p46', 1517578809, 2, 0),
(108, '0nir65vfsdq46n026e5aocq5a3', 1517586055, 2, 0),
(109, 'ru8rrfbd5iacqn6i506nr2d835', 1517752248, 2, 0),
(110, 'tvu0kht7lerk4caesu2cokgug5', 1517760863, 1, 0),
(111, '5m6gii2c2j2ip1v0rutdstip45', 1517768872, 2, 0),
(112, 'ovgucqtpf1a63gp8bm84gglf16', 1517826684, 2, 0),
(113, '1frd81uu08end6fff9hv1fh3o7', 1517835086, 1, 16),
(114, 'jil95mgfq2ieaj4dcvg5v6fcj3', 1517835253, 2, 0),
(115, '0h75le8t8i17aev3n88u3dq3m7', 1517837323, 2, 0),
(116, 'm0ge7ifv8aasq3cac2ubkf97k6', 1517838056, 2, 0),
(117, '4rjur3l7rn0a57h9492tm01um1', 1517838726, 2, 0),
(118, 'qu98rsonjbum23skisjp99r3s0', 1517841729, 2, 0),
(119, 'duodnl7gi97c51lpicacu3l2q0', 1517843758, 2, 0),
(120, '56dgd8nm1sdbngagfjd2ds0b30', 1517846307, 2, 0),
(121, 'e961h0kk3bfs9l8b1ihcg7vm80', 1517846685, 2, 0),
(122, '45hiaatnogiejihh8mrna34qc0', 1517847007, 2, 0),
(123, 'b93j7tvsgdomgo1pokk06q0o71', 1517943468, 2, 0),
(124, 'frlrflepg6qphuudpfec5aplr5', 1518002563, 2, 0),
(125, '4602ovdkkf5ujrlo0gde04dd50', 1518003511, 2, 0),
(126, 'n5bm6v5rjjksfeqpjkl6b8bp11', 1518082544, 2, 0),
(127, 'gmfhld5ereagv99csg7ha5f7k7', 1518082649, 2, 0),
(128, 'tqei7kn27l3h2sfpjv63dn8oj0', 1518088567, 2, 0),
(129, '6qugp9gu25jpqciunmlo476n00', 1518101553, 2, 16),
(130, 't8smjnkq2aeitdsv5mv5kjj1s4', 1518125295, 2, 0),
(131, '0enn330f0i50hl04spciet3mk0', 1518136436, 2, 16),
(132, 'e81jsavv44kil4vb0q5nc9js10', 1518176012, 2, 0),
(133, 'ntauje6rl0538612krp5msa3b5', 1518190856, 2, 0),
(134, 'n2c3p09r5d14p697f5694p7j32', 1518206424, 2, 0),
(135, 'jr81klomdd9qjg1dns0ci9uo17', 1518210013, 2, 0),
(136, 'u1q9991q16o2d0r7h75lrhnco4', 1518384268, 2, 0),
(137, 'rsim4n855fojdqnfgsmvmlr2e1', 1518442872, 2, 0),
(138, 'g2gjmeiu9r7b9b1mnffugdqlb3', 1518446356, 2, 0),
(139, 'avssg4jr0rgq4bcjam2fgsmtb2', 1518446611, 2, 0),
(140, 'irma5pomgq5b6dsin529sn0jp2', 1518446740, 2, 0),
(141, '7t8vlgi27prmrtls3sfqom8sm1', 1518535238, 2, 0),
(142, 'cbknq2ufc9hbobeqa89bggreq6', 1518536012, 2, 0),
(143, 'sal98qgk8fd10lit9dc3fft2o6', 1518560373, 2, 0),
(144, 'ui48vfdunmpsig6p7it2o4gcf3', 1518560481, 2, 0),
(145, 'hcvesmtttqlcb1a9mmpp4e7af0', 1518577794, 2, 0),
(146, 'g1d76a1d70gkiq96h64l1uapo5', 1526591723, 2, 0),
(147, 'vvodhp05d9o0ep79tki8jhir71', 1526591930, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `caption` text,
  `eye` int(11) NOT NULL DEFAULT '0',
  `event` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `owner` varchar(30) NOT NULL,
  `anonymous` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comment_slam`
--

CREATE TABLE `comment_slam` (
  `s_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `comment_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `mode_id` int(11) NOT NULL,
  `course_short` varchar(50) NOT NULL,
  `course_full` varchar(250) NOT NULL,
  `course_count` int(11) NOT NULL DEFAULT '0',
  `duration` int(11) NOT NULL,
  `start_yr` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `mode_id`, `course_short`, `course_full`, `course_count`, `duration`, `start_yr`) VALUES
(1, 1, 'BTECH', 'Bachelor of Technology', 1, 4, 14),
(2, 1, 'MBA', 'Master of Business Administration', 0, 2, 16),
(3, 1, 'MCA', 'Master of Computer Application', 0, 3, 15);

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

CREATE TABLE `favourites` (
  `fav_id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `topicid` int(11) NOT NULL,
  `pichla_view` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `favourites`
--

INSERT INTO `favourites` (`fav_id`, `category`, `username`, `views`, `topicid`, `pichla_view`) VALUES
(1, 'help', 'alpha', 40, 1, '2018-01-30 08:44:03'),
(2, 'xyz', 'prs786', 66, 2, '2018-01-26 11:52:46'),
(3, 'help', 'prs786', 88, 1, '2018-02-13 23:23:49');

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
  `follow_id` int(11) NOT NULL,
  `user1_id` int(11) NOT NULL,
  `user2_id` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`follow_id`, `user1_id`, `user2_id`, `status`) VALUES
(1, 2, 1, 2),
(2, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ip`
--

CREATE TABLE `ip` (
  `ip_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `browser` varchar(30) NOT NULL,
  `browserver` varchar(100) NOT NULL,
  `browserplat` varchar(100) NOT NULL,
  `browserpat` varchar(100) NOT NULL,
  `session` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ip`
--

INSERT INTO `ip` (`ip_id`, `user_id`, `ip`, `browser`, `browserver`, `browserplat`, `browserpat`, `session`) VALUES
(1, 1, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'g6lgd7tgr24s52hdaga9rhtv14'),
(2, 1, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'bs4lucr9a2ikrl87ovaij2phr2'),
(3, 1, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'clc4cmj5ucpffvvc783vjusjf4'),
(4, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '7ukfd6qnmlvc9mon6d6im1e916'),
(5, 1, '::1', 'Apple Safari', '9.0', 'mac', '#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'cmagv3m94agn5dksah92tpaqu7'),
(6, 2, '192.168.0.102', 'Google Chrome', '62.0.3202.84', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '0h91k5uop7gos2vc1cuh3sm2j5'),
(7, 2, '192.168.0.102', 'Google Chrome', '62.0.3202.84', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '35ddr3h42r71ttoiceg8augut3'),
(8, 2, '::1', 'Apple Safari', '9.0', 'mac', '#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'bfgme2i6hs15on6eh8plunfch1'),
(9, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '0i9a575lha82u9enujsrl0r1j7'),
(10, 1, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '4rff98mot5o2b3r7tf44hj0m82'),
(11, 2, '192.168.0.102', 'Google Chrome', '63.0.3239.111', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'vsqnnbi8ommvs3f1mldm4m1gp3'),
(12, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'aqoer1fq035vtopbnam8fcdpp2'),
(13, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '09pgsdg7vq8nm25gms7pa88fc0'),
(14, 2, '192.168.0.102', 'Google Chrome', '63.0.3239.111', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '3520fefh3pa47j90tu2jsg5021'),
(15, 2, '192.168.0.102', 'Google Chrome', '63.0.3239.111', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'klvdb0palhumh5rmp6pdv1cmm7'),
(16, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'k3tdsiedbc3cf5v2vbl2mk1pf0'),
(17, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'valrf29hrvg9b2e1usj9l5lrn2'),
(18, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'feq8fvfvl75tp0qt61ul099315'),
(19, 2, '192.168.0.100', 'Google Chrome', '63.0.3239.111', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'qu9np7lrfr3vj7bq4b38r9m5r3'),
(20, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '27cphftmkapd7ra73uf5tbh6n2'),
(21, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '6llrurn8imvi6f0a1etpcqfq81'),
(22, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '0jljlotcbnn3brhgkt9n2lh516'),
(23, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'vev5hrhajm52lsre2gbtdooph3'),
(24, 2, '192.168.0.100', 'Google Chrome', '63.0.3239.111', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'ekbqpgp547f9m04ebttt0erdo1'),
(25, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'a88vb50otrt1bnq4tu61e3nvi2'),
(26, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'csr24geu9ni6ir73tpuae6utp2'),
(27, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '2surbgoj56oat05jks86s6vuh7'),
(28, 2, '192.168.0.103', 'Google Chrome', '63.0.3239.111', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'bkvrv1bq1hn6n2bap2dtd48h43'),
(29, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '6vhrlp7m8e3ke8ieqrdg7746m3'),
(30, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'i91g9he96ohc01gv07ui7pudg7'),
(31, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '1eer4fa5bof5j6q5lrnueqm6o0'),
(32, 2, '192.168.0.103', 'Google Chrome', '63.0.3239.111', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'e222104egf8fl19empcjgv6lu3'),
(33, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'rdngmskpemdf4sk4gmps0tnpu7'),
(34, 1, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '7ni5n2e9u31amdd9cmje8t1rp3'),
(35, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '16lefo4l83f20jmoncfube91q7'),
(36, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '3udeja4kgnn6ankh6rt29bjcl7'),
(37, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'pgv46jeeen1hqdi01d06qivn47'),
(38, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'ada6ieraahb8uivntsl3psstf6'),
(39, 2, '192.168.0.100', 'Google Chrome', '63.0.3239.111', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '3m4o5ghtmb5fu5jtla3g6hfh04'),
(40, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'qpo5eg9mqqa1rtrogs376c91m5'),
(41, 2, '192.168.0.100', 'Google Chrome', '63.0.3239.111', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'uiq7qpt6qfbbf3hq01tfi56ph7'),
(42, 2, '192.168.0.100', 'Google Chrome', '63.0.3239.111', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'so0sc76s0cvibullmmoiun69r3'),
(43, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'kf7m7s29ob6qbltp6suej52qb5'),
(44, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '7ctlu4ru0kb5o74r023mfcta40'),
(45, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'j8ekoieekf1d5ve6h5fnn7v196'),
(46, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'rkg30sue7eeqtrjql9bs9f61u1'),
(47, 1, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'ep7kd5gv7cq7gh5acb82ja8pu2'),
(48, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '76ejjvhfp92e370hirf8n84f13'),
(49, 1, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'nvacp89la8nfee7a5bjpq4b9q7'),
(50, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '42bm515jncec2lhs9ad3kqfha2'),
(51, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '1jpkibjum2722ch0thm9o3app6'),
(52, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'm0icjfrjlkqf7v42q8qhre1h41'),
(53, 2, '192.168.0.105', 'Google Chrome', '63.0.3239.111', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'a0oaipirf6t6p33cgkqnreo065'),
(54, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'j65beja3f3hfkg9hc5vlbqng30'),
(55, 2, '192.168.0.105', 'Google Chrome', '63.0.3239.111', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'spujha34sqg125u4nm77qqek03'),
(56, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'be1568ie3jv3qbavp9mmg76h07'),
(57, 2, '192.168.0.100', 'Google Chrome', '63.0.3239.111', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '9ja1nn4il16d1kqddfkvu89k51'),
(58, 2, '192.168.0.100', 'Google Chrome', '63.0.3239.111', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '1ursnt1kmv7nqgh3kc5q5jd5k1'),
(59, 2, '192.168.0.100', 'Google Chrome', '63.0.3239.111', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '51ol6vdvutt75igt7kiskp2ju7'),
(60, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'bgbb02qu6j5cft05erp7onrua0'),
(61, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'bp2n96ilqvdsg05gmpclmj7nv6'),
(62, 1, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '9rlfhmq78hsppequta94tem5a4'),
(63, 2, '192.168.0.100', 'Google Chrome', '63.0.3239.111', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'ptv1f6mi7so4ud9rj2b9kiffa7'),
(64, 2, '192.168.0.102', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '7477ter92s9761bd2n9kq3ndp3'),
(65, 1, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'uf3f3lu3n2e1u3d14lcjtv3tb1'),
(66, 2, '192.168.0.100', 'Google Chrome', '63.0.3239.111', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'kocg6niv8hmtluqrv16mbs6v86'),
(67, 2, '192.168.0.100', 'Google Chrome', '63.0.3239.111', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'ie4qdcpnislve3m6pbq1ptg4n2'),
(68, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'hmiduhvvv8g993pdgtdt85kab0'),
(69, 1, '127.0.0.1', 'Mozilla Firefox', '47.0', 'linux', '#(?<browser>Version|Firefox|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'ptqn7pbfosbkfkvsudsq28ljj2'),
(70, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'jlsgrd7dt3knlhvfdlqgeaerp1'),
(71, 1, '192.168.0.100', 'Google Chrome', '63.0.3239.111', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'b2qcdi3bui0e7lkiq374vnt5f2'),
(72, 2, '192.168.0.100', 'Google Chrome', '63.0.3239.111', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'jjker9ko27768k5h5sca81din5'),
(73, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'hb8apuedu09fb9oq8v9cnn2l35'),
(74, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'ktkc2hsd4luqptepkeokso5mf4'),
(75, 1, '192.168.0.103', 'Google Chrome', '63.0.3239.111', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'sqogarjv2upvd8721cm7jruoe3'),
(76, 2, '192.168.0.103', 'Google Chrome', '63.0.3239.111', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'qiigomirm16dk73osrjr5ov1v7'),
(77, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'pqcammep8nmbej41otlvgme7n6'),
(78, 2, '192.168.0.103', 'Google Chrome', '63.0.3239.111', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'rcg0k5998ka8cip0h9jc25bj62'),
(79, 2, '192.168.0.103', 'Google Chrome', '63.0.3239.111', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '2610kr0qvgva5kmj4bipheev11'),
(80, 2, '192.168.0.103', 'Google Chrome', '63.0.3239.111', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 't15f76njc07n5h64sclr010l07'),
(81, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'oftf4t0fdnt504kvrmprq9oli0'),
(82, 2, '192.168.0.103', 'Google Chrome', '63.0.3239.111', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '48013tr08ahnk1tegeqfa4pg27'),
(83, 2, '192.168.0.103', 'Google Chrome', '63.0.3239.111', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '7li2dchlm5mth75nifgrtu48l0'),
(84, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '22hfkma3ie3qiktheop3pia6g7'),
(85, 2, '::1', 'Apple Safari', '9.0', 'mac', '#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'm22pojbv0uc9ifdrg7870bfp52'),
(86, 2, '192.168.0.101', 'Google Chrome', '63.0.3239.111', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'amqiqjc818udhsa3qnulm64rr6'),
(87, 2, '192.168.0.101', 'Google Chrome', '63.0.3239.111', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'nhtq8aevb6qnb2h97gaia4keu3'),
(88, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '9ue1jl69pmcinronlfg500u224'),
(89, 2, '192.168.0.102', 'Google Chrome', '63.0.3239.111', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'ui82bod73oubjne7pu12sg4hd7'),
(90, 2, '::1', 'Apple Safari', '9.0', 'mac', '#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'r17hnviekff4v4og1854563464'),
(91, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'p0o7fnmivq3m5qvo3c76astl07'),
(92, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 't55vh119rktjpdnihpq2vaqtu6'),
(93, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'n69cknj3jvlpfa8tng389evku5'),
(94, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'ug5qctjnduecm7kt673vfbm8r1'),
(95, 1, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '8gvl05797jijpcq1mbnkpovnj4'),
(96, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'h9djpe1p5tqsj8bsb7aro9kl00'),
(97, 1, '::1', 'Apple Safari', '9.0', 'mac', '#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'k64e8kvv83stlv6ocavc0cvjf3'),
(98, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '4tc8055k3ub9flrlmdk1v14cq5'),
(99, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'dfo33avqo2072jfvh078qf8qr3'),
(100, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'abv598sdh0m6dg5pj23hobtam0'),
(101, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'j3d54pqpf0d401sok58f118b11'),
(102, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '562f6hs1obnbfl933ongqtuab2'),
(103, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'oqphjvb1trnkse638a3eh7ar86'),
(104, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '1q08gr0bd8pmuiqemtqm460jm2'),
(105, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'ffvlbjf29uhsp8tueiou6g4k44'),
(106, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '5kh63hfcffbn0ilnpk94fttbh5'),
(107, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'dkja0jc90qg493ip1quj625p46'),
(108, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '0nir65vfsdq46n026e5aocq5a3'),
(109, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'ru8rrfbd5iacqn6i506nr2d835'),
(110, 1, '192.168.0.103', 'Google Chrome', '63.0.3239.111', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'tvu0kht7lerk4caesu2cokgug5'),
(111, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '5m6gii2c2j2ip1v0rutdstip45'),
(112, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'ovgucqtpf1a63gp8bm84gglf16'),
(113, 1, '192.168.0.102', 'Google Chrome', '64.0.3282.137', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '1frd81uu08end6fff9hv1fh3o7'),
(114, 2, '192.168.0.102', 'Google Chrome', '64.0.3282.137', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'jil95mgfq2ieaj4dcvg5v6fcj3'),
(115, 2, '192.168.0.102', 'Google Chrome', '64.0.3282.137', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '0h75le8t8i17aev3n88u3dq3m7'),
(116, 2, '192.168.0.102', 'Google Chrome', '64.0.3282.137', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'm0ge7ifv8aasq3cac2ubkf97k6'),
(117, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '4rjur3l7rn0a57h9492tm01um1'),
(118, 2, '192.168.0.102', 'Google Chrome', '64.0.3282.137', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'qu98rsonjbum23skisjp99r3s0'),
(119, 2, '192.168.0.102', 'Google Chrome', '64.0.3282.137', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'duodnl7gi97c51lpicacu3l2q0'),
(120, 2, '192.168.0.102', 'Google Chrome', '64.0.3282.137', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '56dgd8nm1sdbngagfjd2ds0b30'),
(121, 2, '192.168.0.102', 'Google Chrome', '64.0.3282.137', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'e961h0kk3bfs9l8b1ihcg7vm80'),
(122, 2, '::1', 'Apple Safari', '9.0', 'mac', '#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '45hiaatnogiejihh8mrna34qc0'),
(123, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'b93j7tvsgdomgo1pokk06q0o71'),
(124, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'frlrflepg6qphuudpfec5aplr5'),
(125, 2, '192.168.0.100', 'Google Chrome', '64.0.3282.137', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '4602ovdkkf5ujrlo0gde04dd50'),
(126, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'n5bm6v5rjjksfeqpjkl6b8bp11'),
(127, 2, '192.168.0.103', 'Google Chrome', '64.0.3282.137', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'gmfhld5ereagv99csg7ha5f7k7'),
(128, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'tqei7kn27l3h2sfpjv63dn8oj0'),
(129, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '6qugp9gu25jpqciunmlo476n00'),
(130, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 't8smjnkq2aeitdsv5mv5kjj1s4'),
(131, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '0enn330f0i50hl04spciet3mk0'),
(132, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'e81jsavv44kil4vb0q5nc9js10'),
(133, 2, '192.168.0.102', 'Google Chrome', '64.0.3282.137', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'ntauje6rl0538612krp5msa3b5'),
(134, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'n2c3p09r5d14p697f5694p7j32'),
(135, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'jr81klomdd9qjg1dns0ci9uo17'),
(136, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'u1q9991q16o2d0r7h75lrhnco4'),
(137, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'rsim4n855fojdqnfgsmvmlr2e1'),
(138, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'g2gjmeiu9r7b9b1mnffugdqlb3'),
(139, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'avssg4jr0rgq4bcjam2fgsmtb2'),
(140, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'irma5pomgq5b6dsin529sn0jp2'),
(141, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', '7t8vlgi27prmrtls3sfqom8sm1'),
(142, 2, '192.168.0.104', 'Google Chrome', '64.0.3282.137', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'cbknq2ufc9hbobeqa89bggreq6'),
(143, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'sal98qgk8fd10lit9dc3fft2o6'),
(144, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'ui48vfdunmpsig6p7it2o4gcf3'),
(145, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'hcvesmtttqlcb1a9mmpp4e7af0'),
(146, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'g1d76a1d70gkiq96h64l1uapo5'),
(147, 2, '::1', 'Google Chrome', '60.0.3112.90', 'linux', '#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#', 'vvodhp05d9o0ep79tki8jhir71');

-- --------------------------------------------------------

--
-- Table structure for table `jss_stud_list_17_18`
--

CREATE TABLE `jss_stud_list_17_18` (
  `jss_stud_id` int(11) NOT NULL,
  `adm_no` varchar(12) DEFAULT NULL,
  `stud_name` varchar(50) NOT NULL,
  `roll_no` varchar(12) DEFAULT NULL,
  `year` int(1) NOT NULL,
  `course_id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `form_fill` int(1) DEFAULT '0',
  `valid` int(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jss_stud_list_17_18`
--

INSERT INTO `jss_stud_list_17_18` (`jss_stud_id`, `adm_no`, `stud_name`, `roll_no`, `year`, `course_id`, `branch_id`, `form_fill`, `valid`) VALUES
(1, '16CS106', 'RIKHAB  BHARDWAJ', '', 1, 1, NULL, 0, 1),
(2, '16CS129', 'RITIK  SETHI', '', 1, 1, NULL, 0, 1),
(3, '17CS001', 'BILAL AHMAD SOFI', '', 1, 1, NULL, 0, 1),
(4, '17CS002', 'MUDASIR HUSSAIN BHAT', '', 1, 1, NULL, 0, 1),
(5, '17CS003', 'SAMDARSH  SINGH', '', 1, 1, NULL, 0, 1),
(6, '17CS004', 'SHIVAM  SANGAL', '', 1, 1, NULL, 0, 1),
(7, '17CS005', 'ARYAN VIJAYRAJ SINGH', '', 1, 1, NULL, 0, 1),
(8, '17CS006', 'SHATAKSHI  GARG', '', 1, 1, NULL, 0, 1),
(9, '17CS007', 'RAHUL KUMAR SINGH', '', 1, 1, NULL, 0, 1),
(10, '17CS008', 'PULKIT  JATAV', '', 1, 1, NULL, 0, 1),
(11, '17CS009', 'SANYOGITA', '', 1, 1, NULL, 0, 1),
(12, '17CS010', 'ATISHAY  JAIN', '', 1, 1, NULL, 0, 1),
(13, '17CS011', 'AAYUSHI  GUPTA', '', 1, 1, NULL, 0, 1),
(14, '17CS012', 'KSHITIZ RAJ PATEL', '', 1, 1, NULL, 0, 1),
(15, '17CS014', 'VEDANSH  MODWEL', '', 1, 1, NULL, 0, 1),
(16, '17CS015', 'SOURABH  SINGH', '', 1, 1, NULL, 0, 1),
(17, '17CS016', 'NIKUNJ KUMAR RANA', '', 1, 1, NULL, 0, 1),
(18, '17CS017', 'SARTHAK  SINGH', '', 1, 1, NULL, 0, 1),
(19, '17CS018', 'SHYAM', '', 1, 1, NULL, 0, 1),
(20, '17CS019', 'SAURABH  SINHA', '', 1, 1, NULL, 0, 1),
(21, '17CS020', 'RAM', '', 1, 1, NULL, 0, 1),
(22, '17CS021', 'MANASVI  MALIK', '', 1, 1, NULL, 0, 1),
(23, '17CS022', 'VIVEK  BAGHELA', '', 1, 1, NULL, 0, 1),
(24, '17CS023', 'PARAM PRAKASH RAY', '', 1, 1, NULL, 0, 1),
(25, '17CS024', 'PRIYANSHU  TIWARI', '', 1, 1, NULL, 0, 1),
(26, '17CS025', 'TANISHQ  ANAND', '', 1, 1, NULL, 0, 1),
(27, '17CS026', 'KRISHNA KUMAR MAURYA', '', 1, 1, NULL, 0, 1),
(28, '17CS027', 'ANANT SHEKHAR TIWARI', '', 1, 1, NULL, 0, 1),
(29, '17CS029', 'SATYAM  TRIPATHI', '', 1, 1, NULL, 0, 1),
(30, '17CS030', 'ABHIPRAY  AGARWAL', '', 1, 1, NULL, 0, 1),
(31, '17CS031', 'HARDIK  SHARMA', '', 1, 1, NULL, 0, 1),
(32, '17CS032', 'MEHAK  MITTAL', '', 1, 1, NULL, 0, 1),
(33, '17CS033', 'PRASHANT  MATHAN', '', 1, 1, NULL, 0, 1),
(34, '17CS034', 'NIKHIL  VATS', '', 1, 1, NULL, 0, 1),
(35, '17CS035', 'ADITI  MISHRA', '', 1, 1, NULL, 0, 1),
(36, '17CS036', 'UMANG  JAISWAL', '', 1, 1, NULL, 0, 1),
(37, '17CS037', 'DEVANSH  GUPTA', '', 1, 1, NULL, 0, 1),
(38, '17CS038', 'ARTI SINGH', '', 1, 1, NULL, 0, 1),
(39, '17CS039', 'CHANDRADEV  PANDEY', '', 1, 1, NULL, 0, 1),
(40, '17CS040', 'SANDHYA  RAJWANSHI', '', 1, 1, NULL, 0, 1),
(41, '17CS041', 'ABHISHEK  NIRMAL', '', 1, 1, NULL, 0, 1),
(42, '17CS042', 'TABISH  AHMAD', '', 1, 1, NULL, 0, 1),
(43, '17CS043', 'SAHIL  DIWAKAR', '', 1, 1, NULL, 0, 1),
(44, '17CS044', 'AISHWARY  SRIVASTAVA', '', 1, 1, NULL, 0, 1),
(45, '17CS045', 'PRIYANSH  MISHRA', '', 1, 1, NULL, 0, 1),
(46, '17CS046', 'ASHISH KUMAR GOLA', '', 1, 1, NULL, 0, 1),
(47, '17CS047', 'ASHISH PRATAP SINGH', '', 1, 1, NULL, 0, 1),
(48, '17CS048', 'ANUBHAV  SRIVASTAVA', '', 1, 1, NULL, 0, 1),
(49, '17CS049', 'ADITYA  RAO', '', 1, 1, NULL, 0, 1),
(50, '17CS050', 'SHREYASKAR  YADAV', '', 1, 1, NULL, 0, 1),
(51, '17CS051', 'AYUSHI  SINGH', '', 1, 1, NULL, 0, 1),
(52, '17CS052', 'VIBHUSHIT  TYAGI', '', 1, 1, NULL, 0, 1),
(53, '17CS053', 'RAGHAV  KHANNA', '', 1, 1, NULL, 0, 1),
(54, '17CS054', 'TARUN KUMAR RANA', '', 1, 1, NULL, 0, 1),
(55, '17CS055', 'AKSHAY  BALIYAN', '', 1, 1, NULL, 0, 1),
(56, '17CS056', 'PRASHANSA RAGHAVENDRA SAXENA', '', 1, 1, NULL, 0, 1),
(57, '17CS057', 'PRANJALI  KATIYAR', '', 1, 1, NULL, 0, 1),
(58, '17CS058', 'KUMAR  SHANTANU', '', 1, 1, NULL, 0, 1),
(59, '17CS059', 'UMASHANKAR  YADAV', '', 1, 1, NULL, 0, 1),
(60, '17CS060', 'SANJEEV KUMAR YADAV', '', 1, 1, NULL, 0, 1),
(61, '17CS061', 'SHREYANSH', '', 1, 1, NULL, 0, 1),
(62, '17CS062', 'NITISH SINGH PARIHAR', '', 1, 1, NULL, 0, 1),
(63, '17CS063', 'AYUSH  GUPTA', '', 1, 1, NULL, 0, 1),
(64, '17CS064', 'ISHWAR ANAND SWARUP', '', 1, 1, NULL, 0, 1),
(65, '17CS065', 'SURYA KANT SWAMI', '', 1, 1, NULL, 0, 1),
(66, '17CS066', 'ASTHA  AWASTHI', '', 1, 1, NULL, 0, 1),
(67, '17CS067', 'DEVANSHU  AGARWAL', '', 1, 1, NULL, 0, 1),
(68, '17CS070', 'BRAJESH KUMAR', '', 1, 1, NULL, 0, 1),
(69, '17CS073', 'VIVEK  CHAUDHARY', '', 1, 1, NULL, 0, 1),
(70, '17CS074', 'KARTIKEYA  YADAV', '', 1, 1, NULL, 0, 1),
(71, '17CS075', 'MINKAL  CHOUDHARY', '', 1, 1, NULL, 0, 1),
(72, '17CS076', 'RIYA  VERMA', '', 1, 1, NULL, 0, 1),
(73, '17CS077', 'SHALINI  VERMA', '', 1, 1, NULL, 0, 1),
(74, '17CS078', 'TUSHAR  SAXENA', '', 1, 1, NULL, 0, 1),
(75, '17CS079', 'SHUBHAM  GUPTA', '', 1, 1, NULL, 0, 1),
(76, '17CS080', 'AASTIK', '', 1, 1, NULL, 0, 1),
(77, '17CS081', 'PRABAL  SRIVASTAV', '', 1, 1, NULL, 0, 1),
(78, '17CS082', 'ARUN  PRATAP', '', 1, 1, NULL, 0, 1),
(79, '17CS084', 'RIJUL  PARMAR', '', 1, 1, NULL, 0, 1),
(80, '17CS086', 'AMIT KUMAR', '', 1, 1, NULL, 0, 1),
(81, '17CS087', 'SARTHAK  GARG', '', 1, 1, NULL, 0, 1),
(82, '17CS088', 'PALASH  GOEL', '', 1, 1, NULL, 0, 1),
(83, '17CS089', 'AJEET SINGH RAGHUVANSHI', '', 1, 1, NULL, 0, 1),
(84, '17CS091', 'DAMAN DEEP SINGH', '', 1, 1, NULL, 0, 1),
(85, '17CS092', 'ADITI  VERMA', '', 1, 1, NULL, 0, 1),
(86, '17CS093', 'SAURABH KUAMR GOND', '', 1, 1, NULL, 0, 1),
(87, '17CS094', 'NITIN  KUMAR', '', 1, 1, NULL, 0, 1),
(88, '17CS095', 'PRASHANT  CHAUHAN', '', 1, 1, NULL, 0, 1),
(89, '17CS096', 'AAYUSH  AGGARWAL', '', 1, 1, NULL, 0, 1),
(90, '17CS097', 'SATYAM  RATHAUR', '', 1, 1, NULL, 0, 1),
(91, '17CS100', 'TANU  MAHAJAN', '', 1, 1, NULL, 0, 1),
(92, '17CS101', 'HIMANSHU  SINGH', '', 1, 1, NULL, 0, 1),
(93, '17CS102', 'RAGHVENDRA  SINGH', '', 1, 1, NULL, 0, 1),
(94, '17CS103', 'SHUBHAM KUMAR', '', 1, 1, NULL, 0, 1),
(95, '17CS107', 'ANANT PRAKASH VERMA', '', 1, 1, NULL, 0, 1),
(96, '17CS110', 'HRISHIKESH  TIWARI', '', 1, 1, NULL, 0, 1),
(97, '17CS112', 'YASH  RAJ', '', 1, 1, NULL, 0, 1),
(98, '17CS113', 'PRASHANT  BAJAJ', '', 1, 1, NULL, 0, 1),
(99, '17CS115', 'ADITYA KUMAR SAHAY', '', 1, 1, NULL, 0, 1),
(100, '17CS116', 'NAMAN  JAIN', '', 1, 1, NULL, 0, 1),
(101, '17CS118', 'SANYAM  LATH', '', 1, 1, NULL, 0, 1),
(102, '17CS119', 'AVNISH KUMAR', '', 1, 1, NULL, 0, 1),
(103, '17CS120', 'ADITYA KUMAR', '', 1, 1, NULL, 0, 1),
(104, '17CS122', 'DEEPSHIKHA  JAISWAR', '', 1, 1, NULL, 0, 1),
(105, '17CS125', 'SARTHAK  JAIN', '', 1, 1, NULL, 0, 1),
(106, '17CS128', 'HIMANSHU  SRIVASTAVA', '', 1, 1, NULL, 0, 1),
(107, '17CS129', 'HARUN  ABHISHEK', '', 1, 1, NULL, 0, 1),
(108, '17CS130', 'VAIBHAV  TYAGI', '', 1, 1, NULL, 0, 1),
(109, '17CS131', 'KUSHAGRA  GUPTA', '', 1, 1, NULL, 0, 1),
(110, '17CS132', 'ADESH KUMAR JAISWAL', '', 1, 1, NULL, 0, 1),
(111, '17CS133', 'AAINA  VERMA', '', 1, 1, NULL, 0, 1),
(112, '17CS134', 'KUNAL  VASHISTH', '', 1, 1, NULL, 0, 1),
(113, '17CS135', 'SANCHIT  VERMA', '', 1, 1, NULL, 0, 1),
(114, '17CS136', 'AKHIL  GUPTA', '', 1, 1, NULL, 0, 1),
(115, '17CS137', 'GUNJAN  YADAV', '', 1, 1, NULL, 0, 1),
(116, '17CS138', 'RISHABH  VERMA', '', 1, 1, NULL, 0, 1),
(117, '17CS139', 'PRAKHAR  VARSHNEY', '', 1, 1, NULL, 0, 1),
(118, '17CS140', 'SHIVA', '', 1, 1, NULL, 0, 1),
(119, '17CS141', 'ARYAN  VERMA', '', 1, 1, NULL, 0, 1),
(120, '17CS142', 'SHREYANSH  JAISWAL', '', 1, 1, NULL, 0, 1),
(121, '17CS143', 'ANSHUL  AGARWAL', '', 1, 1, NULL, 0, 1),
(122, '17CS144', 'ABHISHEK  VERMA', '', 1, 1, NULL, 0, 1),
(123, '17CS145', 'AYUSHI  MANGAL', '', 1, 1, NULL, 0, 1),
(124, '17CS146', 'MANSI  SINGH', '', 1, 1, NULL, 0, 1),
(125, '17CS147', 'ANOOP  KUMAR', '', 1, 1, NULL, 0, 1),
(126, '17CS148', 'SHIVAM  JAISWAL', '', 1, 1, NULL, 0, 1),
(127, '17CS149', 'NANDINI  AGARWAL', '', 1, 1, NULL, 0, 1),
(128, '17CS150', 'ABHINAV  SINGH', '', 1, 1, NULL, 0, 1),
(129, '17CS151', 'PRASHANT  KUMAR', '', 1, 1, NULL, 0, 1),
(130, '17CS152', 'SUDHANSHU  SINGH', '', 1, 1, NULL, 0, 1),
(131, '17CS153', 'TEJENDRA  RIYA', '', 1, 1, NULL, 0, 1),
(132, '17CS154', 'SOMIL  GUPTA', '', 1, 1, NULL, 0, 1),
(133, '17CS155', 'ABHISHEK', '', 1, 1, NULL, 0, 1),
(134, '17CS156', 'SHAHZAIB  AHMAD', '', 1, 1, NULL, 0, 1),
(135, '17CS157', 'VISHNU  SINGH', '', 1, 1, NULL, 0, 1),
(136, '17CS158', 'ADITYAN', '', 1, 1, NULL, 0, 1),
(137, '17CS159', 'VARTIKA  PATEL', '', 1, 1, NULL, 0, 1),
(138, '17CS160', 'AYUSHI  SHARMA', '', 1, 1, NULL, 0, 1),
(139, '17CS161', 'AYUSH  SRIVASTAVA', '', 1, 1, NULL, 0, 1),
(140, '17CS162', 'KSHITIJ  GUPTA', '', 1, 1, NULL, 0, 1),
(141, '17CS163', 'JAYANT KUMAR SINGH', '', 1, 1, NULL, 0, 1),
(142, '17CS164', 'PRANAV  MISHRA', '', 1, 1, NULL, 0, 1),
(143, '17CS165', 'KARTIK  VASHISHTA', '', 1, 1, NULL, 0, 1),
(144, '17CS166', 'RISHABH  PATHAK', '', 1, 1, NULL, 0, 1),
(145, '17CS167', 'CHIRAG  KUSHWAHA', '', 1, 1, NULL, 0, 1),
(146, '17CS168', 'ASHUTOSH  VARSHNEY', '', 1, 1, NULL, 0, 1),
(147, '17CS169', 'AYUSH  JAIN', '', 1, 1, NULL, 0, 1),
(148, '17CS170', 'KAVYA  CHANDRA', '', 1, 1, NULL, 0, 1),
(149, '17CS171', 'MUKUND  BHARDWAJ', '', 1, 1, NULL, 0, 1),
(150, '17CS172', 'SAUMYA  AGRAWAL', '', 1, 1, NULL, 0, 1),
(151, '17CS173', 'KARANVEER  SINGH', '', 1, 1, NULL, 0, 1),
(152, '17CS174', 'RAGHAV  AGARWAL', '', 1, 1, NULL, 0, 1),
(153, '17CS175', 'VAIBHAV  GUPTA', '', 1, 1, NULL, 0, 1),
(154, '17CS176', 'VARSHIT  GARG', '', 1, 1, NULL, 0, 1),
(155, '17CS177', 'SONAKSHI  HADIL', '', 1, 1, NULL, 0, 1),
(156, '17CS178', 'SHUBHENDRA  SINGH', '', 1, 1, NULL, 0, 1),
(157, '17CS179', 'ARCHIT  CHOPRA', '', 1, 1, NULL, 0, 1),
(158, '17CS180', 'LAVANYA  SHARMA', '', 1, 1, NULL, 0, 1),
(159, '17CS181', 'HIMANSHI  SHARMA', '', 1, 1, NULL, 0, 1),
(160, '17CS182', 'KANIKA GOEL', '', 1, 1, NULL, 0, 1),
(161, '17CS183', 'RIYA  JAIN', '', 1, 1, NULL, 0, 1),
(162, '17CS184', 'AJINKYA  MAURYA', '', 1, 1, NULL, 0, 1),
(163, '17CS185', 'PARTH  THAPLIYAL', '', 1, 1, NULL, 0, 1),
(164, '17CS186', 'BADAL  GUPTA', '', 1, 1, NULL, 0, 1),
(165, '17CS187', 'PRATEEK  SINGH', '', 1, 1, NULL, 0, 1),
(166, '17CS188', 'ASHISH  BISHT', '', 1, 1, NULL, 0, 1),
(167, '17CS189', 'SHASHANK  DIXIT', '', 1, 1, NULL, 0, 1),
(168, '17CS190', 'ANKIT', '', 1, 1, NULL, 0, 1),
(169, '17CS191', 'AKASHDEEP  SINGH', '', 1, 1, NULL, 0, 1),
(170, '17CS192', 'SAKSHI  VERMA', '', 1, 1, NULL, 0, 1),
(171, '17CS193', 'SHAIFALI CHAUHAN', '', 1, 1, NULL, 0, 1),
(172, '17CS194', 'DIKSHA', '', 1, 1, NULL, 0, 1),
(173, '17CS195', 'SAURABH  YADAV', '', 1, 1, NULL, 0, 1),
(174, '17CS196', 'AAKASH  SACHAN', '', 1, 1, NULL, 0, 1),
(175, '17CS197', 'RITIKA  PURSWANI', '', 1, 1, NULL, 0, 1),
(176, '17CS198', 'ATUL DEEP SINGH', '', 1, 1, NULL, 0, 1),
(177, '17CS199', 'RISHABH  KUMAR', '', 1, 1, NULL, 0, 1),
(178, '17CS200', 'ABHINAV  SINGH', '', 1, 1, NULL, 0, 1),
(179, '17CS201', 'RAVEENA  SINGH', '', 1, 1, NULL, 0, 1),
(180, '17CS202', 'ARPIT KUMAR', '', 1, 1, NULL, 0, 1),
(181, '17CS203', 'CHHAVI  JOSHI', '', 1, 1, NULL, 0, 1),
(182, '17CS204', 'MOHAMMED  SARIM', '', 1, 1, NULL, 0, 1),
(183, '17CS205', 'ATULYA  SRIVASTAVA', '', 1, 1, NULL, 0, 1),
(184, '17CS206', 'LAVENYA  SINGH', '', 1, 1, NULL, 0, 1),
(185, '17CS207', 'YASH  JAISWAL', '', 1, 1, NULL, 0, 1),
(186, '17CS208', 'MEENAKSHI  SAXENA', '', 1, 1, NULL, 0, 1),
(187, '17CS209', 'SIDDHARTH  SINGH', '', 1, 1, NULL, 0, 1),
(188, '17CS210', 'SIDDHARTH  BAJPAI', '', 1, 1, NULL, 0, 1),
(189, '15CE120', 'RISHABH  CHANDRA', '', 1, 1, NULL, 0, 1),
(190, '15CE125', 'SAHIL  CHAUDHARY', '', 1, 1, NULL, 0, 1),
(191, '16CE077', 'HIMANSHU  SINGH', '', 1, 1, NULL, 0, 1),
(192, '16CE105', 'KARTIK  YADAV', '', 1, 1, NULL, 0, 1),
(193, '16CE110', 'DIVYANSHU  SINGH', '', 1, 1, NULL, 0, 1),
(194, '16CE113', 'NIKHILESH  KUMAR', '', 1, 1, NULL, 0, 1),
(195, '16CE119', 'YUVRAJ  SINGH', '', 1, 1, NULL, 0, 1),
(196, '17CE001', 'SAIMA JAN', '', 1, 1, NULL, 0, 1),
(197, '17CE002', 'BASIT ASLAM WANI', '', 1, 1, NULL, 0, 1),
(198, '17CE003', 'ASHISH  YADAV', '', 1, 1, NULL, 0, 1),
(199, '17CE004', 'MOHAMMAD AQUIB', '', 1, 1, NULL, 0, 1),
(200, '17CE005', 'ADITYA  SINGH', '', 1, 1, NULL, 0, 1),
(201, '17CE006', 'NAMIT PRAKASH SRIVASTAVA', '', 1, 1, NULL, 0, 1),
(202, '17CE007', 'SYED RAZI HAIDER JAFRI', '', 1, 1, NULL, 0, 1),
(203, '17CE008', 'PANKAJ SINGH', '', 1, 1, NULL, 0, 1),
(204, '17CE009', 'NIPUN  SINGHAL', '', 1, 1, NULL, 0, 1),
(205, '17CE010', 'PRABHAT  KUMAR', '', 1, 1, NULL, 0, 1),
(206, '17CE011', 'DEVESH KUMAR SINGH', '', 1, 1, NULL, 0, 1),
(207, '17CE012', 'PAVITRA KUMAR SINGH', '', 1, 1, NULL, 0, 1),
(208, '17CE013', 'KUNAL PRADEEP', '', 1, 1, NULL, 0, 1),
(209, '17CE015', 'AYUSH', '', 1, 1, NULL, 0, 1),
(210, '17CE016', 'VAIBHAV', '', 1, 1, NULL, 0, 1),
(211, '17CE017', 'NAMAN  SHARMA', '', 1, 1, NULL, 0, 1),
(212, '17CE018', 'PRINCE  MOGHA', '', 1, 1, NULL, 0, 1),
(213, '17CE019', 'VAIBHAV  MISHRA', '', 1, 1, NULL, 0, 1),
(214, '17CE020', 'SHIVANI  JAISWAL', '', 1, 1, NULL, 0, 1),
(215, '17CE021', 'SHIVAM  YADAV', '', 1, 1, NULL, 0, 1),
(216, '17CE022', 'VARDAAN  SACHDEVA', '', 1, 1, NULL, 0, 1),
(217, '17CE024', 'MOHIT SINGH SAYANA', '', 1, 1, NULL, 0, 1),
(218, '17CE025', 'ABHIJEET PRATAP SINGH', '', 1, 1, NULL, 0, 1),
(219, '17CE027', 'PRADYUMN  YADAV', '', 1, 1, NULL, 0, 1),
(220, '17CE028', 'RAGHUBAR  PATHAK', '', 1, 1, NULL, 0, 1),
(221, '17CE029', 'PRANJUL  SINGH', '', 1, 1, NULL, 0, 1),
(222, '17CE030', 'PRASHANT  SINGH', '', 1, 1, NULL, 0, 1),
(223, '17CE031', 'CHITRANG  MISHRA', '', 1, 1, NULL, 0, 1),
(224, '17CE034', 'SHAILESH  KUMAR', '', 1, 1, NULL, 0, 1),
(225, '17CE035', 'SIDDHARTH', '', 1, 1, NULL, 0, 1),
(226, '17CE036', 'RAMAN  KUMAR', '', 1, 1, NULL, 0, 1),
(227, '17CE037', 'HARIKESH MAURYA', '', 1, 1, NULL, 0, 1),
(228, '17CE039', 'TARUN  SHARMA', '', 1, 1, NULL, 0, 1),
(229, '17CE040', 'NIDHI  SONKAR', '', 1, 1, NULL, 0, 1),
(230, '17CE041', 'PUSHPENDRA  TYAGI', '', 1, 1, NULL, 0, 1),
(231, '17CE043', 'MANASVI KUMAR', '', 1, 1, NULL, 0, 1),
(232, '17CE044', 'VATSAL  GAUR', '', 1, 1, NULL, 0, 1),
(233, '17CE048', 'RISHABH  MAHESHWARI', '', 1, 1, NULL, 0, 1),
(234, '17CE049', 'GAURAV SINGH YADAV', '', 1, 1, NULL, 0, 1),
(235, '17CE050', 'HARSH  KAUSHAL', '', 1, 1, NULL, 0, 1),
(236, '17CE051', 'ARPIT  YADAV', '', 1, 1, NULL, 0, 1),
(237, '17CE052', 'VISHAL  SINGH', '', 1, 1, NULL, 0, 1),
(238, '17CE054', 'VIKASH MADDHESHIA', '', 1, 1, NULL, 0, 1),
(239, '17CE055', 'VEERENDRA  YADAV', '', 1, 1, NULL, 0, 1),
(240, '17CE056', 'SHWETA  SINGH', '', 1, 1, NULL, 0, 1),
(241, '17CE061', 'SHRISHTI SINGH', '', 1, 1, NULL, 0, 1),
(242, '17CE064', 'VIVEK  RAO', '', 1, 1, NULL, 0, 1),
(243, '17CE065', 'ROHIT CHAUDHARY', '', 1, 1, NULL, 0, 1),
(244, '17CE066', 'MOHD NADEEM AKHTAR', '', 1, 1, NULL, 0, 1),
(245, '17CE067', 'JYOTI  PANDEY', '', 1, 1, NULL, 0, 1),
(246, '17CE068', 'SHOURYA MALL', '', 1, 1, NULL, 0, 1),
(247, '17CE069', 'SOMESH KUMAR GUPTA', '', 1, 1, NULL, 0, 1),
(248, '17CE070', 'ASHWANI  SHARMA', '', 1, 1, NULL, 0, 1),
(249, '17CE071', 'SHIVA  SHARMA', '', 1, 1, NULL, 0, 1),
(250, '17CE073', 'DIVYA  CHAK', '', 1, 1, NULL, 0, 1),
(251, '17CE074', 'YASH VARDHAN CHAK', '', 1, 1, NULL, 0, 1),
(252, '17CE075', 'HARSHIT  SHAKYA', '', 1, 1, NULL, 0, 1),
(253, '17CE076', 'SHRUTI  VERMA', '', 1, 1, NULL, 0, 1),
(254, '17CE077', 'RAJEEV  PANDEY', '', 1, 1, NULL, 0, 1),
(255, '17CE078', 'RUKMANI  GUPTA', '', 1, 1, NULL, 0, 1),
(256, '17CE079', 'ANSHIKA  YADAV', '', 1, 1, NULL, 0, 1),
(257, '17CE080', 'BHEESHM PAL SINGH', '', 1, 1, NULL, 0, 1),
(258, '17CE081', 'REHAN  RAZA', '', 1, 1, NULL, 0, 1),
(259, '17CE082', 'SACHIN  SINGH', '', 1, 1, NULL, 0, 1),
(260, '17CE083', 'SUNNY', '', 1, 1, NULL, 0, 1),
(261, '17CE084', 'ADITYA  VERMA', '', 1, 1, NULL, 0, 1),
(262, '17CE086', 'SWARANJALI  SINGH', '', 1, 1, NULL, 0, 1),
(263, '17CE087', 'KARUNESH  MAURYA', '', 1, 1, NULL, 0, 1),
(264, '17CE089', 'AMAN  CHAUDHARY', '', 1, 1, NULL, 0, 1),
(265, '17CE090', 'AKASH  TYAGI', '', 1, 1, NULL, 0, 1),
(266, '17CE091', 'AKASH  BHARDWAJ', '', 1, 1, NULL, 0, 1),
(267, '17CE092', 'HIMANSHU  GAUTAM', '', 1, 1, NULL, 0, 1),
(268, '17CE093', 'ANUDITA  ANAND', '', 1, 1, NULL, 0, 1),
(269, '17CE095', 'VISHAL  SONKER', '', 1, 1, NULL, 0, 1),
(270, '17CE096', 'MOHAMMAD  ADIL', '', 1, 1, NULL, 0, 1),
(271, '17CE097', 'AWINASH KUMAR', '', 1, 1, NULL, 0, 1),
(272, '17CE098', 'RAJAN SINGH TOMAR', '', 1, 1, NULL, 0, 1),
(273, '17CE099', 'MOHD SUHAIB AKHTAR', '', 1, 1, NULL, 0, 1),
(274, '17CE100', 'SHIVENDRA  SINGH', '', 1, 1, NULL, 0, 1),
(275, '17CE101', 'RICHA  DWIVEDI', '', 1, 1, NULL, 0, 1),
(276, '17CE102', 'DEEPAK KUMAR SINGH', '', 1, 1, NULL, 0, 1),
(277, '17CE103', 'AAYUSH  SRIVASTAVA', '', 1, 1, NULL, 0, 1),
(278, '17CE104', 'ADITYA  PRAKASH', '', 1, 1, NULL, 0, 1),
(279, '17CE105', 'EJAZ  ALI', '', 1, 1, NULL, 0, 1),
(280, '17CE106', 'ANSHUL  SINGH', '', 1, 1, NULL, 0, 1),
(281, '17CE107', 'AKSHAT SINGH TOMAR', '', 1, 1, NULL, 0, 1),
(282, '17CE108', 'VIKAS  UPADHYAY', '', 1, 1, NULL, 0, 1),
(283, '17CE109', 'AKSHAT  TYAGI', '', 1, 1, NULL, 0, 1),
(284, '17CE110', 'KSHITIJ  NARAIN', '', 1, 1, NULL, 0, 1),
(285, '17CE111', 'DEEKSHA SINGH', '', 1, 1, NULL, 0, 1),
(286, '17CE112', 'SHUBHAM  JAIN', '', 1, 1, NULL, 0, 1),
(287, '17CE113', 'BHAGWATI  NANDAN', '', 1, 1, NULL, 0, 1),
(288, '17CE114', 'ROHIT  DUBEY', '', 1, 1, NULL, 0, 1),
(289, '17CE115', 'SHIVAM  PANDEY', '', 1, 1, NULL, 0, 1),
(290, '17CE116', 'DEVANSH  GUPTA', '', 1, 1, NULL, 0, 1),
(291, '17CE117', 'DEVVRAT  NIRANJAN', '', 1, 1, NULL, 0, 1),
(292, '17CE118', 'ANUJ  BAJPAI', '', 1, 1, NULL, 0, 1),
(293, '17CE119', 'UMAR  FARAZ', '', 1, 1, NULL, 0, 1),
(294, '17CE120', 'KUMAR RAHUL RANJAN', '', 1, 1, NULL, 0, 1),
(295, '17CE121', 'SANGEET  BUDHAULIYA', '', 1, 1, NULL, 0, 1),
(296, '17CE122', 'SHIKHAR  TIWARI', '', 1, 1, NULL, 0, 1),
(297, '17CE123', 'VISHAL  GUPTA', '', 1, 1, NULL, 0, 1),
(298, '17CE124', 'ANIKET  VERMA', '', 1, 1, NULL, 0, 1),
(299, '17CE125', 'ADITYA  TIWARI', '', 1, 1, NULL, 0, 1),
(300, '17CE126', 'ANSHUL MALIYAN', '', 1, 1, NULL, 0, 1),
(301, '17CE127', 'SHUBHANSHOO  YADAV', '', 1, 1, NULL, 0, 1),
(302, '17CE128', 'VINAMARA  PODDAR', '', 1, 1, NULL, 0, 1),
(303, '17CE129', 'AMIR  KHAN', '', 1, 1, NULL, 0, 1),
(304, '17CE130', 'YASH  SONKAR', '', 1, 1, NULL, 0, 1),
(305, '17CE131', 'YUVRAJ  SRIVASTAVA', '', 1, 1, NULL, 0, 1),
(306, '17CE132', 'RUPANSHU  SINGH', '', 1, 1, NULL, 0, 1),
(307, '17CE133', 'RAJNISH  YADAV', '', 1, 1, NULL, 0, 1),
(308, '17CE134', 'YOGESH KRISHN CHAUDHARY', '', 1, 1, NULL, 0, 1),
(309, '17CE135', 'ADITYA  RANA', '', 1, 1, NULL, 0, 1),
(310, '17CE136', 'PRASHANT  GAUTAM', '', 1, 1, NULL, 0, 1),
(311, '17CE137', 'SHIV  KUMAR', '', 1, 1, NULL, 0, 1),
(312, '17CE138', 'SHUBHAM  BHATT', '', 1, 1, NULL, 0, 1),
(313, '17CE139', 'MANISH  SINGH', '', 1, 1, NULL, 0, 1),
(314, '17CE140', 'PRAKHAR PRATAP SINGH', '', 1, 1, NULL, 0, 1),
(315, '17CE141', 'ASHISH  CHAUHAN', '', 1, 1, NULL, 0, 1),
(316, '17CE142', 'PAWAN KUMAR YADAV', '', 1, 1, NULL, 0, 1),
(317, '17CE143', 'AMAN KUMAR YADAV', '', 1, 1, NULL, 0, 1),
(318, '17CE144', 'JAI  KATARIA', '', 1, 1, NULL, 0, 1),
(319, '17CE145', 'NISCHAL  GAUTAM', '', 1, 1, NULL, 0, 1),
(320, '16IT083', 'ACHINTYA  ASTHANA', '', 1, 1, NULL, 0, 1),
(321, '16IT116', 'HIMANSHU  RAI', '', 1, 1, NULL, 0, 1),
(322, '17IT001', 'JAYANT  CHATURVEDI', '', 1, 1, NULL, 0, 1),
(323, '17IT002', 'DIKSHA  SINGH', '', 1, 1, NULL, 0, 1),
(324, '17IT004', 'YASH  KESARWANI', '', 1, 1, NULL, 0, 1),
(325, '17IT005', 'AKSHAT  JAIN', '', 1, 1, NULL, 0, 1),
(326, '17IT006', 'MOHD AHAD ANIS', '', 1, 1, NULL, 0, 1),
(327, '17IT007', 'MAYANK  KUMAR', '', 1, 1, NULL, 0, 1),
(328, '17IT008', 'ANKIT RAJ', '', 1, 1, NULL, 0, 1),
(329, '17IT009', 'SAURABH  BHARDWAJ', '', 1, 1, NULL, 0, 1),
(330, '17IT011', 'HARSHIT  SHUKLA', '', 1, 1, NULL, 0, 1),
(331, '17IT012', 'ANKIT  CHAUDHARY', '', 1, 1, NULL, 0, 1),
(332, '17IT013', 'SATYAM  AGARWAL', '', 1, 1, NULL, 0, 1),
(333, '17IT014', 'SHIVAM  GUPTA', '', 1, 1, NULL, 0, 1),
(334, '17IT016', 'MRITUNJAY  TRIPATHI', '', 1, 1, NULL, 0, 1),
(335, '17IT019', 'DEVANSH  RASTOGI', '', 1, 1, NULL, 0, 1),
(336, '17IT020', 'MAYANK  AGARWAL', '', 1, 1, NULL, 0, 1),
(337, '17IT021', 'UTKARSH  YADAV', '', 1, 1, NULL, 0, 1),
(338, '17IT023', 'RUCHI', '', 1, 1, NULL, 0, 1),
(339, '17IT024', 'CHAITANYA  AGARWAL', '', 1, 1, NULL, 0, 1),
(340, '17IT025', 'SUDHANSHU  GAUTAM', '', 1, 1, NULL, 0, 1),
(341, '17IT027', 'SAHU YASH DEVENDRA', '', 1, 1, NULL, 0, 1),
(342, '17IT029', 'UTKARSH  PAL', '', 1, 1, NULL, 0, 1),
(343, '17IT031', 'KUSHAGRA  AMAN', '', 1, 1, NULL, 0, 1),
(344, '17IT032', 'ASHWINI KUMAR', '', 1, 1, NULL, 0, 1),
(345, '17IT033', 'AYUSH  MEHROTRA', '', 1, 1, NULL, 0, 1),
(346, '17IT034', 'SHREYA  PODDAR', '', 1, 1, NULL, 0, 1),
(347, '17IT035', 'RITIK RAJ', '', 1, 1, NULL, 0, 1),
(348, '17IT036', 'VANDANA  KALSHAN', '', 1, 1, NULL, 0, 1),
(349, '17IT039', 'AKHIL  OMAR', '', 1, 1, NULL, 0, 1),
(350, '17IT040', 'VATSAL  BHATNAGAR', '', 1, 1, NULL, 0, 1),
(351, '17IT041', 'UDISHA  SINGHAL', '', 1, 1, NULL, 0, 1),
(352, '17IT042', 'SHIVANK  GUPTA', '', 1, 1, NULL, 0, 1),
(353, '17IT044', 'SHUBHAM  PATHAK', '', 1, 1, NULL, 0, 1),
(354, '17IT046', 'DIKSHA  DHARIWAL', '', 1, 1, NULL, 0, 1),
(355, '17IT047', 'SWAPNIL  JOHRI', '', 1, 1, NULL, 0, 1),
(356, '17IT049', 'ABHISHEK', '', 1, 1, NULL, 0, 1),
(357, '17IT053', 'AKASH  RAJPUT', '', 1, 1, NULL, 0, 1),
(358, '17IT054', 'ANSHUL', '', 1, 1, NULL, 0, 1),
(359, '17IT056', 'ABHISHEK  CHAURASIA', '', 1, 1, NULL, 0, 1),
(360, '17IT058', 'PRADYUMNA  GUPTA', '', 1, 1, NULL, 0, 1),
(361, '17IT060', 'NITIN  BHARATI', '', 1, 1, NULL, 0, 1),
(362, '17IT061', 'RACHIT  KANAUJIA', '', 1, 1, NULL, 0, 1),
(363, '17IT063', 'SHRESTH PRATAP SINGH', '', 1, 1, NULL, 0, 1),
(364, '17IT064', 'SHUBHAM  SINGH', '', 1, 1, NULL, 0, 1),
(365, '17IT066', 'HARSH  AGARWAL', '', 1, 1, NULL, 0, 1),
(366, '17IT067', 'ANUSHIV  SHUKLA', '', 1, 1, NULL, 0, 1),
(367, '17IT068', 'VAIBHAV  CHAUDHARY', '', 1, 1, NULL, 0, 1),
(368, '17IT069', 'AKRITI  GOSWAMI', '', 1, 1, NULL, 0, 1),
(369, '17IT070', 'RAMJI  NIGAM', '', 1, 1, NULL, 0, 1),
(370, '17IT071', 'KAUSTUBH  DIXIT', '', 1, 1, NULL, 0, 1),
(371, '17IT072', 'SHASHI PRAKASH', '', 1, 1, NULL, 0, 1),
(372, '17IT073', 'YASH  CHATURVEDI', '', 1, 1, NULL, 0, 1),
(373, '17IT074', 'PRAKHAR SAXENA', '', 1, 1, NULL, 0, 1),
(374, '17IT075', 'SHIVAM KUMAR GUPTA', '', 1, 1, NULL, 0, 1),
(375, '17IT076', 'ANUJ  TOPNO', '', 1, 1, NULL, 0, 1),
(376, '17IT077', 'ABHIJEET SINGH YADAV', '', 1, 1, NULL, 0, 1),
(377, '17IT078', 'GAGAN  VERMA', '', 1, 1, NULL, 0, 1),
(378, '17IT080', 'ASHUTOSH  GUPTA', '', 1, 1, NULL, 0, 1),
(379, '17IT081', 'ALOK KUMAR GAUTAM', '', 1, 1, NULL, 0, 1),
(380, '17IT083', 'MUKUL  DIXIT', '', 1, 1, NULL, 0, 1),
(381, '17IT084', 'DIVYANK  MISHRA', '', 1, 1, NULL, 0, 1),
(382, '17IT085', 'SUMIT  LAL', '', 1, 1, NULL, 0, 1),
(383, '17IT086', 'RITIKA  VERMA', '', 1, 1, NULL, 0, 1),
(384, '17IT087', 'MAYUKH  SRIVASTAVA', '', 1, 1, NULL, 0, 1),
(385, '17IT088', 'CHIRAG  SINGH', '', 1, 1, NULL, 0, 1),
(386, '17IT089', 'ASMITA  VERMA', '', 1, 1, NULL, 0, 1),
(387, '17IT090', 'PRATEEK  KRISHNA', '', 1, 1, NULL, 0, 1),
(388, '17IT091', 'PRANJAL  PAROLIA', '', 1, 1, NULL, 0, 1),
(389, '17IT092', 'PRAKHAR  DEEP', '', 1, 1, NULL, 0, 1),
(390, '17IT093', 'KUSH  VERMA', '', 1, 1, NULL, 0, 1),
(391, '17IT094', 'ANURAG  TRIPATHI', '', 1, 1, NULL, 0, 1),
(392, '17IT095', 'ASHIKA  AGRAWAL', '', 1, 1, NULL, 0, 1),
(393, '17IT096', 'MANISH  SINGH', '', 1, 1, NULL, 0, 1),
(394, '17IT097', 'ARYAN  JAISWAL', '', 1, 1, NULL, 0, 1),
(395, '17IT098', 'ITISHA', '', 1, 1, NULL, 0, 1),
(396, '17IT099', 'UTKARSH  SRIVASTAVA', '', 1, 1, NULL, 0, 1),
(397, '17IT100', 'PRIYANKA PATEL', '', 1, 1, NULL, 0, 1),
(398, '17IT101', 'MILIND  MALKANI', '', 1, 1, NULL, 0, 1),
(399, '17IT102', 'VIVECHNA  GOEL', '', 1, 1, NULL, 0, 1),
(400, '17IT103', 'SHREYA  SRIVASTAVA', '', 1, 1, NULL, 0, 1),
(401, '17IT104', 'ABHINAV  VERMA', '', 1, 1, NULL, 0, 1),
(402, '17IT105', 'AKSHAY  TOMAR', '', 1, 1, NULL, 0, 1),
(403, '17IT106', 'ROHIT KUMAR', '', 1, 1, NULL, 0, 1),
(404, '17IT107', 'SAMARTH  VERMA', '', 1, 1, NULL, 0, 1),
(405, '17IT108', 'DEEPESH  YADAV', '', 1, 1, NULL, 0, 1),
(406, '17IT109', 'NAMAN  TYAGI', '', 1, 1, NULL, 0, 1),
(407, '17IT110', 'ROHAN  VERMA', '', 1, 1, NULL, 0, 1),
(408, '17IT111', 'SAKSHAM  SINGH', '', 1, 1, NULL, 0, 1),
(409, '17IT112', 'PRAJJWAL  MAHESHWARI', '', 1, 1, NULL, 0, 1),
(410, '17IT113', 'HIMANSHU  YADAV', '', 1, 1, NULL, 0, 1),
(411, '17IT114', 'APOORVA  MURJANI', '', 1, 1, NULL, 0, 1),
(412, '17IT115', 'DEVESH  DWIVEDI', '', 1, 1, NULL, 0, 1),
(413, '17IT116', 'MOHD HAMZA KHAN', '', 1, 1, NULL, 0, 1),
(414, '17IT117', 'DHAWAL  VISWARI', '', 1, 1, NULL, 0, 1),
(415, '17IT118', 'RIYA  VERMA', '', 1, 1, NULL, 0, 1),
(416, '17IT119', 'SAURABH RANJAN SRIVASTAVA', '', 1, 1, NULL, 0, 1),
(417, '17IT120', 'AYUSH  GUPTA', '', 1, 1, NULL, 0, 1),
(418, '17IT121', 'VAIBHAV  SINGH', '', 1, 1, NULL, 0, 1),
(419, '17IT122', 'VARSHA', '', 1, 1, NULL, 0, 1),
(420, '17IT123', 'DIVYANSH  SINGH', '', 1, 1, NULL, 0, 1),
(421, '17IT124', 'VIPLOW  SRIVASTAVA', '', 1, 1, NULL, 0, 1),
(422, '17IT125', 'MEWANSHI  KATIYAR', '', 1, 1, NULL, 0, 1),
(423, '17IT126', 'AVINASH  KUMAR', '', 1, 1, NULL, 0, 1),
(424, '17IT127', 'SHUBHAM  TYAGI', '', 1, 1, NULL, 0, 1),
(425, '17IT128', 'RAHUL  ANAND', '', 1, 1, NULL, 0, 1),
(426, '17IT129', 'RADHIKA  BAJAJ', '', 1, 1, NULL, 0, 1),
(427, '17IT130', 'ROBIN  NAGAR', '', 1, 1, NULL, 0, 1),
(428, '17IT131', 'SAKSHAM  GUPTA', '', 1, 1, NULL, 0, 1),
(429, '17IT132', 'PRAKHAR  GUPTA', '', 1, 1, NULL, 0, 1),
(430, '17IT133', 'VISHAL  SHUKLA', '', 1, 1, NULL, 0, 1),
(431, '17IT134', 'NAVENDU  RAJ', '', 1, 1, NULL, 0, 1),
(432, '17IT135', 'YOGESH KUMAR', '', 1, 1, NULL, 0, 1),
(433, '17IT136', 'AKSHAT  MISHRA', '', 1, 1, NULL, 0, 1),
(434, '17IT137', 'MANVENDRA  SINGH', '', 1, 1, NULL, 0, 1),
(435, '17IT138', 'VAIBHAV  DAYAL', '', 1, 1, NULL, 0, 1),
(436, '17IT139', 'KUSHAGRA  AWASTHI', '', 1, 1, NULL, 0, 1),
(437, '17IT140', 'DIVYANSH  CHAUHAN', '', 1, 1, NULL, 0, 1),
(438, '17IT141', 'POOJA  UPADHYAY', '', 1, 1, NULL, 0, 1),
(439, '17IT142', 'FAIZAN  HUSSAIN', '', 1, 1, NULL, 0, 1),
(440, '17IT143', 'SURYANSH  MISHRA', '', 1, 1, NULL, 0, 1),
(441, '17IT144', 'LALIT  TYAGI', '', 1, 1, NULL, 0, 1),
(442, '17IT145', 'RAJ ARYAN GUPTA', '', 1, 1, NULL, 0, 1),
(443, '17IT146', 'SHUBHAM  SHARMA', '', 1, 1, NULL, 0, 1),
(444, '17IT147', 'ANIMISH  VAISH', '', 1, 1, NULL, 0, 1),
(445, '17IT148', 'DEEKSHA  SINGH', '', 1, 1, NULL, 0, 1),
(446, '17IT149', 'UTKARSH  ETAR', '', 1, 1, NULL, 0, 1),
(447, '17IT150', 'ADITI  SHARMA', '', 1, 1, NULL, 0, 1),
(448, '16EE120', 'KRATANT  SHARMA', '', 1, 1, NULL, 0, 1),
(449, '17EE001', 'HARDIK  CHOUDHARY', '', 1, 1, NULL, 0, 1),
(450, '17EE002', 'SHWETANK  SRIVASTAVA', '', 1, 1, NULL, 0, 1),
(451, '17EE003', 'UTKARSH  SINGH', '', 1, 1, NULL, 0, 1),
(452, '17EE004', 'VAISHALI', '', 1, 1, NULL, 0, 1),
(453, '17EE005', 'SUBHAM  KUMAR', '', 1, 1, NULL, 0, 1),
(454, '17EE007', 'PIYUSH  KAMBOJ', '', 1, 1, NULL, 0, 1),
(455, '17EE009', 'RISHABH KUMAR SINGH', '', 1, 1, NULL, 0, 1),
(456, '17EE010', 'USAID  AHMAD', '', 1, 1, NULL, 0, 1),
(457, '17EE011', 'RAJESHWARI  YADAV', '', 1, 1, NULL, 0, 1),
(458, '17EE012', 'PRATEEK  SINGH', '', 1, 1, NULL, 0, 1),
(459, '17EE014', 'SHIVAM  KUMAR', '', 1, 1, NULL, 0, 1),
(460, '17EE015', 'RAVI  VERMA', '', 1, 1, NULL, 0, 1),
(461, '17EE017', 'KANISHKA  RANA', '', 1, 1, NULL, 0, 1),
(462, '17EE018', 'TUSHAR  KUSHWAHA', '', 1, 1, NULL, 0, 1),
(463, '17EE019', 'YOGENDRA  SINGH', '', 1, 1, NULL, 0, 1),
(464, '17EE020', 'SARVESH KUMAR YADAV', '', 1, 1, NULL, 0, 1),
(465, '17EE021', 'POOJA  GUPTA', '', 1, 1, NULL, 0, 1),
(466, '17EE022', 'RITIK KUMAR GAUTAM', '', 1, 1, NULL, 0, 1),
(467, '17EE023', 'SURAJ KUMAR SINGH', '', 1, 1, NULL, 0, 1),
(468, '17EE025', 'MOHD OVAID', '', 1, 1, NULL, 0, 1),
(469, '17EE026', 'ABHISHEK  SINGH', '', 1, 1, NULL, 0, 1),
(470, '17EE027', 'PRAKHAR  SRIVASTAVA', '', 1, 1, NULL, 0, 1),
(471, '17EE028', 'VISHAL  YADAV', '', 1, 1, NULL, 0, 1),
(472, '17EE029', 'PRASHANT KUMAR PANDEY', '', 1, 1, NULL, 0, 1),
(473, '17EE030', 'KAUSHIK  DUBEY', '', 1, 1, NULL, 0, 1),
(474, '17EE031', 'RISHABH  SHAH', '', 1, 1, NULL, 0, 1),
(475, '17EE032', 'VIKASH KUMAR PATEL', '', 1, 1, NULL, 0, 1),
(476, '17EE033', 'VAIBHAV SINGH', '', 1, 1, NULL, 0, 1),
(477, '17EE034', 'AMIT  SINGH', '', 1, 1, NULL, 0, 1),
(478, '17EE035', 'PRERNA  MISHRA', '', 1, 1, NULL, 0, 1),
(479, '17EE038', 'AARUSHI SINGH', '', 1, 1, NULL, 0, 1),
(480, '17EE039', 'GAURAV PRATAP SINGH', '', 1, 1, NULL, 0, 1),
(481, '17EE040', 'UTKARSH  VARSHNEY', '', 1, 1, NULL, 0, 1),
(482, '17EE041', 'VIPUL  YADAV', '', 1, 1, NULL, 0, 1),
(483, '17EE042', 'PRAKHER  SHARMA', '', 1, 1, NULL, 0, 1),
(484, '17EE043', 'SHIKHAR  MISHRA', '', 1, 1, NULL, 0, 1),
(485, '17EE044', 'NEERAJ  KUMAR', '', 1, 1, NULL, 0, 1),
(486, '17EE045', 'ANAND PRATAP SINGH', '', 1, 1, NULL, 0, 1),
(487, '17EE047', 'ARCHIT  KUMAR', '', 1, 1, NULL, 0, 1),
(488, '17EE048', 'LALIT MOHAN RAWAT', '', 1, 1, NULL, 0, 1),
(489, '17EE050', 'HARSH  RATHORE', '', 1, 1, NULL, 0, 1),
(490, '17EE051', 'SHUBHAM  MISHRA', '', 1, 1, NULL, 0, 1),
(491, '17EE053', 'ADITYA  CHANDRA', '', 1, 1, NULL, 0, 1),
(492, '17EE055', 'LUV  PATHAK', '', 1, 1, NULL, 0, 1),
(493, '17EE057', 'RISHABH  KHARE', '', 1, 1, NULL, 0, 1),
(494, '17EE059', 'ASHISH  DWIVEDI', '', 1, 1, NULL, 0, 1),
(495, '17EE060', 'YASH  YADAV', '', 1, 1, NULL, 0, 1),
(496, '17EE061', 'SHUBHAM  DWIVEDI', '', 1, 1, NULL, 0, 1),
(497, '17EE062', 'SHARDA  YADAV', '', 1, 1, NULL, 0, 1),
(498, '17EE065', 'PRAVEEN  PRAKASH', '', 1, 1, NULL, 0, 1),
(499, '17EE067', 'ABHINAV KUMAR SINGH', '', 1, 1, NULL, 0, 1),
(500, '17EE068', 'RAJ KUMAR YADAV', '', 1, 1, NULL, 0, 1),
(501, '17EE069', 'ANUSHKA  SINGH', '', 1, 1, NULL, 0, 1),
(502, '17EE070', 'YASHASVI  SANSKRITYAN', '', 1, 1, NULL, 0, 1),
(503, '17EE071', 'YOGESH  KUMAR', '', 1, 1, NULL, 0, 1),
(504, '17EE072', 'ARPIT SINGH', '', 1, 1, NULL, 0, 1),
(505, '17EE073', 'DEEPSHIKHA  SRIVASTAVA', '', 1, 1, NULL, 0, 1),
(506, '17EE074', 'SARTHAK  SINGH', '', 1, 1, NULL, 0, 1),
(507, '17EE075', 'MUSKAN  AGRAWAL', '', 1, 1, NULL, 0, 1),
(508, '17EE076', 'SHIVAM  PRAJAPATI', '', 1, 1, NULL, 0, 1),
(509, '17EE077', 'LALIT  PRATAP', '', 1, 1, NULL, 0, 1),
(510, '17EE078', 'AVIRAL  KRISHNA', '', 1, 1, NULL, 0, 1),
(511, '17EE079', 'DIVYANSHU  SINGH', '', 1, 1, NULL, 0, 1),
(512, '17EE080', 'ARUN KUMAR', '', 1, 1, NULL, 0, 1),
(513, '17EE081', 'SUDHEER  KUMAR', '', 1, 1, NULL, 0, 1),
(514, '17EE082', 'ABHISHEK SRIVASTAVA', '', 1, 1, NULL, 0, 1),
(515, '17EE083', 'AMURT  PRAKASH', '', 1, 1, NULL, 0, 1),
(516, '17EE084', 'VISHAL  UPADHYAY', '', 1, 1, NULL, 0, 1),
(517, '17EE085', 'ANANT  SHARMA', '', 1, 1, NULL, 0, 1),
(518, '17EE086', 'SHIPRA  GUPTA', '', 1, 1, NULL, 0, 1),
(519, '17EE089', 'ANIKET  RAJ', '', 1, 1, NULL, 0, 1),
(520, '17EE090', 'AKASH  YADAV', '', 1, 1, NULL, 0, 1),
(521, '17EE091', 'JIGYASU  NIGAM', '', 1, 1, NULL, 0, 1),
(522, '17EE092', 'KM PRATIBHA SONI', '', 1, 1, NULL, 0, 1),
(523, '17EE093', 'SAURAV KUMAR SINGH', '', 1, 1, NULL, 0, 1),
(524, '17EE094', 'ANURUDH  KUMAR', '', 1, 1, NULL, 0, 1),
(525, '17EE095', 'HARSH  DESHWAL', '', 1, 1, NULL, 0, 1),
(526, '17EE096', 'KARTIKA  AGARWAL', '', 1, 1, NULL, 0, 1),
(527, '17EE097', 'HIMANSHU RAI', '', 1, 1, NULL, 0, 1),
(528, '17EE098', 'AYUSH YADAV', '', 1, 1, NULL, 0, 1),
(529, '17EE099', 'SAKET  KHANDELWAL', '', 1, 1, NULL, 0, 1),
(530, '17EE100', 'VANSH  GARG', '', 1, 1, NULL, 0, 1),
(531, '17EE101', 'ADITYA KUMAR GIRI', '', 1, 1, NULL, 0, 1),
(532, '17EE102', 'PRATEEKSHA  RANJAN', '', 1, 1, NULL, 0, 1),
(533, '17EE103', 'RISHI  SHUKLA', '', 1, 1, NULL, 0, 1),
(534, '17EE104', 'SNEHA  SINGH', '', 1, 1, NULL, 0, 1),
(535, '17EE105', 'PRIYANSH  SINGHAL', '', 1, 1, NULL, 0, 1),
(536, '17EE106', 'MUKUL  KATIYAR', '', 1, 1, NULL, 0, 1),
(537, '17EE107', 'HARSHITA', '', 1, 1, NULL, 0, 1),
(538, '17EE108', 'AMAN  RATHORE', '', 1, 1, NULL, 0, 1),
(539, '17EE109', 'CHITRA  RANJAN', '', 1, 1, NULL, 0, 1),
(540, '17EE110', 'KARTIKEY  SINGH', '', 1, 1, NULL, 0, 1),
(541, '17EE111', 'NITYA  SRIVASTAVA', '', 1, 1, NULL, 0, 1),
(542, '17EE112', 'AAYUSH  SRIVASTAVA', '', 1, 1, NULL, 0, 1),
(543, '17EE113', 'ASHUTOSH  AMBEY', '', 1, 1, NULL, 0, 1),
(544, '17EE114', 'PRABAL RAJ SHARMA', '', 1, 1, NULL, 0, 1),
(545, '17EE115', 'SUYASH  BINOD', '', 1, 1, NULL, 0, 1),
(546, '17EE116', 'ADITYA  SINGH', '', 1, 1, NULL, 0, 1),
(547, '17EE117', 'ASHUTOSH  SINGH', '', 1, 1, NULL, 0, 1),
(548, '17EE118', 'SUDHANSHU  MAURYA', '', 1, 1, NULL, 0, 1),
(549, '17EE119', 'RAHUL  SHARMA', '', 1, 1, NULL, 0, 1),
(550, '17EE120', 'HARSH  SHARMA', '', 1, 1, NULL, 0, 1),
(551, '17EE121', 'AKASH  SHARMA', '', 1, 1, NULL, 0, 1),
(552, '17EE122', 'AMRIT KUMAR YADAV', '', 1, 1, NULL, 0, 1),
(553, '17EE123', 'ADITYA  SINGH', '', 1, 1, NULL, 0, 1),
(554, '17EE124', 'HIMANSHU PRAKASH GUPTA', '', 1, 1, NULL, 0, 1),
(555, '17EE125', 'SUNIL', '', 1, 1, NULL, 0, 1),
(556, '17EE126', 'AKASH  PANDEY', '', 1, 1, NULL, 0, 1),
(557, '17EE127', 'RAVI  CHATURVEDI', '', 1, 1, NULL, 0, 1),
(558, '17EE128', 'ABHISHEK  PANDEY', '', 1, 1, NULL, 0, 1),
(559, '17EE129', 'PRASHANT KUMAR SRIVASTAVA', '', 1, 1, NULL, 0, 1),
(560, '17EE130', 'AYUSH RAMAN RAI', '', 1, 1, NULL, 0, 1),
(561, '17EE131', 'RAKSHIT  PANDEY', '', 1, 1, NULL, 0, 1),
(562, '17EE132', 'TARUN  SHEKHER', '', 1, 1, NULL, 0, 1),
(563, '17EE133', 'ANUSHIKA  NAGVANSHI', '', 1, 1, NULL, 0, 1),
(564, '17EE134', 'AKARSH  SINGH', '', 1, 1, NULL, 0, 1),
(565, '17EE135', 'SWATI CHATURVEDI', '', 1, 1, NULL, 0, 1),
(566, '17EE136', 'ARPIT  YADAV', '', 1, 1, NULL, 0, 1),
(567, '17EE137', 'ABHISHEK  BALUNI', '', 1, 1, NULL, 0, 1),
(568, '17EE138', 'VIKAS  TIWARI', '', 1, 1, NULL, 0, 1),
(569, '17EE139', 'SHEKHAR  YADAV', '', 1, 1, NULL, 0, 1),
(570, '17EE140', 'SIMRAN  JAYASWAL', '', 1, 1, NULL, 0, 1),
(571, '17EE141', 'SAGAR  CHAUDHARY', '', 1, 1, NULL, 0, 1),
(572, '17EE142', 'SONALI  ARORA', '', 1, 1, NULL, 0, 1),
(573, '17EEE001', 'AYUSH  CHANDRA', '', 1, 1, NULL, 0, 1),
(574, '17EEE002', 'MONU  KUMAR', '', 1, 1, NULL, 0, 1),
(575, '17EEE003', 'ARPIT SINGH', '', 1, 1, NULL, 0, 1),
(576, '17EEE004', 'ROOPAM  AGRAWAL', '', 1, 1, NULL, 0, 1),
(577, '17EEE005', 'NEERAJ KUMAR MAURYA', '', 1, 1, NULL, 0, 1),
(578, '17EEE006', 'NIKITA  CHAUDHARY', '', 1, 1, NULL, 0, 1),
(579, '17EEE008', 'PRAFULLA RAJA NISHAD', '', 1, 1, NULL, 0, 1),
(580, '17EEE009', 'PRACHI  PRABHAKAR', '', 1, 1, NULL, 0, 1),
(581, '17EEE010', 'SHUBHAM  SINGH', '', 1, 1, NULL, 0, 1),
(582, '17EEE011', 'MAITRAYI  RAJAWAT', '', 1, 1, NULL, 0, 1),
(583, '17EEE012', 'ANMOL  GOEL', '', 1, 1, NULL, 0, 1),
(584, '17EEE013', 'DHRUV BHASKER', '', 1, 1, NULL, 0, 1),
(585, '17EEE014', 'SHAGUN RASTOGI', '', 1, 1, NULL, 0, 1),
(586, '17EEE016', 'ASHUTOSH  TIWARI', '', 1, 1, NULL, 0, 1),
(587, '17EEE017', 'SARIM  IRSHAD', '', 1, 1, NULL, 0, 1),
(588, '17EEE019', 'KIRTI  VERMA', '', 1, 1, NULL, 0, 1),
(589, '17EEE020', 'ANKIT RAI', '', 1, 1, NULL, 0, 1),
(590, '17EEE021', 'AJAY  ARORA', '', 1, 1, NULL, 0, 1),
(591, '17EEE022', 'AAYUSH KUMAR SINGH', '', 1, 1, NULL, 0, 1),
(592, '17EEE023', 'ABHISHEK  KUMAR', '', 1, 1, NULL, 0, 1),
(593, '17EEE025', 'SHIVAM  MAURYA', '', 1, 1, NULL, 0, 1),
(594, '17EEE027', 'VISVENDER  SOROUT', '', 1, 1, NULL, 0, 1),
(595, '17EEE028', 'SANSKAR  JAISWAL', '', 1, 1, NULL, 0, 1),
(596, '17EEE031', 'VAIBHAV RAJPUT', '', 1, 1, NULL, 0, 1),
(597, '17EEE033', 'SHARAD  CHATURVEDI', '', 1, 1, NULL, 0, 1),
(598, '17EEE034', 'MOHD SAHIR', '', 1, 1, NULL, 0, 1),
(599, '17EEE035', 'SHIKHAR  SHARMA', '', 1, 1, NULL, 0, 1),
(600, '17EEE037', 'RAVI PRAKASH GAUTAM', '', 1, 1, NULL, 0, 1),
(601, '17EEE038', 'ANUJ  CHOUDHARY', '', 1, 1, NULL, 0, 1),
(602, '17EEE039', 'NITYANAND  GAUTAM', '', 1, 1, NULL, 0, 1),
(603, '17EEE040', 'ABHINAV SINGH KUSHAWAHA', '', 1, 1, NULL, 0, 1),
(604, '17EEE041', 'TIJIL  SHANDILYA', '', 1, 1, NULL, 0, 1),
(605, '17EEE042', 'ASHISH  KUNWAR', '', 1, 1, NULL, 0, 1),
(606, '17EEE043', 'ABHISHEK  RANA', '', 1, 1, NULL, 0, 1),
(607, '17EEE044', 'BHAVYA  AGRAWAL', '', 1, 1, NULL, 0, 1),
(608, '17EEE045', 'MOHD MUZZAMMIL KHAN', '', 1, 1, NULL, 0, 1),
(609, '17EEE046', 'PRAGYA  SINGH', '', 1, 1, NULL, 0, 1),
(610, '17EEE047', 'AMAN  TIWARI', '', 1, 1, NULL, 0, 1),
(611, '17EEE048', 'NIKITA  VARSHNEY', '', 1, 1, NULL, 0, 1),
(612, '17EEE049', 'SAJAT  MEHTA', '', 1, 1, NULL, 0, 1),
(613, '17EEE050', 'PRAKHAR  CHAUDHARY', '', 1, 1, NULL, 0, 1),
(614, '17EEE051', 'SRIJAN  JAISWAL', '', 1, 1, NULL, 0, 1),
(615, '17EEE052', 'SHRUTI', '', 1, 1, NULL, 0, 1),
(616, '17EEE053', 'AKANKSHA  BAJPAI', '', 1, 1, NULL, 0, 1),
(617, '17EEE054', 'SHUBHAM  CHAURASIA', '', 1, 1, NULL, 0, 1),
(618, '17EEE055', 'LOKESH  CHAWLA', '', 1, 1, NULL, 0, 1),
(619, '17EEE056', 'CHANDRANSHU  SINGH', '', 1, 1, NULL, 0, 1),
(620, '17EEE057', 'HARSHITA  OJHA', '', 1, 1, NULL, 0, 1),
(621, '17EEE058', 'KRITI  SHARMA', '', 1, 1, NULL, 0, 1),
(622, '17EEE059', 'VYAS  B', '', 1, 1, NULL, 0, 1),
(623, '17EEE060', 'ABHISHEK  KAUSHIK', '', 1, 1, NULL, 0, 1),
(624, '17EEE061', 'SHIVANGI  TIWARI', '', 1, 1, NULL, 0, 1),
(625, '17EEE062', 'AARUSHI  TIWARI', '', 1, 1, NULL, 0, 1),
(626, '17EEE063', 'ADITYA  BHATT', '', 1, 1, NULL, 0, 1),
(627, '17EEE064', 'AMIT  RAO', '', 1, 1, NULL, 0, 1),
(628, '17EEE065', 'AISHWARYA  SARASWAT', '', 1, 1, NULL, 0, 1),
(629, '17EEE066', 'HRITHVIK  SHARMA', '', 1, 1, NULL, 0, 1),
(630, '17EEE067', 'PRAGATI GUPTA', '', 1, 1, NULL, 0, 1),
(631, '17EEE068', 'SOURAV KUMAR JHARSI', '', 1, 1, NULL, 0, 1),
(632, '17EEE069', 'ARPIT KUMAR', '', 1, 1, NULL, 0, 1),
(633, '17EEE070', 'ANINDYA NARAYAN CHAKRAVARTY', '', 1, 1, NULL, 0, 1),
(634, '17EEE071', 'AVIRAL  ARYA', '', 1, 1, NULL, 0, 1),
(635, '17EEE072', 'SAHIL  KUMAR', '', 1, 1, NULL, 0, 1),
(636, '16IC012', 'RITVIK  AULAKH', '', 1, 1, NULL, 0, 1),
(637, '17IC002', 'KSHITIJ KUMAR NIMANG', '', 1, 1, NULL, 0, 1),
(638, '17IC003', 'OORJA  SINHA', '', 1, 1, NULL, 0, 1),
(639, '17IC004', 'SHRUTI  SINGH', '', 1, 1, NULL, 0, 1),
(640, '17IC006', 'ANUSHKA  JAISWAL', '', 1, 1, NULL, 0, 1),
(641, '17IC008', 'ADITI  VERMA', '', 1, 1, NULL, 0, 1),
(642, '17IC011', 'AKSHAY DEEP', '', 1, 1, NULL, 0, 1),
(643, '17IC012', 'SACHIN  DEV', '', 1, 1, NULL, 0, 1),
(644, '17IC013', 'PRAKHAR  GURHA', '', 1, 1, NULL, 0, 1),
(645, '17IC015', 'JYOTI RAWAT', '', 1, 1, NULL, 0, 1),
(646, '17IC017', 'MANJARI  GUPTA', '', 1, 1, NULL, 0, 1),
(647, '17IC019', 'AHMAD  FAIZ', '', 1, 1, NULL, 0, 1),
(648, '17IC021', 'ROHIT  RAJ', '', 1, 1, NULL, 0, 1),
(649, '17IC022', 'SURAJ  MISHRA', '', 1, 1, NULL, 0, 1),
(650, '17IC023', 'PRADEEP  KUMAR', '', 1, 1, NULL, 0, 1),
(651, '17IC025', 'RAHUL BANSAL', '', 1, 1, NULL, 0, 1),
(652, '17IC026', 'SHIVAM  DWIVEDI', '', 1, 1, NULL, 0, 1),
(653, '17IC027', 'UTKARSH  SINGH', '', 1, 1, NULL, 0, 1),
(654, '17IC028', 'PRIYA KUMARI SHUKLA', '', 1, 1, NULL, 0, 1),
(655, '17IC055', 'PRINCE  UTREJA', '', 1, 1, NULL, 0, 1),
(656, '17IC056', 'TANVI  KAUSHIK', '', 1, 1, NULL, 0, 1),
(657, '17IC058', 'SAMEER  MISHRA', '', 1, 1, NULL, 0, 1),
(658, '17IC059', 'PARTH  SAHAI', '', 1, 1, NULL, 0, 1),
(659, '17IC060', 'PRAKHAR  SRIVASTAVA', '', 1, 1, NULL, 0, 1),
(660, '17IC061', 'RISHABH RAJ SINGH', '', 1, 1, NULL, 0, 1),
(661, '17IC062', 'AYUSHI  GUPTA', '', 1, 1, NULL, 0, 1),
(662, '17IC063', 'YASHIKA  GUPTA', '', 1, 1, NULL, 0, 1),
(663, '16EC145', 'UTTKARSH  JAISWAL', '', 1, 1, NULL, 0, 1),
(664, '16EC175', 'MOHI  AGARWAL', '', 1, 1, NULL, 0, 1),
(665, '17EC001', 'ARPIT  PANDEY', '', 1, 1, NULL, 0, 1),
(666, '17EC002', 'AAYUSH  GUPTA', '', 1, 1, NULL, 0, 1),
(667, '17EC003', 'KAVYA  PANDEY', '', 1, 1, NULL, 0, 1),
(668, '17EC004', 'DEVANSH GUPTA', '', 1, 1, NULL, 0, 1),
(669, '17EC005', 'YASH  GARG', '', 1, 1, NULL, 0, 1),
(670, '17EC006', 'ARPAN  SINGH', '', 1, 1, NULL, 0, 1),
(671, '17EC007', 'HARSH VARDHAN SINGH', '', 1, 1, NULL, 0, 1),
(672, '17EC010', 'RITIK  SHARMA', '', 1, 1, NULL, 0, 1),
(673, '17EC012', 'VISHAL SINGH', '', 1, 1, NULL, 0, 1),
(674, '17EC013', 'NISCHAL  SINGH', '', 1, 1, NULL, 0, 1),
(675, '17EC014', 'SHIVANSH  SRIVASTAV', '', 1, 1, NULL, 0, 1),
(676, '17EC015', 'AMISHA  SARRAF', '', 1, 1, NULL, 0, 1),
(677, '17EC016', 'DHRUV  VERMA', '', 1, 1, NULL, 0, 1),
(678, '17EC017', 'SUYASH  BAKRE', '', 1, 1, NULL, 0, 1),
(679, '17EC018', 'PRASOON RAJ GAURAV', '', 1, 1, NULL, 0, 1),
(680, '17EC019', 'PRASHANT  SINGH', '', 1, 1, NULL, 0, 1),
(681, '17EC020', 'VINEET KUMAR GAUTAM', '', 1, 1, NULL, 0, 1),
(682, '17EC021', 'MOHAMMAD  ASSAD', '', 1, 1, NULL, 0, 1),
(683, '17EC022', 'SHUBHANGAM  SAXENA', '', 1, 1, NULL, 0, 1),
(684, '17EC023', 'HIMANSHU  PAL', '', 1, 1, NULL, 0, 1),
(685, '17EC024', 'YASH CHATURVEDI', '', 1, 1, NULL, 0, 1),
(686, '17EC025', 'SHIVANSH  MEHROTRA', '', 1, 1, NULL, 0, 1),
(687, '17EC027', 'RUPALEE', '', 1, 1, NULL, 0, 1),
(688, '17EC028', 'APOORVA  SRIVASTAVA', '', 1, 1, NULL, 0, 1),
(689, '17EC031', 'RIYA  AGARWAL', '', 1, 1, NULL, 0, 1),
(690, '17EC032', 'ANIRUDH  BHATI', '', 1, 1, NULL, 0, 1),
(691, '17EC034', 'SHUBHAM  NANDI', '', 1, 1, NULL, 0, 1),
(692, '17EC035', 'ANUSHKA  SINGH', '', 1, 1, NULL, 0, 1),
(693, '17EC036', 'SHIVENDRA  SINGH', '', 1, 1, NULL, 0, 1),
(694, '17EC037', 'HIMANSHU  GUPTA', '', 1, 1, NULL, 0, 1),
(695, '17EC038', 'TAUSEEF  AHMAD', '', 1, 1, NULL, 0, 1),
(696, '17EC039', 'VIKAS  KUMAR', '', 1, 1, NULL, 0, 1),
(697, '17EC040', 'AAYUSH PRATAP SINGH', '', 1, 1, NULL, 0, 1),
(698, '17EC041', 'SUYASH  GUPTA', '', 1, 1, NULL, 0, 1),
(699, '17EC042', 'PIYUSH SINGH RANA', '', 1, 1, NULL, 0, 1),
(700, '17EC043', 'PRAKAMYA  SINGH', '', 1, 1, NULL, 0, 1),
(701, '17EC044', 'PRATYUSH  PATEL', '', 1, 1, NULL, 0, 1),
(702, '17EC045', 'ASTITVA  KANCHAN', '', 1, 1, NULL, 0, 1),
(703, '17EC046', 'SHARIYA  ALAM', '', 1, 1, NULL, 0, 1),
(704, '17EC047', 'YASH  JULKA', '', 1, 1, NULL, 0, 1),
(705, '17EC048', 'UTKARSH  SINGH', '', 1, 1, NULL, 0, 1),
(706, '17EC050', 'MEHUL  SINGH', '', 1, 1, NULL, 0, 1),
(707, '17EC051', 'ABHISHEK  SINGH', '', 1, 1, NULL, 0, 1),
(708, '17EC052', 'AMAN  SINGH', '', 1, 1, NULL, 0, 1),
(709, '17EC053', 'HARSHIT  JAISWAL', '', 1, 1, NULL, 0, 1),
(710, '17EC054', 'ALOK KUMAR', '', 1, 1, NULL, 0, 1),
(711, '17EC055', 'KRITIKA  SAINI', '', 1, 1, NULL, 0, 1),
(712, '17EC056', 'HIMANSHU SINGH', '', 1, 1, NULL, 0, 1),
(713, '17EC057', 'SAHIL', '', 1, 1, NULL, 0, 1),
(714, '17EC058', 'OM  RASTOGI', '', 1, 1, NULL, 0, 1),
(715, '17EC059', 'ORVILLE  LAZARUS', '', 1, 1, NULL, 0, 1),
(716, '17EC060', 'SHUBHAM  TIWARI', '', 1, 1, NULL, 0, 1),
(717, '17EC061', 'SHUBHAM  SHARMA', '', 1, 1, NULL, 0, 1),
(718, '17EC062', 'ABHISHEK  SAINI', '', 1, 1, NULL, 0, 1),
(719, '17EC064', 'NAMAN  AHUJA', '', 1, 1, NULL, 0, 1),
(720, '17EC065', 'ABHISHEK KUMAR VERMA', '', 1, 1, NULL, 0, 1),
(721, '17EC066', 'PARMEET  SINGH', '', 1, 1, NULL, 0, 1),
(722, '17EC067', 'RIYA  BHASKAR', '', 1, 1, NULL, 0, 1),
(723, '17EC068', 'SHIVANGI  DEVAL', '', 1, 1, NULL, 0, 1),
(724, '17EC070', 'ASHISH  RANJAN', '', 1, 1, NULL, 0, 1),
(725, '17EC071', 'DEVANSHU  SRIVASTAVA', '', 1, 1, NULL, 0, 1),
(726, '17EC073', 'SHUBHI  AWASTHI', '', 1, 1, NULL, 0, 1),
(727, '17EC074', 'TUSHAR  GUPTA', '', 1, 1, NULL, 0, 1),
(728, '17EC075', 'SUDHANSHU RAI', '', 1, 1, NULL, 0, 1),
(729, '17EC076', 'MAYANK  CHANDRA', '', 1, 1, NULL, 0, 1),
(730, '17EC077', 'JAYESH SINGH CHAHAR', '', 1, 1, NULL, 0, 1),
(731, '17EC079', 'PRATEEK  AGRAWAL', '', 1, 1, NULL, 0, 1),
(732, '17EC080', 'AANYA  SINGH', '', 1, 1, NULL, 0, 1),
(733, '17EC081', 'SANJAY  KUMAR', '', 1, 1, NULL, 0, 1),
(734, '17EC082', 'SONU  YADAV', '', 1, 1, NULL, 0, 1),
(735, '17EC083', 'SUDHANSHU  SHARMA', '', 1, 1, NULL, 0, 1),
(736, '17EC084', 'VAIBHAV  SINGH', '', 1, 1, NULL, 0, 1),
(737, '17EC085', 'SHIVAM KUMAR JHA', '', 1, 1, NULL, 0, 1),
(738, '17EC086', 'VAIBHAV  GUPTA', '', 1, 1, NULL, 0, 1),
(739, '17EC087', 'ANURANSHA SONKAR', '', 1, 1, NULL, 0, 1),
(740, '17EC088', 'SAGUN  RAJPUT', '', 1, 1, NULL, 0, 1),
(741, '17EC089', 'DIVYANSHU', '', 1, 1, NULL, 0, 1),
(742, '17EC090', 'PRAKHAR  MITTAL', '', 1, 1, NULL, 0, 1),
(743, '17EC091', 'HARSH  YADAV', '', 1, 1, NULL, 0, 1),
(744, '17EC093', 'MIHIER  SHASTRI', '', 1, 1, NULL, 0, 1),
(745, '17EC094', 'ABHISHEK  SAHU', '', 1, 1, NULL, 0, 1),
(746, '17EC098', 'PRATEEK  JAISWAL', '', 1, 1, NULL, 0, 1),
(747, '17EC099', 'TANISHQ  THAKRAL', '', 1, 1, NULL, 0, 1),
(748, '17EC100', 'PRADHUMAN  KUMAR', '', 1, 1, NULL, 0, 1),
(749, '17EC101', 'SIDDHARTHA  YADAV', '', 1, 1, NULL, 0, 1),
(750, '17EC102', 'AZADAR HUSSAIN ZAIDI', '', 1, 1, NULL, 0, 1),
(751, '17EC103', 'MANAN  MISHRA', '', 1, 1, NULL, 0, 1),
(752, '17EC104', 'DAKSH TYAGI', '', 1, 1, NULL, 0, 1),
(753, '17EC106', 'DIVYANSHU  SHAHI', '', 1, 1, NULL, 0, 1),
(754, '17EC107', 'PALAK  NAZA', '', 1, 1, NULL, 0, 1),
(755, '17EC108', 'SAMARTH DHEERAJ CHAUDHARY', '', 1, 1, NULL, 0, 1),
(756, '17EC109', 'ANSHIKA KUMARI', '', 1, 1, NULL, 0, 1),
(757, '17EC110', 'RAVI  SINGH', '', 1, 1, NULL, 0, 1),
(758, '17EC111', 'VIPIN BIHARI YADAV', '', 1, 1, NULL, 0, 1),
(759, '17EC112', 'AMAN', '', 1, 1, NULL, 0, 1),
(760, '17EC113', 'DEEPAK KUMAR PATEL', '', 1, 1, NULL, 0, 1),
(761, '17EC114', 'DRISHTI SHARMA', '', 1, 1, NULL, 0, 1),
(762, '17EC116', 'SAURABH', '', 1, 1, NULL, 0, 1),
(763, '17EC117', 'AKSHAY  JAIN', '', 1, 1, NULL, 0, 1),
(764, '17EC118', 'SUYASH  SHUKLA', '', 1, 1, NULL, 0, 1),
(765, '17EC119', 'SARAS  SINGH', '', 1, 1, NULL, 0, 1),
(766, '17EC120', 'KAMAL  KISHOR', '', 1, 1, NULL, 0, 1),
(767, '17EC122', 'ANUJ  KUMAR', '', 1, 1, NULL, 0, 1),
(768, '17EC123', 'NIRAJ KUMAR CHAURASIA', '', 1, 1, NULL, 0, 1),
(769, '17EC124', 'SOUMAY  SINGH', '', 1, 1, NULL, 0, 1),
(770, '17EC125', 'SHUBHAM  SOLANKI', '', 1, 1, NULL, 0, 1),
(771, '17EC126', 'ASHUTOSH', '', 1, 1, NULL, 0, 1),
(772, '17EC127', 'SHUBHANKAR  SAINI', '', 1, 1, NULL, 0, 1),
(773, '17EC128', 'MOIN  KHAN', '', 1, 1, NULL, 0, 1),
(774, '17EC129', 'ANKIT KUMAR SINGH', '', 1, 1, NULL, 0, 1),
(775, '17EC130', 'SHUBHAM  GUPTA', '', 1, 1, NULL, 0, 1),
(776, '17EC131', 'ABHAY SINGH SAINI', '', 1, 1, NULL, 0, 1),
(777, '17EC132', 'ANUBHA  RANI', '', 1, 1, NULL, 0, 1),
(778, '17EC133', 'ANIKET  YADAV', '', 1, 1, NULL, 0, 1),
(779, '17EC134', 'ARUN KUMAR NIRMAL', '', 1, 1, NULL, 0, 1),
(780, '17EC135', 'HARSHIT  VERMA', '', 1, 1, NULL, 0, 1),
(781, '17EC136', 'ANVESHA  SHANDILYA', '', 1, 1, NULL, 0, 1),
(782, '17EC137', 'AKANSHA  CHAUDHARY', '', 1, 1, NULL, 0, 1),
(783, '17EC138', 'VAIBHAV  SINGH', '', 1, 1, NULL, 0, 1),
(784, '17EC139', 'DEVESH PRATAP SINGH', '', 1, 1, NULL, 0, 1),
(785, '17EC140', 'VAISHNAVI  TRIPATHI', '', 1, 1, NULL, 0, 1),
(786, '17EC141', 'RAJ  VERMA', '', 1, 1, NULL, 0, 1),
(787, '17EC142', 'MIMANSA  YADAV', '', 1, 1, NULL, 0, 1),
(788, '17EC143', 'SHUBHAM  SINGH', '', 1, 1, NULL, 0, 1),
(789, '17EC144', 'SANSKAR KUMAR', '', 1, 1, NULL, 0, 1),
(790, '17EC145', 'TANUJ KUMAR', '', 1, 1, NULL, 0, 1),
(791, '17EC147', 'RISHI  SHARMA', '', 1, 1, NULL, 0, 1),
(792, '17EC148', 'DEEPANSHU VERMA', '', 1, 1, NULL, 0, 1),
(793, '17EC149', 'GAURAV  KUMAR', '', 1, 1, NULL, 0, 1),
(794, '17EC150', 'SURYANSH  CHOUDHARY', '', 1, 1, NULL, 0, 1),
(795, '17EC151', 'SHUBHAM  SINGH', '', 1, 1, NULL, 0, 1),
(796, '17EC152', 'NAVEEN KUMAR SINGH', '', 1, 1, NULL, 0, 1),
(797, '17EC153', 'ARPIT KUMAR SINGH', '', 1, 1, NULL, 0, 1),
(798, '17EC154', 'MADHAVENDRA PRATAP SINGH', '', 1, 1, NULL, 0, 1),
(799, '17EC155', 'SAHIL KUMAR RANJAN', '', 1, 1, NULL, 0, 1),
(800, '17EC156', 'PALAK  SINGH', '', 1, 1, NULL, 0, 1),
(801, '17EC157', 'SHREYAS  JAISWAL', '', 1, 1, NULL, 0, 1),
(802, '17EC158', 'SUGANDHA  ARYA', '', 1, 1, NULL, 0, 1),
(803, '17EC159', 'TANMAY  SAXENA', '', 1, 1, NULL, 0, 1),
(804, '17EC160', 'AKASH  SHARMA', '', 1, 1, NULL, 0, 1),
(805, '17EC161', 'TANYA  YADAV', '', 1, 1, NULL, 0, 1),
(806, '17EC162', 'SHIVANGI  SINGH', '', 1, 1, NULL, 0, 1),
(807, '17EC163', 'ALOK  KUMAR', '', 1, 1, NULL, 0, 1),
(808, '17EC164', 'ABHISHEK  KUMAR', '', 1, 1, NULL, 0, 1),
(809, '17EC165', 'NISHANT  YADAV', '', 1, 1, NULL, 0, 1),
(810, '17EC166', 'SAKSHAM  GARG', '', 1, 1, NULL, 0, 1),
(811, '17EC167', 'SHIVI  BISHT', '', 1, 1, NULL, 0, 1),
(812, '17EC168', 'SHREYAS  MISHRA', '', 1, 1, NULL, 0, 1),
(813, '17EC169', 'RISHABH  AWASTHY', '', 1, 1, NULL, 0, 1),
(814, '17EC170', 'SANJIVANI  SAXAENAA', '', 1, 1, NULL, 0, 1),
(815, '17EC171', 'YASHI  SINGH', '', 1, 1, NULL, 0, 1),
(816, '17EC172', 'ADITI  CHAUHAN', '', 1, 1, NULL, 0, 1),
(817, '17EC173', 'HARSH VARDHAN SINGH BHADOURIA', '', 1, 1, NULL, 0, 1),
(818, '17EC174', 'NILESH  MOHILAY', '', 1, 1, NULL, 0, 1),
(819, '17EC175', 'YASHAV  DIXIT', '', 1, 1, NULL, 0, 1),
(820, '17EC176', 'ANUJ  JAIN', '', 1, 1, NULL, 0, 1),
(821, '17EC177', 'SHIVANSH  JAISWAL', '', 1, 1, NULL, 0, 1),
(822, '17EC178', 'ADITYA KUMAR RAI', '', 1, 1, NULL, 0, 1),
(823, '17EC179', 'SHANYA  SINGH', '', 1, 1, NULL, 0, 1),
(824, '17EC180', 'SHANTNU', '', 1, 1, NULL, 0, 1),
(825, '17EC181', 'ANUJ  MISHRA', '', 1, 1, NULL, 0, 1),
(826, '17EC182', 'DEVANSH DHAR DWIVEDI', '', 1, 1, NULL, 0, 1),
(827, '17EC184', 'SAURABH KUMAR GUPTA', '', 1, 1, NULL, 0, 1),
(828, '17EC185', 'PRATEEK  SRIVASTAVA', '', 1, 1, NULL, 0, 1),
(829, '17EC186', 'RAGHAV  SHARMA', '', 1, 1, NULL, 0, 1),
(830, '17EC187', 'VASISHT  B', '', 1, 1, NULL, 0, 1),
(831, '17EC188', 'SHAURYAA  TRIPATHI', '', 1, 1, NULL, 0, 1),
(832, '17EC189', 'SARTHAK  CHAUHAN', '', 1, 1, NULL, 0, 1),
(833, '17EC190', 'ROHIT KUMAR', '', 1, 1, NULL, 0, 1),
(834, '17EC191', 'PUNDREEK  TRIPATHI', '', 1, 1, NULL, 0, 1),
(835, '17EC192', 'RIYA  RAI', '', 1, 1, NULL, 0, 1),
(836, '17EC193', 'AKASH  SHARMA', '', 1, 1, NULL, 0, 1),
(837, '17EC194', 'SATYAM  GUPTA', '', 1, 1, NULL, 0, 1),
(838, '17EC195', 'ABHISHEK  YADAV', '', 1, 1, NULL, 0, 1),
(839, '17EC196', 'KAPIL  GERA', '', 1, 1, NULL, 0, 1),
(840, '17EC197', 'AKSHITA  SINGH', '', 1, 1, NULL, 0, 1),
(841, '17EC198', 'ANSHUMAN  SINGH', '', 1, 1, NULL, 0, 1),
(842, '17EC199', 'ANUBHAV KUMAR SINGH', '', 1, 1, NULL, 0, 1),
(843, '17EC200', 'DIVYANSHU MOHAN MANI TRIPATHI', '', 1, 1, NULL, 0, 1),
(844, '17EC201', 'SAMARTH  KHANNA', '', 1, 1, NULL, 0, 1),
(845, '17EC202', 'YOGENDRA PRATAP SINGH', '', 1, 1, NULL, 0, 1),
(846, '17EC203', 'AARSH  SACHDEVA', '', 1, 1, NULL, 0, 1),
(847, '17EC204', 'GAURAV  YADAV', '', 1, 1, NULL, 0, 1),
(848, '17EC205', 'SHRUTI  GARG', '', 1, 1, NULL, 0, 1),
(849, '17EC206', 'SARTHAK  SHARMA', '', 1, 1, NULL, 0, 1),
(850, '17EC207', 'PRASHAST MOHAN SAXENA', '', 1, 1, NULL, 0, 1),
(851, '17EC208', 'ANTAS  GUPTA', '', 1, 1, NULL, 0, 1),
(852, '16ME165', 'NILESH KUMAR UPADHYAY', '', 1, 1, NULL, 0, 1),
(853, '17ME001', 'SOURABH  SINGH', '', 1, 1, NULL, 0, 1),
(854, '17ME002', 'OM  KAPOOR', '', 1, 1, NULL, 0, 1),
(855, '17ME003', 'SHUSHANT  SINGH', '', 1, 1, NULL, 0, 1),
(856, '17ME005', 'VANSH', '', 1, 1, NULL, 0, 1),
(857, '17ME006', 'HIMANSHU  GUPTA', '', 1, 1, NULL, 0, 1),
(858, '17ME007', 'UMANG  GUPTA', '', 1, 1, NULL, 0, 1),
(859, '17ME008', 'KIRTI  DHIMAN', '', 1, 1, NULL, 0, 1),
(860, '17ME009', 'MAYANK  RAI', '', 1, 1, NULL, 0, 1),
(861, '17ME010', 'GOURISH  SINGH', '', 1, 1, NULL, 0, 1),
(862, '17ME011', 'DEEPAK KUMAR MADDESHIYA', '', 1, 1, NULL, 0, 1),
(863, '17ME012', 'RAHUL  YADAV', '', 1, 1, NULL, 0, 1),
(864, '17ME013', 'TRIPURESH  TRIPATHI', '', 1, 1, NULL, 0, 1),
(865, '17ME014', 'KARTIKEY  SINGH', '', 1, 1, NULL, 0, 1),
(866, '17ME016', 'ASHISH SHANKAR RAI', '', 1, 1, NULL, 0, 1),
(867, '17ME017', 'ANILESH  MATHUR', '', 1, 1, NULL, 0, 1),
(868, '17ME018', 'DIVYANSHU  SHUKLA', '', 1, 1, NULL, 0, 1),
(869, '17ME019', 'AASIF  ALI', '', 1, 1, NULL, 0, 1),
(870, '17ME020', 'RISHABH  GANGWAR', '', 1, 1, NULL, 0, 1),
(871, '17ME021', 'SHIVANGI  KUMARI', '', 1, 1, NULL, 0, 1),
(872, '17ME022', 'TANYA  JAIN', '', 1, 1, NULL, 0, 1),
(873, '17ME023', 'MUDIT KUMAR BHATNAGAR', '', 1, 1, NULL, 0, 1),
(874, '17ME025', 'SANDEEP  SRIVASTAVA', '', 1, 1, NULL, 0, 1),
(875, '17ME026', 'MUNEEB  ASHRAF', '', 1, 1, NULL, 0, 1),
(876, '17ME027', 'PRATIBHA  PANDEY', '', 1, 1, NULL, 0, 1),
(877, '17ME028', 'VINEET  GUPTA', '', 1, 1, NULL, 0, 1),
(878, '17ME029', 'PAARTH  JANGRA', '', 1, 1, NULL, 0, 1),
(879, '17ME030', 'URVASHI  KARUSH', '', 1, 1, NULL, 0, 1),
(880, '17ME031', 'ANUJ KUMAR KUSHWAHA', '', 1, 1, NULL, 0, 1),
(881, '17ME032', 'NAKUL ANAND', '', 1, 1, NULL, 0, 1),
(882, '17ME033', 'HEM MISHRA', '', 1, 1, NULL, 0, 1);
INSERT INTO `jss_stud_list_17_18` (`jss_stud_id`, `adm_no`, `stud_name`, `roll_no`, `year`, `course_id`, `branch_id`, `form_fill`, `valid`) VALUES
(883, '17ME034', 'AKSHAY  KUMAR', '', 1, 1, NULL, 0, 1),
(884, '17ME036', 'DIVYANSH  CHAUDHARY', '', 1, 1, NULL, 0, 1),
(885, '17ME037', 'LALIT ADITYA BHAT', '', 1, 1, NULL, 0, 1),
(886, '17ME038', 'SURAJ KUMAR YADAV', '', 1, 1, NULL, 0, 1),
(887, '17ME039', 'ROSHAN  SINGH', '', 1, 1, NULL, 0, 1),
(888, '17ME040', 'JATIN  SINGH', '', 1, 1, NULL, 0, 1),
(889, '17ME041', 'ADITYA  YADAV', '', 1, 1, NULL, 0, 1),
(890, '17ME042', 'SANDEEP KUMAR SINGH', '', 1, 1, NULL, 0, 1),
(891, '17ME043', 'SHESH MANI TRIPATHI', '', 1, 1, NULL, 0, 1),
(892, '17ME044', 'AYUSH KUMAR SINGH', '', 1, 1, NULL, 0, 1),
(893, '17ME045', 'PRIYANKA  VERMA', '', 1, 1, NULL, 0, 1),
(894, '17ME047', 'PRASHANT  KUMAR', '', 1, 1, NULL, 0, 1),
(895, '17ME048', 'GAURANG  MISHRA', '', 1, 1, NULL, 0, 1),
(896, '17ME049', 'RITESH  KUMAR', '', 1, 1, NULL, 0, 1),
(897, '17ME050', 'RAJ KUMAR KESHARWANI', '', 1, 1, NULL, 0, 1),
(898, '17ME051', 'NIKHIL  RANJAN', '', 1, 1, NULL, 0, 1),
(899, '17ME052', 'MAYUR  KHATRI', '', 1, 1, NULL, 0, 1),
(900, '17ME053', 'AVADHESH  PATEL', '', 1, 1, NULL, 0, 1),
(901, '17ME054', 'ALOK  PANDEY', '', 1, 1, NULL, 0, 1),
(902, '17ME056', 'AMIT  KUMAR', '', 1, 1, NULL, 0, 1),
(903, '17ME057', 'NITIN KUMAR', '', 1, 1, NULL, 0, 1),
(904, '17ME058', 'AKASH  RANA', '', 1, 1, NULL, 0, 1),
(905, '17ME059', 'KAMALA PATI SHARMA', '', 1, 1, NULL, 0, 1),
(906, '17ME060', 'SANTOSH KUMAR VERMA', '', 1, 1, NULL, 0, 1),
(907, '17ME061', 'SANGRAM  SINGH', '', 1, 1, NULL, 0, 1),
(908, '17ME064', 'YAJURVED  GUPTA', '', 1, 1, NULL, 0, 1),
(909, '17ME065', 'VIKALP  SHARMA', '', 1, 1, NULL, 0, 1),
(910, '17ME066', 'VINAMRA  PURWAR', '', 1, 1, NULL, 0, 1),
(911, '17ME067', 'SWATI KUMARI', '', 1, 1, NULL, 0, 1),
(912, '17ME068', 'APARNA  SINGH', '', 1, 1, NULL, 0, 1),
(913, '17ME069', 'MANTHAN  SHARMA', '', 1, 1, NULL, 0, 1),
(914, '17ME070', 'SHRUTI  SHARMA', '', 1, 1, NULL, 0, 1),
(915, '17ME071', 'AMIT  PRASAD', '', 1, 1, NULL, 0, 1),
(916, '17ME072', 'ANUJ SINGH', '', 1, 1, NULL, 0, 1),
(917, '17ME073', 'ISHITA  SINGH', '', 1, 1, NULL, 0, 1),
(918, '17ME077', 'YASHWANT KUMAR MAURYA', '', 1, 1, NULL, 0, 1),
(919, '17ME078', 'SUMIT  KUSHWAHA', '', 1, 1, NULL, 0, 1),
(920, '17ME079', 'DIKSHA  MITTAL', '', 1, 1, NULL, 0, 1),
(921, '17ME082', 'MUNENDRA', '', 1, 1, NULL, 0, 1),
(922, '17ME083', 'ANMOL  BABU', '', 1, 1, NULL, 0, 1),
(923, '17ME084', 'PRANJAL  PALIWAL', '', 1, 1, NULL, 0, 1),
(924, '17ME085', 'SATWIK MANI TRIPATHI', '', 1, 1, NULL, 0, 1),
(925, '17ME086', 'DEEPANJALI VIKRAM SINGH', '', 1, 1, NULL, 0, 1),
(926, '17ME087', 'ARYAMAN  CHAUDHARY', '', 1, 1, NULL, 0, 1),
(927, '17ME089', 'SANSKAR KUMAR', '', 1, 1, NULL, 0, 1),
(928, '17ME090', 'KESHAV  AGARWAL', '', 1, 1, NULL, 0, 1),
(929, '17ME092', 'ANAND  MANI', '', 1, 1, NULL, 0, 1),
(930, '17ME093', 'SAJAL  JAIN', '', 1, 1, NULL, 0, 1),
(931, '17ME094', 'ANKIT  PRAKASH', '', 1, 1, NULL, 0, 1),
(932, '17ME095', 'ABHISHEK  CHAUHAN', '', 1, 1, NULL, 0, 1),
(933, '17ME096', 'PRADEEP KUMAR GAUTAM', '', 1, 1, NULL, 0, 1),
(934, '17ME097', 'RANJIT  SINGH', '', 1, 1, NULL, 0, 1),
(935, '17ME099', 'ATUL  KUMAR', '', 1, 1, NULL, 0, 1),
(936, '17ME102', 'SHUBHAM  RAO', '', 1, 1, NULL, 0, 1),
(937, '17ME103', 'ANKIT  KUMAR', '', 1, 1, NULL, 0, 1),
(938, '17ME104', 'UTKARSH  PANWAR', '', 1, 1, NULL, 0, 1),
(939, '17ME106', 'PRINCE  CHAUDHARY', '', 1, 1, NULL, 0, 1),
(940, '17ME107', 'RACHIT  DWIVEDI', '', 1, 1, NULL, 0, 1),
(941, '17ME108', 'AJEET  CHAUHAN', '', 1, 1, NULL, 0, 1),
(942, '17ME109', 'SAPNA', '', 1, 1, NULL, 0, 1),
(943, '17ME110', 'KSHITIZ KUMAR SRIVASTAVA', '', 1, 1, NULL, 0, 1),
(944, '17ME111', 'ANIKET SEN RANA', '', 1, 1, NULL, 0, 1),
(945, '17ME112', 'ANIRUDH  SINGH', '', 1, 1, NULL, 0, 1),
(946, '17ME113', 'RIDAM  BANSAL', '', 1, 1, NULL, 0, 1),
(947, '17ME115', 'AKARSH  YADAV', '', 1, 1, NULL, 0, 1),
(948, '17ME117', 'ABHINAV  YADAV', '', 1, 1, NULL, 0, 1),
(949, '17ME118', 'VISHAL  SHARMA', '', 1, 1, NULL, 0, 1),
(950, '17ME119', 'SURAJ PAL', '', 1, 1, NULL, 0, 1),
(951, '17ME121', 'GAURAV KUMAR CHAUHAN', '', 1, 1, NULL, 0, 1),
(952, '17ME122', 'FAHIM  AHMAD', '', 1, 1, NULL, 0, 1),
(953, '17ME123', 'YUGANSH  AGRAWAL', '', 1, 1, NULL, 0, 1),
(954, '17ME124', 'UTKARSH  YADAV', '', 1, 1, NULL, 0, 1),
(955, '17ME125', 'SHIVAM  GOEL', '', 1, 1, NULL, 0, 1),
(956, '17ME126', 'RISHIT  JAIN', '', 1, 1, NULL, 0, 1),
(957, '17ME127', 'SIDDHARTH  SRIVASTAVA', '', 1, 1, NULL, 0, 1),
(958, '17ME128', 'UTKARSH  TRIVEDI', '', 1, 1, NULL, 0, 1),
(959, '17ME129', 'AKASH  KUMAR', '', 1, 1, NULL, 0, 1),
(960, '17ME130', 'VIDIT  SHARMA', '', 1, 1, NULL, 0, 1),
(961, '17ME131', 'SHRAY  TEBERIWAL', '', 1, 1, NULL, 0, 1),
(962, '17ME132', 'JAI  SHIV', '', 1, 1, NULL, 0, 1),
(963, '17ME133', 'SUMIT MISHRA', '', 1, 1, NULL, 0, 1),
(964, '17ME134', 'HARSH RAJPUT', '', 1, 1, NULL, 0, 1),
(965, '17ME135', 'SARVESH  SHUKLA', '', 1, 1, NULL, 0, 1),
(966, '17ME136', 'SHASHWAT  GUPTA', '', 1, 1, NULL, 0, 1),
(967, '17ME137', 'ANKIT  PARIHAR', '', 1, 1, NULL, 0, 1),
(968, '17ME138', 'SHOBHIT  CHANDRA', '', 1, 1, NULL, 0, 1),
(969, '17ME139', 'VIKAS  SHARMA', '', 1, 1, NULL, 0, 1),
(970, '17ME140', 'HRISHIKESH  GUPTA', '', 1, 1, NULL, 0, 1),
(971, '17ME141', 'ADARSH  CHANDRA', '', 1, 1, NULL, 0, 1),
(972, '17ME142', 'ADITYA  KASAUDHAN', '', 1, 1, NULL, 0, 1),
(973, '17ME143', 'RISHABH RAJ', '', 1, 1, NULL, 0, 1),
(974, '17ME144', 'RAJAT  AGRAWAL', '', 1, 1, NULL, 0, 1),
(975, '17ME145', 'PULKIT  GOYAL', '', 1, 1, NULL, 0, 1),
(976, '17ME146', 'ROHIT  GUPTA', '', 1, 1, NULL, 0, 1),
(977, '17ME147', 'SACHIN  PANDEY', '', 1, 1, NULL, 0, 1),
(978, '17ME148', 'PRAKHAR  SINGH', '', 1, 1, NULL, 0, 1),
(979, '17ME149', 'ADITYA KUMAR SINGH', '', 1, 1, NULL, 0, 1),
(980, '17ME150', 'KAUSHALENDRA PRATAP SINGH', '', 1, 1, NULL, 0, 1),
(981, '17ME151', 'FAIZ  AHMAD', '', 1, 1, NULL, 0, 1),
(982, '17ME152', 'VIVEK  GUPTA', '', 1, 1, NULL, 0, 1),
(983, '17ME153', 'GAURAV  YADAV', '', 1, 1, NULL, 0, 1),
(984, '17ME154', 'NAMAN  JAIN', '', 1, 1, NULL, 0, 1),
(985, '17ME155', 'DARPAN  KUMARI', '', 1, 1, NULL, 0, 1),
(986, '17ME156', 'VIVEK  KUMAR', '', 1, 1, NULL, 0, 1),
(987, '17ME157', 'MANDEEP  SINGH', '', 1, 1, NULL, 0, 1),
(988, '17ME158', 'NITIN  BHATT', '', 1, 1, NULL, 0, 1),
(989, '17ME159', 'NITIN  CHAUDHARY', '', 1, 1, NULL, 0, 1),
(990, '17ME160', 'ROHIT  SHARMA', '', 1, 1, NULL, 0, 1),
(991, '17ME161', 'RIYA  TRIPATHI', '', 1, 1, NULL, 0, 1),
(992, '17ME162', 'SHUBHAM KUMAR SINGH', '', 1, 1, NULL, 0, 1),
(993, '17ME163', 'MANIKANT  SINGH', '', 1, 1, NULL, 0, 1),
(994, '17ME164', 'SYED SAMEEN RAZA RIZVI', '', 1, 1, NULL, 0, 1),
(995, '17ME165', 'MANISH  LALCHANDANI', '', 1, 1, NULL, 0, 1),
(996, '17ME166', 'ARCHIT  ROHATGI', '', 1, 1, NULL, 0, 1),
(997, '17ME167', 'SARANSH  SHRIVASTAVA', '', 1, 1, NULL, 0, 1),
(998, '17ME168', 'HARSHIT  CHAUDHARY', '', 1, 1, NULL, 0, 1),
(999, '17ME169', 'LAKSHIT  CHAUDHARY', '', 1, 1, NULL, 0, 1),
(1000, '17ME170', 'YASH  GUPTA', '', 1, 1, NULL, 0, 1),
(1001, '17ME171', 'MRINAL  GUPTA', '', 1, 1, NULL, 0, 1),
(1002, '17ME173', 'TARUN  CHOUDHARY', '', 1, 1, NULL, 0, 1),
(1003, '17ME174', 'NISHANT  SENGAR', '', 1, 1, NULL, 0, 1),
(1004, '17ME175', 'KUSHAL  CHAKRABARTY', '', 1, 1, NULL, 0, 1),
(1005, '17ME176', 'ANIMESH  MISHRA', '', 1, 1, NULL, 0, 1),
(1006, '17ME177', 'KARTIKEYA  TRIPATHI', '', 1, 1, NULL, 0, 1),
(1007, '17ME178', 'RAJAT  BHARDWAJ', '', 1, 1, NULL, 0, 1),
(1008, '17ME179', 'UDIT  TOMAR', '', 1, 1, NULL, 0, 1),
(1009, '17ME180', 'SHIVAM KUMAR DUBEY', '', 1, 1, NULL, 0, 1),
(1010, '17ME181', 'SHUBHAM  TEOTIA', '', 1, 1, NULL, 0, 1),
(1011, '17ME182', 'BIMLESH KUMAR DUBEY', '', 1, 1, NULL, 0, 1),
(1012, '17ME183', 'AMAN  GUPTA', '', 1, 1, NULL, 0, 1),
(1013, '17ME184', 'ARSH  BAISLA', '', 1, 1, NULL, 0, 1),
(1014, '17ME185', 'LAKSH  KUMAR', '', 1, 1, NULL, 0, 1),
(1015, '17ME186', 'AISHWARY  MISHRA', '', 1, 1, NULL, 0, 1),
(1016, '17ME187', 'NITISH  RAI', '', 1, 1, NULL, 0, 1),
(1017, '17ME188', 'GAURAV PAL', '', 1, 1, NULL, 0, 1),
(1018, '17ME189', 'ARPIT  RAWAT', '', 1, 1, NULL, 0, 1),
(1019, '17ME191', 'ANMOL  GUPTA', '', 1, 1, NULL, 0, 1),
(1020, '17ME192', 'CHAYAN  KATIYAR', '', 1, 1, NULL, 0, 1),
(1021, '17ME193', 'SHAURYA SINGH SOLANKY', '', 1, 1, NULL, 0, 1),
(1022, '17ME194', 'UMESH  KUMAR', '', 1, 1, NULL, 0, 1),
(1023, '17ME195', 'SHASHWAT  MATHAN', '', 1, 1, NULL, 0, 1),
(1024, '17ME196', 'HARSH VARDHAN SINGH', '', 1, 1, NULL, 0, 1),
(1025, '17ME197', 'VISHAL  SINGH', '', 1, 1, NULL, 0, 1),
(1026, '17ME198', 'PUSHPINDER', '', 1, 1, NULL, 0, 1),
(1027, '17ME199', 'DEVENDER  GAUTAM', '', 1, 1, NULL, 0, 1),
(1028, '', 'SATYANSH CHATURVEDI', '1409121033', 2, 1, 9, 0, 1),
(1029, '', 'AMIT VIKRAM SINGH \n YADAV', '1509121013', 2, 1, 9, 0, 1),
(1030, '', 'AABDA  KHATOON', '1609121001', 2, 1, 9, 0, 1),
(1031, '', 'AADITYA  SANGAL', '1609121002', 2, 1, 9, 0, 1),
(1032, '', 'AANCHAL', '1609121003', 2, 1, 9, 0, 1),
(1033, '', 'ABHAY KUMAR SINGH', '1609121004', 2, 1, 9, 0, 1),
(1034, '', 'ABHISHEK SINGH PANWAR', '1609121005', 2, 1, 9, 0, 1),
(1035, '', 'ABHISHEK  VERMA', '1609121006', 2, 1, 9, 0, 1),
(1036, '', 'AJEET KUMAR', '1609121007', 2, 1, 9, 0, 1),
(1037, '', 'AKHIL  JOHN', '1609121008', 2, 1, 9, 0, 1),
(1038, '', 'ALANKRIT  SRIVASTAVA', '1609121009', 2, 1, 9, 0, 1),
(1039, '', 'AMAN  SHUKLA', '1609121010', 2, 1, 9, 0, 1),
(1040, '', 'AMAN  VARDIA', '1609121011', 2, 1, 9, 0, 1),
(1041, '', 'ANKESH  KUMAR', '1609121012', 2, 1, 9, 0, 1),
(1042, '', 'ANUSHKA  OMAR', '1609121013', 2, 1, 9, 0, 1),
(1043, '', 'ASHISH  KUMAR', '1609121014', 2, 1, 9, 0, 1),
(1044, '', 'AYUSH  YADAV', '1609121015', 2, 1, 9, 0, 1),
(1045, '', 'AYUSHI  VISHWAKARMA', '1609121016', 2, 1, 9, 0, 1),
(1046, '', 'BHAVANA  SINGH', '1609121017', 2, 1, 9, 0, 1),
(1047, '', 'DEEPAK  SRIBATHAM', '1609121018', 2, 1, 9, 0, 1),
(1048, '', 'DEEPANSHU  JAYANT', '1609121019', 2, 1, 9, 0, 1),
(1049, '', 'DEVANSHU  SAXENA', '1609121020', 2, 1, 9, 0, 1),
(1050, '', 'GARIMA  JAIN', '1609121021', 2, 1, 9, 0, 1),
(1051, '', 'HRISHABH  SINGH', '1609121023', 2, 1, 9, 0, 1),
(1052, '', 'JAYANT  PATEL', '1609121024', 2, 1, 9, 0, 1),
(1053, '', 'KARTIK  KUMAR', '1609121025', 2, 1, 9, 0, 1),
(1054, '', 'KASHIKA  MALHOTRA', '1609121026', 2, 1, 9, 0, 1),
(1055, '', 'KOMAL  GUPTA', '1609121027', 2, 1, 9, 0, 1),
(1056, '', 'KUNWAR VISHAL SINGH', '1609121028', 2, 1, 9, 0, 1),
(1057, '', 'KUSHAGRA  DWIVEDI', '1609121029', 2, 1, 9, 0, 1),
(1058, '', 'LALIT  SHARMA', '1609121030', 2, 1, 9, 0, 1),
(1059, '', 'LAVANYA NIDHI MISHRA', '1609121031', 2, 1, 9, 0, 1),
(1060, '', 'MOHD  JAZIB', '1609121033', 2, 1, 9, 0, 1),
(1061, '', 'MONIKA  SHARMA', '1609121034', 2, 1, 9, 0, 1),
(1062, '', 'NANDINI  BANSAL', '1609121035', 2, 1, 9, 0, 1),
(1063, '', 'NISHANT KUMAR', '1609121036', 2, 1, 9, 0, 1),
(1064, '', 'NITIN PRAKASH', '1609121037', 2, 1, 9, 0, 1),
(1065, '', 'PADMAJA  PANDE', '1609121038', 2, 1, 9, 0, 1),
(1066, '', 'PARITOSH  KASANA', '1609121039', 2, 1, 9, 0, 1),
(1067, '', 'PRANAV  TRIPATHI', '1609121040', 2, 1, 9, 0, 1),
(1068, '', 'PRANJAL  SRIVASTAVA', '1609121041', 2, 1, 9, 0, 1),
(1069, '', 'PRATEEK  GARG', '1609121042', 2, 1, 9, 0, 1),
(1070, '', 'PRATEEK  PANDEY', '1609121043', 2, 1, 9, 0, 1),
(1071, '', 'PRATEEK  RANJAN', '1609121044', 2, 1, 9, 0, 1),
(1072, '', 'RAHUL KUMAR MISHRA', '1609121045', 2, 1, 9, 0, 1),
(1073, '', 'RAVI PRATAP SINGH', '1609121046', 2, 1, 9, 0, 1),
(1074, '', 'RICHA  SHARMA', '1609121047', 2, 1, 9, 0, 1),
(1075, '', 'SAKSHI  RASTOGI', '1609121049', 2, 1, 9, 0, 1),
(1076, '', 'SHISHIR KUMAR RAI', '1609121051', 2, 1, 9, 0, 1),
(1077, '', 'SHIVAM  JAISWAL', '1609121052', 2, 1, 9, 0, 1),
(1078, '', 'SHIVAM  MISHRA', '1609121053', 2, 1, 9, 0, 1),
(1079, '', 'SHIVANGI  SINGH', '1609121054', 2, 1, 9, 0, 1),
(1080, '', 'SHREYA  SRIVASTAVA', '1609121056', 2, 1, 9, 0, 1),
(1081, '', 'SHRISTY  SINGH', '1609121057', 2, 1, 9, 0, 1),
(1082, '', 'SHUBHAM  SAXENA', '1609121058', 2, 1, 9, 0, 1),
(1083, '', 'SURYANSH  UDIT', '1609121059', 2, 1, 9, 0, 1),
(1084, '', 'VAISHNAVI  RAJPUT', '1609121060', 2, 1, 9, 0, 1),
(1085, '', 'VISHAL  SAXENA', '1609121061', 2, 1, 9, 0, 1),
(1086, '17DLEEE001', 'MOHD FAISAL NAIM', '', 2, 1, 9, 0, 1),
(1087, '17DLEEE002', 'MUKESH  PANDEY', '', 2, 1, 9, 0, 1),
(1088, '17DLEEE003', 'RAJAT  AGARWAL', '', 2, 1, 9, 0, 1),
(1089, '17DLEEE004', 'PRAGATI  UPADHYAY', '', 2, 1, 9, 0, 1),
(1090, '17DLEEE005', 'AYUSHI  RAJ', '', 2, 1, 9, 0, 1),
(1091, '', 'NEELESH KUMAR PANDEY', '1609120911', 2, 1, 4, 0, 1),
(1092, '', 'YAGYANSHU NAGAR', '1509120112', 2, 1, 4, 0, 1),
(1093, '', 'UTKARSHA DWIVEDI', '1509120103', 2, 1, 4, 0, 1),
(1094, '', 'NIDHI PANDHEY', '1509120049', 2, 1, 4, 0, 1),
(1095, '', 'DIKSHA KAMAL', '1509120035', 2, 1, 4, 0, 1),
(1096, '', 'KAUSHAL KUMAR', '1509120044', 2, 1, 4, 0, 1),
(1097, '', 'AADARSH  SINGH', '1609120001', 2, 1, 4, 0, 1),
(1098, '', 'AAKASH  DAKSH', '1609120002', 2, 1, 4, 0, 1),
(1099, '', 'AAKRITI  SUNDERUM', '1609120003', 2, 1, 4, 0, 1),
(1100, '', 'ABHIMANYU', '1609120004', 2, 1, 4, 0, 1),
(1101, '', 'ABHINAV  SHARMA', '1609120005', 2, 1, 4, 0, 1),
(1102, '', 'ABHISHEK  CHAUHAN', '1609120007', 2, 1, 4, 0, 1),
(1103, '', 'ABHISHEK KUMAR SRIVASTAVA', '1609120008', 2, 1, 4, 0, 1),
(1104, '', 'ABHISHEK  RAI', '1609120009', 2, 1, 4, 0, 1),
(1105, '', 'ABHISHEK SINGH', '1609120010', 2, 1, 4, 0, 1),
(1106, '', 'ABHISHEK  VASAV', '1609120011', 2, 1, 4, 0, 1),
(1107, '', 'AJAY KUMAR TIWARI', '1609120012', 2, 1, 4, 0, 1),
(1108, '', 'AJIT  RAJPOOT', '1609120013', 2, 1, 4, 0, 1),
(1109, '', 'AKHILESH KUMAR SINGH', '1609120015', 2, 1, 4, 0, 1),
(1110, '', 'AKSHIT  KUMAR', '1609120016', 2, 1, 4, 0, 1),
(1111, '', 'AMIT  KUMAR', '1609120017', 2, 1, 4, 0, 1),
(1112, '', 'ANANT VERMA', '1609120019', 2, 1, 4, 0, 1),
(1113, '', 'ANANYA SHAHI', '1609120020', 2, 1, 4, 0, 1),
(1114, '', 'ANKUR  KUMAR', '1609120021', 2, 1, 4, 0, 1),
(1115, '', 'ANOOP  DWIVEDI', '1609120022', 2, 1, 4, 0, 1),
(1116, '', 'ANSHIKA  JAISWAL', '1609120023', 2, 1, 4, 0, 1),
(1117, '', 'ANURADHA GUPTA', '1609120024', 2, 1, 4, 0, 1),
(1118, '', 'APOORV  JOSHI', '1609120025', 2, 1, 4, 0, 1),
(1119, '', 'APRAMEY  SINGH', '1609120026', 2, 1, 4, 0, 1),
(1120, '', 'ARYAN  CHAUDHARY', '1609120027', 2, 1, 4, 0, 1),
(1121, '', 'ASHUTOSH  SINGH', '1609120028', 2, 1, 4, 0, 1),
(1122, '', 'AVIRAL  GAUR', '1609120029', 2, 1, 4, 0, 1),
(1123, '', 'AYUSH GEMINI', '1609120030', 2, 1, 4, 0, 1),
(1124, '', 'AYUSH  JAIN', '1609120031', 2, 1, 4, 0, 1),
(1125, '', 'AYUSH  KHARE', '1609120032', 2, 1, 4, 0, 1),
(1126, '', 'AYUSH  SINGH', '1609120033', 2, 1, 4, 0, 1),
(1127, '', 'AYUSHI  JAIN', '1609120034', 2, 1, 4, 0, 1),
(1128, '', 'BHAIBHAV  YADAV', '1609120035', 2, 1, 4, 0, 1),
(1129, '', 'DEVENDRA PRATAP\n NAIYAR', '1609120036', 2, 1, 4, 0, 1),
(1130, '', 'DEVESH  UPADHYAY', '1609120037', 2, 1, 4, 0, 1),
(1131, '', 'DIVAKAR  CHAUDHARY', '1609120038', 2, 1, 4, 0, 1),
(1132, '', 'GAURAV  RATHORE', '1609120039', 2, 1, 4, 0, 1),
(1133, '', 'HANI  AGRAWAL', '1609120040', 2, 1, 4, 0, 1),
(1134, '', 'HARSH KUMAR SRIVASTAVA', '1609120041', 2, 1, 4, 0, 1),
(1135, '', 'HARSH  NANGIA', '1609120042', 2, 1, 4, 0, 1),
(1136, '', 'HARSHIT  BHARDWAJ', '1609120043', 2, 1, 4, 0, 1),
(1137, '', 'HARSHVARDHAN KUMAR SINGH', '1609120044', 2, 1, 4, 0, 1),
(1138, '', 'ISHANK  KEDARIA', '1609120045', 2, 1, 4, 0, 1),
(1139, '', 'ISHITA  SRIVASTAVA', '1609120046', 2, 1, 4, 0, 1),
(1140, '', 'JAI VIJAY', '1609120047', 2, 1, 4, 0, 1),
(1141, '', 'KARTIKEY  SINGH', '1609120048', 2, 1, 4, 0, 1),
(1142, '', 'KUMAR ROHIT CHANDRA', '1609120051', 2, 1, 4, 0, 1),
(1143, '', 'KUSHAGRA PANI TIWARI', '1609120052', 2, 1, 4, 0, 1),
(1144, '', 'MANYAM  SRIVASTAVA', '1609120054', 2, 1, 4, 0, 1),
(1145, '', 'MARUT NANDAN SINGH', '1609120055', 2, 1, 4, 0, 1),
(1146, '', 'MAYANK  VERMA', '1609120056', 2, 1, 4, 0, 1),
(1147, '', 'MOHAMMAD SAJID KHAN', '1609120057', 2, 1, 4, 0, 1),
(1148, '', 'MOHIT  YADAV', '1609120058', 2, 1, 4, 0, 1),
(1149, '', 'MRIDUL  KESARWANI', '1609120059', 2, 1, 4, 0, 1),
(1150, '', 'MUKUL  CHAUHAN', '1609120060', 2, 1, 4, 0, 1),
(1151, '', 'NAMRATA  SHARMA', '1609120061', 2, 1, 4, 0, 1),
(1152, '', 'NEHA  PANDEY', '1609120062', 2, 1, 4, 0, 1),
(1153, '', 'NILABH SRIVASTAVA', '1609120063', 2, 1, 4, 0, 1),
(1154, '', 'NIRMAL KUMAR SINGH', '1609120064', 2, 1, 4, 0, 1),
(1155, '', 'PIYUSH  KUMAR', '1609120066', 2, 1, 4, 0, 1),
(1156, '', 'PRABHAT RANJAN MISHRA', '1609120067', 2, 1, 4, 0, 1),
(1157, '', 'PRABHAT  SINGH', '1609120068', 2, 1, 4, 0, 1),
(1158, '', 'PRAKHAR  GUPTA', '1609120070', 2, 1, 4, 0, 1),
(1159, '', 'PRANJAL YADAV', '1609120071', 2, 1, 4, 0, 1),
(1160, '', 'PRANSHUL  AGARWAL', '1609120072', 2, 1, 4, 0, 1),
(1161, '', 'PRATIKSHA  SHUKLA', '1609120073', 2, 1, 4, 0, 1),
(1162, '', 'PRAVARTIKA  SENGAR', '1609120074', 2, 1, 4, 0, 1),
(1163, '', 'PRAVEEN  SINGH', '1609120075', 2, 1, 4, 0, 1),
(1164, '', 'RAHUL  CHUGH', '1609120077', 2, 1, 4, 0, 1),
(1165, '', 'RAM PRATAP VERMA', '1609120078', 2, 1, 4, 0, 1),
(1166, '', 'RANJEET  VERMA', '1609120079', 2, 1, 4, 0, 1),
(1167, '', 'RAUNAK  KUMAR', '1609120080', 2, 1, 4, 0, 1),
(1168, '', 'RISHU  SINGH', '1609120081', 2, 1, 4, 0, 1),
(1169, '', 'ROBIN KUMAR SINGH', '1609120082', 2, 1, 4, 0, 1),
(1170, '', 'ROVIN CHAUHAN', '1609120083', 2, 1, 4, 0, 1),
(1171, '', 'SAIF  MOHAMMAD', '1609120084', 2, 1, 4, 0, 1),
(1172, '', 'SAMRAGYEE  CHANDRA', '1609120085', 2, 1, 4, 0, 1),
(1173, '', 'SATYAM  SHARMA', '1609120086', 2, 1, 4, 0, 1),
(1174, '', 'SATYAM  SINGH', '1609120087', 2, 1, 4, 0, 1),
(1175, '', 'SATYAM TOMER', '1609120088', 2, 1, 4, 0, 1),
(1176, '', 'SAUMYA', '1609120089', 2, 1, 4, 0, 1),
(1177, '', 'SAURABH  CHAUDHARY', '1609120090', 2, 1, 4, 0, 1),
(1178, '', 'SAURABH  SHUKLA', '1609120091', 2, 1, 4, 0, 1),
(1179, '', 'SAURABH  YADAV', '1609120092', 2, 1, 4, 0, 1),
(1180, '', 'SHAILENDRA  KUMAR', '1609120093', 2, 1, 4, 0, 1),
(1181, '', 'SHAILLY  LAVANIA', '1609120094', 2, 1, 4, 0, 1),
(1182, '', 'SHANTANU  GARG', '1609120095', 2, 1, 4, 0, 1),
(1183, '', 'SHASHANK  PATEL', '1609120096', 2, 1, 4, 0, 1),
(1184, '', 'SHATAKSHI  BHADOURIA', '1609120097', 2, 1, 4, 0, 1),
(1185, '', 'SHIVAM  SINGH', '1609120098', 2, 1, 4, 0, 1),
(1186, '', 'SHIVAM  YADAV', '1609120099', 2, 1, 4, 0, 1),
(1187, '', 'SHIVANK SHIKHAR TRIPATHI', '1609120100', 2, 1, 4, 0, 1),
(1188, '', 'SHREYAM  SINGH', '1609120101', 2, 1, 4, 0, 1),
(1189, '', 'SHUBHAM  MAURYA', '1609120102', 2, 1, 4, 0, 1),
(1190, '', 'SHUBHAM  PRAJAPATI', '1609120104', 2, 1, 4, 0, 1),
(1191, '', 'SHUBHAM SHARMA', '1609120105', 2, 1, 4, 0, 1),
(1192, '', 'SHUBHANKAR  TRIPATHI', '1609120106', 2, 1, 4, 0, 1),
(1193, '', 'SIDDHANT  VERMA', '1609120107', 2, 1, 4, 0, 1),
(1194, '', 'SMRITI  SINGH', '1609120108', 2, 1, 4, 0, 1),
(1195, '', 'SUMIT  DUBEY', '1609120109', 2, 1, 4, 0, 1),
(1196, '', 'SUMIT KUMAR KASAUDHAN', '1609120110', 2, 1, 4, 0, 1),
(1197, '', 'UJJWAL  GUPTA', '1609120111', 2, 1, 4, 0, 1),
(1198, '', 'UJJWAL  GUPTA', '1609120112', 2, 1, 4, 0, 1),
(1199, '', 'UJJWAL  MISHRA', '1609120113', 2, 1, 4, 0, 1),
(1200, '', 'UTKARSH  AWASTHI', '1609120114', 2, 1, 4, 0, 1),
(1201, '', 'UTKARSH  GUPTA', '1609120115', 2, 1, 4, 0, 1),
(1202, '', 'VARUN SHARMA', '1609120116', 2, 1, 4, 0, 1),
(1203, '', 'VERNIKA  VERMA', '1609120117', 2, 1, 4, 0, 1),
(1204, '', 'VIKASH  SWAROOP', '1609120118', 2, 1, 4, 0, 1),
(1205, '', 'VINEET  VERMA', '1609120119', 2, 1, 4, 0, 1),
(1206, '', 'VIPUL KUMAR RAI', '1609120120', 2, 1, 4, 0, 1),
(1207, '', 'VIVEK KUMAR TIWARI', '1609120121', 2, 1, 4, 0, 1),
(1208, '', 'YADHUVEER  YADAV', '1609120122', 2, 1, 4, 0, 1),
(1209, '', 'YATHARTH TIWARI', '1609120123', 2, 1, 4, 0, 1),
(1210, '', 'YOGESH KUMAR SINGH', '1609120124', 2, 1, 4, 0, 1),
(1211, '', 'YOGESH  SAHAY', '1609120125', 2, 1, 4, 0, 1),
(1212, '', 'SHIVAM JANGID', '1609131144', 2, 1, 4, 0, 1),
(1213, '17DLEE001', 'PANCHANAND  SINGH', '', 2, 1, 4, 0, 1),
(1214, '17DLEE003', 'MOHAMMAD  AREEB', '', 2, 1, 4, 0, 1),
(1215, '17DLEE004', 'UJJWAL  KUMAR', '', 2, 1, 4, 0, 1),
(1216, '17DLEE005', 'SHRUTI', '', 2, 1, 4, 0, 1),
(1217, '17DLEE007', 'PRADEEP KUMAR YADAV', '', 2, 1, 4, 0, 1),
(1218, '17DLEE008', 'SIDHARTH KUMAR YADAV', '', 2, 1, 4, 0, 1),
(1219, '17DLEE009', 'RAKESH KUMAR SHARMA', '', 2, 1, 4, 0, 1),
(1220, '17DLEE010', 'PARAS SANGWAN', '', 2, 1, 4, 0, 1),
(1221, '17DLEE011', 'VINAY KUMAR GUPTA', '', 2, 1, 4, 0, 1),
(1222, '17DLEE012', 'ANKIT SINGH', '', 2, 1, 4, 0, 1),
(1223, '17DLEE013', 'VIVEK  KUMAR', '', 2, 1, 4, 0, 1),
(1224, '17DLEE015', 'MOHD  SAEEM', '', 2, 1, 4, 0, 1),
(1225, '17DLEE016', 'MOHD NADEEM', '', 2, 1, 4, 0, 1),
(1226, '17DLEE017', 'SANSKRITI GUPTA', '', 2, 1, 4, 0, 1),
(1227, '17DLEE018', 'DHARMENDRA TIWARI', '', 2, 1, 4, 0, 1),
(1228, '17DLEE019', 'TUSHAR  SINGH', '', 2, 1, 4, 0, 1),
(1229, '17DLEE020', 'SHIVAM  TRIPATHI', '', 2, 1, 4, 0, 1),
(1230, '17DLEE021', 'FARHAN MAJEED', '', 2, 1, 4, 0, 1),
(1231, '17DLEE022', 'AUQIB FAROOQ', '', 2, 1, 4, 0, 1),
(1232, '17DLEE023', 'SIDDHARTH SINGH', '', 2, 1, 4, 0, 1),
(1233, '', 'MOHAMMAD NAZIM DAWLA', '1409140087', 2, 1, 8, 0, 1),
(1234, '', 'AAKASH  RATHORE', '1609140001', 2, 1, 8, 0, 1),
(1235, '', 'ABHAY  RAWAT', '1609140002', 2, 1, 8, 0, 1),
(1236, '', 'ABHIMANYU  SINGH', '1609140003', 2, 1, 8, 0, 1),
(1237, '', 'ABHINASH  KUMAR', '1609140004', 2, 1, 8, 0, 1),
(1238, '', 'ABHINAV  JHA', '1609140005', 2, 1, 8, 0, 1),
(1239, '', 'ABHINAV KANT \nSRIVASTAVA', '1609140006', 2, 1, 8, 0, 1),
(1240, '', 'ABHISHEK AGNIHOTRI', '1609140007', 2, 1, 8, 0, 1),
(1241, '', 'ABHISHEK  AGRAWAL', '1609140008', 2, 1, 8, 0, 1),
(1242, '', 'ABHISHEK  GUPTA', '1609140009', 2, 1, 8, 0, 1),
(1243, '', 'ABHISHEK  PAL', '1609140010', 2, 1, 8, 0, 1),
(1244, '', 'ABHISHEK  SINGH', '1609140011', 2, 1, 8, 0, 1),
(1245, '', 'ADARSH  ROUNAK', '1609140012', 2, 1, 8, 0, 1),
(1246, '', 'ADHEESH  TRIPATHI', '1609140013', 2, 1, 8, 0, 1),
(1247, '', 'ADITYA  DUTT', '1609140014', 2, 1, 8, 0, 1),
(1248, '', 'ADITYA RAI', '1609140015', 2, 1, 8, 0, 1),
(1249, '', 'ADITYA PRATAP SINGH', '1609140016', 2, 1, 8, 0, 1),
(1250, '', 'AJEET KUMAR PATEL', '1609140017', 2, 1, 8, 0, 1),
(1251, '', 'AJITESH  GUPTA', '1609140018', 2, 1, 8, 0, 1),
(1252, '', 'AKASH  TIWARI', '1609140019', 2, 1, 8, 0, 1),
(1253, '', 'AKHILESH KUMAR\n UPADHYAY', '1609140020', 2, 1, 8, 0, 1),
(1254, '', 'AKSHAY KUMAR YADAV', '1609140021', 2, 1, 8, 0, 1),
(1255, '', 'AMAN  SHARMA', '1609140022', 2, 1, 8, 0, 1),
(1256, '', 'AMAN  PANDEY', '1609140023', 2, 1, 8, 0, 1),
(1257, '', 'AMAN  PANDEY', '1609140024', 2, 1, 8, 0, 1),
(1258, '', 'AMAN  RAJ', '1609140025', 2, 1, 8, 0, 1),
(1259, '', 'AMAN  TRIPATHI', '1609140026', 2, 1, 8, 0, 1),
(1260, '', 'AMIT KUMAR SINGH', '1609140027', 2, 1, 8, 0, 1),
(1261, '', 'ANANDHU  GOPAN', '1609140028', 2, 1, 8, 0, 1),
(1262, '', 'ANIKET  DIXIT', '1609140029', 2, 1, 8, 0, 1),
(1263, '', 'ANJALI  KAUSHAL', '1609140030', 2, 1, 8, 0, 1),
(1264, '', 'ANKIT  TIWARI', '1609140031', 2, 1, 8, 0, 1),
(1265, '', 'ANKIT KUMAR JAISWAL', '1609140032', 2, 1, 8, 0, 1),
(1266, '', 'ANKIT KUMAR SINGH', '1609140033', 2, 1, 8, 0, 1),
(1267, '', 'ANKIT  SINGH', '1609140034', 2, 1, 8, 0, 1),
(1268, '', 'ANKUR  GUPTA', '1609140035', 2, 1, 8, 0, 1),
(1269, '', 'ANKUR  SINGH', '1609140036', 2, 1, 8, 0, 1),
(1270, '', 'ARMAAN  MISHRA', '1609140037', 2, 1, 8, 0, 1),
(1271, '', 'ARPIT  SHAHI', '1609140038', 2, 1, 8, 0, 1),
(1272, '', 'ARYAN  AGARWAL', '1609140039', 2, 1, 8, 0, 1),
(1273, '', 'ARYAN  PRATIHAR', '1609140040', 2, 1, 8, 0, 1),
(1274, '', 'ASHUTOSH KUMAR YADAV', '1609140041', 2, 1, 8, 0, 1),
(1275, '', 'ASHUTOSH  TIWARI', '1609140042', 2, 1, 8, 0, 1),
(1276, '', 'ATUL  PANWAR', '1609140043', 2, 1, 8, 0, 1),
(1277, '', 'AYOG KUMAR RASTOGI', '1609140044', 2, 1, 8, 0, 1),
(1278, '', 'AYUSH  JAIN', '1609140045', 2, 1, 8, 0, 1),
(1279, '', 'AYUSH KUMAR MISHRA', '1609140046', 2, 1, 8, 0, 1),
(1280, '', 'AYUSH KUMAR PANWAR', '1609140047', 2, 1, 8, 0, 1),
(1281, '', 'AYUSHI  RAJPOOT', '1609140048', 2, 1, 8, 0, 1),
(1282, '', 'BIPUL  BHATI', '1609140049', 2, 1, 8, 0, 1),
(1283, '', 'BIR  BAHADUR', '1609140050', 2, 1, 8, 0, 1),
(1284, '', 'CHINMAY  SHUKLA', '1609140051', 2, 1, 8, 0, 1),
(1285, '', 'DEEPAK  KUMAR', '1609140052', 2, 1, 8, 0, 1),
(1286, '', 'DEEPAK KUMAR PRAJAPATI', '1609140053', 2, 1, 8, 0, 1),
(1287, '', 'DEEPANSHU GOEL', '1609140054', 2, 1, 8, 0, 1),
(1288, '', 'DEEPIKA', '1609140055', 2, 1, 8, 0, 1),
(1289, '', 'DHARMENDRA PRATAP\n SINGH', '1609140056', 2, 1, 8, 0, 1),
(1290, '', 'DHRUV  TYAGI', '1609140057', 2, 1, 8, 0, 1),
(1291, '', 'DIKSHANT SINGH JATELA', '1609140058', 2, 1, 8, 0, 1),
(1292, '', 'DIPENDRA  SINGH', '1609140059', 2, 1, 8, 0, 1),
(1293, '', 'DIVYA KANT RAO', '1609140060', 2, 1, 8, 0, 1),
(1294, '', 'GAURAV  TIWARI', '1609140061', 2, 1, 8, 0, 1),
(1295, '', 'GAURAV  GILL', '1609140062', 2, 1, 8, 0, 1),
(1296, '', 'GOVIND  SHUKLA', '1609140063', 2, 1, 8, 0, 1),
(1297, '', 'GRIJESH KUMAR GAUTAM', '1609140064', 2, 1, 8, 0, 1),
(1298, '', 'HARIKESH  BIND', '1609140065', 2, 1, 8, 0, 1),
(1299, '', 'HARMAN  SINGH', '1609140066', 2, 1, 8, 0, 1),
(1300, '', 'HARSH  CHAUHAN', '1609140067', 2, 1, 8, 0, 1),
(1301, '', 'HARSH  VISHWAKARMA', '1609140068', 2, 1, 8, 0, 1),
(1302, '', 'HARSH  YADAV', '1609140069', 2, 1, 8, 0, 1),
(1303, '', 'HARSHIT  GOYAL', '1609140070', 2, 1, 8, 0, 1),
(1304, '', 'HARSHIT  KUMAR', '1609140071', 2, 1, 8, 0, 1),
(1305, '', 'HEMANT KUMAR VERMA', '1609140072', 2, 1, 8, 0, 1),
(1306, '', 'HIMANSHU  GUPTA', '1609140073', 2, 1, 8, 0, 1),
(1307, '', 'HIMANSHU  SINGH', '1609140074', 2, 1, 8, 0, 1),
(1308, '', 'JATIN  GUPTA', '1609140075', 2, 1, 8, 0, 1),
(1309, '', 'KALPIT  PRAJAPATI', '1609140076', 2, 1, 8, 0, 1),
(1310, '', 'KAUNTEYA  MISHRA', '1609140078', 2, 1, 8, 0, 1),
(1311, '', 'KEHAR  SINGH', '1609140079', 2, 1, 8, 0, 1),
(1312, '', 'KULDEEP  KUMAR', '1609140080', 2, 1, 8, 0, 1),
(1313, '', 'KUSH  KULSHRESTHA', '1609140081', 2, 1, 8, 0, 1),
(1314, '', 'MANAS MISHRA', '1609140082', 2, 1, 8, 0, 1),
(1315, '', 'MANASVI  SHARMA', '1609140083', 2, 1, 8, 0, 1),
(1316, '', 'MANI  KAUSHIK', '1609140084', 2, 1, 8, 0, 1),
(1317, '', 'MAYANK KUMAR JAIN', '1609140086', 2, 1, 8, 0, 1),
(1318, '', 'MAYUR  KUMAR', '1609140087', 2, 1, 8, 0, 1),
(1319, '', 'MOHAMMAD  HAIDAR', '1609140088', 2, 1, 8, 0, 1),
(1320, '', 'MOHAMMAD  KASIF', '1609140089', 2, 1, 8, 0, 1),
(1321, '', 'MOHAMMAD SHAFAQUE\n KHAN', '1609140090', 2, 1, 8, 0, 1),
(1322, '', 'MOHAMMAD WAQAR', '1609140091', 2, 1, 8, 0, 1),
(1323, '', 'MOHD ARHAM ANSARI', '1609140092', 2, 1, 8, 0, 1),
(1324, '', 'MOHSIN  RAZA', '1609140093', 2, 1, 8, 0, 1),
(1325, '', 'MUDIT  RATHI', '1609140094', 2, 1, 8, 0, 1),
(1326, '', 'MUKUL  KUMAR', '1609140095', 2, 1, 8, 0, 1),
(1327, '', 'NALIN  SINGH', '1609140096', 2, 1, 8, 0, 1),
(1328, '', 'NAMAN  AGARWAL', '1609140097', 2, 1, 8, 0, 1),
(1329, '', 'NAVEEN  UPADHYAY', '1609140098', 2, 1, 8, 0, 1),
(1330, '', 'NIKHIL  CHAUHAN', '1609140099', 2, 1, 8, 0, 1),
(1331, '', 'NILESH KUMAR UPADHYAY', '1609140100', 2, 1, 8, 0, 1),
(1332, '', 'NITISH KUMAR VERMA', '1609140101', 2, 1, 8, 0, 1),
(1333, '', 'PALLAV  BHOWMICK', '1609140102', 2, 1, 8, 0, 1),
(1334, '', 'POOJA  KUMARI', '1609140103', 2, 1, 8, 0, 1),
(1335, '', 'PRABHAT CHANDRA DWIVEDI', '1609140104', 2, 1, 8, 0, 1),
(1336, '', 'PRAKHAR  YADAV', '1609140105', 2, 1, 8, 0, 1),
(1337, '', 'PRANJAL  SINGHAL', '1609140106', 2, 1, 8, 0, 1),
(1338, '', 'PRASHANT  KUMAR', '1609140107', 2, 1, 8, 0, 1),
(1339, '', 'PRATEEK  SAHU', '1609140108', 2, 1, 8, 0, 1),
(1340, '', 'PRIYADARSHAN  \nSIDDHARTHA', '1609140109', 2, 1, 8, 0, 1),
(1341, '', 'PRIYANSHI  SINGH', '1609140110', 2, 1, 8, 0, 1),
(1342, '', 'PURU  KUMAR', '1609140111', 2, 1, 8, 0, 1),
(1343, '', 'PURUSHARTH  BHATI', '1609140112', 2, 1, 8, 0, 1),
(1344, '', 'RAGHAV', '1609140113', 2, 1, 8, 0, 1),
(1345, '', 'RAGHAV  SANDHU', '1609140114', 2, 1, 8, 0, 1),
(1346, '', 'RAHUL  SHAKYA', '1609140115', 2, 1, 8, 0, 1),
(1347, '', 'RAJAT  BANSALA', '1609140116', 2, 1, 8, 0, 1),
(1348, '', 'RAJAT  KATIYAR', '1609140117', 2, 1, 8, 0, 1),
(1349, '', 'RAJAT  MITTAL', '1609140118', 2, 1, 8, 0, 1),
(1350, '', 'RAJNISH SINGH TOMAR', '1609140119', 2, 1, 8, 0, 1),
(1351, '', 'RAMRAJ  SINGH', '1609140120', 2, 1, 8, 0, 1),
(1352, '', 'RATAN  BARNAWAL', '1609140121', 2, 1, 8, 0, 1),
(1353, '', 'RISHABH  CHAUDHARY', '1609140122', 2, 1, 8, 0, 1),
(1354, '', 'RISHABH DEV SINGH', '1609140123', 2, 1, 8, 0, 1),
(1355, '', 'RITESH KUMAR MISHRA', '1609140124', 2, 1, 8, 0, 1),
(1356, '', 'ROHIT  KALSI', '1609140125', 2, 1, 8, 0, 1),
(1357, '', 'ROHIT  LOHANI', '1609140126', 2, 1, 8, 0, 1),
(1358, '', 'SAGAR  RANA', '1609140127', 2, 1, 8, 0, 1),
(1359, '', 'SAIF  SWALEH', '1609140128', 2, 1, 8, 0, 1),
(1360, '', 'SALIL  VERMA', '1609140129', 2, 1, 8, 0, 1),
(1361, '', 'SATENDRA  KUMAR', '1609140131', 2, 1, 8, 0, 1),
(1362, '', 'SATISH  GUPTA', '1609140132', 2, 1, 8, 0, 1),
(1363, '', 'SATYAM  TIWARI', '1609140133', 2, 1, 8, 0, 1),
(1364, '', 'SATYAM  KUMAR', '1609140134', 2, 1, 8, 0, 1),
(1365, '', 'SATYAM  PATEL', '1609140135', 2, 1, 8, 0, 1),
(1366, '', 'SATYENDRA KUMAR', '1609140136', 2, 1, 8, 0, 1),
(1367, '', 'SAURABH  YADAV', '1609140137', 2, 1, 8, 0, 1),
(1368, '', 'SHEKHAR  VERMA', '1609140138', 2, 1, 8, 0, 1),
(1369, '', 'SHIVAM  AGRAWAL', '1609140139', 2, 1, 8, 0, 1),
(1370, '', 'SHIVAM  GARG', '1609140140', 2, 1, 8, 0, 1),
(1371, '', 'SHIVAM  SINGH', '1609140141', 2, 1, 8, 0, 1),
(1372, '', 'SHIVAM  YADAV', '1609140142', 2, 1, 8, 0, 1),
(1373, '', 'SHUBHAM  GOYAL', '1609140144', 2, 1, 8, 0, 1),
(1374, '', 'SHUBHAM  SINGH', '1609140145', 2, 1, 8, 0, 1),
(1375, '', 'SHWETA  SINGH', '1609140147', 2, 1, 8, 0, 1),
(1376, '', 'SIDDHANT', '1609140148', 2, 1, 8, 0, 1),
(1377, '', 'SIDDHANT KUMAR SINGH', '1609140149', 2, 1, 8, 0, 1),
(1378, '', 'SIDDHANT SINGH YADAV', '1609140150', 2, 1, 8, 0, 1),
(1379, '', 'SONAKSHI  GOYAL', '1609140151', 2, 1, 8, 0, 1),
(1380, '', 'SONAM  YADAV', '1609140152', 2, 1, 8, 0, 1),
(1381, '', 'SONI  YADAV', '1609140153', 2, 1, 8, 0, 1),
(1382, '', 'SOORAJ  TIWARI', '1609140154', 2, 1, 8, 0, 1),
(1383, '', 'SRISHTI  SINGH', '1609140155', 2, 1, 8, 0, 1),
(1384, '', 'SUDHANSHU  MAURYA', '1609140156', 2, 1, 8, 0, 1),
(1385, '', 'SULABH  UPADHYAY', '1609140157', 2, 1, 8, 0, 1),
(1386, '', 'SURAJ', '1609140159', 2, 1, 8, 0, 1),
(1387, '', 'SWAPNIL', '1609140160', 2, 1, 8, 0, 1),
(1388, '', 'SWAPNIL  MISHRA', '1609140161', 2, 1, 8, 0, 1),
(1389, '', 'SWAPNIL  YADAV', '1609140162', 2, 1, 8, 0, 1),
(1390, '', 'TUSHAR  SINGH', '1609140163', 2, 1, 8, 0, 1),
(1391, '', 'UDIT  GAUR', '1609140164', 2, 1, 8, 0, 1),
(1392, '', 'UDITANSHU  SHUKLA', '1609140165', 2, 1, 8, 0, 1),
(1393, '', 'VAIBHAV  KHANNA', '1609140167', 2, 1, 8, 0, 1),
(1394, '', 'VAIBHAV KUMAR PATHAK', '1609140168', 2, 1, 8, 0, 1),
(1395, '', 'VASU  AGARWAL', '1609140169', 2, 1, 8, 0, 1),
(1396, '', 'VEMPARALA PRIYANKA  MURTY', '1609140170', 2, 1, 8, 0, 1),
(1397, '', 'VIKAS  BANSAL', '1609140171', 2, 1, 8, 0, 1),
(1398, '', 'VIKAS  GUPT', '1609140172', 2, 1, 8, 0, 1),
(1399, '', 'VIKAS  KUMAR', '1609140173', 2, 1, 8, 0, 1),
(1400, '', 'VIKAS  SAHANI', '1609140174', 2, 1, 8, 0, 1),
(1401, '', 'VIKAS  VERMA', '1609140175', 2, 1, 8, 0, 1),
(1402, '', 'VINAY  SAINI', '1609140176', 2, 1, 8, 0, 1),
(1403, '', 'VIRENDRA KUMAR  VERMA', '1609140177', 2, 1, 8, 0, 1),
(1404, '', 'VISHAL KUMAR DIXIT', '1609140178', 2, 1, 8, 0, 1),
(1405, '', 'VIVEK  KRISHNA', '1609140179', 2, 1, 8, 0, 1),
(1406, '', 'VIVEK KUMAR', '1609140180', 2, 1, 8, 0, 1),
(1407, '', 'YASH CHITRANSH', '1609140182', 2, 1, 8, 0, 1),
(1408, '', 'YOGESH  GAUTAM', '1609140184', 2, 1, 8, 0, 1),
(1409, '17DLME001', 'KRISHNA', '', 2, 1, 8, 0, 1),
(1410, '17DLME002', 'NEHA  TRIGUNAYAT', '', 2, 1, 8, 0, 1),
(1411, '17DLME003', 'VAIBHAV  AGGARWAL', '', 2, 1, 8, 0, 1),
(1412, '17DLME004', 'SACHIN  KUMAR', '', 2, 1, 8, 0, 1),
(1413, '17DLME005', 'MUKUL  GAUR', '', 2, 1, 8, 0, 1),
(1414, '17DLME006', 'ANKIT', '', 2, 1, 8, 0, 1),
(1415, '17DLME007', 'DEVANANAD  SINGH', '', 2, 1, 8, 0, 1),
(1416, '17DLME008', 'AAKASH  SHARMA', '', 2, 1, 8, 0, 1),
(1417, '17DLME009', 'SHUBHAM  RAWAT', '', 2, 1, 8, 0, 1),
(1418, '17DLME010', 'ANUJ  GUPTA', '', 2, 1, 8, 0, 1),
(1419, '17DLME011', 'MOHD KAMRAN KHAN', '', 2, 1, 8, 0, 1),
(1420, '17DLME012', 'HASHAN AHMAD KHAN', '', 2, 1, 8, 0, 1),
(1421, '17DLME013', 'VISHAL SHARMA', '', 2, 1, 8, 0, 1),
(1422, '17DLME014', 'SANTOSH KUMAR', '', 2, 1, 8, 0, 1),
(1423, '17DLME015', 'SUJEET KUMAR GUPTA', '', 2, 1, 8, 0, 1),
(1424, '17DLME016', 'RAJESH PRATAP', '', 2, 1, 8, 0, 1),
(1425, '17DLME017', 'VISHAL SAKKARWAL', '', 2, 1, 8, 0, 1),
(1426, '17DLME019', 'PRASHANT SHUKLA', '', 2, 1, 8, 0, 1),
(1427, '17DLME020', 'LOKENDERA KUMAR', '', 2, 1, 8, 0, 1),
(1428, '17DLME021', 'MOHD. NAZIM ATAZAL', '', 2, 1, 8, 0, 1),
(1429, '17DLME022', 'RAHUL KUMAR ', '', 2, 1, 8, 0, 1),
(1430, '17DLME023', 'MOHD. KASHIF', '', 2, 1, 8, 0, 1),
(1431, '17DLME024', 'TANUJ KUMAR SINGH', '', 2, 1, 8, 0, 1),
(1432, '17DLME025', 'VIVEK KUMAR BHARDWAJ', '', 2, 1, 8, 0, 1),
(1433, '17DLME026', 'YASH  JAIN', '', 2, 1, 8, 0, 1),
(1434, '17DLME027', 'PRAMOD  KUSHWAHA', '', 2, 1, 8, 0, 1),
(1435, '17DLME028', 'RAHUL  KUMAR', '', 2, 1, 8, 0, 1),
(1436, '17DLME029', 'ABHISHEK INDRADEO PRASAD', '', 2, 1, 8, 0, 1),
(1437, '17DLME030', 'VINEET KUMAR SHARMA', '', 2, 1, 8, 0, 1),
(1438, '17DLME031', 'MOHAMMAD ANAS', '', 2, 1, 8, 0, 1),
(1439, '17DLME032', 'SANJEEV  PANDEY', '', 2, 1, 8, 0, 1),
(1440, '17DLME033', 'MOHD  ZAID', '', 2, 1, 8, 0, 1),
(1441, '', 'AAROHAN  RAWAT', '1609131001', 2, 1, 3, 0, 1),
(1442, '', 'AARUSHI  SINGH', '1609131002', 2, 1, 3, 0, 1),
(1443, '', 'AAYUSH  SHARMA', '1609131003', 2, 1, 3, 0, 1),
(1444, '', 'AAYUSHI  VAISH', '1609131004', 2, 1, 3, 0, 1),
(1445, '', 'ABHISHEK  BINDAL', '1609131005', 2, 1, 3, 0, 1),
(1446, '', 'ABHISHEK  JAIN', '1609131006', 2, 1, 3, 0, 1),
(1447, '', 'ADITYA  MISHRA', '1609131009', 2, 1, 3, 0, 1),
(1448, '', 'ADITYA  SETH', '1609131010', 2, 1, 3, 0, 1),
(1449, '', 'AKANKSHA  AGARWAL', '1609131011', 2, 1, 3, 0, 1),
(1450, '', 'AKANKSHA  SINGH', '1609131012', 2, 1, 3, 0, 1),
(1451, '', 'AKANKSHA SINGH RATHORE', '1609131013', 2, 1, 3, 0, 1),
(1452, '', 'AKANSHA  GOEL', '1609131014', 2, 1, 3, 0, 1),
(1453, '', 'AKASH SINGH', '1609131015', 2, 1, 3, 0, 1),
(1454, '', 'AKSHAT  VERMA', '1609131016', 2, 1, 3, 0, 1),
(1455, '', 'ALISHA  MAHMOOD', '1609131017', 2, 1, 3, 0, 1),
(1456, '', 'AMAN  SRIVASTAVA', '1609131018', 2, 1, 3, 0, 1),
(1457, '', 'AMBER  MISHRA', '1609131019', 2, 1, 3, 0, 1),
(1458, '', 'AMITESH  PIPAL', '1609131020', 2, 1, 3, 0, 1),
(1459, '', 'ANAND  RAWAT', '1609131021', 2, 1, 3, 0, 1),
(1460, '', 'ANISH  AHAMAD', '1609131022', 2, 1, 3, 0, 1),
(1461, '', 'ANJALI  YADAV', '1609131023', 2, 1, 3, 0, 1),
(1462, '', 'ANKIT  GUPTA', '1609131024', 2, 1, 3, 0, 1),
(1463, '', 'ANKIT SINGH', '1609131025', 2, 1, 3, 0, 1),
(1464, '', 'ANMOL', '1609131026', 2, 1, 3, 0, 1),
(1465, '', 'ANOUSHKA  PRAJAPATI', '1609131027', 2, 1, 3, 0, 1),
(1466, '', 'ANSHUL CHAUDHARY', '1609131028', 2, 1, 3, 0, 1),
(1467, '', 'ANSHUMAN  GUPTA', '1609131029', 2, 1, 3, 0, 1),
(1468, '', 'ANTRIKSH  PANDEY', '1609131030', 2, 1, 3, 0, 1),
(1469, '', 'ANUJ  SHAKYA', '1609131031', 2, 1, 3, 0, 1),
(1470, '', 'ANUSHA  SINGAL', '1609131032', 2, 1, 3, 0, 1),
(1471, '', 'ANUSHKA  SHUKLA', '1609131033', 2, 1, 3, 0, 1),
(1472, '', 'ARADHYA  MEHRA', '1609131034', 2, 1, 3, 0, 1),
(1473, '', 'ARCHIT  PARIKSHIT', '1609131035', 2, 1, 3, 0, 1),
(1474, '', 'ARCHIT  TEWARI', '1609131036', 2, 1, 3, 0, 1),
(1475, '', 'ARPIT  SINGH', '1609131038', 2, 1, 3, 0, 1),
(1476, '', 'ARSHAD AHMED KHAN', '1609131039', 2, 1, 3, 0, 1),
(1477, '', 'ARVIND CHAUDHARY', '1609131040', 2, 1, 3, 0, 1),
(1478, '', 'ARVIND  KUMAR', '1609131041', 2, 1, 3, 0, 1),
(1479, '', 'ATANSHI  CHATURVEDI', '1609131042', 2, 1, 3, 0, 1),
(1480, '', 'AVANTIKA  SHUKLA', '1609131043', 2, 1, 3, 0, 1),
(1481, '', 'AVISHA  ARORA', '1609131044', 2, 1, 3, 0, 1),
(1482, '', 'AVRATI  SANT', '1609131045', 2, 1, 3, 0, 1),
(1483, '', 'AYUSH  CHAURASIA', '1609131046', 2, 1, 3, 0, 1),
(1484, '', 'BHAGYA SHRI VERMA', '1609131047', 2, 1, 3, 0, 1),
(1485, '', 'BHIBHANSHU  VERMA', '1609131048', 2, 1, 3, 0, 1),
(1486, '', 'CHAHAK  TYAGI', '1609131049', 2, 1, 3, 0, 1),
(1487, '', 'DEEKSHA  AGARWAL', '1609131050', 2, 1, 3, 0, 1),
(1488, '', 'DEEPENDRA  PRATAP', '1609131051', 2, 1, 3, 0, 1),
(1489, '', 'DEVANSHU  MONGA', '1609131052', 2, 1, 3, 0, 1),
(1490, '', 'DEVESH PRATAPSINGH SHAKYA', '1609131053', 2, 1, 3, 0, 1),
(1491, '', 'DIVYANJALI  VERMA', '1609131054', 2, 1, 3, 0, 1),
(1492, '', 'DIVYANSHU  DUBEY', '1609131055', 2, 1, 3, 0, 1),
(1493, '', 'GARIMA  CHAUDHARY', '1609131057', 2, 1, 3, 0, 1),
(1494, '', 'HARSH  GOYAL', '1609131058', 2, 1, 3, 0, 1),
(1495, '', 'HIMANGINI  SHARMA', '1609131059', 2, 1, 3, 0, 1),
(1496, '', 'HIMANSHI  ARYA', '1609131060', 2, 1, 3, 0, 1),
(1497, '', 'HIMANSHI  SHARMA', '1609131061', 2, 1, 3, 0, 1),
(1498, '', 'ISHITA  BHARDWAJ', '1609131062', 2, 1, 3, 0, 1),
(1499, '', 'JUHI  BHARADWAJ', '1609131063', 2, 1, 3, 0, 1),
(1500, '', 'JYOTI SHISHODIA', '1609131064', 2, 1, 3, 0, 1),
(1501, '', 'KAKUL  KULSHRESTHA', '1609131065', 2, 1, 3, 0, 1),
(1502, '', 'KARAN  BAINS', '1609131066', 2, 1, 3, 0, 1),
(1503, '', 'KEERTI  RAJ', '1609131067', 2, 1, 3, 0, 1),
(1504, '', 'KHUSHBOO  YADAV', '1609131068', 2, 1, 3, 0, 1),
(1505, '', 'KIRTI', '1609131069', 2, 1, 3, 0, 1),
(1506, '', 'KOMAL  PANDEY', '1609131070', 2, 1, 3, 0, 1),
(1507, '', 'KULSHRESHTHA \n VARDHAN', '1609131071', 2, 1, 3, 0, 1),
(1508, '', 'KULVINDER  SINGH', '1609131072', 2, 1, 3, 0, 1),
(1509, '', 'KUMAR ANKIT', '1609131073', 2, 1, 3, 0, 1),
(1510, '', 'KUSHAGRA  KAINTURA', '1609131074', 2, 1, 3, 0, 1),
(1511, '', 'LALIT  CHAUHAN', '1609131075', 2, 1, 3, 0, 1),
(1512, '', 'LALITESHWAR SINGH RATHOR', '1609131076', 2, 1, 3, 0, 1),
(1513, '', 'MANSI  TIWARI', '1609131077', 2, 1, 3, 0, 1),
(1514, '', 'MAYANK  GARG', '1609131079', 2, 1, 3, 0, 1),
(1515, '', 'MOHIT KUMAR \nSRIVASTAVA', '1609131081', 2, 1, 3, 0, 1),
(1516, '', 'MOHIT SINGH PATEL', '1609131082', 2, 1, 3, 0, 1),
(1517, '', 'MRITUNJAY  MISHRA', '1609131083', 2, 1, 3, 0, 1),
(1518, '', 'MUDIT  KAPOOR', '1609131084', 2, 1, 3, 0, 1),
(1519, '', 'MUKARRAM  ALI', '1609131085', 2, 1, 3, 0, 1),
(1520, '', 'NAMRATA  SINGH', '1609131088', 2, 1, 3, 0, 1),
(1521, '', 'NANCY  GUPTA', '1609131089', 2, 1, 3, 0, 1),
(1522, '', 'NAVNEET  GUPTA', '1609131090', 2, 1, 3, 0, 1),
(1523, '', 'NEHA  YADAV', '1609131091', 2, 1, 3, 0, 1),
(1524, '', 'NEHUL  CHAUDHARY', '1609131092', 2, 1, 3, 0, 1),
(1525, '', 'NIDHI  TRIPATHI', '1609131093', 2, 1, 3, 0, 1),
(1526, '', 'NIKHIL  VERMA', '1609131094', 2, 1, 3, 0, 1),
(1527, '', 'NIKITA  SINGAL', '1609131095', 2, 1, 3, 0, 1),
(1528, '', 'NIPUN  AGRAWAL', '1609131096', 2, 1, 3, 0, 1),
(1529, '', 'NIRMAL  SINGH', '1609131097', 2, 1, 3, 0, 1),
(1530, '', 'NISCHAL  LOHANI', '1609131098', 2, 1, 3, 0, 1),
(1531, '', 'NISHANT  SINGH', '1609131099', 2, 1, 3, 0, 1),
(1532, '', 'NIVESH', '1609131100', 2, 1, 3, 0, 1),
(1533, '', 'PADMESH  KUNWAR', '1609131101', 2, 1, 3, 0, 1),
(1534, '', 'PARTH  DHAR', '1609131102', 2, 1, 3, 0, 1),
(1535, '', 'PRAGYAN PRAKASH SINGH', '1609131103', 2, 1, 3, 0, 1),
(1536, '', 'PRAKHAR  GARG', '1609131104', 2, 1, 3, 0, 1),
(1537, '', 'PRANAV  MITTAL', '1609131105', 2, 1, 3, 0, 1),
(1538, '', 'PRANJALI  SHRIVASTAVA', '1609131106', 2, 1, 3, 0, 1),
(1539, '', 'PRANSHU SAI SHUKLA', '1609131107', 2, 1, 3, 0, 1),
(1540, '', 'PRASHANT  KUMAR', '1609131108', 2, 1, 3, 0, 1),
(1541, '', 'PRATEEK  GUPTA', '1609131109', 2, 1, 3, 0, 1),
(1542, '', 'PRATEEK KUMAR SINGH', '1609131110', 2, 1, 3, 0, 1),
(1543, '', 'PRAVEEN KUMAR TIWARI', '1609131111', 2, 1, 3, 0, 1),
(1544, '', 'PRERNA  SINGH', '1609131113', 2, 1, 3, 0, 1),
(1545, '', 'PRIYANSHU  GUPTA', '1609131114', 2, 1, 3, 0, 1),
(1546, '', 'PRIYANSHU KUMAR SINGH', '1609131115', 2, 1, 3, 0, 1),
(1547, '', 'PUNEET KUMAR RAJAN', '1609131116', 2, 1, 3, 0, 1),
(1548, '', 'RAHUL  BHATIA', '1609131117', 2, 1, 3, 0, 1),
(1549, '', 'RAJ  SINGH', '1609131118', 2, 1, 3, 0, 1),
(1550, '', 'RAJAT  KARNWAL', '1609131119', 2, 1, 3, 0, 1),
(1551, '', 'RITENDRA KUMAR VERMA', '1609131121', 2, 1, 3, 0, 1),
(1552, '', 'RITU VERMA', '1609131122', 2, 1, 3, 0, 1),
(1553, '', 'ROHAN SWAROOP', '1609131123', 2, 1, 3, 0, 1),
(1554, '', 'ROHIT  VERMA', '1609131124', 2, 1, 3, 0, 1),
(1555, '', 'RUPAL  TYAGI', '1609131125', 2, 1, 3, 0, 1),
(1556, '', 'SAGAR  BHATI', '1609131126', 2, 1, 3, 0, 1),
(1557, '', 'SAKSHAM  SINHA', '1609131127', 2, 1, 3, 0, 1),
(1558, '', 'SAMIKSHA  SINGH', '1609131128', 2, 1, 3, 0, 1),
(1559, '', 'SAMPOORNA  AGRAWAL', '1609131129', 2, 1, 3, 0, 1),
(1560, '', 'SARVESH  AHUJA', '1609131130', 2, 1, 3, 0, 1),
(1561, '', 'SAUMYA  DWIVEDI', '1609131131', 2, 1, 3, 0, 1),
(1562, '', 'SAURABH KUMAR DUBEY', '1609131132', 2, 1, 3, 0, 1),
(1563, '', 'SHAILAV  JHA', '1609131133', 2, 1, 3, 0, 1),
(1564, '', 'SHANI KUMAR', '1609131134', 2, 1, 3, 0, 1),
(1565, '', 'SHANTANU  GUPTA', '1609131135', 2, 1, 3, 0, 1),
(1566, '', 'SHANTANU  SINGH', '1609131136', 2, 1, 3, 0, 1),
(1567, '', 'SHASHANK MANI TIWARI', '1609131137', 2, 1, 3, 0, 1),
(1568, '', 'SHELLY  SHARMA', '1609131138', 2, 1, 3, 0, 1),
(1569, '', 'SHELLY  YADAV', '1609131139', 2, 1, 3, 0, 1),
(1570, '', 'SHIKHAR  BAJPAI', '1609131140', 2, 1, 3, 0, 1),
(1571, '', 'SHIKHAR  SHARMA', '1609131141', 2, 1, 3, 0, 1),
(1572, '', 'SHIKHAR  SRIVASTAVA', '1609131142', 2, 1, 3, 0, 1),
(1573, '', 'SHIPRA  MISHRA', '1609131143', 2, 1, 3, 0, 1),
(1574, '', 'SHIVANGI  SINGH', '1609131146', 2, 1, 3, 0, 1),
(1575, '', 'SHIVANGI  SINGH', '1609131147', 2, 1, 3, 0, 1),
(1576, '', 'SHIVANGI  TRIPATHI', '1609131148', 2, 1, 3, 0, 1),
(1577, '', 'SHIVANSHU  RAI', '1609131149', 2, 1, 3, 0, 1),
(1578, '', 'SHRESHTHA  KAIVARTA', '1609131150', 2, 1, 3, 0, 1),
(1579, '', 'SHREYA  MISHRA', '1609131151', 2, 1, 3, 0, 1),
(1580, '', 'SHREYA  SINHA', '1609131152', 2, 1, 3, 0, 1),
(1581, '', 'SHREYANSH  VERMA', '1609131153', 2, 1, 3, 0, 1),
(1582, '', 'SHUBHAM KASHYAP', '1609131154', 2, 1, 3, 0, 1),
(1583, '', 'SHUBHAM  MITTAL', '1609131155', 2, 1, 3, 0, 1),
(1584, '', 'SHUBHANSHU  SINGH', '1609131156', 2, 1, 3, 0, 1),
(1585, '', 'SIDDHARTH  SINGH', '1609131157', 2, 1, 3, 0, 1),
(1586, '', 'SIMRAN  GUPTA', '1609131158', 2, 1, 3, 0, 1),
(1587, '', 'SONAL SAXENA', '1609131159', 2, 1, 3, 0, 1),
(1588, '', 'SONAM  SARASWAT', '1609131160', 2, 1, 3, 0, 1),
(1589, '', 'SUBHASHINI  SAHU', '1609131161', 2, 1, 3, 0, 1),
(1590, '', 'SURAJ  SINGH', '1609131162', 2, 1, 3, 0, 1),
(1591, '', 'SUYASH', '1609131163', 2, 1, 3, 0, 1),
(1592, '', 'SWETABH  SISODIA', '1609131164', 2, 1, 3, 0, 1),
(1593, '', 'TANYA  AGRAWAL', '1609131165', 2, 1, 3, 0, 1),
(1594, '', 'TANYA  PANDEY', '1609131166', 2, 1, 3, 0, 1),
(1595, '', 'TANYA  SAXENA', '1609131167', 2, 1, 3, 0, 1),
(1596, '', 'TANYA  SAXENA', '1609131168', 2, 1, 3, 0, 1),
(1597, '', 'TARUN  SINGH', '1609131169', 2, 1, 3, 0, 1),
(1598, '', 'TUSHAR KRISHNA CHAUHAN', '1609131170', 2, 1, 3, 0, 1),
(1599, '', 'UTKARSH  SHUKLA', '1609131171', 2, 1, 3, 0, 1),
(1600, '', 'UTKARSH  SINGH', '1609131172', 2, 1, 3, 0, 1),
(1601, '', 'UTKARSH  TRIPATHI', '1609131173', 2, 1, 3, 0, 1),
(1602, '', 'UTTKARSH  JAISWAL', '1609131174', 2, 1, 3, 0, 1),
(1603, '', 'VAIDIK  SINGH', '1609131175', 2, 1, 3, 0, 1),
(1604, '', 'VASU  JAIN', '1609131176', 2, 1, 3, 0, 1),
(1605, '', 'VATSAL  MISHRA', '1609131177', 2, 1, 3, 0, 1),
(1606, '', 'VIPIN KUMAR SONI', '1609131178', 2, 1, 3, 0, 1),
(1607, '', 'VISHAL GOYAL', '1609131179', 2, 1, 3, 0, 1),
(1608, '', 'VISHESH  RAJPUT', '1609131180', 2, 1, 3, 0, 1),
(1609, '', 'VISHESH  SAXENA', '1609131181', 2, 1, 3, 0, 1),
(1610, '', 'YAMINI  GUPTA', '1609131182', 2, 1, 3, 0, 1),
(1611, '', 'YOGESH  KATHERIA', '1609131183', 2, 1, 3, 0, 1),
(1612, '', 'YOGESH KUMAR \nYADAV', '1609131184', 2, 1, 3, 0, 1),
(1613, '17DLEC001', 'PRANSHU BHATNAGAR', '', 2, 1, 3, 0, 1),
(1614, '17DLEC002', 'SHIVAM  SHARMA', '', 2, 1, 3, 0, 1),
(1615, '17DLEC003', 'GAURAV  MAURYA', '', 2, 1, 3, 0, 1),
(1616, '17DLEC004', 'SONU  KATIYAR', '', 2, 1, 3, 0, 1),
(1617, '17DLEC005', 'ANUSHKA  NISHAD', '', 2, 1, 3, 0, 1),
(1618, '17DLEC006', 'SWATI  YADAV', '', 2, 1, 3, 0, 1),
(1619, '17DLEC007', 'SHIVAM  GUPTA', '', 2, 1, 3, 0, 1),
(1620, '17DLEC012', 'SHAFIA  TALAT', '', 2, 1, 3, 0, 1),
(1621, '17DLEC014', 'SHANTANU KUMAR PATHAK', '', 2, 1, 3, 0, 1),
(1622, '17DLEC015', 'JANAVI', '', 2, 1, 3, 0, 1),
(1623, '17DLEC016', 'DIVYA  GIRI', '', 2, 1, 3, 0, 1),
(1624, '17DLEC036', 'SHUBHAM  RANA', '', 2, 1, 3, 0, 1),
(1625, '', 'HIMANSHI PANDE', '1609121022', 2, 1, 3, 0, 1),
(1626, '', 'SHIVANGI THAPLIYAL', '1609121055', 2, 1, 3, 0, 1),
(1627, '', 'MADHULIKA GUPTA', '1609121032', 2, 1, 3, 0, 1),
(1628, '', 'SHUBHAM PRAJAPATI', '1609120103', 2, 1, 3, 0, 1),
(1629, '', 'AKASH KUMAR', '1609120014', 2, 1, 3, 0, 1),
(1630, '', 'AKASH SINGH', '1609100019', 2, 1, 3, 0, 1),
(1631, '', 'ANANT N TIWARI', '1609120018', 2, 1, 3, 0, 1),
(1632, '', 'KRISHNA RAGHAV SETH', '1609120050', 2, 1, 3, 0, 1),
(1633, '', 'NISHANT TYAGI', '1609120065', 2, 1, 3, 0, 1),
(1634, '', 'RADHIKA AGARWAL', '1609120076', 2, 1, 3, 0, 1),
(1635, '', 'PRAGATI', '1609120069', 2, 1, 3, 0, 1),
(1636, '', 'PRADEEP KUMAR PAL ', '1609131905', 2, 1, 3, 0, 1),
(1637, '', 'VISHESH RAI  ', '1409131108', 2, 1, 3, 0, 1),
(1638, '17DLEC008', 'MRITUNJAYA KUMAR\n UPADHYAY', '', 2, 1, 3, 0, 1),
(1639, '17DLEC013', 'ANIKET', '', 2, 1, 3, 0, 1),
(1640, '', 'ABHINAV  KANOJIA', '1609122001', 2, 1, 6, 0, 1),
(1641, '', 'ADARSHA ASHOK\n WANKHADE', '1609122002', 2, 1, 6, 0, 1),
(1642, '', 'AKSHAT  TRIVEDI', '1609122003', 2, 1, 6, 0, 1),
(1643, '', 'AKSHAY KUMAR', '1609122004', 2, 1, 6, 0, 1),
(1644, '', 'ANUBHAV  GANGWAR', '1609122005', 2, 1, 6, 0, 1),
(1645, '', 'ANURAG  YADAV', '1609122006', 2, 1, 6, 0, 1),
(1646, '', 'ARUN  SARDANA', '1609122007', 2, 1, 6, 0, 1),
(1647, '', 'ASHISH  KUMAR', '1609122008', 2, 1, 6, 0, 1),
(1648, '', 'AVIRAL  TRIPATHI', '1609122009', 2, 1, 6, 0, 1),
(1649, '', 'AYUSH  GOYAL', '1609122010', 2, 1, 6, 0, 1),
(1650, '', 'DEVANG  SRIVASTAV', '1609122011', 2, 1, 6, 0, 1),
(1651, '', 'DOLLY SINGH', '1609122012', 2, 1, 6, 0, 1),
(1652, '', 'GAURAV  DUBEY', '1609122014', 2, 1, 6, 0, 1),
(1653, '', 'KAJAL  SINGH', '1609122016', 2, 1, 6, 0, 1),
(1654, '', 'MOHD  AKRAM', '1609122017', 2, 1, 6, 0, 1),
(1655, '', 'MUDIT  SHUKLA', '1609122018', 2, 1, 6, 0, 1),
(1656, '', 'NAINIKA  SINGH', '1609122019', 2, 1, 6, 0, 1),
(1657, '', 'NITISH KUMAR CHAUBEY', '1609122020', 2, 1, 6, 0, 1),
(1658, '', 'PARAKH  DUBEY', '1609122021', 2, 1, 6, 0, 1),
(1659, '', 'PRACHI  YADAV', '1609122022', 2, 1, 6, 0, 1),
(1660, '', 'PRANJAL  SHARMA', '1609122023', 2, 1, 6, 0, 1),
(1661, '', 'PRATYAKSH  GAIROLA', '1609122024', 2, 1, 6, 0, 1),
(1662, '', 'PULKIT  BANSAL', '1609122025', 2, 1, 6, 0, 1),
(1663, '', 'RACHIT  TEWARI', '1609122026', 2, 1, 6, 0, 1),
(1664, '', 'RAHUL  YADAV', '1609122027', 2, 1, 6, 0, 1),
(1665, '', 'RENU  RAI', '1609122028', 2, 1, 6, 0, 1),
(1666, '', 'ROBIN  SINGH', '1609122030', 2, 1, 6, 0, 1),
(1667, '', 'SAURABH  SINGH', '1609122031', 2, 1, 6, 0, 1),
(1668, '', 'SHIVAM MISHRA', '1609122032', 2, 1, 6, 0, 1),
(1669, '', 'SHIVAM SHARMA', '1609122033', 2, 1, 6, 0, 1),
(1670, '', 'SHIVAM TYAGI', '1609122034', 2, 1, 6, 0, 1),
(1671, '', 'SUDHANSHU  SIKARWAR', '1609122035', 2, 1, 6, 0, 1),
(1672, '', 'SUMANYU  SINGH', '1609122036', 2, 1, 6, 0, 1),
(1673, '', 'SUNEEL KUMAR SHARMA', '1609122037', 2, 1, 6, 0, 1),
(1674, '', 'VIPIN  CHOUDHARY', '1609122038', 2, 1, 6, 0, 1),
(1675, '', 'SHIVAM TEOTIA', '1509113094', 2, 1, 2, 0, 1),
(1676, '', 'SHANTANU GAUR', '1509113088', 2, 1, 2, 0, 1),
(1677, '', 'SHRAIYA GUPTA', '1509122028', 2, 1, 2, 0, 1),
(1678, '', 'APOORWA YADAV', '1509113027', 2, 1, 2, 0, 1),
(1679, '', 'TANMAY PANGTEY', '1509113111', 2, 1, 2, 0, 1),
(1680, '', 'SHIKHER TIWARI', '1509113090', 2, 1, 2, 0, 1),
(1681, '', 'AAYUSH  AGARWAL', '1609113001', 2, 1, 2, 0, 1),
(1682, '', 'AAYUSH  AGGARWAL', '1609113002', 2, 1, 2, 0, 1),
(1683, '', 'AAYUSH  RASTOGI', '1609113003', 2, 1, 2, 0, 1),
(1684, '', 'ABHAY KUMAR SINGH', '1609113004', 2, 1, 2, 0, 1),
(1685, '', 'ABHISHEK  RAJ', '1609113005', 2, 1, 2, 0, 1),
(1686, '', 'ACHINTYA  ASTHANA', '1609113006', 2, 1, 2, 0, 1),
(1687, '', 'ADARSH  RAJ', '1609113007', 2, 1, 2, 0, 1),
(1688, '', 'ADITYA  SINGH', '1609113008', 2, 1, 2, 0, 1),
(1689, '', 'AKARSH  NEERAJ', '1609113009', 2, 1, 2, 0, 1),
(1690, '', 'AKSHAT  PANDEY', '1609113010', 2, 1, 2, 0, 1),
(1691, '', 'AMAN  GUPTA', '1609113011', 2, 1, 2, 0, 1),
(1692, '', 'AMAN  GUPTA', '1609113012', 2, 1, 2, 0, 1),
(1693, '', 'AMAN  LALWANI', '1609113013', 2, 1, 2, 0, 1),
(1694, '', 'AMARDEEP SINGH', '1609113014', 2, 1, 2, 0, 1),
(1695, '', 'AMIT SINGH', '1609113015', 2, 1, 2, 0, 1),
(1696, '', 'ANANT  JAIN', '1609113016', 2, 1, 2, 0, 1),
(1697, '', 'ANIMESH  MISHRA', '1609113017', 2, 1, 2, 0, 1),
(1698, '', 'ANIMESH  SEEMENDRA', '1609113018', 2, 1, 2, 0, 1),
(1699, '', 'ANKIT KUMAR YADAV', '1609113019', 2, 1, 2, 0, 1),
(1700, '', 'ANKITA  AGRAWAL', '1609113020', 2, 1, 2, 0, 1),
(1701, '', 'ANMOL  JAIN', '1609113021', 2, 1, 2, 0, 1),
(1702, '', 'ANSHUMAAN  SINGH', '1609113022', 2, 1, 2, 0, 1),
(1703, '', 'ANURAG KUMAR RAO', '1609113023', 2, 1, 2, 0, 1),
(1704, '', 'ANUSHKA  TAYAL', '1609113024', 2, 1, 2, 0, 1),
(1705, '', 'APAAR  MAHESHWARI', '1609113025', 2, 1, 2, 0, 1),
(1706, '', 'APOORV  BANSAL', '1609113026', 2, 1, 2, 0, 1),
(1707, '', 'ARCHANA', '1609113027', 2, 1, 2, 0, 1),
(1708, '', 'ASHUTOSH  SINGH', '1609113028', 2, 1, 2, 0, 1),
(1709, '', 'AVINEESH  DIXIT', '1609113029', 2, 1, 2, 0, 1),
(1710, '', 'AVIRAL  DIXIT', '1609113030', 2, 1, 2, 0, 1),
(1711, '', 'AYUSH  GARG', '1609113031', 2, 1, 2, 0, 1),
(1712, '', 'AYUSH  AGARWAL', '1609113032', 2, 1, 2, 0, 1),
(1713, '', 'AYUSH MOHAN DAS', '1609113033', 2, 1, 2, 0, 1),
(1714, '', 'DEEPA  CHOUDHARY', '1609113034', 2, 1, 2, 0, 1),
(1715, '', 'DEEPAK  UPADHYAY', '1609113035', 2, 1, 2, 0, 1),
(1716, '', 'DIKSHA  CHHABRA', '1609113036', 2, 1, 2, 0, 1),
(1717, '', 'DIVYA  RAI', '1609113037', 2, 1, 2, 0, 1),
(1718, '', 'DIVYANSH  SINGH', '1609113038', 2, 1, 2, 0, 1),
(1719, '', 'EBAD  HUSAIN', '1609113039', 2, 1, 2, 0, 1),
(1720, '', 'FARIHA  AKHTAR', '1609113040', 2, 1, 2, 0, 1),
(1721, '', 'GAURAV KUMAR YADAV', '1609113041', 2, 1, 2, 0, 1),
(1722, '', 'HARGOVIND SINGH ARORA', '1609113042', 2, 1, 2, 0, 1),
(1723, '', 'HARSH  KUMAR', '1609113043', 2, 1, 2, 0, 1),
(1724, '', 'HARSH KUMAR KASHERWA', '1609113044', 2, 1, 2, 0, 1),
(1725, '', 'HARSH PREET SINGH', '1609113045', 2, 1, 2, 0, 1),
(1726, '', 'HIMANSHU', '1609113046', 2, 1, 2, 0, 1),
(1727, '', 'HIMANSHU  SINGH', '1609113048', 2, 1, 2, 0, 1),
(1728, '', 'ISHNEET  KAUR', '1609113049', 2, 1, 2, 0, 1),
(1729, '', 'JATIN  VATS', '1609113050', 2, 1, 2, 0, 1),
(1730, '', 'KAMINI', '1609113052', 2, 1, 2, 0, 1),
(1731, '', 'KRISHNA  KANT', '1609113053', 2, 1, 2, 0, 1),
(1732, '', 'KRITIKA  SINGH', '1609113054', 2, 1, 2, 0, 1),
(1733, '', 'KUL GARIMA', '1609113055', 2, 1, 2, 0, 1),
(1734, '', 'KUNAL  SHARMA', '1609113056', 2, 1, 2, 0, 1),
(1735, '', 'KUNAL  VISHNOI', '1609113057', 2, 1, 2, 0, 1),
(1736, '', 'KUSHAGRA  CHAUHAN', '1609113058', 2, 1, 2, 0, 1),
(1737, '', 'MALIKA  GUPTA', '1609113059', 2, 1, 2, 0, 1),
(1738, '', 'MANAN  WADHWA', '1609113060', 2, 1, 2, 0, 1),
(1739, '', 'MANJEET  SINGH', '1609113061', 2, 1, 2, 0, 1),
(1740, '', 'MAYANK  CHAUHAN', '1609113062', 2, 1, 2, 0, 1),
(1741, '', 'NAINA  KAPIL', '1609113063', 2, 1, 2, 0, 1),
(1742, '', 'NAMAN  JAIN', '1609113064', 2, 1, 2, 0, 1),
(1743, '', 'NIKHIL  SINGH', '1609113066', 2, 1, 2, 0, 1),
(1744, '', 'NIMISHA  SHUKLA', '1609113067', 2, 1, 2, 0, 1),
(1745, '', 'NISHANT PRATAP SINGH', '1609113068', 2, 1, 2, 0, 1),
(1746, '', 'NISHANT  SINGH', '1609113069', 2, 1, 2, 0, 1),
(1747, '', 'NITISH  PANT', '1609113070', 2, 1, 2, 0, 1),
(1748, '', 'OCEAN  BHARDWAJ', '1609113071', 2, 1, 2, 0, 1),
(1749, '', 'PRAGYA  SINGH', '1609113073', 2, 1, 2, 0, 1),
(1750, '', 'PRAJJUWAL  VARSHNEY', '1609113074', 2, 1, 2, 0, 1);
INSERT INTO `jss_stud_list_17_18` (`jss_stud_id`, `adm_no`, `stud_name`, `roll_no`, `year`, `course_id`, `branch_id`, `form_fill`, `valid`) VALUES
(1751, '', 'PRANJAL  VAISH', '1609113075', 2, 1, 2, 0, 1),
(1752, '', 'PRAPTI  MOHAN', '1609113076', 2, 1, 2, 0, 1),
(1753, '', 'PRASHANT  SIKARWAR', '1609113078', 2, 1, 2, 0, 1),
(1754, '', 'PRATEEK  MALIK', '1609113080', 2, 1, 2, 0, 1),
(1755, '', 'PRIYAM  OMER', '1609113081', 2, 1, 2, 0, 1),
(1756, '', 'PULKIT  AGARWAL', '1609113083', 2, 1, 2, 0, 1),
(1757, '', 'RAHUL  SINGH', '1609113084', 2, 1, 2, 0, 1),
(1758, '', 'RAJA  YADAV', '1609113085', 2, 1, 2, 0, 1),
(1759, '', 'RAKSHIT  SACHAN', '1609113086', 2, 1, 2, 0, 1),
(1760, '', 'REETESH KUMAR MISHRA', '1609113087', 2, 1, 2, 0, 1),
(1761, '', 'RISHABH  VERMA', '1609113088', 2, 1, 2, 0, 1),
(1762, '', 'RISHEIK  DHIR', '1609113089', 2, 1, 2, 0, 1),
(1763, '', 'ROHIT  NEGI', '1609113090', 2, 1, 2, 0, 1),
(1764, '', 'SAGAR  KUMAR', '1609113091', 2, 1, 2, 0, 1),
(1765, '', 'SAGAR VERMA', '1609113092', 2, 1, 2, 0, 1),
(1766, '', 'SAKSHAM  GARG', '1609113093', 2, 1, 2, 0, 1),
(1767, '', 'SAKSHI  GAUTAM', '1609113094', 2, 1, 2, 0, 1),
(1768, '', 'SAKSHI  GUPTA', '1609113095', 2, 1, 2, 0, 1),
(1769, '', 'SANCHIT  GARG', '1609113096', 2, 1, 2, 0, 1),
(1770, '', 'SANCHIT SINGH RAWAT', '1609113097', 2, 1, 2, 0, 1),
(1771, '', 'SARTHAK  SINGH', '1609113098', 2, 1, 2, 0, 1),
(1772, '', 'SATYAM  PANDEY', '1609113099', 2, 1, 2, 0, 1),
(1773, '', 'SAURABH  SINGH', '1609113100', 2, 1, 2, 0, 1),
(1774, '', 'SHAILENDRA  KUMAR', '1609113101', 2, 1, 2, 0, 1),
(1775, '', 'SHASHANK  JAIN', '1609113102', 2, 1, 2, 0, 1),
(1776, '', 'SHINJAN  SENGAR', '1609113103', 2, 1, 2, 0, 1),
(1777, '', 'SHIVAM  MISHRA', '1609113104', 2, 1, 2, 0, 1),
(1778, '', 'SHIVAM SINGH RATHAUR', '1609113105', 2, 1, 2, 0, 1),
(1779, '', 'SHRUTI  DHAKARWAL', '1609113108', 2, 1, 2, 0, 1),
(1780, '', 'SHUBHAM  AGGARWAL', '1609113109', 2, 1, 2, 0, 1),
(1781, '', 'SHUBHAM  SHARMA', '1609113110', 2, 1, 2, 0, 1),
(1782, '', 'SHUBHAM  SINGH', '1609113111', 2, 1, 2, 0, 1),
(1783, '', 'SIDDHARTH  AGARWAL', '1609113112', 2, 1, 2, 0, 1),
(1784, '', 'SPARSH  RAJ', '1609113113', 2, 1, 2, 0, 1),
(1785, '', 'SUNIL  KUMAR', '1609113114', 2, 1, 2, 0, 1),
(1786, '', 'SYED MD FARHAN', '1609113115', 2, 1, 2, 0, 1),
(1787, '', 'TANVI  GUPTA', '1609113116', 2, 1, 2, 0, 1),
(1788, '', 'TUSHAR  AHUJA', '1609113117', 2, 1, 2, 0, 1),
(1789, '', 'UJJAWAL  JAIN', '1609113118', 2, 1, 2, 0, 1),
(1790, '', 'UTKARSH  JAIN', '1609113119', 2, 1, 2, 0, 1),
(1791, '', 'UTPAL  MISHRA', '1609113120', 2, 1, 2, 0, 1),
(1792, '', 'VAIBHAV  JAIN', '1609113121', 2, 1, 2, 0, 1),
(1793, '', 'VAIBHAV  SINHA', '1609113122', 2, 1, 2, 0, 1),
(1794, '', 'VAKSHAR  JAIN', '1609113123', 2, 1, 2, 0, 1),
(1795, '', 'VASU  MEHRA', '1609113124', 2, 1, 2, 0, 1),
(1796, '', 'VISHWAMITRA  \nADALATWALE', '1609113125', 2, 1, 2, 0, 1),
(1797, '', 'YATIN  ANAND', '1609113126', 2, 1, 2, 0, 1),
(1798, '', 'SHRAIYA VERMA', '1609100110', 2, 1, 2, 0, 1),
(1799, '', 'SHAILAZA DUBEY', '1609121050', 2, 1, 2, 0, 1),
(1800, '', 'ARPIT GUPTA', '1609131037', 2, 1, 2, 0, 1),
(1801, '', 'ABHINAV SRIVASTAVA', '1609120006', 2, 1, 2, 0, 1),
(1802, '17DLIT002', 'VIVEK RANA', '', 2, 1, 2, 0, 1),
(1803, '17DLIT003', 'UJJWAL GUPTA', '', 2, 1, 2, 0, 1),
(1804, '17DLIT004', 'GEETANJALI MANRAL', '', 2, 1, 2, 0, 1),
(1805, '17DLIT005', 'NIHAR RASTOGI', '', 2, 1, 2, 0, 1),
(1806, '17DLIT006', 'RUPANSHU SAHEB', '', 2, 1, 2, 0, 1),
(1807, '17DLIT007', 'SANKALP SHUKLA', '', 2, 1, 2, 0, 1),
(1808, '17DLIT008', 'RISHABH MITTAL', '', 2, 1, 2, 0, 1),
(1809, '17DLIT009', 'RAJAT SHARMA', '', 2, 1, 2, 0, 1),
(1810, '17DLIT010', 'MAAZ AHMAD SIDDIQUI', '', 2, 1, 2, 0, 1),
(1811, '', 'RAJAT MANI TRIPATHI', '1509110084', 2, 1, 1, 0, 1),
(1812, '', 'ANMOL MOZA', '1509110024', 2, 1, 1, 0, 1),
(1813, '', 'AKHAND PRATAP \nSINGH', '1509110014', 2, 1, 1, 0, 1),
(1814, '', 'AABHIJATYA  \nSOMVANSHI', '1609110001', 2, 1, 1, 0, 1),
(1815, '', 'ABHISHEK  AGRAWAL', '1609110002', 2, 1, 1, 0, 1),
(1816, '', 'ABHISHEK  GUPTA', '1609110003', 2, 1, 1, 0, 1),
(1817, '', 'ABHISHEK KANSAL', '1609110004', 2, 1, 1, 0, 1),
(1818, '', 'ABHISHEK  SHUKLA', '1609110005', 2, 1, 1, 0, 1),
(1819, '', 'ABHISHEK  SINGH', '1609110006', 2, 1, 1, 0, 1),
(1820, '', 'AKASHDEEP  SINGH', '1609110007', 2, 1, 1, 0, 1),
(1821, '', 'AKSHIT  GOEL', '1609110008', 2, 1, 1, 0, 1),
(1822, '', 'AMAN  AGRAWAL', '1609110009', 2, 1, 1, 0, 1),
(1823, '', 'AMIT SIKARWAR', '1609110010', 2, 1, 1, 0, 1),
(1824, '', 'AMITESH  AGRAHARI', '1609110011', 2, 1, 1, 0, 1),
(1825, '', 'ANIKET  NAMDEO', '1609110012', 2, 1, 1, 0, 1),
(1826, '', 'ANIL EMIL NAMBIAR', '1609110013', 2, 1, 1, 0, 1),
(1827, '', 'ANKIT GAUTAM', '1609110014', 2, 1, 1, 0, 1),
(1828, '', 'ANKIT KUMAR GOEL', '1609110015', 2, 1, 1, 0, 1),
(1829, '', 'ANKIT  MISHRA', '1609110016', 2, 1, 1, 0, 1),
(1830, '', 'ANKUR  AGARWAL', '1609110017', 2, 1, 1, 0, 1),
(1831, '', 'ANMOL  GUPTA', '1609110018', 2, 1, 1, 0, 1),
(1832, '', 'ANTJA PANDEY', '1609110019', 2, 1, 1, 0, 1),
(1833, '', 'ANUBHAV  TYAGI', '1609110020', 2, 1, 1, 0, 1),
(1834, '', 'ANUJ  PATHAK', '1609110021', 2, 1, 1, 0, 1),
(1835, '', 'ANURAG  SACHDEVA', '1609110022', 2, 1, 1, 0, 1),
(1836, '', 'APOORV BHATI', '1609110023', 2, 1, 1, 0, 1),
(1837, '', 'ARCHIT  KAUSHIK', '1609110024', 2, 1, 1, 0, 1),
(1838, '', 'ARUSHI  KAITHWAR', '1609110025', 2, 1, 1, 0, 1),
(1839, '', 'ASAD  HAMID', '1609110026', 2, 1, 1, 0, 1),
(1840, '', 'ASHISH KUMAR', '1609110027', 2, 1, 1, 0, 1),
(1841, '', 'ASHISH KUMAR SINGH', '1609110028', 2, 1, 1, 0, 1),
(1842, '', 'ATISHAYA  JAIN', '1609110029', 2, 1, 1, 0, 1),
(1843, '', 'ATUL  KAUSHIK', '1609110030', 2, 1, 1, 0, 1),
(1844, '', 'ATUL  KUMAR', '1609110031', 2, 1, 1, 0, 1),
(1845, '', 'AYUSH KUMAR VERMA', '1609110032', 2, 1, 1, 0, 1),
(1846, '', 'AYUSH  SRIVASTAVA', '1609110033', 2, 1, 1, 0, 1),
(1847, '', 'CHITRANGAD  SINGH', '1609110034', 2, 1, 1, 0, 1),
(1848, '', 'DEEPAK  SINGH', '1609110035', 2, 1, 1, 0, 1),
(1849, '', 'DEVESH  CHAUDHARY', '1609110036', 2, 1, 1, 0, 1),
(1850, '', 'DHARAMVEER  SINGH', '1609110037', 2, 1, 1, 0, 1),
(1851, '', 'DHRUV  TYAGI', '1609110038', 2, 1, 1, 0, 1),
(1852, '', 'DHRUV  CHAUHAN', '1609110039', 2, 1, 1, 0, 1),
(1853, '', 'DIVYA  PANT', '1609110040', 2, 1, 1, 0, 1),
(1854, '', 'DIVYA  VERMA', '1609110041', 2, 1, 1, 0, 1),
(1855, '', 'DIVYANSHU  AGRAWAL', '1609110042', 2, 1, 1, 0, 1),
(1856, '', 'ESHA  YADAV', '1609110043', 2, 1, 1, 0, 1),
(1857, '', 'GARIMA  TYAGI', '1609110044', 2, 1, 1, 0, 1),
(1858, '', 'GAURANGI AGRAWAL', '1609110045', 2, 1, 1, 0, 1),
(1859, '', 'HARIMANGAL  PANDEY', '1609110046', 2, 1, 1, 0, 1),
(1860, '', 'HARSH  OJHA', '1609110047', 2, 1, 1, 0, 1),
(1861, '', 'HARSHIT  JAISWAL', '1609110048', 2, 1, 1, 0, 1),
(1862, '', 'ISHAAN  GUPTA', '1609110049', 2, 1, 1, 0, 1),
(1863, '', 'JYOTIRADITYA  SINGH', '1609110050', 2, 1, 1, 0, 1),
(1864, '', 'KRITI  AGRAWAL', '1609110051', 2, 1, 1, 0, 1),
(1865, '', 'KSHITIZ  POSWAL', '1609110052', 2, 1, 1, 0, 1),
(1866, '', 'KUMAR DIVYANSHU', '1609110053', 2, 1, 1, 0, 1),
(1867, '', 'KUNAL  TEJIYAN', '1609110054', 2, 1, 1, 0, 1),
(1868, '', 'KUSHAGRA  BHARDWAJ', '1609110055', 2, 1, 1, 0, 1),
(1869, '', 'MADHAV  GUPTA', '1609110056', 2, 1, 1, 0, 1),
(1870, '', 'MARUTI NANDAN SINGH', '1609110057', 2, 1, 1, 0, 1),
(1871, '', 'MAYUR  BHAGWANI', '1609110059', 2, 1, 1, 0, 1),
(1872, '', 'MEGHNA', '1609110060', 2, 1, 1, 0, 1),
(1873, '', 'MITALI  KALYAN', '1609110061', 2, 1, 1, 0, 1),
(1874, '', 'MITANSHA  AGRAWAL', '1609110062', 2, 1, 1, 0, 1),
(1875, '', 'MOHAMMED  SHAYAN', '1609110063', 2, 1, 1, 0, 1),
(1876, '', 'MOHD  ANAS', '1609110064', 2, 1, 1, 0, 1),
(1877, '', 'MOHIT  GAUTAM', '1609110065', 2, 1, 1, 0, 1),
(1878, '', 'MOHIT  GUPTA', '1609110066', 2, 1, 1, 0, 1),
(1879, '', 'NEELKANTH  TRIPATHI', '1609110067', 2, 1, 1, 0, 1),
(1880, '', 'PARAS  WALIA', '1609110068', 2, 1, 1, 0, 1),
(1881, '', 'PAWAN  SONI', '1609110069', 2, 1, 1, 0, 1),
(1882, '', 'PIYUSH  SACHAN', '1609110070', 2, 1, 1, 0, 1),
(1883, '', 'PRAFUL  GOYAL', '1609110071', 2, 1, 1, 0, 1),
(1884, '', 'PRAGATI  SHARMA', '1609110072', 2, 1, 1, 0, 1),
(1885, '', 'PRAIRIT  VERMA', '1609110073', 2, 1, 1, 0, 1),
(1886, '', 'PRANJUL KUMAR SINGH', '1609110074', 2, 1, 1, 0, 1),
(1887, '', 'PRATEEK  CHAUDHARY', '1609110075', 2, 1, 1, 0, 1),
(1888, '', 'RACHIT  JAIN', '1609110076', 2, 1, 1, 0, 1),
(1889, '', 'RAJAT  YADAV', '1609110077', 2, 1, 1, 0, 1),
(1890, '', 'RAJIV  KUMAR', '1609110078', 2, 1, 1, 0, 1),
(1891, '', 'RAJKUMAR', '1609110079', 2, 1, 1, 0, 1),
(1892, '', 'RAKSHA  R', '1609110080', 2, 1, 1, 0, 1),
(1893, '', 'RENALKA  KHAN', '1609110081', 2, 1, 1, 0, 1),
(1894, '', 'RENUKA  SAINI', '1609110082', 2, 1, 1, 0, 1),
(1895, '', 'RISHABH  MITTAL', '1609110084', 2, 1, 1, 0, 1),
(1896, '', 'RITIK  GUPTA', '1609110085', 2, 1, 1, 0, 1),
(1897, '', 'RIYA  GUPTA', '1609110087', 2, 1, 1, 0, 1),
(1898, '', 'ROBIN  SINGH', '1609110088', 2, 1, 1, 0, 1),
(1899, '', 'ROHIT  JAKHMOLA', '1609110089', 2, 1, 1, 0, 1),
(1900, '', 'SACHIN  KAPOOR', '1609110090', 2, 1, 1, 0, 1),
(1901, '', 'SAI  ZUTSHI', '1609110091', 2, 1, 1, 0, 1),
(1902, '', 'SANSRITI  MISHRA', '1609110092', 2, 1, 1, 0, 1),
(1903, '', 'SARTHAK  VASHISTHA', '1609110093', 2, 1, 1, 0, 1),
(1904, '', 'SAURABH  CHANDRA', '1609110095', 2, 1, 1, 0, 1),
(1905, '', 'SAURABH  GUPTA', '1609110096', 2, 1, 1, 0, 1),
(1906, '', 'SAURABH SINGH \nKAKRAN', '1609110097', 2, 1, 1, 0, 1),
(1907, '', 'SHANTANU  PANDEY', '1609110098', 2, 1, 1, 0, 1),
(1908, '', 'SHIVAM  GUPTA', '1609110099', 2, 1, 1, 0, 1),
(1909, '', 'SHIVANGI  KUMAR', '1609110100', 2, 1, 1, 0, 1),
(1910, '', 'SHIVI  CHAUHAN', '1609110101', 2, 1, 1, 0, 1),
(1911, '', 'SHRAYANSH', '1609110102', 2, 1, 1, 0, 1),
(1912, '', 'SHUBHAM  RAJ', '1609110103', 2, 1, 1, 0, 1),
(1913, '', 'SHUBHAM  RATHOR', '1609110104', 2, 1, 1, 0, 1),
(1914, '', 'SHUBHANGI  PANDEY', '1609110105', 2, 1, 1, 0, 1),
(1915, '', 'SHUBHANKAR  SAXENA', '1609110106', 2, 1, 1, 0, 1),
(1916, '', 'SHUBHRA  AGGARWAL', '1609110107', 2, 1, 1, 0, 1),
(1917, '', 'SIDDHARTH  VASHISTHA', '1609110108', 2, 1, 1, 0, 1),
(1918, '', 'SIDDHARTHA  YADAV', '1609110109', 2, 1, 1, 0, 1),
(1919, '', 'SONU KUMAR SAH', '1609110110', 2, 1, 1, 0, 1),
(1920, '', 'SPARSH SINGH RATHORE', '1609110111', 2, 1, 1, 0, 1),
(1921, '', 'SUMEDH  BHASKAR', '1609110112', 2, 1, 1, 0, 1),
(1922, '', 'SUPRIYA  SINGH', '1609110113', 2, 1, 1, 0, 1),
(1923, '', 'SURAJ  TRIPATHI', '1609110114', 2, 1, 1, 0, 1),
(1924, '', 'TUSHAR  PEGWAL', '1609110115', 2, 1, 1, 0, 1),
(1925, '', 'UTKARSH  DANGREE', '1609110117', 2, 1, 1, 0, 1),
(1926, '', 'UTKARSH  SRIVASTAVA', '1609110118', 2, 1, 1, 0, 1),
(1927, '', 'VAIBHAV  TYAGI', '1609110119', 2, 1, 1, 0, 1),
(1928, '', 'VANDANA  GUPTA', '1609110120', 2, 1, 1, 0, 1),
(1929, '', 'VARUN  SINGH', '1609110121', 2, 1, 1, 0, 1),
(1930, '', 'VIDUSHI  JAIN', '1609110122', 2, 1, 1, 0, 1),
(1931, '', 'YASH  SARASWAT', '1609110123', 2, 1, 1, 0, 1),
(1932, '', 'YOGESH CHANDRA \nMISHRA', '1609110125', 2, 1, 1, 0, 1),
(1933, '17DLCS001', 'ARCHIT KUMAR DWEVEDI', '', 2, 1, 1, 0, 1),
(1934, '17DLCS002', 'AHMAD  NAIM', '', 2, 1, 1, 0, 1),
(1935, '17DLCS003', 'ASMIT  KULSHRESHTHA', '', 2, 1, 1, 0, 1),
(1936, '17DLCS004', 'PRATIBHA  CHAURASIA', '', 2, 1, 1, 0, 1),
(1937, '17DLCS005', 'ABHISHEK  VERMA', '', 2, 1, 1, 0, 1),
(1938, '17DLCS006', 'UTKARSH TIWARI', '', 2, 1, 1, 0, 1),
(1939, '17DLCS007', 'EKESH  TAYAL', '', 2, 1, 1, 0, 1),
(1940, '17DLCS008', 'VIKAS  UPADHYAY', '', 2, 1, 1, 0, 1),
(1941, '17DLCS009', 'UJJWAL  GUPTA', '', 2, 1, 1, 0, 1),
(1942, '17DLCS010', 'VISHAWJEET ANAND', '', 2, 1, 1, 0, 1),
(1943, '17DLCS011', 'SHAURYA VARDHAN SINGH', '', 2, 1, 1, 0, 1),
(1944, '17DLCS012', 'YASHASVI  SRINET', '', 2, 1, 1, 0, 1),
(1945, '17DLCS013', 'SHAURYA RISHI VARSHNEY', '', 2, 1, 1, 0, 1),
(1946, '17DLCS014', 'ROHAN  KUMAR', '', 2, 1, 1, 0, 1),
(1947, '17DLCS015', 'AASHISH  NAYAK', '', 2, 1, 1, 0, 1),
(1948, '17DLCS016', 'MINAKSHI DEVI', '', 2, 1, 1, 0, 1),
(1949, '17DLCS017', 'PRIYA  SINGH', '', 2, 1, 1, 0, 1),
(1950, '17DLCS018', 'SHIVANKAR KUMAR SINGH', '', 2, 1, 1, 0, 1),
(1951, '17DLCS019', 'SANCHIT  VERMA', '', 2, 1, 1, 0, 1),
(1952, '17DLCS020', 'VAIBHAV  DAGAR', '', 2, 1, 1, 0, 1),
(1953, '17DLCS022', 'NIHAL  AHMAD', '', 2, 1, 1, 0, 1),
(1954, '17DLCS023', 'VIPIN KUMAR SHARMA', '', 2, 1, 1, 0, 1),
(1955, '17DLCS025', 'AYAAN  AHMED', '', 2, 1, 1, 0, 1),
(1956, '17DLCS026', 'SHUBHAM  SHUKLA', '', 2, 1, 1, 0, 1),
(1957, '17DLCS027', 'DEV VRAT SINGH', '', 2, 1, 1, 0, 1),
(1958, '17DLCS028', 'RAJAT  PANDEY', '', 2, 1, 1, 0, 1),
(1959, '17DLCS029', 'SHUBHAM  TYAGI', '', 2, 1, 1, 0, 1),
(1960, '17DLCS030', 'VINAY KUMAR PRASAD', '', 2, 1, 1, 0, 1),
(1961, '17DLCS031', 'LAKSHAY  PARASHAR', '', 2, 1, 1, 0, 1),
(1962, '17DLCS032', 'KHUSHBOO  YADAV', '', 2, 1, 1, 0, 1),
(1963, '', 'SHIVANI GUPTA', '1609113106', 2, 1, 1, 0, 1),
(1964, '', 'NANCY PODDAR', '1609113065', 2, 1, 1, 0, 1),
(1965, '', 'SHOBHIT AGARWAL', '1609113107', 2, 1, 1, 0, 1),
(1966, '', 'KAMAL MENGHANI', '1609113051', 2, 1, 1, 0, 1),
(1967, '', 'PRIYANKA RAJPUT', '1609113082', 2, 1, 1, 0, 1),
(1968, '', 'AYUSH PANWAR', '1509100030', 2, 1, 5, 0, 1),
(1969, '', 'VISHVESH PANDEY', '1509100122', 2, 1, 5, 0, 1),
(1970, '', 'ARUN KUMAR SINGH', '1509100025', 2, 1, 5, 0, 1),
(1971, '', 'MAYANK  BHATT', '1509100059', 2, 1, 5, 0, 1),
(1972, '', 'AAMIR HAFEEZ KHAN', '1609100001', 2, 1, 5, 0, 1),
(1973, '', 'ABDUL  MALIK', '1609100002', 2, 1, 5, 0, 1),
(1974, '', 'ABDUS  SAMI', '1609100003', 2, 1, 5, 0, 1),
(1975, '', 'ABHINAV  SINGH', '1609100004', 2, 1, 5, 0, 1),
(1976, '', 'ABHINAV  YADAV', '1609100005', 2, 1, 5, 0, 1),
(1977, '', 'ABHISHEK  MALL', '1609100006', 2, 1, 5, 0, 1),
(1978, '', 'ABHISHEK  SHARMA', '1609100007', 2, 1, 5, 0, 1),
(1979, '', 'ABHISHEK  SINGH', '1609100008', 2, 1, 5, 0, 1),
(1980, '', 'ADARSH KUMAR SINGH', '1609100009', 2, 1, 5, 0, 1),
(1981, '', 'ADESH PRATAP SINGH', '1609100010', 2, 1, 5, 0, 1),
(1982, '', 'ADITI  TRIPATHI', '1609100011', 2, 1, 5, 0, 1),
(1983, '', 'ADITYA  GUPTA', '1609100012', 2, 1, 5, 0, 1),
(1984, '', 'ADITYA  KUMAR', '1609100013', 2, 1, 5, 0, 1),
(1985, '', 'ADITYA  SAROJ', '1609100014', 2, 1, 5, 0, 1),
(1986, '', 'ADITYA  SINGH', '1609100015', 2, 1, 5, 0, 1),
(1987, '', 'AISHWARYA \nBHARDWAJ', '1609100016', 2, 1, 5, 0, 1),
(1988, '', 'AKARSH  JAIN', '1609100017', 2, 1, 5, 0, 1),
(1989, '', 'AKASH', '1609100018', 2, 1, 5, 0, 1),
(1990, '', 'ALOK KUMAR YADAV', '1609100020', 2, 1, 5, 0, 1),
(1991, '', 'AMAN  HAYARAN', '1609100021', 2, 1, 5, 0, 1),
(1992, '', 'AMIT  KUMAR', '1609100022', 2, 1, 5, 0, 1),
(1993, '', 'AMIT RANJAN YADAV', '1609100023', 2, 1, 5, 0, 1),
(1994, '', 'ANIKET  MISHRA', '1609100024', 2, 1, 5, 0, 1),
(1995, '', 'ANKIT  BHARTI', '1609100025', 2, 1, 5, 0, 1),
(1996, '', 'ANKIT KUMAR', '1609100026', 2, 1, 5, 0, 1),
(1997, '', 'ANMOL RANJAN KAUSHIK', '1609100027', 2, 1, 5, 0, 1),
(1998, '', 'ANOOP  SHARMA', '1609100028', 2, 1, 5, 0, 1),
(1999, '', 'ANUJ  VERMA', '1609100029', 2, 1, 5, 0, 1),
(2000, '', 'ANURAG  GAUTAM', '1609100030', 2, 1, 5, 0, 1),
(2001, '', 'ANURAG  PATHAK', '1609100031', 2, 1, 5, 0, 1),
(2002, '', 'ARPAN  GUPTA', '1609100032', 2, 1, 5, 0, 1),
(2003, '', 'ASHISH KUMAR GUPTA', '1609100033', 2, 1, 5, 0, 1),
(2004, '', 'ASHISH  SINGH', '1609100034', 2, 1, 5, 0, 1),
(2005, '', 'ASHISH  VERMA', '1609100035', 2, 1, 5, 0, 1),
(2006, '', 'ASHUTOSH KUMAR SINGH', '1609100036', 2, 1, 5, 0, 1),
(2007, '', 'ATUL PRATAP SINGH', '1609100038', 2, 1, 5, 0, 1),
(2008, '', 'AVINASH  SINGH', '1609100039', 2, 1, 5, 0, 1),
(2009, '', 'AYUSH  ANAND', '1609100040', 2, 1, 5, 0, 1),
(2010, '', 'DAKSH  KUMAR', '1609100041', 2, 1, 5, 0, 1),
(2011, '', 'DEEPAK  VISHWAKARMA', '1609100042', 2, 1, 5, 0, 1),
(2012, '', 'DEVANSH  DUBEY', '1609100043', 2, 1, 5, 0, 1),
(2013, '', 'DHIRENDRA NATH GUPTA', '1609100044', 2, 1, 5, 0, 1),
(2014, '', 'GARIMA  SINGH', '1609100046', 2, 1, 5, 0, 1),
(2015, '', 'GAURAV KUMAR SINGH', '1609100047', 2, 1, 5, 0, 1),
(2016, '', 'GOPAL', '1609100048', 2, 1, 5, 0, 1),
(2017, '', 'HANU KUMAR SINGH', '1609100049', 2, 1, 5, 0, 1),
(2018, '', 'HARESH  KUMAR', '1609100050', 2, 1, 5, 0, 1),
(2019, '', 'HARMIKA  PATEL', '1609100051', 2, 1, 5, 0, 1),
(2020, '', 'HARSHVARDHAN  SINGH', '1609100052', 2, 1, 5, 0, 1),
(2021, '', 'HIMANSHU  SINGH', '1609100054', 2, 1, 5, 0, 1),
(2022, '', 'KANHA  GARG', '1609100055', 2, 1, 5, 0, 1),
(2023, '', 'KARTIKEYA  RASTOGI', '1609100057', 2, 1, 5, 0, 1),
(2024, '', 'KASHISH RAJPUT', '1609100058', 2, 1, 5, 0, 1),
(2025, '', 'KAUSTUBH  AGRAWAL', '1609100059', 2, 1, 5, 0, 1),
(2026, '', 'KRISHNA  GAUTAM', '1609100060', 2, 1, 5, 0, 1),
(2027, '', 'KSHITIJ  GAUTAM', '1609100061', 2, 1, 5, 0, 1),
(2028, '', 'LAKSHYA SHRAWANKAR SINGH', '1609100062', 2, 1, 5, 0, 1),
(2029, '', 'LOKESH  RAWAT', '1609100063', 2, 1, 5, 0, 1),
(2030, '', 'MANAS  DANG', '1609100064', 2, 1, 5, 0, 1),
(2031, '', 'MANOJ KUMAR', '1609100065', 2, 1, 5, 0, 1),
(2032, '', 'MAYANK KUMAR MISHRA', '1609100066', 2, 1, 5, 0, 1),
(2033, '', 'MAYANK  RAWAT', '1609100067', 2, 1, 5, 0, 1),
(2034, '', 'MAYANK  SINGH', '1609100068', 2, 1, 5, 0, 1),
(2035, '', 'MOHAMMAD  TAMIM', '1609100069', 2, 1, 5, 0, 1),
(2036, '', 'MUKUL  UPADHAYAYA', '1609100070', 2, 1, 5, 0, 1),
(2037, '', 'NAGENDRA PRATAP VERMA', '1609100071', 2, 1, 5, 0, 1),
(2038, '', 'NANDKISHOR  SHARMA', '1609100072', 2, 1, 5, 0, 1),
(2039, '', 'NIKHIL  KUMAR', '1609100073', 2, 1, 5, 0, 1),
(2040, '', 'NIKHIL KUMAR SINGH', '1609100074', 2, 1, 5, 0, 1),
(2041, '', 'NITIN GARG', '1609100077', 2, 1, 5, 0, 1),
(2042, '', 'PRABHAV KUMAR PANDEY', '1609100078', 2, 1, 5, 0, 1),
(2043, '', 'PRAGATI  TYAGI', '1609100079', 2, 1, 5, 0, 1),
(2044, '', 'PRAKHAR  AGNIHOTRI', '1609100080', 2, 1, 5, 0, 1),
(2045, '', 'PRANAV  TRIPATHI', '1609100081', 2, 1, 5, 0, 1),
(2046, '', 'PRANJAL  PATHAK', '1609100082', 2, 1, 5, 0, 1),
(2047, '', 'PRASHANT YADAV', '1609100084', 2, 1, 5, 0, 1),
(2048, '', 'PRATYUSH  KUMAR', '1609100086', 2, 1, 5, 0, 1),
(2049, '', 'PRINCE  SIWACH', '1609100087', 2, 1, 5, 0, 1),
(2050, '', 'RAGHAV SEHGAL', '1609100088', 2, 1, 5, 0, 1),
(2051, '', 'RAHUL  SINGH', '1609100089', 2, 1, 5, 0, 1),
(2052, '', 'RAJAT KUMAR SINGH', '1609100090', 2, 1, 5, 0, 1),
(2053, '', 'RAKESH KUMAR PANDEY', '1609100091', 2, 1, 5, 0, 1),
(2054, '', 'RAMAN  KHATRI', '1609100092', 2, 1, 5, 0, 1),
(2055, '', 'RISHABH  KUMAR', '1609100093', 2, 1, 5, 0, 1),
(2056, '', 'RISHABH  TIWARI', '1609100094', 2, 1, 5, 0, 1),
(2057, '', 'SAKSHAM  RASTOGI', '1609100095', 2, 1, 5, 0, 1),
(2058, '', 'SANJEEV  TIWARI', '1609100096', 2, 1, 5, 0, 1),
(2059, '', 'SAURABH  RAO', '1609100098', 2, 1, 5, 0, 1),
(2060, '', 'SAURABH YADAV', '1609100099', 2, 1, 5, 0, 1),
(2061, '', 'SHARDUL  SINGH', '1609100100', 2, 1, 5, 0, 1),
(2062, '', 'SHASHANK  YADAV', '1609100101', 2, 1, 5, 0, 1),
(2063, '', 'SHAURYA  SHARMA', '1609100102', 2, 1, 5, 0, 1),
(2064, '', 'SHEKHAR PANDEY', '1609100103', 2, 1, 5, 0, 1),
(2065, '', 'SHIVA  YADAV', '1609100104', 2, 1, 5, 0, 1),
(2066, '', 'SHIVAM MISHRA', '1609100105', 2, 1, 5, 0, 1),
(2067, '', 'SHIVAM  SINGH', '1609100106', 2, 1, 5, 0, 1),
(2068, '', 'SHIVANI SINGH', '1609100107', 2, 1, 5, 0, 1),
(2069, '', 'SHIVANI  TRIPATHI', '1609100108', 2, 1, 5, 0, 1),
(2070, '', 'SHIWANSH  SINGH', '1609100109', 2, 1, 5, 0, 1),
(2071, '', 'SHUBHAM  SACHAN', '1609100111', 2, 1, 5, 0, 1),
(2072, '', 'SHUBHAM  SINGH', '1609100112', 2, 1, 5, 0, 1),
(2073, '', 'SHUBHAM  SINGH', '1609100113', 2, 1, 5, 0, 1),
(2074, '', 'SPARSH  KAPOOR', '1609100114', 2, 1, 5, 0, 1),
(2075, '', 'SUMAN  YADAV', '1609100115', 2, 1, 5, 0, 1),
(2076, '', 'SURAJ  TYAGI', '1609100116', 2, 1, 5, 0, 1),
(2077, '', 'SWAPNIL  PATERIYA', '1609100117', 2, 1, 5, 0, 1),
(2078, '', 'VIKAS KUMAR SHARMA', '1609100118', 2, 1, 5, 0, 1),
(2079, '', 'VIKAS KUMAR SINGH', '1609100119', 2, 1, 5, 0, 1),
(2080, '', 'VISHWAJEET  SONKAR', '1609100120', 2, 1, 5, 0, 1),
(2081, '', 'VIVEK KUMAR JHA', '1609100121', 2, 1, 5, 0, 1),
(2082, '', 'YASH  PRAKASH', '1609100122', 2, 1, 5, 0, 1),
(2083, '17DLCE001', 'SIDDHANT  TOMAR', '', 2, 1, 5, 0, 1),
(2084, '17DLCE002', 'MANEESH  YADAV', '', 2, 1, 5, 0, 1),
(2085, '17DLCE003', 'KARAM JEET SINGH', '', 2, 1, 5, 0, 1),
(2086, '17DLCE004', 'AKHAND PRATAP MITRA', '', 2, 1, 5, 0, 1),
(2087, '17DLCE005', 'SAURABH  KUMAR', '', 2, 1, 5, 0, 1),
(2088, '17DLCE006', 'SHRUTI DWIVEDI', '', 2, 1, 5, 0, 1),
(2089, '17DLCE007', 'GAUTAM', '', 2, 1, 5, 0, 1),
(2090, '17DLCE008', 'TARUN  MISHRA', '', 2, 1, 5, 0, 1),
(2091, '17DLCE009', 'SAAD BIN NAJAM', '', 2, 1, 5, 0, 1),
(2092, '17DLCE010', 'WAQUAR AHMAD ANSARI', '', 2, 1, 5, 0, 1),
(2093, '17DLCE011', 'AMAN  FAROOQ', '', 2, 1, 5, 0, 1),
(2094, '17DLCE012', 'MOHIT  SINGH', '', 2, 1, 5, 0, 1),
(2095, '17DLCE013', 'SHRUTI  AGARWAL', '', 2, 1, 5, 0, 1),
(2096, '17DLCE014', 'DEEPANKAL  SINGH', '', 2, 1, 5, 0, 1),
(2097, '17DLCE015', 'PRATIK KUMAR DUBEY', '', 2, 1, 5, 0, 1),
(2098, '17DLCE016', 'HIMANSHI', '', 2, 1, 5, 0, 1),
(2099, '17DLCE017', 'ANURAG  KUMAR', '', 2, 1, 5, 0, 1),
(2100, '17DLCE018', 'HIMANSHU  SINGH', '', 2, 1, 5, 0, 1),
(2101, '17DLCE019', 'ARAVIND KUMAR YADAV', '', 2, 1, 5, 0, 1),
(2102, '17DLCE020', 'AMAN  KUMAR', '', 2, 1, 5, 0, 1),
(2103, '17DLCE021', 'ARUN KUMAR RAM', '', 2, 1, 5, 0, 1),
(2104, '17DLCE022', 'RAJAT  BHARDWAJ', '', 2, 1, 5, 0, 1),
(2105, '17DLCE023', 'ANURAG  RAI', '', 2, 1, 5, 0, 1),
(2106, '', 'ABHISHEK SINGH', '1609131008', 2, 1, 5, 0, 1),
(2107, '', 'SHIVANGI RAJPUT', '1609140143', 2, 1, 5, 0, 1),
(2108, '', 'MANISH SAHAI', '1609120053', 2, 1, 5, 0, 1),
(2109, '', 'SAURABH KUMAR', '1509100920', 3, 1, 5, 0, 1),
(2110, '', 'GARIMA RAMWANI', '1409100040', 3, 1, 5, 0, 1),
(2111, '', 'AAYUSH PRASHAR', '1509100001', 3, 1, 5, 0, 1),
(2112, '', 'ABDUL HAQUE', '1509100002', 3, 1, 5, 0, 1),
(2113, '', 'ABDUL MAABOOD AHMAD', '1509100003', 3, 1, 5, 0, 1),
(2114, '', 'ABHAY KUMAR YADAV', '1509100004', 3, 1, 5, 0, 1),
(2115, '', 'ABHIJEET KUMAR DUBEY', '1509100005', 3, 1, 5, 0, 1),
(2116, '', 'ABHISHEK KUMAR', '1509100006', 3, 1, 5, 0, 1),
(2117, '', 'ABHISHEK YADAV', '1509100007', 3, 1, 5, 0, 1),
(2118, '', 'ADARSH KUMAR SINGH', '1509100008', 3, 1, 5, 0, 1),
(2119, '', 'ADITYA KUMAR SINGH', '1509100009', 3, 1, 5, 0, 1),
(2120, '', 'ADITYA RAWAT', '1509100010', 3, 1, 5, 0, 1),
(2121, '', 'ADITYA SINGH', '1509100011', 3, 1, 5, 0, 1),
(2122, '', 'AJAY KUMAR RATHORE', '1509100012', 3, 1, 5, 0, 1),
(2123, '', 'AKASH DHIMAN', '1509100013', 3, 1, 5, 0, 1),
(2124, '', 'AKSHAT UPADHYAY', '1509100014', 3, 1, 5, 0, 1),
(2125, '', 'AMAN KAUSHIK', '1509100015', 3, 1, 5, 0, 1),
(2126, '', 'AMIT KUMAR SINGH', '1509100016', 3, 1, 5, 0, 1),
(2127, '', 'ANKIT KUMAR', '1509100017', 3, 1, 5, 0, 1),
(2128, '', 'ANMOL CHOUDHARY', '1509100018', 3, 1, 5, 0, 1),
(2129, '', 'ANUJ KUMAR MAHOR', '1509100019', 3, 1, 5, 0, 1),
(2130, '', 'ANUPRIYA SINGH', '1509100020', 3, 1, 5, 0, 1),
(2131, '', 'ANURAG AGARWAL', '1509100021', 3, 1, 5, 0, 1),
(2132, '', 'ANURAG SINGH', '1509100022', 3, 1, 5, 0, 1),
(2133, '', 'ARPIT SHARMA', '1509100023', 3, 1, 5, 0, 1),
(2134, '', 'ARPIT SINGHAL', '1509100024', 3, 1, 5, 0, 1),
(2135, '', 'ASHISH ARORA', '1509100026', 3, 1, 5, 0, 1),
(2136, '', 'ATUL CHAUDHARY', '1509100027', 3, 1, 5, 0, 1),
(2137, '', 'AYUSH AGARWAL', '1509100028', 3, 1, 5, 0, 1),
(2138, '', 'AYUSH KUMAR', '1509100029', 3, 1, 5, 0, 1),
(2139, '', 'AYUSHMAN DUBEY', '1509100031', 3, 1, 5, 0, 1),
(2140, '', 'BHANU PRATAP SRIVASTAVA', '1509100032', 3, 1, 5, 0, 1),
(2141, '', 'BHANU PRIYA', '1509100033', 3, 1, 5, 0, 1),
(2142, '', 'BHARAT NARESH PRAJAPATI', '1509100034', 3, 1, 5, 0, 1),
(2143, '', 'BHARAT TYAGI', '1509100035', 3, 1, 5, 0, 1),
(2144, '', 'BHAVYA SHRIVASTAVA', '1509100036', 3, 1, 5, 0, 1),
(2145, '', 'DARAIN KHAN', '1509100037', 3, 1, 5, 0, 1),
(2146, '', 'DEEPAK KUMAR SONKAR', '1509100038', 3, 1, 5, 0, 1),
(2147, '', 'DIVYA YADAV', '1509100039', 3, 1, 5, 0, 1),
(2148, '', 'DIVYANSH SHISHODIA', '1509100040', 3, 1, 5, 0, 1),
(2149, '', 'FALAK SINGH JARAULIA', '1509100041', 3, 1, 5, 0, 1),
(2150, '', 'G KOMAL', '1509100042', 3, 1, 5, 0, 1),
(2151, '', 'GANESHADITYA YADAV', '1509100043', 3, 1, 5, 0, 1),
(2152, '', 'GAURAV YADAV', '1509100044', 3, 1, 5, 0, 1),
(2153, '', 'HARSH VARDHAN SHAHI', '1509100046', 3, 1, 5, 0, 1),
(2154, '', 'HARSHUL AGARWAL', '1509100048', 3, 1, 5, 0, 1),
(2155, '', 'JAHANVI', '1509100049', 3, 1, 5, 0, 1),
(2156, '', 'JITENDRA YADAV', '1509100050', 3, 1, 5, 0, 1),
(2157, '', 'KARTIK VISHWAKARMA', '1509100051', 3, 1, 5, 0, 1),
(2158, '', 'KRISHAN KUMAR SINGH', '1509100052', 3, 1, 5, 0, 1),
(2159, '', 'KULDEEP KUMAR', '1509100054', 3, 1, 5, 0, 1),
(2160, '', 'KUMAR SHIKHAR', '1509100055', 3, 1, 5, 0, 1),
(2161, '', 'LAVANSHU BAGRI', '1509100056', 3, 1, 5, 0, 1),
(2162, '', 'MANEESH KUMAR SONKER', '1509100057', 3, 1, 5, 0, 1),
(2163, '', 'MANVENDRA SINGH', '1509100058', 3, 1, 5, 0, 1),
(2164, '', 'MOHAMMAD NADEEM', '1509100060', 3, 1, 5, 0, 1),
(2165, '', 'MOHAMMAD RIZWAN KHAN', '1509100061', 3, 1, 5, 0, 1),
(2166, '', 'MUDIT CHATURVEDI', '1509100062', 3, 1, 5, 0, 1),
(2167, '', 'NAVEEN KUMAR DAS', '1509100063', 3, 1, 5, 0, 1),
(2168, '', 'NEELESH SRIVASTAVA', '1509100064', 3, 1, 5, 0, 1),
(2169, '', 'NISHANT SAHU', '1509100065', 3, 1, 5, 0, 1),
(2170, '', 'NISHANT THAKUR', '1509100066', 3, 1, 5, 0, 1),
(2171, '', 'PAURUSH SINGH', '1509100067', 3, 1, 5, 0, 1),
(2172, '', 'PRABHAT CHATURVEDI', '1509100068', 3, 1, 5, 0, 1),
(2173, '', 'PRABHAT YADAV', '1509100069', 3, 1, 5, 0, 1),
(2174, '', 'PRAJJWAL ARYA', '1509100070', 3, 1, 5, 0, 1),
(2175, '', 'PRANSHU SHUBHAM KUMAR', '1509100072', 3, 1, 5, 0, 1),
(2176, '', 'PRASHANT BAISOYA', '1509100073', 3, 1, 5, 0, 1),
(2177, '', 'PRASHANT RAI', '1509100074', 3, 1, 5, 0, 1),
(2178, '', 'PRASHANT SONI', '1509100075', 3, 1, 5, 0, 1),
(2179, '', 'PRAVEEN DWIVEDI', '1509100076', 3, 1, 5, 0, 1),
(2180, '', 'PRIYANSHU CHAUDHARI', '1509100077', 3, 1, 5, 0, 1),
(2181, '', 'RAHUL GUPTA', '1509100078', 3, 1, 5, 0, 1),
(2182, '', 'RAHUL RAJ YADAV', '1509100079', 3, 1, 5, 0, 1),
(2183, '', 'RAJNEESH KUMAR VERMA', '1509100080', 3, 1, 5, 0, 1),
(2184, '', 'RAVI YADAV', '1509100081', 3, 1, 5, 0, 1),
(2185, '', 'RIPUDAMAN DUBEY', '1509100082', 3, 1, 5, 0, 1),
(2186, '', 'RISHABH SAGAR', '1509100084', 3, 1, 5, 0, 1),
(2187, '', 'RISHABH SINGH', '1509100085', 3, 1, 5, 0, 1),
(2188, '', 'RISHI VASHISHT', '1509100086', 3, 1, 5, 0, 1),
(2189, '', 'RITIK KUMAR SRIVASTAVA', '1509100087', 3, 1, 5, 0, 1),
(2190, '', 'SAGAR GUPTA', '1509100088', 3, 1, 5, 0, 1),
(2191, '', 'SAGAR VERMA', '1509100089', 3, 1, 5, 0, 1),
(2192, '', 'SAHIL KASANA', '1509100091', 3, 1, 5, 0, 1),
(2193, '', 'SAKSHI SINGH', '1509100092', 3, 1, 5, 0, 1),
(2194, '', 'SATYAM VERMA', '1509100093', 3, 1, 5, 0, 1),
(2195, '', 'SAURABH CHAURASIA', '1509100094', 3, 1, 5, 0, 1),
(2196, '', 'SAURABH PANDEY', '1509100095', 3, 1, 5, 0, 1),
(2197, '', 'SHAHRUKH KHAN', '1509100096', 3, 1, 5, 0, 1),
(2198, '', 'SHAILENDRA PRATAP SINGH', '1509100097', 3, 1, 5, 0, 1),
(2199, '', 'SHANTANU MALHARIA', '1509100098', 3, 1, 5, 0, 1),
(2200, '', 'SHIVA VERMA', '1509100099', 3, 1, 5, 0, 1),
(2201, '', 'SHIVAKANT TIWARI', '1509100100', 3, 1, 5, 0, 1),
(2202, '', 'SHIVAM PACHAURI', '1509100102', 3, 1, 5, 0, 1),
(2203, '', 'SHIVIKA PATEL', '1509100104', 3, 1, 5, 0, 1),
(2204, '', 'SHLOK GAUTAM', '1509100105', 3, 1, 5, 0, 1),
(2205, '', 'SHRUTI SINGH', '1509100106', 3, 1, 5, 0, 1),
(2206, '', 'SHUBAM GUPTA', '1509100107', 3, 1, 5, 0, 1),
(2207, '', 'SHUBHAM GUPTA', '1509100108', 3, 1, 5, 0, 1),
(2208, '', 'SHUBHAM KASANA', '1509100109', 3, 1, 5, 0, 1),
(2209, '', 'SRISHTI SINGH', '1509100110', 3, 1, 5, 0, 1),
(2210, '', 'SRISHTI YADUVANSHI', '1509100111', 3, 1, 5, 0, 1),
(2211, '', 'SUNAKSHI AWASTHI', '1509100112', 3, 1, 5, 0, 1),
(2212, '', 'SURAJ TOMAR', '1509100113', 3, 1, 5, 0, 1),
(2213, '', 'SURAJ YADAV', '1509100114', 3, 1, 5, 0, 1),
(2214, '', 'SWAPNIL ANAND', '1509100115', 3, 1, 5, 0, 1),
(2215, '', 'TEJENDRA SINGH', '1509100116', 3, 1, 5, 0, 1),
(2216, '', 'UTKARSH KESHARI', '1509100117', 3, 1, 5, 0, 1),
(2217, '', 'VAIBHAV JE SRIVASTAVA', '1509100118', 3, 1, 5, 0, 1),
(2218, '', 'VIJAY SETH', '1509100119', 3, 1, 5, 0, 1),
(2219, '', 'VINAY VERMA', '1509100120', 3, 1, 5, 0, 1),
(2220, '', 'VIRENDRA PRATAP PANDEY', '1509100121', 3, 1, 5, 0, 1),
(2221, '', 'VIVEK KUMAR', '1509100123', 3, 1, 5, 0, 1),
(2222, '', 'YASHWANT SINGH MAURYA', '1509100125', 3, 1, 5, 0, 1),
(2223, '', 'DIVYANSHU TRIPATHI', '1509120039', 3, 1, 5, 0, 1),
(2224, '', 'BRIJENDRA KUMAR PAL', '1509131034', 3, 1, 5, 0, 1),
(2225, '', 'ASHUTOSH JAISWAL', '1509140056', 3, 1, 5, 0, 1),
(2226, '', 'AKASH  NIRWAL', '1609100901', 3, 1, 5, 0, 1),
(2227, '', 'AMIT  KUMAR', '1609100902', 3, 1, 5, 0, 1),
(2228, '', 'AMIT KUMAR', '1609100903', 3, 1, 5, 0, 1),
(2229, '', 'ARPIT', '1609100904', 3, 1, 5, 0, 1),
(2230, '', 'ASHISH KUMAR SINGH', '1609100905', 3, 1, 5, 0, 1),
(2231, '', 'BARUN  KUMAR', '1609100906', 3, 1, 5, 0, 1),
(2232, '', 'BASIT ALI', '1609100907', 3, 1, 5, 0, 1),
(2233, '', 'CHANDAN  KUSHWAHA', '1609100908', 3, 1, 5, 0, 1),
(2234, '', 'DEEPAK KUMAR SINGH', '1609100909', 3, 1, 5, 0, 1),
(2235, '', 'DEEPANSHU SOMANI', '1609100910', 3, 1, 5, 0, 1),
(2236, '', 'HARSH  JOHAL', '1609100912', 3, 1, 5, 0, 1),
(2237, '', 'JATIN  AGGRAWAL', '1609100913', 3, 1, 5, 0, 1),
(2238, '', 'MOHD AMAAN QUASIM', '1609100914', 3, 1, 5, 0, 1),
(2239, '', 'MOHIT  KUMAR', '1609100915', 3, 1, 5, 0, 1),
(2240, '', 'MONIKA  NIRANJAN', '1609100916', 3, 1, 5, 0, 1),
(2241, '', 'NEERAJ KUMAR GAUTAM', '1609100917', 3, 1, 5, 0, 1),
(2242, '', 'SHASHIKANT  SINGH', '1609100919', 3, 1, 5, 0, 1),
(2243, '', 'SUNIL  YADAV', '1609100921', 3, 1, 5, 0, 1),
(2244, '', 'VIKAS KUMAR SAGAR', '1609100922', 3, 1, 5, 0, 1),
(2245, '', 'VISHAL KUMAR RAI', '1609100923', 3, 1, 5, 0, 1),
(2246, '', 'WAQAR  AHMAD', '1609100924', 3, 1, 5, 0, 1),
(2247, '', 'MOHAK SINGH LOCHAB', '1409110065', 3, 1, 1, 0, 1),
(2248, '', 'PRAFULL PRAKASH', '1409110074', 3, 1, 1, 0, 1),
(2249, '', 'SATYAM KUMAR VERMA', '1409110097', 3, 1, 1, 0, 1),
(2250, '', 'AAKARSH MISHRA', '1409110002', 3, 1, 1, 0, 1),
(2251, '', 'HIMANSHU TYAGI', '1409110045', 3, 1, 1, 0, 1),
(2252, '', 'MAYANK JAIRAJ', '1409110063', 3, 1, 1, 0, 1),
(2253, '', 'PRASHENJIT KUMAR DEY', '1409110081', 3, 1, 1, 0, 1),
(2254, '', 'AAYUSH JAISWAL', '1509110001', 3, 1, 1, 0, 1),
(2255, '', 'AAYUSH KUMAR', '1509110002', 3, 1, 1, 0, 1),
(2256, '', 'ABHAY PRATAP SINGH', '1509110003', 3, 1, 1, 0, 1),
(2257, '', 'ABHEET VERMA', '1509110004', 3, 1, 1, 0, 1),
(2258, '', 'ABHIJEET SINGH CHAUHAN', '1509110005', 3, 1, 1, 0, 1),
(2259, '', 'ABHIMANYU RAJVANSHI', '1509110006', 3, 1, 1, 0, 1),
(2260, '', 'ABHISHEK BALYAN', '1509110007', 3, 1, 1, 0, 1),
(2261, '', 'ABHISHEK SINGH', '1509110008', 3, 1, 1, 0, 1),
(2262, '', 'ABHISHEK TONK', '1509110009', 3, 1, 1, 0, 1),
(2263, '', 'ADITYA AGARWAL', '1509110010', 3, 1, 1, 0, 1),
(2264, '', 'ADITYA AGARWAL', '1509110011', 3, 1, 1, 0, 1),
(2265, '', 'AKASH SINGH SANT', '1509110013', 3, 1, 1, 0, 1),
(2266, '', 'AMAN GUPTA', '1509110015', 3, 1, 1, 0, 1),
(2267, '', 'AMAN JAISWAL', '1509110016', 3, 1, 1, 0, 1),
(2268, '', 'AMBAR GUPTA', '1509110017', 3, 1, 1, 0, 1),
(2269, '', 'AMBUJ MITTAL', '1509110018', 3, 1, 1, 0, 1),
(2270, '', 'ANAVA SRIVASTAVA', '1509110019', 3, 1, 1, 0, 1),
(2271, '', 'ANKIT', '1509110020', 3, 1, 1, 0, 1),
(2272, '', 'ANKIT BALUNI', '1509110021', 3, 1, 1, 0, 1),
(2273, '', 'ANKIT JAIN', '1509110022', 3, 1, 1, 0, 1),
(2274, '', 'ANKIT TIWARI', '1509110023', 3, 1, 1, 0, 1),
(2275, '', 'ANUPREKSHA JAIN', '1509110025', 3, 1, 1, 0, 1),
(2276, '', 'ANURAG KAKKAR', '1509110026', 3, 1, 1, 0, 1),
(2277, '', 'ANURAG PANDEY', '1509110027', 3, 1, 1, 0, 1),
(2278, '', 'APOORVA JAIN', '1509110028', 3, 1, 1, 0, 1),
(2279, '', 'ARCHIT BHATNAGAR', '1509110029', 3, 1, 1, 0, 1),
(2280, '', 'ARINJAI SINGH', '1509110030', 3, 1, 1, 0, 1),
(2281, '', 'ARPITA RAJPOOT', '1509110031', 3, 1, 1, 0, 1),
(2282, '', 'ARUN', '1509110032', 3, 1, 1, 0, 1),
(2283, '', 'ASHISH KUMAR', '1509110033', 3, 1, 1, 0, 1),
(2284, '', 'ASHUTOSH SINGH', '1509110034', 3, 1, 1, 0, 1),
(2285, '', 'ATIN SINGHAL', '1509110035', 3, 1, 1, 0, 1),
(2286, '', 'AVADHESH CHAMOLA', '1509110036', 3, 1, 1, 0, 1),
(2287, '', 'AVIRAL PANDEY', '1509110037', 3, 1, 1, 0, 1),
(2288, '', 'AYUSH GOEL', '1509110038', 3, 1, 1, 0, 1),
(2289, '', 'BHAARGAVI AGARWAL', '1509110039', 3, 1, 1, 0, 1),
(2290, '', 'BHAVYA SRIVASTAVA', '1509110040', 3, 1, 1, 0, 1),
(2291, '', 'BHOOMIKA CHAUHAN', '1509110041', 3, 1, 1, 0, 1),
(2292, '', 'DEVESH SINGH', '1509110042', 3, 1, 1, 0, 1),
(2293, '', 'DHRUV GUPTA', '1509110043', 3, 1, 1, 0, 1),
(2294, '', 'DHRUV SRIVASTAVA', '1509110044', 3, 1, 1, 0, 1),
(2295, '', 'DIVAY SHARMA', '1509110045', 3, 1, 1, 0, 1),
(2296, '', 'DIVYA KHANNA', '1509110046', 3, 1, 1, 0, 1),
(2297, '', 'EIKANSH', '1509110047', 3, 1, 1, 0, 1),
(2298, '', 'FARAZ KHAN', '1509110048', 3, 1, 1, 0, 1),
(2299, '', 'HARSH TOMAR', '1509110049', 3, 1, 1, 0, 1),
(2300, '', 'HARSHAL KUMAR', '1509110050', 3, 1, 1, 0, 1),
(2301, '', 'HARSHIT VERMA', '1509110051', 3, 1, 1, 0, 1),
(2302, '', 'HIMANI SIROHI', '1509110052', 3, 1, 1, 0, 1),
(2303, '', 'HIMANSHI VERMA', '1509110053', 3, 1, 1, 0, 1),
(2304, '', 'HIMANSHU AGRAWAL', '1509110054', 3, 1, 1, 0, 1),
(2305, '', 'HRITHIK CHAUDHARY', '1509110055', 3, 1, 1, 0, 1),
(2306, '', 'JATIN KUMAR SINGH', '1509110056', 3, 1, 1, 0, 1),
(2307, '', 'JAYANT MAWAI', '1509110057', 3, 1, 1, 0, 1),
(2308, '', 'KARAN CHOPRA', '1509110058', 3, 1, 1, 0, 1),
(2309, '', 'KARAN NIRALIYA', '1509110059', 3, 1, 1, 0, 1),
(2310, '', 'KAUSHALENDRA KUMAR SINGH', '1509110060', 3, 1, 1, 0, 1),
(2311, '', 'KUSHAGRA MISHRA', '1509110061', 3, 1, 1, 0, 1),
(2312, '', 'MANASVI KRISHNA MISHRA', '1509110062', 3, 1, 1, 0, 1),
(2313, '', 'MANISH VERMA', '1509110063', 3, 1, 1, 0, 1),
(2314, '', 'MIHIR ATREY', '1509110065', 3, 1, 1, 0, 1),
(2315, '', 'MOHAK AHUJAA', '1509110066', 3, 1, 1, 0, 1),
(2316, '', 'NAMAN JAIN', '1509110067', 3, 1, 1, 0, 1),
(2317, '', 'NEELABH PATEL', '1509110068', 3, 1, 1, 0, 1),
(2318, '', 'NEELISHA SAXENA', '1509110069', 3, 1, 1, 0, 1),
(2319, '', 'NEERAJ YADAV', '1509110070', 3, 1, 1, 0, 1),
(2320, '', 'NIKET SHARMA', '1509110071', 3, 1, 1, 0, 1),
(2321, '', 'NIKHIL DHAND', '1509110072', 3, 1, 1, 0, 1),
(2322, '', 'NIPUN SHARMA', '1509110073', 3, 1, 1, 0, 1),
(2323, '', 'PARTH SAXENA', '1509110074', 3, 1, 1, 0, 1),
(2324, '', 'PIYUSH', '1509110075', 3, 1, 1, 0, 1),
(2325, '', 'PIYUSH SINGH GUNJIYAL', '1509110076', 3, 1, 1, 0, 1),
(2326, '', 'PRAKHAR PRAKASH BHARDWAJ', '1509110077', 3, 1, 1, 0, 1),
(2327, '', 'PRAKHAR SINGH', '1509110078', 3, 1, 1, 0, 1),
(2328, '', 'PRANSHI YADAV', '1509110079', 3, 1, 1, 0, 1),
(2329, '', 'PRASHANT GUPTA', '1509110080', 3, 1, 1, 0, 1),
(2330, '', 'PRATEEK MITTAL', '1509110081', 3, 1, 1, 0, 1),
(2331, '', 'PRIYA YADAV', '1509110082', 3, 1, 1, 0, 1),
(2332, '', 'RAHUL AGRAWAL', '1509110083', 3, 1, 1, 0, 1),
(2333, '', 'RAJAT SHARMA', '1509110085', 3, 1, 1, 0, 1),
(2334, '', 'RISHABH', '1509110086', 3, 1, 1, 0, 1),
(2335, '', 'ROBIN SINGH', '1509110087', 3, 1, 1, 0, 1),
(2336, '', 'SACHIN KUMAR SINGH', '1509110089', 3, 1, 1, 0, 1),
(2337, '', 'SATWIK SINGH', '1509110092', 3, 1, 1, 0, 1),
(2338, '', 'SAURABH RANJAN', '1509110093', 3, 1, 1, 0, 1),
(2339, '', 'SAURABH SIROHI', '1509110094', 3, 1, 1, 0, 1),
(2340, '', 'SHANTANU', '1509110095', 3, 1, 1, 0, 1),
(2341, '', 'SHASHANK MOHAN', '1509110096', 3, 1, 1, 0, 1),
(2342, '', 'SHAURYA SINGH', '1509110097', 3, 1, 1, 0, 1),
(2343, '', 'SHEKHAR BANERJEE', '1509110098', 3, 1, 1, 0, 1),
(2344, '', 'SHIVANI TEKRIWAL', '1509110099', 3, 1, 1, 0, 1),
(2345, '', 'SHIVANKAR', '1509110100', 3, 1, 1, 0, 1),
(2346, '', 'SHIVARTH KUMAR', '1509110101', 3, 1, 1, 0, 1),
(2347, '', 'SHLOK SRIVASTAVA', '1509110102', 3, 1, 1, 0, 1),
(2348, '', 'SHOBHA KUMARI', '1509110103', 3, 1, 1, 0, 1),
(2349, '', 'SHOBHIT JAIN', '1509110104', 3, 1, 1, 0, 1),
(2350, '', 'SHUBHANGI GUPTA', '1509110106', 3, 1, 1, 0, 1),
(2351, '', 'SIDDHANT AGARWAL', '1509110107', 3, 1, 1, 0, 1),
(2352, '', 'SIDDHARTHA RATMELE', '1509110108', 3, 1, 1, 0, 1),
(2353, '', 'SONALI RAWAT', '1509110109', 3, 1, 1, 0, 1),
(2354, '', 'SURAJ KUMAR', '1509110110', 3, 1, 1, 0, 1),
(2355, '', 'SURYA PRAKASH GUPTA', '1509110111', 3, 1, 1, 0, 1),
(2356, '', 'TANAY YADAV', '1509110112', 3, 1, 1, 0, 1),
(2357, '', 'TIRTHANKAR SARKAR', '1509110114', 3, 1, 1, 0, 1),
(2358, '', 'UDDESHYA KUMAR CHAUDHARY', '1509110115', 3, 1, 1, 0, 1),
(2359, '', 'UMANG BANSAL', '1509110116', 3, 1, 1, 0, 1),
(2360, '', 'UTKARSH', '1509110117', 3, 1, 1, 0, 1),
(2361, '', 'VARUN SINGH', '1509110118', 3, 1, 1, 0, 1),
(2362, '', 'VEDANSH KEDIA', '1509110119', 3, 1, 1, 0, 1),
(2363, '', 'VIPUL GUPTA', '1509110120', 3, 1, 1, 0, 1),
(2364, '', 'VISHAL SRIVASTAVA', '1509110121', 3, 1, 1, 0, 1),
(2365, '', 'VISHRAD RAWAT', '1509110122', 3, 1, 1, 0, 1),
(2366, '', 'YASH JAIN', '1509110123', 3, 1, 1, 0, 1),
(2367, '', 'YASH OMAR', '1509110124', 3, 1, 1, 0, 1),
(2368, '', 'YASHA SINGH', '1509110125', 3, 1, 1, 0, 1),
(2369, '', 'YOGESH CHAUDHARY', '1509110126', 3, 1, 1, 0, 1),
(2370, '', 'SHRUTI AGARWAL', '1509113099', 3, 1, 1, 0, 1),
(2371, '', 'SHWETA GUPTA', '1509113108', 3, 1, 1, 0, 1),
(2372, '', 'ANUSHKA SINGH', '1509131022', 3, 1, 1, 0, 1),
(2373, '', 'ASHUTOSH ANAND TIWARI', '1609110901', 3, 1, 1, 0, 1),
(2374, '', 'ATUL  SINGH', '1609110902', 3, 1, 1, 0, 1),
(2375, '', 'BIPIN KUMAR VERMA', '1609110903', 3, 1, 1, 0, 1),
(2376, '', 'BUSHRA  MAHFOOZ', '1609110904', 3, 1, 1, 0, 1),
(2377, '', 'DHANANJAY KANNAUJIYA', '1609110905', 3, 1, 1, 0, 1),
(2378, '', 'KAUSHAL  BAGHEL', '1609110906', 3, 1, 1, 0, 1),
(2379, '', 'KUMARI  SHILPA', '1609110907', 3, 1, 1, 0, 1),
(2380, '', 'MADHURI YADAV', '1609110908', 3, 1, 1, 0, 1),
(2381, '', 'MEGHA  VERMA', '1609110909', 3, 1, 1, 0, 1),
(2382, '', 'MOHD AQUIB ANSARI', '1609110910', 3, 1, 1, 0, 1),
(2383, '', 'NEHA  YADAV', '1609110911', 3, 1, 1, 0, 1),
(2384, '', 'PRADEEP  KUMAR', '1609110912', 3, 1, 1, 0, 1),
(2385, '', 'PARVEEN  KUMAR', '1609110913', 3, 1, 1, 0, 1),
(2386, '', 'RAJAT  SHARMA', '1609110914', 3, 1, 1, 0, 1),
(2387, '', 'ROHIT  PATEL', '1609110915', 3, 1, 1, 0, 1),
(2388, '', 'SAURABH PRATAP SINGH', '1609110916', 3, 1, 1, 0, 1),
(2389, '', 'SHUBHANGI  SRIVASTAVA', '1609110917', 3, 1, 1, 0, 1),
(2390, '', 'SHUBHANGI  TYAGI', '1609110918', 3, 1, 1, 0, 1),
(2391, '', 'SIDHARTH  PANDEY', '1609110919', 3, 1, 1, 0, 1),
(2392, '', 'SUKIRTI  KATHERIA', '1609110920', 3, 1, 1, 0, 1),
(2393, '', 'SUSHMITA  GUPTA', '1609110921', 3, 1, 1, 0, 1),
(2394, '', 'SYED ATEEBUL ISLAM', '1609110922', 3, 1, 1, 0, 1),
(2395, '', 'VIKASH KUMAR VARMA', '1609110923', 3, 1, 1, 0, 1),
(2396, '', 'VISHAL  RAI', '1609110924', 3, 1, 1, 0, 1),
(2397, '', 'HIMALAY CHAUHAN', '1409113041', 3, 1, 2, 0, 1),
(2398, '', 'PARTH BHAGAT', '1409113060', 3, 1, 2, 0, 1),
(2399, '', 'SANCHIT KUMAR', '1409113080', 3, 1, 2, 0, 1),
(2400, '', 'SOMYA', '1409113109', 3, 1, 2, 0, 1),
(2401, '', 'AAKASH', '1509113001', 3, 1, 2, 0, 1),
(2402, '', 'AAKASH PATEL', '1509113002', 3, 1, 2, 0, 1),
(2403, '', 'ABHILASH PANDEY', '1509113003', 3, 1, 2, 0, 1),
(2404, '', 'ABHISHEK JAIN', '1509113004', 3, 1, 2, 0, 1),
(2405, '', 'ABHISHEK KUMAR SINGH', '1509113005', 3, 1, 2, 0, 1),
(2406, '', 'ABHISHEK PORWAL', '1509113006', 3, 1, 2, 0, 1),
(2407, '', 'ABHISHEK SONKAR', '1509113007', 3, 1, 2, 0, 1),
(2408, '', 'ADESH KUMAR', '1509113008', 3, 1, 2, 0, 1),
(2409, '', 'AGAM GOEL', '1509113009', 3, 1, 2, 0, 1),
(2410, '', 'AJEY VERMA', '1509113010', 3, 1, 2, 0, 1),
(2411, '', 'AKARSH GUPTA', '1509113011', 3, 1, 2, 0, 1),
(2412, '', 'AKSHITA RANA', '1509113012', 3, 1, 2, 0, 1),
(2413, '', 'ALANKRIT BARANWAL', '1509113013', 3, 1, 2, 0, 1),
(2414, '', 'ALANKRIT KUMAR', '1509113014', 3, 1, 2, 0, 1),
(2415, '', 'AMAN CHAUDHARY', '1509113015', 3, 1, 2, 0, 1),
(2416, '', 'AMITANSHU ANAND', '1509113016', 3, 1, 2, 0, 1),
(2417, '', 'ANIT VERMA', '1509113017', 3, 1, 2, 0, 1),
(2418, '', 'ANKIT GUPTA', '1509113019', 3, 1, 2, 0, 1),
(2419, '', 'ANUJ AGRAWAL', '1509113020', 3, 1, 2, 0, 1),
(2420, '', 'ANUJ VASHISTHA', '1509113021', 3, 1, 2, 0, 1),
(2421, '', 'ANUPRIYA PAL', '1509113022', 3, 1, 2, 0, 1),
(2422, '', 'ANURAG SHUKLA', '1509113023', 3, 1, 2, 0, 1),
(2423, '', 'APOORV RAJ', '1509113025', 3, 1, 2, 0, 1),
(2424, '', 'APOORVA SONKAR', '1509113026', 3, 1, 2, 0, 1),
(2425, '', 'ARCHIT SAXENA', '1509113028', 3, 1, 2, 0, 1),
(2426, '', 'ARHIND KUMAR GAUTAM', '1509113029', 3, 1, 2, 0, 1),
(2427, '', 'ASTHA GARG', '1509113030', 3, 1, 2, 0, 1),
(2428, '', 'AYUSH SINGH', '1509113031', 3, 1, 2, 0, 1),
(2429, '', 'AYUSHI KAPOOR', '1509113032', 3, 1, 2, 0, 1),
(2430, '', 'AYUSHMAAN SINGH', '1509113033', 3, 1, 2, 0, 1),
(2431, '', 'AYUSHMAN JOHRI', '1509113034', 3, 1, 2, 0, 1),
(2432, '', 'BHASKAR SHUKLA', '1509113035', 3, 1, 2, 0, 1),
(2433, '', 'DARPAN KUMAR PURWAR', '1509113036', 3, 1, 2, 0, 1),
(2434, '', 'DEEPIKA VISHWAKARMA', '1509113037', 3, 1, 2, 0, 1),
(2435, '', 'DIVYA CHOUDHA', '1509113038', 3, 1, 2, 0, 1),
(2436, '', 'DIVYA DIXIT', '1509113039', 3, 1, 2, 0, 1),
(2437, '', 'DIVYA SINGHAL', '1509113040', 3, 1, 2, 0, 1),
(2438, '', 'GAUTAM GENDA', '1509113041', 3, 1, 2, 0, 1),
(2439, '', 'HARSHIT GUPTA', '1509113042', 3, 1, 2, 0, 1),
(2440, '', 'HIMANI PANWAR', '1509113043', 3, 1, 2, 0, 1),
(2441, '', 'ISHAN SRIVASTAVA', '1509113044', 3, 1, 2, 0, 1),
(2442, '', 'ISHIKA RATHI', '1509113045', 3, 1, 2, 0, 1),
(2443, '', 'ISHITA AWASTHI', '1509113046', 3, 1, 2, 0, 1),
(2444, '', 'JAYESH BAHL', '1509113047', 3, 1, 2, 0, 1),
(2445, '', 'JITENDRA KUNTAL', '1509113048', 3, 1, 2, 0, 1),
(2446, '', 'KANISHK B LALWANI', '1509113049', 3, 1, 2, 0, 1),
(2447, '', 'KARTIK KHARE', '1509113050', 3, 1, 2, 0, 1),
(2448, '', 'KARTIKAY PUNDIR', '1509113051', 3, 1, 2, 0, 1),
(2449, '', 'KSHITIJ TYAGI', '1509113052', 3, 1, 2, 0, 1),
(2450, '', 'KUNAL GOSWANI', '1509113053', 3, 1, 2, 0, 1),
(2451, '', 'KUNAL TOMAR', '1509113054', 3, 1, 2, 0, 1),
(2452, '', 'MANAVI SINGH', '1509113055', 3, 1, 2, 0, 1),
(2453, '', 'MEGHA SINGHAL', '1509113056', 3, 1, 2, 0, 1),
(2454, '', 'MEGHNA', '1509113057', 3, 1, 2, 0, 1),
(2455, '', 'MISHAL KUMAR', '1509113058', 3, 1, 2, 0, 1),
(2456, '', 'NEHA SINGH', '1509113061', 3, 1, 2, 0, 1),
(2457, '', 'NIKHIL PRIYADARSHI', '1509113063', 3, 1, 2, 0, 1),
(2458, '', 'NIKITA TIWARI', '1509113064', 3, 1, 2, 0, 1),
(2459, '', 'NISHITH JAISWAL', '1509113065', 3, 1, 2, 0, 1),
(2460, '', 'NISHKARSH SINGH', '1509113066', 3, 1, 2, 0, 1),
(2461, '', 'NISHU SHUKLA', '1509113067', 3, 1, 2, 0, 1),
(2462, '', 'PARAS GARG', '1509113068', 3, 1, 2, 0, 1),
(2463, '', 'PARJANYA SINGH', '1509113069', 3, 1, 2, 0, 1),
(2464, '', 'PRAKHAR CHOUDHARY', '1509113070', 3, 1, 2, 0, 1),
(2465, '', 'PRAKHAR PANT', '1509113071', 3, 1, 2, 0, 1),
(2466, '', 'PRAKHAR PRAKASH', '1509113072', 3, 1, 2, 0, 1),
(2467, '', 'PRANEY POONIA', '1509113073', 3, 1, 2, 0, 1),
(2468, '', 'PRATEEK PANWAR', '1509113074', 3, 1, 2, 0, 1),
(2469, '', 'PREMLATA SONKAR', '1509113075', 3, 1, 2, 0, 1),
(2470, '', 'PRIYANK KUMAR', '1509113076', 3, 1, 2, 0, 1),
(2471, '', 'PUSKIN MITTAL', '1509113077', 3, 1, 2, 0, 1),
(2472, '', 'RAGHAV BHARDWAJ', '1509113078', 3, 1, 2, 0, 1),
(2473, '', 'RAGHAV NARAIN WAHI', '1509113079', 3, 1, 2, 0, 1),
(2474, '', 'RICHA VERMA', '1509113080', 3, 1, 2, 0, 1),
(2475, '', 'RISHABH SINGH', '1509113081', 3, 1, 2, 0, 1),
(2476, '', 'ROHAN GOEL', '1509113082', 3, 1, 2, 0, 1),
(2477, '', 'SAHIL PRATAP SINGH BUNDELA', '1509113083', 3, 1, 2, 0, 1),
(2478, '', 'SAKSHI GUPTA', '1509113085', 3, 1, 2, 0, 1),
(2479, '', 'SANA JAFRI', '1509113086', 3, 1, 2, 0, 1),
(2480, '', 'SARTHAK AHLAWAT', '1509113087', 3, 1, 2, 0, 1),
(2481, '', 'SHASHANK VASHISTHA', '1509113089', 3, 1, 2, 0, 1),
(2482, '', 'SHIVA SINGH', '1509113091', 3, 1, 2, 0, 1),
(2483, '', 'SHIVAM BHARGAVA', '1509113092', 3, 1, 2, 0, 1),
(2484, '', 'SHIVAM GOEL', '1509113093', 3, 1, 2, 0, 1),
(2485, '', 'SHIVANGI MALAVIYA', '1509113095', 3, 1, 2, 0, 1),
(2486, '', 'SHIVANSH PANDEY', '1509113096', 3, 1, 2, 0, 1),
(2487, '', 'SHOBHIT AGRAHARI', '1509113097', 3, 1, 2, 0, 1),
(2488, '', 'SHRUTI', '1509113098', 3, 1, 2, 0, 1),
(2489, '', 'SHUBHAM JAISWAL', '1509113101', 3, 1, 2, 0, 1),
(2490, '', 'SHUBHAM MISHRA', '1509113102', 3, 1, 2, 0, 1),
(2491, '', 'SHUBHAM MISRA', '1509113103', 3, 1, 2, 0, 1),
(2492, '', 'SHUBHAM SISODIA', '1509113104', 3, 1, 2, 0, 1),
(2493, '', 'SHUBHAM TOMAR', '1509113105', 3, 1, 2, 0, 1),
(2494, '', 'SHUBHAM YADAV', '1509113106', 3, 1, 2, 0, 1),
(2495, '', 'SHUBHANGI UPADHYAY', '1509113107', 3, 1, 2, 0, 1),
(2496, '', 'SUBODH KUMAR BANSLA', '1509113109', 3, 1, 2, 0, 1),
(2497, '', 'TANIYA GOEL', '1509113110', 3, 1, 2, 0, 1),
(2498, '', 'TAZIM KHAN', '1509113112', 3, 1, 2, 0, 1),
(2499, '', 'UNNATI SAGAR', '1509113113', 3, 1, 2, 0, 1),
(2500, '', 'VAIBHAV MITTAL', '1509113114', 3, 1, 2, 0, 1),
(2501, '', 'VARUN AGARWAL', '1509113115', 3, 1, 2, 0, 1),
(2502, '', 'VATSALYA GOYAL', '1509113116', 3, 1, 2, 0, 1),
(2503, '', 'VIBHAV CHATURVEDI', '1509113117', 3, 1, 2, 0, 1),
(2504, '', 'VIKRANT SEN', '1509113118', 3, 1, 2, 0, 1),
(2505, '', 'VIKRANT YADAV', '1509113119', 3, 1, 2, 0, 1),
(2506, '', 'VINAYAK BANSAL', '1509113120', 3, 1, 2, 0, 1),
(2507, '', 'VISHAL GOURAV', '1509113121', 3, 1, 2, 0, 1),
(2508, '', 'VISHWAS PATEL', '1509113122', 3, 1, 2, 0, 1),
(2509, '', 'YAMINI SHARMA', '1509113123', 3, 1, 2, 0, 1),
(2510, '', 'YASHASVI PANT', '1509113124', 3, 1, 2, 0, 1),
(2511, '', 'ISHIKA GUPTA', '1509121025', 3, 1, 2, 0, 1),
(2512, '', 'AYUSH MISHRA', '1509131031', 3, 1, 2, 0, 1),
(2513, '', 'AYUSHI SAXENA', '1509131033', 3, 1, 2, 0, 1),
(2514, '', 'NOOREEN', '1509131065', 3, 1, 2, 0, 1),
(2515, '', 'VIBHA BHASIN', '1509131120', 3, 1, 2, 0, 1),
(2516, '', 'YASH NIGAM', '1509100124', 3, 1, 2, 0, 1),
(2517, '', 'DEV DINESH', '1609113901', 3, 1, 2, 0, 1),
(2518, '', 'HAMID  ZIYA', '1609113902', 3, 1, 2, 0, 1),
(2519, '', 'HARSH  SHAH', '1609113903', 3, 1, 2, 0, 1),
(2520, '', 'SHRISTY  MALL', '1609113904', 3, 1, 2, 0, 1),
(2521, '', 'YASH CHHARI', '1409120120', 3, 1, 4, 0, 1),
(2522, '', 'PRASANJEET SINGH', '1409120074', 3, 1, 4, 0, 1),
(2523, '', 'ABHIJEET GUPTA', '1509120001', 3, 1, 4, 0, 1),
(2524, '', 'ABHISHEK CHAUDHARY', '1509120002', 3, 1, 4, 0, 1),
(2525, '', 'ADITYA CHAUDHARY', '1509120003', 3, 1, 4, 0, 1),
(2526, '', 'ADITYA DUTTA SHARMA', '1509120004', 3, 1, 4, 0, 1),
(2527, '', 'ADITYA TIWARI', '1509120005', 3, 1, 4, 0, 1),
(2528, '', 'AISHWARYA VARDHAN SINGH', '1509120006', 3, 1, 4, 0, 1),
(2529, '', 'AKASH SHARMA', '1509120007', 3, 1, 4, 0, 1),
(2530, '', 'AKSHAY KUMAR', '1509120008', 3, 1, 4, 0, 1),
(2531, '', 'AMBUJ SRIVASTAVA', '1509120009', 3, 1, 4, 0, 1),
(2532, '', 'AMIT GUPTA', '1509120010', 3, 1, 4, 0, 1),
(2533, '', 'AMIT KUMAR', '1509120011', 3, 1, 4, 0, 1),
(2534, '', 'AMITESH KUMAR', '1509120012', 3, 1, 4, 0, 1),
(2535, '', 'ANSHIKA SAHU', '1509120013', 3, 1, 4, 0, 1),
(2536, '', 'ANSHUMAN', '1509120014', 3, 1, 4, 0, 1),
(2537, '', 'ANSHUMAN SHUKLA', '1509120015', 3, 1, 4, 0, 1),
(2538, '', 'APAR AGARWAL', '1509120016', 3, 1, 4, 0, 1),
(2539, '', 'APRAJITA', '1509120017', 3, 1, 4, 0, 1),
(2540, '', 'ARCHIT SHARMA', '1509120018', 3, 1, 4, 0, 1),
(2541, '', 'ARPIT SINGH', '1509120019', 3, 1, 4, 0, 1),
(2542, '', 'ARUN KUMAR', '1509120020', 3, 1, 4, 0, 1),
(2543, '', 'ARVIND PRATAP SINGH', '1509120021', 3, 1, 4, 0, 1),
(2544, '', 'ASHISH SINHA', '1509120022', 3, 1, 4, 0, 1),
(2545, '', 'ASHUTOSH SHUKLA', '1509120023', 3, 1, 4, 0, 1),
(2546, '', 'AVADHESH KUMAR VERMA', '1509120024', 3, 1, 4, 0, 1),
(2547, '', 'AVINASH SINGH', '1509120025', 3, 1, 4, 0, 1),
(2548, '', 'AVIRAL SHARMA', '1509120026', 3, 1, 4, 0, 1),
(2549, '', 'BRIJ BHUSHAN', '1509120027', 3, 1, 4, 0, 1),
(2550, '', 'CHANDRA PRAKASH MISHRA', '1509120029', 3, 1, 4, 0, 1),
(2551, '', 'CHIRAG GUPTA', '1509120030', 3, 1, 4, 0, 1),
(2552, '', 'CHIRAG GUPTA', '1509120031', 3, 1, 4, 0, 1),
(2553, '', 'DEEPANSHU KHARI', '1509120032', 3, 1, 4, 0, 1),
(2554, '', 'DHARMENDRA', '1509120033', 3, 1, 4, 0, 1),
(2555, '', 'DHARMENDRA KUMAR', '1509120034', 3, 1, 4, 0, 1),
(2556, '', 'DINESH GOSWAMI', '1509120036', 3, 1, 4, 0, 1),
(2557, '', 'EKANSH AGRAWAL', '1509120040', 3, 1, 4, 0, 1),
(2558, '', 'HEMRAJ SINGH', '1509120042', 3, 1, 4, 0, 1),
(2559, '', 'HITWIK SINGH', '1509120043', 3, 1, 4, 0, 1),
(2560, '', 'KOSHINDER KUMAR', '1509120045', 3, 1, 4, 0, 1),
(2561, '', 'MANDEEP SINGH BISLA', '1509120046', 3, 1, 4, 0, 1),
(2562, '', 'MOHAMMAD HAMID SIDDIQUI', '1509120047', 3, 1, 4, 0, 1),
(2563, '', 'MOHAMMAD WARIS', '1509120048', 3, 1, 4, 0, 1),
(2564, '', 'NIKHIL JOSHI', '1509120050', 3, 1, 4, 0, 1),
(2565, '', 'NIKITA BAISOYA', '1509120052', 3, 1, 4, 0, 1),
(2566, '', 'NIMESH PRATAP SINGH', '1509120053', 3, 1, 4, 0, 1),
(2567, '', 'NISHANT UPRETI', '1509120054', 3, 1, 4, 0, 1),
(2568, '', 'PALAK TULSYAN', '1509120055', 3, 1, 4, 0, 1),
(2569, '', 'PRADEEP KUMAR', '1509120056', 3, 1, 4, 0, 1),
(2570, '', 'PRAGATI KATIYAR', '1509120057', 3, 1, 4, 0, 1),
(2571, '', 'PRIYA SINGH', '1509120058', 3, 1, 4, 0, 1),
(2572, '', 'PRIYANSHU YADAV', '1509120059', 3, 1, 4, 0, 1),
(2573, '', 'RAMASHANKAR YADAV', '1509120061', 3, 1, 4, 0, 1),
(2574, '', 'RAMESHWAR SINGH', '1509120062', 3, 1, 4, 0, 1),
(2575, '', 'RASHI NEGI', '1509120063', 3, 1, 4, 0, 1),
(2576, '', 'REWATI TIWARI', '1509120064', 3, 1, 4, 0, 1),
(2577, '', 'RIDAMPAL SINGH', '1509120065', 3, 1, 4, 0, 1),
(2578, '', 'RISHABH', '1509120066', 3, 1, 4, 0, 1),
(2579, '', 'ROHITKUMAR', '1509120068', 3, 1, 4, 0, 1),
(2580, '', 'SACHIN GUPTA', '1509120069', 3, 1, 4, 0, 1),
(2581, '', 'SACHIN KUMAR', '1509120070', 3, 1, 4, 0, 1),
(2582, '', 'SACHIN KUMAR', '1509120071', 3, 1, 4, 0, 1),
(2583, '', 'SACHIN SHAW', '1509120072', 3, 1, 4, 0, 1),
(2584, '', 'SATYAM BANSAL', '1509120073', 3, 1, 4, 0, 1),
(2585, '', 'SAURABH DUBEY', '1509120074', 3, 1, 4, 0, 1),
(2586, '', 'SEZAL GUPTA', '1509120075', 3, 1, 4, 0, 1),
(2587, '', 'SHARAD P S TOMAR', '1509120076', 3, 1, 4, 0, 1),
(2588, '', 'SHARDUL TRIPATHI', '1509120077', 3, 1, 4, 0, 1),
(2589, '', 'SHASHANK PRATAP SINGH', '1509120078', 3, 1, 4, 0, 1),
(2590, '', 'SHIKHA PATEL', '1509120079', 3, 1, 4, 0, 1),
(2591, '', 'SHIVAM SAMRAT', '1509120082', 3, 1, 4, 0, 1),
(2592, '', 'SHIVAM VARSHNEY', '1509120083', 3, 1, 4, 0, 1),
(2593, '', 'SHIVANSH', '1509120084', 3, 1, 4, 0, 1),
(2594, '', 'SHIVANSH PRATAP SINGH', '1509120085', 3, 1, 4, 0, 1),
(2595, '', 'SHREYA SRIVASTAVA', '1509120087', 3, 1, 4, 0, 1),
(2596, '', 'SHUBHAM JAISWAL', '1509120088', 3, 1, 4, 0, 1),
(2597, '', 'SHUBHAM PAL', '1509120089', 3, 1, 4, 0, 1),
(2598, '', 'SHUBHAM SACHAN', '1509120090', 3, 1, 4, 0, 1),
(2599, '', 'SHUBHANJALI SHRIVASTAVA', '1509120091', 3, 1, 4, 0, 1),
(2600, '', 'SIDDHANT KUMAR SRIVASTAVA', '1509120092', 3, 1, 4, 0, 1),
(2601, '', 'SIDDHARTH AWASTHI', '1509120093', 3, 1, 4, 0, 1),
(2602, '', 'SMITA VARDHAN', '1509120094', 3, 1, 4, 0, 1),
(2603, '', 'SUMIT CHAUHAN', '1509120095', 3, 1, 4, 0, 1),
(2604, '', 'SUMIT VERMA', '1509120096', 3, 1, 4, 0, 1),
(2605, '', 'SURYANSH SINGH CHAUHAN', '1509120098', 3, 1, 4, 0, 1),
(2606, '', 'SWAPNIL VASHISHTH', '1509120099', 3, 1, 4, 0, 1),
(2607, '', 'TANISHQ VARSHNEY', '1509120100', 3, 1, 4, 0, 1),
(2608, '', 'TARUN BHUSHAN', '1509120101', 3, 1, 4, 0, 1),
(2609, '', 'TUSHAR JAIN', '1509120102', 3, 1, 4, 0, 1),
(2610, '', 'V SHISHIR KUMAR', '1509120104', 3, 1, 4, 0, 1),
(2611, '', 'VAIBHAV SHARMA', '1509120105', 3, 1, 4, 0, 1),
(2612, '', 'VASU GARG', '1509120106', 3, 1, 4, 0, 1),
(2613, '', 'VIDUSHI JAISWAL', '1509120107', 3, 1, 4, 0, 1),
(2614, '', 'VIJAY TOMAR', '1509120108', 3, 1, 4, 0, 1),
(2615, '', 'VIKRANT KUMAR', '1509120109', 3, 1, 4, 0, 1),
(2616, '', 'VIVEK KUMAR', '1509120110', 3, 1, 4, 0, 1),
(2617, '', 'ABHAY PRATAP SINGH', '1609120901', 3, 1, 4, 0, 1),
(2618, '', 'AJAY NARAYAN YADAV', '1609120902', 3, 1, 4, 0, 1),
(2619, '', 'AMAN  KUMAR', '1609120903', 3, 1, 4, 0, 1),
(2620, '', 'ARUN  KUMAR', '1609120904', 3, 1, 4, 0, 1),
(2621, '', 'ARUN  PRADHAN', '1609120905', 3, 1, 4, 0, 1),
(2622, '', 'BHAMARPAL SINGH BAGHEL', '1609120906', 3, 1, 4, 0, 1);
INSERT INTO `jss_stud_list_17_18` (`jss_stud_id`, `adm_no`, `stud_name`, `roll_no`, `year`, `course_id`, `branch_id`, `form_fill`, `valid`) VALUES
(2623, '', 'DEEPAK KUMAR VERMA', '1609120907', 3, 1, 4, 0, 1),
(2624, '', 'KARSAZ  AHMAD', '1609120908', 3, 1, 4, 0, 1),
(2625, '', 'NEHA  TRIPATHI', '1609120909', 3, 1, 4, 0, 1),
(2626, '', 'MOHD ASAD KHAN', '1609120910', 3, 1, 4, 0, 1),
(2627, '', 'SAMEER  PATEL', '1609120912', 3, 1, 4, 0, 1),
(2628, '', 'SARIT  CHAUHAN', '1609120913', 3, 1, 4, 0, 1),
(2629, '', 'SHUBHAM  VERMA', '1609120914', 3, 1, 4, 0, 1),
(2630, '', 'SUMIT  KUMAR', '1609120915', 3, 1, 4, 0, 1),
(2631, '', 'VINEET KUMAR SHARMA', '1609120916', 3, 1, 4, 0, 1),
(2632, '', 'AAYUSH KASHYAP', '1509121001', 3, 1, 9, 0, 1),
(2633, '', 'ABHAY KUMAR', '1509121002', 3, 1, 9, 0, 1),
(2634, '', 'ABHINANDAN GUPTA', '1509121003', 3, 1, 9, 0, 1),
(2635, '', 'ABHISHEK JAISWAL', '1509121004', 3, 1, 9, 0, 1),
(2636, '', 'ABHISHEK KESARWANI', '1509121005', 3, 1, 9, 0, 1),
(2637, '', 'ABHISHEK VERMA', '1509121006', 3, 1, 9, 0, 1),
(2638, '', 'AKANSHA SINGH', '1509121008', 3, 1, 9, 0, 1),
(2639, '', 'AKASH ARYA', '1509121009', 3, 1, 9, 0, 1),
(2640, '', 'AKASH SHARMA', '1509121010', 3, 1, 9, 0, 1),
(2641, '', 'AKSHAT GUPTA', '1509121011', 3, 1, 9, 0, 1),
(2642, '', 'ANANYA PANDEY', '1509121014', 3, 1, 9, 0, 1),
(2643, '', 'APRAJITA', '1509121015', 3, 1, 9, 0, 1),
(2644, '', 'AYUSHI RUNGTA', '1509121016', 3, 1, 9, 0, 1),
(2645, '', 'AYUSHI SINGH', '1509121017', 3, 1, 9, 0, 1),
(2646, '', 'BHAVIKA CHAWLA', '1509121018', 3, 1, 9, 0, 1),
(2647, '', 'BHUMIKA KATIYAR', '1509121019', 3, 1, 9, 0, 1),
(2648, '', 'BRIJESH CHANDRA', '1509121020', 3, 1, 9, 0, 1),
(2649, '', 'DEEPAK CHANDR', '1509121021', 3, 1, 9, 0, 1),
(2650, '', 'GAGAN KUMAR', '1509121023', 3, 1, 9, 0, 1),
(2651, '', 'GARIMA RAWAT', '1509121024', 3, 1, 9, 0, 1),
(2652, '', 'KARTIKA SRIVASTAVA', '1509121026', 3, 1, 9, 0, 1),
(2653, '', 'KSHITIZ SHARMA', '1509121027', 3, 1, 9, 0, 1),
(2654, '', 'MODH ABAN', '1509121029', 3, 1, 9, 0, 1),
(2655, '', 'NISHA VIKRAM', '1509121030', 3, 1, 9, 0, 1),
(2656, '', 'NITIN SINGH', '1509121031', 3, 1, 9, 0, 1),
(2657, '', 'PANKAJ YADAV', '1509121032', 3, 1, 9, 0, 1),
(2658, '', 'PARTH SRIVASTAV', '1509121033', 3, 1, 9, 0, 1),
(2659, '', 'RAGHVENDRA RAJPUT', '1509121037', 3, 1, 9, 0, 1),
(2660, '', 'RAJAT TYAGI', '1509121039', 3, 1, 9, 0, 1),
(2661, '', 'RISHAB KUMAR GUPTA', '1509121040', 3, 1, 9, 0, 1),
(2662, '', 'RISHABH AWASTHI', '1509121041', 3, 1, 9, 0, 1),
(2663, '', 'RISHABH SHUKLA', '1509121042', 3, 1, 9, 0, 1),
(2664, '', 'SANDEEP BELDAR', '1509121044', 3, 1, 9, 0, 1),
(2665, '', 'SARTHAK VARSHNEY', '1509121045', 3, 1, 9, 0, 1),
(2666, '', 'SAUMYA YADAV', '1509121046', 3, 1, 9, 0, 1),
(2667, '', 'SAUMYAA SINGH', '1509121047', 3, 1, 9, 0, 1),
(2668, '', 'SAURABH YADAV', '1509121048', 3, 1, 9, 0, 1),
(2669, '', 'SHIVAM GUPTA', '1509121049', 3, 1, 9, 0, 1),
(2670, '', 'SHIVAM SHARMA', '1509121050', 3, 1, 9, 0, 1),
(2671, '', 'SHIVAM YADAV', '1509121051', 3, 1, 9, 0, 1),
(2672, '', 'SHIVANGI CHATURVEDI', '1509121052', 3, 1, 9, 0, 1),
(2673, '', 'SHREYONSHI B MISHRA', '1509121053', 3, 1, 9, 0, 1),
(2674, '', 'SHWETANK SHEKHAR SINGH', '1509121054', 3, 1, 9, 0, 1),
(2675, '', 'SNEHA SINGH', '1509121055', 3, 1, 9, 0, 1),
(2676, '', 'SONU KUMAR BHARTI', '1509121056', 3, 1, 9, 0, 1),
(2677, '', 'SOURAV KUMAR SINGH', '1509121057', 3, 1, 9, 0, 1),
(2678, '', 'VAIBHAV SINGH', '1509121059', 3, 1, 9, 0, 1),
(2679, '', 'VATSAL', '1509121060', 3, 1, 9, 0, 1),
(2680, '', 'VINAK GAUR', '1509121061', 3, 1, 9, 0, 1),
(2681, '', 'YASHASVI SINGH', '1509121062', 3, 1, 9, 0, 1),
(2682, '', 'VIVEK SINGH', '1509120111', 3, 1, 9, 0, 1),
(2683, '', 'ABHISHEK RASTOGI', '1609121901', 3, 1, 9, 0, 1),
(2684, '', 'ARPIT  JAIN', '1609121902', 3, 1, 9, 0, 1),
(2685, '', 'DEEPALI  AGRAWAL', '1609121903', 3, 1, 9, 0, 1),
(2686, '', 'MOHOMMAD SALMAN ANSARI', '1609121904', 3, 1, 9, 0, 1),
(2687, '', 'SAURABH  SHARMA', '1609121905', 3, 1, 9, 0, 1),
(2688, '', 'SUSHIL  KUMAR', '1609121906', 3, 1, 9, 0, 1),
(2689, '', 'VIJAY  YADAV', '1609121908', 3, 1, 9, 0, 1),
(2690, '', 'AADARSH GOEL', '1509122001', 3, 1, 6, 0, 1),
(2691, '', 'AANCHAL JAIN', '1509122002', 3, 1, 6, 0, 1),
(2692, '', 'ABHEEK CHAKRAVORTY', '1509122003', 3, 1, 6, 0, 1),
(2693, '', 'ABHISHEK KUMAR PATEL', '1509122004', 3, 1, 6, 0, 1),
(2694, '', 'ABHISHEK RAJPUT', '1509122005', 3, 1, 6, 0, 1),
(2695, '', 'ABHISHEK RAWAL', '1509122006', 3, 1, 6, 0, 1),
(2696, '', 'AVINASH SAROJ', '1509122007', 3, 1, 6, 0, 1),
(2697, '', 'AYUSH KUMAR SINGH', '1509122008', 3, 1, 6, 0, 1),
(2698, '', 'BHARTENDRA PRATAP SINGH', '1509122009', 3, 1, 6, 0, 1),
(2699, '', 'BHAVESH MISHRA', '1509122010', 3, 1, 6, 0, 1),
(2700, '', 'BHUMIKA LAKHMANI', '1509122011', 3, 1, 6, 0, 1),
(2701, '', 'DEEPANSHU SAINI', '1509122012', 3, 1, 6, 0, 1),
(2702, '', 'ISHU JAIN', '1509122014', 3, 1, 6, 0, 1),
(2703, '', 'KARTIKA SINGH', '1509122015', 3, 1, 6, 0, 1),
(2704, '', 'MOHD ALAM', '1509122018', 3, 1, 6, 0, 1),
(2705, '', 'PRATEEK KUMAR', '1509122019', 3, 1, 6, 0, 1),
(2706, '', 'PRATEEK PATHAK', '1509122020', 3, 1, 6, 0, 1),
(2707, '', 'PUNEET PANDEY', '1509122022', 3, 1, 6, 0, 1),
(2708, '', 'RAGAV MENHANDIRATTA', '1509122023', 3, 1, 6, 0, 1),
(2709, '', 'RAJ GUBRELE', '1509122024', 3, 1, 6, 0, 1),
(2710, '', 'RAJ KIRTI SINGH', '1509122025', 3, 1, 6, 0, 1),
(2711, '', 'RUSHALI SRIVASTAVA', '1509122026', 3, 1, 6, 0, 1),
(2712, '', 'SAURAV GOSWAMI', '1509122027', 3, 1, 6, 0, 1),
(2713, '', 'SHRUTI NIGAM', '1509122029', 3, 1, 6, 0, 1),
(2714, '', 'SHUBHAM CHAUBEY', '1509122030', 3, 1, 6, 0, 1),
(2715, '', 'SOMYA TRIPATHI', '1509122031', 3, 1, 6, 0, 1),
(2716, '', 'TANSHQ', '1509122032', 3, 1, 6, 0, 1),
(2717, '', 'VAIBHAV TRIVEDI', '1509122033', 3, 1, 6, 0, 1),
(2718, '', 'VEDICA AWASTHI', '1509122034', 3, 1, 6, 0, 1),
(2719, '', 'VIKASH VERMA', '1509122035', 3, 1, 6, 0, 1),
(2720, '', 'ANMOL  PATHAK', '1609122901', 3, 1, 6, 0, 1),
(2721, '', 'ABHISHEK SINGH JANGWAN', '1509131901', 3, 1, 3, 0, 1),
(2722, '', 'AAKASH GARG', '1509131001', 3, 1, 3, 0, 1),
(2723, '', 'ABHIJEET KUMAR GUPTA', '1509131002', 3, 1, 3, 0, 1),
(2724, '', 'ABHIJEET SINGH', '1509131003', 3, 1, 3, 0, 1),
(2725, '', 'ABHILASHA BHARDWAJ', '1509131004', 3, 1, 3, 0, 1),
(2726, '', 'ABHISHEK KUMAR GAUTAM', '1509131006', 3, 1, 3, 0, 1),
(2727, '', 'ABHISHEK PRATAP SINGH', '1509131007', 3, 1, 3, 0, 1),
(2728, '', 'ABHISHEK RAZORA', '1509131008', 3, 1, 3, 0, 1),
(2729, '', 'AKARSHIT VERMA', '1509131009', 3, 1, 3, 0, 1),
(2730, '', 'AKASH YADAV', '1509131010', 3, 1, 3, 0, 1),
(2731, '', 'AKSHAY RAWAT', '1509131011', 3, 1, 3, 0, 1),
(2732, '', 'AKSHITA SAHNEY', '1509131012', 3, 1, 3, 0, 1),
(2733, '', 'ALKESH SRIVASTAVA', '1509131013', 3, 1, 3, 0, 1),
(2734, '', 'AMAN VERMA', '1509131014', 3, 1, 3, 0, 1),
(2735, '', 'AMISHA SRIVASTAVA', '1509131015', 3, 1, 3, 0, 1),
(2736, '', 'ANJULI AGARWAL', '1509131016', 3, 1, 3, 0, 1),
(2737, '', 'ANSHUL GUPTA', '1509131017', 3, 1, 3, 0, 1),
(2738, '', 'ANUDESH PRATAP', '1509131018', 3, 1, 3, 0, 1),
(2739, '', 'ANUKRITI TYAGI', '1509131019', 3, 1, 3, 0, 1),
(2740, '', 'ANURAG CHOWDHARY', '1509131020', 3, 1, 3, 0, 1),
(2741, '', 'ANURAG SRIVASTAVA', '1509131021', 3, 1, 3, 0, 1),
(2742, '', 'APOORVA', '1509131023', 3, 1, 3, 0, 1),
(2743, '', 'APOORVA SHUKLA', '1509131024', 3, 1, 3, 0, 1),
(2744, '', 'ARJIT CHAURASIA', '1509131025', 3, 1, 3, 0, 1),
(2745, '', 'ASHUTOSH NAUTIYAL', '1509131026', 3, 1, 3, 0, 1),
(2746, '', 'ATUL KUMAR CHAUDHARY', '1509131027', 3, 1, 3, 0, 1),
(2747, '', 'ATUL RAJ', '1509131028', 3, 1, 3, 0, 1),
(2748, '', 'ATUL SHARMA', '1509131029', 3, 1, 3, 0, 1),
(2749, '', 'AVICHAL SINGH', '1509131030', 3, 1, 3, 0, 1),
(2750, '', 'AYUSH SINGH RAGHUVANSHI', '1509131032', 3, 1, 3, 0, 1),
(2751, '', 'CHANDRA MOHAN', '1509131035', 3, 1, 3, 0, 1),
(2752, '', 'DANISH AHMAD', '1509131036', 3, 1, 3, 0, 1),
(2753, '', 'DEEP KRISHNAN', '1509131037', 3, 1, 3, 0, 1),
(2754, '', 'DIVYA AGRAWAL', '1509131038', 3, 1, 3, 0, 1),
(2755, '', 'DIVYANSH GAUBA', '1509131039', 3, 1, 3, 0, 1),
(2756, '', 'DIVYANSH KUMAR SINGH', '1509131040', 3, 1, 3, 0, 1),
(2757, '', 'DUSHYANT SINGH', '1509131041', 3, 1, 3, 0, 1),
(2758, '', 'GARIMA AGARWAL', '1509131042', 3, 1, 3, 0, 1),
(2759, '', 'GAURAW KUMAR SINGH', '1509131043', 3, 1, 3, 0, 1),
(2760, '', 'HARSHITA SHAKYA', '1509131044', 3, 1, 3, 0, 1),
(2761, '', 'HEMANT SONKAR', '1509131045', 3, 1, 3, 0, 1),
(2762, '', 'ISHAN DALELA', '1509131046', 3, 1, 3, 0, 1),
(2763, '', 'ISHU ANAND', '1509131047', 3, 1, 3, 0, 1),
(2764, '', 'JATIN YADAV', '1509131048', 3, 1, 3, 0, 1),
(2765, '', 'JIGYASA BISHT', '1509131049', 3, 1, 3, 0, 1),
(2766, '', 'KANCHAN JAISWAL', '1509131050', 3, 1, 3, 0, 1),
(2767, '', 'KANIKA GUPTA', '1509131051', 3, 1, 3, 0, 1),
(2768, '', 'KARTIK SAINI', '1509131052', 3, 1, 3, 0, 1),
(2769, '', 'KARTIKEY SINGH CHAUHAN', '1509131053', 3, 1, 3, 0, 1),
(2770, '', 'KRITI AGARWAL', '1509131054', 3, 1, 3, 0, 1),
(2771, '', 'KRITI SAHU', '1509131055', 3, 1, 3, 0, 1),
(2772, '', 'KUMAR SUDHANSHU', '1509131057', 3, 1, 3, 0, 1),
(2773, '', 'MEGHA SHARMA', '1509131058', 3, 1, 3, 0, 1),
(2774, '', 'MEGHAL JAIN', '1509131059', 3, 1, 3, 0, 1),
(2775, '', 'MOHIKA MADAHAR', '1509131060', 3, 1, 3, 0, 1),
(2776, '', 'MUKUL SAGAR', '1509131061', 3, 1, 3, 0, 1),
(2777, '', 'NIKHIL KUMAR', '1509131062', 3, 1, 3, 0, 1),
(2778, '', 'NIKHIL KUMAR', '1509131063', 3, 1, 3, 0, 1),
(2779, '', 'NITIN KAUSHIK', '1509131064', 3, 1, 3, 0, 1),
(2780, '', 'PANKAJ VERMA', '1509131067', 3, 1, 3, 0, 1),
(2781, '', 'PRABHAT KUMAR RAI', '1509131068', 3, 1, 3, 0, 1),
(2782, '', 'PRACHET BHATTACHARYA', '1509131069', 3, 1, 3, 0, 1),
(2783, '', 'PRAJWAL GOEL', '1509131070', 3, 1, 3, 0, 1),
(2784, '', 'PRAKHAR SRIVASTAVA', '1509131071', 3, 1, 3, 0, 1),
(2785, '', 'PRANAV YADAV', '1509131072', 3, 1, 3, 0, 1),
(2786, '', 'PRANKUR SINGH', '1509131073', 3, 1, 3, 0, 1),
(2787, '', 'PRANKUR VERMA', '1509131074', 3, 1, 3, 0, 1),
(2788, '', 'PRASHANT KUMAR', '1509131075', 3, 1, 3, 0, 1),
(2789, '', 'PRASHANT SINGH', '1509131076', 3, 1, 3, 0, 1),
(2790, '', 'PRATEEK SAXENA', '1509131077', 3, 1, 3, 0, 1),
(2791, '', 'PRAVI GAUTAM', '1509131078', 3, 1, 3, 0, 1),
(2792, '', 'RAJAT SRIVASTAVA', '1509131079', 3, 1, 3, 0, 1),
(2793, '', 'RAJNISH SHUKLA', '1509131080', 3, 1, 3, 0, 1),
(2794, '', 'RAKSHIT TYAGI', '1509131081', 3, 1, 3, 0, 1),
(2795, '', 'RICHA JAIN', '1509131082', 3, 1, 3, 0, 1),
(2796, '', 'RISHABH HANDA', '1509131083', 3, 1, 3, 0, 1),
(2797, '', 'RISHABH SINGH', '1509131084', 3, 1, 3, 0, 1),
(2798, '', 'RISHABH SRIVASTAVA', '1509131085', 3, 1, 3, 0, 1),
(2799, '', 'RITIKA MAKAR', '1509131086', 3, 1, 3, 0, 1),
(2800, '', 'RIYA JOSHI', '1509131087', 3, 1, 3, 0, 1),
(2801, '', 'SAHINOOR ALAM', '1509131089', 3, 1, 3, 0, 1),
(2802, '', 'SAKSHAM KATIYAR', '1509131090', 3, 1, 3, 0, 1),
(2803, '', 'SAKSHI SACHAN', '1509131091', 3, 1, 3, 0, 1),
(2804, '', 'SALONI AGGARWAL', '1509131092', 3, 1, 3, 0, 1),
(2805, '', 'SALONI SHARMA', '1509131093', 3, 1, 3, 0, 1),
(2806, '', 'SAMYAK JAIN', '1509131094', 3, 1, 3, 0, 1),
(2807, '', 'SANDEEP KUMAR SINGHANI', '1509131095', 3, 1, 3, 0, 1),
(2808, '', 'SARTHAK GUPTA', '1509131096', 3, 1, 3, 0, 1),
(2809, '', 'SAUMYA SINGHAL', '1509131097', 3, 1, 3, 0, 1),
(2810, '', 'SHARAN VERMA', '1509131098', 3, 1, 3, 0, 1),
(2811, '', 'SHEFALI PANDEY', '1509131099', 3, 1, 3, 0, 1),
(2812, '', 'SHIKHAR AGARWAL', '1509131100', 3, 1, 3, 0, 1),
(2813, '', 'SHIVAM BABBAR', '1509131101', 3, 1, 3, 0, 1),
(2814, '', 'SHIVANI SOMVANSHI', '1509131102', 3, 1, 3, 0, 1),
(2815, '', 'SHOAIB JAMEEL KHAN', '1509131103', 3, 1, 3, 0, 1),
(2816, '', 'SHREYA GUPTA', '1509131104', 3, 1, 3, 0, 1),
(2817, '', 'SHREYAS SINGH', '1509131105', 3, 1, 3, 0, 1),
(2818, '', 'SHRI HARI', '1509131106', 3, 1, 3, 0, 1),
(2819, '', 'SHRISHTI CHAURASIA', '1509131107', 3, 1, 3, 0, 1),
(2820, '', 'SHRISHTI GUPTA', '1509131108', 3, 1, 3, 0, 1),
(2821, '', 'SHRUTI SINGH', '1509131109', 3, 1, 3, 0, 1),
(2822, '', 'SHUBHAM VERMA', '1509131110', 3, 1, 3, 0, 1),
(2823, '', 'SIDDHANT BHAGAT', '1509131111', 3, 1, 3, 0, 1),
(2824, '', 'SOMYA VERMA', '1509131112', 3, 1, 3, 0, 1),
(2825, '', 'SRISHTI SINHA', '1509131113', 3, 1, 3, 0, 1),
(2826, '', 'TUSHAR SINGH', '1509131114', 3, 1, 3, 0, 1),
(2827, '', 'UJJAWAL SHAILY', '1509131115', 3, 1, 3, 0, 1),
(2828, '', 'UPANSHU SRIVASTAVA', '1509131116', 3, 1, 3, 0, 1),
(2829, '', 'VAIBHAV DUBEY', '1509131117', 3, 1, 3, 0, 1),
(2830, '', 'VAIBHAV KARGETI', '1509131118', 3, 1, 3, 0, 1),
(2831, '', 'VARUN KUMAR', '1509131119', 3, 1, 3, 0, 1),
(2832, '', 'VISHAL KUMAR', '1509131121', 3, 1, 3, 0, 1),
(2833, '', 'VISHAL TYAGI', '1509131122', 3, 1, 3, 0, 1),
(2834, '', 'YASHVARDHAN', '1509131123', 3, 1, 3, 0, 1),
(2835, '', 'ANJUL SRIVASTAV', '1509113018', 3, 1, 3, 0, 1),
(2836, '', 'MOHINI GUPTA', '1509113059', 3, 1, 3, 0, 1),
(2837, '', 'RAJAT NANDAN PANDEY', '1509120060', 3, 1, 3, 0, 1),
(2838, '', 'SHIVENDRA KUMAR PORWAL', '1509120086', 3, 1, 3, 0, 1),
(2839, '', 'ADITI SHUKLA', '1509121007', 3, 1, 3, 0, 1),
(2840, '', 'RAJAT MISHRA', '1509121038', 3, 1, 3, 0, 1),
(2841, '', 'ROHAN KUMAR SONI', '1509121043', 3, 1, 3, 0, 1),
(2842, '', 'ISHU BHARDWAJ', '1509122013', 3, 1, 3, 0, 1),
(2843, '', 'PRAVEEN KUMAR', '1509122021', 3, 1, 3, 0, 1),
(2844, '', 'ABHISHEK  SINGH', '1609131801', 3, 1, 3, 0, 1),
(2845, '', 'ANKIT  PACHAURI', '1609131901', 3, 1, 3, 0, 1),
(2846, '', 'BRIJESH KR DIXIT', '1609131902', 3, 1, 3, 0, 1),
(2847, '', 'CHANDRA PRAKASH GAUTAM', '1609131903', 3, 1, 3, 0, 1),
(2848, '', 'RAVI PRAKASH CHANDRA', '1609131906', 3, 1, 3, 0, 1),
(2849, '', 'SATYA  PRAKASH', '1609131907', 3, 1, 3, 0, 1),
(2850, '', 'SURUCHI  MISHRA', '1609131908', 3, 1, 3, 0, 1),
(2851, '', 'VIKASHDEEP  SINGH', '1609131909', 3, 1, 3, 0, 1),
(2852, '', 'VINAY KUMAR SINGH', '1609131910', 3, 1, 3, 0, 1),
(2853, '', 'VIPUL  DEV', '1609131911', 3, 1, 3, 0, 1),
(2854, '', 'SHASHWAT SINGH', '1409140137', 3, 1, 8, 0, 1),
(2855, '', 'ANUBHAV VERMA', '1409140031', 3, 1, 8, 0, 1),
(2856, '', 'APARARK PANDEY', '1409140035', 3, 1, 8, 0, 1),
(2857, '', 'AZAHARUDDIN', '1409140046', 3, 1, 8, 0, 1),
(2858, '', 'SIDDHARTH BILLA', '1409140153', 3, 1, 8, 0, 1),
(2859, '', 'AABHAS PRADHAN', '1509140001', 3, 1, 8, 0, 1),
(2860, '', 'AAKASH KAPOOR', '1509140002', 3, 1, 8, 0, 1),
(2861, '', 'AAYUSH MANGAL', '1509140003', 3, 1, 8, 0, 1),
(2862, '', 'ABHIJEET KUMAR', '1509140005', 3, 1, 8, 0, 1),
(2863, '', 'ABHIJEET SINGH', '1509140006', 3, 1, 8, 0, 1),
(2864, '', 'ABHINAV KUMAR YADAV', '1509140007', 3, 1, 8, 0, 1),
(2865, '', 'ABHISHEK ANANT GARG', '1509140009', 3, 1, 8, 0, 1),
(2866, '', 'ABHISHEK BERA', '1509140010', 3, 1, 8, 0, 1),
(2867, '', 'ABHISHEK DUBEY', '1509140011', 3, 1, 8, 0, 1),
(2868, '', 'ABHISHEK KUMAR', '1509140012', 3, 1, 8, 0, 1),
(2869, '', 'ABHISHEK SINGH', '1509140013', 3, 1, 8, 0, 1),
(2870, '', 'ABHISHEK SRIVASTAVA', '1509140014', 3, 1, 8, 0, 1),
(2871, '', 'ABHISHEKH KUMAR SRIVASTAVA', '1509140015', 3, 1, 8, 0, 1),
(2872, '', 'ADARSH KUMAR GUPTA', '1509140016', 3, 1, 8, 0, 1),
(2873, '', 'ADARSH SETHI', '1509140017', 3, 1, 8, 0, 1),
(2874, '', 'ADARSH YADAV', '1509140018', 3, 1, 8, 0, 1),
(2875, '', 'ADITYA PRATAP SINGH', '1509140019', 3, 1, 8, 0, 1),
(2876, '', 'ADNAN ABDULLAH', '1509140020', 3, 1, 8, 0, 1),
(2877, '', 'AJEET KUMAR', '1509140021', 3, 1, 8, 0, 1),
(2878, '', 'AJEET PRATAP SINGH', '1509140022', 3, 1, 8, 0, 1),
(2879, '', 'AKANKSHA YADAV', '1509140023', 3, 1, 8, 0, 1),
(2880, '', 'AKARSH SINGH', '1509140024', 3, 1, 8, 0, 1),
(2881, '', 'AKASH AGGARWAL', '1509140025', 3, 1, 8, 0, 1),
(2882, '', 'AKASH KUMAR', '1509140026', 3, 1, 8, 0, 1),
(2883, '', 'AKSHIT SINGH', '1509140027', 3, 1, 8, 0, 1),
(2884, '', 'ALOK KUMAR', '1509140028', 3, 1, 8, 0, 1),
(2885, '', 'AMAN AGARWAL', '1509140029', 3, 1, 8, 0, 1),
(2886, '', 'AMAN CHAURASIA', '1509140030', 3, 1, 8, 0, 1),
(2887, '', 'AMAN PANDEY', '1509140031', 3, 1, 8, 0, 1),
(2888, '', 'AMAN RAY', '1509140032', 3, 1, 8, 0, 1),
(2889, '', 'AMIT MAURYA', '1509140033', 3, 1, 8, 0, 1),
(2890, '', 'AMULYA RATNA', '1509140034', 3, 1, 8, 0, 1),
(2891, '', 'ANIKATE KHANDELWAL', '1509140035', 3, 1, 8, 0, 1),
(2892, '', 'ANKIT CHAUDHARY', '1509140036', 3, 1, 8, 0, 1),
(2893, '', 'ANKIT KUMAR', '1509140037', 3, 1, 8, 0, 1),
(2894, '', 'ANKUR SINGH', '1509140038', 3, 1, 8, 0, 1),
(2895, '', 'ANMOL GUPTA', '1509140039', 3, 1, 8, 0, 1),
(2896, '', 'ANSHUMAN SINGH', '1509140040', 3, 1, 8, 0, 1),
(2897, '', 'ANUBHAV', '1509140041', 3, 1, 8, 0, 1),
(2898, '', 'ANUJ SHARMA', '1509140042', 3, 1, 8, 0, 1),
(2899, '', 'ANUJ SINGH', '1509140043', 3, 1, 8, 0, 1),
(2900, '', 'ANUPAM SRIVASTAVA', '1509140044', 3, 1, 8, 0, 1),
(2901, '', 'ANUPAM TRIPATHI', '1509140045', 3, 1, 8, 0, 1),
(2902, '', 'ANURAG MISHRA', '1509140046', 3, 1, 8, 0, 1),
(2903, '', 'ANURAG SINGH', '1509140047', 3, 1, 8, 0, 1),
(2904, '', 'ANURAG SINGH', '1509140048', 3, 1, 8, 0, 1),
(2905, '', 'APOORVA HARSH YADAV', '1509140049', 3, 1, 8, 0, 1),
(2906, '', 'AQUIB MUNIR', '1509140050', 3, 1, 8, 0, 1),
(2907, '', 'ARPIT KUMAR', '1509140051', 3, 1, 8, 0, 1),
(2908, '', 'ARUSH TIWARI', '1509140052', 3, 1, 8, 0, 1),
(2909, '', 'ASHIF IQBAL KHAN', '1509140053', 3, 1, 8, 0, 1),
(2910, '', 'ASHISH KUMAR RAJPOOT', '1509140054', 3, 1, 8, 0, 1),
(2911, '', 'ASHUTOSH ATTRI', '1509140055', 3, 1, 8, 0, 1),
(2912, '', 'ASHUTOSH PRIYA VATS', '1509140057', 3, 1, 8, 0, 1),
(2913, '', 'ASHUTOSH RAWAT', '1509140058', 3, 1, 8, 0, 1),
(2914, '', 'AYUSH SINGH', '1509140059', 3, 1, 8, 0, 1),
(2915, '', 'AYUSH SRIVASTAVA', '1509140060', 3, 1, 8, 0, 1),
(2916, '', 'BHARAT BHUSHAN', '1509140061', 3, 1, 8, 0, 1),
(2917, '', 'BHASKAR PATHAK', '1509140062', 3, 1, 8, 0, 1),
(2918, '', 'BHUVAN KUMAR', '1509140063', 3, 1, 8, 0, 1),
(2919, '', 'CHETAN KUMAR', '1509140064', 3, 1, 8, 0, 1),
(2920, '', 'DEEPANK ARYA', '1509140065', 3, 1, 8, 0, 1),
(2921, '', 'DEWANSH PODDAR', '1509140066', 3, 1, 8, 0, 1),
(2922, '', 'DIVY TULSYAN', '1509140067', 3, 1, 8, 0, 1),
(2923, '', 'DIVYANSH GANDHI', '1509140068', 3, 1, 8, 0, 1),
(2924, '', 'GAURAV PANDA', '1509140069', 3, 1, 8, 0, 1),
(2925, '', 'HARSH DWIVEDI', '1509140070', 3, 1, 8, 0, 1),
(2926, '', 'HARSH RASTOGI', '1509140071', 3, 1, 8, 0, 1),
(2927, '', 'HARSHIT BAJPAI', '1509140072', 3, 1, 8, 0, 1),
(2928, '', 'HEMENDRA KUMAR', '1509140074', 3, 1, 8, 0, 1),
(2929, '', 'HIMANSHU SINGH', '1509140075', 3, 1, 8, 0, 1),
(2930, '', 'ISHANK BHAMA', '1509140076', 3, 1, 8, 0, 1),
(2931, '', 'ISHTIYAK AHMAD', '1509140077', 3, 1, 8, 0, 1),
(2932, '', 'JATIN SHARMA', '1509140078', 3, 1, 8, 0, 1),
(2933, '', 'KARAN JINDAL', '1509140079', 3, 1, 8, 0, 1),
(2934, '', 'KAUSHAL KUMAR', '1509140080', 3, 1, 8, 0, 1),
(2935, '', 'KISHAN GUPTA', '1509140081', 3, 1, 8, 0, 1),
(2936, '', 'KULDEEP CHAUDHARY', '1509140082', 3, 1, 8, 0, 1),
(2937, '', 'KUSH KUMAR', '1509140083', 3, 1, 8, 0, 1),
(2938, '', 'MADHAV KRISHN', '1509140084', 3, 1, 8, 0, 1),
(2939, '', 'MANISH BHATI', '1509140085', 3, 1, 8, 0, 1),
(2940, '', 'MANOJ YADAV', '1509140086', 3, 1, 8, 0, 1),
(2941, '', 'MOHAMMAD SHAHBAZ HUSAIN KHAN', '1509140087', 3, 1, 8, 0, 1),
(2942, '', 'MOHD ANAS MUSTAQEEM', '1509140088', 3, 1, 8, 0, 1),
(2943, '', 'MUDIT SRIVASTA', '1509140089', 3, 1, 8, 0, 1),
(2944, '', 'MUKUL MISHRA', '1509140090', 3, 1, 8, 0, 1),
(2945, '', 'MUKUND SRIVASTAVA', '1509140091', 3, 1, 8, 0, 1),
(2946, '', 'MUSTAFA KAMAAL', '1509140092', 3, 1, 8, 0, 1),
(2947, '', 'NAMAN BHARWAJ', '1509140093', 3, 1, 8, 0, 1),
(2948, '', 'NARANG KUMAR BHARDWAJ', '1509140094', 3, 1, 8, 0, 1),
(2949, '', 'NEESHU DIXIT', '1509140096', 3, 1, 8, 0, 1),
(2950, '', 'NIKHIL PURWAR', '1509140097', 3, 1, 8, 0, 1),
(2951, '', 'NISHANT', '1509140098', 3, 1, 8, 0, 1),
(2952, '', 'NISHIT VISHWAKARMA', '1509140100', 3, 1, 8, 0, 1),
(2953, '', 'NIZAMUDDIN ANSARI', '1509140101', 3, 1, 8, 0, 1),
(2954, '', 'PARAS SAINI', '1509140102', 3, 1, 8, 0, 1),
(2955, '', 'PAWAN KUMAR SAHU', '1509140103', 3, 1, 8, 0, 1),
(2956, '', 'PIYUSH BARANWAL', '1509140104', 3, 1, 8, 0, 1),
(2957, '', 'PIYUSH SAGAR', '1509140105', 3, 1, 8, 0, 1),
(2958, '', 'PIYUSH SINGH', '1509140106', 3, 1, 8, 0, 1),
(2959, '', 'PRAGYA GOYAL', '1509140107', 3, 1, 8, 0, 1),
(2960, '', 'PRAKHAR KHANNA', '1509140108', 3, 1, 8, 0, 1),
(2961, '', 'PRANAV MISHRA', '1509140109', 3, 1, 8, 0, 1),
(2962, '', 'PRANJAL KULSHRESTHA', '1509140110', 3, 1, 8, 0, 1),
(2963, '', 'PRANJAL KUMAR', '1509140111', 3, 1, 8, 0, 1),
(2964, '', 'PRASHANT MISHRA', '1509140112', 3, 1, 8, 0, 1),
(2965, '', 'PRASHANT PRATAP SINGH', '1509140113', 3, 1, 8, 0, 1),
(2966, '', 'PRASHANT SINGH', '1509140114', 3, 1, 8, 0, 1),
(2967, '', 'PRASHANT VARSHNEY', '1509140115', 3, 1, 8, 0, 1),
(2968, '', 'PRATYUSH KUMAR SINGH', '1509140116', 3, 1, 8, 0, 1),
(2969, '', 'PREETI VERMA', '1509140117', 3, 1, 8, 0, 1),
(2970, '', 'PUSHPENDRA SINGH', '1509140118', 3, 1, 8, 0, 1),
(2971, '', 'RACHIT NAUTIYAL', '1509140119', 3, 1, 8, 0, 1),
(2972, '', 'RAJAL SINGH', '1509140120', 3, 1, 8, 0, 1),
(2973, '', 'RAJAT SHRIVASTVA', '1509140121', 3, 1, 8, 0, 1),
(2974, '', 'RAJEEV VERMA', '1509140122', 3, 1, 8, 0, 1),
(2975, '', 'RESHAM CHANDRA', '1509140123', 3, 1, 8, 0, 1),
(2976, '', 'RISHABH SINGH', '1509140124', 3, 1, 8, 0, 1),
(2977, '', 'ROHAN VANJANI', '1509140125', 3, 1, 8, 0, 1),
(2978, '', 'ROHIT BARMAN', '1509140126', 3, 1, 8, 0, 1),
(2979, '', 'ROHIT YADAV', '1509140127', 3, 1, 8, 0, 1),
(2980, '', 'RUDRESHWAR SINGH', '1509140128', 3, 1, 8, 0, 1),
(2981, '', 'RUSTAM SINGH', '1509140129', 3, 1, 8, 0, 1),
(2982, '', 'SACHINDRA PRATAP SINGH', '1509140130', 3, 1, 8, 0, 1),
(2983, '', 'SADDAM', '1509140131', 3, 1, 8, 0, 1),
(2984, '', 'SARTHAK KUMAR', '1509140132', 3, 1, 8, 0, 1),
(2985, '', 'SARVESH SINGH', '1509140133', 3, 1, 8, 0, 1),
(2986, '', 'SAUMYA SHREY', '1509140134', 3, 1, 8, 0, 1),
(2987, '', 'SAURABH KUMAR', '1509140135', 3, 1, 8, 0, 1),
(2988, '', 'SAURABH SINGH', '1509140136', 3, 1, 8, 0, 1),
(2989, '', 'SAURABH SINGH', '1509140137', 3, 1, 8, 0, 1),
(2990, '', 'SAURABH VERMA', '1509140138', 3, 1, 8, 0, 1),
(2991, '', 'SHANTANU SINGH CHAUHAN', '1509140139', 3, 1, 8, 0, 1),
(2992, '', 'SHEKHAR NAGAR', '1509140140', 3, 1, 8, 0, 1),
(2993, '', 'SHIVAM', '1509140141', 3, 1, 8, 0, 1),
(2994, '', 'SHIVAM SINGH', '1509140142', 3, 1, 8, 0, 1),
(2995, '', 'SHIVANSHU MEROTHIA', '1509140143', 3, 1, 8, 0, 1),
(2996, '', 'SHIVENDRA MOHAN DAS', '1509140144', 3, 1, 8, 0, 1),
(2997, '', 'SHOBHA SINGH', '1509140145', 3, 1, 8, 0, 1),
(2998, '', 'SHOBHIT RAJ SINGH', '1509140146', 3, 1, 8, 0, 1),
(2999, '', 'SHRUTI KIRTI AWASTHI', '1509140147', 3, 1, 8, 0, 1),
(3000, '', 'SHUBHAM HANS', '1509140148', 3, 1, 8, 0, 1),
(3001, '', 'SHUBHAM MAURYA', '1509140149', 3, 1, 8, 0, 1),
(3002, '', 'SHUBHAM SINGH', '1509140150', 3, 1, 8, 0, 1),
(3003, '', 'SHUBHAM SINGH', '1509140151', 3, 1, 8, 0, 1),
(3004, '', 'SHUBHAM YADAV', '1509140152', 3, 1, 8, 0, 1),
(3005, '', 'SHUBHANSHU BISHT', '1509140153', 3, 1, 8, 0, 1),
(3006, '', 'SIDDHANT GUPTA', '1509140154', 3, 1, 8, 0, 1),
(3007, '', 'SIDDHANT SINGH', '1509140155', 3, 1, 8, 0, 1),
(3008, '', 'SIDDHARTH SHUKLA', '1509140157', 3, 1, 8, 0, 1),
(3009, '', 'SIDDHARTH SINGH', '1509140158', 3, 1, 8, 0, 1),
(3010, '', 'SIDDHARTH YADAV', '1509140159', 3, 1, 8, 0, 1),
(3011, '', 'SIDDHARTH YADAV', '1509140160', 3, 1, 8, 0, 1),
(3012, '', 'SIDDHARTHA JOHRI', '1509140161', 3, 1, 8, 0, 1),
(3013, '', 'SIDHARTH SHARESHTH VERMA', '1509140162', 3, 1, 8, 0, 1),
(3014, '', 'SUJAY S RAINA', '1509140163', 3, 1, 8, 0, 1),
(3015, '', 'SUMIT', '1509140164', 3, 1, 8, 0, 1),
(3016, '', 'SUMIT KUMAR', '1509140165', 3, 1, 8, 0, 1),
(3017, '', 'SUYASH RAJ MISHRA', '1509140166', 3, 1, 8, 0, 1),
(3018, '', 'TANVEER RAZA', '1509140167', 3, 1, 8, 0, 1),
(3019, '', 'TRILOKI NATH UMAR VAISHYA', '1509140168', 3, 1, 8, 0, 1),
(3020, '', 'TULIKA SINGH', '1509140169', 3, 1, 8, 0, 1),
(3021, '', 'UDITANSH SINGHAL', '1509140170', 3, 1, 8, 0, 1),
(3022, '', 'UTKARSH MISHRA', '1509140171', 3, 1, 8, 0, 1),
(3023, '', 'VARDAAN AGARWAL', '1509140172', 3, 1, 8, 0, 1),
(3024, '', 'VATSALA TYAGI', '1509140173', 3, 1, 8, 0, 1),
(3025, '', 'VIBHOR KUMAR JAIN', '1509140174', 3, 1, 8, 0, 1),
(3026, '', 'VIKAS KAUSHAL', '1509140175', 3, 1, 8, 0, 1),
(3027, '', 'VIKASH CHANDRA', '1509140176', 3, 1, 8, 0, 1),
(3028, '', 'VIKRAM ANAND', '1509140177', 3, 1, 8, 0, 1),
(3029, '', 'VINEET KUMAR TRIPATHI', '1509140178', 3, 1, 8, 0, 1),
(3030, '', 'VIRAT SINGH', '1509140179', 3, 1, 8, 0, 1),
(3031, '', 'VISHAKH MEHTA', '1509140180', 3, 1, 8, 0, 1),
(3032, '', 'VISHAL THAKUR', '1509140181', 3, 1, 8, 0, 1),
(3033, '', 'VISHNUKANT SIKARWAR', '1509140182', 3, 1, 8, 0, 1),
(3034, '', 'VIVEK GAUTAM', '1509140183', 3, 1, 8, 0, 1),
(3035, '', 'VIVEK PRATAP SINGH', '1509140184', 3, 1, 8, 0, 1),
(3036, '', 'YASH AGARWAL', '1509140185', 3, 1, 8, 0, 1),
(3037, '', 'YASH SRIVASTAVA', '1509140186', 3, 1, 8, 0, 1),
(3038, '', 'YASHI MITTAL', '1509140187', 3, 1, 8, 0, 1),
(3039, '', 'YASOOB ABBAS', '1509140188', 3, 1, 8, 0, 1),
(3040, '', 'HARSH CHAUDHARY', '1509100045', 3, 1, 8, 0, 1),
(3041, '', 'SAKSHAM DIXIT', '1509113084', 3, 1, 8, 0, 1),
(3042, '', 'GIRDHAR GOPAL', '1509120041', 3, 1, 8, 0, 1),
(3043, '', 'SHIVA AGRAWAL', '1509120081', 3, 1, 8, 0, 1),
(3044, '', 'AMAN TRIPATHI', '1509121012', 3, 1, 8, 0, 1),
(3045, '', 'MADHAV DAS MAJUMDAR', '1509121028', 3, 1, 8, 0, 1),
(3046, '', 'ABHISHEK  SHARMA', '1609140901', 3, 1, 8, 0, 1),
(3047, '', 'ABHISHEK  VERMA', '1609140902', 3, 1, 8, 0, 1),
(3048, '', 'AJAY KUMAR SINGH', '1609140904', 3, 1, 8, 0, 1),
(3049, '', 'AKSHAY  SINGH', '1609140906', 3, 1, 8, 0, 1),
(3050, '', 'AMAN  ASIJA', '1609140907', 3, 1, 8, 0, 1),
(3051, '', 'AMIR  ANSARI', '1609140908', 3, 1, 8, 0, 1),
(3052, '', 'AMIT KUMAR GUPTA', '1609140909', 3, 1, 8, 0, 1),
(3053, '', 'AMOD  KUMAR', '1609140910', 3, 1, 8, 0, 1),
(3054, '', 'ANGAD KUMAR PANDEY', '1609140911', 3, 1, 8, 0, 1),
(3055, '', 'ARUN KUMAR SHARMA', '1609140912', 3, 1, 8, 0, 1),
(3056, '', 'BHOOMIKA  KUMAR', '1609140913', 3, 1, 8, 0, 1),
(3057, '', 'CHARWAK', '1609140914', 3, 1, 8, 0, 1),
(3058, '', 'DEEPESH  VARSHNEY', '1609140915', 3, 1, 8, 0, 1),
(3059, '', 'FARAZ  AHMAD', '1609140916', 3, 1, 8, 0, 1),
(3060, '', 'GAURAV KUMAR MISHRA', '1609140917', 3, 1, 8, 0, 1),
(3061, '', 'HIMANSHU SHEKHAR SINGH', '1609140918', 3, 1, 8, 0, 1),
(3062, '', 'JITENDRA  KUMAR', '1609140919', 3, 1, 8, 0, 1),
(3063, '', 'KINJU  RAI', '1609140920', 3, 1, 8, 0, 1),
(3064, '', 'MANISH  KUMAR', '1609140921', 3, 1, 8, 0, 1),
(3065, '', 'MOHD BILAL LAIQUE', '1609140922', 3, 1, 8, 0, 1),
(3066, '', 'MUKUL  KUMAR', '1609140923', 3, 1, 8, 0, 1),
(3067, '', 'PAWAN  YADAV', '1609140924', 3, 1, 8, 0, 1),
(3068, '', 'PRAMOD YADAV', '1609140925', 3, 1, 8, 0, 1),
(3069, '', 'PRASHANT  KUMAR', '1609140926', 3, 1, 8, 0, 1),
(3070, '', 'SAURABH  KUMAR', '1609140928', 3, 1, 8, 0, 1),
(3071, '', 'SHIVAM  GUPTA', '1609140929', 3, 1, 8, 0, 1),
(3072, '', 'SHUBHAM  SHUKLA', '1609140930', 3, 1, 8, 0, 1),
(3073, '', 'SOURABH', '1609140931', 3, 1, 8, 0, 1),
(3074, '', 'TABSHEER  HUSSAIN', '1609140932', 3, 1, 8, 0, 1),
(3075, '', 'TUSHAR PRATAP SINGH', '1609140933', 3, 1, 8, 0, 1),
(3076, '', 'YASH PAL SINGH', '1609140935', 3, 1, 8, 0, 1),
(3077, '', 'SALMAN AKHTAR', '1609140801', 3, 1, 8, 0, 1),
(3078, '', 'DIKSHA', '1309140029', 4, 1, 8, 0, 1),
(3079, '', 'DEV KARTIK SHARMA', '1309140028', 4, 1, 8, 0, 1),
(3080, '', 'MOHD EKRAMA', '1309140051', 4, 1, 8, 0, 1),
(3081, '', 'SUMIT KUMAR RAI', '1409140924', 4, 1, 8, 0, 1),
(3082, '', 'NIKHIL  TANVAR', '1309140059', 4, 1, 8, 0, 1),
(3083, '', 'AABIR  MOHIN', '1409140001', 4, 1, 8, 0, 1),
(3084, '', 'AAKASH  CHAPRANA', '1409140002', 4, 1, 8, 0, 1),
(3085, '', 'AAYUSH  VERMA', '1409140003', 4, 1, 8, 0, 1),
(3086, '', 'ABHAY PRATAP SINGH GURJAR', '1409140004', 4, 1, 8, 0, 1),
(3087, '', 'ABHISARTH  GUPTA', '1409140006', 4, 1, 8, 0, 1),
(3088, '', 'ABHISHEK  JAISWAL', '1409140007', 4, 1, 8, 0, 1),
(3089, '', 'ABHISHEK  KUMAR', '1409140008', 4, 1, 8, 0, 1),
(3090, '', 'ABHISHEK  KUMAR', '1409140009', 4, 1, 8, 0, 1),
(3091, '', 'ABHISHEK  RAI', '1409140010', 4, 1, 8, 0, 1),
(3092, '', 'ABHISHEK  RAJPUT', '1409140011', 4, 1, 8, 0, 1),
(3093, '', 'ADARSH  VERMA', '1409140012', 4, 1, 8, 0, 1),
(3094, '', 'ADITYA  KUMAR', '1409140013', 4, 1, 8, 0, 1),
(3095, '', 'ADITYA  TIWARI', '1409140014', 4, 1, 8, 0, 1),
(3096, '', 'AISHWARYA  JHA', '1409140015', 4, 1, 8, 0, 1),
(3097, '', 'AJAY  SINGH', '1409140016', 4, 1, 8, 0, 1),
(3098, '', 'AJAZ  AHMAD', '1409140017', 4, 1, 8, 0, 1),
(3099, '', 'AKSHAY  BAJPEYI', '1409140018', 4, 1, 8, 0, 1),
(3100, '', 'AKSHAY  MISHRA', '1409140019', 4, 1, 8, 0, 1),
(3101, '', 'ALOK  BHUSHAN', '1409140020', 4, 1, 8, 0, 1),
(3102, '', 'AMAN  KUSHWAHA', '1409140021', 4, 1, 8, 0, 1),
(3103, '', 'AMANDEEP  SINGH', '1409140022', 4, 1, 8, 0, 1),
(3104, '', 'AMISH  KUMAR', '1409140023', 4, 1, 8, 0, 1),
(3105, '', 'AMIT  JOSHI', '1409140024', 4, 1, 8, 0, 1),
(3106, '', 'ANIRUDH  YADAV', '1409140025', 4, 1, 8, 0, 1),
(3107, '', 'ANKIT KUMAR DIXIT', '1409140026', 4, 1, 8, 0, 1),
(3108, '', 'ANKIT  SINGH', '1409140027', 4, 1, 8, 0, 1),
(3109, '', 'ANKUR KUMAR RAWAT', '1409140028', 4, 1, 8, 0, 1),
(3110, '', 'ANSAB  KHAN', '1409140029', 4, 1, 8, 0, 1),
(3111, '', 'ANUBHAV KR SRIVASTAVA', '1409140030', 4, 1, 8, 0, 1),
(3112, '', 'ANUJ  JAIN', '1409140032', 4, 1, 8, 0, 1),
(3113, '', 'ANUPAM  UPADHYAY', '1409140033', 4, 1, 8, 0, 1),
(3114, '', 'ANURAG  SINGH', '1409140034', 4, 1, 8, 0, 1),
(3115, '', 'ARADHYA  SAXENA', '1409140036', 4, 1, 8, 0, 1),
(3116, '', 'ARPIT  GUPTA', '1409140037', 4, 1, 8, 0, 1),
(3117, '', 'ARUN  KUMAR', '1409140038', 4, 1, 8, 0, 1),
(3118, '', 'ASHISH KUMAR SINGH', '1409140039', 4, 1, 8, 0, 1),
(3119, '', 'ASHISH KUMAR SINGH', '1409140040', 4, 1, 8, 0, 1),
(3120, '', 'ASHISH  SAHU', '1409140041', 4, 1, 8, 0, 1),
(3121, '', 'ASHUTOSH  NAYAK', '1409140042', 4, 1, 8, 0, 1),
(3122, '', 'ASHWANI KUMAR SINGH', '1409140043', 4, 1, 8, 0, 1),
(3123, '', 'ASIM KUMAR GHATAK', '1409140044', 4, 1, 8, 0, 1),
(3124, '', 'AVNISH  KUMAR', '1409140045', 4, 1, 8, 0, 1),
(3125, '', 'BHARAT  BHUSHAN', '1409140048', 4, 1, 8, 0, 1),
(3126, '', 'BHUPENDRA  KASANA', '1409140049', 4, 1, 8, 0, 1),
(3127, '', 'BHUPENDRA  KUMAR', '1409140050', 4, 1, 8, 0, 1),
(3128, '', 'BRIJESH  SINGH', '1409140051', 4, 1, 8, 0, 1),
(3129, '', 'CHANDRANSH  PANDEY', '1409140052', 4, 1, 8, 0, 1),
(3130, '', 'DEEPAK  GUPTA', '1409140053', 4, 1, 8, 0, 1),
(3131, '', 'DEVANSH  SAXENA', '1409140054', 4, 1, 8, 0, 1),
(3132, '', 'DEVANSHU  PANDEY', '1409140055', 4, 1, 8, 0, 1),
(3133, '', 'DEVKUMAR  VASHISHTHA', '1409140056', 4, 1, 8, 0, 1),
(3134, '', 'DHRUV  SHARMA', '1409140057', 4, 1, 8, 0, 1),
(3135, '', 'DIVYA  SAXENA', '1409140059', 4, 1, 8, 0, 1),
(3136, '', 'DIVYANSH  MISHRA', '1409140060', 4, 1, 8, 0, 1),
(3137, '', 'FAROG HUSSAIN SIDDIQUI', '1409140061', 4, 1, 8, 0, 1),
(3138, '', 'GAURAV KUMAR YADAV', '1409140062', 4, 1, 8, 0, 1),
(3139, '', 'GAURAV  PRAJAPATI', '1409140063', 4, 1, 8, 0, 1),
(3140, '', 'GAURAV  TYAGI', '1409140064', 4, 1, 8, 0, 1),
(3141, '', 'HARSH', '1409140065', 4, 1, 8, 0, 1),
(3142, '', 'HARSHIT  SHARMA', '1409140066', 4, 1, 8, 0, 1),
(3143, '', 'HIMANSHU  BHARTI', '1409140068', 4, 1, 8, 0, 1),
(3144, '', 'HIMANSHU  DHANWANI', '1409140069', 4, 1, 8, 0, 1),
(3145, '', 'HIMANSHU  KUMAR', '1409140070', 4, 1, 8, 0, 1),
(3146, '', 'IFRAH  SAMAN', '1409140071', 4, 1, 8, 0, 1),
(3147, '', 'JASWANT SINGH YADAV', '1409140072', 4, 1, 8, 0, 1),
(3148, '', 'JATIN  SINGHAL', '1409140073', 4, 1, 8, 0, 1),
(3149, '', 'JYOTSNA  YADAV', '1409140074', 4, 1, 8, 0, 1),
(3150, '', 'KALASH  SINGHAL', '1409140075', 4, 1, 8, 0, 1),
(3151, '', 'KAPIL  KUMAR', '1409140076', 4, 1, 8, 0, 1),
(3152, '', 'KARTIKAY  KUMAR', '1409140077', 4, 1, 8, 0, 1),
(3153, '', 'KAUSHLENDRA  SINGH', '1409140078', 4, 1, 8, 0, 1),
(3154, '', 'KISHLAY  KUMAR', '1409140079', 4, 1, 8, 0, 1),
(3155, '', 'KRISHAN  NAGAR', '1409140080', 4, 1, 8, 0, 1),
(3156, '', 'KULDEEP YADAV', '1409140081', 4, 1, 8, 0, 1),
(3157, '', 'MANAS  GUPTA', '1409140082', 4, 1, 8, 0, 1),
(3158, '', 'MANAS  MISHRA', '1409140083', 4, 1, 8, 0, 1),
(3159, '', 'MANU  SINGH', '1409140084', 4, 1, 8, 0, 1),
(3160, '', 'MARGHOOB ALI KHAN', '1409140085', 4, 1, 8, 0, 1),
(3161, '', 'MEGHA  NOSRAN', '1409140086', 4, 1, 8, 0, 1),
(3162, '', 'MOHIT  SINGH', '1409140088', 4, 1, 8, 0, 1),
(3163, '', 'MRIGENDRA  YADAV', '1409140089', 4, 1, 8, 0, 1),
(3164, '', 'MRINAL  MONDAL', '1409140090', 4, 1, 8, 0, 1),
(3165, '', 'MUHAMMAD  SANIF', '1409140091', 4, 1, 8, 0, 1),
(3166, '', 'NAMAN  JAIN', '1409140092', 4, 1, 8, 0, 1),
(3167, '', 'NANDALAL  BAISHYA', '1409140093', 4, 1, 8, 0, 1),
(3168, '', 'NISHANT  VARSHNEY', '1409140094', 4, 1, 8, 0, 1),
(3169, '', 'NISHKARSH  BANSAL', '1409140096', 4, 1, 8, 0, 1),
(3170, '', 'NITIN KUMAR SONI', '1409140097', 4, 1, 8, 0, 1),
(3171, '', 'PAWAN KUMAR AGRAHRI', '1409140098', 4, 1, 8, 0, 1),
(3172, '', 'PIYUSH KUMAR KANSAL', '1409140099', 4, 1, 8, 0, 1),
(3173, '', 'PRADUM  AGARWAL', '1409140100', 4, 1, 8, 0, 1),
(3174, '', 'PRANJAL  MISHRA', '1409140101', 4, 1, 8, 0, 1),
(3175, '', 'PRASHANT  BHATT', '1409140102', 4, 1, 8, 0, 1),
(3176, '', 'PRASHANT  KUMAR', '1409140103', 4, 1, 8, 0, 1),
(3177, '', 'PRASHANT  SINGH', '1409140104', 4, 1, 8, 0, 1),
(3178, '', 'PRASHANT  YADAV', '1409140105', 4, 1, 8, 0, 1),
(3179, '', 'PRATEEK  KUMAR', '1409140106', 4, 1, 8, 0, 1),
(3180, '', 'PRATEEK  VARSHNEY', '1409140107', 4, 1, 8, 0, 1),
(3181, '', 'PRIYA RANJAN MANI TIWARI', '1409140108', 4, 1, 8, 0, 1),
(3182, '', 'PULKITESWAR  TIWARI', '1409140109', 4, 1, 8, 0, 1),
(3183, '', 'PUNEET  KUMAR', '1409140110', 4, 1, 8, 0, 1),
(3184, '', 'PURUSHARTH  PATHAK', '1409140111', 4, 1, 8, 0, 1),
(3185, '', 'PUSPESH KUMAR SRIVASTAVA', '1409140112', 4, 1, 8, 0, 1),
(3186, '', 'RACHANA  VERMA', '1409140113', 4, 1, 8, 0, 1),
(3187, '', 'RAMAKANT  SINGH', '1409140117', 4, 1, 8, 0, 1),
(3188, '', 'RASHMI SINGH', '1409140118', 4, 1, 8, 0, 1),
(3189, '', 'RAVIN  SINGH', '1409140119', 4, 1, 8, 0, 1),
(3190, '', 'ROHIT  KASHYAP', '1409140121', 4, 1, 8, 0, 1),
(3191, '', 'ROHIT  SINGH', '1409140122', 4, 1, 8, 0, 1),
(3192, '', 'SALONI  GAUTAM', '1409140123', 4, 1, 8, 0, 1),
(3193, '', 'SAMARENDRA  SINGH', '1409140124', 4, 1, 8, 0, 1),
(3194, '', 'SAPAN  GUMBER', '1409140125', 4, 1, 8, 0, 1),
(3195, '', 'SARTHAK  SINGH', '1409140126', 4, 1, 8, 0, 1),
(3196, '', 'SAURABH  JAUHARI', '1409140127', 4, 1, 8, 0, 1),
(3197, '', 'SAURABH  KUMAR', '1409140128', 4, 1, 8, 0, 1),
(3198, '', 'SAURABH KUMAR GUPTA', '1409140129', 4, 1, 8, 0, 1),
(3199, '', 'SAURABH  MISHRA', '1409140130', 4, 1, 8, 0, 1),
(3200, '', 'SAURABH  SINGH', '1409140131', 4, 1, 8, 0, 1),
(3201, '', 'SAURAV  KHARI', '1409140132', 4, 1, 8, 0, 1),
(3202, '', 'SHANTANU', '1409140133', 4, 1, 8, 0, 1),
(3203, '', 'SHANTANU  VASWANI', '1409140134', 4, 1, 8, 0, 1),
(3204, '', 'SHANTANU  SHARMA', '1409140135', 4, 1, 8, 0, 1),
(3205, '', 'SHARAJ  KANT', '1409140136', 4, 1, 8, 0, 1),
(3206, '', 'SHAURY  SETH', '1409140138', 4, 1, 8, 0, 1),
(3207, '', 'SHIKHAR  YADAV', '1409140139', 4, 1, 8, 0, 1),
(3208, '', 'SHIVAM  SINGH', '1409140141', 4, 1, 8, 0, 1),
(3209, '', 'SHIVAM  GARG', '1409140140', 4, 1, 8, 0, 1),
(3210, '', 'SHIVENDRA  SINGH', '1409140143', 4, 1, 8, 0, 1),
(3211, '', 'SHIWANSU  SINGH', '1409140144', 4, 1, 8, 0, 1),
(3212, '', 'SHRIJEET  GUPTA', '1409140145', 4, 1, 8, 0, 1),
(3213, '', 'SHUBHAM  BHASIN', '1409140146', 4, 1, 8, 0, 1),
(3214, '', 'SHUBHAM  BHATNAGAR', '1409140147', 4, 1, 8, 0, 1),
(3215, '', 'SHUBHAM  SRIVASTAVA', '1409140149', 4, 1, 8, 0, 1),
(3216, '', 'SHUBHAM  SRIVASTAVA', '1409140150', 4, 1, 8, 0, 1),
(3217, '', 'SHUBHAM  TYAGI', '1409140151', 4, 1, 8, 0, 1),
(3218, '', 'SHYAM KISHOR SHARMA', '1409140152', 4, 1, 8, 0, 1),
(3219, '', 'SUMIT  SINGH', '1409140154', 4, 1, 8, 0, 1),
(3220, '', 'SWAPNIL  YADAV', '1409140155', 4, 1, 8, 0, 1),
(3221, '', 'SWATANTRA KUMAR JAISWAL', '1409140156', 4, 1, 8, 0, 1),
(3222, '', 'UTKARSH  SINGH', '1409140159', 4, 1, 8, 0, 1),
(3223, '', 'UTKARSH  TOMAR', '1409140160', 4, 1, 8, 0, 1),
(3224, '', 'UTKARSH  DIXIT', '1409140157', 4, 1, 8, 0, 1),
(3225, '', 'UTKARSH  KUMAR', '1409140158', 4, 1, 8, 0, 1),
(3226, '', 'VAIBHAV  DWIVEDI', '1409140161', 4, 1, 8, 0, 1),
(3227, '', 'VAISHNAV  BISHEN', '1409140162', 4, 1, 8, 0, 1),
(3228, '', 'VARUN  KUMAR', '1409140163', 4, 1, 8, 0, 1),
(3229, '', 'VIJAY  YADAV', '1409140164', 4, 1, 8, 0, 1),
(3230, '', 'VIKHYAT  SIROHI', '1409140165', 4, 1, 8, 0, 1),
(3231, '', 'VIKRAMANK PRATAP SINGH', '1409140166', 4, 1, 8, 0, 1),
(3232, '', 'VINAY  KUMAR', '1409140167', 4, 1, 8, 0, 1),
(3233, '', 'VISHAL  AGRAWAL', '1409140168', 4, 1, 8, 0, 1),
(3234, '', 'VISHAL  BADLIWAL', '1409140169', 4, 1, 8, 0, 1),
(3235, '', 'VISHAL  PANDEY', '1409140170', 4, 1, 8, 0, 1),
(3236, '', 'VISHAL  YOGI', '1409140171', 4, 1, 8, 0, 1),
(3237, '', 'YASH  AGARWAL', '1409140172', 4, 1, 8, 0, 1),
(3238, '', 'YASH RAJ SRIVASTAVA', '1409140173', 4, 1, 8, 0, 1),
(3239, '', 'YASH  THAKUR', '1409140174', 4, 1, 8, 0, 1),
(3240, '', 'SAURABH  GUPTA', '1409100090', 4, 1, 8, 0, 1),
(3241, '', 'MAYANK  KASERA', '1409113050', 4, 1, 8, 0, 1),
(3242, '', 'ABHINAV  MISHRA', '1409120004', 4, 1, 8, 0, 1),
(3243, '', 'DEVANSH  SHARMA', '1409120042', 4, 1, 8, 0, 1),
(3244, '', 'MOHD ANAS SHAMSI', '1409120063', 4, 1, 8, 0, 1),
(3245, '', 'NILIND  RAJPOOT', '1409120068', 4, 1, 8, 0, 1),
(3246, '', 'SHIVANGI  DUBEY', '1409131083', 4, 1, 8, 0, 1),
(3247, '', 'ADARSH KUMAR YADAV', '1509140901', 4, 1, 8, 0, 1),
(3248, '', 'ANIRUDH  DHALL', '1509140902', 4, 1, 8, 0, 1),
(3249, '', 'ANKIT  KUMAR', '1509140903', 4, 1, 8, 0, 1),
(3250, '', 'ASHOK  KUMAR', '1509140905', 4, 1, 8, 0, 1),
(3251, '', 'GAURAV  PANDEY', '1509140906', 4, 1, 8, 0, 1),
(3252, '', 'JITENDRA  KUMAR', '1509140907', 4, 1, 8, 0, 1),
(3253, '', 'KUMARI  SINDHUJA', '1509140908', 4, 1, 8, 0, 1),
(3254, '', 'MANISH KUMAR RAUNIYAR', '1509140909', 4, 1, 8, 0, 1),
(3255, '', 'MOHD ABU BAKR SIDDIQUE', '1509140911', 4, 1, 8, 0, 1),
(3256, '', 'MOHIT  CHAUDHARY', '1509140912', 4, 1, 8, 0, 1),
(3257, '', 'MOHIT  YADAV', '1509140913', 4, 1, 8, 0, 1),
(3258, '', 'NITESH  SUPARIYA', '1509140914', 4, 1, 8, 0, 1),
(3259, '', 'NITIN  CHAUHAN', '1509140915', 4, 1, 8, 0, 1),
(3260, '', 'PARASH  PRASAD', '1509140916', 4, 1, 8, 0, 1),
(3261, '', 'POOJA  GUPTA', '1509140917', 4, 1, 8, 0, 1),
(3262, '', 'RAHUL KUMAR GUPTA', '1509140919', 4, 1, 8, 0, 1),
(3263, '', 'RAKESH  SINGH', '1509140920', 4, 1, 8, 0, 1),
(3264, '', 'RITESH KUMAR MAURYA', '1509140921', 4, 1, 8, 0, 1),
(3265, '', 'RITIK KUMAR RATHI', '1509140922', 4, 1, 8, 0, 1),
(3266, '', 'SHIVAM  PANDEY', '1509140923', 4, 1, 8, 0, 1),
(3267, '', 'SHUBHAM  RAWAT', '1509140924', 4, 1, 8, 0, 1),
(3268, '', 'SHUBHAM  VERMA', '1509140925', 4, 1, 8, 0, 1),
(3269, '', 'SUBHASH  GUPTA', '1509140926', 4, 1, 8, 0, 1),
(3270, '', 'SYED AQIB MAJID', '1509140928', 4, 1, 8, 0, 1),
(3271, '', 'UMENDRA KUMAR SINGH', '1509140929', 4, 1, 8, 0, 1),
(3272, '', 'HARSHIT KUMAR SINGH', '1309131036', 4, 1, 3, 0, 1),
(3273, '', 'SUVRAT SHANKAR CHATURVEDI', '1309131099', 4, 1, 3, 0, 1),
(3274, '', 'ROHAN RANA', '1309131072', 4, 1, 3, 0, 1),
(3275, '', 'VAISHALI SINGH ', '1309131103', 4, 1, 3, 0, 1),
(3276, '', 'AAKASH RAJ KUSHWAHA ', '1409131001', 4, 1, 3, 0, 1),
(3277, '', 'AARTI SHARMA', '1409131002', 4, 1, 3, 0, 1),
(3278, '', 'ABHIKHYA ASHI', '1409131003', 4, 1, 3, 0, 1),
(3279, '', 'ABHINAV KUMAR GUPTA ', '1409131004', 4, 1, 3, 0, 1),
(3280, '', 'AKANKSHA ', '1409131005', 4, 1, 3, 0, 1),
(3281, '', 'AKASH GHOSH ', '1409131006', 4, 1, 3, 0, 1),
(3282, '', 'AKSHAY KUMAR RASTOGI', '1409131007', 4, 1, 3, 0, 1),
(3283, '', 'AMAN KUMAR JAISWAL ', '1409131008', 4, 1, 3, 0, 1),
(3284, '', 'AMAN KUSHWAHA ', '1409131009', 4, 1, 3, 0, 1),
(3285, '', 'AMAN SINGHAL', '1409131011', 4, 1, 3, 0, 1),
(3286, '', 'AMBIKA PATEL ', '1409131012', 4, 1, 3, 0, 1),
(3287, '', 'AMIT AGRAWAL ', '1409131013', 4, 1, 3, 0, 1),
(3288, '', 'ANIKET PRATAP SINGH ', '1409131014', 4, 1, 3, 0, 1),
(3289, '', 'ANKIT KUMAR SINGH ', '1409131015', 4, 1, 3, 0, 1),
(3290, '', 'ANKURESH VERMA ', '1409131016', 4, 1, 3, 0, 1),
(3291, '', 'ANMOL GUPTA ', '1409131017', 4, 1, 3, 0, 1),
(3292, '', 'ANURAG GAUTAM ', '1409131020', 4, 1, 3, 0, 1),
(3293, '', 'ANURAG SACHAN ', '1409131021', 4, 1, 3, 0, 1),
(3294, '', 'ANURAG SINGH ', '1409131022', 4, 1, 3, 0, 1),
(3295, '', 'ANUSHRUTI AGARWAL', '1409131023', 4, 1, 3, 0, 1),
(3296, '', 'ASHISH KUMAR CHAUDHARY ', '1409131024', 4, 1, 3, 0, 1),
(3297, '', 'AVIRAL KABIR ', '1409131025', 4, 1, 3, 0, 1),
(3298, '', 'BRIJESH GUPTA ', '1409131028', 4, 1, 3, 0, 1),
(3299, '', 'DHEERAJ KUMAR', '1409131029', 4, 1, 3, 0, 1),
(3300, '', 'HARSH RUNGTA', '1409131031', 4, 1, 3, 0, 1),
(3301, '', 'HARSHITA SINHA', '1409131032', 4, 1, 3, 0, 1),
(3302, '', 'HIMANSHIKA ', '1409131033', 4, 1, 3, 0, 1),
(3303, '', 'HIMANSHU YADAV ', '1409131034', 4, 1, 3, 0, 1),
(3304, '', 'JHASHANK GANDHI', '1409131035', 4, 1, 3, 0, 1),
(3305, '', 'KARPOR GAURANG PATHAK ', '1409131036', 4, 1, 3, 0, 1),
(3306, '', 'KARTIK MAHAJAN ', '1409131037', 4, 1, 3, 0, 1),
(3307, '', 'KAUSHAL KISHOR ', '1409131038', 4, 1, 3, 0, 1),
(3308, '', 'KUNAL ARORA', '1409131039', 4, 1, 3, 0, 1),
(3309, '', 'MAYANK SINGH ', '1409131040', 4, 1, 3, 0, 1),
(3310, '', 'MIMANSHI TIWARI', '1409131041', 4, 1, 3, 0, 1),
(3311, '', 'MOHD EKRAMA MAZHAR ', '1409131042', 4, 1, 3, 0, 1),
(3312, '', 'MUKUL KUMAR JOBRA ', '1409131043', 4, 1, 3, 0, 1),
(3313, '', 'NEHA KASHYAP', '1409131044', 4, 1, 3, 0, 1),
(3314, '', 'NIHARIKA SAKSHEE ', '1409131045', 4, 1, 3, 0, 1),
(3315, '', 'NILANSH GUPTA ', '1409131046', 4, 1, 3, 0, 1),
(3316, '', 'NISCHAL PALTA ', '1409131047', 4, 1, 3, 0, 1),
(3317, '', 'NITIN KUMAR ', '1409131048', 4, 1, 3, 0, 1),
(3318, '', 'PARTH BALLABH ', '1409131049', 4, 1, 3, 0, 1),
(3319, '', 'PRAFUL SRIVASTAVA ', '1409131050', 4, 1, 3, 0, 1),
(3320, '', 'PRASHANK JAIN ', '1409131051', 4, 1, 3, 0, 1),
(3321, '', 'PRASHANT GAHALOT ', '1409131052', 4, 1, 3, 0, 1),
(3322, '', 'PUNEET KUMAR SINGH ', '1409131053', 4, 1, 3, 0, 1),
(3323, '', 'PUSHKAR SINGH ', '1409131054', 4, 1, 3, 0, 1),
(3324, '', 'RAM NARAYAN PATEL ', '1409131055', 4, 1, 3, 0, 1),
(3325, '', 'RASHMI SINGH ', '1409131057', 4, 1, 3, 0, 1),
(3326, '', 'RIA TOMAR ', '1409131058', 4, 1, 3, 0, 1),
(3327, '', 'RICHA SINGH', '1409131059', 4, 1, 3, 0, 1),
(3328, '', 'RISHI TRIPATHI ', '1409131060', 4, 1, 3, 0, 1),
(3329, '', 'RITU SINGH', '1409131061', 4, 1, 3, 0, 1),
(3330, '', 'RITURAJ PATEL ', '1409131062', 4, 1, 3, 0, 1),
(3331, '', 'ROHIT PRATAP SINGH ', '1409131064', 4, 1, 3, 0, 1),
(3332, '', 'ROMIL AGARWAL', '1409131066', 4, 1, 3, 0, 1),
(3333, '', 'RUCHIKA GAUTAM ', '1409131067', 4, 1, 3, 0, 1),
(3334, '', 'SAGAR JASWANI ', '1409131068', 4, 1, 3, 0, 1),
(3335, '', 'SAJAL SINGHAL ', '1409131069', 4, 1, 3, 0, 1),
(3336, '', 'SAKSHAM GARG ', '1409131070', 4, 1, 3, 0, 1),
(3337, '', 'SAKSHI KASHYAP', '1409131071', 4, 1, 3, 0, 1),
(3338, '', 'SAKSHI SINGHAL ', '1409131072', 4, 1, 3, 0, 1),
(3339, '', 'SANDEEP KUMAR VERMA ', '1409131073', 4, 1, 3, 0, 1),
(3340, '', 'SARTHAK VAJPAYEE', '1409131074', 4, 1, 3, 0, 1),
(3341, '', 'SAUMYA PURWAR ', '1409131075', 4, 1, 3, 0, 1),
(3342, '', 'SAYED ARSHAD ALI ', '1409131076', 4, 1, 3, 0, 1),
(3343, '', 'SHANTANU SAXENA ', '1409131077', 4, 1, 3, 0, 1),
(3344, '', 'SHASHANK JAIN ', '1409131078', 4, 1, 3, 0, 1),
(3345, '', 'SHIVA BHARDWAJ ', '1409131079', 4, 1, 3, 0, 1),
(3346, '', 'SHIVAM CHAUDHARY ', '1409131080', 4, 1, 3, 0, 1),
(3347, '', 'SHIVAM ROOSIA ', '1409131081', 4, 1, 3, 0, 1),
(3348, '', 'SHIVASHEESH JAISWAL', '1409131084', 4, 1, 3, 0, 1),
(3349, '', 'SHIVI AGARWAL ', '1409131085', 4, 1, 3, 0, 1),
(3350, '', 'SHRAYA SINGH ', '1409131086', 4, 1, 3, 0, 1),
(3351, '', 'SHREY BALLABH ', '1409131087', 4, 1, 3, 0, 1),
(3352, '', 'SHREYA SINGH ', '1409131088', 4, 1, 3, 0, 1),
(3353, '', 'SHREYAM KELA ', '1409131089', 4, 1, 3, 0, 1),
(3354, '', 'SHREYANSH CHAUDHARY ', '1409131090', 4, 1, 3, 0, 1),
(3355, '', 'SHREYASH TRIPATHI ', '1409131091', 4, 1, 3, 0, 1),
(3356, '', 'SHRUTI SINGH', '1409131092', 4, 1, 3, 0, 1),
(3357, '', 'SHUBHAM AGARWAL ', '1409131093', 4, 1, 3, 0, 1),
(3358, '', 'SHUBHAM CHAUHAN', '1409131094', 4, 1, 3, 0, 1),
(3359, '', 'SHUBHAM TRIPATHI ', '1409131095', 4, 1, 3, 0, 1),
(3360, '', 'SOMYA ATRISH', '1409131097', 4, 1, 3, 0, 1),
(3361, '', 'SONALI KAUSHAL', '1409131098', 4, 1, 3, 0, 1),
(3362, '', 'SRISHTI', '1409131099', 4, 1, 3, 0, 1),
(3363, '', 'SRISHTI SHUKLA', '1409131100', 4, 1, 3, 0, 1),
(3364, '', 'SURYANSH GARG ', '1409131101', 4, 1, 3, 0, 1),
(3365, '', 'UDHAM SINGH ', '1409131102', 4, 1, 3, 0, 1),
(3366, '', 'UDIT SHARMA', '1409131103', 4, 1, 3, 0, 1),
(3367, '', 'VAISHALI SINGH ', '1409131105', 4, 1, 3, 0, 1),
(3368, '', 'VIKAS ', '1409131106', 4, 1, 3, 0, 1),
(3369, '', 'VISHAL MANCHANDA ', '1409131107', 4, 1, 3, 0, 1),
(3370, '', 'VISHVESH GARG ', '1409131109', 4, 1, 3, 0, 1),
(3371, '', 'VISHWADEEP SRIVASTAVA ', '1409131110', 4, 1, 3, 0, 1),
(3372, '', 'YAMAN BAHUGUNA', '1409131111', 4, 1, 3, 0, 1),
(3373, '', 'YAMINI SAURABH ', '1409131112', 4, 1, 3, 0, 1),
(3374, '', 'YASH KALRA', '1409131113', 4, 1, 3, 0, 1),
(3375, '', 'YASH KUSHWAHA ', '1409131115', 4, 1, 3, 0, 1),
(3376, '', 'YASH SAHU ', '1409131116', 4, 1, 3, 0, 1),
(3377, '', 'RAJAT SINGH ', '1409100077', 4, 1, 3, 0, 1),
(3378, '', 'SHIVAM GUPTA ', '1409120098', 4, 1, 3, 0, 1),
(3379, '', 'AKASH KUMAR SINGH', '1509131902', 4, 1, 3, 0, 1),
(3380, '', 'ARUN  KUMAR', '1509131903', 4, 1, 3, 0, 1),
(3381, '', 'BHANU  PRATAP', '1509131904', 4, 1, 3, 0, 1),
(3382, '', 'BHAVESH', '1509131905', 4, 1, 3, 0, 1),
(3383, '', 'POOJA  KUMARI', '1509131907', 4, 1, 3, 0, 1),
(3384, '', 'PRATEEKSHA PANDEY', '1509131910', 4, 1, 3, 0, 1),
(3385, '', 'SAKSHI  YADAV', '1509131911', 4, 1, 3, 0, 1),
(3386, '', 'SHABANA  BANO', '1509131912', 4, 1, 3, 0, 1),
(3387, '', 'SHUBHAM  DUBEY', '1509131913', 4, 1, 3, 0, 1),
(3388, '', 'SIDDHARTH  SINGH', '1509131914', 4, 1, 3, 0, 1),
(3389, '', 'VINAY KUMAR ', '1409122902', 4, 1, 6, 0, 1),
(3390, '', 'ABHISHEK YADAV ', '1409122001', 4, 1, 6, 0, 1),
(3391, '', 'ADITYA SONI ', '1409122002', 4, 1, 6, 0, 1),
(3392, '', 'AISHWARYA KRISHNAN', '1409122003', 4, 1, 6, 0, 1),
(3393, '', 'AKANKSHA SRIVASTAVA ', '1409122004', 4, 1, 6, 0, 1),
(3394, '', 'AKASH VERMA ', '1409122005', 4, 1, 6, 0, 1),
(3395, '', 'AMIT KUMAR GAUTAM ', '1409122006', 4, 1, 6, 0, 1),
(3396, '', 'ANKIT YADAV', '1409122007', 4, 1, 6, 0, 1),
(3397, '', 'ANSHUMAN GAUTAM', '1409122008', 4, 1, 6, 0, 1),
(3398, '', 'ANUSHREE TIWARI ', '1409122009', 4, 1, 6, 0, 1),
(3399, '', 'ASHUTOSH SHUKLA ', '1409122010', 4, 1, 6, 0, 1),
(3400, '', 'AYUSH RUNGTA ', '1409122011', 4, 1, 6, 0, 1),
(3401, '', 'DAKSHANSH DAKSH ', '1409122012', 4, 1, 6, 0, 1),
(3402, '', 'JALAJ KUMAR CHAUDHARY ', '1409122014', 4, 1, 6, 0, 1),
(3403, '', 'MAHIMA MATHUR', '1409122015', 4, 1, 6, 0, 1),
(3404, '', 'MANJARI NIDHI', '1409122017', 4, 1, 6, 0, 1),
(3405, '', 'MARIYAM JALIS ', '1409122018', 4, 1, 6, 0, 1),
(3406, '', 'NAINPREET SINGH ', '1409122019', 4, 1, 6, 0, 1),
(3407, '', 'NAVDHA VERMA ', '1409122020', 4, 1, 6, 0, 1),
(3408, '', 'NIDHI UTREJA', '1409122021', 4, 1, 6, 0, 1),
(3409, '', 'NIHARIKA GOEL ', '1409122022', 4, 1, 6, 0, 1),
(3410, '', 'PRAGYA MISHRA ', '1409122024', 4, 1, 6, 0, 1),
(3411, '', 'PRIYANKA SINGH ', '1409122025', 4, 1, 6, 0, 1),
(3412, '', 'SAGAR ', '1409122026', 4, 1, 6, 0, 1),
(3413, '', 'SEEMA ', '1409122027', 4, 1, 6, 0, 1),
(3414, '', 'SHARAD YADAV ', '1409122028', 4, 1, 6, 0, 1),
(3415, '', 'SRISHTI SINGH CHAUHAN ', '1409122029', 4, 1, 6, 0, 1),
(3416, '', 'TANYA SINGH ', '1409122030', 4, 1, 6, 0, 1),
(3417, '', 'TUSHAR SINDHU ', '1409122031', 4, 1, 6, 0, 1),
(3418, '', 'VAIBHAV SAREEN', '1409122032', 4, 1, 6, 0, 1),
(3419, '', 'VAIBHAV SONI ', '1409122033', 4, 1, 6, 0, 1),
(3420, '', 'VAIBHAV VISHAL ', '1409122034', 4, 1, 6, 0, 1),
(3421, '', 'VAISHALI SINGH ', '1409122035', 4, 1, 6, 0, 1),
(3422, '', 'VATSAL ', '1409122036', 4, 1, 6, 0, 1),
(3423, '', 'VISHAL SINGH ', '1409122038', 4, 1, 6, 0, 1),
(3424, '', 'VIVEK SINGH ', '1409122039', 4, 1, 6, 0, 1),
(3425, '', 'AJAY KUMAR PRAJAPATI', '1509122901', 4, 1, 6, 0, 1),
(3426, '', 'NEHA  SRIVASTAV', '1509122903', 4, 1, 6, 0, 1),
(3427, '', 'SUNIL KUMAR', '1509122904', 4, 1, 6, 0, 1),
(3428, '', 'shubhangi sirohi', '1409113106', 4, 1, 9, 0, 1),
(3429, '', 'ABHAY AGARWAL ', '1409121001', 4, 1, 9, 0, 1),
(3430, '', 'ABHISHEK TIWARI', '1409121002', 4, 1, 9, 0, 1),
(3431, '', 'ABHISHEK TRIVEDI ', '1409121003', 4, 1, 9, 0, 1),
(3432, '', 'AKASH KUMAR ', '1409121004', 4, 1, 9, 0, 1),
(3433, '', 'AKASH PRAKASH VERMA ', '1409121005', 4, 1, 9, 0, 1),
(3434, '', 'AKSHIT JAIN', '1409121007', 4, 1, 9, 0, 1),
(3435, '', 'ANAMIKA ', '1409121008', 4, 1, 9, 0, 1),
(3436, '', 'ANJALI  SINGH ', '1409121009', 4, 1, 9, 0, 1),
(3437, '', 'ANKIT AGARWAL', '1409121010', 4, 1, 9, 0, 1),
(3438, '', 'ATUL PANDEY ', '1409121013', 4, 1, 9, 0, 1),
(3439, '', 'HARSH MAHESHWARI ', '1409121015', 4, 1, 9, 0, 1),
(3440, '', 'HARSHITA SINGH ', '1409121016', 4, 1, 9, 0, 1),
(3441, '', 'HARSHITA WAILA ', '1409121017', 4, 1, 9, 0, 1),
(3442, '', 'KANUPRIYA ', '1409121018', 4, 1, 9, 0, 1),
(3443, '', 'KULDEEP GUPTA ', '1409121019', 4, 1, 9, 0, 1),
(3444, '', 'MOHIT MALHOTRA ', '1409121020', 4, 1, 9, 0, 1),
(3445, '', 'PRADHUMNA KUMAR ', '1409121022', 4, 1, 9, 0, 1),
(3446, '', 'PRANJAL ANANG ', '1409121023', 4, 1, 9, 0, 1),
(3447, '', 'PRANJAL SINHA ', '1409121024', 4, 1, 9, 0, 1),
(3448, '', 'PRIYANK VIKRAM  SINGH ', '1409121026', 4, 1, 9, 0, 1),
(3449, '', 'RAVI KANT', '1409121028', 4, 1, 9, 0, 1),
(3450, '', 'RISHABH SHARMA ', '1409121029', 4, 1, 9, 0, 1),
(3451, '', 'RISHABH SINGH ', '1409121030', 4, 1, 9, 0, 1),
(3452, '', 'SATYAJEET ROY ', '1409121032', 4, 1, 9, 0, 1),
(3453, '', 'SAURABH GUPTA ', '1409121034', 4, 1, 9, 0, 1),
(3454, '', 'SAURABH KUMAR SINGH ', '1409121035', 4, 1, 9, 0, 1),
(3455, '', 'SAURAV SINGH ', '1409121036', 4, 1, 9, 0, 1),
(3456, '', 'SHARIK HASAN ', '1409121037', 4, 1, 9, 0, 1),
(3457, '', 'SHAURYA PRAKASH SINGH ', '1409121038', 4, 1, 9, 0, 1),
(3458, '', 'SHIVANGI NARAYAN', '1409121039', 4, 1, 9, 0, 1),
(3459, '', 'SHIVANI CHAUDHARY ', '1409121040', 4, 1, 9, 0, 1),
(3460, '', 'SHREYANSH R SAND', '1409121042', 4, 1, 9, 0, 1),
(3461, '', 'SHRISTI SHUKLA ', '1409121043', 4, 1, 9, 0, 1),
(3462, '', 'SHRUTI SAXENA', '1409121044', 4, 1, 9, 0, 1),
(3463, '', 'SHUBHAM BHATT ', '1409121045', 4, 1, 9, 0, 1),
(3464, '', 'SHUBHAM SRIVASTAVA ', '1409121046', 4, 1, 9, 0, 1),
(3465, '', 'SITESH CHAUHAN ', '1409121047', 4, 1, 9, 0, 1),
(3466, '', 'SMRITI RAI ', '1409121048', 4, 1, 9, 0, 1),
(3467, '', 'SOMESH AGRAWAL ', '1409121049', 4, 1, 9, 0, 1),
(3468, '', 'SOMESH JAISWAL ', '1409121050', 4, 1, 9, 0, 1),
(3469, '', 'SUMERENDU SINGH BAGHEL ', '1409121051', 4, 1, 9, 0, 1),
(3470, '', 'SUMIT JAISWAL ', '1409121052', 4, 1, 9, 0, 1),
(3471, '', 'SUMIT KUMAR MISRA ', '1409121053', 4, 1, 9, 0, 1),
(3472, '', 'SUNIL KUMAR VERMA ', '1409121054', 4, 1, 9, 0, 1),
(3473, '', 'SWATI AGARWAL ', '1409121055', 4, 1, 9, 0, 1),
(3474, '', 'UJAWAL SINGH CHAUHAN ', '1409121056', 4, 1, 9, 0, 1),
(3475, '', 'UTKARSH SHUKLA', '1409121057', 4, 1, 9, 0, 1),
(3476, '', 'UTKARSH SINGH ', '1409121058', 4, 1, 9, 0, 1),
(3477, '', 'UTKARSHA SHUKLA', '1409121059', 4, 1, 9, 0, 1),
(3478, '', 'VAIBHAV SAHU ', '1409121060', 4, 1, 9, 0, 1),
(3479, '', 'ZENAB MUSTAFA', '1409121063', 4, 1, 9, 0, 1),
(3480, '', 'ANMOL BABU SINGH', '1509121901', 4, 1, 9, 0, 1),
(3481, '', 'BIPIN KUMAR KUSHWAHA ', '1509121902', 4, 1, 9, 0, 1),
(3482, '', 'RAHUL ABHISHEK', '1509121903', 4, 1, 9, 0, 1),
(3483, '', 'SHRADHA SRIVASTAVA', '1509121904', 4, 1, 9, 0, 1),
(3484, '', 'shubham pandey', '1509121905', 4, 1, 9, 0, 1),
(3485, '', 'VISHESH SHARMA', '1509121906', 4, 1, 9, 0, 1),
(3486, '', 'PRABHAT KUMAR PATEL', '1309120067', 4, 1, 4, 0, 1),
(3487, '', 'ABHISHEK KUMAR SINGH ', '1309120005', 4, 1, 4, 0, 1),
(3488, '', 'AAKASH PREMI ', '1409120001', 4, 1, 4, 0, 1),
(3489, '', 'AARTI', '1409120002', 4, 1, 4, 0, 1),
(3490, '', 'ABHINAV KUMAR SINGH ', '1409120003', 4, 1, 4, 0, 1);
INSERT INTO `jss_stud_list_17_18` (`jss_stud_id`, `adm_no`, `stud_name`, `roll_no`, `year`, `course_id`, `branch_id`, `form_fill`, `valid`) VALUES
(3491, '', 'ABHISHEK KUMAR SINGH ', '1409120006', 4, 1, 4, 0, 1),
(3492, '', 'ABHISHEK TRIPATHI ', '1409120007', 4, 1, 4, 0, 1),
(3493, '', 'AGRIMA CHANDRA', '1409120009', 4, 1, 4, 0, 1),
(3494, '', 'AKARSH SRIVASTAVA ', '1409120011', 4, 1, 4, 0, 1),
(3495, '', 'AKASH PRASAD', '1409120013', 4, 1, 4, 0, 1),
(3496, '', 'AKASH SINGH ', '1409120014', 4, 1, 4, 0, 1),
(3497, '', 'AKASH SINGH ', '1409120015', 4, 1, 4, 0, 1),
(3498, '', 'AMIT KUMAR TOMAR ', '1409120018', 4, 1, 4, 0, 1),
(3499, '', 'AMRITANSH GUPTA ', '1409120019', 4, 1, 4, 0, 1),
(3500, '', 'ANANYA TIWARI', '1409120020', 4, 1, 4, 0, 1),
(3501, '', 'ANJANEYA TRIPATHI ', '1409120021', 4, 1, 4, 0, 1),
(3502, '', 'ANKITESH BHRAGUDEV', '1409120022', 4, 1, 4, 0, 1),
(3503, '', 'ANSHEETA SINGH ', '1409120023', 4, 1, 4, 0, 1),
(3504, '', 'ANSHUL KASHYAP ', '1409120024', 4, 1, 4, 0, 1),
(3505, '', 'ANURAG KATIYAR ', '1409120025', 4, 1, 4, 0, 1),
(3506, '', 'APARAJITA SINGH ', '1409120026', 4, 1, 4, 0, 1),
(3507, '', 'ARNOLD HINGKUANG LIU', '1409120027', 4, 1, 4, 0, 1),
(3508, '', 'ARPIT PALIWAL ', '1409120028', 4, 1, 4, 0, 1),
(3509, '', 'ARUN CHAUDHARY ', '1409120029', 4, 1, 4, 0, 1),
(3510, '', 'ASHISH KUMAR ', '1409120030', 4, 1, 4, 0, 1),
(3511, '', 'ASHISH KUMAR DUBEY ', '1409120031', 4, 1, 4, 0, 1),
(3512, '', 'ASHISH SHUKLA ', '1409120032', 4, 1, 4, 0, 1),
(3513, '', 'ATUL VERMA ', '1409120033', 4, 1, 4, 0, 1),
(3514, '', 'AVANTIKA BHATT', '1409120034', 4, 1, 4, 0, 1),
(3515, '', 'AVIRAL SHUKLA ', '1409120035', 4, 1, 4, 0, 1),
(3516, '', 'AYUSH GUPTA ', '1409120036', 4, 1, 4, 0, 1),
(3517, '', 'BHAVESH VERMA ', '1409120037', 4, 1, 4, 0, 1),
(3518, '', 'BIPU SINGH ', '1409120038', 4, 1, 4, 0, 1),
(3519, '', 'CHANDRA PRABHA YADAV ', '1409120039', 4, 1, 4, 0, 1),
(3520, '', 'CHARU CHAUHAN ', '1409120040', 4, 1, 4, 0, 1),
(3521, '', 'CHETAN ANAND ', '1409120041', 4, 1, 4, 0, 1),
(3522, '', 'DEVESH SINGH SOAM ', '1409120043', 4, 1, 4, 0, 1),
(3523, '', 'DHANANJAY KUMAR YADAV', '1409120044', 4, 1, 4, 0, 1),
(3524, '', 'GANGESHWAR SINGH ', '1409120045', 4, 1, 4, 0, 1),
(3525, '', 'GAURAV SINGH ', '1409120046', 4, 1, 4, 0, 1),
(3526, '', 'GAUTAM SHAKYA ', '1409120047', 4, 1, 4, 0, 1),
(3527, '', 'GEETANSHU CHOUHAN ', '1409120048', 4, 1, 4, 0, 1),
(3528, '', 'HIMANSHU SHUKLA ', '1409120049', 4, 1, 4, 0, 1),
(3529, '', 'ISHAN SINGH ', '1409120050', 4, 1, 4, 0, 1),
(3530, '', 'KARMENDER ', '1409120051', 4, 1, 4, 0, 1),
(3531, '', 'KM SUSHMITA VERMA ', '1409120052', 4, 1, 4, 0, 1),
(3532, '', 'KRISHNAKANT ', '1409120053', 4, 1, 4, 0, 1),
(3533, '', 'LASHIKA SINGH', '1409120054', 4, 1, 4, 0, 1),
(3534, '', 'MADHUR GARG', '1409120055', 4, 1, 4, 0, 1),
(3535, '', 'MANISH KUMAR ', '1409120056', 4, 1, 4, 0, 1),
(3536, '', 'MANU SHARMA ', '1409120057', 4, 1, 4, 0, 1),
(3537, '', 'MAYANK MOHAN ', '1409120058', 4, 1, 4, 0, 1),
(3538, '', 'MAYANK NIRALA ', '1409120059', 4, 1, 4, 0, 1),
(3539, '', 'MAYANK PRATAP SINGH ', '1409120060', 4, 1, 4, 0, 1),
(3540, '', 'MIRNANK GUPTA', '1409120062', 4, 1, 4, 0, 1),
(3541, '', 'MOHIT AGRAWAL ', '1409120064', 4, 1, 4, 0, 1),
(3542, '', 'NAMAN KUMAR VERMA ', '1409120065', 4, 1, 4, 0, 1),
(3543, '', 'NAVEEN KUMAR ', '1409120066', 4, 1, 4, 0, 1),
(3544, '', 'NIHARIKA ', '1409120067', 4, 1, 4, 0, 1),
(3545, '', 'PIYUSH KUMAR ANAND ', '1409120069', 4, 1, 4, 0, 1),
(3546, '', 'PIYUSH TYAGI ', '1409120070', 4, 1, 4, 0, 1),
(3547, '', 'PRABHAT SINGH YADAV ', '1409120071', 4, 1, 4, 0, 1),
(3548, '', 'PRABHAT SRIVASTAVA ', '1409120072', 4, 1, 4, 0, 1),
(3549, '', 'PRANSHU GUPTA ', '1409120073', 4, 1, 4, 0, 1),
(3550, '', 'PRATIKSHA ', '1409120075', 4, 1, 4, 0, 1),
(3551, '', 'PREETI ', '1409120076', 4, 1, 4, 0, 1),
(3552, '', 'PREETI BHARTI ', '1409120077', 4, 1, 4, 0, 1),
(3553, '', 'PRIYANKA KUMARI ', '1409120078', 4, 1, 4, 0, 1),
(3554, '', 'PULKIT BHATNAGAR ', '1409120079', 4, 1, 4, 0, 1),
(3555, '', 'RAHUL TRIPATHI ', '1409120080', 4, 1, 4, 0, 1),
(3556, '', 'RAJ SRIVASTAVA ', '1409120081', 4, 1, 4, 0, 1),
(3557, '', 'RAJAT SINGH ', '1409120082', 4, 1, 4, 0, 1),
(3558, '', 'RAVI KUMAR AGARWAL ', '1409120083', 4, 1, 4, 0, 1),
(3559, '', 'RISHABH BANSAL ', '1409120084', 4, 1, 4, 0, 1),
(3560, '', 'RISHABH MITTAL ', '1409120085', 4, 1, 4, 0, 1),
(3561, '', 'RIYA SRIVASTAVA ', '1409120086', 4, 1, 4, 0, 1),
(3562, '', 'ROHIT TIWARI ', '1409120087', 4, 1, 4, 0, 1),
(3563, '', 'ROHIT GUPTA ', '1409120088', 4, 1, 4, 0, 1),
(3564, '', 'ROOPSI VERMA', '1409120089', 4, 1, 4, 0, 1),
(3565, '', 'SAKSHI GANGWAR ', '1409120090', 4, 1, 4, 0, 1),
(3566, '', 'SANJAY KUMAR ', '1409120091', 4, 1, 4, 0, 1),
(3567, '', 'SANJAY RAWAT ', '1409120092', 4, 1, 4, 0, 1),
(3568, '', 'SANKET TRIPATHI ', '1409120093', 4, 1, 4, 0, 1),
(3569, '', 'SAURABH MAHAUR', '1409120094', 4, 1, 4, 0, 1),
(3570, '', 'SHAIFALI SRIVASTAV', '1409120095', 4, 1, 4, 0, 1),
(3571, '', 'SHALOM NELSHON DAN', '1409120096', 4, 1, 4, 0, 1),
(3572, '', 'SHIKHAR GUPTA ', '1409120097', 4, 1, 4, 0, 1),
(3573, '', 'SHIVAM VERMA', '1409120099', 4, 1, 4, 0, 1),
(3574, '', 'SHIVENDER YADAV ', '1409120100', 4, 1, 4, 0, 1),
(3575, '', 'SHRIYAM JAISWAL ', '1409120101', 4, 1, 4, 0, 1),
(3576, '', 'SHUBHAM AGRAWAL ', '1409120102', 4, 1, 4, 0, 1),
(3577, '', 'SHUBHAM CHAND ', '1409120103', 4, 1, 4, 0, 1),
(3578, '', 'SHUBHAM KARDAM', '1409120104', 4, 1, 4, 0, 1),
(3579, '', 'SHUBHAM KUMAR ', '1409120105', 4, 1, 4, 0, 1),
(3580, '', 'SHUBHAM SINGH ', '1409120106', 4, 1, 4, 0, 1),
(3581, '', 'SHUBHAM THAPLIYAL', '1409120107', 4, 1, 4, 0, 1),
(3582, '', 'SIDDHARTH RAJPUT ', '1409120108', 4, 1, 4, 0, 1),
(3583, '', 'SUHANSHU RAI', '1409120109', 4, 1, 4, 0, 1),
(3584, '', 'SUNIL GUPTA', '1409120110', 4, 1, 4, 0, 1),
(3585, '', 'SURBHI SINGH ', '1409120111', 4, 1, 4, 0, 1),
(3586, '', 'TANUL KRISHNA ', '1409120112', 4, 1, 4, 0, 1),
(3587, '', 'TARKESHWAR CHAUHAN ', '1409120113', 4, 1, 4, 0, 1),
(3588, '', 'UMESH ', '1409120114', 4, 1, 4, 0, 1),
(3589, '', 'UTTAM KUMAR ', '1409120115', 4, 1, 4, 0, 1),
(3590, '', 'VAIBHAV SHUKLA ', '1409120116', 4, 1, 4, 0, 1),
(3591, '', 'VARUN TIWARI ', '1409120117', 4, 1, 4, 0, 1),
(3592, '', 'VIKAS VISHWAKARMA ', '1409120118', 4, 1, 4, 0, 1),
(3593, '', 'VISHWENDRA CHAUDHARY ', '1409120119', 4, 1, 4, 0, 1),
(3594, '', 'YASH SRIVASTAVA ', '1409120121', 4, 1, 4, 0, 1),
(3595, '', 'YOGESH KUMAR ', '1409120122', 4, 1, 4, 0, 1),
(3596, '', 'YASHI GUPTA ', '1409113123', 4, 1, 4, 0, 1),
(3597, '', 'CHANDRA  PRAKASH', '1509120904', 4, 1, 4, 0, 1),
(3598, '', 'DEVESH  GAUTAM', '1509120905', 4, 1, 4, 0, 1),
(3599, '', 'ISHANT PANDHI', '1509120906', 4, 1, 4, 0, 1),
(3600, '', 'MOHAMMAD  AYYUB', '1509120907', 4, 1, 4, 0, 1),
(3601, '', 'MOHAMMAD  FAIZ', '1509120908', 4, 1, 4, 0, 1),
(3602, '', 'MOHD KASHIF NAIM', '1509120909', 4, 1, 4, 0, 1),
(3603, '', 'MOHIT NISHAD', '1509120910', 4, 1, 4, 0, 1),
(3604, '', 'SANDEEP KUMAR VERMA', '1509120912', 4, 1, 4, 0, 1),
(3605, '', 'SANJU', '1509120913', 4, 1, 4, 0, 1),
(3606, '', 'SATRUGHAN KUMAR GUPTA', '1509120914', 4, 1, 4, 0, 1),
(3607, '', 'SONI  SHARMA', '1509120915', 4, 1, 4, 0, 1),
(3608, '', 'SONI SINGH', '1509120916', 4, 1, 4, 0, 1),
(3609, '', 'SUNNY  GUPTA', '1509120917', 4, 1, 4, 0, 1),
(3610, '', 'TUSHAR  SINGHAL', '1509120918', 4, 1, 4, 0, 1),
(3611, '', 'HARSH MISHRA', '1409100043', 4, 1, 2, 0, 1),
(3612, '', 'AAKANKSHA MALHOTRA', '1409113001', 4, 1, 2, 0, 1),
(3613, '', 'ABHIMANYU SINGH', '1409113003', 4, 1, 2, 0, 1),
(3614, '', 'ABHINAV KUMAR SINGH', '1409113004', 4, 1, 2, 0, 1),
(3615, '', 'ABHINAV  PANDEY', '1409113005', 4, 1, 2, 0, 1),
(3616, '', 'AKANKSHA  BHARDWAJ', '1409113006', 4, 1, 2, 0, 1),
(3617, '', 'AKRATI  MITTAL', '1409113008', 4, 1, 2, 0, 1),
(3618, '', 'AKSHAY GANGWAR', '1409113009', 4, 1, 2, 0, 1),
(3619, '', 'AKSHAY VASHISTHA', '1409113010', 4, 1, 2, 0, 1),
(3620, '', 'AKUL  SHARMA', '1409113011', 4, 1, 2, 0, 1),
(3621, '', 'AMRITANSHU  JAISWAL', '1409113012', 4, 1, 2, 0, 1),
(3622, '', 'ANANYA SRIVASTAVA', '1409113014', 4, 1, 2, 0, 1),
(3623, '', 'ANKITA YADAV', '1409113015', 4, 1, 2, 0, 1),
(3624, '', 'ANOOP KUMAR', '1409113016', 4, 1, 2, 0, 1),
(3625, '', 'ANSHUMAN CHAUDHARY', '1409113017', 4, 1, 2, 0, 1),
(3626, '', 'ANUKRITI KESHARI', '1409113018', 4, 1, 2, 0, 1),
(3627, '', 'ANURAG KUMAR SRIVASTAVA', '1409113019', 4, 1, 2, 0, 1),
(3628, '', 'ARCHIT MISHRA', '1409113020', 4, 1, 2, 0, 1),
(3629, '', 'ARYAN GUPTA', '1409113022', 4, 1, 2, 0, 1),
(3630, '', 'ASHIMA VASHISHTH', '1409113023', 4, 1, 2, 0, 1),
(3631, '', 'ASHISH SAGAR', '1409113024', 4, 1, 2, 0, 1),
(3632, '', 'ATISHAY CHAUDHARY', '1409113025', 4, 1, 2, 0, 1),
(3633, '', 'AYUSH GUPTA', '1409113027', 4, 1, 2, 0, 1),
(3634, '', 'AYUSH SEHGAL', '1409113028', 4, 1, 2, 0, 1),
(3635, '', 'AYUSH SRIVASTAVA', '1409113029', 4, 1, 2, 0, 1),
(3636, '', 'CHANDRA  PRAKASH', '1409113030', 4, 1, 2, 0, 1),
(3637, '', 'DEEPTI JAIN', '1409113031', 4, 1, 2, 0, 1),
(3638, '', 'DIKSHA SHARMA', '1409113033', 4, 1, 2, 0, 1),
(3639, '', 'DIVYANSHU SHARMA', '1409113034', 4, 1, 2, 0, 1),
(3640, '', 'DIVYANSHU VERMA', '1409113035', 4, 1, 2, 0, 1),
(3641, '', 'EKANSH KUMAR PURWAR', '1409113036', 4, 1, 2, 0, 1),
(3642, '', 'EKANSH MAHAJAN', '1409113037', 4, 1, 2, 0, 1),
(3643, '', 'ESHIKA SINGH', '1409113038', 4, 1, 2, 0, 1),
(3644, '', 'GITESH BHASIN', '1409113039', 4, 1, 2, 0, 1),
(3645, '', 'GUNJAN SATIJA', '1409113040', 4, 1, 2, 0, 1),
(3646, '', 'JAI KUMAR', '1409113043', 4, 1, 2, 0, 1),
(3647, '', 'KARAM VEER SINGH', '1409113044', 4, 1, 2, 0, 1),
(3648, '', 'K P KUSHAL', '1409113045', 4, 1, 2, 0, 1),
(3649, '', 'KUMARI DIMPLE MAHAL', '1409113046', 4, 1, 2, 0, 1),
(3650, '', 'KUSHAGRA PANDE', '1409113047', 4, 1, 2, 0, 1),
(3651, '', 'LAKSHYA SARASWAT', '1409113048', 4, 1, 2, 0, 1),
(3652, '', 'MAYANK GUPTA', '1409113049', 4, 1, 2, 0, 1),
(3653, '', 'MOHIT DAUNERIA', '1409113051', 4, 1, 2, 0, 1),
(3654, '', 'MOHIT KAKKAR', '1409113052', 4, 1, 2, 0, 1),
(3655, '', 'NANDNI JAIN', '1409113053', 4, 1, 2, 0, 1),
(3656, '', 'NEHA SHARMA', '1409113054', 4, 1, 2, 0, 1),
(3657, '', 'NISHANT PRATAP', '1409113055', 4, 1, 2, 0, 1),
(3658, '', 'NITISH TYAGI', '1409113056', 4, 1, 2, 0, 1),
(3659, '', 'NITISHA SRIVASTAV', '1409113057', 4, 1, 2, 0, 1),
(3660, '', 'PANKAJ KUMAR DIVEDI', '1409113059', 4, 1, 2, 0, 1),
(3661, '', 'ANUBHAV MITTAL', '1409131019', 4, 1, 2, 0, 1),
(3662, '', 'NISHITA SINGH', '1409140095', 4, 1, 2, 0, 1),
(3663, '', 'AVDHESH KUMAR', '1509113904', 4, 1, 2, 0, 1),
(3664, '', 'DUSHYANT  KUMAR', '1509113905', 4, 1, 2, 0, 1),
(3665, '', 'MANVENDRA SINGH', '1509113906', 4, 1, 2, 0, 1),
(3666, '', 'SOURABH  GOEL', '1509113909', 4, 1, 2, 0, 1),
(3667, '', 'PRAKASH RANJAN SINGH', '1409113061', 4, 1, 2, 1, 1),
(3668, '', 'PRANJAL GUPTA', '1409113062', 4, 1, 2, 0, 1),
(3669, '', 'PRATEEK SINGH ARYA', '1409113063', 4, 1, 2, 0, 1),
(3670, '', 'PRATYAKSH AGARWAL', '1409113064', 4, 1, 2, 0, 1),
(3671, '', 'PRINCE KUMAR KATIYAR', '1409113065', 4, 1, 2, 0, 1),
(3672, '', 'RAJAT SINGH', '1409113067', 4, 1, 2, 0, 1),
(3673, '', 'RASHI JAIN', '1409113068', 4, 1, 2, 0, 1),
(3674, '', 'RISHABH DHAKAR', '1409113069', 4, 1, 2, 0, 1),
(3675, '', 'RISHABH GUPTA', '1409113070', 4, 1, 2, 0, 1),
(3676, '', 'RISHABH KUMAR', '1409113072', 4, 1, 2, 0, 1),
(3677, '', 'RISHIKA WADHWANI', '1409113075', 4, 1, 2, 0, 1),
(3678, '', 'ROHIT KUMAR', '1409113076', 4, 1, 2, 0, 1),
(3679, '', 'SAKSHI JAISWAL', '1409113077', 4, 1, 2, 0, 1),
(3680, '', 'SAKSHI SHUKLA', '1409113078', 4, 1, 2, 0, 1),
(3681, '', 'SALONI GUPTA', '1409113079', 4, 1, 2, 0, 1),
(3682, '', 'SANDEEP KUMAR', '1409113081', 4, 1, 2, 0, 1),
(3683, '', 'SANDEEP SINGH', '1409113082', 4, 1, 2, 0, 1),
(3684, '', 'SANJAY  NATHANI', '1409113083', 4, 1, 2, 0, 1),
(3685, '', 'SANJEEV KUMAR', '1409113084', 4, 1, 2, 0, 1),
(3686, '', 'SARAH  ARIF', '1409113085', 4, 1, 2, 0, 1),
(3687, '', 'SAURAV  PANDEY', '1409113086', 4, 1, 2, 0, 1),
(3688, '', 'SHAGUN SINGH', '1409113087', 4, 1, 2, 0, 1),
(3689, '', 'SHAHRUKH ALI', '1409113088', 4, 1, 2, 0, 1),
(3690, '', 'SHASHANK SHARMA', '1409113089', 4, 1, 2, 0, 1),
(3691, '', 'SHEETAL VERMA', '1409113090', 4, 1, 2, 0, 1),
(3692, '', 'SHELVI GARG', '1409113091', 4, 1, 2, 0, 1),
(3693, '', 'SHIKHAR SHUKLA', '1409113092', 4, 1, 2, 0, 1),
(3694, '', 'SHIVAM DESHWAL', '1409113093', 4, 1, 2, 0, 1),
(3695, '', 'SHIVAM SINGHAL', '1409113094', 4, 1, 2, 0, 1),
(3696, '', 'SHIVANG AGARWAL', '1409113095', 4, 1, 2, 0, 1),
(3697, '', 'SHUBHAM', '1409113099', 4, 1, 2, 0, 1),
(3698, '', 'SHUBHAM ARORA', '1409113100', 4, 1, 2, 0, 1),
(3699, '', 'SHUBHAM BAJPAI', '1409113101', 4, 1, 2, 0, 1),
(3700, '', 'SHUBHAM GARG', '1409113102', 4, 1, 2, 0, 1),
(3701, '', 'SHUBHAM GUPTA', '1409113103', 4, 1, 2, 0, 1),
(3702, '', 'SHUBHAM SINGH', '1409113105', 4, 1, 2, 0, 1),
(3703, '', 'SHUBHRA PRAMOD', '1409113107', 4, 1, 2, 0, 1),
(3704, '', 'SOMANSHU SRIVASTAVA', '1409113108', 4, 1, 2, 0, 1),
(3705, '', 'SUDHANSHU RANJAN', '1409113110', 4, 1, 2, 0, 1),
(3706, '', 'SUYASH TILHARI', '1409113112', 4, 1, 2, 0, 1),
(3707, '', 'TUSHAR KOTHARI', '1409113113', 4, 1, 2, 0, 1),
(3708, '', 'VAIBHAV KUMAR RAI', '1409113114', 4, 1, 2, 0, 1),
(3709, '', 'VAIBHAV SHARMA', '1409113115', 4, 1, 2, 0, 1),
(3710, '', 'VAISHALI', '1409113116', 4, 1, 2, 0, 1),
(3711, '', 'VIJAY PRAKASH CHAURASIA', '1409113117', 4, 1, 2, 0, 1),
(3712, '', 'VIVEK SHARMA', '1409113119', 4, 1, 2, 0, 1),
(3713, '', 'VYAKHYA SRIVASTAVA', '1409113120', 4, 1, 2, 0, 1),
(3714, '', 'YASHPAL SINGH BAGHEL', '1409113121', 4, 1, 2, 0, 1),
(3715, '', 'ABHISHEK GUHA', '1409120005', 4, 1, 2, 0, 1),
(3716, '', 'AJAY GANGWAR', '1409120010', 4, 1, 2, 0, 1),
(3717, '', 'AKSHAT TANDON', '1409121006', 4, 1, 2, 0, 1),
(3718, '', 'ANSHUL KUMAR', '1409121012', 4, 1, 2, 0, 1),
(3719, '', 'DEEP KUSHAGRA', '1409121014', 4, 1, 2, 0, 1),
(3720, '', 'VISHAL DUBEY', '1409121061', 4, 1, 2, 0, 1),
(3721, '', 'NEHA SINGHANIA', '1509113907', 4, 1, 2, 0, 1),
(3722, '', 'ANKITA KUMARI', '1509113902', 4, 1, 2, 0, 1),
(3723, '', 'ANIL KUMAR', '1509113901', 4, 1, 2, 0, 1),
(3724, '', 'AADHAR GUPTA', '1409110001', 4, 1, 1, 0, 1),
(3725, '', 'ABHAY GARG', '1409110003', 4, 1, 1, 0, 1),
(3726, '', 'ABHINAV CHOUDHARY', '1409110004', 4, 1, 1, 0, 1),
(3727, '', 'ABHISHEK SINGHANIA', '1409110006', 4, 1, 1, 0, 1),
(3728, '', 'ADARSH GUPTA', '1409110007', 4, 1, 1, 0, 1),
(3729, '', 'AISWARYA SINGH', '1409110008', 4, 1, 1, 0, 1),
(3730, '', 'AKASH AGARWAL', '1409110009', 4, 1, 1, 0, 1),
(3731, '', 'AKASH DOHARE', '1409110010', 4, 1, 1, 0, 1),
(3732, '', 'AKSHAY SINGH', '1409110011', 4, 1, 1, 0, 1),
(3733, '', 'AKSHAY YADAV', '1409110012', 4, 1, 1, 0, 1),
(3734, '', 'AMIT CHAUDHARY', '1409110013', 4, 1, 1, 0, 1),
(3735, '', 'ANCHIT DEVANSH', '1409110014', 4, 1, 1, 0, 1),
(3736, '', 'ANJALI SINGH', '1409110015', 4, 1, 1, 0, 1),
(3737, '', 'ANKIT KUMAR', '1409110016', 4, 1, 1, 0, 1),
(3738, '', 'ANURAG SINGH', '1409110018', 4, 1, 1, 0, 1),
(3739, '', 'ANVAY SINGH', '1409110019', 4, 1, 1, 0, 1),
(3740, '', 'ARTI GUPTA', '1409110020', 4, 1, 1, 0, 1),
(3741, '', 'ARUSHI GUPTA', '1409110021', 4, 1, 1, 0, 1),
(3742, '', 'ASHVANI KUMAR SINGH', '1409110023', 4, 1, 1, 0, 1),
(3743, '', 'AVENEESH MISHRA', '1409110024', 4, 1, 1, 0, 1),
(3744, '', 'AVNI AGRAWAL', '1409110025', 4, 1, 1, 0, 1),
(3745, '', 'AYUSH MALIK', '1409110026', 4, 1, 1, 0, 1),
(3746, '', 'AYUSHI AGARWAL', '1409110027', 4, 1, 1, 0, 1),
(3747, '', 'AYUSHI GUPTA', '1409110028', 4, 1, 1, 0, 1),
(3748, '', 'AYUSHI JAIN', '1409110029', 4, 1, 1, 0, 1),
(3749, '', 'AYUSHI MAURYA', '1409110030', 4, 1, 1, 0, 1),
(3750, '', 'BHAWNA BHATT', '1409110031', 4, 1, 1, 0, 1),
(3751, '', 'BINNU BHARTI', '1409110032', 4, 1, 1, 0, 1),
(3752, '', 'CHARU TOLIA', '1409110033', 4, 1, 1, 0, 1),
(3753, '', 'DANISH SHAHAB', '1409110034', 4, 1, 1, 0, 1),
(3754, '', 'DUSHYANT KUMAR', '1409110035', 4, 1, 1, 0, 1),
(3755, '', 'EKTA GAUTAM', '1409110036', 4, 1, 1, 0, 1),
(3756, '', 'GAURAV CHATURVEDI', '1409110037', 4, 1, 1, 0, 1),
(3757, '', 'GAURAV SINGH', '1409110038', 4, 1, 1, 0, 1),
(3758, '', 'GURVINDER SINGH', '1409110039', 4, 1, 1, 0, 1),
(3759, '', 'HIMANI SINGH', '1409110042', 4, 1, 1, 0, 1),
(3760, '', 'HIMANSHU ANAND', '1409110043', 4, 1, 1, 0, 1),
(3761, '', 'HIMANSHU RANA', '1409110044', 4, 1, 1, 0, 1),
(3762, '', 'HRISHABH JAIN', '1409110046', 4, 1, 1, 0, 1),
(3763, '', 'ISHANI JAISWAL', '1409110047', 4, 1, 1, 0, 1),
(3764, '', 'JASMEET SINGH', '1409110048', 4, 1, 1, 0, 1),
(3765, '', 'KARAN KUMAR', '1409110049', 4, 1, 1, 0, 1),
(3766, '', 'KAUSTUBH TRIPATHI', '1409110050', 4, 1, 1, 0, 1),
(3767, '', 'KAVYA GUPTA', '1409110051', 4, 1, 1, 0, 1),
(3768, '', 'KHUSHBOO LALWANI', '1409110052', 4, 1, 1, 0, 1),
(3769, '', 'KHYATI BANSAL', '1409110053', 4, 1, 1, 0, 1),
(3770, '', 'KSHITIDJ MAHINDROO', '1409110054', 4, 1, 1, 0, 1),
(3771, '', 'KSHITIJ TIWARI', '1409110055', 4, 1, 1, 0, 1),
(3772, '', 'KUNAL MAHAJAN', '1409110056', 4, 1, 1, 0, 1),
(3773, '', 'KUNAL SHARMA', '1409110057', 4, 1, 1, 0, 1),
(3774, '', 'MAHIMA TIWARI', '1409110058', 4, 1, 1, 0, 1),
(3775, '', 'MANAS SRIVASTAVA', '1409110059', 4, 1, 1, 0, 1),
(3776, '', 'MANIK RASTOGI', '1409110060', 4, 1, 1, 0, 1),
(3777, '', 'MANU AGNIHOTHRI', '1409110061', 4, 1, 1, 0, 1),
(3778, '', 'MAYANK DIWAKAR', '1409110062', 4, 1, 1, 0, 1),
(3779, '', 'MILENDRA KUMAR VERMA', '1409110064', 4, 1, 1, 0, 1),
(3780, '', 'MOHIT KATARIA', '1409110067', 4, 1, 1, 0, 1),
(3781, '', 'N.NIVEDITHA', '1409110068', 4, 1, 1, 0, 1),
(3782, '', 'NAMITA GAUTAM', '1409110069', 4, 1, 1, 0, 1),
(3783, '', 'NEERAJ KUMAR', '1409110070', 4, 1, 1, 0, 1),
(3784, '', 'NIPUN VERMA', '1409110071', 4, 1, 1, 0, 1),
(3785, '', 'NISHANT KUMAR BHARDWAJ', '1409110072', 4, 1, 1, 0, 1),
(3786, '', 'NITISH RAJPAL', '1409110073', 4, 1, 1, 0, 1),
(3787, '', 'PRAGYA BAID', '1409110075', 4, 1, 1, 0, 1),
(3788, '', 'PRAGYA MISHRA', '1409110076', 4, 1, 1, 0, 1),
(3789, '', 'PRAKHAR MISHRA', '1409110077', 4, 1, 1, 0, 1),
(3790, '', 'PRAKHAR RATHI', '1409110078', 4, 1, 1, 0, 1),
(3791, '', 'PRAKHAR SRIVASTAVA', '1409110079', 4, 1, 1, 0, 1),
(3792, '', 'PRANJAL CHAUDHARY', '1409110080', 4, 1, 1, 0, 1),
(3793, '', 'RAGHAWENDRA SINGH', '1409110082', 4, 1, 1, 0, 1),
(3794, '', 'RAHUL SINGH', '1409110083', 4, 1, 1, 0, 1),
(3795, '', 'RICHA SHARMA', '1409110084', 4, 1, 1, 0, 1),
(3796, '', 'RISHABH SINGH CHAUHAN', '1409110085', 4, 1, 1, 0, 1),
(3797, '', 'RITU MAHALI', '1409110086', 4, 1, 1, 0, 1),
(3798, '', 'ROHIT CHAUDHARY', '1409110087', 4, 1, 1, 0, 1),
(3799, '', 'ROHIT KUMAR', '1409110088', 4, 1, 1, 0, 1),
(3800, '', 'SAHIL KUMAR MAURYA', '1409110089', 4, 1, 1, 0, 1),
(3801, '', 'SAINISH PAJNOO', '1409110090', 4, 1, 1, 0, 1),
(3802, '', 'SAKSHAM REHAN', '1409110091', 4, 1, 1, 0, 1),
(3803, '', 'SAKSHI GUPTA', '1409110092', 4, 1, 1, 0, 1),
(3804, '', 'SALOKYA', '1409110093', 4, 1, 1, 0, 1),
(3805, '', 'SAMARTH AGRAWAL', '1409110094', 4, 1, 1, 0, 1),
(3806, '', 'SANCHIT GUPTA', '1409110095', 4, 1, 1, 0, 1),
(3807, '', 'SANYAM AGARWAL', '1409110096', 4, 1, 1, 0, 1),
(3808, '', 'SAUGHANDHICK YASHI NAVAL', '1409110098', 4, 1, 1, 0, 1),
(3809, '', 'SHAILESH KUMAR PAL', '1409110099', 4, 1, 1, 0, 1),
(3810, '', 'SHAILVI SINGH', '1409110100', 4, 1, 1, 0, 1),
(3811, '', 'SHARMISHTHA SHARMA', '1409110101', 4, 1, 1, 0, 1),
(3812, '', 'SHIVAM BANSAL', '1409110103', 4, 1, 1, 0, 1),
(3813, '', 'SHIVANGI KAUL', '1409110104', 4, 1, 1, 0, 1),
(3814, '', 'SHIVANI SIKKA', '1409110105', 4, 1, 1, 0, 1),
(3815, '', 'SHIVANI TYAGI', '1409110106', 4, 1, 1, 0, 1),
(3816, '', 'SHRIYA MAHESHWARI', '1409110107', 4, 1, 1, 0, 1),
(3817, '', 'SHUBHAM AGRAWAL', '1409110108', 4, 1, 1, 0, 1),
(3818, '', 'SHUBHAM JOSHI', '1409110110', 4, 1, 1, 0, 1),
(3819, '', 'SHUBHANKER GOYAL', '1409110111', 4, 1, 1, 0, 1),
(3820, '', 'SIDDHARTH SHETH', '1409110112', 4, 1, 1, 0, 1),
(3821, '', 'SINGDHA TYAGI', '1409110113', 4, 1, 1, 0, 1),
(3822, '', 'SOMAYA BHANDARI', '1409110114', 4, 1, 1, 0, 1),
(3823, '', 'SURAJ KANNOJIA', '1409110115', 4, 1, 1, 0, 1),
(3824, '', 'TARUN GARG', '1409110116', 4, 1, 1, 0, 1),
(3825, '', 'UNNATI AGRAWAL', '1409110117', 4, 1, 1, 0, 1),
(3826, '', 'UTKARSH GUPTA', '1409110118', 4, 1, 1, 0, 1),
(3827, '', 'UTKARSH SINGH', '1409110119', 4, 1, 1, 0, 1),
(3828, '', 'VARUN VARSHNEY', '1409110120', 4, 1, 1, 0, 1),
(3829, '', 'VIPUL SRIVASTAVA', '1409110121', 4, 1, 1, 0, 1),
(3830, '', 'VIRENDRA SINGH', '1409110122', 4, 1, 1, 0, 1),
(3831, '', 'VIVEK SINGH', '1409110123', 4, 1, 1, 0, 1),
(3832, '', 'YASH TRIPATHI', '1409110124', 4, 1, 1, 0, 1),
(3833, '', 'ZARA HUSSAIN', '1409110125', 4, 1, 1, 0, 1),
(3834, '', 'AAKANKSHA SINGH', '1409113002', 4, 1, 1, 0, 1),
(3835, '', 'AKARSH GUPTA', '1409113007', 4, 1, 1, 0, 1),
(3836, '', 'ARUSHI GOEL', '1409113021', 4, 1, 1, 0, 1),
(3837, '', 'AWINASH PANDEY', '1409113026', 4, 1, 1, 0, 1),
(3838, '', 'ISHITA KHARE', '1409113042', 4, 1, 1, 0, 1),
(3839, '', 'NIVEDITA', '1409113058', 4, 1, 1, 0, 1),
(3840, '', 'RISHABH JAIN', '1409113071', 4, 1, 1, 0, 1),
(3841, '', 'RISHABH PATEL', '1409113074', 4, 1, 1, 0, 1),
(3842, '', 'SHIVANGI GARG', '1409113096', 4, 1, 1, 0, 1),
(3843, '', 'SHIVANI PRAKASH GUPTA', '1409113097', 4, 1, 1, 0, 1),
(3844, '', 'SHIVANIKA SHAH', '1409113098', 4, 1, 1, 0, 1),
(3845, '', 'SUHANI MITTAL', '1409113111', 4, 1, 1, 0, 1),
(3846, '', 'NITYA SRIVASTAVA', '1409121021', 4, 1, 1, 0, 1),
(3847, '', 'SHIVAM SRIVASTAVA', '1409131082', 4, 1, 1, 0, 1),
(3848, '', 'ABHISHEK  SINGH', '1509110901', 4, 1, 1, 0, 1),
(3849, '', 'ADEEBA  MASOOD', '1509110902', 4, 1, 1, 0, 1),
(3850, '', 'ADITYA NARAYAN TRIPATHI', '1509110903', 4, 1, 1, 0, 1),
(3851, '', 'AJAY  YADAV', '1509110904', 4, 1, 1, 0, 1),
(3852, '', 'AMARDEEP  SINGH', '1509110905', 4, 1, 1, 0, 1),
(3853, '', 'ARJUN  SINGH', '1509110906', 4, 1, 1, 0, 1),
(3854, '', 'DEEPTI  GARG', '1509110907', 4, 1, 1, 0, 1),
(3855, '', 'DIGVIJAY KUMAR', '1509110908', 4, 1, 1, 0, 1),
(3856, '', 'GAYATREE  SINGH', '1509110909', 4, 1, 1, 0, 1),
(3857, '', 'KUSHAGRA  GUPTA', '1509110910', 4, 1, 1, 0, 1),
(3858, '', 'MALTI  CHAUHAN', '1509110911', 4, 1, 1, 0, 1),
(3859, '', 'MOHD SAHIL', '1509110912', 4, 1, 1, 0, 1),
(3860, '', 'MUBEEN  KHAN', '1509110913', 4, 1, 1, 0, 1),
(3861, '', 'NITU  YADAV', '1509110914', 4, 1, 1, 0, 1),
(3862, '', 'SAPALEE  SINGH', '1509110915', 4, 1, 1, 0, 1),
(3863, '', 'SATPAL  SINGH', '1509110916', 4, 1, 1, 0, 1),
(3864, '', 'SOHRAB  ANSARI', '1509110917', 4, 1, 1, 0, 1),
(3865, '', 'SRISHTI  SONI', '1509110918', 4, 1, 1, 0, 1),
(3866, '', 'SWATI  AGRAWAL', '1509110919', 4, 1, 1, 0, 1),
(3867, '', 'SYED RAZA ALI ZAIDI', '1509110920', 4, 1, 1, 0, 1),
(3868, '', 'VIJENDRA  TRIPATHI', '1509110921', 4, 1, 1, 0, 1),
(3869, '', 'PULAK  GAHARWAR', '1209100078', 4, 1, 5, 0, 1),
(3870, '', 'ANUBHAV YADAV', '1309100030', 4, 1, 5, 0, 1),
(3871, '', 'ASHWANI PRAKASH', '1309100035', 4, 1, 5, 0, 1),
(3872, '', 'JASPREET KAUR', '1309100051', 4, 1, 5, 0, 1),
(3873, '', 'MUSSAYYAB ZAIDI', '1309100059', 4, 1, 5, 0, 1),
(3874, '', 'ABHINAV KUMAR SINGH', '1409100001', 4, 1, 5, 0, 1),
(3875, '', 'ABHISHEK PANDEY', '1409100002', 4, 1, 5, 0, 1),
(3876, '', 'ABHISHEK SHARMA', '1409100003', 4, 1, 5, 0, 1),
(3877, '', 'ABHISHEK SINGH', '1409100004', 4, 1, 5, 0, 1),
(3878, '', 'ABHISHEK SINGH', '1409100005', 4, 1, 5, 0, 1),
(3879, '', 'Abhishek Verma', '1409100006', 4, 1, 5, 0, 1),
(3880, '', 'ABHISHEK VYAS', '1409100007', 4, 1, 5, 0, 1),
(3881, '', 'ADITYA SRIVASTAVA', '1409100008', 4, 1, 5, 0, 1),
(3882, '', 'AISHWARY NAYAK', '1409100009', 4, 1, 5, 0, 1),
(3883, '', 'AKASH DWIVEDI', '1409100010', 4, 1, 5, 0, 1),
(3884, '', 'AKASH SINGH', '1409100011', 4, 1, 5, 0, 1),
(3885, '', 'AKSHAT SINGHAL', '1409100012', 4, 1, 5, 0, 1),
(3886, '', 'AMARDEEP SINGH', '1409100013', 4, 1, 5, 0, 1),
(3887, '', 'AMIT GANGWAR', '1409100014', 4, 1, 5, 0, 1),
(3888, '', 'ANIRUDDH SAXENA', '1409100015', 4, 1, 5, 0, 1),
(3889, '', 'ANKIT GUPTA', '1409100016', 4, 1, 5, 0, 1),
(3890, '', 'ANSHUMAN SINGH', '1409100018', 4, 1, 5, 0, 1),
(3891, '', 'ANUBHAV SINGH', '1409100019', 4, 1, 5, 0, 1),
(3892, '', 'ANURAG SINGH', '1409100020', 4, 1, 5, 0, 1),
(3893, '', 'AVINASH SINGH', '1409100021', 4, 1, 5, 0, 1),
(3894, '', 'AVNISHA VERMA', '1409100022', 4, 1, 5, 0, 1),
(3895, '', 'BALLESH PRAJESH', '1409100024', 4, 1, 5, 0, 1),
(3896, '', 'BIRENDRA KUMAR YADAV', '1409100026', 4, 1, 5, 0, 1),
(3897, '', 'BRAJESH KUMAR', '1409100027', 4, 1, 5, 0, 1),
(3898, '', 'DEEKSHA BHARTI', '1409100028', 4, 1, 5, 0, 1),
(3899, '', 'DEEP SHIKHAR VARDHAN', '1409100029', 4, 1, 5, 0, 1),
(3900, '', 'DEEPAK KUMAR', '1409100030', 4, 1, 5, 0, 1),
(3901, '', 'DEEPAK RAMAN', '1409100031', 4, 1, 5, 0, 1),
(3902, '', 'DEEPAK RATHORE', '1409100032', 4, 1, 5, 0, 1),
(3903, '', 'DEEPAK SACHAN', '1409100033', 4, 1, 5, 0, 1),
(3904, '', 'DEVESH NEMA', '1409100034', 4, 1, 5, 0, 1),
(3905, '', 'DHANANJAY RAJ SHARMA', '1409100035', 4, 1, 5, 0, 1),
(3906, '', 'DIGVIJAY SINGH', '1409100036', 4, 1, 5, 0, 1),
(3907, '', 'DIGVIJENDR SINGH  TONAR', '1409100037', 4, 1, 5, 0, 1),
(3908, '', 'DIVYANSHI SINGH', '1409100038', 4, 1, 5, 0, 1),
(3909, '', 'DIVYANSHU MISHRA', '1409100039', 4, 1, 5, 0, 1),
(3910, '', 'GAURAV SHARMA', '1409100041', 4, 1, 5, 0, 1),
(3911, '', 'HARSH KUMAR GOYEL', '1409100042', 4, 1, 5, 0, 1),
(3912, '', 'JAYENDRA PRATAP SINGH', '1409100044', 4, 1, 5, 0, 1),
(3913, '', 'KANISHK SWAMI', '1409100045', 4, 1, 5, 0, 1),
(3914, '', 'KISHLAY', '1409100046', 4, 1, 5, 0, 1),
(3915, '', 'KRISHNA KANT KAUSHIK', '1409100047', 4, 1, 5, 0, 1),
(3916, '', 'LAKSHAY TYAGI', '1409100048', 4, 1, 5, 0, 1),
(3917, '', 'MANISH KUMAR KESHARWANI', '1409100049', 4, 1, 5, 0, 1),
(3918, '', 'MAYANK BAJAJ', '1409100050', 4, 1, 5, 0, 1),
(3919, '', 'MAYANK RAGHAV', '1409100051', 4, 1, 5, 0, 1),
(3920, '', 'MAYANK SRIVASTAV', '1409100052', 4, 1, 5, 0, 1),
(3921, '', 'MOHD ATIF', '1409100053', 4, 1, 5, 0, 1),
(3922, '', 'MOHD TABISH KHAN', '1409100054', 4, 1, 5, 0, 1),
(3923, '', 'MOHD YASSAR WARSI', '1409100055', 4, 1, 5, 0, 1),
(3924, '', 'MOHIT CHOORAMANI', '1409100056', 4, 1, 5, 0, 1),
(3925, '', 'MOHIT KUMAR', '1409100057', 4, 1, 5, 0, 1),
(3926, '', 'NEETU KUMARI', '1409100058', 4, 1, 5, 0, 1),
(3927, '', 'NISHTHA PANDEY', '1409100059', 4, 1, 5, 0, 1),
(3928, '', 'NITISH KUMAR', '1409100061', 4, 1, 5, 0, 1),
(3929, '', 'PARANKUSH DAGAR', '1409100062', 4, 1, 5, 0, 1),
(3930, '', 'PARDEEP SHARMA', '1409100063', 4, 1, 5, 0, 1),
(3931, '', 'PAWAN PRATAP SINGH', '1409100064', 4, 1, 5, 0, 1),
(3932, '', 'PIYUSH', '1409100065', 4, 1, 5, 0, 1),
(3933, '', 'PIYUSH SAINI', '1409100066', 4, 1, 5, 0, 1),
(3934, '', 'PRABHAT NIGAM', '1409100067', 4, 1, 5, 0, 1),
(3935, '', 'PRABHAT RAJ', '1409100068', 4, 1, 5, 0, 1),
(3936, '', 'PRAKHAR JAISWAL', '1409100069', 4, 1, 5, 0, 1),
(3937, '', 'PRANJAL GUPTA', '1409100070', 4, 1, 5, 0, 1),
(3938, '', 'PRANJAL RATHORE', '1409100071', 4, 1, 5, 0, 1),
(3939, '', 'PUNEET KUMAR SINGH', '1409100072', 4, 1, 5, 0, 1),
(3940, '', 'PUSHPENDER KUMAR', '1409100073', 4, 1, 5, 0, 1),
(3941, '', 'RAGHAV KAPOOR', '1409100074', 4, 1, 5, 0, 1),
(3942, '', 'RAHUL GIRI', '1409100075', 4, 1, 5, 0, 1),
(3943, '', 'RAJAT GAUTAM', '1409100076', 4, 1, 5, 0, 1),
(3944, '', 'RAJAT VIKRAM SARAN', '1409100078', 4, 1, 5, 0, 1),
(3945, '', 'RATNESH VERMA', '1409100079', 4, 1, 5, 0, 1),
(3946, '', 'RISHABH DEV MISHRA', '1409100080', 4, 1, 5, 0, 1),
(3947, '', 'RISHI PAL SINGH', '1409100081', 4, 1, 5, 0, 1),
(3948, '', 'RITESH KUMAR', '1409100082', 4, 1, 5, 0, 1),
(3949, '', 'RIYA VERMA', '1409100083', 4, 1, 5, 0, 1),
(3950, '', 'ROHAN GUPTA', '1409100084', 4, 1, 5, 0, 1),
(3951, '', 'ROHIT KUMAR', '1409100085', 4, 1, 5, 0, 1),
(3952, '', 'SACHIN KUMAR', '1409100086', 4, 1, 5, 0, 1),
(3953, '', 'SADHVI VERMA', '1409100087', 4, 1, 5, 0, 1),
(3954, '', 'SANDEEP GAUR', '1409100088', 4, 1, 5, 0, 1),
(3955, '', 'SATYAM MISHRA', '1409100089', 4, 1, 5, 0, 1),
(3956, '', 'SHASHANK KUMAR NAYAK', '1409100093', 4, 1, 5, 0, 1),
(3957, '', 'SHASHWAT VIKRAM SINGH', '1409100094', 4, 1, 5, 0, 1),
(3958, '', 'SHIVA SRIVASTAVA', '1409100095', 4, 1, 5, 0, 1),
(3959, '', 'SHIVAM GADGEY', '1409100096', 4, 1, 5, 0, 1),
(3960, '', 'SHRITESH SRIVASTAVA', '1409100097', 4, 1, 5, 0, 1),
(3961, '', 'SHUBHAM ANAND', '1409100098', 4, 1, 5, 0, 1),
(3962, '', 'SHUBHAM CHAUDHARY', '1409100099', 4, 1, 5, 0, 1),
(3963, '', 'SHUBHAM SAXENA', '1409100100', 4, 1, 5, 0, 1),
(3964, '', 'SHUBHANKAR GUPTA', '1409100101', 4, 1, 5, 0, 1),
(3965, '', 'SIDDHARTH NAGER', '1409100103', 4, 1, 5, 0, 1),
(3966, '', 'SPARSH SINGH', '1409100104', 4, 1, 5, 0, 1),
(3967, '', 'SUJAY SINGH', '1409100105', 4, 1, 5, 0, 1),
(3968, '', 'SUMIT KUMAR SHUKLA', '1409100106', 4, 1, 5, 0, 1),
(3969, '', 'SURYA PRAKASH', '1409100107', 4, 1, 5, 0, 1),
(3970, '', 'SWAPNIL PATEL', '1409100108', 4, 1, 5, 0, 1),
(3971, '', 'TANYA', '1409100109', 4, 1, 5, 0, 1),
(3972, '', 'TARUN KUMAR', '1409100110', 4, 1, 5, 0, 1),
(3973, '', 'TARUN TRIPATHI', '1409100111', 4, 1, 5, 0, 1),
(3974, '', 'TUSHAR DWIVEDI', '1409100112', 4, 1, 5, 0, 1),
(3975, '', 'UDAY PRATAP SINGH', '1409100113', 4, 1, 5, 0, 1),
(3976, '', 'UTKARSH GUPTA', '1409100114', 4, 1, 5, 0, 1),
(3977, '', 'VASU MISHRA', '1409100115', 4, 1, 5, 0, 1),
(3978, '', 'VISHAL BHADAURIA', '1409100116', 4, 1, 5, 0, 1),
(3979, '', 'VISHAL YADAV', '1409100117', 4, 1, 5, 0, 1),
(3980, '', 'VISHRUT UPADHYAY', '1409100118', 4, 1, 5, 0, 1),
(3981, '', 'YASHAS DEV', '1409100119', 4, 1, 5, 0, 1),
(3982, '', 'YASHENDRA SINGH', '1409100120', 4, 1, 5, 0, 1),
(3983, '', 'YOGESH KUMAR', '1409100121', 4, 1, 5, 0, 1),
(3984, '', 'RISHABH KUMAR', '1409113073', 4, 1, 5, 0, 1),
(3985, '', 'SHUBHAM SHARMA', '1409113104', 4, 1, 5, 0, 1),
(3986, '', 'RAJENDRA GOND', '1409121027', 4, 1, 5, 0, 1),
(3987, '', 'ANSHUL SINGH', '1409131018', 4, 1, 5, 0, 1),
(3988, '', 'RAHUL CHOUDHARY', '1409140114', 4, 1, 5, 0, 1),
(3989, '', 'ABHISHEK SINGH', '1509100901', 4, 1, 5, 0, 1),
(3990, '', 'DEEPAK GUPTA', '1509100905', 4, 1, 5, 0, 1),
(3991, '', 'FAIZ AZAM SABA', '1509100906', 4, 1, 5, 0, 1),
(3992, '', 'GAURAV KUMAR', '1509100907', 4, 1, 5, 0, 1),
(3993, '', 'HIMANSHU SAGAR', '1509100908', 4, 1, 5, 0, 1),
(3994, '', 'KIRDAR HUSAIN', '1509100909', 4, 1, 5, 0, 1),
(3995, '', 'KRISHAN KUMAR', '1509100910', 4, 1, 5, 0, 1),
(3996, '', 'MHD. MOIDUL HAQUE', '1509100911', 4, 1, 5, 0, 1),
(3997, '', 'MHD. NAEEM AKHTAR', '1509100912', 4, 1, 5, 0, 1),
(3998, '', 'MOHSIN SALMANI', '1509100913', 4, 1, 5, 0, 1),
(3999, '', 'PANKAJ PANDEY', '1509100914', 4, 1, 5, 0, 1),
(4000, '', 'PRACHI GUPTA', '1509100915', 4, 1, 5, 0, 1),
(4001, '', 'RAHUL SINGH', '1509100916', 4, 1, 5, 0, 1),
(4002, '', 'RAHUL VERMA', '1509100917', 4, 1, 5, 0, 1),
(4003, '', 'ROHIT SINGH', '1509100918', 4, 1, 5, 0, 1),
(4004, '', 'SATYAM ', '1509100919', 4, 1, 5, 0, 1),
(4005, '', 'SHUBHAM SRIVASTAVA', '1509100921', 4, 1, 5, 0, 1),
(4006, '', 'TUSHAR DUTT', '1509100922', 4, 1, 5, 0, 1),
(4007, '', 'VAIBHAV KUMAR', '1509100923', 4, 1, 5, 0, 1),
(4008, '', 'VIKAS BABU', '1509100924', 4, 1, 5, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `mem_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `picname` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `mobile` varchar(30) NOT NULL,
  `log` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(45) NOT NULL,
  `dob` date NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Hey there! I''m on Carbon Pie',
  `long_disc` varchar(255) NOT NULL DEFAULT 'New user of carbon Pie',
  `likers` int(11) NOT NULL DEFAULT '0',
  `haters` int(11) NOT NULL DEFAULT '0',
  `skills` int(11) DEFAULT NULL,
  `from_place` int(11) DEFAULT NULL,
  `lives_at` int(11) DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `confirm` int(11) DEFAULT '0',
  `mode_id` int(11) NOT NULL,
  `fav_log` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `wall_log` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `shouts` int(11) DEFAULT '0',
  `loudshouts` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`mem_id`, `username`, `password`, `fname`, `lname`, `email`, `picname`, `picture`, `gender`, `mobile`, `log`, `ip`, `dob`, `thumbnail`, `status`, `long_disc`, `likers`, `haters`, `skills`, `from_place`, `lives_at`, `views`, `confirm`, `mode_id`, `fav_log`, `wall_log`, `shouts`, `loudshouts`) VALUES
(1, 'alpha', 'magic@2526', 'ALPHA ', '', 'cpiejss@gmail.com', '', 'profile_pic/alpha/MjAxNy0xMi0wMiAyMDoxOA==g6lgd7tgr24s52hdaga9rhtv14_500x500_webhires512.png', 'male', '9717065383', '2018-02-05 18:23:05', '', '1997-11-04', 'profile_pic/alpha/thumb/MjAxNy0xMi0wMiAyMDoxOA==g6lgd7tgr24s52hdaga9rhtv14_60x60_webhires512.png', 'Hey there! I''m on Carbon Pie', 'New user of carbon Pie', 0, 1, NULL, 1, 3, 92, 0, 2, '2018-01-30 08:44:03', '2017-12-03 00:47:22', 0, 0),
(2, 'prs786', 'tigert', 'PRAKASH RANJAN', 'SINGH', 'prakashranjansingh04@gmail.com', '', 'profile_pic/prs786/MjAxOC0wMi0wOSAyMjowMQ==jr81klomdd9qjg1dns0ci9uo17_500x500_placeholderman1300x246.png', 'male', '9999999999', '2018-02-13 23:46:10', '', '1997-11-04', 'profile_pic/prs786/thumb/MjAxOC0wMi0wOSAyMjowMQ==jr81klomdd9qjg1dns0ci9uo17_60x60_placeholderman1300x246.png', 'When I die, I want my grave to offer free Wifi so that people visit more often.', 'New user of carbon Pie', 1, 0, NULL, 4, 5, 10, 0, 1, '2018-02-13 23:23:49', '2017-12-13 17:35:08', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `member_loc`
--

CREATE TABLE `member_loc` (
  `loc_id` int(11) NOT NULL,
  `place_id` varchar(180) NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `route` varchar(80) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `area` varchar(80) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `val_str` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member_loc`
--

INSERT INTO `member_loc` (`loc_id`, `place_id`, `name`, `route`, `city`, `area`, `state`, `country`, `zip`, `val_str`) VALUES
(1, 'ChIJf1Y03EHlDDkRGWvWI8sn0E8', 'JSS Academy of Technical Education', '', 'Noida', 'Sector 62', 'UP', 'IN', '201301', 'JSS Academy Of Technical Education, Noida, Uttar Pradesh, India'),
(3, 'ChIJF56aumblDDkRYJYNXfX4BKo', 'Punjab National Bank ATM', '', 'Noida', 'Sector 59', 'UP', 'IN', '201309', 'Punjab National Bank ATM, Sector 62, Noida, Uttar Pradesh, India'),
(4, 'ChIJc9DbR0RHnDkRikAurfrjWlc', 'Kanpur Central', '', 'Kanpur', 'Mirpur', 'UP', 'IN', '208004', 'Kanpur Central, Kanpur, Uttar Pradesh, India'),
(5, 'ChIJ7Y5-r5gCDTkRxpgZO3ZY8I4', 'Karol Bagh Metro Station', '', 'Delhi', 'Karol Bagh', 'DL', 'IN', '110005', 'Karol Bagh Metro Station, Block 1, New Delhi, Delhi, India');

-- --------------------------------------------------------

--
-- Table structure for table `notestatus`
--

CREATE TABLE `notestatus` (
  `notestatus_id` int(11) NOT NULL,
  `receiver` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `notification_id` int(11) NOT NULL,
  `why` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL,
  `worker` varchar(50) NOT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `hint` varchar(100) NOT NULL,
  `wakt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` int(11) DEFAULT NULL,
  `chat_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `one_notify`
--

CREATE TABLE `one_notify` (
  `one_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `mem_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `wakt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `passreset`
--

CREATE TABLE `passreset` (
  `passre_id` int(11) NOT NULL,
  `mem_id` int(11) NOT NULL,
  `otp` varchar(10) NOT NULL,
  `expire` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passreset`
--

INSERT INTO `passreset` (`passre_id`, `mem_id`, `otp`, `expire`) VALUES
(1, 2, '356944', '2018-02-11 14:16:48'),
(2, 2, '353355', '2018-02-11 14:23:19'),
(3, 2, '679288', '2018-02-11 14:57:20'),
(4, 2, '481548', '2018-02-11 15:08:54');

-- --------------------------------------------------------

--
-- Table structure for table `poll_count`
--

CREATE TABLE `poll_count` (
  `count_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `event` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `poll_option`
--

CREATE TABLE `poll_option` (
  `option_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `poll_option` varchar(50) NOT NULL,
  `hits` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `priority`
--

CREATE TABLE `priority` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(150) NOT NULL,
  `sticks` int(11) NOT NULL DEFAULT '0',
  `category_desc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `priority`
--

INSERT INTO `priority` (`category_id`, `category_name`, `sticks`, `category_desc`) VALUES
(1, 'Urgent', 0, 'its urgent'),
(4, 'Academic', 0, 'academic related'),
(5, 'Knowledge', 0, 'knowledge related'),
(6, 'Event', 0, 'event related'),
(7, 'Skill', 0, 'skill related'),
(8, 'Opportunity', 0, 'opportunity related'),
(9, 'Fun', 0, 'fun related');

-- --------------------------------------------------------

--
-- Table structure for table `priority_log`
--

CREATE TABLE `priority_log` (
  `pri_id` int(11) NOT NULL,
  `mem_id` int(11) NOT NULL,
  `pri_1` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pri_4` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pri_5` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pri_6` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pri_7` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pri_8` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pri_9` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `priority_log`
--

INSERT INTO `priority_log` (`pri_id`, `mem_id`, `pri_1`, `pri_4`, `pri_5`, `pri_6`, `pri_7`, `pri_8`, `pri_9`) VALUES
(1, 1, '2018-02-05 18:21:46', '2018-02-05 18:22:06', '2018-01-20 19:16:59', '2018-01-20 19:17:02', '2018-01-20 19:17:04', '2018-01-20 19:17:54', '2018-01-20 19:17:07'),
(2, 2, '2018-05-18 02:49:03', '2018-02-09 06:17:12', '2018-02-09 06:17:24', '2018-02-09 06:04:45', '2018-02-10 02:01:03', '2018-02-09 05:37:20', '2018-02-10 02:00:17');

-- --------------------------------------------------------

--
-- Table structure for table `private_member`
--

CREATE TABLE `private_member` (
  `pvt_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `category` varchar(255) NOT NULL,
  `allow` int(11) NOT NULL DEFAULT '0',
  `who_add` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `private_member`
--

INSERT INTO `private_member` (`pvt_id`, `username`, `category`, `allow`, `who_add`) VALUES
(1, 'prs786', 'xyz', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `section_id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `wall` varchar(50) DEFAULT NULL,
  `cdesc` varchar(2000) DEFAULT NULL,
  `private` int(11) NOT NULL DEFAULT '1',
  `active` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mode_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `stud_count` int(11) NOT NULL DEFAULT '0',
  `year` int(1) NOT NULL,
  `hearts` int(11) NOT NULL DEFAULT '0',
  `whatsapp_g` varchar(100) DEFAULT NULL,
  `whatsapp_g_ts` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`section_id`, `category`, `views`, `wall`, `cdesc`, `private`, `active`, `mode_id`, `course_id`, `branch_id`, `stud_count`, `year`, `hearts`, `whatsapp_g`, `whatsapp_g_ts`) VALUES
(1, 'CSE_1_YR1', 0, NULL, 'This is an official channel for CSE-1 Year-1 of branch COMPUTER SCIENCE ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 1, 0, 1, 0, NULL, NULL),
(2, 'CSE_2_YR1', 0, NULL, 'This is an official channel for CSE-2 Year-1 of branch COMPUTER SCIENCE ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 1, 0, 1, 0, NULL, NULL),
(3, 'CSE_1_YR2', 0, NULL, 'This is an official channel for CSE-1 Year-2 of branch COMPUTER SCIENCE ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 1, 0, 2, 0, NULL, NULL),
(4, 'CSE_2_YR2', 0, NULL, 'This is an official channel for CSE-2 Year-2 of branch COMPUTER SCIENCE ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 1, 0, 2, 0, NULL, NULL),
(5, 'CSE_1_YR3', 0, NULL, 'This is an official channel for CSE-1 Year-3 of branch COMPUTER SCIENCE ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 1, 0, 3, 0, NULL, NULL),
(6, 'CSE_2_YR3', 1, NULL, 'This is an official channel for CSE-2 Year-3 of branch COMPUTER SCIENCE ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 1, 0, 3, 0, NULL, NULL),
(7, 'CSE_1_YR4', 0, NULL, 'This is an official channel for CSE-1 Year-4 of branch COMPUTER SCIENCE ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 1, 0, 4, 0, NULL, NULL),
(8, 'CSE_2_YR4', 0, NULL, 'This is an official channel for CSE-2 Year-4 of branch COMPUTER SCIENCE ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 1, 0, 4, 0, NULL, NULL),
(9, 'IT_1_YR1', 0, NULL, 'This is an official channel for IT-1 Year-1 of branch INFORMATION TECHNOLOGY.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 2, 0, 1, 0, NULL, NULL),
(10, 'IT_2_YR1', 1, NULL, 'This is an official channel for IT-2 Year-1 of branch INFORMATION TECHNOLOGY.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 2, 0, 1, 0, NULL, NULL),
(11, 'IT_1_YR2', 0, NULL, 'This is an official channel for IT-1 Year-2 of branch INFORMATION TECHNOLOGY.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 2, 0, 2, 0, NULL, NULL),
(12, 'IT_2_YR2', 0, NULL, 'This is an official channel for IT-2 Year-2 of branch INFORMATION TECHNOLOGY.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 2, 0, 2, 0, NULL, NULL),
(13, 'IT_1_YR3', 1, NULL, 'This is an official channel for IT-1 Year-3 of branch INFORMATION TECHNOLOGY.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 2, 0, 3, 0, NULL, NULL),
(14, 'IT_2_YR3', 0, NULL, 'This is an official channel for IT-2 Year-3 of branch INFORMATION TECHNOLOGY.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 2, 0, 3, 0, NULL, NULL),
(15, 'IT_1_YR4', 0, NULL, 'This is an official channel for IT-1 Year-4 of branch INFORMATION TECHNOLOGY.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 2, 0, 4, 0, NULL, NULL),
(16, 'IT_2_YR4', 66, NULL, 'This is an official channel for IT-2 Year-4 of branch INFORMATION TECHNOLOGY.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 2, 1, 4, 1, NULL, NULL),
(17, 'ECE_1_YR1', 0, NULL, 'This is an official channel for ECE-1 Year-1 of branch ELECTRONICS AND COMMUNICATION ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 3, 0, 1, 0, NULL, NULL),
(18, 'ECE_2_YR1', 0, NULL, 'This is an official channel for ECE-2 Year-1 of branch ELECTRONICS AND COMMUNICATION ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 3, 0, 1, 0, NULL, NULL),
(19, 'ECE_1_YR2', 0, NULL, 'This is an official channel for ECE-1 Year-2 of branch ELECTRONICS AND COMMUNICATION ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 3, 0, 2, 0, NULL, NULL),
(20, 'ECE_2_YR2', 0, NULL, 'This is an official channel for ECE-2 Year-2 of branch ELECTRONICS AND COMMUNICATION ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 3, 0, 2, 0, NULL, NULL),
(21, 'ECE_1_YR3', 0, NULL, 'This is an official channel for ECE-1 Year-3 of branch ELECTRONICS AND COMMUNICATION ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 3, 0, 3, 0, NULL, NULL),
(22, 'ECE_2_YR3', 0, NULL, 'This is an official channel for ECE-2 Year-3 of branch ELECTRONICS AND COMMUNICATION ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 3, 0, 3, 0, NULL, NULL),
(23, 'ECE_1_YR4', 0, NULL, 'This is an official channel for ECE-1 Year-4 of branch ELECTRONICS AND COMMUNICATION ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 3, 0, 4, 0, NULL, NULL),
(24, 'ECE_2_YR4', 0, NULL, 'This is an official channel for ECE-2 Year-4 of branch ELECTRONICS AND COMMUNICATION ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 3, 0, 4, 0, NULL, NULL),
(25, 'EE_1_YR1', 0, NULL, 'This is an official channel for EE-1 Year-1 of branch ELECTRICAL ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 4, 0, 1, 0, NULL, NULL),
(26, 'EE_2_YR1', 0, NULL, 'This is an official channel for EE-2 Year-1 of branch ELECTRICAL ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 4, 0, 1, 0, NULL, NULL),
(27, 'EE_1_YR2', 0, NULL, 'This is an official channel for EE-1 Year-2 of branch ELECTRICAL ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 4, 0, 2, 0, NULL, NULL),
(28, 'EE_2_YR2', 0, NULL, 'This is an official channel for EE-2 Year-2 of branch ELECTRICAL ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 4, 0, 2, 0, NULL, NULL),
(29, 'EE_1_YR3', 0, NULL, 'This is an official channel for EE-1 Year-3 of branch ELECTRICAL ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 4, 0, 3, 0, NULL, NULL),
(30, 'EE_2_YR3', 0, NULL, 'This is an official channel for EE-2 Year-3 of branch ELECTRICAL ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 4, 0, 3, 0, NULL, NULL),
(31, 'EE_1_YR4', 0, NULL, 'This is an official channel for EE-1 Year-4 of branch ELECTRICAL ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 4, 0, 4, 0, NULL, NULL),
(32, 'EE_2_YR4', 0, NULL, 'This is an official channel for EE-2 Year-4 of branch ELECTRICAL ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 4, 0, 4, 0, NULL, NULL),
(33, 'CE_1_YR1', 0, NULL, 'This is an official channel for CE-1 Year-1 of branch CIVIL ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 5, 0, 1, 0, NULL, NULL),
(34, 'CE_2_YR1', 0, NULL, 'This is an official channel for CE-2 Year-1 of branch CIVIL ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 5, 0, 1, 0, NULL, NULL),
(35, 'CE_1_YR2', 0, NULL, 'This is an official channel for CE-1 Year-2 of branch CIVIL ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 5, 0, 2, 0, NULL, NULL),
(36, 'CE_2_YR2', 0, NULL, 'This is an official channel for CE-2 Year-2 of branch CIVIL ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 5, 0, 2, 0, NULL, NULL),
(37, 'CE_1_YR3', 0, NULL, 'This is an official channel for CE-1 Year-3 of branch CIVIL ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 5, 0, 3, 0, NULL, NULL),
(38, 'CE_2_YR3', 0, NULL, 'This is an official channel for CE-2 Year-3 of branch CIVIL ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 5, 0, 3, 0, NULL, NULL),
(39, 'CE_1_YR4', 0, NULL, 'This is an official channel for CE-1 Year-4 of branch CIVIL ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 5, 0, 4, 0, NULL, NULL),
(40, 'CE_2_YR4', 0, NULL, 'This is an official channel for CE-2 Year-4 of branch CIVIL ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 5, 0, 4, 0, NULL, NULL),
(41, 'IC_1_YR1', 0, NULL, 'This is an official channel for IC-1 Year-1 of branch INSTRUMENTATION AND CONTROL ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 6, 0, 1, 0, NULL, NULL),
(42, 'IC_2_YR1', 0, NULL, 'This is an official channel for IC-2 Year-1 of branch INSTRUMENTATION AND CONTROL ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 6, 0, 1, 0, NULL, NULL),
(43, 'IC_1_YR2', 0, NULL, 'This is an official channel for IC-1 Year-2 of branch INSTRUMENTATION AND CONTROL ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 6, 0, 2, 0, NULL, NULL),
(44, 'IC_2_YR2', 0, NULL, 'This is an official channel for IC-2 Year-2 of branch INSTRUMENTATION AND CONTROL ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 6, 0, 2, 0, NULL, NULL),
(45, 'IC_1_YR3', 0, NULL, 'This is an official channel for IC-1 Year-3 of branch INSTRUMENTATION AND CONTROL ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 6, 0, 3, 0, NULL, NULL),
(46, 'IC_2_YR3', 0, NULL, 'This is an official channel for IC-2 Year-3 of branch INSTRUMENTATION AND CONTROL ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 6, 0, 3, 0, NULL, NULL),
(47, 'IC_1_YR4', 0, NULL, 'This is an official channel for IC-1 Year-4 of branch INSTRUMENTATION AND CONTROL ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 6, 0, 4, 0, NULL, NULL),
(48, 'IC_2_YR4', 0, NULL, 'This is an official channel for IC-2 Year-4 of branch INSTRUMENTATION AND CONTROL ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 6, 0, 4, 0, NULL, NULL),
(49, 'ME_1_YR1', 0, NULL, 'This is an official channel for ME-1 Year-1 of branch MECHANICAL ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 8, 0, 1, 0, NULL, NULL),
(50, 'ME_2_YR1', 0, NULL, 'This is an official channel for ME-2 Year-1 of branch MECHANICAL ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 8, 0, 1, 0, NULL, NULL),
(51, 'ME_3_YR1', 0, NULL, 'This is an official channel for ME-3 Year-1 of branch MECHANICAL ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 8, 0, 1, 0, NULL, NULL),
(52, 'ME_1_YR2', 0, NULL, 'This is an official channel for ME-1 Year-2 of branch MECHANICAL ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 8, 0, 2, 0, NULL, NULL),
(53, 'ME_2_YR2', 0, NULL, 'This is an official channel for ME-2 Year-2 of branch MECHANICAL ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 8, 0, 2, 0, NULL, NULL),
(54, 'ME_3_YR2', 0, NULL, 'This is an official channel for ME-3 Year-2 of branch MECHANICAL ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 8, 0, 2, 0, NULL, NULL),
(55, 'ME_1_YR3', 0, NULL, 'This is an official channel for ME-1 Year-3 of branch MECHANICAL ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 8, 0, 3, 0, NULL, NULL),
(56, 'ME_2_YR3', 0, NULL, 'This is an official channel for ME-2 Year-3 of branch MECHANICAL ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 8, 0, 3, 0, NULL, NULL),
(57, 'ME_3_YR3', 0, NULL, 'This is an official channel for ME-3 Year-3 of branch MECHANICAL ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 8, 0, 3, 0, NULL, NULL),
(58, 'ME_1_YR4', 0, NULL, 'This is an official channel for ME-1 Year-4 of branch MECHANICAL ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 8, 0, 4, 0, NULL, NULL),
(59, 'ME_2_YR4', 0, NULL, 'This is an official channel for ME-2 Year-4 of branch MECHANICAL ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 8, 0, 4, 0, NULL, NULL),
(60, 'ME_3_YR4', 0, NULL, 'This is an official channel for ME-3 Year-4 of branch MECHANICAL ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 8, 0, 4, 0, NULL, NULL),
(61, 'EEE_1_YR1', 0, NULL, 'This is an official channel for EEE-1 Year-1 of branch ELECTRICAL AND ELECTRONICS ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 9, 0, 1, 0, NULL, NULL),
(62, 'EEE_2_YR1', 0, NULL, 'This is an official channel for EEE-2 Year-1 of branch ELECTRICAL AND ELECTRONICS ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 9, 0, 1, 0, NULL, NULL),
(63, 'EEE_1_YR2', 0, NULL, 'This is an official channel for EEE-1 Year-2 of branch ELECTRICAL AND ELECTRONICS ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 9, 0, 2, 0, NULL, NULL),
(64, 'EEE_2_YR2', 0, NULL, 'This is an official channel for EEE-2 Year-2 of branch ELECTRICAL AND ELECTRONICS ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 9, 0, 2, 0, NULL, NULL),
(65, 'EEE_1_YR3', 0, NULL, 'This is an official channel for EEE-1 Year-3 of branch ELECTRICAL AND ELECTRONICS ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 9, 0, 3, 0, NULL, NULL),
(66, 'EEE_2_YR3', 0, NULL, 'This is an official channel for EEE-2 Year-3 of branch ELECTRICAL AND ELECTRONICS ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 9, 0, 3, 0, NULL, NULL),
(67, 'EEE_1_YR4', 0, NULL, 'This is an official channel for EEE-1 Year-4 of branch ELECTRICAL AND ELECTRONICS ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 9, 0, 4, 0, NULL, NULL),
(68, 'EEE_2_YR4', 0, NULL, 'This is an official channel for EEE-2 Year-4 of branch ELECTRICAL AND ELECTRONICS ENGINEERING.Enjoy....', 1, '2017-12-02 23:36:20', 1, 1, 9, 0, 4, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `security_ques`
--

CREATE TABLE `security_ques` (
  `ques_id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` varchar(60) NOT NULL,
  `correct` int(11) NOT NULL DEFAULT '0',
  `wrong` int(11) NOT NULL DEFAULT '0',
  `views` int(11) NOT NULL DEFAULT '0',
  `mode_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `skill_tag`
--

CREATE TABLE `skill_tag` (
  `tagrefsk_id` int(11) NOT NULL,
  `mem_id` int(11) NOT NULL,
  `tagl_id` int(11) NOT NULL,
  `typed` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `skill_tag`
--

INSERT INTO `skill_tag` (`tagrefsk_id`, `mem_id`, `tagl_id`, `typed`) VALUES
(1, 2, 7, 0),
(2, 2, 8, 0),
(3, 2, 9, 0),
(4, 2, 10, 0),
(5, 2, 11, 0),
(6, 2, 12, 0),
(10, 1, 16, 0),
(11, 1, 17, 0),
(12, 1, 18, 0),
(13, 1, 19, 0),
(14, 1, 20, 0),
(15, 1, 21, 0),
(18, 2, 24, 0),
(20, 2, 26, 0);

-- --------------------------------------------------------

--
-- Table structure for table `slam`
--

CREATE TABLE `slam` (
  `s_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `chat_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `slam`
--

INSERT INTO `slam` (`s_id`, `topic_id`, `username`, `chat_id`) VALUES
(1, 1, 'prs786', 1),
(2, 1, 'prs786', 6),
(3, 1, 'prs786', 4);

-- --------------------------------------------------------

--
-- Table structure for table `stud_member`
--

CREATE TABLE `stud_member` (
  `student_id` int(11) NOT NULL,
  `mem_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `year` int(1) NOT NULL,
  `section_id` int(11) NOT NULL,
  `ad_no` varchar(12) DEFAULT NULL,
  `pichla_view` datetime DEFAULT CURRENT_TIMESTAMP,
  `roll_no` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stud_member`
--

INSERT INTO `stud_member` (`student_id`, `mem_id`, `course_id`, `branch_id`, `year`, `section_id`, `ad_no`, `pichla_view`, `roll_no`) VALUES
(1, 2, 1, 2, 4, 16, NULL, '2018-02-09 06:09:06', '1409113061');

-- --------------------------------------------------------

--
-- Table structure for table `tag_list`
--

CREATE TABLE `tag_list` (
  `tagl_id` int(11) NOT NULL,
  `tag_name` varchar(100) NOT NULL,
  `tagged` int(11) NOT NULL DEFAULT '0',
  `typed` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tag_list`
--

INSERT INTO `tag_list` (`tagl_id`, `tag_name`, `tagged`, `typed`) VALUES
(1, 'HELP', 0, 0),
(2, 'CPIE', 0, 0),
(3, 'ASK', 0, 0),
(4, 'FEEDBACK', 0, 0),
(5, 'XYZ', 0, 0),
(6, 'TEST', 0, 0),
(7, 'PHOTOGRAPHER', 0, 0),
(8, 'CRICKET', 0, 0),
(9, 'GEEK', 0, 0),
(10, 'COOL', 0, 0),
(11, 'PHP', 0, 0),
(12, 'HACKER', 0, 0),
(13, 'DEVELOPER', 0, 0),
(14, 'JQUERY', 0, 0),
(15, 'IT_2_YR4', 0, 0),
(16, 'ADMIN', 0, 0),
(17, 'REPRESENTATIVE', 0, 0),
(18, 'ASK_ME', 0, 0),
(19, 'BOT', 0, 0),
(20, 'CPIE_JSS', 0, 0),
(21, 'ETHICS', 0, 0),
(22, 'MAGIC', 0, 0),
(23, 'YR-4_BTECH', 0, 0),
(24, 'JUMBO', 0, 0),
(25, 'HEX', 0, 0),
(26, 'JUNGLE', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_key`
--

CREATE TABLE `teacher_key` (
  `key_id` int(11) NOT NULL,
  `key_data` varchar(12) NOT NULL,
  `valid` int(1) NOT NULL DEFAULT '1',
  `count` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher_key`
--

INSERT INTO `teacher_key` (`key_id`, `key_data`, `valid`, `count`) VALUES
(1, 'x4q-C_Bj~As}', 1, 0),
(2, 'wFfAq$8-/*[3', 1, 0),
(3, 'f4;v{cX7Ch8[', 1, 0),
(4, 'YaB"L.p5Ct,J', 1, 0),
(5, 'nYcq8DZ$^)pE', 1, 0),
(6, 'dRJP2Z+qE(zx', 1, 0),
(7, 'Z2!^S3FkA8"m', 1, 0),
(8, 'vE>YT''}Pz3=*', 1, 0),
(9, 'MEpV8A-C@;a{', 1, 0),
(10, 'LKa''8b4)_2{P', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `teach_member`
--

CREATE TABLE `teach_member` (
  `teacher_id` int(11) NOT NULL,
  `mem_id` int(11) NOT NULL,
  `emp_no` varchar(30) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `key_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teach_member`
--

INSERT INTO `teach_member` (`teacher_id`, `mem_id`, `emp_no`, `dept_id`, `key_id`) VALUES
(1, 1, '1234567890', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `testblob`
--

CREATE TABLE `testblob` (
  `image_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `category` varchar(255) NOT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  `caption` text,
  `eye` int(11) NOT NULL DEFAULT '0',
  `event` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `file_name` varchar(255) DEFAULT NULL,
  `owner` varchar(30) NOT NULL,
  `anonymous` int(11) NOT NULL DEFAULT '0',
  `thumb_name` varchar(255) DEFAULT NULL,
  `gif_name` varchar(255) DEFAULT NULL,
  `poll_type` int(1) DEFAULT NULL,
  `comment_count` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `testblob`
--

INSERT INTO `testblob` (`image_id`, `username`, `category`, `image_name`, `caption`, `eye`, `event`, `file_name`, `owner`, `anonymous`, `thumb_name`, `gif_name`, `poll_type`, `comment_count`) VALUES
(1, 'alpha', 'help', 'user_files/alpha/help/thumb/MjAxNy0xMi0wMiAyMDoyNA==g6lgd7tgr24s52hdaga9rhtv14/siricanihelpyouwith.png', 'How can I help you?', 1, '2017-12-03 00:54:50', NULL, 'alpha', 0, 'user_files/alpha/help/MjAxNy0xMi0wMiAyMDoyNA==g6lgd7tgr24s52hdaga9rhtv14/siricanihelpyouwith.png', NULL, NULL, 0),
(2, 'alpha', 'help', 'user_files/alpha/help/thumb/MjAxNy0xMi0wMiAyMDo0OA==bs4lucr9a2ikrl87ovaij2phr2/user12.jpg', NULL, 0, '2017-12-03 01:18:14', NULL, 'alpha', 0, 'user_files/alpha/help/MjAxNy0xMi0wMiAyMDo0OA==bs4lucr9a2ikrl87ovaij2phr2/user12.jpg', NULL, NULL, 0),
(3, 'alpha', 'help', 'user_files/alpha/help/thumb/MjAxNy0xMi0wMiAyMDo0OQ==bs4lucr9a2ikrl87ovaij2phr2/unnamed.jpg', NULL, 0, '2017-12-03 01:19:40', NULL, 'alpha', 0, 'user_files/alpha/help/MjAxNy0xMi0wMiAyMDo0OQ==bs4lucr9a2ikrl87ovaij2phr2/unnamed.jpg', NULL, NULL, 0),
(4, 'prs786', 'help', 'user_files/prs786/help/thumb/MjAxNy0xMi0xMyAxNTozMw==7ukfd6qnmlvc9mon6d6im1e916/classroom1.jpg', NULL, 1, '2017-12-13 20:03:45', NULL, 'prs786', 0, 'user_files/prs786/help/MjAxNy0xMi0xMyAxNTozMw==7ukfd6qnmlvc9mon6d6im1e916/classroom1.jpg', NULL, NULL, 0),
(5, 'prs786', 'xyz', 'user_files/prs786/xyz/thumb/MjAxNy0xMi0xMyAxNjoyNQ==7ukfd6qnmlvc9mon6d6im1e916/screenshot from 20170215 034359.png', NULL, 0, '2017-12-13 20:55:27', NULL, 'prs786', 0, 'user_files/prs786/xyz/MjAxNy0xMi0xMyAxNjoyNQ==7ukfd6qnmlvc9mon6d6im1e916/screenshot from 20170215 034359.png', NULL, NULL, 0),
(6, 'prs786', 'help', NULL, 'The Ring Clock puts your watch on your ring. Read the time using the LEDs that light up the ring when you rotate the outer ring.', 1, '2018-01-06 21:32:12', NULL, 'prs786', 0, NULL, NULL, NULL, 0),
(7, 'prs786', 'help', 'user_files/prs786/help/thumb/MjAxOC0wMS0wNiAyMzoxMg==qu9np7lrfr3vj7bq4b38r9m5r3/img20171226wa0005.jpg', 'Imp notes', 0, '2018-01-07 03:42:48', NULL, 'prs786', 0, 'user_files/prs786/help/MjAxOC0wMS0wNiAyMzoxMg==qu9np7lrfr3vj7bq4b38r9m5r3/img20171226wa0005.jpg', NULL, NULL, 0),
(8, 'prs786', 'help', NULL, 'How to do a good machine learning project\n<br><iframe style="height:400px; width:100%;" class="img-thumbnail" src="https://www.youtube.com/embed/Ga4ySLodsUs" frameborder="0" allowfullscreen></iframe></br>', 0, '2018-01-27 09:40:02', NULL, 'prs786', 0, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE `topic` (
  `topic_id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `wall` varchar(50) DEFAULT NULL,
  `cdesc` varchar(2000) DEFAULT NULL,
  `private` int(11) NOT NULL DEFAULT '0',
  `active` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `topic_mode` int(1) NOT NULL DEFAULT '0',
  `hearts` int(11) NOT NULL DEFAULT '0',
  `whatsapp_g` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `topic`
--

INSERT INTO `topic` (`topic_id`, `category`, `user`, `views`, `type_id`, `wall`, `cdesc`, `private`, `active`, `topic_mode`, `hearts`, `whatsapp_g`) VALUES
(1, 'help', 'alpha', 192, 21, 'images/tt9.png', ' The Ring Clock puts your watch on your ring. Read the time using the LEDs that light up the ring when you rotate the outer ring. ', 0, '2017-12-03 00:49:34', 0, 2, NULL),
(2, 'xyz', 'prs786', 68, 21, 'images/tt8.png', ' xyz ', 1, '2017-12-13 20:55:07', 0, 1, 'https://chat.whatsapp.com/K4IX1GfEGh2LDhS4j9VYkm');

-- --------------------------------------------------------

--
-- Table structure for table `topic_tag`
--

CREATE TABLE `topic_tag` (
  `tagref_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `tagl_id` int(11) NOT NULL,
  `typed` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `topic_tag`
--

INSERT INTO `topic_tag` (`tagref_id`, `topic_id`, `tagl_id`, `typed`) VALUES
(1, 1, 1, 0),
(2, 1, 2, 0),
(3, 1, 3, 0),
(4, 1, 4, 0),
(5, 2, 5, 0),
(6, 2, 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `branch_id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `username` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`branch_id`, `type`, `views`, `username`) VALUES
(1, '#computers', 10, NULL),
(2, '#games', 1, NULL),
(3, '#business', 2, NULL),
(4, '#health', 1, NULL),
(5, '#arts', 0, NULL),
(6, '#science', 1, NULL),
(7, '#sports', 0, NULL),
(8, '#courtyard', 0, NULL),
(9, '#coding', 0, NULL),
(10, '#library', 0, NULL),
(11, '#funny', 1, NULL),
(12, '#style', 0, NULL),
(13, '#photography', 1, NULL),
(14, '#local', 0, NULL),
(15, '#open_source', 0, NULL),
(16, '#robotics', 1, NULL),
(17, '#comics', 0, NULL),
(18, '#coffee_and_tea', 0, NULL),
(19, '#placements', 0, NULL),
(20, '#freshers', 0, NULL),
(21, '#carbon_pie', 115, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_mode`
--

CREATE TABLE `user_mode` (
  `mode_id` int(11) NOT NULL,
  `mode` varchar(50) NOT NULL,
  `mode_count` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_mode`
--

INSERT INTO `user_mode` (`mode_id`, `mode`, `mode_count`) VALUES
(1, 'STUDENT', 0),
(2, 'TEACHER', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_online`
--

CREATE TABLE `user_online` (
  `login_id` int(11) NOT NULL,
  `session` varchar(100) NOT NULL,
  `time` int(11) NOT NULL,
  `mem_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_online`
--

INSERT INTO `user_online` (`login_id`, `session`, `time`, `mem_id`, `topic_id`) VALUES
(3, 'e9fvhosq8055jlbjr9l1a31bh2', 1505390599, 1, 1),
(7, 'bp1b04iqrntaln2nfe6imq4hr5', 1505418914, 1, 2),
(6, 'kv9k5qb0ac9675vem8f5ks4vn5', 1505400385, 1, 1),
(9, 'vdibp2f5slrvhh83pf94b2gs90', 1505432004, 1, 0),
(10, 'l0pon5shp4p33d39j2ohd2lan1', 1505483787, 1, 0),
(44, 'ggl9s41rpn3enl2bvdf7k5rhd2', 1507346348, 1, 0),
(32, '6tbqat27ut24f96omr6ls0rma4', 1507036396, 1, 3),
(22, 'tntgkq5b11nsuiglth9g5n2ge7', 1505844577, 1, 0),
(45, 'sbmbjhif2b2qmqvlajrfl6ja77', 1507438278, 1, 1),
(35, '1h11ctijs4m9rcplqnfgl964a1', 1507043317, 3, 1),
(62, 'msu256v9i9ip7po6rbjgijc0f7', 1507984122, 1, 1),
(68, 'ksc0qeel2f8t8bf6ka8d0h7lu3', 1508051176, 2, 1),
(83, 't2pucqh2efjcfseiqrnnf30kh7', 1508217074, 1, 3),
(82, 'e07vmi74vrg6j3eoc77fahfkc0', 1508212138, 1, 3),
(84, 'b8bdqd6nu2n8pnp863cggls0f3', 1508219296, 1, 0),
(87, 'vbjbtvnnp9ekf4je8l0lsoant1', 1508222908, 2, 3),
(90, '4g7iblidr4mhfnqf62dmvskpc7', 1508252715, 1, 3),
(95, 'nkdkhf3durj2ueml99apg1qh94', 1508260091, 1, 0),
(96, '59moe2q64s4jpd3cocsb4vh1g7', 1508260611, 2, 1),
(100, '8anokndootpn5cgourd1b6c6c5', 1508622971, 1, 0),
(99, 'ir8r6m1tmp9gedc0aoum0h49o1', 1508602005, 2, 1),
(106, 'c921m81jfl2hr4jvf7dsavhbf0', 1510502474, 9, 0),
(102, 'mlk7qk87irkvjg0mob7cftaqn1', 1508623293, 2, 1),
(114, 'kurn11m3uv7c64sgurjmouonv6', 1510881778, 2, 1),
(118, 'hgtm5vfdemrf9adkt2gjfp0ic2', 1510889111, 1, 3),
(119, '3k6739fd1nmc1ao3j5fsfuf2q2', 1510886277, 2, 1),
(120, 'dgivjn881kpppfssf7v3upn206', 1510887065, 2, 3),
(123, '10trkq1afgu230nbu9mi0n7qh7', 1510889017, 2, 3),
(127, 'g8pv79u3clgkfopvfu159lej32', 1511021335, 1, 3),
(126, 'acilm4bmkiu7fvl9tkkh9ioks1', 1510963671, 2, 3),
(135, 'qr0o20j48fitbhp0aggolpg8e6', 1511061638, 5, 0),
(143, 'pem5gi6nt5kdga9v0e69u3svo4', 1511538932, 1, 1),
(137, 'miiqga1m23iioe1ss3qru6rgs5', 1511148037, 5, 1),
(139, '8k7f56bfbg03bsrgmpt485p9f6', 1511222408, 5, 1),
(140, '4aiuqgcdvbvbj7amim8u88p9a3', 1511230424, 5, 0),
(141, 'ffoefrl9ralsgdr0jfiaspugn5', 1511231030, 5, 0),
(144, 'jkpuojuejppqltrk1a69g2isu6', 1511532576, 5, 0),
(148, '97tb1ahhtjqdk52q8lf1t7p696', 1512214526, 5, 3),
(160, 'vsqnnbi8ommvs3f1mldm4m1gp3', 1514929370, 2, 1),
(156, '35ddr3h42r71ttoiceg8augut3', 1513181549, 2, 2),
(161, 'aqoer1fq035vtopbnam8fcdpp2', 1514929189, 2, 0),
(162, '09pgsdg7vq8nm25gms7pa88fc0', 1515184271, 2, 2),
(163, '3520fefh3pa47j90tu2jsg5021', 1515161499, 2, 0),
(164, 'klvdb0palhumh5rmp6pdv1cmm7', 1515163021, 2, 0),
(170, '6llrurn8imvi6f0a1etpcqfq81', 1515342466, 2, 0),
(168, 'qu9np7lrfr3vj7bq4b38r9m5r3', 1515276768, 2, 1),
(171, '0jljlotcbnn3brhgkt9n2lh516', 1515351608, 2, 0),
(175, 'csr24geu9ni6ir73tpuae6utp2', 1515415442, 2, 2),
(173, 'ekbqpgp547f9m04ebttt0erdo1', 1515364193, 2, 1),
(176, '2surbgoj56oat05jks86s6vuh7', 1515416975, 2, 2),
(177, 'bkvrv1bq1hn6n2bap2dtd48h43', 1515426852, 2, 0),
(178, '6vhrlp7m8e3ke8ieqrdg7746m3', 1515428455, 2, 0),
(179, 'i91g9he96ohc01gv07ui7pudg7', 1515455446, 2, 0),
(180, '1eer4fa5bof5j6q5lrnueqm6o0', 1515457355, 2, 0),
(181, 'e222104egf8fl19empcjgv6lu3', 1515457631, 2, 0),
(182, 'rdngmskpemdf4sk4gmps0tnpu7', 1515463019, 2, 0),
(183, '7ni5n2e9u31amdd9cmje8t1rp3', 1515460675, 1, 1),
(184, '16lefo4l83f20jmoncfube91q7', 1515501235, 2, 0),
(185, '3udeja4kgnn6ankh6rt29bjcl7', 1515513674, 2, 0),
(188, '3m4o5ghtmb5fu5jtla3g6hfh04', 1515872330, 2, 1),
(187, 'ada6ieraahb8uivntsl3psstf6', 1515775800, 2, 0),
(189, 'qpo5eg9mqqa1rtrogs376c91m5', 1516033886, 2, 0),
(190, 'uiq7qpt6qfbbf3hq01tfi56ph7', 1516059239, 2, 0),
(191, 'so0sc76s0cvibullmmoiun69r3', 1516065055, 2, 1),
(192, 'kf7m7s29ob6qbltp6suej52qb5', 1516065858, 2, 1),
(193, '7ctlu4ru0kb5o74r023mfcta40', 1516103494, 2, 2),
(194, 'j8ekoieekf1d5ve6h5fnn7v196', 1516106540, 2, 0),
(202, 'a0oaipirf6t6p33cgkqnreo065', 1516206512, 2, 1),
(203, 'j65beja3f3hfkg9hc5vlbqng30', 1516206609, 2, 0),
(204, 'spujha34sqg125u4nm77qqek03', 1516206724, 2, 0),
(205, 'be1568ie3jv3qbavp9mmg76h07', 1516444014, 2, 0),
(206, '9ja1nn4il16d1kqddfkvu89k51', 1516444168, 2, 0),
(207, '1ursnt1kmv7nqgh3kc5q5jd5k1', 1516444322, 2, 0),
(208, '51ol6vdvutt75igt7kiskp2ju7', 1516444778, 2, 0),
(209, 'bgbb02qu6j5cft05erp7onrua0', 1516450346, 2, 0),
(212, 'ptv1f6mi7so4ud9rj2b9kiffa7', 1516453023, 2, 0),
(211, '9rlfhmq78hsppequta94tem5a4', 1516452724, 1, 0),
(213, '7477ter92s9761bd2n9kq3ndp3', 1516459052, 2, 0),
(214, 'uf3f3lu3n2e1u3d14lcjtv3tb1', 1516459256, 1, 0),
(215, 'kocg6niv8hmtluqrv16mbs6v86', 1516458931, 2, 0),
(216, 'ie4qdcpnislve3m6pbq1ptg4n2', 1516459685, 2, 0),
(217, 'hmiduhvvv8g993pdgtdt85kab0', 1516460411, 2, 0),
(218, 'ptqn7pbfosbkfkvsudsq28ljj2', 1516461281, 1, 0),
(219, 'jlsgrd7dt3knlhvfdlqgeaerp1', 1516463222, 2, 0),
(222, 'hb8apuedu09fb9oq8v9cnn2l35', 1516463771, 2, 0),
(221, 'jjker9ko27768k5h5sca81din5', 1516463485, 2, 0),
(223, 'ktkc2hsd4luqptepkeokso5mf4', 1516500328, 2, 0),
(224, 'sqogarjv2upvd8721cm7jruoe3', 1516497155, 1, 0),
(225, 'qiigomirm16dk73osrjr5ov1v7', 1516499006, 2, 0),
(226, 'pqcammep8nmbej41otlvgme7n6', 1516504912, 2, 0),
(227, 'rcg0k5998ka8cip0h9jc25bj62', 1516500609, 2, 0),
(228, '2610kr0qvgva5kmj4bipheev11', 1516500638, 2, 0),
(229, 't15f76njc07n5h64sclr010l07', 1516504983, 2, 0),
(230, 'oftf4t0fdnt504kvrmprq9oli0', 1516505721, 2, 0),
(231, '48013tr08ahnk1tegeqfa4pg27', 1516505253, 2, 0),
(232, '7li2dchlm5mth75nifgrtu48l0', 1516505996, 2, 0),
(234, 'm22pojbv0uc9ifdrg7870bfp52', 1516683353, 2, 0),
(235, 'amqiqjc818udhsa3qnulm64rr6', 1516673270, 2, 0),
(236, 'nhtq8aevb6qnb2h97gaia4keu3', 1516675035, 2, 0),
(238, 'ui82bod73oubjne7pu12sg4hd7', 1516947944, 2, 2),
(240, 'p0o7fnmivq3m5qvo3c76astl07', 1517026250, 2, 1),
(247, '4tc8055k3ub9flrlmdk1v14cq5', 1517283691, 2, 1),
(257, '0nir65vfsdq46n026e5aocq5a3', 1517586775, 2, 1),
(261, 'ovgucqtpf1a63gp8bm84gglf16', 1517838405, 2, 0),
(259, 'tvu0kht7lerk4caesu2cokgug5', 1517762080, 1, 0),
(262, '1frd81uu08end6fff9hv1fh3o7', 1517835186, 1, 0),
(263, 'jil95mgfq2ieaj4dcvg5v6fcj3', 1517835297, 2, 0),
(264, '0h75le8t8i17aev3n88u3dq3m7', 1517838025, 2, 0),
(265, 'm0ge7ifv8aasq3cac2ubkf97k6', 1517838149, 2, 0),
(268, 'duodnl7gi97c51lpicacu3l2q0', 1517844859, 2, 0),
(267, 'qu98rsonjbum23skisjp99r3s0', 1517842167, 2, 0),
(269, '56dgd8nm1sdbngagfjd2ds0b30', 1517846307, 2, 0),
(270, 'e961h0kk3bfs9l8b1ihcg7vm80', 1517850181, 2, 0),
(271, '45hiaatnogiejihh8mrna34qc0', 1517849861, 2, 0),
(273, 'frlrflepg6qphuudpfec5aplr5', 1518010486, 2, 0),
(274, '4602ovdkkf5ujrlo0gde04dd50', 1518003519, 2, 0),
(276, 'gmfhld5ereagv99csg7ha5f7k7', 1518082670, 2, 0),
(278, '6qugp9gu25jpqciunmlo476n00', 1518105347, 2, 1),
(282, 'ntauje6rl0538612krp5msa3b5', 1518192555, 2, 0),
(281, 'e81jsavv44kil4vb0q5nc9js10', 1518193114, 2, 0),
(286, 'rsim4n855fojdqnfgsmvmlr2e1', 1518442872, 2, 0),
(288, 'avssg4jr0rgq4bcjam2fgsmtb2', 1518446611, 2, 0),
(289, 'irma5pomgq5b6dsin529sn0jp2', 1518451560, 2, 0),
(291, 'cbknq2ufc9hbobeqa89bggreq6', 1518536012, 2, 0),
(292, 'sal98qgk8fd10lit9dc3fft2o6', 1518560373, 2, 0),
(293, 'ui48vfdunmpsig6p7it2o4gcf3', 1518560481, 2, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access`
--
ALTER TABLE `access`
  ADD PRIMARY KEY (`access_id`),
  ADD UNIQUE KEY `access_id` (`access_id`);

--
-- Indexes for table `access_mem_p`
--
ALTER TABLE `access_mem_p`
  ADD PRIMARY KEY (`a_mem_p_Id`);

--
-- Indexes for table `access_stud`
--
ALTER TABLE `access_stud`
  ADD PRIMARY KEY (`a_stud_id`),
  ADD UNIQUE KEY `a_stud_id` (`a_stud_id`);

--
-- Indexes for table `access_teach`
--
ALTER TABLE `access_teach`
  ADD PRIMARY KEY (`teacher_id`);

--
-- Indexes for table `barcode_sign`
--
ALTER TABLE `barcode_sign`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `full_cid` (`full_cid`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branch_id`);

--
-- Indexes for table `broadcast_comments`
--
ALTER TABLE `broadcast_comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `image_id` (`comment_id`),
  ADD KEY `event` (`event`);

--
-- Indexes for table `broadcast_comment_slam`
--
ALTER TABLE `broadcast_comment_slam`
  ADD PRIMARY KEY (`s_id`),
  ADD UNIQUE KEY `s_id_2` (`s_id`),
  ADD KEY `s_id` (`s_id`);

--
-- Indexes for table `broadcast_poll_count`
--
ALTER TABLE `broadcast_poll_count`
  ADD PRIMARY KEY (`count_id`),
  ADD UNIQUE KEY `count_id` (`count_id`);

--
-- Indexes for table `broadcast_poll_option`
--
ALTER TABLE `broadcast_poll_option`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `broadcast_post`
--
ALTER TABLE `broadcast_post`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `image_id` (`image_id`),
  ADD KEY `event` (`event`);

--
-- Indexes for table `broadcast_slam`
--
ALTER TABLE `broadcast_slam`
  ADD PRIMARY KEY (`s_id`),
  ADD KEY `s_id` (`s_id`);

--
-- Indexes for table `broadcast_tags`
--
ALTER TABLE `broadcast_tags`
  ADD PRIMARY KEY (`tag_id`),
  ADD UNIQUE KEY `tag_name` (`tag_name`);

--
-- Indexes for table `b_post_index`
--
ALTER TABLE `b_post_index`
  ADD PRIMARY KEY (`bpi_id`),
  ADD UNIQUE KEY `image_id` (`image_id`,`mem_id`);

--
-- Indexes for table `channel_comments`
--
ALTER TABLE `channel_comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `image_id` (`comment_id`),
  ADD KEY `event` (`event`);

--
-- Indexes for table `channel_comment_slam`
--
ALTER TABLE `channel_comment_slam`
  ADD PRIMARY KEY (`s_id`),
  ADD UNIQUE KEY `s_id_2` (`s_id`),
  ADD KEY `s_id` (`s_id`);

--
-- Indexes for table `channel_favs`
--
ALTER TABLE `channel_favs`
  ADD PRIMARY KEY (`fav_id`),
  ADD KEY `fav_id` (`fav_id`);

--
-- Indexes for table `channel_poll_count`
--
ALTER TABLE `channel_poll_count`
  ADD PRIMARY KEY (`count_id`),
  ADD UNIQUE KEY `count_id` (`count_id`);

--
-- Indexes for table `channel_poll_option`
--
ALTER TABLE `channel_poll_option`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `channel_post`
--
ALTER TABLE `channel_post`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `image_id` (`image_id`),
  ADD KEY `event` (`event`);

--
-- Indexes for table `channel_slam`
--
ALTER TABLE `channel_slam`
  ADD PRIMARY KEY (`s_id`),
  ADD KEY `s_id` (`s_id`);

--
-- Indexes for table `channel_user_online`
--
ALTER TABLE `channel_user_online`
  ADD PRIMARY KEY (`login_id`),
  ADD KEY `session` (`session`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `image_id` (`comment_id`),
  ADD KEY `event` (`event`);

--
-- Indexes for table `comment_slam`
--
ALTER TABLE `comment_slam`
  ADD PRIMARY KEY (`s_id`),
  ADD UNIQUE KEY `s_id_2` (`s_id`),
  ADD KEY `s_id` (`s_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`),
  ADD UNIQUE KEY `course_short` (`course_short`),
  ADD UNIQUE KEY `course_full` (`course_full`);

--
-- Indexes for table `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`fav_id`),
  ADD KEY `fav_id` (`fav_id`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`follow_id`),
  ADD KEY `follow_id` (`follow_id`);

--
-- Indexes for table `ip`
--
ALTER TABLE `ip`
  ADD PRIMARY KEY (`ip_id`),
  ADD KEY `ip_id` (`ip_id`),
  ADD KEY `session` (`session`);

--
-- Indexes for table `jss_stud_list_17_18`
--
ALTER TABLE `jss_stud_list_17_18`
  ADD PRIMARY KEY (`jss_stud_id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`mem_id`),
  ADD UNIQUE KEY `username_2` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `mobile` (`mobile`),
  ADD KEY `mem_id` (`mem_id`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `member_loc`
--
ALTER TABLE `member_loc`
  ADD PRIMARY KEY (`loc_id`),
  ADD UNIQUE KEY `place_id` (`place_id`);

--
-- Indexes for table `notestatus`
--
ALTER TABLE `notestatus`
  ADD PRIMARY KEY (`notestatus_id`),
  ADD KEY `notestatus_id` (`notestatus_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `notification_id` (`notification_id`),
  ADD KEY `wakt` (`wakt`);

--
-- Indexes for table `one_notify`
--
ALTER TABLE `one_notify`
  ADD PRIMARY KEY (`one_id`),
  ADD UNIQUE KEY `player_id` (`player_id`);

--
-- Indexes for table `passreset`
--
ALTER TABLE `passreset`
  ADD PRIMARY KEY (`passre_id`);

--
-- Indexes for table `poll_count`
--
ALTER TABLE `poll_count`
  ADD PRIMARY KEY (`count_id`),
  ADD UNIQUE KEY `count_id` (`count_id`);

--
-- Indexes for table `poll_option`
--
ALTER TABLE `poll_option`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `priority`
--
ALTER TABLE `priority`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `priority_log`
--
ALTER TABLE `priority_log`
  ADD PRIMARY KEY (`pri_id`),
  ADD UNIQUE KEY `mem_id` (`mem_id`);

--
-- Indexes for table `private_member`
--
ALTER TABLE `private_member`
  ADD PRIMARY KEY (`pvt_id`),
  ADD UNIQUE KEY `username` (`username`,`category`),
  ADD KEY `pvt_id` (`pvt_id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`section_id`),
  ADD UNIQUE KEY `category_2` (`category`),
  ADD KEY `topic_id` (`section_id`),
  ADD KEY `active` (`active`),
  ADD KEY `category` (`category`),
  ADD KEY `active_2` (`active`);

--
-- Indexes for table `security_ques`
--
ALTER TABLE `security_ques`
  ADD PRIMARY KEY (`ques_id`);

--
-- Indexes for table `skill_tag`
--
ALTER TABLE `skill_tag`
  ADD PRIMARY KEY (`tagrefsk_id`);

--
-- Indexes for table `slam`
--
ALTER TABLE `slam`
  ADD PRIMARY KEY (`s_id`),
  ADD KEY `s_id` (`s_id`);

--
-- Indexes for table `stud_member`
--
ALTER TABLE `stud_member`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `mem_id` (`mem_id`),
  ADD UNIQUE KEY `ad_no` (`ad_no`);

--
-- Indexes for table `tag_list`
--
ALTER TABLE `tag_list`
  ADD PRIMARY KEY (`tagl_id`),
  ADD UNIQUE KEY `tag_name` (`tag_name`);

--
-- Indexes for table `teacher_key`
--
ALTER TABLE `teacher_key`
  ADD PRIMARY KEY (`key_id`);

--
-- Indexes for table `teach_member`
--
ALTER TABLE `teach_member`
  ADD PRIMARY KEY (`teacher_id`),
  ADD UNIQUE KEY `emp_no` (`emp_no`),
  ADD UNIQUE KEY `mem_id` (`mem_id`);

--
-- Indexes for table `testblob`
--
ALTER TABLE `testblob`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `image_id` (`image_id`),
  ADD KEY `event` (`event`);

--
-- Indexes for table `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`topic_id`),
  ADD UNIQUE KEY `category_2` (`category`),
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `active` (`active`),
  ADD KEY `category` (`category`);

--
-- Indexes for table `topic_tag`
--
ALTER TABLE `topic_tag`
  ADD PRIMARY KEY (`tagref_id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`branch_id`),
  ADD UNIQUE KEY `type_2` (`type`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `type` (`type`),
  ADD KEY `type_3` (`type`);

--
-- Indexes for table `user_mode`
--
ALTER TABLE `user_mode`
  ADD PRIMARY KEY (`mode_id`);

--
-- Indexes for table `user_online`
--
ALTER TABLE `user_online`
  ADD PRIMARY KEY (`login_id`),
  ADD KEY `session` (`session`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access`
--
ALTER TABLE `access`
  MODIFY `access_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `access_mem_p`
--
ALTER TABLE `access_mem_p`
  MODIFY `a_mem_p_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `access_stud`
--
ALTER TABLE `access_stud`
  MODIFY `a_stud_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `access_teach`
--
ALTER TABLE `access_teach`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `barcode_sign`
--
ALTER TABLE `barcode_sign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `broadcast_comments`
--
ALTER TABLE `broadcast_comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `broadcast_comment_slam`
--
ALTER TABLE `broadcast_comment_slam`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `broadcast_poll_count`
--
ALTER TABLE `broadcast_poll_count`
  MODIFY `count_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `broadcast_poll_option`
--
ALTER TABLE `broadcast_poll_option`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `broadcast_post`
--
ALTER TABLE `broadcast_post`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `broadcast_slam`
--
ALTER TABLE `broadcast_slam`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `broadcast_tags`
--
ALTER TABLE `broadcast_tags`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;
--
-- AUTO_INCREMENT for table `b_post_index`
--
ALTER TABLE `b_post_index`
  MODIFY `bpi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `channel_comments`
--
ALTER TABLE `channel_comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `channel_comment_slam`
--
ALTER TABLE `channel_comment_slam`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `channel_favs`
--
ALTER TABLE `channel_favs`
  MODIFY `fav_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `channel_poll_count`
--
ALTER TABLE `channel_poll_count`
  MODIFY `count_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `channel_poll_option`
--
ALTER TABLE `channel_poll_option`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `channel_post`
--
ALTER TABLE `channel_post`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `channel_slam`
--
ALTER TABLE `channel_slam`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `channel_user_online`
--
ALTER TABLE `channel_user_online`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `comment_slam`
--
ALTER TABLE `comment_slam`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `favourites`
--
ALTER TABLE `favourites`
  MODIFY `fav_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `follow_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ip`
--
ALTER TABLE `ip`
  MODIFY `ip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;
--
-- AUTO_INCREMENT for table `jss_stud_list_17_18`
--
ALTER TABLE `jss_stud_list_17_18`
  MODIFY `jss_stud_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4009;
--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `mem_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `member_loc`
--
ALTER TABLE `member_loc`
  MODIFY `loc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `notestatus`
--
ALTER TABLE `notestatus`
  MODIFY `notestatus_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `one_notify`
--
ALTER TABLE `one_notify`
  MODIFY `one_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `passreset`
--
ALTER TABLE `passreset`
  MODIFY `passre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `poll_count`
--
ALTER TABLE `poll_count`
  MODIFY `count_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `poll_option`
--
ALTER TABLE `poll_option`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `priority`
--
ALTER TABLE `priority`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `priority_log`
--
ALTER TABLE `priority_log`
  MODIFY `pri_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `private_member`
--
ALTER TABLE `private_member`
  MODIFY `pvt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT for table `security_ques`
--
ALTER TABLE `security_ques`
  MODIFY `ques_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `skill_tag`
--
ALTER TABLE `skill_tag`
  MODIFY `tagrefsk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `slam`
--
ALTER TABLE `slam`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `stud_member`
--
ALTER TABLE `stud_member`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tag_list`
--
ALTER TABLE `tag_list`
  MODIFY `tagl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `teacher_key`
--
ALTER TABLE `teacher_key`
  MODIFY `key_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `teach_member`
--
ALTER TABLE `teach_member`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `testblob`
--
ALTER TABLE `testblob`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `topic`
--
ALTER TABLE `topic`
  MODIFY `topic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `topic_tag`
--
ALTER TABLE `topic_tag`
  MODIFY `tagref_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `user_mode`
--
ALTER TABLE `user_mode`
  MODIFY `mode_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_online`
--
ALTER TABLE `user_online`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

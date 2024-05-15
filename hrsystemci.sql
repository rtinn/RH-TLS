-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 15 mai 2024 à 10:23
-- Version du serveur : 5.7.36
-- Version de PHP : 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `hrsystemci`
--

-- --------------------------------------------------------

--
-- Structure de la table `addition`
--

DROP TABLE IF EXISTS `addition`;
CREATE TABLE IF NOT EXISTS `addition` (
  `addi_id` int(11) NOT NULL AUTO_INCREMENT,
  `salary_id` int(11) NOT NULL,
  `basic` varchar(128) DEFAULT NULL,
  `medical` varchar(64) DEFAULT NULL,
  `house_rent` varchar(64) DEFAULT NULL,
  `conveyance` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`addi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `addition`
--

INSERT INTO `addition` (`addi_id`, `salary_id`, `basic`, `medical`, `house_rent`, `conveyance`) VALUES
(1, 1, '2750.00', '275.00', '2200.00', '275.00'),
(2, 2, '6750.00', '675.00', '5400.00', '675.00'),
(3, 3, '9050.00', '905.00', '7240.00', '905.00'),
(4, 4, '2782.50', '278.25', '2226.00', '278.25'),
(5, 5, '3450.00', '345.00', '2760.00', '345.00'),
(6, 6, '3975.00', '397.50', '3180.00', '397.50'),
(7, 7, '4300.00', '430.00', '3440.00', '430.00'),
(8, 8, '5500.00', '550.00', '4400.00', '550.00'),
(9, 9, '3500.00', '350.00', '2800.00', '350.00'),
(10, 10, '2800.00', '280.00', '2240.00', '280.00');

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(64) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `country` varchar(128) DEFAULT NULL,
  `address` varchar(512) DEFAULT NULL,
  `type` enum('Present','Permanent') DEFAULT 'Present',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `address`
--

INSERT INTO `address` (`id`, `emp_id`, `city`, `country`, `address`, `type`) VALUES
(5, 'T00002', 'ssdsdsdsdsdssdsds', 'sdsdsdssds', 'aezezezezaezezeze', 'Permanent'),
(6, 'T01016', 'andaiririri', 'andaiririri', 'andaiririri', 'Permanent');

-- --------------------------------------------------------

--
-- Structure de la table `addressbook`
--

DROP TABLE IF EXISTS `addressbook`;
CREATE TABLE IF NOT EXISTS `addressbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sName` varchar(255) DEFAULT NULL,
  `Date` varchar(255) DEFAULT NULL,
  `Time` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `addressbook`
--

INSERT INTO `addressbook` (`id`, `sName`, `Date`, `Time`) VALUES
(1, 'T00075', '04.07.2022', '07:16:42'),
(2, 'T00075', '04.07.2022', '16:29:49'),
(3, 'T00147', '04.07.2022', '09:31:07'),
(4, 'T00147', '04.07.2022', '16:57:00'),
(5, 'T00172', '04.07.2022', '07:01:40'),
(6, 'T00172', '04.07.2022', '17:36:24');

-- --------------------------------------------------------

--
-- Structure de la table `assets`
--

DROP TABLE IF EXISTS `assets`;
CREATE TABLE IF NOT EXISTS `assets` (
  `ass_id` int(11) NOT NULL AUTO_INCREMENT,
  `catid` varchar(14) NOT NULL,
  `ass_name` varchar(256) DEFAULT NULL,
  `ass_brand` varchar(128) DEFAULT NULL,
  `ass_model` varchar(256) DEFAULT NULL,
  `ass_code` varchar(256) DEFAULT NULL,
  `configuration` varchar(512) DEFAULT NULL,
  `purchasing_date` varchar(128) DEFAULT NULL,
  `ass_price` varchar(128) DEFAULT NULL,
  `ass_qty` varchar(64) DEFAULT NULL,
  `in_stock` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ass_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `assets`
--

INSERT INTO `assets` (`ass_id`, `catid`, `ass_name`, `ass_brand`, `ass_model`, `ass_code`, `configuration`, `purchasing_date`, `ass_price`, `ass_qty`, `in_stock`) VALUES
(1, '3', 'Laptop T10', 'Dell', 'Alienware', 'AW569', 'demo config demo config demo config', '12/23/2021', '1949', '3', '3');

-- --------------------------------------------------------

--
-- Structure de la table `assets_category`
--

DROP TABLE IF EXISTS `assets_category`;
CREATE TABLE IF NOT EXISTS `assets_category` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_status` enum('ASSETS','LOGISTIC') NOT NULL DEFAULT 'ASSETS',
  `cat_name` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `assets_category`
--

INSERT INTO `assets_category` (`cat_id`, `cat_status`, `cat_name`) VALUES
(1, 'ASSETS', 'TAB'),
(2, 'ASSETS', 'Computer'),
(3, 'ASSETS', 'Laptop'),
(4, 'LOGISTIC', 'tab'),
(5, 'ASSETS', 'tinnn'),
(6, 'LOGISTIC', 'ddddd'),
(7, 'ASSETS', 'TAB'),
(8, 'ASSETS', 'Computer'),
(9, 'ASSETS', 'Laptop'),
(10, 'LOGISTIC', 'tab'),
(11, 'ASSETS', 'tinnn'),
(13, 'LOGISTIC', 'ddddd'),
(14, 'ASSETS', 'TAB'),
(15, 'ASSETS', 'Computer'),
(17, 'ASSETS', 'Laptop'),
(18, 'LOGISTIC', 'tab'),
(19, 'ASSETS', 'tinnn'),
(20, 'LOGISTIC', 'ddddd'),
(21, 'ASSETS', 'TAB'),
(22, 'ASSETS', 'Computer'),
(23, 'ASSETS', 'Laptop'),
(24, 'LOGISTIC', 'tab'),
(25, 'ASSETS', 'tinnn'),
(26, 'LOGISTIC', 'ddddd');

-- --------------------------------------------------------

--
-- Structure de la table `assign_leave`
--

DROP TABLE IF EXISTS `assign_leave`;
CREATE TABLE IF NOT EXISTS `assign_leave` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(11) NOT NULL,
  `emp_id` varchar(64) DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  `day` varchar(256) DEFAULT NULL,
  `hour` varchar(255) NOT NULL,
  `total_day` varchar(64) DEFAULT NULL,
  `dateyear` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `assign_leave`
--

INSERT INTO `assign_leave` (`id`, `app_id`, `emp_id`, `type_id`, `day`, `hour`, `total_day`, `dateyear`) VALUES
(7, '', 'T00002', 7, NULL, '42', NULL, '2023'),
(8, '', 'T01089', 2, NULL, '24', NULL, '2023');

-- --------------------------------------------------------

--
-- Structure de la table `assign_task`
--

DROP TABLE IF EXISTS `assign_task`;
CREATE TABLE IF NOT EXISTS `assign_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `assign_user` varchar(64) DEFAULT NULL,
  `user_type` enum('Team Head','Collaborators') NOT NULL DEFAULT 'Collaborators',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `assign_task`
--

INSERT INTO `assign_task` (`id`, `task_id`, `project_id`, `assign_user`, `user_type`) VALUES
(1, 1, 1, 'Moo1402', 'Team Head'),
(2, 1, 1, 'Doe1753', 'Collaborators');

-- --------------------------------------------------------

--
-- Structure de la table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
CREATE TABLE IF NOT EXISTS `attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(64) DEFAULT NULL,
  `atten_date` varchar(64) DEFAULT NULL,
  `signin_time` time DEFAULT NULL,
  `signout_time` time DEFAULT NULL,
  `working_hour` varchar(64) DEFAULT NULL,
  `place` varchar(255) NOT NULL,
  `absence` varchar(128) DEFAULT NULL,
  `overtime` varchar(128) DEFAULT NULL,
  `earnleave` varchar(128) DEFAULT NULL,
  `status` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1020 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `attendance`
--

INSERT INTO `attendance` (`id`, `emp_id`, `atten_date`, `signin_time`, `signout_time`, `working_hour`, `place`, `absence`, `overtime`, `earnleave`, `status`) VALUES
(1012, '6969', '2021-06-04', '10:00:00', '03:04:00', '06 h 56 m', 'field', NULL, NULL, NULL, 'E'),
(1013, '6969', '2021-06-06', '09:00:00', '02:00:00', '07 h 0 m', 'office', NULL, NULL, NULL, 'A'),
(1014, '123456', '2021-12-01', '09:00:00', '04:30:00', '04 h 30 m', 'office', NULL, NULL, NULL, 'A'),
(1015, '123444', '2021-12-29', '09:00:00', '03:00:00', '06 h 0 m', 'office', NULL, NULL, NULL, 'A'),
(1016, '3008', '2021-12-28', '10:00:00', '03:23:00', '06 h 37 m', 'office', NULL, NULL, NULL, 'A'),
(1017, '6600', '2022-01-02', '10:00:00', '04:00:00', '06 h 0 m', 'office', NULL, NULL, NULL, 'E'),
(1018, '8829', '2022-01-02', '10:00:00', '04:05:00', '05 h 55 m', 'office', NULL, NULL, NULL, 'E'),
(1019, '6600', '2021-11-30', '10:00:00', '05:00:00', '05 h 0 m', 'office', NULL, NULL, NULL, 'A');

-- --------------------------------------------------------

--
-- Structure de la table `bank_info`
--

DROP TABLE IF EXISTS `bank_info`;
CREATE TABLE IF NOT EXISTS `bank_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `em_id` varchar(64) DEFAULT NULL,
  `holder_name` varchar(256) DEFAULT NULL,
  `bank_name` varchar(256) DEFAULT NULL,
  `branch_name` varchar(256) DEFAULT NULL,
  `account_number` varchar(256) DEFAULT NULL,
  `account_type` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `bank_info`
--

INSERT INTO `bank_info` (`id`, `em_id`, `holder_name`, `bank_name`, `branch_name`, `account_number`, `account_type`) VALUES
(1, 'Doe1754', 'John W Greenwood', 'XYZ Bank', 'Bleck St', 'CA0025869690', 'Saving'),
(2, 'Doe1753', 'Will Williams', 'ABYZ Bank', 'Axis Branch', 'CA6960000142', 'Current'),
(3, 'Soy1332', 'Thomas Anderson', 'United Bank', 'ABC Branch', 'CA100005696920', 'Salary Account'),
(4, 'Rob1472', 'Stephany Robs Jr', 'United Bank', 'ABC Branch', 'CA140000000255', 'Savings'),
(5, 'Tho1044', 'Chris Thompson', 'YTR Bank', 'XY Branch', 'CA7025000026', 'Savings'),
(6, 'Moo1402', 'Liam Moore', 'IOP Bank', 'AER Branch', 'CA690000250000', 'Salary Account'),
(7, 'Smi1266', 'Colin Smith', 'IO Bank', 'CVB Branch', 'CA001450006980', 'Salary Account'),
(8, 'Moo1634', 'Christine Moore', 'RTY Bank', 'ERT Branch', 'CA850000245800', 'Savings'),
(9, 'Joh1474', 'Michael K Johnson', 'Aexr Bank', 'ERT Branch', 'CA800000256147', 'Salary Account'),
(10, 'Den1745', 'Emily V Denn', 'Demo Bank', 'XZY Branch', 'CA777000001055', 'Savings');

-- --------------------------------------------------------

--
-- Structure de la table `conge_mois`
--

DROP TABLE IF EXISTS `conge_mois`;
CREATE TABLE IF NOT EXISTS `conge_mois` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `em_id` varchar(50) NOT NULL,
  `nb_jour` varchar(50) NOT NULL,
  `maternite` varchar(10) NOT NULL,
  `maladie` varchar(20) NOT NULL,
  `except` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_2` (`id`),
  UNIQUE KEY `em_id` (`em_id`),
  KEY `id_3` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=252 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `conge_mois`
--

INSERT INTO `conge_mois` (`id`, `em_id`, `nb_jour`, `maternite`, `maladie`, `except`) VALUES
(1, 'T0000', '32.5', '2', '104', '10'),
(2, 'T00001', '11.5', '2.5', '20', '9'),
(3, 'T00002', '30', '3', '15', '10'),
(4, 'T00003', '34.5', '3', '20', '10'),
(5, 'T00009', '30.5', '40', '30', '10'),
(6, 'T00054', '42.5', '3', '51', '10'),
(7, 'T00075', '27.5', '3', '', ''),
(8, 'T00147', '27.5', '3', '', ''),
(9, 'T00172', '27.5', '', '', ''),
(10, 'T00183', '27.5', '', '', ''),
(11, 'T00222', '27.5', '', '', ''),
(12, 'T00252', '27.5', '', '', ''),
(13, 'T00253', '27.5', '', '', ''),
(14, 'T00266', '27.5', '', '', ''),
(15, 'T00386', '27.5', '', '', ''),
(16, 'T00390', '27.5', '', '', ''),
(17, 'T00391', '27.5', '', '', ''),
(18, 'T00452', '27.5', '', '', ''),
(19, 'T00455', '27.5', '', '', ''),
(20, 'T00468', '27.5', '', '', ''),
(21, 'T00470', '27.5', '', '', ''),
(22, 'T00478', '27.5', '', '', ''),
(23, 'T00484', '27.5', '', '', ''),
(24, 'T00486', '27.5', '', '', ''),
(25, 'T00487', '27.5', '', '', ''),
(26, 'T00492', '27.5', '', '', ''),
(27, 'T00497', '27.5', '', '', ''),
(28, 'T00501', '27.5', '', '', ''),
(29, 'T00508', '27.5', '', '', ''),
(30, 'T00529', '27.5', '', '', ''),
(31, 'T00532', '27.5', '', '', ''),
(32, 'T00534', '27.5', '', '', ''),
(33, 'T00539', '27.5', '', '', ''),
(34, 'T00540', '27.5', '', '', ''),
(35, 'T00546', '27.5', '', '', ''),
(36, 'T00552', '27.5', '', '', ''),
(37, 'T00557', '27.5', '', '', ''),
(38, 'T00559', '27.5', '', '', ''),
(39, 'T00561', '27.5', '', '', ''),
(40, 'T00567', '27.5', '', '', ''),
(41, 'T00590', '27.5', '', '', ''),
(42, 'T00596', '27.5', '', '', ''),
(43, 'T00597', '27.5', '', '', ''),
(44, 'T00602', '27.5', '', '', ''),
(45, 'T00606', '27.5', '', '', ''),
(46, 'T00609', '27.5', '', '', ''),
(47, 'T00613', '27.5', '', '', ''),
(48, 'T00615', '27.5', '', '', ''),
(49, 'T00628', '27.5', '', '', ''),
(50, 'T00630', '27.5', '', '', ''),
(51, 'T00641', '27.5', '', '', ''),
(52, 'T00647', '27.5', '', '', ''),
(53, 'T00649', '27.5', '', '', ''),
(54, 'T00653', '27.5', '', '', ''),
(55, 'T00655', '27.5', '', '', ''),
(56, 'T00674', '27.5', '', '', ''),
(57, 'T00698', '27.5', '', '', ''),
(58, 'T00699', '27.5', '', '', ''),
(59, 'T00709', '27.5', '', '', ''),
(60, 'T00721', '27.5', '', '', ''),
(61, 'T00722', '27.5', '', '', ''),
(62, 'T00723', '27.5', '', '', ''),
(63, 'T00724', '27.5', '', '', ''),
(64, 'T00726', '27.5', '', '', ''),
(65, 'T00727', '27.5', '', '', ''),
(66, 'T00729', '27.5', '', '', ''),
(67, 'T00730', '27.5', '', '', ''),
(68, 'T00733', '27.5', '', '', ''),
(69, 'T00742', '27.5', '', '', ''),
(70, 'T00766', '27.5', '', '', ''),
(71, 'T00777', '27.5', '', '', ''),
(72, 'T00779', '27.5', '', '', ''),
(73, 'T00781', '27.5', '', '', ''),
(74, 'T00784', '27.5', '', '', ''),
(75, 'T00785', '27.5', '', '', ''),
(76, 'T00787', '27.5', '', '', ''),
(77, 'T00797', '27.5', '', '', ''),
(78, 'T00802', '27.5', '', '', ''),
(79, 'T00805', '27.5', '', '', ''),
(80, 'T00808', '27.5', '', '', ''),
(81, 'T00814', '27.5', '', '', ''),
(82, 'T00822', '27.5', '', '', ''),
(83, 'T00823', '27.5', '', '', ''),
(84, 'T00831', '27.5', '', '', ''),
(85, 'T00832', '27.5', '', '', ''),
(86, 'T00846', '27.5', '', '', ''),
(87, 'T00848', '27.5', '', '', ''),
(88, 'T00849', '27.5', '', '', ''),
(89, 'T00851', '27.5', '', '', ''),
(90, 'T00854', '27.5', '', '', ''),
(91, 'T00861', '27.5', '', '', ''),
(92, 'T00864', '27.5', '', '', ''),
(93, 'T00867', '27.5', '', '', ''),
(94, 'T00868', '27.5', '', '', ''),
(95, 'T00869', '27.5', '', '', ''),
(96, 'T00870', '27.5', '', '', ''),
(97, 'T00873', '27.5', '', '', ''),
(98, 'T00875', '27.5', '', '', ''),
(99, 'T00876', '27.5', '', '', ''),
(100, 'T00880', '27.5', '', '', ''),
(101, 'T00881', '27.5', '', '', ''),
(102, 'T00883', '27.5', '', '', ''),
(103, 'T00884', '27.5', '', '', ''),
(104, 'T00885', '27.5', '', '', ''),
(105, 'T00888', '27.5', '', '', ''),
(106, 'T00889', '27.5', '', '', ''),
(107, 'T00891', '27.5', '', '', ''),
(108, 'T00893', '27.5', '', '', ''),
(109, 'T00894', '27.5', '', '', ''),
(110, 'T00895', '27.5', '', '', ''),
(111, 'T00896', '27.5', '', '', ''),
(112, 'T00897', '27.5', '', '', ''),
(113, 'T00898', '27.5', '', '', ''),
(114, 'T00899', '27.5', '', '', ''),
(115, 'T00903', '27.5', '', '', ''),
(116, 'T00904', '27.5', '', '', ''),
(117, 'T00905', '27.5', '', '', ''),
(118, 'T00906', '27.5', '', '', ''),
(119, 'T00907', '27.5', '', '', ''),
(120, 'T00911', '27.5', '', '', ''),
(121, 'T00912', '27.5', '', '', ''),
(122, 'T00913', '27.5', '', '', ''),
(123, 'T00915', '27.5', '', '', ''),
(124, 'T00916', '27.5', '', '', ''),
(125, 'T00917', '27.5', '', '', ''),
(126, 'T00918', '27.5', '', '', ''),
(127, 'T00919', '27.5', '', '', ''),
(128, 'T00920', '27.5', '', '', ''),
(129, 'T00921', '27.5', '', '', ''),
(130, 'T00922', '27.5', '', '', ''),
(131, 'T00927', '27.5', '', '', ''),
(132, 'T00928', '27.5', '', '', ''),
(133, 'T00930', '27.5', '', '', ''),
(134, 'T00931', '27.5', '', '', ''),
(135, 'T00933', '27.5', '', '', ''),
(136, 'T00934', '27.5', '', '', ''),
(137, 'T00935', '27.5', '', '', ''),
(138, 'T00936', '27.5', '', '', ''),
(139, 'T00938', '27.5', '', '', ''),
(140, 'T00940', '27.5', '', '', ''),
(141, 'T00942', '27.5', '', '', ''),
(142, 'T00943', '27.5', '', '', ''),
(143, 'T00944', '27.5', '', '', ''),
(144, 'T00945', '27.5', '', '', ''),
(145, 'T00946', '27.5', '', '', ''),
(146, 'T00947', '27.5', '', '', ''),
(147, 'T00948', '27.5', '', '', ''),
(148, 'T00949', '27.5', '', '', ''),
(149, 'T00950', '27.5', '', '', ''),
(150, 'T00954', '27.5', '', '', ''),
(151, 'T00957', '27.5', '', '', ''),
(152, 'T00963', '27.5', '', '', ''),
(153, 'T00966', '27.5', '', '', ''),
(154, 'T00969', '27.5', '', '', ''),
(155, 'T00970', '27.5', '', '', ''),
(156, 'T00972', '27.5', '', '', ''),
(157, 'T00973', '27.5', '', '', ''),
(158, 'T00975', '27.5', '', '', ''),
(159, 'T00976', '27.5', '', '', ''),
(160, 'T00977', '27.5', '', '', ''),
(161, 'T00978', '27.5', '', '', ''),
(162, 'T00979', '27.5', '', '', ''),
(163, 'T00982', '27.5', '', '', ''),
(164, 'T00985', '27.5', '', '', ''),
(165, 'T00986', '27.5', '', '', ''),
(166, 'T00989', '27.5', '', '', ''),
(167, 'T00991', '27.5', '', '', ''),
(168, 'T00999', '27.5', '', '', ''),
(169, 'T01000', '27.5', '', '', ''),
(170, 'T01001', '27.5', '', '', ''),
(171, 'T01002', '27.5', '', '', ''),
(172, 'T01003', '27.5', '', '', ''),
(173, 'T01005', '27.5', '', '', ''),
(174, 'T01006', '27.5', '', '', ''),
(175, 'T01007', '27.5', '', '', ''),
(176, 'T01008', '27.5', '', '', ''),
(177, 'T01010', '27.5', '', '', ''),
(178, 'T01011', '27.5', '', '', ''),
(179, 'T01012', '27.5', '', '', ''),
(180, 'T01015', '27.5', '', '', ''),
(181, 'T01016', '27.5', '', '', ''),
(182, 'T01017', '27.5', '', '', ''),
(183, 'T01018', '27.5', '', '', ''),
(184, 'T01019', '27.5', '', '', ''),
(185, 'T01020', '27.5', '', '', ''),
(186, 'T01021', '27.5', '', '', ''),
(187, 'T01022', '27.5', '', '', ''),
(188, 'T01023', '27.5', '', '', ''),
(189, 'T01024', '27.5', '', '', ''),
(190, 'T01025', '27.5', '', '', ''),
(191, 'T01026', '27.5', '', '', ''),
(192, 'T01027', '27.5', '', '', ''),
(193, 'T01028', '27.5', '', '', ''),
(194, 'T01029', '27.5', '', '', ''),
(195, 'T01030', '27.5', '', '', ''),
(196, 'T01031', '27.5', '', '', ''),
(197, 'T01032', '27.5', '', '', ''),
(198, 'T01033', '27.5', '', '', ''),
(199, 'T01034', '27.5', '', '', ''),
(200, 'T01035', '27.5', '', '', ''),
(201, 'T01036', '27.5', '', '', ''),
(202, 'T01037', '27.5', '', '', ''),
(203, 'T01038', '27.5', '', '', ''),
(204, 'T01039', '27.5', '', '', ''),
(205, 'T01040', '27.5', '', '', ''),
(206, 'T01041', '27.5', '', '', ''),
(207, 'T01042', '27.5', '', '', ''),
(208, 'T01043', '27.5', '', '', ''),
(209, 'T01044', '27.5', '', '', ''),
(210, 'T01045', '27.5', '', '', ''),
(211, 'T01046', '27.5', '', '', ''),
(212, 'T01047', '27.5', '', '', ''),
(213, 'T01048', '27.5', '', '', ''),
(214, 'T01049', '27.5', '', '', ''),
(215, 'T01050', '27.5', '', '', ''),
(216, 'T01051', '27.5', '', '', ''),
(217, 'T01052', '27.5', '', '', ''),
(218, 'T01054', '27.5', '', '', ''),
(219, 'T01055', '27.5', '', '', ''),
(220, 'T01056', '27.5', '', '', ''),
(221, 'T01057', '27.5', '', '', ''),
(222, 'T01058', '27.5', '', '', ''),
(223, 'T01059', '27.5', '', '', ''),
(224, 'T01061', '27.5', '', '', ''),
(225, 'T01062', '27.5', '', '', ''),
(226, 'T01063', '27.5', '', '', ''),
(227, 'T01064', '27.5', '', '', ''),
(228, 'T01065', '27.5', '', '', ''),
(229, 'T01066', '27.5', '', '', ''),
(230, 'T01067', '27.5', '', '', ''),
(231, 'T01068', '27.5', '', '', ''),
(232, 'T01069', '27.5', '', '', ''),
(233, 'T01070', '27.5', '', '', ''),
(234, 'T01071', '27.5', '', '', ''),
(235, 'T01072', '27.5', '', '', ''),
(236, 'T01073', '27.5', '', '', ''),
(237, 'T01074', '27.5', '', '', ''),
(238, 'T01075', '27.5', '', '', ''),
(239, 'T01076', '27.5', '', '', ''),
(240, 'T01077', '27.5', '', '', ''),
(241, 'T01078', '27.5', '', '', ''),
(242, 'T01079', '27.5', '', '', ''),
(243, 'T01080', '27.5', '', '', ''),
(244, 'T01081', '27.5', '', '', ''),
(245, 'T01083', '27.5', '', '', ''),
(246, 'T01085', '27.5', '', '', ''),
(247, 'T01087', '27.5', '', '', ''),
(248, 'T01089', '28', '', '', ''),
(249, 'T01090', '27.5', '', '', ''),
(250, 'T01091', '27.5', '', '', ''),
(251, 'T01093', '27.5', '', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `crud`
--

DROP TABLE IF EXISTS `crud`;
CREATE TABLE IF NOT EXISTS `crud` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `crud`
--

INSERT INTO `crud` (`id`, `name`, `email`) VALUES
(4, 'gfgf', 'fgfgf');

-- --------------------------------------------------------

--
-- Structure de la table `deduction`
--

DROP TABLE IF EXISTS `deduction`;
CREATE TABLE IF NOT EXISTS `deduction` (
  `de_id` int(11) NOT NULL,
  `salary_id` int(11) NOT NULL,
  `provident_fund` varchar(64) DEFAULT NULL,
  `bima` varchar(64) DEFAULT NULL,
  `tax` varchar(64) DEFAULT NULL,
  `others` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`de_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `deduction`
--

INSERT INTO `deduction` (`de_id`, `salary_id`, `provident_fund`, `bima`, `tax`, `others`) VALUES
(1, 1, '400', '0', '10', '0'),
(2, 2, '250', '360', '10', '0'),
(3, 3, '500', '0', '10', '0'),
(4, 4, '0', '0', '5', '0'),
(5, 5, '0', '0', '0', '0'),
(6, 6, '265', '0', '10', '0'),
(7, 7, '200', '300', '7', '0'),
(8, 8, '300', '560', '10', '0'),
(9, 9, '0', '0', '0', '0'),
(10, 10, '0', '100', '10', '0');

-- --------------------------------------------------------

--
-- Structure de la table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `id` int(11) NOT NULL,
  `dep_name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `department`
--

INSERT INTO `department` (`id`, `dep_name`) VALUES
(2, 'Direction'),
(3, 'Finance'),
(4, 'Informatique'),
(5, 'Marketing'),
(6, 'Production'),
(7, 'RH'),
(8, 'Logistique');

-- --------------------------------------------------------

--
-- Structure de la table `desciplinary`
--

DROP TABLE IF EXISTS `desciplinary`;
CREATE TABLE IF NOT EXISTS `desciplinary` (
  `id` int(11) NOT NULL,
  `em_id` varchar(64) DEFAULT NULL,
  `action` varchar(256) DEFAULT NULL,
  `title` varchar(256) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `designation`
--

DROP TABLE IF EXISTS `designation`;
CREATE TABLE IF NOT EXISTS `designation` (
  `id` int(11) NOT NULL,
  `des_name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `designation`
--

INSERT INTO `designation` (`id`, `des_name`) VALUES
(0, 'Opérateur Anglophone'),
(2, 'Directeur géneral\n'),
(3, 'Directeur de Ressources Humaines\n'),
(4, 'Directeur Marketing et Commercial\n'),
(5, 'Directeur Administratif et Financier\n'),
(6, ' Assistant administratif et financier\n'),
(7, ' Assistante Administrative et Comptable\n'),
(8, 'Responsable IT\n'),
(9, 'Administrateur système et reseau\n'),
(10, 'Technicien Develloppeur\n'),
(11, 'Assistant commercial\n'),
(12, 'Directeur des Operations\n'),
(13, 'Chefs de projet\n'),
(14, 'Developpeur\n'),
(15, 'TL\n'),
(16, 'QC\n'),
(17, 'Agents\n'),
(18, 'ARH\n'),
(19, 'WFM\n'),
(20, 'Assistante de Direction\n'),
(21, 'Responsable logistique\n'),
(22, 'Stagiaire');

-- --------------------------------------------------------

--
-- Structure de la table `earned_leave`
--

DROP TABLE IF EXISTS `earned_leave`;
CREATE TABLE IF NOT EXISTS `earned_leave` (
  `id` int(11) NOT NULL,
  `em_id` varchar(64) DEFAULT NULL,
  `present_date` varchar(64) DEFAULT NULL,
  `hour` varchar(64) DEFAULT NULL,
  `status` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `earned_leave`
--

INSERT INTO `earned_leave` (`id`, `em_id`, `present_date`, `hour`, `status`) VALUES
(26, 'T01089', '-2', '-16', '1');

-- --------------------------------------------------------

--
-- Structure de la table `education`
--

DROP TABLE IF EXISTS `education`;
CREATE TABLE IF NOT EXISTS `education` (
  `id` int(11) NOT NULL,
  `emp_id` varchar(128) DEFAULT NULL,
  `edu_type` varchar(256) DEFAULT NULL,
  `institute` varchar(256) DEFAULT NULL,
  `result` varchar(64) DEFAULT NULL,
  `year` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `education`
--

INSERT INTO `education` (`id`, `emp_id`, `edu_type`, `institute`, `result`, `year`) VALUES
(1, 'Doe1753', 'MSIT', 'Westview University', '71', '2016');

-- --------------------------------------------------------

--
-- Structure de la table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `em_id` varchar(64) DEFAULT NULL,
  `des_id` varchar(200) DEFAULT NULL,
  `dep_id` varchar(200) DEFAULT NULL,
  `first_name` varchar(128) DEFAULT NULL,
  `last_name` varchar(128) DEFAULT NULL,
  `em_email` varchar(64) DEFAULT NULL,
  `em_password` varchar(512) NOT NULL,
  `em_role` enum('ADMIN','EMPLOYEE','N+1') NOT NULL DEFAULT 'EMPLOYEE',
  `id_np` varchar(20) NOT NULL,
  `em_address` varchar(512) DEFAULT NULL,
  `status` enum('ACTIF','INACTIF') NOT NULL DEFAULT 'ACTIF',
  `em_gender` enum('Homme','Femme') NOT NULL DEFAULT 'Homme',
  `em_phone` varchar(64) DEFAULT NULL,
  `em_birthday` varchar(128) DEFAULT NULL,
  `contrat` enum('CDI','CDD','Pigiste') NOT NULL DEFAULT 'CDI',
  `em_joining_date` varchar(128) DEFAULT NULL,
  `em_contact_end` varchar(128) DEFAULT NULL,
  `em_image` varchar(128) DEFAULT NULL,
  `em_nid` varchar(64) DEFAULT NULL,
  `em_entree` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2965 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `employee`
--

INSERT INTO `employee` (`id`, `em_id`, `des_id`, `dep_id`, `first_name`, `last_name`, `em_email`, `em_password`, `em_role`, `id_np`, `em_address`, `status`, `em_gender`, `em_phone`, `em_birthday`, `contrat`, `em_joining_date`, `em_contact_end`, `em_image`, `em_nid`, `em_entree`) VALUES
(250, 'T0000', NULL, NULL, 'Admin', 'Telesourcia', 'admin@telesourcia.com', 'f865b53623b121fd34ee5426c792e5c33af8c227', '', '', NULL, 'ACTIF', 'Homme', '0320000000', '2023-08-01', 'CDI', '2015-01-24', '', 'Tel1001.jpg', '000000000000', ''),
(2714, 'T00001', 'Directeur General', 'Direction', 'RASOLOFONJOA ', 'Haingo', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', 'T00455', NULL, 'ACTIF', 'Homme', NULL, '1964-04-07', 'CDI', '2015-10-01', NULL, 'Tel1001.jpg', '101211089309', ''),
(2715, 'T00002', 'Directeur Commercial et marketing', 'Direction', 'AMIRALY ', 'Reza', 'apadmin@telesourcia.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 49 277 60', '1976-07-27', 'CDI', '2015-01-10', '', 'Tel1001.jpg', '515011020482', '08:00'),
(2716, 'T00003', 'Directeur des Ressources Humaines', 'Direction', 'AUBERT ', 'Stephane', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', NULL, '1978-06-23', 'CDI', '2015-01-10', NULL, 'Tel1001.jpg', '515011028921', ''),
(2717, 'T00009', 'Agent d\'entretien et de securite', 'Logistique', 'MIHA ', 'Girot François', 'girot@telesourcia.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '1236542785', '1982-04-15', 'CDI', '2015-10-01', '', 'Tel1001.jpg', '515011027046', '06:45'),
(2718, 'T00054', 'Chauffeur coursier', 'Logistique', 'RABENJANAHARY ', 'Andriniaina', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', NULL, '1973-10-21', 'CDI', '2015-01-10', NULL, 'Tel1001.jpg', '101211121412', ''),
(2719, 'T00075', 'Assistante de direction et juridique', 'Direction', 'RAVALISON ', 'Murielle Holitiana', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', NULL, '1980-03-29', 'CDI', '2015-11-06', NULL, 'Tel1001.jpg', '101222074218', '07:30'),
(2720, 'T00147', 'Agent logistique', 'Logistique', 'RABENANDRASANA ', 'Ramangalahy Martial', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 96 548 81', '1984-06-04', 'CDI', '2016-05-30', NULL, 'Tel1001.jpg', '401031021960', '08:00'),
(2721, 'T00172', 'Chef de projet', 'Production - Back Office', 'RAHARIVONY ', 'Rijaniaina Newson', 'r.newson@telesourcia.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'N+1', '', NULL, 'ACTIF', 'Homme', '033 63 665 44', '1988-12-08', 'CDI', '2016-07-25', '', 'Tel1001.jpg', '101211188560', '06:45'),
(2722, 'T00183', 'Agent d\'entretien et de securite', 'Logistique', 'HENRI ', 'Angelo', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 60 069 90', '1986-06-25', 'CDI', '2016-08-15', NULL, 'Tel1001.jpg', '209011029652', '06:45'),
(2723, 'T00222', 'Chef de projet', 'Production - Back Office', 'ANDRIANTSALAMA ', 'Lalanirina Sully Mirjah', 'ltest@mail.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 24 012 37 ', '1995-09-22', 'CDI', '2016-09-26', '', 'Tel1001.jpg', '101251178306', '07:30'),
(2724, 'T00252', 'Assistant Administratif et Financier ', 'Finance', 'RAZAFIMAHEFA ', 'Njara', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 87 425 09', '1985-12-10', 'CDI', '2016-11-21', NULL, 'Tel1001.jpg', '101211175806', '08:00'),
(2725, 'T00253', 'Opérateur Anglophone', 'Production - Back Office', 'RABEARISON ', 'Noro S.J.A', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 18 654 43 ', '1968-04-20', 'CDI', '2016-11-28', NULL, 'Tel1001.jpg', '101212110288', '06:45'),
(2726, 'T00266', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIANAIVO ', 'Tsirimalala Ando Fitahiana', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', 'T00001', NULL, 'ACTIF', 'Homme', '034 39 572 44', '1997-07-02', 'CDI', '2016-11-28', NULL, 'Tel1001.jpg', '102072023391', '06:45'),
(2727, 'T00386', 'Directeur Administratif et Financier ', 'Finance', 'RANDRIAMANALINARIVO ', 'Guy Robin', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', 'T00001', NULL, 'ACTIF', 'Homme', '034 35 452 27 ', '1962-09-01', 'CDI', '2017-03-23', NULL, 'Tel1001.jpg', '715991032409', '06:30'),
(2728, 'T00390', 'Femme de menage', 'Logistique', 'RAHAINGOLALAO', 'Rojoniaina Sitraka Mireille', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 79 613 75', '1986-05-27', 'CDI', '2017-06-15', NULL, 'Tel1001.jpg', '101252142880', '06:45'),
(2729, 'T00391', 'Chef de projet', 'Production - Back Office', 'ANDRIANJO', 'Hobiniaina Velomiaranjaka', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '033 71 501 30', '1991-04-23', 'CDI', '2017-06-15', NULL, 'Tel1001.jpg', '118111009276', '07:30'),
(2730, 'T00452', 'Team Leader', 'Production - Back Office', 'RAVOLOLONIRINA', 'Theophine Elussa', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '032 28 119 15', '1996-01-24', 'CDI', '2017-10-30', NULL, 'Tel1001.jpg', '414012030347', ''),
(2731, 'T00455', 'Quality Controler', 'Production - Back Office', 'RASENDRAMIALY', 'Adrienne Fataciah', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '033 68 422 91', '1999-09-08', 'CDI', '2017-10-30', NULL, 'Tel1001.jpg', '102032034593', '06:45'),
(2732, 'T00468', 'Opérateur Anglophone', 'Production - Back Office', 'RAKOTOARIMANANA', 'Elysee Regis', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '033 76 242 18', '1990-12-17', 'CDI', '2017-04-12', NULL, 'Tel1001.jpg', '520011009927', '06:45'),
(2733, 'T00470', 'Opérateur Anglophone', 'Production - Back Office', 'RASOANIRINA', 'Harinavalona Lea Viviane', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '033 32 360 14', '1995-03-22', 'CDI', '2017-04-12', NULL, 'Tel1001.jpg', '102032026597', '06:45'),
(2734, 'T00478', 'Quality Controler', 'Production - Back Office', 'RAHERISOA', 'Tatamo  Nirina Judith Nathalie', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '033 21 178 44', '1996-08-10', 'CDI', '2017-04-12', NULL, 'Tel1001.jpg', '111012021103', ''),
(2735, 'T00484', 'Technicien Support Informatique', 'Informatique', 'HARIFETRA ', 'Tovonintsoa', 'f.tovonintsoa@telesourcia.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'N+1', '', NULL, 'ACTIF', 'Homme', '034 13 269 17', '1983-02-18', 'CDI', '2017-01-07', '', 'Tel1001.jpg', '201011011402', '08:00'),
(2736, 'T00486', 'Directeur Général Adjoint', 'Production - Back Office', 'RAKOTOMALALA ', 'Rindra', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '033 12 682 60 ', '1974-02-17', 'CDI', '2018-01-03', NULL, 'Tel1001.jpg', '101241079395', '08:00'),
(2737, 'T00487', 'Quality Controler', 'Production - Back Office', 'DOMINIQUE', '', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '032 79 146 01', '1992-04-13', 'CDI', '2018-05-03', NULL, 'Tel1001.jpg', '718991069478', ''),
(2738, 'T00492', 'Team Leader', 'Production - Back Office', 'RAJAONARIVOLOLONA ', 'Sitrakiniaina Helianthe', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 43 890 72 ', '1992-11-04', 'CDI', '2018-05-03', NULL, 'Tel1001.jpg', '106422011027', ''),
(2739, 'T00497', 'Assistante RH', 'Ressources Humaines', 'RASOARIVONY ', 'Malalanirina', 'm.rasoarivony@telesourcia.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'ADMIN', '', NULL, 'ACTIF', 'Femme', '034 61 016 19', '1991-02-10', 'CDI', '2018-05-03', '', 'Tel1001.jpg', '101252162221', '07:00'),
(2740, 'T00501', 'Opérateur Anglophone', 'Production - Back Office', 'RAVOLANIRINA ', 'Marie Ismène', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '032 74 686 32', '1997-11-08', 'CDI', '2018-05-03', NULL, 'Tel1001.jpg', '414012032785', '06:45'),
(2741, 'T00508', 'Quality Controler', 'Production - Back Office', 'BENARSON ', 'Jean Sidoly', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '032 80 781 40 ', '1993-10-20', 'CDI', '2018-03-12', NULL, 'Tel1001.jpg', '401011045991', ''),
(2742, 'T00529', 'Opérateur Anglophone', 'Production - Back Office', 'MANJAKARISOA', 'Rakotoarivelo Hesperida', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '033 68 403 92 ', '1998-05-05', 'CDI', '2018-06-08', NULL, 'Tel1001.jpg', '414012029563', '06:45'),
(2743, 'T00532', 'Quality Controler', 'Production - Back Office', 'RAZAFINDRAMAMY', 'Alice Elmine', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '032 78 578 64', '1992-11-23', 'CDI', '2018-06-08', NULL, 'Tel1001.jpg', '101222105191', ''),
(2744, 'T00534', 'Chef de Projet', 'Production - Back Office', 'RAZANAKOTO', 'Manoisoa Magen Nadine', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 60 722 66', '1993-02-07', 'CDI', '2018-08-06', NULL, 'Tel1001.jpg', '117312013770', '06:45'),
(2745, 'T00539', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIAMPARANY', 'Berson Tojo', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 59 050 44 ', '1998-04-21', 'CDI', '2018-06-08', NULL, 'Tel1001.jpg', '101251199716', '06:45'),
(2746, 'T00540', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIAMIALINTSOA', 'Heriniaina Jean Michel ', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '032 73 670 09', '1991-11-19', 'CDI', '2018-08-08', NULL, 'Tel1001.jpg', '107231006139', '06:45'),
(2747, 'T00546', 'Opérateur Anglophone', 'Production - Back Office', 'NARINDRARINJAKA', 'Mireille Honorine', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 19 924 50', '1992-09-24', 'CDI', '2018-08-08', NULL, 'Tel1001.jpg', '114012029987', '06:45'),
(2748, 'T00552', 'Team Leader', 'Production - Back Office', 'RANDRIAMAHOLISON', 'Hery Michel Richard ', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '032 26 399 11', '1982-10-05', 'CDI', '2018-08-08', NULL, 'Tel1001.jpg', '101231120820', ''),
(2749, 'T00557', 'Agent d\'entretien et de securite', 'Logistique', 'RAZAFY', 'Harison Andrianomenjanahary Tafita Tsilavina', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 15 357 49', '1986-07-22', 'CDI', '2018-08-08', NULL, 'Tel1001.jpg', '313011020150', '06:45'),
(2750, 'T00559', 'Opérateur Anglophone', 'Production - Back Office', 'ANDRIAMIARAMANTSOA', 'Tsitohaina falinomena', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '032 73 074 68', '1998-10-11', 'CDI', '2018-08-13', NULL, 'Tel1001.jpg', '106361014750', '06:45'),
(2751, 'T00561', 'Opérateur Anglophone', 'Production - Back Office', 'NALIHARISOA', 'Volana Sarobidy', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 45 044 95 ', '1997-09-12', 'CDI', '2018-08-13', NULL, 'Tel1001.jpg', '101982098413', '06:45'),
(2752, 'T00567', 'Opérateur Anglophone', 'Production - Back Office', 'MANANTENASOA', 'Fabiola', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '033 85 307 39', '1999-07-14', 'CDI', '2018-08-13', NULL, 'Tel1001.jpg', '101252205518', '06:45'),
(2753, 'T00590', 'Quality Controler', 'Production - Back Office', 'RANDRIAMAROJAONA', 'Mihaja Faniry', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 60 857 81', '1998-03-18', 'CDI', '2018-08-20', NULL, 'Tel1001.jpg', '102372008882', ''),
(2754, 'T00596', 'Opérateur Anglophone', 'Production - Back Office', 'RAHELIARISATA', 'Vony Arilala', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', ' 034 95 852 23', '1987-01-14', 'CDI', '2018-08-23', NULL, 'Tel1001.jpg', '101232134714', '06:45'),
(2755, 'T00597', 'Quality Controler', 'Production - Back Office', 'RAZAKAHARISON', 'Zo Hery Fandresena', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 06 080 05', '1997-04-09', 'CDI', '2018-08-23', NULL, 'Tel1001.jpg', '102072022281', ''),
(2756, 'T00602', 'Opérateur Anglophone', 'Production - Back Office', 'FANAMPIANTSOA SAROBIDINIAINA', 'Narovana Josiane', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 27 400 76 ', '1993-03-10', 'CDI', '2018-08-23', NULL, 'Tel1001.jpg', '110012015800', '06:45'),
(2757, 'T00606', 'Opérateur Anglophone', 'Production - Back Office', 'RASONJASOLOFONIAINA', 'Volatiana', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 46 988 07', '1992-03-10', 'CDI', '2018-08-23', NULL, 'Tel1001.jpg', '101252167165', '06:45'),
(2758, 'T00609', 'Opérateur Anglophone', 'Production - Back Office', 'ANDRIAMALALASON', 'Tsiory Emas', 'andriamalalson@gmail.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '0320727782', '2000-03-10', 'CDI', '2018-08-23', '', 'Tel1001.jpg', '101231169836', '06:45'),
(2759, 'T00613', 'Team Leader', 'Production - Back Office', 'RAKOTONDRABESO', 'Ezeckiel Haley', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '033 07 309 22', '1992-05-21', 'CDI', '2018-08-31', NULL, 'Tel1001.jpg', '103071014357', ''),
(2760, 'T00615', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIANJAFY', 'Seth Julian', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '032 67 216 55', '1997-04-03', 'CDI', '2018-08-31', NULL, 'Tel1001.jpg', '717011030243', '06:45'),
(2761, 'T00628', 'Opérateur Anglophone', 'Production - Back Office', 'FLORIDA TOGNIZARA', 'Angelina', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '032 82 928 84', '1996-01-01', 'CDI', '2018-08-31', NULL, 'Tel1001.jpg', '719012033769', '06:45'),
(2762, 'T00630', 'Opérateur Anglophone', 'Production - Back Office', 'ANDRIA-RAMANANTSOA', 'Fitiavana Rova Fenosoa', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '032 52 258 63 ', '1994-09-13', 'CDI', '2018-08-31', NULL, 'Tel1001.jpg', '117351006882', '06:45'),
(2763, 'T00641', 'Opérateur Anglophone', 'Production - Back Office', 'RAKOTOBE', 'Hanitriniaina Prisca', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 60 204 75', '1990-05-14', 'CDI', '2018-09-06', NULL, 'Tel1001.jpg', '117322012628', '06:45'),
(2764, 'T00647', 'Opérateur Anglophone', 'Production - Back Office', 'RAZAFIARISOA', 'Annida Heureuse Arthur', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 61 620 34 ', '1996-04-05', 'CDI', '2018-06-09', NULL, 'Tel1001.jpg', '101242170211', '06:45'),
(2765, 'T00649', 'Team Leader', 'Production - Back Office', 'RAKOTOARIJAONA', 'Amboara Vania', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '032 97 112 52 ', '1992-04-11', 'CDI', '2018-06-09', NULL, 'Tel1001.jpg', '106091006209', ''),
(2766, 'T00653', 'Opérateur Anglophone', 'Production - Back Office', 'RAKOTOARIJAONA', 'Rojo Mendrika', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 74 294 08', '1989-04-26', 'CDI', '2018-06-09', NULL, 'Tel1001.jpg', '106091004709', '06:45'),
(2767, 'T00655', 'Opérateur Anglophone', 'Production - Back Office', 'RAKOTOVAO', 'Hajarimanana Toky', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '032 93 592 96', '1997-02-26', 'CDI', '2018-06-09', NULL, 'Tel1001.jpg', '102391005466', '06:45'),
(2768, 'T00674', 'Opérateur Anglophone', 'Production - Back Office', 'RATIARISON ', 'Nampoina Edith', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '033 85 731 07', '1993-04-24', 'CDI', '2018-06-09', NULL, 'Tel1001.jpg', '102032024752', '06:45'),
(2769, 'T00698', 'Opérateur Anglophone', 'Production - Back Office', 'RAVOLOLOMALALA', 'Laurencia Arsénia', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 64 209 57', '1994-10-22', 'CDI', '2018-10-16', NULL, 'Tel1001.jpg', '101242161882', '06:45'),
(2770, 'T00699', 'Opérateur Anglophone', 'Production - Back Office', 'RAKOTOARIJAONA', 'Omega', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 86 476 97', '1979-01-30', 'CDI', '2018-10-16', NULL, 'Tel1001.jpg', '101222065318', '06:45'),
(2771, 'T00709', 'Femme de ménage', 'Logistique', 'RANAIVOJAONA', 'Rivovololona', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 43 794 86', '1977-01-21', 'CDI', '2019-02-01', NULL, 'Tel1001.jpg', '102092003494', '06:45'),
(2772, 'T00721', 'Opérateur Anglophone', 'Production - Back Office', 'RAMIANDRITIANA', 'Oly Ravaka', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 27 855 72', '1999-06-20', 'CDI', '2019-04-08', NULL, 'Tel1001.jpg', '101252206363', '06:45'),
(2773, 'T00722', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIAMIHAJASON', 'Tafitanirina Maya', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 28 753 53', '2000-11-30', 'CDI', '2019-04-08', NULL, 'Tel1001.jpg', '101252214024', '06:45'),
(2774, 'T00723', 'Opérateur Anglophone', 'Production - Back Office', 'RAHANTAMALALA', 'Maminiaina Nomenjanahary Felana', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 43 752 11 ', '1993-05-15', 'CDI', '2019-04-08', NULL, 'Tel1001.jpg', '101982088113', '06:45'),
(2775, 'T00724', 'Opérateur Anglophone', 'Production - Back Office', 'RATOVOARISON', 'Manitra Patrick', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 96 626 52', '1988-11-19', 'CDI', '2019-04-08', NULL, 'Tel1001.jpg', '102011010212', '06:45'),
(2776, 'T00726', 'Opérateur Anglophone', 'Production - Back Office', 'RAZAFINIRINA', 'Liliane', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 31 300 31', '1989-12-03', 'CDI', '2019-04-08', NULL, 'Tel1001.jpg', '101222094206', '06:45'),
(2777, 'T00727', 'Assistante Administrative et Comptable', 'Finance', 'RAKOTOARIZAO', 'Holitiana Liliane', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 20 716 09', '1991-08-16', 'CDI', '2019-04-15', NULL, 'Tel1001.jpg', '101252153759', '08:00'),
(2778, 'T00729', 'Informatique', 'Informatique', 'ANDRIAMBOAVONJY', 'Niry Nantenaina', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 58 080 97', '1988-09-19', 'CDI', '2019-07-29', NULL, 'Tel1001.jpg', '103051010513', '07:00'),
(2779, 'T00730', 'Quality Controler', 'Production - Back Office', 'RANDRIAMALALA', 'Navotana Davidson', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '032 54 721 86', '1999-09-05', 'CDI', '2019-07-29', NULL, 'Tel1001.jpg', '314011043060', ''),
(2780, 'T00733', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIAMIADANARIVO', 'Mamiarivonjy', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 27 470 54', '1982-12-06', 'CDI', '2019-07-29', NULL, 'Tel1001.jpg', '103051007103', '06:45'),
(2781, 'T00742', 'Opérateur Anglophone', 'Production - Back Office', 'ANDRIAMAHOLINIAINA', 'Daddy', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 85 641 02', '1995-01-12', 'CDI', '2019-08-14', NULL, 'Tel1001.jpg', '106091007215', '06:45'),
(2782, 'T00766', 'Opérateur Anglophone', 'Production - Back Office', 'RAJAONARIVOLOLONA', 'Iandoniaina Santonie', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 47 815 93', '1994-05-02', 'CDI', '2019-08-23', NULL, 'Tel1001.jpg', '106422011529', '06:45'),
(2783, 'T00777', 'Assistant commercial', 'Logistique', 'RASAMIHAGA', 'Eric Mikaïa', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 84 314 14', '1995-11-30', 'CDI', '2019-09-16', NULL, 'Tel1001.jpg', '101981094067', '07:00'),
(2784, 'T00779', 'Opérateur Anglophone', 'Production - Back Office', 'RAHARISOA', 'Elizo Gabriella', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 04 754 94', '1989-07-26', 'CDI', '2019-10-02', NULL, 'Tel1001.jpg', '101242137987', '06:45'),
(2785, 'T00781', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIANARISON', 'Lalaniaina Rovatiana Marie Louisa', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 79 435 13', '1994-05-05', 'CDI', '2019-10-02', NULL, 'Tel1001.jpg', '210012033650', '06:45'),
(2786, 'T00784', 'Opérateur Anglophone', 'Production - Back Office', 'RAHASIMANANA', 'Dieu Donnelly', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 65 550 40', '1997-04-09', 'CDI', '2019-10-02', NULL, 'Tel1001.jpg', '201052013851', '06:45'),
(2787, 'T00785', 'Opérateur Anglophone', 'Production - Back Office', 'RAHARISOA', 'Andoniaina Marcellia', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 37 195 86', '1988-06-22', 'CDI', '2019-10-02', NULL, 'Tel1001.jpg', '101242133644', '06:45'),
(2788, 'T00787', 'Quality Controler', 'Production - Back Office', 'FANANTENANA', 'Tokiniaina Jhonny', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 06 808 14', '1995-12-28', 'CDI', '2019-10-02', NULL, 'Tel1001.jpg', '508991026287', ''),
(2789, 'T00797', 'Opérateur Anglophone', 'Production - Back Office', 'RAMANAMISATA', 'Fenosoa Omega', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 91 809 41', '1994-05-01', 'CDI', '2019-10-18', NULL, 'Tel1001.jpg', '118113012115', '06:45'),
(2790, 'T00802', 'Opérateur Anglophone', 'Production - Back Office', 'RAZANAMAMPIANINA', 'Haingosoa Marie Judith', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 01 351 72', '1998-11-26', 'CDI', '2019-10-02', NULL, 'Tel1001.jpg', '101232167837', '06:45'),
(2791, 'T00805', 'Quality Controler', 'Production - Back Office', 'RAJAONARIVELO', 'Iriantsoa Mirajo', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 58 677 44', '1998-05-17', 'CDI', '2019-10-02', NULL, 'Tel1001.jpg', '102391005738', ''),
(2792, 'T00808', 'Opérateur Anglophone', 'Production - Back Office', 'RAJAONARIVELO', 'Kantoniaina Laryssa', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '033 32 377 26', '1998-09-23', 'CDI', '2019-10-02', NULL, 'Tel1001.jpg', '101252200254', '06:45'),
(2793, 'T00814', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIANANTENAINA ', 'Zo Lalaina Miarintsoa', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 32 471 05', '1998-03-12', 'CDI', '2019-10-02', NULL, 'Tel1001.jpg', '101251200704', '06:45'),
(2794, 'T00822', 'Opérateur Anglophone', 'Production - Back Office', 'RASOANANTENAINA', 'Nomenjanahary Miora', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '033 90 382 76', '1997-08-29', 'CDI', '2019-10-08', NULL, 'Tel1001.jpg', '103052018179', '06:45'),
(2795, 'T00823', 'Opérateur Anglophone', 'Production - Back Office', 'VOLOLONIRINA', 'ZO Nomenjanahary Mialy', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 91 383 29', '1995-10-25', 'CDI', '2019-10-08', NULL, 'Tel1001.jpg', '103052016188', '06:45'),
(2796, 'T00831', 'Opérateur Anglophone', 'Production - Back Office', 'TANJONIAINA', 'Minah Sylvie Gaelle', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 90 399 39', '2001-05-24', 'CDI', '2019-10-15', NULL, 'Tel1001.jpg', '117152025664', '06:45'),
(2797, 'T00832', 'Quality Controler', 'Production - Back Office', 'ANDRIAMIADANA', 'Aina Sarah', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 40 814 11', '1999-04-23', 'CDI', '2019-10-15', NULL, 'Tel1001.jpg', '101232167393', ''),
(2798, 'T00846', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIANARISON', 'Nomena Hasina Angelinah', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 95 703 55', '2000-11-15', 'CDI', '2019-10-23', NULL, 'Tel1001.jpg', '102012022219', '06:45'),
(2799, 'T00848', 'Opérateur Anglophone', 'Production - Back Office', 'RAMAHEFAHASINIRINA', 'Rajo julius', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 50 405 83', '1992-07-10', 'CDI', '2019-10-29', NULL, 'Tel1001.jpg', '101221104461', '06:45'),
(2800, 'T00849', 'Opérateur Anglophone', 'Production - Back Office', 'RAKOTOARIVELO', 'Sitrakiniony Nantenaina', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 47 804 86', '1998-01-17', 'CDI', '2019-10-29', NULL, 'Tel1001.jpg', '101242178658', '06:45'),
(2801, 'T00851', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIANOMENA ', 'Fetra', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 39 511 27', '1999-01-21', 'CDI', '2019-10-29', NULL, 'Tel1001.jpg', '117051018362', '06:45'),
(2802, 'T00854', 'Opérateur Anglophone', 'Production - Back Office', 'NY ONY EVA', 'Rahasindrainibe', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '032 97 939 78', '1994-02-17', 'CDI', '2019-10-29', NULL, 'Tel1001.jpg', '108012021185', '06:45'),
(2803, 'T00861', 'Opérateur Anglophone', 'Production - Back Office', 'LAZAMANANA', 'Chirlin Victorico', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 90 535 80', '1992-08-07', 'CDI', '2020-04-20', NULL, 'Tel1001.jpg', '712011015980', '06:45'),
(2804, 'T00864', 'Opérateur Anglophone', 'Production - Back Office', 'RAOELISON', 'Noella Fabienne', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 70 941 86', '1993-05-08', 'Pigiste', '2020-09-21', NULL, 'Tel1001.jpg', '101232151361', '06:45'),
(2805, 'T00867', 'Team Leader', 'Production - Back Office', 'BEMANAGNA', 'Berger Romeo', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 88 584 38', '1996-10-15', 'CDI', '2020-09-23', NULL, 'Tel1001.jpg', '719011033202', ''),
(2806, 'T00868', 'Opérateur Anglophone', 'Production - Back Office', 'RABESAHALA ', 'Mbola Notiavina Joela Antenaina', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 55 735 22', '2000-09-16', 'Pigiste', '2020-09-23', NULL, 'Tel1001.jpg', '117051016911', '06:45'),
(2807, 'T00869', 'Opérateur Anglophone', 'Production - Back Office', 'RAMILIJAONA', 'Mbola Fanekena Voady NyOnja', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 72 736 75', '2002-05-16', 'Pigiste', '2020-09-23', NULL, 'Tel1001.jpg', '117051021315', '06:45'),
(2808, 'T00870', 'Opérateur Anglophone', 'Production - Back Office', 'ANDRIANARISON', 'Haingoniaina Harena Tafitasoa', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '033 05 394 37', '2000-03-10', 'Pigiste', '2020-09-23', NULL, 'Tel1001.jpg', '117052016826', '06:45'),
(2809, 'T00873', 'Opérateur Anglophone', 'Production - Back Office', 'ANDRIAMANOHISOA', 'Vonjinambinina Jean Mario', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 36 567 38', '1998-10-11', 'Pigiste', '2020-09-23', NULL, 'Tel1001.jpg', '105131027104', '06:45'),
(2810, 'T00875', 'Opérateur Anglophone', 'Production - Back Office', 'ANJARASOA ', 'Mamitiana Erica', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '032 51 199 53', '1994-08-25', 'Pigiste', '2020-05-10', NULL, 'Tel1001.jpg', '101222114799', '06:45'),
(2811, 'T00876', 'Opérateur Anglophone', 'Production - Back Office', 'RAMIADANARIVO', 'Sitraka Niaina ', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '033 83 021 69', '1991-01-01', 'Pigiste', '2020-05-10', NULL, 'Tel1001.jpg', '508992018601', '06:45'),
(2812, 'T00880', 'Opérateur Anglophone', 'Production - Back Office', 'RAJAONARIVAO', 'Claire Josiella', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 08 029 41', '1993-04-21', 'Pigiste', '2020-05-10', NULL, 'Tel1001.jpg', '315012027707', '06:45'),
(2813, 'T00881', 'Opérateur Anglophone', 'Production - Back Office', 'RATIAMARO', 'Francisco', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 38 359 17', '1995-12-31', 'Pigiste', '2020-05-10', NULL, 'Tel1001.jpg', '414011030940', '06:45'),
(2814, 'T00883', 'Opérateur Anglophone', 'Production - Back Office', 'RABENILAINA ', 'Michael', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '032 42 607 36', '1997-06-16', 'Pigiste', '2020-05-10', NULL, 'Tel1001.jpg', '413011031571', '06:45'),
(2815, 'T00884', 'Opérateur Anglophone', 'Production - Back Office', 'RATSIRAHONANA ', 'Hasina Rene', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 85 297 23', '1998-08-28', 'Pigiste', '2021-02-11', NULL, 'Tel1001.jpg', '107331001892', '06:45'),
(2816, 'T00885', 'Opérateur Anglophone', 'Production - Back Office', 'ZAKATIANA RATSIMAHORY ', 'Adjani Monica', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 19 167 12', '1999-04-15', 'Pigiste', '2021-02-11', NULL, 'Tel1001.jpg', '312112018247', '06:45'),
(2817, 'T00888', 'Opérateur Anglophone', 'Production - Back Office', 'ANDRIAHARINASOLO ', 'Onjatiana', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 70 854 26', '1999-09-01', 'Pigiste', '2021-02-11', NULL, 'Tel1001.jpg', '101252201651', '06:45'),
(2818, 'T00889', 'Opérateur Anglophone', 'Production - Back Office', 'NASTASSJIA ', 'Stephanie Jhennifer', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 08 063 93', '1990-10-01', 'Pigiste', '2021-02-11', NULL, 'Tel1001.jpg', '101252162875', '06:45'),
(2819, 'T00891', 'Opérateur Anglophone', 'Production - Back Office', 'RAMAROJAONA ', 'Tanjona Jean Fabien', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 93 903 11', '1995-08-12', 'Pigiste', '2021-02-11', NULL, 'Tel1001.jpg', '111091017587', '06:45'),
(2820, 'T00893', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIAMIHAJA ', 'Lino Fortina', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 48 686 06', '2003-12-03', 'Pigiste', '2021-02-11', NULL, 'Tel1001.jpg', '101231178724', '06:45'),
(2821, 'T00894', 'Opérateur Anglophone', 'Production - Back Office', 'MAHERY', 'Veronirina Sylvia', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 96 127 76', '1984-10-14', 'Pigiste', '2021-04-19', NULL, 'Tel1001.jpg', '101232128190', '06:45'),
(2822, 'T00895', 'Opérateur Anglophone', 'Production - Back Office', 'NY MALALANIRINA', 'Onisolo Lilia', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 33 463 53', '2000-06-17', 'Pigiste', '2021-04-19', NULL, 'Tel1001.jpg', '101232170625', '06:45'),
(2823, 'T00896', 'Opérateur Anglophone', 'Production - Back Office', 'HIVANIRINA', 'Tolojanahary Fehizoro', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 76 668 70', '2002-08-01', 'Pigiste', '2021-04-19', NULL, 'Tel1001.jpg', '101232176845', '06:45'),
(2824, 'T00897', 'Opérateur Anglophone', 'Production - Back Office', 'IARIFIDY', 'Vatosoa Nirina Prisca', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 57 568 53', '2000-04-06', 'Pigiste', '2021-04-19', NULL, 'Tel1001.jpg', '117392009298', '06:45'),
(2825, 'T00898', 'Opérateur Anglophone', 'Production - Back Office', 'RAHARIMALALA', 'Tongasoa Geni-Bella', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 26 200 91', '1999-09-28', 'Pigiste', '2021-04-19', NULL, 'Tel1001.jpg', '117052016565', '06:45'),
(2826, 'T00899', 'Opérateur Anglophone', 'Production - Back Office', 'ZONANTENAINA', 'Andrilivah', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 93 690 42', '2001-11-10', 'Pigiste', '2021-04-19', NULL, 'Tel1001.jpg', '103072023961', '06:45'),
(2827, 'T00903', 'Opérateur Anglophone', 'Production - Back Office', 'RASOANANTENAINA', 'Benedicte Florencia', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 68 177 09', '2002-04-02', 'Pigiste', '2021-04-19', NULL, 'Tel1001.jpg', '414012040800', '06:45'),
(2828, 'T00904', 'Opérateur Anglophone', 'Production - Back Office', 'ANDRIANATOAVINA', 'Lucien Daniel', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 60 449 95', '1999-07-13', 'Pigiste', '2021-04-26', NULL, 'Tel1001.jpg', '101211240545', '06:45'),
(2829, 'T00905', 'Opérateur Anglophone', 'Production - Back Office', 'RAKOTOSON', 'Fanambinana Rojosoa', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 62 893 04', '1998-11-18', 'Pigiste', '2021-04-26', NULL, 'Tel1001.jpg', '101982102296', '06:45'),
(2830, 'T00906', 'Opérateur Anglophone', 'Production - Back Office', 'RAHANITRARINOSY', 'Haingotiana Patricia', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 19 423 94', '1998-07-12', 'Pigiste', '2021-04-26', NULL, 'Tel1001.jpg', '117312018500', '06:45'),
(2831, 'T00907', 'Opérateur Anglophone', 'Production - Back Office', 'RAJAONARINIRINA', 'Sarindra Domenico', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 86 751 01', '1999-11-14', 'Pigiste', '2021-04-26', NULL, 'Tel1001.jpg', '106421012915', '06:45'),
(2832, 'T00911', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIAMANANORO RAZANADRABE ', 'Fanomezana Irène', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 43 931 59', '1996-06-01', 'Pigiste', '2021-05-03', NULL, 'Tel1001.jpg', '103072017660', '06:45'),
(2833, 'T00912', 'Opérateur Anglophone', 'Production - Back Office', 'ANDRIAMANOHISOA', 'Lanjatiana Nicole Jessica', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 29 981 18', '1996-01-20', 'Pigiste', '2021-05-03', NULL, 'Tel1001.jpg', '105132023886', '06:45'),
(2834, 'T00913', 'Opérateur Anglophone', 'Production - Back Office', 'TSEDEHIMANJAKA', 'Jesé Lamy', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 15 847 88', '1995-05-11', 'Pigiste', '2021-05-03', NULL, 'Tel1001.jpg', '401011049013', '06:45'),
(2835, 'T00915', 'Opérateur Anglophone', 'Production - Back Office', 'RAZANADRATSARA', 'Tsiorimandimby Bienvenu', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 89 143 59', '1997-11-22', 'Pigiste', '2021-08-12', NULL, 'Tel1001.jpg', '312111017211', '06:45'),
(2836, 'T00916', 'Opérateur Anglophone', 'Production - Back Office', 'RAHARIMIRANA', 'Mioraniaina Fidy', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 20 552 62', '1994-06-17', 'Pigiste', '2021-08-12', NULL, 'Tel1001.jpg', '115132007548', '06:45'),
(2837, 'T00917', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIANARIMANANA', 'Heriniaina Rojo Nombana', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '033 20 477 28', '1998-08-28', 'Pigiste', '2021-08-12', NULL, 'Tel1001.jpg', '102391005839', '06:45'),
(2838, 'T00918', 'Opérateur Anglophone', 'Production - Back Office', 'AZIA', 'Aly', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '032 73 622 53', '2000-07-24', 'Pigiste', '2021-12-06', NULL, 'Tel1001.jpg', '409022003632', '06:45'),
(2839, 'T00919', 'Opérateur Anglophone', 'Production - Back Office', 'RABENJANAHARY ', 'Andoniaina Herinarindra', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '033 14 006 76', '1994-11-04', 'Pigiste', '2021-12-06', NULL, 'Tel1001.jpg', '307011008523', '06:45'),
(2840, 'T00920', 'Opérateur Anglophone', 'Production - Back Office', 'RAVAOZAFY', 'Romuald', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 45 725 53', '1993-09-25', 'Pigiste', '2021-12-06', NULL, 'Tel1001.jpg', '423011010524', '06:45'),
(2841, 'T00921', 'Opérateur Anglophone', 'Production - Back Office', 'RAFARAHITA', 'Gabien Gildas', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 17 632 00', '1995-06-24', 'Pigiste', '2021-12-06', NULL, 'Tel1001.jpg', '423011010489', '06:45'),
(2842, 'T00922', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIATSITOHAINA', 'Ionja Rene', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 15 366 06', '2000-04-12', 'Pigiste', '2021-12-06', NULL, 'Tel1001.jpg', '107331022249', '09:00'),
(2843, 'T00927', 'Opérateur Anglophone', 'Production - Back Office', 'RAMAMONJISOA', 'Toky Fanomezana ', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 16 207 11', '1996-11-27', 'Pigiste', '2021-12-27', NULL, 'Tel1001.jpg', '101241172030', '06:45'),
(2844, 'T00928', 'Opérateur Anglophone', 'Production - Back Office', 'RAMANANTSIAROVANA', 'Finaritra Rebecca', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 27 194 16', '2002-10-25', 'Pigiste', '2021-12-27', NULL, 'Tel1001.jpg', '101242205230', '06:45'),
(2845, 'T00930', 'Opérateur Anglophone', 'Production - Back Office', 'ANDRIAMAHOLISOA', 'Henintsoa Patricia', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 78 646 49', '2002-05-14', 'Pigiste', '2021-12-27', NULL, 'Tel1001.jpg', '117052022208', '06:45'),
(2846, 'T00931', 'Opérateur Anglophone', 'Production - Back Office', 'HARIVOLOLONA', 'Andry Finoana', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 11 568 98', '1997-12-31', 'Pigiste', '2021-12-27', NULL, 'Tel1001.jpg', '101251195373', '06:45'),
(2847, 'T00933', 'Opérateur Anglophone', 'Production - Back Office', 'ANDRIANOMENJANAHARY HARIJAONA', 'Heriniaina Judson', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 07 717 94', '2003-07-13', 'Pigiste', '2021-12-27', NULL, 'Tel1001.jpg', '101231179497', '06:45'),
(2848, 'T00934', 'Opérateur Anglophone', 'Production - Back Office', 'HARIJAONA', 'Fazar Zo Mampianina', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 74 714 48', '1993-05-08', 'Pigiste', '2021-12-27', NULL, 'Tel1001.jpg', '313012027916', '06:45'),
(2849, 'T00935', 'Opérateur Anglophone', 'Production - Back Office', 'ANDRIANARIVONY', 'Anselme Felix', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 84 021 57', '1994-08-27', 'Pigiste', '2021-12-27', NULL, 'Tel1001.jpg', '101251177174', '06:45'),
(2850, 'T00936', 'Team Leader', 'Production - Back Office', 'RAKOTOARIVELO', 'Asandratry NyAvo Koloina', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 09 015 32', '1999-04-05', 'Pigiste', '2021-12-27', NULL, 'Tel1001.jpg', '414012033903', ''),
(2851, 'T00938', 'Opérateur Anglophone', 'Production - Back Office', 'JAZIELA', 'Mioran\'Andriamalala', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '032 96 062 56', '2003-12-08', 'Pigiste', '2021-12-27', NULL, 'Tel1001.jpg', '102092039437', '06:45'),
(2852, 'T00940', 'Opérateur Anglophone', 'Production - Back Office', 'RAVONIMANANTENA', 'Fanilonomena Andrea', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 99 770 54', '1996-09-02', 'Pigiste', '2021-12-27', NULL, 'Tel1001.jpg', '101252188374', '06:45'),
(2853, 'T00942', 'Opérateur Anglophone', 'Production - Back Office', 'RAKOTOARISOA', 'Faniry', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 70 270 62', '1993-10-06', 'Pigiste', '2021-12-27', NULL, 'Tel1001.jpg', '106301033112', '06:45'),
(2854, 'T00943', 'Opérateur Anglophone', 'Production - Back Office', 'RAJAONESY', 'Anson Eloi', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '032 65 179 68', '1998-07-11', 'Pigiste', '2021-12-27', NULL, 'Tel1001.jpg', '712011018558', '06:45'),
(2855, 'T00944', 'Opérateur Anglophone', 'Production - Back Office', 'RAKOTOARIMANANA', 'Fenosoa Sandrah', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 97 744 00', '1997-05-31', 'Pigiste', '2021-12-27', NULL, 'Tel1001.jpg', '316012017241', '06:45'),
(2856, 'T00945', 'Opérateur Anglophone', 'Production - Back Office', 'RAKOTOARISOLO', 'Nambinina', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '033 23 944 49', '1992-07-14', 'Pigiste', '2021-12-27', NULL, 'Tel1001.jpg', '117191010112', '06:45'),
(2857, 'T00946', 'Opérateur Anglophone', 'Production - Back Office', 'TSIVERY', 'Sitraky Elisonne', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 62 264 18', '1999-09-21', 'Pigiste', '2021-12-27', NULL, 'Tel1001.jpg', '111012026488', '06:45'),
(2858, 'T00947', 'Opérateur Anglophone', 'Production - Back Office', 'RAKOTOARIFENINA', 'Sombiniaina Mahefatiana', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 26 500 02', '2000-03-29', 'Pigiste', '2021-12-27', NULL, 'Tel1001.jpg', '117151024099', '06:45'),
(2859, 'T00948', 'Opérateur Anglophone', 'Production - Back Office', 'RAHARIMALALA', 'Zo Harinosy', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 08 794 62', '1998-11-14', 'Pigiste', '2021-12-27', NULL, 'Tel1001.jpg', '105132026789', '06:45'),
(2860, 'T00949', 'Opérateur Anglophone', 'Production - Back Office', 'RAZANADRAFARA', 'Maminiaina Honorine Angela', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 29 095 41', '1984-08-01', 'Pigiste', '2021-12-27', NULL, 'Tel1001.jpg', '101242121446', '06:45'),
(2861, 'T00950', 'Opérateur Anglophone', 'Production - Back Office', 'RASOLOHERY', 'Miora Andrianina Jessica', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 21 099 51', '1999-12-12', 'Pigiste', '2021-12-27', NULL, 'Tel1001.jpg', '101982105219', '06:45'),
(2862, 'T00954', 'Opérateur Anglophone', 'Production - Back Office', 'ANDRIAMPARANY', 'Benjaniaina Fitahiana Valisoa', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 05 066 40', '1999-10-07', 'Pigiste', '2021-12-31', NULL, 'Tel1001.jpg', '101242189999', '06:45'),
(2863, 'T00957', 'Opérateur Anglophone', 'Production - Back Office', 'ZERINOLD', 'Rakotomalala Alphonse', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '032 45 993 27', '2000-06-27', 'Pigiste', '2021-12-31', NULL, 'Tel1001.jpg', '101221133144', '06:45'),
(2864, 'T00963', 'Opérateur Anglophone', 'Production - Back Office', 'RAKOTOARIMANANA', 'Tsivery Sitraka', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 42 022 55', '2000-10-04', 'Pigiste', '2021-12-31', NULL, 'Tel1001.jpg', '101231171969', '06:45'),
(2865, 'T00966', 'Opérateur Anglophone', 'Production - Back Office', 'NAHARISOA', 'Elie Fidele', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 27 372 76', '2001-12-31', 'Pigiste', '2021-12-31', NULL, 'Tel1001.jpg', '117051021392', '06:45'),
(2866, 'T00969', 'Opérateur Anglophone', 'Production - Back Office', 'RABEARISON ', 'Joelinarivo', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', NULL, '1987-05-13', 'Pigiste', '2021-12-31', NULL, 'Tel1001.jpg', '117071012251', '06:45'),
(2867, 'T00970', 'Opérateur Anglophone', 'Production - Back Office', 'HERIMAMONJY', 'Jean Claudien', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 26 811 30', '1993-10-12', 'Pigiste', '2021-12-31', NULL, 'Tel1001.jpg', '712011017061', '06:45'),
(2868, 'T00972', 'Opérateur Anglophone', 'Production - Back Office', 'RAHARINIRINA', 'Kantoniaina ', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 85 297 23', '1999-01-20', 'Pigiste', '2021-12-31', NULL, 'Tel1001.jpg', '107072008603', '06:45'),
(2869, 'T00973', 'Opérateur Anglophone', 'Production - Back Office', 'BAO ', 'Chantal Geria Florine ', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '032 26 767 66', '1997-12-10', 'Pigiste', '2021-12-31', NULL, 'Tel1001.jpg', '712152005271', '06:45'),
(2870, 'T00975', 'Opérateur Anglophone', 'Production - Back Office', 'ANDRIANARISON', 'Jean Francisco Alda', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 60 987 52', '1987-03-09', 'Pigiste', '2021-12-31', NULL, 'Tel1001.jpg', '712091002156', '06:45'),
(2871, 'T00976', 'Opérateur Anglophone', 'Production - Back Office', 'LAHINIRIKO', 'RocktophenBabay Alphonse', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '033 49 303 63', '2000-03-17', 'Pigiste', '2021-12-31', NULL, 'Tel1001.jpg', '507011022263', '06:45'),
(2872, 'T00977', 'Opérateur Anglophone', 'Production - Back Office', 'RAHELIARISOA', 'Felaniaina Olivia', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 10 628 10', '1999-08-02', 'Pigiste', '2022-01-20', NULL, 'Tel1001.jpg', '117052018103', '06:45'),
(2873, 'T00978', 'Opérateur Anglophone', 'Production - Back Office', 'RAKOTOHERIMANANTSOA ', 'Tsantanirina', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 75 444 02', '2001-11-14', 'Pigiste', '2022-01-20', NULL, 'Tel1001.jpg', '117121022809', '06:45'),
(2874, 'T00979', 'Opérateur Anglophone', 'Production - Back Office', 'RAMAHAFALIMANANA', 'Belistin Frelant', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 90 853 82', NULL, 'Pigiste', '2022-01-20', NULL, 'Tel1001.jpg', NULL, '06:45'),
(2875, 'T00982', 'Opérateur Anglophone', 'Production - Back Office', 'RAFANOMEZANTSOA', 'Chreso', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '032 95 870 50', '1998-08-08', 'Pigiste', '2022-01-20', NULL, 'Tel1001.jpg', '712011021873', '06:45'),
(2876, 'T00985', 'Opérateur Anglophone', 'Production - Back Office', 'JEAN', 'Mario', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 72 764 08', '1994-10-20', 'Pigiste', '2022-01-20', NULL, 'Tel1001.jpg', '712011018478', '06:45'),
(2877, 'T00986', 'Opérateur Anglophone', 'Production - Back Office', 'SOLONIHERY', 'Francisco', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 75 397 97', '1995-12-30', 'Pigiste', '2022-01-20', NULL, 'Tel1001.jpg', '712011022215', '06:45'),
(2878, 'T00989', 'Opérateur Anglophone', 'Production - Back Office', 'RAKOTOARIMAVO ', 'Tojoniaina Yang', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '033 18 120 92', '2003-01-20', 'Pigiste', '2022-01-24', NULL, 'Tel1001.jpg', '103071025389', '06:45'),
(2879, 'T00991', 'Opérateur Anglophone', 'Production - Back Office', 'RAMAHAVANONA', ' Exaviot', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', NULL, '1996-04-23', 'Pigiste', '2022-01-24', NULL, 'Tel1001.jpg', '712131003993', '06:45'),
(2880, 'T00999', 'Opérateur Anglophone', 'Production - Back Office', 'MEVALAZA ', 'Marin Yves_son Aurelien', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 33 218 97', '2001-08-31', 'Pigiste', '2022-01-24', NULL, 'Tel1001.jpg', '413011039439', '06:45'),
(2881, 'T01000', 'Opérateur Anglophone', 'Production - Back Office', 'RATELOSON ', 'Alain Gomis', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 27 921 17', '2000-02-04', 'Pigiste', '2022-01-24', NULL, 'Tel1001.jpg', '107071009130', '06:45');
INSERT INTO `employee` (`id`, `em_id`, `des_id`, `dep_id`, `first_name`, `last_name`, `em_email`, `em_password`, `em_role`, `id_np`, `em_address`, `status`, `em_gender`, `em_phone`, `em_birthday`, `contrat`, `em_joining_date`, `em_contact_end`, `em_image`, `em_nid`, `em_entree`) VALUES
(2882, 'T01001', 'Opérateur Anglophone', 'Production - Back Office', 'FALIZAFY ', 'Razakamanana Fridolin', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 54 954 88', '1996-08-06', 'Pigiste', '2022-01-24', NULL, 'Tel1001.jpg', '414011031590', '06:45'),
(2883, 'T01002', 'Opérateur Anglophone', 'Production - Back Office', 'RAFEARIVO ', 'Achille Joseph', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 32 328 86', '1992-11-17', 'Pigiste', '2022-01-24', NULL, 'Tel1001.jpg', '116011017870', '06:45'),
(2884, 'T01003', 'Opérateur Anglophone', 'Production - Back Office', 'VALIHENINTSOA ', 'Hanitriniaina Larissa Juanot', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '032 85 598 96', '2001-04-23', 'Pigiste', '2022-01-24', NULL, 'Tel1001.jpg', '102092034385', '06:45'),
(2885, 'T01005', 'Opérateur Anglophone', 'Production - Back Office', 'ANDRIAMBOLARIVO ', 'Marolahy Francisco Jimmy', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 31 707 57', '1994-01-10', 'Pigiste', '2022-01-24', NULL, 'Tel1001.jpg', NULL, '06:45'),
(2886, 'T01006', 'Opérateur Anglophone', 'Production - Back Office', 'HANTANIRINA ', 'Justinia', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '032 76 624 71', '2000-12-29', 'Pigiste', '2022-01-24', NULL, 'Tel1001.jpg', '712012021987', '06:45'),
(2887, 'T01007', 'Opérateur Anglophone', 'Production - Back Office', 'RAZANAJATOVO ', 'Salohy Holitiana', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '033 51 703 47', '1989-12-30', 'Pigiste', '2022-01-24', NULL, 'Tel1001.jpg', '108092009414', '06:45'),
(2888, 'T01008', 'Opérateur Anglophone', 'Production - Back Office', 'RAZAFIMAHITA ', 'Danie Gilbert', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '032 79 451 04', '1998-09-06', 'Pigiste', '2022-01-24', NULL, 'Tel1001.jpg', '413011038773', '06:45'),
(2889, 'T01010', 'Opérateur Anglophone', 'Production - Back Office', 'ANDRIANARIVONY ', 'Luc Anicet', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 39 193 89', '1996-03-20', 'Pigiste', '2022-01-24', NULL, 'Tel1001.jpg', '414011031646', '06:45'),
(2890, 'T01011', 'Opérateur Anglophone', 'Production - Back Office', 'RAHARIMALAZA ', 'Jennia Jacquobine', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 59 181 84', '1999-02-04', 'Pigiste', '2022-01-24', NULL, 'Tel1001.jpg', '414012034733', '06:45'),
(2891, 'T01012', 'Administrateur Système/Reseau', 'Informatique', 'ANDRIANARY', 'Andrianjaka Stanislas', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 42 064 21', '1990-04-12', 'CDI', '2022-07-01', NULL, 'Tel1001.jpg', '102031018827', '08:00'),
(2892, 'T01015', 'Opérateur Anglophone', 'Production - Back Office', 'ANDRIANAIVONIRINA', 'Saotra Ny Avo', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', NULL, '2004-06-17', 'Pigiste', '2022-10-31', NULL, 'Tel1001.jpg', '117051021954', '06:45'),
(2893, 'T01016', 'Opérateur Anglophone', 'Production - Back Office', 'ADELINE', 'Finaritra', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', NULL, '2002-09-19', 'Pigiste', '2022-10-31', NULL, 'Tel1001.jpg', '117052021402', '06:45'),
(2894, 'T01017', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIAFALISOA ', 'Nandimby Finaritra', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', NULL, '2004-03-02', 'Pigiste', '2022-10-31', NULL, 'Tel1001.jpg', '117052021865', '06:45'),
(2895, 'T01018', 'Opérateur Anglophone', 'Production - Back Office', 'RAMBOLAMANANA', 'Tsilavina Franck', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', NULL, '2001-09-21', 'Pigiste', '2022-10-31', NULL, 'Tel1001.jpg', '117031023859', '06:45'),
(2896, 'T01019', 'Opérateur Anglophone', 'Production - Back Office', 'RAHARISON', 'Finoana Kiady', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', NULL, '2004-01-19', 'Pigiste', '2022-10-31', NULL, 'Tel1001.jpg', '117051021845', '06:45'),
(2897, 'T01020', 'Opérateur Anglophone', 'Production - Back Office', 'ANDRIAMIADANA', 'René Faèse Tiandray', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 07 717 57', '2002-07-08', 'Pigiste', '2022-10-31', NULL, 'Tel1001.jpg', NULL, '06:45'),
(2898, 'T01021', 'Opérateur Anglophone', 'Production - Back Office', 'VONIARISOA', 'Patricia', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 86 910 31', '2000-01-10', 'Pigiste', '2022-10-31', NULL, 'Tel1001.jpg', '101222131632', '06:45'),
(2899, 'T01022', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIANAIVO', 'Harifelana', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 51 701 66', '1993-08-04', 'Pigiste', '2022-10-31', NULL, 'Tel1001.jpg', '101982089901', '06:45'),
(2900, 'T01023', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIAMANANTENA', 'Solofoniaina', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 20 676 57', '2001-04-05', 'Pigiste', '2022-10-31', NULL, 'Tel1001.jpg', '101241195692', '06:45'),
(2901, 'T01024', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRAMALALA', 'Mickael Davidson', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 37 841 26', '2001-04-26', 'Pigiste', '2022-10-31', NULL, 'Tel1001.jpg', '312011035649', '06:45'),
(2902, 'T01025', 'Opérateur Anglophone', 'Production - Back Office', 'RAVAOARISOA', 'Nancy Leitischia', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 81 723 58', '1996-09-18', 'Pigiste', '2022-10-31', NULL, 'Tel1001.jpg', '101222122023', '06:45'),
(2903, 'T01026', 'Opérateur Anglophone', 'Production - Back Office', 'RAKOTONDRABE', 'Tahirisoa Rina Mickael', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 89 969 48', '2002-03-05', 'Pigiste', '2022-10-31', NULL, 'Tel1001.jpg', '101221138643', '06:45'),
(2904, 'T01027', 'Opérateur Anglophone', 'Production - Back Office', 'RATSIMBAZAFY', 'Seheno Miarisoa Tiana Ginette', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 63 619 00', '2000-12-03', 'Pigiste', '2022-10-31', NULL, 'Tel1001.jpg', '116012025015', '06:45'),
(2905, 'T01028', 'Opérateur Anglophone', 'Production - Back Office', 'RAMANAMAHEFA', 'Andriamihajasoa Randja Faneva Vanessa', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 61 380 08', '2002-10-23', 'Pigiste', '2022-10-31', NULL, 'Tel1001.jpg', '110252012902', '06:45'),
(2906, 'T01029', 'Opérateur Anglophone', 'Production - Back Office', 'RASOANANTENAINA', 'Micheline', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 61 380 08', '2002-10-23', 'Pigiste', '2022-10-31', NULL, 'Tel1001.jpg', '110252012902', '06:45'),
(2907, 'T01030', 'Opérateur Anglophone', 'Production - Back Office', 'RAHARINAIVO ', 'Nambinina Valisoa Christian', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 99 271 96', '1996-05-18', 'Pigiste', '2022-10-31', NULL, 'Tel1001.jpg', '102391005438', '06:45'),
(2908, 'T01031', 'Opérateur Anglophone', 'Production - Back Office', 'RALIJAONA', 'Hasina Henintsoa', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', NULL, NULL, 'Pigiste', '2022-10-31', NULL, 'Tel1001.jpg', NULL, '06:45'),
(2909, 'T01032', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIANTAVY RANDRIANARISOA  ', 'Onjaniaina Nirimanantsoa', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 75 901 09', '2000-08-20', 'Pigiste', '2022-10-31', NULL, 'Tel1001.jpg', '101222131650', '06:45'),
(2910, 'T01033', 'Opérateur Anglophone', 'Production - Back Office', 'RAKOTOARIMANANA', 'Faniriantsoa Hanitriniaina Léa', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 08 770 27', '2002-02-26', 'Pigiste', '2022-10-31', NULL, 'Tel1001.jpg', '111012027849', '06:45'),
(2911, 'T01034', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIANARISON', 'Tiana Herizo ', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '038 89 218 25', '2004-04-23', 'Pigiste', '2022-10-31', NULL, 'Tel1001.jpg', '101241213891', '06:45'),
(2912, 'T01035', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIAMANANTENA', 'Joseph Erick Daniel', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', NULL, '1997-12-26', 'Pigiste', '2022-10-31', NULL, 'Tel1001.jpg', '101251196606', '06:45'),
(2913, 'T01036', 'Opérateur Anglophone', 'Production - Back Office', 'CAJEE', 'Gianna Fahendrena', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 32 070 74', '2004-03-01', 'Pigiste', '2022-10-31', NULL, 'Tel1001.jpg', '101232182001', '06:45'),
(2914, 'T01037', 'Opérateur Anglophone', 'Production - Back Office', 'TSILANIZARA', 'Julior Patico', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '032 94 082 34', '2002-08-29', 'Pigiste', '2022-11-21', NULL, 'Tel1001.jpg', '101221141111', '06:45'),
(2915, 'T01038', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIAMALALA', 'Fidison Daniel', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '032 72 304 66', '1999-05-30', 'Pigiste', '2022-11-21', NULL, 'Tel1001.jpg', '101241184556', '06:45'),
(2916, 'T01039', 'Opérateur Anglophone', 'Production - Back Office', 'RAKOTOBE', 'Herve Daniel', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 98 454 50', '1991-08-12', 'Pigiste', '2022-11-21', NULL, 'Tel1001.jpg', '101241145701', '06:45'),
(2917, 'T01040', 'Opérateur Anglophone', 'Production - Back Office', 'TIANJARA', 'Angelo', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '337567434', '1999-09-02', 'Pigiste', '2022-11-21', NULL, 'Tel1001.jpg', '719011039952', '06:45'),
(2918, 'T01041', 'Opérateur Anglophone', 'Production - Back Office', 'RASOARIMALALA', ' Felana', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 20 449 92', '1993-07-29', 'Pigiste', '2022-11-21', NULL, 'Tel1001.jpg', '102072017287', '06:45'),
(2919, 'T01042', 'Opérateur Anglophone', 'Production - Back Office', 'SARINDRANJANAHARY', 'Zolitina Nadia', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 27 282 34', '1998-08-10', 'Pigiste', '2022-12-16', NULL, 'Tel1001.jpg', '101232165588', '06:45'),
(2920, 'T01043', 'Opérateur Anglophone', 'Production - Back Office', 'SIKINABAY', 'Katina Oliva', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 39 658 83', '1999-06-29', 'Pigiste', '2022-12-16', NULL, 'Tel1001.jpg', '103152022140', '06:45'),
(2921, 'T01044', 'Opérateur Anglophone', 'Production - Back Office', 'RAZAFIMAMONJY', 'Mialintsoa Nathalie', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 47 066 01', '1999-04-03', 'Pigiste', '2022-12-16', NULL, 'Tel1001.jpg', '101252205696', '06:45'),
(2922, 'T01045', 'Opérateur Anglophone', 'Production - Back Office', 'RAZANAKINIAINA ', 'Liantsoa ', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 76 660 01', '2000-12-20', 'Pigiste', '2022-12-20', NULL, 'Tel1001.jpg', '102032037243', '06:45'),
(2923, 'T01046', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIAMARO', 'Nambinintsoa Diary Tahiry', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 56 483 35', '2001-04-11', 'Pigiste', '2022-12-20', NULL, 'Tel1001.jpg', '103016032653', '06:45'),
(2924, 'T01047', 'Opérateur Anglophone', 'Production - Back Office', 'SAMBO', 'Jean Gabriel Perboyre', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 24 664 85', '1997-11-28', 'Pigiste', '2022-12-20', NULL, 'Tel1001.jpg', '516011033601', '06:45'),
(2925, 'T01048', 'Opérateur Anglophone', 'Production - Back Office', 'ANDRIANDRAINIARIMA ', 'Anjamampionona Notiavina', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 10 142 01', '1995-06-19', 'Pigiste', '2022-12-21', NULL, 'Tel1001.jpg', '114011034476', '06:45'),
(2926, 'T01049', 'Opérateur Anglophone', 'Production - Back Office', 'RAHANTAMALALA', 'Angèle', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '032 38 253 98', '1994-08-01', 'Pigiste', '2022-12-26', NULL, 'Tel1001.jpg', '104092007060', '06:45'),
(2927, 'T01050', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIANAIVOSOA', 'Finoana Valimbavaka Fanjatiana ', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 23 742 16', '2003-09-13', 'Pigiste', '2022-12-26', NULL, 'Tel1001.jpg', '117012043872', '06:45'),
(2928, 'T01051', 'Opérateur Anglophone', 'Production - Back Office', 'RAHERIARISOA', 'Mamitiana Olivier ', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '032 38 470 22', '2000-08-28', 'Pigiste', '2022-12-26', NULL, 'Tel1001.jpg', '106301037458', '06:45'),
(2929, 'T01052', 'Opérateur Anglophone', 'Production - Back Office', 'RABARISON', 'Vonjitiana Angela ', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 22 157 29', '1997-09-24', 'Pigiste', '2022-12-26', NULL, 'Tel1001.jpg', '101222119801', '06:45'),
(2930, 'T01054', 'Opérateur Anglophone', 'Production - Back Office', 'RAZAFINDRAMANITRA', 'Sitrakiniaina', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 79 105 86', '1991-08-30', 'Pigiste', '2023-03-06', NULL, 'Tel1001.jpg', '314012033719', '06:45'),
(2931, 'T01055', 'Opérateur Anglophone', 'Production - Back Office', 'ANDRIAMBELOARINOSY', 'Edmond', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 10 220 89', '1980-12-21', 'Pigiste', '2023-03-06', NULL, 'Tel1001.jpg', '115011003744', '06:45'),
(2932, 'T01056', 'Opérateur Anglophone', 'Production - Back Office', 'RAMBOLOARINORO', 'Nampoinaniaina', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 54 899 63', '1998-08-27', 'Pigiste', '2023-03-08', NULL, 'Tel1001.jpg', '101252199002', '06:45'),
(2933, 'T01057', 'Gestionnaire des RH', 'Ressources Humaines', 'FABIEN', 'Mendrika Ambinintsoa Falie', 'falie@telesourcia.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'ADMIN', '', NULL, 'ACTIF', 'Femme', '032 94 567 66', '1998-04-25', 'CDI', '2023-03-20', '', 'Tel1001.jpg', '103132017470', '08:00'),
(2934, 'T01058', 'Opérateur Anglophone', 'Production - Back Office', 'RAVELOSON', 'Tianjanahary Faniriana Mbolatiana', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 48 494 08', '2002-03-22', 'Pigiste', '2023-03-21', NULL, 'Tel1001.jpg', '103172016505', '06:45'),
(2935, 'T01059', 'Opérateur Anglophone', 'Production - Back Office', 'RAKOTOARIMANANA', 'Maminiaina Dimitri Michael', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '038 22 922 82', '2004-03-26', 'Pigiste', '2023-03-21', NULL, 'Tel1001.jpg', '111011030796', '06:45'),
(2936, 'T01061', 'Opérateur Anglophone', 'Production - Back Office', 'RAZAFINDRAMANANA', 'Manantenasoa Sandrine', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 69 043 21', '2000-02-01', 'Pigiste', '2023-03-21', NULL, 'Tel1001.jpg', '101982105765', '06:45'),
(2937, 'T01062', 'Opérateur Anglophone', 'Production - Back Office', 'ANDRIANANDRASANA', 'Isidore Manitra', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 72 503 40', '1995-01-28', 'Pigiste', '2023-03-21', NULL, 'Tel1001.jpg', '101981091624', '06:45'),
(2938, 'T01063', 'Opérateur Anglophone', 'Production - Back Office', 'ANDRIAMORASATA', 'Tony Stephane', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 37 029 87', '1996-01-23', 'Pigiste', '2023-03-21', NULL, 'Tel1001.jpg', '101241169442', '06:45'),
(2939, 'T01064', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIANARISOA', 'Solofoniaina', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 13 106 17', '1999-10-08', 'Pigiste', '2023-03-21', NULL, 'Tel1001.jpg', '101981104599', '06:45'),
(2940, 'T01065', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIANANTENAINA', 'Haingotiana', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 75 299 38', '2005-05-20', 'Pigiste', '2023-03-21', NULL, 'Tel1001.jpg', NULL, '06:45'),
(2941, 'T01066', 'Opérateur Anglophone', 'Production - Back Office', 'RAZAFIALISOA', 'Salohiniaina', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 75 299 38', '1996-09-24', 'Pigiste', '2023-03-21', NULL, 'Tel1001.jpg', '101252188458', '06:45'),
(2942, 'T01067', 'Opérateur Anglophone', 'Production - Back Office', 'MIHARIMANANJATO', 'Anjara Fitahiana Ezra', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 23 150 54', '2000-11-04', 'Pigiste', '2023-03-21', NULL, 'Tel1001.jpg', '103111022042', '06:45'),
(2943, 'T01068', 'Opérateur Anglophone', 'Production - Back Office', 'LANTONIRINA', 'Faraniaina Henintsoa', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '032 58 989 39', '2004-06-08', 'Pigiste', '2023-03-21', NULL, 'Tel1001.jpg', '101232182889', '06:45'),
(2944, 'T01069', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIANAIVO', 'Jean Anthony Nathanael', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '038 81 711 79', '2002-01-14', 'Pigiste', '2023-03-21', NULL, 'Tel1001.jpg', '111231775550', '06:45'),
(2945, 'T01070', 'Opérateur Anglophone', 'Production - Back Office', 'RAKOTONDRASOA', 'Lahatra Tsivalaka', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '033 13 394 67', '2001-07-07', 'Pigiste', '2023-03-21', NULL, 'Tel1001.jpg', '101211265257', '06:45'),
(2946, 'T01071', 'Opérateur Anglophone', 'Production - Back Office', 'ANDRIANANTENAINA', 'Alain Patrick', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 76 842 15', '1998-09-22', 'Pigiste', '2023-03-21', NULL, 'Tel1001.jpg', '118071007701', '06:45'),
(2947, 'T01072', 'Opérateur Anglophone', 'Production - Back Office', 'RAHARIMANANA', 'Nomenjanahary Dino', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 71 238 09', '2001-12-13', 'Pigiste', '2023-03-22', NULL, 'Tel1001.jpg', '117151026721', '06:45'),
(2948, 'T01073', 'Opérateur Anglophone', 'Production - Back Office', 'RASOARIHANTA', 'Anjakoloina', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 21 655 05', '2004-11-19', 'Pigiste', '2023-03-22', NULL, 'Tel1001.jpg', '117152030869', '06:45'),
(2949, 'T01074', 'Opérateur Anglophone', 'Production - Back Office', 'RAZANAPARANY', 'Henintsoa Hasina', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 91 590 72', '2000-11-21', 'Pigiste', '2023-03-22', NULL, 'Tel1001.jpg', '101242193263', '06:45'),
(2950, 'T01075', 'Opérateur Anglophone', 'Production - Back Office', 'RABEHASY', 'Hasina Anjaratiana', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 90 517 09', '1994-03-04', 'Pigiste', '2023-03-22', NULL, 'Tel1001.jpg', '203011026324', '06:45'),
(2951, 'T01076', 'Opérateur Anglophone', 'Production - Back Office', 'ANDRIANOMENJANAHARY', 'Jean de Dieu Donne', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '032 21 013 52', '2000-01-27', 'Pigiste', '2023-03-22', NULL, 'Tel1001.jpg', '312091013259', '06:45'),
(2952, 'T01077', 'Opérateur Anglophone', 'Production - Back Office', 'RAHARISON', 'Anjaratiana', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 59 956 86', '1999-07-27', 'Pigiste', '2023-03-22', NULL, 'Tel1001.jpg', '117071023682', '06:45'),
(2953, 'T01078', 'Opérateur Anglophone', 'Production - Back Office', 'ANDRIAMALAZA', 'Kasy Baby Gaetan', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '032 89 472 82', '2000-12-27', 'Pigiste', '2023-03-22', NULL, 'Tel1001.jpg', '712081001103', '06:45'),
(2954, 'T01079', 'Opérateur Anglophone', 'Production - Back Office', 'RANAIVOHARINDRANTO', 'Famenoherinjaka Berthieu Honore', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 89 88054', '1998-11-08', 'Pigiste', '2023-03-22', NULL, 'Tel1001.jpg', '114011038385', '06:45'),
(2955, 'T01080', 'Opérateur Anglophone', 'Production - Back Office', 'FABIEN', '', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 10 254 00', '1996-12-31', 'Pigiste', '2023-03-22', NULL, 'Tel1001.jpg', '715051027517', '06:45'),
(2956, 'T01081', 'Opérateur Anglophone', 'Production - Back Office', 'FANOMEZANTSOA', 'Sahia Joariniaina', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 99 707 80', '2002-03-07', 'Pigiste', '2023-03-22', NULL, 'Tel1001.jpg', '117071026632', '06:45'),
(2957, 'T01083', 'Opérateur Anglophone', 'Production - Back Office', 'RAHARIMAHERISOA', 'Kanto Lafatra Heritsaina', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 68 546 82', '2004-01-12', 'Pigiste', '2023-03-22', NULL, 'Tel1001.jpg', '117052021882', '06:45'),
(2958, 'T01085', 'Opérateur Anglophone', 'Production - Back Office', 'SOLOHERINIRINA', 'Princia Mamitiana', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '038 41 817 27', '2001-09-12', 'Pigiste', '2023-03-22', NULL, 'Tel1001.jpg', '117032023443', '06:45'),
(2959, 'T01087', 'Opérateur Anglophone', 'Production - Back Office', 'ANDRIANARISOA', 'Manda NyAina Renaud', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '032 22 324 80', '1999-03-04', 'Pigiste', '2023-03-22', NULL, 'Tel1001.jpg', '117051015989', '06:45'),
(2960, 'T01089', 'Technicien Developpeur', 'Informatique', 'RATOLOTRA', 'Celestin', 'tolotra@telesourcia.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 88 259 67', '1998-01-17', 'CDI', '2023-06-01', '', 'Tel1001.jpg', '223031005181', '08:00'),
(2961, 'T01090', 'Assistante RH', 'Ressources Humaines', 'RAMAHENINA', 'Tatiana Malalanirina Ariel', 'r.tatiana@telesourcia.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'ADMIN', '', NULL, 'ACTIF', 'Femme', '034 33 694 60', '1997-05-16', 'CDI', '2023-08-28', '', 'Tel1001.jpg', '401032051864', '07:00'),
(2962, 'T01091', 'ARH', 'RH', 'ANDRIAMIHARY', 'Soloniaina Tsiaro Nomena', 'andriamihary.nomena@telesourcia.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'ADMIN', '', NULL, 'ACTIF', 'Femme', '034 07 767 41', '2000-05-16', 'CDI', '2023-09-05', '', 'Tel1001.jpg', '101982106592', '08:00'),
(2964, 'T01093', 'TL\r\n', 'Direction', 'test1', 'jean', '12admin@example.com', '9db67e5278f2ace29e9c5a1434edbd006e71650b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '0327529230', '2022-04-07', 'CDI', '2023-09-27', '', 'T010931.jpg', '223031005181', '09:49');

-- --------------------------------------------------------

--
-- Structure de la table `employee_file`
--

DROP TABLE IF EXISTS `employee_file`;
CREATE TABLE IF NOT EXISTS `employee_file` (
  `id` int(11) NOT NULL,
  `em_id` varchar(64) DEFAULT NULL,
  `file_title` varchar(512) DEFAULT NULL,
  `file_url` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `emp_assets`
--

DROP TABLE IF EXISTS `emp_assets`;
CREATE TABLE IF NOT EXISTS `emp_assets` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `assets_id` int(11) NOT NULL,
  `given_date` date NOT NULL,
  `return_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `emp_experience`
--

DROP TABLE IF EXISTS `emp_experience`;
CREATE TABLE IF NOT EXISTS `emp_experience` (
  `id` int(11) NOT NULL,
  `emp_id` varchar(256) DEFAULT NULL,
  `exp_company` varchar(128) DEFAULT NULL,
  `exp_com_position` varchar(128) DEFAULT NULL,
  `exp_com_address` varchar(128) DEFAULT NULL,
  `exp_workduration` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `emp_leave`
--

DROP TABLE IF EXISTS `emp_leave`;
CREATE TABLE IF NOT EXISTS `emp_leave` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `em_id` varchar(20) DEFAULT NULL,
  `id_conge` varchar(200) NOT NULL,
  `typeid` varchar(200) NOT NULL,
  `leave_type` varchar(64) DEFAULT NULL,
  `start_date` varchar(64) DEFAULT NULL,
  `end_date` varchar(64) DEFAULT NULL,
  `leave_duration` varchar(128) DEFAULT NULL,
  `apply_date` varchar(64) DEFAULT NULL,
  `reason` varchar(1024) DEFAULT NULL,
  `leave_status` enum('Approuvé','En attente','Rejeté') NOT NULL DEFAULT 'En attente',
  `coms_n` text NOT NULL,
  `leave_status_rh` enum('Approuvé','En attente','Rejeté') NOT NULL DEFAULT 'En attente',
  `coms_rh` text NOT NULL,
  `id_nplus` varchar(100) NOT NULL,
  `pj` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `emp_leave`
--

INSERT INTO `emp_leave` (`id`, `em_id`, `id_conge`, `typeid`, `leave_type`, `start_date`, `end_date`, `leave_duration`, `apply_date`, `reason`, `leave_status`, `coms_n`, `leave_status_rh`, `coms_rh`, `id_nplus`, `pj`) VALUES
(11, 'T01089', '3004202410897', 'Sans solde', 'Full Day', '02/05/2024', '03/05/2024', '1 jour', '30/04/2024', 'personnel', 'Approuvé', '', 'En attente', '', 'HARIFETRA  Tovonintsoa', '');

-- --------------------------------------------------------

--
-- Structure de la table `emp_penalty`
--

DROP TABLE IF EXISTS `emp_penalty`;
CREATE TABLE IF NOT EXISTS `emp_penalty` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `penalty_id` int(11) NOT NULL,
  `penalty_desc` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `emp_salary`
--

DROP TABLE IF EXISTS `emp_salary`;
CREATE TABLE IF NOT EXISTS `emp_salary` (
  `id` int(11) NOT NULL,
  `emp_id` varchar(64) DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  `total` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `emp_salary`
--

INSERT INTO `emp_salary` (`id`, `emp_id`, `type_id`, `total`) VALUES
(1, 'Doe1754', 2, '5500'),
(2, 'Doe1753', 2, '13500'),
(3, 'Soy1332', 2, '18100'),
(4, 'Rob1472', 2, '5565'),
(5, 'Moo1402', 2, '6900'),
(6, 'Smi1266', 2, '7950'),
(7, 'Moo1634', 2, '8600'),
(8, 'Joh1474', 2, '11000'),
(9, 'Tho1044', 2, '7000'),
(10, 'Den1745', 2, '5600');

-- --------------------------------------------------------

--
-- Structure de la table `emp_training`
--

DROP TABLE IF EXISTS `emp_training`;
CREATE TABLE IF NOT EXISTS `emp_training` (
  `id` int(11) NOT NULL,
  `trainig_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `field_visit`
--

DROP TABLE IF EXISTS `field_visit`;
CREATE TABLE IF NOT EXISTS `field_visit` (
  `id` int(11) NOT NULL,
  `project_id` varchar(256) NOT NULL,
  `emp_id` varchar(64) DEFAULT NULL,
  `field_location` varchar(512) NOT NULL,
  `start_date` varchar(64) DEFAULT NULL,
  `approx_end_date` varchar(28) NOT NULL,
  `total_days` varchar(64) DEFAULT NULL,
  `notes` varchar(500) NOT NULL,
  `actual_return_date` varchar(28) NOT NULL,
  `status` enum('Approved','Not Approve','Rejected') NOT NULL DEFAULT 'Not Approve',
  `attendance_updated` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `hierarchie`
--

DROP TABLE IF EXISTS `hierarchie`;
CREATE TABLE IF NOT EXISTS `hierarchie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `em_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `hierarchie`
--

INSERT INTO `hierarchie` (`id`, `em_id`) VALUES
(58, 'T00003'),
(56, 'T00001'),
(57, 'T00075');

-- --------------------------------------------------------

--
-- Structure de la table `holiday`
--

DROP TABLE IF EXISTS `holiday`;
CREATE TABLE IF NOT EXISTS `holiday` (
  `id` int(11) NOT NULL,
  `holiday_name` varchar(256) DEFAULT NULL,
  `from_date` varchar(64) DEFAULT NULL,
  `to_date` varchar(64) DEFAULT NULL,
  `number_of_days` varchar(64) DEFAULT NULL,
  `year` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `holiday`
--

INSERT INTO `holiday` (`id`, `holiday_name`, `from_date`, `to_date`, `number_of_days`, `year`) VALUES
(1, 'New Year\'s Eve', '2021-12-30', '2022-01-31', '32', '12-2021'),
(3, 'New Year\'s Day', '2022-01-01', '2022-01-02', '1', '01-2022'),
(6, 'Thanksgiving', '2021-11-23', '2021-11-26', '3', '11-2021'),
(7, 'Halloween', '2021-10-31', '2021-10-31', '0', '10-2021');

-- --------------------------------------------------------

--
-- Structure de la table `leave_types`
--

DROP TABLE IF EXISTS `leave_types`;
CREATE TABLE IF NOT EXISTS `leave_types` (
  `type_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `leave_day` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `leave_types`
--

INSERT INTO `leave_types` (`type_id`, `name`, `leave_day`, `status`) VALUES
(1, 'Avec solde', '2.5', 1),
(2, 'Sans solde', '', 1),
(3, 'Ecxeptionnel', '', 1),
(4, 'Maladie', '', 1);

-- --------------------------------------------------------

--
-- Structure de la table `loan`
--

DROP TABLE IF EXISTS `loan`;
CREATE TABLE IF NOT EXISTS `loan` (
  `id` int(11) NOT NULL,
  `emp_id` varchar(256) DEFAULT NULL,
  `amount` varchar(256) DEFAULT NULL,
  `interest_percentage` varchar(256) DEFAULT NULL,
  `total_amount` varchar(64) DEFAULT NULL,
  `total_pay` varchar(64) DEFAULT NULL,
  `total_due` varchar(64) DEFAULT NULL,
  `installment` varchar(256) DEFAULT NULL,
  `loan_number` varchar(256) DEFAULT NULL,
  `loan_details` varchar(256) DEFAULT NULL,
  `approve_date` varchar(256) DEFAULT NULL,
  `install_period` varchar(256) DEFAULT NULL,
  `status` enum('Granted','Deny','Pause','Done') NOT NULL DEFAULT 'Pause',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `loan`
--

INSERT INTO `loan` (`id`, `emp_id`, `amount`, `interest_percentage`, `total_amount`, `total_pay`, `total_due`, `installment`, `loan_number`, `loan_details`, `approve_date`, `install_period`, `status`) VALUES
(1, 'Doe1753', '65000', NULL, NULL, '10833', '54167', '10833', '19073382', 'this is a demo loan test for demo purpose', '2021-04-20', '5', 'Granted');

-- --------------------------------------------------------

--
-- Structure de la table `loan_installment`
--

DROP TABLE IF EXISTS `loan_installment`;
CREATE TABLE IF NOT EXISTS `loan_installment` (
  `id` int(11) NOT NULL,
  `loan_id` int(11) NOT NULL,
  `emp_id` varchar(64) DEFAULT NULL,
  `loan_number` varchar(256) DEFAULT NULL,
  `install_amount` varchar(256) DEFAULT NULL,
  `pay_amount` varchar(64) DEFAULT NULL,
  `app_date` varchar(256) DEFAULT NULL,
  `receiver` varchar(256) DEFAULT NULL,
  `install_no` varchar(256) DEFAULT NULL,
  `notes` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `loan_installment`
--

INSERT INTO `loan_installment` (`id`, `loan_id`, `emp_id`, `loan_number`, `install_amount`, `pay_amount`, `app_date`, `receiver`, `install_no`, `notes`) VALUES
(32, 1, 'Doe1753', '19073382', '10833', NULL, '2021-11-30', NULL, '5', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `logistic_asset`
--

DROP TABLE IF EXISTS `logistic_asset`;
CREATE TABLE IF NOT EXISTS `logistic_asset` (
  `log_id` int(11) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `qty` varchar(64) DEFAULT NULL,
  `entry_date` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `logistic_asset`
--

INSERT INTO `logistic_asset` (`log_id`, `name`, `qty`, `entry_date`) VALUES
(1, 'Lubricant', '30', '12/25/17');

-- --------------------------------------------------------

--
-- Structure de la table `logistic_assign`
--

DROP TABLE IF EXISTS `logistic_assign`;
CREATE TABLE IF NOT EXISTS `logistic_assign` (
  `ass_id` int(11) NOT NULL,
  `asset_id` int(11) NOT NULL,
  `assign_id` varchar(64) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `log_qty` varchar(64) DEFAULT NULL,
  `start_date` varchar(64) DEFAULT NULL,
  `end_date` varchar(64) DEFAULT NULL,
  `back_date` varchar(64) DEFAULT NULL,
  `back_qty` varchar(64) DEFAULT NULL,
  `remarks` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`ass_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `notice`
--

DROP TABLE IF EXISTS `notice`;
CREATE TABLE IF NOT EXISTS `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `file_url` varchar(256) DEFAULT NULL,
  `date` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `notice`
--

INSERT INTO `notice` (`id`, `title`, `file_url`, `date`) VALUES
(1, 'This is a demo notice for all!', 'sample_image.jpg', '2022-01-01'),
(2, 'Office Decorum Notice to Staff Members', 'offnot1.png', '2021-12-21'),
(3, 'Warning for Violation of Office Decorum', 'offnot2.png', '2021-12-27');

-- --------------------------------------------------------

--
-- Structure de la table `notif`
--

DROP TABLE IF EXISTS `notif`;
CREATE TABLE IF NOT EXISTS `notif` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `em_id` varchar(200) NOT NULL,
  `id_conge` varchar(200) NOT NULL,
  `st_emp` int(11) NOT NULL DEFAULT '0',
  `st_n` int(11) NOT NULL DEFAULT '0',
  `st_admin` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `notif`
--

INSERT INTO `notif` (`id`, `em_id`, `id_conge`, `st_emp`, `st_n`, `st_admin`) VALUES
(11, 'T01089', '3004202410897', 1, 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `owner`
--

DROP TABLE IF EXISTS `owner`;
CREATE TABLE IF NOT EXISTS `owner` (
  `id` int(11) NOT NULL,
  `owner_name` varchar(64) NOT NULL,
  `owner_position` varchar(64) DEFAULT NULL,
  `note` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `pay_salary`
--

DROP TABLE IF EXISTS `pay_salary`;
CREATE TABLE IF NOT EXISTS `pay_salary` (
  `pay_id` int(11) NOT NULL,
  `emp_id` varchar(64) DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  `month` varchar(64) DEFAULT NULL,
  `year` varchar(64) DEFAULT NULL,
  `paid_date` varchar(64) DEFAULT NULL,
  `total_days` varchar(64) DEFAULT NULL,
  `basic` varchar(64) DEFAULT NULL,
  `medical` varchar(64) DEFAULT NULL,
  `house_rent` varchar(64) DEFAULT NULL,
  `bonus` varchar(64) DEFAULT NULL,
  `bima` varchar(64) DEFAULT NULL,
  `tax` varchar(64) DEFAULT NULL,
  `provident_fund` varchar(64) DEFAULT NULL,
  `loan` varchar(64) DEFAULT NULL,
  `total_pay` varchar(128) DEFAULT NULL,
  `addition` int(11) NOT NULL,
  `diduction` int(11) NOT NULL,
  `status` enum('Paid','Process') DEFAULT 'Process',
  `paid_type` enum('Hand Cash','Bank') NOT NULL DEFAULT 'Bank',
  PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `pay_salary`
--

INSERT INTO `pay_salary` (`pay_id`, `emp_id`, `type_id`, `month`, `year`, `paid_date`, `total_days`, `basic`, `medical`, `house_rent`, `bonus`, `bima`, `tax`, `provident_fund`, `loan`, `total_pay`, `addition`, `diduction`, `status`, `paid_type`) VALUES
(1, 'Doe1754', 0, 'November', '2021', '2021-11-30', '208', '5500', NULL, NULL, NULL, NULL, NULL, NULL, '0', '5499.52', 0, 0, 'Paid', 'Bank'),
(2, 'Doe1753', 0, 'November', '2021', '2021-11-30', '184', '13500', NULL, NULL, NULL, NULL, NULL, NULL, '10833', '2667.08', 0, 10833, 'Paid', 'Bank'),
(3, 'Smi1266', 0, 'November', '2021', '2021-11-30', '184', '7950', NULL, NULL, NULL, NULL, NULL, NULL, '0', '7950.64', 0, 0, 'Paid', 'Bank'),
(4, 'Moo1634', 0, 'November', '2021', '2021-12-01', '184', '8600', NULL, NULL, NULL, NULL, NULL, NULL, '0', '8600.16', 0, 0, 'Paid', 'Hand Cash'),
(5, 'Tho1044', 0, 'November', '2021', '2021-12-01', '184', '7000', NULL, NULL, NULL, NULL, NULL, NULL, '0', '6999.36', 0, 0, 'Paid', 'Bank'),
(6, 'Den1745', 0, 'December', '2022', '2021-12-31', '208', '5600', NULL, NULL, NULL, NULL, NULL, NULL, '0', '5599.36', 0, 0, 'Paid', 'Bank');

-- --------------------------------------------------------

--
-- Structure de la table `penalty`
--

DROP TABLE IF EXISTS `penalty`;
CREATE TABLE IF NOT EXISTS `penalty` (
  `id` int(11) NOT NULL,
  `penalty_name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `planning`
--

DROP TABLE IF EXISTS `planning`;
CREATE TABLE IF NOT EXISTS `planning` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `em_id` varchar(50) NOT NULL,
  `type` enum('DAY','PM','NIGHT') NOT NULL DEFAULT 'DAY',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `planning`
--

INSERT INTO `planning` (`id`, `em_id`, `type`) VALUES
(9, 'T00609', 'PM'),
(10, 'T01078', 'NIGHT'),
(11, 'T00912', 'PM'),
(12, 'T00873', 'DAY'),
(13, 'T01055', 'DAY'),
(14, 'T00729', 'DAY'),
(15, 'T01005', 'DAY'),
(16, 'T00832', 'DAY'),
(17, 'T01020', 'DAY'),
(18, 'T00559', 'DAY'),
(19, 'T01091', 'DAY'),
(20, 'T01063', 'DAY'),
(21, 'T00954', 'DAY'),
(22, 'T01015', 'DAY'),
(23, 'T01062', 'DAY'),
(24, 'T01071', 'DAY'),
(25, 'T01087', 'DAY'),
(26, 'T00870', 'DAY'),
(27, 'T00975', 'DAY'),
(28, 'T01010', 'DAY'),
(29, 'T00935', 'DAY'),
(30, 'T01012', 'DAY'),
(31, 'T00904', 'DAY'),
(32, 'T01048', 'DAY'),
(33, 'T00391', 'DAY'),
(34, 'T00933', 'DAY'),
(35, 'T01076', 'DAY'),
(36, 'T00222', 'DAY'),
(37, 'T00875', 'DAY'),
(38, 'T00003', 'DAY'),
(39, 'T00918', 'DAY'),
(40, 'T00973', 'DAY'),
(41, 'T00867', 'DAY'),
(42, 'T00508', 'DAY'),
(43, 'T01036', 'DAY'),
(44, 'T00487', 'DAY'),
(45, 'T01080', 'DAY'),
(46, 'T01057', 'DAY'),
(47, 'T01001', 'DAY'),
(48, 'T00602', 'DAY');

-- --------------------------------------------------------

--
-- Structure de la table `pointage`
--

DROP TABLE IF EXISTS `pointage`;
CREATE TABLE IF NOT EXISTS `pointage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sName` varchar(255) DEFAULT NULL,
  `Date` varchar(200) DEFAULT NULL,
  `Time_in` varchar(100) DEFAULT NULL,
  `Time_out` varchar(100) DEFAULT NULL,
  `Time_diff` varchar(100) DEFAULT NULL,
  `idp` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pointage`
--

INSERT INTO `pointage` (`id`, `sName`, `Date`, `Time_in`, `Time_out`, `Time_diff`, `idp`) VALUES
(1, 'T01057', '27/12/2023', '08:00:03', '17:09:30', '09:9:27', ''),
(2, 'T01057', '28/12/2023', '08:04:10', '17:01:01', '08:56:51', ''),
(3, 'T00054', '27/12/2023', '08:34:19', '17:36:22', '09:2:3', ''),
(4, 'T00054', '28/12/2023', '06:58:05', '12:43:54', '05:45:49', ''),
(5, 'T00147', '27/12/2023', '07:32:32', '17:12:52', '09:40:20', ''),
(6, 'T00147', '28/12/2023', '07:57:40', '19:27:32', '11:29:52', ''),
(7, 'T00172', '27/12/2023', '06:57:22', '17:06:24', '10:9:2', ''),
(8, 'T00172', '28/12/2023', '06:47:55', '17:13:28', '10:25:33', ''),
(9, 'T00183', '27/12/2023', '05:42:45', '17:51:40', '12:8:55', ''),
(10, 'T00183', '28/12/2023', '05:07:27', '18:04:19', '12:56:52', ''),
(11, 'T00222', '27/12/2023', '08:20:49', '18:08:16', '09:47:27', ''),
(12, 'T00222', '28/12/2023', '08:01:04', '19:04:06', '11:3:2', ''),
(13, 'T00252', '27/12/2023', '08:03:46', '17:38:06', '09:34:20', ''),
(14, 'T00252', '28/12/2023', '08:00:58', '17:26:26', '09:25:28', ''),
(15, 'T00253', '27/12/2023', '06:57:51', '16:00:43', '09:2:52', ''),
(16, 'T00253', '28/12/2023', '06:59:01', '16:03:04', '09:4:3', ''),
(17, 'T00266', '27/12/2023', '06:20:30', '15:43:21', '09:22:51', ''),
(18, 'T00266', '28/12/2023', '06:24:56', '15:45:04', '09:20:8', ''),
(19, 'T00386', '27/12/2023', '05:59:33', '05:59:33', '00:0:0', ''),
(20, 'T00386', '28/12/2023', '06:02:36', '11:31:30', '05:28:54', ''),
(21, 'T00390', '27/12/2023', '06:20:15', '16:39:55', '10:19:40', ''),
(22, 'T00390', '28/12/2023', '06:24:18', '16:33:32', '10:9:14', ''),
(23, 'T00452', '27/12/2023', '06:43:05', '15:51:07', '09:8:2', ''),
(24, 'T00452', '28/12/2023', '06:37:15', '15:47:28', '09:10:13', ''),
(25, 'T00455', '27/12/2023', '06:32:36', '15:46:03', '09:13:27', ''),
(26, 'T00455', '28/12/2023', '06:26:39', '15:43:59', '09:17:20', ''),
(27, 'T00468', '27/12/2023', '06:27:45', '15:42:32', '09:14:47', ''),
(28, 'T00468', '28/12/2023', '06:34:05', '15:42:34', '09:8:29', ''),
(29, 'T00470', '27/12/2023', '06:47:15', '14:33:37', '07:46:22', ''),
(30, 'T00470', '28/12/2023', '06:43:05', '14:32:27', '07:49:22', ''),
(31, 'T00478', '27/12/2023', '06:16:47', '15:43:59', '09:27:12', ''),
(32, 'T00478', '28/12/2023', '06:21:18', '15:44:30', '09:23:12', ''),
(33, 'T00484', '27/12/2023', '06:37:12', '17:27:11', '10:49:59', ''),
(34, 'T00484', '28/12/2023', '06:58:01', '18:04:35', '11:6:34', ''),
(35, 'T00492', '27/12/2023', '06:38:54', '06:38:54', '00:0:0', ''),
(36, 'T00492', '28/12/2023', '06:45:29', '15:45:33', '09:0:4', ''),
(37, 'T00497', '27/12/2023', '07:47:05', '16:35:40', '08:48:35', ''),
(38, 'T00497', '28/12/2023', '16:31:38', '16:31:38', '00:0:0', ''),
(39, 'T00501', '27/12/2023', '06:17:54', '17:43:38', '11:25:44', ''),
(40, 'T00501', '28/12/2023', '06:15:28', '17:43:34', '11:28:6', ''),
(41, 'T00529', '27/12/2023', '06:33:50', '06:33:50', '00:0:0', ''),
(42, 'T00529', '28/12/2023', '06:36:06', '17:43:37', '11:7:31', ''),
(43, 'T00534', '27/12/2023', '06:43:23', '15:58:51', '09:15:28', ''),
(44, 'T00534', '28/12/2023', '06:45:20', '15:52:25', '09:7:5', ''),
(45, 'T00539', '27/12/2023', '06:22:50', '15:42:25', '09:19:35', ''),
(46, 'T00539', '28/12/2023', '06:39:01', '15:42:37', '09:3:36', ''),
(47, 'T00540', '27/12/2023', '06:37:39', '15:46:12', '09:8:33', ''),
(48, 'T00540', '28/12/2023', '06:37:10', '15:45:11', '09:8:1', ''),
(49, 'T00546', '27/12/2023', '06:50:52', '15:42:16', '08:51:24', ''),
(50, 'T00546', '28/12/2023', '06:39:56', '06:39:56', '00:0:0', ''),
(51, 'T00557', '27/12/2023', '05:43:08', '15:47:00', '10:3:52', ''),
(52, 'T00557', '28/12/2023', '05:53:02', '15:49:18', '09:56:16', ''),
(53, 'T00559', '27/12/2023', '06:50:56', '15:42:18', '08:51:22', ''),
(54, 'T00559', '28/12/2023', '06:40:01', '15:42:39', '09:2:38', ''),
(55, 'T00561', '27/12/2023', '06:35:51', '17:44:06', '11:8:15', ''),
(56, 'T00561', '28/12/2023', '06:29:05', '17:45:34', '11:16:29', ''),
(57, 'T00567', '27/12/2023', '06:42:15', '15:43:24', '09:1:9', ''),
(58, 'T00567', '28/12/2023', '06:39:11', '15:44:15', '09:5:4', ''),
(59, 'T00590', '27/12/2023', '06:40:33', '15:43:48', '09:3:15', ''),
(60, 'T00590', '28/12/2023', '06:52:30', '15:43:05', '08:50:35', ''),
(61, 'T00596', '27/12/2023', '06:20:53', '15:42:58', '09:22:5', ''),
(62, 'T00597', '28/12/2023', '06:27:20', '15:44:17', '09:16:57', ''),
(63, 'T00606', '27/12/2023', '06:46:37', '06:46:38', '00:0:1', ''),
(64, 'T00606', '28/12/2023', '06:48:13', '15:43:19', '08:55:6', ''),
(65, 'T00613', '27/12/2023', '06:22:53', '15:42:28', '09:19:35', ''),
(66, 'T00613', '28/12/2023', '06:33:19', '15:42:31', '09:9:12', ''),
(67, 'T00615', '27/12/2023', '06:31:56', '15:45:28', '09:13:32', ''),
(68, 'T00615', '28/12/2023', '06:31:49', '15:45:01', '09:13:12', ''),
(69, 'T00628', '27/12/2023', '06:37:26', '17:43:18', '11:5:52', ''),
(70, 'T00630', '27/12/2023', '06:34:19', '15:42:30', '09:8:11', ''),
(71, 'T00630', '28/12/2023', '06:39:28', '15:42:48', '09:3:20', ''),
(72, 'T00641', '27/12/2023', '06:29:56', '15:43:56', '09:14:0', ''),
(73, 'T00641', '28/12/2023', '06:27:26', '15:43:52', '09:16:26', ''),
(74, 'T00647', '27/12/2023', '06:15:22', '17:44:10', '11:28:48', ''),
(75, 'T00647', '28/12/2023', '06:16:36', '17:48:09', '11:31:33', ''),
(76, 'T00655', '27/12/2023', '06:22:08', '15:42:23', '09:20:15', ''),
(77, 'T00655', '28/12/2023', '06:28:39', '15:43:00', '09:14:21', ''),
(78, 'T00674', '27/12/2023', '06:32:27', '14:33:43', '08:1:16', ''),
(79, 'T00674', '28/12/2023', '06:43:43', '14:32:01', '07:48:18', ''),
(80, 'T00698', '27/12/2023', '06:34:13', '15:43:46', '09:9:33', ''),
(81, 'T00698', '28/12/2023', '06:32:16', '15:44:05', '09:11:49', ''),
(82, 'T00709', '27/12/2023', '06:12:19', '16:39:36', '10:27:17', ''),
(83, 'T00709', '28/12/2023', '06:01:35', '16:32:56', '10:31:21', ''),
(84, 'T00721', '28/12/2023', '11:59:08', '15:43:16', '03:44:8', ''),
(85, 'T00722', '27/12/2023', '06:40:04', '15:43:50', '09:3:46', ''),
(86, 'T00722', '28/12/2023', '06:32:40', '15:45:26', '09:12:46', ''),
(87, 'T00723', '27/12/2023', '06:29:52', '15:42:48', '09:12:56', ''),
(88, 'T00723', '28/12/2023', '06:46:20', '15:42:50', '08:56:30', ''),
(89, 'T00726', '27/12/2023', '06:40:51', '15:58:58', '09:18:7', ''),
(90, 'T00726', '28/12/2023', '06:29:16', '15:45:02', '09:15:46', ''),
(91, 'T00727', '27/12/2023', '08:11:39', '18:00:44', '09:49:5', ''),
(92, 'T00729', '27/12/2023', '06:52:13', '16:09:08', '09:16:55', ''),
(93, 'T00729', '28/12/2023', '06:59:06', '16:25:59', '09:26:53', ''),
(94, 'T00766', '27/12/2023', '06:32:23', '15:45:11', '09:12:48', ''),
(95, 'T00766', '28/12/2023', '06:35:30', '15:43:54', '09:8:24', ''),
(96, 'T00777', '27/12/2023', '05:47:10', '14:31:18', '08:44:8', ''),
(97, 'T00777', '28/12/2023', '05:56:09', '14:38:40', '08:42:31', ''),
(98, 'T00779', '27/12/2023', '06:33:45', '15:42:41', '09:8:56', ''),
(99, 'T00784', '27/12/2023', '06:39:36', '17:05:58', '10:26:22', ''),
(100, 'T00784', '28/12/2023', '06:34:46', '17:14:50', '10:40:4', ''),
(101, 'T00785', '27/12/2023', '06:24:34', '15:48:04', '09:23:30', ''),
(102, 'T00785', '28/12/2023', '06:26:43', '15:45:54', '09:19:11', ''),
(103, 'T00787', '27/12/2023', '06:43:27', '15:58:03', '09:14:36', ''),
(104, 'T00787', '28/12/2023', '06:44:59', '15:52:26', '09:7:27', ''),
(105, 'T00797', '27/12/2023', '06:26:34', '15:43:39', '09:17:5', ''),
(106, 'T00797', '28/12/2023', '06:29:03', '15:43:28', '09:14:25', ''),
(107, 'T00805', '27/12/2023', '06:25:15', '15:47:46', '09:22:31', ''),
(108, 'T00808', '27/12/2023', '10:25:49', '15:44:32', '05:18:43', ''),
(109, 'T00808', '28/12/2023', '06:48:25', '15:45:09', '08:56:44', ''),
(110, 'T00822', '27/12/2023', '06:40:47', '15:44:07', '09:3:20', ''),
(111, 'T00822', '28/12/2023', '06:41:32', '15:44:24', '09:2:52', ''),
(112, 'T00832', '27/12/2023', '06:41:30', '15:42:43', '09:1:13', ''),
(113, 'T00832', '28/12/2023', '06:42:56', '15:43:01', '09:0:5', ''),
(114, 'T00846', '27/12/2023', '06:39:59', '15:43:11', '09:3:12', ''),
(115, 'T00846', '28/12/2023', '06:38:19', '15:43:37', '09:5:18', ''),
(116, 'T00851', '27/12/2023', '06:29:25', '16:45:33', '10:16:8', ''),
(117, 'T00851', '28/12/2023', '06:34:54', '16:43:52', '10:8:58', ''),
(118, 'T00854', '27/12/2023', '06:43:15', '17:04:05', '10:20:50', ''),
(119, 'T00854', '28/12/2023', '06:42:53', '17:03:31', '10:20:38', ''),
(120, 'T00861', '27/12/2023', '06:25:12', '15:45:08', '09:19:56', ''),
(121, 'T00861', '28/12/2023', '06:30:00', '15:47:35', '09:17:35', ''),
(122, 'T00868', '27/12/2023', '06:32:38', '15:43:44', '09:11:6', ''),
(123, 'T00868', '28/12/2023', '06:26:34', '15:42:46', '09:16:12', ''),
(124, 'T00869', '27/12/2023', '06:36:10', '15:43:36', '09:7:26', ''),
(125, 'T00869', '28/12/2023', '06:33:29', '15:43:12', '09:9:43', ''),
(126, 'T00870', '27/12/2023', '06:32:57', '17:43:34', '11:10:37', ''),
(127, 'T00870', '28/12/2023', '06:38:34', '17:44:22', '11:5:48', ''),
(128, 'T00873', '28/12/2023', '15:26:52', '15:26:52', '00:0:0', ''),
(129, 'T00875', '27/12/2023', '06:15:53', '17:46:36', '11:30:43', ''),
(130, 'T00875', '28/12/2023', '06:17:51', '17:48:50', '11:30:59', ''),
(131, 'T00876', '27/12/2023', '06:39:45', '17:44:15', '11:4:30', ''),
(132, 'T00876', '28/12/2023', '06:46:47', '17:45:31', '10:58:44', ''),
(133, 'T00883', '27/12/2023', '06:44:47', '15:47:55', '09:3:8', ''),
(134, 'T00883', '28/12/2023', '06:44:51', '15:50:28', '09:5:37', ''),
(135, 'T00885', '27/12/2023', '05:01:15', '18:06:04', '13:4:49', ''),
(136, 'T00885', '28/12/2023', '05:01:38', '17:36:54', '12:35:16', ''),
(137, 'T00888', '27/12/2023', '06:39:53', '14:28:35', '07:48:42', ''),
(138, 'T00888', '28/12/2023', '06:40:26', '14:29:21', '07:48:55', ''),
(139, 'T00889', '27/12/2023', '06:22:01', '16:47:33', '10:25:32', ''),
(140, 'T00889', '28/12/2023', '06:27:22', '16:48:55', '10:21:33', ''),
(141, 'T00893', '27/12/2023', '06:34:24', '15:42:36', '09:8:12', ''),
(142, 'T00893', '28/12/2023', '06:42:03', '15:42:43', '09:0:40', ''),
(143, 'T00895', '27/12/2023', '06:42:39', '14:31:57', '07:49:18', ''),
(144, 'T00895', '28/12/2023', '06:41:06', '14:32:32', '07:51:26', ''),
(145, 'T00897', '27/12/2023', '06:42:36', '15:44:25', '09:1:49', ''),
(146, 'T00897', '28/12/2023', '06:42:59', '15:43:31', '09:0:32', ''),
(147, 'T00898', '27/12/2023', '06:34:17', '15:44:04', '09:9:47', ''),
(148, 'T00898', '28/12/2023', '06:39:25', '15:43:07', '09:3:42', ''),
(149, 'T00904', '27/12/2023', '06:37:24', '15:43:53', '09:6:29', ''),
(150, 'T00904', '28/12/2023', '06:47:50', '15:43:40', '08:55:50', ''),
(151, 'T00905', '27/12/2023', '06:10:57', '15:43:42', '09:32:45', ''),
(152, 'T00905', '28/12/2023', '06:22:57', '15:43:24', '09:20:27', ''),
(153, 'T00907', '27/12/2023', '06:27:42', '16:45:44', '10:18:2', ''),
(154, 'T00907', '28/12/2023', '06:30:14', '16:46:04', '10:15:50', ''),
(155, 'T00911', '27/12/2023', '06:31:04', '17:46:34', '11:15:30', ''),
(156, 'T00911', '28/12/2023', '06:30:46', '17:46:27', '11:15:41', ''),
(157, 'T00916', '27/12/2023', '06:30:31', '16:45:53', '10:15:22', ''),
(158, 'T00916', '28/12/2023', '06:32:52', '16:49:38', '10:16:46', ''),
(159, 'T00917', '27/12/2023', '06:25:01', '15:43:32', '09:18:31', ''),
(160, 'T00917', '28/12/2023', '06:38:11', '15:44:07', '09:5:56', ''),
(161, 'T00918', '27/12/2023', '05:57:26', '17:46:19', '11:48:53', ''),
(162, 'T00918', '28/12/2023', '06:15:37', '17:46:32', '11:30:55', ''),
(163, 'T00919', '27/12/2023', '06:32:02', '15:43:33', '09:11:31', ''),
(164, 'T00919', '28/12/2023', '06:37:20', '15:42:45', '09:5:25', ''),
(165, 'T00922', '27/12/2023', '08:51:02', '08:51:02', '00:0:0', ''),
(166, 'T00922', '28/12/2023', '08:49:44', '17:59:52', '09:10:8', ''),
(167, 'T00927', '27/12/2023', '06:15:27', '17:44:37', '11:29:10', ''),
(168, 'T00927', '28/12/2023', '06:16:46', '17:43:28', '11:26:42', ''),
(169, 'T00930', '27/12/2023', '06:33:03', '15:50:13', '09:17:10', ''),
(170, 'T00930', '28/12/2023', '06:41:56', '15:49:02', '09:7:6', ''),
(171, 'T00935', '28/12/2023', '15:15:49', '15:15:49', '00:0:0', ''),
(172, 'T00963', '27/12/2023', '06:30:28', '06:30:28', '00:0:0', ''),
(173, 'T00963', '28/12/2023', '06:37:29', '15:42:40', '09:5:11', ''),
(174, 'T00966', '27/12/2023', '06:27:48', '15:42:35', '09:14:47', ''),
(175, 'T00966', '28/12/2023', '06:23:22', '15:42:58', '09:19:36', ''),
(176, 'T00972', '27/12/2023', '06:44:19', '15:48:49', '09:4:30', ''),
(177, 'T00972', '28/12/2023', '06:35:35', '15:49:05', '09:13:30', ''),
(178, 'T01015', '27/12/2023', '06:27:52', '15:42:46', '09:14:54', ''),
(179, 'T01015', '28/12/2023', '06:23:19', '15:42:52', '09:19:33', ''),
(180, 'T01018', '27/12/2023', '06:44:28', '15:42:20', '08:57:52', ''),
(181, 'T01018', '28/12/2023', '06:53:06', '15:42:25', '08:49:19', ''),
(182, 'T01019', '28/12/2023', '06:33:34', '15:42:54', '09:9:20', ''),
(183, 'T01020', '27/12/2023', '06:25:17', '16:47:19', '10:22:2', ''),
(184, 'T01020', '28/12/2023', '06:17:05', '16:49:45', '10:32:40', ''),
(185, 'T01024', '27/12/2023', '06:31:17', '15:44:39', '09:13:22', ''),
(186, 'T01024', '28/12/2023', '06:33:38', '15:44:38', '09:11:0', ''),
(187, 'T01044', '27/12/2023', '06:11:35', '15:52:28', '09:40:53', ''),
(188, 'T01044', '28/12/2023', '05:50:54', '05:50:54', '00:0:0', ''),
(189, 'T01046', '27/12/2023', '06:38:03', '15:45:42', '09:7:39', ''),
(190, 'T01046', '28/12/2023', '06:35:20', '15:46:30', '09:11:10', ''),
(191, 'T01054', '27/12/2023', '06:00:10', '15:44:52', '09:44:42', ''),
(192, 'T01054', '28/12/2023', '06:05:08', '15:46:46', '09:41:38', ''),
(193, 'T01056', '27/12/2023', '05:59:51', '15:44:57', '09:45:6', ''),
(194, 'T01056', '28/12/2023', '06:05:12', '15:46:57', '09:41:45', ''),
(195, 'T01068', '27/12/2023', '06:32:33', '15:44:43', '09:12:10', ''),
(196, 'T01068', '28/12/2023', '06:29:09', '15:46:26', '09:17:17', ''),
(197, 'T01078', '28/12/2023', '14:31:40', '14:31:40', '00:0:0', ''),
(198, 'T01089', '27/12/2023', '15:51:55', '23:56:01', '08:4:6', ''),
(199, 'T01089', '28/12/2023', '15:46:10', '15:46:10', '00:0:0', ''),
(200, 'T01090', '27/12/2023', '06:52:19', '16:11:51', '09:19:32', ''),
(201, 'T01090', '28/12/2023', '06:57:36', '16:30:43', '09:33:7', ''),
(202, 'T01091', '27/12/2023', '08:20:03', '17:04:45', '08:44:42', ''),
(203, 'T01091', '28/12/2023', '07:55:09', '17:03:34', '09:8:25', ''),
(204, 'T01092', '27/12/2023', '07:53:07', '16:56:50', '09:3:43', ''),
(205, 'T01092', '28/12/2023', '07:55:31', '16:54:18', '08:58:47', ''),
(206, 'T01093', '27/12/2023', '07:41:37', '07:41:37', '00:0:0', ''),
(207, 'T01093', '28/12/2023', '07:25:16', '16:29:50', '09:4:34', ''),
(208, 'T01096', '27/12/2023', '06:34:48', '15:52:12', '09:17:24', ''),
(209, 'T01096', '28/12/2023', '06:35:48', '17:02:59', '10:27:11', ''),
(210, 'T01103', '27/12/2023', '15:44:30', '15:44:30', '00:0:0', ''),
(211, 'T01103', '28/12/2023', '15:44:36', '15:44:36', '00:0:0', ''),
(212, 'T01113', '27/12/2023', '06:12:06', '16:44:53', '10:32:47', ''),
(213, 'T01113', '28/12/2023', '06:27:07', '16:43:03', '10:15:56', ''),
(214, 'T01116', '27/12/2023', '06:05:21', '15:49:07', '09:43:46', ''),
(215, 'T01116', '28/12/2023', '06:08:14', '06:08:14', '00:0:0', ''),
(216, 'T01119', '27/12/2023', '07:15:31', '07:15:31', '00:0:0', ''),
(217, 'T01119', '28/12/2023', '07:15:55', '07:15:55', '00:0:0', ''),
(218, 'T01120', '27/12/2023', '06:40:29', '17:04:09', '10:23:40', ''),
(219, 'T01120', '28/12/2023', '06:37:06', '17:09:54', '10:32:48', ''),
(220, 'T01121', '27/12/2023', '06:05:17', '16:48:42', '10:43:25', ''),
(221, 'T01121', '28/12/2023', '06:16:13', '16:47:38', '10:31:25', ''),
(222, 'T00009', '27/12/2023', '14:58:34', '00:12:27', '09:13:53', ''),
(223, 'T00391', '27/12/2023', '15:25:08', '00:05:14', '08:40:6', ''),
(224, 'T00487', '27/12/2023', '15:52:03', '00:11:57', '08:19:54', ''),
(225, 'T00508', '27/12/2023', '15:25:55', '00:07:42', '08:41:47', ''),
(226, 'T00867', '27/12/2023', '15:40:43', '00:11:32', '08:30:49', ''),
(227, 'T00881', '27/12/2023', '15:45:38', '00:11:39', '08:26:1', ''),
(228, 'T00920', '27/12/2023', '14:43:26', '00:08:03', '09:24:37', ''),
(229, 'T00921', '27/12/2023', '15:36:47', '00:11:16', '08:34:29', ''),
(230, 'T00931', '27/12/2023', '15:38:09', '00:08:34', '08:30:25', ''),
(231, 'T00936', '27/12/2023', '15:45:50', '00:11:29', '08:25:39', ''),
(232, 'T00938', '27/12/2023', '15:17:58', '00:09:04', '08:51:6', ''),
(233, 'T00945', '27/12/2023', '15:39:36', '00:08:38', '08:29:2', ''),
(234, 'T00950', '27/12/2023', '15:36:25', '00:07:45', '08:31:20', ''),
(235, 'T00977', '27/12/2023', '15:35:07', '00:10:12', '08:35:5', ''),
(236, 'T00982', '27/12/2023', '15:45:15', '00:10:02', '08:24:47', ''),
(237, 'T00986', '27/12/2023', '15:12:02', '00:10:31', '08:58:29', ''),
(238, 'T00997', '27/12/2023', '15:46:41', '00:10:18', '08:23:37', ''),
(239, 'T00999', '27/12/2023', '15:52:05', '00:10:04', '08:17:59', ''),
(240, 'T01026', '27/12/2023', '15:43:16', '00:08:11', '08:24:55', ''),
(241, 'T01029', '27/12/2023', '15:51:29', '00:10:59', '08:19:30', ''),
(242, 'T01030', '27/12/2023', '16:53:34', '00:11:49', '07:18:15', '');

-- --------------------------------------------------------

--
-- Structure de la table `project`
--

DROP TABLE IF EXISTS `project`;
CREATE TABLE IF NOT EXISTS `project` (
  `id` int(11) NOT NULL,
  `pro_name` varchar(128) DEFAULT NULL,
  `pro_start_date` varchar(128) DEFAULT NULL,
  `pro_end_date` varchar(128) DEFAULT NULL,
  `pro_description` varchar(1024) DEFAULT NULL,
  `pro_summary` varchar(512) DEFAULT NULL,
  `pro_status` enum('upcoming','complete','running') NOT NULL DEFAULT 'running',
  `progress` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `project`
--

INSERT INTO `project` (`id`, `pro_name`, `pro_start_date`, `pro_end_date`, `pro_description`, `pro_summary`, `pro_status`, `progress`) VALUES
(0, 'erererere', 'rererr', 'rererer', ' ', 'rerererer', 'upcoming', NULL),
(1, 'Project X23', 'Jan 4, 2022', 'Feb 2, 2022', ' This is just a demo project! This is just a demo project! This is just a demo project! This is just a demo project!', 'This is just a demo project!', 'upcoming', NULL),
(2, 'Multi User Chat System', 'Jan 1, 2022', 'April 14, 2022', ' You are required to develop a system that supports multi-user chatting with the help of top level technologies.', 'Development of Multi-User Chatting System', 'running', NULL),
(3, 'Image Enhancement Software', 'Dec 10, 2021', 'Mar 20, 2022', 'You are required to develop of computer based software where end users can receive quality results on image enhancement. This particular project requires large number of technologies with proper use and its features.', 'Development of Image Enhancement Software', 'running', NULL),
(4, 'Customer support service operation', 'Dec 25, 2021', 'Feb 16, 2022', 'You are required to develop a customer support service based operation using DotNet (.Net)', 'Develop a customer support service operation', 'running', NULL),
(5, 'Real Estate Site', 'Dec 29, 2021', 'Mar 21, 2022', ' You are required to develop a real estate website using React, Nodejs.', 'Develop a real-estate website', 'running', NULL),
(6, 'Graphics Illustration', 'Jan 2, 2022', 'Jan 10, 2022', 'You are required to make a graphic illustration for XYZ company. ', 'Make a graphic illustration for ....', 'running', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `project_file`
--

DROP TABLE IF EXISTS `project_file`;
CREATE TABLE IF NOT EXISTS `project_file` (
  `id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `file_details` varchar(1028) DEFAULT NULL,
  `file_url` varchar(256) DEFAULT NULL,
  `assigned_to` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `pro_expenses`
--

DROP TABLE IF EXISTS `pro_expenses`;
CREATE TABLE IF NOT EXISTS `pro_expenses` (
  `id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `assign_to` varchar(64) DEFAULT NULL,
  `details` varchar(512) DEFAULT NULL,
  `amount` varchar(256) DEFAULT NULL,
  `date` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `pro_notes`
--

DROP TABLE IF EXISTS `pro_notes`;
CREATE TABLE IF NOT EXISTS `pro_notes` (
  `id` int(11) NOT NULL,
  `assign_to` varchar(64) DEFAULT NULL,
  `pro_id` int(11) NOT NULL,
  `details` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `pro_task`
--

DROP TABLE IF EXISTS `pro_task`;
CREATE TABLE IF NOT EXISTS `pro_task` (
  `id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `task_title` varchar(256) DEFAULT NULL,
  `start_date` varchar(128) DEFAULT NULL,
  `end_date` varchar(128) DEFAULT NULL,
  `image` varchar(128) DEFAULT NULL,
  `description` varchar(2048) DEFAULT NULL,
  `task_type` enum('Office','Field') NOT NULL DEFAULT 'Office',
  `status` enum('running','complete','cancel') DEFAULT 'running',
  `location` varchar(512) DEFAULT NULL,
  `return_date` varchar(128) DEFAULT NULL,
  `total_days` varchar(128) DEFAULT NULL,
  `create_date` varchar(128) DEFAULT NULL,
  `approve_status` enum('Approved','Not Approve','Rejected') NOT NULL DEFAULT 'Not Approve',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `pro_task`
--

INSERT INTO `pro_task` (`id`, `pro_id`, `task_title`, `start_date`, `end_date`, `image`, `description`, `task_type`, `status`, `location`, `return_date`, `total_days`, `create_date`, `approve_status`) VALUES
(1, 1, 'Demo Task Title for Testing', '2022-01-03', '2022-01-31', NULL, 'This is demo details for testing. This is demo details for testing', 'Office', 'running', NULL, NULL, NULL, '2022-01-03', '');

-- --------------------------------------------------------

--
-- Structure de la table `pro_task_assets`
--

DROP TABLE IF EXISTS `pro_task_assets`;
CREATE TABLE IF NOT EXISTS `pro_task_assets` (
  `id` int(11) NOT NULL,
  `pro_task_id` int(11) NOT NULL,
  `assign_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `salary_type`
--

DROP TABLE IF EXISTS `salary_type`;
CREATE TABLE IF NOT EXISTS `salary_type` (
  `id` int(11) NOT NULL,
  `salary_type` varchar(256) DEFAULT NULL,
  `create_date` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `salary_type`
--

INSERT INTO `salary_type` (`id`, `salary_type`, `create_date`) VALUES
(1, 'Hourly', '2017-11-22'),
(2, 'Monthly', '2017-12-30'),
(3, 'Weekly', '2017-12-29'),
(4, 'Daily', '2018-03-31');

-- --------------------------------------------------------

--
-- Structure de la table `sales_transaction`
--

DROP TABLE IF EXISTS `sales_transaction`;
CREATE TABLE IF NOT EXISTS `sales_transaction` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customer_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_cash` tinyint(1) NOT NULL,
  `total_price` int(11) NOT NULL,
  `total_item` int(11) NOT NULL,
  `pay_deadline_date` date DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `sales_transaction`
--

INSERT INTO `sales_transaction` (`id`, `customer_id`, `is_cash`, `total_price`, `total_item`, `pay_deadline_date`, `date`) VALUES
('OUT1464796372', 'CUST0001', 0, 6200000, 1, '2016-07-01', '2016-06-27 16:34:42'),
('OUT1464796397', 'CUST0002', 1, 280000, 3, '2016-07-01', '2016-06-07 15:35:49'),
('OUT1464796429', 'CUST0001', 1, 120000, 1, '2016-06-01', '2016-06-01 15:54:43'),
('OUT1465701627', 'CUST0001', 1, 280000, 3, '2016-06-12', '2016-06-12 03:20:42'),
('OUT1465749752', 'CUST0002', 1, 7560000, 14, '2016-06-12', '2016-06-12 16:42:54'),
('OUT1466953910', 'CUST0001', 1, 160000, 2, '2016-07-26', '2016-06-27 11:50:43'),
('OUT1467028283', 'CUST0002', 0, 600000, 5, '2016-07-27', '2016-06-27 11:51:44'),
('OUT1467307643', 'CUST0001', 1, 1410000, 16, '2016-07-01', '2016-06-30 17:27:46'),
('OUT1468549735', 'CUST0001', 1, 330000, 2, '2016-07-15', '2016-07-15 02:29:11');

-- --------------------------------------------------------

--
-- Structure de la table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL,
  `sitelogo` varchar(128) DEFAULT NULL,
  `sitetitle` varchar(256) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `copyright` varchar(128) DEFAULT NULL,
  `contact` varchar(128) DEFAULT NULL,
  `currency` varchar(128) DEFAULT NULL,
  `symbol` varchar(64) DEFAULT NULL,
  `system_email` varchar(128) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `address2` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `settings`
--

INSERT INTO `settings` (`id`, `sitelogo`, `sitetitle`, `description`, `copyright`, `contact`, `currency`, `symbol`, `system_email`, `address`, `address2`) VALUES
(1, 'logo-1.png', 'Telesourcia', 'fdffdffffffffffffffffffffffffffffffffff', 'Telesourcia', '0001110000', 'USD', '$', 'contact@hrms', '102 Blue St', '1102 Blecker St');

-- --------------------------------------------------------

--
-- Structure de la table `social_media`
--

DROP TABLE IF EXISTS `social_media`;
CREATE TABLE IF NOT EXISTS `social_media` (
  `id` int(11) NOT NULL,
  `emp_id` varchar(64) DEFAULT NULL,
  `facebook` varchar(256) DEFAULT NULL,
  `twitter` varchar(256) DEFAULT NULL,
  `google_plus` varchar(512) DEFAULT NULL,
  `skype_id` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `timing`
--

DROP TABLE IF EXISTS `timing`;
CREATE TABLE IF NOT EXISTS `timing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `em_id` varchar(20) NOT NULL,
  `time` varchar(50) NOT NULL,
  `tdate` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `timing`
--

INSERT INTO `timing` (`id`, `em_id`, `time`, `tdate`) VALUES
(27, 'Tolotra2', '00:00:01', '12-04-2024');

-- --------------------------------------------------------

--
-- Structure de la table `to-do_list`
--

DROP TABLE IF EXISTS `to-do_list`;
CREATE TABLE IF NOT EXISTS `to-do_list` (
  `id` int(11) NOT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `to_dodata` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` varchar(128) DEFAULT NULL,
  `value` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `to-do_list`
--

INSERT INTO `to-do_list` (`id`, `user_id`, `to_dodata`, `date`, `value`) VALUES
(1, 'Doe1753', 'Demo Task', '2021-04-19 09:19:29pm', '1'),
(2, 'Soy1332', 'Research on X1, Y2, A3', '2022-01-02 08:27:25pm', '0'),
(3, 'Soy1332', 'Recruit Members', '2022-01-02 08:27:50pm', '1'),
(4, 'Soy1332', 'Assign Task to Dev.', '2022-01-02 08:28:04pm', '0'),
(5, 'Soy1332', 'Attend Zoom Meetings', '2022-01-03 03:10:07pm', '1');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `created`, `modified`, `status`) VALUES
(1, 'tin', 'rtltr', '033333', '2023-08-23 09:07:07', '2023-08-23 09:07:07', 'Active');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

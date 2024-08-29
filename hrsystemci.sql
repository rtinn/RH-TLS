-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 28 août 2024 à 12:17
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
  `nb_jour` varchar(50) NOT NULL DEFAULT '0',
  `maternite` varchar(10) NOT NULL DEFAULT '0',
  `maladie` varchar(20) NOT NULL DEFAULT '0',
  `except` varchar(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_2` (`id`),
  UNIQUE KEY `em_id` (`em_id`),
  KEY `id_3` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=260 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `conge_mois`
--

INSERT INTO `conge_mois` (`id`, `em_id`, `nb_jour`, `maternite`, `maladie`, `except`) VALUES
(1, 'T0000', '32.5', '98', '2', '10'),
(2, 'T00001', '11.5', '98', '2', '10'),
(3, 'T00002', '30', '98', '2', '10'),
(4, 'T00003', '34.5', '98', '2', '10'),
(5, 'T00009', '30.5', '98', '2', '10'),
(6, 'T00054', '42.5', '98', '2', '10'),
(7, 'T00075', '27.5', '98', '2', '10'),
(8, 'T00147', '27.5', '98', '2', '10'),
(9, 'T00172', '27.5', '98', '2', '10'),
(10, 'T00183', '27.5', '98', '2', '10'),
(11, 'T00222', '27.5', '98', '2', '10'),
(12, 'T00252', '27.5', '98', '2', '10'),
(13, 'T00253', '27.5', '98', '2', '10'),
(14, 'T00266', '27.5', '98', '2', '10'),
(15, 'T00386', '27.5', '98', '2', '10'),
(16, 'T00390', '27.5', '98', '2', '10'),
(17, 'T00391', '27.5', '98', '2', '10'),
(18, 'T00452', '27.5', '98', '2', '10'),
(19, 'T00455', '27.5', '98', '2', '10'),
(20, 'T00468', '27.5', '98', '2', '10'),
(21, 'T00470', '27.5', '98', '2', '10'),
(22, 'T00478', '27.5', '98', '2', '10'),
(23, 'T00484', '26.5', '98', '2', '10'),
(24, 'T00486', '27.5', '98', '2', '10'),
(25, 'T00487', '27.5', '98', '2', '10'),
(26, 'T00492', '27.5', '98', '2', '10'),
(27, 'T00497', '27.5', '98', '2', '10'),
(28, 'T00501', '27.5', '98', '2', '10'),
(29, 'T00508', '27.5', '98', '2', '10'),
(30, 'T00529', '27.5', '98', '2', '10'),
(31, 'T00532', '27.5', '98', '2', '10'),
(32, 'T00534', '27.5', '98', '2', '10'),
(33, 'T00539', '27.5', '98', '2', '10'),
(34, 'T00540', '27.5', '98', '2', '10'),
(35, 'T00546', '27.5', '98', '2', '10'),
(36, 'T00552', '27.5', '98', '2', '10'),
(37, 'T00557', '27.5', '98', '2', '10'),
(38, 'T00559', '27.5', '98', '2', '10'),
(39, 'T00561', '27.5', '98', '2', '10'),
(40, 'T00567', '27.5', '98', '2', '10'),
(41, 'T00590', '27.5', '98', '2', '10'),
(42, 'T00596', '27.5', '98', '2', '10'),
(43, 'T00597', '27.5', '98', '2', '10'),
(44, 'T00602', '27.5', '98', '2', '10'),
(45, 'T00606', '27.5', '98', '2', '10'),
(46, 'T00609', '27.5', '98', '2', '10'),
(47, 'T00613', '27.5', '98', '2', '10'),
(48, 'T00615', '27.5', '98', '2', '10'),
(49, 'T00628', '27.5', '98', '2', '10'),
(50, 'T00630', '27.5', '98', '2', '10'),
(51, 'T00641', '27.5', '98', '2', '10'),
(52, 'T00647', '27.5', '98', '2', '10'),
(53, 'T00649', '27.5', '98', '2', '10'),
(54, 'T00653', '27.5', '98', '2', '10'),
(55, 'T00655', '27.5', '98', '2', '10'),
(56, 'T00674', '27.5', '98', '2', '10'),
(57, 'T00698', '27.5', '98', '2', '10'),
(58, 'T00699', '27.5', '98', '2', '10'),
(59, 'T00709', '27.5', '98', '2', '10'),
(60, 'T00721', '27.5', '98', '2', '10'),
(61, 'T00722', '27.5', '98', '2', '10'),
(62, 'T00723', '27.5', '98', '2', '10'),
(63, 'T00724', '27.5', '98', '2', '10'),
(64, 'T00726', '27.5', '98', '2', '10'),
(65, 'T00727', '27.5', '98', '2', '10'),
(66, 'T00729', '27.5', '98', '2', '10'),
(67, 'T00730', '27.5', '98', '2', '10'),
(68, 'T00733', '27.5', '98', '2', '10'),
(69, 'T00742', '27.5', '98', '2', '10'),
(70, 'T00766', '27.5', '98', '2', '10'),
(71, 'T00777', '27.5', '98', '2', '10'),
(72, 'T00779', '27.5', '98', '2', '10'),
(73, 'T00781', '27.5', '98', '2', '10'),
(74, 'T00784', '27.5', '98', '2', '10'),
(75, 'T00785', '27.5', '98', '2', '10'),
(76, 'T00787', '27.5', '98', '2', '10'),
(77, 'T00797', '27.5', '98', '2', '10'),
(78, 'T00802', '27.5', '98', '2', '10'),
(79, 'T00805', '27.5', '98', '2', '10'),
(80, 'T00808', '27.5', '98', '2', '10'),
(81, 'T00814', '27.5', '98', '2', '10'),
(82, 'T00822', '27.5', '98', '2', '10'),
(83, 'T00823', '27.5', '98', '2', '10'),
(84, 'T00831', '27.5', '98', '2', '10'),
(85, 'T00832', '27.5', '98', '2', '10'),
(86, 'T00846', '27.5', '98', '2', '10'),
(87, 'T00848', '27.5', '98', '2', '10'),
(88, 'T00849', '27.5', '98', '2', '10'),
(89, 'T00851', '27.5', '98', '2', '10'),
(90, 'T00854', '27.5', '98', '2', '10'),
(91, 'T00861', '27.5', '98', '2', '10'),
(92, 'T00864', '27.5', '98', '2', '10'),
(93, 'T00867', '27.5', '98', '2', '10'),
(94, 'T00868', '27.5', '98', '2', '10'),
(95, 'T00869', '27.5', '98', '2', '10'),
(96, 'T00870', '27.5', '98', '2', '10'),
(97, 'T00873', '27.5', '98', '2', '10'),
(98, 'T00875', '27.5', '98', '2', '10'),
(99, 'T00876', '27.5', '98', '2', '10'),
(100, 'T00880', '27.5', '98', '2', '10'),
(101, 'T00881', '27.5', '98', '2', '10'),
(102, 'T00883', '27.5', '98', '2', '10'),
(103, 'T00884', '27.5', '98', '2', '10'),
(104, 'T00885', '27.5', '98', '2', '10'),
(105, 'T00888', '27.5', '98', '2', '10'),
(106, 'T00889', '27.5', '98', '2', '10'),
(107, 'T00891', '27.5', '98', '2', '10'),
(108, 'T00893', '27.5', '98', '2', '10'),
(109, 'T00894', '27.5', '98', '2', '10'),
(110, 'T00895', '27.5', '98', '2', '10'),
(111, 'T00896', '27.5', '98', '2', '10'),
(112, 'T00897', '27.5', '98', '2', '10'),
(113, 'T00898', '27.5', '98', '2', '10'),
(114, 'T00899', '27.5', '98', '2', '10'),
(115, 'T00903', '27.5', '98', '2', '10'),
(116, 'T00904', '27.5', '98', '2', '10'),
(117, 'T00905', '27.5', '98', '2', '10'),
(118, 'T00906', '27.5', '98', '2', '10'),
(119, 'T00907', '27.5', '98', '2', '10'),
(120, 'T00911', '27.5', '98', '2', '10'),
(121, 'T00912', '27.5', '98', '2', '10'),
(122, 'T00913', '27.5', '98', '2', '10'),
(123, 'T00915', '27.5', '98', '2', '10'),
(124, 'T00916', '27.5', '98', '2', '10'),
(125, 'T00917', '27.5', '98', '2', '10'),
(126, 'T00918', '27.5', '98', '2', '10'),
(127, 'T00919', '27.5', '98', '2', '10'),
(128, 'T00920', '27.5', '98', '2', '10'),
(129, 'T00921', '27.5', '98', '2', '10'),
(130, 'T00922', '27.5', '98', '2', '10'),
(131, 'T00927', '27.5', '98', '2', '10'),
(132, 'T00928', '27.5', '98', '2', '10'),
(133, 'T00930', '27.5', '98', '2', '10'),
(134, 'T00931', '27.5', '98', '2', '10'),
(135, 'T00933', '27.5', '98', '2', '10'),
(136, 'T00934', '27.5', '98', '2', '10'),
(137, 'T00935', '27.5', '98', '2', '10'),
(138, 'T00936', '27.5', '98', '2', '10'),
(139, 'T00938', '27.5', '98', '2', '10'),
(140, 'T00940', '27.5', '98', '2', '10'),
(141, 'T00942', '27.5', '98', '2', '10'),
(142, 'T00943', '27.5', '98', '2', '10'),
(143, 'T00944', '27.5', '98', '2', '10'),
(144, 'T00945', '27.5', '98', '2', '10'),
(145, 'T00946', '27.5', '98', '2', '10'),
(146, 'T00947', '27.5', '98', '2', '10'),
(147, 'T00948', '27.5', '98', '2', '10'),
(148, 'T00949', '27.5', '98', '2', '10'),
(149, 'T00950', '27.5', '98', '2', '10'),
(150, 'T00954', '27.5', '98', '2', '10'),
(151, 'T00957', '27.5', '98', '2', '10'),
(152, 'T00963', '27.5', '98', '2', '10'),
(153, 'T00966', '27.5', '98', '2', '10'),
(154, 'T00969', '27.5', '98', '2', '10'),
(155, 'T00970', '27.5', '98', '2', '10'),
(156, 'T00972', '27.5', '98', '2', '10'),
(157, 'T00973', '27.5', '98', '2', '10'),
(158, 'T00975', '27.5', '98', '2', '10'),
(159, 'T00976', '27.5', '98', '2', '10'),
(160, 'T00977', '27.5', '98', '2', '10'),
(161, 'T00978', '27.5', '98', '2', '10'),
(162, 'T00979', '27.5', '98', '2', '10'),
(163, 'T00982', '27.5', '98', '2', '10'),
(164, 'T00985', '27.5', '98', '2', '10'),
(165, 'T00986', '27.5', '98', '2', '10'),
(166, 'T00989', '27.5', '98', '2', '10'),
(167, 'T00991', '27.5', '98', '2', '10'),
(168, 'T00999', '27.5', '98', '2', '10'),
(169, 'T01000', '27.5', '98', '2', '10'),
(170, 'T01001', '27.5', '98', '2', '10'),
(171, 'T01002', '27.5', '98', '2', '10'),
(172, 'T01003', '27.5', '98', '2', '10'),
(173, 'T01005', '27.5', '98', '2', '10'),
(174, 'T01006', '27.5', '98', '2', '10'),
(175, 'T01007', '27.5', '98', '2', '10'),
(176, 'T01008', '27.5', '98', '2', '10'),
(177, 'T01010', '27.5', '98', '2', '10'),
(178, 'T01011', '27.5', '98', '2', '10'),
(179, 'T01012', '27.5', '98', '2', '10'),
(180, 'T01015', '27.5', '98', '2', '10'),
(181, 'T01016', '27.5', '98', '2', '10'),
(182, 'T01017', '27.5', '98', '2', '10'),
(183, 'T01018', '27.5', '98', '2', '10'),
(184, 'T01019', '27.5', '98', '2', '10'),
(185, 'T01020', '27.5', '98', '2', '10'),
(186, 'T01021', '27.5', '98', '2', '10'),
(187, 'T01022', '27.5', '98', '2', '10'),
(188, 'T01023', '27.5', '98', '2', '10'),
(189, 'T01024', '27.5', '98', '2', '10'),
(190, 'T01025', '27.5', '98', '2', '10'),
(191, 'T01026', '27.5', '98', '2', '10'),
(192, 'T01027', '27.5', '98', '2', '10'),
(193, 'T01028', '27.5', '98', '2', '10'),
(194, 'T01029', '27.5', '98', '2', '10'),
(195, 'T01030', '27.5', '98', '2', '10'),
(196, 'T01031', '27.5', '98', '2', '10'),
(197, 'T01032', '27.5', '98', '2', '10'),
(198, 'T01033', '27.5', '98', '2', '10'),
(199, 'T01034', '27.5', '98', '2', '10'),
(200, 'T01035', '27.5', '98', '2', '10'),
(201, 'T01036', '27.5', '98', '2', '10'),
(202, 'T01037', '27.5', '98', '2', '10'),
(203, 'T01038', '27.5', '98', '2', '10'),
(204, 'T01039', '27.5', '98', '2', '10'),
(205, 'T01040', '27.5', '98', '2', '10'),
(206, 'T01041', '27.5', '98', '2', '10'),
(207, 'T01042', '27.5', '98', '2', '10'),
(208, 'T01043', '27.5', '98', '2', '10'),
(209, 'T01044', '27.5', '98', '2', '10'),
(210, 'T01045', '27.5', '98', '2', '10'),
(211, 'T01046', '27.5', '98', '2', '10'),
(212, 'T01047', '27.5', '98', '2', '10'),
(213, 'T01048', '27.5', '98', '2', '10'),
(214, 'T01049', '27.5', '98', '2', '10'),
(215, 'T01050', '27.5', '98', '2', '10'),
(216, 'T01051', '27.5', '98', '2', '10'),
(217, 'T01052', '27.5', '98', '2', '10'),
(218, 'T01054', '27.5', '98', '2', '10'),
(219, 'T01055', '27.5', '98', '2', '10'),
(220, 'T01056', '27.5', '98', '2', '10'),
(221, 'T01057', '27.5', '98', '2', '10'),
(222, 'T01058', '27.5', '98', '2', '10'),
(223, 'T01059', '27.5', '98', '2', '10'),
(224, 'T01061', '27.5', '98', '2', '10'),
(225, 'T01062', '27.5', '98', '2', '10'),
(226, 'T01063', '27.5', '98', '2', '10'),
(227, 'T01064', '27.5', '98', '2', '10'),
(228, 'T01065', '27.5', '98', '2', '10'),
(229, 'T01066', '27.5', '98', '2', '10'),
(230, 'T01067', '27.5', '98', '2', '10'),
(231, 'T01068', '27.5', '98', '2', '10'),
(232, 'T01069', '27.5', '98', '2', '10'),
(233, 'T01070', '27.5', '98', '2', '10'),
(234, 'T01071', '27.5', '98', '2', '10'),
(235, 'T01072', '27.5', '98', '2', '10'),
(236, 'T01073', '27.5', '98', '2', '10'),
(237, 'T01074', '27.5', '98', '2', '10'),
(238, 'T01075', '27.5', '98', '2', '10'),
(239, 'T01076', '27.5', '98', '2', '10'),
(240, 'T01077', '27.5', '98', '2', '10'),
(241, 'T01078', '27.5', '98', '2', '10'),
(242, 'T01079', '27.5', '98', '2', '10'),
(243, 'T01080', '27.5', '98', '2', '10'),
(244, 'T01081', '27.5', '98', '2', '10'),
(245, 'T01083', '27.5', '98', '2', '10'),
(246, 'T01085', '27.5', '98', '2', '10'),
(247, 'T01087', '27.5', '98', '2', '10'),
(248, 'T01089', '26.5', '98', '0', '7.5'),
(249, 'T01090', '27.5', '98', '2', '10'),
(250, 'T01091', '27.5', '98', '2', '10'),
(251, 'T01093', '27.5', '98', '2', '10'),
(259, 'T01135', '27', '98', '2', '10');

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
) ENGINE=InnoDB AUTO_INCREMENT=3091 DEFAULT CHARSET=latin1;

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
(2739, 'T00497', 'Assistante RH', 'Ressources Humaines', 'RASOARIVONY ', 'Malalanirina', 'm.rasoarivony@telesourcia.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'ADMIN', '', NULL, 'INACTIF', 'Femme', '034 61 016 19', '1991-02-10', 'CDI', '2018-05-03', '', 'Tel1001.jpg', '101252162221', '07:00'),
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
(2791, 'T00805', 'Quality Controler', 'Production - Back Office', 'RAJAONARIVELO', 'Iriantsoa Mirajo', 'riantsoa36@gmail.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 79 160 30', '1998-05-17', 'CDI', '2019-10-02', '', 'Tel1001.jpg', '102391005738', '15:50'),
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
(2891, 'T01012', 'Administrateur Système/Reseau', 'Informatique', 'ANDRIANARY', 'Andrianjaka Stanislas', 'stan@telesourcia.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'INACTIF', 'Homme', '034 42 064 21', '1990-04-12', 'CDI', '2022-07-01', '', 'Tel1001.jpg', '102031018827', '08:00'),
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
(2953, 'T01078', 'Opérateur Anglophone', 'Production - Back Office', 'ANDRIAMALAZA', 'Kasy Baby Gaetan', '', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '032 89 472 82', '2000-12-27', 'Pigiste', '2023-03-22', '', 'Tel1001.jpg', '712081001103', '06:45'),
(2954, 'T01079', 'Opérateur Anglophone', 'Production - Back Office', 'RANAIVOHARINDRANTO', 'Famenoherinjaka Berthieu Honore', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 89 88054', '1998-11-08', 'Pigiste', '2023-03-22', NULL, 'Tel1001.jpg', '114011038385', '06:45'),
(2955, 'T01080', 'Opérateur Anglophone', 'Production - Back Office', 'FABIEN', '', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 10 254 00', '1996-12-31', 'Pigiste', '2023-03-22', NULL, 'Tel1001.jpg', '715051027517', '06:45'),
(2956, 'T01081', 'Opérateur Anglophone', 'Production - Back Office', 'FANOMEZANTSOA', 'Sahia Joariniaina', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 99 707 80', '2002-03-07', 'Pigiste', '2023-03-22', NULL, 'Tel1001.jpg', '117071026632', '06:45'),
(2957, 'T01083', 'Opérateur Anglophone', 'Production - Back Office', 'RAHARIMAHERISOA', 'Kanto Lafatra Heritsaina', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 68 546 82', '2004-01-12', 'Pigiste', '2023-03-22', NULL, 'Tel1001.jpg', '117052021882', '06:45'),
(2958, 'T01085', 'Opérateur Anglophone', 'Production - Back Office', 'SOLOHERINIRINA', 'Princia Mamitiana', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '038 41 817 27', '2001-09-12', 'Pigiste', '2023-03-22', NULL, 'Tel1001.jpg', '117032023443', '06:45'),
(2959, 'T01087', 'Opérateur Anglophone', 'Production - Back Office', 'ANDRIANARISOA', 'Manda NyAina Renaud', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '032 22 324 80', '1999-03-04', 'Pigiste', '2023-03-22', NULL, 'Tel1001.jpg', '117051015989', '06:45'),
(2960, 'T01089', 'Technicien Developpeur', 'Informatique', 'RATOLOTRA', 'Celestin', 'tolotra@telesourcia.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', 'T00484', NULL, 'ACTIF', 'Homme', '034 88 259 67', '1998-01-17', 'CDI', '2023-06-01', '', 'Tel1001.jpg', '223031005181', ''),
(2961, 'T01090', 'Assistante RH', 'Ressources Humaines', 'RAMAHENINA', 'Tatiana Malalanirina Ariel', 'r.tatiana@telesourcia.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'ADMIN', '', NULL, 'ACTIF', 'Femme', '034 33 694 60', '1997-05-16', 'CDI', '2023-08-28', '', 'Tel1001.jpg', '401032051864', '07:00'),
(2962, 'T01091', 'ARH', 'RH', 'ANDRIAMIHARY', 'Soloniaina Tsiaro Nomena', 'andriamihary.nomena@telesourcia.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'ADMIN', '', NULL, 'ACTIF', 'Femme', '034 07 767 41', '2000-05-16', 'CDI', '2023-09-05', '', 'Tel1001.jpg', '101982106592', '08:00'),
(2965, 'T01093', 'Assistante Marketing ', 'Marketing ', 'RATOMBOSON ', 'Oriannah ', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '032 49 900 83', '2002-02-21', 'CDI', '2023-12-04', NULL, 'Tel1001.jpg', '711992073709', ''),
(2966, 'T01135', 'Administrateur de système et réseaux ', 'Informatique', 'NOAD', 'Black', NULL, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'EMPLOYEE', 'T00484', NULL, 'ACTIF', 'Homme', '033 50 660 38', '2003-07-07', 'CDI', '2024-01-10', NULL, 'Tel1001.jpg', '117051021981', ''),
(2967, 'T01158', 'Chef de projet', 'Production - Back Office', 'RANDRIAMINOSOA ', 'Hanja Mbolatiana', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '038 56 870 25', '1989-04-14', 'CDI', '2024-02-21', NULL, 'Tel1001.jpg', '101212189500', ''),
(2968, 'T01231', 'Assistante RH ', 'Ressources Humaines', 'RATSIMAMANGA ', 'Fabienne Aurelie ', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '033 50 660 38', '1993-10-10', 'CDI', '2024-04-08', NULL, 'Tel1001.jpg', '101982088332', ''),
(2969, 'T01233', 'Agent logistique et d\'Approvisionnement', 'Logistique', 'RANAIVOSON', 'Mpanatsoa Fanilo ', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '038 70 082 49', '1993-02-04', 'CDI', '2024-06-17', NULL, 'Tel1001.jpg', '101251169606', ''),
(2970, 'T01236', 'Assistante des Ressources Humaines Chargée de la WFM', 'Ressources Humaines', 'ANDRIAMPARANTSOA ', 'Fenosoa ', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 25 099 38', '1988-01-26', 'CDI', '2024-07-15', NULL, 'Tel1001.jpg', '101232140341', ''),
(2971, 'T01095', 'Opérateur Anglophone', 'Production - Back Office', 'RAMISARISON ', 'Lucianna Angelica', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 72 294 84', '2002-12-03', 'Pigiste', '2023-12-18', NULL, 'Tel1001.jpg', '102032042593', ''),
(2972, 'T01096', 'Opérateur Anglophone', 'Production - Back Office', 'MIHARIZO ', 'Lalaina Sariaka', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '033 11 775 38', '2001-05-02', 'Pigiste', '2023-12-18', NULL, 'Tel1001.jpg', '110012021713', ''),
(2973, 'T01097', 'Opérateur Anglophone', 'Production - Back Office', 'RAKOTONJANAHARY ', 'Idealy Nomena', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '038 89 722 91', '2005-01-26', 'Pigiste', '2023-12-15', NULL, 'Tel1001.jpg', '108072033800', ''),
(2974, 'T01099', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIAIAINA', 'Fiononantsoa Carel', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 76 243 76', '2003-08-13', 'Pigiste', '2023-12-15', NULL, 'Tel1001.jpg', '103131022846', ''),
(2975, 'T01100', 'Opérateur Anglophone', 'Production - Back Office', 'RAKOTOARISON  ', 'Mahefaniaina Marcellin', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 32 178 10', '2000-09-06', 'Pigiste', '2023-12-15', NULL, 'Tel1001.jpg', '111331005178', ''),
(2976, 'T01101', 'Opérateur Anglophone', 'Production - Back Office', 'RAZAFIMAHANDRY ', 'Harinjara', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 22 500 36', '2005-03-13', 'Pigiste', '2023-12-15', NULL, 'Tel1001.jpg', '101231184584', ''),
(2977, 'T01103', 'Opérateur Anglophone', 'Production - Back Office', 'RAZAFITSIRY ', 'Jean Marius Christpohe', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', NULL, '1996-03-22', 'Pigiste', '2023-12-15', NULL, 'Tel1001.jpg', '502011008497', ''),
(2978, 'T01105', 'Opérateur Anglophone', 'Production - Back Office', 'ANDO Andriamirija ', ' Marius ', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 97 045 30', '1996-08-26', 'Pigiste', '2023-12-15', NULL, 'Tel1001.jpg', '515011050770', ''),
(2979, 'T01107', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIATAHIANA ', 'Tsilavina Maximin', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '032 50 409 41', '2002-06-29', 'Pigiste', '2023-12-15', NULL, 'Tel1001.jpg', '101251223733', ''),
(2980, 'T01109', 'Opérateur Anglophone', 'Production - Back Office', 'RAKOTOARIMANANA ', ' Nantenaina Gaio Judicael ', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '033 21 084 14', '2000-05-28', 'Pigiste', '2023-12-15', NULL, 'Tel1001.jpg', '102251003826', ''),
(2981, 'T01110', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIANANTENAINA ', 'Nambinina Martin', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '033 54 957 57', '2000-02-03', 'Pigiste', '2023-12-15', NULL, 'Tel1001.jpg', '101241188808', ''),
(2982, 'T01111', 'Opérateur Anglophone', 'Production - Back Office', 'TOVO ANDRIANARIVO ', ' Nantenaina', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 82 949 20', '2001-11-15', 'Pigiste', '2023-12-15', NULL, 'Tel1001.jpg', '117171024174', ''),
(2983, 'T01112', 'Opérateur Anglophone', 'Production - Back Office', 'TINAVOLANA Jenny ', 'Jenny Patricia', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 26 817 79 ', '2003-10-30', 'Pigiste', '2023-12-15', NULL, 'Tel1001.jpg', '102412007871', ''),
(2984, 'T01113', 'Opérateur Anglophone', 'Production - Back Office', 'RAMBELOHARISON ', 'Vahatriniaina Mahefa', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', NULL, '2002-04-23', 'Pigiste', '2023-12-15', NULL, 'Tel1001.jpg', '102071032231', ''),
(2985, 'T01115', 'Opérateur Anglophone', 'Production - Back Office', 'NY MARAINA  ', 'fenotsiky Amour', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 12 820 05', '2001-04-13', 'Pigiste', '2023-12-15', NULL, 'Tel1001.jpg', '103031015903', ''),
(2986, 'T01116', 'Opérateur Anglophone', 'Production - Back Office', 'RAHOLINTSALAMA ', 'Narovana Sarobidy Nissa', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '033 62 268 38 ', '2005-04-20', 'Pigiste', '2023-12-18', NULL, 'Tel1001.jpg', '102272005274', ''),
(2987, 'T01117', 'Opérateur Anglophone', 'Production - Back Office', 'RAMANGASOAVINA ', 'Alfred', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 46 522 42 ', '1992-08-18', 'Pigiste', '2023-12-15', NULL, 'Tel1001.jpg', '111011018784', ''),
(2988, 'T01118', 'Opérateur Anglophone', 'Production - Back Office', 'ANDRIAMANAMISATA ', 'Navaloniaina Erica', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '033 20 671 38', '2003-07-31', 'Pigiste', '2023-12-18', NULL, 'Tel1001.jpg', '103132022196', ''),
(2989, 'T01120', 'Team Leader', 'Production - Back Office', 'ONJAHARISOA', 'Nomenjanahary', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 76 621 25', '1992-07-11', 'Pigiste', '2023-12-19', NULL, 'Tel1001.jpg', '312111013734', ''),
(2990, 'T01121', 'Opérateur Anglophone', 'Production - Back Office', 'RATSARANIRIAINA', 'Laura Fanantenana', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 31 22 526', '2002-08-13', 'Pigiste', '2023-12-20', NULL, 'Tel1001.jpg', '101242204407', ''),
(2991, 'T01122', 'Opérateur Anglophone', 'Production - Back Office', 'RAVELOJAONA ', 'Princy Sombiniaina', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 29 602 7', '1994-12-20', 'Pigiste', '2023-12-14', NULL, 'Tel1001.jpg', '101231156254', ''),
(2992, 'T01124', 'Opérateur Anglophone', 'Production - Back Office', 'RAHARINIAINA', 'Fiainana Mamiriana', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 19 753 30', '1996-05-19', 'Pigiste', '2024-01-05', NULL, 'Tel1001.jpg', '107012011913', ''),
(2993, 'T01125', 'Opérateur Anglophone', 'Production - Back Office', 'RALINJAKA ', 'Tina Raissa Santatriniaina', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 71 822 88', '2003-04-03', 'Pigiste', '2024-01-05', NULL, 'Tel1001.jpg', '101222142977', ''),
(2994, 'T01126', 'Opérateur Anglophone', 'Production - Back Office', 'RAZANADRAVELO ', 'Faramalala', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 32 522 07', '1993-07-27', 'Pigiste', '2024-01-05', NULL, 'Tel1001.jpg', '103212008188', ''),
(2995, 'T01127', 'Opérateur Anglophone', 'Production - Back Office', 'RAZAFINDRAKOTO  ', 'Santatriniaina Prisca ', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '033 70 573 07', '2003-11-05', 'Pigiste', '2024-01-05', NULL, 'Tel1001.jpg', '101252232414', ''),
(2996, 'T01128', 'Opérateur Anglophone', 'Production - Back Office', 'TAHINJANAHARY  ', 'Ravelomanantsoa Manuel ', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 76 519 56', '2001-07-10', 'Pigiste', '2024-01-05', NULL, 'Tel1001.jpg', '101211269990', ''),
(2997, 'T01129', 'Opérateur Anglophone', 'Production - Back Office', 'RAKOTONANDRASANA ', 'Vonjiniaina Finaritra Ferdinand', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 39 626 89', '2002-03-31', 'Pigiste', '2024-01-05', NULL, 'Tel1001.jpg', '101221140131', ''),
(2998, 'T01130', 'Opérateur Anglophone', 'Production - Back Office', 'RAKOTONDRASOA ', 'Mandritsimba', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '033 61 577 71', '2003-08-06', 'Pigiste', '2024-01-05', NULL, 'Tel1001.jpg', '103051024134', ''),
(2999, 'T01132', 'Opérateur Anglophone', 'Production - Back Office', 'RATOVONIHARY', 'Elinah ', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '033 74 855 85 ', '1999-04-30', 'Pigiste', '2024-01-05', NULL, 'Tel1001.jpg', '101192105183', ''),
(3000, 'T01133', 'Opérateur Anglophone', 'Production - Back Office', 'RAKOTOVAO SOLONIAINA ', 'Enéa Fabrina', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '033 20 175 40', '1998-03-14', 'Pigiste', '2024-01-05', NULL, 'Tel1001.jpg', '101232164405', ''),
(3001, 'T01134', 'Opérateur Anglophone', 'Production - Back Office', 'RAZAFIMAHEFA  ', 'Roche Wahl Dinot ', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '032 56 742 88 ', '2001-02-22', 'Pigiste', '2024-01-05', NULL, 'Tel1001.jpg', '101221134074', ''),
(3002, 'T01137', 'Opérateur Anglophone', 'Production - Back Office', 'RAVELOSON', 'Marianto Finoana', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 40 250 55', '2004-10-08', 'Pigiste', '2024-01-16', NULL, 'Tel1001.jpg', '101232183318', ''),
(3003, 'T01138', 'Opérateur Anglophone', 'Production - Back Office', 'RAZAFIARIZAONA', 'Tafitasoa', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '033 31 449 06', '2002-07-03', 'Pigiste', '2024-01-16', NULL, 'Tel1001.jpg', '101242203606', ''),
(3004, 'T01139', 'Opérateur Anglophone', 'Production - Back Office', 'CHRISTINE', 'Asmine', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '032 17 770 16 ', '1994-10-07', 'Pigiste', '2024-01-16', NULL, 'Tel1001.jpg', '101222109876', ''),
(3005, 'T01140', 'Opérateur Anglophone', 'Production - Back Office', 'TARATRAMANDIMBY', 'Tahiry Lalao', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 73 004 01', '2000-06-27', 'Pigiste', '2024-01-16', NULL, 'Tel1001.jpg', '313132012827', ''),
(3006, 'T01142', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIANANTENAINA', 'Jean Luc', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 25 823 13', '1989-12-10', 'Pigiste', '2024-01-16', NULL, 'Tel1001.jpg', '301031016279', ''),
(3007, 'T01144', 'Opérateur Anglophone', 'Production - Back Office', 'NOMENAHARIMANANTSOA', 'Ndrasana Toavina', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 08 683 20', '2000-09-05', 'Pigiste', '2024-01-16', NULL, 'Tel1001.jpg', '117031022265', ''),
(3008, 'T01145', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRESIHAJA', 'Nirilafatra Fitiavana', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 52 603 80', '1997-08-28', 'Pigiste', '2024-01-16', NULL, 'Tel1001.jpg', '117031020087', ''),
(3009, 'T01146', 'Opérateur Anglophone', 'Production - Back Office', 'RAZAFINTSALAMA', 'Hery Nantenaina', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 16 774 23', '2005-08-19', 'Pigiste', '2024-01-16', NULL, 'Tel1001.jpg', '103111028425', ''),
(3010, 'T01148', 'Opérateur Anglophone', 'Production - Back Office', 'DIVINELY', 'Arilalaina Triomphe Andreas', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '038 49 830 74', '2000-01-23', 'Pigiste', '2024-01-16', NULL, 'Tel1001.jpg', '515011056816', ''),
(3011, 'T01149', 'Opérateur Anglophone', 'Production - Back Office', 'FANOMEZANTSOA', 'Sitrakiniaina Elia ', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 39 035 91', '2003-08-12', 'Pigiste', '2024-01-16', NULL, 'Tel1001.jpg', '101251231331', ''),
(3012, 'T01152', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIAMANANA ', 'Andritiana Donald', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 85 406 27', '2003-07-08', 'Pigiste', '2024-01-16', NULL, 'Tel1001.jpg', '101 981 117 66', ''),
(3013, 'T01153', 'Opérateur Anglophone', 'Production - Back Office', 'RAKOTONDRAFARA', 'Faneva Mitia Rinoh', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 11 700 18 ', '2004-09-30', 'Pigiste', '2024-01-16', NULL, 'Tel1001.jpg', '103111027242', ''),
(3014, 'T01154', 'Opérateur Anglophone', 'Production - Back Office', 'RAFANOMEZANJANAHARY', 'Fanambinantsoa Herinandrasana Francois', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 51 113 41 ', '1999-03-25', 'Pigiste', '2024-01-16', NULL, 'Tel1001.jpg', '220131008266', ''),
(3015, 'T01155', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIANAIVO ', 'Nositiana Mampionona ', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 05 150 12', '2002-11-06', 'Pigiste', '2024-01-16', NULL, 'Tel1001.jpg', '101251225793', ''),
(3016, 'T01156', 'Opérateur Anglophone', 'Production - Back Office', 'RABENOAVY', 'Tsitohaina Romain', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', NULL, '2000-03-27', 'Pigiste', '2024-01-16', NULL, 'Tel1001.jpg', '314371000335', ''),
(3017, 'T01157', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIANARSON ', 'Eulalie Ristine', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', NULL, '2000-10-07', 'Pigiste', '2024-01-16', NULL, 'Tel1001.jpg', '409012034827', ''),
(3018, 'T01159', 'Opérateur Anglophone', 'Production - Back Office', 'FARAMALALA', 'Tsilavina Mendrika', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '038 74 868 94', '2005-06-10', 'Pigiste', '2024-03-13', NULL, 'Tel1001.jpg', '101982123910', ''),
(3019, 'T01160', 'Opérateur Anglophone', 'Production - Back Office', 'HARISAFIDY ', 'Tsiory Nomena', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 85 822 11', '2003-09-30', 'Pigiste', '2024-03-13', NULL, 'Tel1001.jpg', '101222146349', ''),
(3020, 'T01161', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIAMALALA ', 'Diamondra Fitiavana', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 50 124 06', '2001-01-15', 'Pigiste', '2024-03-13', NULL, 'Tel1001.jpg', '115131010384', ''),
(3021, 'T01162', 'Opérateur Anglophone', 'Production - Back Office', 'RAHARISON', 'Tokinomena Christallis', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '038 77 177 66', '1992-02-06', 'Pigiste', '2024-03-13', NULL, 'Tel1001.jpg', '517011011900', ''),
(3022, 'T01163', 'Opérateur Anglophone', 'Production - Back Office', 'ANJARASOA ', 'Florencia', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 49 142 38', '2001-07-31', 'Pigiste', '2024-03-13', NULL, 'Tel1001.jpg', '214012110961', ''),
(3023, 'T01164', 'Opérateur Anglophone', 'Production - Back Office', 'RAJOELISOA ', 'Fitiavana Sarah ', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '033 20 961 70', '2003-12-24', 'Pigiste', '2024-03-13', NULL, 'Tel1001.jpg', '102092039598', ''),
(3024, 'T01165', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIAMANANTENA', 'Fitahiana Ianteherana', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '033 21 921 12', '2001-11-21', 'Pigiste', '2024-03-13', NULL, 'Tel1001.jpg', '101252220383', ''),
(3025, 'T01166', 'Opérateur Anglophone', 'Production - Back Office', 'RAFARAHERITIANA ', 'Kantosoa Stanley Gabriella', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 27 232 74', '2003-04-06', 'Pigiste', '2024-03-13', NULL, 'Tel1001.jpg', '101212265762', ''),
(3026, 'T01167', 'Opérateur Anglophone', 'Production - Back Office', 'RAKOTOARIMALALA ', 'Rabezanahary Nathanael', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '033 70 049 84', '2003-07-12', 'Pigiste', '2024-03-13', NULL, 'Tel1001.jpg', '102091038280', ''),
(3027, 'T01168', 'Opérateur Anglophone', 'Production - Back Office', 'HERINJATOVO ', 'Stevy Bernard', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 85 882 85', '1998-03-20', 'Pigiste', '2024-03-13', NULL, 'Tel1001.jpg', '201011025597', ''),
(3028, 'T01169', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIANARSON ', 'Ronalndont', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '032 02 992 13', '1998-08-22', 'Pigiste', '2024-03-13', NULL, 'Tel1001.jpg', '711151002930', ''),
(3029, 'T01170', 'Opérateur Anglophone', 'Production - Back Office', 'RAKOTONDRALIPO ', 'Mbola Izy Jiré', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '038 85 511 08', '2000-03-15', 'Pigiste', '2024-03-13', NULL, 'Tel1001.jpg', '101241191635', ''),
(3030, 'T01171', 'Opérateur Anglophone', 'Production - Back Office', 'RAKOTOARISOA ', 'Jean Fabrice', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 90 061 57', '1999-05-11', 'Pigiste', '2024-03-13', NULL, 'Tel1001.jpg', '313031019985', ''),
(3031, 'T01172', 'Opérateur Anglophone', 'Production - Back Office', 'RASOLOSON ', 'Ny Tolotra Fanomezantsoa Jessy', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 61 606 14', '1998-07-30', 'Pigiste', '2024-03-13', NULL, 'Tel1001.jpg', '102011018708', ''),
(3032, 'T01173', 'Opérateur Anglophone', 'Production - Back Office', 'RABEZANAHARY', 'Tsiory Fandresena', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', NULL, '2005-01-08', 'Pigiste', '2024-03-13', NULL, 'Tel1001.jpg', '101221151835', ''),
(3033, 'T01174', 'Opérateur Anglophone', 'Production - Back Office', 'HERIMAMPIONONA', 'Th?odore', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 43 887 77', '1998-11-04', 'Pigiste', '2024-03-13', NULL, 'Tel1001.jpg', '305011037543', ''),
(3034, 'T01175', 'Opérateur Anglophone', 'Production - Back Office', 'VONJISON ', 'Hanitralalao Nadia Yvette Noelsine', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 96 003 38', '1989-12-25', 'Pigiste', '2024-03-13', NULL, 'Tel1001.jpg', '101242141931', ''),
(3035, 'T01176', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIANJATOVO', 'Nantenaina Faneva', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 16 787 33', '2001-03-23', 'Pigiste', '2024-03-13', NULL, 'Tel1001.jpg', '101221134803', ''),
(3036, 'T01177', 'Opérateur Anglophone', 'Production - Back Office', 'RASOARINOSY ', 'Tafitasoa Liliane ', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 89 507 62', '1999-06-24', 'Pigiste', '2024-03-22', NULL, 'Tel1001.jpg', '102092030660', ''),
(3037, 'T01178', 'Opérateur Anglophone', 'Production - Back Office', 'RAJAONARISOA ', 'Mialy ', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '033 07 777 26 ', '2003-03-31', 'Pigiste', '2024-03-22', NULL, 'Tel1001.jpg', '101212265055', ''),
(3038, 'T01179', 'Opérateur Anglophone', 'Production - Back Office', 'JEMIMA ', 'Jedidia', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '032 88 031 69', '2000-09-06', 'Pigiste', '2024-03-22', NULL, 'Tel1001.jpg', '711992068281', ''),
(3039, 'T01180', 'Opérateur Anglophone', 'Production - Back Office', 'RAKOTOARISON  ', 'Richard ', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 70 230 85', '2004-09-19', 'Pigiste', '2024-03-22', NULL, 'Tel1001.jpg', '101251237085', ''),
(3040, 'T01181', 'Opérateur Anglophone', 'Production - Back Office', 'RANAIVOSON', 'Sedra Ny Aina', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 68 928 08', '2001-08-08', 'Pigiste', '2024-03-22', NULL, 'Tel1001.jpg', '117191017613', ''),
(3041, 'T01182', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIAMANALINA', 'Tendriniavo Vahatriniaina', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 38 880 70', '2002-06-06', 'Pigiste', '2024-03-22', NULL, 'Tel1001.jpg', '101221140446', ''),
(3042, 'T01184', 'Opérateur Anglophone', 'Production - Back Office', 'RAKOTONDRANDRIA', 'Natolojanahary', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 74 941 60', '1999-04-20', 'Pigiste', '2024-03-22', NULL, 'Tel1001.jpg', '101251203672', ''),
(3043, 'T01185', 'Opérateur Anglophone', 'Production - Back Office', 'BEZANDRY ', 'Raulice', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '032 24 827 34', '1999-11-20', 'Pigiste', '2024-03-22', NULL, 'Tel1001.jpg', '712011020492', ''),
(3044, 'T01186', 'Opérateur Anglophone', 'Production - Back Office', 'RABEHARINIVO', 'Fetraniaina Julien', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 60 994 52', '2003-06-09', 'Pigiste', '2024-03-22', NULL, 'Tel1001.jpg', '117011044099', ''),
(3045, 'T01187', 'Opérateur Anglophone', 'Production - Back Office', 'RASOAMATODY', 'Vagnotoitra', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 04 636 48', '1998-12-10', 'Pigiste', '2024-03-22', NULL, 'Tel1001.jpg', '101252201055', ''),
(3046, 'T01188', 'Opérateur Anglophone', 'Production - Back Office', 'TOLOTRINIAINA ', 'Zo Fanasina', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 60 066 41', '2000-08-22', 'Pigiste', '2024-03-22', NULL, 'Tel1001.jpg', '101222132042', ''),
(3047, 'T01189', 'Opérateur Anglophone', 'Production - Back Office', 'RASOAVOLOLONA ', 'Théoricienne', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 28 635 85', '2004-06-15', 'Pigiste', '2024-03-22', NULL, 'Tel1001.jpg', '716232021396', ''),
(3048, 'T01190', 'Opérateur Anglophone', 'Production - Back Office', 'RAMAHENINAMBININA', 'Brunel Hastelson', 'e@gmail.com', '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '0349310956', '1997-05-12', 'Pigiste', '2024-03-22', '', 'Tel1001.jpg', '508991028716', ''),
(3049, 'T01191', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIAMALALA', 'Fenosoa Amina', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '033 62 944 75', '2002-02-07', 'Pigiste', '2024-03-22', NULL, 'Tel1001.jpg', '101241204937', ''),
(3050, 'T01192', 'Opérateur Anglophone', 'Production - Back Office', 'RABEHASY', 'Hasina Anjaratiana ', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 93 592 15', '1994-03-04', 'Pigiste', '2024-03-22', NULL, 'Tel1001.jpg', '203011026324', ''),
(3051, 'T01193', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIAMAHENINA ', 'Manampisoa Vola Fanilo', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 59 385 73', '2002-05-22', 'Pigiste', '2024-03-22', NULL, 'Tel1001.jpg', '101251224638', ''),
(3052, 'T01195', 'Opérateur Anglophone', 'Production - Back Office', 'RAZANAKOTO', 'David Bastien', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 13 229 72', '1990-09-02', 'Pigiste', '2024-03-22', NULL, 'Tel1001.jpg', '101211195140', ''),
(3053, 'T01196', 'Opérateur Anglophone', 'Production - Back Office', 'HERINIRINA', 'A?da Urvana', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 20 133 00', '2002-07-09', 'Pigiste', '2024-03-25', NULL, 'Tel1001.jpg', '101222140109', ''),
(3054, 'T01197', 'Opérateur Anglophone', 'Production - Back Office', 'VATOSOA', 'Sarobidy Hozah Rostelle', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '038 38 774 17', '2004-03-21', 'Pigiste', '2024-03-25', NULL, 'Tel1001.jpg', '103112026582', '');
INSERT INTO `employee` (`id`, `em_id`, `des_id`, `dep_id`, `first_name`, `last_name`, `em_email`, `em_password`, `em_role`, `id_np`, `em_address`, `status`, `em_gender`, `em_phone`, `em_birthday`, `contrat`, `em_joining_date`, `em_contact_end`, `em_image`, `em_nid`, `em_entree`) VALUES
(3055, 'T01198', 'Opérateur Anglophone', 'Production - Back Office', 'RAHARIVONY', 'Antsaniaina', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', NULL, '1998-04-09', 'Pigiste', '2024-03-25', NULL, 'Tel1001.jpg', '115092021030', ''),
(3056, 'T01199', 'Opérateur Anglophone', 'Production - Back Office', 'RAMANAMAHEFA', 'Volamiaina Onjatiana', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 03 563 47', '1998-05-09', 'Pigiste', '2024-03-25', NULL, 'Tel1001.jpg', '117072022188', ''),
(3057, 'T01200', 'Opérateur Anglophone', 'Production - Back Office', 'RAKOTONAVALONARIVO', 'Aina Nomena', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 22 113 14', '2005-07-01', 'Pigiste', '2024-03-25', NULL, 'Tel1001.jpg', '101232185426', ''),
(3058, 'T01201', 'Opérateur Anglophone', 'Production - Back Office', 'IRINANDRIANINA', 'Tatiana', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 04 583 97', '1993-03-11', 'Pigiste', '2024-03-25', NULL, 'Tel1001.jpg', '101222105029', ''),
(3059, 'T01202', 'Opérateur Anglophone', 'Production - Back Office', 'SEBASTIEN ', 'Judicael', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 13 800 33', '2000-06-11', 'Pigiste', '2024-03-25', NULL, 'Tel1001.jpg', '719011041317', ''),
(3060, 'T01203', 'Opérateur Anglophone', 'Production - Back Office', 'RABENANDRASANA ', 'Ali Michael ', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 99 780 65', '2000-04-17', 'Pigiste', '2024-03-25', NULL, 'Tel1001.jpg', '101251209654', ''),
(3061, 'T01204', 'Opérateur Anglophone', 'Production - Back Office', 'TIANASOA NANTENAINA ', 'Jonathan Ronaldo ', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 58 705 31', '2003-09-03', 'Pigiste', '2024-03-25', NULL, 'Tel1001.jpg', '101981117586', ''),
(3062, 'T01205', 'Opérateur Anglophone', 'Production - Back Office', 'RABARISON ', 'Vonjitiana Cynthia', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 86 267 65', '2002-09-04', 'Pigiste', '2024-03-25', NULL, 'Tel1001.jpg', '101222140190', ''),
(3063, 'T01206', 'Opérateur Anglophone', 'Production - Back Office', 'ANDRIANJAKAMAHERISOA ', 'Voninjamalala', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 79 096 30', '1992-01-18', 'Pigiste', '2024-03-25', NULL, 'Tel1001.jpg', '203292005609', ''),
(3064, 'T01207', 'Opérateur Anglophone', 'Production - Back Office', 'RASOANANDRASANA ', 'Vonjy Niaina Domoina Marie Olivia', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 21 079 91', '1993-11-18', 'Pigiste', '2024-03-25', NULL, 'Tel1001.jpg', '103012007344', ''),
(3065, 'T01208', 'Opérateur Anglophone', 'Production - Back Office', 'RAHARISOANIAVIANA', 'Neil Tisha', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 25 409 30', '2003-03-11', 'Pigiste', '2024-03-25', NULL, 'Tel1001.jpg', '101242207394', ''),
(3066, 'T01209', 'Opérateur Anglophone', 'Production - Back Office', 'RANDRIAMIALISOA ', 'Oliniaina Fiononana', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 72 281 95', '2000-02-23', 'Pigiste', '2024-03-25', NULL, 'Tel1001.jpg', '102072027725', ''),
(3067, 'T01210', 'Opérateur Anglophone', 'Production - Back Office', 'RATOVOHERIMANANA', 'Barjhon ', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '032 02 896 87', '2000-05-26', 'Pigiste', '2024-03-25', NULL, 'Tel1001.jpg', '101251211636', ''),
(3068, 'T01212', 'Opérateur Anglophone', 'Production - Back Office', 'RAZAFINDRANAIVO ', 'Andonirina Tsilavina ', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '038 87 994 68', '1998-02-25', 'Pigiste', '2024-03-25', NULL, 'Tel1001.jpg', '101221123615', ''),
(3069, 'T01213', 'Opérateur Anglophone', 'Production - Back Office', 'RAMBOLAMANANA', 'Hasina Francky ', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '033 83 533 49', '1999-10-21', 'Pigiste', '2024-03-25', NULL, 'Tel1001.jpg', '117031022595', ''),
(3070, 'T01215', 'Opérateur Anglophone', 'Production - Back Office', 'RAOELISON ', 'Hery Navalona ', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 98 183 93', '2001-08-15', 'Pigiste', '2024-03-25', NULL, 'Tel1001.jpg', '101251219573', ''),
(3071, 'T01216', 'Opérateur Anglophone', 'Production - Back Office', 'ANDRIANDAZA ', 'Floria Janick Andriana ', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 80 508 91', '1996-09-21', 'Pigiste', '2024-03-25', NULL, 'Tel1001.jpg', '409012030129', ''),
(3072, 'T01219', 'Opérateur Anglophone', 'Production - Back Office', 'RAKOTONAIVO ', 'Jao Maeva', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', ' - ', '2002-08-23', 'Pigiste', '2024-03-27', NULL, 'Tel1001.jpg', '102271004675', ''),
(3073, 'T01220', 'Opérateur Anglophone', 'Production - Back Office', 'ANDRIANAVALONA ', 'Laingo Ravaka ', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 70 817 19 ', '2003-05-01', 'Pigiste', '2024-03-27', NULL, 'Tel1001.jpg', '117352011943', ''),
(3074, 'T01221', 'Opérateur Anglophone', 'Production - Back Office', 'RAFAMANTANANTSOA ', 'Anjara Toky ', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '033 06 090 07', '2003-12-12', 'Pigiste', '2024-03-27', NULL, 'Tel1001.jpg', '101211269815', ''),
(3075, 'T01222', 'Opérateur Anglophone', 'Production - Back Office', 'RABARIMIHAJA ', 'Onjaniaina Stella ', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 34 840 78', '2003-07-07', 'Pigiste', '2024-03-27', NULL, 'Tel1001.jpg', '117351011895', ''),
(3076, 'T01223', 'Opérateur Anglophone', 'Production - Back Office', 'RANAIVOSON ', 'Ny Hasina Tahina Radifera', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 62 535 27', '2003-05-14', 'Pigiste', '2024-03-27', NULL, 'Tel1001.jpg', '101231180902', ''),
(3077, 'T01224', 'Opérateur Anglophone', 'Production - Back Office', 'RASOANIRINA', ' Ravaka Nantenaina Mampionina', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '034 36 313 43', '2001-08-04', 'Pigiste', '2024-03-28', NULL, 'Tel1001.jpg', '101252217367', ''),
(3078, 'T01225', 'Opérateur Anglophone', 'Production - Back Office', 'DAON', 'Black', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', ' - ', '2004-03-28', 'Pigiste', '2024-03-28', NULL, 'Tel1001.jpg', '117051021748', ''),
(3079, 'T01226', 'Opérateur Anglophone', 'Production - Back Office', 'ANDRIANIRINA', 'Rakotovoavy Tiana Setranaina', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 19 762 12', '1987-09-25', 'Pigiste', '2024-03-28', NULL, 'Tel1001.jpg', '101981073864', ''),
(3080, 'T01227', 'Opérateur Anglophone', 'Production - Back Office', 'RAKOTONIRINA', 'Felaniaiana Nomenjanahary', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', NULL, '2005-07-02', 'Pigiste', '2024-04-03', NULL, 'Tel1001.jpg', '117452006958', ''),
(3081, 'T01228', 'Opérateur Anglophone', 'Production - Back Office', 'RAVOAVIAMANGA', 'Vololomboahangy ', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '0333 11 140 86 ', '1997-08-10', 'Pigiste', '2024-04-03', NULL, 'Tel1001.jpg', '101222119520', ''),
(3082, 'T01229', 'Opérateur Anglophone', 'Production - Back Office', 'RAZAFINJATO', ' Hery Hasiniaina ', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 63 784 17', '1999-06-27', 'Pigiste', '2024-04-03', NULL, 'Tel1001.jpg', '101231171253', ''),
(3083, 'T01230', 'Opérateur Anglophone', 'Production - Back Office', 'ANDRIANTSOA', 'Miravo Stéphano', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '033 01 003 90', '2004-01-07', 'Pigiste', '2024-04-03', NULL, 'Tel1001.jpg', '106461014233', ''),
(3084, 'T01232', 'Opérateur Anglophone', 'Production - Back Office', 'RAKOTONDRAMANANA', 'Vonjisoa Johny Emilien', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 99 687 29', '2002-04-24', 'Pigiste', '2024-04-18', NULL, 'Tel1001.jpg', '110171014038', ''),
(3085, 'T01234', 'Opérateur Anglophone', 'Production - Back Office', 'RABEARISON', 'Joelinarivo', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 16 134 62', '1987-05-13', 'Pigiste', '2024-07-01', NULL, 'Tel1001.jpg', '117071012251', ''),
(3086, 'T01235', 'Opérateur Anglophone', 'Production - Back Office', 'RASOANANTENAINA ', 'Bénédicte Florencia ', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Femme', '032 28 119 15', '2002-04-02', 'Pigiste', '2024-07-11', NULL, 'Tel1001.jpg', '414012040800', ''),
(3088, 'T00997', 'Op?rateur Anglophone', 'Production - Back Office', 'RAMAROSON', 'Bernard Saturnin', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '034 48 271 83', '1997-12-06', 'CDI', '2022-01-24', NULL, 'Tel1001.jpg', '414 011 031 959', ''),
(3090, 'T00968', 'Op?rateur Anglophone', 'Production - Back Office', 'ANDRIANIRINA', 'Aime Jean Jacke', NULL, '25f9e794323b453885f5181f1b624d0b', 'EMPLOYEE', '', NULL, 'ACTIF', 'Homme', '032 79 138 48', '1998-02-23', 'CDI', '2021-12-31', NULL, 'Tel1001.jpg', '102 011 018 745', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `emp_leave`
--

INSERT INTO `emp_leave` (`id`, `em_id`, `id_conge`, `typeid`, `leave_type`, `start_date`, `end_date`, `leave_duration`, `apply_date`, `reason`, `leave_status`, `coms_n`, `leave_status_rh`, `coms_rh`, `id_nplus`, `pj`) VALUES
(30, 'T01089', '1008202410898', 'Sans solde', 'Full Day', '16/08/2024', '17/08/2024', '1 jour', '10/08/2024', 'personnelle', 'Approuvé', '', 'Approuvé', '', 'HARIFETRA  Tovonintsoa', ''),
(31, 'T01089', '1008202410899', 'Maladie', 'More than One day', '30/08/2024', '01/09/2024', '2 jours', '10/08/2024', 'maladie', 'Approuvé', '', 'Approuvé', '', 'HARIFETRA  Tovonintsoa', ''),
(34, 'T01135', '1008202411353', 'Avec solde', 'More than One day', '21/08/2024', '24/08/2024', '3 jours', '10/08/2024', 'PERSONNELLE', 'Approuvé', '', 'Approuvé', '', 'HARIFETRA  Tovonintsoa', '');

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
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `hierarchie`
--

INSERT INTO `hierarchie` (`id`, `em_id`) VALUES
(62, 'T00484'),
(65, 'T00075'),
(66, 'T00002'),
(67, 'T00172');

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
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `notif`
--

INSERT INTO `notif` (`id`, `em_id`, `id_conge`, `st_emp`, `st_n`, `st_admin`) VALUES
(31, 'T01089', '1008202410899', 2, 2, 2),
(30, 'T01089', '1008202410898', 2, 2, 2),
(34, 'T01135', '1008202411353', 2, 2, 2);

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
  `heure_e` varchar(20) NOT NULL,
  `Time_in` varchar(100) DEFAULT NULL,
  `Time_out` varchar(100) DEFAULT NULL,
  `Time_diff` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1437 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pointage`
--

INSERT INTO `pointage` (`id`, `sName`, `Date`, `heure_e`, `Time_in`, `Time_out`, `Time_diff`) VALUES
(7, 'T01057', '25/07/2024', '08:00:01', '08:04:57', '16:59:17', '08:54:20'),
(8, 'T00075', '25/07/2024', '07:30:00', '07:38:56', '16:47:16', '09:08:20'),
(9, 'T00183', '25/07/2024', '06:45:00', '05:48:39', '05:48:39', '00:00:00'),
(10, 'T00222', '25/07/2024', '06:45:00', '08:01:33', '17:58:04', '09:56:31'),
(11, 'T00252', '25/07/2024', '08:00:00', '07:50:28', '19:48:59', '11:58:31'),
(12, 'T00253', '25/07/2024', '06:45:00', '06:45:41', '15:43:23', '08:57:42'),
(13, 'T00266', '25/07/2024', '06:45:00', '06:37:19', '15:43:13', '09:05:54'),
(14, 'T00390', '25/07/2024', '06:45:00', '06:00:10', '16:30:50', '10:30:40'),
(15, 'T00455', '25/07/2024', '06:45:00', '06:38:50', '15:47:23', '09:08:33'),
(16, 'T00468', '25/07/2024', '06:45:00', '06:35:00', '15:42:31', '09:07:31'),
(17, 'T00470', '25/07/2024', '06:45:00', '06:41:22', '14:28:33', '07:47:11'),
(18, 'T00478', '25/07/2024', '06:45:00', '06:27:23', '15:41:42', '09:14:19'),
(19, 'T00484', '25/07/2024', '07:30:00', '07:19:57', '17:44:05', '10:24:08'),
(20, 'T00486', '25/07/2024', '08:00:00', '07:03:15', '17:01:06', '09:57:51'),
(21, 'T00492', '25/07/2024', '06:45:00', '06:59:33', '14:28:56', '07:29:23'),
(22, 'T00501', '25/07/2024', '06:45:00', '06:15:15', '15:47:05', '09:31:50'),
(23, 'T00529', '25/07/2024', '06:45:00', '06:27:53', '15:41:36', '09:13:43'),
(24, 'T00534', '25/07/2024', '06:45:00', '07:07:37', '14:30:15', '07:22:38'),
(25, 'T00546', '25/07/2024', '06:45:00', '06:42:13', '15:42:33', '09:00:20'),
(26, 'T00552', '25/07/2024', '06:45:00', '06:10:23', '17:23:29', '11:13:06'),
(27, 'T00559', '25/07/2024', '06:45:00', '06:42:29', '15:41:55', '08:59:26'),
(28, 'T00596', '25/07/2024', '06:45:00', '06:34:39', '15:42:56', '09:08:17'),
(29, 'T00597', '25/07/2024', '06:45:00', '06:27:06', '15:42:01', '09:14:55'),
(30, 'T00602', '25/07/2024', '06:45:00', '06:33:03', '15:43:18', '09:10:15'),
(31, 'T00606', '25/07/2024', '06:45:00', '06:42:44', '15:43:00', '09:00:16'),
(32, 'T00613', '25/07/2024', '06:45:00', '06:36:01', '15:42:50', '09:06:49'),
(33, 'T00615', '25/07/2024', '06:45:00', '06:39:50', '15:47:35', '09:07:45'),
(34, 'T00628', '25/07/2024', '06:45:00', '06:22:50', '15:42:00', '09:19:10'),
(35, 'T00630', '25/07/2024', '06:45:00', '06:45:32', '15:41:38', '08:56:06'),
(36, 'T00641', '25/07/2024', '06:45:00', '06:35:51', '15:45:11', '09:09:20'),
(37, 'T00653', '25/07/2024', '06:45:00', '06:32:10', '15:40:56', '09:08:46'),
(38, 'T00674', '25/07/2024', '06:45:00', '06:42:34', '14:27:50', '07:45:16'),
(39, 'T00709', '25/07/2024', '06:45:00', '06:04:55', '16:38:57', '10:34:02'),
(40, 'T00722', '25/07/2024', '06:45:00', '06:44:05', '15:44:05', '09:00:00'),
(41, 'T00723', '25/07/2024', '06:45:00', '06:43:43', '15:45:00', '09:01:17'),
(42, 'T00726', '25/07/2024', '06:45:00', '06:40:17', '15:45:41', '09:05:24'),
(43, 'T00727', '25/07/2024', '08:00:00', '08:33:51', '16:42:35', '08:08:44'),
(44, 'T00729', '25/07/2024', '06:45:00', '06:59:06', '17:08:14', '10:09:08'),
(45, 'T00733', '25/07/2024', '06:45:00', '06:26:32', '15:41:29', '09:14:57'),
(46, 'T00777', '25/07/2024', '08:00:00', '07:34:52', '16:00:17', '08:25:25'),
(47, 'T00779', '25/07/2024', '06:45:00', '06:34:51', '15:42:15', '09:07:24'),
(48, 'T00785', '25/07/2024', '06:45:00', '06:30:54', '15:44:28', '09:13:34'),
(49, 'T00787', '25/07/2024', '06:45:00', '06:40:25', '15:47:08', '09:06:43'),
(50, 'T00797', '25/07/2024', '06:45:00', '06:35:54', '15:41:58', '09:06:04'),
(51, 'T00802', '25/07/2024', '06:45:00', '06:49:46', '09:58:47', '03:09:01'),
(52, 'T00808', '25/07/2024', '06:45:00', '06:39:52', '15:43:54', '09:04:02'),
(53, 'T00846', '25/07/2024', '06:45:00', '06:18:45', '15:43:44', '09:24:59'),
(54, 'T00851', '25/07/2024', '06:45:00', '06:30:05', '15:41:57', '09:11:52'),
(55, 'T00864', '25/07/2024', '06:45:00', '06:48:19', '15:41:31', '08:53:12'),
(56, 'T00868', '25/07/2024', '06:45:00', '06:24:11', '15:44:26', '09:20:15'),
(57, 'T00869', '25/07/2024', '06:45:00', '06:26:27', '15:44:34', '09:18:07'),
(58, 'T00875', '25/07/2024', '06:45:00', '06:10:58', '15:44:47', '09:33:49'),
(59, 'T00876', '25/07/2024', '06:45:00', '06:39:30', '15:45:49', '09:06:19'),
(60, 'T00881', '25/07/2024', '06:45:00', '06:39:14', '15:49:01', '09:09:47'),
(61, 'T00884', '25/07/2024', '06:45:00', '06:40:30', '15:46:07', '09:05:37'),
(62, 'T00888', '25/07/2024', '06:45:00', '06:48:51', '14:28:03', '07:39:12'),
(63, 'T00889', '25/07/2024', '06:45:00', '06:27:11', '15:41:19', '09:14:08'),
(64, 'T00893', '25/07/2024', '06:45:00', '06:40:20', '15:41:00', '09:00:40'),
(65, 'T00895', '25/07/2024', '06:45:00', '06:40:07', '14:27:34', '07:47:27'),
(66, 'T00896', '25/07/2024', '06:45:00', '06:33:32', '14:27:15', '07:53:43'),
(67, 'T00897', '25/07/2024', '06:45:00', '06:25:47', '10:57:04', '04:31:17'),
(68, 'T00898', '25/07/2024', '06:45:00', '06:45:34', '15:41:12', '08:55:38'),
(69, 'T00904', '25/07/2024', '06:45:00', '06:43:49', '15:44:08', '09:00:19'),
(70, 'T00905', '25/07/2024', '06:45:00', '06:16:43', '15:41:26', '09:24:43'),
(71, 'T00907', '25/07/2024', '06:45:00', '06:26:24', '15:41:34', '09:15:10'),
(72, 'T00911', '25/07/2024', '06:45:00', '06:34:37', '15:42:39', '09:08:02'),
(73, 'T00916', '25/07/2024', '06:45:00', '06:31:32', '15:43:39', '09:12:07'),
(74, 'T00918', '25/07/2024', '06:45:00', '06:33:09', '08:57:14', '02:24:05'),
(75, 'T00919', '25/07/2024', '06:45:00', '06:38:56', '15:44:14', '09:05:18'),
(76, 'T00930', '25/07/2024', '06:45:00', '06:41:30', '15:44:23', '09:02:53'),
(77, 'T00931', '25/07/2024', '06:45:00', '06:41:59', '15:42:47', '09:00:48'),
(78, 'T00947', '25/07/2024', '06:45:00', '06:39:47', '15:41:14', '09:01:27'),
(79, 'T00948', '25/07/2024', '06:45:00', '06:34:44', '15:45:08', '09:10:24'),
(80, 'T00963', '25/07/2024', '06:45:00', '06:35:04', '15:41:23', '09:06:19'),
(81, 'T00966', '25/07/2024', '06:45:00', '06:37:27', '08:47:04', '02:09:37'),
(82, 'T00970', '25/07/2024', '06:45:00', '06:10:43', '15:42:22', '09:31:39'),
(83, 'T00972', '25/07/2024', '06:45:00', '06:47:01', '13:16:11', '06:29:10'),
(84, 'T01018', '25/07/2024', '06:45:00', '07:07:13', '11:56:22', '04:49:09'),
(85, 'T01019', '25/07/2024', '06:45:00', '06:41:32', '15:41:05', '08:59:33'),
(86, 'T01020', '25/07/2024', '06:45:00', '06:34:25', '15:41:16', '09:06:51'),
(87, 'T01023', '25/07/2024', '06:45:00', '06:19:58', '15:45:02', '09:25:04'),
(88, 'T01025', '25/07/2024', '06:45:00', '06:44:30', '15:42:09', '08:57:39'),
(89, 'T01032', '25/07/2024', '06:45:00', '06:49:44', '15:41:08', '08:51:24'),
(90, 'T01039', '25/07/2024', '06:45:00', '05:53:57', '15:42:11', '09:48:14'),
(91, 'T01041', '25/07/2024', '06:45:00', '06:45:53', '14:27:18', '07:41:25'),
(92, 'T01044', '25/07/2024', '06:45:00', '06:00:12', '15:44:53', '09:44:41'),
(93, 'T01056', '25/07/2024', '06:45:00', '05:45:07', '15:42:29', '09:57:22'),
(94, 'T01068', '25/07/2024', '06:45:00', '06:33:06', '15:42:12', '09:09:06'),
(95, 'T01070', '25/07/2024', '06:45:00', '06:51:45', '15:44:55', '08:53:10'),
(96, 'T01087', '25/07/2024', '06:45:00', '00:16:38', '00:16:38', '00:00:00'),
(97, 'T01090', '25/07/2024', '06:45:00', '06:52:23', '16:59:22', '10:06:59'),
(98, 'T01093', '25/07/2024', '08:00:00', '07:47:49', '16:46:48', '08:58:59'),
(99, 'T01099', '25/07/2024', '06:45:00', '06:37:22', '15:44:51', '09:07:29'),
(100, 'T01112', '25/07/2024', '06:45:00', '06:39:23', '15:42:52', '09:03:29'),
(101, 'T01113', '25/07/2024', '06:45:00', '06:40:52', '15:42:06', '09:01:14'),
(102, 'T01115', '25/07/2024', '06:45:00', '06:40:43', '15:44:12', '09:03:29'),
(103, 'T01116', '25/07/2024', '06:45:00', '06:31:21', '15:43:02', '09:11:41'),
(104, 'T01120', '25/07/2024', '06:45:00', '06:44:36', '15:43:21', '08:58:45'),
(105, 'T01121', '25/07/2024', '06:45:00', '06:27:13', '15:43:52', '09:16:39'),
(106, 'T01124', '25/07/2024', '06:45:00', '06:37:33', '15:42:43', '09:05:10'),
(107, 'T01125', '25/07/2024', '06:45:00', '06:48:15', '15:44:39', '08:56:24'),
(108, 'T01126', '25/07/2024', '06:45:00', '06:40:49', '15:45:04', '09:04:15'),
(109, 'T01135', '25/07/2024', '06:45:00', '06:45:04', '17:29:43', '10:44:39'),
(110, 'T01137', '25/07/2024', '06:45:00', '06:44:11', '15:44:01', '08:59:50'),
(111, 'T01142', '25/07/2024', '06:45:00', '06:44:38', '15:44:30', '08:59:52'),
(112, 'T01149', '25/07/2024', '06:45:00', '06:18:48', '15:42:25', '09:23:37'),
(113, 'T01154', '25/07/2024', '06:45:00', '06:31:50', '15:43:59', '09:12:09'),
(114, 'T01155', '25/07/2024', '06:45:00', '06:56:10', '15:43:33', '08:47:23'),
(115, 'T01158', '25/07/2024', '06:45:00', '06:59:36', '17:54:06', '10:54:30'),
(116, 'T01159', '25/07/2024', '06:45:00', '06:40:21', '15:41:48', '09:01:27'),
(117, 'T01161', '25/07/2024', '06:45:00', '06:39:06', '15:43:35', '09:04:29'),
(118, 'T01162', '25/07/2024', '06:45:00', '05:59:14', '15:42:59', '09:43:45'),
(119, 'T01164', '25/07/2024', '06:45:00', '06:42:25', '15:45:33', '09:03:08'),
(120, 'T01165', '25/07/2024', '06:45:00', '06:40:14', '15:45:36', '09:05:22'),
(121, 'T01166', '25/07/2024', '06:45:00', '06:43:05', '11:59:02', '05:15:57'),
(122, 'T01177', '25/07/2024', '06:45:00', '06:41:06', '15:45:39', '09:04:33'),
(123, 'T01182', '25/07/2024', '06:45:00', '06:21:21', '15:42:40', '09:21:19'),
(124, 'T01186', '25/07/2024', '06:45:00', '06:31:41', '15:42:45', '09:11:04'),
(125, 'T01219', '25/07/2024', '06:45:00', '06:31:16', '15:45:46', '09:14:30'),
(126, 'T01220', '25/07/2024', '06:45:00', '06:33:29', '15:44:03', '09:10:34'),
(127, 'T01221', '25/07/2024', '06:45:00', '06:34:18', '15:43:47', '09:09:29'),
(128, 'T01222', '25/07/2024', '06:45:00', '06:31:36', '15:43:11', '09:11:35'),
(129, 'T01223', '25/07/2024', '06:45:00', '06:38:59', '15:44:49', '09:05:50'),
(130, 'T01224', '25/07/2024', '06:45:00', '06:27:15', '15:42:54', '09:15:39'),
(131, 'T01225', '25/07/2024', '06:45:00', '06:26:55', '15:44:41', '09:17:46'),
(132, 'T01226', '25/07/2024', '06:45:00', '06:41:48', '15:44:44', '09:02:56'),
(133, 'T01231', '25/07/2024', '07:00:00', '06:48:04', '16:04:25', '09:16:21'),
(134, 'T01233', '25/07/2024', '07:00:00', '07:48:19', '07:48:19', '00:00:00'),
(135, 'T01234', '25/07/2024', '06:45:00', '06:25:36', '15:44:58', '09:19:22'),
(136, 'T01235', '25/07/2024', '06:45:00', '06:45:25', '15:44:32', '08:59:07'),
(137, 'T01236', '25/07/2024', '08:00:00', '06:36:31', '15:53:30', '09:16:59'),
(138, 'T00561', '26/07/2024', '06:45:00', '06:30:24', '06:30:24', '00:00:00'),
(139, 'T00567', '26/07/2024', '06:45:00', '06:40:07', '06:40:07', '00:00:00'),
(140, 'T00655', '26/07/2024', '06:45:00', '06:24:33', '06:24:33', '00:00:00'),
(141, 'T00922', '26/07/2024', '06:45:00', '06:37:09', '06:37:09', '00:00:00'),
(142, 'T00944', '26/07/2024', '06:45:00', '06:30:54', '06:30:54', '00:00:00'),
(143, 'T01095', '26/07/2024', '06:45:00', '06:43:06', '06:43:07', '00:00:01'),
(144, 'T01145', '26/07/2024', '06:45:00', '06:43:46', '06:43:46', '00:00:00'),
(145, 'T01133', '25/07/2024', '15:45:00', '15:40:23', '00:21:43', '08:41:20'),
(146, 'T00009', '25/07/2024', '15:45:00', '15:09:30', '00:25:21', '09:15:51'),
(147, 'T00391', '25/07/2024', '15:45:00', '17:42:03', '00:14:34', '06:32:31'),
(148, 'T00452', '25/07/2024', '15:45:00', '15:31:45', '00:21:06', '08:49:21'),
(149, 'T00508', '25/07/2024', '15:45:00', '15:31:48', '00:20:54', '08:49:06'),
(150, 'T00539', '25/07/2024', '15:45:00', '15:04:25', '00:16:48', '09:12:23'),
(151, 'T00590', '25/07/2024', '15:45:00', '15:45:31', '00:16:07', '08:30:36'),
(152, 'T00647', '25/07/2024', '15:45:00', '14:35:38', '00:17:23', '09:41:45'),
(153, 'T00805', '25/07/2024', '15:45:00', '14:18:49', '00:15:53', '09:57:04'),
(154, 'T00822', '25/07/2024', '15:45:00', '15:46:34', '00:16:01', '08:29:27'),
(155, 'T00823', '25/07/2024', '15:45:00', '15:52:35', '00:18:40', '08:26:05'),
(156, 'T00861', '25/07/2024', '15:45:00', '15:34:05', '00:20:31', '08:46:26'),
(157, 'T00867', '25/07/2024', '15:45:00', '15:18:26', '00:22:13', '09:03:47'),
(158, 'T00873', '25/07/2024', '15:45:00', '15:51:53', '00:20:51', '08:28:58'),
(159, 'T00883', '25/07/2024', '15:45:00', '15:49:09', '00:21:15', '08:32:06'),
(160, 'T00917', '25/07/2024', '15:45:00', '15:35:32', '00:17:11', '08:41:39'),
(161, 'T00920', '25/07/2024', '15:45:00', '15:31:39', '00:19:14', '08:47:35'),
(162, 'T00921', '25/07/2024', '15:45:00', '15:12:54', '00:19:52', '09:06:58'),
(163, 'T00927', '25/07/2024', '15:45:00', '14:35:42', '00:18:29', '09:42:47'),
(164, 'T00936', '25/07/2024', '15:45:00', '15:51:29', '00:19:40', '08:28:11'),
(165, 'T00938', '25/07/2024', '15:45:00', '15:25:53', '00:18:49', '08:52:56'),
(166, 'T00950', '25/07/2024', '15:45:00', '00:18:36', '00:18:36', '00:00:00'),
(167, 'T00968', '25/07/2024', '15:45:00', '15:42:18', '06:34:02', '14:51:44'),
(168, 'T00976', '25/07/2024', '15:45:00', '13:29:11', '13:29:11', '00:00:00'),
(169, 'T00977', '25/07/2024', '15:45:00', '15:47:42', '00:17:50', '08:30:08'),
(170, 'T00978', '25/07/2024', '15:45:00', '15:41:33', '00:21:13', '08:39:40'),
(171, 'T00982', '25/07/2024', '15:45:00', '15:33:46', '00:19:47', '08:46:01'),
(172, 'T01016', '25/07/2024', '15:45:00', '15:34:03', '00:18:31', '08:44:28'),
(173, 'T01017', '25/07/2024', '15:45:00', '15:34:08', '00:19:50', '08:45:42'),
(174, 'T01026', '25/07/2024', '15:45:00', '15:31:27', '00:19:00', '08:47:33'),
(175, 'T01030', '25/07/2024', '15:45:00', '15:37:33', '00:22:10', '08:44:37'),
(176, 'T01040', '25/07/2024', '15:45:00', '15:53:40', '00:19:08', '08:25:28'),
(177, 'T01042', '25/07/2024', '15:45:00', '15:47:52', '00:21:46', '08:33:54'),
(178, 'T01047', '25/07/2024', '15:45:00', '15:34:21', '00:20:37', '08:46:16'),
(179, 'T01051', '25/07/2024', '15:45:00', '15:34:19', '00:19:56', '08:45:37'),
(180, 'T01064', '25/07/2024', '15:45:00', '15:34:12', '00:18:38', '08:44:26'),
(181, 'T01069', '25/07/2024', '15:45:00', '16:58:54', '00:19:25', '07:20:31'),
(182, 'T01074', '25/07/2024', '15:45:00', '15:39:30', '00:21:39', '08:42:09'),
(183, 'T01077', '25/07/2024', '15:45:00', '15:38:25', '00:17:55', '08:39:30'),
(184, 'T01078', '25/07/2024', '15:45:00', '15:33:57', '00:22:20', '08:48:23'),
(185, 'T01080', '25/07/2024', '15:45:00', '15:33:42', '00:19:27', '08:45:45'),
(186, 'T01083', '25/07/2024', '15:45:00', '15:11:30', '00:19:35', '09:08:05'),
(187, 'T01089', '25/07/2024', '15:45:00', '16:04:39', '00:22:13', '08:17:34'),
(188, 'T01097', '25/07/2024', '15:45:00', '15:33:53', '00:17:01', '08:43:08'),
(189, 'T01100', '25/07/2024', '15:45:00', '15:21:09', '00:18:51', '08:57:42'),
(190, 'T01101', '25/07/2024', '15:45:00', '15:36:44', '00:18:36', '08:41:52'),
(191, 'T01103', '25/07/2024', '15:45:00', '15:38:30', '00:22:53', '08:44:23'),
(192, 'T01107', '25/07/2024', '15:45:00', '15:28:35', '00:19:42', '08:51:07'),
(193, 'T01109', '25/07/2024', '15:45:00', '15:29:25', '00:18:09', '08:48:44'),
(194, 'T01110', '25/07/2024', '15:45:00', '15:50:34', '00:17:37', '08:27:03'),
(195, 'T01111', '25/07/2024', '15:45:00', '15:23:10', '00:21:31', '08:58:21'),
(196, 'T01117', '25/07/2024', '15:45:00', '15:45:57', '00:17:47', '08:31:50'),
(197, 'T01122', '25/07/2024', '15:45:00', '14:54:10', '00:19:11', '09:25:01'),
(198, 'T01128', '25/07/2024', '15:45:00', '15:44:18', '00:21:58', '08:37:40'),
(199, 'T01129', '25/07/2024', '15:45:00', '15:49:29', '00:21:51', '08:32:22'),
(200, 'T01130', '25/07/2024', '15:45:00', '15:04:23', '00:17:21', '09:12:58'),
(201, 'T01132', '25/07/2024', '15:45:00', '00:20:15', '00:20:15', '00:00:00'),
(202, 'T01144', '25/07/2024', '15:45:00', '15:40:59', '00:18:34', '08:37:35'),
(203, 'T01146', '25/07/2024', '15:45:00', '15:41:21', '00:17:30', '08:36:09'),
(204, 'T01152', '25/07/2024', '15:45:00', '15:17:16', '00:19:33', '09:02:17'),
(205, 'T01157', '25/07/2024', '15:45:00', '00:20:05', '00:20:05', '00:00:00'),
(206, 'T01163', '25/07/2024', '15:45:00', '15:26:46', '00:17:33', '08:50:47'),
(207, 'T01167', '25/07/2024', '15:45:00', '16:34:41', '00:17:43', '07:43:02'),
(208, 'T01168', '25/07/2024', '15:45:00', '15:34:47', '00:16:39', '08:41:52'),
(209, 'T01169', '25/07/2024', '15:45:00', '15:34:16', '00:17:04', '08:42:48'),
(210, 'T01170', '25/07/2024', '15:45:00', '15:39:28', '00:18:16', '08:38:48'),
(211, 'T01172', '25/07/2024', '15:45:00', '15:27:45', '00:17:59', '08:50:14'),
(212, 'T01173', '25/07/2024', '15:45:00', '15:13:58', '00:19:45', '09:05:47'),
(213, 'T01174', '25/07/2024', '15:45:00', '15:46:26', '00:20:27', '08:34:01'),
(214, 'T01175', '25/07/2024', '15:45:00', '15:52:39', '00:17:15', '08:24:36'),
(215, 'T01176', '25/07/2024', '15:45:00', '15:31:31', '00:18:23', '08:46:52'),
(216, 'T01178', '25/07/2024', '15:45:00', '15:44:37', '00:18:26', '08:33:49'),
(217, 'T01179', '25/07/2024', '15:45:00', '00:18:30', '00:18:30', '00:00:00'),
(218, 'T01180', '25/07/2024', '15:45:00', '15:47:55', '00:17:17', '08:29:22'),
(219, 'T01181', '25/07/2024', '15:45:00', '15:44:16', '00:16:59', '08:32:43'),
(220, 'T01184', '25/07/2024', '15:45:00', '16:00:21', '00:16:53', '08:16:32'),
(221, 'T01185', '25/07/2024', '15:45:00', '14:55:47', '00:17:52', '09:22:05'),
(222, 'T01187', '25/07/2024', '15:45:00', '15:33:50', '00:18:47', '08:44:57'),
(223, 'T01188', '25/07/2024', '15:45:00', '15:29:10', '00:16:57', '08:47:47'),
(224, 'T01189', '25/07/2024', '15:45:00', '16:47:06', '00:18:46', '07:31:40'),
(225, 'T01190', '25/07/2024', '15:45:00', '15:45:29', '00:16:46', '08:31:17'),
(226, 'T01193', '25/07/2024', '15:45:00', '15:28:32', '00:17:25', '08:48:53'),
(227, 'T01195', '25/07/2024', '15:45:00', '15:51:31', '00:16:50', '08:25:19'),
(228, 'T01196', '25/07/2024', '15:45:00', '15:47:48', '00:17:41', '08:29:53'),
(229, 'T01197', '25/07/2024', '15:45:00', '15:38:37', '00:19:58', '08:41:21'),
(230, 'T01198', '25/07/2024', '15:45:00', '15:47:29', '00:18:45', '08:31:16'),
(231, 'T01199', '25/07/2024', '15:45:00', '15:36:42', '00:19:30', '08:42:48'),
(232, 'T01200', '25/07/2024', '15:45:00', '15:37:19', '00:18:58', '08:41:39'),
(233, 'T01202', '25/07/2024', '15:45:00', '15:31:36', '00:18:42', '08:47:06'),
(234, 'T01203', '25/07/2024', '15:45:00', '15:37:17', '00:19:02', '08:41:45'),
(235, 'T01204', '25/07/2024', '15:45:00', '15:40:33', '00:21:00', '08:40:27'),
(236, 'T01205', '25/07/2024', '15:45:00', '15:34:36', '00:17:39', '08:43:03'),
(237, 'T01206', '25/07/2024', '15:45:00', '15:44:21', '00:20:05', '08:35:44'),
(238, 'T01212', '25/07/2024', '15:45:00', '15:47:14', '00:18:55', '08:31:41'),
(239, 'T01213', '25/07/2024', '15:45:00', '15:34:39', '00:17:27', '08:42:48'),
(240, 'T01215', '25/07/2024', '15:45:00', '15:25:41', '00:20:24', '08:54:43'),
(241, 'T01216', '25/07/2024', '15:45:00', '15:54:34', '00:22:48', '08:28:14'),
(242, 'T01229', '25/07/2024', '15:45:00', '15:47:32', '00:17:08', '08:29:36'),
(243, 'T01232', '25/07/2024', '15:45:00', '15:46:50', '00:17:19', '08:30:29'),
(244, 'T01057', '23/07/2024', '08:00:01', '06:40:34', '17:06:15', '10:25:41'),
(245, 'T00075', '23/07/2024', '07:30:00', '06:43:46', '15:44:19', '09:00:33'),
(246, 'T00183', '23/07/2024', '06:45:00', '00:18:16', '15:46:26', '15:28:10'),
(247, 'T00222', '23/07/2024', '06:45:00', '06:35:28', '15:47:10', '09:11:42'),
(248, 'T00252', '23/07/2024', '08:00:00', '06:08:26', '14:29:10', '08:20:44'),
(249, 'T00253', '23/07/2024', '06:45:00', '06:36:45', '15:45:17', '09:08:32'),
(250, 'T00266', '23/07/2024', '06:45:00', '08:18:45', '15:43:00', '07:24:15'),
(251, 'T00390', '23/07/2024', '06:45:00', '06:32:27', '17:06:47', '10:34:20'),
(252, 'T00455', '23/07/2024', '06:45:00', '06:31:09', '15:44:10', '09:13:01'),
(253, 'T00468', '23/07/2024', '06:45:00', '06:41:57', '15:45:42', '09:03:45'),
(254, 'T00470', '24/07/2024', '06:45:00', '00:19:24', '15:41:14', '15:21:50'),
(255, 'T00478', '23/07/2024', '06:45:00', '06:22:54', '15:43:53', '09:20:59'),
(256, 'T00484', '23/07/2024', '07:30:00', '06:39:21', '15:33:48', '08:54:27'),
(257, 'T00486', '23/07/2024', '08:00:00', '07:10:16', '15:07:55', '07:57:39'),
(258, 'T00492', '23/07/2024', '06:45:00', '15:45:30', '15:45:31', '00:00:01'),
(259, 'T00501', '23/07/2024', '06:45:00', '06:07:25', '15:45:10', '09:37:45'),
(260, 'T00529', '23/07/2024', '06:45:00', '06:40:08', '15:58:52', '09:18:44'),
(261, 'T00534', '23/07/2024', '06:45:00', '06:46:30', '15:41:10', '08:54:40'),
(262, 'T00546', '23/07/2024', '06:45:00', '06:37:02', '15:46:53', '09:09:51'),
(263, 'T00552', '23/07/2024', '06:45:00', '06:49:29', '15:45:56', '08:56:27'),
(264, 'T00557', '23/07/2024', '06:45:00', '06:27:27', '15:42:01', '09:14:34'),
(265, 'T00559', '23/07/2024', '06:45:00', '06:24:55', '15:42:13', '09:17:18'),
(266, 'T00561', '23/07/2024', '06:45:00', '00:17:22', '15:44:25', '15:27:03'),
(267, 'T00567', '23/07/2024', '06:45:00', '06:28:33', '15:33:17', '09:04:44'),
(268, 'T00596', '23/07/2024', '06:45:00', '00:17:00', '15:54:10', '15:37:10'),
(269, 'T00597', '23/07/2024', '06:45:00', '06:40:49', '15:46:55', '09:06:06'),
(270, 'T00602', '23/07/2024', '06:45:00', '00:17:56', '15:45:32', '15:27:36'),
(271, 'T00606', '24/07/2024', '06:45:00', '00:17:46', '16:17:11', '15:59:25'),
(272, 'T00613', '23/07/2024', '06:45:00', '06:32:02', '15:42:47', '09:10:45'),
(273, 'T00615', '23/07/2024', '06:45:00', '15:24:58', '15:26:17', '00:01:19'),
(274, 'T00628', '23/07/2024', '06:45:00', '06:38:15', '15:41:12', '09:02:57'),
(275, 'T00630', '23/07/2024', '06:45:00', '06:42:03', '15:46:47', '09:04:44'),
(276, 'T00641', '23/07/2024', '06:45:00', '14:23:49', '14:25:08', '00:01:19'),
(277, 'T00649', '23/07/2024', '06:45:00', '00:20:17', '15:49:34', '15:29:17'),
(278, 'T00653', '23/07/2024', '06:45:00', '00:18:50', '06:53:08', '06:34:18'),
(279, 'T00674', '23/07/2024', '06:45:00', '06:39:25', '15:41:27', '09:02:02'),
(280, 'T00709', '23/07/2024', '06:45:00', '06:39:23', '15:44:51', '09:05:28'),
(281, 'T00722', '23/07/2024', '06:45:00', '00:19:20', '15:33:45', '15:14:25'),
(282, 'T00723', '23/07/2024', '06:45:00', '00:21:11', '00:21:12', '00:00:01'),
(283, 'T00726', '23/07/2024', '06:45:00', '05:51:54', '15:41:26', '09:49:32'),
(284, 'T00727', '23/07/2024', '08:00:00', '06:57:45', '14:26:56', '07:29:11'),
(285, 'T00729', '23/07/2024', '06:45:00', '06:01:04', '15:46:37', '09:45:33'),
(286, 'T00733', '24/07/2024', '06:45:00', '00:18:47', '15:43:38', '15:24:51'),
(287, 'T00766', '23/07/2024', '06:45:00', '05:44:11', '15:46:24', '10:02:13'),
(288, 'T00777', '23/07/2024', '08:00:00', '06:33:52', '15:44:49', '09:10:57'),
(289, 'T00779', '23/07/2024', '06:45:00', '00:18:59', '15:43:41', '15:24:42'),
(290, 'T00785', '23/07/2024', '06:45:00', '00:19:27', '15:32:11', '15:12:44'),
(291, 'T00787', '23/07/2024', '06:45:00', '00:20:42', '15:33:52', '15:13:10'),
(292, 'T00797', '23/07/2024', '06:45:00', '00:17:30', '15:26:28', '15:08:58'),
(293, 'T00802', '23/07/2024', '06:45:00', '00:21:38', '16:00:07', '15:38:29'),
(294, 'T00808', '23/07/2024', '06:45:00', '06:51:44', '17:35:47', '10:44:03'),
(295, 'T00846', '23/07/2024', '06:45:00', '00:18:12', '15:26:32', '15:08:20'),
(296, 'T00851', '23/07/2024', '06:45:00', '00:20:13', '15:51:03', '15:30:50'),
(297, 'T00864', '23/07/2024', '06:45:00', '06:23:10', '15:44:16', '09:21:06'),
(298, 'T00868', '23/07/2024', '06:45:00', '00:16:48', '15:43:03', '15:26:15'),
(299, 'T00869', '23/07/2024', '06:45:00', '06:37:55', '15:41:49', '09:03:54'),
(300, 'T00875', '23/07/2024', '06:45:00', '00:16:34', '15:26:20', '15:09:46'),
(301, 'T00876', '23/07/2024', '06:45:00', '06:30:23', '17:53:22', '11:22:59'),
(302, 'T00881', '23/07/2024', '06:45:00', '06:45:46', '15:41:56', '08:56:10'),
(303, 'T00884', '23/07/2024', '06:45:00', '06:22:51', '15:41:34', '09:18:43'),
(304, 'T00888', '23/07/2024', '06:45:00', '06:33:37', '15:41:07', '09:07:30'),
(305, 'T00889', '23/07/2024', '06:45:00', '00:22:29', '15:45:13', '15:22:44'),
(306, 'T00893', '23/07/2024', '06:45:00', '06:43:21', '18:07:43', '11:24:22'),
(307, 'T00895', '23/07/2024', '06:45:00', '06:02:13', '15:44:21', '09:42:08'),
(308, 'T00896', '23/07/2024', '06:45:00', '06:51:50', '15:28:41', '08:36:51'),
(309, 'T00897', '23/07/2024', '06:45:00', '00:17:36', '15:47:07', '15:29:31'),
(310, 'T00898', '23/07/2024', '06:45:00', '00:19:09', '15:33:42', '15:14:33'),
(311, 'T00904', '23/07/2024', '06:45:00', '00:17:51', '15:32:07', '15:14:16'),
(312, 'T00905', '23/07/2024', '06:45:00', '00:18:18', '15:16:17', '14:57:59'),
(313, 'T00907', '23/07/2024', '06:45:00', '00:19:22', '15:23:31', '15:04:09'),
(314, 'T00911', '23/07/2024', '06:45:00', '06:57:49', '15:42:28', '08:44:39'),
(315, 'T00912', '23/07/2024', '06:45:00', '00:18:44', '15:25:10', '15:06:26'),
(316, 'T00916', '23/07/2024', '06:45:00', '00:18:39', '15:51:30', '15:32:51'),
(317, 'T00918', '23/07/2024', '06:45:00', '00:18:41', '15:46:00', '15:27:19'),
(318, 'T00919', '23/07/2024', '06:45:00', '00:20:34', '15:08:02', '14:47:28'),
(319, 'T00930', '23/07/2024', '06:45:00', '00:19:52', '15:50:45', '15:30:53'),
(320, 'T00931', '23/07/2024', '06:45:00', '00:17:05', '15:22:59', '15:05:54'),
(321, 'T00944', '23/07/2024', '06:45:00', '00:19:14', '15:44:06', '15:24:52'),
(322, 'T00947', '23/07/2024', '06:45:00', '06:23:19', '15:41:23', '09:18:04'),
(323, 'T00948', '23/07/2024', '06:45:00', '06:26:16', '15:42:06', '09:15:50'),
(324, 'T00963', '24/07/2024', '06:45:00', '06:36:54', '15:46:30', '09:09:36'),
(325, 'T00966', '23/07/2024', '06:45:00', '00:18:13', '15:35:54', '15:17:41'),
(326, 'T00970', '23/07/2024', '06:45:00', '06:24:23', '08:48:07', '02:23:44'),
(327, 'T00972', '23/07/2024', '06:45:00', '06:34:42', '16:49:24', '10:14:42'),
(328, 'T01018', '23/07/2024', '06:45:00', '15:21:57', '15:22:24', '00:00:27'),
(329, 'T01019', '23/07/2024', '06:45:00', '15:28:14', '15:29:26', '00:01:12'),
(330, 'T01020', '23/07/2024', '06:45:00', '15:40:40', '15:40:44', '00:00:04'),
(331, 'T01023', '24/07/2024', '06:45:00', '15:41:02', '15:41:07', '00:00:05'),
(332, 'T01024', '23/07/2024', '06:45:00', '15:41:12', '15:41:18', '00:00:06'),
(333, 'T01025', '23/07/2024', '06:45:00', '15:42:04', '15:42:13', '00:00:09'),
(334, 'T01032', '23/07/2024', '06:45:00', '06:35:57', '18:59:42', '12:23:45'),
(335, 'T01039', '23/07/2024', '06:45:00', '07:20:28', '15:35:57', '08:15:29'),
(336, 'T01041', '23/07/2024', '06:45:00', '06:45:54', '18:16:54', '11:31:00'),
(337, 'T01044', '23/07/2024', '06:45:00', '00:23:00', '13:44:12', '13:21:12'),
(338, 'T01054', '23/07/2024', '06:45:00', '07:13:52', '17:42:34', '10:28:42'),
(339, 'T01056', '23/07/2024', '06:45:00', '06:36:40', '16:44:04', '10:07:24'),
(340, 'T01068', '23/07/2024', '06:45:00', '06:40:19', '15:42:00', '09:01:41'),
(341, 'T01070', '23/07/2024', '06:45:00', '00:23:31', '06:45:08', '06:21:37'),
(342, 'T01087', '23/07/2024', '06:45:00', '06:26:13', '15:44:50', '09:18:37'),
(343, 'T01090', '23/07/2024', '06:45:00', '06:05:33', '16:40:15', '10:34:42'),
(344, 'T01093', '23/07/2024', '08:00:00', '06:30:13', '15:45:01', '09:14:48'),
(345, 'T01095', '23/07/2024', '06:45:00', '06:42:24', '16:49:21', '10:06:57'),
(346, 'T01099', '23/07/2024', '06:45:00', '15:43:12', '15:43:13', '00:00:01'),
(347, 'T01112', '23/07/2024', '06:45:00', '15:39:20', '15:39:40', '00:00:20'),
(348, 'T01113', '23/07/2024', '06:45:00', '00:22:51', '15:23:35', '15:00:44'),
(349, 'T01115', '23/07/2024', '06:45:00', '06:26:52', '15:43:10', '09:16:18'),
(350, 'T01116', '23/07/2024', '06:45:00', '06:08:50', '15:49:27', '09:40:37'),
(351, 'T01120', '23/07/2024', '06:45:00', '00:20:37', '15:48:47', '15:28:10'),
(352, 'T01121', '23/07/2024', '06:45:00', '06:43:15', '12:47:38', '06:04:23'),
(353, 'T01124', '23/07/2024', '06:45:00', '06:41:59', '14:29:47', '07:47:48'),
(354, 'T01125', '23/07/2024', '06:45:00', '07:00:04', '15:45:51', '08:45:47'),
(355, 'T01126', '23/07/2024', '06:45:00', '06:31:16', '15:44:46', '09:13:30'),
(356, 'T01135', '23/07/2024', '06:45:00', '06:43:32', '15:07:59', '08:24:27'),
(357, 'T01137', '23/07/2024', '06:45:00', '00:20:24', '15:42:44', '15:22:20'),
(358, 'T01142', '23/07/2024', '06:45:00', '00:17:38', '06:40:09', '06:22:31'),
(359, 'T01145', '23/07/2024', '06:45:00', '06:37:17', '15:41:43', '09:04:26'),
(360, 'T01149', '23/07/2024', '06:45:00', '00:18:15', '14:32:25', '14:14:10'),
(361, 'T01154', '23/07/2024', '06:45:00', '00:22:21', '15:28:23', '15:06:02'),
(362, 'T01155', '23/07/2024', '06:45:00', '06:53:13', '15:41:35', '08:48:22'),
(363, 'T01158', '23/07/2024', '06:45:00', '06:31:32', '10:00:39', '03:29:07'),
(364, 'T01159', '23/07/2024', '06:45:00', '00:19:52', '15:40:03', '15:20:11'),
(365, 'T01161', '23/07/2024', '06:45:00', '06:44:59', '15:41:36', '08:56:37'),
(366, 'T01162', '23/07/2024', '06:45:00', '00:20:40', '15:46:41', '15:26:01'),
(367, 'T01164', '23/07/2024', '06:45:00', '00:19:12', '15:34:48', '15:15:36'),
(368, 'T01165', '24/07/2024', '06:45:00', '00:17:32', '15:43:37', '15:26:05'),
(369, 'T01166', '23/07/2024', '06:45:00', '06:34:12', '15:42:46', '09:08:34'),
(370, 'T01177', '23/07/2024', '06:45:00', '06:49:06', '15:42:49', '08:53:43'),
(371, 'T01182', '23/07/2024', '06:45:00', '00:21:29', '15:51:40', '15:30:11'),
(372, 'T01186', '23/07/2024', '06:45:00', '00:22:00', '15:43:23', '15:21:23'),
(373, 'T01219', '23/07/2024', '06:45:00', '00:19:06', '15:16:26', '14:57:20'),
(374, 'T01220', '23/07/2024', '06:45:00', '00:18:37', '15:24:56', '15:06:19'),
(375, 'T01221', '24/07/2024', '06:45:00', '00:19:21', '15:42:34', '15:23:13'),
(376, 'T01222', '23/07/2024', '06:45:00', '15:27:58', '15:29:50', '00:01:52'),
(377, 'T01223', '23/07/2024', '06:45:00', '00:19:31', '15:36:16', '15:16:45'),
(378, 'T01224', '23/07/2024', '06:45:00', '00:18:59', '15:22:34', '15:03:35'),
(379, 'T01225', '23/07/2024', '06:45:00', '00:18:53', '15:49:10', '15:30:17'),
(380, 'T01226', '23/07/2024', '06:45:00', '00:21:27', '15:47:46', '15:26:19'),
(381, 'T01231', '23/07/2024', '07:00:00', '06:32:49', '15:45:32', '09:12:43'),
(382, 'T01233', '23/07/2024', '07:00:00', '06:48:26', '15:45:20', '08:56:54'),
(383, 'T01234', '23/07/2024', '06:45:00', '06:40:24', '16:32:11', '09:51:47'),
(384, 'T01235', '23/07/2024', '06:45:00', '09:29:03', '17:38:50', '08:09:47'),
(385, 'T01236', '23/07/2024', '08:00:00', '06:27:10', '15:44:53', '09:17:43'),
(386, 'T01133', '23/07/2024', '15:45:00', '15:45:00', '07:55:54', '16:10:54'),
(387, 'T00009', '23/07/2024', '15:45:00', '15:42:23', '06:29:10', '14:46:47'),
(388, 'T00391', '23/07/2024', '15:45:00', '16:04:05', '15:46:38', '23:42:33'),
(389, 'T00452', '23/07/2024', '15:45:00', '15:44:00', '06:42:43', '14:58:43'),
(390, 'T00508', '23/07/2024', '15:45:00', '15:43:20', '00:20:37', '08:37:17'),
(391, 'T00539', '23/07/2024', '15:45:00', '14:28:02', '06:41:04', '16:13:02'),
(392, 'T00590', '23/07/2024', '15:45:00', '15:44:57', '00:19:57', '08:35:00'),
(393, 'T00647', '23/07/2024', '15:45:00', '15:29:59', '00:21:22', '08:51:23'),
(394, 'T00805', '24/07/2024', '15:45:00', '07:40:32', '07:40:32', '00:00:00'),
(395, 'T00822', '23/07/2024', '15:45:00', '15:46:43', '06:40:41', '14:53:58'),
(396, 'T00823', '23/07/2024', '15:45:00', '15:34:16', '00:19:44', '08:45:28'),
(397, 'T00861', '23/07/2024', '15:45:00', '15:43:05', '06:44:30', '15:01:25'),
(398, 'T00867', '23/07/2024', '15:45:00', '15:45:53', '06:20:21', '14:34:28'),
(399, 'T00873', '23/07/2024', '15:45:00', '15:37:56', '00:20:30', '08:42:34'),
(400, 'T00883', '23/07/2024', '15:45:00', '15:34:03', '00:17:44', '08:43:41'),
(401, 'T00917', '23/07/2024', '15:45:00', '15:38:27', '00:18:32', '08:40:05'),
(402, 'T00920', '23/07/2024', '15:45:00', '15:54:09', '00:17:57', '08:23:48'),
(403, 'T00921', '23/07/2024', '15:45:00', '15:17:42', '15:47:50', '00:30:08'),
(404, 'T00927', '23/07/2024', '15:45:00', '15:39:36', '00:19:07', '08:39:31'),
(405, 'T00936', '23/07/2024', '15:45:00', '15:49:06', '00:17:40', '08:28:34'),
(406, 'T00938', '23/07/2024', '15:45:00', '15:08:12', '00:20:18', '09:12:06'),
(407, 'T00945', '23/07/2024', '15:45:00', '15:47:06', '00:19:02', '08:31:56'),
(408, 'T00950', '23/07/2024', '15:45:00', '15:42:49', '06:30:18', '14:47:29'),
(409, 'T00968', '23/07/2024', '15:45:00', '15:48:33', '08:02:07', '16:13:34'),
(410, 'T00976', '23/07/2024', '15:45:00', '17:57:51', '00:17:22', '06:19:31'),
(411, 'T00977', '23/07/2024', '15:45:00', '00:18:43', '00:20:17', '00:01:34'),
(412, 'T00978', '23/07/2024', '15:45:00', '06:18:08', '06:32:34', '00:14:26'),
(413, 'T00982', '23/07/2024', '15:45:00', '06:45:37', '06:45:47', '00:00:10'),
(414, 'T01016', '23/07/2024', '15:45:00', '07:00:00', '11:58:57', '04:58:57'),
(415, 'T01017', '23/07/2024', '15:45:00', '15:21:35', '15:21:51', '00:00:16'),
(416, 'T01026', '23/07/2024', '15:45:00', '15:44:11', '15:45:12', '00:01:01'),
(417, 'T01029', '23/07/2024', '15:45:00', '15:48:41', '15:48:45', '00:00:04'),
(418, 'T01030', '23/07/2024', '15:45:00', '17:42:29', '17:42:32', '00:00:03'),
(419, 'T01040', '23/07/2024', '15:45:00', '17:16:23', '07:44:48', '14:28:25'),
(420, 'T01042', '23/07/2024', '15:45:00', '15:43:00', '00:15:05', '08:32:05'),
(421, 'T01047', '23/07/2024', '15:45:00', '15:49:52', '06:41:13', '14:51:21'),
(422, 'T01051', '23/07/2024', '15:45:00', '14:29:01', '15:41:33', '01:12:32'),
(423, 'T01064', '23/07/2024', '15:45:00', '15:46:01', '06:28:16', '14:42:15'),
(424, 'T01069', '23/07/2024', '15:45:00', '13:58:02', '06:24:08', '16:26:06'),
(425, 'T01074', '23/07/2024', '15:45:00', '15:43:48', '07:54:46', '16:10:58'),
(426, 'T01077', '23/07/2024', '15:45:00', '15:41:22', '06:26:32', '14:45:10'),
(427, 'T01078', '23/07/2024', '15:45:00', '15:43:33', '15:43:18', '23:59:45'),
(428, 'T01080', '23/07/2024', '15:45:00', '15:43:06', '06:24:04', '14:40:58'),
(429, 'T01083', '23/07/2024', '15:45:00', '15:44:35', '06:37:34', '14:52:59'),
(430, 'T01097', '23/07/2024', '15:45:00', '16:47:03', '06:23:16', '13:36:13'),
(431, 'T01100', '23/07/2024', '15:45:00', '15:43:04', '06:33:40', '14:50:36'),
(432, 'T01101', '24/07/2024', '15:45:00', '15:44:56', '15:44:56', '00:00:00'),
(433, 'T01103', '23/07/2024', '15:45:00', '15:45:49', '06:31:01', '14:45:12'),
(434, 'T01107', '23/07/2024', '15:45:00', '15:45:14', '06:40:06', '14:54:52'),
(435, 'T01109', '23/07/2024', '15:45:00', '15:45:06', '00:16:24', '08:31:18'),
(436, 'T01110', '23/07/2024', '15:45:00', '15:45:58', '06:23:06', '14:37:08'),
(437, 'T01111', '23/07/2024', '15:45:00', '15:42:18', '00:20:42', '08:38:24'),
(438, 'T01117', '23/07/2024', '15:45:00', '15:44:32', '06:27:21', '14:42:49'),
(439, 'T01122', '23/07/2024', '15:45:00', '15:42:09', '06:37:36', '14:55:27'),
(440, 'T01128', '23/07/2024', '15:45:00', '15:41:51', '06:15:36', '14:33:45'),
(441, 'T01129', '23/07/2024', '15:45:00', '15:42:37', '00:17:45', '08:35:08'),
(442, 'T01130', '23/07/2024', '15:45:00', '15:42:54', '06:39:38', '14:56:44'),
(443, 'T01132', '23/07/2024', '15:45:00', '15:10:17', '00:17:06', '09:06:49'),
(444, 'T01138', '23/07/2024', '15:45:00', '15:29:29', '14:27:37', '22:58:08'),
(445, 'T01144', '23/07/2024', '15:45:00', '15:46:14', '06:36:30', '14:50:16'),
(446, 'T01146', '23/07/2024', '15:45:00', '15:41:57', '06:47:59', '15:06:02'),
(447, 'T01152', '23/07/2024', '15:45:00', '15:45:44', '00:19:48', '08:34:04'),
(448, 'T01157', '23/07/2024', '15:45:00', '15:41:38', '06:18:14', '14:36:36'),
(449, 'T01163', '23/07/2024', '15:45:00', '15:44:03', '00:20:11', '08:36:08'),
(450, 'T01167', '23/07/2024', '15:45:00', '15:23:03', '00:20:05', '08:57:02'),
(451, 'T01168', '23/07/2024', '15:45:00', '15:31:48', '00:21:53', '08:50:05'),
(452, 'T01169', '23/07/2024', '15:45:00', '15:27:49', '00:18:40', '08:50:51'),
(453, 'T01170', '23/07/2024', '15:45:00', '14:45:53', '00:18:28', '09:32:35'),
(454, 'T01172', '23/07/2024', '15:45:00', '15:07:08', '07:51:07', '16:43:59'),
(455, 'T01173', '23/07/2024', '15:45:00', '17:06:07', '06:31:48', '13:25:41'),
(456, 'T01174', '23/07/2024', '15:45:00', '15:47:01', '00:19:26', '08:32:25'),
(457, 'T01175', '23/07/2024', '15:45:00', '15:44:28', '14:43:55', '22:59:27'),
(458, 'T01176', '23/07/2024', '15:45:00', '15:51:02', '00:19:46', '08:28:44'),
(459, 'T01178', '23/07/2024', '15:45:00', '15:42:07', '00:21:19', '08:39:12'),
(460, 'T01179', '23/07/2024', '15:45:00', '15:46:50', '00:16:41', '08:29:51'),
(461, 'T01180', '23/07/2024', '15:45:00', '15:24:28', '06:43:58', '15:19:30'),
(462, 'T01181', '23/07/2024', '15:45:00', '15:44:23', '00:19:17', '08:34:54'),
(463, 'T01184', '23/07/2024', '15:45:00', '15:26:53', '00:20:18', '08:53:25'),
(464, 'T01185', '23/07/2024', '15:45:00', '15:43:08', '06:39:29', '14:56:21'),
(465, 'T01187', '23/07/2024', '15:45:00', '15:43:26', '06:53:16', '15:09:50'),
(466, 'T01188', '23/07/2024', '15:45:00', '00:20:53', '06:23:04', '06:02:11'),
(467, 'T01189', '23/07/2024', '15:45:00', '15:42:11', '06:25:21', '14:43:10'),
(468, 'T01190', '23/07/2024', '15:45:00', '15:44:43', '00:22:10', '08:37:27'),
(469, 'T01193', '23/07/2024', '15:45:00', '15:37:22', '06:39:43', '15:02:21'),
(470, 'T01195', '23/07/2024', '15:45:00', '15:42:41', '06:30:18', '14:47:37'),
(471, 'T01196', '23/07/2024', '15:45:00', '15:43:21', '00:18:00', '08:34:39'),
(472, 'T01197', '23/07/2024', '15:45:00', '15:26:37', '06:31:37', '15:05:00'),
(473, 'T01198', '23/07/2024', '15:45:00', '15:43:30', '06:45:56', '15:02:26'),
(474, 'T01199', '23/07/2024', '15:45:00', '15:46:06', '00:17:19', '08:31:13'),
(475, 'T01200', '23/07/2024', '15:45:00', '15:39:28', '00:16:43', '08:37:15'),
(476, 'T01202', '24/07/2024', '15:45:00', '15:31:52', '15:31:52', '00:00:00'),
(477, 'T01203', '23/07/2024', '15:45:00', '15:28:29', '00:19:38', '08:51:09'),
(478, 'T01204', '23/07/2024', '15:45:00', '15:37:17', '00:17:28', '08:40:11'),
(479, 'T01205', '23/07/2024', '15:45:00', '15:39:23', '00:17:10', '08:37:47'),
(480, 'T01206', '23/07/2024', '15:45:00', '15:53:19', '00:18:46', '08:25:27'),
(481, 'T01207', '23/07/2024', '15:45:00', '15:35:20', '00:17:42', '08:42:22'),
(482, 'T01212', '23/07/2024', '15:45:00', '16:03:04', '00:17:16', '08:14:12'),
(483, 'T01213', '23/07/2024', '15:45:00', '14:59:04', '00:17:51', '09:18:47'),
(484, 'T01215', '23/07/2024', '15:45:00', '15:28:05', '00:16:48', '08:48:43'),
(485, 'T01216', '23/07/2024', '15:45:00', '15:50:02', '15:25:28', '23:35:26'),
(486, 'T01229', '23/07/2024', '15:45:00', '15:46:20', '06:26:00', '14:39:40'),
(487, 'T01232', '23/07/2024', '15:45:00', '15:45:07', '06:31:45', '14:46:38'),
(488, 'T01057', '30/07/2024', '08:00:01', '07:59:54', '17:00:02', '09:00:08'),
(489, 'T00183', '30/07/2024', '06:45:00', '06:09:56', '16:59:26', '10:49:30'),
(490, 'T00252', '30/07/2024', '08:00:00', '07:42:18', '19:11:57', '11:29:39'),
(491, 'T00253', '30/07/2024', '06:45:00', '06:48:59', '15:48:57', '08:59:58'),
(492, 'T00266', '30/07/2024', '06:45:00', '06:20:16', '15:42:54', '09:22:38'),
(493, 'T00390', '30/07/2024', '06:45:00', '06:15:20', '16:27:43', '10:12:23'),
(494, 'T00455', '30/07/2024', '06:45:00', '06:45:53', '15:46:07', '09:00:14'),
(495, 'T00468', '30/07/2024', '06:45:00', '06:28:51', '15:41:44', '09:12:53'),
(496, 'T00470', '30/07/2024', '06:45:00', '06:39:15', '14:31:03', '07:51:48'),
(497, 'T00478', '30/07/2024', '06:45:00', '06:35:22', '15:43:25', '09:08:03'),
(498, 'T00484', '30/07/2024', '07:30:00', '07:21:50', '17:51:12', '10:29:22'),
(499, 'T00486', '30/07/2024', '08:00:00', '07:09:33', '16:57:44', '09:48:11'),
(500, 'T00492', '30/07/2024', '06:45:00', '06:32:54', '14:28:53', '07:55:59'),
(501, 'T00501', '30/07/2024', '06:45:00', '06:19:46', '15:46:56', '09:27:10'),
(502, 'T00529', '30/07/2024', '06:45:00', '06:26:34', '15:42:18', '09:15:44'),
(503, 'T00534', '30/07/2024', '06:45:00', '06:58:49', '15:22:01', '08:23:12'),
(504, 'T00546', '30/07/2024', '06:45:00', '06:38:58', '15:41:27', '09:02:29'),
(505, 'T00552', '30/07/2024', '06:45:00', '05:55:53', '17:31:59', '11:36:06'),
(506, 'T00557', '31/07/2024', '06:45:00', '06:01:32', '06:01:32', '00:00:00'),
(507, 'T00559', '30/07/2024', '06:45:00', '06:39:25', '15:42:40', '09:03:15'),
(508, 'T00561', '30/07/2024', '06:45:00', '06:31:12', '15:44:22', '09:13:10'),
(509, 'T00567', '30/07/2024', '06:45:00', '06:38:44', '15:41:26', '09:02:42'),
(510, 'T00597', '31/07/2024', '06:45:00', '06:37:05', '06:37:05', '00:00:00'),
(511, 'T00602', '30/07/2024', '06:45:00', '06:36:13', '15:41:57', '09:05:44'),
(512, 'T00606', '30/07/2024', '06:45:00', '06:39:32', '15:42:47', '09:03:15'),
(513, 'T00613', '30/07/2024', '06:45:00', '06:41:54', '15:44:27', '09:02:33'),
(514, 'T00615', '30/07/2024', '06:45:00', '06:44:04', '15:45:01', '09:00:57'),
(515, 'T00628', '30/07/2024', '06:45:00', '06:23:17', '15:43:13', '09:19:56'),
(516, 'T00630', '30/07/2024', '06:45:00', '06:39:28', '15:42:07', '09:02:39'),
(517, 'T00641', '30/07/2024', '06:45:00', '06:37:15', '15:44:57', '09:07:42'),
(518, 'T00653', '30/07/2024', '06:45:00', '06:30:22', '15:41:17', '09:10:55'),
(519, 'T00655', '30/07/2024', '06:45:00', '06:30:07', '15:45:39', '09:15:32'),
(520, 'T00674', '30/07/2024', '06:45:00', '06:26:40', '15:44:42', '09:18:02'),
(521, 'T00709', '30/07/2024', '06:45:00', '06:21:01', '16:38:07', '10:17:06'),
(522, 'T00722', '31/07/2024', '06:45:00', '06:44:49', '06:44:49', '00:00:00'),
(523, 'T00723', '30/07/2024', '06:45:00', '06:52:46', '15:42:11', '08:49:25'),
(524, 'T00726', '30/07/2024', '06:45:00', '06:34:30', '15:44:10', '09:09:40'),
(525, 'T00727', '30/07/2024', '08:00:00', '10:49:09', '17:08:01', '06:18:52'),
(526, 'T00729', '30/07/2024', '06:45:00', '06:52:41', '16:43:36', '09:50:55'),
(527, 'T00733', '30/07/2024', '06:45:00', '06:02:37', '15:41:01', '09:38:24'),
(528, 'T00766', '30/07/2024', '06:45:00', '06:40:29', '15:44:19', '09:03:50'),
(529, 'T00777', '30/07/2024', '08:00:00', '07:22:36', '16:12:44', '08:50:08'),
(530, 'T00785', '30/07/2024', '06:45:00', '06:33:54', '15:44:23', '09:10:29'),
(531, 'T00787', '30/07/2024', '06:45:00', '06:42:17', '15:47:15', '09:04:58'),
(532, 'T00797', '30/07/2024', '06:45:00', '06:31:14', '15:44:37', '09:13:23'),
(533, 'T00802', '30/07/2024', '06:45:00', '06:41:42', '15:44:04', '09:02:22'),
(534, 'T00808', '30/07/2024', '06:45:00', '06:40:16', '15:43:39', '09:03:23'),
(535, 'T00832', '30/07/2024', '06:45:00', '06:44:30', '15:41:03', '08:56:33'),
(536, 'T00846', '30/07/2024', '06:45:00', '06:35:42', '15:42:05', '09:06:23'),
(537, 'T00851', '30/07/2024', '06:45:00', '06:27:08', '15:45:00', '09:17:52'),
(538, 'T00864', '30/07/2024', '06:45:00', '06:38:23', '15:42:15', '09:03:52'),
(539, 'T00869', '30/07/2024', '06:45:00', '06:38:06', '08:43:37', '02:05:31'),
(540, 'T00870', '30/07/2024', '06:45:00', '06:33:59', '15:44:08', '09:10:09'),
(541, 'T00875', '30/07/2024', '06:45:00', '06:17:05', '15:44:06', '09:27:01'),
(542, 'T00881', '30/07/2024', '06:45:00', '06:42:22', '15:44:48', '09:02:26'),
(543, 'T00884', '30/07/2024', '06:45:00', '06:39:44', '15:46:09', '09:06:25'),
(544, 'T00888', '30/07/2024', '06:45:00', '06:44:01', '14:27:25', '07:43:24'),
(545, 'T00889', '30/07/2024', '06:45:00', '06:42:04', '15:41:10', '08:59:06'),
(546, 'T00893', '30/07/2024', '06:45:00', '06:40:09', '15:40:58', '09:00:49'),
(547, 'T00895', '30/07/2024', '06:45:00', '06:38:10', '06:38:13', '00:00:03'),
(548, 'T00896', '30/07/2024', '06:45:00', '06:33:19', '14:27:51', '07:54:32'),
(549, 'T00897', '30/07/2024', '06:45:00', '06:48:32', '15:46:15', '08:57:43'),
(550, 'T00898', '30/07/2024', '06:45:00', '06:39:36', '15:43:06', '09:03:30'),
(551, 'T00904', '30/07/2024', '06:45:00', '06:38:20', '15:44:25', '09:06:05'),
(552, 'T00905', '30/07/2024', '06:45:00', '06:21:08', '15:44:53', '09:23:45'),
(553, 'T00907', '30/07/2024', '06:45:00', '06:20:28', '15:42:03', '09:21:35'),
(554, 'T00911', '30/07/2024', '06:45:00', '06:36:54', '15:45:17', '09:08:23'),
(555, 'T00912', '30/07/2024', '06:45:00', '06:28:29', '15:43:40', '09:15:11'),
(556, 'T00916', '30/07/2024', '06:45:00', '06:32:11', '15:42:01', '09:09:50'),
(557, 'T00918', '30/07/2024', '06:45:00', '06:28:27', '15:44:37', '09:16:10'),
(558, 'T00919', '30/07/2024', '06:45:00', '06:41:28', '15:41:59', '09:00:31'),
(559, 'T00922', '30/07/2024', '06:45:00', '06:42:13', '15:42:34', '09:00:21'),
(560, 'T00930', '30/07/2024', '06:45:00', '06:49:51', '15:45:36', '08:55:45'),
(561, 'T00931', '30/07/2024', '06:45:00', '06:41:48', '15:41:31', '08:59:43'),
(562, 'T00944', '30/07/2024', '06:45:00', '06:25:43', '14:27:00', '08:01:17'),
(563, 'T00947', '30/07/2024', '06:45:00', '06:40:18', '15:41:51', '09:01:33'),
(564, 'T00948', '30/07/2024', '06:45:00', '06:22:43', '15:46:25', '09:23:42'),
(565, 'T00963', '30/07/2024', '06:45:00', '06:40:13', '15:41:29', '09:01:16'),
(566, 'T00966', '30/07/2024', '06:45:00', '06:38:04', '15:41:41', '09:03:37'),
(567, 'T00970', '30/07/2024', '06:45:00', '06:02:48', '15:41:34', '09:38:46'),
(568, 'T01015', '30/07/2024', '06:45:00', '06:20:00', '15:43:31', '09:23:31'),
(569, 'T01018', '31/07/2024', '06:45:00', '06:51:02', '07:41:02', '00:50:00'),
(570, 'T01019', '30/07/2024', '06:45:00', '06:38:19', '15:41:39', '09:03:20'),
(571, 'T01020', '30/07/2024', '06:45:00', '06:34:34', '11:12:14', '04:37:40'),
(572, 'T01023', '30/07/2024', '06:45:00', '06:24:05', '15:42:41', '09:18:36'),
(573, 'T01024', '30/07/2024', '06:45:00', '06:26:58', '15:44:54', '09:17:56'),
(574, 'T01025', '30/07/2024', '06:45:00', '06:47:26', '15:41:12', '08:53:46'),
(575, 'T01039', '30/07/2024', '06:45:00', '05:51:15', '15:42:31', '09:51:16'),
(576, 'T01041', '30/07/2024', '06:45:00', '06:46:21', '14:26:56', '07:40:35'),
(577, 'T01044', '30/07/2024', '06:45:00', '06:01:12', '15:45:26', '09:44:14'),
(578, 'T01054', '30/07/2024', '06:45:00', '05:51:56', '15:44:02', '09:52:06'),
(579, 'T01056', '30/07/2024', '06:45:00', '05:51:52', '15:42:50', '09:50:58'),
(580, 'T01068', '30/07/2024', '06:45:00', '06:30:50', '15:43:02', '09:12:12'),
(581, 'T01070', '30/07/2024', '06:45:00', '06:49:03', '15:45:58', '08:56:55'),
(582, 'T01076', '30/07/2024', '06:45:00', '06:38:37', '15:41:20', '09:02:43'),
(583, 'T01087', '30/07/2024', '06:45:00', '16:40:13', '16:40:13', '00:00:00'),
(584, 'T01090', '30/07/2024', '06:45:00', '06:37:34', '15:59:55', '09:22:21'),
(585, 'T01093', '30/07/2024', '08:00:00', '07:31:38', '16:49:45', '09:18:07'),
(586, 'T01095', '30/07/2024', '06:45:00', '06:29:07', '15:41:50', '09:12:43'),
(587, 'T01099', '30/07/2024', '06:45:00', '06:30:52', '15:45:51', '09:14:59'),
(588, 'T01112', '30/07/2024', '06:45:00', '06:48:23', '15:42:22', '08:53:59'),
(589, 'T01113', '30/07/2024', '06:45:00', '06:40:07', '15:43:18', '09:03:11'),
(590, 'T01115', '30/07/2024', '06:45:00', '06:41:07', '15:42:39', '09:01:32'),
(591, 'T01116', '30/07/2024', '06:45:00', '06:21:45', '15:43:10', '09:21:25'),
(592, 'T01120', '30/07/2024', '06:45:00', '06:44:17', '15:42:56', '08:58:39'),
(593, 'T01121', '30/07/2024', '06:45:00', '06:36:56', '15:43:44', '09:06:48'),
(594, 'T01124', '31/07/2024', '06:45:00', '06:29:44', '06:29:44', '00:00:00'),
(595, 'T01125', '30/07/2024', '06:45:00', '06:46:58', '15:43:34', '08:56:36'),
(596, 'T01126', '30/07/2024', '06:45:00', '06:36:59', '15:45:21', '09:08:22'),
(597, 'T01135', '30/07/2024', '06:45:00', '06:40:01', '17:12:07', '10:32:06'),
(598, 'T01137', '30/07/2024', '06:45:00', '06:40:12', '15:44:16', '09:04:04'),
(599, 'T01142', '31/07/2024', '06:45:00', '06:51:34', '06:51:34', '00:00:00'),
(600, 'T01145', '30/07/2024', '06:45:00', '06:35:38', '15:43:33', '09:07:55'),
(601, 'T01149', '30/07/2024', '06:45:00', '06:35:33', '15:41:22', '09:05:49'),
(602, 'T01154', '30/07/2024', '06:45:00', '06:28:21', '15:43:27', '09:15:06'),
(603, 'T01155', '30/07/2024', '06:45:00', '06:41:24', '15:43:23', '09:01:59'),
(604, 'T01158', '30/07/2024', '06:45:00', '07:07:12', '19:36:18', '12:29:06'),
(605, 'T01159', '30/07/2024', '06:45:00', '06:26:43', '15:41:35', '09:14:52'),
(606, 'T01161', '30/07/2024', '06:45:00', '06:41:02', '15:45:30', '09:04:28'),
(607, 'T01162', '30/07/2024', '06:45:00', '06:01:48', '15:45:14', '09:43:26'),
(608, 'T01164', '30/07/2024', '06:45:00', '06:31:50', '15:45:53', '09:14:03'),
(609, 'T01165', '30/07/2024', '06:45:00', '06:33:11', '15:46:00', '09:12:49'),
(610, 'T01166', '30/07/2024', '06:45:00', '06:39:02', '12:26:40', '05:47:38'),
(611, 'T01177', '31/07/2024', '06:45:00', '06:44:41', '06:44:41', '00:00:00'),
(612, 'T01182', '30/07/2024', '06:45:00', '06:27:16', '15:45:23', '09:18:07'),
(613, 'T01186', '30/07/2024', '06:45:00', '06:37:02', '15:45:45', '09:08:43'),
(614, 'T01219', '30/07/2024', '06:45:00', '06:21:41', '15:46:12', '09:24:31'),
(615, 'T01220', '30/07/2024', '06:45:00', '06:26:38', '15:43:04', '09:16:26'),
(616, 'T01221', '30/07/2024', '06:45:00', '06:24:40', '15:45:41', '09:21:01'),
(617, 'T01222', '30/07/2024', '06:45:00', '06:17:43', '15:44:46', '09:27:03'),
(618, 'T01223', '30/07/2024', '06:45:00', '06:38:48', '15:44:50', '09:06:02'),
(619, 'T01224', '30/07/2024', '06:45:00', '06:35:57', '15:43:30', '09:07:33'),
(620, 'T01225', '30/07/2024', '06:45:00', '06:39:56', '15:46:23', '09:06:27'),
(621, 'T01226', '30/07/2024', '06:45:00', '06:38:01', '15:45:33', '09:07:32'),
(622, 'T01231', '30/07/2024', '07:00:00', '06:42:00', '16:07:57', '09:25:57'),
(623, 'T01233', '30/07/2024', '07:00:00', '08:00:11', '18:46:33', '10:46:22'),
(624, 'T01234', '30/07/2024', '06:45:00', '06:20:06', '15:45:05', '09:24:59'),
(625, 'T01235', '30/07/2024', '06:45:00', '06:36:10', '15:45:28', '09:09:18'),
(626, 'T01236', '30/07/2024', '08:00:00', '06:41:32', '15:45:10', '09:03:38'),
(627, 'T00009', '30/07/2024', '15:45:00', '14:57:29', '00:27:29', '09:30:00'),
(628, 'T00391', '30/07/2024', '15:45:00', '16:01:39', '00:12:55', '08:11:16'),
(629, 'T00452', '30/07/2024', '15:45:00', '15:36:37', '00:22:29', '08:45:52'),
(630, 'T00508', '30/07/2024', '15:45:00', '15:36:42', '00:21:40', '08:44:58'),
(631, 'T00539', '30/07/2024', '15:45:00', '14:48:28', '00:16:57', '09:28:29'),
(632, 'T00590', '30/07/2024', '15:45:00', '15:42:09', '00:16:11', '08:34:02'),
(633, 'T00647', '30/07/2024', '15:45:00', '14:45:40', '00:19:36', '09:33:56'),
(634, 'T00805', '30/07/2024', '15:45:00', '00:21:14', '00:21:14', '00:00:00'),
(635, 'T00822', '30/07/2024', '15:45:00', '15:40:04', '00:15:59', '08:35:55'),
(636, 'T00823', '30/07/2024', '15:45:00', '15:40:10', '00:19:44', '08:39:34'),
(637, 'T00861', '30/07/2024', '15:45:00', '15:43:59', '00:19:56', '08:35:57'),
(638, 'T00867', '30/07/2024', '15:45:00', '14:58:45', '00:22:46', '09:24:01'),
(639, 'T00873', '30/07/2024', '15:45:00', '15:47:05', '00:19:41', '08:32:36'),
(640, 'T00883', '30/07/2024', '15:45:00', '15:48:08', '00:21:48', '08:33:40'),
(641, 'T00917', '30/07/2024', '15:45:00', '15:42:32', '00:16:54', '08:34:22'),
(642, 'T00920', '30/07/2024', '15:45:00', '15:43:50', '00:18:42', '08:34:52'),
(643, 'T00921', '30/07/2024', '15:45:00', '15:47:24', '00:19:29', '08:32:05'),
(644, 'T00927', '30/07/2024', '15:45:00', '14:45:33', '00:22:39', '09:37:06'),
(645, 'T00936', '30/07/2024', '15:45:00', '15:43:42', '00:21:20', '08:37:38'),
(646, 'T00938', '30/07/2024', '15:45:00', '15:21:40', '00:17:14', '08:55:34'),
(647, 'T00945', '30/07/2024', '15:45:00', '15:40:13', '00:20:39', '08:40:26'),
(648, 'T00950', '30/07/2024', '15:45:00', '15:46:03', '00:17:08', '08:31:05'),
(649, 'T00968', '30/07/2024', '15:45:00', '15:41:19', '06:28:03', '14:46:44'),
(650, 'T00976', '30/07/2024', '15:45:00', '15:33:11', '00:20:33', '08:47:22'),
(651, 'T00977', '30/07/2024', '15:45:00', '15:39:25', '00:17:00', '08:37:35'),
(652, 'T00978', '30/07/2024', '15:45:00', '15:22:39', '00:15:53', '08:53:14'),
(653, 'T00982', '30/07/2024', '15:45:00', '15:43:53', '00:23:43', '08:39:50'),
(654, 'T00986', '30/07/2024', '15:45:00', '15:29:45', '00:19:10', '08:49:25'),
(655, 'T00997', '30/07/2024', '15:45:00', '00:22:33', '00:22:33', '00:00:00');
INSERT INTO `pointage` (`id`, `sName`, `Date`, `heure_e`, `Time_in`, `Time_out`, `Time_diff`) VALUES
(656, 'T01016', '30/07/2024', '15:45:00', '15:30:27', '00:19:25', '08:48:58'),
(657, 'T01017', '30/07/2024', '15:45:00', '15:30:30', '00:19:02', '08:48:32'),
(658, 'T01026', '30/07/2024', '15:45:00', '15:30:32', '00:19:18', '08:48:46'),
(659, 'T01029', '30/07/2024', '15:45:00', '15:41:08', '00:20:46', '08:39:38'),
(660, 'T01030', '30/07/2024', '15:45:00', '15:15:39', '00:22:53', '09:07:14'),
(661, 'T01037', '30/07/2024', '15:45:00', '15:40:35', '00:19:20', '08:38:45'),
(662, 'T01040', '30/07/2024', '15:45:00', '15:36:48', '00:21:45', '08:44:57'),
(663, 'T01042', '30/07/2024', '15:45:00', '15:42:29', '00:20:42', '08:38:13'),
(664, 'T01047', '30/07/2024', '15:45:00', '15:19:39', '00:20:45', '09:01:06'),
(665, 'T01051', '30/07/2024', '15:45:00', '15:46:39', '00:20:11', '08:33:32'),
(666, 'T01061', '30/07/2024', '15:45:00', '15:51:15', '00:19:03', '08:27:48'),
(667, 'T01064', '30/07/2024', '15:45:00', '15:37:29', '00:18:01', '08:40:32'),
(668, 'T01074', '30/07/2024', '15:45:00', '15:49:01', '00:18:56', '08:29:55'),
(669, 'T01077', '30/07/2024', '15:45:00', '15:45:55', '00:17:31', '08:31:36'),
(670, 'T01078', '30/07/2024', '15:45:00', '15:36:55', '00:21:53', '08:44:58'),
(671, 'T01080', '30/07/2024', '15:45:00', '15:28:46', '00:22:00', '08:53:14'),
(672, 'T01083', '30/07/2024', '15:45:00', '15:24:40', '00:19:41', '08:55:01'),
(673, 'T01089', '30/07/2024', '15:45:00', '15:50:55', '00:19:54', '08:28:59'),
(674, 'T01100', '30/07/2024', '15:45:00', '15:39:02', '00:17:34', '08:38:32'),
(675, 'T01101', '30/07/2024', '15:45:00', '00:18:21', '00:18:21', '00:00:00'),
(676, 'T01107', '30/07/2024', '15:45:00', '15:23:37', '00:18:21', '08:54:44'),
(677, 'T01109', '30/07/2024', '15:45:00', '15:17:57', '00:18:19', '09:00:22'),
(678, 'T01110', '30/07/2024', '15:45:00', '15:51:39', '00:17:20', '08:25:41'),
(679, 'T01111', '30/07/2024', '15:45:00', '15:12:06', '00:17:13', '09:05:07'),
(680, 'T01122', '30/07/2024', '15:45:00', '15:46:05', '00:16:40', '08:30:35'),
(681, 'T01127', '30/07/2024', '15:45:00', '15:52:46', '00:20:06', '08:27:20'),
(682, 'T01128', '30/07/2024', '15:45:00', '15:42:24', '00:20:13', '08:37:49'),
(683, 'T01129', '30/07/2024', '15:45:00', '15:50:25', '00:23:11', '08:32:46'),
(684, 'T01130', '30/07/2024', '15:45:00', '14:48:31', '00:16:42', '09:28:11'),
(685, 'T01132', '30/07/2024', '15:45:00', '15:42:26', '00:20:55', '08:38:29'),
(686, 'T01134', '30/07/2024', '15:45:00', '15:56:07', '00:18:58', '08:22:51'),
(687, 'T01138', '30/07/2024', '15:45:00', '15:43:48', '00:20:23', '08:36:35'),
(688, 'T01144', '30/07/2024', '15:45:00', '15:39:31', '00:19:51', '08:40:20'),
(689, 'T01146', '30/07/2024', '15:45:00', '15:32:36', '00:22:27', '08:49:51'),
(690, 'T01152', '30/07/2024', '15:45:00', '15:37:35', '00:23:39', '08:46:04'),
(691, 'T01157', '30/07/2024', '15:45:00', '15:41:15', '00:20:20', '08:39:05'),
(692, 'T01167', '30/07/2024', '15:45:00', '15:16:14', '00:18:27', '09:02:13'),
(693, 'T01168', '30/07/2024', '15:45:00', '15:29:35', '00:18:11', '08:48:36'),
(694, 'T01169', '30/07/2024', '15:45:00', '15:42:59', '00:17:58', '08:34:59'),
(695, 'T01170', '30/07/2024', '15:45:00', '15:49:05', '00:16:38', '08:27:33'),
(696, 'T01173', '30/07/2024', '15:45:00', '15:23:43', '00:22:19', '08:58:36'),
(697, 'T01174', '30/07/2024', '15:45:00', '15:37:15', '00:18:16', '08:41:01'),
(698, 'T01175', '30/07/2024', '15:45:00', '15:34:34', '00:18:29', '08:43:55'),
(699, 'T01176', '30/07/2024', '15:45:00', '15:29:38', '00:17:52', '08:48:14'),
(700, 'T01178', '30/07/2024', '15:45:00', '15:27:10', '00:19:40', '08:52:30'),
(701, 'T01179', '30/07/2024', '15:45:00', '15:27:45', '00:17:38', '08:49:53'),
(702, 'T01180', '30/07/2024', '15:45:00', '15:17:34', '00:19:06', '09:01:32'),
(703, 'T01181', '30/07/2024', '15:45:00', '15:27:13', '00:19:16', '08:52:03'),
(704, 'T01184', '30/07/2024', '15:45:00', '15:48:35', '00:16:47', '08:28:12'),
(705, 'T01185', '30/07/2024', '15:45:00', '15:02:01', '00:24:24', '09:22:23'),
(706, 'T01187', '30/07/2024', '15:45:00', '15:32:50', '00:17:04', '08:44:14'),
(707, 'T01188', '30/07/2024', '15:45:00', '15:43:46', '00:17:20', '08:33:34'),
(708, 'T01190', '30/07/2024', '15:45:00', '15:46:18', '00:17:10', '08:30:52'),
(709, 'T01193', '30/07/2024', '15:45:00', '15:38:48', '00:20:35', '08:41:47'),
(710, 'T01195', '30/07/2024', '15:45:00', '15:17:40', '00:18:14', '09:00:34'),
(711, 'T01196', '30/07/2024', '15:45:00', '15:36:49', '00:18:37', '08:41:48'),
(712, 'T01197', '30/07/2024', '15:45:00', '15:41:37', '00:18:33', '08:36:56'),
(713, 'T01198', '30/07/2024', '15:45:00', '15:49:14', '00:18:25', '08:29:11'),
(714, 'T01199', '30/07/2024', '15:45:00', '15:38:01', '00:17:56', '08:39:55'),
(715, 'T01200', '30/07/2024', '15:45:00', '15:28:49', '00:17:55', '08:49:06'),
(716, 'T01202', '30/07/2024', '15:45:00', '15:31:41', '00:17:05', '08:45:24'),
(717, 'T01203', '30/07/2024', '15:45:00', '15:32:29', '00:17:28', '08:44:59'),
(718, 'T01204', '30/07/2024', '15:45:00', '15:37:38', '00:20:58', '08:43:20'),
(719, 'T01205', '30/07/2024', '15:45:00', '15:50:50', '00:18:59', '08:28:09'),
(720, 'T01206', '30/07/2024', '15:45:00', '15:37:32', '00:19:32', '08:42:00'),
(721, 'T01207', '30/07/2024', '15:45:00', '15:37:27', '00:19:47', '08:42:20'),
(722, 'T01212', '30/07/2024', '15:45:00', '15:46:21', '00:20:30', '08:34:09'),
(723, 'T01213', '30/07/2024', '15:45:00', '15:35:39', '00:18:31', '08:42:52'),
(724, 'T01215', '30/07/2024', '15:45:00', '15:46:44', '00:21:13', '08:34:29'),
(725, 'T01216', '30/07/2024', '15:45:00', '15:36:40', '00:21:35', '08:44:55'),
(726, 'T01229', '30/07/2024', '15:45:00', '15:45:13', '00:17:50', '08:32:37'),
(727, 'T01232', '30/07/2024', '15:45:00', '15:45:18', '00:18:07', '08:32:49'),
(728, 'T01057', '31/07/2024', '08:00:01', '08:10:28', '17:03:43', '08:53:15'),
(729, 'T00183', '31/07/2024', '06:45:00', '05:58:25', '16:16:39', '10:18:14'),
(730, 'T00252', '31/07/2024', '08:00:00', '07:55:09', '19:29:47', '11:34:38'),
(731, 'T00266', '31/07/2024', '06:45:00', '06:37:49', '09:28:47', '02:50:58'),
(732, 'T00390', '31/07/2024', '06:45:00', '06:06:19', '16:21:01', '10:14:42'),
(733, 'T00455', '31/07/2024', '06:45:00', '06:42:34', '15:44:03', '09:01:29'),
(734, 'T00468', '31/07/2024', '06:45:00', '06:36:05', '15:43:19', '09:07:14'),
(735, 'T00470', '31/07/2024', '06:45:00', '06:41:46', '14:34:49', '07:53:03'),
(736, 'T00478', '31/07/2024', '06:45:00', '06:38:30', '15:44:24', '09:05:54'),
(737, 'T00484', '31/07/2024', '07:30:00', '07:51:24', '17:34:18', '09:42:54'),
(738, 'T00486', '31/07/2024', '08:00:00', '06:58:31', '16:31:55', '09:33:24'),
(739, 'T00492', '31/07/2024', '06:45:00', '06:34:30', '14:28:38', '07:54:08'),
(740, 'T00501', '31/07/2024', '06:45:00', '06:21:40', '15:46:19', '09:24:39'),
(741, 'T00529', '31/07/2024', '06:45:00', '06:24:08', '15:43:31', '09:19:23'),
(742, 'T00534', '31/07/2024', '06:45:00', '06:42:52', '14:30:18', '07:47:26'),
(743, 'T00552', '31/07/2024', '06:45:00', '05:58:06', '17:19:40', '11:21:34'),
(744, 'T00557', '31/07/2024', '06:45:00', '06:01:32', '16:16:45', '10:15:13'),
(745, 'T00561', '31/07/2024', '06:45:00', '06:37:56', '15:45:39', '09:07:43'),
(746, 'T00567', '31/07/2024', '06:45:00', '06:46:35', '15:41:49', '08:55:14'),
(747, 'T00597', '31/07/2024', '06:45:00', '06:37:05', '15:41:10', '09:04:05'),
(748, 'T00602', '31/07/2024', '06:45:00', '06:37:51', '15:43:14', '09:05:23'),
(749, 'T00606', '31/07/2024', '06:45:00', '06:39:42', '15:42:07', '09:02:25'),
(750, 'T00613', '31/07/2024', '06:45:00', '06:37:07', '15:44:55', '09:07:48'),
(751, 'T00615', '31/07/2024', '06:45:00', '06:35:05', '15:48:05', '09:13:00'),
(752, 'T00628', '31/07/2024', '06:45:00', '06:25:27', '15:45:09', '09:19:42'),
(753, 'T00630', '31/07/2024', '06:45:00', '06:32:02', '15:41:28', '09:09:26'),
(754, 'T00641', '31/07/2024', '06:45:00', '06:39:05', '15:45:25', '09:06:20'),
(755, 'T00653', '31/07/2024', '06:45:00', '06:33:30', '15:42:45', '09:09:15'),
(756, 'T00655', '31/07/2024', '06:45:00', '06:37:16', '15:42:56', '09:05:40'),
(757, 'T00674', '31/07/2024', '06:45:00', '06:30:22', '15:42:27', '09:12:05'),
(758, 'T00709', '31/07/2024', '06:45:00', '06:15:18', '16:37:34', '10:22:16'),
(759, 'T00722', '31/07/2024', '06:45:00', '06:44:49', '15:44:06', '08:59:17'),
(760, 'T00723', '31/07/2024', '06:45:00', '06:38:06', '15:44:08', '09:06:02'),
(761, 'T00726', '31/07/2024', '06:45:00', '06:38:41', '15:45:56', '09:07:15'),
(762, 'T00727', '31/07/2024', '08:00:00', '08:32:44', '17:04:53', '08:32:09'),
(763, 'T00729', '31/07/2024', '06:45:00', '06:57:43', '17:20:32', '10:22:49'),
(764, 'T00733', '31/07/2024', '06:45:00', '06:21:47', '15:41:17', '09:19:30'),
(765, 'T00766', '31/07/2024', '06:45:00', '06:34:22', '15:43:07', '09:08:45'),
(766, 'T00777', '31/07/2024', '08:00:00', '07:18:42', '16:13:35', '08:54:53'),
(767, 'T00785', '31/07/2024', '06:45:00', '06:32:44', '15:44:58', '09:12:14'),
(768, 'T00787', '31/07/2024', '06:45:00', '06:42:55', '15:45:51', '09:02:56'),
(769, 'T00797', '31/07/2024', '06:45:00', '06:26:21', '15:42:11', '09:15:50'),
(770, 'T00802', '31/07/2024', '06:45:00', '06:55:43', '06:55:43', '00:00:00'),
(771, 'T00808', '31/07/2024', '06:45:00', '06:43:11', '15:43:58', '09:00:47'),
(772, 'T00832', '31/07/2024', '06:45:00', '06:43:26', '15:46:05', '09:02:39'),
(773, 'T00846', '31/07/2024', '06:45:00', '06:36:48', '15:41:57', '09:05:09'),
(774, 'T00851', '31/07/2024', '06:45:00', '06:31:19', '15:42:47', '09:11:28'),
(775, 'T00864', '31/07/2024', '06:45:00', '06:38:35', '10:44:37', '04:06:02'),
(776, 'T00869', '31/07/2024', '06:45:00', '06:30:34', '15:43:05', '09:12:31'),
(777, 'T00870', '31/07/2024', '06:45:00', '06:32:40', '15:42:40', '09:10:00'),
(778, 'T00875', '31/07/2024', '06:45:00', '06:07:33', '15:46:25', '09:38:52'),
(779, 'T00881', '31/07/2024', '06:45:00', '06:49:18', '15:43:34', '08:54:16'),
(780, 'T00884', '31/07/2024', '06:45:00', '06:37:29', '15:45:43', '09:08:14'),
(781, 'T00893', '31/07/2024', '06:45:00', '06:37:01', '15:41:22', '09:04:21'),
(782, 'T00895', '31/07/2024', '06:45:00', '06:35:33', '14:26:58', '07:51:25'),
(783, 'T00896', '31/07/2024', '06:45:00', '06:37:22', '14:28:42', '07:51:20'),
(784, 'T00897', '31/07/2024', '06:45:00', '06:38:39', '15:46:10', '09:07:31'),
(785, 'T00898', '31/07/2024', '06:45:00', '06:32:00', '15:44:14', '09:12:14'),
(786, 'T00904', '31/07/2024', '06:45:00', '06:48:35', '15:43:16', '08:54:41'),
(787, 'T00905', '31/07/2024', '06:45:00', '06:23:40', '15:42:00', '09:18:20'),
(788, 'T00907', '31/07/2024', '06:45:00', '06:30:28', '15:42:54', '09:12:26'),
(789, 'T00911', '31/07/2024', '06:45:00', '06:26:50', '15:44:28', '09:17:38'),
(790, 'T00912', '31/07/2024', '06:45:00', '06:27:08', '15:44:50', '09:17:42'),
(791, 'T00916', '31/07/2024', '06:45:00', '06:28:59', '15:44:01', '09:15:02'),
(792, 'T00918', '31/07/2024', '06:45:00', '06:41:18', '15:45:53', '09:04:35'),
(793, 'T00919', '31/07/2024', '06:45:00', '06:35:23', '15:44:11', '09:08:48'),
(794, 'T00922', '31/07/2024', '06:45:00', '06:41:24', '15:42:59', '09:01:35'),
(795, 'T00930', '31/07/2024', '06:45:00', '06:40:23', '15:46:12', '09:05:49'),
(796, 'T00944', '31/07/2024', '06:45:00', '06:36:34', '14:27:00', '07:50:26'),
(797, 'T00947', '31/07/2024', '06:45:00', '06:43:14', '15:41:30', '08:58:16'),
(798, 'T00948', '31/07/2024', '06:45:00', '06:25:58', '15:43:46', '09:17:48'),
(799, 'T00963', '31/07/2024', '06:45:00', '06:36:59', '15:41:15', '09:04:16'),
(800, 'T00966', '31/07/2024', '06:45:00', '06:34:44', '15:41:26', '09:06:42'),
(801, 'T00970', '31/07/2024', '06:45:00', '05:58:33', '15:41:13', '09:42:40'),
(802, 'T01015', '31/07/2024', '06:45:00', '06:32:07', '15:43:01', '09:10:54'),
(803, 'T01018', '31/07/2024', '06:45:00', '06:51:02', '07:41:02', '00:50:00'),
(804, 'T01019', '31/07/2024', '06:45:00', '06:46:27', '15:42:42', '08:56:15'),
(805, 'T01020', '31/07/2024', '06:45:00', '06:39:09', '15:42:44', '09:03:35'),
(806, 'T01023', '31/07/2024', '06:45:00', '06:24:47', '06:24:47', '00:00:00'),
(807, 'T01024', '31/07/2024', '06:45:00', '06:35:45', '15:42:48', '09:07:03'),
(808, 'T01025', '31/07/2024', '06:45:00', '06:48:10', '15:41:44', '08:53:34'),
(809, 'T01039', '31/07/2024', '06:45:00', '05:51:43', '15:44:44', '09:53:01'),
(810, 'T01041', '31/07/2024', '06:45:00', '06:50:54', '14:28:29', '07:37:35'),
(811, 'T01044', '31/07/2024', '06:45:00', '06:15:37', '15:44:34', '09:28:57'),
(812, 'T01054', '31/07/2024', '06:45:00', '05:56:34', '15:44:22', '09:47:48'),
(813, 'T01056', '31/07/2024', '06:45:00', '05:56:22', '15:43:24', '09:47:02'),
(814, 'T01068', '31/07/2024', '06:45:00', '06:33:48', '15:43:30', '09:09:42'),
(815, 'T01070', '31/07/2024', '06:45:00', '06:47:58', '11:59:51', '05:11:53'),
(816, 'T01076', '31/07/2024', '06:45:00', '06:39:01', '15:41:23', '09:02:22'),
(817, 'T01087', '31/07/2024', '06:45:00', '00:17:23', '15:18:21', '15:00:58'),
(818, 'T01090', '31/07/2024', '06:45:00', '06:48:46', '16:29:21', '09:40:35'),
(819, 'T01093', '31/07/2024', '08:00:00', '07:59:28', '16:59:58', '09:00:30'),
(820, 'T01095', '31/07/2024', '06:45:00', '06:52:00', '15:42:03', '08:50:03'),
(821, 'T01099', '31/07/2024', '06:45:00', '06:46:52', '15:46:15', '08:59:23'),
(822, 'T01112', '31/07/2024', '06:45:00', '06:49:50', '15:42:21', '08:52:31'),
(823, 'T01113', '31/07/2024', '06:45:00', '06:39:46', '15:44:18', '09:04:32'),
(824, 'T01115', '31/07/2024', '06:45:00', '06:44:34', '15:42:37', '08:58:03'),
(825, 'T01116', '31/07/2024', '06:45:00', '06:31:16', '15:43:53', '09:12:37'),
(826, 'T01120', '31/07/2024', '06:45:00', '06:41:20', '15:43:09', '09:01:49'),
(827, 'T01121', '31/07/2024', '06:45:00', '06:27:20', '15:44:26', '09:17:06'),
(828, 'T01124', '31/07/2024', '06:45:00', '06:29:44', '15:42:23', '09:12:39'),
(829, 'T01125', '31/07/2024', '06:45:00', '06:49:55', '12:32:18', '05:42:23'),
(830, 'T01126', '31/07/2024', '06:45:00', '06:45:01', '15:44:52', '08:59:51'),
(831, 'T01135', '31/07/2024', '06:45:00', '06:30:41', '17:23:40', '10:52:59'),
(832, 'T01137', '31/07/2024', '06:45:00', '06:43:16', '15:45:22', '09:02:06'),
(833, 'T01142', '31/07/2024', '06:45:00', '06:51:34', '15:44:46', '08:53:12'),
(834, 'T01145', '31/07/2024', '06:45:00', '06:50:59', '10:22:21', '03:31:22'),
(835, 'T01149', '31/07/2024', '06:45:00', '06:35:57', '15:41:41', '09:05:44'),
(836, 'T01154', '31/07/2024', '06:45:00', '06:33:04', '15:43:36', '09:10:32'),
(837, 'T01155', '31/07/2024', '06:45:00', '06:41:42', '15:43:17', '09:01:35'),
(838, 'T01158', '31/07/2024', '06:45:00', '07:09:32', '18:35:45', '11:26:13'),
(839, 'T01159', '31/07/2024', '06:45:00', '06:46:54', '15:42:19', '08:55:25'),
(840, 'T01161', '31/07/2024', '06:45:00', '06:28:25', '15:44:42', '09:16:17'),
(841, 'T01162', '31/07/2024', '06:45:00', '06:00:00', '15:44:30', '09:44:30'),
(842, 'T01164', '31/07/2024', '06:45:00', '06:33:22', '15:43:50', '09:10:28'),
(843, 'T01165', '31/07/2024', '06:45:00', '06:39:39', '15:43:41', '09:04:02'),
(844, 'T01177', '31/07/2024', '06:45:00', '06:44:41', '15:42:35', '08:57:54'),
(845, 'T01182', '31/07/2024', '06:45:00', '06:26:02', '16:00:55', '09:34:53'),
(846, 'T01186', '31/07/2024', '06:45:00', '06:39:49', '15:45:27', '09:05:38'),
(847, 'T01219', '31/07/2024', '06:45:00', '06:31:12', '15:46:02', '09:14:50'),
(848, 'T01220', '31/07/2024', '06:45:00', '06:25:55', '15:45:49', '09:19:54'),
(849, 'T01221', '31/07/2024', '06:45:00', '06:28:14', '15:45:41', '09:17:27'),
(850, 'T01222', '31/07/2024', '06:45:00', '06:25:19', '15:45:36', '09:20:17'),
(851, 'T01223', '31/07/2024', '06:45:00', '06:30:37', '15:44:47', '09:14:10'),
(852, 'T01224', '31/07/2024', '06:45:00', '06:42:09', '15:44:40', '09:02:31'),
(853, 'T01225', '31/07/2024', '06:45:00', '06:30:39', '15:46:29', '09:15:50'),
(854, 'T01226', '31/07/2024', '06:45:00', '06:34:36', '15:45:01', '09:10:25'),
(855, 'T01231', '31/07/2024', '07:00:00', '06:47:04', '16:10:35', '09:23:31'),
(856, 'T01233', '31/07/2024', '07:00:00', '07:20:06', '17:25:17', '10:05:11'),
(857, 'T01234', '31/07/2024', '06:45:00', '06:30:31', '15:45:04', '09:14:33'),
(858, 'T01235', '31/07/2024', '06:45:00', '06:25:30', '15:45:07', '09:19:37'),
(859, 'T01236', '31/07/2024', '08:00:00', '06:42:39', '15:51:13', '09:08:34'),
(860, 'T00779', '01/08/2024', '06:45:00', '07:39:42', '07:39:42', '00:00:00'),
(861, 'T00894', '01/08/2024', '06:45:00', '06:40:36', '06:40:36', '00:00:00'),
(862, 'T00931', '01/08/2024', '06:45:00', '06:32:56', '06:32:56', '00:00:00'),
(863, 'T01133', '01/08/2024', '15:45:00', '00:21:41', '00:20:17', '23:58:36'),
(864, 'T00009', '01/08/2024', '15:45:00', '00:28:49', '00:27:29', '23:58:40'),
(865, 'T00391', '31/07/2024', '15:45:00', '18:02:44', '00:12:55', '06:10:11'),
(866, 'T00452', '01/08/2024', '15:45:00', '00:24:36', '00:22:29', '23:57:53'),
(867, 'T00508', '01/08/2024', '15:45:00', '00:21:51', '00:21:40', '23:59:49'),
(868, 'T00539', '01/08/2024', '15:45:00', '00:16:28', '00:16:57', '00:00:29'),
(869, 'T00590', '01/08/2024', '15:45:00', '00:16:13', '00:16:11', '23:59:58'),
(870, 'T00647', '01/08/2024', '15:45:00', '00:19:10', '00:19:36', '00:00:26'),
(871, 'T00822', '01/08/2024', '15:45:00', '00:21:01', '00:15:59', '23:54:58'),
(872, 'T00823', '01/08/2024', '15:45:00', '00:18:24', '00:19:44', '00:01:20'),
(873, 'T00861', '01/08/2024', '15:45:00', '00:21:22', '00:19:56', '23:58:34'),
(874, 'T00867', '01/08/2024', '15:45:00', '00:23:11', '00:22:46', '23:59:35'),
(875, 'T00873', '01/08/2024', '15:45:00', '00:18:46', '15:50:26', '15:31:40'),
(876, 'T00883', '01/08/2024', '15:45:00', '00:20:40', '00:21:48', '00:01:08'),
(877, 'T00917', '01/08/2024', '15:45:00', '00:17:05', '00:16:54', '23:59:49'),
(878, 'T00920', '01/08/2024', '15:45:00', '00:21:11', '00:18:42', '23:57:31'),
(879, 'T00921', '01/08/2024', '15:45:00', '00:21:09', '00:19:29', '23:58:20'),
(880, 'T00927', '01/08/2024', '15:45:00', '00:18:33', '00:22:39', '00:04:06'),
(881, 'T00936', '01/08/2024', '15:45:00', '00:20:54', '00:21:20', '00:00:26'),
(882, 'T00938', '01/08/2024', '15:45:00', '00:18:29', '00:17:14', '23:58:45'),
(883, 'T00945', '01/08/2024', '15:45:00', '00:19:58', '00:20:39', '00:00:41'),
(884, 'T00950', '01/08/2024', '15:45:00', '00:17:20', '00:17:08', '23:59:48'),
(885, 'T00968', '01/08/2024', '15:45:00', '06:39:18', '06:28:03', '23:48:45'),
(886, 'T00976', '01/08/2024', '15:45:00', '00:23:26', '00:20:33', '23:57:07'),
(887, 'T00977', '01/08/2024', '15:45:00', '00:18:06', '00:17:00', '23:58:54'),
(888, 'T00978', '01/08/2024', '15:45:00', '00:21:28', '00:15:53', '23:54:25'),
(889, 'T00982', '01/08/2024', '15:45:00', '00:23:23', '00:23:43', '00:00:20'),
(890, 'T00986', '01/08/2024', '15:45:00', '00:19:54', '00:19:10', '23:59:16'),
(891, 'T00997', '01/08/2024', '15:45:00', '00:20:52', '15:50:24', '15:29:32'),
(892, 'T01016', '01/08/2024', '15:45:00', '00:18:02', '00:19:25', '00:01:23'),
(893, 'T01017', '01/08/2024', '15:45:00', '00:18:41', '00:19:02', '00:00:21'),
(894, 'T01026', '01/08/2024', '15:45:00', '00:21:03', '00:19:18', '23:58:15'),
(895, 'T01029', '31/07/2024', '15:45:00', '15:23:21', '00:20:46', '08:57:25'),
(896, 'T01030', '01/08/2024', '15:45:00', '00:23:06', '00:22:53', '23:59:47'),
(897, 'T01037', '31/07/2024', '15:45:00', '00:19:20', '00:19:20', '00:00:00'),
(898, 'T01040', '01/08/2024', '15:45:00', '00:22:06', '00:21:45', '23:59:39'),
(899, 'T01042', '01/08/2024', '15:45:00', '00:20:55', '00:20:42', '23:59:47'),
(900, 'T01047', '01/08/2024', '15:45:00', '00:17:31', '00:20:45', '00:03:14'),
(901, 'T01051', '01/08/2024', '15:45:00', '00:18:54', '00:20:11', '00:01:17'),
(902, 'T01061', '01/08/2024', '15:45:00', '00:16:52', '00:19:03', '00:02:11'),
(903, 'T01064', '01/08/2024', '15:45:00', '00:18:35', '00:18:01', '23:59:26'),
(904, 'T01074', '01/08/2024', '15:45:00', '00:19:35', '00:18:56', '23:59:21'),
(905, 'T01077', '01/08/2024', '15:45:00', '00:18:16', '00:17:31', '23:59:15'),
(906, 'T01078', '01/08/2024', '15:45:00', '00:21:19', '00:21:53', '00:00:34'),
(907, 'T01080', '01/08/2024', '15:45:00', '00:20:37', '00:22:00', '00:01:23'),
(908, 'T01083', '01/08/2024', '15:45:00', '00:18:43', '00:19:41', '00:00:58'),
(909, 'T01089', '01/08/2024', '15:45:00', '00:24:52', '00:19:54', '23:55:02'),
(910, 'T01097', '01/08/2024', '15:45:00', '00:17:27', '15:50:50', '15:33:23'),
(911, 'T01100', '01/08/2024', '15:45:00', '00:18:48', '00:17:34', '23:58:46'),
(912, 'T01101', '01/08/2024', '15:45:00', '00:18:50', '15:34:28', '15:15:38'),
(913, 'T01107', '01/08/2024', '15:45:00', '00:19:24', '00:18:21', '23:58:57'),
(914, 'T01109', '01/08/2024', '15:45:00', '00:18:22', '00:18:19', '23:59:57'),
(915, 'T01110', '01/08/2024', '15:45:00', '00:18:14', '00:17:20', '23:59:06'),
(916, 'T01111', '01/08/2024', '15:45:00', '00:18:20', '00:17:13', '23:58:53'),
(917, 'T01122', '01/08/2024', '15:45:00', '00:16:34', '00:16:40', '00:00:06'),
(918, 'T01127', '31/07/2024', '15:45:00', '00:20:06', '00:20:06', '00:00:00'),
(919, 'T01128', '01/08/2024', '15:45:00', '00:19:22', '00:20:13', '00:00:51'),
(920, 'T01129', '01/08/2024', '15:45:00', '00:22:22', '00:23:11', '00:00:49'),
(921, 'T01130', '01/08/2024', '15:45:00', '00:21:45', '00:16:42', '23:54:57'),
(922, 'T01132', '01/08/2024', '15:45:00', '00:20:19', '00:20:55', '00:00:36'),
(923, 'T01134', '01/08/2024', '15:45:00', '00:20:23', '00:18:58', '23:58:35'),
(924, 'T01138', '01/08/2024', '15:45:00', '00:20:42', '00:20:23', '23:59:41'),
(925, 'T01144', '01/08/2024', '15:45:00', '00:19:31', '00:19:51', '00:00:20'),
(926, 'T01146', '01/08/2024', '15:45:00', '00:18:09', '00:22:27', '00:04:18'),
(927, 'T01152', '01/08/2024', '15:45:00', '00:19:19', '00:23:39', '00:04:20'),
(928, 'T01157', '01/08/2024', '15:45:00', '00:21:38', '00:20:20', '23:58:42'),
(929, 'T01167', '01/08/2024', '15:45:00', '00:18:31', '00:18:27', '23:59:56'),
(930, 'T01168', '01/08/2024', '15:45:00', '00:16:45', '00:18:11', '00:01:26'),
(931, 'T01169', '01/08/2024', '15:45:00', '00:17:57', '00:17:58', '00:00:01'),
(932, 'T01170', '01/08/2024', '15:45:00', '00:16:54', '00:16:38', '23:59:44'),
(933, 'T01173', '01/08/2024', '15:45:00', '00:20:50', '00:22:19', '00:01:29'),
(934, 'T01174', '01/08/2024', '15:45:00', '00:20:29', '00:18:16', '23:57:47'),
(935, 'T01175', '01/08/2024', '15:45:00', '00:17:41', '00:18:29', '00:00:48'),
(936, 'T01176', '01/08/2024', '15:45:00', '00:19:37', '00:17:52', '23:58:15'),
(937, 'T01178', '01/08/2024', '15:45:00', '00:17:01', '00:19:40', '00:02:39'),
(938, 'T01179', '01/08/2024', '15:45:00', '00:17:46', '00:17:38', '23:59:52'),
(939, 'T01180', '01/08/2024', '15:45:00', '00:17:03', '00:19:06', '00:02:03'),
(940, 'T01181', '01/08/2024', '15:45:00', '00:17:59', '00:19:16', '00:01:17'),
(941, 'T01184', '01/08/2024', '15:45:00', '00:17:07', '00:16:47', '23:59:40'),
(942, 'T01185', '01/08/2024', '15:45:00', '00:17:36', '00:24:24', '00:06:48'),
(943, 'T01187', '01/08/2024', '15:45:00', '00:17:28', '00:17:04', '23:59:36'),
(944, 'T01188', '01/08/2024', '15:45:00', '00:18:12', '00:17:20', '23:59:08'),
(945, 'T01190', '01/08/2024', '15:45:00', '00:17:10', '00:17:10', '00:00:00'),
(946, 'T01193', '31/07/2024', '15:45:00', '15:42:05', '00:20:35', '08:38:30'),
(947, 'T01195', '01/08/2024', '15:45:00', '00:17:00', '00:18:14', '00:01:14'),
(948, 'T01196', '31/07/2024', '15:45:00', '00:18:53', '00:18:37', '23:59:44'),
(949, 'T01197', '01/08/2024', '15:45:00', '00:19:44', '00:18:33', '23:58:49'),
(950, 'T01198', '01/08/2024', '15:45:00', '00:17:40', '00:18:25', '00:00:45'),
(951, 'T01199', '01/08/2024', '15:45:00', '00:20:16', '00:17:56', '23:57:40'),
(952, 'T01200', '01/08/2024', '15:45:00', '00:20:11', '00:17:55', '23:57:44'),
(953, 'T01202', '01/08/2024', '15:45:00', '00:17:17', '00:17:05', '23:59:48'),
(954, 'T01203', '01/08/2024', '15:45:00', '00:19:05', '00:17:28', '23:58:23'),
(955, 'T01204', '01/08/2024', '15:45:00', '00:20:58', '00:20:58', '00:00:00'),
(956, 'T01205', '01/08/2024', '15:45:00', '00:18:57', '00:18:59', '00:00:02'),
(957, 'T01206', '01/08/2024', '15:45:00', '00:19:47', '00:19:32', '23:59:45'),
(958, 'T01207', '01/08/2024', '15:45:00', '00:20:08', '00:19:47', '23:59:39'),
(959, 'T01212', '01/08/2024', '15:45:00', '00:19:56', '00:20:30', '00:00:34'),
(960, 'T01213', '31/07/2024', '15:45:00', '00:18:31', '00:18:31', '00:00:00'),
(961, 'T01215', '31/07/2024', '15:45:00', '00:21:25', '00:21:13', '23:59:48'),
(962, 'T01216', '01/08/2024', '15:45:00', '00:21:35', '00:21:35', '00:00:00'),
(963, 'T01229', '01/08/2024', '15:45:00', '00:17:33', '00:17:50', '00:00:17'),
(964, 'T01232', '01/08/2024', '15:45:00', '00:17:51', '00:18:07', '00:00:16'),
(965, 'T01057', '30/07/2024', '08:00:01', '07:59:54', '17:00:02', '09:00:08'),
(966, 'T00183', '30/07/2024', '06:45:00', '06:09:56', '16:59:26', '10:49:30'),
(967, 'T00252', '30/07/2024', '08:00:00', '07:42:18', '19:11:57', '11:29:39'),
(968, 'T00253', '30/07/2024', '06:45:00', '06:48:59', '15:48:57', '08:59:58'),
(969, 'T00266', '30/07/2024', '06:45:00', '06:20:16', '15:42:54', '09:22:38'),
(970, 'T00390', '30/07/2024', '06:45:00', '06:15:20', '16:27:43', '10:12:23'),
(971, 'T00455', '30/07/2024', '06:45:00', '06:45:53', '15:46:07', '09:00:14'),
(972, 'T00468', '30/07/2024', '06:45:00', '06:28:51', '15:41:44', '09:12:53'),
(973, 'T00470', '30/07/2024', '06:45:00', '06:39:15', '14:31:03', '07:51:48'),
(974, 'T00478', '30/07/2024', '06:45:00', '06:35:22', '15:43:25', '09:08:03'),
(975, 'T00484', '30/07/2024', '07:30:00', '07:21:50', '17:51:12', '10:29:22'),
(976, 'T00486', '30/07/2024', '08:00:00', '07:09:33', '16:57:44', '09:48:11'),
(977, 'T00492', '30/07/2024', '06:45:00', '06:32:54', '14:28:53', '07:55:59'),
(978, 'T00501', '30/07/2024', '06:45:00', '06:19:46', '15:46:56', '09:27:10'),
(979, 'T00529', '30/07/2024', '06:45:00', '06:26:34', '15:42:18', '09:15:44'),
(980, 'T00534', '30/07/2024', '06:45:00', '06:58:49', '15:22:01', '08:23:12'),
(981, 'T00546', '30/07/2024', '06:45:00', '06:38:58', '15:41:27', '09:02:29'),
(982, 'T00552', '30/07/2024', '06:45:00', '05:55:53', '17:31:59', '11:36:06'),
(983, 'T00559', '30/07/2024', '06:45:00', '06:39:25', '15:42:40', '09:03:15'),
(984, 'T00561', '30/07/2024', '06:45:00', '06:31:12', '15:44:22', '09:13:10'),
(985, 'T00567', '30/07/2024', '06:45:00', '06:38:44', '15:41:26', '09:02:42'),
(986, 'T00602', '30/07/2024', '06:45:00', '06:36:13', '15:41:57', '09:05:44'),
(987, 'T00606', '30/07/2024', '06:45:00', '06:39:32', '15:42:47', '09:03:15'),
(988, 'T00613', '30/07/2024', '06:45:00', '06:41:54', '15:44:27', '09:02:33'),
(989, 'T00615', '30/07/2024', '06:45:00', '06:44:04', '15:45:01', '09:00:57'),
(990, 'T00628', '30/07/2024', '06:45:00', '06:23:17', '15:43:13', '09:19:56'),
(991, 'T00630', '30/07/2024', '06:45:00', '06:39:28', '15:42:07', '09:02:39'),
(992, 'T00641', '30/07/2024', '06:45:00', '06:37:15', '15:44:57', '09:07:42'),
(993, 'T00653', '30/07/2024', '06:45:00', '06:30:22', '15:41:17', '09:10:55'),
(994, 'T00655', '30/07/2024', '06:45:00', '06:30:07', '15:45:39', '09:15:32'),
(995, 'T00674', '30/07/2024', '06:45:00', '06:26:40', '15:44:42', '09:18:02'),
(996, 'T00709', '30/07/2024', '06:45:00', '06:21:01', '16:38:07', '10:17:06'),
(997, 'T00723', '30/07/2024', '06:45:00', '06:52:46', '15:42:11', '08:49:25'),
(998, 'T00726', '30/07/2024', '06:45:00', '06:34:30', '15:44:10', '09:09:40'),
(999, 'T00727', '30/07/2024', '08:00:00', '10:49:09', '17:08:01', '06:18:52'),
(1000, 'T00729', '30/07/2024', '06:45:00', '06:52:41', '16:43:36', '09:50:55'),
(1001, 'T00733', '30/07/2024', '06:45:00', '06:02:37', '15:41:01', '09:38:24'),
(1002, 'T00766', '30/07/2024', '06:45:00', '06:40:29', '15:44:19', '09:03:50'),
(1003, 'T00777', '30/07/2024', '08:00:00', '07:22:36', '16:12:44', '08:50:08'),
(1004, 'T00785', '30/07/2024', '06:45:00', '06:33:54', '15:44:23', '09:10:29'),
(1005, 'T00787', '30/07/2024', '06:45:00', '06:42:17', '15:47:15', '09:04:58'),
(1006, 'T00797', '30/07/2024', '06:45:00', '06:31:14', '15:44:37', '09:13:23'),
(1007, 'T00802', '30/07/2024', '06:45:00', '06:41:42', '15:44:04', '09:02:22'),
(1008, 'T00808', '30/07/2024', '06:45:00', '06:40:16', '15:43:39', '09:03:23'),
(1009, 'T00832', '30/07/2024', '06:45:00', '06:44:30', '15:41:03', '08:56:33'),
(1010, 'T00846', '30/07/2024', '06:45:00', '06:35:42', '15:42:05', '09:06:23'),
(1011, 'T00851', '30/07/2024', '06:45:00', '06:27:08', '15:45:00', '09:17:52'),
(1012, 'T00864', '30/07/2024', '06:45:00', '06:38:23', '15:42:15', '09:03:52'),
(1013, 'T00869', '30/07/2024', '06:45:00', '06:38:06', '08:43:37', '02:05:31'),
(1014, 'T00870', '30/07/2024', '06:45:00', '06:33:59', '15:44:08', '09:10:09'),
(1015, 'T00875', '30/07/2024', '06:45:00', '06:17:05', '15:44:06', '09:27:01'),
(1016, 'T00881', '30/07/2024', '06:45:00', '06:42:22', '15:44:48', '09:02:26'),
(1017, 'T00884', '30/07/2024', '06:45:00', '06:39:44', '15:46:09', '09:06:25'),
(1018, 'T00888', '30/07/2024', '06:45:00', '06:44:01', '14:27:25', '07:43:24'),
(1019, 'T00889', '30/07/2024', '06:45:00', '06:42:04', '15:41:10', '08:59:06'),
(1020, 'T00893', '30/07/2024', '06:45:00', '06:40:09', '15:40:58', '09:00:49'),
(1021, 'T00895', '30/07/2024', '06:45:00', '06:38:10', '06:38:13', '00:00:03'),
(1022, 'T00896', '30/07/2024', '06:45:00', '06:33:19', '14:27:51', '07:54:32'),
(1023, 'T00897', '30/07/2024', '06:45:00', '06:48:32', '15:46:15', '08:57:43'),
(1024, 'T00898', '30/07/2024', '06:45:00', '06:39:36', '15:43:06', '09:03:30'),
(1025, 'T00904', '30/07/2024', '06:45:00', '06:38:20', '15:44:25', '09:06:05'),
(1026, 'T00905', '30/07/2024', '06:45:00', '06:21:08', '15:44:53', '09:23:45'),
(1027, 'T00907', '30/07/2024', '06:45:00', '06:20:28', '15:42:03', '09:21:35'),
(1028, 'T00911', '30/07/2024', '06:45:00', '06:36:54', '15:45:17', '09:08:23'),
(1029, 'T00912', '30/07/2024', '06:45:00', '06:28:29', '15:43:40', '09:15:11'),
(1030, 'T00916', '30/07/2024', '06:45:00', '06:32:11', '15:42:01', '09:09:50'),
(1031, 'T00918', '30/07/2024', '06:45:00', '06:28:27', '15:44:37', '09:16:10'),
(1032, 'T00919', '30/07/2024', '06:45:00', '06:41:28', '15:41:59', '09:00:31'),
(1033, 'T00922', '30/07/2024', '06:45:00', '06:42:13', '15:42:34', '09:00:21'),
(1034, 'T00930', '30/07/2024', '06:45:00', '06:49:51', '15:45:36', '08:55:45'),
(1035, 'T00931', '30/07/2024', '06:45:00', '06:41:48', '15:41:31', '08:59:43'),
(1036, 'T00944', '30/07/2024', '06:45:00', '06:25:43', '14:27:00', '08:01:17'),
(1037, 'T00947', '30/07/2024', '06:45:00', '06:40:18', '15:41:51', '09:01:33'),
(1038, 'T00948', '30/07/2024', '06:45:00', '06:22:43', '15:46:25', '09:23:42'),
(1039, 'T00963', '30/07/2024', '06:45:00', '06:40:13', '15:41:29', '09:01:16'),
(1040, 'T00966', '30/07/2024', '06:45:00', '06:38:04', '15:41:41', '09:03:37'),
(1041, 'T00970', '30/07/2024', '06:45:00', '06:02:48', '15:41:34', '09:38:46'),
(1042, 'T01015', '30/07/2024', '06:45:00', '06:20:00', '15:43:31', '09:23:31'),
(1043, 'T01019', '30/07/2024', '06:45:00', '06:38:19', '15:41:39', '09:03:20'),
(1044, 'T01020', '30/07/2024', '06:45:00', '06:34:34', '11:12:14', '04:37:40'),
(1045, 'T01023', '30/07/2024', '06:45:00', '06:24:05', '15:42:41', '09:18:36'),
(1046, 'T01024', '30/07/2024', '06:45:00', '06:26:58', '15:44:54', '09:17:56'),
(1047, 'T01025', '30/07/2024', '06:45:00', '06:47:26', '15:41:12', '08:53:46'),
(1048, 'T01039', '30/07/2024', '06:45:00', '05:51:15', '15:42:31', '09:51:16'),
(1049, 'T01041', '30/07/2024', '06:45:00', '06:46:21', '14:26:56', '07:40:35'),
(1050, 'T01044', '30/07/2024', '06:45:00', '06:01:12', '15:45:26', '09:44:14'),
(1051, 'T01054', '30/07/2024', '06:45:00', '05:51:56', '15:44:02', '09:52:06'),
(1052, 'T01056', '30/07/2024', '06:45:00', '05:51:52', '15:42:50', '09:50:58'),
(1053, 'T01068', '30/07/2024', '06:45:00', '06:30:50', '15:43:02', '09:12:12'),
(1054, 'T01070', '30/07/2024', '06:45:00', '06:49:03', '15:45:58', '08:56:55'),
(1055, 'T01076', '30/07/2024', '06:45:00', '06:38:37', '15:41:20', '09:02:43'),
(1056, 'T01087', '30/07/2024', '06:45:00', '16:40:13', '16:40:13', '00:00:00'),
(1057, 'T01090', '30/07/2024', '06:45:00', '06:37:34', '15:59:55', '09:22:21'),
(1058, 'T01093', '30/07/2024', '08:00:00', '07:31:38', '16:49:45', '09:18:07'),
(1059, 'T01095', '30/07/2024', '06:45:00', '06:29:07', '15:41:50', '09:12:43'),
(1060, 'T01099', '30/07/2024', '06:45:00', '06:30:52', '15:45:51', '09:14:59'),
(1061, 'T01112', '30/07/2024', '06:45:00', '06:48:23', '15:42:22', '08:53:59'),
(1062, 'T01113', '30/07/2024', '06:45:00', '06:40:07', '15:43:18', '09:03:11'),
(1063, 'T01115', '30/07/2024', '06:45:00', '06:41:07', '15:42:39', '09:01:32'),
(1064, 'T01116', '30/07/2024', '06:45:00', '06:21:45', '15:43:10', '09:21:25'),
(1065, 'T01120', '30/07/2024', '06:45:00', '06:44:17', '15:42:56', '08:58:39'),
(1066, 'T01121', '30/07/2024', '06:45:00', '06:36:56', '15:43:44', '09:06:48'),
(1067, 'T01125', '30/07/2024', '06:45:00', '06:46:58', '15:43:34', '08:56:36'),
(1068, 'T01126', '30/07/2024', '06:45:00', '06:36:59', '15:45:21', '09:08:22'),
(1069, 'T01135', '30/07/2024', '06:45:00', '06:40:01', '17:12:07', '10:32:06'),
(1070, 'T01137', '30/07/2024', '06:45:00', '06:40:12', '15:44:16', '09:04:04'),
(1071, 'T01145', '30/07/2024', '06:45:00', '06:35:38', '15:43:33', '09:07:55'),
(1072, 'T01149', '30/07/2024', '06:45:00', '06:35:33', '15:41:22', '09:05:49'),
(1073, 'T01154', '30/07/2024', '06:45:00', '06:28:21', '15:43:27', '09:15:06'),
(1074, 'T01155', '30/07/2024', '06:45:00', '06:41:24', '15:43:23', '09:01:59'),
(1075, 'T01158', '30/07/2024', '06:45:00', '07:07:12', '19:36:18', '12:29:06'),
(1076, 'T01159', '30/07/2024', '06:45:00', '06:26:43', '15:41:35', '09:14:52'),
(1077, 'T01161', '30/07/2024', '06:45:00', '06:41:02', '15:45:30', '09:04:28'),
(1078, 'T01162', '30/07/2024', '06:45:00', '06:01:48', '15:45:14', '09:43:26'),
(1079, 'T01164', '30/07/2024', '06:45:00', '06:31:50', '15:45:53', '09:14:03'),
(1080, 'T01165', '30/07/2024', '06:45:00', '06:33:11', '15:46:00', '09:12:49'),
(1081, 'T01166', '30/07/2024', '06:45:00', '06:39:02', '12:26:40', '05:47:38'),
(1082, 'T01182', '30/07/2024', '06:45:00', '06:27:16', '15:45:23', '09:18:07'),
(1083, 'T01186', '30/07/2024', '06:45:00', '06:37:02', '15:45:45', '09:08:43'),
(1084, 'T01219', '30/07/2024', '06:45:00', '06:21:41', '15:46:12', '09:24:31'),
(1085, 'T01220', '30/07/2024', '06:45:00', '06:26:38', '15:43:04', '09:16:26'),
(1086, 'T01221', '30/07/2024', '06:45:00', '06:24:40', '15:45:41', '09:21:01'),
(1087, 'T01222', '30/07/2024', '06:45:00', '06:17:43', '15:44:46', '09:27:03'),
(1088, 'T01223', '30/07/2024', '06:45:00', '06:38:48', '15:44:50', '09:06:02'),
(1089, 'T01224', '30/07/2024', '06:45:00', '06:35:57', '15:43:30', '09:07:33'),
(1090, 'T01225', '30/07/2024', '06:45:00', '06:39:56', '15:46:23', '09:06:27'),
(1091, 'T01226', '30/07/2024', '06:45:00', '06:38:01', '15:45:33', '09:07:32'),
(1092, 'T01231', '30/07/2024', '07:00:00', '06:42:00', '16:07:57', '09:25:57'),
(1093, 'T01233', '30/07/2024', '07:00:00', '08:00:11', '18:46:33', '10:46:22'),
(1094, 'T01234', '30/07/2024', '06:45:00', '06:20:06', '15:45:05', '09:24:59'),
(1095, 'T01235', '30/07/2024', '06:45:00', '06:36:10', '15:45:28', '09:09:18'),
(1096, 'T01236', '30/07/2024', '08:00:00', '06:41:32', '15:45:10', '09:03:38'),
(1097, 'T00557', '31/07/2024', '06:45:00', '06:01:32', '16:16:45', '10:15:13'),
(1098, 'T00597', '31/07/2024', '06:45:00', '06:37:05', '15:41:10', '09:04:05'),
(1099, 'T00722', '31/07/2024', '06:45:00', '06:44:49', '15:44:06', '08:59:17'),
(1100, 'T01018', '31/07/2024', '06:45:00', '06:51:02', '07:41:02', '00:50:00'),
(1101, 'T01124', '31/07/2024', '06:45:00', '06:29:44', '15:42:23', '09:12:39'),
(1102, 'T01142', '31/07/2024', '06:45:00', '06:51:34', '15:44:46', '08:53:12'),
(1103, 'T01177', '31/07/2024', '06:45:00', '06:44:41', '15:42:35', '08:57:54'),
(1104, 'T01133', '30/07/2024', '15:45:00', '15:43:36', '00:20:17', '08:36:41'),
(1105, 'T00009', '30/07/2024', '15:45:00', '14:57:29', '00:27:29', '09:30:00'),
(1106, 'T00391', '30/07/2024', '15:45:00', '16:01:39', '00:12:55', '08:11:16'),
(1107, 'T00452', '30/07/2024', '15:45:00', '15:36:37', '00:22:29', '08:45:52'),
(1108, 'T00508', '30/07/2024', '15:45:00', '15:36:42', '00:21:40', '08:44:58'),
(1109, 'T00539', '30/07/2024', '15:45:00', '14:48:28', '00:16:57', '09:28:29'),
(1110, 'T00590', '30/07/2024', '15:45:00', '15:42:09', '00:16:11', '08:34:02'),
(1111, 'T00647', '30/07/2024', '15:45:00', '14:45:40', '00:19:36', '09:33:56'),
(1112, 'T00805', '30/07/2024', '15:45:00', '00:21:14', '00:21:14', '00:00:00'),
(1113, 'T00822', '30/07/2024', '15:45:00', '15:40:04', '00:15:59', '08:35:55'),
(1114, 'T00823', '30/07/2024', '15:45:00', '15:40:10', '00:19:44', '08:39:34'),
(1115, 'T00861', '30/07/2024', '15:45:00', '15:43:59', '00:19:56', '08:35:57'),
(1116, 'T00867', '30/07/2024', '15:45:00', '14:58:45', '00:22:46', '09:24:01'),
(1117, 'T00873', '30/07/2024', '15:45:00', '15:47:05', '15:50:26', '00:03:21'),
(1118, 'T00883', '30/07/2024', '15:45:00', '15:48:08', '00:21:48', '08:33:40'),
(1119, 'T00917', '30/07/2024', '15:45:00', '15:42:32', '00:16:54', '08:34:22'),
(1120, 'T00920', '30/07/2024', '15:45:00', '15:43:50', '00:18:42', '08:34:52'),
(1121, 'T00921', '30/07/2024', '15:45:00', '15:47:24', '00:19:29', '08:32:05'),
(1122, 'T00927', '30/07/2024', '15:45:00', '14:45:33', '00:22:39', '09:37:06'),
(1123, 'T00936', '30/07/2024', '15:45:00', '15:43:42', '00:21:20', '08:37:38'),
(1124, 'T00938', '30/07/2024', '15:45:00', '15:21:40', '00:17:14', '08:55:34'),
(1125, 'T00945', '30/07/2024', '15:45:00', '15:40:13', '00:20:39', '08:40:26'),
(1126, 'T00950', '30/07/2024', '15:45:00', '15:46:03', '00:17:08', '08:31:05'),
(1127, 'T00968', '30/07/2024', '15:45:00', '15:41:19', '06:28:03', '14:46:44'),
(1128, 'T00976', '30/07/2024', '15:45:00', '15:33:11', '00:20:33', '08:47:22'),
(1129, 'T00977', '30/07/2024', '15:45:00', '15:39:25', '00:17:00', '08:37:35'),
(1130, 'T00978', '30/07/2024', '15:45:00', '15:22:39', '00:15:53', '08:53:14'),
(1131, 'T00982', '30/07/2024', '15:45:00', '15:43:53', '00:23:43', '08:39:50'),
(1132, 'T00986', '30/07/2024', '15:45:00', '15:29:45', '00:19:10', '08:49:25'),
(1133, 'T00997', '30/07/2024', '15:45:00', '00:22:33', '15:50:24', '15:27:51'),
(1134, 'T01016', '30/07/2024', '15:45:00', '15:30:27', '00:19:25', '08:48:58'),
(1135, 'T01017', '30/07/2024', '15:45:00', '15:30:30', '00:19:02', '08:48:32'),
(1136, 'T01026', '30/07/2024', '15:45:00', '15:30:32', '00:19:18', '08:48:46'),
(1137, 'T01029', '30/07/2024', '15:45:00', '15:41:08', '00:20:46', '08:39:38'),
(1138, 'T01030', '30/07/2024', '15:45:00', '15:15:39', '00:22:53', '09:07:14'),
(1139, 'T01037', '30/07/2024', '15:45:00', '15:40:35', '00:19:20', '08:38:45'),
(1140, 'T01040', '30/07/2024', '15:45:00', '15:36:48', '00:21:45', '08:44:57'),
(1141, 'T01042', '30/07/2024', '15:45:00', '15:42:29', '00:20:42', '08:38:13'),
(1142, 'T01047', '30/07/2024', '15:45:00', '15:19:39', '00:20:45', '09:01:06'),
(1143, 'T01051', '30/07/2024', '15:45:00', '15:46:39', '00:20:11', '08:33:32'),
(1144, 'T01061', '30/07/2024', '15:45:00', '15:51:15', '00:19:03', '08:27:48'),
(1145, 'T01064', '30/07/2024', '15:45:00', '15:37:29', '00:18:01', '08:40:32'),
(1146, 'T01074', '30/07/2024', '15:45:00', '15:49:01', '00:18:56', '08:29:55'),
(1147, 'T01077', '30/07/2024', '15:45:00', '15:45:55', '00:17:31', '08:31:36'),
(1148, 'T01078', '30/07/2024', '15:45:00', '15:36:55', '00:21:53', '08:44:58'),
(1149, 'T01080', '30/07/2024', '15:45:00', '15:28:46', '00:22:00', '08:53:14'),
(1150, 'T01083', '30/07/2024', '15:45:00', '15:24:40', '00:19:41', '08:55:01'),
(1151, 'T01089', '30/07/2024', '15:45:00', '15:50:55', '00:19:54', '08:28:59'),
(1152, 'T01100', '30/07/2024', '15:45:00', '15:39:02', '00:17:34', '08:38:32'),
(1153, 'T01101', '30/07/2024', '15:45:00', '00:18:21', '15:34:28', '15:16:07'),
(1154, 'T01107', '30/07/2024', '15:45:00', '15:23:37', '00:18:21', '08:54:44'),
(1155, 'T01109', '30/07/2024', '15:45:00', '15:17:57', '00:18:19', '09:00:22'),
(1156, 'T01110', '30/07/2024', '15:45:00', '15:51:39', '00:17:20', '08:25:41'),
(1157, 'T01111', '30/07/2024', '15:45:00', '15:12:06', '00:17:13', '09:05:07'),
(1158, 'T01122', '30/07/2024', '15:45:00', '15:46:05', '00:16:40', '08:30:35'),
(1159, 'T01127', '30/07/2024', '15:45:00', '15:52:46', '00:20:06', '08:27:20'),
(1160, 'T01128', '30/07/2024', '15:45:00', '15:42:24', '00:20:13', '08:37:49'),
(1161, 'T01129', '30/07/2024', '15:45:00', '15:50:25', '00:23:11', '08:32:46'),
(1162, 'T01130', '30/07/2024', '15:45:00', '14:48:31', '00:16:42', '09:28:11'),
(1163, 'T01132', '30/07/2024', '15:45:00', '15:42:26', '00:20:55', '08:38:29'),
(1164, 'T01134', '30/07/2024', '15:45:00', '15:56:07', '00:18:58', '08:22:51'),
(1165, 'T01138', '30/07/2024', '15:45:00', '15:43:48', '00:20:23', '08:36:35'),
(1166, 'T01144', '30/07/2024', '15:45:00', '15:39:31', '00:19:51', '08:40:20'),
(1167, 'T01146', '30/07/2024', '15:45:00', '15:32:36', '00:22:27', '08:49:51'),
(1168, 'T01152', '30/07/2024', '15:45:00', '15:37:35', '00:23:39', '08:46:04'),
(1169, 'T01157', '30/07/2024', '15:45:00', '15:41:15', '00:20:20', '08:39:05'),
(1170, 'T01167', '30/07/2024', '15:45:00', '15:16:14', '00:18:27', '09:02:13'),
(1171, 'T01168', '30/07/2024', '15:45:00', '15:29:35', '00:18:11', '08:48:36'),
(1172, 'T01169', '30/07/2024', '15:45:00', '15:42:59', '00:17:58', '08:34:59'),
(1173, 'T01170', '30/07/2024', '15:45:00', '15:49:05', '00:16:38', '08:27:33'),
(1174, 'T01173', '30/07/2024', '15:45:00', '15:23:43', '00:22:19', '08:58:36'),
(1175, 'T01174', '30/07/2024', '15:45:00', '15:37:15', '00:18:16', '08:41:01'),
(1176, 'T01175', '30/07/2024', '15:45:00', '15:34:34', '00:18:29', '08:43:55'),
(1177, 'T01176', '30/07/2024', '15:45:00', '15:29:38', '00:17:52', '08:48:14'),
(1178, 'T01178', '30/07/2024', '15:45:00', '15:27:10', '00:19:40', '08:52:30'),
(1179, 'T01179', '30/07/2024', '15:45:00', '15:27:45', '00:17:38', '08:49:53'),
(1180, 'T01180', '30/07/2024', '15:45:00', '15:17:34', '00:19:06', '09:01:32'),
(1181, 'T01181', '30/07/2024', '15:45:00', '15:27:13', '00:19:16', '08:52:03'),
(1182, 'T01184', '30/07/2024', '15:45:00', '15:48:35', '00:16:47', '08:28:12'),
(1183, 'T01185', '30/07/2024', '15:45:00', '15:02:01', '00:24:24', '09:22:23'),
(1184, 'T01187', '30/07/2024', '15:45:00', '15:32:50', '00:17:04', '08:44:14'),
(1185, 'T01188', '30/07/2024', '15:45:00', '15:43:46', '00:17:20', '08:33:34'),
(1186, 'T01190', '30/07/2024', '15:45:00', '15:46:18', '00:17:10', '08:30:52'),
(1187, 'T01193', '30/07/2024', '15:45:00', '15:38:48', '00:20:35', '08:41:47'),
(1188, 'T01195', '30/07/2024', '15:45:00', '15:17:40', '00:18:14', '09:00:34'),
(1189, 'T01196', '30/07/2024', '15:45:00', '15:36:49', '00:18:37', '08:41:48'),
(1190, 'T01197', '30/07/2024', '15:45:00', '15:41:37', '00:18:33', '08:36:56'),
(1191, 'T01198', '30/07/2024', '15:45:00', '15:49:14', '00:18:25', '08:29:11'),
(1192, 'T01199', '30/07/2024', '15:45:00', '15:38:01', '00:17:56', '08:39:55'),
(1193, 'T01200', '30/07/2024', '15:45:00', '15:28:49', '00:17:55', '08:49:06'),
(1194, 'T01202', '30/07/2024', '15:45:00', '15:31:41', '00:17:05', '08:45:24'),
(1195, 'T01203', '30/07/2024', '15:45:00', '15:32:29', '00:17:28', '08:44:59'),
(1196, 'T01204', '30/07/2024', '15:45:00', '15:37:38', '00:20:58', '08:43:20'),
(1197, 'T01205', '30/07/2024', '15:45:00', '15:50:50', '00:18:59', '08:28:09'),
(1198, 'T01206', '30/07/2024', '15:45:00', '15:37:32', '00:19:32', '08:42:00'),
(1199, 'T01207', '30/07/2024', '15:45:00', '15:37:27', '00:19:47', '08:42:20'),
(1200, 'T01212', '30/07/2024', '15:45:00', '15:46:21', '00:20:30', '08:34:09'),
(1201, 'T01213', '30/07/2024', '15:45:00', '15:35:39', '00:18:31', '08:42:52'),
(1202, 'T01215', '30/07/2024', '15:45:00', '15:46:44', '00:21:13', '08:34:29'),
(1203, 'T01216', '30/07/2024', '15:45:00', '15:36:40', '00:21:35', '08:44:55'),
(1204, 'T01229', '30/07/2024', '15:45:00', '15:45:13', '00:17:50', '08:32:37'),
(1205, 'T01232', '30/07/2024', '15:45:00', '15:45:18', '00:18:07', '08:32:49'),
(1206, 'T01097', '31/07/2024', '15:45:00', '15:50:50', '15:50:50', '00:00:00'),
(1207, 'T01057', '02/08/2024', '08:00:01', '08:12:47', '17:09:41', '08:56:54'),
(1208, 'T00183', '02/08/2024', '06:45:00', '06:00:50', '16:26:04', '10:25:14'),
(1209, 'T00252', '02/08/2024', '08:00:00', '07:48:21', '20:50:59', '13:02:38'),
(1210, 'T00266', '02/08/2024', '06:45:00', '06:33:20', '08:52:14', '02:18:54'),
(1211, 'T00390', '02/08/2024', '06:45:00', '06:10:04', '16:01:51', '09:51:47'),
(1212, 'T00455', '02/08/2024', '06:45:00', '06:43:47', '15:45:17', '09:01:30'),
(1213, 'T00468', '02/08/2024', '06:45:00', '06:35:36', '15:43:44', '09:08:08'),
(1214, 'T00470', '02/08/2024', '06:45:00', '06:47:41', '12:00:23', '05:12:42'),
(1215, 'T00478', '02/08/2024', '06:45:00', '06:31:01', '15:45:06', '09:14:05'),
(1216, 'T00484', '02/08/2024', '07:30:00', '08:32:38', '17:50:08', '09:17:30'),
(1217, 'T00486', '02/08/2024', '08:00:00', '07:02:44', '17:04:18', '10:01:34'),
(1218, 'T00492', '02/08/2024', '06:45:00', '06:36:27', '14:29:58', '07:53:31'),
(1219, 'T00501', '02/08/2024', '06:45:00', '06:23:10', '15:45:42', '09:22:32'),
(1220, 'T00529', '02/08/2024', '06:45:00', '06:21:51', '15:43:46', '09:21:55'),
(1221, 'T00534', '02/08/2024', '06:45:00', '07:15:13', '14:34:15', '07:19:02'),
(1222, 'T00552', '02/08/2024', '06:45:00', '05:43:00', '16:53:07', '11:10:07'),
(1223, 'T00557', '02/08/2024', '06:45:00', '06:04:36', '15:53:10', '09:48:34'),
(1224, 'T00561', '02/08/2024', '06:45:00', '06:30:40', '15:44:50', '09:14:10'),
(1225, 'T00567', '02/08/2024', '06:45:00', '06:50:04', '15:41:45', '08:51:41'),
(1226, 'T00596', '02/08/2024', '06:45:00', '06:37:08', '15:43:08', '09:06:00'),
(1227, 'T00597', '02/08/2024', '06:45:00', '06:32:09', '15:41:19', '09:09:10'),
(1228, 'T00602', '02/08/2024', '06:45:00', '06:39:40', '15:43:59', '09:04:19'),
(1229, 'T00606', '02/08/2024', '06:45:00', '06:40:13', '15:42:09', '09:01:56'),
(1230, 'T00613', '02/08/2024', '06:45:00', '06:41:08', '15:44:57', '09:03:49'),
(1231, 'T00615', '02/08/2024', '06:45:00', '06:42:00', '15:45:51', '09:03:51'),
(1232, 'T00628', '02/08/2024', '06:45:00', '06:39:38', '15:43:50', '09:04:12'),
(1233, 'T00630', '02/08/2024', '06:45:00', '06:39:34', '15:41:15', '09:01:41'),
(1234, 'T00641', '02/08/2024', '06:45:00', '06:38:35', '15:44:38', '09:06:03'),
(1235, 'T00653', '02/08/2024', '06:45:00', '06:33:10', '15:42:58', '09:09:48'),
(1236, 'T00655', '02/08/2024', '06:45:00', '15:43:04', '15:43:04', '00:00:00'),
(1237, 'T00698', '02/08/2024', '06:45:00', '06:42:57', '15:45:35', '09:02:38'),
(1238, 'T00709', '02/08/2024', '06:45:00', '06:21:57', '16:57:15', '10:35:18'),
(1239, 'T00722', '02/08/2024', '06:45:00', '06:53:55', '15:45:00', '08:51:05'),
(1240, 'T00723', '02/08/2024', '06:45:00', '06:37:06', '15:42:38', '09:05:32'),
(1241, 'T00726', '02/08/2024', '06:45:00', '06:49:06', '15:41:56', '08:52:50'),
(1242, 'T00727', '02/08/2024', '08:00:00', '08:14:09', '17:04:22', '08:50:13'),
(1243, 'T00729', '02/08/2024', '06:45:00', '06:52:09', '16:33:58', '09:41:49'),
(1244, 'T00733', '02/08/2024', '06:45:00', '06:24:42', '15:41:34', '09:16:52'),
(1245, 'T00766', '02/08/2024', '06:45:00', '06:32:12', '15:44:00', '09:11:48'),
(1246, 'T00779', '02/08/2024', '06:45:00', '08:00:13', '15:44:32', '07:44:19'),
(1247, 'T00785', '02/08/2024', '06:45:00', '06:40:27', '06:40:27', '00:00:00'),
(1248, 'T00787', '02/08/2024', '06:45:00', '06:38:40', '15:49:09', '09:10:29'),
(1249, 'T00797', '02/08/2024', '06:45:00', '06:30:44', '15:42:50', '09:12:06'),
(1250, 'T00802', '02/08/2024', '06:45:00', '06:49:30', '06:49:30', '00:00:00'),
(1251, 'T00846', '02/08/2024', '06:45:00', '06:32:41', '15:41:50', '09:09:09'),
(1252, 'T00851', '02/08/2024', '06:45:00', '06:32:58', '15:44:54', '09:11:56'),
(1253, 'T00864', '02/08/2024', '06:45:00', '06:40:58', '15:43:54', '09:02:56'),
(1254, 'T00869', '02/08/2024', '06:45:00', '06:35:33', '15:43:42', '09:08:09'),
(1255, 'T00870', '02/08/2024', '06:45:00', '06:35:31', '15:41:43', '09:06:12'),
(1256, 'T00875', '02/08/2024', '06:45:00', '06:15:29', '15:43:01', '09:27:32'),
(1257, 'T00876', '02/08/2024', '06:45:00', '06:43:45', '15:45:59', '09:02:14'),
(1258, 'T00881', '02/08/2024', '06:45:00', '12:33:19', '15:45:37', '03:12:18'),
(1259, 'T00884', '02/08/2024', '06:45:00', '06:43:23', '15:46:04', '09:02:41'),
(1260, 'T00889', '02/08/2024', '06:45:00', '06:32:07', '15:42:16', '09:10:09'),
(1261, 'T00893', '02/08/2024', '06:45:00', '06:43:28', '15:41:49', '08:58:21'),
(1262, 'T00894', '02/08/2024', '06:45:00', '06:48:07', '15:45:02', '08:56:55'),
(1263, 'T00895', '02/08/2024', '06:45:00', '06:34:48', '14:27:37', '07:52:49'),
(1264, 'T00896', '02/08/2024', '06:45:00', '06:35:42', '14:27:16', '07:51:34'),
(1265, 'T00897', '02/08/2024', '06:45:00', '06:46:14', '15:45:22', '08:59:08'),
(1266, 'T00898', '02/08/2024', '06:45:00', '06:39:32', '15:45:21', '09:05:49'),
(1267, 'T00904', '02/08/2024', '06:45:00', '06:42:06', '15:43:11', '09:01:05'),
(1268, 'T00905', '02/08/2024', '06:45:00', '06:27:57', '15:42:42', '09:14:45'),
(1269, 'T00907', '02/08/2024', '06:45:00', '06:17:48', '15:43:13', '09:25:25'),
(1270, 'T00911', '02/08/2024', '06:45:00', '06:37:59', '15:42:36', '09:04:37'),
(1271, 'T00912', '02/08/2024', '06:45:00', '13:11:17', '15:44:36', '02:33:19'),
(1272, 'T00916', '02/08/2024', '06:45:00', '06:30:25', '15:44:44', '09:14:19'),
(1273, 'T00918', '02/08/2024', '06:45:00', '06:20:46', '15:42:14', '09:21:28'),
(1274, 'T00919', '02/08/2024', '06:45:00', '06:33:18', '15:43:52', '09:10:34'),
(1275, 'T00922', '02/08/2024', '06:45:00', '06:43:20', '15:43:57', '09:00:37'),
(1276, 'T00930', '02/08/2024', '06:45:00', '06:44:54', '15:45:57', '09:01:03'),
(1277, 'T00931', '02/08/2024', '06:45:00', '06:31:31', '15:42:19', '09:10:48'),
(1278, 'T00944', '02/08/2024', '06:45:00', '06:27:21', '14:27:30', '08:00:09'),
(1279, 'T00948', '02/08/2024', '06:45:00', '06:27:07', '15:45:04', '09:17:57'),
(1280, 'T00963', '02/08/2024', '06:45:00', '06:43:51', '15:41:23', '08:57:32'),
(1281, 'T00966', '02/08/2024', '06:45:00', '06:35:39', '15:41:08', '09:05:29'),
(1282, 'T00970', '02/08/2024', '06:45:00', '06:01:44', '15:40:58', '09:39:14'),
(1283, 'T01015', '02/08/2024', '06:45:00', '06:35:44', '15:44:34', '09:08:50'),
(1284, 'T01019', '02/08/2024', '06:45:00', '06:36:18', '15:44:08', '09:07:50'),
(1285, 'T01020', '02/08/2024', '06:45:00', '06:33:12', '15:44:11', '09:10:59'),
(1286, 'T01023', '02/08/2024', '06:45:00', '06:15:26', '15:46:13', '09:30:47'),
(1287, 'T01024', '02/08/2024', '06:45:00', '06:26:03', '15:44:30', '09:18:27'),
(1288, 'T01025', '02/08/2024', '06:45:00', '06:41:46', '15:41:38', '08:59:52'),
(1289, 'T01039', '02/08/2024', '06:45:00', '05:52:33', '15:42:26', '09:49:53'),
(1290, 'T01041', '02/08/2024', '06:45:00', '06:41:55', '14:27:23', '07:45:28'),
(1291, 'T01044', '02/08/2024', '06:45:00', '06:12:01', '15:41:04', '09:29:03'),
(1292, 'T01054', '02/08/2024', '06:45:00', '06:05:07', '15:45:20', '09:40:13'),
(1293, 'T01056', '02/08/2024', '06:45:00', '06:04:52', '15:45:48', '09:40:56'),
(1294, 'T01068', '02/08/2024', '06:45:00', '06:31:20', '15:45:52', '09:14:32'),
(1295, 'T01070', '02/08/2024', '06:45:00', '06:47:08', '15:45:31', '08:58:23'),
(1296, 'T01076', '02/08/2024', '06:45:00', '06:37:15', '15:41:58', '09:04:43'),
(1297, 'T01087', '02/08/2024', '06:45:00', '00:16:32', '15:10:16', '14:53:44'),
(1298, 'T01090', '02/08/2024', '06:45:00', '06:34:42', '16:30:45', '09:56:03'),
(1299, 'T01093', '02/08/2024', '08:00:00', '08:19:45', '17:09:44', '08:49:59');
INSERT INTO `pointage` (`id`, `sName`, `Date`, `heure_e`, `Time_in`, `Time_out`, `Time_diff`) VALUES
(1300, 'T01095', '02/08/2024', '06:45:00', '06:53:31', '15:41:24', '08:47:53'),
(1301, 'T01099', '02/08/2024', '06:45:00', '06:43:03', '12:00:05', '05:17:02'),
(1302, 'T01112', '02/08/2024', '06:45:00', '06:46:50', '15:42:41', '08:55:51'),
(1303, 'T01113', '02/08/2024', '06:45:00', '06:42:16', '06:42:16', '00:00:00'),
(1304, 'T01115', '02/08/2024', '06:45:00', '06:28:06', '15:41:40', '09:13:34'),
(1305, 'T01116', '02/08/2024', '06:45:00', '06:34:31', '15:44:03', '09:09:32'),
(1306, 'T01120', '02/08/2024', '06:45:00', '06:35:51', '15:45:10', '09:09:19'),
(1307, 'T01121', '02/08/2024', '06:45:00', '06:28:27', '15:44:28', '09:16:01'),
(1308, 'T01124', '02/08/2024', '06:45:00', '06:32:16', '15:41:54', '09:09:38'),
(1309, 'T01126', '02/08/2024', '06:45:00', '06:41:51', '15:41:30', '08:59:39'),
(1310, 'T01135', '02/08/2024', '06:45:00', '06:24:49', '19:04:41', '12:39:52'),
(1311, 'T01137', '02/08/2024', '06:45:00', '06:42:32', '15:44:48', '09:02:16'),
(1312, 'T01142', '02/08/2024', '06:45:00', '06:47:11', '15:45:33', '08:58:22'),
(1313, 'T01145', '02/08/2024', '06:45:00', '06:50:01', '15:41:47', '08:51:46'),
(1314, 'T01149', '02/08/2024', '06:45:00', '06:32:44', '15:42:17', '09:09:33'),
(1315, 'T01154', '02/08/2024', '06:45:00', '06:24:59', '15:43:27', '09:18:28'),
(1316, 'T01155', '02/08/2024', '06:45:00', '06:43:57', '15:43:30', '08:59:33'),
(1317, 'T01158', '02/08/2024', '06:45:00', '07:14:18', '19:04:39', '11:50:21'),
(1318, 'T01159', '02/08/2024', '06:45:00', '06:42:02', '15:41:09', '08:59:07'),
(1319, 'T01161', '02/08/2024', '06:45:00', '06:34:35', '15:45:39', '09:11:04'),
(1320, 'T01162', '02/08/2024', '06:45:00', '05:59:09', '12:59:07', '06:59:58'),
(1321, 'T01164', '02/08/2024', '06:45:00', '06:34:28', '15:44:41', '09:10:13'),
(1322, 'T01165', '02/08/2024', '06:45:00', '06:38:21', '15:44:46', '09:06:25'),
(1323, 'T01177', '02/08/2024', '06:45:00', '06:37:23', '15:42:01', '09:04:38'),
(1324, 'T01182', '02/08/2024', '06:45:00', '06:24:11', '15:42:22', '09:18:11'),
(1325, 'T01186', '02/08/2024', '06:45:00', '06:41:58', '15:42:34', '09:00:36'),
(1326, 'T01219', '02/08/2024', '06:45:00', '06:34:55', '15:45:12', '09:10:17'),
(1327, 'T01220', '02/08/2024', '06:45:00', '06:33:15', '15:43:35', '09:10:20'),
(1328, 'T01221', '02/08/2024', '06:45:00', '06:39:24', '15:42:47', '09:03:23'),
(1329, 'T01222', '02/08/2024', '06:45:00', '06:27:30', '15:43:48', '09:16:18'),
(1330, 'T01223', '02/08/2024', '06:45:00', '06:36:53', '15:43:17', '09:06:24'),
(1331, 'T01224', '02/08/2024', '06:45:00', '06:42:20', '15:43:25', '09:01:05'),
(1332, 'T01225', '02/08/2024', '06:45:00', '06:24:39', '15:46:29', '09:21:50'),
(1333, 'T01226', '02/08/2024', '06:45:00', '06:42:51', '15:45:45', '09:02:54'),
(1334, 'T01231', '02/08/2024', '07:00:00', '06:42:11', '16:07:09', '09:24:58'),
(1335, 'T01233', '02/08/2024', '07:00:00', '20:42:56', '20:42:56', '00:00:00'),
(1336, 'T01234', '02/08/2024', '06:45:00', '06:28:01', '15:43:15', '09:15:14'),
(1337, 'T01235', '02/08/2024', '06:45:00', '06:29:00', '15:45:08', '09:16:08'),
(1338, 'T01236', '02/08/2024', '08:00:00', '06:30:30', '15:45:29', '09:14:59'),
(1339, 'T01133', '02/08/2024', '15:45:00', '15:43:32', '00:18:05', '08:34:33'),
(1340, 'T00009', '02/08/2024', '15:45:00', '15:14:04', '00:30:07', '09:16:03'),
(1341, 'T00452', '02/08/2024', '15:45:00', '15:55:02', '00:21:52', '08:26:50'),
(1342, 'T00508', '02/08/2024', '15:45:00', '15:55:01', '00:21:16', '08:26:15'),
(1343, 'T00539', '02/08/2024', '15:45:00', '14:47:09', '00:16:55', '09:29:46'),
(1344, 'T00590', '02/08/2024', '15:45:00', '15:43:40', '00:16:14', '08:32:34'),
(1345, 'T00647', '02/08/2024', '15:45:00', '14:51:17', '00:19:56', '09:28:39'),
(1346, 'T00805', '02/08/2024', '15:45:00', '00:22:11', '00:22:11', '00:00:00'),
(1347, 'T00822', '02/08/2024', '15:45:00', '12:55:02', '00:17:58', '11:22:56'),
(1348, 'T00823', '02/08/2024', '15:45:00', '15:47:22', '00:17:40', '08:30:18'),
(1349, 'T00861', '02/08/2024', '15:45:00', '15:30:21', '00:21:27', '08:51:06'),
(1350, 'T00867', '02/08/2024', '15:45:00', '15:28:18', '00:21:30', '08:53:12'),
(1351, 'T00873', '02/08/2024', '15:45:00', '15:56:08', '00:21:23', '08:25:15'),
(1352, 'T00883', '02/08/2024', '15:45:00', '15:48:00', '00:23:28', '08:35:28'),
(1353, 'T00917', '02/08/2024', '15:45:00', '15:40:00', '00:16:32', '08:36:32'),
(1354, 'T00920', '02/08/2024', '15:45:00', '15:30:12', '00:22:27', '08:52:15'),
(1355, 'T00921', '02/08/2024', '15:45:00', '15:14:08', '00:21:55', '09:07:47'),
(1356, 'T00927', '02/08/2024', '15:45:00', '14:51:40', '00:20:18', '09:28:38'),
(1357, 'T00935', '02/08/2024', '15:45:00', '14:57:24', '00:21:06', '09:23:42'),
(1358, 'T00936', '02/08/2024', '15:45:00', '15:48:06', '00:22:45', '08:34:39'),
(1359, 'T00938', '02/08/2024', '15:45:00', '00:18:44', '00:18:44', '00:00:00'),
(1360, 'T00945', '02/08/2024', '15:45:00', '15:45:25', '00:19:34', '08:34:09'),
(1361, 'T00950', '02/08/2024', '15:45:00', '15:38:53', '00:16:36', '08:37:43'),
(1362, 'T00968', '02/08/2024', '15:45:00', '15:42:03', '06:37:00', '14:54:57'),
(1363, 'T00976', '02/08/2024', '15:45:00', '14:50:56', '00:17:15', '09:26:19'),
(1364, 'T00977', '02/08/2024', '15:45:00', '15:45:26', '00:16:41', '08:31:15'),
(1365, 'T00978', '02/08/2024', '15:45:00', '13:03:44', '00:20:25', '11:16:41'),
(1366, 'T00982', '02/08/2024', '15:45:00', '00:20:10', '00:20:10', '00:00:00'),
(1367, 'T00986', '02/08/2024', '15:45:00', '15:30:09', '00:18:32', '08:48:23'),
(1368, 'T00997', '02/08/2024', '15:45:00', '15:53:04', '00:21:10', '08:28:06'),
(1369, 'T01016', '02/08/2024', '15:45:00', '15:42:05', '00:17:53', '08:35:48'),
(1370, 'T01017', '02/08/2024', '15:45:00', '15:42:07', '00:18:25', '08:36:18'),
(1371, 'T01026', '02/08/2024', '15:45:00', '15:42:32', '00:18:16', '08:35:44'),
(1372, 'T01029', '02/08/2024', '15:45:00', '15:52:52', '00:19:54', '08:27:02'),
(1373, 'T01030', '02/08/2024', '15:45:00', '15:35:23', '00:22:10', '08:46:47'),
(1374, 'T01040', '02/08/2024', '15:45:00', '15:41:18', '00:19:59', '08:38:41'),
(1375, 'T01042', '02/08/2024', '15:45:00', '15:48:48', '00:20:42', '08:31:54'),
(1376, 'T01047', '02/08/2024', '15:45:00', '15:07:08', '00:18:35', '09:11:27'),
(1377, 'T01051', '02/08/2024', '15:45:00', '15:37:19', '00:19:37', '08:42:18'),
(1378, 'T01064', '02/08/2024', '15:45:00', '15:47:31', '00:17:46', '08:30:15'),
(1379, 'T01077', '02/08/2024', '15:45:00', '15:21:24', '00:17:20', '08:55:56'),
(1380, 'T01078', '02/08/2024', '15:45:00', '15:30:17', '00:19:49', '08:49:32'),
(1381, 'T01080', '02/08/2024', '15:45:00', '15:28:43', '00:18:03', '08:49:20'),
(1382, 'T01083', '02/08/2024', '15:45:00', '14:57:51', '00:20:20', '09:22:29'),
(1383, 'T01089', '02/08/2024', '15:45:00', '15:42:28', '00:27:28', '08:45:00'),
(1384, 'T01097', '02/08/2024', '15:45:00', '15:44:25', '00:16:22', '08:31:57'),
(1385, 'T01100', '02/08/2024', '15:45:00', '15:20:19', '00:16:47', '08:56:28'),
(1386, 'T01101', '02/08/2024', '15:45:00', '15:32:41', '00:18:11', '08:45:30'),
(1387, 'T01109', '02/08/2024', '15:45:00', '14:59:25', '00:17:37', '09:18:12'),
(1388, 'T01110', '02/08/2024', '15:45:00', '15:52:59', '00:17:24', '08:24:25'),
(1389, 'T01111', '02/08/2024', '15:45:00', '15:21:29', '00:17:13', '08:55:44'),
(1390, 'T01122', '02/08/2024', '15:45:00', '15:38:55', '00:16:08', '08:37:13'),
(1391, 'T01127', '02/08/2024', '15:45:00', '15:53:30', '00:18:57', '08:25:27'),
(1392, 'T01128', '02/08/2024', '15:45:00', '15:39:56', '00:16:38', '08:36:42'),
(1393, 'T01129', '02/08/2024', '15:45:00', '15:41:32', '00:22:52', '08:41:20'),
(1394, 'T01130', '02/08/2024', '15:45:00', '14:47:02', '00:16:57', '09:29:55'),
(1395, 'T01132', '02/08/2024', '15:45:00', '15:43:34', '00:19:17', '08:35:43'),
(1396, 'T01134', '02/08/2024', '15:45:00', '15:56:37', '00:18:10', '08:21:33'),
(1397, 'T01138', '02/08/2024', '15:45:00', '15:47:19', '00:23:25', '08:36:06'),
(1398, 'T01146', '02/08/2024', '15:45:00', '15:47:36', '00:17:56', '08:30:20'),
(1399, 'T01152', '02/08/2024', '15:45:00', '15:33:04', '00:20:45', '08:47:41'),
(1400, 'T01157', '02/08/2024', '15:45:00', '15:42:24', '00:19:31', '08:37:07'),
(1401, 'T01167', '02/08/2024', '15:45:00', '15:38:19', '00:18:55', '08:40:36'),
(1402, 'T01168', '02/08/2024', '15:45:00', '15:41:26', '00:17:00', '08:35:34'),
(1403, 'T01169', '02/08/2024', '15:45:00', '14:56:52', '00:16:27', '09:19:35'),
(1404, 'T01172', '02/08/2024', '15:45:00', '15:17:25', '00:16:24', '08:58:59'),
(1405, 'T01173', '02/08/2024', '15:45:00', '15:19:44', '00:20:23', '09:00:39'),
(1406, 'T01174', '02/08/2024', '15:45:00', '15:36:21', '00:18:14', '08:41:53'),
(1407, 'T01175', '02/08/2024', '15:45:00', '16:00:56', '00:17:32', '08:16:36'),
(1408, 'T01176', '02/08/2024', '15:45:00', '15:17:45', '00:17:35', '08:59:50'),
(1409, 'T01178', '02/08/2024', '15:45:00', '15:52:56', '00:17:30', '08:24:34'),
(1410, 'T01179', '02/08/2024', '15:45:00', '15:30:49', '00:17:50', '08:47:01'),
(1411, 'T01180', '02/08/2024', '15:45:00', '15:27:00', '00:16:43', '08:49:43'),
(1412, 'T01181', '02/08/2024', '15:45:00', '15:47:34', '00:18:18', '08:30:44'),
(1413, 'T01184', '02/08/2024', '15:45:00', '15:46:11', '00:18:00', '08:31:49'),
(1414, 'T01185', '02/08/2024', '15:45:00', '14:58:53', '00:17:26', '09:18:33'),
(1415, 'T01187', '02/08/2024', '15:45:00', '15:34:56', '00:17:43', '08:42:47'),
(1416, 'T01188', '02/08/2024', '15:45:00', '15:41:28', '00:17:11', '08:35:43'),
(1417, 'T01190', '02/08/2024', '15:45:00', '15:31:14', '00:16:51', '08:45:37'),
(1418, 'T01193', '02/08/2024', '15:45:00', '15:42:30', '00:21:18', '08:38:48'),
(1419, 'T01195', '02/08/2024', '15:45:00', '15:19:00', '00:16:53', '08:57:53'),
(1420, 'T01196', '02/08/2024', '15:45:00', '14:57:47', '00:17:48', '09:20:01'),
(1421, 'T01197', '02/08/2024', '15:45:00', '15:38:57', '00:19:21', '08:40:24'),
(1422, 'T01198', '02/08/2024', '15:45:00', '00:18:30', '00:18:30', '00:00:00'),
(1423, 'T01199', '02/08/2024', '15:45:00', '15:31:05', '00:17:09', '08:46:04'),
(1424, 'T01200', '02/08/2024', '15:45:00', '15:29:42', '00:18:08', '08:48:26'),
(1425, 'T01202', '02/08/2024', '15:45:00', '00:17:34', '00:17:34', '00:00:00'),
(1426, 'T01203', '02/08/2024', '15:45:00', '15:42:56', '00:19:43', '08:36:47'),
(1427, 'T01204', '02/08/2024', '15:45:00', '15:33:01', '00:22:56', '08:49:55'),
(1428, 'T01205', '02/08/2024', '15:45:00', '15:46:02', '00:17:07', '08:31:05'),
(1429, 'T01206', '02/08/2024', '15:45:00', '15:32:47', '00:19:28', '08:46:41'),
(1430, 'T01207', '02/08/2024', '15:45:00', '15:31:08', '00:19:00', '08:47:52'),
(1431, 'T01212', '02/08/2024', '15:45:00', '15:53:02', '00:19:12', '08:26:10'),
(1432, 'T01213', '02/08/2024', '15:45:00', '00:20:38', '00:20:38', '00:00:00'),
(1433, 'T01215', '02/08/2024', '15:45:00', '15:46:46', '00:23:56', '08:37:10'),
(1434, 'T01216', '02/08/2024', '15:45:00', '15:45:55', '00:22:24', '08:36:29'),
(1435, 'T01229', '02/08/2024', '15:45:00', '00:17:44', '00:18:20', '00:00:36'),
(1436, 'T01232', '02/08/2024', '15:45:00', '15:44:52', '00:17:28', '08:32:36');

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
-- Structure de la table `shift`
--

DROP TABLE IF EXISTS `shift`;
CREATE TABLE IF NOT EXISTS `shift` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `em_id` varchar(20) NOT NULL,
  `shift` varchar(20) NOT NULL,
  `heure_e` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=385 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `shift`
--

INSERT INTO `shift` (`id`, `em_id`, `shift`, `heure_e`) VALUES
(2, 'T00982', 'PM', '15:45:00'),
(3, 'T00867', 'PM', '15:45:00'),
(4, 'T00508', 'PM', '15:45:00'),
(5, 'T01026', 'PM', '15:45:00'),
(6, 'T00452', 'PM', '15:45:00'),
(7, 'T01089', 'PM', '15:45:00'),
(8, 'T01140', 'PM', '15:45:00'),
(9, 'T00861', 'PM', '15:45:00'),
(10, 'T01202', 'PM', '15:45:00'),
(11, 'T01216', 'PM', '15:45:00'),
(12, 'T01134', 'PM', '15:45:00'),
(13, 'T01129', 'PM', '15:45:00'),
(14, 'T01037', 'PM', '15:45:00'),
(15, 'T01176', 'PM', '15:45:00'),
(16, 'T00936', 'PM', '15:45:00'),
(17, 'T01173', 'PM', '15:45:00'),
(18, 'T01100', 'PM', '15:45:00'),
(19, 'T01042', 'PM', '15:45:00'),
(20, 'T01188', 'PM', '15:45:00'),
(21, 'T01189', 'PM', '15:45:00'),
(22, 'T01180', 'PM', '15:45:00'),
(23, 'T01203', 'PM', '15:45:00'),
(24, 'T01215', 'PM', '15:45:00'),
(25, 'T01206', 'PM', '15:45:00'),
(26, 'T00590', 'PM', '15:45:00'),
(27, 'T01157', 'PM', '15:45:00'),
(134, 'T00147', 'DAY', '06:45:00'),
(29, 'T01171', 'PM', '15:45:00'),
(133, 'T00075', 'DAY', '07:30:00'),
(131, 'T00003', 'DAY', ''),
(32, 'T01190', 'PM', '15:45:00'),
(132, 'T00054', 'DAY', '06:45:00'),
(34, 'T01228', 'PM', '15:45:00'),
(35, 'T01196', 'PM', '15:45:00'),
(36, 'T00997', 'PM', '15:45:00'),
(37, 'T01029', 'PM', '15:45:00'),
(38, 'T01097', 'PM', '15:45:00'),
(39, 'T01030', 'PM', '15:45:00'),
(40, 'T00986', 'PM', '15:45:00'),
(41, 'T01040', 'PM', '15:45:00'),
(42, 'T01080', 'PM', '15:45:00'),
(43, 'T01077', 'PM', '15:45:00'),
(44, 'T00935', 'PM', '15:45:00'),
(45, 'T01078', 'PM', '15:45:00'),
(46, 'T00873', 'PM', '15:45:00'),
(47, 'T01117', 'PM', '15:45:00'),
(48, 'T00921', 'PM', '15:45:00'),
(49, 'T00920', 'PM', '15:45:00'),
(50, 'T01168', 'PM', '15:45:00'),
(51, 'T01179', 'PM', '15:45:00'),
(52, 'T01187', 'PM', '15:45:00'),
(130, 'T00002', 'DAY', ''),
(54, 'T01185', 'PM', '15:45:00'),
(55, 'T00391', 'PM', '15:45:00'),
(56, 'T01109', 'PM', '15:45:00'),
(57, 'T01101', 'PM', '15:45:00'),
(58, 'T01127', 'PM', '15:45:00'),
(59, 'T01103', 'PM', '15:45:00'),
(60, 'T01184', 'PM', '15:45:00'),
(61, 'T01227', 'PM', '15:45:00'),
(62, 'T01230', 'PM', '15:45:00'),
(63, 'T01193', 'PM', '15:45:00'),
(64, 'T01051', 'PM', '15:45:00'),
(65, 'T00883', 'PM', '15:45:00'),
(66, 'T01107', 'PM', '15:45:00'),
(67, 'T01130', 'PM', '15:45:00'),
(68, 'T01061', 'PM', '15:45:00'),
(137, 'T00222', 'DAY', '06:45:00'),
(70, 'T01064', 'PM', '15:45:00'),
(135, 'T00172', 'DAY', '06:45:00'),
(72, 'T01152', 'PM', '15:45:00'),
(73, 'T00009', 'PM', '15:45:00'),
(74, 'T01122', 'PM', '15:45:00'),
(75, 'T01132', 'PM', '15:45:00'),
(76, 'T00539', 'PM', '15:45:00'),
(77, 'T01207', 'PM', '15:45:00'),
(78, 'T01204', 'PM', '15:45:00'),
(129, 'T00001', 'DAY', ''),
(80, 'T01197', 'PM', '15:45:00'),
(81, 'T00822', 'PM', '15:45:00'),
(82, 'T00950', 'PM', '15:45:00'),
(83, 'T01146', 'PM', '15:45:00'),
(84, 'T01128', 'PM', '15:45:00'),
(85, 'T00823', 'PM', '15:45:00'),
(86, 'T01047', 'PM', '15:45:00'),
(87, 'T00977', 'PM', '15:45:00'),
(88, 'T00945', 'PM', '15:45:00'),
(89, 'T01069', 'PM', '15:45:00'),
(90, 'T01083', 'PM', '15:45:00'),
(91, 'T01144', 'PM', '15:45:00'),
(92, 'T00978', 'PM', '15:45:00'),
(93, 'T01081', 'PM', '15:45:00'),
(94, 'T01199', 'PM', '15:45:00'),
(95, 'T01213', 'PM', '15:45:00'),
(96, 'T01017', 'PM', '15:45:00'),
(97, 'T01016', 'PM', '15:45:00'),
(98, 'T01169', 'PM', '15:45:00'),
(99, 'T01200', 'PM', '15:45:00'),
(100, 'T01178', 'PM', '15:45:00'),
(101, 'T01195', 'PM', '15:45:00'),
(102, 'T00927', 'PM', '15:45:00'),
(103, 'T00647', 'PM', '15:45:00'),
(104, 'T01110', 'PM', '15:45:00'),
(105, 'T01050', 'PM', '15:45:00'),
(106, 'T01138', 'PM', '15:45:00'),
(107, 'T01229', 'PM', '15:45:00'),
(108, 'T01232', 'PM', '15:45:00'),
(109, 'T01074', 'PM', '15:45:00'),
(110, 'T01156', 'PM', '15:45:00'),
(111, 'T01175', 'PM', '15:45:00'),
(112, 'T01170', 'PM', '15:45:00'),
(113, 'T01174', 'PM', '15:45:00'),
(114, 'T01205', 'PM', '15:45:00'),
(115, 'T01212', 'PM', '15:45:00'),
(116, 'T01111', 'PM', '15:45:00'),
(117, 'T01181', 'PM', '15:45:00'),
(118, 'T01172', 'PM', '15:45:00'),
(119, 'T00938', 'PM', '15:45:00'),
(136, 'T00183', 'DAY', '06:45:00'),
(121, 'T01133', 'PM', '15:45:00'),
(122, 'T01167', 'PM', '15:45:00'),
(123, 'T01198', 'PM', '15:45:00'),
(124, 'T00805', 'PM', '15:45:00'),
(125, 'T00976', 'PM', '15:45:00'),
(126, 'T00917', 'PM', '15:45:00'),
(138, 'T00252', 'DAY', '08:00:00'),
(128, 'T01163', 'PM', '15:45:00'),
(139, 'T00253', 'DAY', '06:45:00'),
(140, 'T00266', 'DAY', '06:45:00'),
(141, 'T00386', 'DAY', '06:45:00'),
(142, 'T00390', 'DAY', '06:45:00'),
(143, 'T00455', 'DAY', '06:45:00'),
(144, 'T00468', 'DAY', '06:45:00'),
(145, 'T00470', 'DAY', '06:45:00'),
(146, 'T00478', 'DAY', '06:45:00'),
(147, 'T00484', 'DAY', '07:30:00'),
(148, 'T00486', 'DAY', '08:00:00'),
(149, 'T00487', 'DAY', '06:45:00'),
(150, 'T00492', 'DAY', '06:45:00'),
(151, 'T00501', 'DAY', '06:45:00'),
(152, 'T00529', 'DAY', '06:45:00'),
(153, 'T00532', 'DAY', '06:45:00'),
(154, 'T00534', 'DAY', '06:45:00'),
(155, 'T00540', 'DAY', '06:45:00'),
(156, 'T00546', 'DAY', '06:45:00'),
(157, 'T00552', 'DAY', '06:45:00'),
(158, 'T00557', 'DAY', '06:45:00'),
(159, 'T00559', 'DAY', '06:45:00'),
(160, 'T00561', 'DAY', '06:45:00'),
(161, 'T00567', 'DAY', '06:45:00'),
(162, 'T00596', 'DAY', '06:45:00'),
(163, 'T00597', 'DAY', '06:45:00'),
(164, 'T00602', 'DAY', '06:45:00'),
(165, 'T00606', 'DAY', '06:45:00'),
(166, 'T00609', 'DAY', '06:45:00'),
(167, 'T00613', 'DAY', '06:45:00'),
(168, 'T00615', 'DAY', '06:45:00'),
(169, 'T00628', 'DAY', '06:45:00'),
(170, 'T00630', 'DAY', '06:45:00'),
(171, 'T00641', 'DAY', '06:45:00'),
(172, 'T00649', 'DAY', '06:45:00'),
(173, 'T00653', 'DAY', '06:45:00'),
(174, 'T00655', 'DAY', '06:45:00'),
(175, 'T00674', 'DAY', '06:45:00'),
(176, 'T00698', 'DAY', '06:45:00'),
(177, 'T00699', 'DAY', '06:45:00'),
(178, 'T00709', 'DAY', '06:45:00'),
(179, 'T00721', 'DAY', '06:45:00'),
(180, 'T00722', 'DAY', '06:45:00'),
(181, 'T00723', 'DAY', '06:45:00'),
(182, 'T00724', 'DAY', '06:45:00'),
(183, 'T00726', 'DAY', '06:45:00'),
(184, 'T00727', 'DAY', '08:00:00'),
(185, 'T00729', 'DAY', '06:45:00'),
(186, 'T00730', 'DAY', '06:45:00'),
(187, 'T00733', 'DAY', '06:45:00'),
(188, 'T00742', 'DAY', '06:45:00'),
(189, 'T00766', 'DAY', '06:45:00'),
(190, 'T00777', 'DAY', '08:00:00'),
(191, 'T00779', 'DAY', '06:45:00'),
(192, 'T00781', 'DAY', '06:45:00'),
(193, 'T00784', 'DAY', '06:45:00'),
(194, 'T00785', 'DAY', '06:45:00'),
(195, 'T00787', 'DAY', '06:45:00'),
(196, 'T00797', 'DAY', '06:45:00'),
(197, 'T00802', 'DAY', '06:45:00'),
(198, 'T00808', 'DAY', '06:45:00'),
(199, 'T00814', 'DAY', '06:45:00'),
(200, 'T00831', 'DAY', '06:45:00'),
(201, 'T00832', 'DAY', '06:45:00'),
(202, 'T00846', 'DAY', '06:45:00'),
(203, 'T00848', 'DAY', '06:45:00'),
(204, 'T00849', 'DAY', '06:45:00'),
(205, 'T00851', 'DAY', '06:45:00'),
(206, 'T00854', 'DAY', '06:45:00'),
(207, 'T00864', 'DAY', '06:45:00'),
(208, 'T00868', 'DAY', '06:45:00'),
(209, 'T00869', 'DAY', '06:45:00'),
(210, 'T00870', 'DAY', '06:45:00'),
(211, 'T00875', 'DAY', '06:45:00'),
(212, 'T00876', 'DAY', '06:45:00'),
(213, 'T00880', 'DAY', '06:45:00'),
(214, 'T00881', 'DAY', '06:45:00'),
(215, 'T00884', 'DAY', '06:45:00'),
(216, 'T00885', 'DAY', '06:45:00'),
(217, 'T00888', 'DAY', '06:45:00'),
(218, 'T00889', 'DAY', '06:45:00'),
(219, 'T00891', 'DAY', '06:45:00'),
(220, 'T00893', 'DAY', '06:45:00'),
(221, 'T00894', 'DAY', '06:45:00'),
(222, 'T00895', 'DAY', '06:45:00'),
(223, 'T00896', 'DAY', '06:45:00'),
(224, 'T00897', 'DAY', '06:45:00'),
(225, 'T00898', 'DAY', '06:45:00'),
(226, 'T00899', 'DAY', '06:45:00'),
(227, 'T00903', 'DAY', '06:45:00'),
(228, 'T00904', 'DAY', '06:45:00'),
(229, 'T00905', 'DAY', '06:45:00'),
(230, 'T00906', 'DAY', '06:45:00'),
(231, 'T00907', 'DAY', '06:45:00'),
(232, 'T00911', 'DAY', '06:45:00'),
(233, 'T00912', 'DAY', '06:45:00'),
(234, 'T00913', 'DAY', '06:45:00'),
(235, 'T00915', 'DAY', '06:45:00'),
(236, 'T00916', 'DAY', '06:45:00'),
(237, 'T00918', 'DAY', '06:45:00'),
(238, 'T00919', 'DAY', '06:45:00'),
(239, 'T00922', 'DAY', '06:45:00'),
(240, 'T00928', 'DAY', '06:45:00'),
(241, 'T00930', 'DAY', '06:45:00'),
(242, 'T00931', 'DAY', '06:45:00'),
(243, 'T00933', 'DAY', '06:45:00'),
(244, 'T00934', 'DAY', '06:45:00'),
(245, 'T00940', 'DAY', '06:45:00'),
(246, 'T00942', 'DAY', '06:45:00'),
(247, 'T00943', 'DAY', '06:45:00'),
(248, 'T00944', 'DAY', '06:45:00'),
(249, 'T00946', 'DAY', '06:45:00'),
(250, 'T00947', 'DAY', '06:45:00'),
(251, 'T00948', 'DAY', '06:45:00'),
(252, 'T00949', 'DAY', '06:45:00'),
(253, 'T00954', 'DAY', '06:45:00'),
(254, 'T00957', 'DAY', '06:45:00'),
(255, 'T00963', 'DAY', '06:45:00'),
(256, 'T00966', 'DAY', '06:45:00'),
(257, 'T00969', 'DAY', '06:45:00'),
(258, 'T00970', 'DAY', '06:45:00'),
(259, 'T00972', 'DAY', '06:45:00'),
(260, 'T00973', 'DAY', '06:45:00'),
(261, 'T00975', 'DAY', '06:45:00'),
(262, 'T00979', 'DAY', '06:45:00'),
(263, 'T00985', 'DAY', '06:45:00'),
(264, 'T00989', 'DAY', '06:45:00'),
(265, 'T00991', 'DAY', '06:45:00'),
(266, 'T00999', 'DAY', '06:45:00'),
(267, 'T01000', 'DAY', '06:45:00'),
(268, 'T01001', 'DAY', '06:45:00'),
(269, 'T01002', 'DAY', '06:45:00'),
(270, 'T01003', 'DAY', '06:45:00'),
(271, 'T01005', 'DAY', '06:45:00'),
(272, 'T01006', 'DAY', '06:45:00'),
(273, 'T01007', 'DAY', '06:45:00'),
(274, 'T01008', 'DAY', '06:45:00'),
(275, 'T01010', 'DAY', '06:45:00'),
(276, 'T01011', 'DAY', '06:45:00'),
(277, 'T01012', 'DAY', '06:45:00'),
(278, 'T01015', 'DAY', '06:45:00'),
(279, 'T01018', 'DAY', '06:45:00'),
(280, 'T01019', 'DAY', '06:45:00'),
(281, 'T01020', 'DAY', '06:45:00'),
(282, 'T01021', 'DAY', '06:45:00'),
(283, 'T01022', 'DAY', '06:45:00'),
(284, 'T01023', 'DAY', '06:45:00'),
(285, 'T01024', 'DAY', '06:45:00'),
(286, 'T01025', 'DAY', '06:45:00'),
(287, 'T01027', 'DAY', '06:45:00'),
(288, 'T01028', 'DAY', '06:45:00'),
(289, 'T01031', 'DAY', '06:45:00'),
(290, 'T01032', 'DAY', '06:45:00'),
(291, 'T01033', 'DAY', '06:45:00'),
(292, 'T01034', 'DAY', '06:45:00'),
(293, 'T01035', 'DAY', '06:45:00'),
(294, 'T01036', 'DAY', '06:45:00'),
(295, 'T01038', 'DAY', '06:45:00'),
(296, 'T01039', 'DAY', '06:45:00'),
(297, 'T01041', 'DAY', '06:45:00'),
(298, 'T01043', 'DAY', '06:45:00'),
(299, 'T01044', 'DAY', '06:45:00'),
(300, 'T01045', 'DAY', '06:45:00'),
(301, 'T01046', 'DAY', '06:45:00'),
(302, 'T01048', 'DAY', '06:45:00'),
(303, 'T01049', 'DAY', '06:45:00'),
(304, 'T01052', 'DAY', '06:45:00'),
(305, 'T01054', 'DAY', '06:45:00'),
(306, 'T01055', 'DAY', '06:45:00'),
(307, 'T01056', 'DAY', '06:45:00'),
(308, 'T01057', 'DAY', '08:00:01'),
(309, 'T01058', 'DAY', '06:45:00'),
(310, 'T01059', 'DAY', '06:45:00'),
(311, 'T01062', 'DAY', '06:45:00'),
(312, 'T01063', 'DAY', '06:45:00'),
(313, 'T01065', 'DAY', '06:45:00'),
(314, 'T01066', 'DAY', '06:45:00'),
(315, 'T01067', 'DAY', '06:45:00'),
(316, 'T01068', 'DAY', '06:45:00'),
(317, 'T01070', 'DAY', '06:45:00'),
(318, 'T01071', 'DAY', '06:45:00'),
(319, 'T01072', 'DAY', '06:45:00'),
(320, 'T01073', 'DAY', '06:45:00'),
(321, 'T01075', 'DAY', '06:45:00'),
(322, 'T01076', 'DAY', '06:45:00'),
(323, 'T01079', 'DAY', '06:45:00'),
(324, 'T01085', 'DAY', '06:45:00'),
(325, 'T01087', 'DAY', '06:45:00'),
(326, 'T01090', 'DAY', '06:45:00'),
(327, 'T01091', 'DAY', '06:45:00'),
(328, 'T01093', 'DAY', '08:00:00'),
(329, 'T01095', 'DAY', '06:45:00'),
(330, 'T01096', 'DAY', '06:45:00'),
(331, 'T01099', 'DAY', '06:45:00'),
(332, 'T01105', 'DAY', '06:45:00'),
(333, 'T01112', 'DAY', '06:45:00'),
(334, 'T01113', 'DAY', '06:45:00'),
(335, 'T01115', 'DAY', '06:45:00'),
(336, 'T01116', 'DAY', '06:45:00'),
(337, 'T01118', 'DAY', '06:45:00'),
(338, 'T01120', 'DAY', '06:45:00'),
(339, 'T01121', 'DAY', '06:45:00'),
(340, 'T01124', 'DAY', '06:45:00'),
(341, 'T01125', 'DAY', '06:45:00'),
(342, 'T01126', 'DAY', '06:45:00'),
(343, 'T01135', 'DAY', '06:45:00'),
(344, 'T01137', 'DAY', '06:45:00'),
(345, 'T01139', 'DAY', '06:45:00'),
(346, 'T01142', 'DAY', '06:45:00'),
(347, 'T01145', 'DAY', '06:45:00'),
(348, 'T01148', 'DAY', '06:45:00'),
(349, 'T01149', 'DAY', '06:45:00'),
(350, 'T01153', 'DAY', '06:45:00'),
(351, 'T01154', 'DAY', '06:45:00'),
(352, 'T01155', 'DAY', '06:45:00'),
(353, 'T01158', 'DAY', '06:45:00'),
(354, 'T01159', 'DAY', '06:45:00'),
(355, 'T01160', 'DAY', '06:45:00'),
(356, 'T01161', 'DAY', '06:45:00'),
(357, 'T01162', 'DAY', '06:45:00'),
(358, 'T01164', 'DAY', '06:45:00'),
(359, 'T01165', 'DAY', '06:45:00'),
(360, 'T01166', 'DAY', '06:45:00'),
(361, 'T01177', 'DAY', '06:45:00'),
(362, 'T01182', 'DAY', '06:45:00'),
(363, 'T01186', 'DAY', '06:45:00'),
(364, 'T01191', 'DAY', '06:45:00'),
(365, 'T01192', 'DAY', '06:45:00'),
(366, 'T01201', 'DAY', '07:00:00'),
(367, 'T01208', 'DAY', '06:45:00'),
(368, 'T01209', 'DAY', '06:45:00'),
(369, 'T01210', 'DAY', '06:45:00'),
(370, 'T01219', 'DAY', '06:45:00'),
(371, 'T01220', 'DAY', '06:45:00'),
(372, 'T01221', 'DAY', '06:45:00'),
(373, 'T01222', 'DAY', '06:45:00'),
(374, 'T01223', 'DAY', '06:45:00'),
(375, 'T01224', 'DAY', '06:45:00'),
(376, 'T01225', 'DAY', '06:45:00'),
(377, 'T01226', 'DAY', '06:45:00'),
(378, 'T01231', 'DAY', '07:00:00'),
(379, 'T01233', 'DAY', '07:00:00'),
(380, 'T01234', 'DAY', '06:45:00'),
(381, 'T01235', 'DAY', '06:45:00'),
(382, 'T01236', 'DAY', '08:00:00'),
(383, 'T0968', 'PM', '15:45:00'),
(384, 'T00968', 'PM', '15:45:00');

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
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `timing`
--

INSERT INTO `timing` (`id`, `em_id`, `time`, `tdate`) VALUES
(45, 'T01121', '00:01:17', '17/08/2024'),
(43, 'T00484', '00:01:35', '02/07/2024'),
(42, 'T01089', '00:00:18', '02/07/2024'),
(44, 'T00391', '00:01:42', '15/07/2024'),
(40, 'T01012', '00:01:38', '04/06/2024');

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

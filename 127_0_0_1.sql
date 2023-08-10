-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 09, 2023 at 12:06 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `joe_security_db`
--

USE `joe_security_db`;

-- --------------------------------------------------------

--
-- Table structure for table `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add Token', 7, 'add_token'),
(26, 'Can change Token', 7, 'change_token'),
(27, 'Can delete Token', 7, 'delete_token'),
(28, 'Can view Token', 7, 'view_token'),
(29, 'Can add token', 8, 'add_tokenproxy'),
(30, 'Can change token', 8, 'change_tokenproxy'),
(31, 'Can delete token', 8, 'delete_tokenproxy'),
(32, 'Can view token', 8, 'view_tokenproxy'),
(33, 'Can add product', 9, 'add_product'),
(34, 'Can change product', 9, 'change_product'),
(35, 'Can delete product', 9, 'delete_product'),
(36, 'Can view product', 9, 'view_product'),
(37, 'Can add challenge', 10, 'add_challenge'),
(38, 'Can change challenge', 10, 'change_challenge'),
(39, 'Can delete challenge', 10, 'delete_challenge'),
(40, 'Can view challenge', 10, 'view_challenge'),
(41, 'Can add educational content', 11, 'add_educationalcontent'),
(42, 'Can change educational content', 11, 'change_educationalcontent'),
(43, 'Can delete educational content', 11, 'delete_educationalcontent'),
(44, 'Can view educational content', 11, 'view_educationalcontent'),
(45, 'Can add lab topic', 12, 'add_labtopic'),
(46, 'Can change lab topic', 12, 'change_labtopic'),
(47, 'Can delete lab topic', 12, 'delete_labtopic'),
(48, 'Can view lab topic', 12, 'view_labtopic'),
(49, 'Can add login user', 13, 'add_loginuser'),
(50, 'Can change login user', 13, 'change_loginuser'),
(51, 'Can delete login user', 13, 'delete_loginuser'),
(52, 'Can view login user', 13, 'view_loginuser'),
(53, 'Can add login password', 14, 'add_loginpassword'),
(54, 'Can change login password', 14, 'change_loginpassword'),
(55, 'Can delete login password', 14, 'delete_loginpassword'),
(56, 'Can view login password', 14, 'view_loginpassword'),
(57, 'Can add fake user', 15, 'add_fakeuser'),
(58, 'Can change fake user', 15, 'change_fakeuser'),
(59, 'Can delete fake user', 15, 'delete_fakeuser'),
(60, 'Can view fake user', 15, 'view_fakeuser'),
(61, 'Can add account5', 16, 'add_account5'),
(62, 'Can change account5', 16, 'change_account5'),
(63, 'Can delete account5', 16, 'delete_account5'),
(64, 'Can view account5', 16, 'view_account5'),
(65, 'Can add authentication code', 17, 'add_authenticationcode'),
(66, 'Can change authentication code', 17, 'change_authenticationcode'),
(67, 'Can delete authentication code', 17, 'delete_authenticationcode'),
(68, 'Can view authentication code', 17, 'view_authenticationcode');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$R3BiqkJDmiXQaIp77HgcZA$HA1NakCDLnpAfiuzB83QVVQTxDYs5NEv3ESWCYDYEA0=', '2023-08-08 08:48:10.017637', 1, 'joe', '', '', 'gerges@queensoft.net', 1, 1, '2023-07-23 12:21:51.219680'),
(3, 'pbkdf2_sha256$600000$MOTuLj2ftbXAwZYqIz6h9K$rJAgCcVPE1ayiG06lJoonsvdyjpExSqX0JZZTlaeK9k=', '2023-07-30 11:48:16.945370', 1, 'joe2', '', '', 'wasim@queensoft.net', 1, 1, '2023-07-30 11:47:20.399585');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-07-26 08:13:09.353801', '1', 'Security Engineering — Second Edition', 1, '[{\"added\": {}}]', 9, 1),
(2, '2023-07-26 08:15:01.946552', '2', 'The Art of Invisibility', 1, '[{\"added\": {}}]', 9, 1),
(3, '2023-07-26 08:15:56.378861', '3', 'Hacking: The Art of Exploitation', 1, '[{\"added\": {}}]', 9, 1),
(4, '2023-07-26 08:17:06.837045', '4', 'Cult of the Dead Cow', 1, '[{\"added\": {}}]', 9, 1),
(5, '2023-07-26 08:18:13.647607', '5', 'Ghost In The Wires', 1, '[{\"added\": {}}]', 9, 1),
(6, '2023-07-26 08:20:51.644724', '6', 'Practical Malware Analysis', 1, '[{\"added\": {}}]', 9, 1),
(7, '2023-07-26 08:21:38.231672', '7', 'Threat Modeling', 1, '[{\"added\": {}}]', 9, 1),
(8, '2023-07-26 08:22:33.319228', '8', 'The Cyber Effect', 1, '[{\"added\": {}}]', 9, 1),
(9, '2023-07-26 08:23:43.163564', '9', 'Social Engineering', 1, '[{\"added\": {}}]', 9, 1),
(10, '2023-07-26 08:24:51.685106', '10', 'The Secret to Cybersecurity', 1, '[{\"added\": {}}]', 9, 1),
(11, '2023-07-26 08:26:51.138832', '11', 'Computer Programming And Cyber Security', 1, '[{\"added\": {}}]', 9, 1),
(12, '2023-07-26 08:32:17.101873', '12', 'Digital Forensics and Incident Response', 1, '[{\"added\": {}}]', 9, 1),
(13, '2023-07-26 08:33:21.175810', '13', 'Hacking For Dummies', 1, '[{\"added\": {}}]', 9, 1),
(14, '2023-07-26 08:34:45.179807', '14', 'The Cybersecurity to English Dictionary', 1, '[{\"added\": {}}]', 9, 1),
(15, '2023-07-26 08:36:53.507878', '15', 'RANSOMWARE & CYBERLAW', 1, '[{\"added\": {}}]', 9, 1),
(16, '2023-07-26 08:37:50.132633', '16', 'The Wires of War', 1, '[{\"added\": {}}]', 9, 1),
(17, '2023-07-26 08:40:39.954827', '17', 'Network Security and Cryptography', 1, '[{\"added\": {}}]', 9, 1),
(18, '2023-07-26 08:42:21.961596', '18', 'Wireless and Mobile Device Security', 1, '[{\"added\": {}}]', 9, 1),
(19, '2023-07-26 08:46:41.623882', '19', 'Computer Networking Hacking', 1, '[{\"added\": {}}]', 9, 1),
(20, '2023-07-26 08:49:29.123751', '20', 'The Complete Cyber Security Book', 1, '[{\"added\": {}}]', 9, 1),
(21, '2023-07-26 12:18:22.998269', '9', 'Social Engineering', 2, '[{\"changed\": {\"fields\": [\"Description\", \"Price\"]}}]', 9, 1),
(22, '2023-07-26 12:18:41.851653', '20', 'The Complete Cyber Security Book', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 9, 1),
(23, '2023-07-26 12:18:47.290970', '20', 'The Complete Cyber Security Book', 2, '[]', 9, 1),
(24, '2023-07-26 12:18:58.774452', '19', 'Computer Networking Hacking', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 9, 1),
(25, '2023-07-26 12:19:05.662716', '18', 'Wireless and Mobile Device Security', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 9, 1),
(26, '2023-07-26 12:19:19.605459', '17', 'Network Security and Cryptography', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 9, 1),
(27, '2023-07-26 12:19:28.817143', '16', 'The Wires of War', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 9, 1),
(28, '2023-07-26 12:19:36.561589', '16', 'The Wires of War', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 9, 1),
(29, '2023-07-26 12:19:52.712191', '15', 'RANSOMWARE & CYBERLAW', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 9, 1),
(30, '2023-07-26 12:20:00.136285', '14', 'The Cybersecurity to English Dictionary', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 9, 1),
(31, '2023-07-26 12:20:07.261423', '13', 'Hacking For Dummies', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 9, 1),
(32, '2023-07-26 12:20:14.140875', '12', 'Digital Forensics and Incident Response', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 9, 1),
(33, '2023-07-26 12:20:31.809469', '8', 'The Cyber Effect', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 9, 1),
(34, '2023-07-26 12:20:40.568063', '1', 'Security Engineering — Second Edition', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 9, 1),
(35, '2023-07-26 12:21:00.433677', '2', 'The Art of Invisibility', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 9, 1),
(36, '2023-07-26 12:21:09.609798', '3', 'Hacking: The Art of Exploitation', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 9, 1),
(37, '2023-07-26 12:21:22.982833', '4', 'Cult of the Dead Cow', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 9, 1),
(38, '2023-07-26 12:21:36.067022', '5', 'Ghost In The Wires', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 9, 1),
(39, '2023-07-26 12:21:54.625407', '6', 'Practical Malware Analysis', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 9, 1),
(40, '2023-07-26 12:22:04.870554', '7', 'Threat Modeling', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 9, 1),
(41, '2023-07-26 12:22:34.566042', '10', 'The Secret to Cybersecurity', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 9, 1),
(42, '2023-07-26 12:22:43.282622', '11', 'Computer Programming And Cyber Security', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 9, 1),
(43, '2023-07-26 18:37:09.821019', '20', 'The Complete Cyber Security Book', 2, '[{\"changed\": {\"fields\": [\"category\"]}}]', 9, 1),
(44, '2023-07-26 18:37:14.510699', '19', 'Computer Networking Hacking', 2, '[{\"changed\": {\"fields\": [\"category\"]}}]', 9, 1),
(45, '2023-07-26 18:37:20.560780', '18', 'Wireless and Mobile Device Security', 2, '[{\"changed\": {\"fields\": [\"category\"]}}]', 9, 1),
(46, '2023-07-26 18:37:28.655477', '17', 'Network Security and Cryptography', 2, '[{\"changed\": {\"fields\": [\"category\"]}}]', 9, 1),
(47, '2023-07-26 18:37:40.074276', '14', 'The Cybersecurity to English Dictionary', 2, '[{\"changed\": {\"fields\": [\"category\"]}}]', 9, 1),
(48, '2023-07-26 18:37:49.719460', '12', 'Digital Forensics and Incident Response', 2, '[{\"changed\": {\"fields\": [\"category\"]}}]', 9, 1),
(49, '2023-07-26 18:37:57.772890', '8', 'The Cyber Effect', 2, '[{\"changed\": {\"fields\": [\"category\"]}}]', 9, 1),
(50, '2023-07-26 18:38:05.602295', '7', 'Threat Modeling', 2, '[{\"changed\": {\"fields\": [\"category\"]}}]', 9, 1),
(51, '2023-07-26 18:38:12.860459', '2', 'The Art of Invisibility', 2, '[{\"changed\": {\"fields\": [\"category\"]}}]', 9, 1),
(52, '2023-07-26 18:38:19.937961', '1', 'Security Engineering — Second Edition', 2, '[{\"changed\": {\"fields\": [\"category\"]}}]', 9, 1),
(53, '2023-07-26 18:38:25.519122', '12', 'Digital Forensics and Incident Response', 2, '[]', 9, 1),
(54, '2023-07-26 18:38:30.645223', '8', 'The Cyber Effect', 2, '[]', 9, 1),
(55, '2023-07-26 18:38:35.562330', '6', 'Practical Malware Analysis', 2, '[{\"changed\": {\"fields\": [\"category\"]}}]', 9, 1),
(56, '2023-07-26 18:38:44.079753', '4', 'Cult of the Dead Cow', 2, '[{\"changed\": {\"fields\": [\"category\"]}}]', 9, 1),
(57, '2023-07-27 07:42:26.627250', '20', 'The Complete Cyber Security Book', 2, '[{\"changed\": {\"fields\": [\"category\"]}}]', 9, 1),
(58, '2023-07-27 07:42:38.830176', '19', 'Computer Networking Hacking', 2, '[]', 9, 1),
(59, '2023-07-27 07:42:45.674656', '18', 'Wireless and Mobile Device Security', 2, '[{\"changed\": {\"fields\": [\"category\"]}}]', 9, 1),
(60, '2023-07-27 07:43:21.589048', '17', 'Network Security and Cryptography', 2, '[{\"changed\": {\"fields\": [\"category\"]}}]', 9, 1),
(61, '2023-07-27 07:43:31.354612', '16', 'The Wires of War', 2, '[{\"changed\": {\"fields\": [\"category\"]}}]', 9, 1),
(62, '2023-07-27 07:43:41.382371', '15', 'RANSOMWARE & CYBERLAW', 2, '[{\"changed\": {\"fields\": [\"category\"]}}]', 9, 1),
(63, '2023-07-27 07:43:45.742049', '14', 'The Cybersecurity to English Dictionary', 2, '[]', 9, 1),
(64, '2023-07-27 07:43:52.032310', '13', 'Hacking For Dummies', 2, '[{\"changed\": {\"fields\": [\"category\"]}}]', 9, 1),
(65, '2023-07-27 07:43:56.735788', '12', 'Digital Forensics and Incident Response', 2, '[]', 9, 1),
(66, '2023-07-27 07:44:07.769548', '11', 'Computer Programming And Cyber Security', 2, '[{\"changed\": {\"fields\": [\"category\"]}}]', 9, 1),
(67, '2023-07-27 07:44:16.313389', '10', 'The Secret to Cybersecurity', 2, '[{\"changed\": {\"fields\": [\"category\"]}}]', 9, 1),
(68, '2023-07-27 07:44:23.584766', '9', 'Social Engineering', 2, '[{\"changed\": {\"fields\": [\"category\"]}}]', 9, 1),
(69, '2023-07-27 07:44:31.790112', '8', 'The Cyber Effect', 2, '[]', 9, 1),
(70, '2023-07-27 07:44:38.139113', '7', 'Threat Modeling', 2, '[]', 9, 1),
(71, '2023-07-27 07:44:42.835573', '6', 'Practical Malware Analysis', 2, '[]', 9, 1),
(72, '2023-07-27 07:44:50.161344', '5', 'Ghost In The Wires', 2, '[{\"changed\": {\"fields\": [\"category\"]}}]', 9, 1),
(73, '2023-07-27 07:44:56.251047', '4', 'Cult of the Dead Cow', 2, '[]', 9, 1),
(74, '2023-07-27 07:45:05.158004', '3', 'Hacking: The Art of Exploitation', 2, '[{\"changed\": {\"fields\": [\"category\"]}}]', 9, 1),
(75, '2023-07-27 07:45:14.512850', '2', 'The Art of Invisibility', 2, '[{\"changed\": {\"fields\": [\"category\"]}}]', 9, 1),
(76, '2023-07-27 07:45:28.911998', '1', 'Security Engineering — Second Edition', 2, '[{\"changed\": {\"fields\": [\"category\"]}}]', 9, 1),
(77, '2023-07-27 09:16:54.653686', '20', 'The Complete Cyber Security Book', 2, '[]', 9, 1),
(78, '2023-07-27 10:34:05.931226', '21', 'Threat Modeling 2', 1, '[{\"added\": {}}]', 9, 1),
(79, '2023-07-27 10:36:28.392617', '21', 'Threat Modeling 2', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 9, 1),
(80, '2023-07-27 13:05:25.127550', '19', 'Computer Networking Hacking', 2, '[{\"changed\": {\"fields\": [\"Is special\"]}}]', 9, 1),
(81, '2023-07-27 13:05:30.008901', '20', 'The Complete Cyber Security Book', 2, '[{\"changed\": {\"fields\": [\"Is special\"]}}]', 9, 1),
(82, '2023-07-30 11:48:59.801174', '2', 'admin', 3, '', 4, 3),
(83, '2023-07-30 12:08:38.760105', '1', 'admin', 1, '[{\"added\": {}}]', 14, 3),
(84, '2023-07-30 13:38:26.835562', '2', 'wasim', 1, '[{\"added\": {}}]', 14, 3),
(85, '2023-07-30 21:32:59.171386', '1', 'Jessica', 1, '[{\"added\": {}}]', 15, 3),
(86, '2023-07-30 21:33:25.628180', '2', 'Carien', 1, '[{\"added\": {}}]', 15, 3),
(87, '2023-07-30 21:33:40.539916', '3', 'Michael', 1, '[{\"added\": {}}]', 15, 3),
(88, '2023-07-30 21:33:56.987437', '4', 'Andrew', 1, '[{\"added\": {}}]', 15, 3),
(89, '2023-07-31 06:44:04.705624', '5', 'Andrew', 1, '[{\"added\": {}}]', 15, 3),
(90, '2023-07-31 06:44:15.010412', '6', 'Jessica', 1, '[{\"added\": {}}]', 15, 3),
(91, '2023-07-31 06:44:24.985234', '7', 'Jessica', 1, '[{\"added\": {}}]', 15, 3),
(92, '2023-07-31 07:08:55.603017', '8', 'asd', 1, '[{\"added\": {}}]', 15, 3),
(93, '2023-07-31 07:09:06.103022', '9', 'admin', 1, '[{\"added\": {}}]', 15, 3),
(94, '2023-07-31 07:09:13.331841', '10', 'Jessica', 1, '[{\"added\": {}}]', 15, 3),
(95, '2023-07-31 07:09:24.326435', '11', 'wasim', 1, '[{\"added\": {}}]', 15, 3),
(96, '2023-07-31 07:24:16.154983', '11', 'Wasim Wasfy', 2, '[{\"changed\": {\"fields\": [\"Username\", \"Job title\"]}}]', 15, 3),
(97, '2023-07-31 07:24:35.443656', '10', 'Jessica Michael', 2, '[{\"changed\": {\"fields\": [\"Username\", \"Job title\"]}}]', 15, 3),
(98, '2023-07-31 07:24:54.048443', '12', 'Joe Gerges', 1, '[{\"added\": {}}]', 15, 3),
(99, '2023-07-31 07:25:16.731410', '13', 'Andrew', 1, '[{\"added\": {}}]', 15, 3),
(100, '2023-07-31 08:14:28.367415', '14', 'Wasim Wasfy', 1, '[{\"added\": {}}]', 15, 3),
(101, '2023-07-31 08:14:45.036123', '15', 'Joe Gerges', 1, '[{\"added\": {}}]', 15, 3),
(102, '2023-07-31 08:22:38.992932', '18', 'Product object (18)', 2, '[{\"changed\": {\"fields\": [\"Is special\"]}}]', 9, 3),
(103, '2023-07-31 08:22:44.633639', '13', 'Product object (13)', 2, '[{\"changed\": {\"fields\": [\"Is special\"]}}]', 9, 3),
(104, '2023-07-31 08:33:45.517133', '16', 'Joe Gerges', 1, '[{\"added\": {}}]', 15, 3),
(105, '2023-07-31 08:33:55.905553', '17', 'Wasim Wasfy', 1, '[{\"added\": {}}]', 15, 3),
(106, '2023-07-31 08:34:12.073350', '18', 'Andrew Gerges', 1, '[{\"added\": {}}]', 15, 3),
(107, '2023-07-31 08:34:23.564342', '19', 'Jessica Michael', 1, '[{\"added\": {}}]', 15, 3),
(108, '2023-07-31 10:18:21.917662', '20', 'Wasim Wasfy', 1, '[{\"added\": {}}]', 15, 3),
(109, '2023-07-31 10:18:38.397018', '21', 'Jessica Michael', 1, '[{\"added\": {}}]', 15, 3),
(110, '2023-07-31 10:18:48.636942', '22', 'Andrew Gerges', 1, '[{\"added\": {}}]', 15, 3),
(111, '2023-07-31 10:19:05.509781', '23', 'Valia Bahgat', 1, '[{\"added\": {}}]', 15, 3),
(112, '2023-07-31 10:19:40.944674', '24', 'Mo Salah', 1, '[{\"added\": {}}]', 15, 3),
(113, '2023-07-31 10:24:42.459686', '13', 'Product object (13)', 2, '[{\"changed\": {\"fields\": [\"Is special\"]}}]', 9, 3),
(114, '2023-07-31 10:28:03.505325', '25', 'Messi', 1, '[{\"added\": {}}]', 15, 3),
(115, '2023-07-31 10:28:19.626596', '26', 'Andrew Gerges', 1, '[{\"added\": {}}]', 15, 3),
(116, '2023-07-31 10:29:03.921556', '27', 'Raed Fanous', 1, '[{\"added\": {}}]', 15, 3),
(117, '2023-08-06 06:48:57.616460', '1', 'joo', 1, '[{\"added\": {}}]', 16, 3),
(118, '2023-08-06 06:49:25.742551', '2', 'Carin', 1, '[{\"added\": {}}]', 16, 3),
(119, '2023-08-06 06:52:27.660862', '1', '123456', 1, '[{\"added\": {}}]', 17, 3),
(120, '2023-08-06 06:52:41.584754', '2', '280590', 1, '[{\"added\": {}}]', 17, 3);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(7, 'authtoken', 'token'),
(8, 'authtoken', 'tokenproxy'),
(5, 'contenttypes', 'contenttype'),
(16, 'lab_environment', 'account5'),
(17, 'lab_environment', 'authenticationcode'),
(10, 'lab_environment', 'challenge'),
(11, 'lab_environment', 'educationalcontent'),
(15, 'lab_environment', 'fakeuser'),
(12, 'lab_environment', 'labtopic'),
(14, 'lab_environment', 'loginpassword'),
(13, 'lab_environment', 'loginuser'),
(9, 'lab_environment', 'product'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-07-22 16:55:12.506075'),
(2, 'auth', '0001_initial', '2023-07-22 16:55:13.710668'),
(3, 'admin', '0001_initial', '2023-07-22 16:55:14.098166'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-07-22 16:55:14.114778'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-07-22 16:55:14.134724'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-07-22 16:55:14.260388'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-07-22 16:55:14.376059'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-07-22 16:55:14.423102'),
(9, 'auth', '0004_alter_user_username_opts', '2023-07-22 16:55:14.440056'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-07-22 16:55:14.527385'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-07-22 16:55:14.531673'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-07-22 16:55:14.547630'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-07-22 16:55:14.577549'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-07-22 16:55:14.615451'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-07-22 16:55:14.649359'),
(16, 'auth', '0011_update_proxy_permissions', '2023-07-22 16:55:14.664330'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-07-22 16:55:14.703213'),
(18, 'authtoken', '0001_initial', '2023-07-22 16:55:14.840776'),
(19, 'authtoken', '0002_auto_20160226_1747', '2023-07-22 16:55:14.893544'),
(20, 'authtoken', '0003_tokenproxy', '2023-07-22 16:55:14.904515'),
(21, 'sessions', '0001_initial', '2023-07-22 16:55:15.015650'),
(22, 'lab_environment', '0001_initial', '2023-07-23 12:49:57.501380'),
(23, 'lab_environment', '0002_product_price', '2023-07-26 11:50:57.833268'),
(24, 'lab_environment', '0003_product_category_alter_product_price', '2023-07-26 17:58:41.058590'),
(25, 'lab_environment', '0004_alter_product_category', '2023-07-26 18:06:43.681524'),
(26, 'lab_environment', '0005_alter_product_category', '2023-07-27 09:16:19.530239'),
(27, 'lab_environment', '0006_product_is_special', '2023-07-27 10:14:21.751065'),
(28, 'lab_environment', '0007_loginuser', '2023-07-30 10:52:39.256449'),
(29, 'lab_environment', '0008_loginpassword_delete_loginuser', '2023-07-30 11:39:29.455056'),
(30, 'lab_environment', '0009_fakeuser', '2023-07-30 21:06:15.576579'),
(31, 'lab_environment', '0010_fakeuser_job_title', '2023-07-31 07:23:17.930014'),
(32, 'lab_environment', '0011_account5_authenticationcode', '2023-08-06 06:04:51.272315'),
(33, 'lab_environment', '0012_authenticationcode_serial', '2023-08-06 06:51:13.549710'),
(34, 'lab_environment', '0013_customuser', '2023-08-07 21:08:08.228362'),
(35, 'lab_environment', '0014_delete_customuser', '2023-08-07 21:08:08.299506');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('ze05rx8cwu1m0q37a9u6tii3zevyerny', '.eJxVjDsOwjAQBe_iGlnrT5yQkp4zWGvv5gORLdlJhbg7iRQkaGfem5fwuK2T3yoXP5PohRKXXxYwPjkdgh6YxixjTmuZgzwm8rRV3jPxcju3f4EJ67S_dXQdMBi4moBWaWKD2KBpWMdO2UY5R5bagVtwCEADYtTBWsKuBQ24R5c8zsnXLUauVfQDLpW_lEvJ5WTvD0NMR04:1qTekD:LJ0vL51ndDspXS97rHTk38fzTdH6mUH-cxG153LX4Jc', '2023-08-23 08:40:41.705767');

-- --------------------------------------------------------

--
-- Table structure for table `lab_environment_account5`
--

CREATE TABLE `lab_environment_account5` (
  `id` bigint(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lab_environment_account5`
--

INSERT INTO `lab_environment_account5` (`id`, `username`, `password`) VALUES
(1, 'joo', 'admin123'),
(2, 'Carin', 'aa2233');

-- --------------------------------------------------------

--
-- Table structure for table `lab_environment_authenticationcode`
--

CREATE TABLE `lab_environment_authenticationcode` (
  `id` bigint(20) NOT NULL,
  `code` varchar(6) NOT NULL,
  `serial` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lab_environment_authenticationcode`
--

INSERT INTO `lab_environment_authenticationcode` (`id`, `code`, `serial`) VALUES
(1, '123456', '1'),
(2, '280590', '2');

-- --------------------------------------------------------

--
-- Table structure for table `lab_environment_challenge`
--

CREATE TABLE `lab_environment_challenge` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `solution` longtext NOT NULL,
  `lab_topic_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lab_environment_educationalcontent`
--

CREATE TABLE `lab_environment_educationalcontent` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `lab_topic_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lab_environment_fakeuser`
--

CREATE TABLE `lab_environment_fakeuser` (
  `id` bigint(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `job_title` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lab_environment_fakeuser`
--

INSERT INTO `lab_environment_fakeuser` (`id`, `username`, `job_title`) VALUES
(16, 'Joe Gerges', 'CEO'),
(20, 'Wasim Wasfy', 'COO'),
(21, 'Jessica Michael', 'DA'),
(23, 'Valia Bahgat', 'PH'),
(24, 'Mo Salah', 'FP'),
(26, 'Andrew Gerges', 'DR');

-- --------------------------------------------------------

--
-- Table structure for table `lab_environment_labtopic`
--

CREATE TABLE `lab_environment_labtopic` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lab_environment_loginpassword`
--

CREATE TABLE `lab_environment_loginpassword` (
  `id` bigint(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lab_environment_loginpassword`
--

INSERT INTO `lab_environment_loginpassword` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin123'),
(2, 'wasim', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `lab_environment_product`
--

CREATE TABLE `lab_environment_product` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `category` varchar(20) NOT NULL,
  `is_special` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lab_environment_product`
--

INSERT INTO `lab_environment_product` (`id`, `name`, `description`, `image`, `price`, `category`, `is_special`) VALUES
(1, 'Security Engineering — Second Edition', 'The e-book version is available now for $42 from Wiley and for $47 from Amazon; paper copies are now shipping from Wiley USA and UK', 'product_images/book2coverlarge_1.jpg', 42.00, 'cyber_security', 0),
(2, 'The Art of Invisibility', 'Written By: Kevin Mitnick\r\nRelease Date: Feb 4, 2017\r\nPages: 320\r\nPrice: $19.17', 'product_images/41qaqfEvgwL._SX331_BO1204203200__gDqwaXV.jpg', 19.17, 'threat_modeling', 0),
(3, 'Hacking: The Art of Exploitation', 'Written By: Jon Erickson\r\nRelease Date: Feb 4, 2008\r\nPages: 488\r\nPrice: $22 – 27', 'product_images/61VBaAS4IbL._SX383_BO1204203200__avHLjm6.jpg', 22.00, 'hacking', 0),
(4, 'Cult of the Dead Cow', 'Written By: Joseph Menn\r\nRelease Date: June 4, 2019\r\nPages: 272\r\nPrice: $20', 'product_images/41vACymv5JL._SX321_BO1204203200__bR3IeHD.jpg', 20.00, 'cyber_security', 0),
(5, 'Ghost In The Wires', 'Written By: Kevin Mitnick\r\nRelease Date: April 24, 2012\r\nPages: 448\r\nPrice: $11.49', 'product_images/51kt5CfVEkL._SX330_BO1204203200__bvXQlJn.jpg', 11.49, 'hacking', 0),
(6, 'Practical Malware Analysis', 'Written By: Michael Sikorski and Andrew Honig\r\nRelease Date: Feb 1, 2012\r\nPages: 800\r\nPrice: $39.99', 'product_images/51dAWYyitYL._SX384_BO1204203200__0h9JKEd.jpg', 40.00, 'hacking', 0),
(7, 'Threat Modeling', 'Written By: Adam Shostack\r\nRelease Date: Feb 17, 2014\r\nPages: 624\r\nPrice: $54.22', 'product_images/51VIynC2scL._SX397_BO1204203200__1jhybSu.jpg', 54.22, 'threat_modeling', 0),
(8, 'The Cyber Effect', 'Written By: Mary Aiken\r\nRelease Date: June 27, 2017\r\nPages: 400\r\nPrice: $14', 'product_images/51SxY0XvfCL._SX331_BO1204203200__Hu4uNh5.jpg', 14.00, 'cyber_security', 0),
(9, 'Social Engineering', 'Written By: Christopher Hadnagy\r\nRelease Date: July 31, 2018\r\nPages: 320', 'product_images/41I1LMPxzQL._SX331_BO1204203200__3bNFDka.jpg', 32.00, 'network', 0),
(10, 'The Secret to Cybersecurity', 'A Simple Plan to Protect Your Family and Business from Cybercrime\r\nBy Scott Augenbaum', 'product_images/the-secret-to-cybersecurity-9781948677080_lg_Ziwr2rz.jpg', 48.12, 'cyber_security', 0),
(11, 'Computer Programming And Cyber Security', 'This Book Includes Python Machine Learning, SQL, Linux, Hacking with Kali Linux, and Ethical Hacking. Coding and Cybersecurity Fundamentals\r\nBy Zach Codings', 'product_images/51aMKIphQ5L._SX331_BO1204203200_.jpg', 56.00, 'cyber_security', 0),
(12, 'Digital Forensics and Incident Response', 'Incident response tools and techniques for effective cyber threat response, 3rd Edition\r\nGerard Johansen\r\nDec 16, 2022', 'product_images/41AVBLU6cuL._SX404_BO1204203200_.jpg', 36.00, 'threat_modeling', 0),
(13, 'Hacking For Dummies', 'Hacking For Dummies \r\nKevin Beaver\r\nApr 8, 2022', 'product_images/61NDbb9l6L._SL500_.jpg', 70.00, 'hacking', 0),
(14, 'The Cybersecurity to English Dictionary', 'The Cybersecurity to English Dictionary: 5th Edition Paperback \r\nMarch 10, 2022\r\nBy Raef Meeuwisse', 'product_images/41I3OUqo2yL._SX311_BO1204203200_.jpg', 55.00, 'cyber_security', 0),
(15, 'RANSOMWARE & CYBERLAW', 'RANSOMWARE & CYBERLAWRansomware is one of the increasingly complex phenomena that one is beginning to see in cyberspace these days. Ransomware focuses on depriving entities of legitimate access to their data till such time they pay ransom for the sam\r\nDecember 9, 2021\r\nBy DR. PAVAN DUGGAL', 'product_images/51Oh6ZUyIL._SL500_.jpg', 23.00, 'cyber_security', 0),
(16, 'The Wires of War', 'The Wires of War\r\nTechnology and the Global Struggle for Power\r\nJacob Helberg\r\nOct 12, 2021', 'product_images/41noqOYqi7L._SL500__3HBT2bJ.jpg', 64.00, 'cyber_security', 0),
(17, 'Network Security and Cryptography', 'Network Security and Cryptography\r\nBy Sarhan M. Musa\r\nSep 15, 2022', 'product_images/410fgF6B--L._SL500__VpwCu46.jpg', 50.00, 'network', 0),
(18, 'Wireless and Mobile Device Security', 'Wireless and Mobile Device Security + Cloud Labs\r\nBy Jim Doherty\r\nAug 24, 2021', 'product_images/41niF6Kpg7L._SL500__46FukL2.jpg', 40.00, 'network', 1),
(19, 'Computer Networking Hacking', 'Ultimate Guide To Ethical Hacking, Wireless Network, Cybersecurity With Practical Penetration Test On Kali Linux And System Security Practices (Computer Networking Easy)\r\nBy Ramon Base \r\nJuly 26, 2019', 'product_images/51oLZjncML._SX331_BO1204203200_.jpg', 96.00, 'hacking', 1),
(20, 'The Complete Cyber Security Book', 'Network Security!: Network Security, WiFi Security, WiFi Hackers, Firewalls, Wireshark, Secure Networking. \r\nMarch 26, 2022\r\nBy Sobia Khan', 'product_images/41TNlyNLKKL._SX331_BO1204203200_.jpg', 100.00, 'network', 1),
(21, 'Threat Modeling 2', 'Threat Modeling: A Practical Guide for Development Teams 1st Edition\r\nBy Izar Tarandach\r\n\r\nThreat modeling is one of the most essential--and most misunderstood--parts of the development lifecycle. Whether you\'re a security practitioner or a member of a development team, this book will help you gain a better understanding of how you can apply core threat modeling concepts to your practice to protect your systems against threats', 'product_images/51GLA3-zUwL._SX379_BO1204203200_.jpg', 50.00, 'threat_modeling', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `lab_environment_account5`
--
ALTER TABLE `lab_environment_account5`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `lab_environment_authenticationcode`
--
ALTER TABLE `lab_environment_authenticationcode`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD UNIQUE KEY `serial` (`serial`);

--
-- Indexes for table `lab_environment_challenge`
--
ALTER TABLE `lab_environment_challenge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lab_environment_chal_lab_topic_id_92e19ce6_fk_lab_envir` (`lab_topic_id`);

--
-- Indexes for table `lab_environment_educationalcontent`
--
ALTER TABLE `lab_environment_educationalcontent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lab_environment_educ_lab_topic_id_79191b6b_fk_lab_envir` (`lab_topic_id`);

--
-- Indexes for table `lab_environment_fakeuser`
--
ALTER TABLE `lab_environment_fakeuser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lab_environment_labtopic`
--
ALTER TABLE `lab_environment_labtopic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lab_environment_loginpassword`
--
ALTER TABLE `lab_environment_loginpassword`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lab_environment_product`
--
ALTER TABLE `lab_environment_product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `lab_environment_account5`
--
ALTER TABLE `lab_environment_account5`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lab_environment_authenticationcode`
--
ALTER TABLE `lab_environment_authenticationcode`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lab_environment_challenge`
--
ALTER TABLE `lab_environment_challenge`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lab_environment_educationalcontent`
--
ALTER TABLE `lab_environment_educationalcontent`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lab_environment_fakeuser`
--
ALTER TABLE `lab_environment_fakeuser`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `lab_environment_labtopic`
--
ALTER TABLE `lab_environment_labtopic`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lab_environment_loginpassword`
--
ALTER TABLE `lab_environment_loginpassword`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lab_environment_product`
--
ALTER TABLE `lab_environment_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `lab_environment_challenge`
--
ALTER TABLE `lab_environment_challenge`
  ADD CONSTRAINT `lab_environment_chal_lab_topic_id_92e19ce6_fk_lab_envir` FOREIGN KEY (`lab_topic_id`) REFERENCES `lab_environment_labtopic` (`id`);

--
-- Constraints for table `lab_environment_educationalcontent`
--
ALTER TABLE `lab_environment_educationalcontent`
  ADD CONSTRAINT `lab_environment_educ_lab_topic_id_79191b6b_fk_lab_envir` FOREIGN KEY (`lab_topic_id`) REFERENCES `lab_environment_labtopic` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

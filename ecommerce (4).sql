-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2019 at 01:27 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.2.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `attribute` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_arabic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  `value_arabic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `attribute`, `attribute_arabic`, `value`, `value_arabic`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Weight', 'Weight Arabic', NULL, NULL, 1, 1, '2019-03-14 03:26:35', '2019-04-11 00:43:16', NULL),
(2, 'Color', 'Color Arabic', NULL, NULL, 1, NULL, '2019-03-14 03:27:03', '2019-03-14 03:27:03', NULL),
(4, 'tes', 'test arabic', NULL, NULL, 8, NULL, '2019-04-09 04:27:46', '2019-04-09 04:27:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(10) UNSIGNED NOT NULL,
  `banner_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_image_arabic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_order` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_option` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '0 = Inactive and 1 = Active',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `banner_image`, `banner_image_arabic`, `banner_order`, `banner_option`, `options`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, '/uploads/Banners/almondsnutrition_1554893820.jpg', '/uploads/Banners/91ixoN40dTL_1554893820.jpg', NULL, 'category', '1', '1', 1, NULL, '2019-04-10 05:27:00', '2019-04-10 08:39:07', '2019-04-10 08:39:07'),
(4, '/uploads/Banners/810956_1554897536.png', '/uploads/Banners/692805_1554897536.jpg', NULL, 'category', '3', '1', 1, NULL, '2019-04-10 06:28:56', '2019-04-10 08:23:26', '2019-04-10 08:23:26'),
(5, '/uploads/Banners/10000512-2_1-bb-royal-walnutakharot-kernels_1554897575.jpg', '/uploads/Banners/en_cat-module-11_1554897575.png', NULL, 'product', '6', '1', 1, NULL, '2019-04-10 06:29:35', '2019-04-10 07:59:42', '2019-04-10 07:59:42'),
(6, '/uploads/Banners/banner1_1554904544.jpg', '/uploads/Banners/banner2_1554904544.jpg', NULL, 'category', '2', '1', 1, NULL, '2019-04-10 08:25:44', '2019-04-10 08:25:44', NULL),
(7, '/uploads/Banners/banner2_1554905369.jpg', '/uploads/Banners/slider3_1554905369.jpg', NULL, 'category', '1', '1', 1, NULL, '2019-04-10 08:39:29', '2019-04-10 08:39:29', NULL),
(8, '/uploads/Banners/387309_1554963391.jpg', '/uploads/Banners/322347_1554963391.jpg', NULL, 'category', '6', '1', 1, NULL, '2019-04-11 00:46:31', '2019-04-11 00:46:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `product_child_id` int(10) UNSIGNED DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  `cartData` longtext COLLATE utf8mb4_unicode_ci,
  `date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_category` int(11) DEFAULT '0',
  `category_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_name_arabic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '0 = Inactive and 1 = Active',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_category`, `category_name`, `category_name_arabic`, `category_image`, `tax_id`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 'Dry Fruits', 'فواكه مجففة', '/uploads/Category/almonds_and_nuts_191544_1553848023.jpg', 1, '1', 1, 1, '2019-03-14 03:24:47', '2019-04-05 01:49:04', NULL),
(2, 0, 'Snacks', 'وجبات خفيفة', '/uploads/Category/673331_1553848098.jpg', 1, '1', 1, 1, '2019-03-14 03:25:30', '2019-04-01 06:09:32', NULL),
(3, 1, 'Almonds', 'لوز', '/uploads/Category/almondsnutrition_1553848108.jpg', NULL, '1', 1, 1, '2019-03-27 05:53:50', '2019-03-29 02:58:28', NULL),
(4, 2, 'test', 'test', '/uploads/Category/dates_1553848140.jpg', 1, '1', 1, 1, '2019-03-29 01:29:21', '2019-03-29 02:59:00', NULL),
(5, 1, 'Fast Food', 'الوجبات السريعه', '/uploads/Category/887165_1553848048.jpg', NULL, '1', 1, 1, '2019-03-29 02:57:28', '2019-04-08 00:15:38', NULL),
(6, 0, 'Soft Drinks', 'مشروب غير كحولي', '/uploads/Category/387309_1554963107.jpg', 1, '1', 1, NULL, '2019-04-11 00:41:47', '2019-04-11 00:41:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `child_attributes`
--

CREATE TABLE `child_attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value_arabic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `child_attributes`
--

INSERT INTO `child_attributes` (`id`, `attribute_id`, `value`, `value_arabic`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '100 gm', NULL, 1, 1, '2019-03-14 03:26:35', '2019-04-11 00:43:16', NULL),
(2, 1, '200 gm', NULL, 1, 1, '2019-03-14 03:26:35', '2019-04-11 00:43:16', NULL),
(3, 1, '500 gm', NULL, 1, 1, '2019-03-14 03:26:35', '2019-04-11 00:43:16', NULL),
(4, 1, '1 kg', NULL, 1, 1, '2019-03-14 03:26:35', '2019-04-11 00:43:16', NULL),
(5, 1, '2 kg', NULL, 1, 1, '2019-03-14 03:26:35', '2019-04-11 00:43:16', NULL),
(6, 2, 'red', NULL, 1, NULL, '2019-03-14 03:27:03', '2019-03-14 03:27:03', NULL),
(7, 2, 'blue', NULL, 1, NULL, '2019-03-14 03:27:03', '2019-03-14 03:27:03', NULL),
(8, 2, 'green', NULL, 1, NULL, '2019-03-14 03:27:04', '2019-03-14 03:27:04', NULL),
(10, 4, '100 gm', NULL, 8, NULL, '2019-04-09 04:27:46', '2019-04-09 04:27:46', NULL),
(11, 4, '200 gm', NULL, 8, NULL, '2019-04-09 04:27:46', '2019-04-09 04:27:46', NULL),
(12, 1, '200ml', NULL, 1, 1, '2019-04-11 00:43:16', '2019-04-11 00:43:16', NULL),
(13, 1, '300ml', NULL, 1, 1, '2019-04-11 00:43:16', '2019-04-11 00:43:16', NULL),
(14, 1, '500ml', NULL, 1, 1, '2019-04-11 00:43:16', '2019-04-11 00:43:16', NULL),
(15, 1, '1ltr', NULL, 1, 1, '2019-04-11 00:43:16', '2019-04-11 00:43:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `child_products`
--

CREATE TABLE `child_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `child_attribute_ids` longtext COLLATE utf8mb4_unicode_ci,
  `price` double(8,2) DEFAULT NULL,
  `sale_price` double(8,2) DEFAULT NULL,
  `product_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_image_arabic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_other_image` longtext COLLATE utf8mb4_unicode_ci,
  `product_other_image_arabic` longtext COLLATE utf8mb4_unicode_ci,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `child_products`
--

INSERT INTO `child_products` (`id`, `product_id`, `child_attribute_ids`, `price`, `sale_price`, `product_image`, `product_image_arabic`, `product_other_image`, `product_other_image_arabic`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '1,6', 50.00, 39.00, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-14 03:30:31', '2019-03-27 06:48:37', NULL),
(2, 1, '3,7', 70.00, 60.00, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-14 03:30:31', '2019-03-27 06:48:37', NULL),
(3, 1, '4,8', 100.00, 80.00, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-14 03:30:31', '2019-03-27 06:48:37', NULL),
(4, 2, '3,7', 2000.00, 1500.00, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-14 03:34:08', '2019-03-27 06:38:05', NULL),
(5, 2, '4,7', 3000.00, 2500.00, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-14 03:34:08', '2019-03-27 06:38:05', NULL),
(6, 2, '5,8', 4000.00, 3500.00, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-14 03:34:08', '2019-03-27 06:38:05', NULL),
(7, 3, '1,6', 50.00, 20.00, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-14 06:43:12', '2019-03-14 06:43:12', NULL),
(8, 1, '3', 150.00, 100.00, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 23:32:50', '2019-03-27 06:48:37', NULL),
(9, 4, '', 80.00, 65.00, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-18 06:34:50', '2019-04-10 08:21:05', NULL),
(10, 5, '1', 100.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-23 00:25:20', '2019-04-08 04:36:19', NULL),
(11, 6, '1', 50.00, 24.00, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-01 06:07:11', '2019-04-01 06:07:11', NULL),
(12, 7, '3', 500.00, 450.00, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-01 08:47:26', '2019-04-01 08:47:26', NULL),
(13, 8, '1', 200.00, 150.00, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-02 05:36:06', '2019-04-02 05:36:06', NULL),
(14, 8, '3', 1000.00, 850.00, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-02 05:36:06', '2019-04-02 05:36:06', NULL),
(15, 9, '1', 500.00, 250.00, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-02 05:52:07', '2019-04-02 05:52:07', NULL),
(16, 9, '2', 1000.00, 500.00, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-02 05:52:07', '2019-04-02 05:52:07', NULL),
(17, 9, '3', 5000.00, 2500.00, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-02 05:52:08', '2019-04-02 05:52:08', NULL),
(18, 10, '10', 200.00, 150.00, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-09 04:16:29', '2019-04-09 04:30:23', NULL),
(19, 10, '2,11', 300.00, 250.00, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-09 04:16:29', '2019-04-09 04:30:23', NULL),
(20, 11, '12', 50.00, 30.00, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-11 00:46:01', '2019-04-11 00:46:01', NULL),
(21, 11, '13', 70.00, 50.00, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-11 00:46:01', '2019-04-11 00:46:01', NULL),
(22, 11, '14', 100.00, 80.00, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-11 00:46:01', '2019-04-11 00:46:01', NULL),
(23, 11, '15', 150.00, 130.00, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-11 00:46:01', '2019-04-11 00:46:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `sortname` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `dial_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Country code'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `sortname`, `name`, `dial_code`) VALUES
(1, 'AF', 'Afghanistan', '93'),
(2, 'AL', 'Albania', '355'),
(3, 'DZ', 'Algeria', '213'),
(4, 'AS', 'AmericanSamoa', '1684'),
(5, 'AD', 'Andorra', '376'),
(6, 'AO', 'Angola', '244'),
(7, 'AI', 'Anguilla', '1264'),
(8, 'AQ', 'Antarctica', '672'),
(9, 'AG', 'Antigua and Barbuda', '1268'),
(10, 'AR', 'Argentina', '54'),
(11, 'AM', 'Armenia', '374'),
(12, 'AW', 'Aruba', '297'),
(13, 'AU', 'Australia', '61'),
(14, 'AT', 'Austria', '43'),
(15, 'AZ', 'Azerbaijan', '994'),
(16, 'BS', 'Bahamas', '1242'),
(17, 'BH', 'Bahrain', '973'),
(18, 'BD', 'Bangladesh', '880'),
(19, 'BB', 'Barbados', '1246'),
(20, 'BY', 'Belarus', '375'),
(21, 'BE', 'Belgium', '32'),
(22, 'BZ', 'Belize', '501'),
(23, 'BJ', 'Benin', '229'),
(24, 'BM', 'Bermuda', '1441'),
(25, 'BT', 'Bhutan', '975'),
(26, 'BO', 'Bolivia, Plurinational State of', '591'),
(27, 'BA', 'Bosnia and Herzegovina', '387'),
(28, 'BW', 'Botswana', '267'),
(29, 'BV', 'Bouvet Island', '01147'),
(30, 'BR', 'Brazil', '55'),
(31, 'IO', 'British Indian Ocean Territory', '246'),
(32, 'BN', 'Brunei Darussalam', '673'),
(33, 'BG', 'Bulgaria', '359'),
(34, 'BF', 'Burkina Faso', '226'),
(35, 'BI', 'Burundi', '257'),
(36, 'KH', 'Cambodia', '855'),
(37, 'CM', 'Cameroon', '237'),
(38, 'CA', 'Canada', '1'),
(39, 'CV', 'Cape Verde', '238'),
(40, 'KY', 'Cayman Islands', ' 345'),
(41, 'CF', 'Central African Republic', '236'),
(42, 'TD', 'Chad', '235'),
(43, 'CL', 'Chile', '56'),
(44, 'CN', 'China', '86'),
(45, 'CX', 'Christmas Island', '61'),
(46, 'CC', 'Cocos (Keeling) Islands', '61'),
(47, 'CO', 'Colombia', '57'),
(48, 'KM', 'Comoros', '269'),
(49, 'CG', 'Congo', '242'),
(50, 'CD', 'Congo, The Democratic Republic of the', '243'),
(51, 'CK', 'Cook Islands', '682'),
(52, 'CR', 'Costa Rica', '506'),
(53, 'CI', 'Cote d\'Ivoire', '225'),
(54, 'HR', 'Croatia', '385'),
(55, 'CU', 'Cuba', '53'),
(56, 'CY', 'Cyprus', '537'),
(57, 'CZ', 'Czech Republic', '420'),
(58, 'DK', 'Denmark', '45'),
(59, 'DJ', 'Djibouti', '253'),
(60, 'DM', 'Dominica', '1767'),
(61, 'DO', 'Dominican Republic', '1849'),
(62, 'TP', 'East Timor', '670'),
(63, 'EC', 'Ecuador', '593'),
(64, 'EG', 'Egypt', '20'),
(65, 'SV', 'El Salvador', '503'),
(66, 'GQ', 'Equatorial Guinea', '240'),
(67, 'ER', 'Eritrea', '291'),
(68, 'EE', 'Estonia', '372'),
(69, 'ET', 'Ethiopia', '251'),
(70, 'XA', 'External Territories of Australia', ''),
(71, 'FK', 'Falkland Islands (Malvinas)', '500'),
(72, 'FO', 'Faroe Islands', '298'),
(73, 'FJ', 'Fiji', '679'),
(74, 'FI', 'Finland', '358'),
(75, 'FR', 'France', '33'),
(76, 'GF', 'French Guiana', '594'),
(77, 'PF', 'French Polynesia', '689'),
(78, 'TF', 'French Southern Territories', ''),
(79, 'GA', 'Gabon', '241'),
(80, 'GM', 'Gambia', '220'),
(81, 'GE', 'Georgia', '995'),
(82, 'DE', 'Germany', '49'),
(83, 'GH', 'Ghana', '233'),
(84, 'GI', 'Gibraltar', '350'),
(85, 'GR', 'Greece', '30'),
(86, 'GL', 'Greenland', '299'),
(87, 'GD', 'Grenada', '1473'),
(88, 'GP', 'Guadeloupe', '590'),
(89, 'GU', 'Guam', '1671'),
(90, 'GT', 'Guatemala', '502'),
(91, 'XU', 'Guernsey and Alderney', '01481'),
(92, 'GN', 'Guinea', '224'),
(93, 'GW', 'Guinea-Bissau', '245'),
(94, 'GY', 'Guyana', '595'),
(95, 'HT', 'Haiti', '509'),
(96, 'HM', 'Heard and McDonald Islands', ''),
(97, 'HN', 'Honduras', '504'),
(98, 'HK', 'Hong Kong', '852'),
(99, 'HU', 'Hungary', '36'),
(100, 'IS', 'Iceland', '354'),
(101, 'IN', 'India', '91'),
(102, 'ID', 'Indonesia', '62'),
(103, 'IR', 'Iran, Islamic Republic of', '98'),
(104, 'IQ', 'Iraq', '964'),
(105, 'IE', 'Ireland', '353'),
(106, 'IL', 'Israel', '972'),
(107, 'IT', 'Italy', '39'),
(108, 'JM', 'Jamaica', '1876'),
(109, 'JP', 'Japan', '81'),
(110, 'XJ', 'Jersey', '441534'),
(111, 'JO', 'Jordan', '962'),
(112, 'KZ', 'Kazakhstan', '7 7'),
(113, 'KE', 'Kenya', '254'),
(114, 'KI', 'Kiribati', '686'),
(115, 'KP', 'Korea, Democratic People\'s Republic of', '850'),
(116, 'KR', 'Korea, Republic of', '82'),
(117, 'KW', 'Kuwait', '965'),
(118, 'KG', 'Kyrgyzstan', '996'),
(119, 'LA', 'Lao People\'s Democratic Republic', '856'),
(120, 'LV', 'Latvia', '371'),
(121, 'LB', 'Lebanon', '961'),
(122, 'LS', 'Lesotho', '266'),
(123, 'LR', 'Liberia', '231'),
(124, 'LY', 'Libyan Arab Jamahiriya', '218'),
(125, 'LI', 'Liechtenstein', '423'),
(126, 'LT', 'Lithuania', '370'),
(127, 'LU', 'Luxembourg', '352'),
(128, 'MO', 'Macao', '853'),
(129, 'MK', 'Macedonia, The Former Yugoslav Republic of', '389'),
(130, 'MG', 'Madagascar', '261'),
(131, 'MW', 'Malawi', '265'),
(132, 'MY', 'Malaysia', '60'),
(133, 'MV', 'Maldives', '960'),
(134, 'ML', 'Mali', '223'),
(135, 'MT', 'Malta', '356'),
(136, 'XM', 'Man (Isle of)', ''),
(137, 'MH', 'Marshall Islands', '692'),
(138, 'MQ', 'Martinique', '596'),
(139, 'MR', 'Mauritania', '222'),
(140, 'MU', 'Mauritius', '230'),
(141, 'YT', 'Mayotte', '262'),
(142, 'MX', 'Mexico', '52'),
(143, 'FM', 'Micronesia, Federated States of', '691'),
(144, 'MD', 'Moldova, Republic of', '373'),
(145, 'MC', 'Monaco', '377'),
(146, 'MN', 'Mongolia', '976'),
(147, 'MS', 'Montserrat', '1664'),
(148, 'MA', 'Morocco', '212'),
(149, 'MZ', 'Mozambique', '258'),
(150, 'MM', 'Myanmar', '95'),
(151, 'NA', 'Namibia', '264'),
(152, 'NR', 'Nauru', '674'),
(153, 'NP', 'Nepal', '977'),
(154, 'AN', 'Netherlands Antilles', '599'),
(155, 'NL', 'Netherlands', '31'),
(156, 'NC', 'New Caledonia', '687'),
(157, 'NZ', 'New Zealand', '64'),
(158, 'NI', 'Nicaragua', '505'),
(159, 'NE', 'Niger', '227'),
(160, 'NG', 'Nigeria', '234'),
(161, 'NU', 'Niue', '683'),
(162, 'NF', 'Norfolk Island', '672'),
(163, 'MP', 'Northern Mariana Islands', '1670'),
(164, 'NO', 'Norway', '47'),
(165, 'OM', 'Oman', '968'),
(166, 'PK', 'Pakistan', '92'),
(167, 'PW', 'Palau', '680'),
(168, 'PS', 'Palestinian Territory, Occupied', '970'),
(169, 'PA', 'Panama', '507'),
(170, 'PG', 'Papua New Guinea', '675'),
(171, 'PY', 'Paraguay', '595'),
(172, 'PE', 'Peru', '51'),
(173, 'PH', 'Philippines', '63'),
(174, 'PN', 'Pitcairn', '872'),
(175, 'PL', 'Poland', '48'),
(176, 'PT', 'Portugal', '351'),
(177, 'PR', 'Puerto Rico', '1939'),
(178, 'QA', 'Qatar', '974'),
(179, 'RE', 'Réunion', '262'),
(180, 'RO', 'Romania', '40'),
(181, 'RU', 'Russia', '7'),
(182, 'RW', 'Rwanda', '250'),
(183, 'SH', 'Saint Helena, Ascension and Tristan Da Cunha', '290'),
(184, 'KN', 'Saint Kitts and Nevis', '1869'),
(185, 'LC', 'Saint Lucia', '1758'),
(186, 'PM', 'Saint Pierre and Miquelon', '508'),
(187, 'VC', 'Saint Vincent and the Grenadines', '1784'),
(188, 'WS', 'Samoa', '685'),
(189, 'SM', 'San Marino', '378'),
(190, 'ST', 'Sao Tome and Principe', '239'),
(191, 'SA', 'Saudi Arabia', '966'),
(192, 'SN', 'Senegal', '221'),
(193, 'RS', 'Serbia', '381'),
(194, 'SC', 'Seychelles', '248'),
(195, 'SL', 'Sierra Leone', '232'),
(196, 'SG', 'Singapore', '65'),
(197, 'SK', 'Slovakia', '421'),
(198, 'SI', 'Slovenia', '386'),
(199, 'XG', 'Smaller Territories of the UK', ''),
(200, 'SB', 'Solomon Islands', '677'),
(201, 'SO', 'Somalia', '252'),
(202, 'ZA', 'South Africa', '27'),
(203, 'GS', 'South Georgia and the South Sandwich Islands', '500'),
(204, 'SS', 'South Sudan', '211'),
(205, 'ES', 'Spain', '34'),
(206, 'LK', 'Sri Lanka', '94'),
(207, 'SD', 'Sudan', '249'),
(208, 'SR', 'Suriname', '597'),
(209, 'SJ', 'Svalbard and Jan Mayen', '47'),
(210, 'SZ', 'Swaziland', '268'),
(211, 'SE', 'Sweden', '46'),
(212, 'CH', 'Switzerland', '41'),
(213, 'SY', 'Syrian Arab Republic', '963'),
(214, 'TW', 'Taiwan, Province of China', '886'),
(215, 'TJ', 'Tajikistan', '992'),
(216, 'TZ', 'Tanzania, United Republic of', '255'),
(217, 'TH', 'Thailand', '66'),
(218, 'TG', 'Togo', '228'),
(219, 'TK', 'Tokelau', '690'),
(220, 'TO', 'Tonga', '676'),
(221, 'TT', 'Trinidad and Tobago', '1868'),
(222, 'TN', 'Tunisia', '216'),
(223, 'TR', 'Turkey', '90'),
(224, 'TM', 'Turkmenistan', '993'),
(225, 'TC', 'Turks and Caicos Islands', '1649'),
(226, 'TV', 'Tuvalu', '688'),
(227, 'UG', 'Uganda', '256'),
(228, 'UA', 'Ukraine', '380'),
(229, 'AE', 'United Arab Emirates', '971'),
(230, 'GB', 'United Kingdom', '44'),
(231, 'US', 'United States', '1'),
(232, 'UM', 'United States Minor Outlying Islands', '1'),
(233, 'UY', 'Uruguay', '598'),
(234, 'UZ', 'Uzbekistan', '998'),
(235, 'VU', 'Vanuatu', '678'),
(236, 'VA', 'Holy See (Vatican City State)', '379'),
(237, 'VE', 'Venezuela, Bolivarian Republic of', '58'),
(238, 'VN', 'Viet Nam', '84'),
(239, 'VG', 'Virgin Islands, British', '1284'),
(240, 'VI', 'Virgin Islands, U.S.', '1340'),
(241, 'WF', 'Wallis and Futuna', '681'),
(242, 'EH', 'Western Sahara', '212'),
(243, 'YE', 'Yemen', '967'),
(244, 'YU', 'Yugoslavia', '38'),
(245, 'ZM', 'Zambia', '260'),
(246, 'ZW', 'Zimbabwe', '263');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_subject` text COLLATE utf8mb4_unicode_ci,
  `email_body` longtext COLLATE utf8mb4_unicode_ci,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '1 = active , 0 = in_active',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `email_subject`, `email_body`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'test', 'test', '<p>test</p>', '1', 1, NULL, '2019-03-19 02:02:10', '2019-03-19 02:04:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `routes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_ar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `menu`, `parent_id`, `routes`, `icon`, `menu_ar`, `created_at`, `updated_at`) VALUES
(1, 'Home', NULL, 'home', 'home', 'إلي النهاية', NULL, NULL),
(2, 'user', NULL, 'users', 'supervisor_account', 'المستعمل', NULL, NULL),
(3, 'user role', NULL, 'roles', 'supervisor_account', 'دور المستخدم', NULL, NULL),
(4, 'tax', NULL, 'tax', 'attach_money', 'ضريبة', NULL, NULL),
(5, 'category', NULL, 'category', 'view_module', 'الفئة', NULL, NULL),
(6, 'Product Management', NULL, NULL, 'widgets', 'ادارة المنتج', NULL, NULL),
(7, 'Product Attributes', 6, 'attributes', '', 'سمات المنتج', NULL, NULL),
(8, 'Products', 6, 'products', NULL, 'منتجات', NULL, NULL),
(9, 'Offers', 6, 'offers', NULL, 'عروض', NULL, NULL),
(10, 'Orders Management', NULL, 'orders', 'widgets', 'إدارة الطلبات', NULL, NULL),
(11, 'Orders', 10, 'orders', NULL, 'أوامر', NULL, NULL),
(12, 'Email', NULL, '#', 'widgets', 'البريد الإلكتروني', NULL, NULL),
(13, 'Email Template', 12, 'email_template', NULL, 'قالب البريد الإلكتروني', NULL, NULL),
(14, 'Sms', NULL, '#', 'widgets', 'رسالة قصيرة', NULL, NULL),
(15, 'Sms Template', 14, 'sms_template', NULL, 'قالب الرسائل القصيرة', NULL, NULL),
(16, 'Slider', NULL, 'slider', 'settings_overscan', 'المنزلق', NULL, NULL),
(17, 'Banners', NULL, 'banners', 'aspect_ratio', 'راية', NULL, NULL),
(18, 'Reports', NULL, '#', 'assessment', 'تقارير', NULL, NULL),
(19, 'Sales Report', 18, 'total_amount_report', 'receipt', 'تقرير المبيعات', NULL, NULL),
(20, 'Transaction Report', 18, 'total_transaction_report', 'receipt', 'تقرير المعاملات', NULL, NULL),
(21, 'Logout', NULL, 'logout', 'input', 'الخروج', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(24, '2014_10_12_000000_create_users_table', 1),
(25, '2014_10_12_100000_create_password_resets_table', 1),
(26, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(27, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(28, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(29, '2016_06_01_000004_create_oauth_clients_table', 1),
(30, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(31, '2019_02_08_113126_create_roles_table', 1),
(32, '2019_02_11_060309_create_taxes_table', 1),
(33, '2019_02_11_091055_create_categories_table', 1),
(34, '2019_02_15_130258_create_products_table', 1),
(35, '2019_02_19_063732_create_attributes_table', 1),
(36, '2019_02_21_102739_create_child_attributes_table', 1),
(37, '2019_02_22_095801_create_child_products_table', 1),
(38, '2019_02_26_115650_create_carts_table', 1),
(39, '2019_02_26_121617_create_orders_table', 1),
(40, '2019_02_26_131919_create_order_details_table', 1),
(41, '2019_03_01_102640_create_offers_table', 1),
(42, '2019_03_04_071500_create_email_templates_table', 1),
(43, '2019_03_04_101305_create_product_specifications_table', 1),
(44, '2019_03_04_125900_create_shipping_addresses_table', 1),
(45, '2019_03_06_051000_create_s_m_s_templates_table', 1),
(46, '2019_03_12_052929_create_menus_table', 1),
(47, '2019_03_23_061043_add_fields_to_products_table', 2),
(48, '2019_03_29_063553_add_id_to_password_resets_table', 3),
(49, '2019_03_29_063754_add_timestamps_to_password_resets_table', 4),
(50, '2019_04_05_054053_create_cache_table', 5),
(53, '2019_04_05_091946_create_sliders_table', 6),
(54, '2019_04_10_101045_create_banners_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('06ca1f8627f3cd3aa5b5937c2ef8c325d883a91c293af8263ab27398e3f659ca3ae8d1cc14a43f1d', 7, 1, 'Ecommerce', '[]', 0, '2019-04-07 23:48:59', '2019-04-07 23:48:59', '2020-04-08 05:18:59'),
('0753f046dd9ba2b8d2f2df6dfff9e34379a3f9e3985e9e7e70b10a15f934130d135f46acd2bf36c9', 3, 1, 'Ecommerce', '[]', 0, '2019-04-01 05:48:17', '2019-04-01 05:48:17', '2020-04-01 11:18:17'),
('099413601460a12ccc1e2681df47485798b0ffcf92a62e7477b86a770c78a8fdb8dd0deb4105d01d', 3, 1, 'Ecommerce', '[]', 0, '2019-04-01 05:21:35', '2019-04-01 05:21:35', '2020-04-01 10:51:35'),
('0d9c31e3d7877681d195e4faa67a758564a3e9596eb0990d9001a4a3e031a44d26dd4bea1ba8369b', 3, 1, 'Ecommerce', '[]', 0, '2019-03-14 05:13:46', '2019-03-14 05:13:46', '2020-03-14 10:43:46'),
('12a799589eceb2254eace61455d74431aa51d784fc22cdb164046e82d58dc2cd7a895ce8e996dab7', 3, 1, 'Ecommerce', '[]', 0, '2019-03-25 02:40:47', '2019-03-25 02:40:47', '2020-03-25 08:10:47'),
('18a32010875c27519f1be7b719d945deb9a1466c9cd69234a2bfbfc8b3dd49ec8d7caa867bf334aa', 3, 1, 'Ecommerce', '[]', 0, '2019-04-04 00:37:20', '2019-04-04 00:37:20', '2020-04-04 06:07:20'),
('19c16ddcfbdd04746db10eaa1586844bf6083f34298e791d1f0a615cee048d7e8a442d0588c11689', 3, 1, 'Ecommerce', '[]', 0, '2019-03-29 07:34:43', '2019-03-29 07:34:43', '2020-03-29 13:04:43'),
('19cdf8319e76912777e3766aa2e9af4ee2caa7d09ef7db85555ddd36874443798bc9e733679ad530', 3, 1, 'Ecommerce', '[]', 0, '2019-03-14 05:47:31', '2019-03-14 05:47:31', '2020-03-14 11:17:31'),
('231f3417faefe7050b60a6d905e8036c2e64262a2d9e7a8b43ecc4306c4795e1733ddd85e129b298', 3, 1, 'Ecommerce', '[]', 0, '2019-03-22 07:13:42', '2019-03-22 07:13:42', '2020-03-22 12:43:42'),
('24136d23362d9d616b640a0c10a7b1ec87a28936e80a7ae40b1047b010bf9b233dab0bde9780a559', 3, 1, 'Ecommerce', '[]', 0, '2019-03-18 06:53:57', '2019-03-18 06:53:57', '2020-03-18 12:23:57'),
('252af59429fe390a168920fa96fd5fe43d9eb00ee02bca4e5e6f1f1e65bebdd0c683da0500eb1319', 5, 1, 'Ecommerce', '[]', 0, '2019-03-29 07:25:54', '2019-03-29 07:25:54', '2020-03-29 12:55:54'),
('280a1b9ad896724dd1af938c27f04abb1f555036f7f9b7577fc92cefbc5f91dc0762c51191feedac', 3, 1, 'Ecommerce', '[]', 0, '2019-03-27 00:51:00', '2019-03-27 00:51:00', '2020-03-27 06:21:00'),
('2a4e1ecb44f2f451c30a6e7ba51df1dc3f92a10fd17e8cbbf55c9ae1ee27ab7d317b6ac58cad751e', 3, 1, 'Ecommerce', '[]', 0, '2019-03-27 09:01:03', '2019-03-27 09:01:03', '2020-03-27 14:31:03'),
('2a50b7c7b184e78c3db1458fa304695a7d937a47c02db4b4d0e6ee1347e4f9083038719700a03f9e', 3, 1, 'Ecommerce', '[]', 0, '2019-03-27 08:58:41', '2019-03-27 08:58:41', '2020-03-27 14:28:41'),
('2fed431e0df81a76fd315b42274c54ed25931da487e263b0737b0404aef93f5118d0cd5ebf495563', 3, 1, 'Ecommerce', '[]', 0, '2019-03-29 07:21:49', '2019-03-29 07:21:49', '2020-03-29 12:51:49'),
('390a4c7221a1caf9c57565845d77c264212b7885723860d7ff278132fc119b20d6fffb0119276973', 3, 1, 'Ecommerce', '[]', 0, '2019-04-03 05:29:46', '2019-04-03 05:29:46', '2020-04-03 10:59:46'),
('3b244824d12c84b1f7f1847dfd5edb676cf1246279bd42040c3354ae93d0ac386939803d49f43339', 3, 1, 'Ecommerce', '[]', 0, '2019-03-14 05:45:08', '2019-03-14 05:45:08', '2020-03-14 11:15:08'),
('40c368d742c67649923f870f7a0e14fe0fb6cfd53b90d7a7facaed676fe845b3ecb3722e30270d2f', 3, 1, 'Ecommerce', '[]', 0, '2019-03-14 06:28:42', '2019-03-14 06:28:42', '2020-03-14 11:58:42'),
('42a7d26dea9a045b7007957113abaa6561e8749abeed127117bfbf8a6017a9094da9bd4790156e3f', 3, 1, 'Ecommerce', '[]', 0, '2019-03-29 05:54:58', '2019-03-29 05:54:58', '2020-03-29 11:24:58'),
('42bfe60227fc975f2978a64e432762d4d832fb283477151a54806a38b3d8e69151b04998354e645b', 3, 1, 'Ecommerce', '[]', 0, '2019-03-29 08:06:14', '2019-03-29 08:06:14', '2020-03-29 13:36:14'),
('42eea3591e362e03e9d5517a5f3c475a45bf25a4dabfbd0d0f2290d05b3ed84d9165bf2e807aec5c', 3, 1, 'Ecommerce', '[]', 0, '2019-03-27 08:24:20', '2019-03-27 08:24:20', '2020-03-27 13:54:20'),
('468041e05b2101bfce2cd7083f14fbe101803f036d3ba6fb00e82f33287f3d93f699f02deecbfc44', 3, 1, 'Ecommerce', '[]', 0, '2019-03-28 01:51:23', '2019-03-28 01:51:23', '2020-03-28 07:21:23'),
('4b8e89ef6ed43fa989e71266efa056a70910a6ded2d070b7970b5bf4edf2fcf71b0710582192f473', 3, 1, 'Ecommerce', '[]', 0, '2019-03-14 05:11:49', '2019-03-14 05:11:49', '2020-03-14 10:41:49'),
('4e4e55d9e623598a1bbb555ab404b8cf4e619819eab322daff51ff15e184c8d30d4c8832514232f4', 3, 1, 'Ecommerce', '[]', 0, '2019-03-27 23:21:03', '2019-03-27 23:21:03', '2020-03-28 04:51:03'),
('525ea78bbc5deb4766e8b182139d8a32da74d6f37b5426e12e34ec5359beb6e52dcb7b87477627b5', 3, 1, 'Ecommerce', '[]', 0, '2019-03-29 07:32:24', '2019-03-29 07:32:24', '2020-03-29 13:02:24'),
('55523f306e1b5d287e244ca0e3e330b496e29606e8eb37bfec9b22139c55f71c420f8811580dfb7b', 3, 1, 'Ecommerce', '[]', 0, '2019-03-29 04:26:54', '2019-03-29 04:26:54', '2020-03-29 09:56:54'),
('585de89947ba65693b4b6f4075159c1f041b59e0e3be31325f5ece3dadc4e2334c474fb03e739ac4', 3, 1, 'Ecommerce', '[]', 0, '2019-03-28 07:05:02', '2019-03-28 07:05:02', '2020-03-28 12:35:02'),
('58c5de04facc5559902ad4468c0b0e1d4fa160906404d0dd7ca0e1dcaa2634259bc09fb427104ae3', 3, 1, 'Ecommerce', '[]', 0, '2019-04-01 05:28:09', '2019-04-01 05:28:09', '2020-04-01 10:58:09'),
('5b910feb256a408b94ec294c95129336e0ec911f8101a44ff2565deecf070c61cd256c5e43ed6c8d', 3, 1, 'Ecommerce', '[]', 0, '2019-04-03 05:35:53', '2019-04-03 05:35:53', '2020-04-03 11:05:53'),
('61af76d07426b9fe3fb4299c35493de813eb6693e9e71079c2b85ff9cc3869ae5e41d82c2ffa2bad', 3, 1, 'Ecommerce', '[]', 0, '2019-03-15 06:57:14', '2019-03-15 06:57:14', '2020-03-15 12:27:14'),
('63c6d4ec6b845bc0ceada0215c0cd97afaf7c11d7e96a7f0c464d24fa8e4ab32fad9f1004afd1b54', 3, 1, 'Ecommerce', '[]', 0, '2019-03-22 06:17:08', '2019-03-22 06:17:08', '2020-03-22 11:47:08'),
('69678937ba414df019ac9955ad35694c16255ea7ca3cf0dba286753a0cea47170d1094fa489ddc22', 3, 1, 'Ecommerce', '[]', 0, '2019-03-25 03:06:54', '2019-03-25 03:06:54', '2020-03-25 08:36:54'),
('69c00b5fdf572657fbd889d22ce111a811330e72da982e564895d027818fbfe5c0bcb3ebbf413302', 3, 1, 'Ecommerce', '[]', 0, '2019-03-29 07:31:51', '2019-03-29 07:31:51', '2020-03-29 13:01:51'),
('6caba217625605dddee95ff33f91105f91587069fb10d384192b11afa0732e372d70f4ce427a97d8', 3, 1, 'Ecommerce', '[]', 0, '2019-03-29 07:01:34', '2019-03-29 07:01:34', '2020-03-29 12:31:34'),
('77e92ab02f27196f30d22fc7a1dbfc2e695260af2f4cf531d7f6f4a7430bd460bdd1171b8b4327b3', 3, 1, 'Ecommerce', '[]', 0, '2019-03-14 05:10:03', '2019-03-14 05:10:03', '2020-03-14 10:40:03'),
('78cfcad8e80643191feefbbd1219ff4a06afb699287d2d4964f71fb89d6a7ac25c1ecf3bddb1d79d', 3, 1, 'Ecommerce', '[]', 0, '2019-04-05 00:56:40', '2019-04-05 00:56:40', '2020-04-05 06:26:40'),
('799a88cc7600091a76255726b0e783c48b717967dc796c05309d4bfe730145e17ffb2270055063a3', 3, 1, 'Ecommerce', '[]', 0, '2019-03-29 04:24:44', '2019-03-29 04:24:44', '2020-03-29 09:54:44'),
('7b2eda86d3acd91465dca6e9b89beb6542f3af76a84ffaad61ec4fbfe88280c56f6cd08071deb29b', 3, 1, 'Ecommerce', '[]', 0, '2019-03-14 06:01:38', '2019-03-14 06:01:38', '2020-03-14 11:31:38'),
('839af61f76b64f6875a08073456de7a81640bf48507bf2e35136b6614a13abeffabb11c0d563dabc', 3, 1, 'Ecommerce', '[]', 0, '2019-03-29 03:49:49', '2019-03-29 03:49:49', '2020-03-29 09:19:49'),
('841cfd55be481e9a920137eb3ba3a072d27533235af0aba93f2e1de6df20d1b6f92f80aeffb58097', 3, 1, 'Ecommerce', '[]', 0, '2019-03-29 07:29:15', '2019-03-29 07:29:15', '2020-03-29 12:59:15'),
('9261a48cd1ba59ab99d5ecb6ec18de5f280798c93579731750e5a7d67e5ae8d37c95eafd12e80995', 3, 1, 'Ecommerce', '[]', 0, '2019-03-28 06:50:17', '2019-03-28 06:50:17', '2020-03-28 12:20:17'),
('92b572747824bbe353619f22a5aedd1534e46648d6018d2a3bf4f45b39fd36b5bb19f8d27ed25f50', 3, 1, 'Ecommerce', '[]', 0, '2019-03-26 03:49:15', '2019-03-26 03:49:15', '2020-03-26 09:19:15'),
('931e7f40664a9840dcc3390c113ba654f31061410927585b4eb06197638c1b3865594f7bef9203c3', 6, 1, 'Ecommerce', '[]', 0, '2019-04-02 01:57:55', '2019-04-02 01:57:55', '2020-04-02 07:27:55'),
('9cac71080ae3486fbd6b9a835e5709468423f8bd4e56480d9d624ea01286582b594bec318e337ab0', 3, 1, 'Ecommerce', '[]', 0, '2019-03-29 07:57:51', '2019-03-29 07:57:51', '2020-03-29 13:27:51'),
('a202a2fd07c9de782ca1b55ac5993795b5c326fae247a7aa966e10402a90b923a89f8d0504d1d674', 3, 1, 'Ecommerce', '[]', 0, '2019-03-27 08:58:07', '2019-03-27 08:58:07', '2020-03-27 14:28:07'),
('a2c3b6cc4f29a29012e5929f6447ead1d9bbcb291d3d3e434789dfce23f5475ff867db108413f4be', 3, 1, 'Ecommerce', '[]', 0, '2019-04-09 23:27:11', '2019-04-09 23:27:11', '2020-04-10 04:57:11'),
('a4a444e2123890639a1f5923166a088e2f139f9920e1bc4c3ab42a865c3718ca1c98a9c2ceea24a8', 3, 1, 'Ecommerce', '[]', 0, '2019-04-02 01:22:55', '2019-04-02 01:22:55', '2020-04-02 06:52:55'),
('adcd64eda71e46853665c6b7efb77cc422e2dea2fd3d68226449a6b8bc397e2ac5d5554077f3d188', 3, 1, 'Ecommerce', '[]', 0, '2019-03-29 05:03:04', '2019-03-29 05:03:04', '2020-03-29 10:33:04'),
('aeac7fdb4bed438fc272559a3e51b1676e19bfa172f9d4856d077c5a3d5cbd53e2fe61ac85821e92', 3, 1, 'Ecommerce', '[]', 0, '2019-03-29 06:00:25', '2019-03-29 06:00:25', '2020-03-29 11:30:25'),
('b077791a81400855d7b6b72341a7a2c4b56cab3eb45fd35f7cac1b0a52fa1f7c57a0e540e2b1a894', 4, 1, 'Ecommerce', '[]', 0, '2019-03-29 07:23:15', '2019-03-29 07:23:15', '2020-03-29 12:53:15'),
('b74e48eea3177c7899fb020e9c8a33e83fcdb54e5d94fb0a98f7899c320048b8e81dedd4bfa9209e', 3, 1, 'Ecommerce', '[]', 0, '2019-03-28 09:22:42', '2019-03-28 09:22:42', '2020-03-28 14:52:42'),
('b8a3eea822c6616592e38203f99f76018a21f2d0cee7b39914f9ec626636aff45f7efff79af033af', 3, 1, 'Ecommerce', '[]', 0, '2019-03-28 23:17:19', '2019-03-28 23:17:19', '2020-03-29 04:47:19'),
('badf0f8651605a673117012c77100d81da2552911a0c6bb32405d5c1c4a196ef7bd63d88654ddb6f', 3, 1, 'Ecommerce', '[]', 0, '2019-04-02 07:38:31', '2019-04-02 07:38:31', '2020-04-02 13:08:31'),
('c2e3dfa3cc90dc855cab7039c87dc5312e0c8c51f38451c17a22a7c8c23c93f59d4e036c1dd0f542', 3, 1, 'Ecommerce', '[]', 0, '2019-03-31 23:10:14', '2019-03-31 23:10:14', '2020-04-01 04:40:14'),
('c324a2a58b6e48a06afb535cdc6de3291eafb7b8087b739941a4714f3433919dbd38ca3df16da0b9', 3, 1, 'Ecommerce', '[]', 0, '2019-03-29 07:45:06', '2019-03-29 07:45:06', '2020-03-29 13:15:06'),
('ca40df4421aecec26b9eaa31923701e8fe7f8ed7b61e5c8e767c04c2a2d7abcda13dac5f6e63c6e1', 3, 1, 'Ecommerce', '[]', 0, '2019-04-08 01:44:06', '2019-04-08 01:44:06', '2020-04-08 07:14:06'),
('cb92e8567056d2df98e852c39f7d66c76075ef197203563d228c5b71be84382643abda93a2ce8a3f', 3, 1, 'Ecommerce', '[]', 0, '2019-03-28 09:25:43', '2019-03-28 09:25:43', '2020-03-28 14:55:43'),
('cbfcdaf10dbc0c2b8263bbc8a74f715c936bb12b57f6f9b48e32f7819989dc4c905e10489c7498bb', 3, 1, 'Ecommerce', '[]', 0, '2019-04-09 00:16:22', '2019-04-09 00:16:22', '2020-04-09 05:46:22'),
('d4c9d5fc6efd8cb8c9fe9ded581a258f82ae6583eee72c202f87940b1efe42b0185a7475a9e890fd', 3, 1, 'Ecommerce', '[]', 0, '2019-03-26 07:11:35', '2019-03-26 07:11:35', '2020-03-26 12:41:35'),
('d6c7b8de41e9100fb09853f65f45e6265644d90a1153604450674056aaf640eeb12fcdbee322c9c0', 3, 1, 'Ecommerce', '[]', 0, '2019-03-28 06:04:43', '2019-03-28 06:04:43', '2020-03-28 11:34:43'),
('ddabe6bcbd4d6c837f12727b9c22eaec443037a21282fc5450d157aedae4344c97dbcae59cfd7bc4', 2, 1, 'Ecommerce', '[]', 0, '2019-04-04 00:37:04', '2019-04-04 00:37:04', '2020-04-04 06:07:04'),
('e50779aad4fb1ef35d7815895074419e29a2284d745aa5f7aa88df0875e272e735c12854adff5e38', 3, 1, 'Ecommerce', '[]', 0, '2019-03-28 01:31:39', '2019-03-28 01:31:39', '2020-03-28 07:01:39'),
('ebd9bc4fdeedc8d4051c437069cc64946b47be6b46d11ed8bab4dd1b0dc142ba4438da1b4c0aba19', 3, 1, 'Ecommerce', '[]', 0, '2019-04-02 02:04:20', '2019-04-02 02:04:20', '2020-04-02 07:34:20'),
('ecccf5e0cfc7864628ce00839c3ef4ee5a2b5acd765c586697485d52f43fae120b7c4a8dd0c60950', 3, 1, 'Ecommerce', '[]', 0, '2019-03-31 23:11:35', '2019-03-31 23:11:35', '2020-04-01 04:41:35'),
('f41a2b3613ec78a51aa94a0f5430cbc15cabbe49d118ece95b48eede7d661c81aa2fd83218e25b73', 3, 1, 'Ecommerce', '[]', 0, '2019-03-29 08:05:58', '2019-03-29 08:05:58', '2020-03-29 13:35:58'),
('f75bf42b4fd89b86a2528bcae1784b7b83d0d31458cee8c4733b3f51dc6f1615ce0e39239af6b289', 3, 1, 'Ecommerce', '[]', 0, '2019-03-14 05:46:20', '2019-03-14 05:46:20', '2020-03-14 11:16:20'),
('f8068b6fb48ee02ca3d3244e697f19c585f6f05dc2e8b6c1d20699913877b02add2bf657fe960829', 3, 1, 'Ecommerce', '[]', 0, '2019-03-31 23:42:33', '2019-03-31 23:42:33', '2020-04-01 05:12:33'),
('fc9255aa1aa3366f6a0480bfd686972588ffe733664601c0dae76088f52577ba7e7d0a4cd08d8534', 3, 1, 'Ecommerce', '[]', 0, '2019-03-29 07:34:14', '2019-03-29 07:34:14', '2020-03-29 13:04:14'),
('fcafa761e05e7db049d6790b4a23bc019fee57d49401e817e40d726a4cd31b87dedc5138a3138308', 3, 1, 'Ecommerce', '[]', 0, '2019-04-11 05:05:33', '2019-04-11 05:05:33', '2020-04-11 10:35:33');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'Wd7DsOP94N5aGrCktQnetwGb97hH2QMUQRDOXp3N', 'http://localhost', 1, 0, 0, '2019-03-14 05:09:00', '2019-03-14 05:09:00'),
(2, NULL, 'Laravel Password Grant Client', 'IOVetExDMDggYYv4d7r56aAJK65yuVl8nwoHrkHJ', 'http://localhost', 0, 1, 0, '2019-03-14 05:09:00', '2019-03-14 05:09:00');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-03-14 05:09:00', '2019-03-14 05:09:00');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` int(10) UNSIGNED NOT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` enum('percentage','flat') COLLATE utf8mb4_unicode_ci DEFAULT 'percentage',
  `discount_amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `minimum_order_amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `minimum_offer_amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '0 = Inactive and 1 = Active',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `coupon_code`, `discount`, `discount_amount`, `minimum_order_amount`, `minimum_offer_amount`, `start_date`, `end_date`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'NEW50', 'percentage', '10', '100', '100', '2019-03-01', '2019-03-31', '1', 1, NULL, '2019-03-14 03:28:02', '2019-04-05 01:51:18', NULL),
(2, 'NEW100', 'flat', '100', '200', '100', '2019-03-01', '2019-03-31', '1', 1, NULL, '2019-03-14 03:28:25', '2019-03-14 03:28:25', NULL),
(3, 'Test', NULL, NULL, NULL, NULL, NULL, NULL, '1', 1, NULL, '2019-03-14 03:28:34', '2019-03-14 03:28:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address_id` int(10) UNSIGNED DEFAULT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ordered','in_progress','shipped','completed','cancelled') COLLATE utf8mb4_unicode_ci DEFAULT 'ordered',
  `payment_method` int(11) DEFAULT '1' COMMENT '1 = Cash, 2 = Card',
  `ordered_at` datetime DEFAULT NULL,
  `in_progress_at` datetime DEFAULT NULL,
  `shipped_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `cancel_reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancelled_by` int(11) DEFAULT NULL,
  `cancelled_at` datetime DEFAULT NULL,
  `sub_total` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_collected` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `transaction_id`, `shipping_address_id`, `order_number`, `status`, `payment_method`, `ordered_at`, `in_progress_at`, `shipped_at`, `completed_at`, `cancel_reason`, `cancelled_by`, `cancelled_at`, `sub_total`, `discount`, `offer`, `tax_collected`, `grand_total`, `ip`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, '', 1, 'c32eebe4c523703f0c19b0761dae3f7a', 'in_progress', 1, '2019-04-05 07:30:00', '2019-04-05 07:30:00', '2019-03-27 09:47:00', '2019-03-23 08:17:00', NULL, NULL, '2019-03-23 08:17:00', '138', '0', NULL, '0', '138', '127.0.0.1', NULL, NULL, '2019-03-14 06:02:51', '2019-04-05 02:00:30', NULL),
(2, 3, '', 1, '4bebf651d85e167ffc17487da8b43ff2', 'ordered', 1, '2019-03-15 12:27:00', NULL, NULL, NULL, NULL, NULL, NULL, '17500', '0', NULL, '0', '17500', '127.0.0.1', NULL, NULL, '2019-03-15 06:57:38', '2019-03-15 06:57:38', NULL),
(3, 3, '', 1, '9ae0b80035d222bfc395cef83390ca48', 'ordered', 1, '2019-03-15 13:22:00', NULL, NULL, NULL, NULL, NULL, NULL, '960', '0', NULL, '0', '960', '127.0.0.1', NULL, NULL, '2019-03-15 07:52:18', '2019-03-15 07:52:18', NULL),
(4, 3, '', 1, '455618a2a149e7d0fdefc132d899fc59', 'ordered', 1, '2019-03-18 12:24:00', NULL, NULL, NULL, NULL, NULL, NULL, '900', '100', 'NEW100', '0', '800', '127.0.0.1', NULL, NULL, '2019-03-18 06:54:06', '2019-03-18 06:54:06', NULL),
(5, 3, '', 1, '9e1ff62192dc0c278d0cf488e77e46dd', 'ordered', 1, '2019-03-18 13:14:00', NULL, NULL, NULL, NULL, NULL, NULL, '700', '70', 'NEW50', '0', '630', '127.0.0.1', NULL, NULL, '2019-03-18 07:44:59', '2019-03-18 07:44:59', NULL),
(6, 3, '', 1, '47ca5c5db95761a64e49d3cd1acb9dd3', 'ordered', 1, '2019-03-18 13:27:00', NULL, NULL, NULL, NULL, NULL, NULL, '156', '15.6', 'NEW50', '0', '140.4', '127.0.0.1', NULL, NULL, '2019-03-18 07:57:11', '2019-03-18 07:57:11', NULL),
(7, 3, '', 1, '7e474271555ed2b0f53a360d47b11206', 'ordered', 1, '2019-03-18 13:47:00', NULL, NULL, NULL, NULL, NULL, NULL, '10995', '100', 'NEW100', '0', '10895', '127.0.0.1', NULL, NULL, '2019-03-18 08:17:31', '2019-03-18 08:17:31', NULL),
(8, 3, '', 1, '99bcfbdedeeabbb9fc8e1058b0f84b31', 'ordered', 1, '2019-03-18 13:54:00', NULL, NULL, NULL, NULL, NULL, NULL, '2500', '100', 'NEW100', '0', '2400', '127.0.0.1', NULL, NULL, '2019-03-18 08:24:33', '2019-03-18 08:24:33', NULL),
(9, 3, '', 1, '1bf80b6c141aba00dde08f085074a93b', 'ordered', 1, '2019-03-22 11:47:00', NULL, NULL, NULL, NULL, NULL, NULL, '3500', '0', NULL, '0', '3500', '127.0.0.1', NULL, NULL, '2019-03-22 06:17:32', '2019-03-22 06:17:32', NULL),
(10, 3, '', 1, 'daf87e0213ca9a85257c44539f163317', 'ordered', 1, '2019-03-22 12:43:00', NULL, NULL, NULL, NULL, NULL, NULL, '320', '100', 'NEW100', '0', '220', '127.0.0.1', NULL, NULL, '2019-03-22 07:13:51', '2019-03-22 07:13:51', NULL),
(11, 3, '', 1, 'e0dd4bd9146b84b88a24293bfd2539cb', 'ordered', 2, '2019-03-22 12:44:00', NULL, NULL, NULL, NULL, NULL, NULL, '3000', '100', 'NEW100', '0', '2900', '127.0.0.1', NULL, NULL, '2019-03-22 07:14:23', '2019-03-22 07:14:23', NULL),
(12, 3, '', 1, 'e08b86dd4da5cbbed3b9a1f3b68a3885', 'ordered', 2, '2019-03-22 12:48:00', NULL, NULL, NULL, NULL, NULL, NULL, '3800', '0', NULL, '0', '3800', '127.0.0.1', NULL, NULL, '2019-03-22 07:18:40', '2019-03-22 07:18:40', NULL),
(13, 3, '', 1, 'cd7efda1782f8d076e0506b110989b46', 'ordered', 1, '2019-03-25 08:38:00', NULL, NULL, NULL, NULL, NULL, NULL, '90', '0', NULL, '0', '90', '127.0.0.1', NULL, NULL, '2019-03-25 03:08:22', '2019-03-25 03:08:22', NULL),
(14, 3, '', 5, '010cb1527f4abc2eca5ac24999f418ae', 'ordered', 1, '2019-03-26 10:19:00', NULL, NULL, NULL, NULL, NULL, NULL, '90', '0', 'NEW100', '0', '90', '127.0.0.1', NULL, NULL, '2019-03-26 04:49:15', '2019-03-26 04:49:15', NULL),
(15, 3, '', 5, '8513cb19a94d294c9fdb74c1a71aaf03', 'ordered', 1, '2019-03-26 10:49:00', NULL, NULL, NULL, NULL, NULL, NULL, '90', '0', NULL, '0', '90', '127.0.0.1', NULL, NULL, '2019-03-26 05:19:49', '2019-03-26 05:19:49', NULL),
(16, 3, '', 5, '541f3f1227ef46c7937a3248c06dc27a', 'ordered', 1, '2019-03-26 12:40:00', NULL, NULL, NULL, NULL, NULL, NULL, '726', '100', 'NEW100', '0', '626', '127.0.0.1', NULL, NULL, '2019-03-26 07:10:41', '2019-03-26 07:10:41', NULL),
(17, 3, '', 5, 'e7a8ddbeeed1cbb0a46941e1de079215', 'ordered', 1, '2019-03-26 12:41:00', NULL, NULL, NULL, NULL, NULL, NULL, '5142', '100', 'NEW100', '0', '5042', '127.0.0.1', NULL, NULL, '2019-03-26 07:11:43', '2019-03-26 07:11:43', NULL),
(18, 3, '', 6, '96b5bd36535de103268f3c561bd0f3de', 'ordered', 1, '2019-03-27 07:06:00', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', 'NEW50', '0', '0', '127.0.0.1', NULL, NULL, '2019-03-27 01:36:51', '2019-03-27 01:36:51', NULL),
(19, 3, '', 5, '310f1fa2d12b59971ac1b6c32aa91065', 'ordered', 1, '2019-03-27 10:54:00', NULL, NULL, NULL, NULL, NULL, NULL, '65', '0', NULL, '0', '65', '127.0.0.1', NULL, NULL, '2019-03-27 05:24:52', '2019-03-27 05:24:52', NULL),
(20, 3, '', 5, 'b65d939cf913b7a25c16bdcb02bc2826', 'ordered', 1, '2019-03-28 05:07:00', NULL, NULL, NULL, NULL, NULL, NULL, '39', '0', NULL, '0', '39', '127.0.0.1', NULL, NULL, '2019-03-27 23:37:33', '2019-03-27 23:37:33', NULL),
(21, 3, '', 6, '8e3db849ee6ce5b9c17049988bf7d464', 'ordered', 1, '2019-03-28 05:12:00', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, '0', '0', '127.0.0.1', NULL, NULL, '2019-03-27 23:42:35', '2019-03-27 23:42:35', NULL),
(22, 3, '', 6, '32c54c2ab8920cb00c345f98336c998b', 'ordered', 1, '2019-03-28 05:16:00', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, '0', '0', '127.0.0.1', NULL, NULL, '2019-03-27 23:46:23', '2019-03-27 23:46:23', NULL),
(23, 3, '', 7, '98d4a19797c7bbc79b3662f06972618f', 'ordered', 1, '2019-03-28 05:18:00', NULL, NULL, NULL, NULL, NULL, NULL, '39', '0', NULL, '0', '39', '127.0.0.1', NULL, NULL, '2019-03-27 23:48:14', '2019-03-27 23:48:14', NULL),
(24, 3, '', 5, '605c576ed4eb39c4df03d66762af3e9b', 'ordered', 1, '2019-03-28 05:23:00', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, '0', '0', '127.0.0.1', NULL, NULL, '2019-03-27 23:53:37', '2019-03-27 23:53:37', NULL),
(25, 3, '', 5, '8da21c35ac5a94327e978323a1a56419', 'ordered', 1, '2019-03-28 05:26:00', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, '0', '0', '127.0.0.1', NULL, NULL, '2019-03-27 23:56:07', '2019-03-27 23:56:07', NULL),
(26, 3, '', 5, '7186e836607dc1a6d86c94c8cc519358', 'ordered', 1, '2019-03-28 05:32:00', NULL, NULL, NULL, NULL, NULL, NULL, '90', '0', NULL, '0', '90', '127.0.0.1', NULL, NULL, '2019-03-28 00:02:11', '2019-03-28 00:02:11', NULL),
(27, 3, '', 5, 'f429bc1d16c072200f049ec4b83ade20', 'ordered', 1, '2019-03-28 06:00:00', NULL, NULL, NULL, NULL, NULL, NULL, '39', '0', NULL, '0', '39', '127.0.0.1', NULL, NULL, '2019-03-28 00:30:45', '2019-03-28 00:30:45', NULL),
(28, 3, '', 5, '52fc06fa9bb0423eae125e7d507cac91', 'ordered', 1, '2019-03-28 06:10:00', NULL, NULL, NULL, NULL, NULL, NULL, '90', '0', NULL, '0', '90', '127.0.0.1', NULL, NULL, '2019-03-28 00:40:22', '2019-03-28 00:40:22', NULL),
(29, 3, '', 7, '554c49feffdee187779d1424f2aa8ee0', 'ordered', 1, '2019-03-28 06:23:00', NULL, NULL, NULL, NULL, NULL, NULL, '39', '0', NULL, '0', '39', '127.0.0.1', NULL, NULL, '2019-03-28 00:53:42', '2019-03-28 00:53:42', NULL),
(30, 3, '', 6, '9874fdaefcd3f450a428550a7bc895a1', 'ordered', 1, '2019-03-28 06:24:00', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, '0', '0', '127.0.0.1', NULL, NULL, '2019-03-28 00:54:35', '2019-03-28 00:54:35', NULL),
(31, 3, '', 6, '58b272438860d48114ff79985586b6d4', 'ordered', 1, '2019-03-28 08:15:00', NULL, NULL, NULL, NULL, NULL, NULL, '90', '0', NULL, '0', '90', '127.0.0.1', NULL, NULL, '2019-03-28 02:45:06', '2019-03-28 02:45:06', NULL),
(32, 3, '', 7, '30a2cc79fccd06498cea0e46d3c48c84', 'ordered', 1, '2019-03-28 08:17:00', NULL, NULL, NULL, NULL, NULL, NULL, '90', '0', NULL, '0', '90', '127.0.0.1', NULL, NULL, '2019-03-28 02:47:23', '2019-03-28 02:47:23', NULL),
(33, 3, '', 5, '832ca6a59e1b0e872ebf6c8a5d0c4842', 'ordered', 1, '2019-03-28 08:29:00', NULL, NULL, NULL, NULL, NULL, NULL, '90', '0', NULL, '0', '90', '127.0.0.1', NULL, NULL, '2019-03-28 02:59:05', '2019-03-28 02:59:05', NULL),
(34, 3, '', 5, 'd561d79f96994d813e4e1ca4d91021ab', 'ordered', 1, '2019-03-28 08:34:00', NULL, NULL, NULL, NULL, NULL, NULL, '90', '0', NULL, '0', '90', '127.0.0.1', NULL, NULL, '2019-03-28 03:04:23', '2019-03-28 03:04:23', NULL),
(35, 3, '', 7, '0fa136cf368b849e1d8c95c3861e53c6', 'ordered', 1, '2019-03-28 08:37:00', NULL, NULL, NULL, NULL, NULL, NULL, '1676', '0', NULL, '0', '1676', '127.0.0.1', NULL, NULL, '2019-03-28 03:07:50', '2019-03-28 03:07:50', NULL),
(36, 3, '', 7, '042857248c9a900a9066d218b9d5e047', 'ordered', 1, '2019-03-28 08:40:00', NULL, NULL, NULL, NULL, NULL, NULL, '1714', '0', NULL, '0', '1714', '127.0.0.1', NULL, NULL, '2019-03-28 03:10:20', '2019-03-28 03:10:20', NULL),
(37, 3, '', 5, '5b7f85b1df59bc5cd6a1c2aae60a4f5d', 'ordered', 1, '2019-03-28 08:46:00', NULL, NULL, NULL, NULL, NULL, NULL, '2078', '100', 'NEW100', '0', '1978', '127.0.0.1', NULL, NULL, '2019-03-28 03:16:07', '2019-03-28 03:16:07', NULL),
(38, 3, '', 7, '2fbc1f242582846f4dc58f2ffe959a7b', 'ordered', 1, '2019-03-28 08:47:00', NULL, NULL, NULL, NULL, NULL, NULL, '3428', '100', 'NEW100', '0', '3328', '127.0.0.1', NULL, NULL, '2019-03-28 03:17:57', '2019-03-28 03:17:57', NULL),
(39, 3, '', 7, 'f2846e1d095a1523267b89177b2db16a', 'ordered', 1, '2019-03-28 08:54:00', NULL, NULL, NULL, NULL, NULL, NULL, '4748', '100', 'NEW100', '0', '4648', '127.0.0.1', NULL, NULL, '2019-03-28 03:24:51', '2019-03-28 03:24:51', NULL),
(40, 3, '', 7, 'f603a9e26dfa193ed26c4f5dfb0ee348', 'ordered', 1, '2019-03-28 09:02:00', NULL, NULL, NULL, NULL, NULL, NULL, '129', '0', NULL, '0', '129', '127.0.0.1', NULL, NULL, '2019-03-28 03:32:23', '2019-03-28 03:32:23', NULL),
(41, 3, '', 7, '46828b12549952cc58f9351678b4833d', 'ordered', 1, '2019-03-28 09:04:00', NULL, NULL, NULL, NULL, NULL, NULL, '1629', '100', 'NEW100', '0', '1529', '127.0.0.1', NULL, NULL, '2019-03-28 03:34:37', '2019-03-28 03:34:37', NULL),
(42, 3, '', 5, '5ffb7264a4b2f3e2d4016a50232c5979', 'ordered', 1, '2019-03-28 09:05:00', NULL, NULL, NULL, NULL, NULL, NULL, '129', '0', NULL, '0', '129', '127.0.0.1', NULL, NULL, '2019-03-28 03:35:26', '2019-03-28 03:35:26', NULL),
(43, 3, '', 5, 'c029ff7b98104b932834a9ebafce40c8', 'ordered', 1, '2019-03-28 09:36:00', NULL, NULL, NULL, NULL, NULL, NULL, '90', '0', NULL, '0', '90', '127.0.0.1', NULL, NULL, '2019-03-28 04:06:42', '2019-03-28 04:06:42', NULL),
(44, 3, '', 7, 'd1ac346baed4ce34625398b157b31b74', 'ordered', 1, '2019-03-28 10:01:00', NULL, NULL, NULL, NULL, NULL, NULL, '3137', '100', 'NEW100', '0', '3037', '127.0.0.1', NULL, NULL, '2019-03-28 04:31:51', '2019-03-28 04:31:51', NULL),
(45, 3, '', 7, '6221619ae8d89d0c49ade72c6dc481cc', 'ordered', 1, '2019-03-28 10:18:00', NULL, NULL, NULL, NULL, NULL, NULL, '1624', '100', 'NEW50', '0', '1524', '127.0.0.1', NULL, NULL, '2019-03-28 04:48:01', '2019-03-28 04:48:01', NULL),
(46, 3, '', 5, 'daf5a1024d8baf2819c51309cc46ab5d', 'ordered', 1, '2019-03-28 10:21:00', NULL, NULL, NULL, NULL, NULL, NULL, '90', '0', NULL, '0', '90', '127.0.0.1', NULL, NULL, '2019-03-28 04:51:23', '2019-03-28 04:51:23', NULL),
(47, 3, '', 5, 'ba048f970f40d31d24b392949822896f', 'ordered', 1, '2019-03-28 10:23:00', NULL, NULL, NULL, NULL, NULL, NULL, '90', '0', NULL, '0', '90', '127.0.0.1', NULL, NULL, '2019-03-28 04:53:52', '2019-03-28 04:53:52', NULL),
(48, 3, '', 7, '3fda921d89da7edeff25165e6504d708', 'ordered', 1, '2019-03-28 10:24:00', NULL, NULL, NULL, NULL, NULL, NULL, '180', '0', NULL, '0', '180', '127.0.0.1', NULL, NULL, '2019-03-28 04:54:55', '2019-03-28 04:54:55', NULL),
(49, 3, '', 7, 'c07b883fe2f8b95dc3645e331333b0d3', 'ordered', 1, '2019-03-28 10:29:00', NULL, NULL, NULL, NULL, NULL, NULL, '90', '0', NULL, '0', '90', '127.0.0.1', NULL, NULL, '2019-03-28 04:59:07', '2019-03-28 04:59:07', NULL),
(50, 3, '', 7, '0ec899dfd5708ea4d4e09838ba03de05', 'ordered', 1, '2019-03-28 10:31:00', NULL, NULL, NULL, NULL, NULL, NULL, '90', '0', NULL, '0', '90', '127.0.0.1', NULL, NULL, '2019-03-28 05:01:34', '2019-03-28 05:01:34', NULL),
(51, 3, '', 7, '30e8d6dea1222bcb5e326dd6cbebcf89', 'ordered', 1, '2019-03-28 10:41:00', NULL, NULL, NULL, NULL, NULL, NULL, '90', '0', NULL, '0', '90', '127.0.0.1', NULL, NULL, '2019-03-28 05:11:53', '2019-03-28 05:11:53', NULL),
(52, 3, '', 7, 'acbf1dff5e560de9822997ff26f9d92c', 'ordered', 1, '2019-03-28 10:48:00', NULL, NULL, NULL, NULL, NULL, NULL, '90', '0', NULL, '0', '90', '127.0.0.1', NULL, NULL, '2019-03-28 05:18:40', '2019-03-28 05:18:40', NULL),
(53, 3, '', 5, 'c8e319e56c8e356053e8760b4bb93dfc', 'ordered', 1, '2019-03-28 11:00:00', NULL, NULL, NULL, NULL, NULL, NULL, '180', '18', 'NEW50', '0', '162', '127.0.0.1', NULL, NULL, '2019-03-28 05:30:05', '2019-03-28 05:30:05', NULL),
(54, 3, '', 5, 'f10a9ddde8350eb3156b7dd7dd7296a4', 'ordered', 1, '2019-03-28 11:04:00', NULL, NULL, NULL, NULL, NULL, NULL, '180', '18', 'NEW50', '0', '162', '127.0.0.1', NULL, NULL, '2019-03-28 05:34:50', '2019-03-28 05:34:50', NULL),
(55, 3, '', 7, 'ad4002e7027bf4e42915a3df9562a03e', 'ordered', 1, '2019-03-28 11:34:00', NULL, NULL, NULL, NULL, NULL, NULL, '90', '0', NULL, '0', '90', '127.0.0.1', NULL, NULL, '2019-03-28 06:04:54', '2019-03-28 06:04:54', NULL),
(56, 3, '', 7, '5b337473948cf14561d17b79b1f8b5e7', 'ordered', 1, '2019-03-28 11:36:00', NULL, NULL, NULL, NULL, NULL, NULL, '90', '0', NULL, '0', '90', '127.0.0.1', NULL, NULL, '2019-03-28 06:06:06', '2019-03-28 06:06:06', NULL),
(57, 3, '', 5, 'ee1c9480ca9c5418926ae71408602eaf', 'ordered', 1, '2019-03-28 12:20:00', NULL, NULL, NULL, NULL, NULL, NULL, '90', '0', NULL, '0', '90', '127.0.0.1', NULL, NULL, '2019-03-28 06:50:26', '2019-03-28 06:50:26', NULL),
(58, 3, '', 5, '70a975908820ccb0b495e6ef07bd8d41', 'ordered', 1, '2019-03-28 12:21:00', NULL, NULL, NULL, NULL, NULL, NULL, '39', '0', NULL, '0', '39', '127.0.0.1', NULL, NULL, '2019-03-28 06:51:36', '2019-03-28 06:51:36', NULL),
(59, 3, '', 7, 'ad758b947f2be0097de444b44218c009', 'ordered', 1, '2019-03-28 12:26:00', NULL, NULL, NULL, NULL, NULL, NULL, '78', '0', NULL, '0', '78', '127.0.0.1', NULL, NULL, '2019-03-28 06:56:58', '2019-03-28 06:56:58', NULL),
(60, 3, '', 6, 'b83839fd066f80da08f5adb0bd1c415d', 'ordered', 1, '2019-03-28 12:29:00', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, '0', '0', '127.0.0.1', NULL, NULL, '2019-03-28 06:59:13', '2019-03-28 06:59:13', NULL),
(61, 3, '', 6, 'c47459eaf4c50500c18bd42d6c562fd2', 'ordered', 1, '2019-03-28 12:30:00', NULL, NULL, NULL, NULL, NULL, NULL, '39', '0', NULL, '0', '39', '127.0.0.1', NULL, NULL, '2019-03-28 07:00:13', '2019-03-28 07:00:13', NULL),
(62, 3, '', 5, 'c62d6076edd38fbb299204edef060db2', 'ordered', 1, '2019-03-28 14:34:00', NULL, NULL, NULL, NULL, NULL, NULL, '4658', '100', 'NEW100', '0', '4558', '127.0.0.1', NULL, NULL, '2019-03-28 09:04:24', '2019-03-28 09:04:24', NULL),
(63, 3, '', 7, '08e88dd959d3b5cd64fe0af85fec97f4', 'ordered', 1, '2019-03-28 14:36:00', NULL, NULL, NULL, NULL, NULL, NULL, '90', '0', NULL, '0', '90', '127.0.0.1', NULL, NULL, '2019-03-28 09:06:08', '2019-03-28 09:06:08', NULL),
(64, 3, '', 7, 'b30b30f1a7e8cc551d2d45993ade932e', 'ordered', 1, '2019-03-28 14:36:00', NULL, NULL, NULL, NULL, NULL, NULL, '90', '0', NULL, '0', '90', '127.0.0.1', NULL, NULL, '2019-03-28 09:06:34', '2019-03-28 09:06:34', NULL),
(65, 3, '', 6, '0ade62acd40136547ca461dcd29301a4', 'ordered', 1, '2019-03-28 14:36:00', NULL, NULL, NULL, NULL, NULL, NULL, '39', '0', NULL, '0', '39', '127.0.0.1', NULL, NULL, '2019-03-28 09:06:51', '2019-03-28 09:06:51', NULL),
(66, 3, '', 6, '6bd7bfaed1123985c81355e651a55b5a', 'ordered', 1, '2019-03-28 14:37:00', NULL, NULL, NULL, NULL, NULL, NULL, '39', '0', NULL, '0', '39', '127.0.0.1', NULL, NULL, '2019-03-28 09:07:11', '2019-03-28 09:07:11', NULL),
(67, 3, '', 7, '4b65925432befebfa54839fa10846973', 'ordered', 1, '2019-03-28 14:37:00', NULL, NULL, NULL, NULL, NULL, NULL, '90', '0', NULL, '0', '90', '127.0.0.1', NULL, NULL, '2019-03-28 09:07:24', '2019-03-28 09:07:24', NULL),
(68, 3, '', 6, '7ed0e0526d0fefa518867432281b7032', 'ordered', 1, '2019-03-28 14:38:00', NULL, NULL, NULL, NULL, NULL, NULL, '90', '0', NULL, '0', '90', '127.0.0.1', NULL, NULL, '2019-03-28 09:08:14', '2019-03-28 09:08:14', NULL),
(69, 3, '', 7, '43fae855a06fe0cb2481a8fa4139efb5', 'ordered', 1, '2019-03-28 14:38:00', NULL, NULL, NULL, NULL, NULL, NULL, '117', '11.7', 'NEW50', '0', '105.3', '127.0.0.1', NULL, NULL, '2019-03-28 09:08:49', '2019-03-28 09:08:49', NULL),
(70, 3, '', 6, '490fbfa57e6839bc6d5a93c299f7e0a8', 'ordered', 1, '2019-03-28 14:40:00', NULL, NULL, NULL, NULL, NULL, NULL, '39', '0', NULL, '0', '39', '127.0.0.1', NULL, NULL, '2019-03-28 09:10:05', '2019-03-28 09:10:05', NULL),
(71, 3, '', 5, '73607a47f774327f35a075745935a335', 'ordered', 1, '2019-03-28 14:43:00', NULL, NULL, NULL, NULL, NULL, NULL, '90', '0', NULL, '0', '90', '127.0.0.1', NULL, NULL, '2019-03-28 09:13:25', '2019-03-28 09:13:25', NULL),
(72, 3, '', 6, '9f00cc34504dcd8b2f46d299a3529b6a', 'ordered', 1, '2019-03-28 14:45:00', NULL, NULL, NULL, NULL, NULL, NULL, '270', '100', 'NEW100', '0', '170', '127.0.0.1', NULL, NULL, '2019-03-28 09:15:21', '2019-03-28 09:15:21', NULL),
(73, 3, '', 7, '0cd399afae44bddbfe6b26b18d14fa68', 'ordered', 1, '2019-03-28 14:46:00', NULL, NULL, NULL, NULL, NULL, NULL, '1624', '100', 'NEW100', '0', '1524', '127.0.0.1', NULL, NULL, '2019-03-28 09:16:45', '2019-03-28 09:16:45', NULL),
(74, 3, '', 6, '3d71013981bd706e80200e307e81caab', 'ordered', 1, '2019-03-28 14:56:00', NULL, NULL, NULL, NULL, NULL, NULL, '90', '0', NULL, '0', '90', '127.0.0.1', NULL, NULL, '2019-03-28 09:26:02', '2019-03-28 09:26:02', NULL),
(75, 3, '', 5, '351308c3b0b1a04c3e056d472f4af40b', 'ordered', 1, '2019-03-29 04:58:00', NULL, NULL, NULL, NULL, NULL, NULL, '90', '0', NULL, '0', '90', '127.0.0.1', NULL, NULL, '2019-03-28 23:28:20', '2019-03-28 23:28:20', NULL),
(76, 3, '', 7, '4c1fa076020750c1f45239330ca7dcdd', 'ordered', 1, '2019-03-29 05:10:00', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, '0', '0', '127.0.0.1', NULL, NULL, '2019-03-28 23:40:24', '2019-03-28 23:40:24', NULL),
(77, 3, '', 5, '9038415470d6dc605f0b9ad9597f476c', 'ordered', 1, '2019-03-29 05:14:00', NULL, NULL, NULL, NULL, NULL, NULL, '1688', '0', NULL, '0', '1688', '127.0.0.1', NULL, NULL, '2019-03-28 23:44:44', '2019-03-28 23:44:44', NULL),
(78, 3, '', 6, '248ec008048dfdb6e559f75719c3c5fd', 'ordered', 1, '2019-03-29 05:16:00', NULL, NULL, NULL, NULL, NULL, NULL, '129', '0', NULL, '0', '129', '127.0.0.1', NULL, NULL, '2019-03-28 23:46:02', '2019-03-28 23:46:02', NULL),
(79, 3, '', 6, 'ef857437ed3d4698ac258fdfd0a9fbaf', 'ordered', 1, '2019-03-29 05:17:00', NULL, NULL, NULL, NULL, NULL, NULL, '6385', '100', 'NEW100', '0', '6285', '127.0.0.1', NULL, NULL, '2019-03-28 23:47:38', '2019-03-28 23:47:38', NULL),
(80, 3, '', 5, '27785fd40b048ed998469061ec90ba22', 'ordered', 1, '2019-03-29 05:19:00', NULL, NULL, NULL, NULL, NULL, NULL, '90', '0', NULL, '0', '90', '127.0.0.1', NULL, NULL, '2019-03-28 23:49:15', '2019-03-28 23:49:15', NULL),
(81, 3, '', 6, '22b468c9c14f5b73bc44906ee0946769', 'ordered', 1, '2019-03-29 05:39:00', NULL, NULL, NULL, NULL, NULL, NULL, '90', '0', NULL, '0', '90', '127.0.0.1', NULL, NULL, '2019-03-29 00:09:05', '2019-03-29 00:09:05', NULL),
(82, 3, '', 6, '41b998c8b794db95abec3df7945663c6', 'ordered', 1, '2019-03-29 05:39:00', NULL, NULL, NULL, NULL, NULL, NULL, '90', '0', NULL, '0', '90', '127.0.0.1', NULL, NULL, '2019-03-29 00:09:59', '2019-03-29 00:09:59', NULL),
(83, 3, '', 5, 'd296cd8276534ee9dbddbccc1cb94800', 'ordered', 1, '2019-03-29 10:33:00', NULL, NULL, NULL, NULL, NULL, NULL, '849', '0', NULL, '0', '849', '127.0.0.1', NULL, NULL, '2019-03-29 05:03:46', '2019-03-29 05:03:46', NULL),
(84, 3, '', 5, '0ac5a447ecfa99cfc5ac1778f606797e', 'ordered', 1, '2019-03-29 11:25:00', NULL, NULL, NULL, NULL, NULL, NULL, '90', '0', NULL, '0', '90', '127.0.0.1', NULL, NULL, '2019-03-29 05:55:04', '2019-03-29 05:55:04', NULL),
(85, 3, '', 5, 'ab3e990ced10db9560274ad154da74ae', 'ordered', 1, '2019-03-29 11:25:00', NULL, NULL, NULL, NULL, NULL, NULL, '720', '0', NULL, '0', '720', '127.0.0.1', NULL, NULL, '2019-03-29 05:55:25', '2019-03-29 05:55:25', NULL),
(86, 3, '', 5, 'a7163e03179d28ffa85befb1d9084901', 'ordered', 1, '2019-03-29 11:30:00', NULL, NULL, NULL, NULL, NULL, NULL, '90', '0', NULL, '0', '90', '127.0.0.1', NULL, NULL, '2019-03-29 06:00:33', '2019-03-29 06:00:33', NULL),
(87, 3, '', 5, 'af400942bd510011c48e56c94fc40740', 'ordered', 1, '2019-04-01 05:17:00', NULL, NULL, NULL, NULL, NULL, NULL, '180', '18', 'NEW50', '0', '162', '127.0.0.1', NULL, NULL, '2019-03-31 23:47:14', '2019-03-31 23:47:14', NULL),
(88, 3, '', 5, '00b5b5bb6fda675b3019604a60a0837a', 'ordered', 1, '2019-04-01 05:20:00', NULL, NULL, NULL, NULL, NULL, NULL, '90', '0', NULL, '0', '90', '127.0.0.1', NULL, NULL, '2019-03-31 23:50:05', '2019-03-31 23:50:05', NULL),
(89, 3, '', 5, '849e8956e778dc11a4ca3a2f0744e1d0', 'ordered', 1, '2019-04-01 05:21:00', NULL, NULL, NULL, NULL, NULL, NULL, '90', '0', NULL, '0', '90', '127.0.0.1', NULL, NULL, '2019-03-31 23:51:00', '2019-03-31 23:51:00', NULL),
(90, 3, '', 6, '29d5b41d41be99c7156bb4a75d347cac', 'ordered', 1, '2019-04-02 09:35:00', NULL, NULL, NULL, NULL, NULL, NULL, '1800', '100', 'NEW100', '0', '1700', '127.0.0.1', NULL, NULL, '2019-04-02 04:05:59', '2019-04-02 04:05:59', NULL),
(91, 3, '', 5, '5abc94abab637444373529111d3b6f23', 'ordered', 1, '2019-04-03 11:03:00', NULL, NULL, NULL, NULL, NULL, NULL, '540', '100', 'NEW100', '0', '440', '127.0.0.1', NULL, NULL, '2019-04-03 05:33:56', '2019-04-03 05:33:56', NULL),
(92, 3, '', 5, 'c36a5ed3da69ad0307de8a15a1c8d614', 'ordered', 2, '2019-04-04 13:02:00', NULL, NULL, NULL, NULL, NULL, NULL, '2526', '100', 'NEW50', '0', '2426', '127.0.0.1', NULL, NULL, '2019-04-04 07:32:33', '2019-04-04 07:32:33', NULL),
(93, 3, '', 5, 'd7702cdfa77783557112089c8fb348f2', 'ordered', 2, '2019-04-08 07:14:00', NULL, NULL, NULL, NULL, NULL, NULL, '390', '100', 'NEW100', '0', '290', '127.0.0.1', NULL, NULL, '2019-04-08 01:44:12', '2019-04-08 01:44:12', NULL),
(94, 3, '', 5, '22d1c5dbaa3462c928916986db459e1b', 'ordered', 2, '2019-04-08 07:20:00', NULL, NULL, NULL, NULL, NULL, NULL, '5576', '100', 'NEW100', '0', '5476', '127.0.0.1', NULL, NULL, '2019-04-08 01:50:31', '2019-04-08 01:50:31', NULL),
(95, 3, '', NULL, '31ea119546e09f8b085fb48f2a315143', 'ordered', 2, '2019-04-08 07:20:00', NULL, NULL, NULL, NULL, NULL, NULL, '0', '100', 'NEW100', '0', '-100', '127.0.0.1', NULL, NULL, '2019-04-08 01:50:57', '2019-04-08 01:50:57', NULL),
(96, 3, '', 5, '605af4a5f2b5f6717f4bdc62b9359e71', 'ordered', 2, '2019-04-08 07:29:00', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', 'NEW100', '0', '0', '127.0.0.1', NULL, NULL, '2019-04-08 01:59:04', '2019-04-08 01:59:04', NULL),
(97, 3, '', 5, 'b01ee3a535bd6511ffeca96021b9e80d', 'ordered', 2, '2019-04-08 07:30:00', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, '0', '0', '127.0.0.1', NULL, NULL, '2019-04-08 02:00:52', '2019-04-08 02:00:52', NULL),
(98, 3, '', 5, 'fba3aeb7f1c9c4800c6950cf7bd259ec', 'ordered', 2, '2019-04-08 11:05:00', NULL, NULL, NULL, NULL, NULL, NULL, '270', '27', 'NEW50', '0', '243', '127.0.0.1', NULL, NULL, '2019-04-08 05:35:36', '2019-04-08 05:35:36', NULL),
(99, 3, '', 6, '5d36feff3f432a41c4092f7700149242', 'ordered', 2, '2019-04-09 10:01:00', NULL, NULL, NULL, NULL, NULL, NULL, '2500', '100', 'NEW100', '0', '2400', '127.0.0.1', NULL, NULL, '2019-04-09 04:31:22', '2019-04-09 04:31:22', NULL),
(100, 3, '', 5, '81b6a1bb4b7e5060d8e3965da837802c', 'ordered', 2, '2019-04-10 04:57:00', NULL, NULL, NULL, NULL, NULL, NULL, '150', '0', NULL, '0', '150', '127.0.0.1', NULL, NULL, '2019-04-09 23:27:16', '2019-04-09 23:27:16', NULL),
(101, 3, '', 5, 'b601405f082658351ed871fd2968db97', 'ordered', 2, '2019-04-11 10:35:00', NULL, NULL, NULL, NULL, NULL, NULL, '5718', '100', 'NEW100', '0', '5618', '127.0.0.1', NULL, NULL, '2019-04-11 05:05:49', '2019-04-11 05:05:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_child_id` int(10) UNSIGNED DEFAULT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `removed_by` int(11) DEFAULT NULL,
  `remove_reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_collected` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `product_child_id`, `order_id`, `quantity`, `removed_by`, `remove_reason`, `sub_total`, `discount`, `offer`, `tax_collected`, `grand_total`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 2, NULL, NULL, '39', NULL, NULL, NULL, '78', '2019-03-14 06:02:51', '2019-03-14 06:02:51', NULL),
(2, 2, 1, 1, NULL, NULL, '60', NULL, NULL, NULL, '60', '2019-03-14 06:02:52', '2019-03-14 06:02:52', NULL),
(3, 2, 2, 5, NULL, NULL, '3500', NULL, NULL, NULL, '17500', '2019-03-15 06:57:38', '2019-03-15 06:57:38', NULL),
(4, 1, 3, 12, NULL, NULL, '80', NULL, NULL, NULL, '960', '2019-03-15 07:52:19', '2019-03-15 07:52:19', NULL),
(5, 1, 4, 9, NULL, NULL, '100', NULL, NULL, NULL, '900', '2019-03-18 06:54:07', '2019-03-18 06:54:07', NULL),
(6, 1, 5, 7, NULL, NULL, '100', NULL, NULL, NULL, '700', '2019-03-18 07:44:59', '2019-03-18 07:44:59', NULL),
(7, 1, 6, 4, NULL, NULL, '39', NULL, NULL, NULL, '156', '2019-03-18 07:57:11', '2019-03-18 07:57:11', NULL),
(8, 1, 7, 3, NULL, NULL, '100', NULL, NULL, NULL, '300', '2019-03-18 08:17:31', '2019-03-18 08:17:31', NULL),
(9, 2, 7, 3, NULL, NULL, '3500', NULL, NULL, NULL, '10500', '2019-03-18 08:17:31', '2019-03-18 08:17:31', NULL),
(10, 4, 7, 3, NULL, NULL, '65', NULL, NULL, NULL, '195', '2019-03-18 08:17:31', '2019-03-18 08:17:31', NULL),
(11, 2, 8, 1, NULL, NULL, '2500', NULL, NULL, NULL, '2500', '2019-03-18 08:24:33', '2019-03-18 08:24:33', NULL),
(12, 6, 9, 1, NULL, NULL, '3500', NULL, NULL, NULL, '3500', '2019-03-22 06:17:32', '2019-03-22 06:17:32', NULL),
(13, 3, 10, 16, NULL, NULL, '20', NULL, NULL, NULL, '320', '2019-03-22 07:13:51', '2019-03-22 07:13:51', NULL),
(14, 2, 11, 2, NULL, NULL, '1500', NULL, NULL, NULL, '3000', '2019-03-22 07:14:23', '2019-03-22 07:14:23', NULL),
(15, 1, 12, 3, NULL, NULL, '100', NULL, NULL, NULL, '300', '2019-03-22 07:18:40', '2019-03-22 07:18:40', NULL),
(16, 2, 12, 1, NULL, NULL, '3500', NULL, NULL, NULL, '3500', '2019-03-22 07:18:40', '2019-03-22 07:18:40', NULL),
(17, 5, 13, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-25 03:08:22', '2019-03-25 03:08:22', NULL),
(18, 5, 14, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-26 04:49:15', '2019-03-26 04:49:15', NULL),
(19, 5, 15, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-26 05:19:49', '2019-03-26 05:19:49', NULL),
(20, 3, 16, 5, NULL, NULL, '80', NULL, NULL, NULL, '400', '2019-03-26 07:10:41', '2019-03-26 07:10:41', NULL),
(21, 1, 16, 4, NULL, NULL, '39', NULL, NULL, NULL, '156', '2019-03-26 07:10:41', '2019-03-26 07:10:41', NULL),
(22, 10, 16, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-26 07:10:41', '2019-03-26 07:10:41', NULL),
(23, 7, 16, 4, NULL, NULL, '20', NULL, NULL, NULL, '80', '2019-03-26 07:10:41', '2019-03-26 07:10:41', NULL),
(24, 10, 17, 3, NULL, NULL, '90', NULL, NULL, NULL, '270', '2019-03-26 07:11:43', '2019-03-26 07:11:43', NULL),
(25, 1, 17, 3, NULL, NULL, '39', NULL, NULL, NULL, '117', '2019-03-26 07:11:43', '2019-03-26 07:11:43', NULL),
(26, 4, 17, 3, NULL, NULL, '1500', NULL, NULL, NULL, '4500', '2019-03-26 07:11:43', '2019-03-26 07:11:43', NULL),
(27, 7, 17, 3, NULL, NULL, '20', NULL, NULL, NULL, '60', '2019-03-26 07:11:43', '2019-03-26 07:11:43', NULL),
(28, 9, 17, 3, NULL, NULL, '65', NULL, NULL, NULL, '195', '2019-03-26 07:11:43', '2019-03-26 07:11:43', NULL),
(29, 5, 18, 2, NULL, NULL, '90', NULL, NULL, NULL, '180', '2019-03-27 01:36:51', '2019-03-27 01:36:51', NULL),
(30, 9, 19, 1, NULL, NULL, '65', NULL, NULL, NULL, '65', '2019-03-27 05:24:52', '2019-03-27 05:24:52', NULL),
(31, 1, 20, 1, NULL, NULL, '39', NULL, NULL, NULL, '39', '2019-03-27 23:37:33', '2019-03-27 23:37:33', NULL),
(32, 1, 21, 1, NULL, NULL, '39', NULL, NULL, NULL, '39', '2019-03-27 23:42:35', '2019-03-27 23:42:35', NULL),
(33, 1, 23, 1, NULL, NULL, '39', NULL, NULL, NULL, '39', '2019-03-27 23:48:14', '2019-03-27 23:48:14', NULL),
(34, 10, 26, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-28 00:02:11', '2019-03-28 00:02:11', NULL),
(35, 1, 27, 1, NULL, NULL, '39', NULL, NULL, NULL, '39', '2019-03-28 00:30:45', '2019-03-28 00:30:45', NULL),
(36, 10, 28, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-28 00:40:22', '2019-03-28 00:40:22', NULL),
(37, 1, 29, 1, NULL, NULL, '39', NULL, NULL, NULL, '39', '2019-03-28 00:53:42', '2019-03-28 00:53:42', NULL),
(38, 10, 30, 2, NULL, NULL, '90', NULL, NULL, NULL, '180', '2019-03-28 00:54:35', '2019-03-28 00:54:35', NULL),
(39, 10, 31, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-28 02:45:06', '2019-03-28 02:45:06', NULL),
(40, 10, 32, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-28 02:47:23', '2019-03-28 02:47:23', NULL),
(41, 10, 33, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-28 02:59:05', '2019-03-28 02:59:05', NULL),
(42, 10, 34, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-28 03:04:23', '2019-03-28 03:04:23', NULL),
(43, 1, 35, 4, NULL, NULL, '39', NULL, NULL, NULL, '156', '2019-03-28 03:07:50', '2019-03-28 03:07:50', NULL),
(44, 4, 35, 1, NULL, NULL, '1500', NULL, NULL, NULL, '1500', '2019-03-28 03:07:50', '2019-03-28 03:07:50', NULL),
(45, 7, 35, 1, NULL, NULL, '20', NULL, NULL, NULL, '20', '2019-03-28 03:07:50', '2019-03-28 03:07:50', NULL),
(46, 10, 36, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-28 03:10:20', '2019-03-28 03:10:20', NULL),
(47, 1, 36, 1, NULL, NULL, '39', NULL, NULL, NULL, '39', '2019-03-28 03:10:20', '2019-03-28 03:10:20', NULL),
(48, 9, 36, 1, NULL, NULL, '65', NULL, NULL, NULL, '65', '2019-03-28 03:10:21', '2019-03-28 03:10:21', NULL),
(49, 7, 36, 1, NULL, NULL, '20', NULL, NULL, NULL, '20', '2019-03-28 03:10:21', '2019-03-28 03:10:21', NULL),
(50, 4, 36, 1, NULL, NULL, '1500', NULL, NULL, NULL, '1500', '2019-03-28 03:10:21', '2019-03-28 03:10:21', NULL),
(51, 10, 37, 2, NULL, NULL, '90', NULL, NULL, NULL, '180', '2019-03-28 03:16:07', '2019-03-28 03:16:07', NULL),
(52, 1, 37, 2, NULL, NULL, '39', NULL, NULL, NULL, '78', '2019-03-28 03:16:07', '2019-03-28 03:16:07', NULL),
(53, 4, 37, 1, NULL, NULL, '1500', NULL, NULL, NULL, '1500', '2019-03-28 03:16:07', '2019-03-28 03:16:07', NULL),
(54, 7, 37, 3, NULL, NULL, '20', NULL, NULL, NULL, '60', '2019-03-28 03:16:07', '2019-03-28 03:16:07', NULL),
(55, 9, 37, 4, NULL, NULL, '65', NULL, NULL, NULL, '260', '2019-03-28 03:16:07', '2019-03-28 03:16:07', NULL),
(56, 10, 38, 2, NULL, NULL, '90', NULL, NULL, NULL, '180', '2019-03-28 03:17:57', '2019-03-28 03:17:57', NULL),
(57, 1, 38, 2, NULL, NULL, '39', NULL, NULL, NULL, '78', '2019-03-28 03:17:57', '2019-03-28 03:17:57', NULL),
(58, 4, 38, 2, NULL, NULL, '1500', NULL, NULL, NULL, '3000', '2019-03-28 03:17:57', '2019-03-28 03:17:57', NULL),
(59, 7, 38, 2, NULL, NULL, '20', NULL, NULL, NULL, '40', '2019-03-28 03:17:57', '2019-03-28 03:17:57', NULL),
(60, 9, 38, 2, NULL, NULL, '65', NULL, NULL, NULL, '130', '2019-03-28 03:17:57', '2019-03-28 03:17:57', NULL),
(61, 10, 39, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-28 03:24:51', '2019-03-28 03:24:51', NULL),
(62, 1, 39, 2, NULL, NULL, '39', NULL, NULL, NULL, '78', '2019-03-28 03:24:51', '2019-03-28 03:24:51', NULL),
(63, 4, 39, 3, NULL, NULL, '1500', NULL, NULL, NULL, '4500', '2019-03-28 03:24:51', '2019-03-28 03:24:51', NULL),
(64, 7, 39, 4, NULL, NULL, '20', NULL, NULL, NULL, '80', '2019-03-28 03:24:51', '2019-03-28 03:24:51', NULL),
(65, 10, 40, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-28 03:32:23', '2019-03-28 03:32:23', NULL),
(66, 1, 40, 1, NULL, NULL, '39', NULL, NULL, NULL, '39', '2019-03-28 03:32:23', '2019-03-28 03:32:23', NULL),
(67, 10, 41, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-28 03:34:37', '2019-03-28 03:34:37', NULL),
(68, 1, 41, 1, NULL, NULL, '39', NULL, NULL, NULL, '39', '2019-03-28 03:34:37', '2019-03-28 03:34:37', NULL),
(69, 4, 41, 1, NULL, NULL, '1500', NULL, NULL, NULL, '1500', '2019-03-28 03:34:37', '2019-03-28 03:34:37', NULL),
(70, 10, 42, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-28 03:35:26', '2019-03-28 03:35:26', NULL),
(71, 1, 42, 1, NULL, NULL, '39', NULL, NULL, NULL, '39', '2019-03-28 03:35:26', '2019-03-28 03:35:26', NULL),
(72, 10, 43, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-28 04:06:42', '2019-03-28 04:06:42', NULL),
(73, 1, 44, 3, NULL, NULL, '39', NULL, NULL, NULL, '117', '2019-03-28 04:31:51', '2019-03-28 04:31:51', NULL),
(74, 4, 44, 2, NULL, NULL, '1500', NULL, NULL, NULL, '3000', '2019-03-28 04:31:51', '2019-03-28 04:31:51', NULL),
(75, 7, 44, 1, NULL, NULL, '20', NULL, NULL, NULL, '20', '2019-03-28 04:31:51', '2019-03-28 04:31:51', NULL),
(76, 4, 45, 1, NULL, NULL, '1500', NULL, NULL, NULL, '1500', '2019-03-28 04:48:01', '2019-03-28 04:48:01', NULL),
(77, 1, 45, 1, NULL, NULL, '39', NULL, NULL, NULL, '39', '2019-03-28 04:48:01', '2019-03-28 04:48:01', NULL),
(78, 7, 45, 1, NULL, NULL, '20', NULL, NULL, NULL, '20', '2019-03-28 04:48:01', '2019-03-28 04:48:01', NULL),
(79, 9, 45, 1, NULL, NULL, '65', NULL, NULL, NULL, '65', '2019-03-28 04:48:02', '2019-03-28 04:48:02', NULL),
(80, 10, 46, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-28 04:51:23', '2019-03-28 04:51:23', NULL),
(81, 10, 47, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-28 04:53:52', '2019-03-28 04:53:52', NULL),
(82, 10, 48, 2, NULL, NULL, '90', NULL, NULL, NULL, '180', '2019-03-28 04:54:55', '2019-03-28 04:54:55', NULL),
(83, 10, 49, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-28 04:59:07', '2019-03-28 04:59:07', NULL),
(84, 10, 50, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-28 05:01:34', '2019-03-28 05:01:34', NULL),
(85, 10, 51, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-28 05:11:53', '2019-03-28 05:11:53', NULL),
(86, 10, 52, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-28 05:18:40', '2019-03-28 05:18:40', NULL),
(87, 10, 53, 2, NULL, NULL, '90', NULL, NULL, NULL, '180', '2019-03-28 05:30:05', '2019-03-28 05:30:05', NULL),
(88, 10, 54, 2, NULL, NULL, '90', NULL, NULL, NULL, '180', '2019-03-28 05:34:50', '2019-03-28 05:34:50', NULL),
(89, 10, 55, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-28 06:04:54', '2019-03-28 06:04:54', NULL),
(90, 10, 56, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-28 06:06:06', '2019-03-28 06:06:06', NULL),
(91, 10, 57, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-28 06:50:26', '2019-03-28 06:50:26', NULL),
(92, 1, 58, 1, NULL, NULL, '39', NULL, NULL, NULL, '39', '2019-03-28 06:51:36', '2019-03-28 06:51:36', NULL),
(93, 1, 59, 2, NULL, NULL, '39', NULL, NULL, NULL, '78', '2019-03-28 06:56:58', '2019-03-28 06:56:58', NULL),
(94, 1, 60, 1, NULL, NULL, '39', NULL, NULL, NULL, '39', '2019-03-28 06:59:13', '2019-03-28 06:59:13', NULL),
(95, 1, 61, 1, NULL, NULL, '39', NULL, NULL, NULL, '39', '2019-03-28 07:00:13', '2019-03-28 07:00:13', NULL),
(96, 1, 62, 2, NULL, NULL, '39', NULL, NULL, NULL, '78', '2019-03-28 09:04:24', '2019-03-28 09:04:24', NULL),
(97, 4, 62, 3, NULL, NULL, '1500', NULL, NULL, NULL, '4500', '2019-03-28 09:04:24', '2019-03-28 09:04:24', NULL),
(98, 7, 62, 4, NULL, NULL, '20', NULL, NULL, NULL, '80', '2019-03-28 09:04:24', '2019-03-28 09:04:24', NULL),
(99, 10, 63, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-28 09:06:08', '2019-03-28 09:06:08', NULL),
(100, 10, 64, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-28 09:06:34', '2019-03-28 09:06:34', NULL),
(101, 1, 65, 1, NULL, NULL, '39', NULL, NULL, NULL, '39', '2019-03-28 09:06:51', '2019-03-28 09:06:51', NULL),
(102, 1, 66, 1, NULL, NULL, '39', NULL, NULL, NULL, '39', '2019-03-28 09:07:11', '2019-03-28 09:07:11', NULL),
(103, 10, 67, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-28 09:07:24', '2019-03-28 09:07:24', NULL),
(104, 10, 68, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-28 09:08:14', '2019-03-28 09:08:14', NULL),
(105, 1, 69, 3, NULL, NULL, '39', NULL, NULL, NULL, '117', '2019-03-28 09:08:49', '2019-03-28 09:08:49', NULL),
(106, 1, 70, 1, NULL, NULL, '39', NULL, NULL, NULL, '39', '2019-03-28 09:10:05', '2019-03-28 09:10:05', NULL),
(107, 10, 71, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-28 09:13:25', '2019-03-28 09:13:25', NULL),
(108, 10, 72, 3, NULL, NULL, '90', NULL, NULL, NULL, '270', '2019-03-28 09:15:21', '2019-03-28 09:15:21', NULL),
(109, 1, 73, 1, NULL, NULL, '39', NULL, NULL, NULL, '39', '2019-03-28 09:16:46', '2019-03-28 09:16:46', NULL),
(110, 4, 73, 1, NULL, NULL, '1500', NULL, NULL, NULL, '1500', '2019-03-28 09:16:46', '2019-03-28 09:16:46', NULL),
(111, 7, 73, 1, NULL, NULL, '20', NULL, NULL, NULL, '20', '2019-03-28 09:16:46', '2019-03-28 09:16:46', NULL),
(112, 9, 73, 1, NULL, NULL, '65', NULL, NULL, NULL, '65', '2019-03-28 09:16:46', '2019-03-28 09:16:46', NULL),
(113, 10, 74, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-28 09:26:02', '2019-03-28 09:26:02', NULL),
(114, 10, 75, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-28 23:28:20', '2019-03-28 23:28:20', NULL),
(115, 10, 76, 9, NULL, NULL, '90', NULL, NULL, NULL, '810', '2019-03-28 23:40:24', '2019-03-28 23:40:24', NULL),
(116, 1, 76, 4, NULL, NULL, '39', NULL, NULL, NULL, '156', '2019-03-28 23:40:24', '2019-03-28 23:40:24', NULL),
(117, 4, 76, 3, NULL, NULL, '1500', NULL, NULL, NULL, '4500', '2019-03-28 23:40:24', '2019-03-28 23:40:24', NULL),
(118, 10, 77, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-28 23:44:44', '2019-03-28 23:44:44', NULL),
(119, 1, 77, 2, NULL, NULL, '39', NULL, NULL, NULL, '78', '2019-03-28 23:44:44', '2019-03-28 23:44:44', NULL),
(120, 7, 77, 1, NULL, NULL, '20', NULL, NULL, NULL, '20', '2019-03-28 23:44:44', '2019-03-28 23:44:44', NULL),
(121, 4, 77, 1, NULL, NULL, '1500', NULL, NULL, NULL, '1500', '2019-03-28 23:44:44', '2019-03-28 23:44:44', NULL),
(122, 10, 78, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-28 23:46:02', '2019-03-28 23:46:02', NULL),
(123, 1, 78, 1, NULL, NULL, '39', NULL, NULL, NULL, '39', '2019-03-28 23:46:02', '2019-03-28 23:46:02', NULL),
(124, 1, 79, 5, NULL, NULL, '39', NULL, NULL, NULL, '195', '2019-03-28 23:47:38', '2019-03-28 23:47:38', NULL),
(125, 4, 79, 4, NULL, NULL, '1500', NULL, NULL, NULL, '6000', '2019-03-28 23:47:38', '2019-03-28 23:47:38', NULL),
(126, 7, 79, 3, NULL, NULL, '20', NULL, NULL, NULL, '60', '2019-03-28 23:47:38', '2019-03-28 23:47:38', NULL),
(127, 9, 79, 2, NULL, NULL, '65', NULL, NULL, NULL, '130', '2019-03-28 23:47:38', '2019-03-28 23:47:38', NULL),
(128, 10, 80, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-28 23:49:15', '2019-03-28 23:49:15', NULL),
(129, 10, 81, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-29 00:09:05', '2019-03-29 00:09:05', NULL),
(130, 10, 82, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-29 00:09:59', '2019-03-29 00:09:59', NULL),
(131, 10, 83, 9, NULL, NULL, '90', NULL, NULL, NULL, '810', '2019-03-29 05:03:46', '2019-03-29 05:03:46', NULL),
(132, 1, 83, 1, NULL, NULL, '39', NULL, NULL, NULL, '39', '2019-03-29 05:03:46', '2019-03-29 05:03:46', NULL),
(133, 10, 84, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-29 05:55:04', '2019-03-29 05:55:04', NULL),
(134, 10, 85, 8, NULL, NULL, '90', NULL, NULL, NULL, '720', '2019-03-29 05:55:25', '2019-03-29 05:55:25', NULL),
(135, 10, 86, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-29 06:00:33', '2019-03-29 06:00:33', NULL),
(136, 10, 87, 2, NULL, NULL, '90', NULL, NULL, NULL, '180', '2019-03-31 23:47:14', '2019-03-31 23:47:14', NULL),
(137, 10, 88, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-31 23:50:05', '2019-03-31 23:50:05', NULL),
(138, 10, 89, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-03-31 23:51:00', '2019-03-31 23:51:00', NULL),
(139, 10, 90, 20, NULL, NULL, '90', NULL, NULL, NULL, '1800', '2019-04-02 04:05:59', '2019-04-02 04:05:59', NULL),
(140, 10, 91, 6, NULL, NULL, '90', NULL, NULL, NULL, '540', '2019-04-03 05:33:56', '2019-04-03 05:33:56', NULL),
(141, 1, 92, 2, NULL, NULL, '39', NULL, NULL, NULL, '78', '2019-04-04 07:32:33', '2019-04-04 07:32:33', NULL),
(142, 12, 92, 2, NULL, NULL, '450', NULL, NULL, NULL, '900', '2019-04-04 07:32:33', '2019-04-04 07:32:33', NULL),
(143, 11, 92, 2, NULL, NULL, '24', NULL, NULL, NULL, '48', '2019-04-04 07:32:33', '2019-04-04 07:32:33', NULL),
(144, 13, 92, 10, NULL, NULL, '150', NULL, NULL, NULL, '1500', '2019-04-04 07:32:33', '2019-04-04 07:32:33', NULL),
(145, 1, 93, 10, NULL, NULL, '39', NULL, NULL, NULL, '390', '2019-04-08 01:44:12', '2019-04-08 01:44:12', NULL),
(146, 1, 94, 4, NULL, NULL, '39', NULL, NULL, NULL, '156', '2019-04-08 01:50:31', '2019-04-08 01:50:31', NULL),
(147, 2, 94, 3, NULL, NULL, '1500', NULL, NULL, NULL, '4500', '2019-04-08 01:50:31', '2019-04-08 01:50:31', NULL),
(148, 4, 94, 2, NULL, NULL, '65', NULL, NULL, NULL, '130', '2019-04-08 01:50:31', '2019-04-08 01:50:31', NULL),
(149, 5, 94, 1, NULL, NULL, '90', NULL, NULL, NULL, '90', '2019-04-08 01:50:31', '2019-04-08 01:50:31', NULL),
(150, 8, 94, 3, NULL, NULL, '150', NULL, NULL, NULL, '450', '2019-04-08 01:50:31', '2019-04-08 01:50:31', NULL),
(151, 9, 94, 1, NULL, NULL, '250', NULL, NULL, NULL, '250', '2019-04-08 01:50:31', '2019-04-08 01:50:31', NULL),
(152, 10, 96, 3, NULL, NULL, '90', NULL, NULL, NULL, '270', '2019-04-08 01:59:04', '2019-04-08 01:59:04', NULL),
(153, 1, 96, 3, NULL, NULL, '39', NULL, NULL, NULL, '117', '2019-04-08 01:59:04', '2019-04-08 01:59:04', NULL),
(154, 4, 96, 3, NULL, NULL, '1500', NULL, NULL, NULL, '4500', '2019-04-08 01:59:04', '2019-04-08 01:59:04', NULL),
(155, 7, 96, 2, NULL, NULL, '20', NULL, NULL, NULL, '40', '2019-04-08 01:59:04', '2019-04-08 01:59:04', NULL),
(156, 9, 96, 1, NULL, NULL, '65', NULL, NULL, NULL, '65', '2019-04-08 01:59:04', '2019-04-08 01:59:04', NULL),
(157, 1, 97, 1, NULL, NULL, '39', NULL, NULL, NULL, '39', '2019-04-08 02:00:52', '2019-04-08 02:00:52', NULL),
(158, 13, 97, 1, NULL, NULL, '150', NULL, NULL, NULL, '150', '2019-04-08 02:00:52', '2019-04-08 02:00:52', NULL),
(159, 10, 98, 3, NULL, NULL, '90', NULL, NULL, NULL, '270', '2019-04-08 05:35:36', '2019-04-08 05:35:36', NULL),
(160, 19, 99, 10, NULL, NULL, '250', NULL, NULL, NULL, '2500', '2019-04-09 04:31:22', '2019-04-09 04:31:22', NULL),
(161, 18, 100, 1, NULL, NULL, '150', NULL, NULL, NULL, '150', '2019-04-09 23:27:17', '2019-04-09 23:27:17', NULL),
(162, 15, 101, 12, NULL, NULL, '250', NULL, NULL, NULL, '3000', '2019-04-11 05:05:49', '2019-04-11 05:05:49', NULL),
(163, 18, 101, 4, NULL, NULL, '150', NULL, NULL, NULL, '600', '2019-04-11 05:05:49', '2019-04-11 05:05:49', NULL),
(164, 20, 101, 3, NULL, NULL, '30', NULL, NULL, NULL, '90', '2019-04-11 05:05:49', '2019-04-11 05:05:49', NULL),
(165, 1, 101, 4, NULL, NULL, '39', NULL, NULL, NULL, '156', '2019-04-11 05:05:49', '2019-04-11 05:05:49', NULL),
(166, 11, 101, 3, NULL, NULL, '24', NULL, NULL, NULL, '72', '2019-04-11 05:05:49', '2019-04-11 05:05:49', NULL),
(167, 12, 101, 4, NULL, NULL, '450', NULL, NULL, NULL, '1800', '2019-04-11 05:05:49', '2019-04-11 05:05:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `id`, `created_at`, `updated_at`) VALUES
('kandarp.d9ithub+1@gmail.com', 'YFct8J2wC1xIRe2UMZiG9mZAwB7ZKKZ2SROmT07vytxck3O5baSNpv8Ymjyn', 3, '2019-03-29 07:24:27', '2019-03-29 07:24:31'),
('admin@admin.com', '$2y$10$.j8RutSD4O1tzfwhEq/gre0IhPdusIrAz1CLDf2s9mcR9ruSYyDgW', 4, '2019-04-01 23:52:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_name_arabic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_description` longtext COLLATE utf8mb4_unicode_ci,
  `product_description_arabic` longtext COLLATE utf8mb4_unicode_ci,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `product_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_image_arabic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_other_image` longtext COLLATE utf8mb4_unicode_ci,
  `product_other_image_arabic` longtext COLLATE utf8mb4_unicode_ci,
  `price` double(8,2) DEFAULT NULL,
  `sale_price` double(8,2) DEFAULT NULL,
  `effective_from` date DEFAULT NULL,
  `effective_to` date DEFAULT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '0 = Inactive and 1 = Active',
  `is_latest` int(11) DEFAULT NULL,
  `is_futured` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `product_name_arabic`, `product_code`, `product_description`, `product_description_arabic`, `category_id`, `tax_id`, `product_image`, `product_image_arabic`, `product_other_image`, `product_other_image_arabic`, `price`, `sale_price`, `effective_from`, `effective_to`, `status`, `is_latest`, `is_futured`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Dates', 'تمر', 'DAT1', '<p>Dates</p>', '<p>Dates Arabic</p>', 1, 1, NULL, NULL, '/uploads/Products/91ixoN40dTL_1553689117.jpg,/uploads/Products/dates_1553689117.jpg,/uploads/Products/Naked_Dates_Organic_Medjool_Dates_Jumbo3-e1479234922744_1553689117.jpg', NULL, NULL, NULL, NULL, NULL, '1', 1, NULL, 1, 1, '2019-03-14 03:30:31', '2019-04-05 01:53:07', NULL),
(2, 'Almonds', 'لوز', 'ALM1', '<p>Almonds</p>', '<p>Almonds Arabic</p>', 1, NULL, NULL, NULL, '/uploads/Products/433139_1553688485.jpg,/uploads/Products/almonds_and_nuts_191544_1553688485.jpg,/uploads/Products/almondsnutrition_1553688485.jpg', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, 1, '2019-03-14 03:34:08', '2019-03-27 06:38:05', NULL),
(3, 'Monaco', 'موناكو', 'Monaco1', '<p>Monaco</p>', '<p>موناكو</p>', 2, NULL, NULL, NULL, '/uploads/Products/vlW6ikD-full-screen-hd-wallpaper_1552565592.jpg', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, '2019-03-14 06:43:12', '2019-03-14 06:43:12', NULL),
(4, 'Millefoglie D\'Italia Alta Pasticceria Puff Pastry With Fresh Butter 85 g', 'معجنات ميل فوي دي إيطاليا ألتا باستيشريا بالزبدة الطازجة 85 غم', 'RET', '<p>Millefoglie D&#39;Italia Alta Pasticceria Puff Pastry With Fresh Butter 85 g</p>', '<h1>معجنات ميل فوي دي إيطاليا ألتا باستيشريا بالزبدة الطازجة 85 غم</h1>', 5, NULL, NULL, NULL, '/uploads/Products/TNzUqgH-full-screen-hd-wallpaper_1552910690.jpg', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, 1, '2019-03-18 06:34:50', '2019-04-10 08:21:05', NULL),
(5, 'parley biscuit Indian top brand 100 g parley biscuit Indian top brand 100 g', 'بسكويت الشعير الهندي 100 جرامبسكويت الشعير الهندي 100 جرام', 'PARLEY1', '<p>parley biscuit Indian top brand 100 g</p>', '<p>بسكويت الشعير الهندي 100 جرام</p>', 1, 1, NULL, NULL, '/uploads/Products/810956_1554717979.png,/uploads/Products/810953_1554717979.jpg,/uploads/Products/810957_1554717979.jpg,/uploads/Products/810958_1554717979.jpg', NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, 1, 1, '2019-03-23 00:25:20', '2019-04-08 04:36:19', NULL),
(6, 'little Hearts', 'قلوب صغيرة', 'LILHEAR', '<p>Little Hearts.</p>', '<p>قلوب صغيرة</p>', 2, 1, NULL, NULL, '/uploads/Products/Naked_Dates_Organic_Medjool_Dates_Jumbo3-e1479234922744_1554118631.jpg,/uploads/Products/810959_1554118631.jpg,/uploads/Products/780553_1554118631.jpg', NULL, NULL, NULL, NULL, NULL, '1', 1, 1, 1, NULL, '2019-04-01 06:07:11', '2019-04-01 06:07:11', NULL),
(7, 'D-mart Special', 'مد مارت الخاصة', 'D_ALM', '<p>D-mart Special</p>', '<p>مد مارت الخاصة</p>', 3, NULL, NULL, NULL, '/uploads/Products/433139_1554128246.jpg,/uploads/Products/almondsnutrition_1554128246.jpg,/uploads/Products/almonds_and_nuts_191544_1554128246.jpg', NULL, NULL, NULL, NULL, NULL, '1', 1, NULL, 1, NULL, '2019-04-01 08:47:26', '2019-04-01 08:47:26', NULL),
(8, 'Figs (Angir)', 'تين', 'ANG1', '<p>Figs (Angir)</p>', '<p>تين</p>', 1, NULL, NULL, NULL, '/uploads/Products/drfra006_1554203166.jpg,/uploads/Products/433139_1554203166.jpg,/uploads/Products/780553_1554203166.jpg', NULL, NULL, NULL, NULL, NULL, '1', 1, NULL, 1, NULL, '2019-04-02 05:36:06', '2019-04-02 05:36:06', NULL),
(9, 'Walnut/Akharot', 'جوز', 'AKH1', '<p>Walnut/Akharot</p>', '<ul>\n<li>جوز&nbsp;جوز&nbsp;جوز&nbsp;جوز&nbsp;&nbsp;</li>\n<li>جوز&nbsp;جوز&nbsp;جوز&nbsp;جوز&nbsp;&nbsp;</li>\n<li>جوز&nbsp;جوز&nbsp;جوز&nbsp;جوز&nbsp;&nbsp;</li>\n<li>جوز&nbsp;جوز&nbsp;جوز&nbsp;جوز&nbsp;&nbsp;جوز&nbsp;جوز&nbsp;جوز&nbsp;جوز&nbsp;&nbsp;جوز&nbsp;جوز&nbsp;جوز&nbsp;جوز&nbsp;&nbsp;</li>\n<li>جوز&nbsp;جوز&nbsp;جوز&nbsp;جوز&nbsp;&nbsp;</li>\n<li>جوز&nbsp;جوز&nbsp;جوز&nbsp;جوز&nbsp;&nbsp;</li>\n<li>جوز&nbsp;جوز&nbsp;جوز&nbsp;جوز&nbsp;&nbsp;</li>\n</ul>', 1, NULL, NULL, NULL, '/uploads/Products/10000512_4-bb-royal-walnutakharot-kernels_1554204127.jpg,/uploads/Products/10000512-2_1-bb-royal-walnutakharot-kernels_1554204127.jpg,/uploads/Products/almondsnutrition_1554204127.jpg', NULL, NULL, NULL, NULL, NULL, '1', 1, NULL, 1, NULL, '2019-04-02 05:52:07', '2019-04-02 05:52:07', NULL),
(10, 'Kishmish/Raisins', 'Kishmish / الزبيب', 'KIS1', '<p>Kishmish/Raisins&nbsp;Kishmish/Raisins&nbsp;Kishmish/Raisins&nbsp;Kishmish/Raisins</p>', '<p>Kishmish / الزبيبKishmish / الزبيبKishmish / الزبيبKishmish / الزبيبKishmish / الزبيب</p>', 1, NULL, NULL, NULL, '/uploads/Products/dates_1554803189.jpg,/uploads/Products/692805_1554803189.jpg,/uploads/Products/gettyimages-153711056-1024x1024_1554803189.jpg,/uploads/Products/Naked_Dates_Organic_Medjool_Dates_Jumbo3-e1479234922744_1554803189.jpg', NULL, NULL, NULL, NULL, NULL, '1', 1, 1, 8, 8, '2019-04-09 04:16:29', '2019-04-09 04:30:23', NULL),
(11, 'Juice', 'عصير', 'JUIC1', '<p>Juice</p>', '<p>عصيرعصيرعصيرعصيرعصير</p>', 6, NULL, NULL, NULL, '/uploads/Products/387309_1554963361.jpg,/uploads/Products/173999_1554963361.jpg,/uploads/Products/735466_1554963361.jpg,/uploads/Products/241498_1554963361.jpg,/uploads/Products/643382_1554963361.jpg,/uploads/Products/322347_1554963361.jpg', NULL, NULL, NULL, NULL, NULL, '1', 1, NULL, 1, NULL, '2019-04-11 00:46:01', '2019-04-11 00:46:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_specifications`
--

CREATE TABLE `product_specifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key_arabic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  `value_arabic` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_specifications`
--

INSERT INTO `product_specifications` (`id`, `product_id`, `key`, `key_arabic`, `value`, `value_arabic`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'quality', NULL, 'high', NULL, NULL, NULL, '2019-03-14 03:30:31', '2019-03-14 03:30:31', NULL),
(2, 2, 'quality', NULL, 'high', NULL, NULL, NULL, '2019-03-14 03:34:08', '2019-03-14 03:34:08', NULL),
(3, 3, 'quality', NULL, 'high', NULL, NULL, NULL, '2019-03-14 06:43:12', '2019-03-14 06:43:12', NULL),
(4, 4, 'quality', NULL, 'high', NULL, NULL, NULL, '2019-03-18 06:34:50', '2019-03-18 06:34:50', NULL),
(5, 5, 'quality', NULL, 'high', NULL, NULL, NULL, '2019-03-23 00:25:20', '2019-03-23 00:25:20', NULL),
(6, 6, 'quality', NULL, 'high', NULL, NULL, NULL, '2019-04-01 06:07:11', '2019-04-01 06:07:11', NULL),
(7, 7, 'quality', NULL, 'high', NULL, NULL, NULL, '2019-04-01 08:47:26', '2019-04-01 08:47:26', NULL),
(8, 8, 'Colour', 'اللون', 'Silver', 'فضة', NULL, NULL, '2019-04-02 05:36:06', '2019-04-02 05:36:06', NULL),
(9, 9, 'Size', 'بحجم', '400 g', '400 g', NULL, NULL, '2019-04-02 05:52:07', '2019-04-02 05:52:07', NULL),
(10, 9, 'Minerals', 'المعادن', 'Copper, Phosphorus, Magnesium, Manganese And Zinc', 'النحاس والفوسفور والمغنيسيوم والمنغنيز والزنك', NULL, NULL, '2019-04-02 05:52:08', '2019-04-02 05:52:08', NULL),
(11, 9, 'Dietary Needs', 'احتياجات الحمية', 'Vegetarian', 'نباتي', NULL, NULL, '2019-04-02 05:52:08', '2019-04-02 05:52:08', NULL),
(12, 10, 'quality', 'quality arabic', 'high', 'high arabic', NULL, NULL, '2019-04-09 04:16:29', '2019-04-09 04:16:29', NULL),
(13, 11, 'quality', 'quality arabic', 'high', 'high arabic', NULL, NULL, '2019-04-11 00:46:01', '2019-04-11 00:46:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_name_arabic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `role_name_arabic`, `permissions`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'مشرف', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17', 1, NULL, '2019-03-14 03:17:17', '2019-04-05 03:40:41'),
(2, 'Seller', 'Seller Arabic', '1,6,7,8,17', 1, NULL, '2019-03-14 03:18:14', '2019-03-14 03:18:14'),
(3, 'Customer', 'زبون', '', 1, NULL, '2019-03-14 03:18:34', '2019-03-14 03:18:34');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_addresses`
--

CREATE TABLE `shipping_addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pincode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landmark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_type` enum('home','office') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'home' COMMENT 'home = Home , office = Office/Commercial',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_addresses`
--

INSERT INTO `shipping_addresses` (`id`, `user_id`, `first_name`, `last_name`, `mobile_number`, `pincode`, `address`, `area`, `landmark`, `city`, `state`, `address_type`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 'kandarp', NULL, '94279860910', '383315', 'faredi', 'arweafa', 'sdfsdf', 'ASDFSLDJ', 'GUJARAT', 'home', NULL, NULL, '2019-03-14 06:02:42', '2019-03-26 04:33:18', '2019-03-26 04:33:18'),
(2, 3, 'dfgsdfsdf', NULL, 'sdfsf', 'sdf', 'sdfsdf', 'sdfsdf', 'sdf', 'fsdfsdf', 'sdfsdf', 'home', NULL, NULL, '2019-03-26 04:33:32', '2019-03-26 04:34:38', '2019-03-26 04:34:38'),
(3, 3, 'sdfsdfsdf', NULL, '9427986091', 'fghgfh', 'sdfs', 'dfsdfdsf', 'sdfsdf', 'fsdf', 'sdfsdfsd', 'home', NULL, NULL, '2019-03-26 04:34:35', '2019-03-26 04:34:40', '2019-03-26 04:34:40'),
(4, 3, 'Kandarp', NULL, '9427986091', '383345', 'faredi', 'modasa', 'Sadguru Landmark', 'Ahmedabad', 'Gujarat', 'home', NULL, NULL, '2019-03-26 04:35:26', '2019-03-26 04:36:04', '2019-03-26 04:36:04'),
(5, 3, 'Kandarp', 'test', '9427986091', '383345', 'faredi', 'modasa', 'Alabama', 'Ahmedabad', '1', 'office', NULL, NULL, '2019-03-26 04:36:19', '2019-04-02 04:07:14', NULL),
(6, 3, 'Chetan', 'Trivedi', '9427986091', '0007', 'ghandhinagar', 'Ahmedabad', 'NY', 'Ahmedabad', 'NY', 'home', NULL, NULL, '2019-03-26 04:42:27', '2019-03-26 04:48:57', NULL),
(7, 3, 'Dhruv', 'PaTel', '9427986091', '383345', 'faredi', 'modasa', 'State', 'Ranip', 'State', 'home', NULL, NULL, '2019-03-26 04:43:36', '2019-03-28 07:29:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(10) UNSIGNED NOT NULL,
  `slider_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider_image_arabic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider_order` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider_option` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '0 = Inactive and 1 = Active',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `slider_image`, `slider_image_arabic`, `slider_order`, `slider_option`, `options`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '/uploads/Slider/knotel-hero-animation_1554876990.gif', '/uploads/Slider/source_1554876990.gif', NULL, 'category', '1', '1', 1, NULL, '2019-04-10 00:46:30', '2019-04-10 00:46:30', NULL),
(2, '/uploads/Slider/c36aee61688873_1554880233.gif', '/uploads/Slider/ar_banner-01Emaar_1554880233.gif', NULL, 'product', '4', '1', 1, NULL, '2019-04-10 01:40:33', '2019-04-10 01:40:33', NULL),
(3, '/uploads/Slider/slider1_1554880729.jpg', '/uploads/Slider/slider2_1554880729.jpg', NULL, 'category', '1', '1', 1, NULL, '2019-04-10 01:48:49', '2019-04-10 01:48:49', NULL),
(4, '/uploads/Slider/780553_1554888958.jpg', '/uploads/Slider/887165_1554888958.jpg', NULL, 'category', '2', '1', 1, NULL, '2019-04-10 04:05:58', '2019-04-10 04:05:58', NULL),
(5, '/uploads/Slider/almonds_and_nuts_191544_1554890445.jpg', '/uploads/Slider/ar_banner-02_1554890445.jpg', NULL, 'product', '2', '1', 1, NULL, '2019-04-10 04:30:45', '2019-04-10 04:30:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `s_m_s_templates`
--

CREATE TABLE `s_m_s_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_body` longtext COLLATE utf8mb4_unicode_ci,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '1 = active , 0 = in_active',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `s_m_s_templates`
--

INSERT INTO `s_m_s_templates` (`id`, `name`, `sms_body`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'test', 'test', '0', 1, NULL, '2019-03-19 02:02:28', '2019-03-19 02:04:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `tax_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_name_arabic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_rate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_description_arabic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '0 = Inactive and 1 = Active',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `tax_name`, `tax_name_arabic`, `tax_rate`, `tax_description`, `tax_description_arabic`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Service Tax', 'ضريبة الخدمة', '10', 'Service tax', 'Service tax', '1', 1, NULL, '2019-03-14 03:21:56', '2019-04-05 06:16:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name_arabic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name_arabic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `country_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '0 = Inactive and 1 = Active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `first_name_arabic`, `last_name`, `last_name_arabic`, `email`, `mobile_number`, `email_verified_at`, `password`, `role_id`, `country_code`, `api_token`, `ip`, `status`, `remember_token`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', NULL, '', NULL, 'admin@admin.com', NULL, NULL, '$2y$10$ZtbLEn3UFhZM2yHiCOQ8tu80xKsLiDiUAqKx0yM/.5wZdoeTlydU.', 1, NULL, '1J1z8QAESgxKU1zdfKJRQvi5hwVaPo0QShWsu5O0Ko84hOpDKb8yPmHWqHQC', NULL, '1', 'C1wA2Cilg6fQ9YTPpnOLKJV0IxtOYeDc5iYfemIFuTgVebbpdyAYiszSDDML', NULL, NULL, NULL, NULL, NULL),
(2, 'Kandarp', NULL, 'Pandya', NULL, 'kandarp.d9ithub@gmail.com', '9427986091', NULL, '$2y$10$6PD9XIFGpr8yuo/8wAdANOGgfmnj3MhaO9SKROzhdmikkjUts8MA2', 3, '971', '5gqKKFn3RQ0V8ahJ8eAPYYlqTJ309GUy1rBSJEqwjyEN6tkMY0CX0zgYnyTx', NULL, '1', 'PYJ1oBZDA28nuf8wi3CekyqU3m6wGl4dyFzNjEHFyUkOR8I7L5T2QgCqZcCz', NULL, NULL, '2019-03-14 05:08:31', '2019-04-05 01:36:11', NULL),
(3, 'Kandarp', NULL, 'Pandya', NULL, 'kandarp.d9ithub+1@gmail.com', '9427986091', NULL, '$2y$10$AtZmsRmKI4hyXN9cdxs2n.8M6CIUEraSkGsB4P8BOBBGJJyhCi6Y.', 3, '971', 'gEO4Z3vWPp0JoskBKbZso6catLBO4VJlfhFkmctZGncV6cjRB7XxTIx3m2pA', NULL, '1', NULL, NULL, NULL, '2019-03-14 05:10:03', '2019-04-04 00:37:37', NULL),
(4, 'DV', NULL, 'Vaghela', NULL, 'dv@gmail.com', '9876543210', NULL, '$2y$10$/AWxfvrjLN680iB8QrLtmOzNgq5dGgB9Ov.sNNLMu1A9iYzrg37Ei', 3, '971', 'JtS8UKdfIJpKWCeBL5JwhNvEedrBshT4berTqBBJvZsM1YXHh95Sc98zsqLH', NULL, '1', NULL, NULL, NULL, '2019-03-29 07:23:12', '2019-03-29 07:23:12', NULL),
(5, 'sds', NULL, 'sdasd', NULL, 'dv1@gmail.com', '345345345345', NULL, '$2y$10$eq.2HSzc6BslD9xyPPumhe/vafNJb47yapholTLdCK5JbAaMFSd16', 3, '971', 'JHKx5vXJxvIH7A6KeX5iz8pbzIxqyF9Z8B6PC1VABuRySqqoLcQaekktjWBe', NULL, '1', NULL, NULL, NULL, '2019-03-29 07:25:51', '2019-03-29 07:25:51', NULL),
(6, 'Asad', NULL, 'Govani', NULL, 'asadaligovani@gmail.com', '9714331436', NULL, '$2y$10$efikGaMDUaO8f2ax0qIwQetZDdGpVFVr.WmVIAHL/F.1asBFRBJwO', 3, '91', 'MXiycpjZjwnZtAEk0tiJMEbFxDrDwhZTj8VMslYlpfrytEuXhGSEII5hFhHv', NULL, '1', NULL, NULL, NULL, '2019-04-02 01:57:49', '2019-04-02 01:57:49', NULL),
(7, 'Asad', NULL, 'Govani', NULL, 'asadaligovani+1@gmail.com', '9714331436', NULL, '$2y$10$f7uydbl50SHIUDDn2jL74OXHUqchbr2.G0ULjos3iBx9ykc/e3aYm', 3, '91', 'RVHzagVNSBxpApczHvwxpTLAGPUxvb9WTSWHL838YLh3ubp8TjPQSO8ENqOq', NULL, '1', NULL, NULL, NULL, '2019-04-07 23:48:59', '2019-04-07 23:48:59', NULL),
(8, 'sandeep', 'sandip araqbic', 'Singh', 'Singh arabic', 'sandeep.d9ithub@gmail.com', '9876543210', NULL, '$2y$10$aC.9gVd1XVW/F2BVx6B/4eTNjjnbCYfWid5LAMMCxEFEN0Y/3lg8y', 2, '966', 'B4kTXPmS3w5ba86Sqt8OVyuAsU453CugFGZ299WifL1tlYmaA7JfNvVEyqMg', NULL, '1', 'kn9jqlgDm4M5FU540UlQenxNaUu1bRO9oI2GyjJ6DLITR70poW8pYQpBVJmv', 1, NULL, '2019-04-09 04:09:12', '2019-04-09 04:09:12', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `cache_key_unique` (`key`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_product_child_id_foreign` (`product_child_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `child_attributes`
--
ALTER TABLE `child_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `child_attributes_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `child_products`
--
ALTER TABLE `child_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `child_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_address_id_foreign` (`shipping_address_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_product_child_id_foreign` (`product_child_id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `product_specifications`
--
ALTER TABLE `product_specifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_specifications_product_id_foreign` (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipping_addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `s_m_s_templates`
--
ALTER TABLE `s_m_s_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `child_attributes`
--
ALTER TABLE `child_attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `child_products`
--
ALTER TABLE `child_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product_specifications`
--
ALTER TABLE `product_specifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `s_m_s_templates`
--
ALTER TABLE `s_m_s_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_child_id_foreign` FOREIGN KEY (`product_child_id`) REFERENCES `child_products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `child_attributes`
--
ALTER TABLE `child_attributes`
  ADD CONSTRAINT `child_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `child_products`
--
ALTER TABLE `child_products`
  ADD CONSTRAINT `child_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_address_id_foreign` FOREIGN KEY (`shipping_address_id`) REFERENCES `shipping_addresses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_product_child_id_foreign` FOREIGN KEY (`product_child_id`) REFERENCES `child_products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_specifications`
--
ALTER TABLE `product_specifications`
  ADD CONSTRAINT `product_specifications_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD CONSTRAINT `shipping_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

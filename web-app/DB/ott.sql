-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 04, 2021 at 10:48 AM
-- Server version: 10.4.15-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u578272534_ott`
--

-- --------------------------------------------------------

--
-- Table structure for table `giftvoucher`
--

CREATE TABLE `giftvoucher` (
  `id` int(11) NOT NULL,
  `userid` int(255) DEFAULT NULL,
  `days` int(255) NOT NULL DEFAULT 0,
  `vouchercode` varchar(255) DEFAULT NULL,
  `status` int(255) NOT NULL DEFAULT 0,
  `log_entdate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `giftvoucher`
--

INSERT INTO `giftvoucher` (`id`, `userid`, `days`, `vouchercode`, `status`, `log_entdate`) VALUES
(1, NULL, 10, 'KEDZYDZG', 0, '2020-10-05 08:47:57'),
(2, 4, 12, 'PGVXJCAP', 1, '2020-10-05 10:59:19');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(100) NOT NULL,
  `title` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `msg` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `image` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `videoid` varchar(250) DEFAULT NULL,
  `url` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `log_entdate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `title`, `msg`, `image`, `videoid`, `url`, `log_entdate`) VALUES
(1, 'open new', 'test', '47134_avenger_entry.PNG', '10', '', '2020-10-20 01:54:50'),
(2, 'open new', 'test', NULL, '0', '', '2020-10-20 01:56:01');

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `planid` int(100) NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `maintopbannerimg` varchar(250) DEFAULT NULL,
  `iconimg` varchar(250) DEFAULT NULL,
  `price` int(255) DEFAULT 0,
  `days` int(255) DEFAULT 0,
  `status` varchar(10) NOT NULL DEFAULT 'Y',
  `log_entdate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`planid`, `name`, `maintopbannerimg`, `iconimg`, `price`, `days`, `status`, `log_entdate`) VALUES
(8, 'Platinum plan', NULL, NULL, 500, 365, 'Y', '2020-02-03 08:36:52'),
(2, 'Gold plan', '2month.jpg', '2monthicon.jpg', 100, 60, 'Y', '2019-05-18 08:57:12'),
(1, 'Silver plan', '1month.jpg', '1monthicon.jpg', 50, 30, 'Y', '2019-05-18 08:57:12'),
(15, 'todayss Deal', NULL, NULL, 100, 30, 'Y', '2020-10-19 14:22:20'),
(16, 'Deal for the day', NULL, NULL, 100, 90, 'Y', '2020-10-19 14:22:58');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `username`, `password`, `email`, `image`) VALUES
(1, 'admin', 'MTIzNDU2', 'ott@gmail.com', 'profile.png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `cid` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_image` varchar(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`cid`, `category_name`, `category_image`, `status`) VALUES
(1, 'Live Class', '17484_live_class_soft.jpg', 1),
(2, 'Entertainment', '28666_pwa_icon.png', 1),
(3, 'Movies', '95808_foodpanda.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comments`
--

CREATE TABLE `tbl_comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `comment_text` text NOT NULL,
  `dt_rate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment`
--

CREATE TABLE `tbl_payment` (
  `trnid` int(255) NOT NULL,
  `userid` int(255) NOT NULL,
  `amount` int(255) NOT NULL,
  `type` int(255) NOT NULL,
  `mode` varchar(100) DEFAULT NULL,
  `planid` int(100) NOT NULL,
  `planname` varchar(250) DEFAULT NULL,
  `plandays` int(100) NOT NULL,
  `paytmnumber` varchar(100) DEFAULT NULL,
  `instaorderid` varchar(250) DEFAULT NULL,
  `instatxnid` varchar(250) DEFAULT NULL,
  `instapaymentid` varchar(250) DEFAULT NULL,
  `instatoken` varchar(250) DEFAULT NULL,
  `status` varchar(250) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `log_entdate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_payment`
--

INSERT INTO `tbl_payment` (`trnid`, `userid`, `amount`, `type`, `mode`, `planid`, `planname`, `plandays`, `paytmnumber`, `instaorderid`, `instatxnid`, `instapaymentid`, `instatoken`, `status`, `log_entdate`) VALUES
(1, 4, 0, 1, 'GiftVoucher', 0, 'GiftVoucher', 12, NULL, NULL, NULL, NULL, NULL, 'GiftVoucher: PGVXJCAP', '2020-10-19 20:12:12');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rating`
--

CREATE TABLE `tbl_rating` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `rate` int(11) NOT NULL,
  `dt_rate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_settings`
--

CREATE TABLE `tbl_settings` (
  `id` int(11) NOT NULL,
  `email_from` varchar(255) NOT NULL,
  `onesignal_app_id` text NOT NULL,
  `onesignal_rest_key` text NOT NULL,
  `app_name` varchar(255) NOT NULL,
  `app_logo` varchar(255) NOT NULL,
  `app_email` varchar(255) NOT NULL,
  `app_version` varchar(255) NOT NULL,
  `app_author` varchar(255) NOT NULL,
  `app_contact` varchar(255) NOT NULL,
  `app_website` varchar(255) NOT NULL,
  `app_description` text NOT NULL,
  `app_developed_by` varchar(255) NOT NULL,
  `app_privacy_policy` text NOT NULL,
  `api_all_order_by` varchar(255) NOT NULL,
  `api_latest_limit` int(3) NOT NULL,
  `api_cat_order_by` varchar(255) NOT NULL,
  `api_cat_post_order_by` varchar(255) NOT NULL,
  `publisher_id` text NOT NULL,
  `interstital_ad` text NOT NULL,
  `interstital_ad_id` text NOT NULL,
  `interstital_ad_click` varchar(255) NOT NULL,
  `banner_ad` text NOT NULL,
  `banner_ad_id` text NOT NULL,
  `publisher_id_ios` varchar(500) NOT NULL,
  `app_id_ios` varchar(500) NOT NULL,
  `interstital_ad_ios` varchar(500) NOT NULL,
  `interstital_ad_id_ios` varchar(500) NOT NULL,
  `interstital_ad_click_ios` varchar(500) NOT NULL,
  `banner_ad_ios` varchar(500) NOT NULL,
  `banner_ad_id_ios` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_settings`
--

INSERT INTO `tbl_settings` (`id`, `email_from`, `onesignal_app_id`, `onesignal_rest_key`, `app_name`, `app_logo`, `app_email`, `app_version`, `app_author`, `app_contact`, `app_website`, `app_description`, `app_developed_by`, `app_privacy_policy`, `api_all_order_by`, `api_latest_limit`, `api_cat_order_by`, `api_cat_post_order_by`, `publisher_id`, `interstital_ad`, `interstital_ad_id`, `interstital_ad_click`, `banner_ad`, `banner_ad_id`, `publisher_id_ios`, `app_id_ios`, `interstital_ad_ios`, `interstital_ad_id_ios`, `interstital_ad_click_ios`, `banner_ad_ios`, `banner_ad_id_ios`) VALUES
(1, 'ott@gmail.com', 'cd6a92d4-12c9-4692-bc90-3397c652e77739', 'M2YYY1OTA1NzItODk4Yi00MTk5LWJkOTItZDMwODQyZTg4OTIx', 'OTT App', '18258_ply.png', 'krtechhelp@gmail.com', '1.0.0', 'Krishanu Debnath', '+91 9774451827 ', 'https://krtech.in/', '<p>This Application is best application for Video, User can play their favourite videos through applications.</p>', 'KR Tech', '<p><strong>Privacy Policy</strong></p>\r\n', 'ASC', 15, 'category_name', 'DESC', '', 'true', '', '1', 'true', '', '', '', 'false', '', '5', 'false', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `giftvoucher`
--
ALTER TABLE `giftvoucher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`planid`);

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `tbl_comments`
--
ALTER TABLE `tbl_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  ADD PRIMARY KEY (`trnid`);

--
-- Indexes for table `tbl_rating`
--
ALTER TABLE `tbl_rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `giftvoucher`
--
ALTER TABLE `giftvoucher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `planid` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_comments`
--
ALTER TABLE `tbl_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  MODIFY `trnid` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_rating`
--
ALTER TABLE `tbl_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

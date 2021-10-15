-- phpMyAdmin SQL Dump
-- version 4.2.7
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: May 18, 2016 at 11:07 PM
-- Server version: 5.5.41-log
-- PHP Version: 7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gritcms`
--

-- --------------------------------------------------------

--
-- Table structure for table `caches`
--

CREATE TABLE IF NOT EXISTS `caches` (
  `hash_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
`commnet_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `node_id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `time` int(11) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `author_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `author_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `author_url` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `author_ip` varchar(40) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE IF NOT EXISTS `config` (
`config_id` int(11) NOT NULL,
  `key` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `autoload` tinyint(1) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`config_id`, `key`, `value`, `type`, `autoload`) VALUES
(1, 'site_name', 'Site name', 'core', 1),
(2, 'site_description', 'Site description', 'core', 1),
(3, 'theme', 'default', 'core', 1),
(4, 'timezone', 'UTC', 'core', 1),
(5, 'date_format', '', 'core', 1),
(6, 'time_format', '', 'core', 1),
(7, 'multi_language', 'en|cn', 'core', 1);

-- --------------------------------------------------------

--
-- Table structure for table `nodes`
--

CREATE TABLE IF NOT EXISTS `nodes` (
`node_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `url_alias` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_time` int(11) NOT NULL,
  `modified_time` int(11) NOT NULL,
  `node_status` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `comment_status` tinyint(1) NOT NULL,
  `order` int(4) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `nodes`
--

INSERT INTO `nodes` (`node_id`, `parent_id`, `user_id`, `type`, `url_alias`, `title`, `content`, `language`, `created_time`, `modified_time`, `node_status`, `comment_status`, `order`) VALUES
(1, 0, 1, 'page', 'test-page', 'test page', 'page content', '', 2016, 0, 'publish', 0, 0),
(2, 0, 1, 'post', 'test-post', 'post title', 'content', '', 2016, 0, 'draft', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `nodes_meta`
--

CREATE TABLE IF NOT EXISTS `nodes_meta` (
`nodemeta_id` int(11) NOT NULL,
  `node_id` int(11) NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE IF NOT EXISTS `terms` (
`term_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `url_alias` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`user_id` int(11) NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `registered_time` int(11) NOT NULL,
  `latest_login_time` int(11) NOT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `caches`
--
ALTER TABLE `caches`
 ADD PRIMARY KEY (`hash_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
 ADD PRIMARY KEY (`commnet_id`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
 ADD PRIMARY KEY (`config_id`), ADD UNIQUE KEY `config_key` (`key`);

--
-- Indexes for table `nodes`
--
ALTER TABLE `nodes`
 ADD PRIMARY KEY (`node_id`), ADD KEY `url_alias` (`url_alias`), ADD KEY `url_alias_2` (`url_alias`), ADD KEY `url_alias_3` (`url_alias`), ADD KEY `language` (`language`);

--
-- Indexes for table `nodes_meta`
--
ALTER TABLE `nodes_meta`
 ADD PRIMARY KEY (`nodemeta_id`), ADD KEY `node_id` (`node_id`);

--
-- Indexes for table `terms`
--
ALTER TABLE `terms`
 ADD PRIMARY KEY (`term_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`user_id`), ADD UNIQUE KEY `username` (`username`,`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
MODIFY `commnet_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `config`
--
ALTER TABLE `config`
MODIFY `config_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `nodes`
--
ALTER TABLE `nodes`
MODIFY `node_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `nodes_meta`
--
ALTER TABLE `nodes_meta`
MODIFY `nodemeta_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `terms`
--
ALTER TABLE `terms`
MODIFY `term_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

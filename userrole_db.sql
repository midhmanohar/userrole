-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 02, 2020 at 10:10 PM
-- Server version: 5.7.31-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `userrole_db`
--

--
-- Dumping data for table `Module`
--

INSERT INTO `Module` (`module_id`, `module_name`) VALUES
(1, 'module1'),
(2, 'module2');

--
-- Dumping data for table `Role`
--

INSERT INTO `Role` (`role_id`, `role_name`) VALUES
(1, 'Manager'),
(2, 'Admin'),
(3, 'User');

--
-- Dumping data for table `roletomodule`
--

INSERT INTO `roletomodule` (`role_id`, `module_id`) VALUES
(1, 2),
(2, 1);

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`user_id`, `username`, `password`, `first_name`, `last_name`) VALUES
(1, 'admin', '123456', 'admin', 'admin'),
(2, 'user1', '123456', 'user1first', 'user1last'),
(3, 'user2', '123456', 'user2first', 'user2last');

--
-- Dumping data for table `usertorole`
--

INSERT INTO `usertorole` (`user_id`, `role_id`) VALUES
(1, 2),
(2, 3);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

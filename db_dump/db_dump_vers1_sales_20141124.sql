-- phpMyAdmin SQL Dump
-- version 4.2.0
-- http://www.phpmyadmin.net
--
-- Värd: localhost
-- Tid vid skapande: 24 nov 2014 kl 11:31
-- Serverversion: 5.6.17
-- PHP-version: 5.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databas: `Bookstore`
--

-- --------------------------------------------------------

--
-- Tabellstruktur `sales`
--

CREATE TABLE IF NOT EXISTS `sales` (
  `isbn` bigint(15) NOT NULL,
  `sales_price` int(11) DEFAULT NULL,
  `selling_quantity` int(11) DEFAULT NULL,
  `selling_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `sales`
--
ALTER TABLE `sales`
 ADD PRIMARY KEY (`isbn`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

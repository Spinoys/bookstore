-- phpMyAdmin SQL Dump
-- version 4.2.0
-- http://www.phpmyadmin.net
--
-- Värd: localhost
-- Tid vid skapande: 24 nov 2014 kl 11:03
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
-- Tabellstruktur `purchased`
--

CREATE TABLE IF NOT EXISTS `purchased` (
  `isbn` bigint(15) NOT NULL,
  `purchase_price` int(11) DEFAULT NULL,
  `delivered_quantity` int(11) DEFAULT NULL,
  `delivery_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `bookcase` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `purchased`
--

INSERT INTO `purchased` (`isbn`, `purchase_price`, `delivered_quantity`, `delivery_date`, `bookcase`) VALUES
(2147483647, 100, 50, '2014-11-23 23:00:00', 'H4'),
(9136014683, 74, 20, '2014-11-14 14:05:47', 'B3'),
(9150104004, 120, 75, '2014-10-01 10:50:33', 'B2');

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `purchased`
--
ALTER TABLE `purchased`
 ADD PRIMARY KEY (`isbn`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

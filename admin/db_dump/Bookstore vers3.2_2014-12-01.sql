-- phpMyAdmin SQL Dump
-- version 4.2.8
-- http://www.phpmyadmin.net
--
-- Värd: localhost
-- Tid vid skapande: 01 dec 2014 kl 12:34
-- Serverversion: 5.6.20
-- PHP-version: 5.3.29

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
-- Tabellstruktur `author`
--

CREATE TABLE IF NOT EXISTS `author` (
`id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `author`
--

INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES
(1, 'Tove', 'Jansson'),
(2, 'John', 'Myers Myers'),
(3, 'Jan', 'Fredlund');

-- --------------------------------------------------------

--
-- Tabellstruktur `book_item`
--

CREATE TABLE IF NOT EXISTS `book_item` (
  `isbn` bigint(15) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `book_author_id` int(11) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `book_item`
--

INSERT INTO `book_item` (`isbn`, `title`, `book_author_id`, `description`) VALUES
(9100451924, 'Harpan och svärdet', 2, ''),
(9136014613, 'Mattor med ränder och rutor', 3, ''),
(9150104004, 'Hur gick det sen?', 1, '');

-- --------------------------------------------------------

--
-- Tabellstruktur `price_history`
--

CREATE TABLE IF NOT EXISTS `price_history` (
`s_price_id` int(11) NOT NULL,
  `isbn` bigint(15) DEFAULT NULL,
  `sell_price` decimal(5,2) DEFAULT NULL,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellstruktur `purchased`
--

CREATE TABLE IF NOT EXISTS `purchased` (
`purchase_id` int(11) NOT NULL,
  `isbn` bigint(15) DEFAULT NULL,
  `delivered_quantity` int(11) DEFAULT NULL,
  `delivery_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `purchase_price` decimal(5,2) DEFAULT NULL,
  `shelf` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `purchased`
--

INSERT INTO `purchased` (`purchase_id`, `isbn`, `delivered_quantity`, `delivery_date`, `purchase_price`, `shelf`) VALUES
(1, 9136014613, 50, '2014-11-27 13:43:47', '75.00', 'B3'),
(2, 9100451924, 20, '2014-11-27 13:44:53', '100.00', 'H4'),
(3, 9150104004, 75, '2014-11-27 13:44:53', '120.00', 'B2'),
(4, 3765487612343, 5, '2014-11-30 03:40:02', '100.00', 'A1');

-- --------------------------------------------------------

--
-- Tabellstruktur `sales`
--

CREATE TABLE IF NOT EXISTS `sales` (
`sales_id` int(11) NOT NULL,
  `isbn` bigint(15) DEFAULT NULL,
  `sales_quantity` int(11) DEFAULT NULL,
  `selling_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `author`
--
ALTER TABLE `author`
 ADD PRIMARY KEY (`id`), ADD KEY `last_name` (`last_name`);

--
-- Index för tabell `book_item`
--
ALTER TABLE `book_item`
 ADD PRIMARY KEY (`isbn`);

--
-- Index för tabell `price_history`
--
ALTER TABLE `price_history`
 ADD PRIMARY KEY (`s_price_id`);

--
-- Index för tabell `purchased`
--
ALTER TABLE `purchased`
 ADD PRIMARY KEY (`purchase_id`);

--
-- Index för tabell `sales`
--
ALTER TABLE `sales`
 ADD PRIMARY KEY (`sales_id`);

--
-- AUTO_INCREMENT för dumpade tabeller
--

--
-- AUTO_INCREMENT för tabell `author`
--
ALTER TABLE `author`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT för tabell `price_history`
--
ALTER TABLE `price_history`
MODIFY `s_price_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT för tabell `purchased`
--
ALTER TABLE `purchased`
MODIFY `purchase_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT för tabell `sales`
--
ALTER TABLE `sales`
MODIFY `sales_id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

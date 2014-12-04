-- phpMyAdmin SQL Dump
-- version 4.2.8
-- http://www.phpmyadmin.net
--
-- Värd: localhost
-- Tid vid skapande: 04 dec 2014 kl 19:54
-- Serverversion: 5.6.20
-- PHP-version: 5.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databas: `bookstore`
--

-- --------------------------------------------------------

--
-- Tabellstruktur `author`
--

CREATE TABLE IF NOT EXISTS `author` (
`id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `author`
--

INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES
(1, 'Tove', 'Jansson'),
(2, 'John', 'Myers Myers'),
(3, 'Jan', 'Fredlund'),
(4, 'Conn', 'Iggulden');

-- --------------------------------------------------------

--
-- Ersättningsstruktur för vy `booktitle_and_author`
--
CREATE TABLE IF NOT EXISTS `booktitle_and_author` (
`isbn` bigint(15)
,`title` varchar(255)
,`author_first_name` varchar(50)
,`author_last_name` varchar(50)
,`description` text
);
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
(9150104004, 'Hur gick det sen?', 1, ''),
(9789100139728, 'Rosornas krig. Första boken, Stormfågel', 4, 'levknfkjb hhiöb kjbkj bbh '),
(9789113056227, 'Arbeta och älska', 1, 'bjqefbwegjwbnlehjkhfkw   -lksehvfjkweb  sdfkhc bjsbfjzd  ');

-- --------------------------------------------------------

--
-- Ersättningsstruktur för vy `current_stock`
--
CREATE TABLE IF NOT EXISTS `current_stock` (
`isbn` bigint(15)
,`purchased` decimal(32,0)
,`sold` decimal(32,0)
,`current_stock` decimal(33,0)
);
-- --------------------------------------------------------

--
-- Ersättningsstruktur för vy `current_stock_extended`
--
CREATE TABLE IF NOT EXISTS `current_stock_extended` (
`isbn` bigint(15)
,`purchased` decimal(32,0)
,`sold` decimal(32,0)
,`current_stock` decimal(33,0)
,`title` varchar(255)
,`author_first_name` varchar(50)
,`author_last_name` varchar(50)
,`description` text
);
-- --------------------------------------------------------

--
-- Tabellstruktur `price_history`
--

CREATE TABLE IF NOT EXISTS `price_history` (
`s_price_id` int(11) NOT NULL,
  `isbn` bigint(15) DEFAULT NULL,
  `sell_price` decimal(5,2) DEFAULT NULL,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `price_history`
--

INSERT INTO `price_history` (`s_price_id`, `isbn`, `sell_price`, `change_date`) VALUES
(1, 9789113056227, '243.00', '2014-12-04 11:48:01'),
(2, 9789113056227, '279.00', '2014-12-04 11:49:49'),
(3, 9100451924, '135.00', '2014-12-04 11:52:53'),
(4, 9789100139728, '387.00', '2014-12-04 11:55:28');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `purchased`
--

INSERT INTO `purchased` (`purchase_id`, `isbn`, `delivered_quantity`, `delivery_date`, `purchase_price`, `shelf`) VALUES
(1, 9136014613, 50, '2014-11-27 13:43:47', '75.00', 'B3'),
(2, 9100451924, 20, '2014-11-27 13:44:53', '100.00', 'H4'),
(3, 9150104004, 75, '2014-11-27 13:44:53', '120.00', 'B2'),
(4, 3765487612343, 5, '2014-11-30 03:40:02', '100.00', 'A1'),
(5, 9789113056227, 50, '2014-12-04 11:48:01', '135.00', 'b2'),
(6, 9789113056227, 20, '2014-12-04 11:49:49', '155.00', 'b3'),
(7, 9100451924, 15, '2014-12-04 11:52:53', '75.00', 'C2'),
(8, 9789100139728, 100, '2014-12-04 11:55:27', '215.00', 'A1');

-- --------------------------------------------------------

--
-- Ersättningsstruktur för vy `purchased_sold`
--
CREATE TABLE IF NOT EXISTS `purchased_sold` (
`isbn` bigint(15)
,`purchased` decimal(32,0)
,`sold` decimal(32,0)
);
-- --------------------------------------------------------

--
-- Ersättningsstruktur för vy `purchase_expense`
--
CREATE TABLE IF NOT EXISTS `purchase_expense` (
`purchase_id` int(11)
,`isbn` bigint(15)
,`delivered_quantity` int(11)
,`delivery_date` timestamp
,`purchase_price` decimal(5,2)
,`shelf` varchar(255)
,`expense` decimal(15,2)
);
-- --------------------------------------------------------

--
-- Ersättningsstruktur för vy `purchase_summed`
--
CREATE TABLE IF NOT EXISTS `purchase_summed` (
`purchase_id` int(11)
,`isbn` bigint(15)
,`delivered_quantity` int(11)
,`delivery_date` timestamp
,`purchase_price` decimal(5,2)
,`shelf` varchar(255)
,`expense` decimal(15,2)
,`sum_quantity` decimal(32,0)
,`accumulated_cost` decimal(37,2)
);
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

-- --------------------------------------------------------

--
-- Struktur för vy `booktitle_and_author`
--
DROP TABLE IF EXISTS `booktitle_and_author`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `booktitle_and_author` AS select `book_item`.`isbn` AS `isbn`,`book_item`.`title` AS `title`,`author`.`first_name` AS `author_first_name`,`author`.`last_name` AS `author_last_name`,`book_item`.`description` AS `description` from (`book_item` join `author`) where (`book_item`.`book_author_id` = `author`.`id`);

-- --------------------------------------------------------

--
-- Struktur för vy `current_stock`
--
DROP TABLE IF EXISTS `current_stock`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `current_stock` AS select `purchased_sold`.`isbn` AS `isbn`,`purchased_sold`.`purchased` AS `purchased`,`purchased_sold`.`sold` AS `sold`,(`purchased_sold`.`purchased` - `purchased_sold`.`sold`) AS `current_stock` from `purchased_sold`;

-- --------------------------------------------------------

--
-- Struktur för vy `current_stock_extended`
--
DROP TABLE IF EXISTS `current_stock_extended`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `current_stock_extended` AS select `current_stock`.`isbn` AS `isbn`,`current_stock`.`purchased` AS `purchased`,`current_stock`.`sold` AS `sold`,`current_stock`.`current_stock` AS `current_stock`,`booktitle_and_author`.`title` AS `title`,`booktitle_and_author`.`author_first_name` AS `author_first_name`,`booktitle_and_author`.`author_last_name` AS `author_last_name`,`booktitle_and_author`.`description` AS `description` from (`current_stock` join `booktitle_and_author` on((`current_stock`.`isbn` = `booktitle_and_author`.`isbn`)));

-- --------------------------------------------------------

--
-- Struktur för vy `purchased_sold`
--
DROP TABLE IF EXISTS `purchased_sold`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `purchased_sold` AS select `book_item`.`isbn` AS `isbn`,(select sum(`purchased`.`delivered_quantity`) from `purchased` where (`purchased`.`isbn` = `book_item`.`isbn`)) AS `purchased`,(select sum(`sales`.`sales_quantity`) from `sales` where (`sales`.`isbn` = `book_item`.`isbn`)) AS `sold` from `book_item`;

-- --------------------------------------------------------

--
-- Struktur för vy `purchase_expense`
--
DROP TABLE IF EXISTS `purchase_expense`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `purchase_expense` AS select `purchased`.`purchase_id` AS `purchase_id`,`purchased`.`isbn` AS `isbn`,`purchased`.`delivered_quantity` AS `delivered_quantity`,`purchased`.`delivery_date` AS `delivery_date`,`purchased`.`purchase_price` AS `purchase_price`,`purchased`.`shelf` AS `shelf`,(`purchased`.`purchase_price` * `purchased`.`delivered_quantity`) AS `expense` from `purchased`;

-- --------------------------------------------------------

--
-- Struktur för vy `purchase_summed`
--
DROP TABLE IF EXISTS `purchase_summed`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `purchase_summed` AS select `t`.`purchase_id` AS `purchase_id`,`t`.`isbn` AS `isbn`,`t`.`delivered_quantity` AS `delivered_quantity`,`t`.`delivery_date` AS `delivery_date`,`t`.`purchase_price` AS `purchase_price`,`t`.`shelf` AS `shelf`,`t`.`expense` AS `expense`,(select sum(`purchase_expense`.`delivered_quantity`) from `purchase_expense` where ((`purchase_expense`.`isbn` = `t`.`isbn`) and (`purchase_expense`.`delivery_date` <= `t`.`delivery_date`))) AS `sum_quantity`,(select sum(`purchase_expense`.`expense`) from `purchase_expense` where ((`purchase_expense`.`isbn` = `t`.`isbn`) and (`purchase_expense`.`delivery_date` <= `t`.`delivery_date`))) AS `accumulated_cost` from `purchase_expense` `t` order by `t`.`isbn`,`t`.`delivery_date`;

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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT för tabell `price_history`
--
ALTER TABLE `price_history`
MODIFY `s_price_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT för tabell `purchased`
--
ALTER TABLE `purchased`
MODIFY `purchase_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT för tabell `sales`
--
ALTER TABLE `sales`
MODIFY `sales_id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

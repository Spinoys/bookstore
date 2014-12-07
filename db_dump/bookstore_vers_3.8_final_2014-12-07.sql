-- phpMyAdmin SQL Dump
-- version 4.2.8
-- http://www.phpmyadmin.net
--
-- Värd: localhost
-- Tid vid skapande: 07 dec 2014 kl 19:20
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `author`
--

INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES
(1, 'Tove', 'Jansson'),
(2, 'John', 'Myers Myers'),
(3, 'Jan', 'Fredlund'),
(4, 'Conn', 'Iggulden'),
(5, '', '');

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
(0, '', 5, ''),
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
-- Ersättningsstruktur för vy `current_stock_extended_and_present_prices_with_vat`
--
CREATE TABLE IF NOT EXISTS `current_stock_extended_and_present_prices_with_vat` (
`isbn` bigint(15)
,`customer_price` decimal(5,2)
,`price_with_vat` decimal(7,2)
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
-- Ersättningsstruktur för vy `present_prices`
--
CREATE TABLE IF NOT EXISTS `present_prices` (
`isbn` bigint(15)
,`customer_price` decimal(5,2)
);
-- --------------------------------------------------------

--
-- Ersättningsstruktur för vy `present_prices_with_vat`
--
CREATE TABLE IF NOT EXISTS `present_prices_with_vat` (
`isbn` bigint(15)
,`customer_price` decimal(5,2)
,`price_with_vat` decimal(7,2)
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
-- Ersättningsstruktur för vy `purchase_avg_costs`
--
CREATE TABLE IF NOT EXISTS `purchase_avg_costs` (
`purchase_id` int(11)
,`isbn` bigint(15)
,`delivered_quantity` int(11)
,`delivery_date` timestamp
,`purchase_price` decimal(5,2)
,`shelf` varchar(255)
,`expense` decimal(15,2)
,`sum_quantity` decimal(32,0)
,`accumulated_cost` decimal(37,2)
,`avg_cost_per_book` decimal(41,6)
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
-- Tabellstruktur `report_selection`
--

CREATE TABLE IF NOT EXISTS `report_selection` (
  `isbn` bigint(15) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `sales`
--

CREATE TABLE IF NOT EXISTS `sales` (
`sales_id` int(11) NOT NULL,
  `isbn` bigint(15) DEFAULT NULL,
  `sales_quantity` int(11) DEFAULT NULL,
  `selling_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `sales`
--

INSERT INTO `sales` (`sales_id`, `isbn`, `sales_quantity`, `selling_date`) VALUES
(1, 9789113056227, 1, '2014-11-30 14:09:08'),
(2, 978910013972, 1, '2014-12-03 13:11:32'),
(3, 9100451924, 1, '2014-12-03 13:11:32'),
(4, 9789113056227, 1, '2014-12-07 11:12:40');

-- --------------------------------------------------------

--
-- Ersättningsstruktur för vy `sales_summed_vat_and_profits`
--
CREATE TABLE IF NOT EXISTS `sales_summed_vat_and_profits` (
`isbn` varchar(20)
,`quantity` decimal(32,0)
,`sales_excl_vat` decimal(27,2)
,`profits` decimal(65,2)
,`vat` decimal(29,2)
);
-- --------------------------------------------------------

--
-- Ersättningsstruktur för vy `sales_with_prices`
--
CREATE TABLE IF NOT EXISTS `sales_with_prices` (
`sales_id` int(11)
,`isbn` bigint(15)
,`sales_quantity` int(11)
,`selling_date` timestamp
,`selling_price` decimal(5,2)
,`avg_purchase_price` decimal(38,2)
);
-- --------------------------------------------------------

--
-- Ersättningsstruktur för vy `sales_with_vat_and_profits`
--
CREATE TABLE IF NOT EXISTS `sales_with_vat_and_profits` (
`sales_id` int(11)
,`isbn` bigint(15)
,`sales_quantity` int(11)
,`selling_date` timestamp
,`selling_price_incl_vat` decimal(7,2)
,`vat` decimal(7,2)
,`selling_price` decimal(5,2)
,`avg_purchase_price` decimal(38,2)
,`profit` decimal(49,2)
);
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
-- Struktur för vy `current_stock_extended_and_present_prices_with_vat`
--
DROP TABLE IF EXISTS `current_stock_extended_and_present_prices_with_vat`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `current_stock_extended_and_present_prices_with_vat` AS select `present_prices_with_vat`.`isbn` AS `isbn`,`present_prices_with_vat`.`customer_price` AS `customer_price`,`present_prices_with_vat`.`price_with_vat` AS `price_with_vat`,`current_stock_extended`.`purchased` AS `purchased`,`current_stock_extended`.`sold` AS `sold`,`current_stock_extended`.`current_stock` AS `current_stock`,`current_stock_extended`.`title` AS `title`,`current_stock_extended`.`author_first_name` AS `author_first_name`,`current_stock_extended`.`author_last_name` AS `author_last_name`,`current_stock_extended`.`description` AS `description` from (`present_prices_with_vat` join `current_stock_extended` on((`present_prices_with_vat`.`isbn` = `current_stock_extended`.`isbn`)));

-- --------------------------------------------------------

--
-- Struktur för vy `present_prices`
--
DROP TABLE IF EXISTS `present_prices`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `present_prices` AS select `book_item`.`isbn` AS `isbn`,(select `price_history`.`sell_price` from `price_history` where (`price_history`.`isbn` = `book_item`.`isbn`) order by `price_history`.`change_date` desc limit 1) AS `customer_price` from `book_item`;

-- --------------------------------------------------------

--
-- Struktur för vy `present_prices_with_vat`
--
DROP TABLE IF EXISTS `present_prices_with_vat`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `present_prices_with_vat` AS select `present_prices`.`isbn` AS `isbn`,`present_prices`.`customer_price` AS `customer_price`,round((`present_prices`.`customer_price` * 1.06),2) AS `price_with_vat` from `present_prices`;

-- --------------------------------------------------------

--
-- Struktur för vy `purchased_sold`
--
DROP TABLE IF EXISTS `purchased_sold`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `purchased_sold` AS select `book_item`.`isbn` AS `isbn`,(select sum(`purchased`.`delivered_quantity`) from `purchased` where (`purchased`.`isbn` = `book_item`.`isbn`)) AS `purchased`,(select sum(`sales`.`sales_quantity`) from `sales` where (`sales`.`isbn` = `book_item`.`isbn`)) AS `sold` from `book_item`;

-- --------------------------------------------------------

--
-- Struktur för vy `purchase_avg_costs`
--
DROP TABLE IF EXISTS `purchase_avg_costs`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `purchase_avg_costs` AS select `purchase_summed`.`purchase_id` AS `purchase_id`,`purchase_summed`.`isbn` AS `isbn`,`purchase_summed`.`delivered_quantity` AS `delivered_quantity`,`purchase_summed`.`delivery_date` AS `delivery_date`,`purchase_summed`.`purchase_price` AS `purchase_price`,`purchase_summed`.`shelf` AS `shelf`,`purchase_summed`.`expense` AS `expense`,`purchase_summed`.`sum_quantity` AS `sum_quantity`,`purchase_summed`.`accumulated_cost` AS `accumulated_cost`,(`purchase_summed`.`accumulated_cost` / `purchase_summed`.`sum_quantity`) AS `avg_cost_per_book` from `purchase_summed`;

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

-- --------------------------------------------------------

--
-- Struktur för vy `sales_summed_vat_and_profits`
--
DROP TABLE IF EXISTS `sales_summed_vat_and_profits`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sales_summed_vat_and_profits` AS select ifnull(`sales_with_vat_and_profits`.`isbn`,'TOTAL: ') AS `isbn`,sum(`sales_with_vat_and_profits`.`sales_quantity`) AS `quantity`,sum(`sales_with_vat_and_profits`.`selling_price`) AS `sales_excl_vat`,sum(`sales_with_vat_and_profits`.`profit`) AS `profits`,sum(`sales_with_vat_and_profits`.`vat`) AS `vat` from `sales_with_vat_and_profits` where ((`sales_with_vat_and_profits`.`selling_date` >= ifnull((select `report_selection`.`startdate` from `report_selection` limit 1),'0000-00-00')) and (`sales_with_vat_and_profits`.`selling_date` <= ifnull((select `report_selection`.`enddate` from `report_selection` limit 1),now())) and (`sales_with_vat_and_profits`.`isbn` = ifnull((select `report_selection`.`isbn` from `report_selection`),`sales_with_vat_and_profits`.`isbn`))) group by `sales_with_vat_and_profits`.`isbn` with rollup;

-- --------------------------------------------------------

--
-- Struktur för vy `sales_with_prices`
--
DROP TABLE IF EXISTS `sales_with_prices`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sales_with_prices` AS select `sales`.`sales_id` AS `sales_id`,`sales`.`isbn` AS `isbn`,`sales`.`sales_quantity` AS `sales_quantity`,`sales`.`selling_date` AS `selling_date`,(select `price_history`.`sell_price` from `price_history` where ((`price_history`.`isbn` = `sales`.`isbn`) and (`price_history`.`change_date` <= `sales`.`selling_date`)) order by `price_history`.`change_date` desc limit 1) AS `selling_price`,round((select `purchase_avg_costs`.`avg_cost_per_book` from `purchase_avg_costs` where ((`purchase_avg_costs`.`isbn` = `sales`.`isbn`) and (`purchase_avg_costs`.`delivery_date` <= `sales`.`selling_date`)) order by `purchase_avg_costs`.`delivery_date` desc limit 1),2) AS `avg_purchase_price` from `sales` order by `sales`.`isbn`;

-- --------------------------------------------------------

--
-- Struktur för vy `sales_with_vat_and_profits`
--
DROP TABLE IF EXISTS `sales_with_vat_and_profits`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sales_with_vat_and_profits` AS select `sales_with_prices`.`sales_id` AS `sales_id`,`sales_with_prices`.`isbn` AS `isbn`,`sales_with_prices`.`sales_quantity` AS `sales_quantity`,`sales_with_prices`.`selling_date` AS `selling_date`,round((`sales_with_prices`.`selling_price` * 1.06),2) AS `selling_price_incl_vat`,round((`sales_with_prices`.`selling_price` * 0.06),2) AS `vat`,`sales_with_prices`.`selling_price` AS `selling_price`,`sales_with_prices`.`avg_purchase_price` AS `avg_purchase_price`,((`sales_with_prices`.`selling_price` - `sales_with_prices`.`avg_purchase_price`) * `sales_with_prices`.`sales_quantity`) AS `profit` from `sales_with_prices`;

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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
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
MODIFY `sales_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

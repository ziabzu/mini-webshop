-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2017 at 01:55 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `iso_alpha` varchar(4) NOT NULL,
  `major` varchar(20) NOT NULL DEFAULT '1',
  `minor` varchar(10) NOT NULL,
  `symbol` varchar(3) NOT NULL,
  `locale_code` varchar(10) NOT NULL,
  `display_decimal` tinyint(2) NOT NULL,
  `pattern` varchar(10) NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `iso_alpha`, `major`, `minor`, `symbol`, `locale_code`, `display_decimal`, `pattern`, `active`) VALUES
(1, 'US Dollar', 'USD', 'dollar', 'cent', '$', 'en_US', 2, '#,###.##', b'1'),
(2, 'Euro', 'EUR', 'euro', 'cent', '€', 'da_DK', 2, '#,###.##', b'1'),
(3, 'Danish Krone', 'DKK', 'krone', 'øre', 'DKK', 'da_DK', 2, '#.###,##', b'1'),
(4, 'Swedish Krona', 'SEK', 'krona (pl. kronor)', 'öre', 'SEK', 'sv_SE', 2, '# ###,##', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `basic_price` float NOT NULL,
  `currency_price` float NOT NULL,
  `currency_id` int(11) NOT NULL,
  `ship_name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `shippped` bit(1) NOT NULL,
  `tracking_number` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `basic_price` float NOT NULL,
  `total_basic_price` float NOT NULL,
  `currency_price` float NOT NULL,
  `total_currency_price` float NOT NULL,
  `quantity` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sku` varchar(50) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(50) NOT NULL,
  `price` float NOT NULL,
  `cat_id` int(11) NOT NULL,
  `stock` smallint(6) NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `sku`, `description`, `image`, `price`, `cat_id`, `stock`, `active`) VALUES
(1, 'DeLonghi ECAM21.117.B', '', 'Svenske Råd og Rön kårede i november 2014 Ecam 21.117 som bedste køb\n\nAromafyldt kaffe så let som ingenting: Bryg en eller to kopper ad gangen, vælg mellem 3 forskellige bryggetemperaturer, 13 indstillinger i kaffekværnen, kraftig eller mild aroma og juster selv vand- og kaffemængden. Mulighederne er mange, og baristadrømmen kan nu leves ud hjemme i dit eget køkken. Med den manuelle mælkeskummer har du altid cremet og fyldig mælkeskum til din cappucino. Kopholder og vandfilter følger også med. Maskinen har den store fordel både at kunne anvende kaffebønner og færdigmalet kaffe, og det automatiske rensnings- og afkalkningsprogram sparer dig for besværligt rengøringsarbejde.', 'ecam21117b.jpg', 5320, 0, 0, b'0'),
(2, 'Siemens TE607203RW EQ.6', '', 'Intelligent maskine med høj komfort: En konstant bryggetemperatur garanterer maksimal espressonydelse hver gang, og med et tastetryk på det moderne touch-display får du aromatisk kaffe og kaffe med mælk som f.eks. cappucino eller cafe latte. Du kan brygge to kopper kaffe på samme tid, og AromaDouble giver kaffenyderen mulighed for at lave ekstra stærk kaffe med mindre bitterhed takket være to kværne- og bryggeprocesser med i alt 19 bar.\n\nKopstørrelsen kan tilpasses individuelt, så du får den ønskede mængde kaffe, og det samme kan temperaturen. Med en enkelt berøring rengøres mælkesystemet med damp for optimal hygiejne, og calc''nClean sørger for en fuldautomatisk rengøring og afkalkning. Maskinen skyller desuden bryggeenheden igennem efter hver kop, en garanti for god smag og hygiejne. Også den aftagelige bryggeenhed er let at rengøre.', 'te607203rw.jpg', 3026500, 0, 0, b'0'),
(3, 'Nespresso Lattissima One', '', 'Intelligent maskine med høj komfort: En konstant bryggetemperatur garanterer maksimal espressonydelse hver gang, og med et tastetryk på det moderne touch-display får du aromatisk kaffe og kaffe med mælk som f.eks. cappucino eller cafe latte. Du kan brygge to kopper kaffe på samme tid, og AromaDouble giver kaffenyderen mulighed for at lave ekstra stærk kaffe med mindre bitterhed takket være to kværne- og bryggeprocesser med i alt 19 bar.\n\nKopstørrelsen kan tilpasses individuelt, så du får den ønskede mængde kaffe, og det samme kan temperaturen. Med en enkelt berøring rengøres mælkesystemet med damp for optimal hygiejne, og calc''nClean sørger for en fuldautomatisk rengøring og afkalkning. Maskinen skyller desuden bryggeenheden igennem efter hver kop, en garanti for god smag og hygiejne. Også den aftagelige bryggeenhed er let at rengøre.', 'f111-eu-bw-ne.jpg', 6589.5, 0, 0, b'0'),
(4, 'Bluegaz Gasolgrill Z-1 ', '', 'Intelligent maskine med høj komfort: En konstant bryggetemperatur garanterer maksimal espressonydelse hver gang, og med et tastetryk på det moderne touch-display får du aromatisk kaffe og kaffe med mælk som f.eks. cappucino eller cafe latte. Du kan brygge to kopper kaffe på samme tid, og AromaDouble giver kaffenyderen mulighed for at lave ekstra stærk kaffe med mindre bitterhed takket være to kværne- og bryggeprocesser med i alt 19 bar.\n\nKopstørrelsen kan tilpasses individuelt, så du får den ønskede mængde kaffe, og det samme kan temperaturen. Med en enkelt berøring rengøres mælkesystemet med damp for optimal hygiejne, og calc''nClean sørger for en fuldautomatisk rengøring og afkalkning. Maskinen skyller desuden bryggeenheden igennem efter hver kop, en garanti for god smag og hygiejne. Også den aftagelige bryggeenhed er let at rengøre.', '771301.jpg', 3.609, 0, 1, b'1'),
(5, 'Steba BBQ VG250', '', 'Intelligent maskine med høj komfort: En konstant bryggetemperatur garanterer maksimal espressonydelse hver gang, og med et tastetryk på det moderne touch-display får du aromatisk kaffe og kaffe med mælk som f.eks. cappucino eller cafe latte. Du kan brygge to kopper kaffe på samme tid, og AromaDouble giver kaffenyderen mulighed for at lave ekstra stærk kaffe med mindre bitterhed takket være to kværne- og bryggeprocesser med i alt 19 bar.\n\nKopstørrelsen kan tilpasses individuelt, så du får den ønskede mængde kaffe, og det samme kan temperaturen. Med en enkelt berøring rengøres mælkesystemet med damp for optimal hygiejne, og calc''nClean sørger for en fuldautomatisk rengøring og afkalkning. Maskinen skyller desuden bryggeenheden igennem efter hver kop, en garanti for god smag og hygiejne. Også den aftagelige bryggeenhed er let at rengøre.', 'vg250.jpg', 56.894, 0, 0, b'1'),
(6, 'Man Law BBQ-set 3 delar ', '', 'Intelligent maskine med høj komfort: En konstant bryggetemperatur garanterer maksimal espressonydelse hver gang, og med et tastetryk på det moderne touch-display får du aromatisk kaffe og kaffe med mælk som f.eks. cappucino eller cafe latte. Du kan brygge to kopper kaffe på samme tid, og AromaDouble giver kaffenyderen mulighed for at lave ekstra stærk kaffe med mindre bitterhed takket være to kværne- og bryggeprocesser med i alt 19 bar.\n\nKopstørrelsen kan tilpasses individuelt, så du får den ønskede mængde kaffe, og det samme kan temperaturen. Med en enkelt berøring rengøres mælkesystemet med damp for optimal hygiejne, og calc''nClean sørger for en fuldautomatisk rengøring og afkalkning. Maskinen skyller desuden bryggeenheden igennem efter hver kop, en garanti for god smag og hygiejne. Også den aftagelige bryggeenhed er let at rengøre.', 'BBQ-set_3_delar.jpg', 56801, 0, 0, b'1'),
(7, 'Bakerstone Pizzaugn 36 cm ', '', 'Intelligent maskine med høj komfort: En konstant bryggetemperatur garanterer maksimal espressonydelse hver gang, og med et tastetryk på det moderne touch-display får du aromatisk kaffe og kaffe med mælk som f.eks. cappucino eller cafe latte. Du kan brygge to kopper kaffe på samme tid, og AromaDouble giver kaffenyderen mulighed for at lave ekstra stærk kaffe med mindre bitterhed takket være to kværne- og bryggeprocesser med i alt 19 bar.\n\nKopstørrelsen kan tilpasses individuelt, så du får den ønskede mængde kaffe, og det samme kan temperaturen. Med en enkelt berøring rengøres mælkesystemet med damp for optimal hygiejne, og calc''nClean sørger for en fuldautomatisk rengøring og afkalkning. Maskinen skyller desuden bryggeenheden igennem efter hver kop, en garanti for god smag og hygiejne. Også den aftagelige bryggeenhed er let at rengøre.', 'BAK56180.jpg', 56802, 0, 0, b'1'),
(8, 'Siemens WM14B262DN ', '', 'Intelligent maskine med høj komfort: En konstant bryggetemperatur garanterer maksimal espressonydelse hver gang, og med et tastetryk på det moderne touch-display får du aromatisk kaffe og kaffe med mælk som f.eks. cappucino eller cafe latte. Du kan brygge to kopper kaffe på samme tid, og AromaDouble giver kaffenyderen mulighed for at lave ekstra stærk kaffe med mindre bitterhed takket være to kværne- og bryggeprocesser med i alt 19 bar.\n\nKopstørrelsen kan tilpasses individuelt, så du får den ønskede mængde kaffe, og det samme kan temperaturen. Med en enkelt berøring rengøres mælkesystemet med damp for optimal hygiejne, og calc''nClean sørger for en fuldautomatisk rengøring og afkalkning. Maskinen skyller desuden bryggeenheden igennem efter hver kop, en garanti for god smag og hygiejne. Også den aftagelige bryggeenhed er let at rengøre.', 'wm14b262dn.jpg', 5241, 0, 0, b'1'),
(9, 'Bosch WAWH2668SN', '', 'Intelligent maskine med høj komfort: En konstant bryggetemperatur garanterer maksimal espressonydelse hver gang, og med et tastetryk på det moderne touch-display får du aromatisk kaffe og kaffe med mælk som f.eks. cappucino eller cafe latte. Du kan brygge to kopper kaffe på samme tid, og AromaDouble giver kaffenyderen mulighed for at lave ekstra stærk kaffe med mindre bitterhed takket være to kværne- og bryggeprocesser med i alt 19 bar.\n\nKopstørrelsen kan tilpasses individuelt, så du får den ønskede mængde kaffe, og det samme kan temperaturen. Med en enkelt berøring rengøres mælkesystemet med damp for optimal hygiejne, og calc''nClean sørger for en fuldautomatisk rengøring og afkalkning. Maskinen skyller desuden bryggeenheden igennem efter hver kop, en garanti for god smag og hygiejne. Også den aftagelige bryggeenhed er let at rengøre.', 'wm14b262dn.jpg', 5241, 0, 0, b'1'),
(10, 'Siemens HB65AR520S ', '', 'Intelligent maskine med høj komfort: En konstant bryggetemperatur garanterer maksimal espressonydelse hver gang, og med et tastetryk på det moderne touch-display får du aromatisk kaffe og kaffe med mælk som f.eks. cappucino eller cafe latte. Du kan brygge to kopper kaffe på samme tid, og AromaDouble giver kaffenyderen mulighed for at lave ekstra stærk kaffe med mindre bitterhed takket være to kværne- og bryggeprocesser med i alt 19 bar.\n\nKopstørrelsen kan tilpasses individuelt, så du får den ønskede mængde kaffe, og det samme kan temperaturen. Med en enkelt berøring rengøres mælkesystemet med damp for optimal hygiejne, og calc''nClean sørger for en fuldautomatisk rengøring og afkalkning. Maskinen skyller desuden bryggeenheden igennem efter hver kop, en garanti for god smag og hygiejne. Også den aftagelige bryggeenhed er let at rengøre.', 'eop601x.jpg', 5241, 0, 0, b'1'),
(11, 'Electrolux EOP601X ', '', 'Intelligent maskine med høj komfort: En konstant bryggetemperatur garanterer maksimal espressonydelse hver gang, og med et tastetryk på det moderne touch-display får du aromatisk kaffe og kaffe med mælk som f.eks. cappucino eller cafe latte. Du kan brygge to kopper kaffe på samme tid, og AromaDouble giver kaffenyderen mulighed for at lave ekstra stærk kaffe med mindre bitterhed takket være to kværne- og bryggeprocesser med i alt 19 bar.\n\nKopstørrelsen kan tilpasses individuelt, så du får den ønskede mængde kaffe, og det samme kan temperaturen. Med en enkelt berøring rengøres mælkesystemet med damp for optimal hygiejne, og calc''nClean sørger for en fuldautomatisk rengøring og afkalkning. Maskinen skyller desuden bryggeenheden igennem efter hver kop, en garanti for god smag og hygiejne. Også den aftagelige bryggeenhed er let at rengøre.', 'hb65ar520s.jpg', 5241, 0, 0, b'1');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(30) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(50) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `address` varchar(150) NOT NULL,
  `country` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `active` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `active` (`active`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

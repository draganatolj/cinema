-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2020 at 11:00 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `baza`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookingtable`
--

CREATE TABLE `bookingtable` (
  `bookingID` int(11) NOT NULL,
  `movieName` varchar(100) DEFAULT NULL,
  `bookingTheatre` varchar(100) NOT NULL,
  `bookingType` varchar(100) DEFAULT NULL,
  `bookingDate` varchar(50) NOT NULL,
  `bookingTime` varchar(50) NOT NULL,
  `bookingFName` varchar(100) NOT NULL,
  `bookingLName` varchar(100) DEFAULT NULL,
  `bookingPNumber` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookingtable`
--

INSERT INTO `bookingtable` (`bookingID`, `movieName`, `bookingTheatre`, `bookingType`, `bookingDate`, `bookingTime`, `bookingFName`, `bookingLName`, `bookingPNumber`) VALUES
(19, 'Captain Marvel', 'main-hall', '3d', '13-3', '15-00', 'Ahmed', 'Ismael', '010152658930'),
(22, 'The Lego Movie', 'vip-hall', 'imax', '13-3', '18-00', 'Kareem', 'Ahmed', '01589965'),
(23, 'Kapetanica Marvel', 'vip-hall', '2d', '16-3', '09-00', 'Josip', 'Rajic', '+6576535'),
(24, 'Kapetanica Marvel', 'main-hall', '3d', '13-3', '15-00', 'Magdalena', 'Rajic', '+65765378');

-- --------------------------------------------------------

--
-- Table structure for table `dvorana`
--

CREATE TABLE `dvorana` (
  `id_dvorana` int(11) NOT NULL,
  `naziv` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `broj_mjesta` int(10) NOT NULL,
  `vrsta` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dvorana`
--

INSERT INTO `dvorana` (`id_dvorana`, `naziv`, `broj_mjesta`, `vrsta`) VALUES
(1, '1', 100, '2D'),
(2, '2', 120, '2D'),
(3, '3', 100, '3D'),
(4, '4', 120, '3D');

-- --------------------------------------------------------

--
-- Table structure for table `feedbacktable`
--

CREATE TABLE `feedbacktable` (
  `msgID` int(12) NOT NULL,
  `senderfName` varchar(50) NOT NULL,
  `senderlName` varchar(50) DEFAULT NULL,
  `sendereMail` varchar(100) NOT NULL,
  `senderfeedback` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedbacktable`
--

INSERT INTO `feedbacktable` (`msgID`, `senderfName`, `senderlName`, `sendereMail`, `senderfeedback`) VALUES
(1, 'Ahmed', 'Ali', 'Ahmed@mail.com', 'Hello first'),
(2, 'Ahmed', 'Ali', 'asa@as.com', 'asdas');

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

CREATE TABLE `film` (
  `id_filma` int(11) NOT NULL,
  `naziv` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategorija` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `producent` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_projekcija` int(11) NOT NULL,
  `trajanje` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `movieImg` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `film`
--

INSERT INTO `film` (`id_filma`, `naziv`, `kategorija`, `producent`, `id_projekcija`, `trajanje`, `movieImg`) VALUES
(111, 'Snježno kraljevstvo 2', 'Animirani', 'Jennifer Lee , Chris Buck', 11, '106 min', ''),
(118, 'Gospoda', 'Kriminalisticki', 'Guy Ritchie', 12, '113 min', ''),
(119, 'Zločesti dečki zauvijek', 'Akcijski', 'Adil El Arbi , Bilall Fallah', 15, '124 min', ''),
(120, 'Jumanji:iduća razina', 'Akcijski', 'Jake Kasdan', 13, '123 min', ''),
(121, 'Joker', 'Kriminalisticki', 'Todd Philips ', 16, '122 min', '');

-- --------------------------------------------------------

--
-- Table structure for table `karta`
--

CREATE TABLE `karta` (
  `id_karta` int(11) NOT NULL,
  `cijena` float NOT NULL,
  `datum_rezervacije` date NOT NULL,
  `id_filma` int(11) NOT NULL,
  `id_korisnik` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `id_korisnik` int(11) NOT NULL,
  `ime` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prezime` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lozinka` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`id_korisnik`, `ime`, `prezime`, `email`, `lozinka`) VALUES
(108, 'Marija', 'Joipa', 'magi.rajic12@gmail.com', '123456'),
(109, 'Ivan', '765443', 'bvhjv@ht.rom', '765443'),
(110, 'Ana', 'FMJDSNJKF', 'ana17rajic@gmail.com', 'jsfcsedhjf'),
(111, 'Tea', 'Radic', 'trad@gmail.com', 'jhg654'),
(112, 'Ana', 'Pilic', 'apilic@hotmail.com', '1234567'),
(113, 'Marija', 'hireg', 'ivanr@hotmail.com', '52636'),
(114, 'Josip', 'Jo', 'ivajr@hotmail.com', '12345678'),
(115, 'Marija', 'fhr', 'bvhjbrev@ht.rom', '4357gng'),
(116, 'Iva', 'Ivic', 'ivic@gmai.com', 'iva123'),
(117, 'Ivan', 'ko', 'ivan@gmail.com', '12345'),
(118, 'Marija', 'Pilic', 'mpilic@hotmail.com', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `movietable`
--

CREATE TABLE `movietable` (
  `movieID` int(11) NOT NULL,
  `movieImg` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `movieTitle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `movieGenre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `movieDuration` int(11) NOT NULL,
  `movieRelDate` date NOT NULL,
  `movieDirector` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `movieActors` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movietable`
--

INSERT INTO `movietable` (`movieID`, `movieImg`, `movieTitle`, `movieGenre`, `movieDuration`, `movieRelDate`, `movieDirector`, `movieActors`) VALUES
(1, 'img/movie-poster-1.jpg', 'Kapetanica Marvel', ' Akcijski, Avanturisticki', 124, '2020-01-03', 'Anna Boden, Ryan Fleck', 'Brie Larson, Samuel L. Jackson, Ben Mendelsohn'),
(2, 'img/joker.jpg', 'Joker', 'Drama, Kriminalisticki,Triler', 122, '2020-02-11', 'Todd Philips', 'Joaquin Phoenix, Robert De Niro, Zazie Beetz'),
(3, 'img/gospoda.jpg', 'Gospoda', 'Kriminalisticki', 113, '2020-02-13', 'Guy Ritchie', 'Matthew McConaughey, Charlie Hunnam, Michelle Dockery'),
(4, 'img/movie-poster-4.jpg', 'Nadi Elregal Elserri ', 'Komedija', 105, '2020-01-01', ' Ayman Uttar', 'Karim Abdul Aziz, Ghada Adel, Maged El Kedwany, Nesreen Tafesh, Bayyumy Fouad, Moataz El Tony '),
(5, 'img/movie-poster-5.jpg', 'Čovjek iz scene', 'Biografija, Komedija', 132, '2018-12-25', 'Adam McKay', 'Christian Bale, Amy Adams, Steve Carell');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookingtable`
--
ALTER TABLE `bookingtable`
  ADD PRIMARY KEY (`bookingID`),
  ADD UNIQUE KEY `bookingID` (`bookingID`),
  ADD KEY `bookingID_2` (`bookingID`),
  ADD KEY `bookingID_3` (`bookingID`),
  ADD KEY `bookingID_4` (`bookingID`);

--
-- Indexes for table `dvorana`
--
ALTER TABLE `dvorana`
  ADD PRIMARY KEY (`id_dvorana`);

--
-- Indexes for table `feedbacktable`
--
ALTER TABLE `feedbacktable`
  ADD PRIMARY KEY (`msgID`),
  ADD UNIQUE KEY `msgID` (`msgID`);

--
-- Indexes for table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id_filma`),
  ADD KEY `id_projekcija` (`id_projekcija`);

--
-- Indexes for table `karta`
--
ALTER TABLE `karta`
  ADD PRIMARY KEY (`id_karta`),
  ADD KEY `id_filma` (`id_filma`),
  ADD KEY `id_korisnik` (`id_korisnik`);

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`id_korisnik`);

--
-- Indexes for table `movietable`
--
ALTER TABLE `movietable`
  ADD PRIMARY KEY (`movieID`),
  ADD UNIQUE KEY `movieID` (`movieID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookingtable`
--
ALTER TABLE `bookingtable`
  MODIFY `bookingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `dvorana`
--
ALTER TABLE `dvorana`
  MODIFY `id_dvorana` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `feedbacktable`
--
ALTER TABLE `feedbacktable`
  MODIFY `msgID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `film`
--
ALTER TABLE `film`
  MODIFY `id_filma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `karta`
--
ALTER TABLE `karta`
  MODIFY `id_karta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1120;

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `id_korisnik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `movietable`
--
ALTER TABLE `movietable`
  MODIFY `movieID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `film`
--
ALTER TABLE `film`
  ADD CONSTRAINT `film_ibfk_1` FOREIGN KEY (`id_projekcija`) REFERENCES `projekcija` (`id_projekcija`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `karta`
--
ALTER TABLE `karta`
  ADD CONSTRAINT `karta_ibfk_1` FOREIGN KEY (`id_filma`) REFERENCES `film` (`id_filma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `karta_ibfk_2` FOREIGN KEY (`id_korisnik`) REFERENCES `korisnik` (`id_korisnik`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

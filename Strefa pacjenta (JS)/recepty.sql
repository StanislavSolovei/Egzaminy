-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 27 Sty 2025, 11:21
-- Wersja serwera: 10.4.22-MariaDB
-- Wersja PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `recepty`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `leki`
--

CREATE TABLE `leki` (
  `idLeki` int(10) UNSIGNED NOT NULL,
  `idTypy` int(10) UNSIGNED NOT NULL,
  `nazwa` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `ilosc` int(10) UNSIGNED DEFAULT NULL,
  `jednostka` varchar(10) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `leki`
--

INSERT INTO `leki` (`idLeki`, `idTypy`, `nazwa`, `ilosc`, `jednostka`) VALUES
(1, 1, 'Prawoślaz', 100, 'ml'),
(2, 1, 'Supremin', 150, 'ml'),
(3, 1, 'Neosine', 200, 'ml'),
(4, 2, 'Rutinoscorbin', 150, 'szt.'),
(5, 2, 'Melatonina', 1, 'mg'),
(6, 2, 'APAP', 24, 'szt.'),
(7, 2, 'Gardimax', 10, 'szt.'),
(8, 2, 'Floradix', 50, 'szt.'),
(9, 2, 'Dulcobis', 5, 'mg'),
(10, 2, 'Chlorella', 100, 'szt.'),
(11, 3, 'Witamina C', 1000, 'mg'),
(12, 3, 'Magnes', 10, 'tbl.'),
(13, 3, 'Catcium', 20, 'tbl.');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pacjenci`
--

CREATE TABLE `pacjenci` (
  `idPacjenci` int(10) UNSIGNED NOT NULL,
  `imie` varchar(20) COLLATE utf8_polish_ci DEFAULT NULL,
  `nazwisko` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `adres` text COLLATE utf8_polish_ci DEFAULT NULL,
  `PESEL` varchar(11) COLLATE utf8_polish_ci DEFAULT NULL,
  `rokUr` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `pacjenci`
--

INSERT INTO `pacjenci` (`idPacjenci`, `imie`, `nazwisko`, `adres`, `PESEL`, `rokUr`) VALUES
(1, 'Joanna', 'Kowalska', 'ul. Styki 34/54, Poznań', '76091464584', 1976),
(2, 'Grzegorz', 'Kowalski', 'ul. Styki 34/54, Poznań', '72041464451', 1972),
(3, 'Anna', 'Kowalska', 'ul. Styki 34/54, Poznań', '01281031963', 2001),
(4, 'Adam', 'Kowalski', 'ul. Styki 34/54, Poznań', '12311445632', 2012);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `recepty`
--

CREATE TABLE `recepty` (
  `idRecepty` int(10) UNSIGNED NOT NULL,
  `idLeki` int(10) UNSIGNED NOT NULL,
  `idPacjenci` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `recepty`
--

INSERT INTO `recepty` (`idRecepty`, `idLeki`, `idPacjenci`) VALUES
(1, 5, 1),
(2, 6, 1),
(3, 11, 1),
(4, 13, 1),
(5, 6, 2),
(6, 7, 3),
(7, 2, 3),
(8, 12, 3),
(9, 13, 4),
(10, 4, 4);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `typy`
--

CREATE TABLE `typy` (
  `idTypy` int(10) UNSIGNED NOT NULL,
  `typ` varchar(20) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `typy`
--

INSERT INTO `typy` (`idTypy`, `typ`) VALUES
(1, 'syrop'),
(2, 'tabletki'),
(3, 'tabletki musujące');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `leki`
--
ALTER TABLE `leki`
  ADD PRIMARY KEY (`idLeki`),
  ADD KEY `typy_idTypy` (`idTypy`);

--
-- Indeksy dla tabeli `pacjenci`
--
ALTER TABLE `pacjenci`
  ADD PRIMARY KEY (`idPacjenci`);

--
-- Indeksy dla tabeli `recepty`
--
ALTER TABLE `recepty`
  ADD PRIMARY KEY (`idRecepty`),
  ADD KEY `pacjenci_idPacjenci` (`idPacjenci`),
  ADD KEY `leki_idLeki` (`idLeki`);

--
-- Indeksy dla tabeli `typy`
--
ALTER TABLE `typy`
  ADD PRIMARY KEY (`idTypy`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `leki`
--
ALTER TABLE `leki`
  MODIFY `idLeki` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT dla tabeli `pacjenci`
--
ALTER TABLE `pacjenci`
  MODIFY `idPacjenci` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `recepty`
--
ALTER TABLE `recepty`
  MODIFY `idRecepty` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `typy`
--
ALTER TABLE `typy`
  MODIFY `idTypy` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `leki`
--
ALTER TABLE `leki`
  ADD CONSTRAINT `leki_ibfk_1` FOREIGN KEY (`idTypy`) REFERENCES `typy` (`idTypy`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `recepty`
--
ALTER TABLE `recepty`
  ADD CONSTRAINT `recepty_ibfk_1` FOREIGN KEY (`idPacjenci`) REFERENCES `pacjenci` (`idPacjenci`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `recepty_ibfk_2` FOREIGN KEY (`idLeki`) REFERENCES `leki` (`idLeki`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 03 Cze 2023, 14:50
-- Wersja serwera: 10.4.27-MariaDB
-- Wersja PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `wsb_ziinz_2_k27_inf (w08)`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cities`
--

CREATE TABLE `cities` (
  `id` int(10) UNSIGNED NOT NULL,
  `state_id` int(10) UNSIGNED NOT NULL,
  `city` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Zrzut danych tabeli `cities`
--

INSERT INTO `cities` (`id`, `state_id`, `city`) VALUES
(1, 1, 'Poznań'),
(2, 1, 'Gniezno'),
(3, 2, 'Stargard');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `country` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Zrzut danych tabeli `countries`
--

INSERT INTO `countries` (`id`, `country`) VALUES
(1, 'Polska'),
(2, 'USA');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `address_ip` varchar(15) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `message` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Zrzut danych tabeli `logs`
--

INSERT INTO `logs` (`id`, `user_id`, `address_ip`, `logged`, `message`, `created_at`) VALUES
(4, 20, '127.0.0.1', 1, NULL, '2023-06-03 13:38:32'),
(5, 20, '77.88.99.10', 0, 'błędne hasło', '2023-06-03 13:41:18'),
(6, 20, '127.0.0.1', 0, 'błędne hasło', '2023-06-03 13:42:34'),
(7, 22, '127.0.0.1', 0, 'błędne hasło', '2023-06-03 13:42:56'),
(8, 20, '127.0.0.1', 1, NULL, '2023-06-03 13:43:40'),
(9, 20, '127.0.0.1', 1, NULL, '2023-06-03 14:42:09'),
(10, 22, '127.0.0.1', 1, NULL, '2023-06-03 14:46:06'),
(11, 20, '127.0.0.1', 1, NULL, '2023-06-03 14:46:17'),
(12, 22, '127.0.0.1', 1, NULL, '2023-06-03 14:50:07'),
(13, 20, '127.0.0.1', 1, NULL, '2023-06-03 14:50:18');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `roles`
--

CREATE TABLE `roles` (
  `id` tinyint(4) NOT NULL,
  `role` enum('user','moderator','administrator') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Zrzut danych tabeli `roles`
--

INSERT INTO `roles` (`id`, `role`) VALUES
(1, 'user'),
(2, 'moderator'),
(3, 'administrator');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `states`
--

CREATE TABLE `states` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `state` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Zrzut danych tabeli `states`
--

INSERT INTO `states` (`id`, `country_id`, `state`) VALUES
(1, 1, 'Wielkopolskie'),
(2, 1, 'Zachodniopomorskie'),
(3, 1, 'Śląskie');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `city_id` int(10) UNSIGNED NOT NULL,
  `role_id` tinyint(4) NOT NULL DEFAULT 1,
  `email` varchar(60) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `birthday` date NOT NULL,
  `password` varchar(100) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `city_id`, `role_id`, `email`, `firstName`, `lastName`, `birthday`, `password`, `logo`, `created_at`) VALUES
(0, 2, 1, 'nieznany@o2.pl', 'nieznany', 'nieznany', '2023-03-04', 'nieznany', '', '2023-05-20 15:00:57'),
(1, 2, 1, 'jan@o2.pl', 'Janusz', 'Nowak', '2023-03-04', '1', '', '2023-05-06 13:04:25'),
(2, 1, 1, 'k@o2.pl', 'h', 'j', '2023-01-01', 'l', '', '2023-05-06 13:08:53'),
(4, 1, 1, 'k@o2.pl1', 'h', 'j', '2023-01-01', 'J', '', '2023-05-06 13:27:33'),
(5, 1, 1, 'k@o2.pl12', 'h', 'j', '2023-01-01', '1', '', '2023-05-06 13:52:52'),
(6, 2, 1, 'll@o2.pl', 'Krystyna', 'Nowak', '2023-12-31', 'l', '', '2023-05-06 13:54:30'),
(7, 2, 1, 'll@o2.pli', 'Krystyna', 'Nowak', '2023-12-31', 'k', '', '2023-05-06 13:55:47'),
(8, 2, 1, 'll@o2.pli3', 'Krystyna', 'Nowak', '2023-12-31', '3', '', '2023-05-06 13:56:28'),
(18, 1, 1, 'll@o2.pl7', 'k', 'j', '2023-05-11', 'j', '', '2023-05-06 14:29:18'),
(19, 1, 1, 'll@o2.pl78', 'k', 'j', '2023-05-11', '$argon2id$v=19$m=65536,t=4,p=1$d3BlODUvMXVseUU2cGxQSA$l19A4eOvjVR5EgpGHL6hS/j2l5plbLvKEbKTba3Czkw', 'user1-128x128.jpg', '2023-05-06 14:42:50'),
(20, 1, 3, 'admin@o2.pl', 'Janusz', 'Nowak', '2023-12-31', '$argon2id$v=19$m=65536,t=4,p=1$amtmMXRPQ2RNOU5hblpXVQ$bnVIgHu5JxymzAn2mv3DVIUH8YmHQqZmP4q4Rd7NXBI', 'user1-128x128.jpg', '2023-05-20 11:54:15'),
(22, 1, 1, 'user@o2.pl', 'Krystyna', 'Nowak', '2023-12-31', '$argon2id$v=19$m=65536,t=4,p=1$eEgwSGphTWNlSDZ0aENtUQ$p/JlypO+7GJFYQhzc24Q9VguiTspN/7xrvsE/Bhtoso', 'user5-128x128.jpg', '2023-06-03 11:44:41');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `state_id` (`state_id`);

--
-- Indeksy dla tabeli `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeksy dla tabeli `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_id` (`country_id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT dla tabeli `roles`
--
ALTER TABLE `roles`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `states`
--
ALTER TABLE `states`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`);

--
-- Ograniczenia dla tabeli `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ograniczenia dla tabeli `states`
--
ALTER TABLE `states`
  ADD CONSTRAINT `states_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

--
-- Ograniczenia dla tabeli `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

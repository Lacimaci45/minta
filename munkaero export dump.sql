-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Már 25. 14:42
-- Kiszolgáló verziója: 10.4.21-MariaDB
-- PHP verzió: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `munkaero`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `becenevek`
--

CREATE TABLE `becenevek` (
  `id` int(11) NOT NULL,
  `becenev` text COLLATE utf8mb4_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `becenevek`
--

INSERT INTO `becenevek` (`id`, `becenev`) VALUES
(1, 'Lackó'),
(2, 'Tomi'),
(3, 'Szandi'),
(4, 'Koti'),
(5, 'Ati'),
(6, 'Bocsi'),
(7, 'Lola'),
(8, 'Bazsi'),
(9, 'Processzor'),
(10, 'Ági'),
(11, 'Sinter'),
(12, 'Sándor'),
(13, 'Toka'),
(14, 'Tibusz'),
(15, 'Hobo'),
(16, 'Ló'),
(17, 'Fitti'),
(18, 'Zsuzska'),
(19, 'Era'),
(20, 'Bözsi'),
(21, 'Irénke'),
(22, 'Sanyi'),
(23, 'Juci'),
(24, 'Anett'),
(25, 'Viki'),
(26, 'Sanyi'),
(27, 'Kokszi'),
(28, 'Oszi'),
(29, 'Teca'),
(30, 'Moncsi'),
(31, 'Isti'),
(32, 'Guszti'),
(33, 'Johnny'),
(34, 'Georgo'),
(35, 'Gabri'),
(36, 'Vitya'),
(37, 'Bubu'),
(38, 'Zotya'),
(39, 'Fifi'),
(40, 'Bogi'),
(41, 'Dodó'),
(42, 'Vini'),
(43, 'Lada'),
(44, 'Icuki'),
(45, 'Mari'),
(46, 'Zutyi'),
(47, 'Tami'),
(48, 'Andris'),
(49, 'Edó'),
(50, 'Sziszi'),
(51, 'Kiki'),
(52, 'Petya'),
(53, 'Blaze'),
(54, 'Edu'),
(55, 'Díno'),
(56, 'Nóca'),
(57, 'Pancsi'),
(58, 'Adrus'),
(59, 'Jankó'),
(60, 'Báró');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `dolgozok`
--

CREATE TABLE `dolgozok` (
  `id` int(11) NOT NULL,
  `munkavallaloid` int(11) NOT NULL,
  `becenevid` int(11) NOT NULL,
  `eletkor` int(11) NOT NULL,
  `belepesdatum` text COLLATE utf8mb4_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `dolgozok`
--

INSERT INTO `dolgozok` (`id`, `munkavallaloid`, `becenevid`, `eletkor`, `belepesdatum`) VALUES
(1, 1, 1, 55, '1991.11.27.'),
(2, 2, 2, 49, '1998.12.21.'),
(3, 3, 3, 54, '1996.10.11.'),
(4, 4, 4, 30, '1991.11.27.'),
(5, 5, 5, 42, '1998.12.21.'),
(6, 6, 6, 60, '1996.10.11.'),
(7, 7, 7, 52, '1991.11.27.'),
(8, 8, 8, 48, '1998.12.21.'),
(9, 9, 9, 59, '1996.10.11.'),
(10, 10, 10, 30, '2020.11.27.'),
(11, 11, 11, 49, '1998.12.21.'),
(12, 12, 12, 54, '1996.10.11.'),
(13, 13, 13, 55, '1991.11.27.'),
(14, 14, 14, 49, '1998.12.21.'),
(15, 15, 15, 54, '1996.10.11.'),
(16, 16, 16, 55, '1991.11.27.'),
(17, 17, 17, 49, '1998.12.21.'),
(18, 18, 18, 54, '1996.10.11.'),
(19, 19, 19, 55, '1991.11.27.'),
(20, 20, 20, 49, '1998.12.21.'),
(21, 21, 21, 54, '1996.10.11.'),
(22, 22, 22, 55, '1991.11.27.'),
(23, 23, 23, 49, '1998.12.21.'),
(24, 24, 24, 54, '1996.10.16.'),
(25, 25, 25, 55, '1991.11.27.'),
(26, 26, 26, 49, '1998.12.21.'),
(27, 27, 27, 54, '1996.10.11.'),
(28, 28, 28, 55, '1991.11.27.'),
(29, 29, 29, 49, '1998.12.21.'),
(30, 30, 30, 54, '1996.10.11.'),
(31, 31, 31, 25, '2020.11.11.'),
(32, 32, 32, 27, '2019.12.11.'),
(33, 33, 33, 30, '2018.12.14.'),
(34, 34, 34, 32, '2018.10.14.'),
(35, 35, 35, 39, '2015.07.27.'),
(36, 36, 36, 35, '2016.06.27.'),
(37, 37, 37, 22, '2021.04.27.'),
(38, 38, 38, 25, '2019.06.30.'),
(39, 39, 39, 35, '2015.05.25.'),
(40, 40, 40, 36, '2013.05.30.'),
(41, 41, 41, 20, '2021.05.22.'),
(42, 42, 42, 25, '2020.04.22.'),
(43, 43, 43, 28, '2018.04.11.'),
(44, 44, 44, 48, '2007.03.06.'),
(45, 45, 45, 25, '2017.04.06.'),
(46, 46, 46, 32, '2018.04.11.'),
(47, 47, 47, 29, '2018.02.01.'),
(48, 48, 48, 40, '2018.01.24.'),
(49, 49, 49, 41, '2011.07.25.'),
(50, 50, 50, 28, '2021.06.23.'),
(51, 51, 51, 37, '2017.05.22.'),
(52, 52, 52, 24, '2020.06.21.'),
(53, 53, 53, 44, '2020.05.09.'),
(54, 54, 54, 30, '2017.05.11.'),
(55, 55, 55, 21, '2021.06.11.'),
(56, 56, 56, 32, '2011.04.12.'),
(57, 57, 57, 50, '2011.04.12.'),
(58, 58, 58, 25, '2021.03.05.'),
(59, 59, 59, 36, '2021.09.07.'),
(60, 60, 60, 40, '2011.11.11.');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `elerhetoseg`
--

CREATE TABLE `elerhetoseg` (
  `id` int(11) NOT NULL,
  `eredetinev` text COLLATE utf8mb4_hungarian_ci NOT NULL,
  `telefonszam` text COLLATE utf8mb4_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `elerhetoseg`
--

INSERT INTO `elerhetoseg` (`id`, `eredetinev`, `telefonszam`) VALUES
(1, 'Adamik László', '+36705663432'),
(2, 'Bencsik Tamás', '+36305224222'),
(3, 'Baráth Alexandra', '+36204451552'),
(4, 'Kovács Tivadar', '+36702679451'),
(5, 'József Attila', '+36305272422'),
(6, 'Bondár Gábor', '+36204455552'),
(7, 'Lovász László', '+36704359223'),
(8, 'Sebestyén Balázs', '+36307459851'),
(9, 'Voga Péter', '+36206458321'),
(10, 'Vámos Ágnes', '+36707415896'),
(11, 'Csipkés Zoltán', '+36301245973'),
(12, 'Szalacsi Sándor', '+36205446823'),
(13, 'Tóth Kálmán', '+36701452198'),
(14, 'Tátrai Tibor', '+36303215794'),
(15, 'Földes László', '+36204592178'),
(16, 'Rubint Rita', '+36701266953'),
(17, 'Bíró Ilona', '+36304556321'),
(18, 'Toldi Zsuzsanna', '+36207784569'),
(19, 'Fullajtár Erika', '+36702334512'),
(20, 'Kiss Erzsébet', '+36304412365'),
(21, 'Varga Irén', '+36207845196'),
(22, 'Rózsa Sándor', '+36704599821'),
(23, 'Varga Judit', '+36303654982'),
(24, 'Héja Anett', '+36201265489'),
(25, 'Szedmák Viktória', '+36701725396'),
(26, 'Pörzse Sándor', '+36301625436'),
(27, 'Deutsch-Für Tamás', '+36207253891'),
(28, 'Füles Oszkár', '+36705387236'),
(29, 'Nagy Teréz', '+36302154967'),
(30, 'Kis Mónika', '+36203451976'),
(31, 'Nagy István', '+36703451976'),
(32, 'Kovács Gusztáv', '+36303451976'),
(33, 'Szegedi János', '+36303466976'),
(34, 'Probijszki Gy9rgy', '+36703466976'),
(35, 'Budai Gábor', '+36203466976'),
(36, 'Leszkó Viktor', '+36303477976'),
(37, 'D. Nagy Bence', '+36203477976'),
(38, 'Gere Zoltán', '+36703477976'),
(39, 'Szeremcsi Ivett', '+36703488876'),
(40, 'Araczki Boglárka', '+36203488877'),
(41, 'Szilágyi Dóra', '+36303488877'),
(42, 'Fehér Vivien', '+36303458576'),
(43, 'Németh László', '+36203458574'),
(44, 'Sebestyén Ilona', '+36703458572'),
(45, 'Szántó Mariann', '+36703444571'),
(46, 'Hajnal Zoltán', '+36203444573'),
(47, 'Pántya Tamara', '+36303444577'),
(48, 'Pázsik András', '+36303232576'),
(49, 'Buhala Edina', '+36203232575'),
(50, 'Vitéz Szilárd', '+36703232574'),
(51, 'Hevesi Kristóf', '+36703987572'),
(52, 'Mikó Péter', '+36303987572'),
(53, 'Körözsi Balázs', '+36203987572'),
(54, 'Kovács Endre', '+36302245698'),
(55, 'Dávid Diána', '+36202245698'),
(56, 'Berczi Nóra', '+36702245698'),
(57, 'Herbert Anna', '+36702254498'),
(58, 'Csipai Adrienn', '+36302254498'),
(59, 'Csarnai János', '+36202254498'),
(60, 'Ökrös Mihály', '+36202254989');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `munkavallalok`
--

CREATE TABLE `munkavallalok` (
  `id` int(11) NOT NULL,
  `munkakor` text COLLATE utf8mb4_hungarian_ci NOT NULL,
  `eredetinev` text COLLATE utf8mb4_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `munkavallalok`
--

INSERT INTO `munkavallalok` (`id`, `munkakor`, `eredetinev`) VALUES
(1, 'mechanikus karbantartó', 'Adamik László'),
(2, 'gépkezelő', 'Bencsik Tamás'),
(3, 'könyvelő', 'Baráth Alexandra'),
(4, 'asztalos', 'Kovács Tivadar'),
(5, 'CNC forgácsoló', 'József Attila'),
(6, 'esztergályos', 'Bondár Gábor'),
(7, 'minőség ellenőr', 'Lovász László'),
(8, 'kamion sofőr', 'Sebestyén Balázs'),
(9, 'bolti eladó', 'Voga Péter'),
(10, 'gyógyszertári asszisztens', 'Vámos Ágnes'),
(11, 'villanyszerelő', 'Csipkés Zoltán'),
(12, 'szakács', 'Szalacsi Sándor'),
(13, 'pék', 'Tóth Kálmán'),
(14, 'biztonsági őr', 'Tátrai Tibor'),
(15, 'ács', 'Földes László'),
(16, 'analitikus könyvelő', 'Rubint Rita'),
(17, 'TB ügyintéző', 'Bíró Ilona'),
(18, 'irodai asszisztens', 'Toldi Zsuzsanna'),
(19, 'üzletvezető', 'Fullajtár Erika'),
(20, 'recepciós', 'Kiss Erzsébet'),
(21, 'szabó', 'Varga Irén'),
(22, 'elektromos karbantartó', 'Rózsa Sándor'),
(23, 'pedagógus asszisztens', 'Varga Judit'),
(24, 'renszergazda', 'Héja Anett'),
(25, 'gyógymasszőr', 'Szedmák Viktória'),
(26, 'kovács', 'Pörzse Sándor'),
(27, 'szoftverfejlesztő', 'Deutsch-Für Tamás'),
(28, 'építész', 'Füles Oszkár'),
(29, 'varró', 'Nagy Teréz'),
(30, 'gazdasági elemző', 'Kis Mónika'),
(31, 'nyomdász gépmester', 'Nagy István'),
(32, 'CNC programozó', 'Kovács Gusztáv'),
(33, 'raktáros', 'Szegedi János'),
(34, 'autószerelő', 'Probojszki György'),
(35, 'lakatos', 'Budai Gábor'),
(36, 'renszergazda', 'Leszkó Viktor'),
(37, 'üzemi adminisztrátor', 'D. Nagy Bence'),
(38, 'TV operatőr', 'Gere Zoltán'),
(39, 'grafikus', 'Szerencsi Ivett'),
(40, 'laboráns', 'Araczki Boglárka'),
(41, 'ápoló', 'Szilágyi Dóra'),
(42, 'pincér', 'Fehér Vivien'),
(43, 'targoncás', 'Németh László'),
(44, 'HR ügyintéző', 'Sebestyén Ilona'),
(45, 'adatbázis kezelő', 'Szántó Mariann'),
(46, 'webmester', 'Hajnal Zoltán'),
(47, 'termelési programozó', 'Pántya Tamara'),
(48, 'kontroller', 'Pázsik András'),
(49, 'banki szakügyintéző', 'Buhala Edina'),
(50, 'fodrász', 'Vitéz Szilárd'),
(51, 'gázszerelő', 'Hevesi Kristóf'),
(52, 'vízszerelő', 'Mikó Péter'),
(53, 'logisztikus', 'Körözsi Balázs'),
(54, 'speditőr', 'Kovács Endre'),
(55, 'személyügyi szervező', 'Dávid Diána'),
(56, 'konduktor', 'Berczi Nóra'),
(57, 'pénzügyi ügyintéző', 'Herbert Anna'),
(58, 'szobrász', 'Csipai Adrienn'),
(59, 'szobafestő', 'Csarnai János'),
(60, 'PLC programozó', 'Ökrös Mihály');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `becenevek`
--
ALTER TABLE `becenevek`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `dolgozok`
--
ALTER TABLE `dolgozok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `munkavallaloid` (`munkavallaloid`),
  ADD KEY `becenevid` (`becenevid`);

--
-- A tábla indexei `elerhetoseg`
--
ALTER TABLE `elerhetoseg`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `munkavallalok`
--
ALTER TABLE `munkavallalok`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `becenevek`
--
ALTER TABLE `becenevek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT a táblához `dolgozok`
--
ALTER TABLE `dolgozok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT a táblához `elerhetoseg`
--
ALTER TABLE `elerhetoseg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT a táblához `munkavallalok`
--
ALTER TABLE `munkavallalok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `dolgozok`
--
ALTER TABLE `dolgozok`
  ADD CONSTRAINT `dolgozok_ibfk_1` FOREIGN KEY (`munkavallaloid`) REFERENCES `munkavallalok` (`id`),
  ADD CONSTRAINT `dolgozok_ibfk_2` FOREIGN KEY (`becenevid`) REFERENCES `becenevek` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

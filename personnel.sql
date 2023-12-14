-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2023-12-14 17:49:27
-- 伺服器版本： 10.4.22-MariaDB
-- PHP 版本： 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫: `personnel`
--

-- --------------------------------------------------------

--
-- 資料表結構 `address`
--

CREATE TABLE `address` (
  `city` tinytext DEFAULT NULL,
  `street` tinytext DEFAULT NULL,
  `unitNumber` tinytext DEFAULT NULL,
  `addressID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `address`
--

INSERT INTO `address` (`city`, `street`, `unitNumber`, `addressID`) VALUES
('高雄市左營區', '新生路', '56號', 0),
('高雄市鼓山區', '臨海一路', '76號', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `cargo`
--

CREATE TABLE `cargo` (
  `cargoNumber` tinytext DEFAULT NULL,
  `estimatedDeliveryDate` date NOT NULL,
  `limit` tinytext DEFAULT NULL,
  `origin` int(11) DEFAULT NULL,
  `cargoID` int(11) NOT NULL,
  `destination` int(11) DEFAULT NULL,
  `shippingDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `cargo`
--

INSERT INTO `cargo` (`cargoNumber`, `estimatedDeliveryDate`, `limit`, `origin`, `cargoID`, `destination`, `shippingDate`) VALUES
('A000001', '2023-12-12', '易碎品', 0, 0, 1, '2023-12-20'),
('A000002', '2023-12-11', '無', 1, 1, 0, '2023-12-18');

-- --------------------------------------------------------

--
-- 資料表結構 `cargohistory`
--

CREATE TABLE `cargohistory` (
  `currentState` tinytext DEFAULT NULL,
  `historyNumber` int(11) DEFAULT NULL,
  `timeOfArrival` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `mCargo` int(11) DEFAULT NULL,
  `mPersonnel` int(11) DEFAULT NULL,
  `origin` int(11) DEFAULT NULL,
  `destination` int(11) DEFAULT NULL,
  `cargoHistoryID` int(11) NOT NULL,
  `cargoID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `content`
--

CREATE TABLE `content` (
  `cargoName` tinytext DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `contentID` int(11) NOT NULL,
  `cargoID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `content`
--

INSERT INTO `content` (`cargoName`, `quantity`, `contentID`, `cargoID`) VALUES
('登山護膝', 1, 0, 0),
('運動襪', 1, 1, 0),
('手提包', 3, 2, 1),
('水壺', 2, 3, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `personnel`
--

CREATE TABLE `personnel` (
  `personnelNumber` tinytext DEFAULT NULL,
  `personnelPassword` tinytext DEFAULT NULL,
  `personnelID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `personnel`
--

INSERT INTO `personnel` (`personnelNumber`, `personnelPassword`, `personnelID`) VALUES
('A000001', 'qwerty12', 0);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`addressID`);

--
-- 資料表索引 `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`cargoID`),
  ADD KEY `FK_Cargo_OriginAddress` (`origin`),
  ADD KEY `FK_Cargo_DestinationAddress` (`destination`);

--
-- 資料表索引 `cargohistory`
--
ALTER TABLE `cargohistory`
  ADD PRIMARY KEY (`cargoHistoryID`),
  ADD KEY `FK_CargoHistory_OriginAddress` (`origin`),
  ADD KEY `FK_CargoHistory_DestinationAddress` (`destination`),
  ADD KEY `FK_CargoHistory_Cargo` (`cargoID`),
  ADD KEY `FK_mCargo` (`mCargo`),
  ADD KEY `FK_mPersonnel` (`mPersonnel`);

--
-- 資料表索引 `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`contentID`),
  ADD KEY `FK_Content_Cargo` (`cargoID`);

--
-- 資料表索引 `personnel`
--
ALTER TABLE `personnel`
  ADD PRIMARY KEY (`personnelID`);

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `cargo`
--
ALTER TABLE `cargo`
  ADD CONSTRAINT `FK_Cargo_DestinationAddress` FOREIGN KEY (`destination`) REFERENCES `address` (`addressID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Cargo_OriginAddress` FOREIGN KEY (`origin`) REFERENCES `address` (`addressID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 資料表的限制式 `cargohistory`
--
ALTER TABLE `cargohistory`
  ADD CONSTRAINT `FK_CargoHistory_Cargo` FOREIGN KEY (`cargoID`) REFERENCES `cargo` (`cargoID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_CargoHistory_DestinationAddress` FOREIGN KEY (`destination`) REFERENCES `address` (`addressID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_CargoHistory_OriginAddress` FOREIGN KEY (`origin`) REFERENCES `address` (`addressID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_mCargo` FOREIGN KEY (`mCargo`) REFERENCES `cargo` (`cargoID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_mPersonnel` FOREIGN KEY (`mPersonnel`) REFERENCES `personnel` (`personnelID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 資料表的限制式 `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `FK_Content_Cargo` FOREIGN KEY (`cargoID`) REFERENCES `cargo` (`cargoID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

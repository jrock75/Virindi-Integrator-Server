-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.32 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table pegasus.account
CREATE TABLE IF NOT EXISTS `account` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `privileges` smallint NOT NULL DEFAULT '0',
  `createIp` varchar(50) NOT NULL DEFAULT '',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastIp` varchar(50) NOT NULL DEFAULT '',
  `lastTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table pegasus.dungeon
CREATE TABLE IF NOT EXISTS `dungeon` (
  `landBlockId` smallint unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`landBlockId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table pegasus.dungeon_tile
CREATE TABLE IF NOT EXISTS `dungeon_tile` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `landBlockId` smallint unsigned NOT NULL DEFAULT '0',
  `tileId` smallint unsigned NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `rotation` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `__FK_dungeon_tile_landBlockId__dungeon_landBlockId` (`landBlockId`),
  CONSTRAINT `__FK_dungeon_tile_landBlockId__dungeon_landBlockId` FOREIGN KEY (`landBlockId`) REFERENCES `dungeon` (`landBlockId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=281751 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table pegasus.friend
CREATE TABLE IF NOT EXISTS `friend` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `friend` int unsigned NOT NULL DEFAULT '0',
  `addTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `__FK_friend_friend__account_id` (`friend`),
  CONSTRAINT `__FK_friend_friend__account_id` FOREIGN KEY (`friend`) REFERENCES `account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `__FK_friend_id__account_id` FOREIGN KEY (`id`) REFERENCES `account` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

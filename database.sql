-- -------------------------------------------------------
-- Vært:                         127.0.0.1
-- Server-version:               10.3.16-MariaDB - mariadb.org binary distribution
-- ServerOS:                     Win64
-- HeidiSQL Version:             10.2.0.5599
-- -------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for vrpfx
DROP DATABASE IF EXISTS `vrpfx`;
CREATE DATABASE IF NOT EXISTS `vrpfx` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `vrpfx`;

-- Dumping structure for tabel vrpfx.phone_app_chat
DROP TABLE IF EXISTS `phone_app_chat`;
CREATE TABLE IF NOT EXISTS `phone_app_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table vrpfx.phone_app_chat: ~0 rows (approximately)
/*!40000 ALTER TABLE `phone_app_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_app_chat` ENABLE KEYS */;

-- Dumping structure for tabel vrpfx.phone_calls
DROP TABLE IF EXISTS `phone_calls`;
CREATE TABLE IF NOT EXISTS `phone_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(10) NOT NULL COMMENT 'Num tel proprio',
  `num` varchar(10) NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table vrpfx.phone_calls: ~0 rows (approximately)
/*!40000 ALTER TABLE `phone_calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_calls` ENABLE KEYS */;

-- Dumping structure for tabel vrpfx.phone_messages
DROP TABLE IF EXISTS `phone_messages`;
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table vrpfx.phone_messages: 0 rows
/*!40000 ALTER TABLE `phone_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_messages` ENABLE KEYS */;

-- Dumping structure for tabel vrpfx.phone_twitter
DROP TABLE IF EXISTS `phone_twitter`;
CREATE TABLE IF NOT EXISTS `phone_twitter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `message` varchar(300) NOT NULL,
  `time` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table vrpfx.phone_twitter: ~0 rows (approximately)
/*!40000 ALTER TABLE `phone_twitter` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_twitter` ENABLE KEYS */;

-- Dumping structure for tabel vrpfx.vrp_srv_data
DROP TABLE IF EXISTS `vrp_srv_data`;
CREATE TABLE IF NOT EXISTS `vrp_srv_data` (
  `dkey` varchar(255) NOT NULL DEFAULT '',
  `dvalue` text DEFAULT NULL,
  PRIMARY KEY (`dkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table vrpfx.vrp_srv_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `vrp_srv_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrp_srv_data` ENABLE KEYS */;

-- Dumping structure for tabel vrpfx.vrp_users
DROP TABLE IF EXISTS `vrp_users`;
CREATE TABLE IF NOT EXISTS `vrp_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_login` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `last_date` text COLLATE utf8_danish_ci DEFAULT NULL,
  `whitelisted` tinyint(1) DEFAULT 0,
  `banned` tinyint(1) DEFAULT 0,
  `reason` text CHARACTER SET utf8 DEFAULT NULL,
  `DmvTest` int(11) DEFAULT 1,
  `freason` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `_updated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `verify` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

-- Dumping data for table vrpfx.vrp_users: ~0 rows (approximately)
/*!40000 ALTER TABLE `vrp_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrp_users` ENABLE KEYS */;

-- Dumping structure for tabel vrpfx.vrp_user_business
DROP TABLE IF EXISTS `vrp_user_business`;
CREATE TABLE IF NOT EXISTS `vrp_user_business` (
  `user_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(30) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `capital` int(11) DEFAULT 0,
  `laundered` int(11) DEFAULT 0,
  `reset_timestamp` int(11) DEFAULT 0,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_business_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table vrpfx.vrp_user_business: ~0 rows (approximately)
/*!40000 ALTER TABLE `vrp_user_business` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrp_user_business` ENABLE KEYS */;

-- Dumping structure for tabel vrpfx.vrp_user_data
DROP TABLE IF EXISTS `vrp_user_data`;
CREATE TABLE IF NOT EXISTS `vrp_user_data` (
  `user_id` int(11) NOT NULL DEFAULT 0,
  `dkey` varchar(255) NOT NULL DEFAULT '',
  `dvalue` text DEFAULT NULL,
  PRIMARY KEY (`user_id`,`dkey`),
  CONSTRAINT `fk_user_data_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table vrpfx.vrp_user_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `vrp_user_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrp_user_data` ENABLE KEYS */;

-- Dumping structure for tabel vrpfx.vrp_user_homes
DROP TABLE IF EXISTS `vrp_user_homes`;
CREATE TABLE IF NOT EXISTS `vrp_user_homes` (
  `user_id` int(11) NOT NULL DEFAULT 0,
  `home` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT 0,
  KEY `home` (`home`,`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table vrpfx.vrp_user_homes: ~0 rows (approximately)
/*!40000 ALTER TABLE `vrp_user_homes` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrp_user_homes` ENABLE KEYS */;

-- Dumping structure for tabel vrpfx.vrp_user_identities
DROP TABLE IF EXISTS `vrp_user_identities`;
CREATE TABLE IF NOT EXISTS `vrp_user_identities` (
  `user_id` int(11) NOT NULL DEFAULT 0,
  `registration` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `firstname` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `age` int(11) DEFAULT 0,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `registration_UNIQUE` (`registration`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  KEY `registration` (`registration`),
  KEY `phone` (`phone`),
  CONSTRAINT `fk_user_identities_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- Dumping data for table vrpfx.vrp_user_identities: ~0 rows (approximately)
/*!40000 ALTER TABLE `vrp_user_identities` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrp_user_identities` ENABLE KEYS */;

-- Dumping structure for tabel vrpfx.vrp_user_ids
DROP TABLE IF EXISTS `vrp_user_ids`;
CREATE TABLE IF NOT EXISTS `vrp_user_ids` (
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `user_id` int(11) DEFAULT 0,
  PRIMARY KEY (`identifier`),
  KEY `fk_user_ids_users` (`user_id`),
  CONSTRAINT `fk_user_ids_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table vrpfx.vrp_user_ids: ~0 rows (approximately)
/*!40000 ALTER TABLE `vrp_user_ids` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrp_user_ids` ENABLE KEYS */;

-- Dumping structure for tabel vrpfx.vrp_user_moneys
DROP TABLE IF EXISTS `vrp_user_moneys`;
CREATE TABLE IF NOT EXISTS `vrp_user_moneys` (
  `user_id` int(11) NOT NULL DEFAULT 0,
  `wallet` bigint(20) DEFAULT 0,
  `bank` bigint(20) DEFAULT 0,
  `_log_upd` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_moneys_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table vrpfx.vrp_user_moneys: ~0 rows (approximately)
/*!40000 ALTER TABLE `vrp_user_moneys` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrp_user_moneys` ENABLE KEYS */;

-- Dumping structure for tabel vrpfx.vrp_user_vehicles
DROP TABLE IF EXISTS `vrp_user_vehicles`;
CREATE TABLE IF NOT EXISTS `vrp_user_vehicles` (
  `user_id` int(11) NOT NULL DEFAULT 0,
  `vehicle` varchar(255) NOT NULL DEFAULT '',
  `vehicle_name` varchar(255) NOT NULL,
  `vehicle_plate` varchar(15) NOT NULL,
  `veh_type` varchar(255) NOT NULL DEFAULT 'default',
  `vehicle_colorprimary` varchar(255) DEFAULT NULL,
  `vehicle_colorsecondary` varchar(255) DEFAULT NULL,
  `vehicle_pearlescentcolor` varchar(255) DEFAULT NULL,
  `vehicle_wheelcolor` varchar(255) DEFAULT NULL,
  `vehicle_plateindex` varchar(255) DEFAULT NULL,
  `vehicle_neoncolor1` varchar(255) DEFAULT NULL,
  `vehicle_neoncolor2` varchar(255) DEFAULT NULL,
  `vehicle_neoncolor3` varchar(255) DEFAULT NULL,
  `vehicle_windowtint` varchar(255) DEFAULT NULL,
  `vehicle_wheeltype` varchar(255) DEFAULT NULL,
  `vehicle_mods0` varchar(255) DEFAULT NULL,
  `vehicle_mods1` varchar(255) DEFAULT NULL,
  `vehicle_mods2` varchar(255) DEFAULT NULL,
  `vehicle_mods3` varchar(255) DEFAULT NULL,
  `vehicle_mods4` varchar(255) DEFAULT NULL,
  `vehicle_mods5` varchar(255) DEFAULT NULL,
  `vehicle_mods6` varchar(255) DEFAULT NULL,
  `vehicle_mods7` varchar(255) DEFAULT NULL,
  `vehicle_mods8` varchar(255) DEFAULT NULL,
  `vehicle_mods9` varchar(255) DEFAULT NULL,
  `vehicle_mods10` varchar(255) DEFAULT NULL,
  `vehicle_mods11` varchar(255) DEFAULT NULL,
  `vehicle_mods12` varchar(255) DEFAULT NULL,
  `vehicle_mods13` varchar(255) DEFAULT NULL,
  `vehicle_mods14` varchar(255) DEFAULT NULL,
  `vehicle_mods15` varchar(255) DEFAULT NULL,
  `vehicle_mods16` varchar(255) DEFAULT NULL,
  `vehicle_turbo` varchar(255) NOT NULL DEFAULT 'off',
  `vehicle_tiresmoke` varchar(255) NOT NULL DEFAULT 'off',
  `vehicle_xenon` varchar(255) NOT NULL DEFAULT 'off',
  `vehicle_mods23` varchar(255) DEFAULT NULL,
  `vehicle_mods24` varchar(255) DEFAULT NULL,
  `vehicle_neon0` varchar(255) DEFAULT NULL,
  `vehicle_neon1` varchar(255) DEFAULT NULL,
  `vehicle_neon2` varchar(255) DEFAULT NULL,
  `vehicle_neon3` varchar(255) DEFAULT NULL,
  `vehicle_bulletproof` varchar(255) DEFAULT NULL,
  `vehicle_smokecolor1` varchar(255) DEFAULT NULL,
  `vehicle_smokecolor2` varchar(255) DEFAULT NULL,
  `vehicle_smokecolor3` varchar(255) DEFAULT NULL,
  `vehicle_modvariation` varchar(255) NOT NULL DEFAULT 'off',
  `vehicle_price` int(60) NOT NULL DEFAULT 0,
  `vehicle_damage` varchar(255) NOT NULL DEFAULT '',
  `vehicle_impound` varchar(255) NOT NULL DEFAULT '',
  `vehicle_livery` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`vehicle_plate`,`vehicle`),
  CONSTRAINT `fk_user_vehicles_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table vrpfx.vrp_user_vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `vrp_user_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrp_user_vehicles` ENABLE KEYS */;

-- Dumping structure for tabel vrpfx._log_banstory
DROP TABLE IF EXISTS `_log_banstory`;
CREATE TABLE IF NOT EXISTS `_log_banstory` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `ban_from` int(11) NOT NULL,
  `ban_to` int(11) NOT NULL,
  `ban_reason` varchar(255) NOT NULL,
  `_upd` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table vrpfx._log_banstory: ~0 rows (approximately)
/*!40000 ALTER TABLE `_log_banstory` DISABLE KEYS */;
/*!40000 ALTER TABLE `_log_banstory` ENABLE KEYS */;

-- Dumping structure for tabel vrpfx._log_cashflow
DROP TABLE IF EXISTS `_log_cashflow`;
CREATE TABLE IF NOT EXISTS `_log_cashflow` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `cash_type` varchar(45) NOT NULL,
  `cash_start` bigint(20) NOT NULL,
  `cash_move` bigint(20) NOT NULL,
  `cash_end` bigint(20) NOT NULL,
  `_upd` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table vrpfx._log_cashflow: ~0 rows (approximately)
/*!40000 ALTER TABLE `_log_cashflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `_log_cashflow` ENABLE KEYS */;

-- Dumping structure for tabel vrpfx._log_user_switch
DROP TABLE IF EXISTS `_log_user_switch`;
CREATE TABLE IF NOT EXISTS `_log_user_switch` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) NOT NULL,
  `userid` bigint(20) NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `userid_UNIQUE` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table vrpfx._log_user_switch: ~0 rows (approximately)
/*!40000 ALTER TABLE `_log_user_switch` DISABLE KEYS */;
/*!40000 ALTER TABLE `_log_user_switch` ENABLE KEYS */;

-- Dumping structure for tabel vrpfx._log_vehicles
DROP TABLE IF EXISTS `_log_vehicles`;
CREATE TABLE IF NOT EXISTS `_log_vehicles` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `action` varchar(250) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `vehicle` varchar(250) NOT NULL,
  `vehicle_price` bigint(20) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table vrpfx._log_vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `_log_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `_log_vehicles` ENABLE KEYS */;

-- Dumping structure for tabel vrpfx._log_weapons_user
DROP TABLE IF EXISTS `_log_weapons_user`;
CREATE TABLE IF NOT EXISTS `_log_weapons_user` (
  `user_id` int(11) DEFAULT NULL,
  `to` varchar(255) NOT NULL DEFAULT '',
  `from` varchar(255) NOT NULL DEFAULT '0',
  `weapon_name` varchar(255) DEFAULT '',
  `_time` timestamp NULL DEFAULT current_timestamp(),
  `weapon_amount` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table vrpfx._log_weapons_user: ~0 rows (approximately)
/*!40000 ALTER TABLE `_log_weapons_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `_log_weapons_user` ENABLE KEYS */;

-- Dumping structure for trigger vrpfx.vrp_users_analysis_bannings
DROP TRIGGER IF EXISTS `vrp_users_analysis_bannings`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `vrp_users_analysis_bannings` BEFORE UPDATE ON `vrp_users` FOR EACH ROW BEGIN

	IF ( IFNULL(OLD.`banned`,0) != IFNULL(NEW.`banned`,0) ) THEN
		INSERT INTO `_log_banstory`
			(`user_id`,`ban_from`,`ban_to`,`ban_reason`)
				VALUES
            (OLD.`id`,OLD.`banned`,NEW.`banned`,IFNULL(NEW.`reason`,''))
		;
    END IF;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger vrpfx.vrp_user_ids_logging
DROP TRIGGER IF EXISTS `vrp_user_ids_logging`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `vrp_user_ids_logging` AFTER DELETE ON `vrp_user_ids` FOR EACH ROW BEGIN

	INSERT INTO
		`_log_user_switch`
        (`identifier`,`userid`)
	VALUES
		(OLD.`identifier`,OLD.`user_id`)
	
    ON DUPLICATE KEY UPDATE `userid`=`userid`;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger vrpfx.vrp_user_moneys_analysis_update
DROP TRIGGER IF EXISTS `vrp_user_moneys_analysis_update`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `vrp_user_moneys_analysis_update` AFTER UPDATE ON `vrp_user_moneys` FOR EACH ROW BEGIN
	/* Lets check if the wallet has changed */
    IF ( IFNULL(OLD.`wallet`,0) != IFNULL(NEW.`wallet`,0) ) THEN
        INSERT INTO `vrpfx`.`_log_cashflow`
            (
                `user_id`,
                `cash_type`,
                `cash_start`,
                `cash_move`,
                `cash_end`
            )
                VALUES
            (
                OLD.`user_id`,
                'WALLET',
                IFNULL(OLD.`wallet`,0),
                ( IFNULL(NEW.`wallet`,0) - IFNULL(OLD.`wallet`,0) ),
                IFNULL(NEW.`wallet`,0)
            )
        ;
    END IF;

    /* Lets check if the wallet has changed */
    IF ( IFNULL(OLD.`bank`,0) != IFNULL(NEW.`bank`,0) ) THEN
        INSERT INTO `vrpfx`.`_log_cashflow`
            (
                `user_id`,
                `cash_type`,
                `cash_start`,
                `cash_move`,
                `cash_end`
            )
                VALUES
            (
                OLD.`user_id`,
                'BANK',
                IFNULL(OLD.`bank`,0),
                ( IFNULL(NEW.`bank`,0) - IFNULL(OLD.`bank`,0) ),
                IFNULL(NEW.`bank`,0)
            )
        ;
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger vrpfx._log_adding
DROP TRIGGER IF EXISTS `_log_adding`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `_log_adding` BEFORE INSERT ON `vrp_user_vehicles` FOR EACH ROW INSERT INTO `vrpfx`.`_log_vehicles` (`action`,`user_id`,`vehicle`,`vehicle_price`) VALUES ('insert', NEW.`user_id`, NEW.`vehicle`, NEW.`vehicle_price`)//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

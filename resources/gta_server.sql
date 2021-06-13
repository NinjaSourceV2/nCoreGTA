-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           10.4.18-MariaDB - mariadb.org binary distribution
-- SE du serveur:                Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour gta_serveur
DROP DATABASE IF EXISTS `gta_serveur`;
CREATE DATABASE IF NOT EXISTS `gta_serveur` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;
USE `gta_serveur`;

-- Listage de la structure de la table gta_serveur. cles_vehicule
DROP TABLE IF EXISTS `cles_vehicule`;
CREATE TABLE IF NOT EXISTS `cles_vehicule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `plate` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `count` int(11) DEFAULT 0,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table gta_serveur.cles_vehicule : ~0 rows (environ)
/*!40000 ALTER TABLE `cles_vehicule` DISABLE KEYS */;
/*!40000 ALTER TABLE `cles_vehicule` ENABLE KEYS */;

-- Listage de la structure de la table gta_serveur. gta_coffres
DROP TABLE IF EXISTS `gta_coffres`;
CREATE TABLE IF NOT EXISTS `gta_coffres` (
  `id_unique` text DEFAULT NULL,
  `dataCoffre` text DEFAULT NULL,
  `dataStorage` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table gta_serveur.gta_coffres : ~0 rows (environ)
/*!40000 ALTER TABLE `gta_coffres` DISABLE KEYS */;
/*!40000 ALTER TABLE `gta_coffres` ENABLE KEYS */;

-- Listage de la structure de la table gta_serveur. gta_joueurs
DROP TABLE IF EXISTS `gta_joueurs`;
CREATE TABLE IF NOT EXISTS `gta_joueurs` (
  `license` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `banque` int(11) DEFAULT 0,
  `job` varchar(255) COLLATE utf8mb4_bin DEFAULT 'Chomeur',
  `faim` int(11) DEFAULT 100,
  `soif` int(11) DEFAULT 100,
  `isAdmin` tinyint(1) DEFAULT 0,
  `enService` tinyint(1) NOT NULL DEFAULT 0,
  `lastpos` varchar(255) COLLATE utf8mb4_bin DEFAULT '{-887.48388671875, -2311.68872070313,  -3.50776553153992}',
  `grade` varchar(255) COLLATE utf8mb4_bin DEFAULT 'Aucun',
  `phone_number` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `inventaire` text COLLATE utf8mb4_bin NOT NULL,
  `identiter` text COLLATE utf8mb4_bin NOT NULL,
  `isFirstConnexion` tinyint(1) DEFAULT 1,
  KEY `KEY` (`license`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table gta_serveur.gta_joueurs : ~0 rows (environ)
/*!40000 ALTER TABLE `gta_joueurs` DISABLE KEYS */;
/*!40000 ALTER TABLE `gta_joueurs` ENABLE KEYS */;

-- Listage de la structure de la table gta_serveur. gta_joueurs_banni
DROP TABLE IF EXISTS `gta_joueurs_banni`;
CREATE TABLE IF NOT EXISTS `gta_joueurs_banni` (
  `license` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `nom` varchar(128) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `prenom` varchar(128) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `isBanned` tinyint(1) DEFAULT 0,
  `raison` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`license`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table gta_serveur.gta_joueurs_banni : ~0 rows (environ)
/*!40000 ALTER TABLE `gta_joueurs_banni` DISABLE KEYS */;
/*!40000 ALTER TABLE `gta_joueurs_banni` ENABLE KEYS */;

-- Listage de la structure de la table gta_serveur. gta_joueurs_humain
DROP TABLE IF EXISTS `gta_joueurs_humain`;
CREATE TABLE IF NOT EXISTS `gta_joueurs_humain` (
  `license` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `data_personnage` text COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`license`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table gta_serveur.gta_joueurs_humain : ~0 rows (environ)
/*!40000 ALTER TABLE `gta_joueurs_humain` DISABLE KEYS */;
/*!40000 ALTER TABLE `gta_joueurs_humain` ENABLE KEYS */;

-- Listage de la structure de la table gta_serveur. gta_joueurs_vehicle
DROP TABLE IF EXISTS `gta_joueurs_vehicle`;
CREATE TABLE IF NOT EXISTS `gta_joueurs_vehicle` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `vehicle_name` varchar(60) COLLATE utf8mb4_bin DEFAULT 'Véhicule',
  `vehicle_model` int(255) DEFAULT NULL,
  `vehicle_plate` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  `vehicle_state` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  `vehicle_colorprimary` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  `vehicle_colorsecondary` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  `vehicle_pearlescentcolor` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `vehicle_wheelcolor` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `zone_garage` varchar(155) COLLATE utf8mb4_bin DEFAULT 'Aucun',
  `proprietaire` varchar(155) COLLATE utf8mb4_bin DEFAULT 'Volé',
  `prix` int(255) DEFAULT 0,
  KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table gta_serveur.gta_joueurs_vehicle : ~0 rows (environ)
/*!40000 ALTER TABLE `gta_joueurs_vehicle` DISABLE KEYS */;
/*!40000 ALTER TABLE `gta_joueurs_vehicle` ENABLE KEYS */;

-- Listage de la structure de la table gta_serveur. gta_joueurs_vetement
DROP TABLE IF EXISTS `gta_joueurs_vetement`;
CREATE TABLE IF NOT EXISTS `gta_joueurs_vetement` (
  `license` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `topsID` int(125) DEFAULT 0,
  `topsDraw` int(125) DEFAULT 0,
  `topsCouleur` int(125) DEFAULT 0,
  `undershirtsID` int(125) DEFAULT 0,
  `undershirtsDraw` int(125) DEFAULT 0,
  `undershirtsCouleur` int(125) DEFAULT 0,
  `shoesID` int(125) DEFAULT 0,
  `shoesDraw` int(125) DEFAULT 0,
  `shoesCouleur` int(125) DEFAULT 0,
  `legsID` int(125) DEFAULT 0,
  `legsDraw` int(125) DEFAULT 0,
  `legsCouleur` int(125) DEFAULT 0,
  `torsosID` int(125) DEFAULT 0,
  `torsosDraw` int(125) DEFAULT 0,
  `AccessoiresID` int(125) DEFAULT 0,
  `AccessoiresDraw` int(125) DEFAULT 0,
  `AccessoiresCouleur` int(125) DEFAULT 0,
  `HatsID` int(125) DEFAULT 0,
  `HatsDraw` int(125) DEFAULT 0,
  `HatsCouleurs` int(125) DEFAULT 0,
  `MaskID` int(125) DEFAULT 1,
  `MaskDraw` int(125) DEFAULT 0,
  PRIMARY KEY (`license`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table gta_serveur.gta_joueurs_vetement : ~0 rows (environ)
/*!40000 ALTER TABLE `gta_joueurs_vetement` DISABLE KEYS */;
/*!40000 ALTER TABLE `gta_joueurs_vetement` ENABLE KEYS */;

-- Listage de la structure de la table gta_serveur. gta_medic_stockage
DROP TABLE IF EXISTS `gta_medic_stockage`;
CREATE TABLE IF NOT EXISTS `gta_medic_stockage` (
  `argent` int(11) unsigned DEFAULT 0,
  `argent_sale` int(11) unsigned DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table gta_serveur.gta_medic_stockage : ~0 rows (environ)
/*!40000 ALTER TABLE `gta_medic_stockage` DISABLE KEYS */;
INSERT INTO `gta_medic_stockage` (`argent`, `argent_sale`) VALUES
	(0, 0);
/*!40000 ALTER TABLE `gta_medic_stockage` ENABLE KEYS */;

-- Listage de la structure de la table gta_serveur. gta_metiers
DROP TABLE IF EXISTS `gta_metiers`;
CREATE TABLE IF NOT EXISTS `gta_metiers` (
  `metiers` varchar(50) NOT NULL DEFAULT '0',
  `salaire` int(11) NOT NULL DEFAULT 500,
  `emploi` varchar(50) DEFAULT 'public'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Listage des données de la table gta_serveur.gta_metiers : ~3 rows (environ)
/*!40000 ALTER TABLE `gta_metiers` DISABLE KEYS */;
INSERT INTO `gta_metiers` (`metiers`, `salaire`, `emploi`) VALUES
	('Chomeur', 150, 'public'),
	('LSPD', 500, 'priver'),
	('Medic', 500, 'public');
/*!40000 ALTER TABLE `gta_metiers` ENABLE KEYS */;

-- Listage de la structure de la table gta_serveur. phone_app_chat
DROP TABLE IF EXISTS `phone_app_chat`;
CREATE TABLE IF NOT EXISTS `phone_app_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- Listage des données de la table gta_serveur.phone_app_chat : ~0 rows (environ)
/*!40000 ALTER TABLE `phone_app_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_app_chat` ENABLE KEYS */;

-- Listage de la structure de la table gta_serveur. phone_calls
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

-- Listage des données de la table gta_serveur.phone_calls : ~0 rows (environ)
/*!40000 ALTER TABLE `phone_calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_calls` ENABLE KEYS */;

-- Listage de la structure de la table gta_serveur. phone_messages
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

-- Listage des données de la table gta_serveur.phone_messages : 0 rows
/*!40000 ALTER TABLE `phone_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_messages` ENABLE KEYS */;

-- Listage de la structure de la table gta_serveur. phone_users_contacts
DROP TABLE IF EXISTS `phone_users_contacts`;
CREATE TABLE IF NOT EXISTS `phone_users_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table gta_serveur.phone_users_contacts : 0 rows
/*!40000 ALTER TABLE `phone_users_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_users_contacts` ENABLE KEYS */;

-- Listage de la structure de la table gta_serveur. vehicle_inventory
DROP TABLE IF EXISTS `vehicle_inventory`;
CREATE TABLE IF NOT EXISTS `vehicle_inventory` (
  `owned` tinyint(1) DEFAULT 0,
  `quantity` int(11) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `item_name` varchar(55) DEFAULT NULL,
  `item_id` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Listage des données de la table gta_serveur.vehicle_inventory : ~0 rows (environ)
/*!40000 ALTER TABLE `vehicle_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_inventory` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

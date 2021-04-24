-- Listage de la structure de la table gta_serveur. gta_medic_stockage
DROP TABLE IF EXISTS `gta_medic_stockage`;
CREATE TABLE IF NOT EXISTS `gta_medic_stockage` (
  `argent` int(11) unsigned DEFAULT 0,
  `argent_sale` int(11) unsigned DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `gta_medic_stockage` (`argent`, `argent_sale`) VALUES
	(0, 0);

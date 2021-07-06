DROP TABLE IF EXISTS `gta_coffres`;
CREATE TABLE IF NOT EXISTS `gta_coffres` (
  `id_unique` text DEFAULT NULL,
  `dataCoffre` text DEFAULT NULL,
  `dataStorage` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'cultura'
-- 
-- ---

DROP TABLE IF EXISTS `cultura`;
		
CREATE TABLE `cultura` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `data_do_plantio` DATE NOT NULL,
  `area_plantio` DOUBLE NULL DEFAULT NULL,
  `variedade` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'sensores_instalados'
-- 
-- ---

DROP TABLE IF EXISTS `sensores_instalados`;
		
CREATE TABLE `sensores_instalados` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `data_da_instacao` DATE NULL DEFAULT NULL,
  `id_sensor` INTEGER NOT NULL,
  `id_cultura` INTEGER NOT NULL,
  `status` VARCHAR NULL DEFAULT NULL,
  `latitude` DOUBLE NULL DEFAULT NULL,
  `longitude` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'sensores'
-- 
-- ---

DROP TABLE IF EXISTS `sensores`;
		
CREATE TABLE `sensores` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `tipo_sensor` VARCHAR(255) NOT NULL,
  `fabricante` VARCHAR NULL DEFAULT NULL,
  `modelo` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'leituras'
-- 
-- ---

DROP TABLE IF EXISTS `leituras`;
		
CREATE TABLE `leituras` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `data_hora` DATETIME NOT NULL,
  `valor` DOUBLE NOT NULL,
  `id_sensor_instalado` INTEGER NOT NULL,
  `unidade_de_medida` VARCHAR NOT NULL,
  `observacoes` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'irrigacao'
-- 
-- ---

DROP TABLE IF EXISTS `irrigacao`;
		
CREATE TABLE `irrigacao` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `data_hora` DATETIME NOT NULL,
  `quantidade_agua_litros` DOUBLE NOT NULL,
  `id_cultura` INTEGER NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'aplicacao_de_vitaminas'
-- 
-- ---

DROP TABLE IF EXISTS `aplicacao_de_vitaminas`;
		
CREATE TABLE `aplicacao_de_vitaminas` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `data_hora` DATETIME NOT NULL,
  `tipo_vitamina` VARCHAR NOT NULL,
  `quantidade_de_vitamina` DOUBLE NOT NULL,
  `id_cultura` INTEGER NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `sensores_instalados` ADD FOREIGN KEY (id_sensor) REFERENCES `sensores` (`id`);
ALTER TABLE `sensores_instalados` ADD FOREIGN KEY (id_cultura) REFERENCES `cultura` (`id`);
ALTER TABLE `leituras` ADD FOREIGN KEY (id_sensor_instalado) REFERENCES `sensores_instalados` (`id`);
ALTER TABLE `irrigacao` ADD FOREIGN KEY (id_cultura) REFERENCES `cultura` (`id`);
ALTER TABLE `aplicacao_de_vitaminas` ADD FOREIGN KEY (id_cultura) REFERENCES `cultura` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `cultura` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `sensores_instalados` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `sensores` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `leituras` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `irrigacao` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `aplicacao_de_vitaminas` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `cultura` (`id`,`nome`,`data_do_plantio`,`area_plantio`,`variedade`) VALUES
-- ('','','','','');
-- INSERT INTO `sensores_instalados` (`id`,`data_da_instacao`,`id_sensor`,`id_cultura`,`status`,`latitude`,`longitude`) VALUES
-- ('','','','','','','');
-- INSERT INTO `sensores` (`id`,`tipo_sensor`,`fabricante`,`modelo`) VALUES
-- ('','','','');
-- INSERT INTO `leituras` (`id`,`data_hora`,`valor`,`id_sensor_instalado`,`unidade_de_medida`,`observacoes`) VALUES
-- ('','','','','','');
-- INSERT INTO `irrigacao` (`id`,`data_hora`,`quantidade_agua_litros`,`id_cultura`) VALUES
-- ('','','','');
-- INSERT INTO `aplicacao_de_vitaminas` (`id`,`data_hora`,`tipo_vitamina`,`quantidade_de_vitamina`,`id_cultura`) VALUES
-- ('','','','','');
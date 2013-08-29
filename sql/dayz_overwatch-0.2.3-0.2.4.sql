
USE `dayz_overwatch`;

CREATE TABLE IF NOT EXISTS `cust_loadout` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `inventory` varchar(2048) NOT NULL,
  `backpack` varchar(2048) NOT NULL,
  `model` varchar(100) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cust_loadout_profile` (
  `cust_loadout_id` bigint(20) unsigned NOT NULL,
  `unique_id` varchar(128) NOT NULL,
  PRIMARY KEY (`cust_loadout_id`,`unique_id`),
  KEY `fk2_cust_loadout_profile` (`unique_id`),
  CONSTRAINT `cust_loadout_profile_ibfk_1` FOREIGN KEY (`cust_loadout_id`) REFERENCES `cust_loadout` (`id`),
  CONSTRAINT `cust_loadout_profile_ibfk_2` FOREIGN KEY (`unique_id`) REFERENCES `profile` (`unique_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

UPDATE `vehicle` SET `class_name`='CPD_DZ' WHERE  `id`=324;
UPDATE `vehicle` SET `class_name`='CPD_U_DZ' WHERE  `id`=325;
INSERT INTO `vehicle` VALUES ('326', '350z_cream_DZ', '0.500', '0.850', '0.000', '0.200', '1', '1', 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[]');
INSERT INTO `vehicle` VALUES ('327', 'Camel_DZ', '0.700', '0.900', '0.100', '0.800', '1', '2', null, '[]');
INSERT INTO `vehicle` VALUES ('328', 'HMMWV_M2_DZ', '0.100', '0.700', '0.100', '0.800', '1', '1', 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[]');
INSERT INTO `vehicle` VALUES ('329', 'HMMWV_Armored_DZ', '0.100', '0.700', '0.100', '0.800', '1', '1', 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[]');
INSERT INTO `vehicle` VALUES ('330', 'MTVR_DZ', '0.100', '0.700', '0.100', '0.800', '1', '1', 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[]');
INSERT INTO `vehicle` VALUES ('331', 'Ural_CDF_DZ', '0.100', '0.700', '0.100', '0.800', '1', '1', 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[]');
INSERT INTO `world_vehicle` VALUES ('2061', '327', '1', '[279,[5248.29,2235.52,0.001]]', null, '0.900', null);
INSERT INTO `world_vehicle` VALUES ('2062', '327', '1', '[238,[4972.27,10011.8,0.076]]', null, '0.900', null);
INSERT INTO `world_vehicle` VALUES ('2063', '328', '1', '[181,[5447.24,3799.32,0.001]]', null, '0.900', null);
INSERT INTO `world_vehicle` VALUES ('2064', '329', '1', '[135,[6884.61,11459.3,0.001]]', null, '0.900', null);
INSERT INTO `world_vehicle` VALUES ('2065', '330', '1', '[70,[4302.27,8129.29,0.001]]', null, '0.900', null);
INSERT INTO `world_vehicle` VALUES ('2066', '331', '1', '[323,[6972.28,7699.71,0.001]]', null, '0.900', null);

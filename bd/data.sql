/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : inventory

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-08-25 14:28:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for act
-- ----------------------------
DROP TABLE IF EXISTS `act`;
CREATE TABLE `act` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `voucherc` (`voucher`),
  CONSTRAINT `voucherc` FOREIGN KEY (`voucher`) REFERENCES `voucher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of act
-- ----------------------------

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ukbrand` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('30', 'Apple');
INSERT INTO `brand` VALUES ('34', 'Asus');
INSERT INTO `brand` VALUES ('33', 'Motorola');
INSERT INTO `brand` VALUES ('24', 'Nokia');
INSERT INTO `brand` VALUES ('25', 'Samsung');
INSERT INTO `brand` VALUES ('35', 'Vaio');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ukcategory` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('10', 'Celular');
INSERT INTO `category` VALUES ('11', 'Laptop');
INSERT INTO `category` VALUES ('9', 'Tablet');

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(13) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(10) DEFAULT '',
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ukdni` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('6', '1707385985', 'Mario Oswaldo Salazar Silva', 'Quito Sur', '22621561', 'marinoswaldin@gmail.com');
INSERT INTO `client` VALUES ('7', '1478569874', 'Pablo Geovanny Salazar Ortiz', 'La colón', '98435637', 'pablosoa@gmail.com');
INSERT INTO `client` VALUES ('8', '17896541012', 'Paola Ramos', 'Ciudadela Ibarra', '098745694', 'conejita@gmail.com');
INSERT INTO `client` VALUES ('10', '1723713557', 'Pablo Iglesias', 'La forestal', '022621456', 'iglesia@pablo.com');
INSERT INTO `client` VALUES ('11', '1478963214', 'Leslie Peñaherrera', 'Las casas y Zapotillo', '022621561', 'lesliep@efefef.com');

-- ----------------------------
-- Table structure for detail
-- ----------------------------
DROP TABLE IF EXISTS `detail`;
CREATE TABLE `detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher` int(11) DEFAULT NULL,
  `product` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `voucher` (`voucher`),
  KEY `product` (`product`),
  CONSTRAINT `product` FOREIGN KEY (`product`) REFERENCES `product` (`id`),
  CONSTRAINT `voucher` FOREIGN KEY (`voucher`) REFERENCES `voucher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of detail
-- ----------------------------

-- ----------------------------
-- Table structure for location
-- ----------------------------
DROP TABLE IF EXISTS `location`;
CREATE TABLE `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ukname` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of location
-- ----------------------------
INSERT INTO `location` VALUES ('13', 'Bodega 1', 'descripcion');
INSERT INTO `location` VALUES ('14', 'Bodega 2', 'Sucursal 2');
INSERT INTO `location` VALUES ('15', 'Bodega 3', 'asdasd');

-- ----------------------------
-- Table structure for model
-- ----------------------------
DROP TABLE IF EXISTS `model`;
CREATE TABLE `model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `category` int(11) NOT NULL,
  `brand` int(11) NOT NULL,
  `unit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category` (`category`),
  KEY `brand` (`brand`),
  CONSTRAINT `brand` FOREIGN KEY (`brand`) REFERENCES `brand` (`id`),
  CONSTRAINT `category` FOREIGN KEY (`category`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of model
-- ----------------------------
INSERT INTO `model` VALUES ('14', 'SAMSUNG GALAXY S4', '10', '25', null);
INSERT INTO `model` VALUES ('15', 'GALAXY S2', '10', '25', null);

-- ----------------------------
-- Table structure for price
-- ----------------------------
DROP TABLE IF EXISTS `price`;
CREATE TABLE `price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variant` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `size` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variantprice` (`variant`),
  CONSTRAINT `variantprice` FOREIGN KEY (`variant`) REFERENCES `variant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of price
-- ----------------------------
INSERT INTO `price` VALUES ('2', '16', '15.00', '1', 'Unidad');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(255) NOT NULL,
  `admission` date DEFAULT NULL,
  `variant` int(11) DEFAULT NULL,
  `provider` int(11) DEFAULT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location` (`location`),
  KEY `provider` (`provider`),
  KEY `variant` (`variant`),
  CONSTRAINT `location` FOREIGN KEY (`location`) REFERENCES `location` (`id`),
  CONSTRAINT `provider` FOREIGN KEY (`provider`) REFERENCES `provider` (`id`),
  CONSTRAINT `variant` FOREIGN KEY (`variant`) REFERENCES `variant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of product
-- ----------------------------

-- ----------------------------
-- Table structure for provider
-- ----------------------------
DROP TABLE IF EXISTS `provider`;
CREATE TABLE `provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(13) DEFAULT '',
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(10) DEFAULT '',
  `email` varchar(100) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of provider
-- ----------------------------
INSERT INTO `provider` VALUES ('1', '10123654478', 'Gabriel ', 'Quito Sur', '2621561', null, null, null);

-- ----------------------------
-- Table structure for unit
-- ----------------------------
DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `smallDescription` varchar(50) DEFAULT '',
  `size` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of unit
-- ----------------------------
INSERT INTO `unit` VALUES ('1', 'Caja de 100 unidades', 'Caja/100', '100');
INSERT INTO `unit` VALUES ('2', 'Paquete de 4 unidades', 'Paq/4', '4');
INSERT INTO `unit` VALUES ('3', 'Paquete de 3 unidads', 'Paq/3', '3');
INSERT INTO `unit` VALUES ('4', 'Unidad', 'Unidad', '1');
INSERT INTO `unit` VALUES ('5', 'Rollo de 100 metros', 'Rollo/100', '1000');
INSERT INTO `unit` VALUES ('6', 'Rollo de 100 metros', 'Rollo/100', '100');
INSERT INTO `unit` VALUES ('7', 'Rollo de 45 metros', 'Rollo/45', '45');
INSERT INTO `unit` VALUES ('8', 'Libra', 'Libra', '1');
INSERT INTO `unit` VALUES ('9', 'Quintal', 'Quintal', '220');
INSERT INTO `unit` VALUES ('10', 'Paquete de 6 unidades', 'Paq/6', '6');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `rol` int(11) DEFAULT NULL,
  `password` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('17', 'Gabriel', 'Salazar', 'gabosoam', 'gaso621@gmail.com', null, '2', '$2a$08$nPFNxSIRzqI0BpcaQcevU..p7ipT2Ppa.LVcImxqO59ld9HeeYZnO');

-- ----------------------------
-- Table structure for variant
-- ----------------------------
DROP TABLE IF EXISTS `variant`;
CREATE TABLE `variant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT '',
  `model` int(11) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stockmin` int(11) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `model` (`model`),
  KEY `unit` (`unit`),
  CONSTRAINT `model` FOREIGN KEY (`model`) REFERENCES `model` (`id`),
  CONSTRAINT `unit` FOREIGN KEY (`unit`) REFERENCES `unit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of variant
-- ----------------------------
INSERT INTO `variant` VALUES ('16', 'XT-001', '14', 'SAMSUNG GALAXY S4 DORADO', '520.00', '120', '3');
INSERT INTO `variant` VALUES ('19', 'XT-002', '14', 'SAMSUNG GALAXY S4 ROJO', '1.00', '3', '2');
INSERT INTO `variant` VALUES ('20', 'XTRE25', '15', 'GALAXY S2 PAQUETE DE 4 UNIDADES', '0.00', '25', '6');

-- ----------------------------
-- Table structure for voucher
-- ----------------------------
DROP TABLE IF EXISTS `voucher`;
CREATE TABLE `voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client` (`cliente`),
  CONSTRAINT `client` FOREIGN KEY (`cliente`) REFERENCES `client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of voucher
-- ----------------------------

-- ----------------------------
-- View structure for v_brand
-- ----------------------------
DROP VIEW IF EXISTS `v_brand`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_brand` AS select `brand`.`id` AS `value`,`brand`.`name` AS `text` from `brand` ;

-- ----------------------------
-- View structure for v_category
-- ----------------------------
DROP VIEW IF EXISTS `v_category`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_category` AS select `category`.`id` AS `value`,`category`.`name` AS `text` from `category` ;

-- ----------------------------
-- View structure for v_unit
-- ----------------------------
DROP VIEW IF EXISTS `v_unit`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_unit` AS select `unit`.`id` AS `value`,`unit`.`smallDescription` AS `text` from `unit` ;

-- ----------------------------
-- View structure for v_unit2
-- ----------------------------
DROP VIEW IF EXISTS `v_unit2`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_unit2` AS select `model`.`id` AS `id`,`model`.`name` AS `name`,`category`.`name` AS `category`,`brand`.`name` AS `brand`,`unit`.`smallDescription` AS `description` from (((`model` join `category` on((`model`.`category` = `category`.`id`))) join `brand` on((`model`.`brand` = `brand`.`id`))) join `unit` on((`model`.`unit` = `unit`.`id`))) ;

-- ----------------------------
-- View structure for v_variant
-- ----------------------------
DROP VIEW IF EXISTS `v_variant`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_variant` AS select `variant`.`id` AS `id`,`variant`.`code` AS `code`,`variant`.`description` AS `description`,`model`.`name` AS `model`,`unit`.`description` AS `unit`,`category`.`name` AS `category`,`brand`.`name` AS `brand` from ((((`variant` join `unit` on((`variant`.`unit` = `unit`.`id`))) join `model` on((`variant`.`model` = `model`.`id`))) join `category` on((`model`.`category` = `category`.`id`))) join `brand` on((`model`.`brand` = `brand`.`id`))) ;

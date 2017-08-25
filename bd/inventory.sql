/*
Navicat MariaDB Data Transfer

Source Server         : Local
Source Server Version : 100207
Source Host           : localhost:3306
Source Database       : inventory

Target Server Type    : MariaDB
Target Server Version : 100207
File Encoding         : 65001

Date: 2017-08-18 17:40:18
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('27', 'Acer');
INSERT INTO `brand` VALUES ('23', 'Apple');
INSERT INTO `brand` VALUES ('28', 'Lenovo');
INSERT INTO `brand` VALUES ('26', 'Motorola');
INSERT INTO `brand` VALUES ('24', 'Nokia');
INSERT INTO `brand` VALUES ('25', 'Samsung');
INSERT INTO `brand` VALUES ('29', 'Toshiba');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('6', '1707385985', 'Mario Oswaldo Salazar Silva', 'Quito Sur', '22621561', 'marinoswaldin@gmail.com');
INSERT INTO `client` VALUES ('7', '1478569874', 'Pablo Geovanny Salazar Ortiz', 'La colón', '98435637', 'pablosoa@gmail.com');
INSERT INTO `client` VALUES ('8', '17896541012', 'Paola Ramos', 'Ciudadela Ibarra', '098745694', 'conejita@gmail.com');
INSERT INTO `client` VALUES ('10', '1723713557', 'Pablo Iglesias', 'La forestal', '022621456', 'iglesia@pablo.com');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of location
-- ----------------------------
INSERT INTO `location` VALUES ('13', 'Bodega 1', 'descripcion');
INSERT INTO `location` VALUES ('14', 'Bodega 2', 'Sucursal 2');

-- ----------------------------
-- Table structure for model
-- ----------------------------
DROP TABLE IF EXISTS `model`;
CREATE TABLE `model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `category` int(11) NOT NULL,
  `brand` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category` (`category`),
  KEY `brand` (`brand`),
  CONSTRAINT `brand` FOREIGN KEY (`brand`) REFERENCES `brand` (`id`),
  CONSTRAINT `category` FOREIGN KEY (`category`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of model
-- ----------------------------
INSERT INTO `model` VALUES ('12', 'Lumia 830', '9', '24');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of provider
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

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
  `password` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('16', 'Paolita', 'Ramos', 'ramito', 'paola@outlook.com', null, '1', '$2a$08$fOJ9h.fOuue9uP4AQGl4LOJTHk4HH2fwwIDZO75DNe69jWOg3jG0a');
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
  PRIMARY KEY (`id`),
  KEY `model` (`model`),
  CONSTRAINT `model` FOREIGN KEY (`model`) REFERENCES `model` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of variant
-- ----------------------------
INSERT INTO `variant` VALUES ('11', 'XTREDF', '12', 'Lumia 830 con cargador ', '450.00', '10');

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
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `v_brand` AS SELECT
brand.id as value,
brand.`name` as text
FROM
brand ;

-- ----------------------------
-- View structure for v_category
-- ----------------------------
DROP VIEW IF EXISTS `v_category`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `v_category` AS SELECT
category.id as value,
category.`name` as text
FROM
category ;
SET FOREIGN_KEY_CHECKS=1;

/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : inventory

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-09-28 22:20:04
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
  KEY `voucherc` (`voucher`) USING BTREE,
  CONSTRAINT `act_ibfk_1` FOREIGN KEY (`voucher`) REFERENCES `voucher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of act
-- ----------------------------

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` int(11) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ukreference` (`provider`,`reference`) USING BTREE,
  KEY `providerbill` (`provider`) USING BTREE,
  KEY `user` (`user`) USING BTREE,
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`provider`) REFERENCES `provider` (`id`),
  CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES ('21', '6', '1', '2017-09-28', '0008625', '29', '1');

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ukbrand` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('6', 'DAHUA');
INSERT INTO `brand` VALUES ('5', 'GRANDSTREAM');
INSERT INTO `brand` VALUES ('3', 'OTRO');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ukcategory` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('41', 'CÁMARA IP');
INSERT INTO `category` VALUES ('39', 'OTRO');
INSERT INTO `category` VALUES ('40', 'TELÉFONO IP');

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
  UNIQUE KEY `ukdni` (`dni`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('46', 'PRUEBA', 'PRUEBA', 'PRUEBA', '2456789', 'correo@prueba.com');

-- ----------------------------
-- Table structure for detail
-- ----------------------------
DROP TABLE IF EXISTS `detail`;
CREATE TABLE `detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher` int(11) DEFAULT NULL,
  `product` int(11) DEFAULT NULL,
  `observation` text,
  PRIMARY KEY (`id`),
  KEY `voucher` (`voucher`) USING BTREE,
  KEY `product` (`product`) USING BTREE,
  CONSTRAINT `detail_ibfk_1` FOREIGN KEY (`product`) REFERENCES `product` (`id`),
  CONSTRAINT `detail_ibfk_2` FOREIGN KEY (`voucher`) REFERENCES `voucher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;

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
  UNIQUE KEY `ukname` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of location
-- ----------------------------
INSERT INTO `location` VALUES ('13', 'SIN ASIGNAR', 'SIN DESCRIPCIÓN');
INSERT INTO `location` VALUES ('15', 'Q3', 'Q3');

-- ----------------------------
-- Table structure for model
-- ----------------------------
DROP TABLE IF EXISTS `model`;
CREATE TABLE `model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stockmin` int(11) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ukcode` (`code`) USING BTREE,
  KEY `unit` (`unit`) USING BTREE,
  KEY `brand` (`brand`) USING BTREE,
  KEY `category` (`category`) USING BTREE,
  CONSTRAINT `model_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `brand` (`id`),
  CONSTRAINT `model_ibfk_2` FOREIGN KEY (`category`) REFERENCES `category` (`id`),
  CONSTRAINT `model_ibfk_3` FOREIGN KEY (`unit`) REFERENCES `unit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of model
-- ----------------------------
INSERT INTO `model` VALUES ('8', 'GXP1610', 'GRANDSTREAM GXP-1610  IP PHONE  NO POE (GXP1610)', null, '20', '4', '40', '5');
INSERT INTO `model` VALUES ('9', 'UCM6202', 'GRANDSTREAM IP PBX APLIANCE UCM-6202 2FXS/2FXO (UCM6202)', null, '20', '4', '40', '5');
INSERT INTO `model` VALUES ('10', 'UCM6204', 'GRANDSTREAM IP PBX APLIANCE UCM-6204 2FXS/4FXO (UCM6204)', null, '20', '4', '40', '5');
INSERT INTO `model` VALUES ('11', 'GXW4104', 'GRANDSTREAM GXW-4104  GATEWAY 4 FXO PORTS 8/MC (GXW4104)', null, '25', '4', '40', '5');

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
  KEY `variantprice` (`variant`) USING BTREE,
  CONSTRAINT `price_ibfk_1` FOREIGN KEY (`variant`) REFERENCES `model` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of price
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(255) NOT NULL DEFAULT 'S/N',
  `variant` int(11) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `bill` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT '0.00',
  `state` int(11) DEFAULT '0',
  `observation` text,
  PRIMARY KEY (`id`),
  KEY `location` (`location`) USING BTREE,
  KEY `variant` (`variant`) USING BTREE,
  KEY `bill` (`bill`) USING BTREE,
  KEY `state` (`state`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`bill`) REFERENCES `bill` (`id`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`location`) REFERENCES `location` (`id`),
  CONSTRAINT `product_ibfk_3` FOREIGN KEY (`variant`) REFERENCES `model` (`id`),
  CONSTRAINT `state` FOREIGN KEY (`state`) REFERENCES `state` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=350 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('136', '20EZ1QFH30AF42E2', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('137', '20EZ1QFH30AF42E3', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('138', '20EZ1QFH30AF42E4', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('139', '20EZ1QFH30AF42E5', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('140', '20EZ1QFH30AF42E6', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('141', '20EZ1QFH30AF42E7', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('142', '20EZ1QFH30AF42E8', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('143', '20EZ1QFH30AF42E9', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('144', '20EZ1QFH30AF42EA', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('145', '20EZ1QFH30AF42EB', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('146', '20EZ1QFH30AF42EC', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('147', '20EZ1QFH30AF42ED', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('148', '20EZ1QFH30AF42EE', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('149', '20EZ1QFH30AF42EF', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('150', '20EZ1QFH30AF42F0', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('151', '20EZ1QFH30AF42F1', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('152', '20EZ1QFH30AF4542', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('153', '20EZ1QFH30AF4543', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('154', '20EZ1QFH30AF4544', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('155', '20EZ1QFH30AF4545', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('156', '20EZ1QFH30AF4546', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('157', '20EZ1QFH30AF4547', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('158', '20EZ1QFH30AF4548', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('159', '20EZ1QFH30AF4549', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('160', '20EZ1QFH30AF454A', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('161', '20EZ1QFH30AF454B', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('162', '20EZ1QFH30AF454C', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('163', '20EZ1QFH30AF454D', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('164', '20EZ1QFH30AF454E', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('165', '20EZ1QFH30AF454F', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('166', '20EZ1QFH30AF4550', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('167', '20EZ1QFH30AF4551', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('168', '20EZ1QFH30AF45A2', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('169', '20EZ1QFH30AF45A3', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('170', '20EZ1QFH30AF45A4', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('171', '20EZ1QFH30AF45A5', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('172', '20EZ1QFH30AF45A6', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('173', '20EZ1QFH30AF45A7', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('174', '20EZ1QFH30AF45A8', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('175', '20EZ1QFH30AF45A9', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('176', '20EZ1QFH30AF45AA', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('177', '20EZ1QFH30AF45AB', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('178', '20EZ1QFH30AF45AC', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('179', '20EZ1QFH30AF45AD', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('180', '20EZ1QFH30AF45AE', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('181', '20EZ1QFH30AF45AF', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('182', '20EZ1QFH30AF45B0', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('183', '20EZ1QFH30AF45B1', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('184', '20EZ1QFH30AF45C2', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('185', '20EZ1QFH30AF45C3', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('186', '20EZ1QFH30AF45C4', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('187', '20EZ1QFH30AF45C5', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('188', '20EZ1QFH30AF45C6', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('189', '20EZ1QFH30AF45C7', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('190', '20EZ1QFH30AF45C8', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('191', '20EZ1QFH30AF45C9', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('192', '20EZ1QFH30AF45CA', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('193', '20EZ1QFH30AF45CB', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('194', '20EZ1QFH30AF45CC', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('195', '20EZ1QFH30AF45CD', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('196', '20EZ1QFH30AF45CE', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('197', '20EZ1QFH30AF45CF', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('198', '20EZ1QFH30AF45D0', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('199', '20EZ1QFH30AF45D1', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('200', '20EZ1QFH30AF45F2', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('201', '20EZ1QFH30AF45F3', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('202', '20EZ1QFH30AF45F4', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('203', '20EZ1QFH30AF45F5', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('204', '20EZ1QFH30AF45F6', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('205', '20EZ1QFH30AF45F7', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('206', '20EZ1QFH30AF45F8', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('207', '20EZ1QFH30AF45F9', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('208', '20EZ1QFH30AF45FA', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('209', '20EZ1QFH30AF45FB', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('210', '20EZ1QFH30AF45FC', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('211', '20EZ1QFH30AF45FD', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('212', '20EZ1QFH30AF45FE', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('213', '20EZ1QFH30AF45FF', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('214', '20EZ1QFH30AF4600', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('215', '20EZ1QFH30AF4601', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('216', '20EZ1QFH30AF4688', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('217', '20EZ1QFH30AF46C2', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('218', '20EZ1QFH30AF46C3', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('219', '20EZ1QFH30AF46C4', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('220', '20EZ1QFH30AF46C5', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('221', '20EZ1QFH30AF46C6', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('222', '20EZ1QFH30AF46C7', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('223', '20EZ1QFH30AF46C8', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('224', '20EZ1QFH30AF46C9', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('225', '20EZ1QFH30AF46CA', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('226', '20EZ1QFH30AF46CB', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('227', '20EZ1QFH30AF46CC', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('228', '20EZ1QFH30AF46CD', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('229', '20EZ1QFH30AF46CE', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('230', '20EZ1QFH30AF46CF', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('231', '20EZ1QFH30AF46D0', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('232', '20EZ1QFH30AF46D1', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('233', '20EZ1QFH30AF4D83', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('234', '20EZ1QFH30AF4D85', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('235', '20EZ1QFH30AF4D87', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('236', '20EZ1QFH30AF4D8A', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('237', '20EZ1QFH30AF4D8C', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('238', '20EZ1QFH30AF4D8F', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('239', '20EZ1QFH30AF4D90', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('240', '20EZ1QFH30AF5122', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('241', '20EZ1QFH30AF5123', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('242', '20EZ1QFH30AF5124', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('243', '20EZ1QFH30AF5125', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('244', '20EZ1QFH30AF5126', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('245', '20EZ1QFH30AF5127', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('246', '20EZ1QFH30AF5128', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('247', '20EZ1QFH30AF5129', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('248', '20EZ1QFH30AF512A', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('249', '20EZ1QFH30AF512B', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('250', '20EZ1QFH30AF512C', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('251', '20EZ1QFH30AF512D', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('252', '20EZ1QFH30AF512E', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('253', '20EZ1QFH30AF512F', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('254', '20EZ1QFH30AF5130', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('255', '20EZ1QFH30AF5131', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('256', '20EZ1QFH30AF5132', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('257', '20EZ1QFH30AF5133', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('258', '20EZ1QFH30AF5134', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('259', '20EZ1QFH30AF5135', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('260', '20EZ1QFH30AF5136', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('261', '20EZ1QFH30AF5137', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('262', '20EZ1QFH30AF5138', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('263', '20EZ1QFH30AF5139', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('264', '20EZ1QFH30AF513A', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('265', '20EZ1QFH30AF513B', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('266', '20EZ1QFH30AF513C', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('267', '20EZ1QFH30AF513D', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('268', '20EZ1QFH30AF513E', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('269', '20EZ1QFH30AF513F', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('270', '20EZ1QFH30AF5140', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('271', '20EZ1QFH30AF5141', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('272', '20EZ1QFH30AF51A2', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('273', '20EZ1QFH30AF51A3', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('274', '20EZ1QFH30AF51A4', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('275', '20EZ1QFH30AF51A5', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('276', '20EZ1QFH30AF51A6', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('277', '20EZ1QFH30AF51A7', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('278', '20EZ1QFH30AF51A8', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('279', '20EZ1QFH30AF51A9', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('280', '20EZ1QFH30AF51AA', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('281', '20EZ1QFH30AF51AB', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('282', '20EZ1QFH30AF51AC', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('283', '20EZ1QFH30AF51AD', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('284', '20EZ1QFH30AF51AE', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('285', '20EZ1QFH30AF51AF', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('286', '20EZ1QFH30AF51B0', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('287', '20EZ1QFH30AF51B1', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('288', '20EZ1QFH30AF5202', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('289', '20EZ1QFH30AF5203', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('290', '20EZ1QFH30AF5204', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('291', '20EZ1QFH30AF5205', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('292', '20EZ1QFH30AF5206', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('293', '20EZ1QFH30AF5207', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('294', '20EZ1QFH30AF5208', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('295', '20EZ1QFH30AF5209', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('296', '20EZ1QFH30AF520A', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('297', '20EZ1QFH30AF520B', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('298', '20EZ1QFH30AF520C', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('299', '20EZ1QFH30AF520D', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('300', '20EZ1QFH30AF520E', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('301', '20EZ1QFH30AF520F', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('302', '20EZ1QFH30AF5210', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('303', '20EZ1QFH30AF5211', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('304', '20EZ1QFH30AF5252', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('305', '20EZ1QFH30AF5253', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('306', '20EZ1QFH30AF5254', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('307', '20EZ1QFH30AF5255', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('308', '20EZ1QFH30AF5256', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('309', '20EZ1QFH30AF5257', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('310', '20EZ1QFH30AF5258', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('311', '20EZ1QFH30AF5259', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('312', '20EZ1QFH30AF525A', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('313', '20EZ1QFH30AF525B', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('314', '20EZ1QFH30AF525C', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('315', '20EZ1QFH30AF525D', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('316', '20EZ1QFH30AF525E', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('317', '20EZ1QFH30AF525F', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('318', '20EZ1QFH30AF5260', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('319', '20EZ1QFH30AF5261', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('320', '20EZ1QFH30AFA8EA', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('321', '20EZ1QFH30AFA8EB', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('322', '20EZ1QFH30AFA8EC', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('323', '20EZ1QFH30AFA8ED', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('324', '20EZ1QFH30AFA8EE', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('325', '20EZ1QFH30AFA8EF', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('326', '20EZ1QFH30AFA8F0', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('327', '20EZ1QFH30AFA8F1', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('328', '20EZ1QFH30AFA8F2', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('329', '20EZ1QFH30AFA8F3', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('330', '20EZ1QFH30AFA8F4', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('331', '20EZ1QFH30AFA8F5', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('332', '20EZ1QFH30AFA8F6', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('333', '20EZ1QFH30AFA8F7', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('334', '20EZ1QFH30AFA8F8', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('335', '20EZ1QFH30AFA8F9', '8', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('336', '21AWMJNH50B6E070', '9', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('337', '21AWMJNH50B6E071', '9', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('338', '21AWMJNH50B6E072', '9', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('339', '21AWMJNH50B6E073', '9', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('340', '21AWMJNH50B6E074', '9', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('341', '21AWMJNH50B6E075', '9', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('342', '21AWMJNH50B6E076', '9', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('343', '21AWMJNH50B6E077', '9', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('344', '21AWMFQH20AD2FCA', '10', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('345', '21AWMFQH20AD2FCB', '10', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('346', '21AWKDDH40B438B5', '11', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('347', '21AWKDDH40B438BA', '11', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('348', '21AWKDDH40B43955', '11', '13', '21', '0.00', '0', null);
INSERT INTO `product` VALUES ('349', '21AWKDDH40B43956', '11', '13', '21', '0.00', '0', null);

-- ----------------------------
-- Table structure for provider
-- ----------------------------
DROP TABLE IF EXISTS `provider`;
CREATE TABLE `provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(13) DEFAULT '',
  `name` varchar(100) DEFAULT NULL,
  `address` text,
  `phone` varchar(10) DEFAULT '',
  `email` varchar(100) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of provider
-- ----------------------------
INSERT INTO `provider` VALUES ('5', '0992146818001', 'ZC MAYORISTAS S.A.', 'AV. CARLOS PLAZA DAÑIN S/N FRENTE AL POLICENTRO -C.C. PLAZA QUIL LOCAL', '042-286683', null, null, null);
INSERT INTO `provider` VALUES ('6', 'S/R', 'IPDORAL', 'IP DORAL. 3655 NW 115 AVE. DORAL FL, 33178', 'S/T', null, null, null);

-- ----------------------------
-- Table structure for state
-- ----------------------------
DROP TABLE IF EXISTS `state`;
CREATE TABLE `state` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of state
-- ----------------------------
INSERT INTO `state` VALUES ('0', 'EN BODEGA');
INSERT INTO `state` VALUES ('1', 'ENTREGADO');
INSERT INTO `state` VALUES ('2', 'RESERVADO');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of unit
-- ----------------------------
INSERT INTO `unit` VALUES ('4', 'UNIDAD', 'UNIDAD', '1');

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `ukusername` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('28', 'ADMIN', '', 'admin', 'gabrielsalazar@outlook.com', '1', '2', '$2a$08$lSSWFGgaBm3KK9aBm4ifqufsj/I6K4LWu/AhCgqqMlJ.v/TVULXGu');
INSERT INTO `user` VALUES ('29', 'GABRIEL', 'SALAZAR', 'gsalazar', 'gabosoam621@gmail.com', '1', '1', '$2a$08$z4ngzGny7SckrA3P58MCfuXddouwD4PqUEXOt/oo7//CuWeg0zeme');
INSERT INTO `user` VALUES ('30', 'WILLIAM', 'ROMERO', 'wromero', 'wromero@cineto.net', '1', '1', '$2a$08$mLu.eKMGGs00EWRFw5Gi2uzcCtZNIaZo7ih/vWd4PUJA1IWH9Zu5q');
INSERT INTO `user` VALUES ('31', 'SANTIAGO', 'PÉREZ', 'sperez', 'sperez@cineto.net', '1', '1', '$2a$08$qjVL.TzCngQE.oRUyQO0ZeEgPtxb9CvjSHlcvUZITgepktq6Dz7dq');
INSERT INTO `user` VALUES ('32', 'ALEX', 'CATUCUAMBA', 'acatucuamba', 'acatucuamba@cineto.net', '1', '1', '$2a$08$3RSuy6pKIwMfu6AQMOfjre7PLIWXk3A9Z33.KLwZUcDNShejJ4qHa');
INSERT INTO `user` VALUES ('34', 'MIGUEL', 'TUPIZA', 'mtupiza', 'mtupiza@cineto.net', '1', '1', '$2a$08$MymwL9C3fyI9ZGctB2DN9.xjvGLYaD4mlIn87cdvICmcNb.jQosga');
INSERT INTO `user` VALUES ('35', 'CINETO', 'TELECOMUNICACIONES', 'cineto', 'info@cineto.net', '1', '2', '$2a$08$1l82UNNu7eLaLegejR1OyOGJ4q2VcMQZFf.pMi7zcGcyr8JaODBCm');
INSERT INTO `user` VALUES ('36', 'SANTIAGO', 'REYES', 'sreyes', 'sreyes@cineto.net', '1', '1', '$2a$08$eAGYLnVcs5VY4RtQqOUHaufn6UwDoOmhKEJD3aP.QBxZlF/xKebrC');
INSERT INTO `user` VALUES ('37', 'MARIO', 'PALOMO', 'mpalomo', 'mpalomo@cineto.net', '1', '1', '$2a$08$Wkj.0oY6Anrp3.s8H1BfHOSjrGSdjm94CClyWLEun8fcMxf2IfI.i');

-- ----------------------------
-- Table structure for voucher
-- ----------------------------
DROP TABLE IF EXISTS `voucher`;
CREATE TABLE `voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client` int(11) NOT NULL,
  `date` text,
  `reference` text,
  `type` tinyint(4) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `client` (`client`) USING BTREE,
  KEY `user` (`user`),
  CONSTRAINT `user` FOREIGN KEY (`user`) REFERENCES `user` (`id`),
  CONSTRAINT `voucher_ibfk_1` FOREIGN KEY (`client`) REFERENCES `client` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of voucher
-- ----------------------------
INSERT INTO `voucher` VALUES ('25', '46', '2017-9-28', '12', null, '29', '0');

-- ----------------------------
-- View structure for v_bill
-- ----------------------------
DROP VIEW IF EXISTS `v_bill`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_bill` AS select `product`.`id` AS `id`,`model`.`id` AS `model`,`product`.`barcode` AS `barcode`,`model`.`code` AS `code`,`model`.`code` AS `Producto`,`model`.`description` AS `description`,`product`.`bill` AS `bill`,`location`.`name` AS `location`,`category`.`name` AS `category`,`brand`.`name` AS `brand`,`product`.`price` AS `price` from ((((`product` join `model` on((`product`.`variant` = `model`.`id`))) left join `location` on((`product`.`location` = `location`.`id`))) left join `category` on((`model`.`category` = `category`.`id`))) left join `brand` on((`model`.`brand` = `brand`.`id`))) ;

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
-- View structure for v_client
-- ----------------------------
DROP VIEW IF EXISTS `v_client`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_client` AS select `client`.`id` AS `value`,`client`.`name` AS `text`,`client`.`dni` AS `dni`,`client`.`address` AS `address`,`client`.`phone` AS `phone`,`client`.`email` AS `email` from `client` ;

-- ----------------------------
-- View structure for v_detail
-- ----------------------------
DROP VIEW IF EXISTS `v_detail`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_detail` AS select `client`.`name` AS `name`,`product`.`barcode` AS `barcode`,`model`.`description` AS `description`,`model`.`code` AS `code`,`detail`.`voucher` AS `voucher`,`detail`.`id` AS `id`,`product`.`id` AS `idproduct`,`detail`.`observation` AS `observation` from ((((`detail` join `voucher` on((`detail`.`voucher` = `voucher`.`id`))) join `client` on((`voucher`.`client` = `client`.`id`))) join `product` on((`detail`.`product` = `product`.`id`))) join `model` on((`product`.`variant` = `model`.`id`))) ;

-- ----------------------------
-- View structure for v_infobill
-- ----------------------------
DROP VIEW IF EXISTS `v_infobill`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_infobill` AS select `bill`.`id` AS `id`,`provider`.`name` AS `name`,date_format(`bill`.`date`,'%d-%m-%Y') AS `date`,`bill`.`reference` AS `reference`,concat(`user`.`name`,' ',`user`.`lastname`) AS `user`,`user`.`id` AS `iduser`,`bill`.`state` AS `state` from ((`bill` join `provider` on((`bill`.`provider` = `provider`.`id`))) join `user` on((`bill`.`user` = `user`.`id`))) ;

-- ----------------------------
-- View structure for v_model
-- ----------------------------
DROP VIEW IF EXISTS `v_model`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_model` AS select `model`.`id` AS `id`,`model`.`code` AS `code`,`model`.`description` AS `description`,`unit`.`description` AS `unit`,`category`.`name` AS `category`,`brand`.`name` AS `brand` from (((`model` left join `unit` on((`model`.`unit` = `unit`.`id`))) left join `category` on((`model`.`category` = `category`.`id`))) left join `brand` on((`model`.`brand` = `brand`.`id`))) ;

-- ----------------------------
-- View structure for v_modelbill
-- ----------------------------
DROP VIEW IF EXISTS `v_modelbill`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_modelbill` AS select `model`.`id` AS `id`,concat(`model`.`code`,' - ',`model`.`description`) AS `description` from `model` ;

-- ----------------------------
-- View structure for v_product
-- ----------------------------
DROP VIEW IF EXISTS `v_product`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_product` AS select `product`.`barcode` AS `barcode`,`model`.`code` AS `code`,`model`.`description` AS `description`,`category`.`name` AS `category`,`brand`.`name` AS `brand`,`bill`.`date` AS `date`,`bill`.`reference` AS `reference`,`location`.`name` AS `location`,`product`.`observation` AS `observation`,`bill`.`state` AS `billstate`,`product`.`id` AS `id`,`state`.`name` AS `state`,`product`.`state` AS `stateid` from ((((((`product` left join `model` on((`product`.`variant` = `model`.`id`))) left join `category` on((`model`.`category` = `category`.`id`))) left join `brand` on((`model`.`brand` = `brand`.`id`))) left join `bill` on((`product`.`bill` = `bill`.`id`))) left join `location` on((`product`.`location` = `location`.`id`))) join `state` on((`product`.`state` = `state`.`id`))) order by `bill`.`date` desc,`model`.`code` ;

-- ----------------------------
-- View structure for v_provider
-- ----------------------------
DROP VIEW IF EXISTS `v_provider`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_provider` AS select `provider`.`id` AS `value`,`provider`.`name` AS `text` from `provider` ;

-- ----------------------------
-- View structure for v_unit
-- ----------------------------
DROP VIEW IF EXISTS `v_unit`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_unit` AS select `unit`.`id` AS `value`,`unit`.`smallDescription` AS `text` from `unit` ;

-- ----------------------------
-- View structure for v_user
-- ----------------------------
DROP VIEW IF EXISTS `v_user`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_user` AS select `user`.`id` AS `value`,concat(`user`.`name`,' ',`user`.`lastname`) AS `text` from `user` ;

-- ----------------------------
-- View structure for v_voucher
-- ----------------------------
DROP VIEW IF EXISTS `v_voucher`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_voucher` AS select `voucher`.`id` AS `id`,`voucher`.`date` AS `date`,`voucher`.`reference` AS `reference`,`voucher`.`type` AS `type`,`client`.`name` AS `name`,concat(`user`.`name`,' ',`user`.`lastname`) AS `user`,`user`.`id` AS `iduser`,`voucher`.`state` AS `state` from ((`voucher` join `client` on((`voucher`.`client` = `client`.`id`))) join `user` on((`voucher`.`user` = `user`.`id`))) ;

-- ----------------------------
-- Function structure for prodasd
-- ----------------------------
DROP FUNCTION IF EXISTS `prodasd`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `prodasd`(`barcode` text) RETURNS text CHARSET utf8
BEGIN
	DECLARE mensaje text;

IF EXISTS(SELECT id FROM product WHERE barcode=barcode) THEN
SET mensaje = 'hola';
ELSE
SET mensaje = 'chau';
END IF;

	RETURN mensaje;
END
;;
DELIMITER ;

/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : inventory

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-09-28 17:54:31
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES ('20', '5', '2', '2017-09-28', '1', '29', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of detail
-- ----------------------------
INSERT INTO `detail` VALUES ('62', '24', '131', 'se daño');
INSERT INTO `detail` VALUES ('63', '24', '132', 'se daño');
INSERT INTO `detail` VALUES ('64', '24', '133', 'se daño');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of model
-- ----------------------------
INSERT INTO `model` VALUES ('7', '12345', 'PRODUCTO 1', null, '12', '4', '40', '5');

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
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('131', '25', '7', null, '20', '12.00', '1', 'ENTRO DAÑADO');
INSERT INTO `product` VALUES ('132', '26', '7', null, '20', '12.00', '1', 'ENTRO DAÑADO');
INSERT INTO `product` VALUES ('133', '27', '7', null, '20', '12.00', '1', 'ENTRO DAÑADO');
INSERT INTO `product` VALUES ('134', '28', '7', '15', '20', '12.00', '0', 'ENTRO DAÑADO');
INSERT INTO `product` VALUES ('135', '29', '7', '15', '20', '12.00', '0', 'ENTRO DAÑADO');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of provider
-- ----------------------------
INSERT INTO `provider` VALUES ('5', '0992146818001', 'ZC MAYORISTAS S.A.', 'AV. CARLOS PLAZA DAÑIN S/N FRENTE AL POLICENTRO -C.C. PLAZA QUIL LOCAL', '042-286683', null, null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of voucher
-- ----------------------------
INSERT INTO `voucher` VALUES ('24', '46', '2017-9-22', '1', null, '29', '1');

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

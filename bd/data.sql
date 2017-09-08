/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : inventory

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-09-08 17:46:14
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
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` int(11) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `providerbill` (`provider`),
  CONSTRAINT `providerbill` FOREIGN KEY (`provider`) REFERENCES `provider` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES ('21', '2', '1', '2017-09-08', '025');
INSERT INTO `bill` VALUES ('22', '1', '2', '2017-09-08', '025');
INSERT INTO `bill` VALUES ('23', '1', '2', '2017-09-08', 'PRUEBA');

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ukbrand` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('2', 'INTEBRAS');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ukcategory` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'OTRO');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('14', '1723713556', 'Gabriel Salazar', 'Qito Sur', '2621561', 'gabrielsalazar@outlook.com');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of location
-- ----------------------------
INSERT INTO `location` VALUES ('13', 'Bodega 1', 'descripcion');

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
  UNIQUE KEY `ukname` (`description`),
  UNIQUE KEY `ukcode` (`code`),
  KEY `unit` (`unit`),
  KEY `brand` (`brand`),
  KEY `category` (`category`),
  CONSTRAINT `brand` FOREIGN KEY (`brand`) REFERENCES `brand` (`id`),
  CONSTRAINT `category` FOREIGN KEY (`category`) REFERENCES `category` (`id`),
  CONSTRAINT `unit` FOREIGN KEY (`unit`) REFERENCES `unit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of model
-- ----------------------------
INSERT INTO `model` VALUES ('1', '4000094', 'TELEFONO TC 60 ID NEGRO EXP', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('2', '4007608', 'TERMINAL DEDICADO CON CENTRAL CONDOMINAL', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('3', '4013330', 'HSB50 TELEFONE HEADSET INTELBRAS', null, '50', '5', '1', '2');
INSERT INTO `model` VALUES ('4', '4030156', 'TELÉFONO ALÁMBRICO CID TC 2110', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('5', '4060595', 'TELEFONO VOIP TS60 IPR', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('6', '4070599', 'TELEFONO SEM FIO T60 IP', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('7', '4080107', 'PLENO NEGRO-TELÉFONO ALÁMBRICO BÁSICO', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('8', '4111111', 'INTERFACE CELULAR ITC 4100', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('9', '4115000', 'BASE ITC4000 i INTELBRAS', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('10', '4120020', 'TELEFONO INALAMBRICO DIGITAL TS 3533', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('11', '4310012', 'TELEFONO EJECUTIVO TE 220', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('12', '4340002', 'GATEWAY GSM IP GW280', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('13', '4340004', 'GSM GW180 ESPANHOL PRETO GATEWAY', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('14', '4340010', 'CENTRAL IP DECT T60 IP', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('15', '4400145', 'PLACA DE EXPANSAO GW280', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('16', '4501003', 'PORTERO XPE 1001 PLUS 2', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('17', '4501004', 'PORTERO XPE 1001 PLUS', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('18', '4501013', 'PORTERO XPE 1013 PLUS', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('19', '4503101', 'CENTRAL CP 112 BASICA', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('20', '4504500', 'LLAVERO RFID MIFARE XID1000', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('21', '4505000', 'VIDEO PORTERO IP TVIP1000HF', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('22', '4505200', 'CONVERSOR AUT AC/DC 24V 2,5A', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('23', '4505300', 'DISTRIBUIDOR DE VIDEO PORTERO IP DVIP1000', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('24', '4520801', 'MÓDULO INTERNO PARA VIDEO PORTERO IV 7000 HF IN', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('25', '4564004', 'CAMERA DE VIDEO IP BULLET P/SIST SEG VIP S3020', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('26', '4564008', 'CAMARA IP VIP S3020 GENERACIÓN 2', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('27', '4580155', 'GRAVADOR DIG. DE IMAGEM NVD 1008', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('28', '4700001', 'ATA GKM 2210 T', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('29', '4750031', 'ROTEADOR WIRELESS HOTSPOT 300', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('30', '4920440', 'CP 48/112 PLACA 16 RAMAIS BAL', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('31', '4920463', 'PLACA 32 ABONADOS CP192/CP352 BALANCEADA', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('32', '4990083', 'TARJETA 4 INTERNOS/EXTENSIONES ANALOGAS IMPACTA', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('33', '4990084', 'TARJETA DOS TRONCALES ANÁLOGAS IMPACTA 16/40/68I', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('34', '4990260', 'PLACA FXS CIP 850', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('35', '4990261', 'PLACA FXO CIP 850', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('36', '7896637643542', 'CAMARA IP VIP S4100', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('37', '7896637644969', 'CAMARA IP VIP S4120', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('38', '963-01001-42 B', 'VIDEO PHONE GRANDSTREAM BLACK (GXV300)', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('40', 'TC8312', 'TELEFONO DESIGN ROJO TC 8312', null, '50', '4', '1', '2');
INSERT INTO `model` VALUES ('41', 'TS 3532', 'EBA', null, '50', '4', '1', '2');

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
  CONSTRAINT `fkmodel` FOREIGN KEY (`variant`) REFERENCES `model` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of price
-- ----------------------------
INSERT INTO `price` VALUES ('1', '28', '25.00', '1', '4');

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
  PRIMARY KEY (`id`),
  KEY `location` (`location`),
  KEY `variant` (`variant`),
  KEY `bill` (`bill`),
  CONSTRAINT `bill` FOREIGN KEY (`bill`) REFERENCES `bill` (`id`),
  CONSTRAINT `location` FOREIGN KEY (`location`) REFERENCES `location` (`id`),
  CONSTRAINT `model` FOREIGN KEY (`variant`) REFERENCES `model` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=881 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', 'MLYD4800012E7', '28', '13', '21');
INSERT INTO `product` VALUES ('2', 'MLYD4800040XT', '28', '13', '21');
INSERT INTO `product` VALUES ('3', 'MLYD4800013MX', '28', '13', '21');
INSERT INTO `product` VALUES ('4', 'MLYD4800017IG', '28', '13', '21');
INSERT INTO `product` VALUES ('5', 'MLYD4800039WX', '28', '13', '21');
INSERT INTO `product` VALUES ('6', 'DCRD2300733ZB', '9', '13', '21');
INSERT INTO `product` VALUES ('7', '9JIE3400128AV', '26', '13', '21');
INSERT INTO `product` VALUES ('8', '9JIE34001214A', '26', '13', '21');
INSERT INTO `product` VALUES ('9', '9JIE34001259J', '26', '13', '21');
INSERT INTO `product` VALUES ('10', 'OD12122005797', '36', '13', '21');
INSERT INTO `product` VALUES ('11', '8R3B3600022OM', '37', '13', '21');
INSERT INTO `product` VALUES ('12', '1M9E3100328OJ', '25', '13', '21');
INSERT INTO `product` VALUES ('13', '1M9E3200059PK', '25', '13', '21');
INSERT INTO `product` VALUES ('14', '1M9E3100324VA', '25', '13', '21');
INSERT INTO `product` VALUES ('15', '1M9E3100326V4', '25', '13', '21');
INSERT INTO `product` VALUES ('16', '1M9E3100330VB', '25', '13', '21');
INSERT INTO `product` VALUES ('17', '1M9E3100327SV', '25', '13', '21');
INSERT INTO `product` VALUES ('18', '1M9E31003234A', '25', '13', '21');
INSERT INTO `product` VALUES ('19', '1M9E3100325VC', '25', '13', '21');
INSERT INTO `product` VALUES ('20', '1M9E3100331XM', '25', '13', '21');
INSERT INTO `product` VALUES ('21', '1M9E3100329F1', '25', '13', '21');
INSERT INTO `product` VALUES ('22', '1M9E3200061JN', '25', '13', '21');
INSERT INTO `product` VALUES ('23', '1M9E3100332DF', '25', '13', '21');
INSERT INTO `product` VALUES ('24', '1M9E3200060N8', '25', '13', '21');
INSERT INTO `product` VALUES ('25', 'N42D4500072XW', '19', '13', '21');
INSERT INTO `product` VALUES ('26', 'N42F10001992H', '19', '13', '21');
INSERT INTO `product` VALUES ('27', 'N42F2300021PM', '19', '13', '21');
INSERT INTO `product` VALUES ('28', 'KMNE39000241T', '14', '13', '21');
INSERT INTO `product` VALUES ('29', 'KMNE3900036FH', '14', '13', '21');
INSERT INTO `product` VALUES ('30', 'QW9C3300634FD', '22', '13', '21');
INSERT INTO `product` VALUES ('31', 'QW9C3300631QP', '22', '13', '21');
INSERT INTO `product` VALUES ('32', 'QW9C3300701WN', '22', '13', '21');
INSERT INTO `product` VALUES ('33', 'QW9C33007037V', '22', '13', '21');
INSERT INTO `product` VALUES ('34', 'QW9C3300644VX', '22', '13', '21');
INSERT INTO `product` VALUES ('35', 'QW9C3300643AO', '22', '13', '21');
INSERT INTO `product` VALUES ('36', 'QW9C3300645TF', '22', '13', '21');
INSERT INTO `product` VALUES ('37', 'QW9C3300660BW', '22', '13', '21');
INSERT INTO `product` VALUES ('38', 'QW9C3300633QX', '22', '13', '21');
INSERT INTO `product` VALUES ('39', 'QW9C33006425T', '22', '13', '21');
INSERT INTO `product` VALUES ('40', 'QW9C3300635RQ', '22', '13', '21');
INSERT INTO `product` VALUES ('41', 'QW9C3300704P0', '22', '13', '21');
INSERT INTO `product` VALUES ('42', 'C6XF1300075F4', '30', '13', '21');
INSERT INTO `product` VALUES ('43', 'C6XF1900063YA', '30', '13', '21');
INSERT INTO `product` VALUES ('44', 'C6XF1900065TX', '30', '13', '21');
INSERT INTO `product` VALUES ('45', 'C6XF1900093MC', '30', '13', '21');
INSERT INTO `product` VALUES ('46', 'C6XF1900089BB', '30', '13', '21');
INSERT INTO `product` VALUES ('47', 'C6XF1900057VX', '30', '13', '21');
INSERT INTO `product` VALUES ('48', 'C6XF190007890', '30', '13', '21');
INSERT INTO `product` VALUES ('49', 'C6XF1300045B2', '30', '13', '21');
INSERT INTO `product` VALUES ('50', 'C6XF1900062B7', '30', '13', '21');
INSERT INTO `product` VALUES ('51', 'C6XF1900066CM', '30', '13', '21');
INSERT INTO `product` VALUES ('52', 'C6XF1900025AW', '30', '13', '21');
INSERT INTO `product` VALUES ('53', 'C6XF19000141R', '30', '13', '21');
INSERT INTO `product` VALUES ('54', 'C6XF1300061Y7', '30', '13', '21');
INSERT INTO `product` VALUES ('55', 'C6XF1900019P4', '30', '13', '21');
INSERT INTO `product` VALUES ('56', 'C6XF1900064RV', '30', '13', '21');
INSERT INTO `product` VALUES ('57', 'C6XF19000218M', '30', '13', '21');
INSERT INTO `product` VALUES ('58', 'C6XF19000918G', '30', '13', '21');
INSERT INTO `product` VALUES ('59', 'C6XF1900016VI', '30', '13', '21');
INSERT INTO `product` VALUES ('60', '34XC3300479AO', '23', '13', '21');
INSERT INTO `product` VALUES ('61', '34XC3300459XH', '23', '13', '21');
INSERT INTO `product` VALUES ('62', '34XC3300475JT', '23', '13', '21');
INSERT INTO `product` VALUES ('63', '34XC3300462II', '23', '13', '21');
INSERT INTO `product` VALUES ('64', '34XC3300487SV', '23', '13', '21');
INSERT INTO `product` VALUES ('65', '34XC33004780Q', '23', '13', '21');
INSERT INTO `product` VALUES ('66', '34XC3300470HG', '23', '13', '21');
INSERT INTO `product` VALUES ('67', '34XC33004027R', '23', '13', '21');
INSERT INTO `product` VALUES ('68', '34XC3300502L5', '23', '13', '21');
INSERT INTO `product` VALUES ('69', '34XC33004529B', '23', '13', '21');
INSERT INTO `product` VALUES ('70', '34XC33004646M', '23', '13', '21');
INSERT INTO `product` VALUES ('71', '34XC3300485HW', '23', '13', '21');
INSERT INTO `product` VALUES ('72', '01XD38000235M', '12', '13', '21');
INSERT INTO `product` VALUES ('73', '6LIE0400049PN', '27', '13', '21');
INSERT INTO `product` VALUES ('74', '6LIE0400060HU', '27', '13', '21');
INSERT INTO `product` VALUES ('75', '6LIE0400096YI', '27', '13', '21');
INSERT INTO `product` VALUES ('76', '6LIE040005000', '27', '13', '21');
INSERT INTO `product` VALUES ('77', '6LIE0400006ZW', '27', '13', '21');
INSERT INTO `product` VALUES ('78', '4A3D5100004GV', '13', '13', '21');
INSERT INTO `product` VALUES ('79', '1T5E3501123T8', '3', '13', '21');
INSERT INTO `product` VALUES ('80', '1T5E3501121TR', '3', '13', '21');
INSERT INTO `product` VALUES ('81', '1T5E35010604U', '3', '13', '21');
INSERT INTO `product` VALUES ('82', '1T5E3501102DJ', '3', '13', '21');
INSERT INTO `product` VALUES ('83', '1T5E3501105YK', '3', '13', '21');
INSERT INTO `product` VALUES ('84', '1T5E3501097WR', '3', '13', '21');
INSERT INTO `product` VALUES ('85', '1T5E3501099OG', '3', '13', '21');
INSERT INTO `product` VALUES ('86', '1T5E35010564Y', '3', '13', '21');
INSERT INTO `product` VALUES ('87', '1T5E3501100DG', '3', '13', '21');
INSERT INTO `product` VALUES ('88', '1T5E35010577Q', '3', '13', '21');
INSERT INTO `product` VALUES ('89', '1T5E3501104W4', '3', '13', '21');
INSERT INTO `product` VALUES ('90', '1T5E35010980G', '3', '13', '21');
INSERT INTO `product` VALUES ('91', '1T5E35011096T', '3', '13', '21');
INSERT INTO `product` VALUES ('92', '1T5E3501063ZV', '3', '13', '21');
INSERT INTO `product` VALUES ('93', '1T5E3501061WX', '3', '13', '21');
INSERT INTO `product` VALUES ('94', '1T5E35010592Y', '3', '13', '21');
INSERT INTO `product` VALUES ('95', '1T5E3501110QD', '3', '13', '21');
INSERT INTO `product` VALUES ('96', '1T5E3501124FT', '3', '13', '21');
INSERT INTO `product` VALUES ('97', '1T5E35010580R', '3', '13', '21');
INSERT INTO `product` VALUES ('98', '1T5E3501108Z4', '3', '13', '21');
INSERT INTO `product` VALUES ('99', '1T5E3501103GZ', '3', '13', '21');
INSERT INTO `product` VALUES ('100', '1T5E3501101NA', '3', '13', '21');
INSERT INTO `product` VALUES ('101', '1T5E350109689', '3', '13', '21');
INSERT INTO `product` VALUES ('102', '1T5E3501122CQ', '3', '13', '21');
INSERT INTO `product` VALUES ('103', '1T5E35010642T', '3', '13', '21');
INSERT INTO `product` VALUES ('104', '1T5E3501065O2', '3', '13', '21');
INSERT INTO `product` VALUES ('105', '1T5E35010625Q', '3', '13', '21');
INSERT INTO `product` VALUES ('106', '1T5E3501106Z4', '3', '13', '21');
INSERT INTO `product` VALUES ('107', '1T5E3501125OD', '3', '13', '21');
INSERT INTO `product` VALUES ('108', 'LVSF2000010X1', '8', '13', '21');
INSERT INTO `product` VALUES ('109', 'LVSF2000068NI', '8', '13', '21');
INSERT INTO `product` VALUES ('110', 'LVSF20000567U', '8', '13', '21');
INSERT INTO `product` VALUES ('111', 'LVSF2000001RG', '8', '13', '21');
INSERT INTO `product` VALUES ('112', 'LVSF20000791B', '8', '13', '21');
INSERT INTO `product` VALUES ('113', 'LVSF2000071VP', '8', '13', '21');
INSERT INTO `product` VALUES ('114', 'LVSF2000075EN', '8', '13', '21');
INSERT INTO `product` VALUES ('115', 'LVSF200002617', '8', '13', '21');
INSERT INTO `product` VALUES ('116', 'LVSF20000783J', '8', '13', '21');
INSERT INTO `product` VALUES ('117', 'LVSF2000048U4', '8', '13', '21');
INSERT INTO `product` VALUES ('118', 'LVSF2000038KF', '8', '13', '21');
INSERT INTO `product` VALUES ('119', 'LVSF2000028NN', '8', '13', '21');
INSERT INTO `product` VALUES ('120', 'LVSF2000015S3', '8', '13', '21');
INSERT INTO `product` VALUES ('121', 'LVSF20000679U', '8', '13', '21');
INSERT INTO `product` VALUES ('122', 'LVSF2000016YB', '8', '13', '21');
INSERT INTO `product` VALUES ('123', 'LVSF20000200A', '8', '13', '21');
INSERT INTO `product` VALUES ('124', 'LVSF2000036XT', '8', '13', '21');
INSERT INTO `product` VALUES ('125', 'LVSF2000033H1', '8', '13', '21');
INSERT INTO `product` VALUES ('126', 'LVSF20000778M', '8', '13', '21');
INSERT INTO `product` VALUES ('127', 'LVSF2000055VR', '8', '13', '21');
INSERT INTO `product` VALUES ('128', 'LVSF2000018U5', '8', '13', '21');
INSERT INTO `product` VALUES ('129', 'LVSF2000014E4', '8', '13', '21');
INSERT INTO `product` VALUES ('130', 'LVSF20000434R', '8', '13', '21');
INSERT INTO `product` VALUES ('131', 'LVSF2000061XD', '8', '13', '21');
INSERT INTO `product` VALUES ('132', 'LVSF2000076UE', '8', '13', '21');
INSERT INTO `product` VALUES ('133', 'LVSF20000229U', '8', '13', '21');
INSERT INTO `product` VALUES ('134', 'LVSF200002358', '8', '13', '21');
INSERT INTO `product` VALUES ('135', 'LVSF2000040AE', '8', '13', '21');
INSERT INTO `product` VALUES ('136', 'LVSF20000216B', '8', '13', '21');
INSERT INTO `product` VALUES ('137', 'LVSF2000053YO', '8', '13', '21');
INSERT INTO `product` VALUES ('138', 'LVSF200000563', '8', '13', '21');
INSERT INTO `product` VALUES ('139', 'LVSF2000073AL', '8', '13', '21');
INSERT INTO `product` VALUES ('140', 'LVSF2000012EK', '8', '13', '21');
INSERT INTO `product` VALUES ('141', 'LVSF2000049S1', '8', '13', '21');
INSERT INTO `product` VALUES ('142', 'LVSF2000060RW', '8', '13', '21');
INSERT INTO `product` VALUES ('143', 'LVSF2000025WI', '8', '13', '21');
INSERT INTO `product` VALUES ('144', 'LVSF2000042QC', '8', '13', '21');
INSERT INTO `product` VALUES ('145', 'LVSF2000057NN', '8', '13', '21');
INSERT INTO `product` VALUES ('146', 'LVSF2000041MG', '8', '13', '21');
INSERT INTO `product` VALUES ('147', 'LVSF2000008S1', '8', '13', '21');
INSERT INTO `product` VALUES ('148', 'LVSF2000035TG', '8', '13', '21');
INSERT INTO `product` VALUES ('149', 'LVSF2000017BW', '8', '13', '21');
INSERT INTO `product` VALUES ('150', 'LVSF2000003KR', '8', '13', '21');
INSERT INTO `product` VALUES ('151', 'LVSF2000031SN', '8', '13', '21');
INSERT INTO `product` VALUES ('152', 'LVSF2000024VP', '8', '13', '21');
INSERT INTO `product` VALUES ('153', 'LVSF2000027KO', '8', '13', '21');
INSERT INTO `product` VALUES ('154', 'LVSF20000653M', '8', '13', '21');
INSERT INTO `product` VALUES ('155', 'S/S', '20', '13', '21');
INSERT INTO `product` VALUES ('156', 'S/S', '20', '13', '21');
INSERT INTO `product` VALUES ('157', 'B6AD4000026O7', '24', '13', '21');
INSERT INTO `product` VALUES ('158', 'IQHE1300140K0', '31', '13', '21');
INSERT INTO `product` VALUES ('159', 'AHCD2900007NM', '15', '13', '21');
INSERT INTO `product` VALUES ('160', 'CA11072902691', '35', '13', '21');
INSERT INTO `product` VALUES ('161', 'CA11030300155', '34', '13', '21');
INSERT INTO `product` VALUES ('162', '0N4F2002308ZU', '7', '13', '21');
INSERT INTO `product` VALUES ('163', '0N4E15003758U', '7', '13', '21');
INSERT INTO `product` VALUES ('164', '0N4F2002271CI', '7', '13', '21');
INSERT INTO `product` VALUES ('165', '0N4E1500370KH', '7', '13', '21');
INSERT INTO `product` VALUES ('166', '0N4E1500936LS', '7', '13', '21');
INSERT INTO `product` VALUES ('167', '0N4E15009597V', '7', '13', '21');
INSERT INTO `product` VALUES ('168', '0N4E1500403OP', '7', '13', '21');
INSERT INTO `product` VALUES ('169', '0N4E1500675HR', '7', '13', '21');
INSERT INTO `product` VALUES ('170', '0N4E150096013', '7', '13', '21');
INSERT INTO `product` VALUES ('171', '0N4E1500676L8', '7', '13', '21');
INSERT INTO `product` VALUES ('172', '0N4E15009564C', '7', '13', '21');
INSERT INTO `product` VALUES ('173', '0N4E1500654PZ', '7', '13', '21');
INSERT INTO `product` VALUES ('174', '0N4F20012430Y', '7', '13', '21');
INSERT INTO `product` VALUES ('175', '0N4E15006776D', '7', '13', '21');
INSERT INTO `product` VALUES ('176', '0N4F2001280UR', '7', '13', '21');
INSERT INTO `product` VALUES ('177', '0N4F2001260F2', '7', '13', '21');
INSERT INTO `product` VALUES ('178', '0N4F20023385G', '7', '13', '21');
INSERT INTO `product` VALUES ('179', '0N4F20022650C', '7', '13', '21');
INSERT INTO `product` VALUES ('180', '0N4E1500376VD', '7', '13', '21');
INSERT INTO `product` VALUES ('181', '0N4F2002264KZ', '7', '13', '21');
INSERT INTO `product` VALUES ('182', '0N4E150037235', '7', '13', '21');
INSERT INTO `product` VALUES ('183', '0N4E1500655WL', '7', '13', '21');
INSERT INTO `product` VALUES ('184', '0N4F2002325M0', '7', '13', '21');
INSERT INTO `product` VALUES ('185', '0N4F2001277JL', '7', '13', '21');
INSERT INTO `product` VALUES ('186', '0N4F2002317X2', '7', '13', '21');
INSERT INTO `product` VALUES ('187', '0N4F20012450T', '7', '13', '21');
INSERT INTO `product` VALUES ('188', '0N4F2001244P4', '7', '13', '21');
INSERT INTO `product` VALUES ('189', '0N4F20012493L', '7', '13', '21');
INSERT INTO `product` VALUES ('190', '0N4F2002306MM', '7', '13', '21');
INSERT INTO `product` VALUES ('191', '0N4F2002323WD', '7', '13', '21');
INSERT INTO `product` VALUES ('192', '0N4E15003799V', '7', '13', '21');
INSERT INTO `product` VALUES ('193', '0N4E1500377S9', '7', '13', '21');
INSERT INTO `product` VALUES ('194', '0N4E1500657ZV', '7', '13', '21');
INSERT INTO `product` VALUES ('195', '0N4E1500939TP', '7', '13', '21');
INSERT INTO `product` VALUES ('196', '0N4E1500940OJ', '7', '13', '21');
INSERT INTO `product` VALUES ('197', '0N4F2001281NP', '7', '13', '21');
INSERT INTO `product` VALUES ('198', '0N4F200127931', '7', '13', '21');
INSERT INTO `product` VALUES ('199', '0N4F2001256XF', '7', '13', '21');
INSERT INTO `product` VALUES ('200', '0N4F2002328RC', '7', '13', '21');
INSERT INTO `product` VALUES ('201', '0N4F20023197F', '7', '13', '21');
INSERT INTO `product` VALUES ('202', '0N4F2002313KS', '7', '13', '21');
INSERT INTO `product` VALUES ('203', '0N4F2002320SE', '7', '13', '21');
INSERT INTO `product` VALUES ('204', '0N4F20023216Y', '7', '13', '21');
INSERT INTO `product` VALUES ('205', '0N4F2002316GC', '7', '13', '21');
INSERT INTO `product` VALUES ('206', '0N4F20023229H', '7', '13', '21');
INSERT INTO `product` VALUES ('207', '0N4E1500378NB', '7', '13', '21');
INSERT INTO `product` VALUES ('208', '0N4F2002315S2', '7', '13', '21');
INSERT INTO `product` VALUES ('209', '0N4F20022607H', '7', '13', '21');
INSERT INTO `product` VALUES ('210', '0N4E150037334', '7', '13', '21');
INSERT INTO `product` VALUES ('211', '0N4F20012487W', '7', '13', '21');
INSERT INTO `product` VALUES ('212', '0N4E1500937XY', '7', '13', '21');
INSERT INTO `product` VALUES ('213', '0N4E1500374RF', '7', '13', '21');
INSERT INTO `product` VALUES ('214', '0N4F200125024', '7', '13', '21');
INSERT INTO `product` VALUES ('215', '0N4F2002259X3', '7', '13', '21');
INSERT INTO `product` VALUES ('216', '0N4F2001257SJ', '7', '13', '21');
INSERT INTO `product` VALUES ('217', '0N4F2002268UW', '7', '13', '21');
INSERT INTO `product` VALUES ('218', '0N4F2002314EC', '7', '13', '21');
INSERT INTO `product` VALUES ('219', '0N4F2001258FZ', '7', '13', '21');
INSERT INTO `product` VALUES ('220', '0N4F200231084', '7', '13', '21');
INSERT INTO `product` VALUES ('221', '0N4F2002270Y1', '7', '13', '21');
INSERT INTO `product` VALUES ('222', '0N4F2002261EN', '7', '13', '21');
INSERT INTO `product` VALUES ('223', '0N4E1500678SH', '7', '13', '21');
INSERT INTO `product` VALUES ('224', '0N4E15006725F', '7', '13', '21');
INSERT INTO `product` VALUES ('225', '0N4E1500674G8', '7', '13', '21');
INSERT INTO `product` VALUES ('226', '0N4F2002267SD', '7', '13', '21');
INSERT INTO `product` VALUES ('227', '0N4F2002327CO', '7', '13', '21');
INSERT INTO `product` VALUES ('228', '0N4E1500658SB', '7', '13', '21');
INSERT INTO `product` VALUES ('229', '0N4F2001246SA', '7', '13', '21');
INSERT INTO `product` VALUES ('230', '0N4F2000275KM', '7', '13', '21');
INSERT INTO `product` VALUES ('231', '0N4F200124140', '7', '13', '21');
INSERT INTO `product` VALUES ('232', '0N4E1500656IW', '7', '13', '21');
INSERT INTO `product` VALUES ('233', '0N4F200230792', '7', '13', '21');
INSERT INTO `product` VALUES ('234', '0N4F20012783K', '7', '13', '21');
INSERT INTO `product` VALUES ('235', '0N4F2002326Q7', '7', '13', '21');
INSERT INTO `product` VALUES ('236', '0N4F20012428V', '7', '13', '21');
INSERT INTO `product` VALUES ('237', '0N4E15006710M', '7', '13', '21');
INSERT INTO `product` VALUES ('238', '0N4E1500669JM', '7', '13', '21');
INSERT INTO `product` VALUES ('239', '0N4E15006704S', '7', '13', '21');
INSERT INTO `product` VALUES ('240', '0N4E15009384E', '7', '13', '21');
INSERT INTO `product` VALUES ('241', '0N4F20023090B', '7', '13', '21');
INSERT INTO `product` VALUES ('242', '0N4E15006736H', '7', '13', '21');
INSERT INTO `product` VALUES ('243', '0N4E1500371D7', '7', '13', '21');
INSERT INTO `product` VALUES ('244', '0N4F2001259J3', '7', '13', '21');
INSERT INTO `product` VALUES ('245', 'N0WC210000621', '16', '13', '21');
INSERT INTO `product` VALUES ('246', 'N0WC2100005NO', '16', '13', '21');
INSERT INTO `product` VALUES ('247', 'N0WC2100090HX', '16', '13', '21');
INSERT INTO `product` VALUES ('248', '036F2200002KK', '17', '13', '21');
INSERT INTO `product` VALUES ('249', 'N0WC2100004TU', '16', '13', '21');
INSERT INTO `product` VALUES ('250', '036F2200021O4', '17', '13', '21');
INSERT INTO `product` VALUES ('251', '036F2200012Q8', '17', '13', '21');
INSERT INTO `product` VALUES ('252', '036F2200011YR', '17', '13', '21');
INSERT INTO `product` VALUES ('253', '036F2200019GY', '17', '13', '21');
INSERT INTO `product` VALUES ('254', '036F2200018IR', '17', '13', '21');
INSERT INTO `product` VALUES ('255', '036F2200001G3', '17', '13', '21');
INSERT INTO `product` VALUES ('256', '036F22000034B', '17', '13', '21');
INSERT INTO `product` VALUES ('257', '036F220002006', '17', '13', '21');
INSERT INTO `product` VALUES ('258', '036F22000221P', '17', '13', '21');
INSERT INTO `product` VALUES ('259', 'ENFF1600089HM', '18', '13', '21');
INSERT INTO `product` VALUES ('260', 'ENFF2001284EN', '18', '13', '21');
INSERT INTO `product` VALUES ('261', 'ENFF1900321UW', '18', '13', '21');
INSERT INTO `product` VALUES ('262', 'ENFF16000655B', '18', '13', '21');
INSERT INTO `product` VALUES ('263', 'ENFF200128373', '18', '13', '21');
INSERT INTO `product` VALUES ('264', 'ENFF19003208H', '18', '13', '21');
INSERT INTO `product` VALUES ('265', 'ENFF160008809', '18', '13', '21');
INSERT INTO `product` VALUES ('266', 'ENFF1900323BX', '18', '13', '21');
INSERT INTO `product` VALUES ('267', 'ENFF1900322OW', '18', '13', '21');
INSERT INTO `product` VALUES ('268', 'ENFF1900319Z9', '18', '13', '21');
INSERT INTO `product` VALUES ('269', 'LWFF2300724P5', '29', '13', '21');
INSERT INTO `product` VALUES ('270', 'LWFF23007739A', '29', '13', '21');
INSERT INTO `product` VALUES ('271', 'LWFF23012418V', '29', '13', '21');
INSERT INTO `product` VALUES ('272', 'LWFF2300731R5', '29', '13', '21');
INSERT INTO `product` VALUES ('273', 'LWFF2202802YC', '29', '13', '21');
INSERT INTO `product` VALUES ('274', 'LWFE38008890F', '29', '13', '21');
INSERT INTO `product` VALUES ('275', 'LWFF23012369T', '29', '13', '21');
INSERT INTO `product` VALUES ('276', 'LWFF230114808', '29', '13', '21');
INSERT INTO `product` VALUES ('277', 'LWFF2301146UH', '29', '13', '21');
INSERT INTO `product` VALUES ('278', 'LWFF2301239CW', '29', '13', '21');
INSERT INTO `product` VALUES ('279', 'LWFF23012374R', '29', '13', '21');
INSERT INTO `product` VALUES ('280', 'LWFF2300756P3', '29', '13', '21');
INSERT INTO `product` VALUES ('281', 'LWFF230072213', '29', '13', '21');
INSERT INTO `product` VALUES ('282', 'LWFF2301233WB', '29', '13', '21');
INSERT INTO `product` VALUES ('283', 'LWFF230078177', '29', '13', '21');
INSERT INTO `product` VALUES ('284', 'LWFF2300710QJ', '29', '13', '21');
INSERT INTO `product` VALUES ('285', 'LWFF23007181H', '29', '13', '21');
INSERT INTO `product` VALUES ('286', 'LWFF2301240UI', '29', '13', '21');
INSERT INTO `product` VALUES ('287', 'LWFF2300723MP', '29', '13', '21');
INSERT INTO `product` VALUES ('288', 'LWFE1203759QY', '29', '13', '21');
INSERT INTO `product` VALUES ('289', 'LWFE3800879WF', '29', '13', '21');
INSERT INTO `product` VALUES ('290', 'LWFE38008919C', '29', '13', '21');
INSERT INTO `product` VALUES ('291', 'LWFF230072654', '29', '13', '21');
INSERT INTO `product` VALUES ('292', 'LWFF2300752RL', '29', '13', '21');
INSERT INTO `product` VALUES ('293', 'LWFE3800880OW', '29', '13', '21');
INSERT INTO `product` VALUES ('294', 'LWFE3800878YH', '29', '13', '21');
INSERT INTO `product` VALUES ('295', 'LWFE3800894T9', '29', '13', '21');
INSERT INTO `product` VALUES ('296', 'LWFE3800934E4', '29', '13', '21');
INSERT INTO `product` VALUES ('297', 'LWFF2301234JE', '29', '13', '21');
INSERT INTO `product` VALUES ('298', 'LWFE38008932C', '29', '13', '21');
INSERT INTO `product` VALUES ('299', 'LWFF2301147MP', '29', '13', '21');
INSERT INTO `product` VALUES ('300', 'LWFE380089226', '29', '13', '21');
INSERT INTO `product` VALUES ('301', 'LWFF2300758XW', '29', '13', '21');
INSERT INTO `product` VALUES ('302', 'LWFE380089509', '29', '13', '21');
INSERT INTO `product` VALUES ('303', 'LWFE38009321C', '29', '13', '21');
INSERT INTO `product` VALUES ('304', 'LWFF2202810NI', '29', '13', '21');
INSERT INTO `product` VALUES ('305', 'LWFE38009318Q', '29', '13', '21');
INSERT INTO `product` VALUES ('306', 'LWFF2300703LA', '29', '13', '21');
INSERT INTO `product` VALUES ('307', 'LWFF2300714V1', '29', '13', '21');
INSERT INTO `product` VALUES ('308', 'LWFF2300715Y4', '29', '13', '21');
INSERT INTO `product` VALUES ('309', 'LWFF2300716Y5', '29', '13', '21');
INSERT INTO `product` VALUES ('310', 'LWFF23007197G', '29', '13', '21');
INSERT INTO `product` VALUES ('311', 'LWFF2300713VX', '29', '13', '21');
INSERT INTO `product` VALUES ('312', 'LWFF2300708RI', '29', '13', '21');
INSERT INTO `product` VALUES ('313', 'LWFF2300704QF', '29', '13', '21');
INSERT INTO `product` VALUES ('314', 'LWFF2300717PY', '29', '13', '21');
INSERT INTO `product` VALUES ('315', 'LWFF2301235Y2', '29', '13', '21');
INSERT INTO `product` VALUES ('316', 'LWFF2300721ZC', '29', '13', '21');
INSERT INTO `product` VALUES ('317', 'LWFF2202809F9', '29', '13', '21');
INSERT INTO `product` VALUES ('318', 'LWFF2202808NP', '29', '13', '21');
INSERT INTO `product` VALUES ('319', 'LWFF2202807Z8', '29', '13', '21');
INSERT INTO `product` VALUES ('320', 'LWFF2301238VO', '29', '13', '21');
INSERT INTO `product` VALUES ('321', 'LWFF2301136QH', '29', '13', '21');
INSERT INTO `product` VALUES ('322', 'LWFF2300709BA', '29', '13', '21');
INSERT INTO `product` VALUES ('323', 'LWFF23007252B', '29', '13', '21');
INSERT INTO `product` VALUES ('324', 'LWFF2300782J0', '29', '13', '21');
INSERT INTO `product` VALUES ('325', 'LWFE1203641JZ', '29', '13', '21');
INSERT INTO `product` VALUES ('326', 'LWFE1203576MK', '29', '13', '21');
INSERT INTO `product` VALUES ('327', 'LWFE1203668HU', '29', '13', '21');
INSERT INTO `product` VALUES ('328', 'LWFE1203594SG', '29', '13', '21');
INSERT INTO `product` VALUES ('329', 'LWFF2202806KI', '29', '13', '21');
INSERT INTO `product` VALUES ('330', 'LWFF2301242ZH', '29', '13', '21');
INSERT INTO `product` VALUES ('331', 'LWFE1203741ZL', '29', '13', '21');
INSERT INTO `product` VALUES ('332', 'LWFF2300768E0', '29', '13', '21');
INSERT INTO `product` VALUES ('333', 'LWFF2301243VZ', '29', '13', '21');
INSERT INTO `product` VALUES ('334', 'LWFE1203805KF', '29', '13', '21');
INSERT INTO `product` VALUES ('335', 'LWFF2301221IT', '29', '13', '21');
INSERT INTO `product` VALUES ('336', 'LWFE1203749PH', '29', '13', '21');
INSERT INTO `product` VALUES ('337', 'LWFF2300767VY', '29', '13', '21');
INSERT INTO `product` VALUES ('338', 'LWFF2300791CA', '29', '13', '21');
INSERT INTO `product` VALUES ('339', 'LWFE1203597RS', '29', '13', '21');
INSERT INTO `product` VALUES ('340', 'BO3E2100566SQ', '32', '13', '21');
INSERT INTO `product` VALUES ('341', 'BO3E3400436X3', '32', '13', '21');
INSERT INTO `product` VALUES ('342', 'AOXE34001254W', '33', '13', '21');
INSERT INTO `product` VALUES ('343', 'PLKE2900179L2', '4', '13', '21');
INSERT INTO `product` VALUES ('344', 'PLKE2900309D8', '4', '13', '21');
INSERT INTO `product` VALUES ('345', 'PLKE2904798SZ', '4', '13', '21');
INSERT INTO `product` VALUES ('346', 'PLKE2906116BJ', '4', '13', '21');
INSERT INTO `product` VALUES ('347', 'PLKE29003404R', '4', '13', '21');
INSERT INTO `product` VALUES ('348', 'PLKE2900499IP', '4', '13', '21');
INSERT INTO `product` VALUES ('349', 'PLKE2900778YK', '4', '13', '21');
INSERT INTO `product` VALUES ('350', 'PLKE290077921', '4', '13', '21');
INSERT INTO `product` VALUES ('351', 'PLKE29007801F', '4', '13', '21');
INSERT INTO `product` VALUES ('352', 'PLKE2900776YB', '4', '13', '21');
INSERT INTO `product` VALUES ('353', 'PLKE2900775YB', '4', '13', '21');
INSERT INTO `product` VALUES ('354', 'PLKE2900777KG', '4', '13', '21');
INSERT INTO `product` VALUES ('355', 'PLKE2906120Z7', '4', '13', '21');
INSERT INTO `product` VALUES ('356', 'PLKE2906089K3', '4', '13', '21');
INSERT INTO `product` VALUES ('357', 'PLKE29003382M', '4', '13', '21');
INSERT INTO `product` VALUES ('358', 'PLKE29061189W', '4', '13', '21');
INSERT INTO `product` VALUES ('359', 'PLKE2906115VS', '4', '13', '21');
INSERT INTO `product` VALUES ('360', 'PLKE2906799TX', '4', '13', '21');
INSERT INTO `product` VALUES ('361', 'PLKE2900341W2', '4', '13', '21');
INSERT INTO `product` VALUES ('362', 'PLKE2902652BE', '4', '13', '21');
INSERT INTO `product` VALUES ('363', 'PLKE290062589', '4', '13', '21');
INSERT INTO `product` VALUES ('364', 'PLKE2900627BX', '4', '13', '21');
INSERT INTO `product` VALUES ('365', 'PLKE29006281R', '4', '13', '21');
INSERT INTO `product` VALUES ('366', 'PLKE29006292C', '4', '13', '21');
INSERT INTO `product` VALUES ('367', 'PLKE2900339JB', '4', '13', '21');
INSERT INTO `product` VALUES ('368', 'PLKE29048004T', '4', '13', '21');
INSERT INTO `product` VALUES ('369', 'PLKE2900337D7', '4', '13', '21');
INSERT INTO `product` VALUES ('370', 'PLKE2900145HS', '4', '13', '21');
INSERT INTO `product` VALUES ('371', 'PLKE2900342EI', '4', '13', '21');
INSERT INTO `product` VALUES ('372', 'PLKE29001478B', '4', '13', '21');
INSERT INTO `product` VALUES ('373', 'PLKE2902650KW', '4', '13', '21');
INSERT INTO `product` VALUES ('374', 'PLKE2904797PA', '4', '13', '21');
INSERT INTO `product` VALUES ('375', 'PLKE2906090CR', '4', '13', '21');
INSERT INTO `product` VALUES ('376', 'PLKE290479508', '4', '13', '21');
INSERT INTO `product` VALUES ('377', 'PLKE2904796Q0', '4', '13', '21');
INSERT INTO `product` VALUES ('378', 'PLKE2900630K8', '4', '13', '21');
INSERT INTO `product` VALUES ('379', 'PLKE2906806QH', '4', '13', '21');
INSERT INTO `product` VALUES ('380', 'PLKE2900296TV', '4', '13', '21');
INSERT INTO `product` VALUES ('381', 'PLKE2900297L0', '4', '13', '21');
INSERT INTO `product` VALUES ('382', 'PLKE2900501KG', '4', '13', '21');
INSERT INTO `product` VALUES ('383', 'PLKE2900760VV', '4', '13', '21');
INSERT INTO `product` VALUES ('384', 'PLKE2900500B8', '4', '13', '21');
INSERT INTO `product` VALUES ('385', 'PLKE2900762QO', '4', '13', '21');
INSERT INTO `product` VALUES ('386', 'PLKE2900757AZ', '4', '13', '21');
INSERT INTO `product` VALUES ('387', 'PLKE2900758B4', '4', '13', '21');
INSERT INTO `product` VALUES ('388', 'PLKE2900759JB', '4', '13', '21');
INSERT INTO `product` VALUES ('389', 'PLKE29003111W', '4', '13', '21');
INSERT INTO `product` VALUES ('390', 'PLKE2900503VB', '4', '13', '21');
INSERT INTO `product` VALUES ('391', 'PLKE2900298OR', '4', '13', '21');
INSERT INTO `product` VALUES ('392', 'PLKE29060591Z', '4', '13', '21');
INSERT INTO `product` VALUES ('393', 'PLKE2900289HW', '4', '13', '21');
INSERT INTO `product` VALUES ('394', 'PLKE2906056XS', '4', '13', '21');
INSERT INTO `product` VALUES ('395', 'PLKE2906057AA', '4', '13', '21');
INSERT INTO `product` VALUES ('396', 'PLKE2906055DL', '4', '13', '21');
INSERT INTO `product` VALUES ('397', 'PLKE290029328', '4', '13', '21');
INSERT INTO `product` VALUES ('398', 'PLKE2900292S5', '4', '13', '21');
INSERT INTO `product` VALUES ('399', 'PLKE2900294XG', '4', '13', '21');
INSERT INTO `product` VALUES ('400', 'PLKE2900307H1', '4', '13', '21');
INSERT INTO `product` VALUES ('401', 'PLKE2906058LD', '4', '13', '21');
INSERT INTO `product` VALUES ('402', 'PLKE2900504YX', '4', '13', '21');
INSERT INTO `product` VALUES ('403', 'PLKE2906086SX', '4', '13', '21');
INSERT INTO `product` VALUES ('404', 'PLKE2900180BA', '4', '13', '21');
INSERT INTO `product` VALUES ('405', 'PLKE2906119FH', '4', '13', '21');
INSERT INTO `product` VALUES ('406', 'PLKE290606036', '4', '13', '21');
INSERT INTO `product` VALUES ('407', 'PLKE2900502I2', '4', '13', '21');
INSERT INTO `product` VALUES ('408', 'PLKE2900952O3', '4', '13', '21');
INSERT INTO `product` VALUES ('409', 'PLKE29009535X', '4', '13', '21');
INSERT INTO `product` VALUES ('410', 'PLKE2900954X6', '4', '13', '21');
INSERT INTO `product` VALUES ('411', 'PLKE2900950NQ', '4', '13', '21');
INSERT INTO `product` VALUES ('412', 'PLKE29009519O', '4', '13', '21');
INSERT INTO `product` VALUES ('413', 'PLKE29009490H', '4', '13', '21');
INSERT INTO `product` VALUES ('414', 'PLKE290029540', '4', '13', '21');
INSERT INTO `product` VALUES ('415', 'PLKE2900291OV', '4', '13', '21');
INSERT INTO `product` VALUES ('416', 'PLKE2900300K9', '4', '13', '21');
INSERT INTO `product` VALUES ('417', 'PLKE2906085KI', '4', '13', '21');
INSERT INTO `product` VALUES ('418', 'PLKE29068101A', '4', '13', '21');
INSERT INTO `product` VALUES ('419', 'PLKE2906809X9', '4', '13', '21');
INSERT INTO `product` VALUES ('420', 'PLKE29068089K', '4', '13', '21');
INSERT INTO `product` VALUES ('421', 'PLKE2906807NK', '4', '13', '21');
INSERT INTO `product` VALUES ('422', 'PLKE29060889X', '4', '13', '21');
INSERT INTO `product` VALUES ('423', 'PLKE2900761EK', '4', '13', '21');
INSERT INTO `product` VALUES ('424', 'PLKE2906801NJ', '4', '13', '21');
INSERT INTO `product` VALUES ('425', 'PLKE2900299L6', '4', '13', '21');
INSERT INTO `product` VALUES ('426', 'PLKE2900551YG', '4', '13', '21');
INSERT INTO `product` VALUES ('427', 'PLKE290608718', '4', '13', '21');
INSERT INTO `product` VALUES ('428', 'PLKE29043805S', '4', '13', '21');
INSERT INTO `product` VALUES ('429', 'PLKE2900170LT', '4', '13', '21');
INSERT INTO `product` VALUES ('430', 'PLKE29002253J', '4', '13', '21');
INSERT INTO `product` VALUES ('431', 'PLKE2900223B0', '4', '13', '21');
INSERT INTO `product` VALUES ('432', 'PLKE290022482', '4', '13', '21');
INSERT INTO `product` VALUES ('433', 'PLKE29002271I', '4', '13', '21');
INSERT INTO `product` VALUES ('434', 'PLKE2900177O4', '4', '13', '21');
INSERT INTO `product` VALUES ('435', 'PLKE2900647VQ', '4', '13', '21');
INSERT INTO `product` VALUES ('436', 'PLKE2900547PD', '4', '13', '21');
INSERT INTO `product` VALUES ('437', 'PLKE29068054L', '4', '13', '21');
INSERT INTO `product` VALUES ('438', 'PLKE2900312U2', '4', '13', '21');
INSERT INTO `product` VALUES ('439', 'PLKE2900148Y9', '4', '13', '21');
INSERT INTO `product` VALUES ('440', 'PLKE2900149VN', '4', '13', '21');
INSERT INTO `product` VALUES ('441', 'PLKE290015094', '4', '13', '21');
INSERT INTO `product` VALUES ('442', 'PLKE2900171HN', '4', '13', '21');
INSERT INTO `product` VALUES ('443', 'PLKE29001698W', '4', '13', '21');
INSERT INTO `product` VALUES ('444', 'PLKE2906804U3', '4', '13', '21');
INSERT INTO `product` VALUES ('445', 'PLKE2900799MP', '4', '13', '21');
INSERT INTO `product` VALUES ('446', 'PLKE2900548RF', '4', '13', '21');
INSERT INTO `product` VALUES ('447', 'PLKE2900546DI', '4', '13', '21');
INSERT INTO `product` VALUES ('448', 'PLKE2902649ER', '4', '13', '21');
INSERT INTO `product` VALUES ('449', 'PLKE2900541RE', '4', '13', '21');
INSERT INTO `product` VALUES ('450', 'PLKE2900544UF', '4', '13', '21');
INSERT INTO `product` VALUES ('451', 'PLKE2900545PB', '4', '13', '21');
INSERT INTO `product` VALUES ('452', 'PLKE2900648X4', '4', '13', '21');
INSERT INTO `product` VALUES ('453', 'PLKE29001768D', '4', '13', '21');
INSERT INTO `product` VALUES ('454', 'PLKE29001462O', '4', '13', '21');
INSERT INTO `product` VALUES ('455', 'PLKE2900803R3', '4', '13', '21');
INSERT INTO `product` VALUES ('456', 'PLKE2900310FI', '4', '13', '21');
INSERT INTO `product` VALUES ('457', 'PLKE29002907V', '4', '13', '21');
INSERT INTO `product` VALUES ('458', 'PLKE2906802SS', '4', '13', '21');
INSERT INTO `product` VALUES ('459', 'PLKE2900178Z3', '4', '13', '21');
INSERT INTO `product` VALUES ('460', 'PLKE29003087T', '4', '13', '21');
INSERT INTO `product` VALUES ('461', 'PLKE2900549UV', '4', '13', '21');
INSERT INTO `product` VALUES ('462', 'PLKE2900816ZI', '4', '13', '21');
INSERT INTO `product` VALUES ('463', 'PLKE29008028S', '4', '13', '21');
INSERT INTO `product` VALUES ('464', 'PLKE2906800Y1', '4', '13', '21');
INSERT INTO `product` VALUES ('465', 'PLKE29008121Z', '4', '13', '21');
INSERT INTO `product` VALUES ('466', 'PLKE2906117TN', '4', '13', '21');
INSERT INTO `product` VALUES ('467', 'PLKE2902651E6', '4', '13', '21');
INSERT INTO `product` VALUES ('468', 'PLKE2900811E5', '4', '13', '21');
INSERT INTO `product` VALUES ('469', 'PLKE29008139Y', '4', '13', '21');
INSERT INTO `product` VALUES ('470', 'PLKE29008002M', '4', '13', '21');
INSERT INTO `product` VALUES ('471', 'PLKE2900814XZ', '4', '13', '21');
INSERT INTO `product` VALUES ('472', 'PLKE2900552ZK', '4', '13', '21');
INSERT INTO `product` VALUES ('473', 'PLKE290264721', '4', '13', '21');
INSERT INTO `product` VALUES ('474', 'PLKE2900815IM', '4', '13', '21');
INSERT INTO `product` VALUES ('475', 'PLKE290080424', '4', '13', '21');
INSERT INTO `product` VALUES ('476', 'PLKE29008013Y', '4', '13', '21');
INSERT INTO `product` VALUES ('477', 'PLKE2900542GE', '4', '13', '21');
INSERT INTO `product` VALUES ('478', 'PLKE2900645EC', '4', '13', '21');
INSERT INTO `product` VALUES ('479', 'PLKE2904377PB', '4', '13', '21');
INSERT INTO `product` VALUES ('480', 'PLKE290479932', '4', '13', '21');
INSERT INTO `product` VALUES ('481', 'PLKE2900174Q9', '4', '13', '21');
INSERT INTO `product` VALUES ('482', 'PLKE2900172YB', '4', '13', '21');
INSERT INTO `product` VALUES ('483', 'PLKE2900626GV', '4', '13', '21');
INSERT INTO `product` VALUES ('484', 'PLKE2900550Y1', '4', '13', '21');
INSERT INTO `product` VALUES ('485', 'PLKE2900173DV', '4', '13', '21');
INSERT INTO `product` VALUES ('486', 'PLKE2902648CH', '4', '13', '21');
INSERT INTO `product` VALUES ('487', 'PLKE2900643JW', '4', '13', '21');
INSERT INTO `product` VALUES ('488', 'PLKE2906803NN', '4', '13', '21');
INSERT INTO `product` VALUES ('489', 'PLKE2900543VM', '4', '13', '21');
INSERT INTO `product` VALUES ('490', 'PLKE2900646LQ', '4', '13', '21');
INSERT INTO `product` VALUES ('491', 'PLKE2900644YH', '4', '13', '21');
INSERT INTO `product` VALUES ('492', 'PLKE2900175P6', '4', '13', '21');
INSERT INTO `product` VALUES ('493', '7JYC4503889TS', '40', '13', '21');
INSERT INTO `product` VALUES ('494', 'WJND2100857P4', '11', '13', '21');
INSERT INTO `product` VALUES ('495', 'T3LB480068126', '41', '13', '21');
INSERT INTO `product` VALUES ('496', '004D2900095NB', '10', '13', '21');
INSERT INTO `product` VALUES ('497', '004D060083150', '10', '13', '21');
INSERT INTO `product` VALUES ('498', '004D06009131N', '10', '13', '21');
INSERT INTO `product` VALUES ('499', '004D06007419D', '10', '13', '21');
INSERT INTO `product` VALUES ('500', '6CYE3900036H1', '6', '13', '21');
INSERT INTO `product` VALUES ('501', '6BXD1006899WO', '1', '13', '21');
INSERT INTO `product` VALUES ('502', '6BXD1006900YU', '1', '13', '21');
INSERT INTO `product` VALUES ('503', '6BXD1006898RV', '1', '13', '21');
INSERT INTO `product` VALUES ('504', '6BXD1006897M9', '1', '13', '21');
INSERT INTO `product` VALUES ('505', '6BXD1010082L2', '1', '13', '21');
INSERT INTO `product` VALUES ('506', '6BXD1010085AZ', '1', '13', '21');
INSERT INTO `product` VALUES ('507', '6BXD1010081LL', '1', '13', '21');
INSERT INTO `product` VALUES ('508', '6BXD10102753C', '1', '13', '21');
INSERT INTO `product` VALUES ('509', '6BXD10100844T', '1', '13', '21');
INSERT INTO `product` VALUES ('510', '6BXD1010271HC', '1', '13', '21');
INSERT INTO `product` VALUES ('511', '6BXD1006939H6', '1', '13', '21');
INSERT INTO `product` VALUES ('512', '6BXD1006938LX', '1', '13', '21');
INSERT INTO `product` VALUES ('513', '6BXD1010274IC', '1', '13', '21');
INSERT INTO `product` VALUES ('514', '6BXD1006940IP', '1', '13', '21');
INSERT INTO `product` VALUES ('515', '6BXD1010272UY', '1', '13', '21');
INSERT INTO `product` VALUES ('516', '6BXD1006937ML', '1', '13', '21');
INSERT INTO `product` VALUES ('517', '6BXD1010273M6', '1', '13', '21');
INSERT INTO `product` VALUES ('518', '6BXD1010083KC', '1', '13', '21');
INSERT INTO `product` VALUES ('519', '6BXD1006936H4', '1', '13', '21');
INSERT INTO `product` VALUES ('520', 'ZKDD1600076D9', '5', '13', '21');
INSERT INTO `product` VALUES ('521', 'ZKDD16000806K', '5', '13', '21');
INSERT INTO `product` VALUES ('522', 'ZKDD16001036I', '5', '13', '21');
INSERT INTO `product` VALUES ('523', 'ZKDD1600188EH', '5', '13', '21');
INSERT INTO `product` VALUES ('524', 'ZKDD1600059D0', '5', '13', '21');
INSERT INTO `product` VALUES ('525', 'ZKDD1600016SV', '5', '13', '21');
INSERT INTO `product` VALUES ('526', 'ZKDD1600056NI', '5', '13', '21');
INSERT INTO `product` VALUES ('527', 'ZKDD1600036YE', '5', '13', '21');
INSERT INTO `product` VALUES ('528', 'XBQE5029579Z9', '2', '13', '21');
INSERT INTO `product` VALUES ('529', 'XBQE5024809MD', '2', '13', '21');
INSERT INTO `product` VALUES ('530', 'XBQE5023125MH', '2', '13', '21');
INSERT INTO `product` VALUES ('531', 'XBQE5024801Y3', '2', '13', '21');
INSERT INTO `product` VALUES ('532', 'XBQE50231191E', '2', '13', '21');
INSERT INTO `product` VALUES ('533', 'XBQE5024802F6', '2', '13', '21');
INSERT INTO `product` VALUES ('534', 'XBQE5024803Q8', '2', '13', '21');
INSERT INTO `product` VALUES ('535', 'XBQE5024804QJ', '2', '13', '21');
INSERT INTO `product` VALUES ('536', 'XBQE5024810TG', '2', '13', '21');
INSERT INTO `product` VALUES ('537', 'XBQE5023113NP', '2', '13', '21');
INSERT INTO `product` VALUES ('538', 'XBQE5023120ZO', '2', '13', '21');
INSERT INTO `product` VALUES ('539', 'XBQE50231185S', '2', '13', '21');
INSERT INTO `product` VALUES ('540', 'XBQE50231109L', '2', '13', '21');
INSERT INTO `product` VALUES ('541', 'XBQE5023109E3', '2', '13', '21');
INSERT INTO `product` VALUES ('542', 'XBQE5023108S8', '2', '13', '21');
INSERT INTO `product` VALUES ('543', 'XBQE5023107J7', '2', '13', '21');
INSERT INTO `product` VALUES ('544', 'XBQE5024805XY', '2', '13', '21');
INSERT INTO `product` VALUES ('545', 'XBQE5029564XN', '2', '13', '21');
INSERT INTO `product` VALUES ('546', 'XBQE5023112ZT', '2', '13', '21');
INSERT INTO `product` VALUES ('547', 'XBQE5029572ED', '2', '13', '21');
INSERT INTO `product` VALUES ('548', 'XBQE50248290Y', '2', '13', '21');
INSERT INTO `product` VALUES ('549', 'XBQE50248288Q', '2', '13', '21');
INSERT INTO `product` VALUES ('550', 'XBQE50248162G', '2', '13', '21');
INSERT INTO `product` VALUES ('551', 'XBQE5029588PH', '2', '13', '21');
INSERT INTO `product` VALUES ('552', 'XBQE5029565C1', '2', '13', '21');
INSERT INTO `product` VALUES ('553', 'XBQE5029574TG', '2', '13', '21');
INSERT INTO `product` VALUES ('554', 'XBQE50231324O', '2', '13', '21');
INSERT INTO `product` VALUES ('555', 'XBQE50295556Q', '2', '13', '21');
INSERT INTO `product` VALUES ('556', 'XBQE50295737M', '2', '13', '21');
INSERT INTO `product` VALUES ('557', 'XBQE5029562EE', '2', '13', '21');
INSERT INTO `product` VALUES ('558', 'XBQE5029581XA', '2', '13', '21');
INSERT INTO `product` VALUES ('559', 'XBQE5029569KY', '2', '13', '21');
INSERT INTO `product` VALUES ('560', 'XBQE50295760K', '2', '13', '21');
INSERT INTO `product` VALUES ('561', 'XBQE50295778U', '2', '13', '21');
INSERT INTO `product` VALUES ('562', 'XBQE50248065U', '2', '13', '21');
INSERT INTO `product` VALUES ('563', 'XBQE5029584AT', '2', '13', '21');
INSERT INTO `product` VALUES ('564', 'XBQE5024822YX', '2', '13', '21');
INSERT INTO `product` VALUES ('565', 'XBQE5029589JS', '2', '13', '21');
INSERT INTO `product` VALUES ('566', 'XBQE5029578ZH', '2', '13', '21');
INSERT INTO `product` VALUES ('567', 'XBQE5023124K0', '2', '13', '21');
INSERT INTO `product` VALUES ('568', 'XBQE5024839VZ', '2', '13', '21');
INSERT INTO `product` VALUES ('569', 'XBQE5024836VH', '2', '13', '21');
INSERT INTO `product` VALUES ('570', 'XBQE5024826B2', '2', '13', '21');
INSERT INTO `product` VALUES ('571', 'XBQE5024847G7', '2', '13', '21');
INSERT INTO `product` VALUES ('572', 'XBQE5024842U7', '2', '13', '21');
INSERT INTO `product` VALUES ('573', 'XBQE5024832R9', '2', '13', '21');
INSERT INTO `product` VALUES ('574', 'XBQE5023106W9', '2', '13', '21');
INSERT INTO `product` VALUES ('575', 'XBQE50248481F', '2', '13', '21');
INSERT INTO `product` VALUES ('576', 'XBQE50231266N', '2', '13', '21');
INSERT INTO `product` VALUES ('577', 'XBQE5024838F2', '2', '13', '21');
INSERT INTO `product` VALUES ('578', 'XBQE50248302V', '2', '13', '21');
INSERT INTO `product` VALUES ('579', 'XBQE5024837N1', '2', '13', '21');
INSERT INTO `product` VALUES ('580', 'XBQE5023105TL', '2', '13', '21');
INSERT INTO `product` VALUES ('581', 'XBQE5023104M8', '2', '13', '21');
INSERT INTO `product` VALUES ('582', 'XBQE5023103FN', '2', '13', '21');
INSERT INTO `product` VALUES ('583', 'XBQE5023102TH', '2', '13', '21');
INSERT INTO `product` VALUES ('584', 'XBQE502310143', '2', '13', '21');
INSERT INTO `product` VALUES ('585', 'XBQE5024841TB', '2', '13', '21');
INSERT INTO `product` VALUES ('586', 'XBQE5047989ED', '2', '13', '21');
INSERT INTO `product` VALUES ('587', 'XBQE5024844VI', '2', '13', '21');
INSERT INTO `product` VALUES ('588', 'XBQE5023127XX', '2', '13', '21');
INSERT INTO `product` VALUES ('589', 'XBQE5023114BD', '2', '13', '21');
INSERT INTO `product` VALUES ('590', 'XBQE50248174T', '2', '13', '21');
INSERT INTO `product` VALUES ('591', 'XBQE50231113E', '2', '13', '21');
INSERT INTO `product` VALUES ('592', 'XBQE50231222W', '2', '13', '21');
INSERT INTO `product` VALUES ('593', 'XBQE5023121L2', '2', '13', '21');
INSERT INTO `product` VALUES ('594', 'XBQE5023134MW', '2', '13', '21');
INSERT INTO `product` VALUES ('595', 'XBQE5023123Z5', '2', '13', '21');
INSERT INTO `product` VALUES ('596', 'XBQE50231303T', '2', '13', '21');
INSERT INTO `product` VALUES ('597', 'XBQE5024833ZX', '2', '13', '21');
INSERT INTO `product` VALUES ('598', 'XBQE5023128VK', '2', '13', '21');
INSERT INTO `product` VALUES ('599', 'XBQE50248346I', '2', '13', '21');
INSERT INTO `product` VALUES ('600', 'XBQE50248495B', '2', '13', '21');
INSERT INTO `product` VALUES ('601', 'XBQE502313522', '2', '13', '21');
INSERT INTO `product` VALUES ('602', 'XBQE502311796', '2', '13', '21');
INSERT INTO `product` VALUES ('603', 'XBQE5024831JT', '2', '13', '21');
INSERT INTO `product` VALUES ('604', 'XBQE502311648', '2', '13', '21');
INSERT INTO `product` VALUES ('605', 'XBQE502311594', '2', '13', '21');
INSERT INTO `product` VALUES ('606', 'XBQE5024846AY', '2', '13', '21');
INSERT INTO `product` VALUES ('607', 'XBQE5024843RO', '2', '13', '21');
INSERT INTO `product` VALUES ('608', 'XBQE50231299E', '2', '13', '21');
INSERT INTO `product` VALUES ('609', 'XBQE50479955Y', '2', '13', '21');
INSERT INTO `product` VALUES ('610', 'XBQE504797701', '2', '13', '21');
INSERT INTO `product` VALUES ('611', 'XBQE5047971BP', '2', '13', '21');
INSERT INTO `product` VALUES ('612', 'XBQE5047974JU', '2', '13', '21');
INSERT INTO `product` VALUES ('613', 'XBQE50479861H', '2', '13', '21');
INSERT INTO `product` VALUES ('614', 'XBQE50479565A', '2', '13', '21');
INSERT INTO `product` VALUES ('615', 'XBQE50479573D', '2', '13', '21');
INSERT INTO `product` VALUES ('616', 'XBQE50479882X', '2', '13', '21');
INSERT INTO `product` VALUES ('617', 'XBQE5047987WY', '2', '13', '21');
INSERT INTO `product` VALUES ('618', 'XBQE50479811E', '2', '13', '21');
INSERT INTO `product` VALUES ('619', 'XBQE5047997XY', '2', '13', '21');
INSERT INTO `product` VALUES ('620', 'XBQE5024840UV', '2', '13', '21');
INSERT INTO `product` VALUES ('621', 'XBQE5047996Y9', '2', '13', '21');
INSERT INTO `product` VALUES ('622', 'XBQE5047980IV', '2', '13', '21');
INSERT INTO `product` VALUES ('623', 'XBQE504798424', '2', '13', '21');
INSERT INTO `product` VALUES ('624', 'XBQE5047951DZ', '2', '13', '21');
INSERT INTO `product` VALUES ('625', 'XBQE50295677F', '2', '13', '21');
INSERT INTO `product` VALUES ('626', 'XBQE5029561MI', '2', '13', '21');
INSERT INTO `product` VALUES ('627', 'XBQE50479706F', '2', '13', '21');
INSERT INTO `product` VALUES ('628', 'XBQE50479698G', '2', '13', '21');
INSERT INTO `product` VALUES ('629', 'XBQE5047968AI', '2', '13', '21');
INSERT INTO `product` VALUES ('630', 'XBQE5047967FB', '2', '13', '21');
INSERT INTO `product` VALUES ('631', 'XBQE5047966DA', '2', '13', '21');
INSERT INTO `product` VALUES ('632', 'XBQE5026743T6', '2', '13', '21');
INSERT INTO `product` VALUES ('633', 'XBQE5047994PR', '2', '13', '21');
INSERT INTO `product` VALUES ('634', 'XBQE5026718OM', '2', '13', '21');
INSERT INTO `product` VALUES ('635', 'XBQE5026742TU', '2', '13', '21');
INSERT INTO `product` VALUES ('636', 'XBQE50267505E', '2', '13', '21');
INSERT INTO `product` VALUES ('637', 'XBQE5026748ZI', '2', '13', '21');
INSERT INTO `product` VALUES ('638', 'XBQE5026746VL', '2', '13', '21');
INSERT INTO `product` VALUES ('639', 'XBQE5026747NB', '2', '13', '21');
INSERT INTO `product` VALUES ('640', 'XBQE5026721TY', '2', '13', '21');
INSERT INTO `product` VALUES ('641', 'XBQE5026711HJ', '2', '13', '21');
INSERT INTO `product` VALUES ('642', 'XBQE50267039E', '2', '13', '21');
INSERT INTO `product` VALUES ('643', 'XBQE50267132W', '2', '13', '21');
INSERT INTO `product` VALUES ('644', 'XBQE5026737VR', '2', '13', '21');
INSERT INTO `product` VALUES ('645', 'XBQE5047978QK', '2', '13', '21');
INSERT INTO `product` VALUES ('646', 'XBQE50267170Z', '2', '13', '21');
INSERT INTO `product` VALUES ('647', 'XBQE5047979V6', '2', '13', '21');
INSERT INTO `product` VALUES ('648', 'XBQE50267166P', '2', '13', '21');
INSERT INTO `product` VALUES ('649', 'XBQE5026719SK', '2', '13', '21');
INSERT INTO `product` VALUES ('650', 'XBQE5026720FF', '2', '13', '21');
INSERT INTO `product` VALUES ('651', 'XBQE5026727HM', '2', '13', '21');
INSERT INTO `product` VALUES ('652', 'XBQE50267282Q', '2', '13', '21');
INSERT INTO `product` VALUES ('653', 'XBQE50267297P', '2', '13', '21');
INSERT INTO `product` VALUES ('654', 'XBQE5026730GN', '2', '13', '21');
INSERT INTO `product` VALUES ('655', 'XBQE5026712QU', '2', '13', '21');
INSERT INTO `product` VALUES ('656', 'XBQE5047990US', '2', '13', '21');
INSERT INTO `product` VALUES ('657', 'XBQE50479910Q', '2', '13', '21');
INSERT INTO `product` VALUES ('658', 'XBQE5047952MY', '2', '13', '21');
INSERT INTO `product` VALUES ('659', 'XBQE5026715G5', '2', '13', '21');
INSERT INTO `product` VALUES ('660', 'XBQE504796548', '2', '13', '21');
INSERT INTO `product` VALUES ('661', 'XBQE5029554CI', '2', '13', '21');
INSERT INTO `product` VALUES ('662', 'XBQE5029563US', '2', '13', '21');
INSERT INTO `product` VALUES ('663', 'XBQE502957180', '2', '13', '21');
INSERT INTO `product` VALUES ('664', 'XBQE5029558YX', '2', '13', '21');
INSERT INTO `product` VALUES ('665', 'XBQE5047964DT', '2', '13', '21');
INSERT INTO `product` VALUES ('666', 'XBQE5047998XQ', '2', '13', '21');
INSERT INTO `product` VALUES ('667', 'XBQE502955352', '2', '13', '21');
INSERT INTO `product` VALUES ('668', 'XBQE502958569', '2', '13', '21');
INSERT INTO `product` VALUES ('669', 'XBQE5047999II', '2', '13', '21');
INSERT INTO `product` VALUES ('670', 'XBQE5047992RK', '2', '13', '21');
INSERT INTO `product` VALUES ('671', 'XBQE5047954G0', '2', '13', '21');
INSERT INTO `product` VALUES ('672', 'XBQE5047976RZ', '2', '13', '21');
INSERT INTO `product` VALUES ('673', 'XBQE5029552L1', '2', '13', '21');
INSERT INTO `product` VALUES ('674', 'XBQE50479632Z', '2', '13', '21');
INSERT INTO `product` VALUES ('675', 'XBQE5029583DW', '2', '13', '21');
INSERT INTO `product` VALUES ('676', 'XBQE50295956Q', '2', '13', '21');
INSERT INTO `product` VALUES ('677', 'XBQE5029591CV', '2', '13', '21');
INSERT INTO `product` VALUES ('678', 'XBQE5029593OK', '2', '13', '21');
INSERT INTO `product` VALUES ('679', 'XBQE5029596LP', '2', '13', '21');
INSERT INTO `product` VALUES ('680', 'XBQE5029597HU', '2', '13', '21');
INSERT INTO `product` VALUES ('681', 'XBQE5029580LW', '2', '13', '21');
INSERT INTO `product` VALUES ('682', 'XBQE5029598UC', '2', '13', '21');
INSERT INTO `product` VALUES ('683', 'XBQE50295908F', '2', '13', '21');
INSERT INTO `product` VALUES ('684', 'XBQE50479737O', '2', '13', '21');
INSERT INTO `product` VALUES ('685', 'XBQE5029592BG', '2', '13', '21');
INSERT INTO `product` VALUES ('686', 'XBQE5047982XA', '2', '13', '21');
INSERT INTO `product` VALUES ('687', 'XBQE50479556M', '2', '13', '21');
INSERT INTO `product` VALUES ('688', 'XBQE5047972JK', '2', '13', '21');
INSERT INTO `product` VALUES ('689', 'XBQE5047975JF', '2', '13', '21');
INSERT INTO `product` VALUES ('690', 'XBQE5047962YO', '2', '13', '21');
INSERT INTO `product` VALUES ('691', 'XBQE5047961X8', '2', '13', '21');
INSERT INTO `product` VALUES ('692', 'XBQE50479597Z', '2', '13', '21');
INSERT INTO `product` VALUES ('693', 'XBQE50479582F', '2', '13', '21');
INSERT INTO `product` VALUES ('694', 'XBQE5047953Z7', '2', '13', '21');
INSERT INTO `product` VALUES ('695', 'XBQE5029551S9', '2', '13', '21');
INSERT INTO `product` VALUES ('696', 'XBQE502956692', '2', '13', '21');
INSERT INTO `product` VALUES ('697', 'XBQE5029587ZE', '2', '13', '21');
INSERT INTO `product` VALUES ('698', 'XBQE502958275', '2', '13', '21');
INSERT INTO `product` VALUES ('699', 'XBQE5029599G0', '2', '13', '21');
INSERT INTO `product` VALUES ('700', 'XBQE5029586HY', '2', '13', '21');
INSERT INTO `product` VALUES ('701', 'XBQE502955691', '2', '13', '21');
INSERT INTO `product` VALUES ('702', 'XBQE5029557ON', '2', '13', '21');
INSERT INTO `product` VALUES ('703', 'XBQE5029568Y0', '2', '13', '21');
INSERT INTO `product` VALUES ('704', 'XBQE5029600P9', '2', '13', '21');
INSERT INTO `product` VALUES ('705', 'XBQE5047993KT', '2', '13', '21');
INSERT INTO `product` VALUES ('706', 'XBQE5029570UV', '2', '13', '21');
INSERT INTO `product` VALUES ('707', 'XBQE50479854O', '2', '13', '21');
INSERT INTO `product` VALUES ('708', 'XBQE5029560IC', '2', '13', '21');
INSERT INTO `product` VALUES ('709', 'XBQE504796068', '2', '13', '21');
INSERT INTO `product` VALUES ('710', 'XBQE50295945Z', '2', '13', '21');
INSERT INTO `product` VALUES ('711', 'XBQE5043025GM', '2', '13', '21');
INSERT INTO `product` VALUES ('712', 'XBQE50430020P', '2', '13', '21');
INSERT INTO `product` VALUES ('713', 'XBQE50430038O', '2', '13', '21');
INSERT INTO `product` VALUES ('714', 'XBQE50430059Y', '2', '13', '21');
INSERT INTO `product` VALUES ('715', 'XBQE5043004BC', '2', '13', '21');
INSERT INTO `product` VALUES ('716', 'XBQE5043029MK', '2', '13', '21');
INSERT INTO `product` VALUES ('717', 'XBQE5043001B4', '2', '13', '21');
INSERT INTO `product` VALUES ('718', 'XBQE50430190I', '2', '13', '21');
INSERT INTO `product` VALUES ('719', 'XBQE5043017I9', '2', '13', '21');
INSERT INTO `product` VALUES ('720', 'XBQE50430403L', '2', '13', '21');
INSERT INTO `product` VALUES ('721', 'XBQE5043014HP', '2', '13', '21');
INSERT INTO `product` VALUES ('722', 'XBQE504304969', '2', '13', '21');
INSERT INTO `product` VALUES ('723', 'XBQE5043024AQ', '2', '13', '21');
INSERT INTO `product` VALUES ('724', 'XBQE5043012Z3', '2', '13', '21');
INSERT INTO `product` VALUES ('725', 'XBQE5043023VF', '2', '13', '21');
INSERT INTO `product` VALUES ('726', 'XBQE5043026Q5', '2', '13', '21');
INSERT INTO `product` VALUES ('727', 'XBQE50430278D', '2', '13', '21');
INSERT INTO `product` VALUES ('728', 'XBQE504301050', '2', '13', '21');
INSERT INTO `product` VALUES ('729', 'XBQE504300682', '2', '13', '21');
INSERT INTO `product` VALUES ('730', 'XBQE5043007WA', '2', '13', '21');
INSERT INTO `product` VALUES ('731', 'XBQE5043016XX', '2', '13', '21');
INSERT INTO `product` VALUES ('732', 'XBQE5043028YJ', '2', '13', '21');
INSERT INTO `product` VALUES ('733', 'XBQE5043046MF', '2', '13', '21');
INSERT INTO `product` VALUES ('734', 'XBQE50430476C', '2', '13', '21');
INSERT INTO `product` VALUES ('735', 'XBQE5043048KH', '2', '13', '21');
INSERT INTO `product` VALUES ('736', 'XBQE5043015MO', '2', '13', '21');
INSERT INTO `product` VALUES ('737', 'XBQE5024820U9', '2', '13', '21');
INSERT INTO `product` VALUES ('738', 'XBQE5024835GZ', '2', '13', '21');
INSERT INTO `product` VALUES ('739', 'XBQE5024845YF', '2', '13', '21');
INSERT INTO `product` VALUES ('740', 'XBQE50248508Y', '2', '13', '21');
INSERT INTO `product` VALUES ('741', 'XBQE5024823UQ', '2', '13', '21');
INSERT INTO `product` VALUES ('742', 'XBQE504798392', '2', '13', '21');
INSERT INTO `product` VALUES ('743', 'XBQE5024824DT', '2', '13', '21');
INSERT INTO `product` VALUES ('744', 'XBQE50267403B', '2', '13', '21');
INSERT INTO `product` VALUES ('745', 'XBQE50248087Z', '2', '13', '21');
INSERT INTO `product` VALUES ('746', 'XBQE5023131BR', '2', '13', '21');
INSERT INTO `product` VALUES ('747', 'XBQE5024807PR', '2', '13', '21');
INSERT INTO `product` VALUES ('748', 'XBQE502314721', '2', '13', '21');
INSERT INTO `product` VALUES ('749', 'XBQE5043009R7', '2', '13', '21');
INSERT INTO `product` VALUES ('750', 'XBQE502481957', '2', '13', '21');
INSERT INTO `product` VALUES ('751', 'XBQE5043018JM', '2', '13', '21');
INSERT INTO `product` VALUES ('752', 'XBQE50248128Q', '2', '13', '21');
INSERT INTO `product` VALUES ('753', 'XBQE5024813QI', '2', '13', '21');
INSERT INTO `product` VALUES ('754', 'XBQE5024814R0', '2', '13', '21');
INSERT INTO `product` VALUES ('755', 'XBQE5024815IU', '2', '13', '21');
INSERT INTO `product` VALUES ('756', 'XBQE502481165', '2', '13', '21');
INSERT INTO `product` VALUES ('757', 'XBQE5024827TN', '2', '13', '21');
INSERT INTO `product` VALUES ('758', 'XBQE5024821LQ', '2', '13', '21');
INSERT INTO `product` VALUES ('759', 'XBQE5043013MN', '2', '13', '21');
INSERT INTO `product` VALUES ('760', 'XBQE50231494T', '2', '13', '21');
INSERT INTO `product` VALUES ('761', 'XBQE50430117R', '2', '13', '21');
INSERT INTO `product` VALUES ('762', 'XBQE502482507', '2', '13', '21');
INSERT INTO `product` VALUES ('763', 'XBQE5024818X0', '2', '13', '21');
INSERT INTO `product` VALUES ('764', 'XBQE5023141B6', '2', '13', '21');
INSERT INTO `product` VALUES ('765', 'XBQE5023150MY', '2', '13', '21');
INSERT INTO `product` VALUES ('766', 'XBQE50430080N', '2', '13', '21');
INSERT INTO `product` VALUES ('767', 'XBQE50267044K', '2', '13', '21');
INSERT INTO `product` VALUES ('768', 'XBQE5026705QN', '2', '13', '21');
INSERT INTO `product` VALUES ('769', 'XBQE50267068K', '2', '13', '21');
INSERT INTO `product` VALUES ('770', 'XBQE50267084W', '2', '13', '21');
INSERT INTO `product` VALUES ('771', 'XBQE5026707YH', '2', '13', '21');
INSERT INTO `product` VALUES ('772', 'XBQE502670918', '2', '13', '21');
INSERT INTO `product` VALUES ('773', 'XBQE5026710TV', '2', '13', '21');
INSERT INTO `product` VALUES ('774', 'XBQE5029404JG', '2', '13', '21');
INSERT INTO `product` VALUES ('775', 'XBQE5023146E9', '2', '13', '21');
INSERT INTO `product` VALUES ('776', 'XBQE5043021WX', '2', '13', '21');
INSERT INTO `product` VALUES ('777', 'XBQE5029559XJ', '2', '13', '21');
INSERT INTO `product` VALUES ('778', 'XBQE5026702SR', '2', '13', '21');
INSERT INTO `product` VALUES ('779', 'XBQE5023144UA', '2', '13', '21');
INSERT INTO `product` VALUES ('780', 'XBQE50231431G', '2', '13', '21');
INSERT INTO `product` VALUES ('781', 'XBQE50231332D', '2', '13', '21');
INSERT INTO `product` VALUES ('782', 'XBQE5023145KI', '2', '13', '21');
INSERT INTO `product` VALUES ('783', 'XBQE5023142HZ', '2', '13', '21');
INSERT INTO `product` VALUES ('784', 'XBQE5023136OA', '2', '13', '21');
INSERT INTO `product` VALUES ('785', 'XBQE5023137WU', '2', '13', '21');
INSERT INTO `product` VALUES ('786', 'XBQE5023138JG', '2', '13', '21');
INSERT INTO `product` VALUES ('787', 'XBQE5023139EV', '2', '13', '21');
INSERT INTO `product` VALUES ('788', 'XBQE5023148YF', '2', '13', '21');
INSERT INTO `product` VALUES ('789', 'XBQE5026714OB', '2', '13', '21');
INSERT INTO `product` VALUES ('790', 'XBQE5023140AO', '2', '13', '21');
INSERT INTO `product` VALUES ('791', 'XBQE50295758E', '2', '13', '21');
INSERT INTO `product` VALUES ('792', 'XBQE5043035N2', '2', '13', '21');
INSERT INTO `product` VALUES ('793', 'XBQE50430443J', '2', '13', '21');
INSERT INTO `product` VALUES ('794', 'XBQE5043045IC', '2', '13', '21');
INSERT INTO `product` VALUES ('795', 'XBQE504302037', '2', '13', '21');
INSERT INTO `product` VALUES ('796', 'XBQE5043022RX', '2', '13', '21');
INSERT INTO `product` VALUES ('797', 'XBQE5026739II', '2', '13', '21');
INSERT INTO `product` VALUES ('798', 'XBQE504303023', '2', '13', '21');
INSERT INTO `product` VALUES ('799', 'XBQE5043037UA', '2', '13', '21');
INSERT INTO `product` VALUES ('800', 'XBQE50267013X', '2', '13', '21');
INSERT INTO `product` VALUES ('801', 'XBQE5043036IS', '2', '13', '21');
INSERT INTO `product` VALUES ('802', 'XBQE5043043MN', '2', '13', '21');
INSERT INTO `product` VALUES ('803', 'XBQE50430345B', '2', '13', '21');
INSERT INTO `product` VALUES ('804', 'XBQE5043033BC', '2', '13', '21');
INSERT INTO `product` VALUES ('805', 'XBQE5043041IE', '2', '13', '21');
INSERT INTO `product` VALUES ('806', 'XBQE5043042B5', '2', '13', '21');
INSERT INTO `product` VALUES ('807', 'XBQE5043031AE', '2', '13', '21');
INSERT INTO `product` VALUES ('808', 'XBQE504303281', '2', '13', '21');
INSERT INTO `product` VALUES ('809', 'XBQE5043038QW', '2', '13', '21');
INSERT INTO `product` VALUES ('810', 'XBQE504303926', '2', '13', '21');
INSERT INTO `product` VALUES ('811', 'XBQE50430500S', '2', '13', '21');
INSERT INTO `product` VALUES ('812', '22VC3CS9201DD525', '38', '13', '21');
INSERT INTO `product` VALUES ('813', '22VC3CS9201DD526', '38', '13', '21');
INSERT INTO `product` VALUES ('814', '22VC3CS9201DD524', '38', '13', '21');
INSERT INTO `product` VALUES ('815', '22VC3CS9201DD522', '38', '13', '21');
INSERT INTO `product` VALUES ('816', '22VC3CS9201DD527', '38', '13', '21');
INSERT INTO `product` VALUES ('817', '40AC3000087AS', '21', '13', '21');
INSERT INTO `product` VALUES ('818', '40AC3300553OK', '21', '13', '21');
INSERT INTO `product` VALUES ('819', '40AC3000108Z6', '21', '13', '21');
INSERT INTO `product` VALUES ('820', '40AC3000054J2', '21', '13', '21');
INSERT INTO `product` VALUES ('821', '40AC3000025YV', '21', '13', '21');
INSERT INTO `product` VALUES ('822', '40AC33005415M', '21', '13', '21');
INSERT INTO `product` VALUES ('823', '40AC12000213A', '21', '13', '21');
INSERT INTO `product` VALUES ('824', '40AC3000085KD', '21', '13', '21');
INSERT INTO `product` VALUES ('825', '40AC3000079I8', '21', '13', '21');
INSERT INTO `product` VALUES ('826', '40AC3300624A3', '21', '13', '21');
INSERT INTO `product` VALUES ('827', '40AC33006188B', '21', '13', '21');
INSERT INTO `product` VALUES ('828', '40AC3000027BW', '21', '13', '21');
INSERT INTO `product` VALUES ('829', '40AC3300487BZ', '21', '13', '21');
INSERT INTO `product` VALUES ('830', '40AC3000036DX', '21', '13', '21');
INSERT INTO `product` VALUES ('831', '40AC3000005B4', '21', '13', '21');
INSERT INTO `product` VALUES ('832', '40AC3000008DY', '21', '13', '21');
INSERT INTO `product` VALUES ('833', '40AC30001051F', '21', '13', '21');
INSERT INTO `product` VALUES ('834', '40AC3300526QF', '21', '13', '21');
INSERT INTO `product` VALUES ('835', '40AC3300423HM', '21', '13', '21');
INSERT INTO `product` VALUES ('836', '40AC3300350S3', '21', '13', '21');
INSERT INTO `product` VALUES ('837', '40AC3300331RJ', '21', '13', '21');
INSERT INTO `product` VALUES ('838', '40AC33005423U', '21', '13', '21');
INSERT INTO `product` VALUES ('839', '40AC3300156MY', '21', '13', '21');
INSERT INTO `product` VALUES ('840', '40AC33006361O', '21', '13', '21');
INSERT INTO `product` VALUES ('841', '40AC3300491YT', '21', '13', '21');
INSERT INTO `product` VALUES ('842', '40AC3300529UY', '21', '13', '21');
INSERT INTO `product` VALUES ('843', '40AC3000017H2', '21', '13', '21');
INSERT INTO `product` VALUES ('844', '40AC3300045F9', '21', '13', '21');
INSERT INTO `product` VALUES ('845', '40AC30000772D', '21', '13', '21');
INSERT INTO `product` VALUES ('846', '40AC3000058TH', '21', '13', '21');
INSERT INTO `product` VALUES ('847', '40AC3300475YV', '21', '13', '21');
INSERT INTO `product` VALUES ('848', '40AC330042174', '21', '13', '21');
INSERT INTO `product` VALUES ('849', '40AC3300540L6', '21', '13', '21');
INSERT INTO `product` VALUES ('850', '40AC33005671F', '21', '13', '21');
INSERT INTO `product` VALUES ('851', '40AC3000028GK', '21', '13', '21');
INSERT INTO `product` VALUES ('852', '40AC3300240G0', '21', '13', '21');
INSERT INTO `product` VALUES ('853', '40AC33002530X', '21', '13', '21');
INSERT INTO `product` VALUES ('854', '40AC120037502', '21', '13', '21');
INSERT INTO `product` VALUES ('855', '40AC3300051XR', '21', '13', '21');
INSERT INTO `product` VALUES ('856', '40AC33005727D', '21', '13', '21');
INSERT INTO `product` VALUES ('857', '40AC3300270DR', '21', '13', '21');
INSERT INTO `product` VALUES ('858', '40AC3300627PE', '21', '13', '21');
INSERT INTO `product` VALUES ('859', '40AC3300587OC', '21', '13', '21');
INSERT INTO `product` VALUES ('860', '40AC3300646E5', '21', '13', '21');
INSERT INTO `product` VALUES ('861', '40AC3300037WK', '21', '13', '21');
INSERT INTO `product` VALUES ('862', '40AC3300335J5', '21', '13', '21');
INSERT INTO `product` VALUES ('863', '40AC3000061RM', '21', '13', '21');
INSERT INTO `product` VALUES ('864', '40AC3300406RQ', '21', '13', '21');
INSERT INTO `product` VALUES ('865', '40AC3000033HV', '21', '13', '21');
INSERT INTO `product` VALUES ('866', '40AC3300550BN', '21', '13', '21');
INSERT INTO `product` VALUES ('867', '40AC3300555W2', '21', '13', '21');
INSERT INTO `product` VALUES ('868', '40AC3000106RE', '21', '13', '21');
INSERT INTO `product` VALUES ('869', '40AC3000095XC', '21', '13', '21');
INSERT INTO `product` VALUES ('870', '40AC33001054W', '21', '13', '21');
INSERT INTO `product` VALUES ('871', '40AC3300551IZ', '21', '13', '21');
INSERT INTO `product` VALUES ('872', '40AC3300337KY', '21', '13', '21');
INSERT INTO `product` VALUES ('873', '40AC330060568', '21', '13', '21');
INSERT INTO `product` VALUES ('874', '40AC330060322', '21', '13', '21');
INSERT INTO `product` VALUES ('875', '40AC33006047Z', '21', '13', '21');
INSERT INTO `product` VALUES ('876', '40AC3000088Q4', '21', '13', '21');
INSERT INTO `product` VALUES ('877', '40AC33001589O', '21', '13', '21');
INSERT INTO `product` VALUES ('878', '40AC300005686', '21', '13', '21');
INSERT INTO `product` VALUES ('879', '40AC3300500DV', '21', '13', '21');
INSERT INTO `product` VALUES ('880', '40AC3300424PG', '21', '13', '21');

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
INSERT INTO `provider` VALUES ('1', '10123654478', 'PRODUPELMA S.A', 'AV COLÓN Y PARRA 25', '2621561', null, null, null);
INSERT INTO `provider` VALUES ('2', '1745632147', 'FERRETERIA MARISCAL S.A.', 'AV GONZALO PARRA S44-60 Y GARCIA', '2456789', null, null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of unit
-- ----------------------------
INSERT INTO `unit` VALUES ('4', 'Unidad', 'Unidad', '1');
INSERT INTO `unit` VALUES ('5', 'Rollo de 100 metros', 'Rollo/100', '1000');

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
  UNIQUE KEY `ukusername` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('19', 'Gabriel', 'Salazar', 'gsalazar', 'mpalomo@gmail.com', '1', '1', '$2a$08$Ft.t6hsBNoWGPf/tF71gSOD49mobctsvLQdkv0POK8xk2s4PXFu.2');
INSERT INTO `user` VALUES ('28', 'Alexis', 'Ortiz', 'gabosoam', 'gabrielsalazar@outlook.com', '1', '2', '$2a$08$1OCfOOIZTWke4O3H2BkW2eyMduKmSnEFma3HF2SaYc8UvCY.16s4u');

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
-- View structure for v_bill
-- ----------------------------
DROP VIEW IF EXISTS `v_bill`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_bill` AS select count(0) AS `total`,`model`.`id` AS `id`,`model`.`code` AS `code`,`model`.`description` AS `description`,`product`.`bill` AS `bill` from (`product` join `model` on((`product`.`variant` = `model`.`id`))) group by `product`.`variant`,`product`.`bill` ;

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
-- View structure for v_infobill
-- ----------------------------
DROP VIEW IF EXISTS `v_infobill`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_infobill` AS select `bill`.`id` AS `id`,`provider`.`name` AS `name`,`bill`.`date` AS `date`,`bill`.`reference` AS `reference` from (`bill` join `provider` on((`bill`.`provider` = `provider`.`id`))) ;

-- ----------------------------
-- View structure for v_model
-- ----------------------------
DROP VIEW IF EXISTS `v_model`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_model` AS select `model`.`id` AS `id`,`model`.`code` AS `code`,`model`.`description` AS `description`,`unit`.`description` AS `unit`,`category`.`name` AS `category`,`brand`.`name` AS `brand` from (((`model` join `unit` on((`model`.`unit` = `unit`.`id`))) join `category` on((`model`.`category` = `category`.`id`))) join `brand` on((`model`.`brand` = `brand`.`id`))) ;

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

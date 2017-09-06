/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : inventory

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-09-06 10:22:44
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES ('21', '2', '1', '2017-09-08', '025');
INSERT INTO `bill` VALUES ('22', '1', '1', '2017-09-05', '070');
INSERT INTO `bill` VALUES ('23', '2', '2', '2017-09-15', '025');
INSERT INTO `bill` VALUES ('24', '1', '2', '2017-09-20', '025');

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ukbrand` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('13', 'CHUA2');
INSERT INTO `brand` VALUES ('3', 'HOLA');
INSERT INTO `brand` VALUES ('2', 'INTEBRAS');
INSERT INTO `brand` VALUES ('1', 'OTRO');

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
  `id` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stockmin` int(11) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unit` (`unit`),
  KEY `brand` (`brand`),
  KEY `category` (`category`),
  CONSTRAINT `brand` FOREIGN KEY (`brand`) REFERENCES `brand` (`id`),
  CONSTRAINT `category` FOREIGN KEY (`category`) REFERENCES `category` (`id`),
  CONSTRAINT `unit` FOREIGN KEY (`unit`) REFERENCES `unit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of model
-- ----------------------------
INSERT INTO `model` VALUES ('4000094', 'TELEFONO TC 60 ID NEGRO EXP', null, '52', '4', '1', '2');
INSERT INTO `model` VALUES ('4007608', 'TERMINAL DEDICADO CON CENTRAL CONDOMINAL', null, '52', '4', '1', '2');
INSERT INTO `model` VALUES ('4013330', 'HSB50 TELEFONE HEADSET INTELBRAS', null, '25', '5', '1', '2');
INSERT INTO `model` VALUES ('4030156', 'TELÉFONO ALÁMBRICO CID TC 2110', null, null, '4', '1', '2');
INSERT INTO `model` VALUES ('4060595', 'TELEFONO VOIP TS60 IPR', null, null, '4', '1', '2');
INSERT INTO `model` VALUES ('4070599', 'TELEFONO SEM FIO T60 IP', null, null, '4', '1', '2');
INSERT INTO `model` VALUES ('4080107', 'PLENO NEGRO-TELÉFONO ALÁMBRICO BÁSICO', null, null, '4', '1', '2');
INSERT INTO `model` VALUES ('4111111', 'INTERFACE CELULAR ITC 4100', null, null, '4', '1', '2');
INSERT INTO `model` VALUES ('4115000', 'BASE ITC4000 i INTELBRAS', null, null, '4', '1', '2');
INSERT INTO `model` VALUES ('4120020', 'TELEFONO INALAMBRICO DIGITAL TS 3533', null, null, '4', '1', '2');
INSERT INTO `model` VALUES ('4310012', 'TELEFONO EJECUTIVO TE 220', null, null, '4', '1', '2');
INSERT INTO `model` VALUES ('4340002', 'GATEWAY GSM IP GW280', null, null, '4', '1', '2');
INSERT INTO `model` VALUES ('4340004', 'GSM GW180 ESPANHOL PRETO GATEWAY', null, null, '4', '1', '2');
INSERT INTO `model` VALUES ('4340010', 'CENTRAL IP DECT T60 IP', null, null, '4', '1', '2');
INSERT INTO `model` VALUES ('4400145', 'PLACA DE EXPANSAO GW280', null, null, '4', '1', '2');
INSERT INTO `model` VALUES ('4501003', 'PORTERO XPE 1001 PLUS', null, null, '4', '1', '2');
INSERT INTO `model` VALUES ('4501004', 'PORTERO XPE 1001 PLUS', null, null, '4', '1', '2');
INSERT INTO `model` VALUES ('4501013', 'PORTERO XPE 1013 PLUS', null, null, '4', '1', '2');
INSERT INTO `model` VALUES ('4503101', 'CENTRAL CP 112 BASICA', null, null, '4', '1', '2');
INSERT INTO `model` VALUES ('4504500', 'LLAVERO RFID MIFARE XID1000', null, null, '4', '1', '2');
INSERT INTO `model` VALUES ('4505000', 'VIDEO PORTERO IP TVIP1000HF', null, null, '4', '1', '2');
INSERT INTO `model` VALUES ('4505200', 'CONVERSOR AUT AC/DC 24V 2,5A', null, null, '4', '1', '2');
INSERT INTO `model` VALUES ('4505300', 'DISTRIBUIDOR DE VIDEO PORTERO IP DVIP1000', null, null, '4', '1', '2');
INSERT INTO `model` VALUES ('4520801', 'MÓDULO INTERNO PARA VIDEO PORTERO IV 7000 HF IN', null, null, '4', '1', '2');
INSERT INTO `model` VALUES ('4564004', 'CAMERA DE VIDEO IP BULLET P/SIST SEG VIP S3020', null, null, '4', '1', '2');
INSERT INTO `model` VALUES ('4564008', 'CAMARA IP VIP S3020 GENERACIÓN 2', null, null, '4', '1', '2');
INSERT INTO `model` VALUES ('4580155', 'GRAVADOR DIG. DE IMAGEM NVD 1008', null, null, '4', '1', '2');
INSERT INTO `model` VALUES ('4700001', 'ATA GKM 2210 T', null, null, '4', '1', '2');
INSERT INTO `model` VALUES ('4750031', 'ROTEADOR WIRELESS HOTSPOT 300', null, null, '4', '1', '2');
INSERT INTO `model` VALUES ('4920440', 'CP 48/112 PLACA 16 RAMAIS BAL', null, null, '4', '1', '2');
INSERT INTO `model` VALUES ('4920463', 'PLACA 32 ABONADOS CP192/CP352 BALANCEADA', null, null, '4', '1', '2');
INSERT INTO `model` VALUES ('4990083', 'TARJETA 4 INTERNOS/EXTENSIONES ANALOGAS IMPACTA', null, null, '4', '1', '2');
INSERT INTO `model` VALUES ('4990084', 'TARJETA DOS TRONCALES ANÁLOGAS IMPACTA 16/40/68I', null, null, '4', '1', '2');
INSERT INTO `model` VALUES ('4990260', 'PLACA FXS CIP 850', null, null, '4', '1', '2');
INSERT INTO `model` VALUES ('4990261', 'PLACA FXO CIP 850', null, null, '4', '1', '2');
INSERT INTO `model` VALUES ('7896637643542', 'CAMARA IP VIP S4100', null, null, '4', '1', '2');
INSERT INTO `model` VALUES ('7896637644969', 'CAMARA IP VIP S4120', null, null, '4', '1', '2');
INSERT INTO `model` VALUES ('963-01001-42 B', 'VIDEO PHONE GRANDSTREAM BLACK (GXV300)', null, null, '4', '1', '2');
INSERT INTO `model` VALUES ('TC8312', 'TELEFONO DESIGN ROJO TC 8312', null, null, '4', '1', '2');
INSERT INTO `model` VALUES ('TS 3532', 'TELEFONO INALAMBRICO 3532 INTELBRAS', null, null, '4', '1', '2');

-- ----------------------------
-- Table structure for price
-- ----------------------------
DROP TABLE IF EXISTS `price`;
CREATE TABLE `price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variant` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `size` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variantprice` (`variant`),
  CONSTRAINT `fkmodel` FOREIGN KEY (`variant`) REFERENCES `model` (`id`)
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
  `variant` varchar(255) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `bill` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location` (`location`),
  KEY `variant` (`variant`),
  KEY `bill` (`bill`),
  CONSTRAINT `bill` FOREIGN KEY (`bill`) REFERENCES `bill` (`id`),
  CONSTRAINT `location` FOREIGN KEY (`location`) REFERENCES `location` (`id`),
  CONSTRAINT `model` FOREIGN KEY (`variant`) REFERENCES `model` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=882 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('2', 'MLYD4800012E7', '4700001', '13', '21');
INSERT INTO `product` VALUES ('3', 'MLYD4800040XT', '4700001', '13', '21');
INSERT INTO `product` VALUES ('4', 'MLYD4800013MX', '4700001', '13', '21');
INSERT INTO `product` VALUES ('5', 'MLYD4800017IG', '4700001', '13', '21');
INSERT INTO `product` VALUES ('6', 'MLYD4800039WX', '4700001', '13', '21');
INSERT INTO `product` VALUES ('7', 'DCRD2300733ZB', '4115000', '13', '21');
INSERT INTO `product` VALUES ('8', '9JIE3400128AV', '4564008', '13', '21');
INSERT INTO `product` VALUES ('9', '9JIE34001214A', '4564008', '13', '21');
INSERT INTO `product` VALUES ('10', '9JIE34001259J', '4564008', '13', '21');
INSERT INTO `product` VALUES ('11', 'OD12122005797', '7896637643542', '13', '21');
INSERT INTO `product` VALUES ('12', '8R3B3600022OM', '7896637644969', '13', '21');
INSERT INTO `product` VALUES ('13', '1M9E3100328OJ', '4564004', '13', '21');
INSERT INTO `product` VALUES ('14', '1M9E3200059PK', '4564004', '13', '21');
INSERT INTO `product` VALUES ('15', '1M9E3100324VA', '4564004', '13', '21');
INSERT INTO `product` VALUES ('16', '1M9E3100326V4', '4564004', '13', '21');
INSERT INTO `product` VALUES ('17', '1M9E3100330VB', '4564004', '13', '21');
INSERT INTO `product` VALUES ('18', '1M9E3100327SV', '4564004', '13', '21');
INSERT INTO `product` VALUES ('19', '1M9E31003234A', '4564004', '13', '21');
INSERT INTO `product` VALUES ('20', '1M9E3100325VC', '4564004', '13', '21');
INSERT INTO `product` VALUES ('21', '1M9E3100331XM', '4564004', '13', '21');
INSERT INTO `product` VALUES ('22', '1M9E3100329F1', '4564004', '13', '21');
INSERT INTO `product` VALUES ('23', '1M9E3200061JN', '4564004', '13', '21');
INSERT INTO `product` VALUES ('24', '1M9E3100332DF', '4564004', '13', '21');
INSERT INTO `product` VALUES ('25', '1M9E3200060N8', '4564004', '13', '21');
INSERT INTO `product` VALUES ('26', 'N42D4500072XW', '4503101', '13', '21');
INSERT INTO `product` VALUES ('27', 'N42F10001992H', '4503101', '13', '21');
INSERT INTO `product` VALUES ('28', 'N42F2300021PM', '4503101', '13', '21');
INSERT INTO `product` VALUES ('29', 'KMNE39000241T', '4340010', '13', '21');
INSERT INTO `product` VALUES ('30', 'KMNE3900036FH', '4340010', '13', '21');
INSERT INTO `product` VALUES ('31', 'QW9C3300634FD', '4505200', '13', '21');
INSERT INTO `product` VALUES ('32', 'QW9C3300631QP', '4505200', '13', '21');
INSERT INTO `product` VALUES ('33', 'QW9C3300701WN', '4505200', '13', '21');
INSERT INTO `product` VALUES ('34', 'QW9C33007037V', '4505200', '13', '21');
INSERT INTO `product` VALUES ('35', 'QW9C3300644VX', '4505200', '13', '21');
INSERT INTO `product` VALUES ('36', 'QW9C3300643AO', '4505200', '13', '21');
INSERT INTO `product` VALUES ('37', 'QW9C3300645TF', '4505200', '13', '21');
INSERT INTO `product` VALUES ('38', 'QW9C3300660BW', '4505200', '13', '21');
INSERT INTO `product` VALUES ('39', 'QW9C3300633QX', '4505200', '13', '21');
INSERT INTO `product` VALUES ('40', 'QW9C33006425T', '4505200', '13', '21');
INSERT INTO `product` VALUES ('41', 'QW9C3300635RQ', '4505200', '13', '21');
INSERT INTO `product` VALUES ('42', 'QW9C3300704P0', '4505200', '13', '21');
INSERT INTO `product` VALUES ('43', 'C6XF1300075F4', '4920440', '13', '21');
INSERT INTO `product` VALUES ('44', 'C6XF1900063YA', '4920440', '13', '21');
INSERT INTO `product` VALUES ('45', 'C6XF1900065TX', '4920440', '13', '21');
INSERT INTO `product` VALUES ('46', 'C6XF1900093MC', '4920440', '13', '21');
INSERT INTO `product` VALUES ('47', 'C6XF1900089BB', '4920440', '13', '21');
INSERT INTO `product` VALUES ('48', 'C6XF1900057VX', '4920440', '13', '21');
INSERT INTO `product` VALUES ('49', 'C6XF190007890', '4920440', '13', '21');
INSERT INTO `product` VALUES ('50', 'C6XF1300045B2', '4920440', '13', '21');
INSERT INTO `product` VALUES ('51', 'C6XF1900062B7', '4920440', '13', '21');
INSERT INTO `product` VALUES ('52', 'C6XF1900066CM', '4920440', '13', '21');
INSERT INTO `product` VALUES ('53', 'C6XF1900025AW', '4920440', '13', '21');
INSERT INTO `product` VALUES ('54', 'C6XF19000141R', '4920440', '13', '21');
INSERT INTO `product` VALUES ('55', 'C6XF1300061Y7', '4920440', '13', '21');
INSERT INTO `product` VALUES ('56', 'C6XF1900019P4', '4920440', '13', '21');
INSERT INTO `product` VALUES ('57', 'C6XF1900064RV', '4920440', '13', '21');
INSERT INTO `product` VALUES ('58', 'C6XF19000218M', '4920440', '13', '21');
INSERT INTO `product` VALUES ('59', 'C6XF19000918G', '4920440', '13', '21');
INSERT INTO `product` VALUES ('60', 'C6XF1900016VI', '4920440', '13', '21');
INSERT INTO `product` VALUES ('61', '34XC3300479AO', '4505300', '13', '21');
INSERT INTO `product` VALUES ('62', '34XC3300459XH', '4505300', '13', '21');
INSERT INTO `product` VALUES ('63', '34XC3300475JT', '4505300', '13', '21');
INSERT INTO `product` VALUES ('64', '34XC3300462II', '4505300', '13', '21');
INSERT INTO `product` VALUES ('65', '34XC3300487SV', '4505300', '13', '21');
INSERT INTO `product` VALUES ('66', '34XC33004780Q', '4505300', '13', '21');
INSERT INTO `product` VALUES ('67', '34XC3300470HG', '4505300', '13', '21');
INSERT INTO `product` VALUES ('68', '34XC33004027R', '4505300', '13', '21');
INSERT INTO `product` VALUES ('69', '34XC3300502L5', '4505300', '13', '21');
INSERT INTO `product` VALUES ('70', '34XC33004529B', '4505300', '13', '21');
INSERT INTO `product` VALUES ('71', '34XC33004646M', '4505300', '13', '21');
INSERT INTO `product` VALUES ('72', '34XC3300485HW', '4505300', '13', '21');
INSERT INTO `product` VALUES ('73', '01XD38000235M', '4340002', '13', '21');
INSERT INTO `product` VALUES ('74', '6LIE0400049PN', '4580155', '13', '21');
INSERT INTO `product` VALUES ('75', '6LIE0400060HU', '4580155', '13', '21');
INSERT INTO `product` VALUES ('76', '6LIE0400096YI', '4580155', '13', '21');
INSERT INTO `product` VALUES ('77', '6LIE040005000', '4580155', '13', '21');
INSERT INTO `product` VALUES ('78', '6LIE0400006ZW', '4580155', '13', '21');
INSERT INTO `product` VALUES ('79', '4A3D5100004GV', '4340004', '13', '21');
INSERT INTO `product` VALUES ('80', '1T5E3501123T8', '4013330', '13', '21');
INSERT INTO `product` VALUES ('81', '1T5E3501121TR', '4013330', '13', '21');
INSERT INTO `product` VALUES ('82', '1T5E35010604U', '4013330', '13', '21');
INSERT INTO `product` VALUES ('83', '1T5E3501102DJ', '4013330', '13', '21');
INSERT INTO `product` VALUES ('84', '1T5E3501105YK', '4013330', '13', '21');
INSERT INTO `product` VALUES ('85', '1T5E3501097WR', '4013330', '13', '21');
INSERT INTO `product` VALUES ('86', '1T5E3501099OG', '4013330', '13', '21');
INSERT INTO `product` VALUES ('87', '1T5E35010564Y', '4013330', '13', '21');
INSERT INTO `product` VALUES ('88', '1T5E3501100DG', '4013330', '13', '21');
INSERT INTO `product` VALUES ('89', '1T5E35010577Q', '4013330', '13', '21');
INSERT INTO `product` VALUES ('90', '1T5E3501104W4', '4013330', '13', '21');
INSERT INTO `product` VALUES ('91', '1T5E35010980G', '4013330', '13', '21');
INSERT INTO `product` VALUES ('92', '1T5E35011096T', '4013330', '13', '21');
INSERT INTO `product` VALUES ('93', '1T5E3501063ZV', '4013330', '13', '21');
INSERT INTO `product` VALUES ('94', '1T5E3501061WX', '4013330', '13', '21');
INSERT INTO `product` VALUES ('95', '1T5E35010592Y', '4013330', '13', '21');
INSERT INTO `product` VALUES ('96', '1T5E3501110QD', '4013330', '13', '21');
INSERT INTO `product` VALUES ('97', '1T5E3501124FT', '4013330', '13', '21');
INSERT INTO `product` VALUES ('98', '1T5E35010580R', '4013330', '13', '21');
INSERT INTO `product` VALUES ('99', '1T5E3501108Z4', '4013330', '13', '21');
INSERT INTO `product` VALUES ('100', '1T5E3501103GZ', '4013330', '13', '21');
INSERT INTO `product` VALUES ('101', '1T5E3501101NA', '4013330', '13', '21');
INSERT INTO `product` VALUES ('102', '1T5E350109689', '4013330', '13', '21');
INSERT INTO `product` VALUES ('103', '1T5E3501122CQ', '4013330', '13', '21');
INSERT INTO `product` VALUES ('104', '1T5E35010642T', '4013330', '13', '21');
INSERT INTO `product` VALUES ('105', '1T5E3501065O2', '4013330', '13', '21');
INSERT INTO `product` VALUES ('106', '1T5E35010625Q', '4013330', '13', '21');
INSERT INTO `product` VALUES ('107', '1T5E3501106Z4', '4013330', '13', '21');
INSERT INTO `product` VALUES ('108', '1T5E3501125OD', '4013330', '13', '21');
INSERT INTO `product` VALUES ('109', 'LVSF2000010X1', '4111111', '13', '21');
INSERT INTO `product` VALUES ('110', 'LVSF2000068NI', '4111111', '13', '21');
INSERT INTO `product` VALUES ('111', 'LVSF20000567U', '4111111', '13', '21');
INSERT INTO `product` VALUES ('112', 'LVSF2000001RG', '4111111', '13', '21');
INSERT INTO `product` VALUES ('113', 'LVSF20000791B', '4111111', '13', '21');
INSERT INTO `product` VALUES ('114', 'LVSF2000071VP', '4111111', '13', '21');
INSERT INTO `product` VALUES ('115', 'LVSF2000075EN', '4111111', '13', '21');
INSERT INTO `product` VALUES ('116', 'LVSF200002617', '4111111', '13', '21');
INSERT INTO `product` VALUES ('117', 'LVSF20000783J', '4111111', '13', '21');
INSERT INTO `product` VALUES ('118', 'LVSF2000048U4', '4111111', '13', '21');
INSERT INTO `product` VALUES ('119', 'LVSF2000038KF', '4111111', '13', '21');
INSERT INTO `product` VALUES ('120', 'LVSF2000028NN', '4111111', '13', '21');
INSERT INTO `product` VALUES ('121', 'LVSF2000015S3', '4111111', '13', '21');
INSERT INTO `product` VALUES ('122', 'LVSF20000679U', '4111111', '13', '21');
INSERT INTO `product` VALUES ('123', 'LVSF2000016YB', '4111111', '13', '21');
INSERT INTO `product` VALUES ('124', 'LVSF20000200A', '4111111', '13', '21');
INSERT INTO `product` VALUES ('125', 'LVSF2000036XT', '4111111', '13', '21');
INSERT INTO `product` VALUES ('126', 'LVSF2000033H1', '4111111', '13', '21');
INSERT INTO `product` VALUES ('127', 'LVSF20000778M', '4111111', '13', '21');
INSERT INTO `product` VALUES ('128', 'LVSF2000055VR', '4111111', '13', '21');
INSERT INTO `product` VALUES ('129', 'LVSF2000018U5', '4111111', '13', '21');
INSERT INTO `product` VALUES ('130', 'LVSF2000014E4', '4111111', '13', '21');
INSERT INTO `product` VALUES ('131', 'LVSF20000434R', '4111111', '13', '21');
INSERT INTO `product` VALUES ('132', 'LVSF2000061XD', '4111111', '13', '21');
INSERT INTO `product` VALUES ('133', 'LVSF2000076UE', '4111111', '13', '21');
INSERT INTO `product` VALUES ('134', 'LVSF20000229U', '4111111', '13', '21');
INSERT INTO `product` VALUES ('135', 'LVSF200002358', '4111111', '13', '21');
INSERT INTO `product` VALUES ('136', 'LVSF2000040AE', '4111111', '13', '21');
INSERT INTO `product` VALUES ('137', 'LVSF20000216B', '4111111', '13', '21');
INSERT INTO `product` VALUES ('138', 'LVSF2000053YO', '4111111', '13', '21');
INSERT INTO `product` VALUES ('139', 'LVSF200000563', '4111111', '13', '21');
INSERT INTO `product` VALUES ('140', 'LVSF2000073AL', '4111111', '13', '21');
INSERT INTO `product` VALUES ('141', 'LVSF2000012EK', '4111111', '13', '21');
INSERT INTO `product` VALUES ('142', 'LVSF2000049S1', '4111111', '13', '21');
INSERT INTO `product` VALUES ('143', 'LVSF2000060RW', '4111111', '13', '21');
INSERT INTO `product` VALUES ('144', 'LVSF2000025WI', '4111111', '13', '21');
INSERT INTO `product` VALUES ('145', 'LVSF2000042QC', '4111111', '13', '21');
INSERT INTO `product` VALUES ('146', 'LVSF2000057NN', '4111111', '13', '21');
INSERT INTO `product` VALUES ('147', 'LVSF2000041MG', '4111111', '13', '21');
INSERT INTO `product` VALUES ('148', 'LVSF2000008S1', '4111111', '13', '21');
INSERT INTO `product` VALUES ('149', 'LVSF2000035TG', '4111111', '13', '21');
INSERT INTO `product` VALUES ('150', 'LVSF2000017BW', '4111111', '13', '21');
INSERT INTO `product` VALUES ('151', 'LVSF2000003KR', '4111111', '13', '21');
INSERT INTO `product` VALUES ('152', 'LVSF2000031SN', '4111111', '13', '21');
INSERT INTO `product` VALUES ('153', 'LVSF2000024VP', '4111111', '13', '21');
INSERT INTO `product` VALUES ('154', 'LVSF2000027KO', '4111111', '13', '21');
INSERT INTO `product` VALUES ('155', 'LVSF20000653M', '4111111', '13', '21');
INSERT INTO `product` VALUES ('156', 'S/S', '4504500', '13', '21');
INSERT INTO `product` VALUES ('157', 'S/S', '4504500', '13', '21');
INSERT INTO `product` VALUES ('158', 'B6AD4000026O7', '4520801', '13', '21');
INSERT INTO `product` VALUES ('159', 'IQHE1300140K0', '4920463', '13', '21');
INSERT INTO `product` VALUES ('160', 'AHCD2900007NM', '4400145', '13', '21');
INSERT INTO `product` VALUES ('161', 'CA11072902691', '4990261', '13', '21');
INSERT INTO `product` VALUES ('162', 'CA11030300155', '4990260', '13', '21');
INSERT INTO `product` VALUES ('163', '0N4F2002308ZU', '4080107', '13', '21');
INSERT INTO `product` VALUES ('164', '0N4E15003758U', '4080107', '13', '21');
INSERT INTO `product` VALUES ('165', '0N4F2002271CI', '4080107', '13', '21');
INSERT INTO `product` VALUES ('166', '0N4E1500370KH', '4080107', '13', '21');
INSERT INTO `product` VALUES ('167', '0N4E1500936LS', '4080107', '13', '21');
INSERT INTO `product` VALUES ('168', '0N4E15009597V', '4080107', '13', '21');
INSERT INTO `product` VALUES ('169', '0N4E1500403OP', '4080107', '13', '21');
INSERT INTO `product` VALUES ('170', '0N4E1500675HR', '4080107', '13', '21');
INSERT INTO `product` VALUES ('171', '0N4E150096013', '4080107', '13', '21');
INSERT INTO `product` VALUES ('172', '0N4E1500676L8', '4080107', '13', '21');
INSERT INTO `product` VALUES ('173', '0N4E15009564C', '4080107', '13', '21');
INSERT INTO `product` VALUES ('174', '0N4E1500654PZ', '4080107', '13', '21');
INSERT INTO `product` VALUES ('175', '0N4F20012430Y', '4080107', '13', '21');
INSERT INTO `product` VALUES ('176', '0N4E15006776D', '4080107', '13', '21');
INSERT INTO `product` VALUES ('177', '0N4F2001280UR', '4080107', '13', '21');
INSERT INTO `product` VALUES ('178', '0N4F2001260F2', '4080107', '13', '21');
INSERT INTO `product` VALUES ('179', '0N4F20023385G', '4080107', '13', '21');
INSERT INTO `product` VALUES ('180', '0N4F20022650C', '4080107', '13', '21');
INSERT INTO `product` VALUES ('181', '0N4E1500376VD', '4080107', '13', '21');
INSERT INTO `product` VALUES ('182', '0N4F2002264KZ', '4080107', '13', '21');
INSERT INTO `product` VALUES ('183', '0N4E150037235', '4080107', '13', '21');
INSERT INTO `product` VALUES ('184', '0N4E1500655WL', '4080107', '13', '21');
INSERT INTO `product` VALUES ('185', '0N4F2002325M0', '4080107', '13', '21');
INSERT INTO `product` VALUES ('186', '0N4F2001277JL', '4080107', '13', '21');
INSERT INTO `product` VALUES ('187', '0N4F2002317X2', '4080107', '13', '21');
INSERT INTO `product` VALUES ('188', '0N4F20012450T', '4080107', '13', '21');
INSERT INTO `product` VALUES ('189', '0N4F2001244P4', '4080107', '13', '21');
INSERT INTO `product` VALUES ('190', '0N4F20012493L', '4080107', '13', '21');
INSERT INTO `product` VALUES ('191', '0N4F2002306MM', '4080107', '13', '21');
INSERT INTO `product` VALUES ('192', '0N4F2002323WD', '4080107', '13', '21');
INSERT INTO `product` VALUES ('193', '0N4E15003799V', '4080107', '13', '21');
INSERT INTO `product` VALUES ('194', '0N4E1500377S9', '4080107', '13', '21');
INSERT INTO `product` VALUES ('195', '0N4E1500657ZV', '4080107', '13', '21');
INSERT INTO `product` VALUES ('196', '0N4E1500939TP', '4080107', '13', '21');
INSERT INTO `product` VALUES ('197', '0N4E1500940OJ', '4080107', '13', '21');
INSERT INTO `product` VALUES ('198', '0N4F2001281NP', '4080107', '13', '21');
INSERT INTO `product` VALUES ('199', '0N4F200127931', '4080107', '13', '21');
INSERT INTO `product` VALUES ('200', '0N4F2001256XF', '4080107', '13', '21');
INSERT INTO `product` VALUES ('201', '0N4F2002328RC', '4080107', '13', '21');
INSERT INTO `product` VALUES ('202', '0N4F20023197F', '4080107', '13', '21');
INSERT INTO `product` VALUES ('203', '0N4F2002313KS', '4080107', '13', '21');
INSERT INTO `product` VALUES ('204', '0N4F2002320SE', '4080107', '13', '21');
INSERT INTO `product` VALUES ('205', '0N4F20023216Y', '4080107', '13', '21');
INSERT INTO `product` VALUES ('206', '0N4F2002316GC', '4080107', '13', '21');
INSERT INTO `product` VALUES ('207', '0N4F20023229H', '4080107', '13', '21');
INSERT INTO `product` VALUES ('208', '0N4E1500378NB', '4080107', '13', '21');
INSERT INTO `product` VALUES ('209', '0N4F2002315S2', '4080107', '13', '21');
INSERT INTO `product` VALUES ('210', '0N4F20022607H', '4080107', '13', '21');
INSERT INTO `product` VALUES ('211', '0N4E150037334', '4080107', '13', '21');
INSERT INTO `product` VALUES ('212', '0N4F20012487W', '4080107', '13', '21');
INSERT INTO `product` VALUES ('213', '0N4E1500937XY', '4080107', '13', '21');
INSERT INTO `product` VALUES ('214', '0N4E1500374RF', '4080107', '13', '21');
INSERT INTO `product` VALUES ('215', '0N4F200125024', '4080107', '13', '21');
INSERT INTO `product` VALUES ('216', '0N4F2002259X3', '4080107', '13', '21');
INSERT INTO `product` VALUES ('217', '0N4F2001257SJ', '4080107', '13', '21');
INSERT INTO `product` VALUES ('218', '0N4F2002268UW', '4080107', '13', '21');
INSERT INTO `product` VALUES ('219', '0N4F2002314EC', '4080107', '13', '21');
INSERT INTO `product` VALUES ('220', '0N4F2001258FZ', '4080107', '13', '21');
INSERT INTO `product` VALUES ('221', '0N4F200231084', '4080107', '13', '21');
INSERT INTO `product` VALUES ('222', '0N4F2002270Y1', '4080107', '13', '21');
INSERT INTO `product` VALUES ('223', '0N4F2002261EN', '4080107', '13', '21');
INSERT INTO `product` VALUES ('224', '0N4E1500678SH', '4080107', '13', '21');
INSERT INTO `product` VALUES ('225', '0N4E15006725F', '4080107', '13', '21');
INSERT INTO `product` VALUES ('226', '0N4E1500674G8', '4080107', '13', '21');
INSERT INTO `product` VALUES ('227', '0N4F2002267SD', '4080107', '13', '21');
INSERT INTO `product` VALUES ('228', '0N4F2002327CO', '4080107', '13', '21');
INSERT INTO `product` VALUES ('229', '0N4E1500658SB', '4080107', '13', '21');
INSERT INTO `product` VALUES ('230', '0N4F2001246SA', '4080107', '13', '21');
INSERT INTO `product` VALUES ('231', '0N4F2000275KM', '4080107', '13', '21');
INSERT INTO `product` VALUES ('232', '0N4F200124140', '4080107', '13', '21');
INSERT INTO `product` VALUES ('233', '0N4E1500656IW', '4080107', '13', '21');
INSERT INTO `product` VALUES ('234', '0N4F200230792', '4080107', '13', '21');
INSERT INTO `product` VALUES ('235', '0N4F20012783K', '4080107', '13', '21');
INSERT INTO `product` VALUES ('236', '0N4F2002326Q7', '4080107', '13', '21');
INSERT INTO `product` VALUES ('237', '0N4F20012428V', '4080107', '13', '21');
INSERT INTO `product` VALUES ('238', '0N4E15006710M', '4080107', '13', '21');
INSERT INTO `product` VALUES ('239', '0N4E1500669JM', '4080107', '13', '21');
INSERT INTO `product` VALUES ('240', '0N4E15006704S', '4080107', '13', '21');
INSERT INTO `product` VALUES ('241', '0N4E15009384E', '4080107', '13', '21');
INSERT INTO `product` VALUES ('242', '0N4F20023090B', '4080107', '13', '21');
INSERT INTO `product` VALUES ('243', '0N4E15006736H', '4080107', '13', '21');
INSERT INTO `product` VALUES ('244', '0N4E1500371D7', '4080107', '13', '21');
INSERT INTO `product` VALUES ('245', '0N4F2001259J3', '4080107', '13', '21');
INSERT INTO `product` VALUES ('246', 'N0WC210000621', '4501003', '13', '21');
INSERT INTO `product` VALUES ('247', 'N0WC2100005NO', '4501003', '13', '21');
INSERT INTO `product` VALUES ('248', 'N0WC2100090HX', '4501003', '13', '21');
INSERT INTO `product` VALUES ('249', '036F2200002KK', '4501004', '13', '21');
INSERT INTO `product` VALUES ('250', 'N0WC2100004TU', '4501003', '13', '21');
INSERT INTO `product` VALUES ('251', '036F2200021O4', '4501004', '13', '21');
INSERT INTO `product` VALUES ('252', '036F2200012Q8', '4501004', '13', '21');
INSERT INTO `product` VALUES ('253', '036F2200011YR', '4501004', '13', '21');
INSERT INTO `product` VALUES ('254', '036F2200019GY', '4501004', '13', '21');
INSERT INTO `product` VALUES ('255', '036F2200018IR', '4501004', '13', '21');
INSERT INTO `product` VALUES ('256', '036F2200001G3', '4501004', '13', '21');
INSERT INTO `product` VALUES ('257', '036F22000034B', '4501004', '13', '21');
INSERT INTO `product` VALUES ('258', '036F220002006', '4501004', '13', '21');
INSERT INTO `product` VALUES ('259', '036F22000221P', '4501004', '13', '21');
INSERT INTO `product` VALUES ('260', 'ENFF1600089HM', '4501013', '13', '21');
INSERT INTO `product` VALUES ('261', 'ENFF2001284EN', '4501013', '13', '21');
INSERT INTO `product` VALUES ('262', 'ENFF1900321UW', '4501013', '13', '21');
INSERT INTO `product` VALUES ('263', 'ENFF16000655B', '4501013', '13', '21');
INSERT INTO `product` VALUES ('264', 'ENFF200128373', '4501013', '13', '21');
INSERT INTO `product` VALUES ('265', 'ENFF19003208H', '4501013', '13', '21');
INSERT INTO `product` VALUES ('266', 'ENFF160008809', '4501013', '13', '21');
INSERT INTO `product` VALUES ('267', 'ENFF1900323BX', '4501013', '13', '21');
INSERT INTO `product` VALUES ('268', 'ENFF1900322OW', '4501013', '13', '21');
INSERT INTO `product` VALUES ('269', 'ENFF1900319Z9', '4501013', '13', '21');
INSERT INTO `product` VALUES ('270', 'LWFF2300724P5', '4750031', '13', '21');
INSERT INTO `product` VALUES ('271', 'LWFF23007739A', '4750031', '13', '21');
INSERT INTO `product` VALUES ('272', 'LWFF23012418V', '4750031', '13', '21');
INSERT INTO `product` VALUES ('273', 'LWFF2300731R5', '4750031', '13', '21');
INSERT INTO `product` VALUES ('274', 'LWFF2202802YC', '4750031', '13', '21');
INSERT INTO `product` VALUES ('275', 'LWFE38008890F', '4750031', '13', '21');
INSERT INTO `product` VALUES ('276', 'LWFF23012369T', '4750031', '13', '21');
INSERT INTO `product` VALUES ('277', 'LWFF230114808', '4750031', '13', '21');
INSERT INTO `product` VALUES ('278', 'LWFF2301146UH', '4750031', '13', '21');
INSERT INTO `product` VALUES ('279', 'LWFF2301239CW', '4750031', '13', '21');
INSERT INTO `product` VALUES ('280', 'LWFF23012374R', '4750031', '13', '21');
INSERT INTO `product` VALUES ('281', 'LWFF2300756P3', '4750031', '13', '21');
INSERT INTO `product` VALUES ('282', 'LWFF230072213', '4750031', '13', '21');
INSERT INTO `product` VALUES ('283', 'LWFF2301233WB', '4750031', '13', '21');
INSERT INTO `product` VALUES ('284', 'LWFF230078177', '4750031', '13', '21');
INSERT INTO `product` VALUES ('285', 'LWFF2300710QJ', '4750031', '13', '21');
INSERT INTO `product` VALUES ('286', 'LWFF23007181H', '4750031', '13', '21');
INSERT INTO `product` VALUES ('287', 'LWFF2301240UI', '4750031', '13', '21');
INSERT INTO `product` VALUES ('288', 'LWFF2300723MP', '4750031', '13', '21');
INSERT INTO `product` VALUES ('289', 'LWFE1203759QY', '4750031', '13', '21');
INSERT INTO `product` VALUES ('290', 'LWFE3800879WF', '4750031', '13', '21');
INSERT INTO `product` VALUES ('291', 'LWFE38008919C', '4750031', '13', '21');
INSERT INTO `product` VALUES ('292', 'LWFF230072654', '4750031', '13', '21');
INSERT INTO `product` VALUES ('293', 'LWFF2300752RL', '4750031', '13', '21');
INSERT INTO `product` VALUES ('294', 'LWFE3800880OW', '4750031', '13', '21');
INSERT INTO `product` VALUES ('295', 'LWFE3800878YH', '4750031', '13', '21');
INSERT INTO `product` VALUES ('296', 'LWFE3800894T9', '4750031', '13', '21');
INSERT INTO `product` VALUES ('297', 'LWFE3800934E4', '4750031', '13', '21');
INSERT INTO `product` VALUES ('298', 'LWFF2301234JE', '4750031', '13', '21');
INSERT INTO `product` VALUES ('299', 'LWFE38008932C', '4750031', '13', '21');
INSERT INTO `product` VALUES ('300', 'LWFF2301147MP', '4750031', '13', '21');
INSERT INTO `product` VALUES ('301', 'LWFE380089226', '4750031', '13', '21');
INSERT INTO `product` VALUES ('302', 'LWFF2300758XW', '4750031', '13', '21');
INSERT INTO `product` VALUES ('303', 'LWFE380089509', '4750031', '13', '21');
INSERT INTO `product` VALUES ('304', 'LWFE38009321C', '4750031', '13', '21');
INSERT INTO `product` VALUES ('305', 'LWFF2202810NI', '4750031', '13', '21');
INSERT INTO `product` VALUES ('306', 'LWFE38009318Q', '4750031', '13', '21');
INSERT INTO `product` VALUES ('307', 'LWFF2300703LA', '4750031', '13', '21');
INSERT INTO `product` VALUES ('308', 'LWFF2300714V1', '4750031', '13', '21');
INSERT INTO `product` VALUES ('309', 'LWFF2300715Y4', '4750031', '13', '21');
INSERT INTO `product` VALUES ('310', 'LWFF2300716Y5', '4750031', '13', '21');
INSERT INTO `product` VALUES ('311', 'LWFF23007197G', '4750031', '13', '21');
INSERT INTO `product` VALUES ('312', 'LWFF2300713VX', '4750031', '13', '21');
INSERT INTO `product` VALUES ('313', 'LWFF2300708RI', '4750031', '13', '21');
INSERT INTO `product` VALUES ('314', 'LWFF2300704QF', '4750031', '13', '21');
INSERT INTO `product` VALUES ('315', 'LWFF2300717PY', '4750031', '13', '21');
INSERT INTO `product` VALUES ('316', 'LWFF2301235Y2', '4750031', '13', '21');
INSERT INTO `product` VALUES ('317', 'LWFF2300721ZC', '4750031', '13', '21');
INSERT INTO `product` VALUES ('318', 'LWFF2202809F9', '4750031', '13', '21');
INSERT INTO `product` VALUES ('319', 'LWFF2202808NP', '4750031', '13', '21');
INSERT INTO `product` VALUES ('320', 'LWFF2202807Z8', '4750031', '13', '21');
INSERT INTO `product` VALUES ('321', 'LWFF2301238VO', '4750031', '13', '21');
INSERT INTO `product` VALUES ('322', 'LWFF2301136QH', '4750031', '13', '21');
INSERT INTO `product` VALUES ('323', 'LWFF2300709BA', '4750031', '13', '21');
INSERT INTO `product` VALUES ('324', 'LWFF23007252B', '4750031', '13', '21');
INSERT INTO `product` VALUES ('325', 'LWFF2300782J0', '4750031', '13', '21');
INSERT INTO `product` VALUES ('326', 'LWFE1203641JZ', '4750031', '13', '21');
INSERT INTO `product` VALUES ('327', 'LWFE1203576MK', '4750031', '13', '21');
INSERT INTO `product` VALUES ('328', 'LWFE1203668HU', '4750031', '13', '21');
INSERT INTO `product` VALUES ('329', 'LWFE1203594SG', '4750031', '13', '21');
INSERT INTO `product` VALUES ('330', 'LWFF2202806KI', '4750031', '13', '21');
INSERT INTO `product` VALUES ('331', 'LWFF2301242ZH', '4750031', '13', '21');
INSERT INTO `product` VALUES ('332', 'LWFE1203741ZL', '4750031', '13', '21');
INSERT INTO `product` VALUES ('333', 'LWFF2300768E0', '4750031', '13', '21');
INSERT INTO `product` VALUES ('334', 'LWFF2301243VZ', '4750031', '13', '21');
INSERT INTO `product` VALUES ('335', 'LWFE1203805KF', '4750031', '13', '21');
INSERT INTO `product` VALUES ('336', 'LWFF2301221IT', '4750031', '13', '21');
INSERT INTO `product` VALUES ('337', 'LWFE1203749PH', '4750031', '13', '21');
INSERT INTO `product` VALUES ('338', 'LWFF2300767VY', '4750031', '13', '21');
INSERT INTO `product` VALUES ('339', 'LWFF2300791CA', '4750031', '13', '21');
INSERT INTO `product` VALUES ('340', 'LWFE1203597RS', '4750031', '13', '21');
INSERT INTO `product` VALUES ('341', 'BO3E2100566SQ', '4990083', '13', '21');
INSERT INTO `product` VALUES ('342', 'BO3E3400436X3', '4990083', '13', '21');
INSERT INTO `product` VALUES ('343', 'AOXE34001254W', '4990084', '13', '21');
INSERT INTO `product` VALUES ('344', 'PLKE2900179L2', '4030156', '13', '21');
INSERT INTO `product` VALUES ('345', 'PLKE2900309D8', '4030156', '13', '21');
INSERT INTO `product` VALUES ('346', 'PLKE2904798SZ', '4030156', '13', '21');
INSERT INTO `product` VALUES ('347', 'PLKE2906116BJ', '4030156', '13', '21');
INSERT INTO `product` VALUES ('348', 'PLKE29003404R', '4030156', '13', '21');
INSERT INTO `product` VALUES ('349', 'PLKE2900499IP', '4030156', '13', '21');
INSERT INTO `product` VALUES ('350', 'PLKE2900778YK', '4030156', '13', '21');
INSERT INTO `product` VALUES ('351', 'PLKE290077921', '4030156', '13', '21');
INSERT INTO `product` VALUES ('352', 'PLKE29007801F', '4030156', '13', '21');
INSERT INTO `product` VALUES ('353', 'PLKE2900776YB', '4030156', '13', '21');
INSERT INTO `product` VALUES ('354', 'PLKE2900775YB', '4030156', '13', '21');
INSERT INTO `product` VALUES ('355', 'PLKE2900777KG', '4030156', '13', '21');
INSERT INTO `product` VALUES ('356', 'PLKE2906120Z7', '4030156', '13', '21');
INSERT INTO `product` VALUES ('357', 'PLKE2906089K3', '4030156', '13', '21');
INSERT INTO `product` VALUES ('358', 'PLKE29003382M', '4030156', '13', '21');
INSERT INTO `product` VALUES ('359', 'PLKE29061189W', '4030156', '13', '21');
INSERT INTO `product` VALUES ('360', 'PLKE2906115VS', '4030156', '13', '21');
INSERT INTO `product` VALUES ('361', 'PLKE2906799TX', '4030156', '13', '21');
INSERT INTO `product` VALUES ('362', 'PLKE2900341W2', '4030156', '13', '21');
INSERT INTO `product` VALUES ('363', 'PLKE2902652BE', '4030156', '13', '21');
INSERT INTO `product` VALUES ('364', 'PLKE290062589', '4030156', '13', '21');
INSERT INTO `product` VALUES ('365', 'PLKE2900627BX', '4030156', '13', '21');
INSERT INTO `product` VALUES ('366', 'PLKE29006281R', '4030156', '13', '21');
INSERT INTO `product` VALUES ('367', 'PLKE29006292C', '4030156', '13', '21');
INSERT INTO `product` VALUES ('368', 'PLKE2900339JB', '4030156', '13', '21');
INSERT INTO `product` VALUES ('369', 'PLKE29048004T', '4030156', '13', '21');
INSERT INTO `product` VALUES ('370', 'PLKE2900337D7', '4030156', '13', '21');
INSERT INTO `product` VALUES ('371', 'PLKE2900145HS', '4030156', '13', '21');
INSERT INTO `product` VALUES ('372', 'PLKE2900342EI', '4030156', '13', '21');
INSERT INTO `product` VALUES ('373', 'PLKE29001478B', '4030156', '13', '21');
INSERT INTO `product` VALUES ('374', 'PLKE2902650KW', '4030156', '13', '21');
INSERT INTO `product` VALUES ('375', 'PLKE2904797PA', '4030156', '13', '21');
INSERT INTO `product` VALUES ('376', 'PLKE2906090CR', '4030156', '13', '21');
INSERT INTO `product` VALUES ('377', 'PLKE290479508', '4030156', '13', '21');
INSERT INTO `product` VALUES ('378', 'PLKE2904796Q0', '4030156', '13', '21');
INSERT INTO `product` VALUES ('379', 'PLKE2900630K8', '4030156', '13', '21');
INSERT INTO `product` VALUES ('380', 'PLKE2906806QH', '4030156', '13', '21');
INSERT INTO `product` VALUES ('381', 'PLKE2900296TV', '4030156', '13', '21');
INSERT INTO `product` VALUES ('382', 'PLKE2900297L0', '4030156', '13', '21');
INSERT INTO `product` VALUES ('383', 'PLKE2900501KG', '4030156', '13', '21');
INSERT INTO `product` VALUES ('384', 'PLKE2900760VV', '4030156', '13', '21');
INSERT INTO `product` VALUES ('385', 'PLKE2900500B8', '4030156', '13', '21');
INSERT INTO `product` VALUES ('386', 'PLKE2900762QO', '4030156', '13', '21');
INSERT INTO `product` VALUES ('387', 'PLKE2900757AZ', '4030156', '13', '21');
INSERT INTO `product` VALUES ('388', 'PLKE2900758B4', '4030156', '13', '21');
INSERT INTO `product` VALUES ('389', 'PLKE2900759JB', '4030156', '13', '21');
INSERT INTO `product` VALUES ('390', 'PLKE29003111W', '4030156', '13', '21');
INSERT INTO `product` VALUES ('391', 'PLKE2900503VB', '4030156', '13', '21');
INSERT INTO `product` VALUES ('392', 'PLKE2900298OR', '4030156', '13', '21');
INSERT INTO `product` VALUES ('393', 'PLKE29060591Z', '4030156', '13', '21');
INSERT INTO `product` VALUES ('394', 'PLKE2900289HW', '4030156', '13', '21');
INSERT INTO `product` VALUES ('395', 'PLKE2906056XS', '4030156', '13', '21');
INSERT INTO `product` VALUES ('396', 'PLKE2906057AA', '4030156', '13', '21');
INSERT INTO `product` VALUES ('397', 'PLKE2906055DL', '4030156', '13', '21');
INSERT INTO `product` VALUES ('398', 'PLKE290029328', '4030156', '13', '21');
INSERT INTO `product` VALUES ('399', 'PLKE2900292S5', '4030156', '13', '21');
INSERT INTO `product` VALUES ('400', 'PLKE2900294XG', '4030156', '13', '21');
INSERT INTO `product` VALUES ('401', 'PLKE2900307H1', '4030156', '13', '21');
INSERT INTO `product` VALUES ('402', 'PLKE2906058LD', '4030156', '13', '21');
INSERT INTO `product` VALUES ('403', 'PLKE2900504YX', '4030156', '13', '21');
INSERT INTO `product` VALUES ('404', 'PLKE2906086SX', '4030156', '13', '21');
INSERT INTO `product` VALUES ('405', 'PLKE2900180BA', '4030156', '13', '21');
INSERT INTO `product` VALUES ('406', 'PLKE2906119FH', '4030156', '13', '21');
INSERT INTO `product` VALUES ('407', 'PLKE290606036', '4030156', '13', '21');
INSERT INTO `product` VALUES ('408', 'PLKE2900502I2', '4030156', '13', '21');
INSERT INTO `product` VALUES ('409', 'PLKE2900952O3', '4030156', '13', '21');
INSERT INTO `product` VALUES ('410', 'PLKE29009535X', '4030156', '13', '21');
INSERT INTO `product` VALUES ('411', 'PLKE2900954X6', '4030156', '13', '21');
INSERT INTO `product` VALUES ('412', 'PLKE2900950NQ', '4030156', '13', '21');
INSERT INTO `product` VALUES ('413', 'PLKE29009519O', '4030156', '13', '21');
INSERT INTO `product` VALUES ('414', 'PLKE29009490H', '4030156', '13', '21');
INSERT INTO `product` VALUES ('415', 'PLKE290029540', '4030156', '13', '21');
INSERT INTO `product` VALUES ('416', 'PLKE2900291OV', '4030156', '13', '21');
INSERT INTO `product` VALUES ('417', 'PLKE2900300K9', '4030156', '13', '21');
INSERT INTO `product` VALUES ('418', 'PLKE2906085KI', '4030156', '13', '21');
INSERT INTO `product` VALUES ('419', 'PLKE29068101A', '4030156', '13', '21');
INSERT INTO `product` VALUES ('420', 'PLKE2906809X9', '4030156', '13', '21');
INSERT INTO `product` VALUES ('421', 'PLKE29068089K', '4030156', '13', '21');
INSERT INTO `product` VALUES ('422', 'PLKE2906807NK', '4030156', '13', '21');
INSERT INTO `product` VALUES ('423', 'PLKE29060889X', '4030156', '13', '21');
INSERT INTO `product` VALUES ('424', 'PLKE2900761EK', '4030156', '13', '21');
INSERT INTO `product` VALUES ('425', 'PLKE2906801NJ', '4030156', '13', '21');
INSERT INTO `product` VALUES ('426', 'PLKE2900299L6', '4030156', '13', '21');
INSERT INTO `product` VALUES ('427', 'PLKE2900551YG', '4030156', '13', '21');
INSERT INTO `product` VALUES ('428', 'PLKE290608718', '4030156', '13', '21');
INSERT INTO `product` VALUES ('429', 'PLKE29043805S', '4030156', '13', '21');
INSERT INTO `product` VALUES ('430', 'PLKE2900170LT', '4030156', '13', '21');
INSERT INTO `product` VALUES ('431', 'PLKE29002253J', '4030156', '13', '21');
INSERT INTO `product` VALUES ('432', 'PLKE2900223B0', '4030156', '13', '21');
INSERT INTO `product` VALUES ('433', 'PLKE290022482', '4030156', '13', '21');
INSERT INTO `product` VALUES ('434', 'PLKE29002271I', '4030156', '13', '21');
INSERT INTO `product` VALUES ('435', 'PLKE2900177O4', '4030156', '13', '21');
INSERT INTO `product` VALUES ('436', 'PLKE2900647VQ', '4030156', '13', '21');
INSERT INTO `product` VALUES ('437', 'PLKE2900547PD', '4030156', '13', '21');
INSERT INTO `product` VALUES ('438', 'PLKE29068054L', '4030156', '13', '21');
INSERT INTO `product` VALUES ('439', 'PLKE2900312U2', '4030156', '13', '21');
INSERT INTO `product` VALUES ('440', 'PLKE2900148Y9', '4030156', '13', '21');
INSERT INTO `product` VALUES ('441', 'PLKE2900149VN', '4030156', '13', '21');
INSERT INTO `product` VALUES ('442', 'PLKE290015094', '4030156', '13', '21');
INSERT INTO `product` VALUES ('443', 'PLKE2900171HN', '4030156', '13', '21');
INSERT INTO `product` VALUES ('444', 'PLKE29001698W', '4030156', '13', '21');
INSERT INTO `product` VALUES ('445', 'PLKE2906804U3', '4030156', '13', '21');
INSERT INTO `product` VALUES ('446', 'PLKE2900799MP', '4030156', '13', '21');
INSERT INTO `product` VALUES ('447', 'PLKE2900548RF', '4030156', '13', '21');
INSERT INTO `product` VALUES ('448', 'PLKE2900546DI', '4030156', '13', '21');
INSERT INTO `product` VALUES ('449', 'PLKE2902649ER', '4030156', '13', '21');
INSERT INTO `product` VALUES ('450', 'PLKE2900541RE', '4030156', '13', '21');
INSERT INTO `product` VALUES ('451', 'PLKE2900544UF', '4030156', '13', '21');
INSERT INTO `product` VALUES ('452', 'PLKE2900545PB', '4030156', '13', '21');
INSERT INTO `product` VALUES ('453', 'PLKE2900648X4', '4030156', '13', '21');
INSERT INTO `product` VALUES ('454', 'PLKE29001768D', '4030156', '13', '21');
INSERT INTO `product` VALUES ('455', 'PLKE29001462O', '4030156', '13', '21');
INSERT INTO `product` VALUES ('456', 'PLKE2900803R3', '4030156', '13', '21');
INSERT INTO `product` VALUES ('457', 'PLKE2900310FI', '4030156', '13', '21');
INSERT INTO `product` VALUES ('458', 'PLKE29002907V', '4030156', '13', '21');
INSERT INTO `product` VALUES ('459', 'PLKE2906802SS', '4030156', '13', '21');
INSERT INTO `product` VALUES ('460', 'PLKE2900178Z3', '4030156', '13', '21');
INSERT INTO `product` VALUES ('461', 'PLKE29003087T', '4030156', '13', '21');
INSERT INTO `product` VALUES ('462', 'PLKE2900549UV', '4030156', '13', '21');
INSERT INTO `product` VALUES ('463', 'PLKE2900816ZI', '4030156', '13', '21');
INSERT INTO `product` VALUES ('464', 'PLKE29008028S', '4030156', '13', '21');
INSERT INTO `product` VALUES ('465', 'PLKE2906800Y1', '4030156', '13', '21');
INSERT INTO `product` VALUES ('466', 'PLKE29008121Z', '4030156', '13', '21');
INSERT INTO `product` VALUES ('467', 'PLKE2906117TN', '4030156', '13', '21');
INSERT INTO `product` VALUES ('468', 'PLKE2902651E6', '4030156', '13', '21');
INSERT INTO `product` VALUES ('469', 'PLKE2900811E5', '4030156', '13', '21');
INSERT INTO `product` VALUES ('470', 'PLKE29008139Y', '4030156', '13', '21');
INSERT INTO `product` VALUES ('471', 'PLKE29008002M', '4030156', '13', '21');
INSERT INTO `product` VALUES ('472', 'PLKE2900814XZ', '4030156', '13', '21');
INSERT INTO `product` VALUES ('473', 'PLKE2900552ZK', '4030156', '13', '21');
INSERT INTO `product` VALUES ('474', 'PLKE290264721', '4030156', '13', '21');
INSERT INTO `product` VALUES ('475', 'PLKE2900815IM', '4030156', '13', '21');
INSERT INTO `product` VALUES ('476', 'PLKE290080424', '4030156', '13', '21');
INSERT INTO `product` VALUES ('477', 'PLKE29008013Y', '4030156', '13', '21');
INSERT INTO `product` VALUES ('478', 'PLKE2900542GE', '4030156', '13', '21');
INSERT INTO `product` VALUES ('479', 'PLKE2900645EC', '4030156', '13', '21');
INSERT INTO `product` VALUES ('480', 'PLKE2904377PB', '4030156', '13', '21');
INSERT INTO `product` VALUES ('481', 'PLKE290479932', '4030156', '13', '21');
INSERT INTO `product` VALUES ('482', 'PLKE2900174Q9', '4030156', '13', '21');
INSERT INTO `product` VALUES ('483', 'PLKE2900172YB', '4030156', '13', '21');
INSERT INTO `product` VALUES ('484', 'PLKE2900626GV', '4030156', '13', '21');
INSERT INTO `product` VALUES ('485', 'PLKE2900550Y1', '4030156', '13', '21');
INSERT INTO `product` VALUES ('486', 'PLKE2900173DV', '4030156', '13', '21');
INSERT INTO `product` VALUES ('487', 'PLKE2902648CH', '4030156', '13', '21');
INSERT INTO `product` VALUES ('488', 'PLKE2900643JW', '4030156', '13', '21');
INSERT INTO `product` VALUES ('489', 'PLKE2906803NN', '4030156', '13', '21');
INSERT INTO `product` VALUES ('490', 'PLKE2900543VM', '4030156', '13', '21');
INSERT INTO `product` VALUES ('491', 'PLKE2900646LQ', '4030156', '13', '21');
INSERT INTO `product` VALUES ('492', 'PLKE2900644YH', '4030156', '13', '21');
INSERT INTO `product` VALUES ('493', 'PLKE2900175P6', '4030156', '13', '21');
INSERT INTO `product` VALUES ('494', '7JYC4503889TS', 'TC8312', '13', '21');
INSERT INTO `product` VALUES ('495', 'WJND2100857P4', '4310012', '13', '21');
INSERT INTO `product` VALUES ('496', 'T3LB480068126', 'TS 3532', '13', '21');
INSERT INTO `product` VALUES ('497', '004D2900095NB', '4120020', '13', '21');
INSERT INTO `product` VALUES ('498', '004D060083150', '4120020', '13', '21');
INSERT INTO `product` VALUES ('499', '004D06009131N', '4120020', '13', '21');
INSERT INTO `product` VALUES ('500', '004D06007419D', '4120020', '13', '21');
INSERT INTO `product` VALUES ('501', '6CYE3900036H1', '4070599', '13', '21');
INSERT INTO `product` VALUES ('502', '6BXD1006899WO', '4000094', '13', '21');
INSERT INTO `product` VALUES ('503', '6BXD1006900YU', '4000094', '13', '21');
INSERT INTO `product` VALUES ('504', '6BXD1006898RV', '4000094', '13', '21');
INSERT INTO `product` VALUES ('505', '6BXD1006897M9', '4000094', '13', '21');
INSERT INTO `product` VALUES ('506', '6BXD1010082L2', '4000094', '13', '21');
INSERT INTO `product` VALUES ('507', '6BXD1010085AZ', '4000094', '13', '21');
INSERT INTO `product` VALUES ('508', '6BXD1010081LL', '4000094', '13', '21');
INSERT INTO `product` VALUES ('509', '6BXD10102753C', '4000094', '13', '21');
INSERT INTO `product` VALUES ('510', '6BXD10100844T', '4000094', '13', '21');
INSERT INTO `product` VALUES ('511', '6BXD1010271HC', '4000094', '13', '21');
INSERT INTO `product` VALUES ('512', '6BXD1006939H6', '4000094', '13', '21');
INSERT INTO `product` VALUES ('513', '6BXD1006938LX', '4000094', '13', '21');
INSERT INTO `product` VALUES ('514', '6BXD1010274IC', '4000094', '13', '21');
INSERT INTO `product` VALUES ('515', '6BXD1006940IP', '4000094', '13', '21');
INSERT INTO `product` VALUES ('516', '6BXD1010272UY', '4000094', '13', '21');
INSERT INTO `product` VALUES ('517', '6BXD1006937ML', '4000094', '13', '21');
INSERT INTO `product` VALUES ('518', '6BXD1010273M6', '4000094', '13', '21');
INSERT INTO `product` VALUES ('519', '6BXD1010083KC', '4000094', '13', '21');
INSERT INTO `product` VALUES ('520', '6BXD1006936H4', '4000094', '13', '21');
INSERT INTO `product` VALUES ('521', 'ZKDD1600076D9', '4060595', '13', '21');
INSERT INTO `product` VALUES ('522', 'ZKDD16000806K', '4060595', '13', '21');
INSERT INTO `product` VALUES ('523', 'ZKDD16001036I', '4060595', '13', '21');
INSERT INTO `product` VALUES ('524', 'ZKDD1600188EH', '4060595', '13', '21');
INSERT INTO `product` VALUES ('525', 'ZKDD1600059D0', '4060595', '13', '21');
INSERT INTO `product` VALUES ('526', 'ZKDD1600016SV', '4060595', '13', '21');
INSERT INTO `product` VALUES ('527', 'ZKDD1600056NI', '4060595', '13', '21');
INSERT INTO `product` VALUES ('528', 'ZKDD1600036YE', '4060595', '13', '21');
INSERT INTO `product` VALUES ('529', 'XBQE5029579Z9', '4007608', '13', '21');
INSERT INTO `product` VALUES ('530', 'XBQE5024809MD', '4007608', '13', '21');
INSERT INTO `product` VALUES ('531', 'XBQE5023125MH', '4007608', '13', '21');
INSERT INTO `product` VALUES ('532', 'XBQE5024801Y3', '4007608', '13', '21');
INSERT INTO `product` VALUES ('533', 'XBQE50231191E', '4007608', '13', '21');
INSERT INTO `product` VALUES ('534', 'XBQE5024802F6', '4007608', '13', '21');
INSERT INTO `product` VALUES ('535', 'XBQE5024803Q8', '4007608', '13', '21');
INSERT INTO `product` VALUES ('536', 'XBQE5024804QJ', '4007608', '13', '21');
INSERT INTO `product` VALUES ('537', 'XBQE5024810TG', '4007608', '13', '21');
INSERT INTO `product` VALUES ('538', 'XBQE5023113NP', '4007608', '13', '21');
INSERT INTO `product` VALUES ('539', 'XBQE5023120ZO', '4007608', '13', '21');
INSERT INTO `product` VALUES ('540', 'XBQE50231185S', '4007608', '13', '21');
INSERT INTO `product` VALUES ('541', 'XBQE50231109L', '4007608', '13', '21');
INSERT INTO `product` VALUES ('542', 'XBQE5023109E3', '4007608', '13', '21');
INSERT INTO `product` VALUES ('543', 'XBQE5023108S8', '4007608', '13', '21');
INSERT INTO `product` VALUES ('544', 'XBQE5023107J7', '4007608', '13', '21');
INSERT INTO `product` VALUES ('545', 'XBQE5024805XY', '4007608', '13', '21');
INSERT INTO `product` VALUES ('546', 'XBQE5029564XN', '4007608', '13', '21');
INSERT INTO `product` VALUES ('547', 'XBQE5023112ZT', '4007608', '13', '21');
INSERT INTO `product` VALUES ('548', 'XBQE5029572ED', '4007608', '13', '21');
INSERT INTO `product` VALUES ('549', 'XBQE50248290Y', '4007608', '13', '21');
INSERT INTO `product` VALUES ('550', 'XBQE50248288Q', '4007608', '13', '21');
INSERT INTO `product` VALUES ('551', 'XBQE50248162G', '4007608', '13', '21');
INSERT INTO `product` VALUES ('552', 'XBQE5029588PH', '4007608', '13', '21');
INSERT INTO `product` VALUES ('553', 'XBQE5029565C1', '4007608', '13', '21');
INSERT INTO `product` VALUES ('554', 'XBQE5029574TG', '4007608', '13', '21');
INSERT INTO `product` VALUES ('555', 'XBQE50231324O', '4007608', '13', '21');
INSERT INTO `product` VALUES ('556', 'XBQE50295556Q', '4007608', '13', '21');
INSERT INTO `product` VALUES ('557', 'XBQE50295737M', '4007608', '13', '21');
INSERT INTO `product` VALUES ('558', 'XBQE5029562EE', '4007608', '13', '21');
INSERT INTO `product` VALUES ('559', 'XBQE5029581XA', '4007608', '13', '21');
INSERT INTO `product` VALUES ('560', 'XBQE5029569KY', '4007608', '13', '21');
INSERT INTO `product` VALUES ('561', 'XBQE50295760K', '4007608', '13', '21');
INSERT INTO `product` VALUES ('562', 'XBQE50295778U', '4007608', '13', '21');
INSERT INTO `product` VALUES ('563', 'XBQE50248065U', '4007608', '13', '21');
INSERT INTO `product` VALUES ('564', 'XBQE5029584AT', '4007608', '13', '21');
INSERT INTO `product` VALUES ('565', 'XBQE5024822YX', '4007608', '13', '21');
INSERT INTO `product` VALUES ('566', 'XBQE5029589JS', '4007608', '13', '21');
INSERT INTO `product` VALUES ('567', 'XBQE5029578ZH', '4007608', '13', '21');
INSERT INTO `product` VALUES ('568', 'XBQE5023124K0', '4007608', '13', '21');
INSERT INTO `product` VALUES ('569', 'XBQE5024839VZ', '4007608', '13', '21');
INSERT INTO `product` VALUES ('570', 'XBQE5024836VH', '4007608', '13', '21');
INSERT INTO `product` VALUES ('571', 'XBQE5024826B2', '4007608', '13', '21');
INSERT INTO `product` VALUES ('572', 'XBQE5024847G7', '4007608', '13', '21');
INSERT INTO `product` VALUES ('573', 'XBQE5024842U7', '4007608', '13', '21');
INSERT INTO `product` VALUES ('574', 'XBQE5024832R9', '4007608', '13', '21');
INSERT INTO `product` VALUES ('575', 'XBQE5023106W9', '4007608', '13', '21');
INSERT INTO `product` VALUES ('576', 'XBQE50248481F', '4007608', '13', '21');
INSERT INTO `product` VALUES ('577', 'XBQE50231266N', '4007608', '13', '21');
INSERT INTO `product` VALUES ('578', 'XBQE5024838F2', '4007608', '13', '21');
INSERT INTO `product` VALUES ('579', 'XBQE50248302V', '4007608', '13', '21');
INSERT INTO `product` VALUES ('580', 'XBQE5024837N1', '4007608', '13', '21');
INSERT INTO `product` VALUES ('581', 'XBQE5023105TL', '4007608', '13', '21');
INSERT INTO `product` VALUES ('582', 'XBQE5023104M8', '4007608', '13', '21');
INSERT INTO `product` VALUES ('583', 'XBQE5023103FN', '4007608', '13', '21');
INSERT INTO `product` VALUES ('584', 'XBQE5023102TH', '4007608', '13', '21');
INSERT INTO `product` VALUES ('585', 'XBQE502310143', '4007608', '13', '21');
INSERT INTO `product` VALUES ('586', 'XBQE5024841TB', '4007608', '13', '21');
INSERT INTO `product` VALUES ('587', 'XBQE5047989ED', '4007608', '13', '21');
INSERT INTO `product` VALUES ('588', 'XBQE5024844VI', '4007608', '13', '21');
INSERT INTO `product` VALUES ('589', 'XBQE5023127XX', '4007608', '13', '21');
INSERT INTO `product` VALUES ('590', 'XBQE5023114BD', '4007608', '13', '21');
INSERT INTO `product` VALUES ('591', 'XBQE50248174T', '4007608', '13', '21');
INSERT INTO `product` VALUES ('592', 'XBQE50231113E', '4007608', '13', '21');
INSERT INTO `product` VALUES ('593', 'XBQE50231222W', '4007608', '13', '21');
INSERT INTO `product` VALUES ('594', 'XBQE5023121L2', '4007608', '13', '21');
INSERT INTO `product` VALUES ('595', 'XBQE5023134MW', '4007608', '13', '21');
INSERT INTO `product` VALUES ('596', 'XBQE5023123Z5', '4007608', '13', '21');
INSERT INTO `product` VALUES ('597', 'XBQE50231303T', '4007608', '13', '21');
INSERT INTO `product` VALUES ('598', 'XBQE5024833ZX', '4007608', '13', '21');
INSERT INTO `product` VALUES ('599', 'XBQE5023128VK', '4007608', '13', '21');
INSERT INTO `product` VALUES ('600', 'XBQE50248346I', '4007608', '13', '21');
INSERT INTO `product` VALUES ('601', 'XBQE50248495B', '4007608', '13', '21');
INSERT INTO `product` VALUES ('602', 'XBQE502313522', '4007608', '13', '21');
INSERT INTO `product` VALUES ('603', 'XBQE502311796', '4007608', '13', '21');
INSERT INTO `product` VALUES ('604', 'XBQE5024831JT', '4007608', '13', '21');
INSERT INTO `product` VALUES ('605', 'XBQE502311648', '4007608', '13', '21');
INSERT INTO `product` VALUES ('606', 'XBQE502311594', '4007608', '13', '21');
INSERT INTO `product` VALUES ('607', 'XBQE5024846AY', '4007608', '13', '21');
INSERT INTO `product` VALUES ('608', 'XBQE5024843RO', '4007608', '13', '21');
INSERT INTO `product` VALUES ('609', 'XBQE50231299E', '4007608', '13', '21');
INSERT INTO `product` VALUES ('610', 'XBQE50479955Y', '4007608', '13', '21');
INSERT INTO `product` VALUES ('611', 'XBQE504797701', '4007608', '13', '21');
INSERT INTO `product` VALUES ('612', 'XBQE5047971BP', '4007608', '13', '21');
INSERT INTO `product` VALUES ('613', 'XBQE5047974JU', '4007608', '13', '21');
INSERT INTO `product` VALUES ('614', 'XBQE50479861H', '4007608', '13', '21');
INSERT INTO `product` VALUES ('615', 'XBQE50479565A', '4007608', '13', '21');
INSERT INTO `product` VALUES ('616', 'XBQE50479573D', '4007608', '13', '21');
INSERT INTO `product` VALUES ('617', 'XBQE50479882X', '4007608', '13', '21');
INSERT INTO `product` VALUES ('618', 'XBQE5047987WY', '4007608', '13', '21');
INSERT INTO `product` VALUES ('619', 'XBQE50479811E', '4007608', '13', '21');
INSERT INTO `product` VALUES ('620', 'XBQE5047997XY', '4007608', '13', '21');
INSERT INTO `product` VALUES ('621', 'XBQE5024840UV', '4007608', '13', '21');
INSERT INTO `product` VALUES ('622', 'XBQE5047996Y9', '4007608', '13', '21');
INSERT INTO `product` VALUES ('623', 'XBQE5047980IV', '4007608', '13', '21');
INSERT INTO `product` VALUES ('624', 'XBQE504798424', '4007608', '13', '21');
INSERT INTO `product` VALUES ('625', 'XBQE5047951DZ', '4007608', '13', '21');
INSERT INTO `product` VALUES ('626', 'XBQE50295677F', '4007608', '13', '21');
INSERT INTO `product` VALUES ('627', 'XBQE5029561MI', '4007608', '13', '21');
INSERT INTO `product` VALUES ('628', 'XBQE50479706F', '4007608', '13', '21');
INSERT INTO `product` VALUES ('629', 'XBQE50479698G', '4007608', '13', '21');
INSERT INTO `product` VALUES ('630', 'XBQE5047968AI', '4007608', '13', '21');
INSERT INTO `product` VALUES ('631', 'XBQE5047967FB', '4007608', '13', '21');
INSERT INTO `product` VALUES ('632', 'XBQE5047966DA', '4007608', '13', '21');
INSERT INTO `product` VALUES ('633', 'XBQE5026743T6', '4007608', '13', '21');
INSERT INTO `product` VALUES ('634', 'XBQE5047994PR', '4007608', '13', '21');
INSERT INTO `product` VALUES ('635', 'XBQE5026718OM', '4007608', '13', '21');
INSERT INTO `product` VALUES ('636', 'XBQE5026742TU', '4007608', '13', '21');
INSERT INTO `product` VALUES ('637', 'XBQE50267505E', '4007608', '13', '21');
INSERT INTO `product` VALUES ('638', 'XBQE5026748ZI', '4007608', '13', '21');
INSERT INTO `product` VALUES ('639', 'XBQE5026746VL', '4007608', '13', '21');
INSERT INTO `product` VALUES ('640', 'XBQE5026747NB', '4007608', '13', '21');
INSERT INTO `product` VALUES ('641', 'XBQE5026721TY', '4007608', '13', '21');
INSERT INTO `product` VALUES ('642', 'XBQE5026711HJ', '4007608', '13', '21');
INSERT INTO `product` VALUES ('643', 'XBQE50267039E', '4007608', '13', '21');
INSERT INTO `product` VALUES ('644', 'XBQE50267132W', '4007608', '13', '21');
INSERT INTO `product` VALUES ('645', 'XBQE5026737VR', '4007608', '13', '21');
INSERT INTO `product` VALUES ('646', 'XBQE5047978QK', '4007608', '13', '21');
INSERT INTO `product` VALUES ('647', 'XBQE50267170Z', '4007608', '13', '21');
INSERT INTO `product` VALUES ('648', 'XBQE5047979V6', '4007608', '13', '21');
INSERT INTO `product` VALUES ('649', 'XBQE50267166P', '4007608', '13', '21');
INSERT INTO `product` VALUES ('650', 'XBQE5026719SK', '4007608', '13', '21');
INSERT INTO `product` VALUES ('651', 'XBQE5026720FF', '4007608', '13', '21');
INSERT INTO `product` VALUES ('652', 'XBQE5026727HM', '4007608', '13', '21');
INSERT INTO `product` VALUES ('653', 'XBQE50267282Q', '4007608', '13', '21');
INSERT INTO `product` VALUES ('654', 'XBQE50267297P', '4007608', '13', '21');
INSERT INTO `product` VALUES ('655', 'XBQE5026730GN', '4007608', '13', '21');
INSERT INTO `product` VALUES ('656', 'XBQE5026712QU', '4007608', '13', '21');
INSERT INTO `product` VALUES ('657', 'XBQE5047990US', '4007608', '13', '21');
INSERT INTO `product` VALUES ('658', 'XBQE50479910Q', '4007608', '13', '21');
INSERT INTO `product` VALUES ('659', 'XBQE5047952MY', '4007608', '13', '21');
INSERT INTO `product` VALUES ('660', 'XBQE5026715G5', '4007608', '13', '21');
INSERT INTO `product` VALUES ('661', 'XBQE504796548', '4007608', '13', '21');
INSERT INTO `product` VALUES ('662', 'XBQE5029554CI', '4007608', '13', '21');
INSERT INTO `product` VALUES ('663', 'XBQE5029563US', '4007608', '13', '21');
INSERT INTO `product` VALUES ('664', 'XBQE502957180', '4007608', '13', '21');
INSERT INTO `product` VALUES ('665', 'XBQE5029558YX', '4007608', '13', '21');
INSERT INTO `product` VALUES ('666', 'XBQE5047964DT', '4007608', '13', '21');
INSERT INTO `product` VALUES ('667', 'XBQE5047998XQ', '4007608', '13', '21');
INSERT INTO `product` VALUES ('668', 'XBQE502955352', '4007608', '13', '21');
INSERT INTO `product` VALUES ('669', 'XBQE502958569', '4007608', '13', '21');
INSERT INTO `product` VALUES ('670', 'XBQE5047999II', '4007608', '13', '21');
INSERT INTO `product` VALUES ('671', 'XBQE5047992RK', '4007608', '13', '21');
INSERT INTO `product` VALUES ('672', 'XBQE5047954G0', '4007608', '13', '21');
INSERT INTO `product` VALUES ('673', 'XBQE5047976RZ', '4007608', '13', '21');
INSERT INTO `product` VALUES ('674', 'XBQE5029552L1', '4007608', '13', '21');
INSERT INTO `product` VALUES ('675', 'XBQE50479632Z', '4007608', '13', '21');
INSERT INTO `product` VALUES ('676', 'XBQE5029583DW', '4007608', '13', '21');
INSERT INTO `product` VALUES ('677', 'XBQE50295956Q', '4007608', '13', '21');
INSERT INTO `product` VALUES ('678', 'XBQE5029591CV', '4007608', '13', '21');
INSERT INTO `product` VALUES ('679', 'XBQE5029593OK', '4007608', '13', '21');
INSERT INTO `product` VALUES ('680', 'XBQE5029596LP', '4007608', '13', '21');
INSERT INTO `product` VALUES ('681', 'XBQE5029597HU', '4007608', '13', '21');
INSERT INTO `product` VALUES ('682', 'XBQE5029580LW', '4007608', '13', '21');
INSERT INTO `product` VALUES ('683', 'XBQE5029598UC', '4007608', '13', '21');
INSERT INTO `product` VALUES ('684', 'XBQE50295908F', '4007608', '13', '21');
INSERT INTO `product` VALUES ('685', 'XBQE50479737O', '4007608', '13', '21');
INSERT INTO `product` VALUES ('686', 'XBQE5029592BG', '4007608', '13', '21');
INSERT INTO `product` VALUES ('687', 'XBQE5047982XA', '4007608', '13', '21');
INSERT INTO `product` VALUES ('688', 'XBQE50479556M', '4007608', '13', '21');
INSERT INTO `product` VALUES ('689', 'XBQE5047972JK', '4007608', '13', '21');
INSERT INTO `product` VALUES ('690', 'XBQE5047975JF', '4007608', '13', '21');
INSERT INTO `product` VALUES ('691', 'XBQE5047962YO', '4007608', '13', '21');
INSERT INTO `product` VALUES ('692', 'XBQE5047961X8', '4007608', '13', '21');
INSERT INTO `product` VALUES ('693', 'XBQE50479597Z', '4007608', '13', '21');
INSERT INTO `product` VALUES ('694', 'XBQE50479582F', '4007608', '13', '21');
INSERT INTO `product` VALUES ('695', 'XBQE5047953Z7', '4007608', '13', '21');
INSERT INTO `product` VALUES ('696', 'XBQE5029551S9', '4007608', '13', '21');
INSERT INTO `product` VALUES ('697', 'XBQE502956692', '4007608', '13', '21');
INSERT INTO `product` VALUES ('698', 'XBQE5029587ZE', '4007608', '13', '21');
INSERT INTO `product` VALUES ('699', 'XBQE502958275', '4007608', '13', '21');
INSERT INTO `product` VALUES ('700', 'XBQE5029599G0', '4007608', '13', '21');
INSERT INTO `product` VALUES ('701', 'XBQE5029586HY', '4007608', '13', '21');
INSERT INTO `product` VALUES ('702', 'XBQE502955691', '4007608', '13', '21');
INSERT INTO `product` VALUES ('703', 'XBQE5029557ON', '4007608', '13', '21');
INSERT INTO `product` VALUES ('704', 'XBQE5029568Y0', '4007608', '13', '21');
INSERT INTO `product` VALUES ('705', 'XBQE5029600P9', '4007608', '13', '21');
INSERT INTO `product` VALUES ('706', 'XBQE5047993KT', '4007608', '13', '21');
INSERT INTO `product` VALUES ('707', 'XBQE5029570UV', '4007608', '13', '21');
INSERT INTO `product` VALUES ('708', 'XBQE50479854O', '4007608', '13', '21');
INSERT INTO `product` VALUES ('709', 'XBQE5029560IC', '4007608', '13', '21');
INSERT INTO `product` VALUES ('710', 'XBQE504796068', '4007608', '13', '21');
INSERT INTO `product` VALUES ('711', 'XBQE50295945Z', '4007608', '13', '21');
INSERT INTO `product` VALUES ('712', 'XBQE5043025GM', '4007608', '13', '21');
INSERT INTO `product` VALUES ('713', 'XBQE50430020P', '4007608', '13', '21');
INSERT INTO `product` VALUES ('714', 'XBQE50430038O', '4007608', '13', '21');
INSERT INTO `product` VALUES ('715', 'XBQE50430059Y', '4007608', '13', '21');
INSERT INTO `product` VALUES ('716', 'XBQE5043004BC', '4007608', '13', '21');
INSERT INTO `product` VALUES ('717', 'XBQE5043029MK', '4007608', '13', '21');
INSERT INTO `product` VALUES ('718', 'XBQE5043001B4', '4007608', '13', '21');
INSERT INTO `product` VALUES ('719', 'XBQE50430190I', '4007608', '13', '21');
INSERT INTO `product` VALUES ('720', 'XBQE5043017I9', '4007608', '13', '21');
INSERT INTO `product` VALUES ('721', 'XBQE50430403L', '4007608', '13', '21');
INSERT INTO `product` VALUES ('722', 'XBQE5043014HP', '4007608', '13', '21');
INSERT INTO `product` VALUES ('723', 'XBQE504304969', '4007608', '13', '21');
INSERT INTO `product` VALUES ('724', 'XBQE5043024AQ', '4007608', '13', '21');
INSERT INTO `product` VALUES ('725', 'XBQE5043012Z3', '4007608', '13', '21');
INSERT INTO `product` VALUES ('726', 'XBQE5043023VF', '4007608', '13', '21');
INSERT INTO `product` VALUES ('727', 'XBQE5043026Q5', '4007608', '13', '21');
INSERT INTO `product` VALUES ('728', 'XBQE50430278D', '4007608', '13', '21');
INSERT INTO `product` VALUES ('729', 'XBQE504301050', '4007608', '13', '21');
INSERT INTO `product` VALUES ('730', 'XBQE504300682', '4007608', '13', '21');
INSERT INTO `product` VALUES ('731', 'XBQE5043007WA', '4007608', '13', '21');
INSERT INTO `product` VALUES ('732', 'XBQE5043016XX', '4007608', '13', '21');
INSERT INTO `product` VALUES ('733', 'XBQE5043028YJ', '4007608', '13', '21');
INSERT INTO `product` VALUES ('734', 'XBQE5043046MF', '4007608', '13', '21');
INSERT INTO `product` VALUES ('735', 'XBQE50430476C', '4007608', '13', '21');
INSERT INTO `product` VALUES ('736', 'XBQE5043048KH', '4007608', '13', '21');
INSERT INTO `product` VALUES ('737', 'XBQE5043015MO', '4007608', '13', '21');
INSERT INTO `product` VALUES ('738', 'XBQE5024820U9', '4007608', '13', '21');
INSERT INTO `product` VALUES ('739', 'XBQE5024835GZ', '4007608', '13', '21');
INSERT INTO `product` VALUES ('740', 'XBQE5024845YF', '4007608', '13', '21');
INSERT INTO `product` VALUES ('741', 'XBQE50248508Y', '4007608', '13', '21');
INSERT INTO `product` VALUES ('742', 'XBQE5024823UQ', '4007608', '13', '21');
INSERT INTO `product` VALUES ('743', 'XBQE504798392', '4007608', '13', '21');
INSERT INTO `product` VALUES ('744', 'XBQE5024824DT', '4007608', '13', '21');
INSERT INTO `product` VALUES ('745', 'XBQE50267403B', '4007608', '13', '21');
INSERT INTO `product` VALUES ('746', 'XBQE50248087Z', '4007608', '13', '21');
INSERT INTO `product` VALUES ('747', 'XBQE5023131BR', '4007608', '13', '21');
INSERT INTO `product` VALUES ('748', 'XBQE5024807PR', '4007608', '13', '21');
INSERT INTO `product` VALUES ('749', 'XBQE502314721', '4007608', '13', '21');
INSERT INTO `product` VALUES ('750', 'XBQE5043009R7', '4007608', '13', '21');
INSERT INTO `product` VALUES ('751', 'XBQE502481957', '4007608', '13', '21');
INSERT INTO `product` VALUES ('752', 'XBQE5043018JM', '4007608', '13', '21');
INSERT INTO `product` VALUES ('753', 'XBQE50248128Q', '4007608', '13', '21');
INSERT INTO `product` VALUES ('754', 'XBQE5024813QI', '4007608', '13', '21');
INSERT INTO `product` VALUES ('755', 'XBQE5024814R0', '4007608', '13', '21');
INSERT INTO `product` VALUES ('756', 'XBQE5024815IU', '4007608', '13', '21');
INSERT INTO `product` VALUES ('757', 'XBQE502481165', '4007608', '13', '21');
INSERT INTO `product` VALUES ('758', 'XBQE5024827TN', '4007608', '13', '21');
INSERT INTO `product` VALUES ('759', 'XBQE5024821LQ', '4007608', '13', '21');
INSERT INTO `product` VALUES ('760', 'XBQE5043013MN', '4007608', '13', '21');
INSERT INTO `product` VALUES ('761', 'XBQE50231494T', '4007608', '13', '21');
INSERT INTO `product` VALUES ('762', 'XBQE50430117R', '4007608', '13', '21');
INSERT INTO `product` VALUES ('763', 'XBQE502482507', '4007608', '13', '21');
INSERT INTO `product` VALUES ('764', 'XBQE5024818X0', '4007608', '13', '21');
INSERT INTO `product` VALUES ('765', 'XBQE5023141B6', '4007608', '13', '21');
INSERT INTO `product` VALUES ('766', 'XBQE5023150MY', '4007608', '13', '21');
INSERT INTO `product` VALUES ('767', 'XBQE50430080N', '4007608', '13', '21');
INSERT INTO `product` VALUES ('768', 'XBQE50267044K', '4007608', '13', '21');
INSERT INTO `product` VALUES ('769', 'XBQE5026705QN', '4007608', '13', '21');
INSERT INTO `product` VALUES ('770', 'XBQE50267068K', '4007608', '13', '21');
INSERT INTO `product` VALUES ('771', 'XBQE50267084W', '4007608', '13', '21');
INSERT INTO `product` VALUES ('772', 'XBQE5026707YH', '4007608', '13', '21');
INSERT INTO `product` VALUES ('773', 'XBQE502670918', '4007608', '13', '21');
INSERT INTO `product` VALUES ('774', 'XBQE5026710TV', '4007608', '13', '21');
INSERT INTO `product` VALUES ('775', 'XBQE5029404JG', '4007608', '13', '21');
INSERT INTO `product` VALUES ('776', 'XBQE5023146E9', '4007608', '13', '21');
INSERT INTO `product` VALUES ('777', 'XBQE5043021WX', '4007608', '13', '21');
INSERT INTO `product` VALUES ('778', 'XBQE5029559XJ', '4007608', '13', '21');
INSERT INTO `product` VALUES ('779', 'XBQE5026702SR', '4007608', '13', '21');
INSERT INTO `product` VALUES ('780', 'XBQE5023144UA', '4007608', '13', '21');
INSERT INTO `product` VALUES ('781', 'XBQE50231431G', '4007608', '13', '21');
INSERT INTO `product` VALUES ('782', 'XBQE50231332D', '4007608', '13', '21');
INSERT INTO `product` VALUES ('783', 'XBQE5023145KI', '4007608', '13', '21');
INSERT INTO `product` VALUES ('784', 'XBQE5023142HZ', '4007608', '13', '21');
INSERT INTO `product` VALUES ('785', 'XBQE5023136OA', '4007608', '13', '21');
INSERT INTO `product` VALUES ('786', 'XBQE5023137WU', '4007608', '13', '21');
INSERT INTO `product` VALUES ('787', 'XBQE5023138JG', '4007608', '13', '21');
INSERT INTO `product` VALUES ('788', 'XBQE5023139EV', '4007608', '13', '21');
INSERT INTO `product` VALUES ('789', 'XBQE5023148YF', '4007608', '13', '21');
INSERT INTO `product` VALUES ('790', 'XBQE5026714OB', '4007608', '13', '21');
INSERT INTO `product` VALUES ('791', 'XBQE5023140AO', '4007608', '13', '21');
INSERT INTO `product` VALUES ('792', 'XBQE50295758E', '4007608', '13', '21');
INSERT INTO `product` VALUES ('793', 'XBQE5043035N2', '4007608', '13', '21');
INSERT INTO `product` VALUES ('794', 'XBQE50430443J', '4007608', '13', '21');
INSERT INTO `product` VALUES ('795', 'XBQE5043045IC', '4007608', '13', '21');
INSERT INTO `product` VALUES ('796', 'XBQE504302037', '4007608', '13', '21');
INSERT INTO `product` VALUES ('797', 'XBQE5043022RX', '4007608', '13', '21');
INSERT INTO `product` VALUES ('798', 'XBQE5026739II', '4007608', '13', '21');
INSERT INTO `product` VALUES ('799', 'XBQE504303023', '4007608', '13', '21');
INSERT INTO `product` VALUES ('800', 'XBQE5043037UA', '4007608', '13', '21');
INSERT INTO `product` VALUES ('801', 'XBQE50267013X', '4007608', '13', '21');
INSERT INTO `product` VALUES ('802', 'XBQE5043036IS', '4007608', '13', '21');
INSERT INTO `product` VALUES ('803', 'XBQE5043043MN', '4007608', '13', '21');
INSERT INTO `product` VALUES ('804', 'XBQE50430345B', '4007608', '13', '21');
INSERT INTO `product` VALUES ('805', 'XBQE5043033BC', '4007608', '13', '21');
INSERT INTO `product` VALUES ('806', 'XBQE5043041IE', '4007608', '13', '21');
INSERT INTO `product` VALUES ('807', 'XBQE5043042B5', '4007608', '13', '21');
INSERT INTO `product` VALUES ('808', 'XBQE5043031AE', '4007608', '13', '21');
INSERT INTO `product` VALUES ('809', 'XBQE504303281', '4007608', '13', '21');
INSERT INTO `product` VALUES ('810', 'XBQE5043038QW', '4007608', '13', '21');
INSERT INTO `product` VALUES ('811', 'XBQE504303926', '4007608', '13', '21');
INSERT INTO `product` VALUES ('812', 'XBQE50430500S', '4007608', '13', '21');
INSERT INTO `product` VALUES ('813', '22VC3CS9201DD525', '963-01001-42 B', '13', '21');
INSERT INTO `product` VALUES ('814', '22VC3CS9201DD526', '963-01001-42 B', '13', '21');
INSERT INTO `product` VALUES ('815', '22VC3CS9201DD524', '963-01001-42 B', '13', '21');
INSERT INTO `product` VALUES ('816', '22VC3CS9201DD522', '963-01001-42 B', '13', '21');
INSERT INTO `product` VALUES ('817', '22VC3CS9201DD527', '963-01001-42 B', '13', '21');
INSERT INTO `product` VALUES ('818', '40AC3000087AS', '4505000', '13', '21');
INSERT INTO `product` VALUES ('819', '40AC3300553OK', '4505000', '13', '21');
INSERT INTO `product` VALUES ('820', '40AC3000108Z6', '4505000', '13', '21');
INSERT INTO `product` VALUES ('821', '40AC3000054J2', '4505000', '13', '21');
INSERT INTO `product` VALUES ('822', '40AC3000025YV', '4505000', '13', '21');
INSERT INTO `product` VALUES ('823', '40AC33005415M', '4505000', '13', '21');
INSERT INTO `product` VALUES ('824', '40AC12000213A', '4505000', '13', '21');
INSERT INTO `product` VALUES ('825', '40AC3000085KD', '4505000', '13', '21');
INSERT INTO `product` VALUES ('826', '40AC3000079I8', '4505000', '13', '21');
INSERT INTO `product` VALUES ('827', '40AC3300624A3', '4505000', '13', '21');
INSERT INTO `product` VALUES ('828', '40AC33006188B', '4505000', '13', '21');
INSERT INTO `product` VALUES ('829', '40AC3000027BW', '4505000', '13', '21');
INSERT INTO `product` VALUES ('830', '40AC3300487BZ', '4505000', '13', '21');
INSERT INTO `product` VALUES ('831', '40AC3000036DX', '4505000', '13', '21');
INSERT INTO `product` VALUES ('832', '40AC3000005B4', '4505000', '13', '21');
INSERT INTO `product` VALUES ('833', '40AC3000008DY', '4505000', '13', '21');
INSERT INTO `product` VALUES ('834', '40AC30001051F', '4505000', '13', '21');
INSERT INTO `product` VALUES ('835', '40AC3300526QF', '4505000', '13', '21');
INSERT INTO `product` VALUES ('836', '40AC3300423HM', '4505000', '13', '21');
INSERT INTO `product` VALUES ('837', '40AC3300350S3', '4505000', '13', '21');
INSERT INTO `product` VALUES ('838', '40AC3300331RJ', '4505000', '13', '21');
INSERT INTO `product` VALUES ('839', '40AC33005423U', '4505000', '13', '21');
INSERT INTO `product` VALUES ('840', '40AC3300156MY', '4505000', '13', '21');
INSERT INTO `product` VALUES ('841', '40AC33006361O', '4505000', '13', '21');
INSERT INTO `product` VALUES ('842', '40AC3300491YT', '4505000', '13', '21');
INSERT INTO `product` VALUES ('843', '40AC3300529UY', '4505000', '13', '21');
INSERT INTO `product` VALUES ('844', '40AC3000017H2', '4505000', '13', '21');
INSERT INTO `product` VALUES ('845', '40AC3300045F9', '4505000', '13', '21');
INSERT INTO `product` VALUES ('846', '40AC30000772D', '4505000', '13', '21');
INSERT INTO `product` VALUES ('847', '40AC3000058TH', '4505000', '13', '21');
INSERT INTO `product` VALUES ('848', '40AC3300475YV', '4505000', '13', '21');
INSERT INTO `product` VALUES ('849', '40AC330042174', '4505000', '13', '21');
INSERT INTO `product` VALUES ('850', '40AC3300540L6', '4505000', '13', '21');
INSERT INTO `product` VALUES ('851', '40AC33005671F', '4505000', '13', '21');
INSERT INTO `product` VALUES ('852', '40AC3000028GK', '4505000', '13', '21');
INSERT INTO `product` VALUES ('853', '40AC3300240G0', '4505000', '13', '21');
INSERT INTO `product` VALUES ('854', '40AC33002530X', '4505000', '13', '21');
INSERT INTO `product` VALUES ('855', '40AC120037502', '4505000', '13', '21');
INSERT INTO `product` VALUES ('856', '40AC3300051XR', '4505000', '13', '21');
INSERT INTO `product` VALUES ('857', '40AC33005727D', '4505000', '13', '21');
INSERT INTO `product` VALUES ('858', '40AC3300270DR', '4505000', '13', '21');
INSERT INTO `product` VALUES ('859', '40AC3300627PE', '4505000', '13', '21');
INSERT INTO `product` VALUES ('860', '40AC3300587OC', '4505000', '13', '21');
INSERT INTO `product` VALUES ('861', '40AC3300646E5', '4505000', '13', '21');
INSERT INTO `product` VALUES ('862', '40AC3300037WK', '4505000', '13', '21');
INSERT INTO `product` VALUES ('863', '40AC3300335J5', '4505000', '13', '21');
INSERT INTO `product` VALUES ('864', '40AC3000061RM', '4505000', '13', '21');
INSERT INTO `product` VALUES ('865', '40AC3300406RQ', '4505000', '13', '21');
INSERT INTO `product` VALUES ('866', '40AC3000033HV', '4505000', '13', '21');
INSERT INTO `product` VALUES ('867', '40AC3300550BN', '4505000', '13', '21');
INSERT INTO `product` VALUES ('868', '40AC3300555W2', '4505000', '13', '21');
INSERT INTO `product` VALUES ('869', '40AC3000106RE', '4505000', '13', '21');
INSERT INTO `product` VALUES ('870', '40AC3000095XC', '4505000', '13', '21');
INSERT INTO `product` VALUES ('871', '40AC33001054W', '4505000', '13', '21');
INSERT INTO `product` VALUES ('872', '40AC3300551IZ', '4505000', '13', '21');
INSERT INTO `product` VALUES ('873', '40AC3300337KY', '4505000', '13', '21');
INSERT INTO `product` VALUES ('874', '40AC330060568', '4505000', '13', '21');
INSERT INTO `product` VALUES ('875', '40AC330060322', '4505000', '13', '21');
INSERT INTO `product` VALUES ('876', '40AC33006047Z', '4505000', '13', '21');
INSERT INTO `product` VALUES ('877', '40AC3000088Q4', '4505000', '13', '21');
INSERT INTO `product` VALUES ('878', '40AC33001589O', '4505000', '13', '21');
INSERT INTO `product` VALUES ('879', '40AC300005686', '4505000', '13', '21');
INSERT INTO `product` VALUES ('880', '40AC3300500DV', '4505000', '13', '21');
INSERT INTO `product` VALUES ('881', '40AC3300424PG', '4505000', '13', '21');

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
INSERT INTO `provider` VALUES ('1', '10123654478', 'PRODUPELMA S.A', 'AV COLÓN Y PARRA', '2621561', null, null, null);
INSERT INTO `provider` VALUES ('2', '1745632147', 'FERRETERIA MARISCAL S.A.', 'AV GONZALO PARRA S44-60 Y GARAICOA', '2456789', null, null, null);

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
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_bill` AS select count(0) AS `total`,`model`.`id` AS `id`,`model`.`description` AS `description`,`product`.`bill` AS `bill` from (`product` join `model` on((`product`.`variant` = `model`.`id`))) group by `product`.`variant`,`product`.`bill` ;

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
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_model` AS select `model`.`id` AS `id`,`model`.`description` AS `description`,`unit`.`description` AS `unit`,`category`.`name` AS `category`,`brand`.`name` AS `brand` from (((`model` join `unit` on((`model`.`unit` = `unit`.`id`))) join `category` on((`model`.`category` = `category`.`id`))) join `brand` on((`model`.`brand` = `brand`.`id`))) ;

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

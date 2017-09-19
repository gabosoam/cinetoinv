/*
Navicat MariaDB Data Transfer

Source Server         : mariadblocal
Source Server Version : 100208
Source Host           : localhost:3306
Source Database       : inventory

Target Server Type    : MariaDB
Target Server Version : 100208
File Encoding         : 65001

Date: 2017-09-19 14:32:14
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
  UNIQUE KEY `ukreference` (`provider`,`reference`),
  KEY `providerbill` (`provider`),
  CONSTRAINT `providerbill` FOREIGN KEY (`provider`) REFERENCES `provider` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES ('39', '1', '1', '2017-09-18', '025');

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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('24', 'ADSL');
INSERT INTO `category` VALUES ('32', 'AUDCONF');
INSERT INTO `category` VALUES ('13', 'CISCO');
INSERT INTO `category` VALUES ('14', 'CLIRSEN');
INSERT INTO `category` VALUES ('29', 'CSN');
INSERT INTO `category` VALUES ('22', 'DAM');
INSERT INTO `category` VALUES ('19', 'ENE');
INSERT INTO `category` VALUES ('34', 'ENER');
INSERT INTO `category` VALUES ('17', 'ETIQ');
INSERT INTO `category` VALUES ('38', 'FLUKE');
INSERT INTO `category` VALUES ('25', 'HEADSET');
INSERT INTO `category` VALUES ('16', 'HERR');
INSERT INTO `category` VALUES ('27', 'IN');
INSERT INTO `category` VALUES ('12', 'INTELBRAS');
INSERT INTO `category` VALUES ('30', 'LNR');
INSERT INTO `category` VALUES ('9', 'MATRIX');
INSERT INTO `category` VALUES ('33', 'METCAL');
INSERT INTO `category` VALUES ('37', 'OCB');
INSERT INTO `category` VALUES ('3', 'OTR');
INSERT INTO `category` VALUES ('1', 'OTRO');
INSERT INTO `category` VALUES ('10', 'PACE');
INSERT INTO `category` VALUES ('21', 'PEPST');
INSERT INTO `category` VALUES ('31', 'POE');
INSERT INTO `category` VALUES ('5', 'PORT-IP');
INSERT INTO `category` VALUES ('4', 'REPST');
INSERT INTO `category` VALUES ('20', 'RESPT');
INSERT INTO `category` VALUES ('2', 'SDH');
INSERT INTO `category` VALUES ('18', 'SWITCH');
INSERT INTO `category` VALUES ('23', 'TELEFONO');
INSERT INTO `category` VALUES ('35', 'TRA');
INSERT INTO `category` VALUES ('11', 'VOIP');
INSERT INTO `category` VALUES ('36', 'VOZ');
INSERT INTO `category` VALUES ('15', 'WI-FI');

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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('14', '1452145875', 'Gabriel Salazar', 'Quito Sur', '2621561', 'gabrielsalazar@outlook.com');
INSERT INTO `client` VALUES ('41', '1452145874', 'JESSICA ESPAÑA', 'LA CORUÑA', '2456123', 'jespaña@gmail.com');
INSERT INTO `client` VALUES ('42', '1723713554', 'gABRIEKL\'', 'WQS', 'QW', 'QW');

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
INSERT INTO `location` VALUES ('14', 'Bodega 2', 'descripcion');

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
  UNIQUE KEY `ukcode` (`code`),
  KEY `unit` (`unit`),
  KEY `brand` (`brand`),
  KEY `category` (`category`),
  CONSTRAINT `brand` FOREIGN KEY (`brand`) REFERENCES `brand` (`id`),
  CONSTRAINT `category` FOREIGN KEY (`category`) REFERENCES `category` (`id`),
  CONSTRAINT `unit` FOREIGN KEY (`unit`) REFERENCES `unit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=506 DEFAULT CHARSET=latin1;

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
INSERT INTO `model` VALUES ('42', '0.33UF 120V', 'CONDENSADOR 0.33UF 120V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('43', '0606328', 'Terminal VF 2 - 4 16-14 AWG OJO 5.3MM AZUL', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('44', '0606339', 'Terminal VF 5.5 - 5 12-10 AWG OJO 5.3MM AMARILLO', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('45', '0606341', 'Terminal VF 5.5 - 8 12-10 AWG OJO 8.4MM AMARILLO', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('46', '1-0233400-0', 'PATCH CORD FIBRA SC/SC', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('47', '1000UF 100V', 'CONDENSADOR 1000UF 100V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('48', '1000UF 10V', 'CONDENSADOR 1000UF 10V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('49', '1000UF 15V', 'CONDENSADOR 1000UF 15V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('50', '1000UF 25V', 'CONDENSADOR 1000UF 25V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('51', '1000UF 40V', 'CONDENSADOR 1000UF 40V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('52', '10038769', 'GUIA DE ONDA TWISTFLEX TF084-BW1 1,2m', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('53', '100UF 16V', 'CONDENSADOR 100UF16V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('54', '100UF 200V', 'CONDENSADOR 100UF 200V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('55', '100UF 25V', 'CONDENSADOR 100UF 25V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('56', '100UF 35V', 'CONDENSADOR 100UF 35V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('57', '100UF 40V', 'CONDENSADOR 100UF 40V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('58', '100UF 50V', 'CONDENSADOR 100UF 50V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('59', '100UF 6,3V', 'CONDENSADOR 100UF 6,3V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('60', '100UF 63V', 'CONDENSADOR 100UF 63V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('61', '10NF 630V', 'CONDENSADOR 10NF 630V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('62', '10UF 100V', 'CONDENSADOR 10UF 100V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('63', '10UF 16V', 'CONDENSADOR 10UF 16V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('64', '10UF 200V', 'CONDENSADOR 10UF 200V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('65', '10UF 250V', 'CONDENSADOR 10UF 250V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('66', '10UF 25V', 'CONDENSADOR 10UF 25V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('67', '10UF 35V', 'CONDENSADOR 10UF 35V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('68', '10UF 40V', 'CONDENSADOR 10UF 40V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('69', '10UF 50V', 'CONDENSADOR 10UF 50 V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('70', '10UF 63V', 'CONDENSADOR 10UF 63V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('71', '1100-0232', 'ASSY, TOOL, CLEANING, FIBER', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('72', '1100-0233', 'ASSY, TOOL, CLEANING, SPONGE', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('73', '1121-0624-P5', 'DRIVE TIP PKG .040 THERMO', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('74', '1121-0625-P5', 'DRIVE TIP PKG .030 THERMO', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('75', '1121-0626-P5', 'DRIVE TIP PKG .060 THERMO', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('76', '1121-0627-P5', 'DRIVE TIP PKG .090 THERMO', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('77', '1124-0007-P1', 'CHISEL PACE .063 90 DEG', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('78', '1124-0010-P1', 'CHISEL PACE .203', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('79', '1124-0013-P1', 'CHISEL PACE .094 30 DEG', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('80', '1124-0016-P1', 'CHISEL PACE .047 BENT', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('81', '1124-0023-P1', 'CHISEL PACE .125 90 DEG', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('84', '1124-0034-P1', 'SIDED PACE .25 SINGLE', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('85', '120UF 100V', 'CONDENSADOR 120UF 100V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('86', '121559102A', 'TRANSFORMADOR DE TIMBRE ILA', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('87', '1265-0011', 'GLASS CHAMBER', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('88', '130-195', '3M 746CERT 746 Tester with Certificate of Calibrat', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('89', '1309-0054', 'FLUX SODR TRAP', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('90', '1415-PRUEBA', 'PRUEBA 2', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('91', '14UH', 'BOBINAS AZO238', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('92', '15000UF-63V', 'CONDENSADOR 15000UF-63V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('93', '1500UF 10V', 'CONDENSADOR 1500UF 10V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('94', '15UF 16V', 'CONDENSADOR 15UF 16V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('95', '16-6', 'TERMINAL T 16-6 6AWG 1/4\"', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('96', '16-8', 'TERMINAL T 16-8 6AWG 5/16\"', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('97', '1730502068', 'SWITCH TP-LINK 8P 10-100 Mbps', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('98', '19C1693', 'CONECTOR CHASSIS BNC 50 OHM', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('99', '1AB079840007', 'PATCH CORD FC/SPC-FC/SPC 5 METROS', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('100', '1AB079840016', 'PATCH CORD FC-FC 29M', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('101', '1AB1747700033', 'FILTRO ADSL', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('102', '1AF00089AAAA04', 'MODEM V32 BIS 1144MD', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('103', '1AF00398AAAA', 'TELEFONO CANAL DE SERVICIO', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('104', '1AFO1226ADAA', 'CLASS 2 POWER  SUPPLY 9V/1A DC', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('105', '1UF 200V', 'CONDENSADOR 1UF 200V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('106', '2,2UF 63V', 'CONDENSADOR 2,2UF 63V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('107', '2.2UF 250V', 'CONDENSADOR 2.2UF 250V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('108', '2.2UF-900V', 'CONDENSADOR 2.2UF-900V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('109', '20UF 40V', 'CONDENSADOR 20UF 40V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('110', '22-18', 'TERMINAL DE OJO 22-18AWG DIAMETRO 5.3 MM (3/16\")', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('111', '2200-050P', 'CONECTOR DB50', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('112', '2200UF 100V', 'CONDENSADOR 2200UF 100V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('113', '2200UF 16V', 'CONDENSADOR 2200UF 16V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('114', '2200UF 25V', 'CONDENSADOR 2200UF 25V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('115', '2200UF 50V', '2200UF 50V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('116', '2201-67810-160', 'SOUNDSTATION 2W B', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('117', '2201-67880-160', 'SOUNDSTATION 2W E', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('118', '220NF 1000V', 'CONDENSADOR 220NF 1000V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('119', '220UF 100V', 'CONDENSADOR 220UF 100V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('120', '220UF 10V', 'CONDENSADOR 220UF 10V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('121', '220UF 16V', 'CONDENSADOR 220UF 16V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('122', '220UF 25V', 'CONDENSADOR 220UF 25V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('123', '220UF 35V', 'CONDENSADOR 220UF 35V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('124', '220UF 50V', 'CONDENSADOR 220UF 50V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('125', '220UF 63V', 'CONDENSADOR 220UF 63V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('126', '2299121', 'CONECTOR WINCHESTER', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('127', '22UF 100V', 'CONDENSADOR 22UF 100V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('128', '22UF 160V', 'CONDENSADOR 22UF 160V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('129', '22UF 35V', 'CONDENSADOR 22UF 35V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('130', '22UF 63V', 'CONDENSADOR 22UF 63V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('131', '22UF-16V', 'CONDENSADORES 22UF-16V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('132', '22UH/3A', 'BOBINAS', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('133', '2504548T01', 'ADAPTADOR DE BATERIA MOTOROLA PRO5150', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('134', '256550', 'CHECK FOR UTP.STP.COAXIAL', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('135', '271001', 'MEMORIA 271001', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('136', '27128', 'MEMORIA 27128', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('137', '27256', 'MEMORIA 27256', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('138', '27512', 'MEMORIA 27512', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('139', '2N3251', 'TRANSISTOR 2N3251', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('140', '2N3439', 'TRANSISTOR 2N3439', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('141', '2N3440', 'TRANSISTOR 2N3440', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('142', '2N5415', 'TRANSISTOR 2N5415', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('143', '2N5416', 'TRANSISTOR 2N5416', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('144', '3,3UF 250V', 'CONDENSADOR 3,3UF 250V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('145', '30\'42709\'01', 'MODEL SA100-3430', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('146', '3300UF 12V', 'CONDENSADOR 3300UF 12V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('147', '3300UF 35V', 'CONDENSADOR 3300UF 35V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('148', '330UF 10V', 'CONDENSADOR 330UF 10V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('149', '330UF 16V', 'CONDENSADOR 330UF 16V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('150', '330UF 25V', 'CONDENSADOR 330UF 25V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('151', '33461', 'TERMINAL DE OJO AMP 8 1/4\"', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('152', '33UF 100V', 'CONDENSADOR 33UF 100V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('153', '33UF 16V', 'CONDENSADOR 33UF 16V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('154', '33UF 250V', 'CONDENSADOR 33UF 250V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('155', '3480405000000010549711', 'CONN BACKSHELL DB15', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('156', '3499', 'BOBINA UTP CAT 5E AZUL', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('157', '376', 'True-rms AC/DC Clamp Meter', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('158', '37602837', 'PCM 1560 PG H CO-16 II', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('159', '37606387', 'PCM 1564 PG MM D-BOX', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('160', '3872C782', 'PC COMPAQ (OMPC)', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('161', '3AF00888AEAA', 'PATCH CORD FC-FC', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('164', '3AF00888AFAA', 'PATCH CORD FC-FC', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('165', '3HE00028CA 01', 'SFP TRANSCEIVER', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('166', '4,7NF 1000V', 'CONDENSADOR 4,7NF 1000V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('167', '4,7UF 100V', 'CONDENSADOR 4,7UF 100V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('168', '4,7UF 16V', 'CONDENSADOR 4,7UF 16V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('169', '4,7UF 25V', 'CONDENSADOR 4,7UF 25V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('170', '4,7UF 40V', 'CONDENSADOR 4,7UF 40V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('171', '4,7UF 63V', 'CONDENSADOR 4,7UF 63V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('174', '40Uf/2A', 'BOBINAS', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('176', '4116R', 'INTEGRADO 4116R', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('178', '4320083', 'PABX DIGITAL IMPACTA 16 ESP 2X4', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('182', '4501015', 'PORTERO XPE 1013 PLUS', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('187', '4520010', 'VIDEO PORTERO IV7000 LCD BLANCO-HANDS FREE', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('188', '4520800', 'EXTENCION DE AUDIO PARA VIDEO PORTERO IV 7000 EA', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('192', '4580017', 'NVD 3000-P', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('194', '4700007', 'TELEFONO IP-TIP 100 CON POE', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('195', '4700UF 16V', 'CONDENSADOR 4700UF 16V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('196', '470UF 10V', 'CONDENSADOR 470UF 10V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('197', '470UF 12V', 'CONDENSADOR 470UF 12V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('198', '470UF 16V', 'CONDENSADOR 470UF 16V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('199', '470UF 20V', 'CONDENSADOR 470UF 20 V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('200', '470UF 40V', 'CONDENSADOR 470UF 40V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('201', '470UF 63V', 'CONDENSADOR 470UF 63V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('202', '470UF-400V', 'CONDENSADOR 470UF-400V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('204', '47725', 'PATCH CORD OPT.8M 2XFC/SPC.MONOM', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('205', '47UF 100V', 'CONDENSADOR 47UF 100V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('206', '47UF 16V', 'CONDENSADOR 47UF 16V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('207', '47UF 25V', 'CONDENSADOR 47UF 25V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('208', '47UF 40V', 'CONDENSADOR 47UF 40V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('209', '47UF 63V', 'CONDENSADOR 47UF 63V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('210', '48F2772', 'CONECTOR CHASSIS TWINAX/TRIAX RCPT', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('211', '492014-3', 'PATCH CORD FC/FC 2.95M', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('212', '492014-4', 'PIGTAIL C/A SM FC(NG)/FC(NG) 5M', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('213', '492014-9', 'PIGTAIL FC/FC 6.92M', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('216', '5617NMA1', 'PATCH CORD MONOMODO DUPLEX FC-ST 3M', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('217', '56UH/1.5A', 'BOBINAS', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('218', '5K', 'RESISTENCIAS DE PRESICION', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('219', '6,8UF 100V', 'CONDENSADOR 6,8UF 100V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('220', '6,8UF 25V', 'CONDENSADOR 6,8UF 25V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('221', '6018-0097', 'KIT, ANGLE BRACKET', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('222', '6019-0079', 'TD-100 TIP & TOOL STAND', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('223', '6019-0082', 'SX TIP & TOOL STAND', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('224', '6092110201', 'CABEZAL KRONE 100 PARES', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('225', '662774019680', 'USB VGA KVM CONSOLE EXTENDER OVER CAT5', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('226', '680UF 25V', 'CONDENSADOR 680UF 25V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('227', '680UF 6,3V', 'CONDENSADOR 680UF 6,3V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('228', '680UF 63V', 'CONDENSADOR 680UF 63V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('229', '680UF-385V', 'CONDENSADOR 680UF-385V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('230', '68UF 16V', 'CONDENSADOR 68UF 16V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('231', '68UF 6,3V', 'CONDENSADOR 68UF 6,3V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('232', '68UF 63V', 'CONDENSADOR 68UF 63V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('233', '6993-0136', 'KIT, CABLE, MARKER, C-TYPE', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('234', '6993-0263', 'TD-100 KIT, INTELL, HEAT', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('235', '6993-0266', 'SX-90 KIT, INTELL, HEAT', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('236', '7008-0287-01', 'MBT-301 PACE STATION', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('237', '72913-01', 'PLANTRONICS SPARE, EAR TIP KIT', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('238', '74\'12358\'02 B0', 'ENRUTADOR VPN MULTIFUNCION', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('239', '74259', 'INTEGRADO 74259', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('240', '74574', 'INTEGRADO 74574', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('241', '746320011370', 'CAB - V35MT=', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('242', '74HC00', 'INTEGRADO 74HC00', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('243', '74HC161', 'INTEGRADO 74HC161', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('244', '74HC4316', 'INTEGRADO 74HC4316', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('245', '74HC74', 'INTEGRADO 74HC74', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('246', '75C188', 'INTEGRADO 75C188', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('247', '75C189AN', 'INTEGRADO 75C189AN', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('248', '7805', 'TRANSISTOR 7805CV', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('249', '7808', 'TRANSISTOR L7808CV', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('250', '7896637614702', 'TELEFONO ALAMBRICO ANALOGICO INTELBRAS', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('253', '7896637645928', 'TELEFONO VOIP TS60 IPR', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('254', '7896637658058', 'CENTRAL IP DECT T60 IP', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('255', '7896637658102', 'TELEFONO SEM FIO T60 IP', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('256', '7906', 'TRANSISTOR 7906CT', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('257', '7912', 'TRANSISTOR L7912CV', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('258', '800-001-0316', 'POWER OVER ETHERNET KITS', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('259', '81083-01', 'SPARE HEADSET CT14', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('260', '81086-01', 'PLANTRONICS SPARE, CLIP BELT CT14', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('261', '81087-01', 'SPARE BATTERY PACK CT14', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('262', '83648-03', 'PLANTRONICS POWER SUPPLY 9VDC 500 mA', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('263', '84693-11', 'PLANTRONICS CS540/HL10', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('264', '8904133002516', 'PPM4', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('265', '8904133003056', 'TELEFONO EON48S BLACK', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('266', '8904133003070', 'TELEFONO EON48P BLACK', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('267', '8904133003896', 'Matrix GSM Fixed Cellular Terminal', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('268', '8904133004152', 'ETERNITY PE CARD VMS16', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('269', '8904133004183', 'ETERNITY PE CARD CO4+SLT4', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('270', '8904133004244', 'ETERNITY PE6SP US', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('271', '8904133004602', 'ETERNITY PE CARD GSM2', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('272', '8904133004664', 'ETERNITY PE CARD VOIP16', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('273', '8904133006705', 'ETERNITY NE6 US', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('274', '8904133011365', 'NAVAN CNX226 2G2 US', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('275', '8904133013611', 'SATATYA CIBR13FL40CW & ACCESORIES', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('276', '8904133013628', 'SATATYA CIDR13FL40CW & ACCESORIES', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('277', '8904133013987', 'SATATYA NVR8S IN', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('278', '8904133014373', 'COSEC COMBO FAX US', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('279', '8VFO', 'PATCH CORD FC/PC-FC/PC 1550nm PIRELLI 20 METROS', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('280', '9/125', 'PATCH CORD FC/PC-FC/PC DUPLEX 3METROS', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('281', '9137430E', 'HELIOS CARD READER', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('282', '962-00010-02 B', 'IP TELEPHONE GRANDSTREAM GXP-1200 ENTRY LEVEL', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('284', '966-00004-13B', 'GATEWAY 4 FXS PORT GRAND STREAM VOIP ANALOG (4004)', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('285', '966-00008-02C', 'GW 24 FXS PORT GRANDSTREAM VOIP ANALOG (GXW4024)', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('286', '967-00009-04', 'IP CAMERA GRANDSTREAM', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('287', '967-00052-10A002', 'CÁMARA GRANDSTREAM GXV3610_FHD', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('288', '97B2386', 'CONECTOR RF/COAXIAL, BNC PLUG, STR, 50 ohm, CRIMP', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('289', '97K8839', 'BOBINA DE CABLE RG58CU (50 Mts)', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('290', '98301747.7', 'PATCH CORD FC-FC', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('291', '9UF 125V', 'CONDENSADOR 9UF 125V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('292', '9UF 20V', 'CONDENSADOR 9UF 20 V', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('293', 'AA-091A', 'OEM AC ADAPTOR', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('294', 'AAA1820028B05', 'CPU-30BE/16', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('295', 'AAA1820062AA02', '1 GB SEAGATE HARD DISK', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('296', 'ADU120150', 'AC/AC PLUG IN TRANSFORMER', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('297', 'AG-188N', 'ATA ONE LINE FXs', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('298', 'AM7910PC', 'INTEGRADO AM7910PC', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('299', 'APOE02-WM', 'PASSIVE POWER OVER ETHERNET', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('300', 'AT28HC256', 'INTEGRADO AT28HC256', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('301', 'AT29C040A', 'INTEGRADO AT29C040A', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('302', 'ATLSP-02598-AAAA', 'TRANSFORMADOR 220VAC-5VDC', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('303', 'ATLSP04119AAAA', 'MOCHILA ADAPTADORA', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('304', 'AURICULAR', 'AURICULAR PUEST', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('305', 'B00MYNX0ZI', 'BRUSHLESS DC FAN 12V 0.08A', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('306', 'BC287', 'TRNASISTOR BC287', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('307', 'BD201', 'TRANSISTOR BD201', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('308', 'BOBINAS IEC IER', 'BOBINAS DE ACOPLAMIENTO', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('309', 'C01', 'C01 CALL CENTER PHONE', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('310', 'C10', 'EXPANSIÓN MODULE', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('311', 'C2007B', 'PASSIVE PoE KIT BLACK', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('312', 'C56HP', 'C56HP PHONE', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('313', 'C56P', 'C56P PHONE', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('314', 'C58P', 'FANVIL IP PHONE', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('315', 'C62P', 'FANVIL IP PHONE C62P', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('316', 'C66P', 'C66IP PHONE', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('317', 'C88E000208', 'TAPAS CONECTOR DB50', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('318', 'CABLE M26X', 'CABLE FXS M26X', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('319', 'CAMSX', 'CAMARA PORTEROS SURIX', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('320', 'CASCOS', 'CASCOS PARA INSTALACIONES', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('321', 'CC364A', 'LASERJET', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('322', 'CCR2-5/16', 'TERMINAL DE DOBLE OJO 2 AWG -5/16', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('323', 'CDV-3VM800', 'IP CAMERA POE 2M 1080P HD VANDAL DOME CMOS FINE', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('324', 'CHALECOS', 'CHALECOS REFLECTORES', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('325', 'COD-PRUEBA12', 'NOMBRE_PRUEBA', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('326', 'CODEJEMPLO', 'EJEMPLO', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('327', 'codigo-prueba2', 'MODELO PRUEBA2', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('328', 'CODIGOPRUEBA', 'SADASD', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('329', 'CODIGOPRUEBA2', 'PRUEBA2', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('330', 'CODIGOPRUEBA4', 'PRUEBA3', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('331', 'CODIGOPRUEBA5', 'MODELOPRUEBA', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('332', 'CT14', 'CT14 CORDLESS HEADSET PHONE', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('333', 'D43256BCZ', 'INTEGRADO D43256BCZ', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('334', 'D800', 'FANVIL VIDEO IP PHONE', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('335', 'D900', 'FANVIL VIDEO PHONE', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('336', 'DT1E8', 'PATCHCORD FIBRA OPTICA', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('337', 'DXN5011S', 'CAJA DEXSON TOMA/MULTIPLE INSTALACION', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('338', 'E209234', 'CABLE FIBRA OPTICA', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('339', 'EF7910JLD', 'INTEGRADO EF7910JLD', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('340', 'EPD-5818', 'POE EPD-5818 ENGENIUS', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('341', 'F52054-000', 'PATCH CORD LC-FC 3M ( TYCO Electronic )', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('342', 'GPSU15B-8', 'SWITCHING POWER SPPLY', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('343', 'HD63C09EP', 'INTEGRADO HD63C09EP', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('344', 'HOLA2', 'ASASDS', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('345', 'hola3', '212', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('346', 'HOLASOCKET', 'HOLASOCKET', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('347', 'HSB 50', 'Telefone Headset ( con diadema-un auricular )', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('348', 'IDWHOM1P', 'WALLPLUG ENCLOSURE FOR OM1P', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('349', 'IES1008AA', '10/100 Fast Ethernet Switch', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('350', 'IL03DBRL50DBSCST', 'PATCH CORD FIBRA SC-ST DUPLEX SINGLE-MODE', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('351', 'IP GATEWAY', 'ATA', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('352', 'IP-AX-M', 'SURIX 1 BOTON EMBUTIR', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('353', 'IP-AX-T', 'SURIX 1 BOTON EXTERIOR', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('354', 'IP-AXTT-M', 'SURIX C/TECLADO EMBUTIR', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('355', 'IP-AXTT-T', 'SURIX EXTERIOR C/TECLADO', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('356', 'IP-Ti-T', 'SURIX TITANIUM 1 BOTON', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('357', 'IPAX1', 'PULSADORES DIRECTOS SURIX', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('358', 'K14', 'BIOMETRICO ZKTECO', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('359', 'K9852RF', 'TECLADO MOUSE INALAMBRICO', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('360', 'KCS10', 'CABEZAL BELCONN', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('361', 'KCS10N', 'REGLETA BELCONN', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('362', 'KX-TS500LXB', 'TELEFONO ANALOGICO PANASONIC', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('363', 'KXTY', 'TELEFONO PANAPHONE', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('364', 'LL/M', 'LLAVEROS MAGNETICOS', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('365', 'LM333', 'TRANSISTOR LM333T', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('366', 'LR79574', 'CHASE RESEARCH', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('367', 'M-545', 'MOLDE PARA SOLDE', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('368', 'M21-500-499-TB', 'CINTA BRADY', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('369', 'M21-750-499', 'CINTA BRADY', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('370', 'M32', 'CRIMPING TOOL FOR F/BNC/RCA', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('371', 'M5M5256', 'INTEGRADO M5M5256', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('372', 'MC14002BCLD', 'INTEGRADO MC14002BCLD', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('373', 'MC1489P', 'INTEGRADO MC1489P', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('374', 'MC54HC273AJ', 'INTEGRADO MC54HC273AJ', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('375', 'MC68901P', 'INTEGRADO MC68901P', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('376', 'MD12W', 'RF-ID READER WIEGAND', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('377', 'MHC3000', 'UPS FIRMESA 3000', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('378', 'MP-5609-60', 'CABLE TWINAX / TRIAX MACHO - TWINAX/ TRIAX  MACHO', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('379', 'MQ01ABD100', 'DISK DRIVE TOSHIBA 1TB', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('380', 'MR500', 'MR500 DUAL BAND 802.11N MESH ROUTER', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('381', 'MRD-308DS', 'TELEPHONE HEADSET - DOS AURICULARES MAS MICROFONO', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('382', 'MRD-308S', 'TELEPHONE HEADSET - UN AURICULAR MAS MICROFONO', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('383', 'MRD-MT001', 'ALMOHADILLAS PARA MICROFONO', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('384', 'MRD-QD001', 'HEADSET CONNECTING CORD - PC 3.5 MM DOBLE', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('385', 'MRD-QD002', 'HEADSET CONNECTING CORD - CONECTOR RJ9', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('386', 'MRD-QD002( A )', 'HEADSET CONNECTING CORD - CONECTOR RJ9', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('387', 'MRD-QD002( C )', 'HEADSET CONNECTING CORD - CONECTOR RJ9', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('388', 'MRD-QD006', 'Y TRAINING CORD/ Y CABLE WITH QD PLUG', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('389', 'MRD-QD008', 'TRAINING CABLE (Y CABLE) WITH QD PLUG AND VOLUMEN', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('390', 'MRD-QD011', 'HEADSET CONNECTING CORD - PLUG 2.5 mm', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('391', 'MRD-QD012', 'HEADSET CONNECTING CORD - PLUG 3.5 mm', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('392', 'MRD-RT004', 'ESPONJAS PARA AURICULAR', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('393', 'MRD-USB', 'HEADSET CONNECTING CORD - CONECTOR USB', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('394', 'MS2EP-EP', 'PATCH CORD ST/ST 8FT 2.5 M', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('395', 'NPC-6203', 'PACHT CORD 3FT CAT 6 AZUL', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('396', 'NPD-5818', 'POE NPD-5818', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('397', 'NSC810AN-3I', 'INTEGRADO NSC810AN-3I', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('398', 'OCJ-T-F1-05MASCA-F1', 'PATCH CORD FC/PC-FC/PC', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('399', 'OCJ-T-F1-OSMASCA-F1', 'PATCH CORD MONOMODO FC/FC 2.4mm 5M', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('400', 'OCP-T-F1-03MASCA-XX', 'PIGTAIL FIBRA FC', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('401', 'OCP-U-F0-03MASEN-XX', 'PIGTAIL FC', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('402', 'ODHOM1P', 'OUTDOOR HOUSING FOR OM1P', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('403', 'OM1P', 'PROFESSIONAL MESH ROUTER WIRELESS', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('404', 'OM1P US', 'PROFESSIONAL MINI ROUTER US PLUGS', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('405', 'OM2P', 'OM2P ROUTER', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('406', 'OM2P-HS v2', 'OM2P ROUTER', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('407', 'OMYA-NEE-38', 'SPRAY OMYA QUICK DRYING', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('408', 'P-1091', 'CAJA DEXSON TOMA/MULTIPLE 55mm', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('409', 'P-20021447', 'PATCH CORD FC/UPC-FC/UPC 5 METROS', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('410', 'P80C31BH', 'INTEGRADO P80C31BH', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('411', 'P80C88A-2', 'INTEGRADO P80C88A-2', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('412', 'P9452BJ', 'INTEGRADO P9452BJ', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('413', 'PAL20X8ACNS', 'INTEGRADO PAL20X8ACNS', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('414', 'PAL32VX10ACJS', 'INTEGRADO PAL32VX10ACJS', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('415', 'PB8000', 'LOGIC CONTROLS GPE652-12500W', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('416', 'PEB2085P', 'INTEGRADO PEB2085P', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('417', 'POEPASS-01', 'PASSIVE POE KIT', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('418', 'PRODUCT-001-PR', 'ESTABILIZADOR', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('419', 'PRUEBA', 'PRUEBA', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('420', 'PRUEBA12', 'PRUEBA12', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('421', 'PRUEBA13', 'PRUEBA13', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('422', 'PRUEBA134', 'PRUEBA14', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('423', 'pruebamodelo1', 'pruebamodelo1', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('424', 'PRUEBAXYZ', 'NOMBREXYZ', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('425', 'PRUEBILLA', '2321321', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('426', 'pruebilla2', 'pruebilla2', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('427', 'pruebilla3', 'p3', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('428', 'PS12VUS', 'POWER SUPPLY', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('429', 'PS18VUS', 'POWER SUPPLY 18V 1A  ( SAW24-138-1500)', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('430', 'PS24VINT', 'AC/DC ADAPTER 24V 1000mA', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('431', 'PST-1908', 'PACHT PANEL 24P CAT 5E', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('432', 'QX\'0200\'0000', 'QX200', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('433', 'QX\'0FXO\'0400', 'QXFX04', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('434', 'QX\'0RMK\'0000', 'QX RACK KIT', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('435', 'QX-0050-0000', 'QX50', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('436', 'RMN4018A', 'MICROFONO/AURIC', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('437', 'SASY-MICRO-0300-0100', 'QUADRO FXO', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('438', 'SASY-MICRO-0300-0300', 'QUADRO 6L w/KSE', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('439', 'SASY-MICRO-0501-1002', 'QUADRO 4L', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('440', 'SASY-MICRO-0501-1101', 'QUADRO 2x2', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('441', 'SASY-MIDI-0201-1000', 'QUADRO M26X', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('442', 'SASY-SOHO-0103-1101', 'QUADRO 4X/4 FXO', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('443', 'SDCFBI-32-201-80', 'COMPACTFLASH', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('444', 'SETU VG8', 'Matrix Voip GSM Gateway', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('445', 'SF 100-16', 'SWITCH CISCO SMALL BUSINESS', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('446', 'SF200-24P', 'CISCO  24-PORT 10/100 PoE', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('447', 'SF200-48P', 'CISCO 48-PORT 10/100PoE', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('448', 'SFP-401101', 'FLAT FACE PLATE 1 PORT WHITE', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('449', 'SG-001', 'MODELO PRUEBA', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('450', 'SH-J023', 'CONNECTION ( MULTITOMA )', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('451', 'SIP-T20P', 'YEALINK ENTERPRISE IP PHONE SIP-T20', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('452', 'SIP-T26P', 'ENTERPRISE IP PHONE T26', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('453', 'SIP-T28P', 'YEALINK ENTERPRISE IP PHONE SIP-T28', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('454', 'SIP-T38G', 'GIGABIT COLOR IP PHONE SIP-T38G', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('455', 'SKJ-XA3111', 'JACK TOOLESS CAT6A AZULES', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('456', 'SKJXA3111', 'JACK TOOLESS CAT6A BLANCOS', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('457', 'SKU:23067', 'WIRE STRAP ANTI-STATIC', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('458', 'SL0CM023024', 'ORDENADOR CABLE MANAGEMENT 2U PLASTIC', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('459', 'SL0PP2412U101', 'UTP BLANK PACTH PANEL MODULAR 24 PORTS', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('460', 'SL5KJU0011201', 'JACK 110 CAT5E', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('461', 'SL6APC2617102', 'PACHT CORD 7FT CAT6A BLANCO', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('462', 'SL6APC26271006', 'PACHT CORD 2FT CAT6A AZUL', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('463', 'SL6APC2627101', 'SHIELDES PACTCH CORD CAT 6A 3FT AZUL', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('464', 'SM-J500M/DS', 'SAMSUNG Galaxy J5', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('465', 'SNOM 870', 'SNOM VOIP PHONES', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('466', 'SNP-3120VHN/DC', '12x Vandal resistant Network PTZ Camera', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('467', 'SP-24PP-C6', 'PATCH PANEL MODULAR UTP 24P ORGAN.', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('468', 'SP-BC6A-ULS', 'BOBINA CABLE U/UTP 4 P 23AWG CAT 6A LSZH LOW SMOKE', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('469', 'ST-SC', 'PATCH CORD ST-SC DUPLEX SINGLE-MODE 10 METROS', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('470', 'ST32122A', '2 GB SEAGATE HARD DISK', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('471', 'STTC-101', 'REPLACEABLE TIP CARTRIDGE', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('472', 'SXWE02-20-W', 'SURIX WANG PAGE', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('473', 'T/M', 'TARJETAS MAGNETICAS', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('474', 'T122000-24W', 'AC/DC ADAPTER 12V 2A', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('476', 'TDR', 'TALADRO', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('477', 'TIP41', 'TRANSISTOR TIP41', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('478', 'TIP42', 'TRANSISTOR TIP42', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('479', 'TRPDG1LXDABS-ALB', 'SFP TRANSCEIVER', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('480', 'TS 30 ID', 'TELEFONO INALAMBRICO DIGITAL TS 30 ID', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('481', 'TS 3522', 'TELÉFONO INALAMBRICO', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('482', 'TS 3530', 'TELEFONO INALAMBRICO 3530 INTELBRAS', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('484', 'TS 3533', 'TELEFONO INALAMBRICO TS 3533', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('485', 'TYPE 32', 'TERMINAL POCKET', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('486', 'U2200-07800-160', 'POLYCOM SOUNDSTATION 2W DECT 6,0 OPEN BOX', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('487', 'ULT31418', 'ANTI-STATIC WRIST STRAP BRACELET ANTISTATIQUE', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('488', 'undefined', 'undefined', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('489', 'UNSP2000000002', 'PASS 25', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('490', 'USB PHONE', 'USB WIRELESS PHONE', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('491', 'VBCPO34XEX', 'SOPORTE CAMARA SAMSUNG SBP-300WM', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('492', 'VERSATIS M250 LA', 'TELEFONO INALAMBRICO ALCATEL VERSATIS M250', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('493', 'VGFX QB GSM', 'ANTENA GSM MULTIBANDA SETU VGFX', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('494', 'VP-2009', 'IP VIDEO PHONE YEALINK VP-2009', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('495', 'WD10PURX-64E5EY0', 'SATA/64MB Cache WD10PURX (1.0 TB)', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('496', 'X0001MGLP1', 'PIN GROUNDING BLOCK', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('497', 'X000B1SL7D', 'CARRIER PoE ADAPTER NANOSTATION', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('498', 'X000G810R9', 'PASSIVE PoE KIT BLACK', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('499', 'X000MABWIN', 'CASE FAN, 40X40X10 mm, Ball Bearing, 3 pin', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('500', 'X00154FMQD', 'PASSIVE PoE KIT BLACK', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('501', 'X3', 'FANVIL IP PHONE X3', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('502', 'YHS32', 'HEADSET YEALINK', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('503', 'Z-230PJ', 'DSL FILTER EXCELSUS SIMPLE', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('504', 'Z9530003901A', 'FUENTE PARA CAMARA SAMSUNG 24V 2.5A', null, null, null, '1', '2');
INSERT INTO `model` VALUES ('505', 'SXSD1123132', 'CAJA DE 100 ESFEROS', null, '50', '6', '1', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of price
-- ----------------------------
INSERT INTO `price` VALUES ('1', '28', '25.00', '1', '4');
INSERT INTO `price` VALUES ('2', '1', '50.00', '1', '4');
INSERT INTO `price` VALUES ('3', '505', '0.25', '1', '4');
INSERT INTO `price` VALUES ('4', '505', '2.00', '5', '7');

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
  `price` decimal(10,2) DEFAULT 0.00,
  PRIMARY KEY (`id`),
  KEY `location` (`location`),
  KEY `variant` (`variant`),
  KEY `bill` (`bill`),
  CONSTRAINT `bill` FOREIGN KEY (`bill`) REFERENCES `bill` (`id`),
  CONSTRAINT `location` FOREIGN KEY (`location`) REFERENCES `location` (`id`),
  CONSTRAINT `model` FOREIGN KEY (`variant`) REFERENCES `model` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24741 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('24593', 'VBCPO34MEX-001', '491', '14', '39', '25.00');
INSERT INTO `product` VALUES ('24594', 'VBCPO34MEX-002', '491', '14', '39', '25.00');
INSERT INTO `product` VALUES ('24595', 'VBCPO34MEX-003', '491', '14', '39', '25.00');
INSERT INTO `product` VALUES ('24596', '123456', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24597', '1234567', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24598', '12345678', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24599', '123456789', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24600', '1234567897', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24601', '12345678945', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24602', '80', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24603', '88', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24604', '81', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24605', '1320', '174', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24606', '147', '217', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24607', 'VBCPO34MEX-001', '491', '14', '39', '25.00');
INSERT INTO `product` VALUES ('24608', 'VBCPO34MEX-002', '491', '14', '39', '25.00');
INSERT INTO `product` VALUES ('24609', 'VBCPO34MEX-003', '491', '14', '39', '25.00');
INSERT INTO `product` VALUES ('24610', '123456', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24611', '1234567', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24612', '12345678', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24613', '123456789', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24614', '1234567897', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24615', '12345678945', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24616', '80', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24617', '88', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24618', '81', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24619', '1320', '174', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24620', '147', '217', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24621', '1234567', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24622', '12345678', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24623', '123456789', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24624', '1234567897', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24625', '12345678945', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24626', '80', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24627', '88', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24628', '81', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24629', '1320', '174', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24630', '147', '217', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24631', 'VBCPO34MEX-001', '491', '14', '39', '25.00');
INSERT INTO `product` VALUES ('24632', 'VBCPO34MEX-002', '491', '14', '39', '25.00');
INSERT INTO `product` VALUES ('24633', 'VBCPO34MEX-003', '491', '14', '39', '25.00');
INSERT INTO `product` VALUES ('24634', '123456', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24635', '1234567', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24636', '12345678', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24637', '123456789', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24638', '1234567897', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24639', '12345678945', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24640', '80', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24641', '88', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24642', '81', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24643', '1320', '174', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24644', '147', '217', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24645', '1234567', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24646', '12345678', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24647', '123456789', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24648', '1234567897', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24649', '12345678945', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24650', '80', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24651', '88', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24652', '81', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24653', '1320', '174', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24654', '147', '217', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24655', 'VBCPO34MEX-001', '491', '14', '39', '25.00');
INSERT INTO `product` VALUES ('24656', 'VBCPO34MEX-002', '491', '14', '39', '25.00');
INSERT INTO `product` VALUES ('24657', 'VBCPO34MEX-003', '491', '14', '39', '25.00');
INSERT INTO `product` VALUES ('24658', '123456', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24659', '1234567', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24660', '12345678', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24661', '123456789', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24662', '1234567897', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24663', '12345678945', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24664', '80', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24665', '88', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24666', '81', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24667', '1320', '174', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24668', '147', '217', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24669', '1234567', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24670', '12345678', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24671', '123456789', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24672', '1234567897', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24673', '12345678945', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24674', '80', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24675', '88', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24676', '81', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24677', '1320', '174', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24678', '147', '217', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24679', 'VBCPO34MEX-001', '491', '14', '39', '25.00');
INSERT INTO `product` VALUES ('24680', 'VBCPO34MEX-002', '491', '14', '39', '25.00');
INSERT INTO `product` VALUES ('24681', 'VBCPO34MEX-003', '491', '14', '39', '25.00');
INSERT INTO `product` VALUES ('24682', '123456', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24683', '1234567', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24684', '12345678', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24685', '123456789', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24686', '1234567897', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24687', '12345678945', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24688', '80', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24689', '88', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24690', '81', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24691', '1320', '174', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24692', '147', '217', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24693', '1234567', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24694', '12345678', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24695', '123456789', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24696', '1234567897', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24697', '12345678945', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24698', '80', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24699', '88', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24700', '81', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24701', '1320', '174', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24702', '147', '217', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24703', 'VBCPO34MEX-001', '491', '14', '39', '25.00');
INSERT INTO `product` VALUES ('24704', 'VBCPO34MEX-002', '491', '14', '39', '25.00');
INSERT INTO `product` VALUES ('24705', 'VBCPO34MEX-003', '491', '14', '39', '25.00');
INSERT INTO `product` VALUES ('24706', '123456', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24707', '1234567', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24708', '12345678', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24709', '123456789', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24710', '1234567897', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24711', '12345678945', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24712', '80', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24713', '88', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24714', '81', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24715', '1320', '174', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24716', '147', '217', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24717', '1234567', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24718', '12345678', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24719', '123456789', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24720', '1234567897', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24721', '12345678945', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24722', '80', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24723', '88', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24724', '81', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24725', '1320', '174', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24726', '147', '217', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24727', 'VBCPO34MEX-001', '491', '14', '39', '25.00');
INSERT INTO `product` VALUES ('24728', 'VBCPO34MEX-002', '491', '14', '39', '25.00');
INSERT INTO `product` VALUES ('24729', 'VBCPO34MEX-003', '491', '14', '39', '25.00');
INSERT INTO `product` VALUES ('24730', '123456', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24731', '1234567', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24732', '12345678', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24733', '123456789', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24734', '1234567897', '178', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24735', '12345678945', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24736', '80', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24737', '88', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24738', '81', '178', '13', '39', '256.00');
INSERT INTO `product` VALUES ('24739', '1320', '174', '14', '39', '256.00');
INSERT INTO `product` VALUES ('24740', '147', '217', '14', '39', '256.00');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of unit
-- ----------------------------
INSERT INTO `unit` VALUES ('4', 'Unidad', 'Unidad', '1');
INSERT INTO `unit` VALUES ('5', 'Rollo de 100 metros', 'Rollo/100', '1000');
INSERT INTO `unit` VALUES ('6', 'Caja de 100', 'Caja/100', null);
INSERT INTO `unit` VALUES ('7', 'Paquete de 5', 'Paquete/5', null);

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `ukusername` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('19', 'Gabriel', 'Salazar', 'gsalazar', 'mpalomo@gmail.com', '1', '1', '$2a$08$Ft.t6hsBNoWGPf/tF71gSOD49mobctsvLQdkv0POK8xk2s4PXFu.2');
INSERT INTO `user` VALUES ('28', 'Alexis', 'Ortiz', 'gabosoam', 'gabrielsalazar@outlook.com', '1', '2', '$2a$08$Ft.t6hsBNoWGPf/tF71gSOD49mobctsvLQdkv0POK8xk2s4PXFu.2');

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
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_bill` AS SELECT
model.id AS id,
product.barcode,
model.`code` AS `code`,
model.description AS Producto,
model.description AS description,
product.bill AS bill,
location.`name` AS location,
category.`name` AS category,
brand.`name` AS brand,
product.price
FROM
(product
JOIN model ON ((product.variant = model.id)))
LEFT JOIN location ON product.location = location.id 
LEFT JOIN category ON model.category = category.id 
LEFT JOIN brand ON model.brand = brand.id ;

-- ----------------------------
-- View structure for v_brand
-- ----------------------------
DROP VIEW IF EXISTS `v_brand`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_brand` AS select `brand`.`id` AS `value`,`brand`.`name` AS `text` from `brand` ;

-- ----------------------------
-- View structure for v_category
-- ----------------------------
DROP VIEW IF EXISTS `v_category`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_category` AS select `category`.`id` AS `value`,`category`.`name` AS `text` from `category` ;

-- ----------------------------
-- View structure for v_infobill
-- ----------------------------
DROP VIEW IF EXISTS `v_infobill`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_infobill` AS select `bill`.`id` AS `id`,`provider`.`name` AS `name`,`bill`.`date` AS `date`,`bill`.`reference` AS `reference` from (`bill` join `provider` on((`bill`.`provider` = `provider`.`id`))) ;

-- ----------------------------
-- View structure for v_model
-- ----------------------------
DROP VIEW IF EXISTS `v_model`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_model` AS select `model`.`id` AS `id`,`model`.`code` AS `code`,`model`.`description` AS `description`,`unit`.`description` AS `unit`,`category`.`name` AS `category`,`brand`.`name` AS `brand` from (((`model` left join `unit` on((`model`.`unit` = `unit`.`id`))) left join `category` on((`model`.`category` = `category`.`id`))) left join `brand` on((`model`.`brand` = `brand`.`id`))) ;

-- ----------------------------
-- View structure for v_modelbill
-- ----------------------------
DROP VIEW IF EXISTS `v_modelbill`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_modelbill` AS select `model`.`id` AS `id`,concat(`model`.`code`,' - ',`model`.`description`) AS `description` from `model` ;

-- ----------------------------
-- View structure for v_provider
-- ----------------------------
DROP VIEW IF EXISTS `v_provider`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_provider` AS select `provider`.`id` AS `value`,`provider`.`name` AS `text` from `provider` ;

-- ----------------------------
-- View structure for v_unit
-- ----------------------------
DROP VIEW IF EXISTS `v_unit`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_unit` AS select `unit`.`id` AS `value`,`unit`.`smallDescription` AS `text` from `unit` ;

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

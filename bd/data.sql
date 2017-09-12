/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : inventory

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-09-12 12:09:45
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
INSERT INTO `bill` VALUES ('24', '2', '1', '2017-09-11', '001');

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
INSERT INTO `category` VALUES ('26', 'VIOP');
INSERT INTO `category` VALUES ('11', 'VOIP');
INSERT INTO `category` VALUES ('36', 'VOZ');
INSERT INTO `category` VALUES ('15', 'WI-FI');
INSERT INTO `category` VALUES ('28', 'WIFI');

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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('14', '1723713556', 'Gabriel Salazar', 'Quito Sur', '2621561', 'gabrielsalazar@outlook.com');
INSERT INTO `client` VALUES ('41', '1452145874', 'JESSICA ESPAÑA', 'LA CORUÑA', '2456123', 'jespaña@gmail.com');

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
  UNIQUE KEY `ukcode` (`code`),
  KEY `unit` (`unit`),
  KEY `brand` (`brand`),
  KEY `category` (`category`),
  CONSTRAINT `brand` FOREIGN KEY (`brand`) REFERENCES `brand` (`id`),
  CONSTRAINT `category` FOREIGN KEY (`category`) REFERENCES `category` (`id`),
  CONSTRAINT `unit` FOREIGN KEY (`unit`) REFERENCES `unit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=505 DEFAULT CHARSET=latin1;

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
INSERT INTO `model` VALUES ('42', '0.33UF 120V', 'CONDENSADOR 0.33UF 120V', null, null, null, null, null);
INSERT INTO `model` VALUES ('43', '0606328', 'Terminal VF 2 - 4 16-14 AWG OJO 5.3MM AZUL', null, null, null, null, null);
INSERT INTO `model` VALUES ('44', '0606339', 'Terminal VF 5.5 - 5 12-10 AWG OJO 5.3MM AMARILLO', null, null, null, null, null);
INSERT INTO `model` VALUES ('45', '0606341', 'Terminal VF 5.5 - 8 12-10 AWG OJO 8.4MM AMARILLO', null, null, null, null, null);
INSERT INTO `model` VALUES ('46', '1-0233400-0', 'PATCH CORD FIBRA SC/SC', null, null, null, null, null);
INSERT INTO `model` VALUES ('47', '1000UF 100V', 'CONDENSADOR 1000UF 100V', null, null, null, null, null);
INSERT INTO `model` VALUES ('48', '1000UF 10V', 'CONDENSADOR 1000UF 10V', null, null, null, null, null);
INSERT INTO `model` VALUES ('49', '1000UF 15V', 'CONDENSADOR 1000UF 15V', null, null, null, null, null);
INSERT INTO `model` VALUES ('50', '1000UF 25V', 'CONDENSADOR 1000UF 25V', null, null, null, null, null);
INSERT INTO `model` VALUES ('51', '1000UF 40V', 'CONDENSADOR 1000UF 40V', null, null, null, null, null);
INSERT INTO `model` VALUES ('52', '10038769', 'GUIA DE ONDA TWISTFLEX TF084-BW1 1,2m', null, null, null, null, null);
INSERT INTO `model` VALUES ('53', '100UF 16V', 'CONDENSADOR 100UF16V', null, null, null, null, null);
INSERT INTO `model` VALUES ('54', '100UF 200V', 'CONDENSADOR 100UF 200V', null, null, null, null, null);
INSERT INTO `model` VALUES ('55', '100UF 25V', 'CONDENSADOR 100UF 25V', null, null, null, null, null);
INSERT INTO `model` VALUES ('56', '100UF 35V', 'CONDENSADOR 100UF 35V', null, null, null, null, null);
INSERT INTO `model` VALUES ('57', '100UF 40V', 'CONDENSADOR 100UF 40V', null, null, null, null, null);
INSERT INTO `model` VALUES ('58', '100UF 50V', 'CONDENSADOR 100UF 50V', null, null, null, null, null);
INSERT INTO `model` VALUES ('59', '100UF 6,3V', 'CONDENSADOR 100UF 6,3V', null, null, null, null, null);
INSERT INTO `model` VALUES ('60', '100UF 63V', 'CONDENSADOR 100UF 63V', null, null, null, null, null);
INSERT INTO `model` VALUES ('61', '10NF 630V', 'CONDENSADOR 10NF 630V', null, null, null, null, null);
INSERT INTO `model` VALUES ('62', '10UF 100V', 'CONDENSADOR 10UF 100V', null, null, null, null, null);
INSERT INTO `model` VALUES ('63', '10UF 16V', 'CONDENSADOR 10UF 16V', null, null, null, null, null);
INSERT INTO `model` VALUES ('64', '10UF 200V', 'CONDENSADOR 10UF 200V', null, null, null, null, null);
INSERT INTO `model` VALUES ('65', '10UF 250V', 'CONDENSADOR 10UF 250V', null, null, null, null, null);
INSERT INTO `model` VALUES ('66', '10UF 25V', 'CONDENSADOR 10UF 25V', null, null, null, null, null);
INSERT INTO `model` VALUES ('67', '10UF 35V', 'CONDENSADOR 10UF 35V', null, null, null, null, null);
INSERT INTO `model` VALUES ('68', '10UF 40V', 'CONDENSADOR 10UF 40V', null, null, null, null, null);
INSERT INTO `model` VALUES ('69', '10UF 50V', 'CONDENSADOR 10UF 50 V', null, null, null, null, null);
INSERT INTO `model` VALUES ('70', '10UF 63V', 'CONDENSADOR 10UF 63V', null, null, null, null, null);
INSERT INTO `model` VALUES ('71', '1100-0232', 'ASSY, TOOL, CLEANING, FIBER', null, null, null, null, null);
INSERT INTO `model` VALUES ('72', '1100-0233', 'ASSY, TOOL, CLEANING, SPONGE', null, null, null, null, null);
INSERT INTO `model` VALUES ('73', '1121-0624-P5', 'DRIVE TIP PKG .040 THERMO', null, null, null, null, null);
INSERT INTO `model` VALUES ('74', '1121-0625-P5', 'DRIVE TIP PKG .030 THERMO', null, null, null, null, null);
INSERT INTO `model` VALUES ('75', '1121-0626-P5', 'DRIVE TIP PKG .060 THERMO', null, null, null, null, null);
INSERT INTO `model` VALUES ('76', '1121-0627-P5', 'DRIVE TIP PKG .090 THERMO', null, null, null, null, null);
INSERT INTO `model` VALUES ('77', '1124-0007-P1', 'CHISEL PACE .063 90 DEG', null, null, null, null, null);
INSERT INTO `model` VALUES ('78', '1124-0010-P1', 'CHISEL PACE .203', null, null, null, null, null);
INSERT INTO `model` VALUES ('79', '1124-0013-P1', 'CHISEL PACE .094 30 DEG', null, null, null, null, null);
INSERT INTO `model` VALUES ('80', '1124-0016-P1', 'CHISEL PACE .047 BENT', null, null, null, null, null);
INSERT INTO `model` VALUES ('81', '1124-0023-P1', 'CHISEL PACE .125 90 DEG', null, null, null, null, null);
INSERT INTO `model` VALUES ('84', '1124-0034-P1', 'SIDED PACE .25 SINGLE', null, null, null, null, null);
INSERT INTO `model` VALUES ('85', '120UF 100V', 'CONDENSADOR 120UF 100V', null, null, null, null, null);
INSERT INTO `model` VALUES ('86', '121559102A', 'TRANSFORMADOR DE TIMBRE ILA', null, null, null, null, null);
INSERT INTO `model` VALUES ('87', '1265-0011', 'GLASS CHAMBER', null, null, null, null, null);
INSERT INTO `model` VALUES ('88', '130-195', '3M 746CERT 746 Tester with Certificate of Calibrat', null, null, null, null, null);
INSERT INTO `model` VALUES ('89', '1309-0054', 'FLUX SODR TRAP', null, null, null, null, null);
INSERT INTO `model` VALUES ('90', '1415-PRUEBA', 'PRUEBA 2', null, null, null, null, null);
INSERT INTO `model` VALUES ('91', '14UH', 'BOBINAS AZO238', null, null, null, null, null);
INSERT INTO `model` VALUES ('92', '15000UF-63V', 'CONDENSADOR 15000UF-63V', null, null, null, null, null);
INSERT INTO `model` VALUES ('93', '1500UF 10V', 'CONDENSADOR 1500UF 10V', null, null, null, null, null);
INSERT INTO `model` VALUES ('94', '15UF 16V', 'CONDENSADOR 15UF 16V', null, null, null, null, null);
INSERT INTO `model` VALUES ('95', '16-6', 'TERMINAL T 16-6 6AWG 1/4\"', null, null, null, null, null);
INSERT INTO `model` VALUES ('96', '16-8', 'TERMINAL T 16-8 6AWG 5/16\"', null, null, null, null, null);
INSERT INTO `model` VALUES ('97', '1730502068', 'SWITCH TP-LINK 8P 10-100 Mbps', null, null, null, null, null);
INSERT INTO `model` VALUES ('98', '19C1693', 'CONECTOR CHASSIS BNC 50 OHM', null, null, null, null, null);
INSERT INTO `model` VALUES ('99', '1AB079840007', 'PATCH CORD FC/SPC-FC/SPC 5 METROS', null, null, null, null, null);
INSERT INTO `model` VALUES ('100', '1AB079840016', 'PATCH CORD FC-FC 29M', null, null, null, null, null);
INSERT INTO `model` VALUES ('101', '1AB1747700033', 'FILTRO ADSL', null, null, null, null, null);
INSERT INTO `model` VALUES ('102', '1AF00089AAAA04', 'MODEM V32 BIS 1144MD', null, null, null, null, null);
INSERT INTO `model` VALUES ('103', '1AF00398AAAA', 'TELEFONO CANAL DE SERVICIO', null, null, null, null, null);
INSERT INTO `model` VALUES ('104', '1AFO1226ADAA', 'CLASS 2 POWER  SUPPLY 9V/1A DC', null, null, null, null, null);
INSERT INTO `model` VALUES ('105', '1UF 200V', 'CONDENSADOR 1UF 200V', null, null, null, null, null);
INSERT INTO `model` VALUES ('106', '2,2UF 63V', 'CONDENSADOR 2,2UF 63V', null, null, null, null, null);
INSERT INTO `model` VALUES ('107', '2.2UF 250V', 'CONDENSADOR 2.2UF 250V', null, null, null, null, null);
INSERT INTO `model` VALUES ('108', '2.2UF-900V', 'CONDENSADOR 2.2UF-900V', null, null, null, null, null);
INSERT INTO `model` VALUES ('109', '20UF 40V', 'CONDENSADOR 20UF 40V', null, null, null, null, null);
INSERT INTO `model` VALUES ('110', '22-18', 'TERMINAL DE OJO 22-18AWG DIAMETRO 5.3 MM (3/16\")', null, null, null, null, null);
INSERT INTO `model` VALUES ('111', '2200-050P', 'CONECTOR DB50', null, null, null, null, null);
INSERT INTO `model` VALUES ('112', '2200UF 100V', 'CONDENSADOR 2200UF 100V', null, null, null, null, null);
INSERT INTO `model` VALUES ('113', '2200UF 16V', 'CONDENSADOR 2200UF 16V', null, null, null, null, null);
INSERT INTO `model` VALUES ('114', '2200UF 25V', 'CONDENSADOR 2200UF 25V', null, null, null, null, null);
INSERT INTO `model` VALUES ('115', '2200UF 50V', '2200UF 50V', null, null, null, null, null);
INSERT INTO `model` VALUES ('116', '2201-67810-160', 'SOUNDSTATION 2W B', null, null, null, null, null);
INSERT INTO `model` VALUES ('117', '2201-67880-160', 'SOUNDSTATION 2W E', null, null, null, null, null);
INSERT INTO `model` VALUES ('118', '220NF 1000V', 'CONDENSADOR 220NF 1000V', null, null, null, null, null);
INSERT INTO `model` VALUES ('119', '220UF 100V', 'CONDENSADOR 220UF 100V', null, null, null, null, null);
INSERT INTO `model` VALUES ('120', '220UF 10V', 'CONDENSADOR 220UF 10V', null, null, null, null, null);
INSERT INTO `model` VALUES ('121', '220UF 16V', 'CONDENSADOR 220UF 16V', null, null, null, null, null);
INSERT INTO `model` VALUES ('122', '220UF 25V', 'CONDENSADOR 220UF 25V', null, null, null, null, null);
INSERT INTO `model` VALUES ('123', '220UF 35V', 'CONDENSADOR 220UF 35V', null, null, null, null, null);
INSERT INTO `model` VALUES ('124', '220UF 50V', 'CONDENSADOR 220UF 50V', null, null, null, null, null);
INSERT INTO `model` VALUES ('125', '220UF 63V', 'CONDENSADOR 220UF 63V', null, null, null, null, null);
INSERT INTO `model` VALUES ('126', '2299121', 'CONECTOR WINCHESTER', null, null, null, null, null);
INSERT INTO `model` VALUES ('127', '22UF 100V', 'CONDENSADOR 22UF 100V', null, null, null, null, null);
INSERT INTO `model` VALUES ('128', '22UF 160V', 'CONDENSADOR 22UF 160V', null, null, null, null, null);
INSERT INTO `model` VALUES ('129', '22UF 35V', 'CONDENSADOR 22UF 35V', null, null, null, null, null);
INSERT INTO `model` VALUES ('130', '22UF 63V', 'CONDENSADOR 22UF 63V', null, null, null, null, null);
INSERT INTO `model` VALUES ('131', '22UF-16V', 'CONDENSADORES 22UF-16V', null, null, null, null, null);
INSERT INTO `model` VALUES ('132', '22UH/3A', 'BOBINAS', null, null, null, null, null);
INSERT INTO `model` VALUES ('133', '2504548T01', 'ADAPTADOR DE BATERIA MOTOROLA PRO5150', null, null, null, null, null);
INSERT INTO `model` VALUES ('134', '256550', 'CHECK FOR UTP.STP.COAXIAL', null, null, null, null, null);
INSERT INTO `model` VALUES ('135', '271001', 'MEMORIA 271001', null, null, null, null, null);
INSERT INTO `model` VALUES ('136', '27128', 'MEMORIA 27128', null, null, null, null, null);
INSERT INTO `model` VALUES ('137', '27256', 'MEMORIA 27256', null, null, null, null, null);
INSERT INTO `model` VALUES ('138', '27512', 'MEMORIA 27512', null, null, null, null, null);
INSERT INTO `model` VALUES ('139', '2N3251', 'TRANSISTOR 2N3251', null, null, null, null, null);
INSERT INTO `model` VALUES ('140', '2N3439', 'TRANSISTOR 2N3439', null, null, null, null, null);
INSERT INTO `model` VALUES ('141', '2N3440', 'TRANSISTOR 2N3440', null, null, null, null, null);
INSERT INTO `model` VALUES ('142', '2N5415', 'TRANSISTOR 2N5415', null, null, null, null, null);
INSERT INTO `model` VALUES ('143', '2N5416', 'TRANSISTOR 2N5416', null, null, null, null, null);
INSERT INTO `model` VALUES ('144', '3,3UF 250V', 'CONDENSADOR 3,3UF 250V', null, null, null, null, null);
INSERT INTO `model` VALUES ('145', '30\'42709\'01', 'MODEL SA100-3430', null, null, null, null, null);
INSERT INTO `model` VALUES ('146', '3300UF 12V', 'CONDENSADOR 3300UF 12V', null, null, null, null, null);
INSERT INTO `model` VALUES ('147', '3300UF 35V', 'CONDENSADOR 3300UF 35V', null, null, null, null, null);
INSERT INTO `model` VALUES ('148', '330UF 10V', 'CONDENSADOR 330UF 10V', null, null, null, null, null);
INSERT INTO `model` VALUES ('149', '330UF 16V', 'CONDENSADOR 330UF 16V', null, null, null, null, null);
INSERT INTO `model` VALUES ('150', '330UF 25V', 'CONDENSADOR 330UF 25V', null, null, null, null, null);
INSERT INTO `model` VALUES ('151', '33461', 'TERMINAL DE OJO AMP 8 1/4\"', null, null, null, null, null);
INSERT INTO `model` VALUES ('152', '33UF 100V', 'CONDENSADOR 33UF 100V', null, null, null, null, null);
INSERT INTO `model` VALUES ('153', '33UF 16V', 'CONDENSADOR 33UF 16V', null, null, null, null, null);
INSERT INTO `model` VALUES ('154', '33UF 250V', 'CONDENSADOR 33UF 250V', null, null, null, null, null);
INSERT INTO `model` VALUES ('155', '3480405000000010549711', 'CONN BACKSHELL DB15', null, null, null, null, null);
INSERT INTO `model` VALUES ('156', '3499', 'BOBINA UTP CAT 5E AZUL', null, null, null, null, null);
INSERT INTO `model` VALUES ('157', '376', 'True-rms AC/DC Clamp Meter', null, null, null, null, null);
INSERT INTO `model` VALUES ('158', '37602837', 'PCM 1560 PG H CO-16 II', null, null, null, null, null);
INSERT INTO `model` VALUES ('159', '37606387', 'PCM 1564 PG MM D-BOX', null, null, null, null, null);
INSERT INTO `model` VALUES ('160', '3872C782', 'PC COMPAQ (OMPC)', null, null, null, null, null);
INSERT INTO `model` VALUES ('161', '3AF00888AEAA', 'PATCH CORD FC-FC', null, null, null, null, null);
INSERT INTO `model` VALUES ('164', '3AF00888AFAA', 'PATCH CORD FC-FC', null, null, null, null, null);
INSERT INTO `model` VALUES ('165', '3HE00028CA 01', 'SFP TRANSCEIVER', null, null, null, null, null);
INSERT INTO `model` VALUES ('166', '4,7NF 1000V', 'CONDENSADOR 4,7NF 1000V', null, null, null, null, null);
INSERT INTO `model` VALUES ('167', '4,7UF 100V', 'CONDENSADOR 4,7UF 100V', null, null, null, null, null);
INSERT INTO `model` VALUES ('168', '4,7UF 16V', 'CONDENSADOR 4,7UF 16V', null, null, null, null, null);
INSERT INTO `model` VALUES ('169', '4,7UF 25V', 'CONDENSADOR 4,7UF 25V', null, null, null, null, null);
INSERT INTO `model` VALUES ('170', '4,7UF 40V', 'CONDENSADOR 4,7UF 40V', null, null, null, null, null);
INSERT INTO `model` VALUES ('171', '4,7UF 63V', 'CONDENSADOR 4,7UF 63V', null, null, null, null, null);
INSERT INTO `model` VALUES ('174', '40Uf/2A', 'BOBINAS', null, null, null, null, null);
INSERT INTO `model` VALUES ('176', '4116R', 'INTEGRADO 4116R', null, null, null, null, null);
INSERT INTO `model` VALUES ('178', '4320083', 'PABX DIGITAL IMPACTA 16 ESP 2X4', null, null, null, null, null);
INSERT INTO `model` VALUES ('182', '4501015', 'PORTERO XPE 1013 PLUS', null, null, null, null, null);
INSERT INTO `model` VALUES ('187', '4520010', 'VIDEO PORTERO IV7000 LCD BLANCO-HANDS FREE', null, null, null, null, null);
INSERT INTO `model` VALUES ('188', '4520800', 'EXTENCION DE AUDIO PARA VIDEO PORTERO IV 7000 EA', null, null, null, null, null);
INSERT INTO `model` VALUES ('192', '4580017', 'NVD 3000-P', null, null, null, null, null);
INSERT INTO `model` VALUES ('194', '4700007', 'TELEFONO IP-TIP 100 CON POE', null, null, null, null, null);
INSERT INTO `model` VALUES ('195', '4700UF 16V', 'CONDENSADOR 4700UF 16V', null, null, null, null, null);
INSERT INTO `model` VALUES ('196', '470UF 10V', 'CONDENSADOR 470UF 10V', null, null, null, null, null);
INSERT INTO `model` VALUES ('197', '470UF 12V', 'CONDENSADOR 470UF 12V', null, null, null, null, null);
INSERT INTO `model` VALUES ('198', '470UF 16V', 'CONDENSADOR 470UF 16V', null, null, null, null, null);
INSERT INTO `model` VALUES ('199', '470UF 20V', 'CONDENSADOR 470UF 20 V', null, null, null, null, null);
INSERT INTO `model` VALUES ('200', '470UF 40V', 'CONDENSADOR 470UF 40V', null, null, null, null, null);
INSERT INTO `model` VALUES ('201', '470UF 63V', 'CONDENSADOR 470UF 63V', null, null, null, null, null);
INSERT INTO `model` VALUES ('202', '470UF-400V', 'CONDENSADOR 470UF-400V', null, null, null, null, null);
INSERT INTO `model` VALUES ('204', '47725', 'PATCH CORD OPT.8M 2XFC/SPC.MONOM', null, null, null, null, null);
INSERT INTO `model` VALUES ('205', '47UF 100V', 'CONDENSADOR 47UF 100V', null, null, null, null, null);
INSERT INTO `model` VALUES ('206', '47UF 16V', 'CONDENSADOR 47UF 16V', null, null, null, null, null);
INSERT INTO `model` VALUES ('207', '47UF 25V', 'CONDENSADOR 47UF 25V', null, null, null, null, null);
INSERT INTO `model` VALUES ('208', '47UF 40V', 'CONDENSADOR 47UF 40V', null, null, null, null, null);
INSERT INTO `model` VALUES ('209', '47UF 63V', 'CONDENSADOR 47UF 63V', null, null, null, null, null);
INSERT INTO `model` VALUES ('210', '48F2772', 'CONECTOR CHASSIS TWINAX/TRIAX RCPT', null, null, null, null, null);
INSERT INTO `model` VALUES ('211', '492014-3', 'PATCH CORD FC/FC 2.95M', null, null, null, null, null);
INSERT INTO `model` VALUES ('212', '492014-4', 'PIGTAIL C/A SM FC(NG)/FC(NG) 5M', null, null, null, null, null);
INSERT INTO `model` VALUES ('213', '492014-9', 'PIGTAIL FC/FC 6.92M', null, null, null, null, null);
INSERT INTO `model` VALUES ('216', '5617NMA1', 'PATCH CORD MONOMODO DUPLEX FC-ST 3M', null, null, null, null, null);
INSERT INTO `model` VALUES ('217', '56UH/1.5A', 'BOBINAS', null, null, null, null, null);
INSERT INTO `model` VALUES ('218', '5K', 'RESISTENCIAS DE PRESICION', null, null, null, null, null);
INSERT INTO `model` VALUES ('219', '6,8UF 100V', 'CONDENSADOR 6,8UF 100V', null, null, null, null, null);
INSERT INTO `model` VALUES ('220', '6,8UF 25V', 'CONDENSADOR 6,8UF 25V', null, null, null, null, null);
INSERT INTO `model` VALUES ('221', '6018-0097', 'KIT, ANGLE BRACKET', null, null, null, null, null);
INSERT INTO `model` VALUES ('222', '6019-0079', 'TD-100 TIP & TOOL STAND', null, null, null, null, null);
INSERT INTO `model` VALUES ('223', '6019-0082', 'SX TIP & TOOL STAND', null, null, null, null, null);
INSERT INTO `model` VALUES ('224', '6092110201', 'CABEZAL KRONE 100 PARES', null, null, null, null, null);
INSERT INTO `model` VALUES ('225', '662774019680', 'USB VGA KVM CONSOLE EXTENDER OVER CAT5', null, null, null, null, null);
INSERT INTO `model` VALUES ('226', '680UF 25V', 'CONDENSADOR 680UF 25V', null, null, null, null, null);
INSERT INTO `model` VALUES ('227', '680UF 6,3V', 'CONDENSADOR 680UF 6,3V', null, null, null, null, null);
INSERT INTO `model` VALUES ('228', '680UF 63V', 'CONDENSADOR 680UF 63V', null, null, null, null, null);
INSERT INTO `model` VALUES ('229', '680UF-385V', 'CONDENSADOR 680UF-385V', null, null, null, null, null);
INSERT INTO `model` VALUES ('230', '68UF 16V', 'CONDENSADOR 68UF 16V', null, null, null, null, null);
INSERT INTO `model` VALUES ('231', '68UF 6,3V', 'CONDENSADOR 68UF 6,3V', null, null, null, null, null);
INSERT INTO `model` VALUES ('232', '68UF 63V', 'CONDENSADOR 68UF 63V', null, null, null, null, null);
INSERT INTO `model` VALUES ('233', '6993-0136', 'KIT, CABLE, MARKER, C-TYPE', null, null, null, null, null);
INSERT INTO `model` VALUES ('234', '6993-0263', 'TD-100 KIT, INTELL, HEAT', null, null, null, null, null);
INSERT INTO `model` VALUES ('235', '6993-0266', 'SX-90 KIT, INTELL, HEAT', null, null, null, null, null);
INSERT INTO `model` VALUES ('236', '7008-0287-01', 'MBT-301 PACE STATION', null, null, null, null, null);
INSERT INTO `model` VALUES ('237', '72913-01', 'PLANTRONICS SPARE, EAR TIP KIT', null, null, null, null, null);
INSERT INTO `model` VALUES ('238', '74\'12358\'02 B0', 'ENRUTADOR VPN MULTIFUNCION', null, null, null, null, null);
INSERT INTO `model` VALUES ('239', '74259', 'INTEGRADO 74259', null, null, null, null, null);
INSERT INTO `model` VALUES ('240', '74574', 'INTEGRADO 74574', null, null, null, null, null);
INSERT INTO `model` VALUES ('241', '746320011370', 'CAB - V35MT=', null, null, null, null, null);
INSERT INTO `model` VALUES ('242', '74HC00', 'INTEGRADO 74HC00', null, null, null, null, null);
INSERT INTO `model` VALUES ('243', '74HC161', 'INTEGRADO 74HC161', null, null, null, null, null);
INSERT INTO `model` VALUES ('244', '74HC4316', 'INTEGRADO 74HC4316', null, null, null, null, null);
INSERT INTO `model` VALUES ('245', '74HC74', 'INTEGRADO 74HC74', null, null, null, null, null);
INSERT INTO `model` VALUES ('246', '75C188', 'INTEGRADO 75C188', null, null, null, null, null);
INSERT INTO `model` VALUES ('247', '75C189AN', 'INTEGRADO 75C189AN', null, null, null, null, null);
INSERT INTO `model` VALUES ('248', '7805', 'TRANSISTOR 7805CV', null, null, null, null, null);
INSERT INTO `model` VALUES ('249', '7808', 'TRANSISTOR L7808CV', null, null, null, null, null);
INSERT INTO `model` VALUES ('250', '7896637614702', 'TELEFONO ALAMBRICO ANALOGICO INTELBRAS', null, null, null, null, null);
INSERT INTO `model` VALUES ('253', '7896637645928', 'TELEFONO VOIP TS60 IPR', null, null, null, null, null);
INSERT INTO `model` VALUES ('254', '7896637658058', 'CENTRAL IP DECT T60 IP', null, null, null, null, null);
INSERT INTO `model` VALUES ('255', '7896637658102', 'TELEFONO SEM FIO T60 IP', null, null, null, null, null);
INSERT INTO `model` VALUES ('256', '7906', 'TRANSISTOR 7906CT', null, null, null, null, null);
INSERT INTO `model` VALUES ('257', '7912', 'TRANSISTOR L7912CV', null, null, null, null, null);
INSERT INTO `model` VALUES ('258', '800-001-0316', 'POWER OVER ETHERNET KITS', null, null, null, null, null);
INSERT INTO `model` VALUES ('259', '81083-01', 'SPARE HEADSET CT14', null, null, null, null, null);
INSERT INTO `model` VALUES ('260', '81086-01', 'PLANTRONICS SPARE, CLIP BELT CT14', null, null, null, null, null);
INSERT INTO `model` VALUES ('261', '81087-01', 'SPARE BATTERY PACK CT14', null, null, null, null, null);
INSERT INTO `model` VALUES ('262', '83648-03', 'PLANTRONICS POWER SUPPLY 9VDC 500 mA', null, null, null, null, null);
INSERT INTO `model` VALUES ('263', '84693-11', 'PLANTRONICS CS540/HL10', null, null, null, null, null);
INSERT INTO `model` VALUES ('264', '8904133002516', 'PPM4', null, null, null, null, null);
INSERT INTO `model` VALUES ('265', '8904133003056', 'TELEFONO EON48S BLACK', null, null, null, null, null);
INSERT INTO `model` VALUES ('266', '8904133003070', 'TELEFONO EON48P BLACK', null, null, null, null, null);
INSERT INTO `model` VALUES ('267', '8904133003896', 'Matrix GSM Fixed Cellular Terminal', null, null, null, null, null);
INSERT INTO `model` VALUES ('268', '8904133004152', 'ETERNITY PE CARD VMS16', null, null, null, null, null);
INSERT INTO `model` VALUES ('269', '8904133004183', 'ETERNITY PE CARD CO4+SLT4', null, null, null, null, null);
INSERT INTO `model` VALUES ('270', '8904133004244', 'ETERNITY PE6SP US', null, null, null, null, null);
INSERT INTO `model` VALUES ('271', '8904133004602', 'ETERNITY PE CARD GSM2', null, null, null, null, null);
INSERT INTO `model` VALUES ('272', '8904133004664', 'ETERNITY PE CARD VOIP16', null, null, null, null, null);
INSERT INTO `model` VALUES ('273', '8904133006705', 'ETERNITY NE6 US', null, null, null, null, null);
INSERT INTO `model` VALUES ('274', '8904133011365', 'NAVAN CNX226 2G2 US', null, null, null, null, null);
INSERT INTO `model` VALUES ('275', '8904133013611', 'SATATYA CIBR13FL40CW & ACCESORIES', null, null, null, null, null);
INSERT INTO `model` VALUES ('276', '8904133013628', 'SATATYA CIDR13FL40CW & ACCESORIES', null, null, null, null, null);
INSERT INTO `model` VALUES ('277', '8904133013987', 'SATATYA NVR8S IN', null, null, null, null, null);
INSERT INTO `model` VALUES ('278', '8904133014373', 'COSEC COMBO FAX US', null, null, null, null, null);
INSERT INTO `model` VALUES ('279', '8VFO', 'PATCH CORD FC/PC-FC/PC 1550nm PIRELLI 20 METROS', null, null, null, null, null);
INSERT INTO `model` VALUES ('280', '9/125', 'PATCH CORD FC/PC-FC/PC DUPLEX 3METROS', null, null, null, null, null);
INSERT INTO `model` VALUES ('281', '9137430E', 'HELIOS CARD READER', null, null, null, null, null);
INSERT INTO `model` VALUES ('282', '962-00010-02 B', 'IP TELEPHONE GRANDSTREAM GXP-1200 ENTRY LEVEL', null, null, null, null, null);
INSERT INTO `model` VALUES ('284', '966-00004-13B', 'GATEWAY 4 FXS PORT GRAND STREAM VOIP ANALOG (4004)', null, null, null, null, null);
INSERT INTO `model` VALUES ('285', '966-00008-02C', 'GW 24 FXS PORT GRANDSTREAM VOIP ANALOG (GXW4024)', null, null, null, null, null);
INSERT INTO `model` VALUES ('286', '967-00009-04', 'IP CAMERA GRANDSTREAM', null, null, null, null, null);
INSERT INTO `model` VALUES ('287', '967-00052-10A002', 'CÁMARA GRANDSTREAM GXV3610_FHD', null, null, null, null, null);
INSERT INTO `model` VALUES ('288', '97B2386', 'CONECTOR RF/COAXIAL, BNC PLUG, STR, 50 ohm, CRIMP', null, null, null, null, null);
INSERT INTO `model` VALUES ('289', '97K8839', 'BOBINA DE CABLE RG58CU (50 Mts)', null, null, null, null, null);
INSERT INTO `model` VALUES ('290', '98301747.7', 'PATCH CORD FC-FC', null, null, null, null, null);
INSERT INTO `model` VALUES ('291', '9UF 125V', 'CONDENSADOR 9UF 125V', null, null, null, null, null);
INSERT INTO `model` VALUES ('292', '9UF 20V', 'CONDENSADOR 9UF 20 V', null, null, null, null, null);
INSERT INTO `model` VALUES ('293', 'AA-091A', 'OEM AC ADAPTOR', null, null, null, null, null);
INSERT INTO `model` VALUES ('294', 'AAA1820028B05', 'CPU-30BE/16', null, null, null, null, null);
INSERT INTO `model` VALUES ('295', 'AAA1820062AA02', '1 GB SEAGATE HARD DISK', null, null, null, null, null);
INSERT INTO `model` VALUES ('296', 'ADU120150', 'AC/AC PLUG IN TRANSFORMER', null, null, null, null, null);
INSERT INTO `model` VALUES ('297', 'AG-188N', 'ATA ONE LINE FXs', null, null, null, null, null);
INSERT INTO `model` VALUES ('298', 'AM7910PC', 'INTEGRADO AM7910PC', null, null, null, null, null);
INSERT INTO `model` VALUES ('299', 'APOE02-WM', 'PASSIVE POWER OVER ETHERNET', null, null, null, null, null);
INSERT INTO `model` VALUES ('300', 'AT28HC256', 'INTEGRADO AT28HC256', null, null, null, null, null);
INSERT INTO `model` VALUES ('301', 'AT29C040A', 'INTEGRADO AT29C040A', null, null, null, null, null);
INSERT INTO `model` VALUES ('302', 'ATLSP-02598-AAAA', 'TRANSFORMADOR 220VAC-5VDC', null, null, null, null, null);
INSERT INTO `model` VALUES ('303', 'ATLSP04119AAAA', 'MOCHILA ADAPTADORA', null, null, null, null, null);
INSERT INTO `model` VALUES ('304', 'AURICULAR', 'AURICULAR PUEST', null, null, null, null, null);
INSERT INTO `model` VALUES ('305', 'B00MYNX0ZI', 'BRUSHLESS DC FAN 12V 0.08A', null, null, null, null, null);
INSERT INTO `model` VALUES ('306', 'BC287', 'TRNASISTOR BC287', null, null, null, null, null);
INSERT INTO `model` VALUES ('307', 'BD201', 'TRANSISTOR BD201', null, null, null, null, null);
INSERT INTO `model` VALUES ('308', 'BOBINAS IEC IER', 'BOBINAS DE ACOPLAMIENTO', null, null, null, null, null);
INSERT INTO `model` VALUES ('309', 'C01', 'C01 CALL CENTER PHONE', null, null, null, null, null);
INSERT INTO `model` VALUES ('310', 'C10', 'EXPANSIÓN MODULE', null, null, null, null, null);
INSERT INTO `model` VALUES ('311', 'C2007B', 'PASSIVE PoE KIT BLACK', null, null, null, null, null);
INSERT INTO `model` VALUES ('312', 'C56HP', 'C56HP PHONE', null, null, null, null, null);
INSERT INTO `model` VALUES ('313', 'C56P', 'C56P PHONE', null, null, null, null, null);
INSERT INTO `model` VALUES ('314', 'C58P', 'FANVIL IP PHONE', null, null, null, null, null);
INSERT INTO `model` VALUES ('315', 'C62P', 'FANVIL IP PHONE C62P', null, null, null, null, null);
INSERT INTO `model` VALUES ('316', 'C66P', 'C66IP PHONE', null, null, null, null, null);
INSERT INTO `model` VALUES ('317', 'C88E000208', 'TAPAS CONECTOR DB50', null, null, null, null, null);
INSERT INTO `model` VALUES ('318', 'CABLE M26X', 'CABLE FXS M26X', null, null, null, null, null);
INSERT INTO `model` VALUES ('319', 'CAMSX', 'CAMARA PORTEROS SURIX', null, null, null, null, null);
INSERT INTO `model` VALUES ('320', 'CASCOS', 'CASCOS PARA INSTALACIONES', null, null, null, null, null);
INSERT INTO `model` VALUES ('321', 'CC364A', 'LASERJET', null, null, null, null, null);
INSERT INTO `model` VALUES ('322', 'CCR2-5/16', 'TERMINAL DE DOBLE OJO 2 AWG -5/16', null, null, null, null, null);
INSERT INTO `model` VALUES ('323', 'CDV-3VM800', 'IP CAMERA POE 2M 1080P HD VANDAL DOME CMOS FINE', null, null, null, null, null);
INSERT INTO `model` VALUES ('324', 'CHALECOS', 'CHALECOS REFLECTORES', null, null, null, null, null);
INSERT INTO `model` VALUES ('325', 'COD-PRUEBA12', 'NOMBRE_PRUEBA', null, null, null, null, null);
INSERT INTO `model` VALUES ('326', 'CODEJEMPLO', 'EJEMPLO', null, null, null, null, null);
INSERT INTO `model` VALUES ('327', 'codigo-prueba2', 'MODELO PRUEBA2', null, null, null, null, null);
INSERT INTO `model` VALUES ('328', 'CODIGOPRUEBA', 'SADASD', null, null, null, null, null);
INSERT INTO `model` VALUES ('329', 'CODIGOPRUEBA2', 'PRUEBA2', null, null, null, null, null);
INSERT INTO `model` VALUES ('330', 'CODIGOPRUEBA4', 'PRUEBA3', null, null, null, null, null);
INSERT INTO `model` VALUES ('331', 'CODIGOPRUEBA5', 'MODELOPRUEBA', null, null, null, null, null);
INSERT INTO `model` VALUES ('332', 'CT14', 'CT14 CORDLESS HEADSET PHONE', null, null, null, null, null);
INSERT INTO `model` VALUES ('333', 'D43256BCZ', 'INTEGRADO D43256BCZ', null, null, null, null, null);
INSERT INTO `model` VALUES ('334', 'D800', 'FANVIL VIDEO IP PHONE', null, null, null, null, null);
INSERT INTO `model` VALUES ('335', 'D900', 'FANVIL VIDEO PHONE', null, null, null, null, null);
INSERT INTO `model` VALUES ('336', 'DT1E8', 'PATCHCORD FIBRA OPTICA', null, null, null, null, null);
INSERT INTO `model` VALUES ('337', 'DXN5011S', 'CAJA DEXSON TOMA/MULTIPLE INSTALACION', null, null, null, null, null);
INSERT INTO `model` VALUES ('338', 'E209234', 'CABLE FIBRA OPTICA', null, null, null, null, null);
INSERT INTO `model` VALUES ('339', 'EF7910JLD', 'INTEGRADO EF7910JLD', null, null, null, null, null);
INSERT INTO `model` VALUES ('340', 'EPD-5818', 'POE EPD-5818 ENGENIUS', null, null, null, null, null);
INSERT INTO `model` VALUES ('341', 'F52054-000', 'PATCH CORD LC-FC 3M ( TYCO Electronic )', null, null, null, null, null);
INSERT INTO `model` VALUES ('342', 'GPSU15B-8', 'SWITCHING POWER SPPLY', null, null, null, null, null);
INSERT INTO `model` VALUES ('343', 'HD63C09EP', 'INTEGRADO HD63C09EP', null, null, null, null, null);
INSERT INTO `model` VALUES ('344', 'HOLA2', 'ASASDS', null, null, null, null, null);
INSERT INTO `model` VALUES ('345', 'hola3', '212', null, null, null, null, null);
INSERT INTO `model` VALUES ('346', 'HOLASOCKET', 'HOLASOCKET', null, null, null, null, null);
INSERT INTO `model` VALUES ('347', 'HSB 50', 'Telefone Headset ( con diadema-un auricular )', null, null, null, null, null);
INSERT INTO `model` VALUES ('348', 'IDWHOM1P', 'WALLPLUG ENCLOSURE FOR OM1P', null, null, null, null, null);
INSERT INTO `model` VALUES ('349', 'IES1008AA', '10/100 Fast Ethernet Switch', null, null, null, null, null);
INSERT INTO `model` VALUES ('350', 'IL03DBRL50DBSCST', 'PATCH CORD FIBRA SC-ST DUPLEX SINGLE-MODE', null, null, null, null, null);
INSERT INTO `model` VALUES ('351', 'IP GATEWAY', 'ATA', null, null, null, null, null);
INSERT INTO `model` VALUES ('352', 'IP-AX-M', 'SURIX 1 BOTON EMBUTIR', null, null, null, null, null);
INSERT INTO `model` VALUES ('353', 'IP-AX-T', 'SURIX 1 BOTON EXTERIOR', null, null, null, null, null);
INSERT INTO `model` VALUES ('354', 'IP-AXTT-M', 'SURIX C/TECLADO EMBUTIR', null, null, null, null, null);
INSERT INTO `model` VALUES ('355', 'IP-AXTT-T', 'SURIX EXTERIOR C/TECLADO', null, null, null, null, null);
INSERT INTO `model` VALUES ('356', 'IP-Ti-T', 'SURIX TITANIUM 1 BOTON', null, null, null, null, null);
INSERT INTO `model` VALUES ('357', 'IPAX1', 'PULSADORES DIRECTOS SURIX', null, null, null, null, null);
INSERT INTO `model` VALUES ('358', 'K14', 'BIOMETRICO ZKTECO', null, null, null, null, null);
INSERT INTO `model` VALUES ('359', 'K9852RF', 'TECLADO MOUSE INALAMBRICO', null, null, null, null, null);
INSERT INTO `model` VALUES ('360', 'KCS10', 'CABEZAL BELCONN', null, null, null, null, null);
INSERT INTO `model` VALUES ('361', 'KCS10N', 'REGLETA BELCONN', null, null, null, null, null);
INSERT INTO `model` VALUES ('362', 'KX-TS500LXB', 'TELEFONO ANALOGICO PANASONIC', null, null, null, null, null);
INSERT INTO `model` VALUES ('363', 'KXTY', 'TELEFONO PANAPHONE', null, null, null, null, null);
INSERT INTO `model` VALUES ('364', 'LL/M', 'LLAVEROS MAGNETICOS', null, null, null, null, null);
INSERT INTO `model` VALUES ('365', 'LM333', 'TRANSISTOR LM333T', null, null, null, null, null);
INSERT INTO `model` VALUES ('366', 'LR79574', 'CHASE RESEARCH', null, null, null, null, null);
INSERT INTO `model` VALUES ('367', 'M-545', 'MOLDE PARA SOLDE', null, null, null, null, null);
INSERT INTO `model` VALUES ('368', 'M21-500-499-TB', 'CINTA BRADY', null, null, null, null, null);
INSERT INTO `model` VALUES ('369', 'M21-750-499', 'CINTA BRADY', null, null, null, null, null);
INSERT INTO `model` VALUES ('370', 'M32', 'CRIMPING TOOL FOR F/BNC/RCA', null, null, null, null, null);
INSERT INTO `model` VALUES ('371', 'M5M5256', 'INTEGRADO M5M5256', null, null, null, null, null);
INSERT INTO `model` VALUES ('372', 'MC14002BCLD', 'INTEGRADO MC14002BCLD', null, null, null, null, null);
INSERT INTO `model` VALUES ('373', 'MC1489P', 'INTEGRADO MC1489P', null, null, null, null, null);
INSERT INTO `model` VALUES ('374', 'MC54HC273AJ', 'INTEGRADO MC54HC273AJ', null, null, null, null, null);
INSERT INTO `model` VALUES ('375', 'MC68901P', 'INTEGRADO MC68901P', null, null, null, null, null);
INSERT INTO `model` VALUES ('376', 'MD12W', 'RF-ID READER WIEGAND', null, null, null, null, null);
INSERT INTO `model` VALUES ('377', 'MHC3000', 'UPS FIRMESA 3000', null, null, null, null, null);
INSERT INTO `model` VALUES ('378', 'MP-5609-60', 'CABLE TWINAX / TRIAX MACHO - TWINAX/ TRIAX  MACHO', null, null, null, null, null);
INSERT INTO `model` VALUES ('379', 'MQ01ABD100', 'DISK DRIVE TOSHIBA 1TB', null, null, null, null, null);
INSERT INTO `model` VALUES ('380', 'MR500', 'MR500 DUAL BAND 802.11N MESH ROUTER', null, null, null, null, null);
INSERT INTO `model` VALUES ('381', 'MRD-308DS', 'TELEPHONE HEADSET - DOS AURICULARES MAS MICROFONO', null, null, null, null, null);
INSERT INTO `model` VALUES ('382', 'MRD-308S', 'TELEPHONE HEADSET - UN AURICULAR MAS MICROFONO', null, null, null, null, null);
INSERT INTO `model` VALUES ('383', 'MRD-MT001', 'ALMOHADILLAS PARA MICROFONO', null, null, null, null, null);
INSERT INTO `model` VALUES ('384', 'MRD-QD001', 'HEADSET CONNECTING CORD - PC 3.5 MM DOBLE', null, null, null, null, null);
INSERT INTO `model` VALUES ('385', 'MRD-QD002', 'HEADSET CONNECTING CORD - CONECTOR RJ9', null, null, null, null, null);
INSERT INTO `model` VALUES ('386', 'MRD-QD002( A )', 'HEADSET CONNECTING CORD - CONECTOR RJ9', null, null, null, null, null);
INSERT INTO `model` VALUES ('387', 'MRD-QD002( C )', 'HEADSET CONNECTING CORD - CONECTOR RJ9', null, null, null, null, null);
INSERT INTO `model` VALUES ('388', 'MRD-QD006', 'Y TRAINING CORD/ Y CABLE WITH QD PLUG', null, null, null, null, null);
INSERT INTO `model` VALUES ('389', 'MRD-QD008', 'TRAINING CABLE (Y CABLE) WITH QD PLUG AND VOLUMEN', null, null, null, null, null);
INSERT INTO `model` VALUES ('390', 'MRD-QD011', 'HEADSET CONNECTING CORD - PLUG 2.5 mm', null, null, null, null, null);
INSERT INTO `model` VALUES ('391', 'MRD-QD012', 'HEADSET CONNECTING CORD - PLUG 3.5 mm', null, null, null, null, null);
INSERT INTO `model` VALUES ('392', 'MRD-RT004', 'ESPONJAS PARA AURICULAR', null, null, null, null, null);
INSERT INTO `model` VALUES ('393', 'MRD-USB', 'HEADSET CONNECTING CORD - CONECTOR USB', null, null, null, null, null);
INSERT INTO `model` VALUES ('394', 'MS2EP-EP', 'PATCH CORD ST/ST 8FT 2.5 M', null, null, null, null, null);
INSERT INTO `model` VALUES ('395', 'NPC-6203', 'PACHT CORD 3FT CAT 6 AZUL', null, null, null, null, null);
INSERT INTO `model` VALUES ('396', 'NPD-5818', 'POE NPD-5818', null, null, null, null, null);
INSERT INTO `model` VALUES ('397', 'NSC810AN-3I', 'INTEGRADO NSC810AN-3I', null, null, null, null, null);
INSERT INTO `model` VALUES ('398', 'OCJ-T-F1-05MASCA-F1', 'PATCH CORD FC/PC-FC/PC', null, null, null, null, null);
INSERT INTO `model` VALUES ('399', 'OCJ-T-F1-OSMASCA-F1', 'PATCH CORD MONOMODO FC/FC 2.4mm 5M', null, null, null, null, null);
INSERT INTO `model` VALUES ('400', 'OCP-T-F1-03MASCA-XX', 'PIGTAIL FIBRA FC', null, null, null, null, null);
INSERT INTO `model` VALUES ('401', 'OCP-U-F0-03MASEN-XX', 'PIGTAIL FC', null, null, null, null, null);
INSERT INTO `model` VALUES ('402', 'ODHOM1P', 'OUTDOOR HOUSING FOR OM1P', null, null, null, null, null);
INSERT INTO `model` VALUES ('403', 'OM1P', 'PROFESSIONAL MESH ROUTER WIRELESS', null, null, null, null, null);
INSERT INTO `model` VALUES ('404', 'OM1P US', 'PROFESSIONAL MINI ROUTER US PLUGS', null, null, null, null, null);
INSERT INTO `model` VALUES ('405', 'OM2P', 'OM2P ROUTER', null, null, null, null, null);
INSERT INTO `model` VALUES ('406', 'OM2P-HS v2', 'OM2P ROUTER', null, null, null, null, null);
INSERT INTO `model` VALUES ('407', 'OMYA-NEE-38', 'SPRAY OMYA QUICK DRYING', null, null, null, null, null);
INSERT INTO `model` VALUES ('408', 'P-1091', 'CAJA DEXSON TOMA/MULTIPLE 55mm', null, null, null, null, null);
INSERT INTO `model` VALUES ('409', 'P-20021447', 'PATCH CORD FC/UPC-FC/UPC 5 METROS', null, null, null, null, null);
INSERT INTO `model` VALUES ('410', 'P80C31BH', 'INTEGRADO P80C31BH', null, null, null, null, null);
INSERT INTO `model` VALUES ('411', 'P80C88A-2', 'INTEGRADO P80C88A-2', null, null, null, null, null);
INSERT INTO `model` VALUES ('412', 'P9452BJ', 'INTEGRADO P9452BJ', null, null, null, null, null);
INSERT INTO `model` VALUES ('413', 'PAL20X8ACNS', 'INTEGRADO PAL20X8ACNS', null, null, null, null, null);
INSERT INTO `model` VALUES ('414', 'PAL32VX10ACJS', 'INTEGRADO PAL32VX10ACJS', null, null, null, null, null);
INSERT INTO `model` VALUES ('415', 'PB8000', 'LOGIC CONTROLS GPE652-12500W', null, null, null, null, null);
INSERT INTO `model` VALUES ('416', 'PEB2085P', 'INTEGRADO PEB2085P', null, null, null, null, null);
INSERT INTO `model` VALUES ('417', 'POEPASS-01', 'PASSIVE POE KIT', null, null, null, null, null);
INSERT INTO `model` VALUES ('418', 'PRODUCT-001-PR', 'ESTABILIZADOR', null, null, null, null, null);
INSERT INTO `model` VALUES ('419', 'PRUEBA', 'PRUEBA', null, null, null, null, null);
INSERT INTO `model` VALUES ('420', 'PRUEBA12', 'PRUEBA12', null, null, null, null, null);
INSERT INTO `model` VALUES ('421', 'PRUEBA13', 'PRUEBA13', null, null, null, null, null);
INSERT INTO `model` VALUES ('422', 'PRUEBA134', 'PRUEBA14', null, null, null, null, null);
INSERT INTO `model` VALUES ('423', 'pruebamodelo1', 'pruebamodelo1', null, null, null, null, null);
INSERT INTO `model` VALUES ('424', 'PRUEBAXYZ', 'NOMBREXYZ', null, null, null, null, null);
INSERT INTO `model` VALUES ('425', 'PRUEBILLA', '2321321', null, null, null, null, null);
INSERT INTO `model` VALUES ('426', 'pruebilla2', 'pruebilla2', null, null, null, null, null);
INSERT INTO `model` VALUES ('427', 'pruebilla3', 'p3', null, null, null, null, null);
INSERT INTO `model` VALUES ('428', 'PS12VUS', 'POWER SUPPLY', null, null, null, null, null);
INSERT INTO `model` VALUES ('429', 'PS18VUS', 'POWER SUPPLY 18V 1A  ( SAW24-138-1500)', null, null, null, null, null);
INSERT INTO `model` VALUES ('430', 'PS24VINT', 'AC/DC ADAPTER 24V 1000mA', null, null, null, null, null);
INSERT INTO `model` VALUES ('431', 'PST-1908', 'PACHT PANEL 24P CAT 5E', null, null, null, null, null);
INSERT INTO `model` VALUES ('432', 'QX\'0200\'0000', 'QX200', null, null, null, null, null);
INSERT INTO `model` VALUES ('433', 'QX\'0FXO\'0400', 'QXFX04', null, null, null, null, null);
INSERT INTO `model` VALUES ('434', 'QX\'0RMK\'0000', 'QX RACK KIT', null, null, null, null, null);
INSERT INTO `model` VALUES ('435', 'QX-0050-0000', 'QX50', null, null, null, null, null);
INSERT INTO `model` VALUES ('436', 'RMN4018A', 'MICROFONO/AURIC', null, null, null, null, null);
INSERT INTO `model` VALUES ('437', 'SASY-MICRO-0300-0100', 'QUADRO FXO', null, null, null, null, null);
INSERT INTO `model` VALUES ('438', 'SASY-MICRO-0300-0300', 'QUADRO 6L w/KSE', null, null, null, null, null);
INSERT INTO `model` VALUES ('439', 'SASY-MICRO-0501-1002', 'QUADRO 4L', null, null, null, null, null);
INSERT INTO `model` VALUES ('440', 'SASY-MICRO-0501-1101', 'QUADRO 2x2', null, null, null, null, null);
INSERT INTO `model` VALUES ('441', 'SASY-MIDI-0201-1000', 'QUADRO M26X', null, null, null, null, null);
INSERT INTO `model` VALUES ('442', 'SASY-SOHO-0103-1101', 'QUADRO 4X/4 FXO', null, null, null, null, null);
INSERT INTO `model` VALUES ('443', 'SDCFBI-32-201-80', 'COMPACTFLASH', null, null, null, null, null);
INSERT INTO `model` VALUES ('444', 'SETU VG8', 'Matrix Voip GSM Gateway', null, null, null, null, null);
INSERT INTO `model` VALUES ('445', 'SF 100-16', 'SWITCH CISCO SMALL BUSINESS', null, null, null, null, null);
INSERT INTO `model` VALUES ('446', 'SF200-24P', 'CISCO  24-PORT 10/100 PoE', null, null, null, null, null);
INSERT INTO `model` VALUES ('447', 'SF200-48P', 'CISCO 48-PORT 10/100PoE', null, null, null, null, null);
INSERT INTO `model` VALUES ('448', 'SFP-401101', 'FLAT FACE PLATE 1 PORT WHITE', null, null, null, null, null);
INSERT INTO `model` VALUES ('449', 'SG-001', 'MODELO PRUEBA', null, null, null, null, null);
INSERT INTO `model` VALUES ('450', 'SH-J023', 'CONNECTION ( MULTITOMA )', null, null, null, null, null);
INSERT INTO `model` VALUES ('451', 'SIP-T20P', 'YEALINK ENTERPRISE IP PHONE SIP-T20', null, null, null, null, null);
INSERT INTO `model` VALUES ('452', 'SIP-T26P', 'ENTERPRISE IP PHONE T26', null, null, null, null, null);
INSERT INTO `model` VALUES ('453', 'SIP-T28P', 'YEALINK ENTERPRISE IP PHONE SIP-T28', null, null, null, null, null);
INSERT INTO `model` VALUES ('454', 'SIP-T38G', 'GIGABIT COLOR IP PHONE SIP-T38G', null, null, null, null, null);
INSERT INTO `model` VALUES ('455', 'SKJ-XA3111', 'JACK TOOLESS CAT6A AZULES', null, null, null, null, null);
INSERT INTO `model` VALUES ('456', 'SKJXA3111', 'JACK TOOLESS CAT6A BLANCOS', null, null, null, null, null);
INSERT INTO `model` VALUES ('457', 'SKU:23067', 'WIRE STRAP ANTI-STATIC', null, null, null, null, null);
INSERT INTO `model` VALUES ('458', 'SL0CM023024', 'ORDENADOR CABLE MANAGEMENT 2U PLASTIC', null, null, null, null, null);
INSERT INTO `model` VALUES ('459', 'SL0PP2412U101', 'UTP BLANK PACTH PANEL MODULAR 24 PORTS', null, null, null, null, null);
INSERT INTO `model` VALUES ('460', 'SL5KJU0011201', 'JACK 110 CAT5E', null, null, null, null, null);
INSERT INTO `model` VALUES ('461', 'SL6APC2617102', 'PACHT CORD 7FT CAT6A BLANCO', null, null, null, null, null);
INSERT INTO `model` VALUES ('462', 'SL6APC26271006', 'PACHT CORD 2FT CAT6A AZUL', null, null, null, null, null);
INSERT INTO `model` VALUES ('463', 'SL6APC2627101', 'SHIELDES PACTCH CORD CAT 6A 3FT AZUL', null, null, null, null, null);
INSERT INTO `model` VALUES ('464', 'SM-J500M/DS', 'SAMSUNG Galaxy J5', null, null, null, null, null);
INSERT INTO `model` VALUES ('465', 'SNOM 870', 'SNOM VOIP PHONES', null, null, null, null, null);
INSERT INTO `model` VALUES ('466', 'SNP-3120VHN/DC', '12x Vandal resistant Network PTZ Camera', null, null, null, null, null);
INSERT INTO `model` VALUES ('467', 'SP-24PP-C6', 'PATCH PANEL MODULAR UTP 24P ORGAN.', null, null, null, null, null);
INSERT INTO `model` VALUES ('468', 'SP-BC6A-ULS', 'BOBINA CABLE U/UTP 4 P 23AWG CAT 6A LSZH LOW SMOKE', null, null, null, null, null);
INSERT INTO `model` VALUES ('469', 'ST-SC', 'PATCH CORD ST-SC DUPLEX SINGLE-MODE 10 METROS', null, null, null, null, null);
INSERT INTO `model` VALUES ('470', 'ST32122A', '2 GB SEAGATE HARD DISK', null, null, null, null, null);
INSERT INTO `model` VALUES ('471', 'STTC-101', 'REPLACEABLE TIP CARTRIDGE', null, null, null, null, null);
INSERT INTO `model` VALUES ('472', 'SXWE02-20-W', 'SURIX WANG PAGE', null, null, null, null, null);
INSERT INTO `model` VALUES ('473', 'T/M', 'TARJETAS MAGNETICAS', null, null, null, null, null);
INSERT INTO `model` VALUES ('474', 'T122000-24W', 'AC/DC ADAPTER 12V 2A', null, null, null, null, null);
INSERT INTO `model` VALUES ('476', 'TDR', 'TALADRO', null, null, null, null, null);
INSERT INTO `model` VALUES ('477', 'TIP41', 'TRANSISTOR TIP41', null, null, null, null, null);
INSERT INTO `model` VALUES ('478', 'TIP42', 'TRANSISTOR TIP42', null, null, null, null, null);
INSERT INTO `model` VALUES ('479', 'TRPDG1LXDABS-ALB', 'SFP TRANSCEIVER', null, null, null, null, null);
INSERT INTO `model` VALUES ('480', 'TS 30 ID', 'TELEFONO INALAMBRICO DIGITAL TS 30 ID', null, null, null, null, null);
INSERT INTO `model` VALUES ('481', 'TS 3522', 'TELÉFONO INALAMBRICO', null, null, null, null, null);
INSERT INTO `model` VALUES ('482', 'TS 3530', 'TELEFONO INALAMBRICO 3530 INTELBRAS', null, null, null, null, null);
INSERT INTO `model` VALUES ('484', 'TS 3533', 'TELEFONO INALAMBRICO TS 3533', null, null, null, null, null);
INSERT INTO `model` VALUES ('485', 'TYPE 32', 'TERMINAL POCKET', null, null, null, null, null);
INSERT INTO `model` VALUES ('486', 'U2200-07800-160', 'POLYCOM SOUNDSTATION 2W DECT 6,0 OPEN BOX', null, null, null, null, null);
INSERT INTO `model` VALUES ('487', 'ULT31418', 'ANTI-STATIC WRIST STRAP BRACELET ANTISTATIQUE', null, null, null, null, null);
INSERT INTO `model` VALUES ('488', 'undefined', 'undefined', null, null, null, null, null);
INSERT INTO `model` VALUES ('489', 'UNSP2000000002', 'PASS 25', null, null, null, null, null);
INSERT INTO `model` VALUES ('490', 'USB PHONE', 'USB WIRELESS PHONE', null, null, null, null, null);
INSERT INTO `model` VALUES ('491', 'VBCPO34XEX', 'SOPORTE CAMARA SAMSUNG SBP-300WM', null, null, null, null, null);
INSERT INTO `model` VALUES ('492', 'VERSATIS M250 LA', 'TELEFONO INALAMBRICO ALCATEL VERSATIS M250', null, null, null, null, null);
INSERT INTO `model` VALUES ('493', 'VGFX QB GSM', 'ANTENA GSM MULTIBANDA SETU VGFX', null, null, null, null, null);
INSERT INTO `model` VALUES ('494', 'VP-2009', 'IP VIDEO PHONE YEALINK VP-2009', null, null, null, null, null);
INSERT INTO `model` VALUES ('495', 'WD10PURX-64E5EY0', 'SATA/64MB Cache WD10PURX (1.0 TB)', null, null, null, null, null);
INSERT INTO `model` VALUES ('496', 'X0001MGLP1', 'PIN GROUNDING BLOCK', null, null, null, null, null);
INSERT INTO `model` VALUES ('497', 'X000B1SL7D', 'CARRIER PoE ADAPTER NANOSTATION', null, null, null, null, null);
INSERT INTO `model` VALUES ('498', 'X000G810R9', 'PASSIVE PoE KIT BLACK', null, null, null, null, null);
INSERT INTO `model` VALUES ('499', 'X000MABWIN', 'CASE FAN, 40X40X10 mm, Ball Bearing, 3 pin', null, null, null, null, null);
INSERT INTO `model` VALUES ('500', 'X00154FMQD', 'PASSIVE PoE KIT BLACK', null, null, null, null, null);
INSERT INTO `model` VALUES ('501', 'X3', 'FANVIL IP PHONE X3', null, null, null, null, null);
INSERT INTO `model` VALUES ('502', 'YHS32', 'HEADSET YEALINK', null, null, null, null, null);
INSERT INTO `model` VALUES ('503', 'Z-230PJ', 'DSL FILTER EXCELSUS SIMPLE', null, null, null, null, null);
INSERT INTO `model` VALUES ('504', 'Z9530003901A', 'FUENTE PARA CAMARA SAMSUNG 24V 2.5A', null, null, null, null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of price
-- ----------------------------
INSERT INTO `price` VALUES ('1', '28', '25.00', '1', '4');
INSERT INTO `price` VALUES ('2', '1', '50.00', '1', '4');

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
) ENGINE=InnoDB AUTO_INCREMENT=24102 DEFAULT CHARSET=latin1;

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
INSERT INTO `product` VALUES ('23707', 'S/N', '7', '13', '24');
INSERT INTO `product` VALUES ('23708', 'S/N', '7', '13', '24');
INSERT INTO `product` VALUES ('23709', 'S/N', '7', '13', '24');
INSERT INTO `product` VALUES ('23710', 'S/N', '7', '13', '24');
INSERT INTO `product` VALUES ('23711', 'S/N', '7', '13', '24');
INSERT INTO `product` VALUES ('23712', 'S/N', '7', '13', '24');
INSERT INTO `product` VALUES ('23713', 'S/N', '7', '13', '24');
INSERT INTO `product` VALUES ('23714', 'S/N', '7', '13', '24');
INSERT INTO `product` VALUES ('23715', 'S/N', '7', '13', '24');
INSERT INTO `product` VALUES ('23716', 'S/N', '7', '13', '24');
INSERT INTO `product` VALUES ('23717', 'S/N', '7', '13', '24');
INSERT INTO `product` VALUES ('23718', 'S/N', '7', '13', '24');
INSERT INTO `product` VALUES ('23719', 'S/N', '7', '13', '24');
INSERT INTO `product` VALUES ('23720', 'S/N', '7', '13', '24');
INSERT INTO `product` VALUES ('23721', 'S/N', '7', '13', '24');
INSERT INTO `product` VALUES ('23722', 'S/N', '7', '13', '24');
INSERT INTO `product` VALUES ('23723', 'S/N', '7', '13', '24');
INSERT INTO `product` VALUES ('23724', 'S/N', '7', '13', '24');
INSERT INTO `product` VALUES ('23725', 'S/N', '7', '13', '24');
INSERT INTO `product` VALUES ('23726', 'S/N', '7', '13', '24');
INSERT INTO `product` VALUES ('23727', 'S/N', '7', '13', '24');
INSERT INTO `product` VALUES ('23728', 'S/N', '7', '13', '24');
INSERT INTO `product` VALUES ('23729', 'S/N', '7', '13', '24');
INSERT INTO `product` VALUES ('23730', 'S/N', '7', '13', '24');
INSERT INTO `product` VALUES ('23731', 'S/N', '7', '13', '24');
INSERT INTO `product` VALUES ('23732', 'S/N', '9', '13', '24');
INSERT INTO `product` VALUES ('23733', 'S/N', '9', '13', '24');
INSERT INTO `product` VALUES ('23734', 'S/N', '9', '13', '24');
INSERT INTO `product` VALUES ('23735', 'S/N', '9', '13', '24');
INSERT INTO `product` VALUES ('23736', 'S/N', '9', '13', '24');
INSERT INTO `product` VALUES ('23737', 'S/N', '9', '13', '24');
INSERT INTO `product` VALUES ('23738', 'S/N', '9', '13', '24');
INSERT INTO `product` VALUES ('23739', 'S/N', '9', '13', '24');
INSERT INTO `product` VALUES ('23740', 'S/N', '9', '13', '24');
INSERT INTO `product` VALUES ('23741', 'S/N', '9', '13', '24');
INSERT INTO `product` VALUES ('23742', 'S/N', '9', '13', '24');
INSERT INTO `product` VALUES ('23743', 'S/N', '9', '13', '24');
INSERT INTO `product` VALUES ('23744', 'S/N', '9', '13', '24');
INSERT INTO `product` VALUES ('23745', 'S/N', '9', '13', '24');
INSERT INTO `product` VALUES ('23746', 'S/N', '9', '13', '24');
INSERT INTO `product` VALUES ('23747', 'S/N', '9', '13', '24');
INSERT INTO `product` VALUES ('23748', 'S/N', '9', '13', '24');
INSERT INTO `product` VALUES ('23749', 'S/N', '9', '13', '24');
INSERT INTO `product` VALUES ('23750', 'S/N', '9', '13', '24');
INSERT INTO `product` VALUES ('23751', 'S/N', '9', '13', '24');
INSERT INTO `product` VALUES ('23752', 'S/N', '32', '13', '24');
INSERT INTO `product` VALUES ('23753', 'S/N', '32', '13', '24');
INSERT INTO `product` VALUES ('23754', 'S/N', '32', '13', '24');
INSERT INTO `product` VALUES ('23755', 'S/N', '32', '13', '24');
INSERT INTO `product` VALUES ('23756', 'S/N', '32', '13', '24');
INSERT INTO `product` VALUES ('23757', 'S/N', '32', '13', '24');
INSERT INTO `product` VALUES ('23758', 'S/N', '32', '13', '24');
INSERT INTO `product` VALUES ('23759', 'S/N', '32', '13', '24');
INSERT INTO `product` VALUES ('23760', 'S/N', '32', '13', '24');
INSERT INTO `product` VALUES ('23761', 'S/N', '32', '13', '24');
INSERT INTO `product` VALUES ('23762', 'S/N', '32', '13', '24');
INSERT INTO `product` VALUES ('23763', 'S/N', '32', '13', '24');
INSERT INTO `product` VALUES ('23764', 'S/N', '32', '13', '24');
INSERT INTO `product` VALUES ('23765', 'S/N', '32', '13', '24');
INSERT INTO `product` VALUES ('23766', 'S/N', '32', '13', '24');
INSERT INTO `product` VALUES ('23767', 'S/N', '32', '13', '24');
INSERT INTO `product` VALUES ('23768', 'S/N', '32', '13', '24');
INSERT INTO `product` VALUES ('23769', 'S/N', '32', '13', '24');
INSERT INTO `product` VALUES ('23770', 'S/N', '32', '13', '24');
INSERT INTO `product` VALUES ('23771', 'S/N', '32', '13', '24');
INSERT INTO `product` VALUES ('23772', 'S/N', '12', '13', '24');
INSERT INTO `product` VALUES ('23773', 'S/N', '12', '13', '24');
INSERT INTO `product` VALUES ('23774', 'S/N', '12', '13', '24');
INSERT INTO `product` VALUES ('23775', 'S/N', '12', '13', '24');
INSERT INTO `product` VALUES ('23776', 'S/N', '12', '13', '24');
INSERT INTO `product` VALUES ('23777', 'S/N', '12', '13', '24');
INSERT INTO `product` VALUES ('23778', 'S/N', '12', '13', '24');
INSERT INTO `product` VALUES ('23779', 'S/N', '12', '13', '24');
INSERT INTO `product` VALUES ('23780', 'S/N', '12', '13', '24');
INSERT INTO `product` VALUES ('23781', 'S/N', '12', '13', '24');
INSERT INTO `product` VALUES ('23782', 'S/N', '12', '13', '24');
INSERT INTO `product` VALUES ('23783', 'S/N', '12', '13', '24');
INSERT INTO `product` VALUES ('23784', 'S/N', '12', '13', '24');
INSERT INTO `product` VALUES ('23785', 'S/N', '12', '13', '24');
INSERT INTO `product` VALUES ('23786', 'S/N', '12', '13', '24');
INSERT INTO `product` VALUES ('23787', 'S/N', '12', '13', '24');
INSERT INTO `product` VALUES ('23788', 'S/N', '12', '13', '24');
INSERT INTO `product` VALUES ('23789', 'S/N', '12', '13', '24');
INSERT INTO `product` VALUES ('23790', 'S/N', '12', '13', '24');
INSERT INTO `product` VALUES ('23791', 'S/N', '12', '13', '24');
INSERT INTO `product` VALUES ('23792', 'S/N', '15', '13', '24');
INSERT INTO `product` VALUES ('23793', 'S/N', '15', '13', '24');
INSERT INTO `product` VALUES ('23794', 'S/N', '15', '13', '24');
INSERT INTO `product` VALUES ('23795', 'S/N', '15', '13', '24');
INSERT INTO `product` VALUES ('23796', 'S/N', '15', '13', '24');
INSERT INTO `product` VALUES ('23797', 'S/N', '15', '13', '24');
INSERT INTO `product` VALUES ('23798', 'S/N', '15', '13', '24');
INSERT INTO `product` VALUES ('23799', 'S/N', '15', '13', '24');
INSERT INTO `product` VALUES ('23800', 'S/N', '15', '13', '24');
INSERT INTO `product` VALUES ('23801', 'S/N', '15', '13', '24');
INSERT INTO `product` VALUES ('23802', 'S/N', '15', '13', '24');
INSERT INTO `product` VALUES ('23803', 'S/N', '15', '13', '24');
INSERT INTO `product` VALUES ('23804', 'S/N', '15', '13', '24');
INSERT INTO `product` VALUES ('23805', 'S/N', '15', '13', '24');
INSERT INTO `product` VALUES ('23806', 'S/N', '15', '13', '24');
INSERT INTO `product` VALUES ('23807', 'S/N', '364', '13', '24');
INSERT INTO `product` VALUES ('23808', 'S/N', '364', '13', '24');
INSERT INTO `product` VALUES ('23809', 'S/N', '364', '13', '24');
INSERT INTO `product` VALUES ('23810', 'S/N', '364', '13', '24');
INSERT INTO `product` VALUES ('23811', 'S/N', '364', '13', '24');
INSERT INTO `product` VALUES ('23812', 'S/N', '364', '13', '24');
INSERT INTO `product` VALUES ('23813', 'S/N', '364', '13', '24');
INSERT INTO `product` VALUES ('23814', 'S/N', '364', '13', '24');
INSERT INTO `product` VALUES ('23815', 'S/N', '364', '13', '24');
INSERT INTO `product` VALUES ('23816', 'S/N', '364', '13', '24');
INSERT INTO `product` VALUES ('23817', 'S/N', '364', '13', '24');
INSERT INTO `product` VALUES ('23818', 'S/N', '364', '13', '24');
INSERT INTO `product` VALUES ('23819', 'S/N', '364', '13', '24');
INSERT INTO `product` VALUES ('23820', 'S/N', '364', '13', '24');
INSERT INTO `product` VALUES ('23821', 'S/N', '364', '13', '24');
INSERT INTO `product` VALUES ('23822', 'S/N', '20', '13', '24');
INSERT INTO `product` VALUES ('23823', 'S/N', '20', '13', '24');
INSERT INTO `product` VALUES ('23824', 'S/N', '20', '13', '24');
INSERT INTO `product` VALUES ('23825', 'S/N', '20', '13', '24');
INSERT INTO `product` VALUES ('23826', 'S/N', '20', '13', '24');
INSERT INTO `product` VALUES ('23827', 'S/N', '20', '13', '24');
INSERT INTO `product` VALUES ('23828', 'S/N', '20', '13', '24');
INSERT INTO `product` VALUES ('23829', 'S/N', '20', '13', '24');
INSERT INTO `product` VALUES ('23830', 'S/N', '20', '13', '24');
INSERT INTO `product` VALUES ('23831', 'S/N', '20', '13', '24');
INSERT INTO `product` VALUES ('23832', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23833', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23834', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23835', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23836', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23837', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23838', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23839', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23840', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23841', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23842', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23843', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23844', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23845', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23846', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23847', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23848', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23849', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23850', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23851', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23852', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23853', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23854', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23855', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23856', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23857', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23858', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23859', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23860', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23861', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23862', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23863', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23864', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23865', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23866', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23867', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23868', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23869', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23870', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23871', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23872', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23873', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23874', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23875', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23876', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23877', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23878', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23879', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23880', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23881', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23882', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23883', 'S/N', '464', '13', '24');
INSERT INTO `product` VALUES ('23884', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23885', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23886', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23887', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23888', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23889', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23890', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23891', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23892', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23893', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23894', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23895', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23896', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23897', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23898', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23899', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23900', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23901', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23902', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23903', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23904', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23905', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23906', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23907', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23908', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23909', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23910', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23911', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23912', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23913', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23914', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23915', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23916', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23917', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23918', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23919', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23920', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23921', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23922', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23923', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23924', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23925', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23926', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23927', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23928', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23929', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23930', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23931', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23932', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23933', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23934', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23935', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23936', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23937', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23938', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23939', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23940', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23941', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23942', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23943', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23944', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23945', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23946', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23947', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23948', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23949', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('23950', 'S/N', '2', '13', '24');
INSERT INTO `product` VALUES ('23951', 'S/N', '2', '13', '24');
INSERT INTO `product` VALUES ('23952', 'S/N', '2', '13', '24');
INSERT INTO `product` VALUES ('23953', 'S/N', '2', '13', '24');
INSERT INTO `product` VALUES ('23954', 'S/N', '2', '13', '24');
INSERT INTO `product` VALUES ('23955', 'S/N', '2', '13', '24');
INSERT INTO `product` VALUES ('23956', 'S/N', '2', '13', '24');
INSERT INTO `product` VALUES ('23957', 'S/N', '2', '13', '24');
INSERT INTO `product` VALUES ('23958', 'S/N', '2', '13', '24');
INSERT INTO `product` VALUES ('23959', 'S/N', '2', '13', '24');
INSERT INTO `product` VALUES ('23960', 'S/N', '2', '13', '24');
INSERT INTO `product` VALUES ('23961', 'S/N', '2', '13', '24');
INSERT INTO `product` VALUES ('23962', 'S/N', '2', '13', '24');
INSERT INTO `product` VALUES ('23963', 'S/N', '2', '13', '24');
INSERT INTO `product` VALUES ('23964', 'S/N', '20', '13', '24');
INSERT INTO `product` VALUES ('23965', 'S/N', '20', '13', '24');
INSERT INTO `product` VALUES ('23966', 'S/N', '20', '13', '24');
INSERT INTO `product` VALUES ('23967', 'S/N', '20', '13', '24');
INSERT INTO `product` VALUES ('23968', 'S/N', '20', '13', '24');
INSERT INTO `product` VALUES ('23969', 'S/N', '20', '13', '24');
INSERT INTO `product` VALUES ('23970', 'S/N', '20', '13', '24');
INSERT INTO `product` VALUES ('23971', 'S/N', '20', '13', '24');
INSERT INTO `product` VALUES ('23972', 'S/N', '20', '13', '24');
INSERT INTO `product` VALUES ('23973', 'S/N', '20', '13', '24');
INSERT INTO `product` VALUES ('23974', 'S/N', '20', '13', '24');
INSERT INTO `product` VALUES ('23975', 'S/N', '20', '13', '24');
INSERT INTO `product` VALUES ('23976', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('23977', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('23978', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('23979', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('23980', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('23981', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('23982', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('23983', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('23984', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('23985', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('23986', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('23987', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('23988', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('23989', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('23990', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('23991', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('23992', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('23993', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('23994', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('23995', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('23996', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('23997', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('23998', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('23999', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24000', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24001', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24002', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24003', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24004', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24005', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24006', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24007', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24008', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24009', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24010', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24011', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24012', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24013', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24014', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24015', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24016', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24017', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24018', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24019', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24020', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24021', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24022', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24023', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24024', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24025', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24026', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24027', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24028', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24029', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24030', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24031', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24032', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24033', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24034', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24035', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24036', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24037', 'S/N', '328', '13', '24');
INSERT INTO `product` VALUES ('24038', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24039', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24040', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24041', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24042', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24043', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24044', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24045', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24046', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24047', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24048', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24049', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24050', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24051', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24052', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24053', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24054', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24055', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24056', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24057', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24058', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24059', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24060', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24061', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24062', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24063', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24064', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24065', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24066', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24067', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24068', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24069', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24070', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24071', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24072', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24073', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24074', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24075', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24076', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24077', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24078', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24079', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24080', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24081', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24082', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24083', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24084', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24085', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24086', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24087', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24088', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24089', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24090', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24091', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24092', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24093', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24094', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24095', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24096', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24097', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24098', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24099', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24100', 'S/N', '3', '13', '24');
INSERT INTO `product` VALUES ('24101', 'S/N', '3', '13', '24');

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
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_model` AS select `model`.`id` AS `id`,`model`.`code` AS `code`,`model`.`description` AS `description`,`unit`.`description` AS `unit`,`category`.`name` AS `category`,`brand`.`name` AS `brand` from (((`model` left join `unit` on((`model`.`unit` = `unit`.`id`))) left join `category` on((`model`.`category` = `category`.`id`))) left join `brand` on((`model`.`brand` = `brand`.`id`))) ;

-- ----------------------------
-- View structure for v_modelBill
-- ----------------------------
DROP VIEW IF EXISTS `v_modelBill`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_modelBill` AS select `model`.`id` AS `id`,concat(`model`.`code`,' - ',`model`.`description`) AS `description` from `model` ;

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

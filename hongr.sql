/*
Navicat MySQL Data Transfer

Source Server         : imsadan
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : hongr

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2018-11-21 19:58:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for daycloths
-- ----------------------------
DROP TABLE IF EXISTS `daycloths`;
CREATE TABLE `daycloths` (
  `id` bigint(20) NOT NULL,
  `wei` varchar(255) NOT NULL,
  `jin` varchar(255) NOT NULL,
  `numbers` int(11) DEFAULT NULL,
  `years` varchar(255) NOT NULL,
  `months` varchar(255) NOT NULL,
  `days` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of daycloths
-- ----------------------------
INSERT INTO `daycloths` VALUES ('151236876599451', '45纬', '13支', '1', '2017', '12', '2017-12-04');
INSERT INTO `daycloths` VALUES ('151236879900726', '24纬', '16支', '2', '2017', '12', '2017-12-05');
INSERT INTO `daycloths` VALUES ('151236882522285', '16纬', '13支', '5', '2017', '12', '2017-12-06 ');
INSERT INTO `daycloths` VALUES ('151237027249215', '45纬', '8支', '3', '2017', '12', '2017-12-04 ');
INSERT INTO `daycloths` VALUES ('151237028564204', '16纬', '24支', '9', '2017', '12', '2017-12-04 ');
INSERT INTO `daycloths` VALUES ('151237028564299', '45纬', '13支', '5', '2017', '12', '2017-12-06');
INSERT INTO `daycloths` VALUES ('151237028564831', '45纬', '13支', '8', '2017', '12', '2017-12-09');
INSERT INTO `daycloths` VALUES ('151237028564832', '45纬', '13支', '5', '2017', '12', '2017-12-10');
INSERT INTO `daycloths` VALUES ('151237028564833', '45纬', '13支', '7', '2017', '12', '2017-12-12');
INSERT INTO `daycloths` VALUES ('151237041114092', '31纬', '13支', '2', '2017', '12', '2017-12-05 ');
INSERT INTO `daycloths` VALUES ('151324191156388', '16纬', '13支', '5', '2017', '12', '2017-12-14');
INSERT INTO `daycloths` VALUES ('151331709799834', '24纬', '8支', '12', '2017', '1', '2017-01-01');
INSERT INTO `daycloths` VALUES ('151332102234907', '25纬', '24支', '13', '2017', '11', '2017-11-01');
INSERT INTO `daycloths` VALUES ('151332104814809', '25纬', '24支', '8', '2017', '11', '2017-11-04');

-- ----------------------------
-- Table structure for dayplans
-- ----------------------------
DROP TABLE IF EXISTS `dayplans`;
CREATE TABLE `dayplans` (
  `years` varchar(255) NOT NULL,
  `months` varchar(255) NOT NULL,
  `days` varchar(255) NOT NULL,
  `IntolNum` double(11,2) DEFAULT NULL,
  `sticksNum` double(11,2) DEFAULT NULL,
  `sticksWeight` double(11,2) DEFAULT NULL,
  `Beam` double(11,2) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `stauts` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dayplans
-- ----------------------------
INSERT INTO `dayplans` VALUES ('2017', '12', '2017-12-1', '115.00', '10.00', '80.00', '300.00', '1', '0');
INSERT INTO `dayplans` VALUES ('2017', '12', '2017-12-2', '100.00', '7.00', '55.00', '212.00', '2', '1');
INSERT INTO `dayplans` VALUES ('2018', '1', '2018-1-1', '88.00', '11.00', '96.00', '333.00', '3', '0');
INSERT INTO `dayplans` VALUES ('2017', '12', '2017-12-3', '100.00', '25.00', '100.00', '250.00', '4', '0');
INSERT INTO `dayplans` VALUES ('2017', '12', '2017-12-4', '65.00', '23.00', '66.00', '100.00', '5', '1');
INSERT INTO `dayplans` VALUES ('2017', '12', '2017-12-5', '56.00', '5.00', '65.00', '222.00', '6', '1');
INSERT INTO `dayplans` VALUES ('2017', '12', '2017-12-6', '140.00', '6.00', '150.00', '245.00', '7', '1');
INSERT INTO `dayplans` VALUES ('2018', '1', '2018-01-02 ', '100.00', '5.00', '80.00', '180.00', '151209371752933', '1');
INSERT INTO `dayplans` VALUES ('2018', '1', '2018-01-03 ', '577.00', '10.00', '88.00', '456.00', '151209396345761', '0');
INSERT INTO `dayplans` VALUES ('2018', '1', '2018-01-04 ', '288.50', '10.00', '56.30', '654.90', '151209423891243', '1');
INSERT INTO `dayplans` VALUES ('2017', '12', '2017-12-07 ', '852.00', '25.00', '44.00', '473.90', '151211480402689', '0');
INSERT INTO `dayplans` VALUES ('2017', '12', '2017-12-14', '100.00', '10.00', '80.00', '401.30', '151324181129101', '0');
INSERT INTO `dayplans` VALUES ('2017', '11', '2017-12-01', '752.20', '15.00', '100.00', '419.80', '151331646396187', '1');
INSERT INTO `dayplans` VALUES ('2017', '1', '2017-01-01', '523.40', '53.00', '85.70', '289.20', '151331652076535', '1');
INSERT INTO `dayplans` VALUES ('2017', '2', '2017-02-01', '53.90', '23.00', '45.30', '329.10', '151331700453830', '1');
INSERT INTO `dayplans` VALUES ('2017', '3', '2017-03-01', '411.00', '13.00', '26.50', '410.90', '151332091470729', '0');

-- ----------------------------
-- Table structure for jinnum
-- ----------------------------
DROP TABLE IF EXISTS `jinnum`;
CREATE TABLE `jinnum` (
  `uid` bigint(11) NOT NULL,
  `uname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `uname` (`uname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jinnum
-- ----------------------------
INSERT INTO `jinnum` VALUES ('1', '13支');
INSERT INTO `jinnum` VALUES ('3', '16支');
INSERT INTO `jinnum` VALUES ('2147483647', '20支');
INSERT INTO `jinnum` VALUES ('4', '24支');
INSERT INTO `jinnum` VALUES ('2', '8支');

-- ----------------------------
-- Table structure for listall
-- ----------------------------
DROP TABLE IF EXISTS `listall`;
CREATE TABLE `listall` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mintext` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of listall
-- ----------------------------
INSERT INTO `listall` VALUES ('2', 'zz', '2', '2');
INSERT INTO `listall` VALUES ('3', 'ass', '3', '3');
INSERT INTO `listall` VALUES ('4', 'fd', '4', '4');
INSERT INTO `listall` VALUES ('5', 'fdfdsa', '5', '5');
INSERT INTO `listall` VALUES ('11', 'hfz', '1', '1');

-- ----------------------------
-- Table structure for profit
-- ----------------------------
DROP TABLE IF EXISTS `profit`;
CREATE TABLE `profit` (
  `id` bigint(20) NOT NULL,
  `price` double(10,2) NOT NULL,
  `updatetime` varchar(255) NOT NULL,
  `pname` varchar(255) DEFAULT NULL,
  `uname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pname` (`pname`),
  KEY `uname` (`uname`),
  CONSTRAINT `pname` FOREIGN KEY (`pname`) REFERENCES `weinum` (`pname`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `uname` FOREIGN KEY (`uname`) REFERENCES `jinnum` (`uname`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of profit
-- ----------------------------
INSERT INTO `profit` VALUES ('1', '0.53', '2017-12-15', '45纬', '13支');
INSERT INTO `profit` VALUES ('2', '0.59', '2017-12-21', '30纬', '16支');
INSERT INTO `profit` VALUES ('151332115812055', '1.10', '2017-12-01', '31纬', '13支');

-- ----------------------------
-- Table structure for profitstatic
-- ----------------------------
DROP TABLE IF EXISTS `profitstatic`;
CREATE TABLE `profitstatic` (
  `id` bigint(20) NOT NULL,
  `pname` varchar(255) DEFAULT NULL,
  `uname` varchar(255) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `times` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of profitstatic
-- ----------------------------
INSERT INTO `profitstatic` VALUES ('1', '45纬', '13支', '0.80', '2017-10-1');
INSERT INTO `profitstatic` VALUES ('2', '30纬', '16支', '1.10', '2017-12-1');
INSERT INTO `profitstatic` VALUES ('151323143911232', '45纬', '13支', '0.93', '2017-12-01');
INSERT INTO `profitstatic` VALUES ('151323143911233', '45纬', '13支', '0.75', '2018-1-1');
INSERT INTO `profitstatic` VALUES ('151324199718324', '30纬', '16支', '0.88', '2017-12-14');
INSERT INTO `profitstatic` VALUES ('151331722173966', '45纬', '13支', '0.53', '2017-12-15');
INSERT INTO `profitstatic` VALUES ('151332113032282', '30纬', '16支', '0.59', '2017-12-21');
INSERT INTO `profitstatic` VALUES ('151332115811328', '31纬', '13支', '1.10', '2017-12-01');

-- ----------------------------
-- Table structure for user_list
-- ----------------------------
DROP TABLE IF EXISTS `user_list`;
CREATE TABLE `user_list` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id` int(11) NOT NULL,
  `creaded` varchar(255) DEFAULT NULL,
  `logined` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_list
-- ----------------------------
INSERT INTO `user_list` VALUES ('hfzhang', 'e19d5cd5af0378da05f63f891c7467af', '1', '2018-1-1', '2018-01-06');

-- ----------------------------
-- Table structure for weinum
-- ----------------------------
DROP TABLE IF EXISTS `weinum`;
CREATE TABLE `weinum` (
  `pid` bigint(20) NOT NULL,
  `pname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `pid` (`pid`,`pname`),
  KEY `pname` (`pname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weinum
-- ----------------------------
INSERT INTO `weinum` VALUES ('5', '16纬');
INSERT INTO `weinum` VALUES ('3', '24纬');
INSERT INTO `weinum` VALUES ('2147483647', '25纬');
INSERT INTO `weinum` VALUES ('2', '30纬');
INSERT INTO `weinum` VALUES ('4', '31纬');
INSERT INTO `weinum` VALUES ('1', '45纬');
INSERT INTO `weinum` VALUES ('151332120580135', '50纬');

-- ----------------------------
-- Table structure for yeartotal
-- ----------------------------
DROP TABLE IF EXISTS `yeartotal`;
CREATE TABLE `yeartotal` (
  `id` bigint(20) NOT NULL,
  `years` varchar(255) DEFAULT NULL,
  `months` varchar(255) DEFAULT NULL,
  `sumweight` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yeartotal
-- ----------------------------
INSERT INTO `yeartotal` VALUES ('151330337033883', '2017', '12', '1528');
INSERT INTO `yeartotal` VALUES ('151330338291756', '2018', '1', '1053.5');
INSERT INTO `yeartotal` VALUES ('151331638877070', '2017', '11', '752.2');
INSERT INTO `yeartotal` VALUES ('151331657804655', '2017', '1', '523.4');
INSERT INTO `yeartotal` VALUES ('151331701623996', '2017', '2', '53.9');

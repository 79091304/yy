/*
Navicat MySQL Data Transfer

Source Server         : ofbiz
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : sanrenzou

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2015-08-12 18:10:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `c_category`
-- ----------------------------
DROP TABLE IF EXISTS `c_category`;
CREATE TABLE `c_category` (
  `id` tinyint(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 NOT NULL,
  `status` tinyint(1) NOT NULL,
  `no` varchar(8) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of c_category
-- ----------------------------
INSERT INTO `c_category` VALUES ('1', '吊车', '1', '223');
INSERT INTO `c_category` VALUES ('2', '货车', '1', '123');
INSERT INTO `c_category` VALUES ('3', '铲车', '1', '323');

-- ----------------------------
-- Table structure for `p_product`
-- ----------------------------
DROP TABLE IF EXISTS `p_product`;
CREATE TABLE `p_product` (
  `id` bigint(10) NOT NULL,
  `price` tinyint(4) DEFAULT NULL,
  `name` varchar(60) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `attribute` varchar(60) NOT NULL,
  `imgurl` varchar(300) NOT NULL,
  `vendorid` bigint(10) NOT NULL,
  `createdAt` datetime NOT NULL,
  `brief` varchar(300) DEFAULT NULL,
  `address` varchar(60) NOT NULL,
  `detail` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of p_product
-- ----------------------------

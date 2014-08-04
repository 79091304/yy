/*
Navicat MySQL Data Transfer

Source Server         : youeryuan
Source Server Version : 50133
Source Host           : localhost:3306
Source Database       : sanrenzou

Target Server Type    : MYSQL
Target Server Version : 50133
File Encoding         : 65001

Date: 2014-08-04 17:45:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for c_course
-- ----------------------------
DROP TABLE IF EXISTS `c_course`;
CREATE TABLE `c_course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `category` varchar(30) DEFAULT NULL,
  `videoUrl` varchar(50) DEFAULT NULL,
  `imgUrl` varchar(50) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `begin` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `changedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_course
-- ----------------------------

-- ----------------------------
-- Table structure for u_user
-- ----------------------------
DROP TABLE IF EXISTS `u_user`;
CREATE TABLE `u_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `password` varchar(50) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `changedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_user
-- ----------------------------
INSERT INTO `u_user` VALUES ('1', 'ooooo', 'zhang_zhanhui@sina.com', '13582035954', '123456', '0', '0', '2014-07-07 17:03:29', null);
INSERT INTO `u_user` VALUES ('2', 'ttt', '88@qq.com', '13582035954', '123456', '0', '0', '2014-07-08 10:35:45', null);
INSERT INTO `u_user` VALUES ('3', '100100', 'zhang_zhanhui@sina.com', '13582035954', 'uck/vf0qMFBOBdOwsyMH2g==', '0', '1', '2014-07-22 11:36:17', null);

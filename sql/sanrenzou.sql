/*
Navicat MySQL Data Transfer

Source Server         : youeryuan
Source Server Version : 50133
Source Host           : localhost:3306
Source Database       : sanrenzou

Target Server Type    : MYSQL
Target Server Version : 50133
File Encoding         : 65001

Date: 2014-08-08 11:51:46
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
  `detail` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_course
-- ----------------------------

-- ----------------------------
-- Table structure for t_callinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_callinfo`;
CREATE TABLE `t_callinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `caller` varchar(30) NOT NULL,
  `feeid` varchar(20) NOT NULL,
  `rangeId` bigint(20) NOT NULL,
  `wavid` varchar(20) NOT NULL,
  `resourceNo` varchar(30) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `changedAt` date DEFAULT NULL,
  `status` tinyint(1) unsigned zerofill NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `seq` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_callinfo
-- ----------------------------
INSERT INTO `t_callinfo` VALUES ('42', '13582035954', '100016', '74', '20140516385.wav', '600907000002949304', '2014-08-06 09:48:15', null, '0', null, '201408060928332149768');
INSERT INTO `t_callinfo` VALUES ('43', '13582035954', '100016', '74', '20140516385.wav', '600907000002949304', '2014-08-06 09:48:15', '2014-08-06', '0', '400001', '2014080609311843708925');
INSERT INTO `t_callinfo` VALUES ('44', '13582035954', '100016', '74', '20140516385.wav', '600907000002949304', '2014-08-06 09:48:27', '2014-08-06', '0', '400001', '2014080609480680671523');

-- ----------------------------
-- Table structure for t_cancelinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_cancelinfo`;
CREATE TABLE `t_cancelinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `caller` varchar(20) DEFAULT NULL,
  `callee` varchar(30) DEFAULT NULL,
  `feeid` varchar(10) DEFAULT NULL,
  `seq` varchar(50) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cancelinfo
-- ----------------------------
INSERT INTO `t_cancelinfo` VALUES ('1', '13582035954', '13582035954', '100016', '2014080609480680671523', null);
INSERT INTO `t_cancelinfo` VALUES ('2', '13582035954', '13582035954', '100016', '2014080609480680671523', null);

-- ----------------------------
-- Table structure for t_daterange
-- ----------------------------
DROP TABLE IF EXISTS `t_daterange`;
CREATE TABLE `t_daterange` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `begintime` varchar(20) NOT NULL,
  `endtime` varchar(20) NOT NULL,
  `callInfoId` bigint(20) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `changedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_daterange
-- ----------------------------
INSERT INTO `t_daterange` VALUES ('70', '20140805 10:26:33', '20140805 09:26:33', '0', '2014-08-06 09:29:07', null);
INSERT INTO `t_daterange` VALUES ('71', '20140805 10:26:33', '20140805 09:26:33', '42', '2014-08-06 09:29:08', null);
INSERT INTO `t_daterange` VALUES ('72', '20140805 10:26:33', '20140805 09:26:33', '0', '2014-08-06 09:31:36', null);
INSERT INTO `t_daterange` VALUES ('73', '20140805 10:26:33', '20140805 09:26:33', '43', '2014-08-06 09:31:36', null);
INSERT INTO `t_daterange` VALUES ('74', '20140805 10:26:33', '20140805 09:26:33', '0', '2014-08-06 09:48:15', null);
INSERT INTO `t_daterange` VALUES ('75', '20140805 10:26:33', '20140805 09:26:33', '44', '2014-08-06 09:48:15', null);

-- ----------------------------
-- Table structure for t_receivecaller
-- ----------------------------
DROP TABLE IF EXISTS `t_receivecaller`;
CREATE TABLE `t_receivecaller` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `caller` varchar(20) NOT NULL,
  `serialnumber` varchar(50) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `callInfoId` bigint(20) NOT NULL,
  `changedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_receivecaller
-- ----------------------------
INSERT INTO `t_receivecaller` VALUES ('57', '13582035954', '', '2014-08-06 09:29:07', '42', null);
INSERT INTO `t_receivecaller` VALUES ('58', '13582035954', '', '2014-08-06 09:31:36', '43', null);
INSERT INTO `t_receivecaller` VALUES ('59', '13582035954', 'ebad7a2f-163a-42cf-a846-b4ff9230496b', '2014-08-06 09:33:27', '0', null);
INSERT INTO `t_receivecaller` VALUES ('60', '13582035954', '', '2014-08-06 09:48:15', '44', null);
INSERT INTO `t_receivecaller` VALUES ('61', '13582035954', 'afd879f8-3956-4ab2-92b1-255f1ad69ebb', '2014-08-06 09:48:22', '0', null);

-- ----------------------------
-- Table structure for t_teacher
-- ----------------------------
DROP TABLE IF EXISTS `t_teacher`;
CREATE TABLE `t_teacher` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `sex` tinyint(1) NOT NULL,
  `age` int(2) DEFAULT NULL,
  `zone` varchar(50) DEFAULT NULL,
  `tag` varchar(50) DEFAULT NULL,
  `detail` varchar(200) DEFAULT NULL,
  `imgUrl` varchar(100) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `changedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_teacher
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
INSERT INTO `u_user` VALUES ('3', '100100', 'zhang_zhanhui@sina.com', '13582035954', 'b9c93fbdfd2a30504e05d3b0b32307da', '0', '1', '2014-08-06 10:46:00', null);

/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : kocor

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2017-12-01 18:15:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('11', '暗杀神过', '55.00');
INSERT INTO `admin` VALUES ('12', '特各位给', '56754.00');
INSERT INTO `admin` VALUES ('13', '交一份叫她叫', '346.00');
INSERT INTO `admin` VALUES ('17', 'dfhrthr', '324.00');

-- ----------------------------
-- Table structure for kocor_admin
-- ----------------------------
DROP TABLE IF EXISTS `kocor_admin`;
CREATE TABLE `kocor_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL COMMENT '用户名',
  `nick_name` varchar(50) DEFAULT NULL COMMENT '昵称',
  `password` varchar(32) NOT NULL,
  `salt` varchar(20) DEFAULT NULL COMMENT '密码盐',
  `token` varchar(32) DEFAULT NULL COMMENT 'token',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(15) DEFAULT NULL COMMENT '手机',
  `last_login_time` int(10) unsigned DEFAULT NULL COMMENT '最后登录时间',
  `login_failure` tinyint(4) unsigned DEFAULT NULL COMMENT '登录失败次数',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  `create_time` int(10) NOT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kocor_admin
-- ----------------------------
INSERT INTO `kocor_admin` VALUES ('4', 'afas', 'gsagaeg', 'defe30718609b3b1179c841916062a91', 'kocorw', null, 'asfas@qq.com', '13631575382', null, null, '1', '1511863574', '1511850037');
INSERT INTO `kocor_admin` VALUES ('6', 'dsgerhg', 'hrewheh', '6802243e14edef11b5a33f94a2d626e0', 'KwEAjb', null, 'asfas@qq.com', '13631575382', '1512098291', '0', '1', '1512098291', '1511863394');
INSERT INTO `kocor_admin` VALUES ('7', 'safsag', 'sagwg', '123456', 'NY892o', 'ZIzubQi0J9haVcT0EJKzfERVVxX3dgYL', 'asfas@qq.com', '13631575382', null, null, '1', '1511936408', '1511936408');
INSERT INTO `kocor_admin` VALUES ('8', 'sdgsd', 'fsag', '', 'N0lLOs', 'mp04e9vJHEr0bRLNfv6UpzQO5M8xAvGK', 'asfas@qq.com', '13631575382', null, null, '1', '1511936713', '1511936713');
INSERT INTO `kocor_admin` VALUES ('9', 'wagqeg', 'gsagaeg', 'bee8983a10253e539016aab093169b09', 'Kghh0W', 'fcZUr6cDKk9NAwm69Vg9A7frHi9IjSID', 'asfas@qq.com', '13631575382', null, null, '1', '1511936729', '1511936729');

-- ----------------------------
-- Table structure for kocor_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `kocor_auth_group`;
CREATE TABLE `kocor_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` char(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kocor_auth_group
-- ----------------------------
INSERT INTO `kocor_auth_group` VALUES ('1', '超级管理员', '1', '1,3,4');
INSERT INTO `kocor_auth_group` VALUES ('2', '普通管理员', '1', '1,3');

-- ----------------------------
-- Table structure for kocor_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `kocor_auth_group_access`;
CREATE TABLE `kocor_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kocor_auth_group_access
-- ----------------------------
INSERT INTO `kocor_auth_group_access` VALUES ('6', '222222');
INSERT INTO `kocor_auth_group_access` VALUES ('6', '3333333');
INSERT INTO `kocor_auth_group_access` VALUES ('6', '16777215');

-- ----------------------------
-- Table structure for kocor_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `kocor_auth_rule`;
CREATE TABLE `kocor_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(8) NOT NULL COMMENT '父ID',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '标题',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `condition` char(100) NOT NULL DEFAULT '' COMMENT '规则条件',
  `is_menu` tinyint(2) NOT NULL DEFAULT '0' COMMENT '菜单',
  `icon` varchar(50) NOT NULL COMMENT '图标',
  `weigh` int(8) NOT NULL DEFAULT '50' COMMENT '权重',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kocor_auth_rule
-- ----------------------------
INSERT INTO `kocor_auth_rule` VALUES ('1', '0', 'admin/index', '管理员列表', '1', '1', '1', '0', '1', '50');
INSERT INTO `kocor_auth_rule` VALUES ('2', '1', 'admin/add', '管理员增加', '1', '1', '1', '0', '1', '50');
INSERT INTO `kocor_auth_rule` VALUES ('3', '2', 'admin/edit', '管理员编辑', '1', '1', '1', '0', '1', '50');
INSERT INTO `kocor_auth_rule` VALUES ('4', '1', 'admin/del', '管理员删除', '1', '1', '1', '0', '1', '50');

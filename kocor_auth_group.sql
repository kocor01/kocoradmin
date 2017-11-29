/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : kocor

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-11-30 00:09:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `kocor_auth_group`
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
-- Table structure for `kocor_auth_group_access`
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
INSERT INTO `kocor_auth_group_access` VALUES ('1', '1');
INSERT INTO `kocor_auth_group_access` VALUES ('2', '2');

-- ----------------------------
-- Table structure for `kocor_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `kocor_auth_rule`;
CREATE TABLE `kocor_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kocor_auth_rule
-- ----------------------------
INSERT INTO `kocor_auth_rule` VALUES ('1', 'admin/index', '管理员列表', '1', '1', '');
INSERT INTO `kocor_auth_rule` VALUES ('2', 'admin/add', '管理员增加', '1', '1', '');
INSERT INTO `kocor_auth_rule` VALUES ('3', 'admin/edit', '管理员编辑', '1', '1', '');
INSERT INTO `kocor_auth_rule` VALUES ('4', 'admin/del', '管理员删除', '1', '1', '');

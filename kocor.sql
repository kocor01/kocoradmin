/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : kocor

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2017-12-13 18:27:24
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kocor_admin
-- ----------------------------
INSERT INTO `kocor_admin` VALUES ('1', 'admin', 'kocor', 'fc0b2af07f1e6e6bd0b2bb09dd0b7be4', 'IFMM2b', 'WWXdHMfBF3ZZbjenCXokdlF5NQklgop8', '502117269@qq.com', '13631575382', '1513046799', '0', '1', '1513046799', '1512973196');
INSERT INTO `kocor_admin` VALUES ('2', 'admin2', 'admin2', '1911ebd46042a0e804e1ec818aa787b3', 'Y6EsgV', 'M6IrqO4Gr1alpDcXIYDOxLH26SUfW1uv', '502117269@qq.com', '13631575382', '1513068404', '0', '1', '1513068404', '1512979819');

-- ----------------------------
-- Table structure for kocor_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `kocor_auth_group`;
CREATE TABLE `kocor_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父级',
  `title` char(100) NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `rules` char(80) NOT NULL DEFAULT '' COMMENT '规则',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `update-time` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_atime` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kocor_auth_group
-- ----------------------------
INSERT INTO `kocor_auth_group` VALUES ('1', '0', '超级管理员', '1', '*', '', '0', '0');
INSERT INTO `kocor_auth_group` VALUES ('2', '1', '二级管理员', '1', '1,2,8,9,13,14', '', '0', '0');
INSERT INTO `kocor_auth_group` VALUES ('3', '5', '三级管理员', '1', '2,8,9,10', '', '0', '0');
INSERT INTO `kocor_auth_group` VALUES ('4', '3', '四级管理员', '1', '2,8,9', '', '0', '0');
INSERT INTO `kocor_auth_group` VALUES ('5', '1', '二级管理员2', '1', '2,8,9,10,11,12', '', '0', '0');

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
INSERT INTO `kocor_auth_group_access` VALUES ('1', '1');
INSERT INTO `kocor_auth_group_access` VALUES ('1', '2');
INSERT INTO `kocor_auth_group_access` VALUES ('1', '4');
INSERT INTO `kocor_auth_group_access` VALUES ('2', '2');

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
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kocor_auth_rule
-- ----------------------------
INSERT INTO `kocor_auth_rule` VALUES ('1', '0', 'index/index', '主页', '1', '1', '', '1', 'fa fa-dashboard', '50', '', '1512962345', '1512962345');
INSERT INTO `kocor_auth_rule` VALUES ('2', '0', 'auth', '权限管理', '1', '1', '', '1', 'fa fa-expeditedssl', '50', '', '1513143881', '1512961123');
INSERT INTO `kocor_auth_rule` VALUES ('3', '2', 'auth_rule', '权限规则管理', '1', '1', '', '1', 'fa fa-expeditedssl', '50', '', '1513068141', '1512961123');
INSERT INTO `kocor_auth_rule` VALUES ('4', '3', 'auth_rule/index', '列表', '1', '1', '', '0', 'fa fa-dedent', '50', '', '1512961180', '1512961180');
INSERT INTO `kocor_auth_rule` VALUES ('5', '3', 'auth_rule/add', '增加', '1', '1', '', '0', 'fa fa-list', '50', '', '1512961221', '1512961221');
INSERT INTO `kocor_auth_rule` VALUES ('6', '3', 'auth_rule/edit', '编辑', '1', '1', '', '0', 'fa fa-list', '50', '', '1512961249', '1512961249');
INSERT INTO `kocor_auth_rule` VALUES ('7', '3', 'auth_rule/del', '删除', '1', '1', '', '0', 'fa fa-list', '50', '', '1512961275', '1512961275');
INSERT INTO `kocor_auth_rule` VALUES ('8', '2', 'auth_group', '权限组管理', '1', '1', '', '1', 'fa fa-server', '50', '', '1512961460', '1512961460');
INSERT INTO `kocor_auth_rule` VALUES ('9', '8', 'auth_group/index', '列表', '1', '1', '', '0', 'fa fa-server', '50', '权限组添加、删除以及分配权限管理', '1513143893', '1512961460');
INSERT INTO `kocor_auth_rule` VALUES ('10', '8', 'auth_group/add', '增加', '1', '1', '', '0', 'fa fa-list', '50', '', '1512961480', '1512961480');
INSERT INTO `kocor_auth_rule` VALUES ('11', '8', 'auth_group/edit', '编辑', '1', '1', '', '0', 'fa fa-list', '50', '', '1512961501', '1512961501');
INSERT INTO `kocor_auth_rule` VALUES ('12', '8', 'auth_group/del', '删除', '1', '1', '', '0', 'fa fa-list', '50', '', '1512961523', '1512961523');
INSERT INTO `kocor_auth_rule` VALUES ('13', '2', 'admin', '管理员管理', '1', '1', '', '1', 'fa fa-user-circle', '50', '', '1512962066', '1512962066');
INSERT INTO `kocor_auth_rule` VALUES ('14', '13', 'admin/index', '列表', '1', '1', '', '0', 'fa fa-user-circle', '50', '', '1512962066', '1512962066');
INSERT INTO `kocor_auth_rule` VALUES ('15', '13', 'admin/add', '增加', '1', '1', '', '0', 'fa fa-list', '50', '', '1512962087', '1512962087');
INSERT INTO `kocor_auth_rule` VALUES ('16', '13', 'admin/edit', '编辑', '1', '1', '', '0', 'fa fa-list', '50', '', '1512962113', '1512962113');
INSERT INTO `kocor_auth_rule` VALUES ('17', '13', 'admin/del', '删除', '1', '1', '', '0', 'fa fa-list', '50', '', '1512962133', '1512962133');
INSERT INTO `kocor_auth_rule` VALUES ('18', '0', 'system', '系统管理', '1', '1', '', '1', 'fa fa-cogs', '50', '', '1513072930', '1513072930');
INSERT INTO `kocor_auth_rule` VALUES ('19', '18', 'config/index', '系统设置', '1', '1', '', '1', 'fa fa-cog', '50', '', '1513072965', '1513072965');

-- ----------------------------
-- Table structure for kocor_config
-- ----------------------------
DROP TABLE IF EXISTS `kocor_config`;
CREATE TABLE `kocor_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group` varchar(255) NOT NULL DEFAULT '0' COMMENT '分组',
  `type` varchar(255) NOT NULL DEFAULT '0' COMMENT '类型',
  `name` varchar(255) NOT NULL COMMENT '变量名',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `value` varchar(255) NOT NULL COMMENT '变量值',
  `msg` varchar(255) NOT NULL COMMENT '提示信息',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kocor_config
-- ----------------------------
INSERT INTO `kocor_config` VALUES ('1', 'dictionary', 'array', 'categorytype', '分组配置', '{\"basic\":\"基础配置\",\"email\":\"邮件配置\",\"dictionary\":\"字典配置\",\"user\":\"会员配置\",\"example\":\"示例配置\"}', '', '0', '0');
INSERT INTO `kocor_config` VALUES ('2', 'basic', 'string', 'sitename', '网站名称', 'kocol管理系统', '', '0', '0');
INSERT INTO `kocor_config` VALUES ('3', 'basic', 'string', 'keyword', '网站关键词', 'kocol，管理系统', '', '0', '0');
INSERT INTO `kocor_config` VALUES ('4', 'dictionary', 'text', 'description', '网站描述', 'kocol管理系统，为自己开发系统', '', '0', '0');

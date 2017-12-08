/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : kocor

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2017-12-08 20:20:34
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kocor_admin
-- ----------------------------
INSERT INTO `kocor_admin` VALUES ('4', 'afas', 'gsagaeg', 'defe30718609b3b1179c841916062a91', 'kocorw', null, 'asfas@qq.com', '13631575382', null, null, '1', '1511863574', '1511850037');
INSERT INTO `kocor_admin` VALUES ('6', 'dsgerhg', 'hrewheh', '6802243e14edef11b5a33f94a2d626e0', 'KwEAjb', null, 'asfas@qq.com', '13631575382', '1512098291', '0', '1', '1512098291', '1511863394');
INSERT INTO `kocor_admin` VALUES ('7', 'safsag', 'sagwg', '123456', 'NY892o', 'ZIzubQi0J9haVcT0EJKzfERVVxX3dgYL', 'asfas@qq.com', '13631575382', null, null, '1', '1511936408', '1511936408');
INSERT INTO `kocor_admin` VALUES ('8', 'sdgsd', 'fsag', '', 'N0lLOs', 'mp04e9vJHEr0bRLNfv6UpzQO5M8xAvGK', 'asfas@qq.com', '13631575382', null, null, '1', '1512732204', '1511936713');
INSERT INTO `kocor_admin` VALUES ('9', 'wagqeg', 'gsagaeg', 'bee8983a10253e539016aab093169b09', 'Kghh0W', 'fcZUr6cDKk9NAwm69Vg9A7frHi9IjSID', 'asfas@qq.com', '13631575382', null, null, '1', '1512732195', '1511936729');
INSERT INTO `kocor_admin` VALUES ('10', 'wagqeg', 'gsagaeg', '4d3cf6f3bd76b20b4e156392d3ef1446', '7a1BYb', '26fVb8594RLCoNN4BHYB9drhxgHmGkFa', 'asfas@qq.com', '13631575382', null, null, '1', '1512727017', '1512727017');
INSERT INTO `kocor_admin` VALUES ('11', 'wagqeg', 'gsagaeg', 'eb3a7744c0155b0f80bebe27d51d614c', '0aPitJ', 'esewiX22MhzE8QExY4RG8TkYlKpOXKEz', 'asfas@qq.com', '13631575382', null, null, '1', '1512727066', '1512727066');
INSERT INTO `kocor_admin` VALUES ('12', 'afas', 'gsagaeg', '1d5f4961bd0e660bf45bfc529ee31f54', '4KqVi2', 'lwXBKwenHfi6LRhWYFyqlPu1WYuGjx7v', 'asfas@qq.com', '13631575382', null, null, '1', '1512728654', '1512727384');
INSERT INTO `kocor_admin` VALUES ('13', 'afas', 'gsagaeg', '', 'KOLCoc', 'ETlZ5NSLgRA5KZNff2tsbd3ey54zan9U', 'asfas@qq.com', '13631575382', null, null, '1', '1512728767', '1512727406');

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kocor_auth_group
-- ----------------------------
INSERT INTO `kocor_auth_group` VALUES ('1', '0', '超级管理员', '1', '1,2,5,4', '', '0', '0');
INSERT INTO `kocor_auth_group` VALUES ('2', '1', '普通管理员', '1', '5,3,4', '', '0', '0');
INSERT INTO `kocor_auth_group` VALUES ('3', '2', '二级管理员', '1', '5,3,4', '二级管理员', '0', '0');

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
INSERT INTO `kocor_auth_group_access` VALUES ('8', '2');
INSERT INTO `kocor_auth_group_access` VALUES ('8', '3');
INSERT INTO `kocor_auth_group_access` VALUES ('9', '3');
INSERT INTO `kocor_auth_group_access` VALUES ('10', '1');
INSERT INTO `kocor_auth_group_access` VALUES ('10', '2');
INSERT INTO `kocor_auth_group_access` VALUES ('11', '1');
INSERT INTO `kocor_auth_group_access` VALUES ('11', '2');
INSERT INTO `kocor_auth_group_access` VALUES ('11', '3');
INSERT INTO `kocor_auth_group_access` VALUES ('12', '1');
INSERT INTO `kocor_auth_group_access` VALUES ('12', '3');
INSERT INTO `kocor_auth_group_access` VALUES ('13', '1');
INSERT INTO `kocor_auth_group_access` VALUES ('13', '2');
INSERT INTO `kocor_auth_group_access` VALUES ('13', '3');

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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kocor_auth_rule
-- ----------------------------
INSERT INTO `kocor_auth_rule` VALUES ('1', '0', 'admin/index', '管理员列表', '1', '1', '1', '0', 'fa fa-arrow-circle-left', '50', '', '1512716864', '0');
INSERT INTO `kocor_auth_rule` VALUES ('2', '1', 'admin/add', '管理员增加', '1', '1', '1', '0', 'fa fa-edit', '50', '', '0', '0');
INSERT INTO `kocor_auth_rule` VALUES ('3', '5', 'admin/edit', '管理员编辑', '1', '1', '1', '0', 'fa fa-align-justify', '50', '', '1512716878', '0');
INSERT INTO `kocor_auth_rule` VALUES ('4', '5', 'admin/del', '管理员删除', '1', '1', '1u', '1', 'fa fa-automobile', '500', 'yuktykty', '1512716900', '0');
INSERT INTO `kocor_auth_rule` VALUES ('5', '0', 'admin', '管理员管理', '1', '1', '1', '1', 'fa fa-drivers-license-o', '50', 'uluylu', '1512716909', '0');
INSERT INTO `kocor_auth_rule` VALUES ('8', '0', 'article/add', '文章管理', '1', '1', '00', '1', 'fa fa-bank', '50', '文章管理', '1512718683', '1512718683');

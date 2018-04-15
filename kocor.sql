/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : kocoradmin

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-04-14 17:38:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `kocor_admin`
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kocor_admin
-- ----------------------------
INSERT INTO `kocor_admin` VALUES ('1', 'admin', 'kocor', '76403812292f16ea9e11a6db0b84777e', 'n6Qky3', 'o494IZxp686MhCKIkL7Spz4a5D0wepZW', '502117269@qq.com', '13631575382', '1523697654', '0', '1', '1523697654', '1512973196');
INSERT INTO `kocor_admin` VALUES ('2', 'admin2', 'admin2', '1911ebd46042a0e804e1ec818aa787b3', 'Y6EsgV', 'M6IrqO4Gr1alpDcXIYDOxLH26SUfW1uv', '502117269@qq.com', '13631575382', '1513589326', '0', '1', '1513589326', '1512979819');
INSERT INTO `kocor_admin` VALUES ('3', 'admin22', 'gsagaeg123', '498492ab1fd13a2d9c7cf49f4da95eeb', '6vGcZx', 'NM4Yl3x67RdgASg3s159FMdrVKxNrGBU', 'asfas@qq.com', '13631575382', '0', '0', '1', '1513319714', '1513318713');
INSERT INTO `kocor_admin` VALUES ('4', 'admin32', 'admin32', '8010d58e6bf55a745938b3517f908512', 'lKhBux', '1I5erAlBez1Z0KYLmKb4YdNO16taFCNU', '502117269@qq.com', '13631575382', '0', '0', '1', '1513328664', '1513319750');
INSERT INTO `kocor_admin` VALUES ('5', 'admin234', 'admin23', 'b38e881982a72879c0f734f1b57ab31a', 'c0BLwW', 'L5WYkGl7SV6dfcH4rqfKNgkgYks7oDgR', '502117269@qq.com', '13631575382', '0', '0', '1', '1513589139', '1513564290');

-- ----------------------------
-- Table structure for `kocor_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `kocor_admin_log`;
CREATE TABLE `kocor_admin_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL COMMENT '管理员ID',
  `user_name` varchar(50) NOT NULL COMMENT '管理员',
  `url` varchar(255) NOT NULL COMMENT '访问地址',
  `params` text NOT NULL COMMENT '请求参数',
  `useragent` varchar(255) NOT NULL,
  `ip` varchar(50) NOT NULL COMMENT '来源IP',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`) USING BTREE,
  KEY `user_name` (`user_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kocor_admin_log
-- ----------------------------
INSERT INTO `kocor_admin_log` VALUES ('1', '1', 'admin', '/admin/backup/index.html', '{\"row\":{\"part\":\"10000\",\"compress\":\"0\",\"tables\":[\"kocor_admin\",\"kocor_admin_log\",\"kocor_article\",\"kocor_article_cate\",\"kocor_auth_group\",\"kocor_auth_group_access\",\"kocor_auth_rule\",\"kocor_config\"]},\"selectall\":\"\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515485293');
INSERT INTO `kocor_admin_log` VALUES ('2', '1', 'admin', '/admin/backup/restore', '{\"sort\":\"id\",\"order\":\"desc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515485298');
INSERT INTO `kocor_admin_log` VALUES ('3', '1', 'admin', '/admin/database/restore', '{\"sort\":\"id\",\"order\":\"desc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515486843');
INSERT INTO `kocor_admin_log` VALUES ('4', '1', 'admin', '/admin/database/restore', '{\"sort\":\"id\",\"order\":\"desc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515486893');
INSERT INTO `kocor_admin_log` VALUES ('5', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515486987');
INSERT INTO `kocor_admin_log` VALUES ('6', '1', 'admin', '/admin/auth_rule/edit/id/37', '{\"row\":{\"is_menu\":\"1\",\"pid\":\"18\",\"title\":\"\\u6570\\u636e\\u5e93\\u7ba1\\u7406\",\"name\":\"database\",\"condition\":\"\",\"icon\":\"fa fa-database\",\"weigh\":\"50\",\"remark\":\"\",\"status\":\"1\"},\"id\":\"37\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515487135');
INSERT INTO `kocor_admin_log` VALUES ('7', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515487141');
INSERT INTO `kocor_admin_log` VALUES ('8', '1', 'admin', '/admin/auth_rule/edit/id/38', '{\"row\":{\"is_menu\":\"1\",\"pid\":\"37\",\"title\":\"\\u6570\\u636e\\u5e93\\u5907\\u4efd\",\"name\":\"database\\/index\",\"condition\":\"\",\"icon\":\"fa fa-files-o\",\"weigh\":\"50\",\"remark\":\"\",\"status\":\"1\"},\"id\":\"38\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515487150');
INSERT INTO `kocor_admin_log` VALUES ('9', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515487153');
INSERT INTO `kocor_admin_log` VALUES ('10', '1', 'admin', '/admin/auth_rule/edit/id/39', '{\"row\":{\"is_menu\":\"1\",\"pid\":\"37\",\"title\":\"\\u6570\\u636e\\u5e93\\u8fd8\\u539f\",\"name\":\"database\\/import\",\"condition\":\"\",\"icon\":\"fa fa-imdb\",\"weigh\":\"50\",\"remark\":\"\",\"status\":\"1\"},\"id\":\"39\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515487163');
INSERT INTO `kocor_admin_log` VALUES ('11', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515487168');
INSERT INTO `kocor_admin_log` VALUES ('12', '1', 'admin', '/admin/database/restore', '{\"sort\":\"id\",\"order\":\"desc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515487187');
INSERT INTO `kocor_admin_log` VALUES ('13', '1', 'admin', '/admin/database/restore', '{\"sort\":\"id\",\"order\":\"desc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515487205');
INSERT INTO `kocor_admin_log` VALUES ('14', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515487216');
INSERT INTO `kocor_admin_log` VALUES ('15', '1', 'admin', '/admin/auth_rule/edit/id/37', '{\"row\":{\"is_menu\":\"1\",\"pid\":\"0\",\"title\":\"\\u6570\\u636e\\u5e93\\u7ba1\\u7406\",\"name\":\"database\",\"condition\":\"\",\"icon\":\"fa fa-database\",\"weigh\":\"50\",\"remark\":\"\",\"status\":\"1\"},\"id\":\"37\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515487223');
INSERT INTO `kocor_admin_log` VALUES ('16', '1', 'admin', '/admin/database/restore', '{\"sort\":\"id\",\"order\":\"desc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515487230');
INSERT INTO `kocor_admin_log` VALUES ('17', '1', 'admin', '/admin/database/restore', '{\"sort\":\"id\",\"order\":\"desc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515487292');
INSERT INTO `kocor_admin_log` VALUES ('18', '1', 'admin', '/admin/database/index.html', '{\"row\":{\"part\":\"tjtj\",\"compress\":\"1\",\"tables\":[\"kocor_admin\",\"kocor_admin_log\",\"kocor_article\",\"kocor_article_cate\",\"kocor_auth_group\",\"kocor_auth_group_access\",\"kocor_auth_rule\",\"kocor_config\"]},\"selectall\":\"\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515487689');
INSERT INTO `kocor_admin_log` VALUES ('19', '1', 'admin', '/admin/database/restore', '{\"sort\":\"id\",\"order\":\"desc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515487703');
INSERT INTO `kocor_admin_log` VALUES ('20', '1', 'admin', '/admin/database/restore', '{\"sort\":\"id\",\"order\":\"desc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515487815');
INSERT INTO `kocor_admin_log` VALUES ('21', '1', 'admin', '/admin/database/restore', '{\"sort\":\"id\",\"order\":\"desc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515487819');
INSERT INTO `kocor_admin_log` VALUES ('22', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515487819');
INSERT INTO `kocor_admin_log` VALUES ('23', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515487859');
INSERT INTO `kocor_admin_log` VALUES ('24', '1', 'admin', '/admin/database/index.html', '{\"row\":{\"part\":\"kyukj\",\"compress\":\"1\",\"tables\":[\"kocor_admin\",\"kocor_admin_log\",\"kocor_article\",\"kocor_article_cate\",\"kocor_auth_group\",\"kocor_auth_group_access\",\"kocor_auth_rule\",\"kocor_config\"]},\"selectall\":\"\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515487878');
INSERT INTO `kocor_admin_log` VALUES ('25', '1', 'admin', '/admin/database/index.html', '{\"row\":{\"part\":\"kyukj\",\"compress\":\"0\",\"tables\":[\"kocor_admin\",\"kocor_admin_log\",\"kocor_article\",\"kocor_article_cate\",\"kocor_auth_group\",\"kocor_auth_group_access\",\"kocor_auth_rule\",\"kocor_config\"]},\"selectall\":\"\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515487891');
INSERT INTO `kocor_admin_log` VALUES ('26', '1', 'admin', '/admin/database/index.html', '{\"row\":{\"part\":\"4647\",\"compress\":\"0\",\"tables\":[\"kocor_admin\",\"kocor_admin_log\",\"kocor_article\",\"kocor_article_cate\",\"kocor_auth_group\",\"kocor_auth_group_access\",\"kocor_auth_rule\",\"kocor_config\"]},\"selectall\":\"\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515487899');
INSERT INTO `kocor_admin_log` VALUES ('27', '1', 'admin', '/admin/database/index.html', '{\"row\":{\"part\":\"-55615\",\"compress\":\"0\",\"tables\":[\"kocor_admin\",\"kocor_admin_log\",\"kocor_article\",\"kocor_article_cate\",\"kocor_auth_group\",\"kocor_auth_group_access\",\"kocor_auth_rule\",\"kocor_config\"]},\"selectall\":\"\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515487976');
INSERT INTO `kocor_admin_log` VALUES ('28', '1', 'admin', '/admin/database/index.html', '{\"row\":{\"part\":\"20971520\",\"compress\":\"5\",\"tables\":[\"kocor_admin\",\"kocor_admin_log\",\"kocor_article\",\"kocor_article_cate\",\"kocor_auth_group\",\"kocor_auth_group_access\",\"kocor_auth_rule\",\"kocor_config\"]},\"selectall\":\"\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515488351');
INSERT INTO `kocor_admin_log` VALUES ('29', '1', 'admin', '/admin/database/index.html', '{\"row\":{\"part\":\"20971521\",\"compress\":\"5\",\"tables\":[\"kocor_admin\",\"kocor_admin_log\",\"kocor_article\",\"kocor_article_cate\",\"kocor_auth_group\",\"kocor_auth_group_access\",\"kocor_auth_rule\",\"kocor_config\"]},\"selectall\":\"\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515488429');
INSERT INTO `kocor_admin_log` VALUES ('30', '1', 'admin', '/admin/database/index.html', '{\"row\":{\"part\":\"ytk\",\"compress\":\"1\",\"tables\":[\"kocor_admin\",\"kocor_admin_log\",\"kocor_article\",\"kocor_article_cate\",\"kocor_auth_group\",\"kocor_auth_group_access\",\"kocor_auth_rule\",\"kocor_config\"]},\"selectall\":\"\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515488498');
INSERT INTO `kocor_admin_log` VALUES ('31', '1', 'admin', '/admin/database/index.html', '{\"row\":{\"part\":\"46546754745\",\"compress\":\"5\",\"tables\":[\"kocor_admin\",\"kocor_admin_log\",\"kocor_article\",\"kocor_article_cate\",\"kocor_auth_group\",\"kocor_auth_group_access\",\"kocor_auth_rule\",\"kocor_config\"]},\"selectall\":\"\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515488601');
INSERT INTO `kocor_admin_log` VALUES ('32', '1', 'admin', '/admin/database/index.html', '{\"row\":{\"part\":\"46546754745\",\"compress\":\"5\",\"tables\":[\"kocor_admin\",\"kocor_admin_log\",\"kocor_article\",\"kocor_article_cate\",\"kocor_auth_group\",\"kocor_auth_group_access\",\"kocor_auth_rule\",\"kocor_config\"]},\"selectall\":\"\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515488618');
INSERT INTO `kocor_admin_log` VALUES ('33', '1', 'admin', '/admin/database/index.html', '{\"row\":{\"part\":\"20971520\",\"compress\":\"0\",\"tables\":[\"kocor_admin\",\"kocor_admin_log\",\"kocor_article\",\"kocor_article_cate\",\"kocor_auth_group\",\"kocor_auth_group_access\",\"kocor_auth_rule\",\"kocor_config\"]},\"selectall\":\"\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515488997');
INSERT INTO `kocor_admin_log` VALUES ('34', '1', 'admin', '/admin/database/restore', '{\"sort\":\"id\",\"order\":\"desc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489000');
INSERT INTO `kocor_admin_log` VALUES ('35', '1', 'admin', '/admin/database/index.html', '{\"row\":{\"part\":\"20971520\",\"compress\":\"1\",\"tables\":[\"kocor_admin\",\"kocor_admin_log\",\"kocor_article\",\"kocor_article_cate\",\"kocor_auth_group\",\"kocor_auth_group_access\",\"kocor_auth_rule\",\"kocor_config\"]},\"selectall\":\"\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489007');
INSERT INTO `kocor_admin_log` VALUES ('36', '1', 'admin', '/admin/database/restore', '{\"sort\":\"id\",\"order\":\"desc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489014');
INSERT INTO `kocor_admin_log` VALUES ('37', '1', 'admin', '/admin/database/index.html', '{\"row\":{\"part\":\"10000\",\"compress\":\"1\",\"tables\":[\"kocor_admin\",\"kocor_admin_log\",\"kocor_article\",\"kocor_article_cate\",\"kocor_auth_group\",\"kocor_auth_group_access\",\"kocor_auth_rule\",\"kocor_config\"]},\"selectall\":\"\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489034');
INSERT INTO `kocor_admin_log` VALUES ('38', '1', 'admin', '/admin/database/restore', '{\"sort\":\"id\",\"order\":\"desc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489037');
INSERT INTO `kocor_admin_log` VALUES ('39', '1', 'admin', '/admin/database/index.html', '{\"row\":{\"part\":\"10000\",\"compress\":\"0\",\"tables\":[\"kocor_admin\",\"kocor_admin_log\",\"kocor_article\",\"kocor_article_cate\",\"kocor_auth_group\",\"kocor_auth_group_access\",\"kocor_auth_rule\",\"kocor_config\"]},\"selectall\":\"\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489050');
INSERT INTO `kocor_admin_log` VALUES ('40', '1', 'admin', '/admin/database/restore', '{\"sort\":\"id\",\"order\":\"desc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489052');
INSERT INTO `kocor_admin_log` VALUES ('41', '1', 'admin', '/admin/article_cate/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489087');
INSERT INTO `kocor_admin_log` VALUES ('42', '1', 'admin', '/admin/article/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489087');
INSERT INTO `kocor_admin_log` VALUES ('43', '1', 'admin', '/admin/admin_log/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489090');
INSERT INTO `kocor_admin_log` VALUES ('44', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489095');
INSERT INTO `kocor_admin_log` VALUES ('45', '1', 'admin', '/admin/auth_group/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489096');
INSERT INTO `kocor_admin_log` VALUES ('46', '1', 'admin', '/admin/admin/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489097');
INSERT INTO `kocor_admin_log` VALUES ('47', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489119');
INSERT INTO `kocor_admin_log` VALUES ('48', '1', 'admin', '/admin/auth_group/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489121');
INSERT INTO `kocor_admin_log` VALUES ('49', '1', 'admin', '/admin/admin/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489124');
INSERT INTO `kocor_admin_log` VALUES ('50', '1', 'admin', '/admin/admin_log/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489126');
INSERT INTO `kocor_admin_log` VALUES ('51', '1', 'admin', '/admin/article/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489161');
INSERT INTO `kocor_admin_log` VALUES ('52', '1', 'admin', '/admin/article_cate/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489161');
INSERT INTO `kocor_admin_log` VALUES ('53', '1', 'admin', '/admin/database/restore', '{\"sort\":\"id\",\"order\":\"desc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489163');
INSERT INTO `kocor_admin_log` VALUES ('54', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489293');
INSERT INTO `kocor_admin_log` VALUES ('55', '1', 'admin', '/admin/auth_group/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489294');
INSERT INTO `kocor_admin_log` VALUES ('56', '1', 'admin', '/admin/admin/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489294');
INSERT INTO `kocor_admin_log` VALUES ('57', '1', 'admin', '/admin/admin_log/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489296');
INSERT INTO `kocor_admin_log` VALUES ('58', '1', 'admin', '/admin/article_cate/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489297');
INSERT INTO `kocor_admin_log` VALUES ('59', '1', 'admin', '/admin/article/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489298');
INSERT INTO `kocor_admin_log` VALUES ('60', '1', 'admin', '/admin/database/restore', '{\"sort\":\"id\",\"order\":\"desc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489299');
INSERT INTO `kocor_admin_log` VALUES ('61', '1', 'admin', '/admin/database/restore', '{\"sort\":\"id\",\"order\":\"desc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489335');
INSERT INTO `kocor_admin_log` VALUES ('62', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489362');
INSERT INTO `kocor_admin_log` VALUES ('63', '1', 'admin', '/admin/admin/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489652');
INSERT INTO `kocor_admin_log` VALUES ('64', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489694');
INSERT INTO `kocor_admin_log` VALUES ('65', '1', 'admin', '/admin/auth_group/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489695');
INSERT INTO `kocor_admin_log` VALUES ('66', '1', 'admin', '/admin/admin/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489696');
INSERT INTO `kocor_admin_log` VALUES ('67', '1', 'admin', '/admin/admin_log/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489701');
INSERT INTO `kocor_admin_log` VALUES ('68', '1', 'admin', '/admin/article/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489702');
INSERT INTO `kocor_admin_log` VALUES ('69', '1', 'admin', '/admin/article_cate/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489703');
INSERT INTO `kocor_admin_log` VALUES ('70', '1', 'admin', '/admin/database/restore', '{\"sort\":\"id\",\"order\":\"desc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489704');
INSERT INTO `kocor_admin_log` VALUES ('71', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489740');
INSERT INTO `kocor_admin_log` VALUES ('72', '1', 'admin', '/admin/auth_group/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489741');
INSERT INTO `kocor_admin_log` VALUES ('73', '1', 'admin', '/admin/admin/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489741');
INSERT INTO `kocor_admin_log` VALUES ('74', '1', 'admin', '/admin/admin_log/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489745');
INSERT INTO `kocor_admin_log` VALUES ('75', '1', 'admin', '/admin/article_cate/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489746');
INSERT INTO `kocor_admin_log` VALUES ('76', '1', 'admin', '/admin/article/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489746');
INSERT INTO `kocor_admin_log` VALUES ('77', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489846');
INSERT INTO `kocor_admin_log` VALUES ('78', '1', 'admin', '/admin/auth_group/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489846');
INSERT INTO `kocor_admin_log` VALUES ('79', '1', 'admin', '/admin/admin/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489846');
INSERT INTO `kocor_admin_log` VALUES ('80', '1', 'admin', '/admin/admin_log/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489858');
INSERT INTO `kocor_admin_log` VALUES ('81', '1', 'admin', '/admin/article_cate/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489861');
INSERT INTO `kocor_admin_log` VALUES ('82', '1', 'admin', '/admin/article/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489862');
INSERT INTO `kocor_admin_log` VALUES ('83', '1', 'admin', '/admin/database/restore', '{\"sort\":\"id\",\"order\":\"desc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489867');
INSERT INTO `kocor_admin_log` VALUES ('84', '1', 'admin', '/admin/admin/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489900');
INSERT INTO `kocor_admin_log` VALUES ('85', '1', 'admin', '/admin/auth_group/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489978');
INSERT INTO `kocor_admin_log` VALUES ('86', '1', 'admin', '/admin/admin/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489979');
INSERT INTO `kocor_admin_log` VALUES ('87', '1', 'admin', '/admin/admin_log/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489982');
INSERT INTO `kocor_admin_log` VALUES ('88', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489985');
INSERT INTO `kocor_admin_log` VALUES ('89', '1', 'admin', '/admin/article_cate/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489988');
INSERT INTO `kocor_admin_log` VALUES ('90', '1', 'admin', '/admin/article/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489988');
INSERT INTO `kocor_admin_log` VALUES ('91', '1', 'admin', '/admin/database/restore', '{\"sort\":\"id\",\"order\":\"desc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515489989');
INSERT INTO `kocor_admin_log` VALUES ('92', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515490022');
INSERT INTO `kocor_admin_log` VALUES ('93', '1', 'admin', '/admin/auth_group/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515490023');
INSERT INTO `kocor_admin_log` VALUES ('94', '1', 'admin', '/admin/admin/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515490023');
INSERT INTO `kocor_admin_log` VALUES ('95', '1', 'admin', '/admin/admin_log/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515490026');
INSERT INTO `kocor_admin_log` VALUES ('96', '1', 'admin', '/admin/article/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515490062');
INSERT INTO `kocor_admin_log` VALUES ('97', '1', 'admin', '/admin/database/restore', '{\"sort\":\"id\",\"order\":\"desc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515490069');
INSERT INTO `kocor_admin_log` VALUES ('98', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515490300');
INSERT INTO `kocor_admin_log` VALUES ('99', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515490313');
INSERT INTO `kocor_admin_log` VALUES ('100', '1', 'admin', '/admin/auth_group/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515490320');
INSERT INTO `kocor_admin_log` VALUES ('101', '1', 'admin', '/admin/admin/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515490322');
INSERT INTO `kocor_admin_log` VALUES ('102', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515491114');
INSERT INTO `kocor_admin_log` VALUES ('103', '1', 'admin', '/admin/auth_group/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515491117');
INSERT INTO `kocor_admin_log` VALUES ('104', '1', 'admin', '/admin/admin/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515491119');
INSERT INTO `kocor_admin_log` VALUES ('105', '1', 'admin', '/admin/article_cate/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515491130');
INSERT INTO `kocor_admin_log` VALUES ('106', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515491556');
INSERT INTO `kocor_admin_log` VALUES ('107', '1', 'admin', '/admin/auth_group/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515491558');
INSERT INTO `kocor_admin_log` VALUES ('108', '1', 'admin', '/admin/admin/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515491559');
INSERT INTO `kocor_admin_log` VALUES ('109', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515491572');
INSERT INTO `kocor_admin_log` VALUES ('110', '1', 'admin', '/admin/auth_group/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515491573');
INSERT INTO `kocor_admin_log` VALUES ('111', '1', 'admin', '/admin/admin/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515491573');
INSERT INTO `kocor_admin_log` VALUES ('112', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515491596');
INSERT INTO `kocor_admin_log` VALUES ('113', '1', 'admin', '/admin/auth_group/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515491597');
INSERT INTO `kocor_admin_log` VALUES ('114', '1', 'admin', '/admin/admin_log/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515491601');
INSERT INTO `kocor_admin_log` VALUES ('115', '1', 'admin', '/admin/article_cate/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515491604');
INSERT INTO `kocor_admin_log` VALUES ('116', '1', 'admin', '/admin/article/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515491604');
INSERT INTO `kocor_admin_log` VALUES ('117', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515491742');
INSERT INTO `kocor_admin_log` VALUES ('118', '1', 'admin', '/admin/auth_group/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515491752');
INSERT INTO `kocor_admin_log` VALUES ('119', '1', 'admin', '/admin/admin/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515491754');
INSERT INTO `kocor_admin_log` VALUES ('120', '1', 'admin', '/admin/admin_log/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515491761');
INSERT INTO `kocor_admin_log` VALUES ('121', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515491825');
INSERT INTO `kocor_admin_log` VALUES ('122', '1', 'admin', '/admin/auth_group/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515491826');
INSERT INTO `kocor_admin_log` VALUES ('123', '1', 'admin', '/admin/admin/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515491826');
INSERT INTO `kocor_admin_log` VALUES ('124', '1', 'admin', '/admin/admin_log/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515491831');
INSERT INTO `kocor_admin_log` VALUES ('125', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515491915');
INSERT INTO `kocor_admin_log` VALUES ('126', '1', 'admin', '/admin/auth_group/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515491915');
INSERT INTO `kocor_admin_log` VALUES ('127', '1', 'admin', '/admin/admin/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515491916');
INSERT INTO `kocor_admin_log` VALUES ('128', '1', 'admin', '/admin/admin_log/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515491918');
INSERT INTO `kocor_admin_log` VALUES ('129', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515491958');
INSERT INTO `kocor_admin_log` VALUES ('130', '1', 'admin', '/admin/auth_group/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515491959');
INSERT INTO `kocor_admin_log` VALUES ('131', '1', 'admin', '/admin/admin/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515491959');
INSERT INTO `kocor_admin_log` VALUES ('132', '1', 'admin', '/admin/admin_log/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515491960');
INSERT INTO `kocor_admin_log` VALUES ('133', '1', 'admin', '/admin/article_cate/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515491963');
INSERT INTO `kocor_admin_log` VALUES ('134', '1', 'admin', '/admin/article/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515491964');
INSERT INTO `kocor_admin_log` VALUES ('135', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515491998');
INSERT INTO `kocor_admin_log` VALUES ('136', '1', 'admin', '/admin/auth_group/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515491999');
INSERT INTO `kocor_admin_log` VALUES ('137', '1', 'admin', '/admin/admin/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515492000');
INSERT INTO `kocor_admin_log` VALUES ('138', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515492250');
INSERT INTO `kocor_admin_log` VALUES ('139', '1', 'admin', '/admin/auth_group/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515492251');
INSERT INTO `kocor_admin_log` VALUES ('140', '1', 'admin', '/admin/admin/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515492251');
INSERT INTO `kocor_admin_log` VALUES ('141', '1', 'admin', '/admin/admin_log/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515492256');
INSERT INTO `kocor_admin_log` VALUES ('142', '1', 'admin', '/admin/article_cate/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515492259');
INSERT INTO `kocor_admin_log` VALUES ('143', '1', 'admin', '/admin/article/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515492260');
INSERT INTO `kocor_admin_log` VALUES ('144', '1', 'admin', '/admin/database/restore', '{\"sort\":\"id\",\"order\":\"desc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515492300');
INSERT INTO `kocor_admin_log` VALUES ('145', '1', 'admin', '/admin/config/edit.html', '{\"row\":{\"sitename\":\"kocol\\u7ba1\\u7406\\u7cfb\\u7edf1\",\"keyword\":\"kocol\\uff0c\\u7ba1\\u7406\\u7cfb\\u7edf\",\"description\":\"kocol\\u7ba1\\u7406\\u7cfb\\u7edf\\uff0c\\u4e3a\\u81ea\\u5df1\\u5f00\\u53d1\\u7cfb\\u7edf\",\"beian\":\"\\u7ca445356612345\\u53f7\",\"sgsggs\":\"\",\"categorytype\":\"{\\\"basic\\\":\\\"\\u57fa\\u7840\\u914d\\u7f6e\\\",\\\"email\\\":\\\"\\u90ae\\u4ef6\\u914d\\u7f6e\\\",\\\"dictionary\\\":\\\"\\u5b57\\u5178\\u914d\\u7f6e\\\",\\\"user\\\":\\\"\\u4f1a\\u5458\\u914d\\u7f6e11\\\"}\"}}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515492433');
INSERT INTO `kocor_admin_log` VALUES ('146', '1', 'admin', '/admin/config/edit.html', '{\"row\":{\"sitename\":\"kocol\\u7ba1\\u7406\\u7cfb\\u7edf\",\"keyword\":\"kocol\\uff0c\\u7ba1\\u7406\\u7cfb\\u7edf\",\"description\":\"kocol\\u7ba1\\u7406\\u7cfb\\u7edf\\uff0c\\u4e3a\\u81ea\\u5df1\\u5f00\\u53d1\\u7cfb\\u7edf\",\"beian\":\"\\u7ca445356612345\\u53f7\",\"sgsggs\":\"\",\"categorytype\":\"{\\\"basic\\\":\\\"\\u57fa\\u7840\\u914d\\u7f6e\\\",\\\"email\\\":\\\"\\u90ae\\u4ef6\\u914d\\u7f6e\\\",\\\"dictionary\\\":\\\"\\u5b57\\u5178\\u914d\\u7f6e\\\",\\\"user\\\":\\\"\\u4f1a\\u5458\\u914d\\u7f6e\\\"}\"}}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515492450');
INSERT INTO `kocor_admin_log` VALUES ('147', '0', '', '/admin/index/login.html', '{\"user_name\":\"\\u7535\\u8bdd\",\"password\":\"dfhs \",\"captcha\":\"\\u54c8\\u65e5\\u6c99\\u65e5\\u52d2\\u5409\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515494223');
INSERT INTO `kocor_admin_log` VALUES ('148', '1', 'admin', '/admin/index/login.html', '{\"user_name\":\"admin\",\"password\":\"123456\",\"captcha\":\"revsp\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515494241');
INSERT INTO `kocor_admin_log` VALUES ('149', '0', '', '/admin/index/login.html', '{\"user_name\":\"admin\",\"password\":\"123456\",\"captcha\":\"py5hkkk\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515494265');
INSERT INTO `kocor_admin_log` VALUES ('150', '0', '', '/admin/index/login.html', '{\"user_name\":\"admin\",\"password\":\"dsf\",\"captcha\":\"py5hkkk\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515494295');
INSERT INTO `kocor_admin_log` VALUES ('151', '0', '', '/admin/index/login.html', '{\"user_name\":\"admin\",\"password\":\"sh\",\"captcha\":\"py5hkkk\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515494313');
INSERT INTO `kocor_admin_log` VALUES ('152', '1', 'admin', '/admin/index/login.html', '{\"user_name\":\"admin\",\"password\":\"123456\",\"captcha\":\"3fuax\",\"remember\":\"on\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515494533');
INSERT INTO `kocor_admin_log` VALUES ('153', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515494538');
INSERT INTO `kocor_admin_log` VALUES ('154', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515494660');
INSERT INTO `kocor_admin_log` VALUES ('155', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515494667');
INSERT INTO `kocor_admin_log` VALUES ('156', '1', 'admin', '/admin/article_cate/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515494671');
INSERT INTO `kocor_admin_log` VALUES ('157', '1', 'admin', '/admin/article/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515494672');
INSERT INTO `kocor_admin_log` VALUES ('158', '1', 'admin', '/admin/auth_group/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515494679');
INSERT INTO `kocor_admin_log` VALUES ('159', '1', 'admin', '/admin/admin/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515494680');
INSERT INTO `kocor_admin_log` VALUES ('160', '1', 'admin', '/admin/auth_group/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515494705');
INSERT INTO `kocor_admin_log` VALUES ('161', '1', 'admin', '/admin/admin/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515494705');
INSERT INTO `kocor_admin_log` VALUES ('162', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1515494706');
INSERT INTO `kocor_admin_log` VALUES ('163', '1', 'admin', '/admin/index/login.html', '{\"user_name\":\"admin\",\"password\":\"123456\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.246.169', '1518002379');
INSERT INTO `kocor_admin_log` VALUES ('164', '1', 'admin', '/admin/auth_group/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.246.169', '1518002387');
INSERT INTO `kocor_admin_log` VALUES ('165', '1', 'admin', '/admin/admin/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.246.169', '1518002388');
INSERT INTO `kocor_admin_log` VALUES ('166', '1', 'admin', '/admin/admin_log/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.246.169', '1518002391');
INSERT INTO `kocor_admin_log` VALUES ('167', '1', 'admin', '/admin/article_cate/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.246.169', '1518002393');
INSERT INTO `kocor_admin_log` VALUES ('168', '1', 'admin', '/admin/article/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.246.169', '1518002393');
INSERT INTO `kocor_admin_log` VALUES ('169', '1', 'admin', '/admin/index/login.html', '{\"user_name\":\"admin\",\"password\":\"123456\",\"captcha\":\"sj7jl\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.246.169', '1518059168');
INSERT INTO `kocor_admin_log` VALUES ('170', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.246.169', '1518059179');
INSERT INTO `kocor_admin_log` VALUES ('171', '1', 'admin', '/admin/auth_group/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.246.169', '1518059180');
INSERT INTO `kocor_admin_log` VALUES ('172', '1', 'admin', '/admin/admin/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.246.169', '1518059180');
INSERT INTO `kocor_admin_log` VALUES ('173', '1', 'admin', '/admin/admin_log/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.246.169', '1518059182');
INSERT INTO `kocor_admin_log` VALUES ('174', '1', 'admin', '/admin/article_cate/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.246.169', '1518059184');
INSERT INTO `kocor_admin_log` VALUES ('175', '1', 'admin', '/admin/article/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.246.169', '1518059184');
INSERT INTO `kocor_admin_log` VALUES ('176', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.176.38', '1518078994');
INSERT INTO `kocor_admin_log` VALUES ('177', '1', 'admin', '/admin/auth_group/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.176.38', '1518078994');
INSERT INTO `kocor_admin_log` VALUES ('178', '1', 'admin', '/admin/admin/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.176.38', '1518078995');
INSERT INTO `kocor_admin_log` VALUES ('179', '1', 'admin', '/admin/database/index.html', '{\"row\":{\"part\":\"20971520\",\"compress\":\"1\",\"tables\":[\"kocor_admin\",\"kocor_admin_log\",\"kocor_article\",\"kocor_article_cate\",\"kocor_auth_group\",\"kocor_auth_group_access\",\"kocor_auth_rule\",\"kocor_config\"]},\"selectall\":\"\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.176.38', '1518082071');
INSERT INTO `kocor_admin_log` VALUES ('180', '1', 'admin', '/admin/database/restore', '{\"sort\":\"id\",\"order\":\"desc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.176.38', '1518082083');
INSERT INTO `kocor_admin_log` VALUES ('181', '1', 'admin', '/admin/article_cate/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.176.38', '1518082096');
INSERT INTO `kocor_admin_log` VALUES ('182', '1', 'admin', '/admin/article/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.176.38', '1518082097');
INSERT INTO `kocor_admin_log` VALUES ('183', '1', 'admin', '/admin/article_cate/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.176.38', '1518082110');
INSERT INTO `kocor_admin_log` VALUES ('184', '1', 'admin', '/admin/article_cate/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.176.38', '1518082634');
INSERT INTO `kocor_admin_log` VALUES ('185', '1', 'admin', '/admin/article_cate/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.176.38', '1518082639');
INSERT INTO `kocor_admin_log` VALUES ('186', '1', 'admin', '/admin/article_cate/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.176.38', '1518082779');
INSERT INTO `kocor_admin_log` VALUES ('187', '1', 'admin', '/admin/ajax/fileInputUpload', '{\"file_id\":\"0\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.176.38', '1518082784');
INSERT INTO `kocor_admin_log` VALUES ('188', '1', 'admin', '/admin/article_cate/edit/id/1', '{\"row\":{\"pid\":\"0\",\"name\":\"\\u5355\\u8428\\u521a\",\"pic\":\"\\/uploads\\/images\\/20180208\\/a92581c453c6313b7337a12de16fe3a5.jpg\",\"weigh\":\"50\",\"status\":\"1\",\"seo_title\":\"\",\"seo_keyword\":\"SEO\\u5173\\u952e\\u8bcd\",\"seo_description\":\"SEO\\u63cf\\u8ff0\"},\"upload\":\"\",\"id\":\"1\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.176.38', '1518082787');
INSERT INTO `kocor_admin_log` VALUES ('189', '1', 'admin', '/admin/article_cate/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.176.38', '1518082792');
INSERT INTO `kocor_admin_log` VALUES ('190', '1', 'admin', '/admin/article/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.176.38', '1518082796');
INSERT INTO `kocor_admin_log` VALUES ('191', '1', 'admin', '/admin/article_cate/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.176.38', '1518082845');
INSERT INTO `kocor_admin_log` VALUES ('192', '1', 'admin', '/admin/article/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.176.38', '1518082848');
INSERT INTO `kocor_admin_log` VALUES ('193', '1', 'admin', '/admin/article/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.176.38', '1518082871');
INSERT INTO `kocor_admin_log` VALUES ('194', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.176.38', '1518082885');
INSERT INTO `kocor_admin_log` VALUES ('195', '1', 'admin', '/admin/auth_group/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.176.38', '1518082894');
INSERT INTO `kocor_admin_log` VALUES ('196', '1', 'admin', '/admin/admin/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.176.38', '1518082895');
INSERT INTO `kocor_admin_log` VALUES ('197', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.176.38', '1518082915');
INSERT INTO `kocor_admin_log` VALUES ('198', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.176.38', '1518082978');
INSERT INTO `kocor_admin_log` VALUES ('199', '1', 'admin', '/admin/auth_group/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.176.38', '1518082978');
INSERT INTO `kocor_admin_log` VALUES ('200', '1', 'admin', '/admin/admin/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.176.38', '1518082979');
INSERT INTO `kocor_admin_log` VALUES ('201', '1', 'admin', '/admin/admin_log/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.176.38', '1518082982');
INSERT INTO `kocor_admin_log` VALUES ('202', '1', 'admin', '/admin/article_cate/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.176.38', '1518082983');
INSERT INTO `kocor_admin_log` VALUES ('203', '1', 'admin', '/admin/article/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.176.38', '1518082984');
INSERT INTO `kocor_admin_log` VALUES ('204', '1', 'admin', '/admin/database/restore', '{\"sort\":\"id\",\"order\":\"desc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.176.38', '1518082985');
INSERT INTO `kocor_admin_log` VALUES ('205', '0', '', '/admin/index/login.html', '{\"user_name\":\"admin\",\"password\":\"123456\",\"captcha\":\"y2vvl\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.244.87', '1519614946');
INSERT INTO `kocor_admin_log` VALUES ('206', '1', 'admin', '/admin/index/login.html', '{\"user_name\":\"admin\",\"password\":\"123456\",\"captcha\":\"v4xvu\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.244.87', '1519614964');
INSERT INTO `kocor_admin_log` VALUES ('207', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.244.87', '1519614972');
INSERT INTO `kocor_admin_log` VALUES ('208', '1', 'admin', '/admin/auth_group/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.244.87', '1519614982');
INSERT INTO `kocor_admin_log` VALUES ('209', '1', 'admin', '/admin/admin/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.244.87', '1519614982');
INSERT INTO `kocor_admin_log` VALUES ('210', '1', 'admin', '/admin/admin_log/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.244.87', '1519614985');
INSERT INTO `kocor_admin_log` VALUES ('211', '1', 'admin', '/admin/article_cate/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.244.87', '1519614987');
INSERT INTO `kocor_admin_log` VALUES ('212', '1', 'admin', '/admin/article/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.244.87', '1519614987');
INSERT INTO `kocor_admin_log` VALUES ('213', '1', 'admin', '/admin/database/restore', '{\"sort\":\"id\",\"order\":\"desc\"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '183.15.244.87', '1519614990');
INSERT INTO `kocor_admin_log` VALUES ('214', '1', 'admin', '/admin/index/login.html', '{\"user_name\":\"admin\",\"password\":\"123456\",\"captcha\":\"hy8cg\",\"remember\":\"on\"}', 'Mozilla/5.0 (Linux; U; Android 8.0.0; zh-CN; MHA-AL00 Build/HUAWEIMHA-AL00) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.108 UCBrowser/11.9.3.973 Mobile Safari/537.36', '117.136.79.147', '1522693121');
INSERT INTO `kocor_admin_log` VALUES ('215', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Linux; U; Android 8.0.0; zh-CN; MHA-AL00 Build/HUAWEIMHA-AL00) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.108 UCBrowser/11.9.3.973 Mobile Safari/537.36', '117.136.79.147', '1522693133');
INSERT INTO `kocor_admin_log` VALUES ('216', '1', 'admin', '/admin/admin_log/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Linux; U; Android 8.0.0; zh-CN; MHA-AL00 Build/HUAWEIMHA-AL00) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.108 UCBrowser/11.9.3.973 Mobile Safari/537.36', '117.136.79.147', '1522693195');
INSERT INTO `kocor_admin_log` VALUES ('217', '1', 'admin', '/admin/article_cate/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Linux; U; Android 8.0.0; zh-CN; MHA-AL00 Build/HUAWEIMHA-AL00) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.108 UCBrowser/11.9.3.973 Mobile Safari/537.36', '117.136.79.147', '1522693198');
INSERT INTO `kocor_admin_log` VALUES ('218', '1', 'admin', '/admin/index/login.html', '{\"user_name\":\"admin\",\"password\":\"123456\",\"captcha\":\"bcuhp\"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; TCO_20180403134821; rv:11.0) like Gecko', '116.25.43.38', '1522735113');
INSERT INTO `kocor_admin_log` VALUES ('219', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; TCO_20180403134821; rv:11.0) like Gecko', '116.25.43.38', '1522735124');
INSERT INTO `kocor_admin_log` VALUES ('220', '1', 'admin', '/admin/auth_group/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; TCO_20180403134821; rv:11.0) like Gecko', '116.25.43.38', '1522735130');
INSERT INTO `kocor_admin_log` VALUES ('221', '1', 'admin', '/admin/admin/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; TCO_20180403134821; rv:11.0) like Gecko', '116.25.43.38', '1522735135');
INSERT INTO `kocor_admin_log` VALUES ('222', '1', 'admin', '/admin/admin_log/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; TCO_20180403134821; rv:11.0) like Gecko', '116.25.43.38', '1522735153');
INSERT INTO `kocor_admin_log` VALUES ('223', '1', 'admin', '/admin/admin_log/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; TCO_20180403134821; rv:11.0) like Gecko', '116.25.43.38', '1522735172');
INSERT INTO `kocor_admin_log` VALUES ('224', '1', 'admin', '/admin/admin_log/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; TCO_20180403134821; rv:11.0) like Gecko', '116.25.43.38', '1522735199');
INSERT INTO `kocor_admin_log` VALUES ('225', '1', 'admin', '/admin/article_cate/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; TCO_20180403134821; rv:11.0) like Gecko', '116.25.43.38', '1522735206');
INSERT INTO `kocor_admin_log` VALUES ('226', '1', 'admin', '/admin/article/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; TCO_20180403134821; rv:11.0) like Gecko', '116.25.43.38', '1522735210');
INSERT INTO `kocor_admin_log` VALUES ('227', '0', '', '/admin/index/login.html', '{\"user_name\":\"admin\",\"password\":\"admin\",\"captcha\":\"rjcrk\"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1523697617');
INSERT INTO `kocor_admin_log` VALUES ('228', '0', '', '/admin/index/login.html', '{\"user_name\":\"admin\",\"password\":\"123456\",\"captcha\":\"hukuz\"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1523697637');
INSERT INTO `kocor_admin_log` VALUES ('229', '1', 'admin', '/admin/index/login.html', '{\"user_name\":\"admin\",\"password\":\"123456\",\"captcha\":\"smcp6\"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1523697654');
INSERT INTO `kocor_admin_log` VALUES ('230', '1', 'admin', '/admin/auth_rule/index', '{\"sort\":\"id\",\"order\":\"asc\"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1523697662');
INSERT INTO `kocor_admin_log` VALUES ('231', '1', 'admin', '/admin/auth_group/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1523697665');
INSERT INTO `kocor_admin_log` VALUES ('232', '1', 'admin', '/admin/admin/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1523697668');
INSERT INTO `kocor_admin_log` VALUES ('233', '1', 'admin', '/admin/admin_log/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":\"0\",\"limit\":\"25\"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1523697677');
INSERT INTO `kocor_admin_log` VALUES ('234', '1', 'admin', '/admin/article_cate/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1523697680');
INSERT INTO `kocor_admin_log` VALUES ('235', '1', 'admin', '/admin/article/index', '{\"sort\":\"id\",\"order\":\"desc\",\"offset\":0,\"limit\":25}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1523697681');
INSERT INTO `kocor_admin_log` VALUES ('236', '1', 'admin', '/admin/database/restore', '{\"sort\":\"id\",\"order\":\"desc\"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '127.0.0.1', '1523697686');

-- ----------------------------
-- Table structure for `kocor_article`
-- ----------------------------
DROP TABLE IF EXISTS `kocor_article`;
CREATE TABLE `kocor_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `pic` varchar(255) NOT NULL COMMENT '栏目缩略图',
  `content` text NOT NULL,
  `weigh` int(11) unsigned NOT NULL COMMENT '权重',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `seo_title` varchar(255) NOT NULL COMMENT 'seo标题',
  `seo_keyword` varchar(255) NOT NULL COMMENT 'seo关键词',
  `seo_description` varchar(255) NOT NULL COMMENT 'seo描述',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `pid` (`cate_id`) USING BTREE,
  KEY `name` (`title`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kocor_article
-- ----------------------------
INSERT INTO `kocor_article` VALUES ('1', '1', '单萨刚', '/uploads/images/20180208/a92581c453c6313b7337a12de16fe3a5.jpg', '<p>YUKTTfdshdfj</p>\r\n', '50', '1', '', 'SEO关键词', 'SEO描述', '1514373025', '1513592754');
INSERT INTO `kocor_article` VALUES ('2', '1', '暗杀神过', '/uploads/images/20180208/a92581c453c6313b7337a12de16fe3a5.jpg', '<p>DASGAGS</p>\r\n', '50', '1', 'ghrhr', 'grehe', 'h5tjtyjuil', '1514372999', '1513593019');
INSERT INTO `kocor_article` VALUES ('3', '1', '文章管理1', '/uploads/images/20180208/a92581c453c6313b7337a12de16fe3a5.jpg', '<ol>\r\n	<li>凤凰台和个鸡腿1222</li>\r\n</ol>\r\n', '501', '1', 'ghrhr1', 'grehe1', '撒个1', '1514372989', '1513596508');
INSERT INTO `kocor_article` VALUES ('4', '1', '友情链接1', '/uploads/images/20180208/a92581c453c6313b7337a12de16fe3a5.jpg', '<p>啁刘璐璐䴫uu两天了阿法索福啊辅导费</p>\r\n', '50', '1', 'ghrhr1', 'grehe', '啊啥噶啥', '1514281381', '1513924407');
INSERT INTO `kocor_article` VALUES ('15', '1', '爱是方法', '/uploads/images/20180208/a92581c453c6313b7337a12de16fe3a5.jpg', '<p>阿格规文顾问个人个人热点呃个人54545111111222765fgjgjg<img alt=\"\" src=\"/uploads/images/20171226/87e9154d74ea3b196b3e8dc15f42995c.jpg\" style=\"height:1462px; width:2041px\" /></p>\r\n', '50', '1', '萨芬', '讽德诵功如何', '突然间就', '1514430389', '1514281686');

-- ----------------------------
-- Table structure for `kocor_article_cate`
-- ----------------------------
DROP TABLE IF EXISTS `kocor_article_cate`;
CREATE TABLE `kocor_article_cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(255) NOT NULL COMMENT '栏目名称',
  `pic` varchar(255) NOT NULL COMMENT '栏目缩略图',
  `weigh` int(11) unsigned NOT NULL COMMENT '权重',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `seo_title` varchar(255) NOT NULL COMMENT 'seo标题',
  `seo_keyword` varchar(255) NOT NULL COMMENT 'seo关键词',
  `seo_description` varchar(255) NOT NULL COMMENT 'seo描述',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kocor_article_cate
-- ----------------------------
INSERT INTO `kocor_article_cate` VALUES ('1', '0', '单萨刚', '/uploads/images/20180208/a92581c453c6313b7337a12de16fe3a5.jpg', '50', '1', '', 'SEO关键词', 'SEO描述', '1518082787', '1513592754');
INSERT INTO `kocor_article_cate` VALUES ('2', '1', '暗杀神过', '/uploads/images/20180208/a92581c453c6313b7337a12de16fe3a5.jpg', '50', '1', 'ghrhr', 'grehe', 'h5tjtyjuil', '1513593019', '1513593019');

-- ----------------------------
-- Table structure for `kocor_auth_group`
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
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`) USING BTREE,
  KEY `title` (`title`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kocor_auth_group
-- ----------------------------
INSERT INTO `kocor_auth_group` VALUES ('1', '0', '超级管理员', '1', '*', '', '0', '0');
INSERT INTO `kocor_auth_group` VALUES ('2', '1', '二级管理员', '1', '1,2,8,9,13,14,18,22,24,25', '', '0', '0');
INSERT INTO `kocor_auth_group` VALUES ('3', '5', '三级管理员', '1', '2,8,9,10', '', '0', '0');
INSERT INTO `kocor_auth_group` VALUES ('4', '3', '四级管理员', '1', '2,8,9', '', '0', '0');
INSERT INTO `kocor_auth_group` VALUES ('5', '1', '二级管理员2', '1', '2,8,9,10,11,12', '', '0', '0');

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
INSERT INTO `kocor_auth_group_access` VALUES ('1', '2');
INSERT INTO `kocor_auth_group_access` VALUES ('1', '4');
INSERT INTO `kocor_auth_group_access` VALUES ('2', '2');
INSERT INTO `kocor_auth_group_access` VALUES ('3', '2');
INSERT INTO `kocor_auth_group_access` VALUES ('3', '5');
INSERT INTO `kocor_auth_group_access` VALUES ('4', '2');
INSERT INTO `kocor_auth_group_access` VALUES ('4', '5');
INSERT INTO `kocor_auth_group_access` VALUES ('5', '4');

-- ----------------------------
-- Table structure for `kocor_auth_rule`
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
  UNIQUE KEY `name` (`name`),
  KEY `pid` (`pid`) USING BTREE,
  KEY `weigh` (`weigh`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kocor_auth_rule
-- ----------------------------
INSERT INTO `kocor_auth_rule` VALUES ('1', '0', 'index/index', '主页', '1', '1', '', '1', 'fa fa-dashboard', '50', '', '1512962345', '1512962345');
INSERT INTO `kocor_auth_rule` VALUES ('2', '0', 'auth-menu', '权限管理', '1', '1', '', '1', 'fa fa-expeditedssl', '50', '', '1513593959', '1512961123');
INSERT INTO `kocor_auth_rule` VALUES ('3', '2', 'auth_rule', '权限规则管理', '1', '1', '', '1', 'fa fa-flag-o', '50', '', '1513325767', '1512961123');
INSERT INTO `kocor_auth_rule` VALUES ('4', '3', 'auth_rule/index', '列表', '1', '1', '', '0', 'fa fa-dedent', '50', '', '1512961180', '1512961180');
INSERT INTO `kocor_auth_rule` VALUES ('5', '3', 'auth_rule/add', '增加', '1', '1', '', '0', 'fa fa-list', '50', '', '1512961221', '1512961221');
INSERT INTO `kocor_auth_rule` VALUES ('6', '3', 'auth_rule/edit', '编辑', '1', '1', '', '0', 'fa fa-list', '50', '', '1512961249', '1512961249');
INSERT INTO `kocor_auth_rule` VALUES ('7', '3', 'auth_rule/del', '删除', '1', '1', '', '0', 'fa fa-list', '50', '', '1512961275', '1512961275');
INSERT INTO `kocor_auth_rule` VALUES ('8', '2', 'auth_group', '权限组管理', '1', '1', '', '1', 'fa fa-group', '50', '', '1513325667', '1512961460');
INSERT INTO `kocor_auth_rule` VALUES ('9', '8', 'auth_group/index', '列表', '1', '1', '', '0', 'fa fa-server', '50', '权限组添加、删除以及分配权限管理', '1513143893', '1512961460');
INSERT INTO `kocor_auth_rule` VALUES ('10', '8', 'auth_group/add', '增加', '1', '1', '', '0', 'fa fa-list', '50', '', '1512961480', '1512961480');
INSERT INTO `kocor_auth_rule` VALUES ('11', '8', 'auth_group/edit', '编辑', '1', '1', '', '0', 'fa fa-list', '50', '', '1512961501', '1512961501');
INSERT INTO `kocor_auth_rule` VALUES ('12', '8', 'auth_group/del', '删除', '1', '1', '', '0', 'fa fa-list', '50', '', '1512961523', '1512961523');
INSERT INTO `kocor_auth_rule` VALUES ('13', '2', 'admin', '管理员管理', '1', '1', '', '1', 'fa fa-user-circle', '50', '', '1512962066', '1512962066');
INSERT INTO `kocor_auth_rule` VALUES ('14', '13', 'admin/index', '列表', '1', '1', '', '0', 'fa fa-user-circle', '50', '', '1512962066', '1512962066');
INSERT INTO `kocor_auth_rule` VALUES ('15', '13', 'admin/add', '增加', '1', '1', '', '0', 'fa fa-list', '50', '', '1512962087', '1512962087');
INSERT INTO `kocor_auth_rule` VALUES ('16', '13', 'admin/edit', '编辑', '1', '1', '', '0', 'fa fa-list', '50', '', '1512962113', '1512962113');
INSERT INTO `kocor_auth_rule` VALUES ('17', '13', 'admin/del', '删除', '1', '1', '', '0', 'fa fa-list', '50', '', '1512962133', '1512962133');
INSERT INTO `kocor_auth_rule` VALUES ('18', '0', 'system-menu', '系统管理', '1', '1', '', '1', 'fa fa-cogs', '50', '', '1513593973', '1513072930');
INSERT INTO `kocor_auth_rule` VALUES ('19', '18', 'config/index', '系统设置', '1', '1', '', '1', 'fa fa-cog', '50', '', '1513072965', '1513072965');
INSERT INTO `kocor_auth_rule` VALUES ('20', '18', 'ajax/cache', '清理缓存', '1', '1', '', '1', 'fa fa-trash', '50', '', '1513242940', '1513242940');
INSERT INTO `kocor_auth_rule` VALUES ('21', '19', 'config/add', '增加设置项', '1', '1', '', '0', 'fa fa-list', '50', '', '1513251046', '1513251008');
INSERT INTO `kocor_auth_rule` VALUES ('22', '18', 'admin_log/index', '操作日志', '1', '1', '', '1', 'fa fa-book', '50', '', '1513325382', '1513325357');
INSERT INTO `kocor_auth_rule` VALUES ('23', '19', 'config/edit', '修改配置项', '1', '1', '', '0', 'fa fa-list', '50', '', '1513325839', '1513325510');
INSERT INTO `kocor_auth_rule` VALUES ('24', '22', 'admin_log/del', '删除', '1', '1', '', '0', 'fa fa-list', '50', '', '1513325899', '1513325825');
INSERT INTO `kocor_auth_rule` VALUES ('25', '22', 'admin_log/view', '日志详情', '1', '1', '', '0', 'fa fa-list', '50', '', '1513589419', '1513589419');
INSERT INTO `kocor_auth_rule` VALUES ('26', '0', 'article-menu', '文章管理', '1', '1', '', '1', 'fa fa-book', '50', '', '1513593923', '1513591803');
INSERT INTO `kocor_auth_rule` VALUES ('27', '26', 'article_cate', '文章分类', '1', '1', '', '1', 'fa fa-copy', '50', '', '1513593817', '1513591985');
INSERT INTO `kocor_auth_rule` VALUES ('28', '27', 'article_cate/add', '增加', '1', '1', '', '0', 'fa fa-list', '50', '', '1513593692', '1513593620');
INSERT INTO `kocor_auth_rule` VALUES ('29', '27', 'article_cate/edit', '编辑', '1', '1', '', '0', 'fa fa-list', '50', '', '1513593702', '1513593644');
INSERT INTO `kocor_auth_rule` VALUES ('30', '27', 'article_cate/del', '删除', '1', '1', '', '0', 'fa fa-list', '50', '', '1513593677', '1513593677');
INSERT INTO `kocor_auth_rule` VALUES ('31', '27', 'article_cate/index', '列表', '1', '1', '', '0', 'fa fa-list', '50', '', '1513593856', '1513593856');
INSERT INTO `kocor_auth_rule` VALUES ('32', '26', 'article', '文章管理', '1', '1', '', '1', 'fa fa-archive', '50', '', '1513594397', '1513594377');
INSERT INTO `kocor_auth_rule` VALUES ('33', '32', 'article/index', '列表', '1', '1', '', '0', 'fa fa-list', '50', '', '1513594433', '1513594433');
INSERT INTO `kocor_auth_rule` VALUES ('34', '32', 'article/add', '增加', '1', '1', '', '0', 'fa fa-list', '50', '', '1513594452', '1513594452');
INSERT INTO `kocor_auth_rule` VALUES ('35', '32', 'article/edit', '编辑', '1', '1', '', '0', 'fa fa-list', '50', '', '1513594470', '1513594470');
INSERT INTO `kocor_auth_rule` VALUES ('36', '32', 'article/del', '删除', '1', '1', '', '0', 'fa fa-list', '50', '', '1513594486', '1513594486');
INSERT INTO `kocor_auth_rule` VALUES ('37', '0', 'database', '数据库管理', '1', '1', '', '1', 'fa fa-database', '50', '', '1515487223', '1514973504');
INSERT INTO `kocor_auth_rule` VALUES ('38', '37', 'database/index', '数据库备份', '1', '1', '', '1', 'fa fa-files-o', '50', '', '1515487150', '1514973687');
INSERT INTO `kocor_auth_rule` VALUES ('39', '37', 'database/restore', '数据库还原', '1', '1', '', '1', 'fa fa-imdb', '50', '', '1515487163', '1514973813');

-- ----------------------------
-- Table structure for `kocor_config`
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kocor_config
-- ----------------------------
INSERT INTO `kocor_config` VALUES ('1', 'dictionary', 'array', 'categorytype', '分组配置', '{\"basic\":\"基础配置\",\"email\":\"邮件配置\",\"dictionary\":\"字典配置\",\"user\":\"会员配置\"}', '', '1515492449', '0');
INSERT INTO `kocor_config` VALUES ('2', 'basic', 'string', 'sitename', '网站名称', 'kocol管理系统', '', '1515492449', '0');
INSERT INTO `kocor_config` VALUES ('3', 'basic', 'string', 'keyword', '网站关键词', 'kocol，管理系统', '', '1515492449', '0');
INSERT INTO `kocor_config` VALUES ('4', 'basic', 'text', 'description', '网站描述', 'kocol管理系统，为自己开发系统', '', '1515492449', '0');
INSERT INTO `kocor_config` VALUES ('5', 'basic', 'string', 'beian', '网站备案号', '粤45356612345号', '网站备案号', '1515492449', '0');
INSERT INTO `kocor_config` VALUES ('6', 'basic', 'string', 'sgsggs', '测试', '', '', '1515492449', '0');

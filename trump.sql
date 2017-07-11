/*
Navicat MySQL Data Transfer

Source Server         : jiajun
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : trump

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2017-07-12 01:22:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `opear_user` varchar(32) NOT NULL,
  `ip` varchar(32) NOT NULL,
  `opear_time` datetime NOT NULL,
  `event` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=349 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('3', 'jiajun', '127.0.0.1', '2017-07-02 12:20:00', '用户登录成功');
INSERT INTO `sys_log` VALUES ('4', 'jiajun', '127.0.0.1', '2017-07-02 12:20:25', '用户修改个人资料');
INSERT INTO `sys_log` VALUES ('10', 'jiajun', '127.0.0.1', '2017-07-02 12:29:13', '用户登录成功');
INSERT INTO `sys_log` VALUES ('11', 'jiajun', '127.0.0.1', '2017-07-02 12:29:36', '用户修改个人资料');
INSERT INTO `sys_log` VALUES ('12', 'jiajun', '127.0.0.1', '2017-07-02 12:29:36', '用户退出登录');
INSERT INTO `sys_log` VALUES ('13', 'jiajun', '127.0.0.1', '2017-07-02 12:30:42', '用户登录成功');
INSERT INTO `sys_log` VALUES ('14', 'jiajun', '127.0.0.1', '2017-07-02 12:30:47', '用户修改个人资料');
INSERT INTO `sys_log` VALUES ('15', 'jiajun', '127.0.0.1', '2017-07-02 12:33:57', '用户修改个人资料');
INSERT INTO `sys_log` VALUES ('16', 'jiajun', '127.0.0.1', '2017-07-02 12:33:59', '用户退出登录');
INSERT INTO `sys_log` VALUES ('17', 'jiajun', '127.0.0.1', '2017-07-02 12:34:05', '用户修改个人资料失败');
INSERT INTO `sys_log` VALUES ('18', 'jiajun', '127.0.0.1', '2017-07-02 12:34:40', '用户登录成功');
INSERT INTO `sys_log` VALUES ('23', 'jiajun', '127.0.0.1', '2017-07-02 16:40:24', '登录成功');
INSERT INTO `sys_log` VALUES ('24', 'jiajun', '127.0.0.1', '2017-07-02 18:15:22', '登录成功');
INSERT INTO `sys_log` VALUES ('25', 'jiajun', '127.0.0.1', '2017-07-03 20:34:44', '登录成功');
INSERT INTO `sys_log` VALUES ('26', '', '127.0.0.1', '2017-07-03 23:37:16', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('27', '', '127.0.0.1', '2017-07-03 23:43:14', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('28', '', '127.0.0.1', '2017-07-03 23:44:08', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('29', '', '127.0.0.1', '2017-07-03 23:44:14', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('30', '', '127.0.0.1', '2017-07-03 23:44:17', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('31', '', '127.0.0.1', '2017-07-03 23:45:34', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('32', '', '127.0.0.1', '2017-07-03 23:46:13', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('33', '', '127.0.0.1', '2017-07-03 23:46:41', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('34', '', '127.0.0.1', '2017-07-03 23:47:08', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('35', '', '127.0.0.1', '2017-07-03 23:47:18', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('36', '', '127.0.0.1', '2017-07-03 23:59:30', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('37', '', '127.0.0.1', '2017-07-04 00:06:50', '添加菜单:menu test');
INSERT INTO `sys_log` VALUES ('38', '', '127.0.0.1', '2017-07-04 00:17:57', '添加菜单:工具子菜单');
INSERT INTO `sys_log` VALUES ('39', 'jiajun', '127.0.0.1', '2017-07-05 20:55:00', '登录成功');
INSERT INTO `sys_log` VALUES ('40', 'jiajun', '127.0.0.1', '2017-07-05 20:55:48', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('41', 'jiajun', '127.0.0.1', '2017-07-05 20:55:56', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('42', '', '127.0.0.1', '2017-07-05 21:54:32', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('43', '', '127.0.0.1', '2017-07-05 21:56:46', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('44', '', '127.0.0.1', '2017-07-05 21:58:44', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('45', '', '127.0.0.1', '2017-07-05 22:02:01', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('46', '', '127.0.0.1', '2017-07-05 22:02:31', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('47', '', '127.0.0.1', '2017-07-05 22:10:22', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('48', '', '127.0.0.1', '2017-07-05 22:35:54', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('49', '', '127.0.0.1', '2017-07-05 22:36:05', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('50', '', '127.0.0.1', '2017-07-05 22:36:11', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('51', '', '127.0.0.1', '2017-07-05 22:36:21', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('52', '', '127.0.0.1', '2017-07-05 22:36:44', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('53', 'jiajun', '127.0.0.1', '2017-07-06 20:33:00', '登录成功');
INSERT INTO `sys_log` VALUES ('54', 'jiajun', '127.0.0.1', '2017-07-06 20:33:45', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('55', 'jiajun', '127.0.0.1', '2017-07-06 20:33:56', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('56', '', '127.0.0.1', '2017-07-06 23:41:08', '添加菜单:权限管理子菜单');
INSERT INTO `sys_log` VALUES ('57', '', '127.0.0.1', '2017-07-06 23:46:45', '添加菜单:ztree刷新测试');
INSERT INTO `sys_log` VALUES ('58', '', '127.0.0.1', '2017-07-06 23:51:59', '添加菜单:test');
INSERT INTO `sys_log` VALUES ('59', '', '127.0.0.1', '2017-07-06 23:52:57', '添加菜单:test2');
INSERT INTO `sys_log` VALUES ('60', '', '127.0.0.1', '2017-07-07 00:19:50', '添加菜单:222');
INSERT INTO `sys_log` VALUES ('61', '', '127.0.0.1', '2017-07-07 00:20:29', '添加菜单:test3');
INSERT INTO `sys_log` VALUES ('62', '', '127.0.0.1', '2017-07-07 00:21:01', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('63', '', '127.0.0.1', '2017-07-07 00:24:07', '添加菜单:test5');
INSERT INTO `sys_log` VALUES ('64', '', '127.0.0.1', '2017-07-07 01:29:58', '删除菜单');
INSERT INTO `sys_log` VALUES ('65', '', '127.0.0.1', '2017-07-07 01:30:33', '删除菜单');
INSERT INTO `sys_log` VALUES ('66', '', '127.0.0.1', '2017-07-07 01:30:44', '删除菜单');
INSERT INTO `sys_log` VALUES ('67', '', '127.0.0.1', '2017-07-07 01:30:52', '删除菜单');
INSERT INTO `sys_log` VALUES ('68', 'jiajun', '127.0.0.1', '2017-07-07 22:00:09', '登录成功');
INSERT INTO `sys_log` VALUES ('69', 'jiajun', '127.0.0.1', '2017-07-07 22:01:04', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('70', 'jiajun', '127.0.0.1', '2017-07-07 22:07:42', '登录成功');
INSERT INTO `sys_log` VALUES ('71', 'jiajun', '127.0.0.1', '2017-07-08 14:05:50', '登录成功');
INSERT INTO `sys_log` VALUES ('72', 'jiajun', '127.0.0.1', '2017-07-08 14:06:28', '登录成功');
INSERT INTO `sys_log` VALUES ('73', 'jiajun', '127.0.0.1', '2017-07-08 21:20:28', '登录成功');
INSERT INTO `sys_log` VALUES ('74', 'jiajun', '127.0.0.1', '2017-07-08 21:39:25', '登录成功');
INSERT INTO `sys_log` VALUES ('75', 'jiajun', '127.0.0.1', '2017-07-08 21:40:30', '删除菜单');
INSERT INTO `sys_log` VALUES ('76', 'jiajun', '127.0.0.1', '2017-07-08 21:48:07', '添加菜单:菜单权限');
INSERT INTO `sys_log` VALUES ('77', 'jiajun', '127.0.0.1', '2017-07-08 21:48:26', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('78', 'jiajun', '127.0.0.1', '2017-07-08 21:49:56', '添加菜单:应用权限');
INSERT INTO `sys_log` VALUES ('79', 'jiajun', '127.0.0.1', '2017-07-08 21:50:01', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('80', 'jiajun', '127.0.0.1', '2017-07-08 21:50:39', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('81', 'jiajun', '127.0.0.1', '2017-07-08 21:52:23', '添加菜单:按钮管理');
INSERT INTO `sys_log` VALUES ('82', 'jiajun', '127.0.0.1', '2017-07-08 21:53:08', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('83', 'jiajun', '127.0.0.1', '2017-07-08 21:53:29', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('84', 'jiajun', '127.0.0.1', '2017-07-08 21:53:49', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('85', 'jiajun', '127.0.0.1', '2017-07-08 21:54:02', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('86', 'jiajun', '127.0.0.1', '2017-07-08 21:56:52', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('87', 'jiajun', '127.0.0.1', '2017-07-08 21:58:52', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('88', 'jiajun', '127.0.0.1', '2017-07-08 22:02:40', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('89', 'jiajun', '127.0.0.1', '2017-07-08 22:09:06', '登录成功');
INSERT INTO `sys_log` VALUES ('90', 'jiajun', '127.0.0.1', '2017-07-08 22:09:32', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('91', 'jiajun', '127.0.0.1', '2017-07-08 22:09:36', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('92', 'jiajun', '127.0.0.1', '2017-07-08 22:11:01', '添加菜单:在线管理');
INSERT INTO `sys_log` VALUES ('93', 'jiajun', '127.0.0.1', '2017-07-08 22:11:53', '添加菜单:菜单管理');
INSERT INTO `sys_log` VALUES ('94', 'jiajun', '127.0.0.1', '2017-07-08 22:12:08', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('95', 'jiajun', '127.0.0.1', '2017-07-08 22:12:23', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('96', 'jiajun', '127.0.0.1', '2017-07-08 22:16:33', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('97', 'jiajun', '127.0.0.1', '2017-07-08 22:16:36', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('98', 'jiajun', '127.0.0.1', '2017-07-08 22:21:26', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('99', 'jiajun', '127.0.0.1', '2017-07-08 22:21:53', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('100', 'jiajun', '127.0.0.1', '2017-07-08 22:22:06', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('101', 'jiajun', '127.0.0.1', '2017-07-08 22:23:45', '添加菜单:日志管理');
INSERT INTO `sys_log` VALUES ('102', 'jiajun', '127.0.0.1', '2017-07-08 22:24:19', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('103', 'jiajun', '127.0.0.1', '2017-07-08 22:24:48', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('104', 'jiajun', '127.0.0.1', '2017-07-08 22:24:54', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('105', 'jiajun', '127.0.0.1', '2017-07-08 22:25:13', '删除菜单');
INSERT INTO `sys_log` VALUES ('106', 'jiajun', '127.0.0.1', '2017-07-08 22:25:24', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('107', 'jiajun', '127.0.0.1', '2017-07-08 22:25:38', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('108', 'jiajun', '127.0.0.1', '2017-07-08 22:26:25', '添加菜单:系统用户');
INSERT INTO `sys_log` VALUES ('109', 'jiajun', '127.0.0.1', '2017-07-08 22:26:36', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('110', 'jiajun', '127.0.0.1', '2017-07-08 22:27:33', '添加菜单:会员管理');
INSERT INTO `sys_log` VALUES ('111', 'jiajun', '127.0.0.1', '2017-07-08 22:27:41', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('112', 'jiajun', '127.0.0.1', '2017-07-08 22:28:32', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('113', 'jiajun', '127.0.0.1', '2017-07-08 22:28:48', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('114', 'jiajun', '127.0.0.1', '2017-07-08 22:29:01', '删除菜单');
INSERT INTO `sys_log` VALUES ('115', 'jiajun', '127.0.0.1', '2017-07-08 22:31:48', '添加菜单:代码生成器');
INSERT INTO `sys_log` VALUES ('116', 'jiajun', '127.0.0.1', '2017-07-08 22:33:40', '添加菜单:表单构造器');
INSERT INTO `sys_log` VALUES ('117', 'jiajun', '127.0.0.1', '2017-07-08 22:33:50', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('118', 'jiajun', '127.0.0.1', '2017-07-08 22:34:11', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('119', 'jiajun', '127.0.0.1', '2017-07-08 22:34:26', '添加菜单:接口测试');
INSERT INTO `sys_log` VALUES ('120', 'jiajun', '127.0.0.1', '2017-07-08 22:34:59', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('121', 'jiajun', '127.0.0.1', '2017-07-08 22:35:20', '添加菜单:发送邮件');
INSERT INTO `sys_log` VALUES ('122', 'jiajun', '127.0.0.1', '2017-07-08 22:35:34', '添加菜单:二维码');
INSERT INTO `sys_log` VALUES ('123', 'jiajun', '127.0.0.1', '2017-07-08 22:35:52', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('124', 'jiajun', '127.0.0.1', '2017-07-08 22:36:26', '添加菜单:图表报表');
INSERT INTO `sys_log` VALUES ('125', 'jiajun', '127.0.0.1', '2017-07-08 22:36:40', '添加菜单:地图工具');
INSERT INTO `sys_log` VALUES ('126', 'jiajun', '127.0.0.1', '2017-07-08 22:36:47', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('127', 'jiajun', '127.0.0.1', '2017-07-08 22:37:02', '添加菜单:性能监测');
INSERT INTO `sys_log` VALUES ('128', 'jiajun', '127.0.0.1', '2017-07-08 22:37:39', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('129', 'jiajun', '127.0.0.1', '2017-07-08 22:37:50', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('130', 'jiajun', '127.0.0.1', '2017-07-08 22:38:05', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('131', 'jiajun', '127.0.0.1', '2017-07-08 22:38:12', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('132', 'jiajun', '127.0.0.1', '2017-07-08 22:38:26', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('133', 'jiajun', '127.0.0.1', '2017-07-08 22:38:57', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('134', 'jiajun', '127.0.0.1', '2017-07-08 22:39:08', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('135', 'jiajun', '127.0.0.1', '2017-07-08 22:40:32', '添加菜单:图片管理');
INSERT INTO `sys_log` VALUES ('136', 'jiajun', '127.0.0.1', '2017-07-08 22:41:05', '添加菜单:数据库管理');
INSERT INTO `sys_log` VALUES ('137', 'jiajun', '127.0.0.1', '2017-07-08 22:46:37', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('138', 'jiajun', '127.0.0.1', '2017-07-08 22:47:02', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('139', 'jiajun', '127.0.0.1', '2017-07-08 22:47:20', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('140', 'jiajun', '127.0.0.1', '2017-07-08 22:47:41', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('141', 'jiajun', '127.0.0.1', '2017-07-08 22:48:07', '添加菜单:关注回复');
INSERT INTO `sys_log` VALUES ('142', 'jiajun', '127.0.0.1', '2017-07-08 22:48:21', '添加菜单:文本回复');
INSERT INTO `sys_log` VALUES ('143', 'jiajun', '127.0.0.1', '2017-07-08 22:48:36', '添加菜单:图文回复');
INSERT INTO `sys_log` VALUES ('144', 'jiajun', '127.0.0.1', '2017-07-08 22:48:57', '添加菜单:应用命令');
INSERT INTO `sys_log` VALUES ('145', 'jiajun', '127.0.0.1', '2017-07-08 22:49:21', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('146', 'jiajun', '127.0.0.1', '2017-07-08 22:49:29', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('147', 'jiajun', '127.0.0.1', '2017-07-08 22:49:54', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('148', 'jiajun', '127.0.0.1', '2017-07-08 22:50:06', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('149', 'jiajun', '127.0.0.1', '2017-07-08 22:50:13', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('150', 'jiajun', '127.0.0.1', '2017-07-08 22:50:36', '添加菜单:图片管理');
INSERT INTO `sys_log` VALUES ('151', 'jiajun', '127.0.0.1', '2017-07-08 22:55:50', '添加菜单:站内信');
INSERT INTO `sys_log` VALUES ('152', 'jiajun', '127.0.0.1', '2017-07-08 22:56:23', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('153', 'jiajun', '127.0.0.1', '2017-07-08 22:56:32', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('154', 'jiajun', '127.0.0.1', '2017-07-08 22:56:53', '添加菜单:图片列表');
INSERT INTO `sys_log` VALUES ('155', 'jiajun', '127.0.0.1', '2017-07-08 22:57:05', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('156', 'jiajun', '127.0.0.1', '2017-07-08 22:57:14', '添加菜单:图片爬虫');
INSERT INTO `sys_log` VALUES ('157', 'jiajun', '127.0.0.1', '2017-07-08 22:57:27', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('158', 'jiajun', '127.0.0.1', '2017-07-08 23:00:35', '登录成功');
INSERT INTO `sys_log` VALUES ('159', 'jiajun', '127.0.0.1', '2017-07-08 23:01:10', '添加菜单:数据库备份');
INSERT INTO `sys_log` VALUES ('160', 'jiajun', '127.0.0.1', '2017-07-08 23:01:34', '添加菜单:定时备份');
INSERT INTO `sys_log` VALUES ('161', 'jiajun', '127.0.0.1', '2017-07-08 23:01:57', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('162', 'jiajun', '127.0.0.1', '2017-07-08 23:02:14', '添加菜单:数据库还原');
INSERT INTO `sys_log` VALUES ('163', 'jiajun', '127.0.0.1', '2017-07-08 23:02:26', '添加菜单:sql编辑器');
INSERT INTO `sys_log` VALUES ('164', 'jiajun', '127.0.0.1', '2017-07-08 23:02:42', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('165', 'jiajun', '127.0.0.1', '2017-07-08 23:03:03', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('166', 'jiajun', '127.0.0.1', '2017-07-08 23:03:14', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('167', 'jiajun', '127.0.0.1', '2017-07-08 23:03:20', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('168', 'jiajun', '127.0.0.1', '2017-07-08 23:03:31', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('169', 'jiajun', '127.0.0.1', '2017-07-08 23:03:42', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('170', 'jiajun', '127.0.0.1', '2017-07-08 23:03:53', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('171', 'jiajun', '127.0.0.1', '2017-07-08 23:04:21', '删除菜单');
INSERT INTO `sys_log` VALUES ('172', 'jiajun', '127.0.0.1', '2017-07-08 23:10:25', '添加菜单:用户管理');
INSERT INTO `sys_log` VALUES ('173', 'jiajun', '127.0.0.1', '2017-07-08 23:11:30', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('174', 'jiajun', '127.0.0.1', '2017-07-08 23:16:23', '添加菜单:222');
INSERT INTO `sys_log` VALUES ('175', 'jiajun', '127.0.0.1', '2017-07-08 23:16:27', '删除菜单');
INSERT INTO `sys_log` VALUES ('176', 'jiajun', '127.0.0.1', '2017-07-08 23:18:24', '添加菜单:222');
INSERT INTO `sys_log` VALUES ('177', 'jiajun', '127.0.0.1', '2017-07-08 23:18:42', '删除菜单');
INSERT INTO `sys_log` VALUES ('178', 'jiajun', '127.0.0.1', '2017-07-08 23:18:58', '添加菜单:333');
INSERT INTO `sys_log` VALUES ('179', 'jiajun', '127.0.0.1', '2017-07-08 23:19:01', '删除菜单');
INSERT INTO `sys_log` VALUES ('180', 'jiajun', '127.0.0.1', '2017-07-08 23:19:14', '添加菜单:22');
INSERT INTO `sys_log` VALUES ('181', 'jiajun', '127.0.0.1', '2017-07-08 23:19:16', '删除菜单');
INSERT INTO `sys_log` VALUES ('182', 'jiajun', '127.0.0.1', '2017-07-08 23:19:40', '添加菜单:22');
INSERT INTO `sys_log` VALUES ('183', 'jiajun', '127.0.0.1', '2017-07-08 23:19:43', '删除菜单');
INSERT INTO `sys_log` VALUES ('184', 'jiajun', '127.0.0.1', '2017-07-08 23:19:58', '添加菜单:22');
INSERT INTO `sys_log` VALUES ('185', 'jiajun', '127.0.0.1', '2017-07-08 23:20:01', '删除菜单');
INSERT INTO `sys_log` VALUES ('186', 'jiajun', '127.0.0.1', '2017-07-08 23:20:17', '添加菜单:2');
INSERT INTO `sys_log` VALUES ('187', 'jiajun', '127.0.0.1', '2017-07-08 23:20:20', '删除菜单');
INSERT INTO `sys_log` VALUES ('188', 'jiajun', '127.0.0.1', '2017-07-08 23:20:41', '添加菜单:22');
INSERT INTO `sys_log` VALUES ('189', 'jiajun', '127.0.0.1', '2017-07-08 23:20:43', '删除菜单');
INSERT INTO `sys_log` VALUES ('190', 'jiajun', '127.0.0.1', '2017-07-08 23:20:52', '删除菜单');
INSERT INTO `sys_log` VALUES ('192', 'jiajun', '127.0.0.1', '2017-07-08 23:21:06', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('193', 'jiajun', '127.0.0.1', '2017-07-08 23:21:22', '添加菜单:2');
INSERT INTO `sys_log` VALUES ('194', 'jiajun', '127.0.0.1', '2017-07-08 23:21:25', '删除菜单');
INSERT INTO `sys_log` VALUES ('195', 'jiajun', '127.0.0.1', '2017-07-08 23:26:50', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('196', 'jiajun', '127.0.0.1', '2017-07-08 23:27:13', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('197', 'jiajun', '127.0.0.1', '2017-07-08 23:27:23', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('198', 'jiajun', '127.0.0.1', '2017-07-09 12:29:03', '登录成功');
INSERT INTO `sys_log` VALUES ('199', '', '127.0.0.1', '2017-07-09 20:15:56', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('200', '', '127.0.0.1', '2017-07-09 20:16:17', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('201', '', '127.0.0.1', '2017-07-09 20:16:59', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('202', '', '127.0.0.1', '2017-07-09 20:17:12', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('203', '', '127.0.0.1', '2017-07-09 20:17:35', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('204', '', '127.0.0.1', '2017-07-09 21:19:29', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('205', '', '127.0.0.1', '2017-07-09 21:19:56', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('206', '', '127.0.0.1', '2017-07-09 21:21:02', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('207', '', '127.0.0.1', '2017-07-09 21:21:12', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('208', '', '127.0.0.1', '2017-07-09 21:21:21', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('209', '', '127.0.0.1', '2017-07-09 21:21:28', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('210', '', '127.0.0.1', '2017-07-09 21:21:40', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('211', '', '127.0.0.1', '2017-07-09 21:26:44', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('212', '', '127.0.0.1', '2017-07-09 21:27:03', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('213', '', '127.0.0.1', '2017-07-09 21:27:16', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('214', '', '127.0.0.1', '2017-07-09 22:13:20', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('215', '', '127.0.0.1', '2017-07-09 22:44:22', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('216', '', '127.0.0.1', '2017-07-09 22:44:32', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('217', '', '127.0.0.1', '2017-07-09 22:51:00', '保存角色对应的菜单出错:非法参数!当前角色的菜单权限越界!');
INSERT INTO `sys_log` VALUES ('218', '', '127.0.0.1', '2017-07-09 22:53:02', '保存角色对应的菜单出错:非法参数!当前角色的菜单权限越界!');
INSERT INTO `sys_log` VALUES ('219', '', '127.0.0.1', '2017-07-09 23:05:12', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('220', '', '127.0.0.1', '2017-07-09 23:05:32', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('221', '', '127.0.0.1', '2017-07-09 23:05:51', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('222', '', '127.0.0.1', '2017-07-09 23:06:44', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('223', '', '127.0.0.1', '2017-07-09 23:06:53', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('224', '', '127.0.0.1', '2017-07-09 23:07:11', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('225', '', '127.0.0.1', '2017-07-09 23:08:00', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('226', '', '127.0.0.1', '2017-07-09 23:08:18', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('227', '', '127.0.0.1', '2017-07-09 23:08:28', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('228', '', '127.0.0.1', '2017-07-09 23:08:44', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('229', '', '127.0.0.1', '2017-07-09 23:48:32', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('230', '', '127.0.0.1', '2017-07-09 23:48:49', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('231', '', '127.0.0.1', '2017-07-09 23:54:48', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('232', '', '127.0.0.1', '2017-07-09 23:55:09', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('233', '', '127.0.0.1', '2017-07-09 23:55:23', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('234', '', '127.0.0.1', '2017-07-09 23:55:34', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('235', '', '127.0.0.1', '2017-07-09 23:55:51', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('236', '', '127.0.0.1', '2017-07-09 23:56:52', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('237', '', '127.0.0.1', '2017-07-09 23:57:41', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('238', '', '127.0.0.1', '2017-07-09 23:57:47', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('239', '', '127.0.0.1', '2017-07-10 00:02:24', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('240', '', '127.0.0.1', '2017-07-10 00:07:19', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('241', '', '127.0.0.1', '2017-07-10 00:07:26', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('242', '', '127.0.0.1', '2017-07-10 00:07:34', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('243', '', '127.0.0.1', '2017-07-10 00:10:27', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('244', '', '127.0.0.1', '2017-07-10 00:10:31', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('245', '', '127.0.0.1', '2017-07-10 00:10:43', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('246', '', '127.0.0.1', '2017-07-10 00:11:29', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('247', '', '127.0.0.1', '2017-07-10 00:11:32', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('248', '', '127.0.0.1', '2017-07-10 00:13:04', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('249', '', '127.0.0.1', '2017-07-10 00:13:12', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('250', '', '127.0.0.1', '2017-07-10 00:13:42', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('251', '', '127.0.0.1', '2017-07-10 00:13:46', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('252', '', '127.0.0.1', '2017-07-10 00:13:56', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('253', '', '127.0.0.1', '2017-07-10 00:14:12', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('254', 'jiajun', '127.0.0.1', '2017-07-10 20:58:17', '登录成功');
INSERT INTO `sys_log` VALUES ('255', 'jiajun', '127.0.0.1', '2017-07-10 20:58:30', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('256', 'jiajun', '127.0.0.1', '2017-07-10 20:58:34', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('257', 'jiajun', '127.0.0.1', '2017-07-10 20:58:39', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('258', 'jiajun', '127.0.0.1', '2017-07-10 21:05:05', '登录成功');
INSERT INTO `sys_log` VALUES ('259', 'jiajun', '127.0.0.1', '2017-07-10 22:11:05', '登录成功');
INSERT INTO `sys_log` VALUES ('260', 'jiajun', '127.0.0.1', '2017-07-10 22:11:17', '添加角色:四级菜单');
INSERT INTO `sys_log` VALUES ('261', '', '127.0.0.1', '2017-07-10 22:27:47', '添加角色:50');
INSERT INTO `sys_log` VALUES ('262', '', '127.0.0.1', '2017-07-10 22:28:30', '添加角色:6');
INSERT INTO `sys_log` VALUES ('263', 'jiajun', '127.0.0.1', '2017-07-10 22:29:31', '登录成功');
INSERT INTO `sys_log` VALUES ('264', 'jiajun', '127.0.0.1', '2017-07-10 22:29:41', '添加角色:70');
INSERT INTO `sys_log` VALUES ('265', 'jiajun', '127.0.0.1', '2017-07-10 22:30:04', '添加角色:80');
INSERT INTO `sys_log` VALUES ('266', 'jiajun', '127.0.0.1', '2017-07-10 22:31:51', '添加角色:90');
INSERT INTO `sys_log` VALUES ('267', '', '127.0.0.1', '2017-07-10 22:36:20', '添加角色:100');
INSERT INTO `sys_log` VALUES ('268', '', '127.0.0.1', '2017-07-10 22:41:46', '添加角色:110');
INSERT INTO `sys_log` VALUES ('269', '', '127.0.0.1', '2017-07-10 22:41:54', '添加角色:120');
INSERT INTO `sys_log` VALUES ('270', '', '127.0.0.1', '2017-07-10 22:43:11', '修改角色信息:130');
INSERT INTO `sys_log` VALUES ('271', '', '127.0.0.1', '2017-07-10 22:44:01', '修改角色信息:120');
INSERT INTO `sys_log` VALUES ('272', '', '127.0.0.1', '2017-07-10 22:44:54', '修改角色信息:130');
INSERT INTO `sys_log` VALUES ('273', '', '127.0.0.1', '2017-07-10 22:46:15', '修改角色信息:130');
INSERT INTO `sys_log` VALUES ('274', '', '127.0.0.1', '2017-07-10 22:46:33', '修改角色信息:130');
INSERT INTO `sys_log` VALUES ('275', '', '127.0.0.1', '2017-07-10 22:47:01', '修改角色信息:130');
INSERT INTO `sys_log` VALUES ('276', '', '127.0.0.1', '2017-07-10 22:57:50', '删除角色, id是18');
INSERT INTO `sys_log` VALUES ('277', '', '127.0.0.1', '2017-07-10 22:57:53', '删除角色, id是17');
INSERT INTO `sys_log` VALUES ('278', '', '127.0.0.1', '2017-07-10 22:58:01', '删除角色, id是16');
INSERT INTO `sys_log` VALUES ('279', '', '127.0.0.1', '2017-07-10 23:08:24', '删除角色, id是15');
INSERT INTO `sys_log` VALUES ('280', '', '127.0.0.1', '2017-07-10 23:08:31', '删除角色, id是4');
INSERT INTO `sys_log` VALUES ('281', '', '127.0.0.1', '2017-07-10 23:08:47', '修改角色信息:二级管理员');
INSERT INTO `sys_log` VALUES ('282', '', '127.0.0.1', '2017-07-10 23:08:52', '删除角色, id是14');
INSERT INTO `sys_log` VALUES ('283', '', '127.0.0.1', '2017-07-10 23:09:49', '添加角色:一般会员');
INSERT INTO `sys_log` VALUES ('284', '', '127.0.0.1', '2017-07-10 23:09:59', '修改角色信息:70');
INSERT INTO `sys_log` VALUES ('285', '', '127.0.0.1', '2017-07-10 23:10:51', '删除角色, id是13');
INSERT INTO `sys_log` VALUES ('286', '', '127.0.0.1', '2017-07-10 23:10:57', '删除角色, id是19');
INSERT INTO `sys_log` VALUES ('287', '', '127.0.0.1', '2017-07-10 23:47:24', '修改角色类型信息:系统用户组');
INSERT INTO `sys_log` VALUES ('288', '', '127.0.0.1', '2017-07-10 23:47:33', '修改角色类型信息:系统用户组2');
INSERT INTO `sys_log` VALUES ('289', '', '127.0.0.1', '2017-07-10 23:47:40', '修改角色类型信息:系统用户组');
INSERT INTO `sys_log` VALUES ('290', '', '127.0.0.1', '2017-07-10 23:53:46', '添加角色类型:吃瓜群众');
INSERT INTO `sys_log` VALUES ('291', '', '127.0.0.1', '2017-07-10 23:54:18', '添加角色类型:吃瓜群众2');
INSERT INTO `sys_log` VALUES ('292', '', '127.0.0.1', '2017-07-11 00:12:46', '删除角色组, 类型是4');
INSERT INTO `sys_log` VALUES ('293', '', '127.0.0.1', '2017-07-11 00:12:53', '添加角色类型:a	');
INSERT INTO `sys_log` VALUES ('294', '', '127.0.0.1', '2017-07-11 00:13:08', '添加角色类型:a	');
INSERT INTO `sys_log` VALUES ('295', '', '127.0.0.1', '2017-07-11 00:13:18', '删除角色组, 类型是5');
INSERT INTO `sys_log` VALUES ('296', '', '127.0.0.1', '2017-07-11 00:13:23', '删除角色组, 类型是4');
INSERT INTO `sys_log` VALUES ('297', '', '127.0.0.1', '2017-07-11 00:13:30', '添加角色类型:20');
INSERT INTO `sys_log` VALUES ('298', '', '127.0.0.1', '2017-07-11 00:13:55', '添加角色类型:110');
INSERT INTO `sys_log` VALUES ('299', '', '127.0.0.1', '2017-07-11 00:15:37', '添加角色类型:22');
INSERT INTO `sys_log` VALUES ('300', '', '127.0.0.1', '2017-07-11 00:19:17', '删除角色组, 类型是4');
INSERT INTO `sys_log` VALUES ('301', '', '127.0.0.1', '2017-07-11 00:19:20', '删除角色组, 类型是5');
INSERT INTO `sys_log` VALUES ('302', '', '127.0.0.1', '2017-07-11 00:19:30', '添加角色:33');
INSERT INTO `sys_log` VALUES ('303', '', '127.0.0.1', '2017-07-11 00:19:35', '删除角色, id是27');
INSERT INTO `sys_log` VALUES ('304', '', '127.0.0.1', '2017-07-11 00:19:38', '添加角色:44');
INSERT INTO `sys_log` VALUES ('305', '', '127.0.0.1', '2017-07-11 00:19:49', '删除角色, id是28');
INSERT INTO `sys_log` VALUES ('306', '', '127.0.0.1', '2017-07-11 00:19:51', '删除角色组, 类型是6');
INSERT INTO `sys_log` VALUES ('307', '', '127.0.0.1', '2017-07-11 00:21:20', '添加角色类型:33');
INSERT INTO `sys_log` VALUES ('308', '', '127.0.0.1', '2017-07-11 00:21:36', '删除角色组, 类型是4');
INSERT INTO `sys_log` VALUES ('309', '', '127.0.0.1', '2017-07-11 00:23:57', '删除角色组, 类型是3');
INSERT INTO `sys_log` VALUES ('310', '', '127.0.0.1', '2017-07-11 00:24:12', '添加角色类型:22');
INSERT INTO `sys_log` VALUES ('311', '', '127.0.0.1', '2017-07-11 00:24:42', '删除角色组, 类型是3');
INSERT INTO `sys_log` VALUES ('312', '', '127.0.0.1', '2017-07-11 00:24:53', '添加角色类型:3322');
INSERT INTO `sys_log` VALUES ('313', '', '127.0.0.1', '2017-07-11 00:25:08', '删除角色组, 类型是3');
INSERT INTO `sys_log` VALUES ('314', '', '127.0.0.1', '2017-07-11 00:25:13', '添加角色类型:22');
INSERT INTO `sys_log` VALUES ('315', '', '127.0.0.1', '2017-07-11 00:25:20', '添加角色类型:440');
INSERT INTO `sys_log` VALUES ('316', '', '127.0.0.1', '2017-07-11 00:25:26', '删除角色组, 类型是4');
INSERT INTO `sys_log` VALUES ('317', '', '127.0.0.1', '2017-07-11 00:26:00', '删除角色组, 类型是3');
INSERT INTO `sys_log` VALUES ('318', '', '127.0.0.1', '2017-07-11 00:26:46', '添加角色类型:223');
INSERT INTO `sys_log` VALUES ('319', '', '127.0.0.1', '2017-07-11 00:26:49', '删除角色组, 类型是3');
INSERT INTO `sys_log` VALUES ('320', '', '127.0.0.1', '2017-07-11 00:27:06', '添加角色类型:22');
INSERT INTO `sys_log` VALUES ('321', '', '127.0.0.1', '2017-07-11 00:27:09', '删除角色组, 类型是3');
INSERT INTO `sys_log` VALUES ('322', '', '127.0.0.1', '2017-07-11 00:28:10', '添加角色类型:222');
INSERT INTO `sys_log` VALUES ('323', '', '127.0.0.1', '2017-07-11 00:28:13', '删除角色组, 类型是3');
INSERT INTO `sys_log` VALUES ('324', '', '127.0.0.1', '2017-07-11 00:28:21', '添加角色类型:jifhehdw');
INSERT INTO `sys_log` VALUES ('325', '', '127.0.0.1', '2017-07-11 00:28:26', '添加角色:222');
INSERT INTO `sys_log` VALUES ('326', '', '127.0.0.1', '2017-07-11 00:28:33', '删除角色, id是38');
INSERT INTO `sys_log` VALUES ('327', '', '127.0.0.1', '2017-07-11 00:28:35', '删除角色组, 类型是3');
INSERT INTO `sys_log` VALUES ('328', '', '127.0.0.1', '2017-07-11 00:29:29', '添加角色类型:test');
INSERT INTO `sys_log` VALUES ('329', '', '127.0.0.1', '2017-07-11 00:30:43', '删除角色组, 类型是3');
INSERT INTO `sys_log` VALUES ('330', '', '127.0.0.1', '2017-07-11 00:30:50', '添加角色:test');
INSERT INTO `sys_log` VALUES ('331', '', '127.0.0.1', '2017-07-11 00:31:53', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('332', '', '127.0.0.1', '2017-07-11 00:32:00', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('333', 'jiajun', '127.0.0.1', '2017-07-11 20:50:42', '登录成功');
INSERT INTO `sys_log` VALUES ('334', '', '127.0.0.1', '2017-07-11 22:48:48', '添加菜单:22');
INSERT INTO `sys_log` VALUES ('335', '', '127.0.0.1', '2017-07-11 22:48:58', '添加菜单:33');
INSERT INTO `sys_log` VALUES ('336', '', '127.0.0.1', '2017-07-11 22:49:05', '删除菜单');
INSERT INTO `sys_log` VALUES ('337', '', '127.0.0.1', '2017-07-11 22:49:19', '删除菜单');
INSERT INTO `sys_log` VALUES ('338', '', '127.0.0.1', '2017-07-11 22:50:12', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('339', '', '127.0.0.1', '2017-07-11 22:50:17', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('340', '', '127.0.0.1', '2017-07-11 23:25:20', '添加菜单:2');
INSERT INTO `sys_log` VALUES ('341', '', '127.0.0.1', '2017-07-11 23:25:57', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('342', '', '127.0.0.1', '2017-07-11 23:26:22', '添加菜单:1');
INSERT INTO `sys_log` VALUES ('343', '', '127.0.0.1', '2017-07-11 23:26:25', '删除菜单');
INSERT INTO `sys_log` VALUES ('344', '', '127.0.0.1', '2017-07-11 23:26:28', '删除菜单');
INSERT INTO `sys_log` VALUES ('345', '', '127.0.0.1', '2017-07-12 00:21:43', '添加菜单:1');
INSERT INTO `sys_log` VALUES ('346', '', '127.0.0.1', '2017-07-12 01:11:18', '添加菜单:test2');
INSERT INTO `sys_log` VALUES ('347', '', '127.0.0.1', '2017-07-12 01:16:47', '添加菜单:测试菜单');
INSERT INTO `sys_log` VALUES ('348', '', '127.0.0.1', '2017-07-12 01:17:38', '添加菜单:测试菜单222');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(32) NOT NULL,
  `parent_id` int(16) NOT NULL,
  `is_parent` tinyint(1) NOT NULL COMMENT '0表示不是父菜单, 1表示是父菜单',
  `access_url` varchar(255) DEFAULT NULL COMMENT 'URL地址',
  `sort` int(16) NOT NULL,
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可见1表示可见0表示隐藏,',
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modifyed` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', '#', '10', 'menu-icon fa fa-desktop  brown', '1', null, null);
INSERT INTO `sys_menu` VALUES ('2', '用户管理', '0', '1', '#', '20', 'menu-icon fa fa-users  purple', '1', '2017-07-08 23:10:25', '2017-07-08 23:19:40');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '1', '#', '30', 'menu-icon fa fa-cog  black', '1', null, '2017-07-08 23:19:58');
INSERT INTO `sys_menu` VALUES ('4', '微信管理', '0', '1', '#', '40', 'menu-icon fa fa-comments  green', '1', null, '2017-07-08 23:20:17');
INSERT INTO `sys_menu` VALUES ('5', '权限管理', '1', '1', '#', '10', 'menu-icon fa fa-lock  orange', '1', null, '2017-07-08 23:19:14');
INSERT INTO `sys_menu` VALUES ('17', '菜单权限', '5', '0', 'role/menuList.do?roleType=1', '10', 'menu-icon fa fa-key  brown', '1', null, '2017-07-08 23:26:50');
INSERT INTO `sys_menu` VALUES ('18', '按钮权限', '5', '0', 'role/buttonList.do?roleType=1', '20', 'menu-icon fa fa-key  purple', '1', null, '2017-07-08 23:27:23');
INSERT INTO `sys_menu` VALUES ('19', '按钮管理', '1', '0', 'button/list.do', '20', 'menu-icon fa fa-hdd-o  blue', '1', null, null);
INSERT INTO `sys_menu` VALUES ('20', '在线管理', '1', '0', 'user/onlineList.do', '40', 'menu-icon fa fa-users  green', '1', null, '2017-07-08 22:22:06');
INSERT INTO `sys_menu` VALUES ('21', '菜单管理', '1', '0', 'menu/listAllMenu.do', '30', 'menu-icon fa fa-folder-open-o  grey', '1', null, '2017-07-08 22:21:26');
INSERT INTO `sys_menu` VALUES ('22', '日志管理', '1', '0', 'log/list.do', '50', 'menu-icon fa fa-bolt  black', '1', '2017-07-08 22:23:45', '2017-07-08 22:24:19');
INSERT INTO `sys_menu` VALUES ('23', '系统用户', '2', '0', 'user/listUser.do', '10', 'menu-icon fa fa-users  green', '1', '2017-07-08 22:26:25', '2017-07-11 22:50:17');
INSERT INTO `sys_menu` VALUES ('24', '会员管理', '2', '0', 'vipUserList.do', '20', 'menu-icon fa fa-users  pink', '1', '2017-07-08 22:27:33', '2017-07-08 22:27:41');
INSERT INTO `sys_menu` VALUES ('25', '代码生成器', '3', '0', 'codeGenerator.do', '10', 'menu-icon fa fa-cogs  purple', '1', '2017-07-08 22:31:48', '2017-07-08 22:33:50');
INSERT INTO `sys_menu` VALUES ('26', '表单构造器', '3', '0', '#', '20', 'menu-icon fa fa-barcode  green', '1', '2017-07-08 22:33:40', '2017-07-08 22:34:11');
INSERT INTO `sys_menu` VALUES ('27', '接口测试', '3', '0', '#', '30', 'menu-icon fa fa-fighter-jet  blue', '1', '2017-07-08 22:34:26', '2017-07-08 22:34:59');
INSERT INTO `sys_menu` VALUES ('28', '发送邮件', '3', '0', '#', '40', 'menu-icon fa fa-envelope-o  brown', '1', '2017-07-08 22:35:20', '2017-07-08 22:37:39');
INSERT INTO `sys_menu` VALUES ('29', '设置二维码', '3', '0', '#', '50', 'menu-icon fa fa-barcode  black', '1', '2017-07-08 22:35:34', '2017-07-08 22:37:50');
INSERT INTO `sys_menu` VALUES ('30', '图表报表', '3', '0', '#', '60', 'menu-icon fa fa-bar-chart-o  orange', '1', '2017-07-08 22:36:26', '2017-07-08 22:38:05');
INSERT INTO `sys_menu` VALUES ('31', '地图工具', '3', '0', '#', '70', 'menu-icon fa fa-globe  blue', '1', '2017-07-08 22:36:40', '2017-07-08 22:38:26');
INSERT INTO `sys_menu` VALUES ('32', '性能监测', '3', '0', '#', '80', 'menu-icon fa fa-tachometer  purple', '1', '2017-07-08 22:37:02', '2017-07-08 22:39:08');
INSERT INTO `sys_menu` VALUES ('33', '信息管理', '0', '1', '#', '50', 'menu-icon fa fa-comments-o  orange', '1', '2017-07-08 22:40:32', '2017-07-08 22:47:20');
INSERT INTO `sys_menu` VALUES ('34', '数据库管理', '0', '1', '#', '60', 'menu-icon fa fa-hdd-o  red', '1', '2017-07-08 22:41:05', '2017-07-08 23:20:58');
INSERT INTO `sys_menu` VALUES ('35', '关注回复', '4', '0', '#', '10', 'menu-icon fa fa-bell-o  grey', '1', '2017-07-08 22:48:07', '2017-07-08 22:49:21');
INSERT INTO `sys_menu` VALUES ('36', '文本回复', '4', '0', '#', '20', 'menu-icon fa fa-bell  blue', '1', '2017-07-08 22:48:21', '2017-07-08 22:49:29');
INSERT INTO `sys_menu` VALUES ('37', '图文回复', '4', '0', '#', '30', 'menu-icon fa fa-leaf  black', '1', '2017-07-08 22:48:36', '2017-07-08 22:49:54');
INSERT INTO `sys_menu` VALUES ('38', '应用命令', '4', '0', '#', '40', 'menu-icon fa fa-cutlery  brown', '1', '2017-07-08 22:48:57', '2017-07-08 22:50:13');
INSERT INTO `sys_menu` VALUES ('39', '图片管理', '33', '1', '#', '10', 'menu-icon fa fa-camera-retro  purple', '1', '2017-07-08 22:50:36', '2017-07-08 23:21:22');
INSERT INTO `sys_menu` VALUES ('40', '站内信', '33', '0', '#', '20', 'menu-icon fa fa-comments-o  pink', '1', '2017-07-08 22:55:50', '2017-07-08 22:56:32');
INSERT INTO `sys_menu` VALUES ('41', '图片列表', '39', '0', '#', '10', 'menu-icon fa fa-briefcase  grey', '1', '2017-07-08 22:56:53', '2017-07-08 22:57:05');
INSERT INTO `sys_menu` VALUES ('42', '图片爬虫', '39', '0', '#', '20', 'menu-icon fa fa-exchange  brown', '1', '2017-07-08 22:57:14', '2017-07-08 22:57:27');
INSERT INTO `sys_menu` VALUES ('43', '数据库备份', '34', '0', '#', '10', 'menu-icon fa fa-cloud-upload  brown', '1', '2017-07-08 23:01:10', '2017-07-08 23:03:42');
INSERT INTO `sys_menu` VALUES ('44', '备份定时器', '34', '0', '#', '20', 'menu-icon fa fa-calendar  blue', '1', '2017-07-08 23:01:34', '2017-07-08 23:03:03');
INSERT INTO `sys_menu` VALUES ('45', '数据库还原', '34', '0', '#', '30', 'menu-icon fa fa-cloud-download  black', '1', '2017-07-08 23:02:14', '2017-07-08 23:03:14');
INSERT INTO `sys_menu` VALUES ('56', 'sql编辑器', '34', '0', '#', '40', 'menu-icon fa fa-pencil-square-o  blue', '1', '2017-07-08 23:20:58', '2017-07-08 23:21:06');
INSERT INTO `sys_menu` VALUES ('67', 'test2', '0', '0', '222', '222', null, '1', '2017-07-12 01:11:18', '2017-07-12 01:11:18');
INSERT INTO `sys_menu` VALUES ('73', '测试菜单', '0', '0', '111', '111', null, '1', '2017-07-12 01:16:47', '2017-07-12 01:16:47');
INSERT INTO `sys_menu` VALUES ('74', '测试菜单222', '0', '0', '1231321', '7777', null, '1', '2017-07-12 01:17:38', '2017-07-12 01:17:38');

-- ----------------------------
-- Table structure for sys_menu_premission
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_premission`;
CREATE TABLE `sys_menu_premission` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `menu_id` int(16) NOT NULL,
  `premission_type` smallint(2) DEFAULT NULL COMMENT '1:query 2:insert 3:update 4:delete 5:other',
  `premission_code` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_menu_premission
-- ----------------------------
INSERT INTO `sys_menu_premission` VALUES ('1', '67', '1', '1');
INSERT INTO `sys_menu_premission` VALUES ('2', '67', '2', '2');
INSERT INTO `sys_menu_premission` VALUES ('3', '67', '3', '3');
INSERT INTO `sys_menu_premission` VALUES ('4', '67', '4', '4');
INSERT INTO `sys_menu_premission` VALUES ('5', '67', '5', '5');
INSERT INTO `sys_menu_premission` VALUES ('8', '73', '1', '1');
INSERT INTO `sys_menu_premission` VALUES ('9', '73', '3', '3');
INSERT INTO `sys_menu_premission` VALUES ('10', '74', '1', 'user:query');
INSERT INTO `sys_menu_premission` VALUES ('11', '74', '2', 'user:add');
INSERT INTO `sys_menu_premission` VALUES ('12', '74', '3', 'user:update');
INSERT INTO `sys_menu_premission` VALUES ('13', '74', '4', 'user:remove');

-- ----------------------------
-- Table structure for sys_opeartion
-- ----------------------------
DROP TABLE IF EXISTS `sys_opeartion`;
CREATE TABLE `sys_opeartion` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `opeartion_name` varchar(32) NOT NULL,
  `privileges_code` varchar(32) NOT NULL DEFAULT '' COMMENT '权限标识',
  `operation_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_opeartion
-- ----------------------------
INSERT INTO `sys_opeartion` VALUES ('1', '导出到EXCEL', 'sys:toExcel', '导出excel必须权限');
INSERT INTO `sys_opeartion` VALUES ('2', '发邮件', 'sys:sendEmail', '发送邮件必备权限');
INSERT INTO `sys_opeartion` VALUES ('3', '导入Excel', 'sys:fromExcel', null);
INSERT INTO `sys_opeartion` VALUES ('4', '发短信', 'sys:sms', null);
INSERT INTO `sys_opeartion` VALUES ('5', '站内通信', 'sys:chat', null);

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `resource_desc` varchar(255) DEFAULT NULL,
  `privilege_code` varchar(32) NOT NULL,
  `menu_id` int(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_resource
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(32) NOT NULL,
  `parent_id` int(16) NOT NULL,
  `sort` int(16) NOT NULL COMMENT '同级别的排序',
  `role_type` int(1) NOT NULL COMMENT '角色类型  0表示超级管理员1表示系统角色, 1表示会员角色 2表示职位角色',
  `menu_ids` varchar(255) DEFAULT NULL COMMENT '角色对应的菜单id, 以,分隔开',
  `operation_ids` varchar(255) DEFAULT NULL COMMENT '角色对应的按钮权限, 以 逗号分隔开',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'admin', '0', '0', '0', null, null);
INSERT INTO `sys_role` VALUES ('2', '系统用户组', '0', '10', '1', '1,19,21,20,22,2,23,24,3,27,28,4,38', null);
INSERT INTO `sys_role` VALUES ('3', '一级管理员', '2', '10', '1', '1,19,21,20,22', null);
INSERT INTO `sys_role` VALUES ('5', '二级管理员', '2', '20', '1', '4,38', null);
INSERT INTO `sys_role` VALUES ('6', '会员组', '0', '20', '2', '2,23,24,3,25,26,27,28,29,30,31,32,4,35,36,37,38,33,39,41,42,40', null);
INSERT INTO `sys_role` VALUES ('7', '超级会员', '6', '10', '2', null, null);
INSERT INTO `sys_role` VALUES ('8', '普通会员', '6', '20', '2', null, null);
INSERT INTO `sys_role` VALUES ('9', '注册用户', '6', '30', '2', null, null);
INSERT INTO `sys_role` VALUES ('10', '四级菜单', '2', '40', '1', null, null);
INSERT INTO `sys_role` VALUES ('11', '50', '2', '50', '1', null, null);
INSERT INTO `sys_role` VALUES ('12', '6', '2', '69', '1', '1,19,21,20,22,2,23,24,3,27,28,4,38', null);
INSERT INTO `sys_role` VALUES ('40', 'test', '2', '30', '1', '1,19,21,20,22,2,23,24,3,27,28,4,38', null);

-- ----------------------------
-- Table structure for sys_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource`;
CREATE TABLE `sys_role_resource` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `role_id` int(16) NOT NULL,
  `resource_id` int(16) NOT NULL,
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_resource
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL COMMENT '登录名,唯一',
  `password` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL COMMENT '实际名称, 可以重复',
  `login_time` date DEFAULT NULL COMMENT '上次登录时间',
  `last_id` varchar(32) DEFAULT NULL COMMENT '上次登录ip',
  `skin` varchar(10) DEFAULT NULL COMMENT '皮肤',
  `sort` int(16) NOT NULL COMMENT '排序',
  `phone` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL,
  `status` smallint(1) NOT NULL COMMENT '状态0表示不在线, 1表示在线',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '123', '系统管理员_admin', null, null, null, '1', '13888888888', '1234@qq.com', '0', '最高权限用户', null, null);
INSERT INTO `sys_user` VALUES ('2', 'jiajun', '123', 'jiajun', null, null, null, '2', '12333333333', '123@qq.com', '0', '测试用户', null, null);
INSERT INTO `sys_user` VALUES ('3', 'jerry', '123', '测试用户2', null, null, null, '3', '1111111111', '12345@qq.com', '0', '测试用户', null, null);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `user_id` int(16) NOT NULL,
  `role_id` int(16) NOT NULL,
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1', '1', null, null);
INSERT INTO `sys_user_role` VALUES ('2', '2', '2', null, null);
INSERT INTO `sys_user_role` VALUES ('4', '3', '3', null, null);

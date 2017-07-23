/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.111_jiajun
Source Server Version : 50718
Source Host           : 192.168.1.111:3306
Source Database       : trump

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-07-24 00:35:44
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
) ENGINE=InnoDB AUTO_INCREMENT=757 DEFAULT CHARSET=utf8;

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
INSERT INTO `sys_log` VALUES ('349', 'admin', '127.0.0.1', '2017-07-12 20:54:56', '登录成功');
INSERT INTO `sys_log` VALUES ('350', '', '127.0.0.1', '2017-07-12 21:22:16', '添加菜单:test');
INSERT INTO `sys_log` VALUES ('351', '', '127.0.0.1', '2017-07-12 21:47:54', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('352', '', '127.0.0.1', '2017-07-12 21:49:07', '添加菜单:test3');
INSERT INTO `sys_log` VALUES ('353', '', '127.0.0.1', '2017-07-12 21:50:00', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('354', '', '127.0.0.1', '2017-07-12 21:50:08', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('355', '', '127.0.0.1', '2017-07-12 21:50:26', '添加菜单:xixi');
INSERT INTO `sys_log` VALUES ('356', '', '127.0.0.1', '2017-07-12 21:51:32', '添加菜单:08098');
INSERT INTO `sys_log` VALUES ('357', '', '127.0.0.1', '2017-07-12 21:56:51', '添加菜单:111');
INSERT INTO `sys_log` VALUES ('358', '', '127.0.0.1', '2017-07-12 21:57:27', '添加菜单:hahah');
INSERT INTO `sys_log` VALUES ('359', '', '127.0.0.1', '2017-07-12 21:59:31', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('360', '', '127.0.0.1', '2017-07-12 22:08:07', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('361', '', '127.0.0.1', '2017-07-12 22:18:33', '删除菜单');
INSERT INTO `sys_log` VALUES ('362', '', '127.0.0.1', '2017-07-12 22:18:51', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('363', '', '127.0.0.1', '2017-07-12 22:19:02', '删除菜单');
INSERT INTO `sys_log` VALUES ('364', '', '127.0.0.1', '2017-07-12 22:19:05', '删除菜单');
INSERT INTO `sys_log` VALUES ('365', '', '127.0.0.1', '2017-07-12 22:19:08', '删除菜单');
INSERT INTO `sys_log` VALUES ('366', '', '127.0.0.1', '2017-07-12 22:19:10', '删除菜单');
INSERT INTO `sys_log` VALUES ('367', '', '127.0.0.1', '2017-07-12 22:19:12', '删除菜单');
INSERT INTO `sys_log` VALUES ('368', '', '127.0.0.1', '2017-07-12 22:19:14', '删除菜单');
INSERT INTO `sys_log` VALUES ('369', '', '127.0.0.1', '2017-07-12 22:19:16', '删除菜单');
INSERT INTO `sys_log` VALUES ('370', '', '127.0.0.1', '2017-07-12 22:19:18', '删除菜单');
INSERT INTO `sys_log` VALUES ('371', '', '127.0.0.1', '2017-07-12 22:20:09', '添加菜单:测试菜单');
INSERT INTO `sys_log` VALUES ('372', '', '127.0.0.1', '2017-07-12 22:20:14', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('373', '', '127.0.0.1', '2017-07-12 22:20:29', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('374', '', '127.0.0.1', '2017-07-12 22:20:41', '删除菜单');
INSERT INTO `sys_log` VALUES ('375', '', '127.0.0.1', '2017-07-12 22:31:06', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('376', '', '127.0.0.1', '2017-07-12 22:56:39', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('377', '', '127.0.0.1', '2017-07-12 22:56:46', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('378', '', '127.0.0.1', '2017-07-12 22:57:18', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('379', '', '127.0.0.1', '2017-07-12 22:57:57', '添加角色类型:man');
INSERT INTO `sys_log` VALUES ('380', '', '127.0.0.1', '2017-07-12 22:58:13', '添加角色:young');
INSERT INTO `sys_log` VALUES ('381', '', '127.0.0.1', '2017-07-12 22:58:18', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('382', '', '127.0.0.1', '2017-07-12 22:58:25', '删除角色, id是42');
INSERT INTO `sys_log` VALUES ('383', '', '127.0.0.1', '2017-07-12 22:58:28', '删除角色组, 类型是3');
INSERT INTO `sys_log` VALUES ('384', '', '127.0.0.1', '2017-07-12 22:59:44', '修改角色信息:三级管理员');
INSERT INTO `sys_log` VALUES ('385', '', '127.0.0.1', '2017-07-12 22:59:51', '删除角色, id是40');
INSERT INTO `sys_log` VALUES ('386', '', '127.0.0.1', '2017-07-12 23:23:43', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('387', '', '127.0.0.1', '2017-07-12 23:25:49', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('388', '', '127.0.0.1', '2017-07-12 23:26:03', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('389', '', '127.0.0.1', '2017-07-12 23:28:33', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('390', '', '127.0.0.1', '2017-07-12 23:29:00', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('391', '', '127.0.0.1', '2017-07-12 23:29:29', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('392', 'jiajun', '127.0.0.1', '2017-07-12 23:34:17', '登录成功');
INSERT INTO `sys_log` VALUES ('393', 'jiajun', '127.0.0.1', '2017-07-12 23:36:11', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('394', 'jiajun', '127.0.0.1', '2017-07-12 23:36:59', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('395', 'jiajun', '127.0.0.1', '2017-07-12 23:38:00', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('396', 'jiajun', '127.0.0.1', '2017-07-12 23:38:31', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('397', 'jiajun', '127.0.0.1', '2017-07-12 23:38:48', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('398', 'jiajun', '127.0.0.1', '2017-07-12 23:39:05', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('399', 'jiajun', '127.0.0.1', '2017-07-12 23:39:13', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('400', 'jiajun', '127.0.0.1', '2017-07-12 23:40:56', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('401', 'jiajun', '127.0.0.1', '2017-07-12 23:41:18', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('402', 'jiajun', '127.0.0.1', '2017-07-12 23:41:41', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('403', 'jiajun', '127.0.0.1', '2017-07-12 23:41:51', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('404', 'jiajun', '127.0.0.1', '2017-07-12 23:42:15', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('405', 'jiajun', '127.0.0.1', '2017-07-12 23:42:28', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('406', 'jiajun', '127.0.0.1', '2017-07-12 23:42:47', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('407', 'jiajun', '127.0.0.1', '2017-07-12 23:43:04', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('408', 'jiajun', '127.0.0.1', '2017-07-12 23:44:35', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('409', 'jiajun', '127.0.0.1', '2017-07-12 23:45:54', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('410', 'jiajun', '127.0.0.1', '2017-07-12 23:47:36', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('411', 'jiajun', '127.0.0.1', '2017-07-12 23:48:58', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('412', 'jiajun', '127.0.0.1', '2017-07-12 23:49:32', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('413', 'jiajun', '127.0.0.1', '2017-07-12 23:53:45', '添加菜单:文件管理');
INSERT INTO `sys_log` VALUES ('414', 'jiajun', '127.0.0.1', '2017-07-12 23:53:54', '修改菜单图标');
INSERT INTO `sys_log` VALUES ('415', 'jiajun', '127.0.0.1', '2017-07-12 23:56:09', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('416', 'jiajun', '127.0.0.1', '2017-07-12 23:56:49', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('417', 'jiajun', '127.0.0.1', '2017-07-12 23:56:59', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('418', 'jiajun', '127.0.0.1', '2017-07-12 23:58:10', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('419', 'jiajun', '127.0.0.1', '2017-07-12 23:58:26', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('420', 'jiajun', '127.0.0.1', '2017-07-13 22:32:36', '登录成功');
INSERT INTO `sys_log` VALUES ('421', 'jiajun', '127.0.0.1', '2017-07-14 00:19:43', '登录成功');
INSERT INTO `sys_log` VALUES ('422', 'jiajun', '127.0.0.1', '2017-07-14 00:20:34', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('423', 'jiajun', '127.0.0.1', '2017-07-14 00:20:39', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('424', 'jiajun', '127.0.0.1', '2017-07-14 00:20:44', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('425', 'jiajun', '127.0.0.1', '2017-07-16 13:58:38', '登录成功');
INSERT INTO `sys_log` VALUES ('426', '', '127.0.0.1', '2017-07-16 15:18:49', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('427', '', '127.0.0.1', '2017-07-16 15:19:04', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('428', '', '127.0.0.1', '2017-07-16 16:54:29', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('429', '', '127.0.0.1', '2017-07-16 16:55:14', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('430', '', '127.0.0.1', '2017-07-16 17:01:57', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('431', '', '127.0.0.1', '2017-07-16 17:15:40', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('432', '', '127.0.0.1', '2017-07-16 17:15:54', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('433', '', '127.0.0.1', '2017-07-16 17:15:59', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('434', '', '127.0.0.1', '2017-07-16 17:16:33', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('435', '', '127.0.0.1', '2017-07-16 17:20:43', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('436', '', '127.0.0.1', '2017-07-16 17:20:53', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('437', '', '127.0.0.1', '2017-07-16 17:21:00', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('438', '', '127.0.0.1', '2017-07-16 17:26:32', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('439', '', '127.0.0.1', '2017-07-16 17:26:53', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('440', '', '127.0.0.1', '2017-07-16 17:26:58', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('441', '', '127.0.0.1', '2017-07-16 17:27:19', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('442', '', '127.0.0.1', '2017-07-16 17:27:22', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('443', '', '127.0.0.1', '2017-07-16 17:28:20', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('444', '', '127.0.0.1', '2017-07-16 17:38:53', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('445', '', '127.0.0.1', '2017-07-16 17:38:58', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('446', '', '127.0.0.1', '2017-07-16 17:46:09', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('447', '', '127.0.0.1', '2017-07-16 17:46:12', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('448', '', '127.0.0.1', '2017-07-16 17:46:15', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('449', '', '127.0.0.1', '2017-07-16 17:47:29', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('450', '', '127.0.0.1', '2017-07-16 17:47:48', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('451', '', '127.0.0.1', '2017-07-16 17:48:50', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('452', '', '127.0.0.1', '2017-07-16 17:49:22', '添加角色类型:外勤');
INSERT INTO `sys_log` VALUES ('453', '', '127.0.0.1', '2017-07-16 17:49:40', '添加角色:外勤1');
INSERT INTO `sys_log` VALUES ('454', '', '127.0.0.1', '2017-07-16 17:55:49', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('455', '', '127.0.0.1', '2017-07-16 17:55:57', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('456', '', '127.0.0.1', '2017-07-16 17:56:01', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('457', '', '127.0.0.1', '2017-07-16 17:56:05', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('458', '', '127.0.0.1', '2017-07-16 17:56:08', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('459', '', '127.0.0.1', '2017-07-16 17:56:10', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('460', '', '127.0.0.1', '2017-07-16 17:56:37', '删除角色, id是14');
INSERT INTO `sys_log` VALUES ('461', '', '127.0.0.1', '2017-07-16 17:57:00', '删除角色组, 类型是3');
INSERT INTO `sys_log` VALUES ('462', '', '127.0.0.1', '2017-07-16 21:40:09', '修改按钮操作!');
INSERT INTO `sys_log` VALUES ('463', '', '127.0.0.1', '2017-07-16 21:41:18', '修改按钮操作!');
INSERT INTO `sys_log` VALUES ('464', '', '127.0.0.1', '2017-07-16 21:41:21', '修改按钮操作!');
INSERT INTO `sys_log` VALUES ('465', '', '127.0.0.1', '2017-07-16 21:41:29', '修改按钮操作!');
INSERT INTO `sys_log` VALUES ('466', '', '127.0.0.1', '2017-07-16 21:41:37', '修改按钮操作!');
INSERT INTO `sys_log` VALUES ('467', '', '127.0.0.1', '2017-07-16 21:43:00', '修改按钮操作!');
INSERT INTO `sys_log` VALUES ('468', '', '127.0.0.1', '2017-07-16 21:48:00', '修改按钮操作!');
INSERT INTO `sys_log` VALUES ('469', '', '127.0.0.1', '2017-07-16 21:48:05', '修改按钮操作!');
INSERT INTO `sys_log` VALUES ('470', '', '127.0.0.1', '2017-07-16 21:48:15', '修改按钮操作!');
INSERT INTO `sys_log` VALUES ('471', '', '127.0.0.1', '2017-07-16 21:51:15', '修改角色信息:一级管理员');
INSERT INTO `sys_log` VALUES ('472', '', '127.0.0.1', '2017-07-16 21:52:00', '修改按钮操作!');
INSERT INTO `sys_log` VALUES ('473', '', '127.0.0.1', '2017-07-16 21:52:14', '修改按钮操作!');
INSERT INTO `sys_log` VALUES ('474', '', '127.0.0.1', '2017-07-16 21:52:31', '修改按钮操作!');
INSERT INTO `sys_log` VALUES ('475', '', '127.0.0.1', '2017-07-16 21:52:43', '修改按钮操作!');
INSERT INTO `sys_log` VALUES ('476', '', '127.0.0.1', '2017-07-16 21:54:09', '修改按钮操作!');
INSERT INTO `sys_log` VALUES ('477', '', '127.0.0.1', '2017-07-16 21:54:15', '修改按钮操作!');
INSERT INTO `sys_log` VALUES ('478', '', '127.0.0.1', '2017-07-16 21:54:59', '修改按钮操作!');
INSERT INTO `sys_log` VALUES ('479', '', '127.0.0.1', '2017-07-16 21:55:07', '修改按钮操作!');
INSERT INTO `sys_log` VALUES ('480', '', '127.0.0.1', '2017-07-16 21:57:59', '修改按钮操作!');
INSERT INTO `sys_log` VALUES ('481', '', '127.0.0.1', '2017-07-16 21:59:06', '修改按钮操作!');
INSERT INTO `sys_log` VALUES ('482', '', '127.0.0.1', '2017-07-16 22:00:33', '添加按钮操作!');
INSERT INTO `sys_log` VALUES ('483', '', '127.0.0.1', '2017-07-16 22:00:38', '修改按钮操作!');
INSERT INTO `sys_log` VALUES ('484', '', '127.0.0.1', '2017-07-16 22:31:54', '添加按钮操作!');
INSERT INTO `sys_log` VALUES ('485', '', '127.0.0.1', '2017-07-16 22:31:59', '添加按钮操作!');
INSERT INTO `sys_log` VALUES ('486', '', '127.0.0.1', '2017-07-16 22:32:03', '添加按钮操作!');
INSERT INTO `sys_log` VALUES ('487', '', '127.0.0.1', '2017-07-16 22:32:06', '添加按钮操作!');
INSERT INTO `sys_log` VALUES ('488', '', '127.0.0.1', '2017-07-16 22:35:49', '添加按钮操作!');
INSERT INTO `sys_log` VALUES ('489', '', '127.0.0.1', '2017-07-16 22:37:12', '添加按钮操作!');
INSERT INTO `sys_log` VALUES ('490', '', '127.0.0.1', '2017-07-16 22:37:20', '修改按钮操作!');
INSERT INTO `sys_log` VALUES ('491', '', '127.0.0.1', '2017-07-16 22:37:55', '添加按钮操作!');
INSERT INTO `sys_log` VALUES ('492', '', '127.0.0.1', '2017-07-16 22:38:39', '添加按钮操作!');
INSERT INTO `sys_log` VALUES ('493', '', '127.0.0.1', '2017-07-16 22:49:36', '添加按钮操作!');
INSERT INTO `sys_log` VALUES ('494', '', '127.0.0.1', '2017-07-17 00:54:39', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('495', '', '127.0.0.1', '2017-07-17 00:57:21', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('496', '', '127.0.0.1', '2017-07-17 00:57:25', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('497', '', '127.0.0.1', '2017-07-17 00:57:30', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('498', '', '127.0.0.1', '2017-07-17 00:57:31', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('499', '', '127.0.0.1', '2017-07-17 00:57:31', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('500', '', '127.0.0.1', '2017-07-17 00:57:31', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('501', '', '127.0.0.1', '2017-07-17 00:57:31', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('502', '', '127.0.0.1', '2017-07-17 00:57:32', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('503', '', '127.0.0.1', '2017-07-17 00:57:32', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('504', '', '127.0.0.1', '2017-07-17 00:57:32', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('505', '', '127.0.0.1', '2017-07-17 00:57:32', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('506', '', '127.0.0.1', '2017-07-17 00:57:32', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('507', '', '127.0.0.1', '2017-07-17 00:57:32', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('508', '', '127.0.0.1', '2017-07-17 00:57:43', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('509', '', '127.0.0.1', '2017-07-17 00:57:43', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('510', '', '127.0.0.1', '2017-07-17 00:57:47', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('511', '', '127.0.0.1', '2017-07-17 00:57:48', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('512', '', '127.0.0.1', '2017-07-17 00:57:48', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('513', '', '127.0.0.1', '2017-07-17 00:57:48', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('514', '', '127.0.0.1', '2017-07-17 00:57:49', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('515', '', '127.0.0.1', '2017-07-17 00:57:49', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('516', '', '127.0.0.1', '2017-07-17 00:57:50', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('517', '', '127.0.0.1', '2017-07-17 00:57:51', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('518', '', '127.0.0.1', '2017-07-17 00:57:51', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('519', '', '127.0.0.1', '2017-07-17 00:57:52', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('520', '', '127.0.0.1', '2017-07-17 00:57:52', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('521', '', '127.0.0.1', '2017-07-17 00:57:53', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('522', '', '127.0.0.1', '2017-07-17 00:57:53', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('523', '', '127.0.0.1', '2017-07-17 00:57:55', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('524', '', '127.0.0.1', '2017-07-17 00:57:56', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('525', '', '127.0.0.1', '2017-07-17 00:57:58', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('526', '', '127.0.0.1', '2017-07-17 00:59:22', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('527', '', '127.0.0.1', '2017-07-17 00:59:22', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('528', '', '127.0.0.1', '2017-07-17 00:59:23', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('529', '', '127.0.0.1', '2017-07-17 00:59:23', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('530', '', '127.0.0.1', '2017-07-17 00:59:24', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('531', '', '127.0.0.1', '2017-07-17 00:59:24', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('532', '', '127.0.0.1', '2017-07-17 00:59:25', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('533', '', '127.0.0.1', '2017-07-17 00:59:25', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('534', '', '127.0.0.1', '2017-07-17 00:59:26', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('535', '', '127.0.0.1', '2017-07-17 00:59:56', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('536', 'jiajun', '127.0.0.1', '2017-07-17 21:06:00', '登录成功');
INSERT INTO `sys_log` VALUES ('537', 'jiajun', '127.0.0.1', '2017-07-17 21:11:05', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('538', 'jiajun', '127.0.0.1', '2017-07-17 21:11:05', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('539', 'jiajun', '127.0.0.1', '2017-07-17 21:11:06', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('540', 'jiajun', '127.0.0.1', '2017-07-17 21:11:06', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('541', 'jiajun', '127.0.0.1', '2017-07-17 21:13:30', '删除菜单');
INSERT INTO `sys_log` VALUES ('542', 'jiajun', '127.0.0.1', '2017-07-18 22:23:30', '登录成功');
INSERT INTO `sys_log` VALUES ('543', 'jiajun', '127.0.0.1', '2017-07-18 23:33:42', '登录成功');
INSERT INTO `sys_log` VALUES ('544', 'jiajun', '127.0.0.1', '2017-07-18 23:34:43', '登录成功');
INSERT INTO `sys_log` VALUES ('545', 'jiajun', '127.0.0.1', '2017-07-18 23:37:40', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('546', 'jiajun', '127.0.0.1', '2017-07-18 23:38:17', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('547', 'jiajun', '127.0.0.1', '2017-07-18 23:38:55', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('548', 'jiajun', '127.0.0.1', '2017-07-18 23:40:08', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('549', 'jiajun', '127.0.0.1', '2017-07-18 23:40:29', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('550', 'jiajun', '127.0.0.1', '2017-07-18 23:40:43', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('551', 'jiajun', '127.0.0.1', '2017-07-18 23:41:03', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('552', 'jiajun', '127.0.0.1', '2017-07-18 23:41:59', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('553', 'jiajun', '127.0.0.1', '2017-07-18 23:42:19', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('554', 'jiajun', '127.0.0.1', '2017-07-18 23:42:22', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('555', 'jiajun', '127.0.0.1', '2017-07-18 23:43:13', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('556', 'jiajun', '127.0.0.1', '2017-07-18 23:43:41', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('557', 'jiajun', '127.0.0.1', '2017-07-18 23:43:53', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('558', 'jiajun', '127.0.0.1', '2017-07-18 23:46:22', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('559', 'jiajun', '127.0.0.1', '2017-07-18 23:46:28', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('560', 'jiajun', '127.0.0.1', '2017-07-18 23:46:38', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('561', 'jiajun', '127.0.0.1', '2017-07-18 23:48:25', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('562', '', '127.0.0.1', '2017-07-19 00:26:13', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('563', '', '127.0.0.1', '2017-07-19 00:26:20', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('564', '', '127.0.0.1', '2017-07-19 00:26:45', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('565', '', '127.0.0.1', '2017-07-19 00:29:07', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('566', 'jiajun', '127.0.0.1', '2017-07-19 20:39:07', '登录成功');
INSERT INTO `sys_log` VALUES ('567', 'jiajun', '127.0.0.1', '2017-07-19 20:42:39', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('568', 'jiajun', '127.0.0.1', '2017-07-19 20:42:45', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('569', 'jiajun', '127.0.0.1', '2017-07-19 20:42:48', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('570', 'jiajun', '127.0.0.1', '2017-07-19 20:42:53', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('571', 'jiajun', '127.0.0.1', '2017-07-19 20:43:00', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('572', 'jiajun', '127.0.0.1', '2017-07-19 20:43:06', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('573', 'jiajun', '127.0.0.1', '2017-07-19 20:43:08', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('574', 'jiajun', '127.0.0.1', '2017-07-19 20:43:12', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('575', 'jiajun', '127.0.0.1', '2017-07-19 20:44:46', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('576', 'jiajun', '127.0.0.1', '2017-07-19 21:01:24', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('577', 'jiajun', '127.0.0.1', '2017-07-19 21:08:45', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('578', 'jiajun', '127.0.0.1', '2017-07-19 21:09:26', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('579', 'jiajun', '127.0.0.1', '2017-07-19 21:11:18', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('580', 'jiajun', '127.0.0.1', '2017-07-19 21:16:20', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('581', 'jiajun', '127.0.0.1', '2017-07-19 21:16:29', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('582', 'jiajun', '127.0.0.1', '2017-07-19 21:18:59', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('583', 'jiajun', '127.0.0.1', '2017-07-19 21:19:12', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('584', 'jiajun', '127.0.0.1', '2017-07-19 21:19:29', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('585', '', '127.0.0.1', '2017-07-19 22:11:41', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('586', '', '127.0.0.1', '2017-07-19 22:12:18', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('587', '', '127.0.0.1', '2017-07-19 22:12:22', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('588', '', '127.0.0.1', '2017-07-19 22:12:25', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('589', '', '127.0.0.1', '2017-07-19 22:12:40', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('590', '', '127.0.0.1', '2017-07-19 22:12:59', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('591', '', '127.0.0.1', '2017-07-19 22:13:03', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('592', '', '127.0.0.1', '2017-07-19 22:13:07', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('593', '', '127.0.0.1', '2017-07-19 22:13:11', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('594', '', '127.0.0.1', '2017-07-19 22:13:17', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('595', '', '127.0.0.1', '2017-07-19 22:13:21', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('596', '', '127.0.0.1', '2017-07-19 22:13:26', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('597', '', '127.0.0.1', '2017-07-19 22:13:30', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('598', '', '127.0.0.1', '2017-07-19 22:13:35', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('599', '', '127.0.0.1', '2017-07-19 22:14:02', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('600', '', '127.0.0.1', '2017-07-19 22:14:14', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('601', '', '127.0.0.1', '2017-07-19 22:14:17', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('602', '', '127.0.0.1', '2017-07-19 22:19:36', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('603', '', '127.0.0.1', '2017-07-19 22:28:44', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('604', '', '127.0.0.1', '2017-07-19 22:28:55', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('605', '', '127.0.0.1', '2017-07-19 22:29:03', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('606', '', '127.0.0.1', '2017-07-19 22:29:10', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('607', '', '127.0.0.1', '2017-07-19 22:29:17', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('608', '', '127.0.0.1', '2017-07-19 22:29:24', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('609', '', '127.0.0.1', '2017-07-19 22:29:35', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('610', '', '127.0.0.1', '2017-07-19 22:29:40', '删除角色, id是11');
INSERT INTO `sys_log` VALUES ('611', '', '127.0.0.1', '2017-07-19 22:29:47', '删除角色, id是12');
INSERT INTO `sys_log` VALUES ('612', '', '127.0.0.1', '2017-07-19 22:32:25', '登录用户名或者密码错误');
INSERT INTO `sys_log` VALUES ('613', 'jiajun', '127.0.0.1', '2017-07-19 22:32:31', '登录成功');
INSERT INTO `sys_log` VALUES ('614', 'jiajun', '127.0.0.1', '2017-07-21 22:11:52', '登录成功');
INSERT INTO `sys_log` VALUES ('615', 'jiajun', '127.0.0.1', '2017-07-21 23:40:36', '登录成功');
INSERT INTO `sys_log` VALUES ('616', 'jiajun', '127.0.0.1', '2017-07-22 11:16:25', '登录成功');
INSERT INTO `sys_log` VALUES ('617', 'jiajun', '127.0.0.1', '2017-07-22 11:46:18', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('618', 'jiajun', '127.0.0.1', '2017-07-22 11:54:56', '登录成功');
INSERT INTO `sys_log` VALUES ('619', 'jiajun', '127.0.0.1', '2017-07-22 11:55:17', '登录成功');
INSERT INTO `sys_log` VALUES ('620', 'jiajun', '127.0.0.1', '2017-07-22 12:06:15', '登录成功');
INSERT INTO `sys_log` VALUES ('621', 'jiajun', '127.0.0.1', '2017-07-22 12:18:16', '登录成功');
INSERT INTO `sys_log` VALUES ('622', 'jiajun', '127.0.0.1', '2017-07-22 12:22:03', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('623', 'jiajun', '127.0.0.1', '2017-07-22 12:22:18', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('624', 'jiajun', '127.0.0.1', '2017-07-22 12:22:34', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('625', 'jiajun', '127.0.0.1', '2017-07-22 12:22:45', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('626', 'jiajun', '127.0.0.1', '2017-07-22 12:23:38', '登录成功');
INSERT INTO `sys_log` VALUES ('627', 'jiajun', '127.0.0.1', '2017-07-22 12:24:14', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('628', 'jiajun', '127.0.0.1', '2017-07-22 12:24:23', '登录成功');
INSERT INTO `sys_log` VALUES ('629', 'jiajun', '127.0.0.1', '2017-07-22 12:25:48', '登录成功');
INSERT INTO `sys_log` VALUES ('630', 'jiajun', '127.0.0.1', '2017-07-22 12:26:05', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('631', 'jiajun', '127.0.0.1', '2017-07-22 12:26:08', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('632', 'jiajun', '127.0.0.1', '2017-07-22 12:26:12', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('633', 'jiajun', '127.0.0.1', '2017-07-22 13:02:15', '登录成功');
INSERT INTO `sys_log` VALUES ('634', 'jiajun', '127.0.0.1', '2017-07-22 13:12:45', '登录成功');
INSERT INTO `sys_log` VALUES ('635', 'jiajun', '127.0.0.1', '2017-07-22 13:16:42', '登录成功');
INSERT INTO `sys_log` VALUES ('636', 'jiajun', '127.0.0.1', '2017-07-22 13:19:08', '登录成功');
INSERT INTO `sys_log` VALUES ('637', 'jiajun', '127.0.0.1', '2017-07-22 13:21:12', '登录成功');
INSERT INTO `sys_log` VALUES ('638', 'jiajun', '127.0.0.1', '2017-07-22 13:27:16', '修改按钮操作!');
INSERT INTO `sys_log` VALUES ('639', 'jiajun', '127.0.0.1', '2017-07-22 14:20:01', '登录成功');
INSERT INTO `sys_log` VALUES ('640', 'jiajun', '127.0.0.1', '2017-07-22 15:20:56', '登录成功');
INSERT INTO `sys_log` VALUES ('641', '', '127.0.0.1', '2017-07-22 16:58:15', '修改jiajun用户信息');
INSERT INTO `sys_log` VALUES ('642', 'jiajun', '127.0.0.1', '2017-07-22 16:58:27', '登录成功');
INSERT INTO `sys_log` VALUES ('643', '', '127.0.0.1', '2017-07-22 17:41:11', '删除系统用户');
INSERT INTO `sys_log` VALUES ('644', '', '127.0.0.1', '2017-07-22 17:56:14', '登录用户名或者密码错误');
INSERT INTO `sys_log` VALUES ('645', 'jiajun', '127.0.0.1', '2017-07-22 17:56:16', '登录成功');
INSERT INTO `sys_log` VALUES ('646', '', '127.0.0.1', '2017-07-22 18:12:23', '添加系统用户');
INSERT INTO `sys_log` VALUES ('647', 'fly', '127.0.0.1', '2017-07-22 18:13:08', '登录成功');
INSERT INTO `sys_log` VALUES ('648', 'fly', '127.0.0.1', '2017-07-22 18:15:19', '登录用户名或者密码错误');
INSERT INTO `sys_log` VALUES ('649', 'jiajun', '127.0.0.1', '2017-07-22 18:15:28', '登录成功');
INSERT INTO `sys_log` VALUES ('650', 'jiajun', '127.0.0.1', '2017-07-22 18:15:45', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('651', 'fly', '127.0.0.1', '2017-07-22 18:15:55', '登录成功');
INSERT INTO `sys_log` VALUES ('652', 'fly', '127.0.0.1', '2017-07-22 18:43:20', '登录成功');
INSERT INTO `sys_log` VALUES ('653', 'fly', '127.0.0.1', '2017-07-22 18:47:54', '登录成功');
INSERT INTO `sys_log` VALUES ('654', 'fly', '127.0.0.1', '2017-07-22 18:51:07', '修改null用户信息');
INSERT INTO `sys_log` VALUES ('655', 'fly', '127.0.0.1', '2017-07-22 18:51:13', '修改null用户信息');
INSERT INTO `sys_log` VALUES ('656', '', '127.0.0.1', '2017-07-22 19:30:18', '登录用户名或者密码错误');
INSERT INTO `sys_log` VALUES ('657', '', '127.0.0.1', '2017-07-22 19:30:25', '登录用户名或者密码错误');
INSERT INTO `sys_log` VALUES ('658', 'fly', '127.0.0.1', '2017-07-22 19:30:43', '登录成功');
INSERT INTO `sys_log` VALUES ('659', 'fly', '127.0.0.1', '2017-07-22 19:32:56', '登录成功');
INSERT INTO `sys_log` VALUES ('660', 'fly', '127.0.0.1', '2017-07-22 19:39:54', '登录成功');
INSERT INTO `sys_log` VALUES ('661', 'fly', '127.0.0.1', '2017-07-22 19:42:47', '修改个人资料');
INSERT INTO `sys_log` VALUES ('662', 'fly', '127.0.0.1', '2017-07-22 19:42:47', '退出登录');
INSERT INTO `sys_log` VALUES ('663', '', '127.0.0.1', '2017-07-22 19:43:01', '登录用户名或者密码错误');
INSERT INTO `sys_log` VALUES ('664', 'fly', '127.0.0.1', '2017-07-22 19:43:24', '登录成功');
INSERT INTO `sys_log` VALUES ('665', 'fly', '127.0.0.1', '2017-07-22 19:43:44', '修改个人资料');
INSERT INTO `sys_log` VALUES ('666', 'fly', '127.0.0.1', '2017-07-22 19:43:44', '退出登录');
INSERT INTO `sys_log` VALUES ('667', 'fly', '127.0.0.1', '2017-07-22 19:44:30', '登录成功');
INSERT INTO `sys_log` VALUES ('668', 'fly', '127.0.0.1', '2017-07-22 19:44:56', '修改个人资料');
INSERT INTO `sys_log` VALUES ('669', 'fly', '127.0.0.1', '2017-07-22 19:44:56', '退出登录');
INSERT INTO `sys_log` VALUES ('670', '', '127.0.0.1', '2017-07-22 19:45:02', '登录用户名或者密码错误');
INSERT INTO `sys_log` VALUES ('671', 'fly', '127.0.0.1', '2017-07-22 19:46:31', '登录成功');
INSERT INTO `sys_log` VALUES ('672', 'fly', '127.0.0.1', '2017-07-22 19:46:35', '修改个人资料');
INSERT INTO `sys_log` VALUES ('673', 'fly', '127.0.0.1', '2017-07-22 19:46:35', '退出登录');
INSERT INTO `sys_log` VALUES ('674', 'fly', '127.0.0.1', '2017-07-22 19:46:46', '登录成功');
INSERT INTO `sys_log` VALUES ('675', 'jiajun', '127.0.0.1', '2017-07-23 15:53:31', '登录成功');
INSERT INTO `sys_log` VALUES ('676', 'jiajun', '127.0.0.1', '2017-07-23 15:54:10', '登录成功');
INSERT INTO `sys_log` VALUES ('677', 'jiajun', '127.0.0.1', '2017-07-23 15:59:12', '登录成功');
INSERT INTO `sys_log` VALUES ('678', 'jiajun', '127.0.0.1', '2017-07-23 16:04:52', '登录成功');
INSERT INTO `sys_log` VALUES ('679', 'jiajun', '127.0.0.1', '2017-07-23 16:09:25', '登录成功');
INSERT INTO `sys_log` VALUES ('680', 'jiajun', '127.0.0.1', '2017-07-23 16:17:46', '登录成功');
INSERT INTO `sys_log` VALUES ('681', 'jiajun', '127.0.0.1', '2017-07-23 16:27:28', '登录成功');
INSERT INTO `sys_log` VALUES ('682', 'jiajun', '127.0.0.1', '2017-07-23 16:34:26', '登录成功');
INSERT INTO `sys_log` VALUES ('683', 'jiajun', '127.0.0.1', '2017-07-23 16:45:36', '登录成功');
INSERT INTO `sys_log` VALUES ('684', 'jiajun', '127.0.0.1', '2017-07-23 16:50:39', '登录成功');
INSERT INTO `sys_log` VALUES ('685', 'jiajun', '127.0.0.1', '2017-07-23 17:02:28', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('686', 'jiajun', '127.0.0.1', '2017-07-23 17:42:47', '登录成功');
INSERT INTO `sys_log` VALUES ('687', 'jiajun', '127.0.0.1', '2017-07-23 19:00:34', '登录成功');
INSERT INTO `sys_log` VALUES ('688', 'jiajun', '127.0.0.1', '2017-07-23 20:08:24', '登录成功');
INSERT INTO `sys_log` VALUES ('689', 'jiajun', '127.0.0.1', '2017-07-23 21:06:42', '登录成功');
INSERT INTO `sys_log` VALUES ('690', 'jiajun', '127.0.0.1', '2017-07-23 21:23:06', '登录成功');
INSERT INTO `sys_log` VALUES ('691', 'jiajun', '127.0.0.1', '2017-07-23 22:17:09', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('692', 'jiajun', '127.0.0.1', '2017-07-23 22:17:18', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('693', 'jiajun', '127.0.0.1', '2017-07-23 22:17:25', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('694', 'jiajun', '127.0.0.1', '2017-07-23 22:17:32', '登录成功');
INSERT INTO `sys_log` VALUES ('695', 'jiajun', '127.0.0.1', '2017-07-23 22:18:16', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('696', 'jiajun', '127.0.0.1', '2017-07-23 22:29:20', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('697', 'jiajun', '127.0.0.1', '2017-07-23 22:29:53', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('698', 'jiajun', '127.0.0.1', '2017-07-23 22:31:17', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('699', 'jiajun', '127.0.0.1', '2017-07-23 22:32:13', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('700', 'jiajun', '127.0.0.1', '2017-07-23 22:37:39', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('701', 'jiajun', '127.0.0.1', '2017-07-23 22:43:03', '登录成功');
INSERT INTO `sys_log` VALUES ('702', 'admin', '127.0.0.1', '2017-07-23 22:43:38', '登录成功');
INSERT INTO `sys_log` VALUES ('703', 'admin', '127.0.0.1', '2017-07-23 22:44:00', '登录成功');
INSERT INTO `sys_log` VALUES ('704', 'jiajun', '127.0.0.1', '2017-07-23 22:44:08', '登录成功');
INSERT INTO `sys_log` VALUES ('705', 'admin', '127.0.0.1', '2017-07-23 22:46:49', '登录成功');
INSERT INTO `sys_log` VALUES ('706', 'admin', '127.0.0.1', '2017-07-23 22:47:23', '登录成功');
INSERT INTO `sys_log` VALUES ('707', 'admin', '127.0.0.1', '2017-07-23 22:48:54', '登录成功');
INSERT INTO `sys_log` VALUES ('708', 'admin', '127.0.0.1', '2017-07-23 22:49:07', '登录成功');
INSERT INTO `sys_log` VALUES ('709', 'admin', '127.0.0.1', '2017-07-23 22:49:17', '登录成功');
INSERT INTO `sys_log` VALUES ('710', 'admin', '127.0.0.1', '2017-07-23 22:50:18', '登录成功');
INSERT INTO `sys_log` VALUES ('711', 'admin', '127.0.0.1', '2017-07-23 22:51:06', '登录成功');
INSERT INTO `sys_log` VALUES ('712', 'admin', '127.0.0.1', '2017-07-23 22:51:55', '登录成功');
INSERT INTO `sys_log` VALUES ('713', 'admin', '127.0.0.1', '2017-07-23 22:58:01', '登录成功');
INSERT INTO `sys_log` VALUES ('714', 'admin', '127.0.0.1', '2017-07-23 23:00:11', '登录成功');
INSERT INTO `sys_log` VALUES ('715', 'admin', '127.0.0.1', '2017-07-23 23:00:29', '修改角色类型最大菜单权限');
INSERT INTO `sys_log` VALUES ('716', 'admin', '127.0.0.1', '2017-07-23 23:00:37', '添加角色:www');
INSERT INTO `sys_log` VALUES ('717', 'admin', '127.0.0.1', '2017-07-23 23:01:02', '添加角色类型:222');
INSERT INTO `sys_log` VALUES ('718', 'admin', '127.0.0.1', '2017-07-23 23:01:06', '删除角色组, 类型是3');
INSERT INTO `sys_log` VALUES ('719', 'admin', '127.0.0.1', '2017-07-23 23:01:41', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('720', 'admin', '127.0.0.1', '2017-07-23 23:01:53', '保存角色对应的菜单');
INSERT INTO `sys_log` VALUES ('721', 'admin', '127.0.0.1', '2017-07-23 23:02:51', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('722', 'admin', '127.0.0.1', '2017-07-23 23:02:52', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('723', 'admin', '127.0.0.1', '2017-07-23 23:04:14', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('724', 'admin', '127.0.0.1', '2017-07-23 23:04:19', '修改角色按钮权限');
INSERT INTO `sys_log` VALUES ('725', 'fly', '127.0.0.1', '2017-07-23 23:04:48', '登录成功');
INSERT INTO `sys_log` VALUES ('726', 'fly', '127.0.0.1', '2017-07-23 23:14:33', '登录成功');
INSERT INTO `sys_log` VALUES ('727', 'jiajun', '127.0.0.1', '2017-07-23 23:22:10', '登录成功');
INSERT INTO `sys_log` VALUES ('728', 'fly', '127.0.0.1', '2017-07-23 23:24:38', '登录成功');
INSERT INTO `sys_log` VALUES ('729', 'jiajun', '127.0.0.1', '2017-07-23 23:35:27', '登录成功');
INSERT INTO `sys_log` VALUES ('730', 'jiajun', '127.0.0.1', '2017-07-23 23:36:20', '登录成功');
INSERT INTO `sys_log` VALUES ('731', 'jiajun', '127.0.0.1', '2017-07-23 23:37:45', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('732', 'jiajun', '127.0.0.1', '2017-07-23 23:37:49', '保存角色对应的菜单权限');
INSERT INTO `sys_log` VALUES ('733', 'jiajun', '127.0.0.1', '2017-07-23 23:37:55', '登录成功');
INSERT INTO `sys_log` VALUES ('734', 'jiajun', '127.0.0.1', '2017-07-23 23:49:00', '登录成功');
INSERT INTO `sys_log` VALUES ('735', 'jiajun', '127.0.0.1', '2017-07-23 23:49:11', '修改null用户信息');
INSERT INTO `sys_log` VALUES ('736', 'jiajun', '127.0.0.1', '2017-07-23 23:49:24', '修改个人资料');
INSERT INTO `sys_log` VALUES ('737', 'jiajun', '127.0.0.1', '2017-07-23 23:49:24', '退出登录');
INSERT INTO `sys_log` VALUES ('738', 'jiajun', '127.0.0.1', '2017-07-23 23:49:54', '登录成功');
INSERT INTO `sys_log` VALUES ('739', 'jiajun', '127.0.0.1', '2017-07-23 23:59:57', '登录成功');
INSERT INTO `sys_log` VALUES ('740', 'fly', '127.0.0.1', '2017-07-24 00:01:41', '登录成功');
INSERT INTO `sys_log` VALUES ('741', 'jiajun', '127.0.0.1', '2017-07-24 00:11:49', '登录成功');
INSERT INTO `sys_log` VALUES ('742', 'jiajun', '127.0.0.1', '2017-07-24 00:13:04', '登录成功');
INSERT INTO `sys_log` VALUES ('743', 'jiajun', '127.0.0.1', '2017-07-24 00:13:55', '登录成功');
INSERT INTO `sys_log` VALUES ('744', 'jiajun', '127.0.0.1', '2017-07-24 00:14:38', '登录成功');
INSERT INTO `sys_log` VALUES ('745', 'jiajun', '127.0.0.1', '2017-07-24 00:15:30', '登录成功');
INSERT INTO `sys_log` VALUES ('746', 'jiajun', '127.0.0.1', '2017-07-24 00:16:55', '登录成功');
INSERT INTO `sys_log` VALUES ('747', 'jiajun', '127.0.0.1', '2017-07-24 00:21:39', '登录成功');
INSERT INTO `sys_log` VALUES ('748', 'jiajun', '127.0.0.1', '2017-07-24 00:22:03', '登录成功');
INSERT INTO `sys_log` VALUES ('749', 'jiajun', '127.0.0.1', '2017-07-24 00:22:30', '登录成功');
INSERT INTO `sys_log` VALUES ('750', 'jiajun', '127.0.0.1', '2017-07-24 00:22:49', '登录成功');
INSERT INTO `sys_log` VALUES ('751', 'fly', '127.0.0.1', '2017-07-24 00:23:21', '登录成功');
INSERT INTO `sys_log` VALUES ('752', 'fly', '127.0.0.1', '2017-07-24 00:23:39', '登录成功');
INSERT INTO `sys_log` VALUES ('753', 'admin', '127.0.0.1', '2017-07-24 00:26:34', '登录成功');
INSERT INTO `sys_log` VALUES ('754', 'admin', '127.0.0.1', '2017-07-24 00:26:58', '修改菜单信息');
INSERT INTO `sys_log` VALUES ('755', 'fly', '127.0.0.1', '2017-07-24 00:27:09', '登录成功');
INSERT INTO `sys_log` VALUES ('756', 'fly', '127.0.0.1', '2017-07-24 00:27:38', '登录成功');

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
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', '#', '10', 'menu-icon fa fa-desktop  brown', '1', null, null);
INSERT INTO `sys_menu` VALUES ('2', '用户管理', '0', '1', '#', '20', 'menu-icon fa fa-users  purple', '1', '2017-07-08 23:10:25', '2017-07-08 23:19:40');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '1', '#', '30', 'menu-icon fa fa-cog  black', '1', null, '2017-07-08 23:19:58');
INSERT INTO `sys_menu` VALUES ('4', '微信管理', '0', '1', '#', '40', 'menu-icon fa fa-comments  green', '1', null, '2017-07-08 23:20:17');
INSERT INTO `sys_menu` VALUES ('5', '权限管理', '1', '1', '#', '10', 'menu-icon fa fa-lock  orange', '1', null, '2017-07-08 23:19:14');
INSERT INTO `sys_menu` VALUES ('17', '菜单权限', '5', '0', 'role/list.do', '10', 'menu-icon fa fa-key  brown', '1', null, '2017-07-24 00:26:58');
INSERT INTO `sys_menu` VALUES ('18', '按钮权限', '5', '0', 'role/operation/list.do', '20', 'menu-icon fa fa-key  purple', '1', null, '2017-07-22 12:22:18');
INSERT INTO `sys_menu` VALUES ('19', '按钮管理', '1', '0', 'operation/list.do', '20', 'menu-icon fa fa-hdd-o  blue', '1', null, '2017-07-22 12:22:34');
INSERT INTO `sys_menu` VALUES ('20', '在线管理', '1', '0', 'user/onlineList.do', '40', 'menu-icon fa fa-users  green', '1', null, '2017-07-12 23:36:11');
INSERT INTO `sys_menu` VALUES ('21', '菜单管理', '1', '0', 'menu/listAllMenu.do', '30', 'menu-icon fa fa-folder-open-o  grey', '1', null, '2017-07-22 12:22:45');
INSERT INTO `sys_menu` VALUES ('22', '日志管理', '1', '0', 'log/list.do', '50', 'menu-icon fa fa-bolt  black', '1', '2017-07-08 22:23:45', '2017-07-23 22:18:16');
INSERT INTO `sys_menu` VALUES ('23', '系统用户', '2', '0', 'user/listUser.do', '10', 'menu-icon fa fa-users  green', '1', '2017-07-08 22:26:25', '2017-07-23 22:37:39');
INSERT INTO `sys_menu` VALUES ('24', '会员管理', '2', '0', 'vip/listVip.do', '20', 'menu-icon fa fa-users  pink', '1', '2017-07-08 22:27:33', '2017-07-12 23:39:13');
INSERT INTO `sys_menu` VALUES ('25', '代码生成器', '3', '0', 'codeGenerator.do', '10', 'menu-icon fa fa-cogs  purple', '1', '2017-07-08 22:31:48', '2017-07-12 23:40:56');
INSERT INTO `sys_menu` VALUES ('26', '表单构造器', '3', '0', '#', '20', 'menu-icon fa fa-barcode  green', '1', '2017-07-08 22:33:40', '2017-07-12 23:41:18');
INSERT INTO `sys_menu` VALUES ('27', '接口测试', '3', '0', '#', '30', 'menu-icon fa fa-fighter-jet  blue', '1', '2017-07-08 22:34:26', '2017-07-12 23:41:41');
INSERT INTO `sys_menu` VALUES ('28', '发送邮件', '3', '0', '#', '40', 'menu-icon fa fa-envelope-o  brown', '1', '2017-07-08 22:35:20', '2017-07-12 23:41:51');
INSERT INTO `sys_menu` VALUES ('29', '设置二维码', '3', '0', '#', '50', 'menu-icon fa fa-barcode  black', '1', '2017-07-08 22:35:34', '2017-07-12 23:42:15');
INSERT INTO `sys_menu` VALUES ('30', '图表报表', '3', '0', '#', '60', 'menu-icon fa fa-bar-chart-o  orange', '1', '2017-07-08 22:36:26', '2017-07-12 23:42:28');
INSERT INTO `sys_menu` VALUES ('31', '地图工具', '3', '0', '#', '70', 'menu-icon fa fa-globe  blue', '1', '2017-07-08 22:36:40', '2017-07-12 23:42:47');
INSERT INTO `sys_menu` VALUES ('32', '性能监测', '3', '0', '#', '80', 'menu-icon fa fa-tachometer  purple', '1', '2017-07-08 22:37:02', '2017-07-12 23:43:04');
INSERT INTO `sys_menu` VALUES ('33', '信息管理', '0', '1', '#', '50', 'menu-icon fa fa-comments-o  orange', '1', '2017-07-08 22:40:32', '2017-07-12 23:53:45');
INSERT INTO `sys_menu` VALUES ('34', '数据库管理', '0', '1', '#', '60', 'menu-icon fa fa-hdd-o  red', '1', '2017-07-08 22:41:05', '2017-07-08 23:20:58');
INSERT INTO `sys_menu` VALUES ('35', '关注回复', '4', '0', '#', '10', 'menu-icon fa fa-bell-o  grey', '1', '2017-07-08 22:48:07', '2017-07-12 23:45:54');
INSERT INTO `sys_menu` VALUES ('36', '文本回复', '4', '0', '#', '20', 'menu-icon fa fa-bell  blue', '1', '2017-07-08 22:48:21', '2017-07-12 23:47:36');
INSERT INTO `sys_menu` VALUES ('37', '图文回复', '4', '0', '#', '30', 'menu-icon fa fa-leaf  black', '1', '2017-07-08 22:48:36', '2017-07-08 22:49:54');
INSERT INTO `sys_menu` VALUES ('39', '图片管理', '33', '1', '#', '10', 'menu-icon fa fa-camera-retro  purple', '1', '2017-07-08 22:50:36', '2017-07-08 23:21:22');
INSERT INTO `sys_menu` VALUES ('40', '站内信', '33', '0', '#', '20', 'menu-icon fa fa-comments-o  pink', '1', '2017-07-08 22:55:50', '2017-07-08 22:56:32');
INSERT INTO `sys_menu` VALUES ('41', '图片列表', '39', '0', '#', '10', 'menu-icon fa fa-briefcase  grey', '1', '2017-07-08 22:56:53', '2017-07-12 23:48:58');
INSERT INTO `sys_menu` VALUES ('42', '图片爬虫', '39', '0', '#', '20', 'menu-icon fa fa-exchange  brown', '1', '2017-07-08 22:57:14', '2017-07-12 23:49:32');
INSERT INTO `sys_menu` VALUES ('43', '数据库备份', '34', '0', '#', '10', 'menu-icon fa fa-cloud-upload  brown', '1', '2017-07-08 23:01:10', '2017-07-12 23:56:09');
INSERT INTO `sys_menu` VALUES ('44', '备份定时器', '34', '0', '#', '20', 'menu-icon fa fa-calendar  blue', '1', '2017-07-08 23:01:34', '2017-07-12 23:56:59');
INSERT INTO `sys_menu` VALUES ('45', '数据库还原', '34', '0', '#', '30', 'menu-icon fa fa-cloud-download  black', '1', '2017-07-08 23:02:14', '2017-07-12 23:58:10');
INSERT INTO `sys_menu` VALUES ('56', 'sql编辑器', '34', '0', '#', '40', 'menu-icon fa fa-pencil-square-o  blue', '1', '2017-07-08 23:20:58', '2017-07-12 23:58:26');
INSERT INTO `sys_menu` VALUES ('84', '文件管理', '33', '0', '#', '30', 'menu-icon fa fa-folder-open-o  brown', '1', '2017-07-12 23:53:45', '2017-07-12 23:53:45');

-- ----------------------------
-- Table structure for sys_menu_premission
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_premission`;
CREATE TABLE `sys_menu_premission` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `menu_id` int(16) NOT NULL,
  `premission_type` smallint(2) DEFAULT NULL COMMENT '1:query 2:insert 3:update 4:delete 5:other',
  `premission_code` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_menu_premission
-- ----------------------------
INSERT INTO `sys_menu_premission` VALUES ('63', '17', '1', 'role:query');
INSERT INTO `sys_menu_premission` VALUES ('65', '17', '3', 'role:update');
INSERT INTO `sys_menu_premission` VALUES ('66', '17', '4', 'role:delete');
INSERT INTO `sys_menu_premission` VALUES ('72', '18', '5', 'premission:button');
INSERT INTO `sys_menu_premission` VALUES ('74', '19', '1', 'button:query');
INSERT INTO `sys_menu_premission` VALUES ('75', '19', '2', 'button:insert');
INSERT INTO `sys_menu_premission` VALUES ('76', '19', '3', 'button:update');
INSERT INTO `sys_menu_premission` VALUES ('77', '19', '4', 'button:delete');
INSERT INTO `sys_menu_premission` VALUES ('79', '21', '1', 'menu:query');
INSERT INTO `sys_menu_premission` VALUES ('80', '21', '2', 'menu:insert');
INSERT INTO `sys_menu_premission` VALUES ('81', '21', '3', 'menu:update');
INSERT INTO `sys_menu_premission` VALUES ('82', '21', '4', 'menu:delete');
INSERT INTO `sys_menu_premission` VALUES ('84', '20', '1', 'online:query');
INSERT INTO `sys_menu_premission` VALUES ('85', '20', '4', 'online:delete');
INSERT INTO `sys_menu_premission` VALUES ('86', '22', '1', 'log:query');
INSERT INTO `sys_menu_premission` VALUES ('87', '22', '2', 'log:insert');
INSERT INTO `sys_menu_premission` VALUES ('89', '22', '4', 'log:delete');
INSERT INTO `sys_menu_premission` VALUES ('90', '23', '1', 'sysUser:query');
INSERT INTO `sys_menu_premission` VALUES ('91', '23', '2', 'sysUser:insert');
INSERT INTO `sys_menu_premission` VALUES ('92', '23', '3', 'sysUser:update');
INSERT INTO `sys_menu_premission` VALUES ('93', '23', '4', 'sysUser:delete');
INSERT INTO `sys_menu_premission` VALUES ('94', '24', '1', 'vip:query');
INSERT INTO `sys_menu_premission` VALUES ('95', '24', '2', 'vip:insert');
INSERT INTO `sys_menu_premission` VALUES ('96', '24', '3', 'vip:update');
INSERT INTO `sys_menu_premission` VALUES ('97', '24', '4', 'vip:delete');
INSERT INTO `sys_menu_premission` VALUES ('98', '25', '5', 'tool:codeGenerator');
INSERT INTO `sys_menu_premission` VALUES ('99', '26', '5', 'tool:formCreate');
INSERT INTO `sys_menu_premission` VALUES ('100', '27', '5', 'tool:APITest');
INSERT INTO `sys_menu_premission` VALUES ('101', '28', '5', 'tool:sendEmail');
INSERT INTO `sys_menu_premission` VALUES ('102', '29', '5', 'tool:QR-code');
INSERT INTO `sys_menu_premission` VALUES ('103', '30', '5', 'tool:chart');
INSERT INTO `sys_menu_premission` VALUES ('104', '31', '5', 'tool:gis');
INSERT INTO `sys_menu_premission` VALUES ('105', '32', '5', 'tool:dataBaseMonitor');
INSERT INTO `sys_menu_premission` VALUES ('106', '35', '5', 'weChart:reply');
INSERT INTO `sys_menu_premission` VALUES ('107', '35', '1', 'weChart:query');
INSERT INTO `sys_menu_premission` VALUES ('108', '36', '1', 'weiChart:planTextQuery');
INSERT INTO `sys_menu_premission` VALUES ('109', '36', '2', 'weiChart:planTextInsert');
INSERT INTO `sys_menu_premission` VALUES ('110', '36', '4', 'weiChart:planTextDelete');
INSERT INTO `sys_menu_premission` VALUES ('111', '41', '1', 'picture:query');
INSERT INTO `sys_menu_premission` VALUES ('112', '41', '2', 'picture:insert');
INSERT INTO `sys_menu_premission` VALUES ('113', '41', '3', 'picture:update');
INSERT INTO `sys_menu_premission` VALUES ('114', '41', '4', 'picture:delete');
INSERT INTO `sys_menu_premission` VALUES ('115', '42', '5', 'tool:pachong');
INSERT INTO `sys_menu_premission` VALUES ('116', '84', '1', 'folder:query');
INSERT INTO `sys_menu_premission` VALUES ('117', '84', '2', 'folder:insert');
INSERT INTO `sys_menu_premission` VALUES ('118', '84', '4', 'folder:delete');
INSERT INTO `sys_menu_premission` VALUES ('119', '43', '5', 'tool:dbdump');
INSERT INTO `sys_menu_premission` VALUES ('120', '44', '1', 'dbtimer:query');
INSERT INTO `sys_menu_premission` VALUES ('121', '44', '2', 'dbtimer:insert');
INSERT INTO `sys_menu_premission` VALUES ('122', '44', '4', 'dbtimer:delete');
INSERT INTO `sys_menu_premission` VALUES ('123', '44', '5', 'dbtimer:reset');
INSERT INTO `sys_menu_premission` VALUES ('124', '45', '1', 'db:query');
INSERT INTO `sys_menu_premission` VALUES ('125', '45', '2', 'db:insert');
INSERT INTO `sys_menu_premission` VALUES ('126', '45', '3', 'db:update');
INSERT INTO `sys_menu_premission` VALUES ('127', '45', '4', 'db:delete');
INSERT INTO `sys_menu_premission` VALUES ('128', '56', '5', 'tool:sqlEdit');
INSERT INTO `sys_menu_premission` VALUES ('129', '17', '2', 'role:insert');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_opeartion
-- ----------------------------
INSERT INTO `sys_opeartion` VALUES ('11', '导出EXCEL', 'opera:outExcel', '到处excel需要具备权限');
INSERT INTO `sys_opeartion` VALUES ('12', '导入Excel', 'opera:inExcel', '数据导入需要具备权限');
INSERT INTO `sys_opeartion` VALUES ('13', '发邮件', 'opera:sendMail', '发送邮件需要具备权限');
INSERT INTO `sys_opeartion` VALUES ('14', '发短信', 'opera:sendSMS', '发送短信需要具备权限');
INSERT INTO `sys_opeartion` VALUES ('15', '站内信', 'opera:innerMsg', '站内通信需要具备权限');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'admin', '0', '0', '0', null, null);
INSERT INTO `sys_role` VALUES ('2', '系统用户组', '0', '10', '1', '1,5,17,18,19,21,20,22,2,23,24,3,25,26,27,28,29,30,31,32,4,35,36,37,33,39,41,42,40,84,34,43,44,45,56', null);
INSERT INTO `sys_role` VALUES ('3', '一级管理员', '2', '10', '1', '1,5,17,18,19,21,20,22,2,23,24,3,25,26,27,28,29,30,31,32,4,35,36,37,33,39,41,42,40,84,34,43,44,45,56', '12,15,13,14,11');
INSERT INTO `sys_role` VALUES ('5', '二级管理员', '2', '20', '1', '1,5,17,18,19,21,20,22,2,23,24,3,25,26,27,28,29,30,31,32,4,35,36,37', '12,11,13,15');
INSERT INTO `sys_role` VALUES ('6', '会员组', '0', '20', '2', '1,5,17,18,19,21,20,22,2,23,24', null);
INSERT INTO `sys_role` VALUES ('7', '超级会员', '6', '10', '2', '', '11,13,15,12');
INSERT INTO `sys_role` VALUES ('8', '普通会员', '6', '20', '2', '', '11,12,13,15');
INSERT INTO `sys_role` VALUES ('9', '注册用户', '6', '30', '2', '', '11,14');
INSERT INTO `sys_role` VALUES ('10', '三级管理员', '2', '30', '1', '', '12,11,15,13,14');
INSERT INTO `sys_role` VALUES ('11', 'www', '6', '34', '2', null, null);

-- ----------------------------
-- Table structure for sys_role_prem
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_prem`;
CREATE TABLE `sys_role_prem` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `role_id` int(16) NOT NULL,
  `prem_id` int(16) NOT NULL,
  `menu_type` smallint(1) DEFAULT NULL COMMENT 'prem_type是1的时候, menu_type才有效,  1 2 3 4 冗余字段',
  `prem_type` smallint(1) NOT NULL COMMENT '权限类型, 1是菜单权限, 2是按钮权限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=316 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_prem
-- ----------------------------
INSERT INTO `sys_role_prem` VALUES ('228', '3', '85', '4', '1');
INSERT INTO `sys_role_prem` VALUES ('229', '3', '89', '4', '1');
INSERT INTO `sys_role_prem` VALUES ('232', '3', '110', '4', '1');
INSERT INTO `sys_role_prem` VALUES ('233', '3', '114', '4', '1');
INSERT INTO `sys_role_prem` VALUES ('234', '3', '118', '4', '1');
INSERT INTO `sys_role_prem` VALUES ('235', '3', '122', '4', '1');
INSERT INTO `sys_role_prem` VALUES ('236', '3', '127', '4', '1');
INSERT INTO `sys_role_prem` VALUES ('251', '3', '63', '1', '1');
INSERT INTO `sys_role_prem` VALUES ('252', '3', '74', '1', '1');
INSERT INTO `sys_role_prem` VALUES ('253', '3', '79', '1', '1');
INSERT INTO `sys_role_prem` VALUES ('254', '3', '84', '1', '1');
INSERT INTO `sys_role_prem` VALUES ('255', '3', '86', '1', '1');
INSERT INTO `sys_role_prem` VALUES ('256', '3', '90', '1', '1');
INSERT INTO `sys_role_prem` VALUES ('257', '3', '94', '1', '1');
INSERT INTO `sys_role_prem` VALUES ('258', '3', '107', '1', '1');
INSERT INTO `sys_role_prem` VALUES ('259', '3', '108', '1', '1');
INSERT INTO `sys_role_prem` VALUES ('260', '3', '111', '1', '1');
INSERT INTO `sys_role_prem` VALUES ('261', '3', '116', '1', '1');
INSERT INTO `sys_role_prem` VALUES ('262', '3', '120', '1', '1');
INSERT INTO `sys_role_prem` VALUES ('263', '3', '124', '1', '1');
INSERT INTO `sys_role_prem` VALUES ('264', '3', '64', '2', '1');
INSERT INTO `sys_role_prem` VALUES ('265', '3', '75', '2', '1');
INSERT INTO `sys_role_prem` VALUES ('266', '3', '80', '2', '1');
INSERT INTO `sys_role_prem` VALUES ('267', '3', '87', '2', '1');
INSERT INTO `sys_role_prem` VALUES ('268', '3', '91', '2', '1');
INSERT INTO `sys_role_prem` VALUES ('269', '3', '95', '2', '1');
INSERT INTO `sys_role_prem` VALUES ('270', '3', '109', '2', '1');
INSERT INTO `sys_role_prem` VALUES ('271', '3', '112', '2', '1');
INSERT INTO `sys_role_prem` VALUES ('272', '3', '117', '2', '1');
INSERT INTO `sys_role_prem` VALUES ('273', '3', '121', '2', '1');
INSERT INTO `sys_role_prem` VALUES ('274', '3', '125', '2', '1');
INSERT INTO `sys_role_prem` VALUES ('283', '3', '72', '5', '1');
INSERT INTO `sys_role_prem` VALUES ('284', '3', '98', '5', '1');
INSERT INTO `sys_role_prem` VALUES ('285', '3', '99', '5', '1');
INSERT INTO `sys_role_prem` VALUES ('286', '3', '100', '5', '1');
INSERT INTO `sys_role_prem` VALUES ('287', '3', '101', '5', '1');
INSERT INTO `sys_role_prem` VALUES ('288', '3', '102', '5', '1');
INSERT INTO `sys_role_prem` VALUES ('289', '3', '103', '5', '1');
INSERT INTO `sys_role_prem` VALUES ('290', '3', '104', '5', '1');
INSERT INTO `sys_role_prem` VALUES ('291', '3', '105', '5', '1');
INSERT INTO `sys_role_prem` VALUES ('292', '3', '106', '5', '1');
INSERT INTO `sys_role_prem` VALUES ('293', '3', '115', '5', '1');
INSERT INTO `sys_role_prem` VALUES ('294', '3', '119', '5', '1');
INSERT INTO `sys_role_prem` VALUES ('295', '3', '123', '5', '1');
INSERT INTO `sys_role_prem` VALUES ('296', '3', '128', '5', '1');
INSERT INTO `sys_role_prem` VALUES ('297', '5', '63', '1', '1');
INSERT INTO `sys_role_prem` VALUES ('298', '5', '74', '1', '1');
INSERT INTO `sys_role_prem` VALUES ('299', '5', '79', '1', '1');
INSERT INTO `sys_role_prem` VALUES ('300', '5', '84', '1', '1');
INSERT INTO `sys_role_prem` VALUES ('301', '5', '86', '1', '1');
INSERT INTO `sys_role_prem` VALUES ('302', '5', '90', '1', '1');
INSERT INTO `sys_role_prem` VALUES ('303', '5', '94', '1', '1');
INSERT INTO `sys_role_prem` VALUES ('310', '3', '76', '3', '1');
INSERT INTO `sys_role_prem` VALUES ('311', '3', '81', '3', '1');
INSERT INTO `sys_role_prem` VALUES ('312', '3', '92', '3', '1');
INSERT INTO `sys_role_prem` VALUES ('313', '3', '96', '3', '1');
INSERT INTO `sys_role_prem` VALUES ('314', '3', '113', '3', '1');
INSERT INTO `sys_role_prem` VALUES ('315', '3', '126', '3', '1');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL COMMENT '登录名,唯一',
  `password` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL COMMENT '实际名称, 可以重复',
  `login_time` datetime DEFAULT NULL COMMENT '上次登录时间',
  `last_ip` varchar(32) DEFAULT NULL COMMENT '上次登录ip',
  `skin` varchar(10) DEFAULT NULL COMMENT '皮肤',
  `sort` int(16) NOT NULL COMMENT '排序',
  `role_id` int(16) DEFAULT NULL,
  `phone` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL,
  `status` smallint(1) NOT NULL COMMENT '状态0表示不在线, 1表示在线',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '4b648eafa57386cfe1f386d943f6a6c5', '系统管理员_admin', '2017-07-24 00:26:34', '127.0.0.1', null, '1', '1', '13888888888', '1234@qq.com', '1', '最高权限用户', null, null);
INSERT INTO `sys_user` VALUES ('2', 'jiajun', '4b648eafa57386cfe1f386d943f6a6c5', '佳俊', '2017-07-24 00:22:49', '127.0.0.1', null, '2', '3', '12333333333', '123@qq.com', '1', '测试用户', null, null);
INSERT INTO `sys_user` VALUES ('4', 'fly', '4b648eafa57386cfe1f386d943f6a6c5', '时间', '2017-07-24 00:27:38', '127.0.0.1', null, '3', '5', '12345678910', '12345@qq.com', '1', '外卖怎么还没到', '2017-07-22 18:12:23', null);

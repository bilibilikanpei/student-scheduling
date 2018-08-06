/*
 Navicat MySQL Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : c4_school_oa

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 07/08/2018 00:42:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_access
-- ----------------------------
DROP TABLE IF EXISTS `admin_access`;
CREATE TABLE `admin_access`  (
  `access_id` int(11) NOT NULL AUTO_INCREMENT,
  `access_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `node_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '节点类型 0 为分类节点（分支） 1为权限节点（叶子）',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型为0时代表分类，URL代表前端路由地址\r\n类型为1时代表权限节点,URL代表对应功能的服务端接口地址',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `creator_id` int(11) NULL DEFAULT NULL,
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`access_id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE,
  CONSTRAINT `parent_id` FOREIGN KEY (`parent_id`) REFERENCES `admin_access` (`access_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_access
-- ----------------------------
INSERT INTO `admin_access` VALUES (15, '用户管理', 0, '/system/users', '', NULL, NULL, '2018-01-14 19:22:02');
INSERT INTO `admin_access` VALUES (16, '角色管理', 0, '/system/roles', NULL, NULL, NULL, '2018-01-14 19:21:54');
INSERT INTO `admin_access` VALUES (17, '修改管理员', 0, '/system/user/update', NULL, NULL, NULL, '2018-01-14 19:21:48');
INSERT INTO `admin_access` VALUES (20, '添加管理员', 1, '/admin/user/create', '', 15, NULL, '2018-01-14 03:58:36');
INSERT INTO `admin_access` VALUES (21, '修改管理员', 1, '/admin/user/update', NULL, 15, NULL, '2018-01-13 16:32:35');
INSERT INTO `admin_access` VALUES (22, '删除管理员', 1, '/admin/user/remove', NULL, 15, NULL, '2018-01-09 17:44:42');
INSERT INTO `admin_access` VALUES (23, '查询管理员列表', 1, '/admin/user/list', '', 15, NULL, '2018-01-10 12:46:28');
INSERT INTO `admin_access` VALUES (24, '添加角色', 1, '/admin/role/create', '1111', 16, NULL, '2018-01-09 20:31:22');
INSERT INTO `admin_access` VALUES (25, '修改角色', 1, '/admin/role/update', '11111', 16, NULL, '2018-01-09 20:31:27');
INSERT INTO `admin_access` VALUES (26, '删除角色', 1, '/admin/role/remove', NULL, 16, NULL, '2018-01-09 19:18:17');
INSERT INTO `admin_access` VALUES (27, '查询角色列表', 1, '/admin/role/list', NULL, 16, NULL, '2018-01-09 19:18:29');
INSERT INTO `admin_access` VALUES (28, '添加权限节点', 1, '/admin/access/create', NULL, 17, NULL, '2018-01-09 19:21:30');
INSERT INTO `admin_access` VALUES (29, '修改权限节点', 1, '/admin/access/update', NULL, 17, NULL, '2018-01-09 19:21:46');
INSERT INTO `admin_access` VALUES (30, '删除权限节点', 1, '/admin/access/remove', NULL, 17, NULL, '2018-01-09 19:22:09');
INSERT INTO `admin_access` VALUES (32, '获取权限列表', 1, '/admin/access/list', NULL, 17, NULL, '2018-01-12 16:00:58');
INSERT INTO `admin_access` VALUES (33, '教师管理', 0, '/system/teacher', NULL, NULL, NULL, '2018-01-14 19:21:44');
INSERT INTO `admin_access` VALUES (34, '教师列表', 1, '/admin/teacher/list', NULL, 33, NULL, '2018-01-14 19:16:08');
INSERT INTO `admin_access` VALUES (35, '添加教师', 1, '/admin/teacher/create', NULL, 33, NULL, '2018-01-14 19:16:21');
INSERT INTO `admin_access` VALUES (36, '删除教师', 1, '/admin/teacher/remove', NULL, 33, NULL, '2018-01-14 19:16:42');
INSERT INTO `admin_access` VALUES (37, '课程管理', 0, '/lesson', NULL, NULL, NULL, '2018-01-14 19:21:08');
INSERT INTO `admin_access` VALUES (38, '添加课程', 1, '/admin/lesson/create', NULL, 37, NULL, '2018-01-16 12:59:05');
INSERT INTO `admin_access` VALUES (39, '加载列表', 1, '/admin/lesson/list', NULL, 37, NULL, '2018-01-16 12:59:08');
INSERT INTO `admin_access` VALUES (40, '编辑课程', 1, '/admin/lesson/update', NULL, 37, NULL, '2018-01-16 12:59:12');
INSERT INTO `admin_access` VALUES (41, '删除课程', 1, '/admin/lesson/remove', NULL, 37, NULL, '2018-01-16 12:59:22');
INSERT INTO `admin_access` VALUES (42, '专业管理', 0, '/option/major', NULL, NULL, NULL, '2018-01-16 12:15:19');
INSERT INTO `admin_access` VALUES (43, '添加专业', 1, '/admin/major/create', NULL, 42, NULL, '2018-01-16 12:59:27');
INSERT INTO `admin_access` VALUES (44, '修改专业', 1, '/admin/major/update', NULL, 42, NULL, '2018-01-16 12:59:30');
INSERT INTO `admin_access` VALUES (45, '删除专业', 1, '/admin/major/remove', NULL, 42, NULL, '2018-01-16 12:59:33');
INSERT INTO `admin_access` VALUES (46, '加载列表', 1, '/admin/major/list', NULL, 42, NULL, '2018-01-16 12:59:38');
INSERT INTO `admin_access` VALUES (47, '教室管理', 0, '/option/room/', NULL, NULL, NULL, '2018-01-17 15:46:29');
INSERT INTO `admin_access` VALUES (48, '教室列表', 1, '/admin/room/list', NULL, 47, NULL, '2018-01-17 15:46:51');
INSERT INTO `admin_access` VALUES (49, '添加教室', 1, '/admin/room/create', NULL, 47, NULL, '2018-01-17 15:48:06');
INSERT INTO `admin_access` VALUES (50, '删除教室', 1, '/admin/room/remove', NULL, 47, NULL, '2018-01-17 15:48:20');
INSERT INTO `admin_access` VALUES (51, '编辑教室', 1, '/admin/room/update', NULL, 47, NULL, '2018-01-17 15:48:35');
INSERT INTO `admin_access` VALUES (52, '班级管理', 0, '/option/class/', NULL, NULL, NULL, '2018-01-17 15:49:07');
INSERT INTO `admin_access` VALUES (53, '创建班级', 1, '/option/class/create', NULL, 52, NULL, '2018-01-17 15:49:29');
INSERT INTO `admin_access` VALUES (54, '编辑班级', 1, '/option/class/update', NULL, 52, NULL, '2018-01-17 15:49:50');
INSERT INTO `admin_access` VALUES (55, '删除班级', 1, '/option/class/remove', NULL, 52, NULL, '2018-01-17 15:49:59');
INSERT INTO `admin_access` VALUES (56, '班级列表', 1, '/option/class/list', NULL, 52, NULL, '2018-01-17 15:50:10');
INSERT INTO `admin_access` VALUES (57, '课程表', 0, NULL, NULL, NULL, NULL, '2018-01-20 00:57:18');
INSERT INTO `admin_access` VALUES (58, '加课', 1, '/admin/schedule/create', NULL, 57, NULL, '2018-01-20 00:57:53');
INSERT INTO `admin_access` VALUES (59, '当日课表', 1, '/admin/schedule/list_class_day', NULL, 57, NULL, '2018-01-20 00:58:17');
INSERT INTO `admin_access` VALUES (60, '当月课表', 1, '/admin/schedule/list_class_month', NULL, 57, NULL, '2018-01-20 00:58:34');
INSERT INTO `admin_access` VALUES (61, '删课', 1, '/admin/schedule/remove', NULL, 57, NULL, '2018-01-20 00:58:53');

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `access_list` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creator_id` int(11) NULL DEFAULT NULL,
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES (1, '超级管理员', '20,21,22,23,24,25,26,27,28,29,30,32,34,35,36,38,39,40,41,43,44,45,46,48,49,50,51,53,54,55,56,58,59,60,61', '工程/测试', 1, '2018-01-23 14:52:59');
INSERT INTO `admin_role` VALUES (2, '测试管理员', '20,21,22,23,24,25,26,27,28,29,30,32,34,35,36,38,39,40,41,43,44,45,46,48,49,50,51,53,54,55,56,58,59,60,61', '则试', 1, '2018-08-01 12:53:17');
INSERT INTO `admin_role` VALUES (22, '授课讲师', '38,39,40,41,43,44,45,46,48,49,50,51,53,54,55,56,58,59,60,61', NULL, NULL, '2018-01-23 14:53:15');

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `icon` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `last_login` timestamp(0) NULL DEFAULT NULL,
  `last_ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `creator_id` int(11) NULL DEFAULT NULL,
  `created_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `is_administrator` tinyint(1) NULL DEFAULT 0,
  `portrait_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '用户头像照片',
  `sex` tinyint(1) NULL DEFAULT NULL,
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `locked` tinyint(1) NULL DEFAULT 0,
  `token` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '登陆token',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `access_list` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '额外的权限设置可以在用户表中添加',
  PRIMARY KEY (`user_id`, `login_id`) USING BTREE,
  INDEX `user`(`user_id`) USING BTREE,
  INDEX `user_id`(`login_id`) USING BTREE,
  INDEX `user_role`(`role_id`) USING BTREE,
  CONSTRAINT `user_role` FOREIGN KEY (`role_id`) REFERENCES `admin_role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES (2, 'xd', '7f30eefe5c51e1ae0939dab2051db75f', '测试管理员', NULL, '2018-01-16 12:09:13', NULL, '测试管理员', 1, '2018-08-01 10:55:22', 0, NULL, NULL, NULL, 0, '', 2, NULL);
INSERT INTO `admin_user` VALUES (42, 'admin', '21232f297a57a5a743894a0e4a801fc3', '超级管理员', NULL, '2018-01-24 17:30:50', NULL, '超级管理员拥有最高权限', NULL, '2018-08-01 10:55:10', 1, NULL, NULL, NULL, 0, 'ed6980fa-7be0-c503-c710-4b9caab4716f', 1, NULL);
INSERT INTO `admin_user` VALUES (43, 'master', 'eb0a191797624dd3a48fa681d3061212', '普通管理员', NULL, NULL, NULL, '普通管理员根据权限树拥有权限', NULL, '2018-08-01 12:56:02', 0, NULL, NULL, NULL, 0, '登陆token', 22, NULL);

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `major_id` int(11) NULL DEFAULT NULL COMMENT '专业',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `class_teacher_id` int(11) NULL DEFAULT NULL,
  `closed` tinyint(1) NULL DEFAULT 0 COMMENT '是否关闭，关闭的班级相当于结课 ',
  PRIMARY KEY (`class_id`, `class_name`) USING BTREE,
  INDEX `professional_id`(`major_id`) USING BTREE,
  INDEX `class_ibfk_1`(`class_teacher_id`) USING BTREE,
  CONSTRAINT `class_ibfk_1` FOREIGN KEY (`class_teacher_id`) REFERENCES `teachers` (`teacher_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `class_ibfk_2` FOREIGN KEY (`major_id`) REFERENCES `major` (`major_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES (4, '2018 一班', 1, NULL, NULL, 0);
INSERT INTO `class` VALUES (6, '2018 二', 8, NULL, NULL, 0);

-- ----------------------------
-- Table structure for class_lesson
-- ----------------------------
DROP TABLE IF EXISTS `class_lesson`;
CREATE TABLE `class_lesson`  (
  `_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `order` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`_id`) USING BTREE,
  INDEX `class_id`(`class_id`) USING BTREE,
  INDEX `lesson_id`(`lesson_id`) USING BTREE,
  INDEX `teacher_id`(`teacher_id`) USING BTREE,
  CONSTRAINT `class_lesson_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `class_lesson_ibfk_2` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`lesson_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `class_lesson_ibfk_3` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for class_room
-- ----------------------------
DROP TABLE IF EXISTS `class_room`;
CREATE TABLE `class_room`  (
  `room_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '教室ID',
  `room_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `size` smallint(6) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `position` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`room_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class_room
-- ----------------------------
INSERT INTO `class_room` VALUES (4, '101', 50, NULL, NULL);
INSERT INTO `class_room` VALUES (5, '102', 60, NULL, NULL);
INSERT INTO `class_room` VALUES (6, '103', 15, NULL, NULL);
INSERT INTO `class_room` VALUES (7, '123', 27, NULL, NULL);

-- ----------------------------
-- Table structure for clocking
-- ----------------------------
DROP TABLE IF EXISTS `clocking`;
CREATE TABLE `clocking`  (
  `_id` int(11) NOT NULL,
  `student_id` int(11) NULL DEFAULT NULL,
  `in_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `out_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `lesson_schedule_id` int(11) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`_id`) USING BTREE,
  INDEX `lesson_schedule_id`(`lesson_schedule_id`) USING BTREE,
  INDEX `student_id`(`student_id`) USING BTREE,
  CONSTRAINT `clocking_ibfk_1` FOREIGN KEY (`lesson_schedule_id`) REFERENCES `lesson_schedule` (`schedule_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `clocking_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lesson
-- ----------------------------
DROP TABLE IF EXISTS `lesson`;
CREATE TABLE `lesson`  (
  `lesson_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程ID',
  `lesson_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名称',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `length` smallint(6) NULL DEFAULT 0 COMMENT '课程时长（总课时）',
  `level` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`lesson_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lesson
-- ----------------------------
INSERT INTO `lesson` VALUES (14, 'CSS基础', NULL, 30, 1);
INSERT INTO `lesson` VALUES (15, 'javascript(ES5)', NULL, 60, 1);
INSERT INTO `lesson` VALUES (16, '练习课 基础网页制做', NULL, 15, 1);
INSERT INTO `lesson` VALUES (17, 'jQuery的使用', NULL, 9, 2);
INSERT INTO `lesson` VALUES (19, 'bootstrap3.0的使用', NULL, 9, 2);
INSERT INTO `lesson` VALUES (22, '高级课程例子', NULL, 60, 3);
INSERT INTO `lesson` VALUES (23, 'HTML基础', NULL, 15, 1);

-- ----------------------------
-- Table structure for lesson_schedule
-- ----------------------------
DROP TABLE IF EXISTS `lesson_schedule`;
CREATE TABLE `lesson_schedule`  (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程表ID',
  `begin_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '上课时间',
  `end_time` timestamp(0) NULL DEFAULT NULL COMMENT '课程时长',
  `room_id` int(11) NULL DEFAULT NULL COMMENT '教室ID',
  `class_id` int(11) NULL DEFAULT NULL COMMENT '班级ID',
  `lesson_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`schedule_id`) USING BTREE,
  INDEX `train_id`(`lesson_id`) USING BTREE,
  INDEX `room_id`(`room_id`) USING BTREE,
  INDEX `class_id`(`class_id`) USING BTREE,
  CONSTRAINT `lesson_schedule_ibfk_1` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`lesson_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `lesson_schedule_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `class_room` (`room_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `lesson_schedule_ibfk_3` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lesson_schedule
-- ----------------------------
INSERT INTO `lesson_schedule` VALUES (1, '2018-01-04 17:02:00', '2018-01-04 19:02:00', 4, 6, NULL);
INSERT INTO `lesson_schedule` VALUES (2, '2018-01-04 15:00:00', '2018-01-04 18:00:00', 4, 4, NULL);
INSERT INTO `lesson_schedule` VALUES (3, '2018-01-05 16:22:00', '2018-01-05 19:22:00', 5, 6, NULL);
INSERT INTO `lesson_schedule` VALUES (5, '2018-01-06 16:26:00', '2018-01-06 19:26:00', 4, 6, NULL);
INSERT INTO `lesson_schedule` VALUES (6, '2018-01-07 16:00:00', '2018-01-07 20:15:00', 4, 6, NULL);
INSERT INTO `lesson_schedule` VALUES (7, '2018-01-03 16:00:00', '2018-01-03 19:00:00', 4, 6, NULL);
INSERT INTO `lesson_schedule` VALUES (9, '2018-01-03 18:00:00', '2018-01-03 20:00:00', 5, 4, NULL);
INSERT INTO `lesson_schedule` VALUES (10, '2018-01-03 09:00:00', '2018-01-03 13:00:00', 4, 6, NULL);
INSERT INTO `lesson_schedule` VALUES (11, '2018-01-05 19:07:00', '2018-01-05 22:07:00', 4, 4, NULL);
INSERT INTO `lesson_schedule` VALUES (15, '2018-01-23 09:00:00', '2018-01-23 10:30:00', 5, 4, NULL);
INSERT INTO `lesson_schedule` VALUES (16, '2018-01-23 11:00:00', '2018-01-23 12:00:00', 5, 4, NULL);
INSERT INTO `lesson_schedule` VALUES (17, '2018-01-24 09:00:00', '2018-01-24 10:00:00', 6, 4, NULL);
INSERT INTO `lesson_schedule` VALUES (18, '2018-07-16 13:10:00', '2018-07-16 16:15:00', 5, 6, NULL);
INSERT INTO `lesson_schedule` VALUES (19, '2018-07-16 21:10:00', '2018-07-16 22:15:00', 5, 6, NULL);

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major`  (
  `major_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '培训方向ID',
  `major_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '培训专业方向名称',
  `lesson_list` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '专业课关联字段 ',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`major_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES (1, '前端工程师', '8,14,15,16,17,19,22', NULL);
INSERT INTO `major` VALUES (8, '全栈工程师', '14,8,17,15,16,22,19', NULL);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_card_number` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `home_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `class_id` int(11) NULL DEFAULT NULL,
  `token` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`student_id`) USING BTREE,
  INDEX `class_id`(`class_id`) USING BTREE,
  CONSTRAINT `student_ibfk_3` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (6, '1234', '1234', '12341234123', NULL, NULL, 4, NULL);
INSERT INTO `student` VALUES (7, 'aaaa2222', 'aaaa', '12341234123', NULL, NULL, 6, NULL);
INSERT INTO `student` VALUES (8, '2345', '23452345', '12341234123', NULL, NULL, 6, NULL);
INSERT INTO `student` VALUES (9, '1234', '1234', '12341234123', NULL, NULL, 6, NULL);
INSERT INTO `student` VALUES (10, '1234', '1234', '12341234123', NULL, NULL, 4, NULL);
INSERT INTO `student` VALUES (12, '1234', '1234', '12341234123', NULL, NULL, 6, NULL);
INSERT INTO `student` VALUES (13, '123411111', '1234', '12341234123', NULL, NULL, 6, NULL);
INSERT INTO `student` VALUES (15, '测试学生222', '1234566', '13512341234', NULL, 'test', 4, NULL);
INSERT INTO `student` VALUES (16, '辣椒粉按附件两款', '101515151', '12323222222', NULL, NULL, 6, NULL);
INSERT INTO `student` VALUES (17, 'ddd d d ', '51645654', '12323222222', NULL, NULL, 6, NULL);
INSERT INTO `student` VALUES (18, '65445', '1818', '18518', NULL, NULL, 4, NULL);
INSERT INTO `student` VALUES (19, '888999', '5415', '11', NULL, NULL, 4, NULL);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `class_id` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`teacher_id`) USING BTREE,
  INDEX `teacher`(`user_id`) USING BTREE,
  CONSTRAINT `teacher` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (9, '陈冠希', '123456789', NULL, 2, NULL);
INSERT INTO `teacher` VALUES (10, '芙蓉姐姐', '8465123', NULL, 42, NULL);

SET FOREIGN_KEY_CHECKS = 1;

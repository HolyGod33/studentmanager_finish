/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : studentmanager

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 25/04/2020 14:03:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for paper_analyse
-- ----------------------------
DROP TABLE IF EXISTS `paper_analyse`;
CREATE TABLE `paper_analyse`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `average` double NOT NULL,
  `course_id` int(11) NULL DEFAULT NULL,
  `difficulty` double NOT NULL,
  `discrimination` double NOT NULL,
  `reliability` double NOT NULL,
  `standard_deviation` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of paper_analyse
-- ----------------------------
INSERT INTO `paper_analyse` VALUES (1, 74.4, 2, 0.7440000000000001, 0.5, 0.5620083579154374, 18.03995565404749);

-- ----------------------------
-- Table structure for s_admin
-- ----------------------------
DROP TABLE IF EXISTS `s_admin`;
CREATE TABLE `s_admin`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_admin
-- ----------------------------
INSERT INTO `s_admin` VALUES (1, 'admin', '123456', 1, '1300');

-- ----------------------------
-- Table structure for s_clazz
-- ----------------------------
DROP TABLE IF EXISTS `s_clazz`;
CREATE TABLE `s_clazz`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `info` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_clazz
-- ----------------------------
INSERT INTO `s_clazz` VALUES (1, '软件一班', '软件工程专业。');
INSERT INTO `s_clazz` VALUES (4, '数学一班', '大学数学专业');
INSERT INTO `s_clazz` VALUES (5, '计算机科学与技术一班', '计算机专业');

-- ----------------------------
-- Table structure for s_course
-- ----------------------------
DROP TABLE IF EXISTS `s_course`;
CREATE TABLE `s_course`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher_id` int(5) NOT NULL,
  `course_date` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `course_credit` int(5) NOT NULL DEFAULT 0,
  `info` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `course_teacher_foreign`(`teacher_id`) USING BTREE,
  CONSTRAINT `course_teacher_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `s_teacher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_course
-- ----------------------------
INSERT INTO `s_course` VALUES (1, '大学英语', 9, '周三上午8点', 3, '英语。');
INSERT INTO `s_course` VALUES (2, '大学数学', 10, '周三上午10点', 3, '数学。');
INSERT INTO `s_course` VALUES (3, '计算机基础', 11, '周三上午', 2, '计算机课程。');

-- ----------------------------
-- Table structure for s_score
-- ----------------------------
DROP TABLE IF EXISTS `s_score`;
CREATE TABLE `s_score`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `student_id` int(5) NOT NULL,
  `course_id` int(5) NOT NULL,
  `score` double(5, 2) NOT NULL,
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `selected_course_student_fk`(`student_id`) USING BTREE,
  INDEX `selected_course_course_fk`(`course_id`) USING BTREE,
  CONSTRAINT `s_score_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `s_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `s_score_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `s_student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_score
-- ----------------------------
INSERT INTO `s_score` VALUES (67, 4, 2, 78.00, '中等', '13', '13', '13', '13', '13', '13');
INSERT INTO `s_score` VALUES (68, 9, 2, 48.00, '不及格', '8', '8', '8', '8', '8', '8');
INSERT INTO `s_score` VALUES (69, 2, 2, 96.00, NULL, '16', '16', '16', '16', '16', '16');
INSERT INTO `s_score` VALUES (70, 1, 2, 90.00, NULL, '15', '30', '0', '15', '20', '10');
INSERT INTO `s_score` VALUES (71, 6, 2, 60.00, NULL, '10', '3', '5', '5', '5', '12');

-- ----------------------------
-- Table structure for s_selected_course
-- ----------------------------
DROP TABLE IF EXISTS `s_selected_course`;
CREATE TABLE `s_selected_course`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `student_id` int(5) NOT NULL,
  `course_id` int(5) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `selected_course_student_fk`(`student_id`) USING BTREE,
  INDEX `selected_course_course_fk`(`course_id`) USING BTREE,
  CONSTRAINT `selected_course_course_fk` FOREIGN KEY (`course_id`) REFERENCES `s_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `selected_course_student_fk` FOREIGN KEY (`student_id`) REFERENCES `s_student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_selected_course
-- ----------------------------
INSERT INTO `s_selected_course` VALUES (18, 2, 1);
INSERT INTO `s_selected_course` VALUES (19, 2, 2);
INSERT INTO `s_selected_course` VALUES (20, 2, 3);

-- ----------------------------
-- Table structure for s_student
-- ----------------------------
DROP TABLE IF EXISTS `s_student`;
CREATE TABLE `s_student`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `sn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `clazz_id` int(5) NOT NULL,
  `sex` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '男',
  `mobile` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qq` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `sn`) USING BTREE,
  INDEX `student_clazz_id_foreign`(`clazz_id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  CONSTRAINT `student_clazz_id_foreign` FOREIGN KEY (`clazz_id`) REFERENCES `s_clazz` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_student
-- ----------------------------
INSERT INTO `s_student` VALUES (1, 'S37214893712585', '小猪猪', '1', 5, '女', '1323423', '32414124', NULL);
INSERT INTO `s_student` VALUES (2, 'S51528202992845', '张三纷', '123456', 1, '女', '13545454548', '1332365656', NULL);
INSERT INTO `s_student` VALUES (4, 'S51528379586807', '王麻子', '111111', 5, '男', '13356565656', '123456', NULL);
INSERT INTO `s_student` VALUES (6, 'S34758972890053', '小狗狗', '1', 4, '男', '1324', '123414', NULL);
INSERT INTO `s_student` VALUES (9, 'S41528633634989', '马冬梅', '1', 5, '男', '13333332133', '131313132323', 'bb12326f-ef6c-4d3d-a2ae-f9eb30a15ad4.jpg');

-- ----------------------------
-- Table structure for s_teacher
-- ----------------------------
DROP TABLE IF EXISTS `s_teacher`;
CREATE TABLE `s_teacher`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `sn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `clazz_id` int(5) NOT NULL,
  `sex` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '男',
  `mobile` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qq` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `sn`) USING BTREE,
  INDEX `student_clazz_id_foreign`(`clazz_id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  CONSTRAINT `s_teacher_ibfk_1` FOREIGN KEY (`clazz_id`) REFERENCES `s_clazz` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_teacher
-- ----------------------------
INSERT INTO `s_teacher` VALUES (9, 'T11528608730648', '张三', '111', 4, '男', '13918655656', '1193284480', NULL);
INSERT INTO `s_teacher` VALUES (10, 'T11528609224588', '李四老师', '111', 4, '男', '13656565656', '123456', NULL);
INSERT INTO `s_teacher` VALUES (11, 'T51528617262403', '李老师', '123456', 5, '男', '18989898989', '1456655565', NULL);
INSERT INTO `s_teacher` VALUES (18, 'T11561727746515', '夏青松', '123456', 1, '女', '15174857845', '1745854125', '5d447b8b-ec54-4a8e-919a-453aa7b6d33b.jpg');

SET FOREIGN_KEY_CHECKS = 1;

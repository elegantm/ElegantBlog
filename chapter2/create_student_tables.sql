SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for COURSE
-- ----------------------------
DROP TABLE IF EXISTS `COURSE`;
CREATE TABLE `COURSE` (
  `CNO` varchar(5) NOT NULL,
  `CNAME` varchar(10) NOT NULL,
  `TNO` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of COURSE
-- ----------------------------
INSERT INTO `COURSE` VALUES ('6-166', '数据电路', '856');
INSERT INTO `COURSE` VALUES ('9-888', '高等数学', '100');
INSERT INTO `COURSE` VALUES ('3-105', '计算机导论', '825');
INSERT INTO `COURSE` VALUES ('3-245', '操作系统', '804');
INSERT INTO `COURSE` VALUES ('6-166', '数据电路', '856');
INSERT INTO `COURSE` VALUES ('9-888', '高等数学', '100');

-- ----------------------------
-- Table structure for SCORE
-- ----------------------------
DROP TABLE IF EXISTS `SCORE`;
CREATE TABLE `SCORE` (
  `SNO` varchar(3) NOT NULL,
  `CNO` varchar(5) NOT NULL,
  `DEGREE` decimal(10,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of SCORE
-- ----------------------------
INSERT INTO `SCORE` VALUES ('103', '3-245', '86.0');
INSERT INTO `SCORE` VALUES ('105', '3-245', '75.0');
INSERT INTO `SCORE` VALUES ('109', '3-245', '68.0');
INSERT INTO `SCORE` VALUES ('103', '3-105', '92.0');
INSERT INTO `SCORE` VALUES ('105', '3-105', '88.0');
INSERT INTO `SCORE` VALUES ('109', '3-105', '76.0');
INSERT INTO `SCORE` VALUES ('101', '3-105', '64.0');
INSERT INTO `SCORE` VALUES ('107', '3-105', '91.0');
INSERT INTO `SCORE` VALUES ('108', '3-105', '78.0');
INSERT INTO `SCORE` VALUES ('101', '6-166', '85.0');
INSERT INTO `SCORE` VALUES ('107', '6-106', '79.0');
INSERT INTO `SCORE` VALUES ('108', '6-166', '81.0');

-- ----------------------------
-- Table structure for STUDENT
-- ----------------------------
DROP TABLE IF EXISTS `STUDENT`;
CREATE TABLE `STUDENT` (
  `SNO` varchar(3) NOT NULL,
  `SNAME` varchar(4) NOT NULL,
  `SSEX` varchar(2) NOT NULL,
  `SBIRTHDAY` varchar(10) DEFAULT NULL,
  `CLASS` varchar(5) NOT NULL,
  PRIMARY KEY (`SNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of STUDENT
-- ----------------------------
INSERT INTO `STUDENT` VALUES ('101', '李军', '男', '1954', '95033');
INSERT INTO `STUDENT` VALUES ('103', '陆君', '男', '1965', '95031');
INSERT INTO `STUDENT` VALUES ('105', '匡明', '男', '1963', '95031');
INSERT INTO `STUDENT` VALUES ('107', '王丽', '女', '1952', '95033');
INSERT INTO `STUDENT` VALUES ('108', '曾华', '男', '1967', '95033');
INSERT INTO `STUDENT` VALUES ('109', '王芳', '女', '1963', '95031');

-- ----------------------------
-- Table structure for TEACHER
-- ----------------------------
DROP TABLE IF EXISTS `TEACHER`;
CREATE TABLE `TEACHER` (
  `TNO` varchar(3) NOT NULL,
  `TNAME` varchar(4) NOT NULL,
  `TSEX` varchar(2) NOT NULL,
  `TBIRTHDAY` datetime NOT NULL,
  `PROF` varchar(6) DEFAULT NULL,
  `DEPART` varchar(10) NOT NULL,
  PRIMARY KEY (`TNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of TEACHER
-- ----------------------------
INSERT INTO `TEACHER` VALUES ('804', '李诚', '男', '1958-12-02 00:00:00', '副教授', '计算机系');
INSERT INTO `TEACHER` VALUES ('825', '王萍', '女', '1972-05-05 00:00:00', '助教', '计算机系');
INSERT INTO `TEACHER` VALUES ('831', '刘冰', '女', '1977-08-14 00:00:00', '助教', '电子工程系');
INSERT INTO `TEACHER` VALUES ('856', '张旭', '男', '1969-03-12 00:00:00', '讲师', '电子工程系');
SET FOREIGN_KEY_CHECKS=1;
/*
 Navicat Premium Data Transfer

 Source Server         : 作业
 Source Server Type    : MySQL
 Source Server Version : 80027 (8.0.27)
 Source Host           : 192.168.163.3:3307
 Source Schema         : ry

 Target Server Type    : MySQL
 Target Server Version : 80027 (8.0.27)
 File Encoding         : 65001

 Date: 18/05/2024 15:16:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 't_student', '学生表', '', NULL, 'TStudent', 'crud', 'com.ruoyi.student', 'student', 'student', '学生信息管理', 'song', '0', '/', '{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"学生管理\",\"treeCode\":\"\"}', 'admin', '2024-05-16 17:10:27', '', '2024-05-16 17:24:10', '');
INSERT INTO `gen_table` VALUES (2, 't_score', '学生成绩表', '', NULL, 'TScore', 'crud', 'com.ruoyi.student', 'student', 'score', '成绩管理', 'song', '0', '/', '{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"学生管理\",\"treeCode\":\"\"}', 'admin', '2024-05-16 17:43:10', '', '2024-05-16 17:45:41', '');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'student_no', '学号', 'int', 'Long', 'studentNo', '1', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 1, 'admin', '2024-05-16 17:10:27', NULL, '2024-05-16 17:24:10');
INSERT INTO `gen_table_column` VALUES (2, 1, 'student_name', '姓名', 'varchar(20)', 'String', 'studentName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-05-16 17:10:27', NULL, '2024-05-16 17:24:10');
INSERT INTO `gen_table_column` VALUES (3, 1, 'student_sex', '性别', 'varchar(255)', 'String', 'studentSex', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2024-05-16 17:10:27', NULL, '2024-05-16 17:24:10');
INSERT INTO `gen_table_column` VALUES (4, 1, 'stu_pass', '密码', 'varchar(12)', 'String', 'stuPass', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2024-05-16 17:10:27', NULL, '2024-05-16 17:24:10');
INSERT INTO `gen_table_column` VALUES (5, 2, 'score_id', '', 'int', 'Long', 'scoreId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-05-16 17:43:10', NULL, '2024-05-16 17:45:41');
INSERT INTO `gen_table_column` VALUES (6, 2, 'score_value', '成绩值', 'int', 'Long', 'scoreValue', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-05-16 17:43:10', NULL, '2024-05-16 17:45:41');
INSERT INTO `gen_table_column` VALUES (7, 2, 'score_type', '成绩类别1习题 2测验 3考试', 'varchar(255)', 'String', 'scoreType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2024-05-16 17:43:10', NULL, '2024-05-16 17:45:41');
INSERT INTO `gen_table_column` VALUES (8, 2, 'student_id', '', 'int', 'Long', 'studentId', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2024-05-16 17:43:10', NULL, '2024-05-16 17:45:41');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-05-16 17:01:56', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-05-16 17:01:56', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-05-16 17:01:56', '', NULL, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-05-16 17:01:56', 'admin', '2024-05-17 14:51:02', '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2024-05-16 17:01:56', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES (6, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '0', 'Y', 'admin', '2024-05-16 17:01:56', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (7, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2024-05-16 17:01:56', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2024-05-16 17:01:56', '', NULL, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES (9, '主框架页-是否开启页脚', 'sys.index.footer', 'true', 'Y', 'admin', '2024-05-16 17:01:56', '', NULL, '是否开启底部页脚显示（true显示，false隐藏）');
INSERT INTO `sys_config` VALUES (10, '主框架页-是否开启页签', 'sys.index.tagsView', 'true', 'Y', 'admin', '2024-05-16 17:01:56', '', NULL, '是否开启菜单多页签显示（true显示，false隐藏）');
INSERT INTO `sys_config` VALUES (11, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-05-16 17:01:56', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-16 17:01:56', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-16 17:01:56', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-16 17:01:56', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-16 17:01:56', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-16 17:01:56', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-16 17:01:56', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-16 17:01:56', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-16 17:01:56', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-16 17:01:56', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-16 17:01:56', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '习题', '1', 'score_type', '', 'primary', 'N', '0', 'admin', '2024-05-16 17:56:45', 'admin', '2024-05-16 18:11:15', '');
INSERT INTO `sys_dict_data` VALUES (101, 2, '测验', '2', 'score_type', '', 'primary', 'N', '0', 'admin', '2024-05-16 17:57:00', 'admin', '2024-05-16 18:11:20', '');
INSERT INTO `sys_dict_data` VALUES (102, 3, '考试', '3', 'score_type', '', 'primary', 'Y', '0', 'admin', '2024-05-16 17:57:08', 'admin', '2024-05-16 18:11:23', '');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '成绩类型', 'score_type', '0', 'admin', '2024-05-16 17:56:18', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-05-16 17:01:56', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 389 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-16 17:09:36');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-05-16 17:21:05');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-16 17:21:09');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-16 17:22:58');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-16 17:26:29');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-16 17:27:52');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-16 17:31:32');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-16 17:33:27');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-16 17:34:34');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-16 17:48:32');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-16 17:53:41');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-16 17:58:02');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-16 18:02:05');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-16 18:06:31');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-16 18:08:53');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-05-16 18:13:24');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-16 18:13:28');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-16 18:14:12');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-16 18:19:50');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-16 18:22:29');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-16 18:23:33');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-16 18:29:32');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-16 18:31:38');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-16 18:51:30');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-05-16 18:54:44');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-16 18:54:46');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-16 19:03:33');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-16 19:05:57');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-05-16 19:13:14');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-16 19:13:17');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-16 19:22:21');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-16 19:23:28');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-05-16 19:27:25');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-16 19:27:28');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-16 19:28:52');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-16 19:29:52');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 08:19:42');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 08:22:42');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 08:24:00');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 08:25:25');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 08:26:44');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 08:27:53');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 08:29:27');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 08:33:08');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 08:39:17');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-05-17 09:02:46');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 09:02:49');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 09:11:17');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-05-17 09:11:45');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 09:11:56');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 09:13:38');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 09:14:56');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-05-17 09:38:12');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-05-17 09:38:16');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 09:38:19');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 09:40:46');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 09:41:25');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-05-17 10:04:23');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 10:04:26');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 10:05:56');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 10:07:51');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 10:08:42');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 10:09:26');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 10:10:14');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 10:19:26');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 10:23:08');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-05-17 10:25:01');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 10:25:04');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 10:28:42');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 10:32:23');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 10:32:37');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 10:36:49');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 10:38:27');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 10:40:05');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 10:40:35');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 10:41:26');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 10:42:47');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 10:48:39');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 10:49:37');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 10:53:35');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 10:56:18');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-05-17 10:57:29');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 10:57:32');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 10:59:11');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 11:00:27');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 11:04:23');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 11:06:40');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 11:15:43');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 11:19:06');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 11:22:53');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-05-17 11:25:23');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-05-17 11:25:27');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 11:25:31');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-05-17 11:30:10');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 11:30:14');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 11:44:35');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 11:49:36');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 11:50:28');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 11:52:45');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 12:53:15');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-05-17 12:54:07');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-05-17 12:54:10');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 12:54:13');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 12:55:16');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 13:07:45');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 13:13:24');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 13:14:28');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 13:20:17');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 13:25:26');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 13:30:01');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 13:31:13');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 13:31:35');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 13:32:31');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 13:39:57');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 13:40:52');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 13:42:10');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 13:42:48');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 13:47:17');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 13:49:12');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 13:53:19');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 14:02:43');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 14:03:52');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 14:12:48');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 14:16:17');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 14:19:18');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 14:23:04');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 14:25:04');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 14:30:37');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-17 14:34:40');
INSERT INTO `sys_logininfor` VALUES (229, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 14:34:49');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-05-17 14:34:59');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 14:35:02');
INSERT INTO `sys_logininfor` VALUES (232, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-05-17 14:35:27');
INSERT INTO `sys_logininfor` VALUES (233, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 14:35:37');
INSERT INTO `sys_logininfor` VALUES (234, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 14:45:55');
INSERT INTO `sys_logininfor` VALUES (235, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 14:46:03');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 14:48:02');
INSERT INTO `sys_logininfor` VALUES (237, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-17 14:49:46');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 14:50:33');
INSERT INTO `sys_logininfor` VALUES (239, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 14:58:03');
INSERT INTO `sys_logininfor` VALUES (240, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-17 15:00:29');
INSERT INTO `sys_logininfor` VALUES (241, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 15:00:51');
INSERT INTO `sys_logininfor` VALUES (242, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-17 15:10:59');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 15:14:21');
INSERT INTO `sys_logininfor` VALUES (244, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 15:15:56');
INSERT INTO `sys_logininfor` VALUES (245, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 15:17:36');
INSERT INTO `sys_logininfor` VALUES (246, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 15:18:03');
INSERT INTO `sys_logininfor` VALUES (247, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 15:18:44');
INSERT INTO `sys_logininfor` VALUES (248, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 15:23:10');
INSERT INTO `sys_logininfor` VALUES (249, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 15:23:25');
INSERT INTO `sys_logininfor` VALUES (250, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 15:31:31');
INSERT INTO `sys_logininfor` VALUES (251, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-17 15:31:35');
INSERT INTO `sys_logininfor` VALUES (252, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 15:37:52');
INSERT INTO `sys_logininfor` VALUES (253, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 15:37:54');
INSERT INTO `sys_logininfor` VALUES (254, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 15:37:55');
INSERT INTO `sys_logininfor` VALUES (255, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 15:37:55');
INSERT INTO `sys_logininfor` VALUES (256, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 15:38:03');
INSERT INTO `sys_logininfor` VALUES (257, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 15:39:10');
INSERT INTO `sys_logininfor` VALUES (258, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 15:39:37');
INSERT INTO `sys_logininfor` VALUES (259, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 15:41:01');
INSERT INTO `sys_logininfor` VALUES (260, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 15:44:36');
INSERT INTO `sys_logininfor` VALUES (261, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 15:46:47');
INSERT INTO `sys_logininfor` VALUES (262, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 15:57:27');
INSERT INTO `sys_logininfor` VALUES (263, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 15:58:02');
INSERT INTO `sys_logininfor` VALUES (264, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 16:01:08');
INSERT INTO `sys_logininfor` VALUES (265, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 16:01:33');
INSERT INTO `sys_logininfor` VALUES (266, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 16:03:28');
INSERT INTO `sys_logininfor` VALUES (267, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 16:12:29');
INSERT INTO `sys_logininfor` VALUES (268, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 16:12:29');
INSERT INTO `sys_logininfor` VALUES (269, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 16:12:40');
INSERT INTO `sys_logininfor` VALUES (270, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 16:12:40');
INSERT INTO `sys_logininfor` VALUES (271, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 16:12:42');
INSERT INTO `sys_logininfor` VALUES (272, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 16:12:42');
INSERT INTO `sys_logininfor` VALUES (273, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 16:12:43');
INSERT INTO `sys_logininfor` VALUES (274, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 16:12:43');
INSERT INTO `sys_logininfor` VALUES (275, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 16:15:56');
INSERT INTO `sys_logininfor` VALUES (276, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 16:15:56');
INSERT INTO `sys_logininfor` VALUES (277, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 16:22:41');
INSERT INTO `sys_logininfor` VALUES (278, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 16:22:41');
INSERT INTO `sys_logininfor` VALUES (279, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 16:22:57');
INSERT INTO `sys_logininfor` VALUES (280, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 16:22:57');
INSERT INTO `sys_logininfor` VALUES (281, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 16:23:00');
INSERT INTO `sys_logininfor` VALUES (282, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 16:23:00');
INSERT INTO `sys_logininfor` VALUES (283, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 16:23:02');
INSERT INTO `sys_logininfor` VALUES (284, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 16:23:02');
INSERT INTO `sys_logininfor` VALUES (285, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 16:31:13');
INSERT INTO `sys_logininfor` VALUES (286, NULL, '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-17 16:31:17');
INSERT INTO `sys_logininfor` VALUES (287, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 16:31:19');
INSERT INTO `sys_logininfor` VALUES (288, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-17 16:31:22');
INSERT INTO `sys_logininfor` VALUES (289, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 16:31:29');
INSERT INTO `sys_logininfor` VALUES (290, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-17 16:31:37');
INSERT INTO `sys_logininfor` VALUES (291, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 16:31:43');
INSERT INTO `sys_logininfor` VALUES (292, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 16:34:01');
INSERT INTO `sys_logininfor` VALUES (293, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 16:36:33');
INSERT INTO `sys_logininfor` VALUES (294, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 16:39:08');
INSERT INTO `sys_logininfor` VALUES (295, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 16:42:44');
INSERT INTO `sys_logininfor` VALUES (296, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 16:46:51');
INSERT INTO `sys_logininfor` VALUES (297, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-17 16:46:53');
INSERT INTO `sys_logininfor` VALUES (298, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 16:46:56');
INSERT INTO `sys_logininfor` VALUES (299, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 16:51:41');
INSERT INTO `sys_logininfor` VALUES (300, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-17 16:54:22');
INSERT INTO `sys_logininfor` VALUES (301, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 16:54:23');
INSERT INTO `sys_logininfor` VALUES (302, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 16:55:56');
INSERT INTO `sys_logininfor` VALUES (303, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 16:57:52');
INSERT INTO `sys_logininfor` VALUES (304, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 17:05:37');
INSERT INTO `sys_logininfor` VALUES (305, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 17:42:58');
INSERT INTO `sys_logininfor` VALUES (306, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-17 17:45:10');
INSERT INTO `sys_logininfor` VALUES (307, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-18 10:49:35');
INSERT INTO `sys_logininfor` VALUES (308, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-18 10:49:53');
INSERT INTO `sys_logininfor` VALUES (309, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-18 10:50:02');
INSERT INTO `sys_logininfor` VALUES (310, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-18 10:50:53');
INSERT INTO `sys_logininfor` VALUES (311, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-18 10:52:12');
INSERT INTO `sys_logininfor` VALUES (312, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-18 10:52:56');
INSERT INTO `sys_logininfor` VALUES (313, NULL, '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-18 10:53:14');
INSERT INTO `sys_logininfor` VALUES (314, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-18 10:53:24');
INSERT INTO `sys_logininfor` VALUES (315, NULL, '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-18 10:53:34');
INSERT INTO `sys_logininfor` VALUES (316, '2017231311', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-18 10:53:37');
INSERT INTO `sys_logininfor` VALUES (317, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-18 10:53:41');
INSERT INTO `sys_logininfor` VALUES (318, NULL, '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-18 10:54:30');
INSERT INTO `sys_logininfor` VALUES (319, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-18 10:54:42');
INSERT INTO `sys_logininfor` VALUES (320, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-18 10:57:09');
INSERT INTO `sys_logininfor` VALUES (321, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-18 11:00:48');
INSERT INTO `sys_logininfor` VALUES (322, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-18 11:01:08');
INSERT INTO `sys_logininfor` VALUES (323, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-18 11:03:08');
INSERT INTO `sys_logininfor` VALUES (324, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-18 11:09:10');
INSERT INTO `sys_logininfor` VALUES (325, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-18 11:13:46');
INSERT INTO `sys_logininfor` VALUES (326, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-18 11:14:43');
INSERT INTO `sys_logininfor` VALUES (327, NULL, '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-18 11:16:22');
INSERT INTO `sys_logininfor` VALUES (328, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-18 11:19:26');
INSERT INTO `sys_logininfor` VALUES (329, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-18 11:22:23');
INSERT INTO `sys_logininfor` VALUES (330, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-18 11:24:37');
INSERT INTO `sys_logininfor` VALUES (331, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-18 11:27:12');
INSERT INTO `sys_logininfor` VALUES (332, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-18 11:28:24');
INSERT INTO `sys_logininfor` VALUES (333, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-18 11:30:09');
INSERT INTO `sys_logininfor` VALUES (334, 'student', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-18 11:30:34');
INSERT INTO `sys_logininfor` VALUES (335, 'student', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-18 11:31:42');
INSERT INTO `sys_logininfor` VALUES (336, 'student', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-18 11:31:47');
INSERT INTO `sys_logininfor` VALUES (337, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-18 11:31:49');
INSERT INTO `sys_logininfor` VALUES (338, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-18 11:32:08');
INSERT INTO `sys_logininfor` VALUES (339, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-18 11:32:20');
INSERT INTO `sys_logininfor` VALUES (340, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-18 11:32:30');
INSERT INTO `sys_logininfor` VALUES (341, 'student', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-18 11:35:22');
INSERT INTO `sys_logininfor` VALUES (342, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-18 11:39:29');
INSERT INTO `sys_logininfor` VALUES (343, 'student', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-18 11:41:46');
INSERT INTO `sys_logininfor` VALUES (344, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-18 11:42:16');
INSERT INTO `sys_logininfor` VALUES (345, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-18 11:44:45');
INSERT INTO `sys_logininfor` VALUES (346, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-18 11:49:45');
INSERT INTO `sys_logininfor` VALUES (347, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-18 11:55:43');
INSERT INTO `sys_logininfor` VALUES (348, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-18 11:58:29');
INSERT INTO `sys_logininfor` VALUES (349, '黄梦歌', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-18 12:00:14');
INSERT INTO `sys_logininfor` VALUES (350, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-18 12:00:24');
INSERT INTO `sys_logininfor` VALUES (351, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-18 12:03:53');
INSERT INTO `sys_logininfor` VALUES (352, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-18 12:03:57');
INSERT INTO `sys_logininfor` VALUES (353, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-18 12:03:59');
INSERT INTO `sys_logininfor` VALUES (354, '黄梦歌', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-18 12:04:09');
INSERT INTO `sys_logininfor` VALUES (355, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-18 12:04:58');
INSERT INTO `sys_logininfor` VALUES (356, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-18 12:06:08');
INSERT INTO `sys_logininfor` VALUES (357, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-18 12:06:11');
INSERT INTO `sys_logininfor` VALUES (358, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-18 12:06:26');
INSERT INTO `sys_logininfor` VALUES (359, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-05-18 12:07:30');
INSERT INTO `sys_logininfor` VALUES (360, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-18 12:08:41');
INSERT INTO `sys_logininfor` VALUES (361, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-18 12:08:44');
INSERT INTO `sys_logininfor` VALUES (362, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-18 12:13:06');
INSERT INTO `sys_logininfor` VALUES (363, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-18 12:13:12');
INSERT INTO `sys_logininfor` VALUES (364, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-18 12:13:18');
INSERT INTO `sys_logininfor` VALUES (365, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-05-18 12:13:26');
INSERT INTO `sys_logininfor` VALUES (366, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-18 12:13:30');
INSERT INTO `sys_logininfor` VALUES (367, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-18 12:13:40');
INSERT INTO `sys_logininfor` VALUES (368, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-18 12:14:47');
INSERT INTO `sys_logininfor` VALUES (369, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-18 12:15:32');
INSERT INTO `sys_logininfor` VALUES (370, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-18 12:16:07');
INSERT INTO `sys_logininfor` VALUES (371, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-05-18 12:18:21');
INSERT INTO `sys_logininfor` VALUES (372, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-05-18 12:20:31');
INSERT INTO `sys_logininfor` VALUES (373, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-05-18 12:22:46');
INSERT INTO `sys_logininfor` VALUES (374, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-05-18 12:22:51');
INSERT INTO `sys_logininfor` VALUES (375, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-05-18 12:22:55');
INSERT INTO `sys_logininfor` VALUES (376, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-05-18 12:23:04');
INSERT INTO `sys_logininfor` VALUES (377, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-18 12:23:07');
INSERT INTO `sys_logininfor` VALUES (378, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-05-18 12:25:40');
INSERT INTO `sys_logininfor` VALUES (379, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-05-18 12:27:49');
INSERT INTO `sys_logininfor` VALUES (380, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-18 12:28:37');
INSERT INTO `sys_logininfor` VALUES (381, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-18 12:29:41');
INSERT INTO `sys_logininfor` VALUES (382, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-18 12:29:46');
INSERT INTO `sys_logininfor` VALUES (383, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-18 12:29:50');
INSERT INTO `sys_logininfor` VALUES (384, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-18 12:29:56');
INSERT INTO `sys_logininfor` VALUES (385, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-18 12:29:59');
INSERT INTO `sys_logininfor` VALUES (386, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-18 12:32:32');
INSERT INTO `sys_logininfor` VALUES (387, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-18 12:33:22');
INSERT INTO `sys_logininfor` VALUES (388, '201723131', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-18 15:16:15');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2016 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', '', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2024-05-16 17:01:56', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, '#', '', 'M', '0', '1', '', 'fa fa-video-camera', 'admin', '2024-05-16 17:01:56', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, '#', '', 'M', '0', '1', '', 'fa fa-bars', 'admin', '2024-05-16 17:01:56', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', 'menuBlank', 'C', '1', '1', '', 'fa fa-location-arrow', 'admin', '2024-05-16 17:01:56', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2024-05-16 17:01:56', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2024-05-16 17:01:56', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', '1', 'system:menu:view', 'fa fa-th-list', 'admin', '2024-05-16 17:01:56', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', '', 'C', '0', '1', 'system:dept:view', 'fa fa-outdent', 'admin', '2024-05-16 17:01:56', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', '', 'C', '0', '1', 'system:post:view', 'fa fa-address-card-o', 'admin', '2024-05-16 17:01:56', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', '1', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2024-05-16 17:01:56', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', '', 'C', '0', '1', 'system:config:view', 'fa fa-sun-o', 'admin', '2024-05-16 17:01:56', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', '1', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2024-05-16 17:01:56', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', '', 'M', '0', '1', '', 'fa fa-pencil-square-o', 'admin', '2024-05-16 17:01:56', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', '1', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2024-05-16 17:01:56', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', '1', 'monitor:job:view', 'fa fa-tasks', 'admin', '2024-05-16 17:01:56', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', '1', 'monitor:data:view', 'fa fa-bug', 'admin', '2024-05-16 17:01:56', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, '/monitor/server', '', 'C', '0', '1', 'monitor:server:view', 'fa fa-server', 'admin', '2024-05-16 17:01:56', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, '/monitor/cache', '', 'C', '0', '1', 'monitor:cache:view', 'fa fa-cube', 'admin', '2024-05-16 17:01:56', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, '/tool/build', '', 'C', '0', '1', 'tool:build:view', 'fa fa-wpforms', 'admin', '2024-05-16 17:01:56', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', '1', 'tool:gen:view', 'fa fa-code', 'admin', '2024-05-16 17:01:56', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', '1', 'tool:swagger:view', 'fa fa-gg', 'admin', '2024-05-16 17:01:56', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', '1', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2024-05-16 17:01:56', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2024-05-16 17:01:56', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', '1', 'system:user:export', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', '1', 'system:user:import', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', '1', 'system:menu:list', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', '1', 'system:menu:add', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', '1', 'system:menu:edit', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', '1', 'system:menu:remove', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', '1', 'system:dept:list', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', '1', 'system:dept:add', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', '1', 'system:dept:edit', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', '1', 'system:dept:remove', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', '1', 'system:post:list', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', '1', 'system:post:add', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', '1', 'system:post:edit', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', '1', 'system:post:remove', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', '1', 'system:post:export', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', '1', 'system:dict:list', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', '1', 'system:dict:add', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', '1', 'system:dict:edit', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', '1', 'system:dict:remove', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', '1', 'system:dict:export', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', '1', 'system:config:list', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', '1', 'system:config:add', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', '1', 'system:config:edit', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', '1', 'system:config:remove', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', '1', 'system:config:export', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', '1', 'system:notice:list', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', '1', 'system:notice:add', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', '1', 'system:notice:edit', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', '1', 'system:notice:remove', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', '1', 'monitor:operlog:list', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', '1', 'monitor:operlog:remove', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', '1', 'monitor:operlog:detail', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', '1', 'monitor:operlog:export', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', '1', 'monitor:logininfor:list', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', '1', 'monitor:logininfor:remove', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', '1', 'monitor:logininfor:export', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', '1', 'monitor:logininfor:unlock', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '在线查询', 109, 1, '#', '', 'F', '0', '1', 'monitor:online:list', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '批量强退', 109, 2, '#', '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '单条强退', 109, 3, '#', '', 'F', '0', '1', 'monitor:online:forceLogout', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务查询', 110, 1, '#', '', 'F', '0', '1', 'monitor:job:list', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务新增', 110, 2, '#', '', 'F', '0', '1', 'monitor:job:add', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务修改', 110, 3, '#', '', 'F', '0', '1', 'monitor:job:edit', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '任务删除', 110, 4, '#', '', 'F', '0', '1', 'monitor:job:remove', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '状态修改', 110, 5, '#', '', 'F', '0', '1', 'monitor:job:changeStatus', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '任务详细', 110, 6, '#', '', 'F', '0', '1', 'monitor:job:detail', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '任务导出', 110, 7, '#', '', 'F', '0', '1', 'monitor:job:export', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成查询', 115, 1, '#', '', 'F', '0', '1', 'tool:gen:list', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '生成修改', 115, 2, '#', '', 'F', '0', '1', 'tool:gen:edit', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '生成删除', 115, 3, '#', '', 'F', '0', '1', 'tool:gen:remove', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '预览代码', 115, 4, '#', '', 'F', '0', '1', 'tool:gen:preview', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '生成代码', 115, 5, '#', '', 'F', '0', '1', 'tool:gen:code', '#', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '学生管理', 0, 5, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-address-book', 'admin', '2024-05-16 17:12:04', 'admin', '2024-05-16 17:12:09', '');
INSERT INTO `sys_menu` VALUES (2001, '学生信息管理', 2000, 1, '/student/student', '', 'C', '0', '1', 'student:student:view', '#', 'admin', '2024-05-16 17:14:28', '', NULL, '学生信息管理菜单');
INSERT INTO `sys_menu` VALUES (2002, '学生信息管理查询', 2001, 1, '#', '', 'F', '0', '1', 'student:student:list', '#', 'admin', '2024-05-16 17:14:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '学生信息管理新增', 2001, 2, '#', '', 'F', '0', '1', 'student:student:add', '#', 'admin', '2024-05-16 17:14:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '学生信息管理修改', 2001, 3, '#', '', 'F', '0', '1', 'student:student:edit', '#', 'admin', '2024-05-16 17:14:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '学生信息管理删除', 2001, 4, '#', '', 'F', '0', '1', 'student:student:remove', '#', 'admin', '2024-05-16 17:14:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '学生信息管理导出', 2001, 5, '#', '', 'F', '0', '1', 'student:student:export', '#', 'admin', '2024-05-16 17:14:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '成绩管理', 2000, 1, '/student/score', '', 'C', '0', '1', 'student:score:view', '#', 'admin', '2024-05-16 17:46:33', '', NULL, '成绩管理菜单');
INSERT INTO `sys_menu` VALUES (2008, '成绩管理查询', 2007, 1, '#', '', 'F', '0', '1', 'student:score:list', '#', 'admin', '2024-05-16 17:46:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '成绩管理新增', 2007, 2, '#', '', 'F', '0', '1', 'student:score:add', '#', 'admin', '2024-05-16 17:46:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '成绩管理修改', 2007, 3, '#', '', 'F', '0', '1', 'student:score:edit', '#', 'admin', '2024-05-16 17:46:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '成绩管理删除', 2007, 4, '#', '', 'F', '0', '1', 'student:score:remove', '#', 'admin', '2024-05-16 17:46:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '成绩管理导出', 2007, 5, '#', '', 'F', '0', '1', 'student:score:export', '#', 'admin', '2024-05-16 17:46:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '学生总成绩', 2000, 3, '/student/score/total', 'menuItem', 'C', '0', '1', 'student:score:total', '#', 'admin', '2024-05-17 09:04:06', 'admin', '2024-05-17 14:37:51', '');
INSERT INTO `sys_menu` VALUES (2015, '个人总成绩', 2000, 4, '/student/score/usertotal', 'menuItem', 'C', '0', '1', NULL, '#', 'admin', '2024-05-17 16:57:16', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 205 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"t_student\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-16 17:10:27', 114);
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"学生管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-address-book\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-16 17:12:04', 13);
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2000\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"学生管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-address-book\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-16 17:12:09', 14);
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"t_student\"],\"tableComment\":[\"学生表\"],\"className\":[\"TStudent\"],\"functionAuthor\":[\"song\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"学号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"studentNo\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"姓名\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"studentName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"性别\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"studentSex\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"select\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"删除状态\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"stuPass\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.student\"],\"moduleName\":[\"student\"],\"businessName\":[\"student\"],\"functionName\":[\"学生信息管理\"],\"params[parentMenuId]\":[\"2000\"],\"params[parentMenuName]\":[\"学生管理\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-16 17:13:54', 20);
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"t_student\"],\"tableComment\":[\"学生表\"],\"className\":[\"TStudent\"],\"functionAuthor\":[\"song\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"学号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"studentNo\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"姓名\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"studentName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"性别\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"studentSex\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"select\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"删除状态\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"stuPass\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.student\"],\"moduleName\":[\"student\"],\"businessName\":[\"student\"],\"functionName\":[\"学生信息管理\"],\"params[parentMenuId]\":[\"2000\"],\"params[parentMenuName]\":[\"学生管理\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-16 17:14:05', 20);
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/t_student', '127.0.0.1', '内网IP', '\"t_student\"', NULL, 0, NULL, '2024-05-16 17:14:08', 40);
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"t_student\"],\"tableComment\":[\"学生表\"],\"className\":[\"TStudent\"],\"functionAuthor\":[\"song\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"学号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"studentNo\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].isEdit\":[\"1\"],\"columns[0].isList\":[\"1\"],\"columns[0].isQuery\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"姓名\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"studentName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"性别\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"studentSex\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"select\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"密码\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"stuPass\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.student\"],\"moduleName\":[\"student\"],\"businessName\":[\"student\"],\"functionName\":[\"学生信息管理\"],\"params[parentMenuId]\":[\"2000\"],\"params[parentMenuName]\":[\"学生管理\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-16 17:24:10', 36);
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/t_student', '127.0.0.1', '内网IP', '\"t_student\"', NULL, 0, NULL, '2024-05-16 17:24:25', 139);
INSERT INTO `sys_oper_log` VALUES (108, '学生信息管理', 1, 'com.ruoyi.web.controller.student.TStudentController.addSave()', 'POST', 1, 'admin', '研发部门', '/student/student/add', '127.0.0.1', '内网IP', '{\"studentName\":[\"\"],\"stuPass\":[\"\"],\"stuSex\":[\"\"],\"studentNo\":[\"\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'student_no\' doesn\'t have a default value\r\n### The error may exist in file [F:\\code\\RuoYi-v4.7.8\\RuoYi-v4.7.8\\ruoyi-student\\target\\classes\\mapper\\student\\TStudentMapper.xml]\r\n### The error may involve com.ruoyi.student.mapper.TStudentMapper.insertTStudent-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_student          ( student_name,                          stu_pass )           values ( ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'student_no\' doesn\'t have a default value\n; Field \'student_no\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'student_no\' doesn\'t have a default value', '2024-05-16 17:31:39', 102);
INSERT INTO `sys_oper_log` VALUES (109, '学生信息管理', 5, 'com.ruoyi.web.controller.student.TStudentController.export()', 'POST', 1, 'admin', '研发部门', '/student/student/export', '127.0.0.1', '内网IP', '{\"studentNo\":[\"\"],\"studentName\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"3639443e-b053-48f5-a118-406a9c4c9ce5_学生信息管理数据.xlsx\",\"code\":0}', 0, NULL, '2024-05-16 17:35:35', 1354);
INSERT INTO `sys_oper_log` VALUES (110, '学生信息管理', 2, 'com.ruoyi.web.controller.student.TStudentController.editSave()', 'POST', 1, 'admin', '研发部门', '/student/student/edit', '127.0.0.1', '内网IP', '{\"studentNo\":[\"2017231888\"],\"studentName\":[\"大神\"],\"stuPass\":[\"2017231888\"],\"studentSex\":[\"男\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-16 17:35:53', 6);
INSERT INTO `sys_oper_log` VALUES (111, '学生信息管理', 3, 'com.ruoyi.web.controller.student.TStudentController.remove()', 'POST', 1, 'admin', '研发部门', '/student/student/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"201723138\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-16 17:35:59', 6);
INSERT INTO `sys_oper_log` VALUES (112, '学生信息管理', 1, 'com.ruoyi.web.controller.student.TStudentController.addSave()', 'POST', 1, 'admin', '研发部门', '/student/student/add', '127.0.0.1', '内网IP', '{\"studentName\":[\"test\"],\"stuPass\":[\"test\"],\"stuSex\":[\"test\"],\"studentNo\":[\"22222222\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-16 17:37:08', 8);
INSERT INTO `sys_oper_log` VALUES (113, '学生信息管理', 1, 'com.ruoyi.web.controller.student.TStudentController.addSave()', 'POST', 1, 'admin', '研发部门', '/student/student/add', '127.0.0.1', '内网IP', '{\"studentName\":[\"test1\"],\"stuPass\":[\"test1\"],\"stuSex\":[\"1\"],\"studentNo\":[\"111111\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-16 17:38:40', 6);
INSERT INTO `sys_oper_log` VALUES (114, '学生信息管理', 1, 'com.ruoyi.web.controller.student.TStudentController.addSave()', 'POST', 1, 'admin', '研发部门', '/student/student/add', '127.0.0.1', '内网IP', '{\"studentName\":[\"2222\"],\"stuPass\":[\"2222\"],\"stuSex\":[\"女\"],\"studentNo\":[\"2222\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-16 17:39:52', 16);
INSERT INTO `sys_oper_log` VALUES (115, '学生信息管理', 1, 'com.ruoyi.web.controller.student.TStudentController.addSave()', 'POST', 1, 'admin', '研发部门', '/student/student/add', '127.0.0.1', '内网IP', '{\"studentName\":[\"3333\"],\"stuPass\":[\"333\"],\"stuSex\":[\"男\"],\"studentNo\":[\"333\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-16 17:41:57', 10);
INSERT INTO `sys_oper_log` VALUES (116, '学生信息管理', 3, 'com.ruoyi.web.controller.student.TStudentController.remove()', 'POST', 1, 'admin', '研发部门', '/student/student/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"333,2222,111111,22222222\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-16 17:42:40', 7);
INSERT INTO `sys_oper_log` VALUES (117, '学生信息管理', 1, 'com.ruoyi.web.controller.student.TStudentController.addSave()', 'POST', 1, 'admin', '研发部门', '/student/student/add', '127.0.0.1', '内网IP', '{\"studentName\":[\"2222\"],\"stuPass\":[\"2222\"],\"studentSex\":[\"男\"],\"studentNo\":[\"2222\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-16 17:42:47', 10);
INSERT INTO `sys_oper_log` VALUES (118, '学生信息管理', 3, 'com.ruoyi.web.controller.student.TStudentController.remove()', 'POST', 1, 'admin', '研发部门', '/student/student/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2222\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-16 17:42:50', 7);
INSERT INTO `sys_oper_log` VALUES (119, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"t_score\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-16 17:43:10', 116);
INSERT INTO `sys_oper_log` VALUES (120, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"2\"],\"tableName\":[\"t_score\"],\"tableComment\":[\"学生成绩表\"],\"className\":[\"TScore\"],\"functionAuthor\":[\"song\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"5\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"scoreId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"6\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"成绩值\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"scoreValue\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"7\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"成绩类别1习题 2测验 3考试\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"scoreType\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"select\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"8\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"studentId\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.student\"],\"moduleName\":[\"student\"],\"businessName\":[\"score\"],\"functionName\":[\"成绩管理\"],\"params[parentMenuId]\":[\"2000\"],\"params[parentMenuName]\":[\"学生管理\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-16 17:45:41', 24);
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/t_score', '127.0.0.1', '内网IP', '\"t_score\"', NULL, 0, NULL, '2024-05-16 17:45:58', 475);
INSERT INTO `sys_oper_log` VALUES (122, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"成绩类型\"],\"dictType\":[\"score_type\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-16 17:56:18', 67);
INSERT INTO `sys_oper_log` VALUES (123, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"习题\"],\"dictValue\":[\"1\"],\"dictType\":[\"score_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-16 17:56:45', 10);
INSERT INTO `sys_oper_log` VALUES (124, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"测验\"],\"dictValue\":[\"2\"],\"dictType\":[\"score_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-16 17:57:00', 9);
INSERT INTO `sys_oper_log` VALUES (125, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"考试\"],\"dictValue\":[\"3\"],\"dictType\":[\"score_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-16 17:57:08', 9);
INSERT INTO `sys_oper_log` VALUES (126, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"100\"],\"dictLabel\":[\"习题\"],\"dictValue\":[\"1\"],\"dictType\":[\"score_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-16 18:10:02', 53);
INSERT INTO `sys_oper_log` VALUES (127, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"101\"],\"dictLabel\":[\"测验\"],\"dictValue\":[\"2\"],\"dictType\":[\"score_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-16 18:10:06', 14);
INSERT INTO `sys_oper_log` VALUES (128, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"102\"],\"dictLabel\":[\"考试\"],\"dictValue\":[\"3\"],\"dictType\":[\"score_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-16 18:10:09', 13);
INSERT INTO `sys_oper_log` VALUES (129, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"100\"],\"dictLabel\":[\"习题\"],\"dictValue\":[\"1\"],\"dictType\":[\"score_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"primary\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-16 18:11:15', 9);
INSERT INTO `sys_oper_log` VALUES (130, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"101\"],\"dictLabel\":[\"测验\"],\"dictValue\":[\"2\"],\"dictType\":[\"score_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"primary\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-16 18:11:20', 9);
INSERT INTO `sys_oper_log` VALUES (131, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"102\"],\"dictLabel\":[\"考试\"],\"dictValue\":[\"3\"],\"dictType\":[\"score_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-16 18:11:23', 10);
INSERT INTO `sys_oper_log` VALUES (132, '成绩管理', 1, 'com.ruoyi.web.controller.student.TScoreController.addSave()', 'POST', 1, 'admin', '研发部门', '/student/score/add', '127.0.0.1', '内网IP', '{\"scoreValue\":[\"100\"],\"studentId\":[\"201723143\"],\"scoreType\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-16 18:52:50', 61);
INSERT INTO `sys_oper_log` VALUES (133, '成绩管理', 2, 'com.ruoyi.web.controller.student.TScoreController.editSave()', 'POST', 1, 'admin', '研发部门', '/student/score/edit', '127.0.0.1', '内网IP', '{\"scoreId\":[\"3\"],\"scoreValue\":[\"50\"],\"scoreType\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-16 18:58:35', 50);
INSERT INTO `sys_oper_log` VALUES (134, '成绩管理', 2, 'com.ruoyi.web.controller.student.TScoreController.editSave()', 'POST', 1, 'admin', '研发部门', '/student/score/edit', '127.0.0.1', '内网IP', '{\"scoreId\":[\"3\"],\"scoreValue\":[\"50\"],\"scoreType\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-16 18:58:44', 5);
INSERT INTO `sys_oper_log` VALUES (135, '学生信息管理', 3, 'com.ruoyi.web.controller.student.TStudentController.remove()', 'POST', 1, 'admin', '研发部门', '/student/student/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"201723143\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-16 19:03:42', 9);
INSERT INTO `sys_oper_log` VALUES (136, '成绩管理', 1, 'com.ruoyi.web.controller.student.TScoreController.addSave()', 'POST', 1, 'admin', '研发部门', '/student/score/add', '127.0.0.1', '内网IP', '{\"scoreValue\":[\"20\"],\"studentId\":[\"201723145\"],\"scoreType\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-16 19:06:15', 8);
INSERT INTO `sys_oper_log` VALUES (137, '学生信息管理', 3, 'com.ruoyi.web.controller.student.TStudentController.remove()', 'POST', 1, 'admin', '研发部门', '/student/student/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"201723145\"]}', NULL, 1, '学生信息管理已经被成绩管理引用，不能删除', '2024-05-16 19:06:21', 4);
INSERT INTO `sys_oper_log` VALUES (138, '学生信息管理', 1, 'com.ruoyi.web.controller.student.TStudentController.addSave()', 'POST', 1, 'admin', '研发部门', '/student/student/add', '127.0.0.1', '内网IP', '{\"studentName\":[\"test1\"],\"stuPass\":[\"201723134\"],\"studentSex\":[\"男\"],\"studentNo\":[\"201723134\"]}', NULL, 1, '学号已经存在', '2024-05-17 08:19:58', 74);
INSERT INTO `sys_oper_log` VALUES (139, '学生信息管理', 1, 'com.ruoyi.web.controller.student.TStudentController.addSave()', 'POST', 1, 'admin', '研发部门', '/student/student/add', '127.0.0.1', '内网IP', '{\"studentName\":[\"\"],\"stuPass\":[\"\"],\"studentSex\":[\"男\"],\"studentNo\":[\"\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'student_no\' doesn\'t have a default value\r\n### The error may exist in file [F:\\code\\RuoYi-v4.7.8\\RuoYi-v4.7.8\\ruoyi-student\\target\\classes\\mapper\\student\\TStudentMapper.xml]\r\n### The error may involve com.ruoyi.student.mapper.TStudentMapper.insertTStudent-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_student          ( student_name,             student_sex,             stu_pass )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'student_no\' doesn\'t have a default value\n; Field \'student_no\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'student_no\' doesn\'t have a default value', '2024-05-17 08:20:35', 69);
INSERT INTO `sys_oper_log` VALUES (140, '学生信息管理', 3, 'com.ruoyi.web.controller.student.TStudentController.remove()', 'POST', 1, 'admin', '研发部门', '/student/student/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"201723145\"]}', NULL, 1, '学生信息管理已经被成绩管理引用，不能删除', '2024-05-17 08:22:46', 6);
INSERT INTO `sys_oper_log` VALUES (141, '学生信息管理', 1, 'com.ruoyi.web.controller.student.TStudentController.addSave()', 'POST', 1, 'admin', '研发部门', '/student/student/add', '127.0.0.1', '内网IP', '{\"studentName\":[\"\"],\"stuPass\":[\"\"],\"studentSex\":[\"男\"],\"studentNo\":[\"\"]}', NULL, 1, '属性不能为空', '2024-05-17 08:24:06', 2);
INSERT INTO `sys_oper_log` VALUES (142, '成绩管理', 1, 'com.ruoyi.web.controller.student.TScoreController.addSave()', 'POST', 1, 'admin', '研发部门', '/student/score/add', '127.0.0.1', '内网IP', '{\"scoreValue\":[\"\"],\"studentId\":[\"\"],\"scoreType\":[\"\"]}', NULL, 1, '属性不能为空', '2024-05-17 08:25:31', 3);
INSERT INTO `sys_oper_log` VALUES (143, '成绩管理', 1, 'com.ruoyi.web.controller.student.TScoreController.addSave()', 'POST', 1, 'admin', '研发部门', '/student/score/add', '127.0.0.1', '内网IP', '{\"scoreValue\":[\"30\"],\"studentId\":[\"201723145\"],\"scoreType\":[\"1\"]}', NULL, 1, '属性不能为空', '2024-05-17 08:25:47', 0);
INSERT INTO `sys_oper_log` VALUES (144, '成绩管理', 1, 'com.ruoyi.web.controller.student.TScoreController.addSave()', 'POST', 1, 'admin', '研发部门', '/student/score/add', '127.0.0.1', '内网IP', '{\"scoreValue\":[\"30\"],\"studentId\":[\"201723145\"],\"scoreType\":[\"1\"]}', NULL, 1, '属性不能为空', '2024-05-17 08:25:49', 1);
INSERT INTO `sys_oper_log` VALUES (145, '成绩管理', 1, 'com.ruoyi.web.controller.student.TScoreController.addSave()', 'POST', 1, 'admin', '研发部门', '/student/score/add', '127.0.0.1', '内网IP', '{\"scoreValue\":[\"100\"],\"studentId\":[\"201723145\"],\"scoreType\":[\"1\"]}', NULL, 1, '当前学生已经有这个类型的成绩', '2024-05-17 08:27:02', 4);
INSERT INTO `sys_oper_log` VALUES (146, '成绩管理', 1, 'com.ruoyi.web.controller.student.TScoreController.addSave()', 'POST', 1, 'admin', '研发部门', '/student/score/add', '127.0.0.1', '内网IP', '{\"scoreValue\":[\"100\"],\"studentId\":[\"201723145\"],\"scoreType\":[\"2\"]}', NULL, 1, '当前学生已经有这个类型的成绩', '2024-05-17 08:27:05', 3);
INSERT INTO `sys_oper_log` VALUES (147, '成绩管理', 1, 'com.ruoyi.web.controller.student.TScoreController.addSave()', 'POST', 1, 'admin', '研发部门', '/student/score/add', '127.0.0.1', '内网IP', '{\"scoreValue\":[\"100\"],\"studentId\":[\"201723145\"],\"scoreType\":[\"3\"]}', NULL, 1, '当前学生已经有这个类型的成绩', '2024-05-17 08:27:18', 3);
INSERT INTO `sys_oper_log` VALUES (148, '成绩管理', 1, 'com.ruoyi.web.controller.student.TScoreController.addSave()', 'POST', 1, 'admin', '研发部门', '/student/score/add', '127.0.0.1', '内网IP', '{\"scoreValue\":[\"30\"],\"studentId\":[\"201723145\"],\"scoreType\":[\"1\"]}', NULL, 1, '当前学生已经有这个类型的成绩', '2024-05-17 08:28:05', 4);
INSERT INTO `sys_oper_log` VALUES (149, '成绩管理', 1, 'com.ruoyi.web.controller.student.TScoreController.addSave()', 'POST', 1, 'admin', '研发部门', '/student/score/add', '127.0.0.1', '内网IP', '{\"scoreValue\":[\"23\"],\"studentId\":[\"201723145\"],\"scoreType\":[\"\"]}', NULL, 1, '当前学生已经有这个类型的成绩', '2024-05-17 08:29:52', 17916);
INSERT INTO `sys_oper_log` VALUES (150, '成绩管理', 1, 'com.ruoyi.web.controller.student.TScoreController.addSave()', 'POST', 1, 'admin', '研发部门', '/student/score/add', '127.0.0.1', '内网IP', '{\"scoreValue\":[\"23\"],\"studentId\":[\"201723145\"],\"scoreType\":[\"1\"]}', NULL, 1, '当前学生已经有这个类型的成绩', '2024-05-17 08:33:35', 6608);
INSERT INTO `sys_oper_log` VALUES (151, '成绩管理', 1, 'com.ruoyi.web.controller.student.TScoreController.addSave()', 'POST', 1, 'admin', '研发部门', '/student/score/add', '127.0.0.1', '内网IP', '{\"scoreValue\":[\"23\"],\"studentId\":[\"201723145\"],\"scoreType\":[\"2\"]}', NULL, 1, '当前学生已经有这个类型的成绩', '2024-05-17 08:34:42', 5121);
INSERT INTO `sys_oper_log` VALUES (152, '成绩管理', 1, 'com.ruoyi.web.controller.student.TScoreController.addSave()', 'POST', 1, 'admin', '研发部门', '/student/score/add', '127.0.0.1', '内网IP', '{\"scoreValue\":[\"23\"],\"studentId\":[\"201723145\"],\"scoreType\":[\"1\"]}', NULL, 1, '当前学生已经有这个类型的成绩', '2024-05-17 08:39:34', 45);
INSERT INTO `sys_oper_log` VALUES (153, '成绩管理', 1, 'com.ruoyi.web.controller.student.TScoreController.addSave()', 'POST', 1, 'admin', '研发部门', '/student/score/add', '127.0.0.1', '内网IP', '{\"scoreValue\":[\"23\"],\"studentId\":[\"201723145\"],\"scoreType\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-17 08:39:37', 11);
INSERT INTO `sys_oper_log` VALUES (154, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"学生总成绩\"],\"url\":[\"/student/score/sum\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-17 09:04:06', 57);
INSERT INTO `sys_oper_log` VALUES (155, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2013\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"学生总成绩\"],\"url\":[\"/student/score/total\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-17 09:04:52', 10);
INSERT INTO `sys_oper_log` VALUES (156, '成绩管理', 3, 'com.ruoyi.web.controller.student.TScoreController.remove()', 'POST', 1, 'admin', '研发部门', '/student/score/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"9\"]}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'list\' not found. Available parameters are [array, arg0]', '2024-05-17 11:25:39', 54);
INSERT INTO `sys_oper_log` VALUES (157, '学生信息管理', 3, 'com.ruoyi.web.controller.student.TStudentController.remove()', 'POST', 1, 'admin', '研发部门', '/student/student/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2017231888\"]}', NULL, 1, '学生信息管理已经被成绩管理引用，不能删除', '2024-05-17 11:30:27', 46);
INSERT INTO `sys_oper_log` VALUES (158, '学生信息管理', 3, 'com.ruoyi.web.controller.student.TStudentController.remove()', 'POST', 1, 'admin', '研发部门', '/student/student/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2017231388\"]}', NULL, 1, '学生信息管理已经被成绩管理引用，不能删除', '2024-05-17 11:30:36', 3);
INSERT INTO `sys_oper_log` VALUES (159, '学生信息管理', 3, 'com.ruoyi.web.controller.student.TStudentController.remove()', 'POST', 1, 'admin', '研发部门', '/student/student/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"201723147\"]}', NULL, 1, '学生信息管理已经被成绩管理引用，不能删除', '2024-05-17 11:30:41', 4);
INSERT INTO `sys_oper_log` VALUES (160, '学生信息管理', 3, 'com.ruoyi.web.controller.student.TStudentController.remove()', 'POST', 1, 'admin', '研发部门', '/student/student/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2017231888\"]}', NULL, 1, '学生信息管理已经被成绩管理引用，不能删除', '2024-05-17 11:30:51', 3);
INSERT INTO `sys_oper_log` VALUES (161, '成绩管理', 3, 'com.ruoyi.web.controller.student.TScoreController.remove()', 'POST', 1, 'admin', '研发部门', '/student/score/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"9\"]}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'list\' not found. Available parameters are [array, arg0]', '2024-05-17 11:30:54', 2);
INSERT INTO `sys_oper_log` VALUES (162, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/t_student', '127.0.0.1', '内网IP', '\"t_student\"', NULL, 0, NULL, '2024-05-17 11:44:48', 216);
INSERT INTO `sys_oper_log` VALUES (163, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/t_student', '127.0.0.1', '内网IP', '\"t_student\"', NULL, 0, NULL, '2024-05-17 11:44:48', 53);
INSERT INTO `sys_oper_log` VALUES (164, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/t_score', '127.0.0.1', '内网IP', '\"t_score\"', NULL, 0, NULL, '2024-05-17 11:45:16', 46);
INSERT INTO `sys_oper_log` VALUES (165, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/t_score', '127.0.0.1', '内网IP', '\"t_score\"', NULL, 0, NULL, '2024-05-17 11:45:16', 60);
INSERT INTO `sys_oper_log` VALUES (166, '学生信息管理', 3, 'com.ruoyi.web.controller.student.TStudentController.remove()', 'POST', 1, 'admin', '研发部门', '/student/student/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"201723145\"]}', NULL, 1, '学生201723145有成绩不能删除', '2024-05-17 12:53:21', 57);
INSERT INTO `sys_oper_log` VALUES (167, '学生信息管理', 1, 'com.ruoyi.web.controller.student.TStudentController.addSave()', 'POST', 1, 'admin', '研发部门', '/student/student/add', '127.0.0.1', '内网IP', '{\"studentName\":[\"sads\"],\"stuPass\":[\"201723145\"],\"studentSex\":[\"男\"],\"studentNo\":[\"201723145\"]}', NULL, 1, '学号201723145已存在', '2024-05-17 12:54:25', 7);
INSERT INTO `sys_oper_log` VALUES (168, '学生信息管理', 1, 'com.ruoyi.web.controller.student.TStudentController.addSave()', 'POST', 1, 'admin', '研发部门', '/student/student/add', '127.0.0.1', '内网IP', '{\"studentName\":[\"sads\"],\"stuPass\":[\"201723145\"],\"studentSex\":[\"男\"],\"studentNo\":[\"2017231451\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-17 12:54:28', 8);
INSERT INTO `sys_oper_log` VALUES (169, '学生信息管理', 3, 'com.ruoyi.web.controller.student.TStudentController.remove()', 'POST', 1, 'admin', '研发部门', '/student/student/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2017231451\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-17 12:54:33', 11);
INSERT INTO `sys_oper_log` VALUES (170, '成绩管理', 1, 'com.ruoyi.web.controller.student.TScoreController.addSave()', 'POST', 1, 'admin', '研发部门', '/student/score/add', '127.0.0.1', '内网IP', '{\"scoreValue\":[\"20\"],\"studentId\":[\"201723145\"],\"scoreType\":[\"1\"]}', NULL, 1, '该类别成绩已存在', '2024-05-17 13:08:19', 50);
INSERT INTO `sys_oper_log` VALUES (171, '成绩管理', 1, 'com.ruoyi.web.controller.student.TScoreController.addSave()', 'POST', 1, 'admin', '研发部门', '/student/score/add', '127.0.0.1', '内网IP', '{\"scoreValue\":[\"20\"],\"studentId\":[\"201723145\"],\"scoreType\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-17 13:08:22', 10);
INSERT INTO `sys_oper_log` VALUES (172, '成绩管理', 5, 'com.ruoyi.web.controller.student.TScoreController.export()', 'POST', 1, 'admin', '研发部门', '/student/score/export', '127.0.0.1', '内网IP', '{\"student.studentName\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"d8e19863-dbbe-4fe8-8d3f-f111c7bf9581_成绩管理数据.xlsx\",\"code\":0}', 0, NULL, '2024-05-17 13:49:32', 616);
INSERT INTO `sys_oper_log` VALUES (173, '成绩管理', 5, 'com.ruoyi.web.controller.student.TScoreController.export()', 'POST', 1, 'admin', '研发部门', '/student/score/export', '127.0.0.1', '内网IP', '{\"student.studentName\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"950cb141-4b4a-4406-90f2-673044f1bd54_成绩管理数据.xlsx\",\"code\":0}', 0, NULL, '2024-05-17 13:54:20', 478);
INSERT INTO `sys_oper_log` VALUES (174, '成绩管理', 5, 'com.ruoyi.web.controller.student.TScoreController.export()', 'POST', 1, 'admin', '研发部门', '/student/score/export', '127.0.0.1', '内网IP', '{\"scoreValue\":[\"\"],\"student.studentName\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"7fcb038e-4a3a-4523-9ff8-7a0aab075e46_成绩管理数据.xlsx\",\"code\":0}', 0, NULL, '2024-05-17 13:56:15', 27);
INSERT INTO `sys_oper_log` VALUES (175, '学生信息管理', 5, 'com.ruoyi.web.controller.student.TStudentController.export()', 'POST', 1, 'admin', '研发部门', '/student/student/export', '127.0.0.1', '内网IP', '{\"studentNo\":[\"\"],\"studentName\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"00d28824-6ea8-4783-af87-b0b01af6f6b1_学生信息管理数据.xlsx\",\"code\":0}', 0, NULL, '2024-05-17 13:56:28', 29);
INSERT INTO `sys_oper_log` VALUES (176, '成绩管理', 5, 'com.ruoyi.web.controller.student.TScoreController.export()', 'POST', 1, 'admin', '研发部门', '/student/score/export', '127.0.0.1', '内网IP', '{\"scoreValue\":[\"\"],\"student.studentName\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"ea879302-74cb-43c5-98cf-8b48c961b372_成绩管理数据.xlsx\",\"code\":0}', 0, NULL, '2024-05-17 14:02:51', 474);
INSERT INTO `sys_oper_log` VALUES (177, '成绩管理', 5, 'com.ruoyi.web.controller.student.TScoreController.export()', 'POST', 1, 'admin', '研发部门', '/student/score/export', '127.0.0.1', '内网IP', '{\"scoreValue\":[\"\"],\"student.studentName\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"a9b01b78-6739-40e6-b5b3-89e1eae7dc44_成绩管理数据.xlsx\",\"code\":0}', 0, NULL, '2024-05-17 14:03:59', 50);
INSERT INTO `sys_oper_log` VALUES (178, '成绩管理', 5, 'com.ruoyi.web.controller.student.TScoreController.export()', 'POST', 1, 'admin', '研发部门', '/student/score/export', '127.0.0.1', '内网IP', '{\"scoreValue\":[\"\"],\"student.studentName\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"7d4ec1a3-f6e2-431f-b289-3aaa28bf32e4_成绩管理数据.xlsx\",\"code\":0}', 0, NULL, '2024-05-17 14:16:27', 471);
INSERT INTO `sys_oper_log` VALUES (179, '成绩管理', 5, 'com.ruoyi.web.controller.student.TScoreController.export()', 'POST', 1, 'admin', '研发部门', '/student/score/export', '127.0.0.1', '内网IP', '{\"student.studentName\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"0df81cce-e21d-4d1d-aaa5-dceb5ec0b313_成绩管理数据.xlsx\",\"code\":0}', 0, NULL, '2024-05-17 14:16:56', 31);
INSERT INTO `sys_oper_log` VALUES (180, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"个人总成绩\"],\"url\":[\"/student/score/usertotal\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-address-book\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-17 14:24:10', 13);
INSERT INTO `sys_oper_log` VALUES (181, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-17 14:34:34', 68);
INSERT INTO `sys_oper_log` VALUES (182, '重置密码', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwdSave()', 'POST', 1, 'admin', '研发部门', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"loginName\":[\"ry\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-17 14:35:33', 11);
INSERT INTO `sys_oper_log` VALUES (183, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-17 14:36:47', 16);
INSERT INTO `sys_oper_log` VALUES (184, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2013\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"学生总成绩\"],\"url\":[\"/student/score/total\"],\"target\":[\"menuItem\"],\"perms\":[\"student:score:total\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-17 14:37:51', 7);
INSERT INTO `sys_oper_log` VALUES (185, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2014\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"个人总成绩\"],\"url\":[\"/student/score/usertotal\"],\"target\":[\"menuItem\"],\"perms\":[\"student:score:usertotal\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-address-book\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-17 14:38:01', 26);
INSERT INTO `sys_oper_log` VALUES (186, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-17 14:38:31', 16);
INSERT INTO `sys_oper_log` VALUES (187, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"4\"],\"configName\":[\"账号自助-是否开启用户注册功能\"],\"configKey\":[\"sys.account.registerUser\"],\"configValue\":[\"true\"],\"configType\":[\"Y\"],\"remark\":[\"是否开启注册用户功能（true开启，false关闭）\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-17 14:49:17', 12);
INSERT INTO `sys_oper_log` VALUES (188, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"4\"],\"configName\":[\"账号自助-是否开启用户注册功能\"],\"configKey\":[\"sys.account.registerUser\"],\"configValue\":[\"false\"],\"configType\":[\"Y\"],\"remark\":[\"是否开启注册用户功能（true开启，false关闭）\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-17 14:51:02', 9);
INSERT INTO `sys_oper_log` VALUES (189, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"学生\"],\"roleKey\":[\"student\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-17 15:14:46', 63);
INSERT INTO `sys_oper_log` VALUES (190, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"学生\"],\"roleKey\":[\"student\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2000,2014\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-17 15:14:57', 21);
INSERT INTO `sys_oper_log` VALUES (191, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'POST', 1, 'admin', '研发部门', '/system/role/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"100\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-17 16:52:21', 83);
INSERT INTO `sys_oper_log` VALUES (192, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-17 16:52:26', 17);
INSERT INTO `sys_oper_log` VALUES (193, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2014\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"个人总成绩\"],\"url\":[\"/student/score/usertotal\"],\"target\":[\"menuItem\"],\"perms\":[\"student:score:usertotal\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-address-book\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-17 16:55:35', 11);
INSERT INTO `sys_oper_log` VALUES (194, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-17 16:55:47', 15);
INSERT INTO `sys_oper_log` VALUES (195, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2014', '127.0.0.1', '内网IP', '2014', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2024-05-17 16:56:13', 9);
INSERT INTO `sys_oper_log` VALUES (196, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-17 16:56:23', 15);
INSERT INTO `sys_oper_log` VALUES (197, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2014', '127.0.0.1', '内网IP', '2014', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-17 16:56:32', 9);
INSERT INTO `sys_oper_log` VALUES (198, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"个人总成绩\"],\"url\":[\"/student/score/usertotal\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-17 16:57:16', 9);
INSERT INTO `sys_oper_log` VALUES (199, '成绩管理', 2, 'com.ruoyi.web.controller.student.TScoreController.editSave()', 'POST', 1, 'admin', '研发部门', '/student/score/edit', '127.0.0.1', '内网IP', '{\"scoreId\":[\"3\"],\"scoreValue\":[\"50\"],\"scoreType\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-17 17:45:27', 53);
INSERT INTO `sys_oper_log` VALUES (200, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"学生\"],\"roleKey\":[\"student\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-18 11:15:17', 83);
INSERT INTO `sys_oper_log` VALUES (201, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'POST', 1, 'admin', '研发部门', '/system/role/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"101\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-18 11:15:47', 23);
INSERT INTO `sys_oper_log` VALUES (202, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"学生\"],\"roleKey\":[\"student\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2000,2015\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-18 11:16:09', 15);
INSERT INTO `sys_oper_log` VALUES (203, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"userName\":[\"student\"],\"deptName\":[\"\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"student\"],\"sex\":[\"0\"],\"role\":[\"102\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"102\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-18 11:28:43', 70);
INSERT INTO `sys_oper_log` VALUES (204, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2015\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-05-18 11:32:39', 67);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-05-16 17:01:56', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-05-16 17:01:56', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2024-05-16 17:01:56', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2024-05-16 17:01:56', 'admin', '2024-05-18 11:32:39', '普通角色');
INSERT INTO `sys_role` VALUES (102, '学生', 'student', 3, '1', '0', '0', 'admin', '2024-05-18 11:16:09', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (2, 2002);
INSERT INTO `sys_role_menu` VALUES (2, 2003);
INSERT INTO `sys_role_menu` VALUES (2, 2004);
INSERT INTO `sys_role_menu` VALUES (2, 2005);
INSERT INTO `sys_role_menu` VALUES (2, 2006);
INSERT INTO `sys_role_menu` VALUES (2, 2007);
INSERT INTO `sys_role_menu` VALUES (2, 2008);
INSERT INTO `sys_role_menu` VALUES (2, 2009);
INSERT INTO `sys_role_menu` VALUES (2, 2010);
INSERT INTO `sys_role_menu` VALUES (2, 2011);
INSERT INTO `sys_role_menu` VALUES (2, 2012);
INSERT INTO `sys_role_menu` VALUES (2, 2013);
INSERT INTO `sys_role_menu` VALUES (2, 2015);
INSERT INTO `sys_role_menu` VALUES (102, 2000);
INSERT INTO `sys_role_menu` VALUES (102, 2015);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2024-05-18 12:29:42', '2024-05-16 17:01:56', 'admin', '2024-05-16 17:01:56', '', '2024-05-18 12:29:41', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '2b0ce0b0bb3d8ecb1c5f9451cb50a357', '82d15d', '0', '0', '127.0.0.1', '2024-05-18 12:29:51', '2024-05-16 17:01:56', 'admin', '2024-05-16 17:01:56', '', '2024-05-18 12:29:50', '测试员');
INSERT INTO `sys_user` VALUES (100, NULL, 'student', 'student', '00', '', '', '0', '', 'b1f46bebe49cfb209f5a5d1ebfdc086e', 'b63813', '0', '0', '127.0.0.1', '2024-05-18 11:41:46', NULL, 'admin', '2024-05-18 11:28:43', '', '2024-05-18 11:41:46', NULL);

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('6029043d-7807-45b9-ad13-8abd392ca216', '黄梦歌', NULL, '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', 'on_line', '2024-05-18 15:16:10', '2024-05-18 15:16:16', 1800000);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (100, 102);

-- ----------------------------
-- Table structure for t_score
-- ----------------------------
DROP TABLE IF EXISTS `t_score`;
CREATE TABLE `t_score`  (
  `score_id` int NOT NULL AUTO_INCREMENT,
  `score_value` int NULL DEFAULT NULL COMMENT '成绩值',
  `score_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '成绩类别1习题 2测验 3考试',
  `student_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`score_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学生成绩表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_score
-- ----------------------------
INSERT INTO `t_score` VALUES (3, 50, '2', 201723132);
INSERT INTO `t_score` VALUES (4, 88, '2', 201723135);
INSERT INTO `t_score` VALUES (5, 100, '1', 201723131);
INSERT INTO `t_score` VALUES (6, 100, '3', 201723131);
INSERT INTO `t_score` VALUES (7, 100, '1', 201723143);
INSERT INTO `t_score` VALUES (8, 20, '1', 201723145);
INSERT INTO `t_score` VALUES (9, 23, '2', 201723145);
INSERT INTO `t_score` VALUES (10, 20, '3', 201723145);

-- ----------------------------
-- Table structure for t_student
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student`  (
  `student_no` int NOT NULL COMMENT '学号',
  `student_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `student_sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `stu_pass` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除状态',
  PRIMARY KEY (`student_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student` VALUES (201723131, '黄梦歌', '女', '201723131');
INSERT INTO `t_student` VALUES (201723132, '张三', '男', '201723132');
INSERT INTO `t_student` VALUES (201723133, '李四', '男', '201723133');
INSERT INTO `t_student` VALUES (201723134, '王五', '男', '201723134');
INSERT INTO `t_student` VALUES (201723135, '马六', '女', '201723135');
INSERT INTO `t_student` VALUES (201723136, 'lisa', '女', '201723136');
INSERT INTO `t_student` VALUES (201723137, 'arike', '男', '201723137');
INSERT INTO `t_student` VALUES (201723139, '李思思', '女', '201723139');
INSERT INTO `t_student` VALUES (201723142, '袁华', '男', '201723142');
INSERT INTO `t_student` VALUES (201723145, '都是', '男', '201723145');
INSERT INTO `t_student` VALUES (201723147, 'lisi', '男', '201723147');
INSERT INTO `t_student` VALUES (201723155, '黄三', '男', '201723155');
INSERT INTO `t_student` VALUES (2017231388, '李达', '男', '2017231388');
INSERT INTO `t_student` VALUES (2017231888, '大神', '男', '2017231888');

SET FOREIGN_KEY_CHECKS = 1;

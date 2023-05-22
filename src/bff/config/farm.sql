/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : localhost:3306
 Source Schema         : ry-vue

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 13/05/2023 18:28:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for animal
-- ----------------------------
DROP TABLE IF EXISTS `animal`;
CREATE TABLE `animal`  (
  `animal_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `species` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `growth_stage` tinyint(4) NOT NULL,
  `health_status` tinyint(4) NULL DEFAULT NULL,
  `farm` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `feed_log_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`animal_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of animal
-- ----------------------------

-- ----------------------------
-- Table structure for antibiotic
-- ----------------------------
DROP TABLE IF EXISTS `antibiotic`;
CREATE TABLE `antibiotic`  (
  `antibiotic_id` bigint(20) NOT NULL,
  `antibiotic_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `species` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `growth_stage` tinyint(4) NULL DEFAULT NULL,
  `dose` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`antibiotic_id`) USING BTREE,
  INDEX `sp_gs_index`(`species`, `growth_stage`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of antibiotic
-- ----------------------------

-- ----------------------------
-- Table structure for farm_detail
-- ----------------------------
DROP TABLE IF EXISTS `farm_detail`;
CREATE TABLE `farm_detail`  (
  `farm_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` bigint(20) NULL DEFAULT NULL,
  `temperature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `humidity` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`farm_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of farm_detail
-- ----------------------------

-- ----------------------------
-- Table structure for feed_log
-- ----------------------------
DROP TABLE IF EXISTS `feed_log`;
CREATE TABLE `feed_log`  (
  `feed_log_id` bigint(20) NOT NULL,
  `date` bigint(20) NULL DEFAULT NULL,
  `feed_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `daily_use` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`feed_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of feed_log
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'yz_qclx_chicken', '禽畜鸡管理', NULL, NULL, 'YzQclxChicken', 'crud', 'com.ruoyi.system', 'system', 'chicken', '禽畜鸡管理', 'ruoyi', '0', '/', '{\"parentMenuId\":1061}', 'admin', '2023-04-28 16:35:23', '', '2023-04-28 16:39:28', NULL);
INSERT INTO `gen_table` VALUES (2, 'yz_qclx_cow', '禽畜牛管理', NULL, NULL, 'YzQclxCow', 'crud', 'com.ruoyi.system', 'system', 'cow', '禽畜牛管理', 'ruoyi', '0', '/', '{\"parentMenuId\":1061}', 'admin', '2023-04-28 16:35:23', '', '2023-04-28 16:48:10', NULL);
INSERT INTO `gen_table` VALUES (3, 'yz_qclx_pig', '禽畜猪管理', NULL, NULL, 'YzQclxPig', 'crud', 'com.ruoyi.system', 'system', 'pig', '禽畜猪管理', 'ruoyi', '0', '/', '{\"parentMenuId\":1061}', 'admin', '2023-04-28 16:35:23', '', '2023-04-28 16:50:08', NULL);
INSERT INTO `gen_table` VALUES (4, 'yz_qs_chicken', '鸡禽舍管理', NULL, NULL, 'YzQsChicken', 'crud', 'com.ruoyi.system', 'system', 'qschicken', '鸡禽舍管理', 'ruoyi', '0', '/', '{\"parentMenuId\":\"1065\"}', 'admin', '2023-04-29 16:25:24', '', '2023-04-29 16:59:34', NULL);
INSERT INTO `gen_table` VALUES (5, 'yz_qs_cow', '牛禽舍管理', NULL, NULL, 'YzQsCow', 'crud', 'com.ruoyi.system', 'system', 'qscow', '牛禽舍管理', 'ruoyi', '0', '/', '{\"parentMenuId\":\"1065\"}', 'admin', '2023-04-29 16:25:24', '', '2023-04-29 17:02:37', NULL);
INSERT INTO `gen_table` VALUES (6, 'yz_qs_pig', '猪禽舍管理', NULL, NULL, 'YzQsPig', 'crud', 'com.ruoyi.system', 'system', 'qspig', '猪禽舍管理', 'ruoyi', '0', '/', '{\"parentMenuId\":1065}', 'admin', '2023-04-29 16:25:24', '', '2023-04-29 17:28:11', NULL);
INSERT INTO `gen_table` VALUES (7, 'yz_cksl_chicken', '仓库鸡饲料管理', NULL, NULL, 'YzCkslChicken', 'crud', 'com.ruoyi.system', 'system', 'ckslchicken', '仓库鸡饲料管理', 'ruoyi', '0', '/', '{}', 'admin', '2023-04-29 22:44:16', '', '2023-04-29 22:45:42', NULL);
INSERT INTO `gen_table` VALUES (8, 'yz_cksl_cow', '仓库牛饲料管理', NULL, NULL, 'YzCkslCow', 'crud', 'com.ruoyi.system', 'system', 'ckslcow', '仓库牛饲料管理', 'ruoyi', '0', '/', '{\"parentMenuId\":1069}', 'admin', '2023-04-29 22:44:16', '', '2023-04-29 22:50:11', NULL);
INSERT INTO `gen_table` VALUES (9, 'yz_cksl_pig', '仓库猪饲料管理', NULL, NULL, 'YzCkslPig', 'crud', 'com.ruoyi.system', 'system', 'ckslpig', '仓库猪饲料管理', 'ruoyi', '0', '/', '{\"parentMenuId\":1069}', 'admin', '2023-04-29 22:44:17', '', '2023-04-29 22:50:36', NULL);
INSERT INTO `gen_table` VALUES (10, 'yz_wlw_qszt', '禽舍状态管理', NULL, NULL, 'YzWlwQszt', 'crud', 'com.ruoyi.system', 'system', 'wlwqszt', '禽舍状态管理', 'ruoyi', '0', '/', '{}', 'admin', '2023-04-30 00:15:32', '', '2023-04-30 00:20:14', NULL);
INSERT INTO `gen_table` VALUES (11, 'yz_wlw_sbgl', '设备管理', NULL, NULL, 'YzWlwSbgl', 'crud', 'com.ruoyi.system', 'system', 'wlwsbgl', '设备管理', 'ruoyi', '0', '/', '{}', 'admin', '2023-04-30 00:15:32', '', '2023-04-30 00:26:41', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'id', '主键', 'int(4)', 'Integer', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-04-28 16:35:23', '', '2023-04-28 16:39:28');
INSERT INTO `gen_table_column` VALUES (2, '1', 'chicken_bh', '编号', 'varchar(255)', 'String', 'chickenBh', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-04-28 16:35:23', '', '2023-04-28 16:39:28');
INSERT INTO `gen_table_column` VALUES (3, '1', 'chicken_szzq', '生长周期', 'varchar(255)', 'String', 'chickenSzzq', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-04-28 16:35:23', '', '2023-04-28 16:39:28');
INSERT INTO `gen_table_column` VALUES (4, '1', 'chicken_jkzt', '健康状态', 'varchar(255)', 'String', 'chickenJkzt', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-04-28 16:35:23', '', '2023-04-28 16:39:28');
INSERT INTO `gen_table_column` VALUES (5, '1', 'chicken_cs', '疫苗接种次数', 'varchar(255)', 'String', 'chickenCs', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-04-28 16:35:23', '', '2023-04-28 16:39:28');
INSERT INTO `gen_table_column` VALUES (6, '1', 'chicken_wsl', '喂食量', 'varchar(255)', 'String', 'chickenWsl', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-04-28 16:35:23', '', '2023-04-28 16:39:28');
INSERT INTO `gen_table_column` VALUES (7, '1', 'chicken_ssqs', '所属禽舍', 'varchar(255)', 'String', 'chickenSsqs', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-04-28 16:35:23', '', '2023-04-28 16:39:28');
INSERT INTO `gen_table_column` VALUES (8, '1', 'chicken_sj', '出生时间', 'varchar(255)', 'String', 'chickenSj', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2023-04-28 16:35:23', '', '2023-04-28 16:39:28');
INSERT INTO `gen_table_column` VALUES (9, '2', 'id', '主键', 'int(4)', 'Integer', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-04-28 16:35:23', '', '2023-04-28 16:48:10');
INSERT INTO `gen_table_column` VALUES (10, '2', 'cow_bh', '编号', 'varchar(255)', 'String', 'cowBh', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-04-28 16:35:23', '', '2023-04-28 16:48:10');
INSERT INTO `gen_table_column` VALUES (11, '2', 'cow_szzq', '生长周期', 'varchar(255)', 'String', 'cowSzzq', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-04-28 16:35:23', '', '2023-04-28 16:48:10');
INSERT INTO `gen_table_column` VALUES (12, '2', 'cow_jkzt', '健康状态', 'varchar(255)', 'String', 'cowJkzt', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-04-28 16:35:23', '', '2023-04-28 16:48:10');
INSERT INTO `gen_table_column` VALUES (13, '2', 'cow_cs', '疫苗接种次数', 'varchar(255)', 'String', 'cowCs', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-04-28 16:35:23', '', '2023-04-28 16:48:10');
INSERT INTO `gen_table_column` VALUES (14, '2', 'cow_wsl', '喂食量', 'varchar(255)', 'String', 'cowWsl', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-04-28 16:35:23', '', '2023-04-28 16:48:10');
INSERT INTO `gen_table_column` VALUES (15, '2', 'cow_ssqs', '所属禽舍', 'varchar(255)', 'String', 'cowSsqs', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-04-28 16:35:23', '', '2023-04-28 16:48:10');
INSERT INTO `gen_table_column` VALUES (16, '2', 'cow_sj', '出生时间', 'varchar(255)', 'String', 'cowSj', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2023-04-28 16:35:23', '', '2023-04-28 16:48:10');
INSERT INTO `gen_table_column` VALUES (17, '3', 'id', '主键', 'int(4)', 'Integer', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-04-28 16:35:23', '', '2023-04-28 16:50:08');
INSERT INTO `gen_table_column` VALUES (18, '3', 'pig_bh', '编号', 'varchar(255)', 'String', 'pigBh', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-04-28 16:35:23', '', '2023-04-28 16:50:08');
INSERT INTO `gen_table_column` VALUES (19, '3', 'pig_szzq', '生长周期', 'varchar(255)', 'String', 'pigSzzq', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-04-28 16:35:23', '', '2023-04-28 16:50:08');
INSERT INTO `gen_table_column` VALUES (20, '3', 'pig_jkzt', '健康状态', 'varchar(255)', 'String', 'pigJkzt', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-04-28 16:35:23', '', '2023-04-28 16:50:08');
INSERT INTO `gen_table_column` VALUES (21, '3', 'pig_cs', '疫苗接种次数', 'varchar(255)', 'String', 'pigCs', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-04-28 16:35:23', '', '2023-04-28 16:50:08');
INSERT INTO `gen_table_column` VALUES (22, '3', 'pig_wsl', '喂食量', 'varchar(255)', 'String', 'pigWsl', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-04-28 16:35:23', '', '2023-04-28 16:50:08');
INSERT INTO `gen_table_column` VALUES (23, '3', 'pig_ssqs', '所属禽舍', 'varchar(255)', 'String', 'pigSsqs', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-04-28 16:35:23', '', '2023-04-28 16:50:08');
INSERT INTO `gen_table_column` VALUES (24, '3', 'pig_sj', '出生时间', 'varchar(255)', 'String', 'pigSj', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2023-04-28 16:35:23', '', '2023-04-28 16:50:08');
INSERT INTO `gen_table_column` VALUES (25, '4', 'id', NULL, 'int(4)', 'Integer', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-04-29 16:25:24', '', '2023-04-29 16:59:34');
INSERT INTO `gen_table_column` VALUES (26, '4', 'chicken_name', '鸡禽舍名称', 'varchar(255)', 'String', 'chickenName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-04-29 16:25:24', '', '2023-04-29 16:59:34');
INSERT INTO `gen_table_column` VALUES (27, '4', 'chicken_bh', '鸡禽舍编号', 'varchar(255)', 'String', 'chickenBh', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-04-29 16:25:24', '', '2023-04-29 16:59:34');
INSERT INTO `gen_table_column` VALUES (28, '4', 'chicken_size', '鸡禽舍规模', 'varchar(255)', 'String', 'chickenSize', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-04-29 16:25:24', '', '2023-04-29 16:59:34');
INSERT INTO `gen_table_column` VALUES (29, '4', 'chicken_maxnumber', '鸡禽舍最大存量', 'varchar(255)', 'String', 'chickenMaxnumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-04-29 16:25:24', '', '2023-04-29 16:59:34');
INSERT INTO `gen_table_column` VALUES (30, '4', 'chicken_jkzt', '鸡禽舍是否健康', 'varchar(255)', 'String', 'chickenJkzt', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-04-29 16:25:24', '', '2023-04-29 16:59:34');
INSERT INTO `gen_table_column` VALUES (31, '5', 'id', NULL, 'int(4)', 'Integer', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-04-29 16:25:24', '', '2023-04-29 17:02:37');
INSERT INTO `gen_table_column` VALUES (32, '5', 'cow_name', '牛禽舍名称', 'varchar(255)', 'String', 'cowName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-04-29 16:25:24', '', '2023-04-29 17:02:37');
INSERT INTO `gen_table_column` VALUES (33, '5', 'cow_bh', '牛禽舍编号', 'varchar(255)', 'String', 'cowBh', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-04-29 16:25:24', '', '2023-04-29 17:02:37');
INSERT INTO `gen_table_column` VALUES (34, '5', 'cow_size', '牛禽舍规模', 'varchar(255)', 'String', 'cowSize', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-04-29 16:25:24', '', '2023-04-29 17:02:37');
INSERT INTO `gen_table_column` VALUES (35, '5', 'cow_maxnumber', '牛禽舍最大存量', 'varchar(255)', 'String', 'cowMaxnumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-04-29 16:25:24', '', '2023-04-29 17:02:37');
INSERT INTO `gen_table_column` VALUES (36, '5', 'cow_jkzt', '牛禽舍是否健康', 'varchar(255)', 'String', 'cowJkzt', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-04-29 16:25:24', '', '2023-04-29 17:02:37');
INSERT INTO `gen_table_column` VALUES (37, '6', 'id', NULL, 'int(4)', 'Integer', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-04-29 16:25:24', '', '2023-04-29 17:28:11');
INSERT INTO `gen_table_column` VALUES (38, '6', 'pig_name', '猪禽舍名称', 'varchar(255)', 'String', 'pigName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-04-29 16:25:24', '', '2023-04-29 17:28:11');
INSERT INTO `gen_table_column` VALUES (39, '6', 'pig_bh', '猪禽舍编号', 'varchar(255)', 'String', 'pigBh', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-04-29 16:25:24', '', '2023-04-29 17:28:11');
INSERT INTO `gen_table_column` VALUES (40, '6', 'pig_size', '猪禽舍规模', 'varchar(255)', 'String', 'pigSize', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-04-29 16:25:24', '', '2023-04-29 17:28:11');
INSERT INTO `gen_table_column` VALUES (41, '6', 'pig_maxnumber', '猪禽舍最大存量', 'varchar(255)', 'String', 'pigMaxnumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-04-29 16:25:24', '', '2023-04-29 17:28:11');
INSERT INTO `gen_table_column` VALUES (42, '6', 'pig_jkzt', '猪禽舍是否健康', 'varchar(255)', 'String', 'pigJkzt', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-04-29 16:25:24', '', '2023-04-29 17:28:11');
INSERT INTO `gen_table_column` VALUES (43, '7', 'id', '主键', 'int(4)', 'Integer', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-04-29 22:44:16', '', '2023-04-29 22:45:42');
INSERT INTO `gen_table_column` VALUES (44, '7', 'chicken_slname', '鸡饲料名称', 'varchar(255)', 'String', 'chickenSlname', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-04-29 22:44:16', '', '2023-04-29 22:45:42');
INSERT INTO `gen_table_column` VALUES (45, '7', 'chicken_slbh', '鸡饲料编号', 'varchar(255)', 'String', 'chickenSlbh', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-04-29 22:44:16', '', '2023-04-29 22:45:42');
INSERT INTO `gen_table_column` VALUES (46, '7', 'chicken_sllx', '鸡饲料类型', 'varchar(255)', 'String', 'chickenSllx', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-04-29 22:44:16', '', '2023-04-29 22:45:42');
INSERT INTO `gen_table_column` VALUES (47, '7', 'chicken_number', '鸡饲料数量', 'varchar(255)', 'String', 'chickenNumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-04-29 22:44:16', '', '2023-04-29 22:45:42');
INSERT INTO `gen_table_column` VALUES (48, '7', 'chicken_factory', '鸡饲料厂家', 'varchar(255)', 'String', 'chickenFactory', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-04-29 22:44:16', '', '2023-04-29 22:45:42');
INSERT INTO `gen_table_column` VALUES (49, '7', 'chicken_price', '鸡饲料单价', 'varchar(255)', 'String', 'chickenPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-04-29 22:44:16', '', '2023-04-29 22:45:42');
INSERT INTO `gen_table_column` VALUES (50, '8', 'id', '主键', 'int(4)', 'Integer', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-04-29 22:44:17', '', '2023-04-29 22:50:11');
INSERT INTO `gen_table_column` VALUES (51, '8', 'cow_slname', '牛饲料名称', 'varchar(255)', 'String', 'cowSlname', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-04-29 22:44:17', '', '2023-04-29 22:50:11');
INSERT INTO `gen_table_column` VALUES (52, '8', 'cow_slbh', '牛饲料编号', 'varchar(255)', 'String', 'cowSlbh', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-04-29 22:44:17', '', '2023-04-29 22:50:11');
INSERT INTO `gen_table_column` VALUES (53, '8', 'cow_sllx', '牛饲料类型', 'varchar(255)', 'String', 'cowSllx', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-04-29 22:44:17', '', '2023-04-29 22:50:11');
INSERT INTO `gen_table_column` VALUES (54, '8', 'cow_number', '牛饲料数量', 'varchar(255)', 'String', 'cowNumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-04-29 22:44:17', '', '2023-04-29 22:50:11');
INSERT INTO `gen_table_column` VALUES (55, '8', 'cow_factory', '牛饲料厂家', 'varchar(255)', 'String', 'cowFactory', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-04-29 22:44:17', '', '2023-04-29 22:50:11');
INSERT INTO `gen_table_column` VALUES (56, '8', 'cow_price', '牛饲料单价', 'varchar(255)', 'String', 'cowPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-04-29 22:44:17', '', '2023-04-29 22:50:11');
INSERT INTO `gen_table_column` VALUES (57, '9', 'id', '主键', 'int(4)', 'Integer', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-04-29 22:44:17', '', '2023-04-29 22:50:36');
INSERT INTO `gen_table_column` VALUES (58, '9', 'pig_slname', '猪饲料名称', 'varchar(255)', 'String', 'pigSlname', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-04-29 22:44:17', '', '2023-04-29 22:50:36');
INSERT INTO `gen_table_column` VALUES (59, '9', 'pig_slbh', '猪饲料编号', 'varchar(255)', 'String', 'pigSlbh', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-04-29 22:44:17', '', '2023-04-29 22:50:36');
INSERT INTO `gen_table_column` VALUES (60, '9', 'pign_sllx', '猪饲料类型', 'varchar(255)', 'String', 'pignSllx', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-04-29 22:44:17', '', '2023-04-29 22:50:36');
INSERT INTO `gen_table_column` VALUES (61, '9', 'pig_number', '猪饲料数量', 'varchar(255)', 'String', 'pigNumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-04-29 22:44:17', '', '2023-04-29 22:50:36');
INSERT INTO `gen_table_column` VALUES (62, '9', 'pig_factory', '猪饲料厂家', 'varchar(255)', 'String', 'pigFactory', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-04-29 22:44:17', '', '2023-04-29 22:50:36');
INSERT INTO `gen_table_column` VALUES (63, '9', 'pig_price', '猪饲料单价', 'varchar(255)', 'String', 'pigPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-04-29 22:44:17', '', '2023-04-29 22:50:36');
INSERT INTO `gen_table_column` VALUES (64, '10', 'id', '主键', 'int(4)', 'Integer', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-04-30 00:15:32', '', '2023-04-30 00:20:14');
INSERT INTO `gen_table_column` VALUES (65, '10', 'qszt_qsname', '禽舍名称', 'varchar(255)', 'String', 'qsztQsname', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-04-30 00:15:32', '', '2023-04-30 00:20:14');
INSERT INTO `gen_table_column` VALUES (66, '10', 'qszt_qsbh', '禽舍编号', 'varchar(255)', 'String', 'qsztQsbh', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-04-30 00:15:32', '', '2023-04-30 00:20:14');
INSERT INTO `gen_table_column` VALUES (67, '10', 'qszt_qswd', '禽舍温度', 'varchar(255)', 'String', 'qsztQswd', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-04-30 00:15:32', '', '2023-04-30 00:20:14');
INSERT INTO `gen_table_column` VALUES (68, '10', 'qszt_qssd', '禽舍湿度', 'varchar(255)', 'String', 'qsztQssd', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-04-30 00:15:32', '', '2023-04-30 00:20:14');
INSERT INTO `gen_table_column` VALUES (69, '11', 'id', '主键', 'int(4)', 'Integer', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-04-30 00:15:32', '', '2023-04-30 00:26:41');
INSERT INTO `gen_table_column` VALUES (70, '11', 'sbgl_name', '设备名称', 'varchar(255)', 'String', 'sbglName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-04-30 00:15:32', '', '2023-04-30 00:26:41');
INSERT INTO `gen_table_column` VALUES (71, '11', 'sbgl_bh', '设备编号', 'varchar(255)', 'String', 'sbglBh', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-04-30 00:15:32', '', '2023-04-30 00:26:41');
INSERT INTO `gen_table_column` VALUES (72, '11', 'sbgl_sbzt', '设备状态', 'varchar(255)', 'String', 'sbglSbzt', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-04-30 00:15:32', '', '2023-04-30 00:26:41');
INSERT INTO `gen_table_column` VALUES (73, '11', 'sbgl_place', '所属禽舍', 'varchar(255)', 'String', 'sbglPlace', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-04-30 00:15:32', '', '2023-04-30 00:26:41');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock`  (
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `total` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stock
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-02-02 14:33:47', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-02-02 14:33:47', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-02-02 14:33:47', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2023-02-02 14:33:47', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-02-02 14:33:47', '', NULL, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-02-02 14:33:45', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-02-02 14:33:45', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-02-02 14:33:45', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-02-02 14:33:45', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-02-02 14:33:45', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-02-02 14:33:45', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-02-02 14:33:45', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-02-02 14:33:45', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-02-02 14:33:45', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-02-02 14:33:45', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-02-02 14:33:47', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-02-02 14:33:47', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-02-02 14:33:47', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-02-02 14:33:47', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-02 15:28:47');
INSERT INTO `sys_logininfor` VALUES (2, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-06 20:15:46');
INSERT INTO `sys_logininfor` VALUES (3, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-04-28 16:10:41');
INSERT INTO `sys_logininfor` VALUES (4, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-04-28 17:52:03');
INSERT INTO `sys_logininfor` VALUES (5, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-04-29 16:09:56');
INSERT INTO `sys_logininfor` VALUES (6, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-04-29 22:34:46');
INSERT INTO `sys_logininfor` VALUES (7, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-04-30 00:10:32');
INSERT INTO `sys_logininfor` VALUES (8, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-05-05 21:26:07');
INSERT INTO `sys_logininfor` VALUES (9, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-05 22:27:14');
INSERT INTO `sys_logininfor` VALUES (10, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-06 13:12:01');
INSERT INTO `sys_logininfor` VALUES (11, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-06 15:47:32');
INSERT INTO `sys_logininfor` VALUES (12, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-05-06 15:57:49');
INSERT INTO `sys_logininfor` VALUES (13, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-06 15:57:54');
INSERT INTO `sys_logininfor` VALUES (14, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-06 16:52:13');
INSERT INTO `sys_logininfor` VALUES (15, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-05-07 11:02:47');
INSERT INTO `sys_logininfor` VALUES (16, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2023-05-07 11:05:41');
INSERT INTO `sys_logininfor` VALUES (17, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-07 11:05:45');
INSERT INTO `sys_logininfor` VALUES (18, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-07 12:52:47');
INSERT INTO `sys_logininfor` VALUES (19, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-11 13:06:41');
INSERT INTO `sys_logininfor` VALUES (20, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-11 15:03:55');
INSERT INTO `sys_logininfor` VALUES (21, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-11 16:08:39');
INSERT INTO `sys_logininfor` VALUES (22, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-05-12 12:10:43');
INSERT INTO `sys_logininfor` VALUES (23, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-12 12:10:48');
INSERT INTO `sys_logininfor` VALUES (24, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-12 14:02:41');
INSERT INTO `sys_logininfor` VALUES (25, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-05-12 14:55:25');
INSERT INTO `sys_logininfor` VALUES (26, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-12 14:55:29');
INSERT INTO `sys_logininfor` VALUES (27, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-12 20:02:05');
INSERT INTO `sys_logininfor` VALUES (28, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-05-13 10:11:06');
INSERT INTO `sys_logininfor` VALUES (29, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-05-13 10:11:08');
INSERT INTO `sys_logininfor` VALUES (30, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-13 10:11:14');
INSERT INTO `sys_logininfor` VALUES (31, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-13 10:54:03');
INSERT INTO `sys_logininfor` VALUES (32, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-05-13 11:27:20');
INSERT INTO `sys_logininfor` VALUES (33, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-13 11:27:29');
INSERT INTO `sys_logininfor` VALUES (34, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-05-13 11:48:54');
INSERT INTO `sys_logininfor` VALUES (35, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-13 11:48:58');
INSERT INTO `sys_logininfor` VALUES (36, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-13 12:07:52');
INSERT INTO `sys_logininfor` VALUES (37, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-13 13:57:46');
INSERT INTO `sys_logininfor` VALUES (38, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-13 16:20:47');
INSERT INTO `sys_logininfor` VALUES (39, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-13 18:08:47');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1077 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 7, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-02-02 14:33:46', 'admin', '2023-04-29 16:14:10', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 5, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-02-02 14:33:46', 'admin', '2023-04-29 22:43:52', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 4, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2023-02-02 14:33:46', 'admin', '2023-04-30 00:11:49', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2023-02-02 14:33:46', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-02-02 14:33:46', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-02-02 14:33:46', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-02-02 14:33:46', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-02-02 14:33:46', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-02-02 14:33:46', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-02-02 14:33:46', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-02-02 14:33:46', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-02-02 14:33:46', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-02-02 14:33:46', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-02-02 14:33:46', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-02-02 14:33:46', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2023-02-02 14:33:46', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-02-02 14:33:46', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2023-02-02 14:33:46', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2023-02-02 14:33:46', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-02-02 14:33:46', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-02-02 14:33:46', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-02-02 14:33:46', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-02-02 14:33:46', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-02-02 14:33:46', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-02-02 14:33:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '禽畜类型管理', 0, 0, '/1', NULL, NULL, 1, 0, 'M', '0', '0', NULL, '#', 'admin', '2023-04-28 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1062, '禽畜鸡管理', 1061, 0, '/11', 'system/chicken/index', NULL, 1, 0, 'C', '0', '0', '', '#', 'admin', '2023-04-28 16:44:33', 'admin', '2023-04-28 16:45:21', '');
INSERT INTO `sys_menu` VALUES (1063, '禽畜牛管理', 1061, 1, '/12', 'system/cow/index', NULL, 1, 0, 'C', '0', '0', NULL, '#', 'admin', '2023-04-28 16:54:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1064, '禽畜猪管理', 1061, 2, '/123', 'system/pig/index', NULL, 1, 0, 'C', '0', '0', NULL, '#', 'admin', '2023-04-28 17:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1065, '禽舍管理', 0, 1, '/2', NULL, NULL, 1, 0, 'M', '0', '0', '', '#', 'admin', '2023-04-29 16:11:50', 'admin', '2023-04-29 16:13:42', '');
INSERT INTO `sys_menu` VALUES (1066, '鸡禽舍管理', 1065, 0, '/21', 'system/qschicken/index', NULL, 1, 0, 'C', '0', '0', '', '#', 'admin', '2023-04-29 16:18:29', 'admin', '2023-04-29 17:00:10', '');
INSERT INTO `sys_menu` VALUES (1067, '牛禽舍管理', 1065, 1, '/22', 'system/qscow/index', NULL, 1, 0, 'C', '0', '0', '', '#', 'admin', '2023-04-29 16:21:15', 'admin', '2023-04-29 17:03:46', '');
INSERT INTO `sys_menu` VALUES (1068, '猪禽舍管理', 1065, 2, '/23', 'system/qspig/index', NULL, 1, 0, 'C', '0', '0', '', '#', 'admin', '2023-04-29 16:22:26', 'admin', '2023-04-29 17:21:55', '');
INSERT INTO `sys_menu` VALUES (1069, '仓库饲料管理', 0, 2, '/3', NULL, NULL, 1, 0, 'M', '0', '0', NULL, '#', 'admin', '2023-04-29 22:36:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1070, '仓库鸡饲料管理', 1069, 0, '/3', 'system/ckslchicken/index', NULL, 1, 0, 'C', '0', '0', '', '#', 'admin', '2023-04-29 22:39:54', 'admin', '2023-04-29 22:40:52', '');
INSERT INTO `sys_menu` VALUES (1072, '仓库牛饲料管理', 1069, 1, '/32', 'system/ckslcow/index', NULL, 1, 0, 'C', '0', '0', '', '#', 'admin', '2023-04-29 22:42:32', 'admin', '2023-04-29 22:43:30', '');
INSERT INTO `sys_menu` VALUES (1073, '仓库猪饲料管理', 1069, 2, '/33', 'system/ckslpig/index', NULL, 1, 0, 'C', '0', '0', NULL, '#', 'admin', '2023-04-29 22:43:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1074, '物联网管理', 0, 3, '/4', NULL, NULL, 1, 0, 'M', '0', '0', NULL, '#', 'admin', '2023-04-30 00:11:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1075, '设备管理', 1074, 0, '/41', 'system/wlwsbgl/index', NULL, 1, 0, 'C', '0', '0', '', '#', 'admin', '2023-04-30 00:13:02', 'admin', '2023-04-30 00:26:18', '');
INSERT INTO `sys_menu` VALUES (1076, '禽舍状态管理', 1074, 1, '/42', 'system/wlwqszt/index', NULL, 1, 0, 'C', '0', '0', NULL, '#', 'admin', '2023-04-30 00:14:18', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2023-02-02 14:33:47', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-02-02 14:33:47', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 166 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"yz_qclx_chicken,yz_qclx_pig,yz_qclx_cow\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-28 16:35:23');
INSERT INTO `sys_oper_log` VALUES (2, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"chicken\",\"className\":\"YzQclxChicken\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-28 16:35:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ChickenBh\",\"columnComment\":\"编号\",\"columnId\":2,\"columnName\":\"chicken_bh\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-28 16:35:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"chickenBh\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ChickenSzzq\",\"columnComment\":\"生长周期\",\"columnId\":3,\"columnName\":\"chicken_szzq\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-28 16:35:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"chickenSzzq\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ChickenJkzt\",\"columnComment\":\"健康状态\",\"columnId\":4,\"columnName\":\"chicken_jkzt\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-28 16:35:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"chickenJkzt\",\"javaType\":\"String\",\"list\":t', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-28 16:36:49');
INSERT INTO `sys_oper_log` VALUES (3, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"禽畜类型管理\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"/1\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-28 16:38:42');
INSERT INTO `sys_oper_log` VALUES (4, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"chicken\",\"className\":\"YzQclxChicken\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-28 16:35:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-04-28 16:36:49\",\"usableColumn\":false},{\"capJavaField\":\"ChickenBh\",\"columnComment\":\"编号\",\"columnId\":2,\"columnName\":\"chicken_bh\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-28 16:35:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"chickenBh\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-04-28 16:36:49\",\"usableColumn\":false},{\"capJavaField\":\"ChickenSzzq\",\"columnComment\":\"生长周期\",\"columnId\":3,\"columnName\":\"chicken_szzq\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-28 16:35:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"chickenSzzq\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-04-28 16:36:49\",\"usableColumn\":false},{\"capJavaField\":\"ChickenJkzt\",\"columnComment\":\"健康状态\",\"columnId\":4,\"columnName\":\"chicken_jkzt\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-28 16:35:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-28 16:39:28');
INSERT INTO `sys_oper_log` VALUES (5, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"yz_qclx_chicken\"}', NULL, 0, NULL, '2023-04-28 16:39:40');
INSERT INTO `sys_oper_log` VALUES (6, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"yz_qclx_chicken\"}', NULL, 0, NULL, '2023-04-28 16:39:43');
INSERT INTO `sys_oper_log` VALUES (7, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"/system/chicken/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"禽畜鸡管理\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":1061,\"path\":\"/11\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-28 16:44:33');
INSERT INTO `sys_oper_log` VALUES (8, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/chicken/index\",\"createTime\":\"2023-04-28 16:44:33\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"禽畜鸡管理\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":1061,\"path\":\"/11\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-28 16:45:21');
INSERT INTO `sys_oper_log` VALUES (9, '禽畜鸡管理', 1, 'com.ruoyi.system.controller.YzQclxChickenController.add()', 'POST', 1, 'admin', NULL, '/system/chicken', '127.0.0.1', '内网IP', '{\"chickenBh\":\"1\",\"chickenCs\":\"1\",\"chickenJkzt\":\"1\",\"chickenSj\":\"2023-04-28\",\"chickenSsqs\":\"1\",\"chickenSzzq\":\"1\",\"chickenWsl\":\"1\",\"id\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-28 16:47:24');
INSERT INTO `sys_oper_log` VALUES (10, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"cow\",\"className\":\"YzQclxCow\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":9,\"columnName\":\"id\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-28 16:35:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CowBh\",\"columnComment\":\"编号\",\"columnId\":10,\"columnName\":\"cow_bh\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-28 16:35:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"cowBh\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CowSzzq\",\"columnComment\":\"生长周期\",\"columnId\":11,\"columnName\":\"cow_szzq\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-28 16:35:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"cowSzzq\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CowJkzt\",\"columnComment\":\"健康状态\",\"columnId\":12,\"columnName\":\"cow_jkzt\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-28 16:35:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"cowJkzt\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-28 16:48:10');
INSERT INTO `sys_oper_log` VALUES (11, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"yz_qclx_cow\"}', NULL, 0, NULL, '2023-04-28 16:48:16');
INSERT INTO `sys_oper_log` VALUES (12, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"pig\",\"className\":\"YzQclxPig\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":17,\"columnName\":\"id\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-28 16:35:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PigBh\",\"columnComment\":\"编号\",\"columnId\":18,\"columnName\":\"pig_bh\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-28 16:35:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"pigBh\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PigSzzq\",\"columnComment\":\"生长周期\",\"columnId\":19,\"columnName\":\"pig_szzq\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-28 16:35:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"pigSzzq\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PigJkzt\",\"columnComment\":\"健康状态\",\"columnId\":20,\"columnName\":\"pig_jkzt\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-28 16:35:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"pigJkzt\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-28 16:50:09');
INSERT INTO `sys_oper_log` VALUES (13, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"yz_qclx_pig\"}', NULL, 0, NULL, '2023-04-28 16:50:12');
INSERT INTO `sys_oper_log` VALUES (14, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/cow/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"禽畜牛管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"/12\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-28 16:54:02');
INSERT INTO `sys_oper_log` VALUES (15, '禽畜牛管理', 1, 'com.ruoyi.system.controller.YzQclxCowController.add()', 'POST', 1, 'admin', NULL, '/system/cow', '127.0.0.1', '内网IP', '{\"cowBh\":\"1\",\"cowCs\":\"1\",\"cowJkzt\":\"1\",\"cowSj\":\"2023-04-28\",\"cowSsqs\":\"1\",\"cowSzzq\":\"1\",\"cowWsl\":\"1\",\"id\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-28 16:57:23');
INSERT INTO `sys_oper_log` VALUES (16, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/pig/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"禽畜猪管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1061,\"path\":\"/123\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-28 17:54:20');
INSERT INTO `sys_oper_log` VALUES (17, '禽畜猪管理', 1, 'com.ruoyi.system.controller.YzQclxPigController.add()', 'POST', 1, 'admin', NULL, '/system/pig', '127.0.0.1', '内网IP', '{\"id\":1,\"params\":{},\"pigBh\":\"1\",\"pigCs\":\"1\",\"pigJkzt\":\"1\",\"pigSj\":\"2023-04-28\",\"pigSsqs\":\"1\",\"pigSzzq\":\"1\",\"pigWsl\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-28 17:54:53');
INSERT INTO `sys_oper_log` VALUES (18, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"禽舍管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"/2\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 16:11:50');
INSERT INTO `sys_oper_log` VALUES (19, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-04-29 16:11:50\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1065,\"menuName\":\"禽舍管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"/2\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 16:13:09');
INSERT INTO `sys_oper_log` VALUES (20, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-04-29 16:11:50\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1065,\"menuName\":\"禽舍管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"/2\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 16:13:42');
INSERT INTO `sys_oper_log` VALUES (21, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-02-02 14:33:46\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 16:14:10');
INSERT INTO `sys_oper_log` VALUES (22, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/yz_qs_chicken/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"鸡禽舍管理\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":1065,\"path\":\"/21\",\"query\":\"\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 16:18:29');
INSERT INTO `sys_oper_log` VALUES (23, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/yz_qs_cow/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"牛禽舍管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1065,\"path\":\"/22\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 16:21:15');
INSERT INTO `sys_oper_log` VALUES (24, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/yz_qs_pig/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"猪禽舍管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1065,\"path\":\"/23\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 16:22:26');
INSERT INTO `sys_oper_log` VALUES (25, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"yz_qs_chicken,yz_qs_pig,yz_qs_cow\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 16:25:24');
INSERT INTO `sys_oper_log` VALUES (26, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"cow\",\"className\":\"YzQsCow\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":31,\"columnName\":\"id\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 16:25:24\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CowName\",\"columnComment\":\"牛禽舍名称\",\"columnId\":32,\"columnName\":\"cow_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 16:25:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"cowName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CowBh\",\"columnComment\":\"牛禽舍编号\",\"columnId\":33,\"columnName\":\"cow_bh\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 16:25:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"cowBh\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CowSize\",\"columnComment\":\"牛禽舍规模\",\"columnId\":34,\"columnName\":\"cow_size\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 16:25:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"cowSize\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 16:27:33');
INSERT INTO `sys_oper_log` VALUES (27, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"chicken\",\"className\":\"YzQsChicken\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":25,\"columnName\":\"id\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 16:25:24\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ChickenName\",\"columnComment\":\"鸡禽舍名称\",\"columnId\":26,\"columnName\":\"chicken_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 16:25:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"chickenName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ChickenBh\",\"columnComment\":\"鸡禽舍编号\",\"columnId\":27,\"columnName\":\"chicken_bh\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 16:25:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"chickenBh\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ChickenSize\",\"columnComment\":\"鸡禽舍规模\",\"columnId\":28,\"columnName\":\"chicken_size\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 16:25:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"chickenSize\",\"javaType\":\"String\",\"list\":true,\"params', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 16:29:43');
INSERT INTO `sys_oper_log` VALUES (28, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"pig\",\"className\":\"YzQsPig\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":37,\"columnName\":\"id\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 16:25:24\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PigName\",\"columnComment\":\"猪禽舍名称\",\"columnId\":38,\"columnName\":\"pig_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 16:25:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"pigName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PigBh\",\"columnComment\":\"猪禽舍编号\",\"columnId\":39,\"columnName\":\"pig_bh\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 16:25:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"pigBh\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PigSize\",\"columnComment\":\"猪禽舍规模\",\"columnId\":40,\"columnName\":\"pig_size\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 16:25:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"pigSize\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 16:30:25');
INSERT INTO `sys_oper_log` VALUES (29, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"yz_qs_chicken\"}', NULL, 0, NULL, '2023-04-29 16:34:04');
INSERT INTO `sys_oper_log` VALUES (30, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"qschicken\",\"className\":\"YzQsChicken\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":25,\"columnName\":\"id\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 16:25:24\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-04-29 16:29:43\",\"usableColumn\":false},{\"capJavaField\":\"ChickenName\",\"columnComment\":\"鸡禽舍名称\",\"columnId\":26,\"columnName\":\"chicken_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 16:25:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"chickenName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-04-29 16:29:43\",\"usableColumn\":false},{\"capJavaField\":\"ChickenBh\",\"columnComment\":\"鸡禽舍编号\",\"columnId\":27,\"columnName\":\"chicken_bh\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 16:25:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"chickenBh\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-04-29 16:29:43\",\"usableColumn\":false},{\"capJavaField\":\"ChickenSize\",\"columnComment\":\"鸡禽舍规模\",\"columnId\":28,\"columnName\":\"chicken_size\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 16:25:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 16:59:34');
INSERT INTO `sys_oper_log` VALUES (31, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"yz_qs_chicken\"}', NULL, 0, NULL, '2023-04-29 16:59:41');
INSERT INTO `sys_oper_log` VALUES (32, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"yz_qs_chicken\"}', NULL, 0, NULL, '2023-04-29 16:59:42');
INSERT INTO `sys_oper_log` VALUES (33, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/qschicken/index\",\"createTime\":\"2023-04-29 16:18:29\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1066,\"menuName\":\"鸡禽舍管理\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":1065,\"path\":\"/21\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 17:00:10');
INSERT INTO `sys_oper_log` VALUES (34, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"qscow\",\"className\":\"YzQsCow\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":31,\"columnName\":\"id\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 16:25:24\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2023-04-29 16:27:33\",\"usableColumn\":false},{\"capJavaField\":\"CowName\",\"columnComment\":\"牛禽舍名称\",\"columnId\":32,\"columnName\":\"cow_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 16:25:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"cowName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2023-04-29 16:27:33\",\"usableColumn\":false},{\"capJavaField\":\"CowBh\",\"columnComment\":\"牛禽舍编号\",\"columnId\":33,\"columnName\":\"cow_bh\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 16:25:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"cowBh\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2023-04-29 16:27:33\",\"usableColumn\":false},{\"capJavaField\":\"CowSize\",\"columnComment\":\"牛禽舍规模\",\"columnId\":34,\"columnName\":\"cow_size\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 16:25:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 17:02:37');
INSERT INTO `sys_oper_log` VALUES (35, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/qscow/index\",\"createTime\":\"2023-04-29 16:21:15\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1067,\"menuName\":\"牛禽舍管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1065,\"path\":\"/22\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 17:03:46');
INSERT INTO `sys_oper_log` VALUES (36, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"yz_qs_cow\"}', NULL, 0, NULL, '2023-04-29 17:04:02');
INSERT INTO `sys_oper_log` VALUES (37, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/qspig/index\",\"createTime\":\"2023-04-29 16:22:26\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1068,\"menuName\":\"猪禽舍管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1065,\"path\":\"/23\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 17:07:32');
INSERT INTO `sys_oper_log` VALUES (38, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"qspig\",\"className\":\"YzQsPig\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":37,\"columnName\":\"id\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 16:25:24\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-04-29 16:30:25\",\"usableColumn\":false},{\"capJavaField\":\"PigName\",\"columnComment\":\"猪禽舍名称\",\"columnId\":38,\"columnName\":\"pig_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 16:25:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"pigName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-04-29 16:30:25\",\"usableColumn\":false},{\"capJavaField\":\"PigBh\",\"columnComment\":\"猪禽舍编号\",\"columnId\":39,\"columnName\":\"pig_bh\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 16:25:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"pigBh\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-04-29 16:30:25\",\"usableColumn\":false},{\"capJavaField\":\"PigSize\",\"columnComment\":\"猪禽舍规模\",\"columnId\":40,\"columnName\":\"pig_size\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 16:25:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 17:07:53');
INSERT INTO `sys_oper_log` VALUES (39, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"yz_qs_pig\"}', NULL, 0, NULL, '2023-04-29 17:07:57');
INSERT INTO `sys_oper_log` VALUES (40, '鸡禽舍管理', 1, 'com.ruoyi.system.controller.YzQsChickenController.add()', 'POST', 1, 'admin', NULL, '/system/qschicken', '127.0.0.1', '内网IP', '{\"chickenBh\":\"1\",\"chickenJkzt\":\"是\",\"chickenMaxnumber\":\"100\",\"chickenName\":\"1\",\"chickenSize\":\"25\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\毕业设计\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\system\\YzQsChickenMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.YzQsChickenMapper.insertYzQsChicken-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into yz_qs_chicken          ( chicken_name,             chicken_bh,             chicken_size,             chicken_maxnumber,             chicken_jkzt )           values ( ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2023-04-29 17:10:19');
INSERT INTO `sys_oper_log` VALUES (41, '鸡禽舍管理', 1, 'com.ruoyi.system.controller.YzQsChickenController.add()', 'POST', 1, 'admin', NULL, '/system/qschicken', '127.0.0.1', '内网IP', '{\"chickenBh\":\"1\",\"chickenJkzt\":\"1\",\"chickenMaxnumber\":\"100\",\"chickenName\":\"1\",\"chickenSize\":\"25\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\毕业设计\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\system\\YzQsChickenMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.YzQsChickenMapper.insertYzQsChicken-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into yz_qs_chicken          ( chicken_name,             chicken_bh,             chicken_size,             chicken_maxnumber,             chicken_jkzt )           values ( ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2023-04-29 17:10:37');
INSERT INTO `sys_oper_log` VALUES (42, '鸡禽舍管理', 1, 'com.ruoyi.system.controller.YzQsChickenController.add()', 'POST', 1, 'admin', NULL, '/system/qschicken', '127.0.0.1', '内网IP', '{\"chickenBh\":\"1\",\"chickenJkzt\":\"1\",\"chickenMaxnumber\":\"1\",\"chickenName\":\"1\",\"chickenSize\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 17:15:10');
INSERT INTO `sys_oper_log` VALUES (43, '牛禽舍管理', 1, 'com.ruoyi.system.controller.YzQsCowController.add()', 'POST', 1, 'admin', NULL, '/system/qscow', '127.0.0.1', '内网IP', '{\"cowBh\":\"1\",\"cowJkzt\":\"1\",\"cowMaxnumber\":\"1\",\"cowName\":\"1\",\"cowSize\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 17:15:23');
INSERT INTO `sys_oper_log` VALUES (44, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"qspig\",\"className\":\"YzQsPig\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":37,\"columnName\":\"id\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 16:25:24\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-04-29 17:07:53\",\"usableColumn\":false},{\"capJavaField\":\"PigName\",\"columnComment\":\"猪禽舍名称\",\"columnId\":38,\"columnName\":\"pig_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 16:25:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"pigName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-04-29 17:07:53\",\"usableColumn\":false},{\"capJavaField\":\"PigBh\",\"columnComment\":\"猪禽舍编号\",\"columnId\":39,\"columnName\":\"pig_bh\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 16:25:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"pigBh\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-04-29 17:07:53\",\"usableColumn\":false},{\"capJavaField\":\"PigSize\",\"columnComment\":\"猪禽舍规模\",\"columnId\":40,\"columnName\":\"pig_size\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 16:25:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 17:17:19');
INSERT INTO `sys_oper_log` VALUES (45, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/qspig/index\",\"createTime\":\"2023-04-29 16:22:26\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1068,\"menuName\":\"猪禽舍管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1065,\"path\":\"/23\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 17:21:55');
INSERT INTO `sys_oper_log` VALUES (46, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"qspig\",\"className\":\"YzQsPig\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":37,\"columnName\":\"id\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 16:25:24\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-04-29 17:17:19\",\"usableColumn\":false},{\"capJavaField\":\"PigName\",\"columnComment\":\"猪禽舍名称\",\"columnId\":38,\"columnName\":\"pig_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 16:25:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"pigName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-04-29 17:17:19\",\"usableColumn\":false},{\"capJavaField\":\"PigBh\",\"columnComment\":\"猪禽舍编号\",\"columnId\":39,\"columnName\":\"pig_bh\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 16:25:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"pigBh\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-04-29 17:17:19\",\"usableColumn\":false},{\"capJavaField\":\"PigSize\",\"columnComment\":\"猪禽舍规模\",\"columnId\":40,\"columnName\":\"pig_size\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 16:25:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 17:28:11');
INSERT INTO `sys_oper_log` VALUES (47, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"yz_qs_pig\"}', NULL, 0, NULL, '2023-04-29 17:28:16');
INSERT INTO `sys_oper_log` VALUES (48, '猪禽舍管理', 1, 'com.ruoyi.system.controller.YzQsPigController.add()', 'POST', 1, 'admin', NULL, '/system/qspig', '127.0.0.1', '内网IP', '{\"params\":{},\"pigBh\":\"1\",\"pigJkzt\":\"1\",\"pigMaxnumber\":\"1\",\"pigName\":\"1\",\"pigSize\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 17:29:59');
INSERT INTO `sys_oper_log` VALUES (49, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"仓库饲料管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"/3\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 22:36:50');
INSERT INTO `sys_oper_log` VALUES (50, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/ckslchicken\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"仓库鸡饲料管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1069,\"path\":\"/3\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 22:39:54');
INSERT INTO `sys_oper_log` VALUES (51, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/ckslchicken/index\",\"createTime\":\"2023-04-29 22:39:54\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1070,\"menuName\":\"仓库鸡饲料管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1069,\"path\":\"/3\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 22:40:17');
INSERT INTO `sys_oper_log` VALUES (52, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/ckslchicken/index\",\"createTime\":\"2023-04-29 22:39:54\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1070,\"menuName\":\"仓库鸡饲料管理\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":1069,\"path\":\"/3\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 22:40:52');
INSERT INTO `sys_oper_log` VALUES (53, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/ckslcow/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"仓库牛饲料管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1070,\"path\":\"/32\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 22:41:39');
INSERT INTO `sys_oper_log` VALUES (54, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1071', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 22:41:51');
INSERT INTO `sys_oper_log` VALUES (55, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/ckslchicken/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"仓库牛饲料管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1069,\"path\":\"/32\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 22:42:32');
INSERT INTO `sys_oper_log` VALUES (56, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/ckslpig/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"仓库猪饲料管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1069,\"path\":\"/33\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 22:43:16');
INSERT INTO `sys_oper_log` VALUES (57, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/ckslcow/index\",\"createTime\":\"2023-04-29 22:42:32\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1072,\"menuName\":\"仓库牛饲料管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1069,\"path\":\"/32\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 22:43:30');
INSERT INTO `sys_oper_log` VALUES (58, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-02-02 14:33:46\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 22:43:52');
INSERT INTO `sys_oper_log` VALUES (59, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"yz_cksl_pig,yz_cksl_chicken,yz_cksl_cow\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 22:44:17');
INSERT INTO `sys_oper_log` VALUES (60, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"ckslchicken\",\"className\":\"YzCkslChicken\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":43,\"columnName\":\"id\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 22:44:16\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ChickenSlname\",\"columnComment\":\"鸡饲料名称\",\"columnId\":44,\"columnName\":\"chicken_slname\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 22:44:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"chickenSlname\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ChickenSlbh\",\"columnComment\":\"鸡饲料编号\",\"columnId\":45,\"columnName\":\"chicken_slbh\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 22:44:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"chickenSlbh\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ChickenSllx\",\"columnComment\":\"鸡饲料类型\",\"columnId\":46,\"columnName\":\"chicken_sllx\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 22:44:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"chickenSllx\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 22:45:42');
INSERT INTO `sys_oper_log` VALUES (61, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"yz_cksl_chicken\"}', NULL, 0, NULL, '2023-04-29 22:45:52');
INSERT INTO `sys_oper_log` VALUES (62, '仓库鸡饲料管理', 1, 'com.ruoyi.system.controller.YzCkslChickenController.add()', 'POST', 1, 'admin', NULL, '/system/ckslchicken', '127.0.0.1', '内网IP', '{\"chickenFactory\":\"1\",\"chickenNumber\":\"1\",\"chickenPrice\":\"1\",\"chickenSlbh\":\"1\",\"chickenSllx\":\"1\",\"chickenSlname\":\"1\",\"id\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 22:48:55');
INSERT INTO `sys_oper_log` VALUES (63, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"ckslcow\",\"className\":\"YzCkslCow\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":50,\"columnName\":\"id\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 22:44:17\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CowSlname\",\"columnComment\":\"牛饲料名称\",\"columnId\":51,\"columnName\":\"cow_slname\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 22:44:17\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"cowSlname\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CowSlbh\",\"columnComment\":\"牛饲料编号\",\"columnId\":52,\"columnName\":\"cow_slbh\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 22:44:17\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"cowSlbh\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CowSllx\",\"columnComment\":\"牛饲料类型\",\"columnId\":53,\"columnName\":\"cow_sllx\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 22:44:17\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"cowSllx\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 22:50:11');
INSERT INTO `sys_oper_log` VALUES (64, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"ckslpig\",\"className\":\"YzCkslPig\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":57,\"columnName\":\"id\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 22:44:17\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PigSlname\",\"columnComment\":\"猪饲料名称\",\"columnId\":58,\"columnName\":\"pig_slname\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 22:44:17\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"pigSlname\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PigSlbh\",\"columnComment\":\"猪饲料编号\",\"columnId\":59,\"columnName\":\"pig_slbh\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 22:44:17\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"pigSlbh\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PignSllx\",\"columnComment\":\"猪饲料类型\",\"columnId\":60,\"columnName\":\"pign_sllx\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-29 22:44:17\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"pignSllx\",\"javaType\":\"String\",\"list\":true,\"params\":{', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 22:50:36');
INSERT INTO `sys_oper_log` VALUES (65, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"yz_cksl_cow\"}', NULL, 0, NULL, '2023-04-29 22:50:42');
INSERT INTO `sys_oper_log` VALUES (66, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"yz_cksl_pig\"}', NULL, 0, NULL, '2023-04-29 22:51:41');
INSERT INTO `sys_oper_log` VALUES (67, '仓库牛饲料管理', 1, 'com.ruoyi.system.controller.YzCkslCowController.add()', 'POST', 1, 'admin', NULL, '/system/ckslcow', '127.0.0.1', '内网IP', '{\"cowFactory\":\"1\",\"cowNumber\":\"1\",\"cowPrice\":\"1\",\"cowSlbh\":\"1\",\"cowSllx\":\"1\",\"cowSlname\":\"1\",\"id\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 22:53:18');
INSERT INTO `sys_oper_log` VALUES (68, '仓库猪饲料管理', 1, 'com.ruoyi.system.controller.YzCkslPigController.add()', 'POST', 1, 'admin', NULL, '/system/ckslpig', '127.0.0.1', '内网IP', '{\"id\":1,\"params\":{},\"pigFactory\":\"1\",\"pigNumber\":\"1\",\"pigPrice\":\"1\",\"pigSlbh\":\"1\",\"pigSlname\":\"1\",\"pignSllx\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-29 22:53:29');
INSERT INTO `sys_oper_log` VALUES (69, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"物联网管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"/4\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-30 00:11:33');
INSERT INTO `sys_oper_log` VALUES (70, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-02-02 14:33:46\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-30 00:11:49');
INSERT INTO `sys_oper_log` VALUES (71, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/wlwsbgl/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备管理\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":1074,\"path\":\"/1\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-30 00:13:02');
INSERT INTO `sys_oper_log` VALUES (72, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/wlwqszt/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"禽舍状态管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1074,\"path\":\"/42\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-30 00:14:18');
INSERT INTO `sys_oper_log` VALUES (73, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/wlwsbgl/index\",\"createTime\":\"2023-04-30 00:13:02\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1075,\"menuName\":\"设备管理\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":1074,\"path\":\"/41\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-30 00:14:35');
INSERT INTO `sys_oper_log` VALUES (74, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"yz_wlw_qszt,yz_wlw_sbgl\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-30 00:15:32');
INSERT INTO `sys_oper_log` VALUES (75, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"qszt\",\"className\":\"YzWlwQszt\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":64,\"columnName\":\"id\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-30 00:15:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"QsztQsname\",\"columnComment\":\"禽舍名称\",\"columnId\":65,\"columnName\":\"qszt_qsname\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-30 00:15:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"qsztQsname\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"QsztQsbh\",\"columnComment\":\"禽舍编号\",\"columnId\":66,\"columnName\":\"qszt_qsbh\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-30 00:15:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"qsztQsbh\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"QsztQswd\",\"columnComment\":\"禽舍温度\",\"columnId\":67,\"columnName\":\"qszt_qswd\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-30 00:15:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"qsztQswd\",\"javaType\":\"String\",\"list\":true,\"params', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-30 00:16:28');
INSERT INTO `sys_oper_log` VALUES (76, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"yz_wlw_qszt\"}', NULL, 0, NULL, '2023-04-30 00:16:37');
INSERT INTO `sys_oper_log` VALUES (77, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"wlwqszt\",\"className\":\"YzWlwQszt\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":64,\"columnName\":\"id\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-30 00:15:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2023-04-30 00:16:28\",\"usableColumn\":false},{\"capJavaField\":\"QsztQsname\",\"columnComment\":\"禽舍名称\",\"columnId\":65,\"columnName\":\"qszt_qsname\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-30 00:15:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"qsztQsname\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2023-04-30 00:16:28\",\"usableColumn\":false},{\"capJavaField\":\"QsztQsbh\",\"columnComment\":\"禽舍编号\",\"columnId\":66,\"columnName\":\"qszt_qsbh\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-30 00:15:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"qsztQsbh\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2023-04-30 00:16:28\",\"usableColumn\":false},{\"capJavaField\":\"QsztQswd\",\"columnComment\":\"禽舍温度\",\"columnId\":67,\"columnName\":\"qszt_qswd\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-30 00:15:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInse', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-30 00:20:14');
INSERT INTO `sys_oper_log` VALUES (78, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"yz_wlw_qszt\"}', NULL, 0, NULL, '2023-04-30 00:20:32');
INSERT INTO `sys_oper_log` VALUES (79, '禽舍状态管理', 1, 'com.ruoyi.system.controller.YzWlwQsztController.add()', 'POST', 1, 'admin', NULL, '/system/wlwqszt', '127.0.0.1', '内网IP', '{\"id\":1,\"params\":{},\"qsztQsbh\":\"1\",\"qsztQsname\":\"1\",\"qsztQssd\":\"1\",\"qsztQswd\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-30 00:22:12');
INSERT INTO `sys_oper_log` VALUES (80, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"wlwsbgl\",\"className\":\"YzWlwSbgl\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":69,\"columnName\":\"id\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-30 00:15:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SbglName\",\"columnComment\":\"设备名称\",\"columnId\":70,\"columnName\":\"sbgl_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-30 00:15:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"sbglName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SbglBh\",\"columnComment\":\"设备编号\",\"columnId\":71,\"columnName\":\"sbgl_bh\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-30 00:15:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"sbglBh\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SbglSbzt\",\"columnComment\":\"设备状态\",\"columnId\":72,\"columnName\":\"sbgl_sbzt\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-30 00:15:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"sbglSbzt\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-30 00:23:01');
INSERT INTO `sys_oper_log` VALUES (81, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"yz_wlw_sbgl\"}', NULL, 0, NULL, '2023-04-30 00:23:04');
INSERT INTO `sys_oper_log` VALUES (82, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/wlwsbgl/index\",\"createTime\":\"2023-04-30 00:13:02\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1075,\"menuName\":\"设备管理\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":1074,\"path\":\"/41\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-30 00:26:18');
INSERT INTO `sys_oper_log` VALUES (83, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"wlwsbgl\",\"className\":\"YzWlwSbgl\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":69,\"columnName\":\"id\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-30 00:15:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2023-04-30 00:23:01\",\"usableColumn\":false},{\"capJavaField\":\"SbglName\",\"columnComment\":\"设备名称\",\"columnId\":70,\"columnName\":\"sbgl_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-30 00:15:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"sbglName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2023-04-30 00:23:01\",\"usableColumn\":false},{\"capJavaField\":\"SbglBh\",\"columnComment\":\"设备编号\",\"columnId\":71,\"columnName\":\"sbgl_bh\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-30 00:15:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"sbglBh\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2023-04-30 00:23:01\",\"usableColumn\":false},{\"capJavaField\":\"SbglSbzt\",\"columnComment\":\"设备状态\",\"columnId\":72,\"columnName\":\"sbgl_sbzt\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-30 00:15:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isL', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-30 00:26:41');
INSERT INTO `sys_oper_log` VALUES (84, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"yz_wlw_sbgl\"}', NULL, 0, NULL, '2023-04-30 00:26:51');
INSERT INTO `sys_oper_log` VALUES (85, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"yz_wlw_sbgl\"}', NULL, 0, NULL, '2023-04-30 00:27:00');
INSERT INTO `sys_oper_log` VALUES (86, '设备管理', 1, 'com.ruoyi.system.controller.YzWlwSbglController.add()', 'POST', 1, 'admin', NULL, '/system/wlwsbgl', '127.0.0.1', '内网IP', '{\"id\":1,\"params\":{},\"sbglBh\":\"1\",\"sbglName\":\"1\",\"sbglPlace\":\"1\",\"sbglSbzt\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-30 00:28:07');
INSERT INTO `sys_oper_log` VALUES (87, '禽畜鸡管理', 1, 'com.ruoyi.system.controller.YzQclxChickenController.add()', 'POST', 1, 'admin', NULL, '/system/chicken', '127.0.0.1', '内网IP', '{\"chickenBh\":\"001\",\"chickenCs\":\"2\",\"chickenJkzt\":\"健康\",\"chickenSj\":\"2023-05-02\",\"chickenSsqs\":\"鸡禽舍\",\"chickenSzzq\":\"幼年\",\"chickenWsl\":\"2kg\",\"id\":2,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 13:14:35');
INSERT INTO `sys_oper_log` VALUES (88, '禽畜鸡管理', 3, 'com.ruoyi.system.controller.YzQclxChickenController.remove()', 'DELETE', 1, 'admin', NULL, '/system/chicken/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 13:14:39');
INSERT INTO `sys_oper_log` VALUES (89, '禽畜鸡管理', 1, 'com.ruoyi.system.controller.YzQclxChickenController.add()', 'POST', 1, 'admin', NULL, '/system/chicken', '127.0.0.1', '内网IP', '{\"chickenBh\":\"002\",\"chickenCs\":\"10\",\"chickenJkzt\":\"健康\",\"chickenSj\":\"2023-03-13\",\"chickenSsqs\":\"鸡禽舍\",\"chickenSzzq\":\"成年\",\"chickenWsl\":\"5kg\",\"id\":3,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 13:16:42');
INSERT INTO `sys_oper_log` VALUES (90, '禽畜鸡管理', 1, 'com.ruoyi.system.controller.YzQclxChickenController.add()', 'POST', 1, 'admin', NULL, '/system/chicken', '127.0.0.1', '内网IP', '{\"chickenBh\":\"003\",\"chickenCs\":\"20\",\"chickenJkzt\":\"不健康\",\"chickenSj\":\"2023-02-09\",\"chickenSsqs\":\"鸡禽舍\",\"chickenSzzq\":\"老年\",\"chickenWsl\":\"4kg\",\"id\":4,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 13:20:17');
INSERT INTO `sys_oper_log` VALUES (91, '禽畜鸡管理', 1, 'com.ruoyi.system.controller.YzQclxChickenController.add()', 'POST', 1, 'admin', NULL, '/system/chicken', '127.0.0.1', '内网IP', '{\"chickenBh\":\"004\",\"chickenCs\":\"12\",\"chickenJkzt\":\"健康\",\"chickenSj\":\"2023-03-15\",\"chickenSsqs\":\"鸡禽舍\",\"chickenSzzq\":\"成年\",\"chickenWsl\":\"6kg\",\"id\":5,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 13:21:12');
INSERT INTO `sys_oper_log` VALUES (92, '禽畜鸡管理', 1, 'com.ruoyi.system.controller.YzQclxChickenController.add()', 'POST', 1, 'admin', NULL, '/system/chicken', '127.0.0.1', '内网IP', '{\"chickenBh\":\"005\",\"chickenCs\":\"6\",\"chickenJkzt\":\"健康\",\"chickenSj\":\"2023-05-03\",\"chickenSsqs\":\"鸡禽舍\",\"chickenSzzq\":\"幼年\",\"chickenWsl\":\"2kg\",\"id\":6,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 13:21:51');
INSERT INTO `sys_oper_log` VALUES (93, '禽畜鸡管理', 1, 'com.ruoyi.system.controller.YzQclxChickenController.add()', 'POST', 1, 'admin', NULL, '/system/chicken', '127.0.0.1', '内网IP', '{\"chickenBh\":\"006\",\"chickenCs\":\"18\",\"chickenJkzt\":\"健康\",\"chickenSj\":\"2023-03-07\",\"chickenSsqs\":\"鸡禽舍\",\"chickenSzzq\":\"老年\",\"chickenWsl\":\"4kg\",\"id\":7,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 13:22:27');
INSERT INTO `sys_oper_log` VALUES (94, '禽畜鸡管理', 1, 'com.ruoyi.system.controller.YzQclxChickenController.add()', 'POST', 1, 'admin', NULL, '/system/chicken', '127.0.0.1', '内网IP', '{\"chickenBh\":\"007\",\"chickenCs\":\"16\",\"chickenJkzt\":\"健康\",\"chickenSj\":\"2023-03-07\",\"chickenSsqs\":\"鸡禽舍\",\"chickenSzzq\":\"成年\",\"chickenWsl\":\"5kg\",\"id\":8,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 13:23:36');
INSERT INTO `sys_oper_log` VALUES (95, '禽畜鸡管理', 2, 'com.ruoyi.system.controller.YzQclxChickenController.edit()', 'PUT', 1, 'admin', NULL, '/system/chicken', '127.0.0.1', '内网IP', '{\"chickenBh\":\"006\",\"chickenCs\":\"18\",\"chickenJkzt\":\"健康\",\"chickenSj\":\"2023-02-08\",\"chickenSsqs\":\"鸡禽舍\",\"chickenSzzq\":\"老年\",\"chickenWsl\":\"4kg\",\"id\":7,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 13:23:47');
INSERT INTO `sys_oper_log` VALUES (96, '禽畜鸡管理', 1, 'com.ruoyi.system.controller.YzQclxChickenController.add()', 'POST', 1, 'admin', NULL, '/system/chicken', '127.0.0.1', '内网IP', '{\"chickenBh\":\"008\",\"chickenCs\":\"5\",\"chickenJkzt\":\"不健康\",\"chickenSj\":\"2023-05-04\",\"chickenSsqs\":\"鸡禽舍\",\"chickenSzzq\":\"幼年\",\"chickenWsl\":\"2kg\",\"id\":9,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 13:24:28');
INSERT INTO `sys_oper_log` VALUES (97, '禽畜鸡管理', 1, 'com.ruoyi.system.controller.YzQclxChickenController.add()', 'POST', 1, 'admin', NULL, '/system/chicken', '127.0.0.1', '内网IP', '{\"chickenBh\":\"009\",\"chickenCs\":\"15\",\"chickenJkzt\":\"不健康\",\"chickenSj\":\"2023-03-09\",\"chickenSsqs\":\"鸡禽舍\",\"chickenSzzq\":\"成年\",\"chickenWsl\":\"3kg\",\"id\":10,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 13:25:08');
INSERT INTO `sys_oper_log` VALUES (98, '禽畜鸡管理', 1, 'com.ruoyi.system.controller.YzQclxChickenController.add()', 'POST', 1, 'admin', NULL, '/system/chicken', '127.0.0.1', '内网IP', '{\"chickenBh\":\"010\",\"chickenCs\":\"18\",\"chickenJkzt\":\"不健康\",\"chickenSj\":\"2023-03-02\",\"chickenSsqs\":\"鸡禽舍\",\"chickenSzzq\":\"成年\",\"chickenWsl\":\"3kg\",\"id\":11,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 13:25:47');
INSERT INTO `sys_oper_log` VALUES (99, '禽畜鸡管理', 1, 'com.ruoyi.system.controller.YzQclxChickenController.add()', 'POST', 1, 'admin', NULL, '/system/chicken', '127.0.0.1', '内网IP', '{\"chickenBh\":\"011\",\"chickenCs\":\"5\",\"chickenJkzt\":\"健康\",\"chickenSj\":\"2023-05-02\",\"chickenSsqs\":\"鸡禽舍\",\"chickenSzzq\":\"幼年\",\"chickenWsl\":\"1kg\",\"id\":12,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 13:26:21');
INSERT INTO `sys_oper_log` VALUES (100, '禽畜牛管理', 3, 'com.ruoyi.system.controller.YzQclxCowController.remove()', 'DELETE', 1, 'admin', NULL, '/system/cow/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 13:27:30');
INSERT INTO `sys_oper_log` VALUES (101, '禽畜牛管理', 1, 'com.ruoyi.system.controller.YzQclxCowController.add()', 'POST', 1, 'admin', NULL, '/system/cow', '127.0.0.1', '内网IP', '{\"cowBh\":\"001\",\"cowCs\":\"2\",\"cowJkzt\":\"健康\",\"cowSj\":\"2023-05-05\",\"cowSsqs\":\"牛禽舍\",\"cowSzzq\":\"幼年\",\"cowWsl\":\"8kg\",\"id\":2,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 13:28:49');
INSERT INTO `sys_oper_log` VALUES (102, '禽畜牛管理', 1, 'com.ruoyi.system.controller.YzQclxCowController.add()', 'POST', 1, 'admin', NULL, '/system/cow', '127.0.0.1', '内网IP', '{\"cowBh\":\"002\",\"cowCs\":\"10\",\"cowJkzt\":\"健康\",\"cowSj\":\"2023-01-04\",\"cowSsqs\":\"牛禽舍\",\"cowSzzq\":\"成年\",\"cowWsl\":\"18kg\",\"id\":3,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 13:29:34');
INSERT INTO `sys_oper_log` VALUES (103, '禽畜牛管理', 1, 'com.ruoyi.system.controller.YzQclxCowController.add()', 'POST', 1, 'admin', NULL, '/system/cow', '127.0.0.1', '内网IP', '{\"cowBh\":\"003\",\"cowCs\":\"14\",\"cowJkzt\":\"健康\",\"cowSj\":\"2023-01-05\",\"cowSsqs\":\"牛禽舍\",\"cowSzzq\":\"老年\",\"cowWsl\":\"15kg\",\"id\":4,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 15:50:05');
INSERT INTO `sys_oper_log` VALUES (104, '禽畜牛管理', 1, 'com.ruoyi.system.controller.YzQclxCowController.add()', 'POST', 1, 'admin', NULL, '/system/cow', '127.0.0.1', '内网IP', '{\"cowBh\":\"004\",\"cowCs\":\"3\",\"cowJkzt\":\"健康\",\"cowSj\":\"2023-05-02\",\"cowSsqs\":\"牛禽舍\",\"cowSzzq\":\"幼年\",\"cowWsl\":\"6kg\",\"id\":5,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 15:59:16');
INSERT INTO `sys_oper_log` VALUES (105, '禽畜牛管理', 1, 'com.ruoyi.system.controller.YzQclxCowController.add()', 'POST', 1, 'admin', NULL, '/system/cow', '127.0.0.1', '内网IP', '{\"cowBh\":\"005\",\"cowCs\":\"6\",\"cowJkzt\":\"健康\",\"cowSj\":\"2023-05-01\",\"cowSsqs\":\"牛禽舍\",\"cowSzzq\":\"幼年\",\"cowWsl\":\"9kg\",\"id\":6,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:00:04');
INSERT INTO `sys_oper_log` VALUES (106, '禽畜牛管理', 1, 'com.ruoyi.system.controller.YzQclxCowController.add()', 'POST', 1, 'admin', NULL, '/system/cow', '127.0.0.1', '内网IP', '{\"cowBh\":\"006\",\"cowCs\":\"15\",\"cowJkzt\":\"不健康\",\"cowSj\":\"2023-01-19\",\"cowSsqs\":\"牛禽舍\",\"cowSzzq\":\"老年\",\"cowWsl\":\"12kg\",\"id\":7,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:00:48');
INSERT INTO `sys_oper_log` VALUES (107, '禽畜牛管理', 1, 'com.ruoyi.system.controller.YzQclxCowController.add()', 'POST', 1, 'admin', NULL, '/system/cow', '127.0.0.1', '内网IP', '{\"cowBh\":\"007\",\"cowCs\":\"5\",\"cowJkzt\":\"健康\",\"cowSj\":\"2023-02-09\",\"cowSsqs\":\"牛禽舍\",\"cowSzzq\":\"成年\",\"cowWsl\":\"15kg\",\"id\":8,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:01:39');
INSERT INTO `sys_oper_log` VALUES (108, '禽畜牛管理', 1, 'com.ruoyi.system.controller.YzQclxCowController.add()', 'POST', 1, 'admin', NULL, '/system/cow', '127.0.0.1', '内网IP', '{\"cowBh\":\"008\",\"cowCs\":\"6\",\"cowJkzt\":\"健康\",\"cowSj\":\"2023-01-19\",\"cowSsqs\":\"牛禽舍\",\"cowSzzq\":\"成年\",\"cowWsl\":\"16kg\",\"id\":9,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:02:14');
INSERT INTO `sys_oper_log` VALUES (109, '禽畜牛管理', 1, 'com.ruoyi.system.controller.YzQclxCowController.add()', 'POST', 1, 'admin', NULL, '/system/cow', '127.0.0.1', '内网IP', '{\"cowBh\":\"009\",\"cowCs\":\"8\",\"cowJkzt\":\"健康\",\"cowSj\":\"2023-01-27\",\"cowSsqs\":\"牛禽舍\",\"cowSzzq\":\"成年\",\"cowWsl\":\"17kg\",\"id\":10,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:02:47');
INSERT INTO `sys_oper_log` VALUES (110, '禽畜牛管理', 1, 'com.ruoyi.system.controller.YzQclxCowController.add()', 'POST', 1, 'admin', NULL, '/system/cow', '127.0.0.1', '内网IP', '{\"cowBh\":\"010\",\"cowCs\":\"4\",\"cowJkzt\":\"健康\",\"cowSj\":\"2023-05-03\",\"cowSsqs\":\"牛禽舍\",\"cowSzzq\":\"幼年\",\"cowWsl\":\"12kg\",\"id\":11,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:03:19');
INSERT INTO `sys_oper_log` VALUES (111, '禽畜牛管理', 1, 'com.ruoyi.system.controller.YzQclxCowController.add()', 'POST', 1, 'admin', NULL, '/system/cow', '127.0.0.1', '内网IP', '{\"cowBh\":\"011\",\"cowCs\":\"11\",\"cowJkzt\":\"健康\",\"cowSj\":\"2023-02-16\",\"cowSsqs\":\"牛禽舍\",\"cowSzzq\":\"成年\",\"cowWsl\":\"16kg\",\"id\":12,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:03:52');
INSERT INTO `sys_oper_log` VALUES (112, '禽畜牛管理', 1, 'com.ruoyi.system.controller.YzQclxCowController.add()', 'POST', 1, 'admin', NULL, '/system/cow', '127.0.0.1', '内网IP', '{\"cowBh\":\"012\",\"cowCs\":\"11\",\"cowJkzt\":\"健康\",\"cowSj\":\"2023-02-08\",\"cowSsqs\":\"牛禽舍\",\"cowSzzq\":\"成年\",\"cowWsl\":\"17kg\",\"id\":13,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:04:25');
INSERT INTO `sys_oper_log` VALUES (113, '禽畜猪管理', 3, 'com.ruoyi.system.controller.YzQclxPigController.remove()', 'DELETE', 1, 'admin', NULL, '/system/pig/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:04:57');
INSERT INTO `sys_oper_log` VALUES (114, '禽畜猪管理', 1, 'com.ruoyi.system.controller.YzQclxPigController.add()', 'POST', 1, 'admin', NULL, '/system/pig', '127.0.0.1', '内网IP', '{\"id\":2,\"params\":{},\"pigBh\":\"001\",\"pigCs\":\"4\",\"pigJkzt\":\"健康\",\"pigSj\":\"2023-05-01\",\"pigSsqs\":\"猪禽舍\",\"pigSzzq\":\"幼年\",\"pigWsl\":\"10kg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:05:27');
INSERT INTO `sys_oper_log` VALUES (115, '禽畜猪管理', 1, 'com.ruoyi.system.controller.YzQclxPigController.add()', 'POST', 1, 'admin', NULL, '/system/pig', '127.0.0.1', '内网IP', '{\"id\":3,\"params\":{},\"pigBh\":\"002\",\"pigCs\":\"5\",\"pigJkzt\":\"健康\",\"pigSj\":\"2023-05-03\",\"pigSsqs\":\"猪禽舍\",\"pigSzzq\":\"幼年\",\"pigWsl\":\"8kg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:06:00');
INSERT INTO `sys_oper_log` VALUES (116, '禽畜猪管理', 1, 'com.ruoyi.system.controller.YzQclxPigController.add()', 'POST', 1, 'admin', NULL, '/system/pig', '127.0.0.1', '内网IP', '{\"id\":4,\"params\":{},\"pigBh\":\"003\",\"pigCs\":\"6\",\"pigJkzt\":\"不健康\",\"pigSsqs\":\"猪禽舍\",\"pigSzzq\":\"幼年\",\"pigWsl\":\"8kg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:06:44');
INSERT INTO `sys_oper_log` VALUES (117, '禽畜猪管理', 2, 'com.ruoyi.system.controller.YzQclxPigController.edit()', 'PUT', 1, 'admin', NULL, '/system/pig', '127.0.0.1', '内网IP', '{\"id\":4,\"params\":{},\"pigBh\":\"003\",\"pigCs\":\"6\",\"pigJkzt\":\"不健康\",\"pigSj\":\"2023-05-06\",\"pigSsqs\":\"猪禽舍\",\"pigSzzq\":\"幼年\",\"pigWsl\":\"8kg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:06:49');
INSERT INTO `sys_oper_log` VALUES (118, '禽畜猪管理', 1, 'com.ruoyi.system.controller.YzQclxPigController.add()', 'POST', 1, 'admin', NULL, '/system/pig', '127.0.0.1', '内网IP', '{\"id\":5,\"params\":{},\"pigBh\":\"004\",\"pigCs\":\"11\",\"pigJkzt\":\"健康\",\"pigSj\":\"2023-03-07\",\"pigSsqs\":\"猪禽舍\",\"pigSzzq\":\"成年\",\"pigWsl\":\"14kg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:07:25');
INSERT INTO `sys_oper_log` VALUES (119, '禽畜猪管理', 1, 'com.ruoyi.system.controller.YzQclxPigController.add()', 'POST', 1, 'admin', NULL, '/system/pig', '127.0.0.1', '内网IP', '{\"id\":6,\"params\":{},\"pigBh\":\"005\",\"pigCs\":\"12\",\"pigJkzt\":\"健康\",\"pigSj\":\"2023-03-22\",\"pigSsqs\":\"猪禽舍\",\"pigSzzq\":\"成年\",\"pigWsl\":\"18kg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:07:54');
INSERT INTO `sys_oper_log` VALUES (120, '禽畜猪管理', 1, 'com.ruoyi.system.controller.YzQclxPigController.add()', 'POST', 1, 'admin', NULL, '/system/pig', '127.0.0.1', '内网IP', '{\"id\":7,\"params\":{},\"pigBh\":\"006\",\"pigCs\":\"11\",\"pigJkzt\":\"健康\",\"pigSj\":\"2023-03-08\",\"pigSsqs\":\"猪禽舍\",\"pigSzzq\":\"成年\",\"pigWsl\":\"14kg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:08:31');
INSERT INTO `sys_oper_log` VALUES (121, '禽畜猪管理', 1, 'com.ruoyi.system.controller.YzQclxPigController.add()', 'POST', 1, 'admin', NULL, '/system/pig', '127.0.0.1', '内网IP', '{\"id\":8,\"params\":{},\"pigBh\":\"007\",\"pigCs\":\"12\",\"pigJkzt\":\"健康\",\"pigSj\":\"2023-02-23\",\"pigSsqs\":\"猪禽舍\",\"pigSzzq\":\"成年\",\"pigWsl\":\"18kg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:09:30');
INSERT INTO `sys_oper_log` VALUES (122, '禽畜猪管理', 1, 'com.ruoyi.system.controller.YzQclxPigController.add()', 'POST', 1, 'admin', NULL, '/system/pig', '127.0.0.1', '内网IP', '{\"id\":9,\"params\":{},\"pigBh\":\"008\",\"pigCs\":\"14\",\"pigJkzt\":\"健康\",\"pigSj\":\"2023-01-13\",\"pigSsqs\":\"猪禽舍\",\"pigSzzq\":\"老年\",\"pigWsl\":\"16kg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:10:09');
INSERT INTO `sys_oper_log` VALUES (123, '禽畜猪管理', 1, 'com.ruoyi.system.controller.YzQclxPigController.add()', 'POST', 1, 'admin', NULL, '/system/pig', '127.0.0.1', '内网IP', '{\"id\":10,\"params\":{},\"pigBh\":\"009\",\"pigCs\":\"13\",\"pigJkzt\":\"健康\",\"pigSj\":\"2022-12-29\",\"pigSsqs\":\"猪禽舍\",\"pigSzzq\":\"老年\",\"pigWsl\":\"16kg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:11:03');
INSERT INTO `sys_oper_log` VALUES (124, '禽畜猪管理', 1, 'com.ruoyi.system.controller.YzQclxPigController.add()', 'POST', 1, 'admin', NULL, '/system/pig', '127.0.0.1', '内网IP', '{\"id\":11,\"params\":{},\"pigBh\":\"010\",\"pigCs\":\"10\",\"pigJkzt\":\"不健康\",\"pigSj\":\"2023-02-23\",\"pigSsqs\":\"猪禽舍\",\"pigSzzq\":\"成年\",\"pigWsl\":\"13kg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:11:34');
INSERT INTO `sys_oper_log` VALUES (125, '禽畜猪管理', 1, 'com.ruoyi.system.controller.YzQclxPigController.add()', 'POST', 1, 'admin', NULL, '/system/pig', '127.0.0.1', '内网IP', '{\"id\":12,\"params\":{},\"pigBh\":\"011\",\"pigCs\":\"12\",\"pigJkzt\":\"健康\",\"pigSj\":\"2023-02-14\",\"pigSsqs\":\"猪禽舍\",\"pigSzzq\":\"成年\",\"pigWsl\":\"18kg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:12:23');
INSERT INTO `sys_oper_log` VALUES (126, '禽畜猪管理', 1, 'com.ruoyi.system.controller.YzQclxPigController.add()', 'POST', 1, 'admin', NULL, '/system/pig', '127.0.0.1', '内网IP', '{\"id\":13,\"params\":{},\"pigBh\":\"012\",\"pigCs\":\"3\",\"pigJkzt\":\"幼年\",\"pigSj\":\"2023-05-10\",\"pigSsqs\":\"猪禽舍\",\"pigSzzq\":\"老年\",\"pigWsl\":\"6kg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:12:52');
INSERT INTO `sys_oper_log` VALUES (127, '设备管理', 1, 'com.ruoyi.system.controller.YzWlwSbglController.add()', 'POST', 1, 'admin', NULL, '/system/wlwsbgl', '127.0.0.1', '内网IP', '{\"id\":2,\"params\":{},\"sbglBh\":\"1\",\"sbglName\":\"A\",\"sbglPlace\":\"鸡禽舍\",\"sbglSbzt\":\"开\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:16:49');
INSERT INTO `sys_oper_log` VALUES (128, '设备管理', 2, 'com.ruoyi.system.controller.YzWlwSbglController.edit()', 'PUT', 1, 'admin', NULL, '/system/wlwsbgl', '127.0.0.1', '内网IP', '{\"id\":2,\"params\":{},\"sbglBh\":\"001\",\"sbglName\":\"A\",\"sbglPlace\":\"鸡禽舍\",\"sbglSbzt\":\"开\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:17:17');
INSERT INTO `sys_oper_log` VALUES (129, '设备管理', 3, 'com.ruoyi.system.controller.YzWlwSbglController.remove()', 'DELETE', 1, 'admin', NULL, '/system/wlwsbgl/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:17:23');
INSERT INTO `sys_oper_log` VALUES (130, '设备管理', 1, 'com.ruoyi.system.controller.YzWlwSbglController.add()', 'POST', 1, 'admin', NULL, '/system/wlwsbgl', '127.0.0.1', '内网IP', '{\"id\":3,\"params\":{},\"sbglBh\":\"002\",\"sbglName\":\"B\",\"sbglPlace\":\"鸡禽舍\",\"sbglSbzt\":\"开\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:17:40');
INSERT INTO `sys_oper_log` VALUES (131, '设备管理', 1, 'com.ruoyi.system.controller.YzWlwSbglController.add()', 'POST', 1, 'admin', NULL, '/system/wlwsbgl', '127.0.0.1', '内网IP', '{\"id\":4,\"params\":{},\"sbglBh\":\"003\",\"sbglName\":\"C\",\"sbglPlace\":\"牛禽舍\",\"sbglSbzt\":\"开\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:52:32');
INSERT INTO `sys_oper_log` VALUES (132, '设备管理', 1, 'com.ruoyi.system.controller.YzWlwSbglController.add()', 'POST', 1, 'admin', NULL, '/system/wlwsbgl', '127.0.0.1', '内网IP', '{\"id\":5,\"params\":{},\"sbglBh\":\"004\",\"sbglName\":\"D\",\"sbglPlace\":\"牛禽舍\",\"sbglSbzt\":\"开\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:52:48');
INSERT INTO `sys_oper_log` VALUES (133, '设备管理', 1, 'com.ruoyi.system.controller.YzWlwSbglController.add()', 'POST', 1, 'admin', NULL, '/system/wlwsbgl', '127.0.0.1', '内网IP', '{\"id\":6,\"params\":{},\"sbglBh\":\"005\",\"sbglName\":\"E\",\"sbglPlace\":\"猪禽舍\",\"sbglSbzt\":\"开\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:53:27');
INSERT INTO `sys_oper_log` VALUES (134, '设备管理', 1, 'com.ruoyi.system.controller.YzWlwSbglController.add()', 'POST', 1, 'admin', NULL, '/system/wlwsbgl', '127.0.0.1', '内网IP', '{\"id\":7,\"params\":{},\"sbglBh\":\"006\",\"sbglName\":\"F\",\"sbglPlace\":\"猪禽舍\",\"sbglSbzt\":\"开\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:53:45');
INSERT INTO `sys_oper_log` VALUES (135, '禽舍状态管理', 1, 'com.ruoyi.system.controller.YzWlwQsztController.add()', 'POST', 1, 'admin', NULL, '/system/wlwqszt', '127.0.0.1', '内网IP', '{\"id\":2,\"params\":{},\"qsztQsbh\":\"001\",\"qsztQsname\":\"鸡禽舍\",\"qsztQssd\":\"55%\",\"qsztQswd\":\"22\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:56:08');
INSERT INTO `sys_oper_log` VALUES (136, '禽舍状态管理', 3, 'com.ruoyi.system.controller.YzWlwQsztController.remove()', 'DELETE', 1, 'admin', NULL, '/system/wlwqszt/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:56:12');
INSERT INTO `sys_oper_log` VALUES (137, '禽舍状态管理', 1, 'com.ruoyi.system.controller.YzWlwQsztController.add()', 'POST', 1, 'admin', NULL, '/system/wlwqszt', '127.0.0.1', '内网IP', '{\"id\":3,\"params\":{},\"qsztQsbh\":\"002\",\"qsztQsname\":\"牛禽舍\",\"qsztQssd\":\"70%\",\"qsztQswd\":\"20°\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:58:37');
INSERT INTO `sys_oper_log` VALUES (138, '禽舍状态管理', 2, 'com.ruoyi.system.controller.YzWlwQsztController.edit()', 'PUT', 1, 'admin', NULL, '/system/wlwqszt', '127.0.0.1', '内网IP', '{\"id\":3,\"params\":{},\"qsztQsbh\":\"002\",\"qsztQsname\":\"猪禽舍\",\"qsztQssd\":\"70%\",\"qsztQswd\":\"20°\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:58:51');
INSERT INTO `sys_oper_log` VALUES (139, '禽舍状态管理', 1, 'com.ruoyi.system.controller.YzWlwQsztController.add()', 'POST', 1, 'admin', NULL, '/system/wlwqszt', '127.0.0.1', '内网IP', '{\"id\":4,\"params\":{},\"qsztQsbh\":\"003\",\"qsztQsname\":\"牛禽舍\",\"qsztQssd\":\"60%\",\"qsztQswd\":\"15°\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 17:00:00');
INSERT INTO `sys_oper_log` VALUES (140, '鸡禽舍管理', 2, 'com.ruoyi.system.controller.YzQsChickenController.edit()', 'PUT', 1, 'admin', NULL, '/system/qschicken', '127.0.0.1', '内网IP', '{\"chickenBh\":\"001\",\"chickenJkzt\":\"是\",\"chickenMaxnumber\":\"50\",\"chickenName\":\"鸡\",\"chickenSize\":\"50㎡\",\"id\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 17:01:18');
INSERT INTO `sys_oper_log` VALUES (141, '牛禽舍管理', 1, 'com.ruoyi.system.controller.YzQsCowController.add()', 'POST', 1, 'admin', NULL, '/system/qscow', '127.0.0.1', '内网IP', '{\"cowBh\":\"001\",\"cowJkzt\":\"是\",\"cowMaxnumber\":\"25\",\"cowName\":\"牛\",\"cowSize\":\"100㎡\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 17:02:25');
INSERT INTO `sys_oper_log` VALUES (142, '猪禽舍管理', 1, 'com.ruoyi.system.controller.YzQsPigController.add()', 'POST', 1, 'admin', NULL, '/system/qspig', '127.0.0.1', '内网IP', '{\"params\":{},\"pigBh\":\"001\",\"pigJkzt\":\"是\",\"pigMaxnumber\":\"100\",\"pigName\":\"猪\",\"pigSize\":\"200㎡\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 17:03:06');
INSERT INTO `sys_oper_log` VALUES (143, '仓库鸡饲料管理', 1, 'com.ruoyi.system.controller.YzCkslChickenController.add()', 'POST', 1, 'admin', NULL, '/system/ckslchicken', '127.0.0.1', '内网IP', '{\"chickenFactory\":\"华畜农牧\",\"chickenNumber\":\"100\",\"chickenPrice\":\"18.00元\",\"chickenSlbh\":\"001\",\"chickenSllx\":\"幼年鸡饲料\",\"chickenSlname\":\"华畜\",\"id\":2,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 17:11:35');
INSERT INTO `sys_oper_log` VALUES (144, '仓库鸡饲料管理', 3, 'com.ruoyi.system.controller.YzCkslChickenController.remove()', 'DELETE', 1, 'admin', NULL, '/system/ckslchicken/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 17:11:42');
INSERT INTO `sys_oper_log` VALUES (145, '仓库鸡饲料管理', 1, 'com.ruoyi.system.controller.YzCkslChickenController.add()', 'POST', 1, 'admin', NULL, '/system/ckslchicken', '127.0.0.1', '内网IP', '{\"chickenFactory\":\"半仙贸易\",\"chickenNumber\":\"100\",\"chickenPrice\":\"33.00元\",\"chickenSlbh\":\"002\",\"chickenSllx\":\"成年鸡饲料\",\"chickenSlname\":\"正大饲料\",\"id\":3,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 17:15:00');
INSERT INTO `sys_oper_log` VALUES (146, '仓库牛饲料管理', 1, 'com.ruoyi.system.controller.YzCkslCowController.add()', 'POST', 1, 'admin', NULL, '/system/ckslcow', '127.0.0.1', '内网IP', '{\"cowFactory\":\"英美尔农牧科技有限公司\",\"cowNumber\":\"100\",\"cowPrice\":\"130.00元\",\"cowSlbh\":\"001\",\"cowSllx\":\"幼牛饲料\",\"cowSlname\":\"英美尔\",\"id\":2,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 17:18:45');
INSERT INTO `sys_oper_log` VALUES (147, '仓库牛饲料管理', 1, 'com.ruoyi.system.controller.YzCkslCowController.add()', 'POST', 1, 'admin', NULL, '/system/ckslcow', '127.0.0.1', '内网IP', '{\"cowFactory\":\"北京正亚生物科技有限公司\",\"cowNumber\":\"100\",\"cowPrice\":\"130.00元\",\"cowSlbh\":\"002\",\"cowSllx\":\"成年牛饲料\",\"cowSlname\":\"富立得饲料\",\"id\":3,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 17:20:29');
INSERT INTO `sys_oper_log` VALUES (148, '仓库牛饲料管理', 3, 'com.ruoyi.system.controller.YzCkslCowController.remove()', 'DELETE', 1, 'admin', NULL, '/system/ckslcow/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 17:20:34');
INSERT INTO `sys_oper_log` VALUES (149, '仓库猪饲料管理', 1, 'com.ruoyi.system.controller.YzCkslPigController.add()', 'POST', 1, 'admin', NULL, '/system/ckslpig', '127.0.0.1', '内网IP', '{\"id\":2,\"params\":{},\"pigFactory\":\"康美华饲料科技有限公司\",\"pigNumber\":\"100\",\"pigPrice\":\"120.00元\",\"pigSlbh\":\"001\",\"pigSlname\":\"康美华饲料\",\"pignSllx\":\"成年猪饲料\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 17:22:50');
INSERT INTO `sys_oper_log` VALUES (150, '仓库猪饲料管理', 3, 'com.ruoyi.system.controller.YzCkslPigController.remove()', 'DELETE', 1, 'admin', NULL, '/system/ckslpig/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 17:22:56');
INSERT INTO `sys_oper_log` VALUES (151, '牛禽舍管理', 3, 'com.ruoyi.system.controller.YzQsCowController.remove()', 'DELETE', 1, 'admin', NULL, '/system/qscow/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-07 11:07:22');
INSERT INTO `sys_oper_log` VALUES (152, '猪禽舍管理', 3, 'com.ruoyi.system.controller.YzQsPigController.remove()', 'DELETE', 1, 'admin', NULL, '/system/qspig/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-07 11:07:27');
INSERT INTO `sys_oper_log` VALUES (153, '禽畜鸡管理', 1, 'com.ruoyi.system.controller.YzQclxChickenController.add()', 'POST', 1, 'admin', NULL, '/system/chicken', '127.0.0.1', '内网IP', '{\"chickenBh\":\"11\",\"chickenCs\":\"11\",\"chickenJkzt\":\"222\",\"chickenSj\":\"2023-05-02\",\"chickenSsqs\":\"1\",\"chickenSzzq\":\"11\",\"chickenWsl\":\"22\",\"id\":13,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-11 15:35:38');
INSERT INTO `sys_oper_log` VALUES (154, '设备管理', 2, 'com.ruoyi.system.controller.YzWlwSbglController.edit()', 'PUT', 1, 'admin', NULL, '/system/wlwsbgl', '127.0.0.1', '内网IP', '{\"id\":2,\"params\":{},\"sbglBh\":\"001\",\"sbglName\":\"温度传感器\",\"sbglPlace\":\"鸡禽舍\",\"sbglSbzt\":\"开\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-12 12:12:40');
INSERT INTO `sys_oper_log` VALUES (155, '设备管理', 2, 'com.ruoyi.system.controller.YzWlwSbglController.edit()', 'PUT', 1, 'admin', NULL, '/system/wlwsbgl', '127.0.0.1', '内网IP', '{\"id\":3,\"params\":{},\"sbglBh\":\"002\",\"sbglName\":\"湿度传感器\",\"sbglPlace\":\"鸡禽舍\",\"sbglSbzt\":\"开\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-12 12:12:54');
INSERT INTO `sys_oper_log` VALUES (156, '设备管理', 2, 'com.ruoyi.system.controller.YzWlwSbglController.edit()', 'PUT', 1, 'admin', NULL, '/system/wlwsbgl', '127.0.0.1', '内网IP', '{\"id\":4,\"params\":{},\"sbglBh\":\"003\",\"sbglName\":\"温度传感器\",\"sbglPlace\":\"牛禽舍\",\"sbglSbzt\":\"开\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-12 12:13:03');
INSERT INTO `sys_oper_log` VALUES (157, '设备管理', 2, 'com.ruoyi.system.controller.YzWlwSbglController.edit()', 'PUT', 1, 'admin', NULL, '/system/wlwsbgl', '127.0.0.1', '内网IP', '{\"id\":5,\"params\":{},\"sbglBh\":\"004\",\"sbglName\":\"湿度传感器\",\"sbglPlace\":\"牛禽舍\",\"sbglSbzt\":\"开\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-12 12:13:10');
INSERT INTO `sys_oper_log` VALUES (158, '设备管理', 2, 'com.ruoyi.system.controller.YzWlwSbglController.edit()', 'PUT', 1, 'admin', NULL, '/system/wlwsbgl', '127.0.0.1', '内网IP', '{\"id\":6,\"params\":{},\"sbglBh\":\"005\",\"sbglName\":\"E\",\"sbglPlace\":\"猪禽舍\",\"sbglSbzt\":\"温度传感器\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-12 12:13:20');
INSERT INTO `sys_oper_log` VALUES (159, '设备管理', 2, 'com.ruoyi.system.controller.YzWlwSbglController.edit()', 'PUT', 1, 'admin', NULL, '/system/wlwsbgl', '127.0.0.1', '内网IP', '{\"id\":6,\"params\":{},\"sbglBh\":\"005\",\"sbglName\":\"温度传感器\",\"sbglPlace\":\"猪禽舍\",\"sbglSbzt\":\"开\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-12 12:13:39');
INSERT INTO `sys_oper_log` VALUES (160, '设备管理', 2, 'com.ruoyi.system.controller.YzWlwSbglController.edit()', 'PUT', 1, 'admin', NULL, '/system/wlwsbgl', '127.0.0.1', '内网IP', '{\"id\":7,\"params\":{},\"sbglBh\":\"006\",\"sbglName\":\"湿度传感器\",\"sbglPlace\":\"猪禽舍\",\"sbglSbzt\":\"开\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-12 12:13:47');
INSERT INTO `sys_oper_log` VALUES (161, '禽畜鸡管理', 2, 'com.ruoyi.system.controller.YzQclxChickenController.edit()', 'PUT', 1, 'admin', NULL, '/system/chicken', '127.0.0.1', '内网IP', '{\"chickenBh\":\"002\",\"chickenCs\":\"10\",\"chickenJkzt\":\"健康\",\"chickenSj\":\"2023-03-13\",\"chickenSsqs\":\"鸡禽舍01\",\"chickenSzzq\":\"成年\",\"chickenWsl\":\"5kg\",\"id\":3,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-12 15:01:34');
INSERT INTO `sys_oper_log` VALUES (162, '禽畜鸡管理', 2, 'com.ruoyi.system.controller.YzQclxChickenController.edit()', 'PUT', 1, 'admin', NULL, '/system/chicken', '127.0.0.1', '内网IP', '{\"chickenBh\":\"003\",\"chickenCs\":\"20\",\"chickenJkzt\":\"不健康\",\"chickenSj\":\"2023-02-09\",\"chickenSsqs\":\"02\",\"chickenSzzq\":\"老年\",\"chickenWsl\":\"4kg\",\"id\":4,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-12 15:01:49');
INSERT INTO `sys_oper_log` VALUES (163, '禽畜猪管理', 5, 'com.ruoyi.system.controller.YzQclxPigController.export()', 'POST', 1, 'admin', NULL, '/system/pig/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2023-05-12 15:20:31');
INSERT INTO `sys_oper_log` VALUES (164, '仓库鸡饲料管理', 2, 'com.ruoyi.system.controller.YzCkslChickenController.edit()', 'PUT', 1, 'admin', NULL, '/system/ckslchicken', '127.0.0.1', '内网IP', '{\"chickenFactory\":\"华畜农牧\",\"chickenNumber\":\"622.0\",\"chickenPrice\":\"18.00元\",\"chickenSlbh\":\"001\",\"chickenSllx\":\"幼年鸡饲料\",\"chickenSlname\":\"华畜\",\"id\":2,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-13 16:41:25');
INSERT INTO `sys_oper_log` VALUES (165, '仓库鸡饲料管理', 2, 'com.ruoyi.system.controller.YzCkslChickenController.edit()', 'PUT', 1, 'admin', NULL, '/system/ckslchicken', '127.0.0.1', '内网IP', '{\"chickenFactory\":\"华畜农牧\",\"chickenNumber\":\"899.19\",\"chickenPrice\":\"18.00元\",\"chickenSlbh\":\"001\",\"chickenSllx\":\"幼年鸡饲料\",\"chickenSlname\":\"华畜\",\"id\":2,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-13 16:41:34');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-02-02 14:33:45', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-02-02 14:33:45', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-02-02 14:33:45', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-02-02 14:33:45', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-02-02 14:33:45', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-02-02 14:33:45', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

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
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-05-13 18:08:48', 'admin', '2023-02-02 14:33:45', '', '2023-05-13 18:08:47', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-02-02 14:33:45', 'admin', '2023-02-02 14:33:45', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

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
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

-- ----------------------------
-- Table structure for yz_cksl_chicken
-- ----------------------------
DROP TABLE IF EXISTS `yz_cksl_chicken`;
CREATE TABLE `yz_cksl_chicken`  (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `chicken_slname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '鸡饲料名称',
  `chicken_slbh` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '鸡饲料编号',
  `chicken_sllx` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '鸡饲料类型',
  `chicken_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '鸡饲料数量',
  `chicken_factory` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '鸡饲料厂家',
  `chicken_price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '鸡饲料单价',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '仓库鸡饲料管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yz_cksl_chicken
-- ----------------------------
INSERT INTO `yz_cksl_chicken` VALUES (2, '华畜', '001', '幼年鸡饲料', '96.6', '华畜农牧', '18.00元');
INSERT INTO `yz_cksl_chicken` VALUES (3, '正大饲料', '002', '成年鸡饲料', '309.4', '半仙贸易', '33.00元');

-- ----------------------------
-- Table structure for yz_cksl_cow
-- ----------------------------
DROP TABLE IF EXISTS `yz_cksl_cow`;
CREATE TABLE `yz_cksl_cow`  (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cow_slname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '牛饲料名称',
  `cow_slbh` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '牛饲料编号',
  `cow_sllx` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '牛饲料类型',
  `cow_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '牛饲料数量',
  `cow_factory` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '牛饲料厂家',
  `cow_price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '牛饲料单价',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '仓库牛饲料管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yz_cksl_cow
-- ----------------------------
INSERT INTO `yz_cksl_cow` VALUES (2, '英美尔', '001', '幼牛饲料', '0', '英美尔农牧科技有限公司', '130.00元');
INSERT INTO `yz_cksl_cow` VALUES (3, '富立得饲料', '002', '成年牛饲料', '0', '北京正亚生物科技有限公司', '130.00元');

-- ----------------------------
-- Table structure for yz_cksl_pig
-- ----------------------------
DROP TABLE IF EXISTS `yz_cksl_pig`;
CREATE TABLE `yz_cksl_pig`  (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pig_slname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '猪饲料名称',
  `pig_slbh` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '猪饲料编号',
  `pign_sllx` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '猪饲料类型',
  `pig_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '猪饲料数量',
  `pig_factory` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '猪饲料厂家',
  `pig_price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '猪饲料单价',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '仓库猪饲料管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yz_cksl_pig
-- ----------------------------
INSERT INTO `yz_cksl_pig` VALUES (2, '康美华饲料', '001', '成年猪饲料', '0', '康美华饲料科技有限公司', '120.00元');

-- ----------------------------
-- Table structure for yz_qclx_chicken
-- ----------------------------
DROP TABLE IF EXISTS `yz_qclx_chicken`;
CREATE TABLE `yz_qclx_chicken`  (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `chicken_bh` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `chicken_szzq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生长周期',
  `chicken_jkzt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '健康状态',
  `chicken_cs` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '疫苗接种次数',
  `chicken_wsl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '喂食量',
  `chicken_ssqs` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属禽舍',
  `chicken_sj` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出生时间',
  `sl_id` int(11) NULL DEFAULT NULL COMMENT '饲料编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '禽畜鸡管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yz_qclx_chicken
-- ----------------------------
INSERT INTO `yz_qclx_chicken` VALUES (2, '001', '幼年', '健康', '2', '0.2kg', '鸡禽舍', '2023-05-02', 2);
INSERT INTO `yz_qclx_chicken` VALUES (3, '002', '成年', '健康', '10', '1kg', '鸡禽舍01', '2023-03-13', 2);
INSERT INTO `yz_qclx_chicken` VALUES (4, '003', '老年', '不健康', '20', '1kg', '02', '2023-02-09', 2);
INSERT INTO `yz_qclx_chicken` VALUES (5, '004', '成年', '健康', '12', '1kg', '鸡禽舍', '2023-03-15', 2);
INSERT INTO `yz_qclx_chicken` VALUES (6, '005', '幼年', '健康', '6', '0.2kg', '鸡禽舍', '2023-05-03', 2);
INSERT INTO `yz_qclx_chicken` VALUES (7, '006', '老年', '健康', '18', '1kg', '鸡禽舍', '2023-02-08', 2);
INSERT INTO `yz_qclx_chicken` VALUES (8, '007', '成年', '健康', '16', '1kg', '鸡禽舍', '2023-03-07', 2);
INSERT INTO `yz_qclx_chicken` VALUES (9, '008', '幼年', '不健康', '5', '0.2kg', '鸡禽舍', '2023-05-04', 3);
INSERT INTO `yz_qclx_chicken` VALUES (10, '009', '成年', '不健康', '15', '1kg', '鸡禽舍', '2023-03-09', 3);
INSERT INTO `yz_qclx_chicken` VALUES (11, '010', '成年', '不健康', '18', '1kg', '鸡禽舍', '2023-03-02', 3);
INSERT INTO `yz_qclx_chicken` VALUES (12, '011', '幼年', '健康', '5', '0.2kg', '鸡禽舍', '2023-05-02', 3);
INSERT INTO `yz_qclx_chicken` VALUES (13, '11', '11', '222', '11', '0.2kg', '1', '2023-05-02', 3);

-- ----------------------------
-- Table structure for yz_qclx_cow
-- ----------------------------
DROP TABLE IF EXISTS `yz_qclx_cow`;
CREATE TABLE `yz_qclx_cow`  (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cow_bh` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `cow_szzq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生长周期',
  `cow_jkzt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '健康状态',
  `cow_cs` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '疫苗接种次数',
  `cow_wsl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '喂食量',
  `cow_ssqs` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属禽舍',
  `cow_sj` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出生时间',
  `sl_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '禽畜牛管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yz_qclx_cow
-- ----------------------------
INSERT INTO `yz_qclx_cow` VALUES (2, '001', '幼年', '健康', '2', '2kg', '牛禽舍', '2023-05-05', 2);
INSERT INTO `yz_qclx_cow` VALUES (3, '002', '成年', '健康', '10', '5kg', '牛禽舍', '2023-01-04', 2);
INSERT INTO `yz_qclx_cow` VALUES (4, '003', '老年', '健康', '14', '5kg', '牛禽舍', '2023-01-05', 2);
INSERT INTO `yz_qclx_cow` VALUES (5, '004', '幼年', '健康', '3', '2kg', '牛禽舍', '2023-05-02', 2);
INSERT INTO `yz_qclx_cow` VALUES (6, '005', '幼年', '健康', '6', '2kg', '牛禽舍', '2023-05-01', 2);
INSERT INTO `yz_qclx_cow` VALUES (7, '006', '老年', '不健康', '15', '5kg', '牛禽舍', '2023-01-19', 2);
INSERT INTO `yz_qclx_cow` VALUES (8, '007', '成年', '健康', '5', '2kg', '牛禽舍', '2023-02-09', 2);
INSERT INTO `yz_qclx_cow` VALUES (9, '008', '成年', '健康', '6', '5kg', '牛禽舍', '2023-01-19', 3);
INSERT INTO `yz_qclx_cow` VALUES (10, '009', '成年', '健康', '8', '5kg', '牛禽舍', '2023-01-27', 3);
INSERT INTO `yz_qclx_cow` VALUES (11, '010', '幼年', '健康', '4', '2kg', '牛禽舍', '2023-05-03', 3);
INSERT INTO `yz_qclx_cow` VALUES (12, '011', '成年', '健康', '11', '2kg', '牛禽舍', '2023-02-16', 3);
INSERT INTO `yz_qclx_cow` VALUES (13, '012', '成年', '健康', '11', '2kg', '牛禽舍', '2023-02-08', 3);

-- ----------------------------
-- Table structure for yz_qclx_pig
-- ----------------------------
DROP TABLE IF EXISTS `yz_qclx_pig`;
CREATE TABLE `yz_qclx_pig`  (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pig_bh` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `pig_szzq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生长周期',
  `pig_jkzt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '健康状态',
  `pig_cs` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '疫苗接种次数',
  `pig_wsl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '喂食量',
  `pig_ssqs` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属禽舍',
  `pig_sj` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出生时间',
  `sl_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '禽畜猪管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yz_qclx_pig
-- ----------------------------
INSERT INTO `yz_qclx_pig` VALUES (2, '001', '幼年', '健康', '4', '0kg', '猪禽舍', '2023-05-01', 2);
INSERT INTO `yz_qclx_pig` VALUES (3, '002', '幼年', '健康', '5', '0kg', '猪禽舍', '2023-05-03', 2);
INSERT INTO `yz_qclx_pig` VALUES (4, '003', '幼年', '不健康', '6', '0kg', '猪禽舍', '2023-05-06', 2);
INSERT INTO `yz_qclx_pig` VALUES (5, '004', '成年', '健康', '11', '5kg', '猪禽舍', '2023-03-07', 2);
INSERT INTO `yz_qclx_pig` VALUES (6, '005', '成年', '健康', '12', '5kg', '猪禽舍', '2023-03-22', 2);
INSERT INTO `yz_qclx_pig` VALUES (7, '006', '成年', '健康', '11', '5kg', '猪禽舍', '2023-03-08', 2);
INSERT INTO `yz_qclx_pig` VALUES (8, '007', '成年', '健康', '12', '5kg', '猪禽舍', '2023-02-23', 2);
INSERT INTO `yz_qclx_pig` VALUES (9, '008', '老年', '健康', '14', '3kg', '猪禽舍', '2023-01-13', 2);
INSERT INTO `yz_qclx_pig` VALUES (10, '009', '老年', '健康', '13', '3kg', '猪禽舍', '2022-12-29', 2);
INSERT INTO `yz_qclx_pig` VALUES (11, '010', '成年', '不健康', '10', '5kg', '猪禽舍', '2023-02-23', 2);
INSERT INTO `yz_qclx_pig` VALUES (12, '011', '成年', '健康', '12', '5kg', '猪禽舍', '2023-02-14', 2);
INSERT INTO `yz_qclx_pig` VALUES (13, '012', '老年', '幼年', '3', '0kg', '猪禽舍', '2023-05-10', 2);

-- ----------------------------
-- Table structure for yz_qs_chicken
-- ----------------------------
DROP TABLE IF EXISTS `yz_qs_chicken`;
CREATE TABLE `yz_qs_chicken`  (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `chicken_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '鸡禽舍名称',
  `chicken_bh` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '鸡禽舍编号',
  `chicken_size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '鸡禽舍规模',
  `chicken_maxnumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '鸡禽舍最大存量',
  `chicken_jkzt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '鸡禽舍是否健康',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yz_qs_chicken
-- ----------------------------
INSERT INTO `yz_qs_chicken` VALUES (1, '鸡', '001', '50㎡', '50', '是');

-- ----------------------------
-- Table structure for yz_qs_cow
-- ----------------------------
DROP TABLE IF EXISTS `yz_qs_cow`;
CREATE TABLE `yz_qs_cow`  (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cow_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '牛禽舍名称',
  `cow_bh` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '牛禽舍编号',
  `cow_size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '牛禽舍规模',
  `cow_maxnumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '牛禽舍最大存量',
  `cow_jkzt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '牛禽舍是否健康',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yz_qs_cow
-- ----------------------------
INSERT INTO `yz_qs_cow` VALUES (2, '牛', '001', '100㎡', '25', '是');

-- ----------------------------
-- Table structure for yz_qs_pig
-- ----------------------------
DROP TABLE IF EXISTS `yz_qs_pig`;
CREATE TABLE `yz_qs_pig`  (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pig_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '猪禽舍名称',
  `pig_bh` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '猪禽舍编号',
  `pig_size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '猪禽舍规模',
  `pig_maxnumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '猪禽舍最大存量',
  `pig_jkzt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '猪禽舍是否健康',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yz_qs_pig
-- ----------------------------
INSERT INTO `yz_qs_pig` VALUES (2, '猪', '001', '200㎡', '100', '是');

-- ----------------------------
-- Table structure for yz_wlw_qszt
-- ----------------------------
DROP TABLE IF EXISTS `yz_wlw_qszt`;
CREATE TABLE `yz_wlw_qszt`  (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `qszt_qsname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '禽舍名称',
  `qszt_qsbh` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '禽舍编号',
  `qszt_qswd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '禽舍温度',
  `qszt_qssd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '禽舍湿度',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '禽舍状态管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yz_wlw_qszt
-- ----------------------------
INSERT INTO `yz_wlw_qszt` VALUES (2, '鸡禽舍', '001', '22', '55%');
INSERT INTO `yz_wlw_qszt` VALUES (3, '猪禽舍', '002', '20°', '70%');
INSERT INTO `yz_wlw_qszt` VALUES (4, '牛禽舍', '003', '15°', '60%');

-- ----------------------------
-- Table structure for yz_wlw_sbgl
-- ----------------------------
DROP TABLE IF EXISTS `yz_wlw_sbgl`;
CREATE TABLE `yz_wlw_sbgl`  (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sbgl_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  `sbgl_bh` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备编号',
  `sbgl_sbzt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备状态',
  `sbgl_place` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属禽舍',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yz_wlw_sbgl
-- ----------------------------
INSERT INTO `yz_wlw_sbgl` VALUES (2, '温度传感器', '001', '开', '鸡禽舍');
INSERT INTO `yz_wlw_sbgl` VALUES (3, '湿度传感器', '002', '开', '鸡禽舍');
INSERT INTO `yz_wlw_sbgl` VALUES (4, '温度传感器', '003', '开', '牛禽舍');
INSERT INTO `yz_wlw_sbgl` VALUES (5, '湿度传感器', '004', '开', '牛禽舍');
INSERT INTO `yz_wlw_sbgl` VALUES (6, '温度传感器', '005', '开', '猪禽舍');
INSERT INTO `yz_wlw_sbgl` VALUES (7, '湿度传感器', '006', '开', '猪禽舍');

SET FOREIGN_KEY_CHECKS = 1;

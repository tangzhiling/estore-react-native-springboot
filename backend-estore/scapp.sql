/*
 Navicat Premium Data Transfer

 Source Server         : 47.92.169.73_商城后台接口
 Source Server Type    : MySQL
 Source Server Version : 50650
 Source Host           : 47.92.169.73:3306
 Source Schema         : scapp

 Target Server Type    : MySQL
 Target Server Version : 50650
 File Encoding         : 65001

 Date: 22/11/2023 18:37:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'pro_coupon', '优惠卷表', NULL, NULL, 'ProCoupon', 'crud', 'com.estore.project', 'project', 'procoupon', '优惠卷管理', 'zhang', '0', '/', '{\"parentMenuId\":\"2003\"}', 'admin', '2023-11-03 08:47:59', '', '2023-11-04 11:05:35', NULL);
INSERT INTO `gen_table` VALUES (2, 'pro_order', '订单表', NULL, NULL, 'ProOrder', 'crud', 'com.estore.project', 'project', 'order', '订单管理', 'zhang', '0', '/', '{\"parentMenuId\":2001}', 'admin', '2023-11-03 08:47:59', '', '2023-11-03 08:52:37', NULL);
INSERT INTO `gen_table` VALUES (3, 'pro_product', '商品表', NULL, NULL, 'ProProduct', 'crud', 'com.estore.project', 'project', 'proproduct', '商品管理', 'zhang', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2023-11-03 08:47:59', '', '2023-11-03 08:54:30', NULL);
INSERT INTO `gen_table` VALUES (4, 'pro_events', '活动表', NULL, NULL, 'ProEvents', 'crud', 'com.estore.project', 'project', 'proevents', '活动管理', 'zhang', '0', '/', '{\"parentMenuId\":\"2002\"}', 'admin', '2023-11-03 08:48:08', '', '2023-11-03 18:50:49', NULL);
INSERT INTO `gen_table` VALUES (5, 'pro_classify', '商品分类表', NULL, NULL, 'ProClassify', 'crud', 'com.estore.project', 'project', 'proclassify', '商品分类', 'zhang', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2023-11-03 16:21:58', '', '2023-11-03 18:14:00', NULL);
INSERT INTO `gen_table` VALUES (6, 'sys_user', '用户信息表', NULL, NULL, 'SysUser', 'crud', 'com.estore.project', 'project', 'prouser', '用户信息', 'zhang', '0', '/', '{\"parentMenuId\":2004}', 'admin', '2023-11-03 19:00:19', '', '2023-11-03 19:01:14', NULL);
INSERT INTO `gen_table` VALUES (7, 'pro_log', '日志表', NULL, NULL, 'ProLog', 'crud', 'com.estore.project', 'project', 'prolog', '日志管理', 'zhang', '0', '/', '{\"parentMenuId\":2004}', 'admin', '2023-11-03 19:52:59', '', '2023-11-03 19:53:40', NULL);
INSERT INTO `gen_table` VALUES (8, 'pro_order_child', '订单子集表', NULL, NULL, 'ProOrderChild', 'crud', 'com.estore.project', 'project', 'proorderchild', '订单子集', 'zhang', '0', '/', '{\"parentMenuId\":2001}', 'admin', '2023-11-04 13:28:01', '', '2023-11-04 13:28:38', NULL);
INSERT INTO `gen_table` VALUES (9, 'pro_address', '地址表', NULL, NULL, 'ProAddress', 'crud', 'com.estore.project', 'project', 'proaddress', '地址管理', 'zhang', '0', '/', '{\"parentMenuId\":\"2004\"}', 'admin', '2023-11-07 11:42:18', '', '2023-11-07 17:53:09', NULL);
INSERT INTO `gen_table` VALUES (10, 'pro_shopping', '购物车表', NULL, NULL, 'ProShopping', 'crud', 'com.estore.project', 'project', 'proshopping', '购物车管理', 'zhang', '0', '/', '{\"parentMenuId\":2002}', 'admin', '2023-11-07 11:42:18', '', '2023-11-07 11:58:50', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '归属表编号',
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
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'id', '随机生成的券码序列号', 'varchar(255)', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-11-03 08:47:59', '', '2023-11-04 11:05:35');
INSERT INTO `gen_table_column` VALUES (2, 1, 'user_id', '用户ID', 'int', 'Long', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-11-03 08:47:59', '', '2023-11-04 11:05:35');
INSERT INTO `gen_table_column` VALUES (3, 1, 'status', '使用状态', 'varchar(255)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'pro_coupon_status', 3, 'admin', '2023-11-03 08:47:59', '', '2023-11-04 11:05:35');
INSERT INTO `gen_table_column` VALUES (4, 1, 'type', '1 金额 2比例 固定金额折扣还是倍率折扣', 'varchar(255)', 'String', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'pro_coupon_type', 4, 'admin', '2023-11-03 08:47:59', '', '2023-11-04 11:05:35');
INSERT INTO `gen_table_column` VALUES (5, 1, 'discount', '折扣金额，如果满减和固定金额，则填写数额；如果是倍率折扣则填写小于1的浮点数', 'varchar(255)', 'String', 'discount', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-11-03 08:47:59', '', '2023-11-04 11:05:35');
INSERT INTO `gen_table_column` VALUES (6, 1, 'condition', '需满足价格', 'varchar(255)', 'String', 'condition', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-11-03 08:47:59', '', '2023-11-04 11:05:35');
INSERT INTO `gen_table_column` VALUES (7, 1, 'active_time', '生效时间，如果未达到则不可用', 'datetime', 'Date', 'activeTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2023-11-03 08:47:59', '', '2023-11-04 11:05:35');
INSERT INTO `gen_table_column` VALUES (8, 1, 'expired_time', '过期时间', 'datetime', 'Date', 'expiredTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2023-11-03 08:47:59', '', '2023-11-04 11:05:35');
INSERT INTO `gen_table_column` VALUES (9, 1, 'range', '‘mid’, ‘mid’]用于表明COUPON生效产品', 'varchar(255)', 'String', 'range', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2023-11-03 08:47:59', '', '2023-11-04 11:05:35');
INSERT INTO `gen_table_column` VALUES (10, 2, 'order_id', '订单ID', 'varchar(50)', 'String', 'orderId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-11-03 08:47:59', '', '2023-11-08 11:19:53');
INSERT INTO `gen_table_column` VALUES (11, 2, 'user_id', '用户ID', 'int', 'Long', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-11-03 08:47:59', '', '2023-11-08 11:19:53');
INSERT INTO `gen_table_column` VALUES (12, 2, 'count_price', '订单总金额', 'decimal(10,2)', 'BigDecimal', 'countPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-11-03 08:47:59', '', '2023-11-08 11:19:54');
INSERT INTO `gen_table_column` VALUES (13, 2, 'coupon_price', '优惠卷优惠的金额', 'decimal(10,2)', 'BigDecimal', 'couponPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-11-03 08:47:59', '', '2023-11-08 11:19:54');
INSERT INTO `gen_table_column` VALUES (14, 2, 'events_price', '活动优惠的金额', 'decimal(10,2)', 'BigDecimal', 'eventsPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-11-03 08:47:59', '', '2023-11-08 11:19:54');
INSERT INTO `gen_table_column` VALUES (15, 2, 'create_time', '下单时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2023-11-03 08:47:59', '', '2023-11-08 11:19:54');
INSERT INTO `gen_table_column` VALUES (16, 2, 'status', '订单状态', 'varchar(255)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 9, 'admin', '2023-11-03 08:47:59', '', '2023-11-08 11:19:54');
INSERT INTO `gen_table_column` VALUES (17, 3, 'product_id', '商品id', 'int', 'Long', 'productId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-11-03 08:47:59', '', '2023-11-03 18:34:56');
INSERT INTO `gen_table_column` VALUES (18, 3, 'title', '商品标题', 'varchar(255)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-11-03 08:47:59', '', '2023-11-03 18:34:56');
INSERT INTO `gen_table_column` VALUES (19, 3, 'price', '商品价格', 'decimal(10,2)', 'BigDecimal', 'price', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-11-03 08:47:59', '', '2023-11-03 18:34:56');
INSERT INTO `gen_table_column` VALUES (20, 3, 'image', '封面', 'varchar(255)', 'String', 'image', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'imageUpload', '', 5, 'admin', '2023-11-03 08:47:59', '', '2023-11-03 18:34:56');
INSERT INTO `gen_table_column` VALUES (21, 3, 'image2s', '轮播图', 'varchar(255)', 'String', 'image2s', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-11-03 08:47:59', '', '2023-11-03 18:34:56');
INSERT INTO `gen_table_column` VALUES (22, 3, 'inventory_count', '库存', 'int', 'Long', 'inventoryCount', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-11-03 08:47:59', '', '2023-11-03 18:34:56');
INSERT INTO `gen_table_column` VALUES (23, 3, 'sales_count', '销量', 'int', 'Long', 'salesCount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-11-03 08:47:59', '', '2023-11-03 18:34:56');
INSERT INTO `gen_table_column` VALUES (24, 3, 'create_time', '商品添加事件', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2023-11-03 08:47:59', '', '2023-11-03 18:34:56');
INSERT INTO `gen_table_column` VALUES (25, 3, 'sort', '排序', 'int', 'Long', 'sort', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2023-11-03 08:47:59', '', '2023-11-03 18:34:56');
INSERT INTO `gen_table_column` VALUES (26, 4, 'events_id', '活动ID', 'int', 'Long', 'eventsId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-11-03 08:48:08', '', '2023-11-03 18:50:49');
INSERT INTO `gen_table_column` VALUES (27, 4, 'title', '活动标题', 'varchar(255)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-11-03 08:48:08', '', '2023-11-03 18:50:49');
INSERT INTO `gen_table_column` VALUES (28, 4, 'content', '活动内容', 'varchar(255)', 'String', 'content', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 4, 'admin', '2023-11-03 08:48:08', '', '2023-11-03 18:50:49');
INSERT INTO `gen_table_column` VALUES (29, 4, 'price', '活动金额', 'decimal(10,2)', 'BigDecimal', 'price', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-11-03 08:48:08', '', '2023-11-03 18:50:49');
INSERT INTO `gen_table_column` VALUES (30, 4, 'create_time', '活动创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2023-11-03 08:48:08', '', '2023-11-03 18:50:49');
INSERT INTO `gen_table_column` VALUES (34, 5, 'classify_id', '分类ID', 'int', 'Long', 'classifyId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-11-03 16:21:58', '', '2023-11-03 18:14:00');
INSERT INTO `gen_table_column` VALUES (35, 5, 'name', '分类名称', 'varchar(255)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-11-03 16:21:58', '', '2023-11-03 18:14:00');
INSERT INTO `gen_table_column` VALUES (36, 5, 'sort', '排序', 'int', 'Long', 'sort', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-11-03 16:21:58', '', '2023-11-03 18:14:00');
INSERT INTO `gen_table_column` VALUES (37, 4, 'scale', '打折比例', 'decimal(3,2)', 'BigDecimal', 'scale', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, '', '2023-11-03 16:26:03', '', '2023-11-03 18:50:49');
INSERT INTO `gen_table_column` VALUES (38, 4, 'classify_id', '分类ID', 'varchar(50)', 'String', 'classifyId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, '', '2023-11-03 16:26:03', '', '2023-11-03 18:50:49');
INSERT INTO `gen_table_column` VALUES (39, 4, 'image', '活动封面', 'varchar(255)', 'String', 'image', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'imageUpload', '', 3, '', '2023-11-03 16:32:54', '', '2023-11-03 18:50:49');
INSERT INTO `gen_table_column` VALUES (40, 3, 'classify_id', '分类ID', 'varchar(50)', 'String', 'classifyId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, '', '2023-11-03 16:40:11', '', '2023-11-03 18:34:56');
INSERT INTO `gen_table_column` VALUES (41, 1, 'create_time', '发放时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, '', '2023-11-03 18:21:17', '', '2023-11-04 11:05:35');
INSERT INTO `gen_table_column` VALUES (42, 6, 'user_id', '用户ID', 'bigint', 'Long', 'userId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-11-03 19:00:19', '', '2023-11-03 19:01:14');
INSERT INTO `gen_table_column` VALUES (43, 6, 'dept_id', '部门ID', 'bigint', 'Long', 'deptId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-11-03 19:00:20', '', '2023-11-03 19:01:14');
INSERT INTO `gen_table_column` VALUES (44, 6, 'user_name', '用户账号', 'varchar(30)', 'String', 'userName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-11-03 19:00:20', '', '2023-11-03 19:01:14');
INSERT INTO `gen_table_column` VALUES (45, 6, 'nick_name', '用户昵称', 'varchar(30)', 'String', 'nickName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2023-11-03 19:00:20', '', '2023-11-03 19:01:14');
INSERT INTO `gen_table_column` VALUES (46, 6, 'user_type', '用户类型（00系统用户）', 'varchar(2)', 'String', 'userType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', '2023-11-03 19:00:20', '', '2023-11-03 19:01:14');
INSERT INTO `gen_table_column` VALUES (47, 6, 'email', '用户邮箱', 'varchar(50)', 'String', 'email', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-11-03 19:00:20', '', '2023-11-03 19:01:14');
INSERT INTO `gen_table_column` VALUES (48, 6, 'phonenumber', '手机号码', 'varchar(11)', 'String', 'phonenumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-11-03 19:00:20', '', '2023-11-03 19:01:14');
INSERT INTO `gen_table_column` VALUES (49, 6, 'sex', '用户性别（0男 1女 2未知）', 'char(1)', 'String', 'sex', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 8, 'admin', '2023-11-03 19:00:20', '', '2023-11-03 19:01:14');
INSERT INTO `gen_table_column` VALUES (50, 6, 'avatar', '头像地址', 'varchar(100)', 'String', 'avatar', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2023-11-03 19:00:20', '', '2023-11-03 19:01:14');
INSERT INTO `gen_table_column` VALUES (51, 6, 'password', '密码', 'varchar(100)', 'String', 'password', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2023-11-03 19:00:20', '', '2023-11-03 19:01:14');
INSERT INTO `gen_table_column` VALUES (52, 6, 'status', '帐号状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 11, 'admin', '2023-11-03 19:00:20', '', '2023-11-03 19:01:14');
INSERT INTO `gen_table_column` VALUES (53, 6, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2023-11-03 19:00:20', '', '2023-11-03 19:01:14');
INSERT INTO `gen_table_column` VALUES (54, 6, 'login_ip', '最后登录IP', 'varchar(128)', 'String', 'loginIp', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2023-11-03 19:00:20', '', '2023-11-03 19:01:14');
INSERT INTO `gen_table_column` VALUES (55, 6, 'login_date', '最后登录时间', 'datetime', 'Date', 'loginDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 14, 'admin', '2023-11-03 19:00:20', '', '2023-11-03 19:01:14');
INSERT INTO `gen_table_column` VALUES (56, 6, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2023-11-03 19:00:20', '', '2023-11-03 19:01:14');
INSERT INTO `gen_table_column` VALUES (57, 6, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2023-11-03 19:00:20', '', '2023-11-03 19:01:14');
INSERT INTO `gen_table_column` VALUES (58, 6, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2023-11-03 19:00:20', '', '2023-11-03 19:01:14');
INSERT INTO `gen_table_column` VALUES (59, 6, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 18, 'admin', '2023-11-03 19:00:20', '', '2023-11-03 19:01:14');
INSERT INTO `gen_table_column` VALUES (60, 6, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 19, 'admin', '2023-11-03 19:00:20', '', '2023-11-03 19:01:14');
INSERT INTO `gen_table_column` VALUES (61, 7, 'log_id', '日志ID', 'int', 'Long', 'logId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-11-03 19:52:59', '', '2023-11-03 19:53:40');
INSERT INTO `gen_table_column` VALUES (62, 7, 'user_id', '请求用户', 'int', 'Long', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-11-03 19:52:59', '', '2023-11-03 19:53:40');
INSERT INTO `gen_table_column` VALUES (63, 7, 'method', '访问方法名', 'varchar(255)', 'String', 'method', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-11-03 19:52:59', '', '2023-11-03 19:53:40');
INSERT INTO `gen_table_column` VALUES (64, 7, 'package_name', '访问包名', 'varchar(255)', 'String', 'packageName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2023-11-03 19:52:59', '', '2023-11-03 19:53:40');
INSERT INTO `gen_table_column` VALUES (65, 7, 'class_name', '类名', 'varchar(255)', 'String', 'className', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2023-11-03 19:52:59', '', '2023-11-03 19:53:40');
INSERT INTO `gen_table_column` VALUES (66, 7, 'requst_name', '请求类型', 'varchar(255)', 'String', 'requstName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 6, 'admin', '2023-11-03 19:52:59', '', '2023-11-03 19:53:40');
INSERT INTO `gen_table_column` VALUES (67, 7, 'ip', 'ip', 'varchar(255)', 'String', 'ip', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-11-03 19:52:59', '', '2023-11-03 19:53:40');
INSERT INTO `gen_table_column` VALUES (68, 7, 'create_time', '变动时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2023-11-03 19:52:59', '', '2023-11-03 19:53:40');
INSERT INTO `gen_table_column` VALUES (69, 8, 'child_id', '子集ID', 'int', 'Long', 'childId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-11-04 13:28:01', '', '2023-11-08 10:40:07');
INSERT INTO `gen_table_column` VALUES (70, 8, 'order_id', '订单ID', 'varchar(50)', 'String', 'orderId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-11-04 13:28:01', '', '2023-11-08 10:40:07');
INSERT INTO `gen_table_column` VALUES (71, 8, 'product_id', '商品ID', 'int', 'Long', 'productId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-11-04 13:28:01', '', '2023-11-08 10:40:07');
INSERT INTO `gen_table_column` VALUES (72, 8, 'count', '购买数量', 'int', 'Long', 'count', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-11-04 13:28:01', '', '2023-11-08 10:40:07');
INSERT INTO `gen_table_column` VALUES (73, 8, 'count_price', '总金额', 'decimal(10,2)', 'BigDecimal', 'countPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, '', '2023-11-04 13:46:00', '', '2023-11-08 10:40:08');
INSERT INTO `gen_table_column` VALUES (74, 2, 'product_id', '商品ID', 'int', 'Long', 'productId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, '', '2023-11-04 14:06:52', '', '2023-11-08 11:19:53');
INSERT INTO `gen_table_column` VALUES (75, 2, 'count', '数量', 'int', 'Long', 'count', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, '', '2023-11-04 14:06:52', '', '2023-11-08 11:19:54');
INSERT INTO `gen_table_column` VALUES (76, 9, 'address_id', '地址ID', 'int(11)', 'Long', 'addressId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-11-07 11:42:18', '', '2023-11-08 11:19:58');
INSERT INTO `gen_table_column` VALUES (77, 9, 'user_id', '用户ID', 'int(11)', 'Long', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-11-07 11:42:18', '', '2023-11-08 11:19:58');
INSERT INTO `gen_table_column` VALUES (78, 9, 'position_province', '省', 'varchar(255)', 'String', 'positionProvince', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-11-07 11:42:18', '', '2023-11-08 11:19:59');
INSERT INTO `gen_table_column` VALUES (80, 9, 'position_area', '区', 'varchar(255)', 'String', 'positionArea', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-11-07 11:42:18', '', '2023-11-08 11:19:59');
INSERT INTO `gen_table_column` VALUES (81, 9, 'details_position', '详细地址', 'varchar(255)', 'String', 'detailsPosition', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-11-07 11:42:18', '', '2023-11-08 11:19:59');
INSERT INTO `gen_table_column` VALUES (82, 9, 'longitude', '经度', 'decimal(10,7)', 'BigDecimal', 'longitude', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2023-11-07 11:42:18', '', '2023-11-08 11:19:59');
INSERT INTO `gen_table_column` VALUES (83, 9, 'latitude', '纬度', 'decimal(10,7)', 'BigDecimal', 'latitude', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2023-11-07 11:42:18', '', '2023-11-08 11:19:59');
INSERT INTO `gen_table_column` VALUES (84, 9, 'create_time', '添加时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2023-11-07 11:42:18', '', '2023-11-08 11:19:59');
INSERT INTO `gen_table_column` VALUES (85, 9, 'is_default', '是否默认 0否 1是', 'varchar(2)', 'String', 'isDefault', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2023-11-07 11:42:18', '', '2023-11-08 11:19:59');
INSERT INTO `gen_table_column` VALUES (86, 10, 'shopping_id', '购物车ID', 'int(11)', 'Long', 'shoppingId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-11-07 11:42:19', '', '2023-11-07 11:58:50');
INSERT INTO `gen_table_column` VALUES (87, 10, 'user_id', '用户ID', 'int(11)', 'Long', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-11-07 11:42:19', '', '2023-11-07 11:58:50');
INSERT INTO `gen_table_column` VALUES (88, 10, 'product_id', '商品ID', 'int(11)', 'Long', 'productId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-11-07 11:42:19', '', '2023-11-07 11:58:50');
INSERT INTO `gen_table_column` VALUES (89, 10, 'count', '数量', 'int(11)', 'Long', 'count', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-11-07 11:42:19', '', '2023-11-07 11:58:50');
INSERT INTO `gen_table_column` VALUES (90, 10, 'is_check', '是否选中', 'varchar(2)', 'String', 'isCheck', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-11-07 11:42:19', '', '2023-11-07 11:58:50');
INSERT INTO `gen_table_column` VALUES (91, 10, 'create_time', '时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2023-11-07 11:42:19', '', '2023-11-07 11:58:50');
INSERT INTO `gen_table_column` VALUES (92, 8, 'price', '商品单价', 'decimal(10,2)', 'BigDecimal', 'price', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, '', '2023-11-08 10:40:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (93, 2, 'position_province', '省', 'varchar(255)', 'String', 'positionProvince', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, '', '2023-11-08 11:18:29', '', '2023-11-08 11:19:54');
INSERT INTO `gen_table_column` VALUES (95, 2, 'position_area', '区', 'varchar(255)', 'String', 'positionArea', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, '', '2023-11-08 11:18:29', '', '2023-11-08 11:19:54');
INSERT INTO `gen_table_column` VALUES (96, 2, 'details_position', '详细地址', 'varchar(255)', 'String', 'detailsPosition', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, '', '2023-11-08 11:18:29', '', '2023-11-08 11:19:54');
INSERT INTO `gen_table_column` VALUES (97, 2, 'name', '姓名', 'varchar(255)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 14, '', '2023-11-08 11:18:29', '', '2023-11-08 11:19:54');
INSERT INTO `gen_table_column` VALUES (98, 2, 'phone', '电话', 'varchar(255)', 'String', 'phone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, '', '2023-11-08 11:18:29', '', '2023-11-08 11:19:54');
INSERT INTO `gen_table_column` VALUES (99, 2, 'position_city', '市', 'varchar(255)', 'String', 'positionCity', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, '', '2023-11-08 11:19:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (100, 9, 'name', '姓名', 'varchar(255)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, '', '2023-11-08 11:19:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (101, 9, 'phone', '电话', 'varchar(255)', 'String', 'phone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, '', '2023-11-08 11:19:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (102, 9, 'position_city', '市', 'varchar(255)', 'String', 'positionCity', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, '', '2023-11-08 11:19:59', '', NULL);

-- ----------------------------
-- Table structure for pro_address
-- ----------------------------
DROP TABLE IF EXISTS `pro_address`;
CREATE TABLE `pro_address`  (
  `address_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '地址ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话',
  `position_province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省',
  `position_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市',
  `position_area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区',
  `details_position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `longitude` decimal(10, 7) NULL DEFAULT NULL COMMENT '经度',
  `latitude` decimal(10, 7) NULL DEFAULT NULL COMMENT '纬度',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `is_default` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否默认 0否 1是',
  PRIMARY KEY (`address_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '地址表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pro_address
-- ----------------------------
INSERT INTO `pro_address` VALUES (2, 103, NULL, NULL, '山东省', NULL, '历下区', '详细位置', 114.2773540, 36.6814540, '2023-11-08 09:59:09', '0');
INSERT INTO `pro_address` VALUES (3, 103, NULL, NULL, '山东省', NULL, '历下区', '详细位置', 114.2773540, 36.6814540, '2023-11-08 09:59:09', '1');

-- ----------------------------
-- Table structure for pro_classify
-- ----------------------------
DROP TABLE IF EXISTS `pro_classify`;
CREATE TABLE `pro_classify`  (
  `classify_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`classify_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pro_classify
-- ----------------------------
INSERT INTO `pro_classify` VALUES (1, '商品分类啊', 1);
INSERT INTO `pro_classify` VALUES (2, '水果', 2);

-- ----------------------------
-- Table structure for pro_coupon
-- ----------------------------
DROP TABLE IF EXISTS `pro_coupon`;
CREATE TABLE `pro_coupon`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '随机生成的券码序列号',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用状态',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1 金额 2比例 固定金额折扣还是倍率折扣',
  `discount` decimal(10, 2) NULL DEFAULT NULL COMMENT '折扣金额，如果满减和固定金额，则填写数额；如果是倍率折扣则填写小于1的浮点数',
  `condition` decimal(10, 2) NULL DEFAULT NULL COMMENT '需满足价格',
  `active_time` datetime NULL DEFAULT NULL COMMENT '生效时间，如果未达到则不可用',
  `expired_time` datetime NULL DEFAULT NULL COMMENT '过期时间',
  `range` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '‘mid’, ‘mid’]用于表明COUPON生效产品',
  `create_time` datetime NULL DEFAULT NULL COMMENT '发放时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠卷表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pro_coupon
-- ----------------------------
INSERT INTO `pro_coupon` VALUES (1, 103, '1', '2', 0.80, 100.00, '2023-11-04 00:00:00', '2023-11-07 00:00:00', '2,1', '2023-11-04 08:40:33');
INSERT INTO `pro_coupon` VALUES (2, 103, '1', '1', 20.00, 100.00, '2023-11-04 00:00:00', '2023-11-05 00:00:00', '2,1', '2023-11-04 08:40:33');

-- ----------------------------
-- Table structure for pro_events
-- ----------------------------
DROP TABLE IF EXISTS `pro_events`;
CREATE TABLE `pro_events`  (
  `events_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动标题',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动封面',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动内容',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '活动金额',
  `scale` decimal(3, 2) NULL DEFAULT NULL COMMENT '打折比例',
  `classify_id` int(11) NULL DEFAULT NULL COMMENT '分类ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '活动创建时间',
  PRIMARY KEY (`events_id`) USING BTREE,
  UNIQUE INDEX `class`(`classify_id`) USING BTREE COMMENT '一个分类一个活动'
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '活动表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pro_events
-- ----------------------------
INSERT INTO `pro_events` VALUES (1, '水果类商品8折', '/profile/upload/2023/11/04/zhuchemorentoux_20231104101514A001.png', '内容介绍....', NULL, 0.80, 2, '2023-11-04 10:15:26');

-- ----------------------------
-- Table structure for pro_log
-- ----------------------------
DROP TABLE IF EXISTS `pro_log`;
CREATE TABLE `pro_log`  (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '请求用户',
  `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问方法名',
  `package_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问包名',
  `class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类名',
  `requst_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求类型',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip',
  `create_time` datetime NULL DEFAULT NULL COMMENT '变动时间',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 133 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pro_log
-- ----------------------------
INSERT INTO `pro_log` VALUES (9, 0, 'login', 'com.estore.project.apiController.ApiProUserController', 'ApiProUserController', 'POST', '127.0.0.1', '2023-11-04 08:59:23');
INSERT INTO `pro_log` VALUES (10, 0, 'login', 'com.estore.project.apiController.ApiProUserController', 'ApiProUserController', 'POST', '127.0.0.1', '2023-11-04 09:05:21');
INSERT INTO `pro_log` VALUES (11, 0, 'login', 'com.estore.project.apiController.ApiProUserController', 'ApiProUserController', 'POST', '127.0.0.1', '2023-11-04 09:07:14');
INSERT INTO `pro_log` VALUES (12, 0, 'login', 'com.estore.project.apiController.ApiProUserController', 'ApiProUserController', 'POST', '127.0.0.1', '2023-11-04 09:07:27');
INSERT INTO `pro_log` VALUES (13, 0, 'login', 'com.estore.project.apiController.ApiProUserController', 'ApiProUserController', 'POST', '127.0.0.1', '2023-11-04 09:09:44');
INSERT INTO `pro_log` VALUES (14, 0, 'register', 'com.estore.project.apiController.ApiProUserController', 'ApiProUserController', 'POST', '127.0.0.1', '2023-11-04 09:10:58');
INSERT INTO `pro_log` VALUES (15, 0, 'register', 'com.estore.project.apiController.ApiProUserController', 'ApiProUserController', 'POST', '127.0.0.1', '2023-11-04 09:11:06');
INSERT INTO `pro_log` VALUES (16, 0, 'login', 'com.estore.project.apiController.ApiProUserController', 'ApiProUserController', 'POST', '127.0.0.1', '2023-11-04 09:11:13');
INSERT INTO `pro_log` VALUES (17, 0, 'login', 'com.estore.project.apiController.ApiProUserController', 'ApiProUserController', 'POST', '127.0.0.1', '2023-11-04 09:14:59');
INSERT INTO `pro_log` VALUES (18, 0, 'login', 'com.estore.project.apiController.ApiProUserController', 'ApiProUserController', 'POST', '127.0.0.1', '2023-11-04 09:15:36');
INSERT INTO `pro_log` VALUES (19, 0, 'login', 'com.estore.project.apiController.ApiProUserController', 'ApiProUserController', 'POST', '127.0.0.1', '2023-11-04 09:20:32');
INSERT INTO `pro_log` VALUES (20, 0, 'login', 'com.estore.project.apiController.ApiProUserController', 'ApiProUserController', 'POST', '127.0.0.1', '2023-11-04 09:22:09');
INSERT INTO `pro_log` VALUES (21, 103, 'login', 'com.estore.project.apiController.ApiProUserController', 'ApiProUserController', 'POST', '127.0.0.1', '2023-11-04 09:29:15');
INSERT INTO `pro_log` VALUES (22, 103, 'login', 'com.estore.project.apiController.ApiProUserController', 'ApiProUserController', 'POST', '127.0.0.1', '2023-11-04 09:31:31');
INSERT INTO `pro_log` VALUES (23, 103, 'login', 'com.estore.project.apiController.ApiProUserController', 'ApiProUserController', 'POST', '127.0.0.1', '2023-11-04 09:33:06');
INSERT INTO `pro_log` VALUES (24, 103, 'login', 'com.estore.project.apiController.ApiProUserController', 'ApiProUserController', 'POST', '127.0.0.1', '2023-11-04 09:44:48');
INSERT INTO `pro_log` VALUES (25, 103, 'edit', 'com.estore.project.apiController.ApiProUserController', 'ApiProUserController', 'POST', '127.0.0.1', '2023-11-04 09:45:58');
INSERT INTO `pro_log` VALUES (26, 103, 'getInfo', 'com.estore.project.apiController.ApiProUserController', 'ApiProUserController', 'POST', '127.0.0.1', '2023-11-04 09:46:33');
INSERT INTO `pro_log` VALUES (27, 103, 'edit', 'com.estore.project.apiController.ApiProUserController', 'ApiProUserController', 'POST', '127.0.0.1', '2023-11-04 09:47:50');
INSERT INTO `pro_log` VALUES (28, 103, 'getInfo', 'com.estore.project.apiController.ApiProUserController', 'ApiProUserController', 'POST', '127.0.0.1', '2023-11-04 09:47:54');
INSERT INTO `pro_log` VALUES (29, 103, 'list', 'com.estore.project.apiController.ApiProCouponController', 'ApiProCouponController', 'POST', '127.0.0.1', '2023-11-04 09:50:30');
INSERT INTO `pro_log` VALUES (30, 103, 'list', 'com.estore.project.apiController.ApiProCouponController', 'ApiProCouponController', 'POST', '127.0.0.1', '2023-11-04 09:52:39');
INSERT INTO `pro_log` VALUES (31, 103, 'list', 'com.estore.project.apiController.ApiProCouponController', 'ApiProCouponController', 'POST', '127.0.0.1', '2023-11-04 09:54:10');
INSERT INTO `pro_log` VALUES (32, 103, 'list', 'com.estore.project.apiController.ApiProCouponController', 'ApiProCouponController', 'POST', '127.0.0.1', '2023-11-04 09:55:26');
INSERT INTO `pro_log` VALUES (33, 103, 'list', 'com.estore.project.apiController.ApiProCouponController', 'ApiProCouponController', 'POST', '127.0.0.1', '2023-11-04 09:55:43');
INSERT INTO `pro_log` VALUES (34, 103, 'list', 'com.estore.project.apiController.ApiProCouponController', 'ApiProCouponController', 'POST', '127.0.0.1', '2023-11-04 09:59:58');
INSERT INTO `pro_log` VALUES (35, 103, 'list', 'com.estore.project.apiController.ApiProClassifyController', 'ApiProClassifyController', 'POST', '127.0.0.1', '2023-11-04 10:04:55');
INSERT INTO `pro_log` VALUES (36, 103, 'list', 'com.estore.project.apiController.ApiProProductController', 'ApiProProductController', 'POST', '127.0.0.1', '2023-11-04 10:17:05');
INSERT INTO `pro_log` VALUES (37, 103, 'list', 'com.estore.project.apiController.ApiProProductController', 'ApiProProductController', 'POST', '127.0.0.1', '2023-11-04 10:22:01');
INSERT INTO `pro_log` VALUES (38, 103, 'list', 'com.estore.project.apiController.ApiProProductController', 'ApiProProductController', 'POST', '127.0.0.1', '2023-11-04 10:33:47');
INSERT INTO `pro_log` VALUES (39, 103, 'list', 'com.estore.project.apiController.ApiProProductController', 'ApiProProductController', 'POST', '127.0.0.1', '2023-11-04 10:34:35');
INSERT INTO `pro_log` VALUES (40, 103, 'list', 'com.estore.project.apiController.ApiProProductController', 'ApiProProductController', 'POST', '127.0.0.1', '2023-11-04 10:35:05');
INSERT INTO `pro_log` VALUES (41, 103, 'list', 'com.estore.project.apiController.ApiProProductController', 'ApiProProductController', 'POST', '127.0.0.1', '2023-11-04 10:41:40');
INSERT INTO `pro_log` VALUES (42, 103, 'list', 'com.estore.project.apiController.ApiProProductController', 'ApiProProductController', 'POST', '127.0.0.1', '2023-11-04 10:43:57');
INSERT INTO `pro_log` VALUES (43, 103, 'list', 'com.estore.project.apiController.ApiProEventsController', 'ApiProEventsController', 'POST', '127.0.0.1', '2023-11-04 10:44:30');
INSERT INTO `pro_log` VALUES (44, 103, 'list', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-04 14:38:50');
INSERT INTO `pro_log` VALUES (45, 103, 'payOrder', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-04 14:40:04');
INSERT INTO `pro_log` VALUES (46, 103, 'payOrder', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-04 14:41:36');
INSERT INTO `pro_log` VALUES (47, 103, 'list', 'com.estore.project.apiController.ApiProProductController', 'ApiProProductController', 'POST', '127.0.0.1', '2023-11-04 14:43:19');
INSERT INTO `pro_log` VALUES (48, 103, 'payOrder', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-04 14:45:56');
INSERT INTO `pro_log` VALUES (49, 103, 'list', 'com.estore.project.apiController.ApiProCouponController', 'ApiProCouponController', 'POST', '127.0.0.1', '2023-11-04 15:09:40');
INSERT INTO `pro_log` VALUES (50, 103, 'payOrder', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-04 15:11:48');
INSERT INTO `pro_log` VALUES (51, 103, 'list', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-04 15:11:55');
INSERT INTO `pro_log` VALUES (52, 103, 'list', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-04 15:27:51');
INSERT INTO `pro_log` VALUES (53, 103, 'list', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-04 15:29:43');
INSERT INTO `pro_log` VALUES (54, 103, 'getInfo', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-04 15:31:28');
INSERT INTO `pro_log` VALUES (55, 103, 'uploadIimage', 'com.estore.project.apiController.ApiProUtilsController', 'ApiProUtilsController', 'POST', '127.0.0.1', '2023-11-04 15:39:07');
INSERT INTO `pro_log` VALUES (56, 103, 'uploadIimage', 'com.estore.project.apiController.ApiProUtilsController', 'ApiProUtilsController', 'POST', '127.0.0.1', '2023-11-04 15:40:38');
INSERT INTO `pro_log` VALUES (57, 103, 'login', 'com.estore.project.apiController.ApiProUserController', 'ApiProUserController', 'POST', '182.45.245.154', '2023-11-06 09:25:40');
INSERT INTO `pro_log` VALUES (58, 103, 'verifyShopping', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-07 19:59:27');
INSERT INTO `pro_log` VALUES (59, 103, 'verifyShopping', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-07 20:01:19');
INSERT INTO `pro_log` VALUES (60, 103, 'verifyShopping', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-07 20:03:02');
INSERT INTO `pro_log` VALUES (61, 103, 'list', 'com.estore.project.apiController.ApiProShoppingController', 'ApiProShoppingController', 'POST', '127.0.0.1', '2023-11-07 20:07:37');
INSERT INTO `pro_log` VALUES (62, 103, 'addProduct', 'com.estore.project.apiController.ApiProShoppingController', 'ApiProShoppingController', 'POST', '127.0.0.1', '2023-11-07 20:18:22');
INSERT INTO `pro_log` VALUES (63, 103, 'addProduct', 'com.estore.project.apiController.ApiProShoppingController', 'ApiProShoppingController', 'POST', '127.0.0.1', '2023-11-07 20:19:41');
INSERT INTO `pro_log` VALUES (64, 103, 'list', 'com.estore.project.apiController.ApiProShoppingController', 'ApiProShoppingController', 'POST', '127.0.0.1', '2023-11-07 20:19:49');
INSERT INTO `pro_log` VALUES (65, 103, 'list', 'com.estore.project.apiController.ApiProShoppingController', 'ApiProShoppingController', 'POST', '127.0.0.1', '2023-11-07 20:19:50');
INSERT INTO `pro_log` VALUES (66, 103, 'addProduct', 'com.estore.project.apiController.ApiProShoppingController', 'ApiProShoppingController', 'POST', '127.0.0.1', '2023-11-07 20:19:55');
INSERT INTO `pro_log` VALUES (67, 103, 'addProduct', 'com.estore.project.apiController.ApiProShoppingController', 'ApiProShoppingController', 'POST', '127.0.0.1', '2023-11-07 20:19:56');
INSERT INTO `pro_log` VALUES (68, 103, 'addProduct', 'com.estore.project.apiController.ApiProShoppingController', 'ApiProShoppingController', 'POST', '127.0.0.1', '2023-11-07 20:19:56');
INSERT INTO `pro_log` VALUES (69, 103, 'addProduct', 'com.estore.project.apiController.ApiProShoppingController', 'ApiProShoppingController', 'POST', '127.0.0.1', '2023-11-07 20:19:57');
INSERT INTO `pro_log` VALUES (70, 103, 'list', 'com.estore.project.apiController.ApiProShoppingController', 'ApiProShoppingController', 'POST', '127.0.0.1', '2023-11-07 20:19:59');
INSERT INTO `pro_log` VALUES (71, 103, 'list', 'com.estore.project.apiController.ApiProShoppingController', 'ApiProShoppingController', 'POST', '127.0.0.1', '2023-11-07 20:21:49');
INSERT INTO `pro_log` VALUES (72, 103, 'list', 'com.estore.project.apiController.ApiProShoppingController', 'ApiProShoppingController', 'POST', '127.0.0.1', '2023-11-07 20:21:55');
INSERT INTO `pro_log` VALUES (73, 103, 'list', 'com.estore.project.apiController.ApiProShoppingController', 'ApiProShoppingController', 'POST', '127.0.0.1', '2023-11-07 20:22:55');
INSERT INTO `pro_log` VALUES (74, 103, 'add', 'com.estore.project.apiController.ApiProShoppingController', 'ApiProShoppingController', 'POST', '127.0.0.1', '2023-11-07 20:24:15');
INSERT INTO `pro_log` VALUES (75, 103, 'list', 'com.estore.project.apiController.ApiProShoppingController', 'ApiProShoppingController', 'POST', '127.0.0.1', '2023-11-07 20:24:19');
INSERT INTO `pro_log` VALUES (76, 103, 'subtract', 'com.estore.project.apiController.ApiProShoppingController', 'ApiProShoppingController', 'POST', '127.0.0.1', '2023-11-07 20:24:32');
INSERT INTO `pro_log` VALUES (77, 103, 'subtract', 'com.estore.project.apiController.ApiProShoppingController', 'ApiProShoppingController', 'POST', '127.0.0.1', '2023-11-07 20:24:33');
INSERT INTO `pro_log` VALUES (78, 103, 'list', 'com.estore.project.apiController.ApiProShoppingController', 'ApiProShoppingController', 'POST', '127.0.0.1', '2023-11-07 20:24:34');
INSERT INTO `pro_log` VALUES (79, 103, 'addProduct', 'com.estore.project.apiController.ApiProShoppingController', 'ApiProShoppingController', 'POST', '127.0.0.1', '2023-11-07 20:24:48');
INSERT INTO `pro_log` VALUES (80, 103, 'list', 'com.estore.project.apiController.ApiProShoppingController', 'ApiProShoppingController', 'POST', '127.0.0.1', '2023-11-07 20:24:51');
INSERT INTO `pro_log` VALUES (81, 103, 'deletes', 'com.estore.project.apiController.ApiProShoppingController', 'ApiProShoppingController', 'POST', '127.0.0.1', '2023-11-07 20:25:09');
INSERT INTO `pro_log` VALUES (82, 103, 'deletes', 'com.estore.project.apiController.ApiProShoppingController', 'ApiProShoppingController', 'POST', '127.0.0.1', '2023-11-07 20:30:20');
INSERT INTO `pro_log` VALUES (83, 103, 'deletes', 'com.estore.project.apiController.ApiProShoppingController', 'ApiProShoppingController', 'POST', '127.0.0.1', '2023-11-07 20:32:26');
INSERT INTO `pro_log` VALUES (84, 103, 'list', 'com.estore.project.apiController.ApiProShoppingController', 'ApiProShoppingController', 'POST', '127.0.0.1', '2023-11-07 20:32:29');
INSERT INTO `pro_log` VALUES (85, 103, 'getByDefault', 'com.estore.project.apiController.ApiProAddressController', 'ApiProAddressController', 'POST', '127.0.0.1', '2023-11-08 09:51:14');
INSERT INTO `pro_log` VALUES (86, 103, 'getByDefault', 'com.estore.project.apiController.ApiProAddressController', 'ApiProAddressController', 'POST', '127.0.0.1', '2023-11-08 09:52:07');
INSERT INTO `pro_log` VALUES (87, 103, 'add', 'com.estore.project.apiController.ApiProAddressController', 'ApiProAddressController', 'POST', '127.0.0.1', '2023-11-08 09:52:12');
INSERT INTO `pro_log` VALUES (88, 103, 'add', 'com.estore.project.apiController.ApiProAddressController', 'ApiProAddressController', 'POST', '127.0.0.1', '2023-11-08 09:52:41');
INSERT INTO `pro_log` VALUES (89, 103, 'list', 'com.estore.project.apiController.ApiProAddressController', 'ApiProAddressController', 'POST', '127.0.0.1', '2023-11-08 09:52:49');
INSERT INTO `pro_log` VALUES (90, 103, 'list', 'com.estore.project.apiController.ApiProAddressController', 'ApiProAddressController', 'POST', '127.0.0.1', '2023-11-08 09:57:01');
INSERT INTO `pro_log` VALUES (91, 103, 'getByDefault', 'com.estore.project.apiController.ApiProAddressController', 'ApiProAddressController', 'POST', '127.0.0.1', '2023-11-08 09:57:40');
INSERT INTO `pro_log` VALUES (92, 103, 'add', 'com.estore.project.apiController.ApiProAddressController', 'ApiProAddressController', 'POST', '127.0.0.1', '2023-11-08 09:59:09');
INSERT INTO `pro_log` VALUES (93, 103, 'add', 'com.estore.project.apiController.ApiProAddressController', 'ApiProAddressController', 'POST', '127.0.0.1', '2023-11-08 09:59:09');
INSERT INTO `pro_log` VALUES (94, 103, 'list', 'com.estore.project.apiController.ApiProAddressController', 'ApiProAddressController', 'POST', '127.0.0.1', '2023-11-08 09:59:12');
INSERT INTO `pro_log` VALUES (95, 103, 'remove', 'com.estore.project.apiController.ApiProAddressController', 'ApiProAddressController', 'POST', '127.0.0.1', '2023-11-08 10:01:14');
INSERT INTO `pro_log` VALUES (96, 103, 'list', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-08 10:48:10');
INSERT INTO `pro_log` VALUES (97, 103, 'payOrder', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-08 10:53:11');
INSERT INTO `pro_log` VALUES (98, 103, 'payOrder', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-08 10:53:17');
INSERT INTO `pro_log` VALUES (99, 103, 'payOrder', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-08 10:53:21');
INSERT INTO `pro_log` VALUES (100, 103, 'list', 'com.estore.project.apiController.ApiProProductController', 'ApiProProductController', 'POST', '127.0.0.1', '2023-11-08 10:53:55');
INSERT INTO `pro_log` VALUES (101, 103, 'payOrder', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-08 10:54:10');
INSERT INTO `pro_log` VALUES (102, 103, 'payOrder', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-08 10:57:07');
INSERT INTO `pro_log` VALUES (103, 103, 'payOrder', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-08 10:59:34');
INSERT INTO `pro_log` VALUES (104, 103, 'list', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-08 10:59:42');
INSERT INTO `pro_log` VALUES (105, 103, 'list', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-08 11:00:47');
INSERT INTO `pro_log` VALUES (106, 103, 'list', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-08 11:58:42');
INSERT INTO `pro_log` VALUES (107, 103, 'list', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-08 13:05:01');
INSERT INTO `pro_log` VALUES (108, 103, 'remove', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-08 13:05:12');
INSERT INTO `pro_log` VALUES (109, 103, 'list', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-08 13:05:51');
INSERT INTO `pro_log` VALUES (110, 103, 'remove', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-08 13:06:10');
INSERT INTO `pro_log` VALUES (111, 103, 'list', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-08 13:06:14');
INSERT INTO `pro_log` VALUES (112, 103, 'payOrder', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-08 13:12:56');
INSERT INTO `pro_log` VALUES (113, 103, 'list', 'com.estore.project.apiController.ApiProAddressController', 'ApiProAddressController', 'POST', '127.0.0.1', '2023-11-08 13:14:09');
INSERT INTO `pro_log` VALUES (114, 103, 'payOrder', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-08 13:14:49');
INSERT INTO `pro_log` VALUES (115, 103, 'list', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-08 13:15:04');
INSERT INTO `pro_log` VALUES (116, 103, 'getInfo', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-08 13:18:50');
INSERT INTO `pro_log` VALUES (117, 103, 'getInfo', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-08 13:19:04');
INSERT INTO `pro_log` VALUES (118, 103, 'payOrder', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-15 10:56:23');
INSERT INTO `pro_log` VALUES (119, 103, 'payOrder', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-15 10:57:45');
INSERT INTO `pro_log` VALUES (120, 103, 'payOrder', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-15 11:00:45');
INSERT INTO `pro_log` VALUES (121, 103, 'payOrder', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-15 11:02:04');
INSERT INTO `pro_log` VALUES (122, 103, 'payOrder', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-15 11:03:08');
INSERT INTO `pro_log` VALUES (123, 103, 'verifyShopping', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-15 11:03:40');
INSERT INTO `pro_log` VALUES (124, 103, 'verifyShopping', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-15 11:04:09');
INSERT INTO `pro_log` VALUES (125, 103, 'verifyShopping', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-15 11:05:45');
INSERT INTO `pro_log` VALUES (126, 103, 'list', 'com.estore.project.apiController.ApiProShoppingController', 'ApiProShoppingController', 'POST', '127.0.0.1', '2023-11-15 11:06:40');
INSERT INTO `pro_log` VALUES (127, 103, 'addProduct', 'com.estore.project.apiController.ApiProShoppingController', 'ApiProShoppingController', 'POST', '127.0.0.1', '2023-11-15 11:06:45');
INSERT INTO `pro_log` VALUES (128, 103, 'list', 'com.estore.project.apiController.ApiProShoppingController', 'ApiProShoppingController', 'POST', '127.0.0.1', '2023-11-15 11:06:47');
INSERT INTO `pro_log` VALUES (129, 103, 'verifyShopping', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-15 11:06:58');
INSERT INTO `pro_log` VALUES (130, 103, 'verifyShopping', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-15 11:07:43');
INSERT INTO `pro_log` VALUES (131, 103, 'verifyShopping', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-15 11:08:02');
INSERT INTO `pro_log` VALUES (132, 103, 'verifyShopping', 'com.estore.project.apiController.ApiProOrderController', 'ApiProOrderController', 'POST', '127.0.0.1', '2023-11-15 11:08:59');

-- ----------------------------
-- Table structure for pro_order
-- ----------------------------
DROP TABLE IF EXISTS `pro_order`;
CREATE TABLE `pro_order`  (
  `order_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `product_id` int(11) NULL DEFAULT NULL COMMENT '商品ID',
  `count` int(11) NULL DEFAULT NULL COMMENT '数量',
  `count_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `coupon_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠卷优惠的金额',
  `events_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '活动优惠的金额',
  `create_time` datetime NULL DEFAULT NULL COMMENT '下单时间',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单状态',
  `position_province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省',
  `position_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `position_area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `details_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pro_order
-- ----------------------------
INSERT INTO `pro_order` VALUES ('919618029183041536', 103, 1, 1, 799.20, 0.00, 199.80, '2023-11-08 13:14:50', '1', '山东省', NULL, '历下区', '详细位置', NULL, NULL);
INSERT INTO `pro_order` VALUES ('922119904662913024', 103, 1, 1, 799.20, 0.00, 199.80, '2023-11-15 10:56:23', '1', '山东省', NULL, '历下区', '详细位置', NULL, NULL);
INSERT INTO `pro_order` VALUES ('922120248188993536', 103, 1, 1, 799.20, 0.00, 199.80, '2023-11-15 10:57:45', '1', '山东省', NULL, '历下区', '详细位置', NULL, NULL);
INSERT INTO `pro_order` VALUES ('922121004430393344', 103, 1, 1, 799.20, 0.00, 199.80, '2023-11-15 11:00:45', '1', '山东省', NULL, '历下区', '详细位置', NULL, NULL);
INSERT INTO `pro_order` VALUES ('922121337076449280', 103, 1, 1, 799.20, 0.00, 199.80, '2023-11-15 11:02:05', '1', '山东省', NULL, '历下区', '详细位置', NULL, NULL);
INSERT INTO `pro_order` VALUES ('922121604664655872', 103, 1, 1, 799.20, 0.00, 199.80, '2023-11-15 11:03:09', '1', '山东省', NULL, '历下区', '详细位置', NULL, NULL);
INSERT INTO `pro_order` VALUES ('922123077700026368', NULL, NULL, NULL, 3285.60, 0.00, 0.00, '2023-11-15 11:09:00', '1', '山东省', NULL, '历下区', '详细位置', NULL, NULL);

-- ----------------------------
-- Table structure for pro_order_child
-- ----------------------------
DROP TABLE IF EXISTS `pro_order_child`;
CREATE TABLE `pro_order_child`  (
  `child_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '子集ID',
  `order_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单ID',
  `product_id` int(11) NULL DEFAULT NULL COMMENT '商品ID',
  `count` int(11) NULL DEFAULT NULL COMMENT '购买数量',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品单价',
  `count_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '总金额',
  PRIMARY KEY (`child_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pro_order_child
-- ----------------------------
INSERT INTO `pro_order_child` VALUES (1, '919583991923736576', 1, 1, 799.20, 799.20);
INSERT INTO `pro_order_child` VALUES (2, '919618029183041536', 1, 1, 799.20, 799.20);
INSERT INTO `pro_order_child` VALUES (3, '922119904662913024', 1, 1, 799.20, 799.20);
INSERT INTO `pro_order_child` VALUES (4, '922120248188993536', 1, 1, 799.20, 799.20);
INSERT INTO `pro_order_child` VALUES (5, '922121004430393344', 1, 1, 799.20, 799.20);
INSERT INTO `pro_order_child` VALUES (6, '922121337076449280', 1, 1, 799.20, 799.20);
INSERT INTO `pro_order_child` VALUES (7, '922121604664655872', 1, 1, 799.20, 799.20);
INSERT INTO `pro_order_child` VALUES (8, '922123077700026368', 1, 3, NULL, 2397.60);
INSERT INTO `pro_order_child` VALUES (9, '922123077700026368', 2, 1, NULL, 888.00);

-- ----------------------------
-- Table structure for pro_product
-- ----------------------------
DROP TABLE IF EXISTS `pro_product`;
CREATE TABLE `pro_product`  (
  `product_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `classify_id` int(11) NULL DEFAULT NULL COMMENT '分类ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品标题',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品价格',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面',
  `image2s` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '轮播图',
  `inventory_count` int(11) NULL DEFAULT NULL COMMENT '库存',
  `sales_count` int(11) NULL DEFAULT NULL COMMENT '销量',
  `create_time` datetime NULL DEFAULT NULL COMMENT '商品添加事件',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pro_product
-- ----------------------------
INSERT INTO `pro_product` VALUES (1, 2, '苹果', 999.00, '/profile/upload/2023/11/03/zhuchemorentoux_20231103184444A001.png', '1', 986, 10011, '2023-11-03 18:43:47', 1);
INSERT INTO `pro_product` VALUES (2, 1, '测试商品', 888.00, '/profile/upload/2023/11/06/头像_20231106092127A001.png', '1', 85, 3, '2023-11-04 10:41:11', 1);

-- ----------------------------
-- Table structure for pro_shopping
-- ----------------------------
DROP TABLE IF EXISTS `pro_shopping`;
CREATE TABLE `pro_shopping`  (
  `shopping_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `product_id` int(11) NULL DEFAULT NULL COMMENT '商品ID',
  `count` int(11) NULL DEFAULT NULL COMMENT '数量',
  `is_check` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否选中',
  `create_time` datetime NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`shopping_id`) USING BTREE,
  UNIQUE INDEX `userproduct`(`user_id`, `product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '购物车表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pro_shopping
-- ----------------------------
INSERT INTO `pro_shopping` VALUES (1, 103, 1, 3, NULL, '2023-11-15 11:06:28');
INSERT INTO `pro_shopping` VALUES (3, 103, 2, 1, NULL, NULL);

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

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
  `fired_time` bigint(20) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(20) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

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
  `last_checkin_time` bigint(20) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(20) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

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
  `repeat_count` bigint(20) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(20) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(20) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

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
  `next_fire_time` bigint(20) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(20) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(20) NOT NULL COMMENT '开始时间',
  `end_time` bigint(20) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(6) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
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
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-11-02 18:10:35', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-11-02 18:10:35', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-11-02 18:10:35', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2023-11-02 18:10:35', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-11-02 18:10:35', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-11-02 18:10:35', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
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
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '我的商城', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-02 18:10:33', 'admin', '2023-11-03 21:04:15');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-02 18:10:33', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-02 18:10:33', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-02 18:10:33', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-02 18:10:33', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-02 18:10:33', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-02 18:10:33', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-02 18:10:33', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-02 18:10:33', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-02 18:10:33', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(11) NULL DEFAULT 0 COMMENT '字典排序',
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
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-11-02 18:10:35', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-11-02 18:10:35', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-11-02 18:10:35', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-11-02 18:10:35', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-11-02 18:10:35', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-11-02 18:10:35', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-11-02 18:10:35', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-11-02 18:10:35', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-11-02 18:10:35', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-11-02 18:10:35', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-11-02 18:10:35', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-11-02 18:10:35', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-11-02 18:10:35', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-11-02 18:10:35', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-11-02 18:10:35', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-11-02 18:10:35', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-11-02 18:10:35', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-11-02 18:10:35', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-11-02 18:10:35', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-11-02 18:10:35', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-11-02 18:10:35', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-11-02 18:10:35', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-11-02 18:10:35', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-11-02 18:10:35', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-11-02 18:10:35', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-11-02 18:10:35', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-11-02 18:10:35', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-11-02 18:10:35', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-11-02 18:10:35', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '满减', '1', 'pro_coupon_type', NULL, 'default', 'N', '0', 'admin', '2023-11-04 11:10:16', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 0, '比例', '2', 'pro_coupon_type', NULL, 'default', 'N', '0', 'admin', '2023-11-04 11:10:29', 'admin', '2023-11-04 11:10:35', NULL);
INSERT INTO `sys_dict_data` VALUES (102, 0, '待使用', '1', 'pro_coupon_status', NULL, 'default', 'N', '0', 'admin', '2023-11-04 11:10:48', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 0, '已使用', '2', 'pro_coupon_status', NULL, 'default', 'N', '0', 'admin', '2023-11-04 11:10:57', 'admin', '2023-11-04 11:11:04', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-11-02 18:10:34', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-11-02 18:10:34', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-11-02 18:10:34', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-11-02 18:10:34', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-11-02 18:10:34', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-11-02 18:10:34', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-11-02 18:10:34', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-11-02 18:10:34', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-11-02 18:10:34', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-11-02 18:10:34', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '优惠卷类型', 'pro_coupon_type', '0', 'admin', '2023-11-04 11:04:17', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (101, '优惠卷状态', 'pro_coupon_status', '0', 'admin', '2023-11-04 11:04:38', '', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-11-02 18:10:35', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-11-02 18:10:35', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-11-02 18:10:35', '', NULL, '');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

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
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 138 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-03 08:43:07');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-11-03 15:58:10');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-03 15:58:13');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-03 17:48:14');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-03 19:31:56');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-03 21:00:51');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-11-03 21:08:55');
INSERT INTO `sys_logininfor` VALUES (107, '123456', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-11-03 21:09:03');
INSERT INTO `sys_logininfor` VALUES (108, '123456', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-03 21:09:03');
INSERT INTO `sys_logininfor` VALUES (109, '123456', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-11-03 21:09:06');
INSERT INTO `sys_logininfor` VALUES (110, '123456', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误2次', '2023-11-03 21:09:10');
INSERT INTO `sys_logininfor` VALUES (111, '123456', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-03 21:09:10');
INSERT INTO `sys_logininfor` VALUES (112, '123456', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-03 21:09:34');
INSERT INTO `sys_logininfor` VALUES (113, '123456', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-11-03 21:10:03');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-03 21:10:07');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-11-03 21:10:25');
INSERT INTO `sys_logininfor` VALUES (116, '123456', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-03 21:10:33');
INSERT INTO `sys_logininfor` VALUES (117, '123456', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-11-03 21:10:50');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-03 21:10:52');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-11-03 21:24:37');
INSERT INTO `sys_logininfor` VALUES (120, 'zhang', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-03 21:24:43');
INSERT INTO `sys_logininfor` VALUES (121, 'zhang', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-03 21:25:56');
INSERT INTO `sys_logininfor` VALUES (122, 'zhang', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-11-03 21:26:03');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-04 09:56:43');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-04 10:40:23');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-04 13:27:32');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-04 14:48:53');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-04 15:44:14');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '182.45.245.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-06 09:20:15');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '116.230.3.141', 'XX XX', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2023-11-06 10:26:04');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '182.45.245.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-06 10:31:40');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '116.230.3.141', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-06 11:04:05');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-07 11:22:48');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-07 17:49:29');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-11-08 10:38:09');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-08 10:38:12');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '182.45.245.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-08 10:51:39');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-15 10:46:12');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(11) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(11) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
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
) ENGINE = InnoDB AUTO_INCREMENT = 2047 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-11-02 18:10:33', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '1', '1', '', 'monitor', 'admin', '2023-11-02 18:10:33', 'admin', '2023-11-04 15:48:48', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '1', '1', '', 'tool', 'admin', '2023-11-02 18:10:33', 'admin', '2023-11-04 15:49:03', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '1', '1', '', 'guide', 'admin', '2023-11-02 18:10:33', 'admin', '2023-11-04 15:49:07', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-11-02 18:10:33', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-11-02 18:10:33', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '1', '1', 'system:menu:list', 'tree-table', 'admin', '2023-11-02 18:10:33', 'admin', '2023-11-04 16:02:30', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '1', '1', 'system:dept:list', 'tree', 'admin', '2023-11-02 18:10:33', 'admin', '2023-11-04 15:48:07', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '1', '1', 'system:post:list', 'post', 'admin', '2023-11-02 18:10:33', 'admin', '2023-11-04 15:48:14', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-11-02 18:10:33', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '1', '1', 'system:config:list', 'edit', 'admin', '2023-11-02 18:10:33', 'admin', '2023-11-04 15:48:20', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '1', '1', 'system:notice:list', 'message', 'admin', '2023-11-02 18:10:33', 'admin', '2023-11-04 15:48:29', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '1', '1', '', 'log', 'admin', '2023-11-02 18:10:33', 'admin', '2023-11-04 15:48:36', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-11-02 18:10:33', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-11-02 18:10:33', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2023-11-02 18:10:33', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-11-02 18:10:33', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2023-11-02 18:10:33', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2023-11-02 18:10:33', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-11-02 18:10:33', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-11-02 18:10:33', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-11-02 18:10:33', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-11-02 18:10:33', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-11-02 18:10:33', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-11-02 18:10:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-11-02 18:10:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-11-02 18:10:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-11-02 18:10:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-11-02 18:10:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-11-02 18:10:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-11-02 18:10:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-11-02 18:10:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-11-02 18:10:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-11-02 18:10:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-11-02 18:10:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-11-02 18:10:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-11-02 18:10:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-11-02 18:10:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-11-02 18:10:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-11-02 18:10:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-11-02 18:10:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-11-02 18:10:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-11-02 18:10:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-11-02 18:10:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '商品管理', 0, 1, 'shangpin', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'list', 'admin', '2023-11-03 08:44:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '订单管理', 0, 2, 'dingdan', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'list', 'admin', '2023-11-03 08:45:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '活动管理', 0, 3, 'huodong', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'select', 'admin', '2023-11-03 08:45:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '优惠卷管理', 0, 4, 'youhui', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'chart', 'admin', '2023-11-03 08:46:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '日志管理', 0, 5, 'yonghu', NULL, NULL, 1, 0, 'M', '0', '0', '', 'user', 'admin', '2023-11-03 08:47:21', 'admin', '2023-11-04 15:49:29', '');
INSERT INTO `sys_menu` VALUES (2005, '优惠卷管理', 2003, 1, 'procoupon', 'project/procoupon/index', NULL, 1, 0, 'C', '0', '0', 'project:procoupon:list', '#', 'admin', '2023-11-03 09:01:02', '', NULL, '优惠卷管理菜单');
INSERT INTO `sys_menu` VALUES (2006, '优惠卷管理查询', 2005, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:procoupon:query', '#', 'admin', '2023-11-03 09:01:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '优惠卷管理新增', 2005, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:procoupon:add', '#', 'admin', '2023-11-03 09:01:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '优惠卷管理修改', 2005, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:procoupon:edit', '#', 'admin', '2023-11-03 09:01:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '优惠卷管理删除', 2005, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:procoupon:remove', '#', 'admin', '2023-11-03 09:01:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '优惠卷管理导出', 2005, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:procoupon:export', '#', 'admin', '2023-11-03 09:01:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '订单管理', 2001, 1, 'order', 'project/order/index', NULL, 1, 0, 'C', '0', '0', 'project:order:list', '#', 'admin', '2023-11-03 09:05:10', '', NULL, '订单管理菜单');
INSERT INTO `sys_menu` VALUES (2012, '订单管理查询', 2011, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:order:query', '#', 'admin', '2023-11-03 09:05:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '订单管理新增', 2011, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:order:add', '#', 'admin', '2023-11-03 09:05:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '订单管理修改', 2011, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:order:edit', '#', 'admin', '2023-11-03 09:05:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '订单管理删除', 2011, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:order:remove', '#', 'admin', '2023-11-03 09:05:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '订单管理导出', 2011, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:order:export', '#', 'admin', '2023-11-03 09:05:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '商品管理', 2000, 1, 'proproduct', 'project/proproduct/index', NULL, 1, 0, 'C', '0', '0', 'project:proproduct:list', '#', 'admin', '2023-11-03 09:06:29', '', NULL, '商品管理菜单');
INSERT INTO `sys_menu` VALUES (2018, '商品管理查询', 2017, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:proproduct:query', '#', 'admin', '2023-11-03 09:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '商品管理新增', 2017, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:proproduct:add', '#', 'admin', '2023-11-03 09:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '商品管理修改', 2017, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:proproduct:edit', '#', 'admin', '2023-11-03 09:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '商品管理删除', 2017, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:proproduct:remove', '#', 'admin', '2023-11-03 09:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '商品管理导出', 2017, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:proproduct:export', '#', 'admin', '2023-11-03 09:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '活动管理', 2002, 1, 'proevents', 'project/proevents/index', NULL, 1, 0, 'C', '0', '0', 'project:proevents:list', '#', 'admin', '2023-11-03 09:07:38', '', NULL, '活动管理菜单');
INSERT INTO `sys_menu` VALUES (2024, '活动管理查询', 2023, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:proevents:query', '#', 'admin', '2023-11-03 09:07:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '活动管理新增', 2023, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:proevents:add', '#', 'admin', '2023-11-03 09:07:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '活动管理修改', 2023, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:proevents:edit', '#', 'admin', '2023-11-03 09:07:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '活动管理删除', 2023, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:proevents:remove', '#', 'admin', '2023-11-03 09:07:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '活动管理导出', 2023, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:proevents:export', '#', 'admin', '2023-11-03 09:07:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '商品分类', 2000, 1, 'proclassify', 'project/proclassify/index', NULL, 1, 0, 'C', '0', '0', 'project:proclassify:list', '#', 'admin', '2023-11-03 18:15:29', '', NULL, '商品分类菜单');
INSERT INTO `sys_menu` VALUES (2030, '商品分类查询', 2029, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:proclassify:query', '#', 'admin', '2023-11-03 18:15:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '商品分类新增', 2029, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:proclassify:add', '#', 'admin', '2023-11-03 18:15:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '商品分类修改', 2029, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:proclassify:edit', '#', 'admin', '2023-11-03 18:15:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '商品分类删除', 2029, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:proclassify:remove', '#', 'admin', '2023-11-03 18:15:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '商品分类导出', 2029, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:proclassify:export', '#', 'admin', '2023-11-03 18:15:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '日志管理', 2004, 1, 'prolog', 'project/prolog/index', NULL, 1, 0, 'C', '0', '0', 'project:prolog:list', '#', 'admin', '2023-11-03 19:55:10', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (2036, '日志管理查询', 2035, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:prolog:query', '#', 'admin', '2023-11-03 19:55:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '日志管理新增', 2035, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:prolog:add', '#', 'admin', '2023-11-03 19:55:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '日志管理修改', 2035, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:prolog:edit', '#', 'admin', '2023-11-03 19:55:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '日志管理删除', 2035, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:prolog:remove', '#', 'admin', '2023-11-03 19:55:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '日志管理导出', 2035, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:prolog:export', '#', 'admin', '2023-11-03 19:55:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '订单子集', 2001, 1, 'proorderchild', 'project/proorderchild/index', NULL, 1, 0, 'C', '1', '1', 'project:proorderchild:list', '#', 'admin', '2023-11-04 13:30:19', 'admin', '2023-11-04 15:48:57', '订单子集菜单');
INSERT INTO `sys_menu` VALUES (2042, '订单子集查询', 2041, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:proorderchild:query', '#', 'admin', '2023-11-04 13:30:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '订单子集新增', 2041, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:proorderchild:add', '#', 'admin', '2023-11-04 13:30:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, '订单子集修改', 2041, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:proorderchild:edit', '#', 'admin', '2023-11-04 13:30:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '订单子集删除', 2041, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:proorderchild:remove', '#', 'admin', '2023-11-04 13:30:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '订单子集导出', 2041, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:proorderchild:export', '#', 'admin', '2023-11-04 13:30:19', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2023-11-02 18:10:35', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-11-02 18:10:35', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(11) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(11) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(11) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 203 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 1, 'com.estore.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"商品管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"shangpin\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 08:44:38', 63);
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 1, 'com.estore.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"订单管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"dingdan\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 08:45:15', 13);
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 1, 'com.estore.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"select\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"活动管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"huodong\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 08:45:40', 10);
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 1, 'com.estore.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"优惠卷管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"youhui\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 08:46:34', 8);
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 1, 'com.estore.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"用户管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"yonghu\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 08:47:21', 9);
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 6, 'GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"pro_order,pro_coupon,pro_product\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 08:47:59', 279);
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 6, 'GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"pro_events\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 08:48:08', 35);
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 2, 'GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"order\",\"className\":\"ProOrder\",\"columns\":[{\"capJavaField\":\"OrderId\",\"columnComment\":\"订单ID\",\"columnId\":10,\"columnName\":\"order_id\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 08:47:59\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":11,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 08:47:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CountPrice\",\"columnComment\":\"订单总金额\",\"columnId\":12,\"columnName\":\"count_price\",\"columnType\":\"decimal(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 08:47:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"countPrice\",\"javaType\":\"BigDecimal\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CouponPrice\",\"columnComment\":\"优惠卷优惠的金额\",\"columnId\":13,\"columnName\":\"coupon_price\",\"columnType\":\"decimal(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 08:47:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"couponPrice\",\"javaType\":\"BigDec', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 08:52:37', 35);
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 2, 'GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"procoupon\",\"className\":\"ProCoupon\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"随机生成的券码序列号\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 08:47:59\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":2,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 08:47:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"使用状态\",\"columnId\":3,\"columnName\":\"status\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 08:47:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"status\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"表示满减，固定金额折扣还是倍率折扣\",\"columnId\":4,\"columnName\":\"type\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 08:47:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"type\",\"javaType\":\"String\",\"list\":true,\"params\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 08:53:34', 31);
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 2, 'GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"proproduct\",\"className\":\"ProProduct\",\"columns\":[{\"capJavaField\":\"ProductId\",\"columnComment\":\"商品id\",\"columnId\":17,\"columnName\":\"product_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 08:47:59\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"productId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"商品标题\",\"columnId\":18,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 08:47:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Price\",\"columnComment\":\"商品价格\",\"columnId\":19,\"columnName\":\"price\",\"columnType\":\"decimal(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 08:47:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"price\",\"javaType\":\"BigDecimal\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Image\",\"columnComment\":\"封面\",\"columnId\":20,\"columnName\":\"image\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 08:47:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"ima', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 08:54:31', 50);
INSERT INTO `sys_oper_log` VALUES (110, '代码生成', 2, 'GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"proevents\",\"className\":\"ProEvents\",\"columns\":[{\"capJavaField\":\"EventsId\",\"columnComment\":\"活动ID\",\"columnId\":26,\"columnName\":\"events_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 08:48:08\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"eventsId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"活动标题\",\"columnId\":27,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 08:48:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Content\",\"columnComment\":\"活动内容\",\"columnId\":28,\"columnName\":\"content\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 08:48:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"content\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Price\",\"columnComment\":\"活动金额\",\"columnId\":29,\"columnName\":\"price\",\"columnType\":\"decimal(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 08:48:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"price\",\"ja', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 08:55:29', 15);
INSERT INTO `sys_oper_log` VALUES (111, '代码生成', 8, 'GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"pro_coupon\"}', NULL, 0, NULL, '2023-11-03 08:58:32', 655);
INSERT INTO `sys_oper_log` VALUES (112, '代码生成', 8, 'GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"pro_order\"}', NULL, 0, NULL, '2023-11-03 09:04:03', 32);
INSERT INTO `sys_oper_log` VALUES (113, '代码生成', 8, 'GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"pro_product\"}', NULL, 0, NULL, '2023-11-03 09:05:21', 56);
INSERT INTO `sys_oper_log` VALUES (114, '代码生成', 8, 'GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"pro_events\"}', NULL, 0, NULL, '2023-11-03 09:06:32', 30);
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 6, 'GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"pro_classify\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 16:21:58', 365);
INSERT INTO `sys_oper_log` VALUES (116, '代码生成', 2, 'GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/pro_events', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 16:26:03', 104);
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 2, 'GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"proclassify\",\"className\":\"ProClassify\",\"columns\":[{\"capJavaField\":\"ClassifyId\",\"columnComment\":\"分类ID\",\"columnId\":34,\"columnName\":\"classify_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 16:21:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"classifyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"分类名称\",\"columnId\":35,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 16:21:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Sort\",\"columnComment\":\"排序\",\"columnId\":36,\"columnName\":\"sort\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 16:21:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"sort\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"zhang\",\"functionName\":\"商品分类\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"project\",\"options\":\"{\\\"parentMenuId\\\":2000}\",\"packageName\":\"com.estore.project\",\"params\":{\"parentMenuId\":2000},\"parentMenuId\":\"2000\",\"sub\":false,\"tableComment\":\"商品表\",\"tableId\":5,\"tableName\":\"pro_classify\",\"tplCategory\":\"crud\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 16:31:08', 60);
INSERT INTO `sys_oper_log` VALUES (118, '代码生成', 2, 'GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/pro_events', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 16:32:54', 1092);
INSERT INTO `sys_oper_log` VALUES (119, '代码生成', 2, 'GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/pro_product', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 16:40:11', 52);
INSERT INTO `sys_oper_log` VALUES (120, '代码生成', 2, 'GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"proclassify\",\"className\":\"ProClassify\",\"columns\":[{\"capJavaField\":\"ClassifyId\",\"columnComment\":\"分类ID\",\"columnId\":34,\"columnName\":\"classify_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 16:21:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"classifyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2023-11-03 16:31:08\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"分类名称\",\"columnId\":35,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 16:21:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2023-11-03 16:31:08\",\"usableColumn\":false},{\"capJavaField\":\"Sort\",\"columnComment\":\"排序\",\"columnId\":36,\"columnName\":\"sort\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 16:21:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"sort\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2023-11-03 16:31:08\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"zhang\",\"functionName\":\"商品分类\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"project\",\"options\":\"{\\\"parentMenuId\\\":\\\"2000\\\"}\",\"packageName\":\"com.estore.project\",\"params\":{\"parentMenuId\":\"2000\"},\"parentMenuId\":\"2000\",\"sub\":false,\"tableComment\":\"商品分类表\",\"tableId\":5,\"tab', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 18:14:00', 857);
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 8, 'GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"pro_classify\"}', NULL, 0, NULL, '2023-11-03 18:14:05', 544);
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 2, 'GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/pro_coupon', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 18:21:17', 1687);
INSERT INTO `sys_oper_log` VALUES (123, '商品分类', 1, 'com.estore.project.controller.ProClassifyController.add()', 'POST', 1, 'admin', NULL, '/project/proclassify', '127.0.0.1', '内网IP', '{\"classifyId\":1,\"name\":\"商品分类啊\",\"sort\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 18:30:33', 26);
INSERT INTO `sys_oper_log` VALUES (124, '商品分类', 1, 'com.estore.project.controller.ProClassifyController.add()', 'POST', 1, 'admin', NULL, '/project/proclassify', '127.0.0.1', '内网IP', '{\"classifyId\":2,\"name\":\"水果\",\"sort\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 18:33:15', 8);
INSERT INTO `sys_oper_log` VALUES (125, '代码生成', 2, 'GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/pro_product', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 18:34:56', 941);
INSERT INTO `sys_oper_log` VALUES (126, '商品管理', 1, 'com.estore.project.controller.ProProductController.add()', 'POST', 1, 'admin', NULL, '/project/proproduct', '127.0.0.1', '内网IP', '{\"classifyId\":\"2\",\"createTime\":\"2023-11-03 18:43:28\",\"image\":\"https://pinchanxcx.oss-cn-beijing.aliyuncs.com/1699008202189.png\",\"image2s\":\"1\",\"inventoryCount\":999,\"price\":999,\"sort\":1,\"title\":\"苹果\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'product_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\huizhu\\接口商城类\\huizu\\project\\target\\classes\\mapper\\project\\ProProductMapper.xml]\r\n### The error may involve com.estore.project.mapper.ProProductMapper.insertProProduct-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into pro_product          ( classify_id,             title,             price,             image,             image2s,             inventory_count,                          create_time,             sort )           values ( ?,             ?,             ?,             ?,             ?,             ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'product_id\' doesn\'t have a default value\n; Field \'product_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'product_id\' doesn\'t have a default value', '2023-11-03 18:43:28', 378);
INSERT INTO `sys_oper_log` VALUES (127, '商品管理', 1, 'com.estore.project.controller.ProProductController.add()', 'POST', 1, 'admin', NULL, '/project/proproduct', '127.0.0.1', '内网IP', '{\"classifyId\":\"2\",\"createTime\":\"2023-11-03 18:43:47\",\"image\":\"https://pinchanxcx.oss-cn-beijing.aliyuncs.com/1699008202189.png\",\"image2s\":\"1\",\"inventoryCount\":999,\"price\":999,\"sort\":1,\"title\":\"苹果\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 18:43:47', 127);
INSERT INTO `sys_oper_log` VALUES (128, '商品管理', 2, 'com.estore.project.controller.ProProductController.edit()', 'PUT', 1, 'admin', NULL, '/project/proproduct', '127.0.0.1', '内网IP', '{\"className\":\"水果\",\"classifyId\":\"2\",\"createTime\":\"2023-11-03 18:43:47\",\"image\":\"/profile/upload/2023/11/03/zhuchemorentoux_20231103184444A001.png\",\"image2s\":\"1\",\"inventoryCount\":999,\"price\":999,\"productId\":1,\"sort\":1,\"title\":\"苹果\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 18:44:46', 9);
INSERT INTO `sys_oper_log` VALUES (129, '商品管理', 2, 'com.estore.project.controller.ProProductController.edit()', 'PUT', 1, 'admin', NULL, '/project/proproduct', '127.0.0.1', '内网IP', '{\"className\":\"水果\",\"classifyId\":\"2\",\"createTime\":\"2023-11-03 18:43:47\",\"image\":\"/profile/upload/2023/11/03/zhuchemorentoux_20231103184444A001.png\",\"image2s\":\"1\",\"inventoryCount\":999,\"price\":999,\"productId\":1,\"salesCount\":9999,\"sort\":1,\"title\":\"苹果\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 18:47:05', 3);
INSERT INTO `sys_oper_log` VALUES (130, '代码生成', 2, 'GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"proevents\",\"className\":\"ProEvents\",\"columns\":[{\"capJavaField\":\"EventsId\",\"columnComment\":\"活动ID\",\"columnId\":26,\"columnName\":\"events_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 08:48:08\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"eventsId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-11-03 16:32:54\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"活动标题\",\"columnId\":27,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 08:48:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-11-03 16:32:54\",\"usableColumn\":false},{\"capJavaField\":\"Image\",\"columnComment\":\"活动封面\",\"columnId\":39,\"columnName\":\"image\",\"columnType\":\"varchar(255)\",\"createBy\":\"\",\"createTime\":\"2023-11-03 16:32:54\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"image\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Content\",\"columnComment\":\"活动内容\",\"columnId\":28,\"columnName\":\"content\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 08:48:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 18:50:49', 164);
INSERT INTO `sys_oper_log` VALUES (131, '代码生成', 6, 'GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_user\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 19:00:20', 2079);
INSERT INTO `sys_oper_log` VALUES (132, '代码生成', 2, 'GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"prouser\",\"className\":\"SysUser\",\"columns\":[{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":42,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 19:00:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"部门ID\",\"columnId\":43,\"columnName\":\"dept_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 19:00:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"用户账号\",\"columnId\":44,\"columnName\":\"user_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 19:00:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"NickName\",\"columnComment\":\"用户昵称\",\"columnId\":45,\"columnName\":\"nick_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 19:00:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"nickName\",\"javaType\":\"String', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 19:01:14', 1044);
INSERT INTO `sys_oper_log` VALUES (133, '代码生成', 8, 'GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_user\"}', NULL, 0, NULL, '2023-11-03 19:02:38', 84);
INSERT INTO `sys_oper_log` VALUES (134, '代码生成', 6, 'GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"pro_log\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 19:52:59', 530);
INSERT INTO `sys_oper_log` VALUES (135, '代码生成', 2, 'GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"prolog\",\"className\":\"ProLog\",\"columns\":[{\"capJavaField\":\"LogId\",\"columnComment\":\"日志ID\",\"columnId\":61,\"columnName\":\"log_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 19:52:59\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"logId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"请求用户\",\"columnId\":62,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 19:52:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Method\",\"columnComment\":\"访问方法名\",\"columnId\":63,\"columnName\":\"method\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 19:52:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"method\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PackageName\",\"columnComment\":\"访问包名\",\"columnId\":64,\"columnName\":\"package_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 19:52:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"packageName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"que', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 19:53:40', 231);
INSERT INTO `sys_oper_log` VALUES (136, '代码生成', 8, 'GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"pro_log\"}', NULL, 0, NULL, '2023-11-03 19:53:47', 1052);
INSERT INTO `sys_oper_log` VALUES (137, '部门管理', 2, 'com.estore.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"我的商城\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 21:04:15', 87);
INSERT INTO `sys_oper_log` VALUES (138, '用户管理', 2, 'com.estore.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"昵称\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[2],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"123456\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 21:06:17', 159);
INSERT INTO `sys_oper_log` VALUES (139, '角色管理', 2, 'com.estore.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-11-02 18:10:33\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 21:10:20', 199);
INSERT INTO `sys_oper_log` VALUES (140, '角色管理', 2, 'com.estore.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-11-02 18:10:33\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 21:11:16', 157);
INSERT INTO `sys_oper_log` VALUES (141, '代码生成', 2, 'GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/pro_coupon', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 09:57:02', 551);
INSERT INTO `sys_oper_log` VALUES (142, '活动管理', 1, 'com.estore.project.controller.ProEventsController.add()', 'POST', 1, 'admin', NULL, '/project/proevents', '127.0.0.1', '内网IP', '{\"classifyId\":2,\"content\":\"内容介绍....\",\"createTime\":\"2023-11-04 10:15:25\",\"eventsId\":1,\"image\":\"/profile/upload/2023/11/04/zhuchemorentoux_20231104101514A001.png\",\"scale\":0.8,\"title\":\"水果类商品8折\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 10:15:25', 81);
INSERT INTO `sys_oper_log` VALUES (143, '商品管理', 1, 'com.estore.project.controller.ProProductController.add()', 'POST', 1, 'admin', NULL, '/project/proproduct', '127.0.0.1', '内网IP', '{\"classifyId\":1,\"createTime\":\"2023-11-04 10:41:11\",\"image\":\"/profile/upload/2023/11/04/彩票_20231104104054A001.png\",\"image2s\":\"1\",\"inventoryCount\":999,\"price\":888,\"salesCount\":0,\"sort\":1,\"title\":\"测试商品\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 10:41:12', 412);
INSERT INTO `sys_oper_log` VALUES (144, '字典类型', 1, 'com.estore.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"优惠卷类型\",\"dictType\":\"pro_coupon_type\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 11:04:18', 50);
INSERT INTO `sys_oper_log` VALUES (145, '字典类型', 1, 'com.estore.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"优惠卷状态\",\"dictType\":\"pro_coupon_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 11:04:38', 10);
INSERT INTO `sys_oper_log` VALUES (146, '代码生成', 2, 'GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"procoupon\",\"className\":\"ProCoupon\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"随机生成的券码序列号\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 08:47:59\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-11-04 09:57:01\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":2,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 08:47:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-11-04 09:57:01\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"使用状态\",\"columnId\":3,\"columnName\":\"status\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 08:47:59\",\"dictType\":\"pro_coupon_status\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"status\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-11-04 09:57:01\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"1 金额 2比例 固定金额折扣还是倍率折扣\",\"columnId\":4,\"columnName\":\"type\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 08:47:59\",\"dictType\":\"pro_coupon_type\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncreme', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 11:05:35', 176);
INSERT INTO `sys_oper_log` VALUES (147, '字典数据', 1, 'com.estore.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"满减\",\"dictSort\":0,\"dictType\":\"pro_coupon_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 11:10:17', 75);
INSERT INTO `sys_oper_log` VALUES (148, '字典数据', 1, 'com.estore.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"2\",\"dictSort\":0,\"dictType\":\"pro_coupon_type\",\"dictValue\":\"比例\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 11:10:29', 13);
INSERT INTO `sys_oper_log` VALUES (149, '字典数据', 2, 'com.estore.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-11-04 11:10:29\",\"default\":false,\"dictCode\":101,\"dictLabel\":\"比例\",\"dictSort\":0,\"dictType\":\"pro_coupon_type\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 11:10:35', 16);
INSERT INTO `sys_oper_log` VALUES (150, '字典数据', 1, 'com.estore.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"待使用\",\"dictSort\":0,\"dictType\":\"pro_coupon_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 11:10:48', 15);
INSERT INTO `sys_oper_log` VALUES (151, '字典数据', 1, 'com.estore.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"2\",\"dictSort\":0,\"dictType\":\"pro_coupon_status\",\"dictValue\":\"已使用\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 11:10:57', 13);
INSERT INTO `sys_oper_log` VALUES (152, '字典数据', 2, 'com.estore.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-11-04 11:10:57\",\"default\":false,\"dictCode\":103,\"dictLabel\":\"已使用\",\"dictSort\":0,\"dictType\":\"pro_coupon_status\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 11:11:04', 16);
INSERT INTO `sys_oper_log` VALUES (153, '字典数据', 1, 'com.estore.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已过期\",\"dictSort\":0,\"dictType\":\"pro_coupon_status\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 11:11:11', 11);
INSERT INTO `sys_oper_log` VALUES (154, '优惠卷管理', 1, 'com.estore.project.controller.ProCouponController.add()', 'POST', 1, 'admin', NULL, '/project/procoupon', '127.0.0.1', '内网IP', '{\"activeTime\":\"2023-11-29\",\"condition\":\"10000\",\"createTime\":\"2023-11-04 11:30:02\",\"discount\":\"100\",\"expiredTime\":\"2023-11-30\",\"range\":\"1,2\",\"status\":\"1\",\"type\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'condition,\n            active_time,\n            expired_time,\n            range,\' at line 5\r\n### The error may exist in file [E:\\huizhu\\接口商城类\\huizu\\project\\target\\classes\\mapper\\project\\ProCouponMapper.xml]\r\n### The error may involve com.estore.project.mapper.ProCouponMapper.insertProCoupon-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into pro_coupon          ( status,             type,             discount,             condition,             active_time,             expired_time,             range,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'condition,\n            active_time,\n            expired_time,\n            range,\' at line 5\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'condition,\n            active_time,\n            expired_time,\n            range,\' at line 5', '2023-11-04 11:30:02', 156);
INSERT INTO `sys_oper_log` VALUES (155, '优惠卷管理', 1, 'com.estore.project.controller.ProCouponController.add()', 'POST', 1, 'admin', NULL, '/project/procoupon', '127.0.0.1', '内网IP', '{\"activeTime\":\"2023-11-01\",\"condition\":\"100\",\"createTime\":\"2023-11-04 11:31:59\",\"discount\":\"11\",\"expiredTime\":\"2023-11-30\",\"range\":\"2,1\",\"status\":\"1\",\"type\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'condition,\n            active_time,\n            expired_time,\n            range,\' at line 5\r\n### The error may exist in file [E:\\huizhu\\接口商城类\\huizu\\project\\target\\classes\\mapper\\project\\ProCouponMapper.xml]\r\n### The error may involve com.estore.project.mapper.ProCouponMapper.insertProCoupon-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into pro_coupon          ( status,             type,             discount,             condition,             active_time,             expired_time,             range,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'condition,\n            active_time,\n            expired_time,\n            range,\' at line 5\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'condition,\n            active_time,\n            expired_time,\n            range,\' at line 5', '2023-11-04 11:31:59', 4);
INSERT INTO `sys_oper_log` VALUES (156, '优惠卷管理', 1, 'com.estore.project.controller.ProCouponController.add()', 'POST', 1, 'admin', NULL, '/project/procoupon', '127.0.0.1', '内网IP', '{\"activeTime\":\"2023-11-29\",\"condition\":\"999\",\"createTime\":\"2023-11-04 11:33:54\",\"discount\":\"10\",\"expiredTime\":\"2023-11-30\",\"range\":\"1,2\",\"status\":\"1\",\"type\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 11:33:55', 73);
INSERT INTO `sys_oper_log` VALUES (157, '优惠卷管理', 2, 'com.estore.project.controller.ProCouponController.edit()', 'PUT', 1, 'admin', NULL, '/project/procoupon', '127.0.0.1', '内网IP', '{\"activeTime\":\"2023-11-04\",\"condition\":\"100\",\"discount\":\"0.8\",\"expiredTime\":\"2023-11-05\",\"id\":1,\"range\":\"2,1\",\"status\":\"1\",\"type\":\"2\",\"userId\":103}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 11:38:50', 12);
INSERT INTO `sys_oper_log` VALUES (158, '代码生成', 6, 'GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"pro_order_child\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 13:28:01', 945);
INSERT INTO `sys_oper_log` VALUES (159, '代码生成', 2, 'GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"proorderchild\",\"className\":\"ProOrderChild\",\"columns\":[{\"capJavaField\":\"ChildId\",\"columnComment\":\"子集ID\",\"columnId\":69,\"columnName\":\"child_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-11-04 13:28:01\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"childId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OrderId\",\"columnComment\":\"订单ID\",\"columnId\":70,\"columnName\":\"order_id\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-04 13:28:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProductId\",\"columnComment\":\"商品ID\",\"columnId\":71,\"columnName\":\"product_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-11-04 13:28:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"productId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Count\",\"columnComment\":\"购买数量\",\"columnId\":72,\"columnName\":\"count\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-11-04 13:28:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"count\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"q', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 13:28:38', 147);
INSERT INTO `sys_oper_log` VALUES (160, '代码生成', 8, 'GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"pro_order_child\"}', NULL, 0, NULL, '2023-11-04 13:28:57', 1092);
INSERT INTO `sys_oper_log` VALUES (161, '代码生成', 2, 'GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/pro_order_child', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 13:46:00', 594);
INSERT INTO `sys_oper_log` VALUES (162, '代码生成', 2, 'GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/pro_order', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 14:06:52', 847);
INSERT INTO `sys_oper_log` VALUES (163, '日志管理', 3, 'com.estore.project.controller.ProLogController.remove()', 'DELETE', 1, 'admin', NULL, '/project/prolog/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 14:51:05', 114);
INSERT INTO `sys_oper_log` VALUES (164, '优惠卷管理', 2, 'com.estore.project.controller.ProCouponController.edit()', 'PUT', 1, 'admin', NULL, '/project/procoupon', '127.0.0.1', '内网IP', '{\"activeTime\":\"2023-11-04\",\"condition\":100,\"discount\":20,\"expiredTime\":\"2023-11-05\",\"id\":2,\"range\":\"2,1\",\"status\":\"1\",\"type\":\"1\",\"userId\":103}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 14:51:21', 1507);
INSERT INTO `sys_oper_log` VALUES (165, '优惠卷管理', 2, 'com.estore.project.controller.ProCouponController.edit()', 'PUT', 1, 'admin', NULL, '/project/procoupon', '127.0.0.1', '内网IP', '{\"activeTime\":\"2023-11-04\",\"condition\":100,\"discount\":20,\"expiredTime\":\"2023-11-05\",\"id\":2,\"range\":\"2,1\",\"status\":\"1\",\"type\":\"1\",\"userId\":103}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 15:03:59', 4);
INSERT INTO `sys_oper_log` VALUES (166, '优惠卷管理', 2, 'com.estore.project.controller.ProCouponController.edit()', 'PUT', 1, 'admin', NULL, '/project/procoupon', '127.0.0.1', '内网IP', '{\"activeTime\":\"2023-11-04\",\"condition\":100,\"discount\":20,\"expiredTime\":\"2023-11-05\",\"id\":2,\"range\":\"2,1\",\"status\":\"1\",\"type\":\"1\",\"userId\":103}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 15:04:44', 3);
INSERT INTO `sys_oper_log` VALUES (167, '优惠卷管理', 2, 'com.estore.project.controller.ProCouponController.edit()', 'PUT', 1, 'admin', NULL, '/project/procoupon', '127.0.0.1', '内网IP', '{\"activeTime\":\"2023-11-04\",\"condition\":100,\"discount\":0.8,\"expiredTime\":\"2023-11-07\",\"id\":1,\"range\":\"2,1\",\"status\":\"1\",\"type\":\"2\",\"userId\":103}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 15:07:57', 0);
INSERT INTO `sys_oper_log` VALUES (168, '字典类型', 3, 'com.estore.web.controller.system.SysDictDataController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dict/data/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 15:08:34', 73);
INSERT INTO `sys_oper_log` VALUES (169, '菜单管理', 2, 'com.estore.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2023-11-02 18:10:33\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"部门管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 15:48:08', 191);
INSERT INTO `sys_oper_log` VALUES (170, '菜单管理', 2, 'com.estore.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/post/index\",\"createTime\":\"2023-11-02 18:10:33\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":104,\"menuName\":\"岗位管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1,\"path\":\"post\",\"perms\":\"system:post:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 15:48:14', 118);
INSERT INTO `sys_oper_log` VALUES (171, '菜单管理', 2, 'com.estore.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/config/index\",\"createTime\":\"2023-11-02 18:10:33\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":106,\"menuName\":\"参数设置\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":1,\"path\":\"config\",\"perms\":\"system:config:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 15:48:20', 13);
INSERT INTO `sys_oper_log` VALUES (172, '菜单管理', 2, 'com.estore.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/notice/index\",\"createTime\":\"2023-11-02 18:10:33\",\"icon\":\"message\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":107,\"menuName\":\"通知公告\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":1,\"path\":\"notice\",\"perms\":\"system:notice:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 15:48:29', 13);
INSERT INTO `sys_oper_log` VALUES (173, '菜单管理', 2, 'com.estore.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2023-11-02 18:10:33\",\"icon\":\"log\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":108,\"menuName\":\"日志管理\",\"menuType\":\"M\",\"orderNum\":9,\"params\":{},\"parentId\":1,\"path\":\"log\",\"perms\":\"\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 15:48:36', 22);
INSERT INTO `sys_oper_log` VALUES (174, '菜单管理', 2, 'com.estore.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-11-02 18:10:33\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 15:48:48', 12);
INSERT INTO `sys_oper_log` VALUES (175, '菜单管理', 2, 'com.estore.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"project/proorderchild/index\",\"createTime\":\"2023-11-04 13:30:19\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2041,\"menuName\":\"订单子集\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"proorderchild\",\"perms\":\"project:proorderchild:list\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 15:48:57', 65);
INSERT INTO `sys_oper_log` VALUES (176, '菜单管理', 2, 'com.estore.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-11-02 18:10:33\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 15:49:03', 10);
INSERT INTO `sys_oper_log` VALUES (177, '菜单管理', 2, 'com.estore.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-11-02 18:10:33\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 15:49:07', 25);
INSERT INTO `sys_oper_log` VALUES (178, '菜单管理', 2, 'com.estore.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-11-03 08:47:21\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"日志管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"yonghu\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 15:49:29', 9);
INSERT INTO `sys_oper_log` VALUES (179, '菜单管理', 2, 'com.estore.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/menu/index\",\"createTime\":\"2023-11-02 18:10:33\",\"icon\":\"tree-table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":102,\"menuName\":\"菜单管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":1,\"path\":\"menu\",\"perms\":\"system:menu:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 16:02:30', 13);
INSERT INTO `sys_oper_log` VALUES (180, '日志管理', 3, 'com.estore.project.controller.ProLogController.remove()', 'DELETE', 1, 'admin', NULL, '/project/prolog/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 16:06:23', 73);
INSERT INTO `sys_oper_log` VALUES (181, '日志管理', 3, 'com.estore.project.controller.ProLogController.remove()', 'DELETE', 1, 'admin', NULL, '/project/prolog/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 16:06:24', 31);
INSERT INTO `sys_oper_log` VALUES (182, '日志管理', 3, 'com.estore.project.controller.ProLogController.remove()', 'DELETE', 1, 'admin', NULL, '/project/prolog/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 16:06:26', 8);
INSERT INTO `sys_oper_log` VALUES (183, '日志管理', 3, 'com.estore.project.controller.ProLogController.remove()', 'DELETE', 1, 'admin', NULL, '/project/prolog/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 16:06:28', 13);
INSERT INTO `sys_oper_log` VALUES (184, '日志管理', 3, 'com.estore.project.controller.ProLogController.remove()', 'DELETE', 1, 'admin', NULL, '/project/prolog/6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 16:06:30', 7);
INSERT INTO `sys_oper_log` VALUES (185, '日志管理', 3, 'com.estore.project.controller.ProLogController.remove()', 'DELETE', 1, 'admin', NULL, '/project/prolog/7', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 16:06:32', 5);
INSERT INTO `sys_oper_log` VALUES (186, '日志管理', 3, 'com.estore.project.controller.ProLogController.remove()', 'DELETE', 1, 'admin', NULL, '/project/prolog/8', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-04 16:06:33', 6);
INSERT INTO `sys_oper_log` VALUES (187, '商品管理', 2, 'com.estore.project.controller.ProProductController.edit()', 'PUT', 1, 'admin', NULL, '/project/proproduct', '182.45.245.154', 'XX XX', '{\"classifyId\":1,\"classifyName\":\"商品分类啊\",\"createTime\":\"2023-11-04 10:41:11\",\"eventsPrice\":888,\"image\":\"/profile/upload/2023/11/06/头像_20231106092127A001.png\",\"image2s\":\"1\",\"inventoryCount\":999,\"price\":888,\"productId\":2,\"salesCount\":0,\"sort\":1,\"title\":\"测试商品\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-06 09:21:33', 18);
INSERT INTO `sys_oper_log` VALUES (188, '活动管理', 1, 'com.estore.project.controller.ProEventsController.add()', 'POST', 1, 'admin', NULL, '/project/proevents', '182.45.245.154', 'XX XX', '{\"classifyId\":2,\"createTime\":\"2023-11-06 10:32:46\",\"scale\":0,\"title\":\"12212\"}', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'class\'\n### The error may exist in URL [jar:file:/www/SpringBootProjects/scapp/商城后台接口.jar!/BOOT-INF/lib/project-3.8.6.jar!/mapper/project/ProEventsMapper.xml]\n### The error may involve com.estore.project.mapper.ProEventsMapper.insertProEvents-Inline\n### The error occurred while setting parameters\n### SQL: insert into pro_events          ( title,                                                    scale,             classify_id,             create_time )           values ( ?,                                                    ?,             ?,             ? )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'class\'\n; Duplicate entry \'2\' for key \'class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'class\'', '2023-11-06 10:32:46', 90);
INSERT INTO `sys_oper_log` VALUES (189, '代码生成', 6, 'GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"pro_address,pro_shopping\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 11:42:20', 1990);
INSERT INTO `sys_oper_log` VALUES (190, '代码生成', 2, 'GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"proaddress\",\"className\":\"ProAddress\",\"columns\":[{\"capJavaField\":\"AddressId\",\"columnComment\":\"地址ID\",\"columnId\":76,\"columnName\":\"address_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-07 11:42:18\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"addressId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":77,\"columnName\":\"user_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-07 11:42:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PositionProvince\",\"columnComment\":\"省\",\"columnId\":78,\"columnName\":\"position_province\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-07 11:42:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"positionProvince\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PositonCity\",\"columnComment\":\"市\",\"columnId\":79,\"columnName\":\"positon_city\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-07 11:42:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"positonCity\",\"javaT', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 11:42:57', 781);
INSERT INTO `sys_oper_log` VALUES (191, '代码生成', 2, 'GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"proshopping\",\"className\":\"ProShopping\",\"columns\":[{\"capJavaField\":\"ShoppingId\",\"columnComment\":\"购物车ID\",\"columnId\":86,\"columnName\":\"shopping_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-07 11:42:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"shoppingId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":87,\"columnName\":\"user_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-07 11:42:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProductId\",\"columnComment\":\"商品ID\",\"columnId\":88,\"columnName\":\"product_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-07 11:42:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"productId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Count\",\"columnComment\":\"数量\",\"columnId\":89,\"columnName\":\"count\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-07 11:42:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"count\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 11:58:50', 409);
INSERT INTO `sys_oper_log` VALUES (192, '代码生成', 8, 'GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"pro_address\"}', NULL, 0, NULL, '2023-11-07 11:59:02', 420);
INSERT INTO `sys_oper_log` VALUES (193, '代码生成', 8, 'GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"pro_address\"}', NULL, 0, NULL, '2023-11-07 17:51:52', 753);
INSERT INTO `sys_oper_log` VALUES (194, '代码生成', 2, 'GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"proaddress\",\"className\":\"ProAddress\",\"columns\":[{\"capJavaField\":\"AddressId\",\"columnComment\":\"地址ID\",\"columnId\":76,\"columnName\":\"address_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-07 11:42:18\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"addressId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2023-11-07 11:42:57\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":77,\"columnName\":\"user_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-07 11:42:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2023-11-07 11:42:57\",\"usableColumn\":false},{\"capJavaField\":\"PositionProvince\",\"columnComment\":\"省\",\"columnId\":78,\"columnName\":\"position_province\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-07 11:42:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"positionProvince\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2023-11-07 11:42:57\",\"usableColumn\":false},{\"capJavaField\":\"PositonCity\",\"columnComment\":\"市\",\"columnId\":79,\"columnName\":\"positon_city\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-07 11:42:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 17:53:10', 791);
INSERT INTO `sys_oper_log` VALUES (195, '代码生成', 8, 'GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"pro_shopping\"}', NULL, 0, NULL, '2023-11-07 17:56:24', 532);
INSERT INTO `sys_oper_log` VALUES (196, '代码生成', 8, 'GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"pro_shopping\"}', NULL, 0, NULL, '2023-11-07 17:58:00', 95);
INSERT INTO `sys_oper_log` VALUES (197, '代码生成', 2, 'GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/pro_order_child', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 10:40:08', 813);
INSERT INTO `sys_oper_log` VALUES (198, '代码生成', 2, 'GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/pro_order', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 11:18:29', 1558);
INSERT INTO `sys_oper_log` VALUES (199, '代码生成', 2, 'GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/pro_order', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 11:19:54', 1217);
INSERT INTO `sys_oper_log` VALUES (200, '代码生成', 2, 'GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/pro_address', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 11:19:59', 903);
INSERT INTO `sys_oper_log` VALUES (201, '商品管理', 2, 'com.estore.project.controller.ProProductController.edit()', 'PUT', 1, 'admin', NULL, '/project/proproduct', '127.0.0.1', '内网IP', '{\"classifyId\":2,\"classifyName\":\"水果\",\"createTime\":\"2023-11-03 18:43:47\",\"eventsPrice\":799.2,\"eventsTitle\":\"水果类商品8折\",\"image\":\"/profile/upload/2023/11/03/zhuchemorentoux_20231103184444A001.png\",\"image2s\":\"1\",\"inventoryCount\":1000,\"price\":999,\"productId\":1,\"salesCount\":10001,\"scale\":0.8,\"sort\":1,\"title\":\"苹果\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-15 10:47:38', 106);
INSERT INTO `sys_oper_log` VALUES (202, '商品管理', 2, 'com.estore.project.controller.ProProductController.edit()', 'PUT', 1, 'admin', NULL, '/project/proproduct', '127.0.0.1', '内网IP', '{\"classifyId\":1,\"classifyName\":\"商品分类啊\",\"createTime\":\"2023-11-04 10:41:11\",\"eventsPrice\":888,\"image\":\"/profile/upload/2023/11/06/头像_20231106092127A001.png\",\"image2s\":\"1\",\"inventoryCount\":88,\"price\":888,\"productId\":2,\"salesCount\":0,\"sort\":1,\"title\":\"测试商品\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-15 10:55:41', 89);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(11) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-11-02 18:10:33', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-11-02 18:10:33', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(11) NOT NULL COMMENT '显示顺序',
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
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-11-02 18:10:33', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-11-02 18:10:33', 'admin', '2023-11-03 21:11:16', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------

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
  `balance` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '余额',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`user_name`) USING BTREE COMMENT '用户账号唯一'
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '管理员', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-11-15 10:46:12', 'admin', '2023-11-02 18:10:33', '', '2023-11-15 10:46:11', '管理员', 999999.00);
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '测试', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-11-02 18:10:33', 'admin', '2023-11-02 18:10:33', '', NULL, '测试员', 999999.00);
INSERT INTO `sys_user` VALUES (100, NULL, '123456', '昵称', '00', '', '', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-11-03 21:10:33', '', NULL, 'admin', '2023-11-03 21:10:32', NULL, 999999.00);
INSERT INTO `sys_user` VALUES (102, NULL, 'zhang', '用户dGBBNG', '00', '', '', '0', '', '$2a$10$3kAUqK5Xc311B230eXdjqO5zgS10SKXn6od./kHH5JSrhO4E/PJTS', '0', '0', '', NULL, '', '2023-11-04 08:46:48', '', NULL, NULL, 999999.00);
INSERT INTO `sys_user` VALUES (103, NULL, '123456789', '修改个昵称哈', '00', '', '', '0', '', '$2a$10$nOkfQIfVpTzTh23ZEDwGyeYGy6nWmjkj4B0k4jBNfGtakH0BNP1nS', '0', '0', '', NULL, '', '2023-11-04 09:11:07', '', NULL, NULL, 999999.00);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (100, 2);

SET FOREIGN_KEY_CHECKS = 1;

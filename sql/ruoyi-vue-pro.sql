/*
 Navicat Premium Data Transfer

 Source Server         : service
 Source Server Type    : MySQL
 Source Server Version : 50743
 Source Host           : localhost:3306
 Source Schema         : ruoyi-vue-pro

 Target Server Type    : MySQL
 Target Server Version : 50743
 File Encoding         : 65001

 Date: 29/11/2023 15:42:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for act_evt_log
-- ----------------------------
DROP TABLE IF EXISTS `act_evt_log`;
CREATE TABLE `act_evt_log`  (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DATA_` longblob NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) NULL DEFAULT 0,
  PRIMARY KEY (`LOG_NR_`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_evt_log
-- ----------------------------

-- ----------------------------
-- Table structure for act_ge_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_bytearray`;
CREATE TABLE `act_ge_bytearray`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BYTES_` longblob NULL,
  `GENERATED_` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_FK_BYTEARR_DEPL`(`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ge_bytearray
-- ----------------------------

-- ----------------------------
-- Table structure for act_ge_property
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_property`;
CREATE TABLE `act_ge_property`  (
  `NAME_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`NAME_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ge_property
-- ----------------------------
INSERT INTO `act_ge_property` VALUES ('batch.schema.version', '6.8.0.0', 1);
INSERT INTO `act_ge_property` VALUES ('cfg.execution-related-entities-count', 'true', 1);
INSERT INTO `act_ge_property` VALUES ('cfg.task-related-entities-count', 'true', 1);
INSERT INTO `act_ge_property` VALUES ('common.schema.version', '6.8.0.0', 1);
INSERT INTO `act_ge_property` VALUES ('entitylink.schema.version', '6.8.0.0', 1);
INSERT INTO `act_ge_property` VALUES ('eventsubscription.schema.version', '6.8.0.0', 1);
INSERT INTO `act_ge_property` VALUES ('identitylink.schema.version', '6.8.0.0', 1);
INSERT INTO `act_ge_property` VALUES ('job.schema.version', '6.8.0.0', 1);
INSERT INTO `act_ge_property` VALUES ('next.dbid', '1', 1);
INSERT INTO `act_ge_property` VALUES ('schema.history', 'create(6.8.0.0)', 1);
INSERT INTO `act_ge_property` VALUES ('schema.version', '6.8.0.0', 1);
INSERT INTO `act_ge_property` VALUES ('task.schema.version', '6.8.0.0', 1);
INSERT INTO `act_ge_property` VALUES ('variable.schema.version', '6.8.0.0', 1);

-- ----------------------------
-- Table structure for act_hi_actinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_actinst`;
CREATE TABLE `act_hi_actinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT 1,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `TRANSACTION_ORDER_` int(11) NULL DEFAULT NULL,
  `DURATION_` bigint(20) NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_START`(`START_TIME_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_END`(`END_TIME_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_PROCINST`(`PROC_INST_ID_`, `ACT_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_EXEC`(`EXECUTION_ID_`, `ACT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_actinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_attachment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_attachment`;
CREATE TABLE `act_hi_attachment`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CONTENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_comment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_comment`;
CREATE TABLE `act_hi_comment`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACTION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `MESSAGE_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `FULL_MSG_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_comment
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_detail
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_detail`;
CREATE TABLE `act_hi_detail`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DOUBLE_` double NULL DEFAULT NULL,
  `LONG_` bigint(20) NULL DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_PROC_INST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_ACT_INST`(`ACT_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_TIME`(`TIME_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_NAME`(`NAME_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_TASK_ID`(`TASK_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_detail
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_entitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_entitylink`;
CREATE TABLE `act_hi_entitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LINK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ROOT_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ROOT_SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_ENT_LNK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`, `LINK_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_ENT_LNK_REF_SCOPE`(`REF_SCOPE_ID_`, `REF_SCOPE_TYPE_`, `LINK_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_ENT_LNK_ROOT_SCOPE`(`ROOT_SCOPE_ID_`, `ROOT_SCOPE_TYPE_`, `LINK_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_ENT_LNK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`, `LINK_TYPE_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_entitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_identitylink`;
CREATE TABLE `act_hi_identitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_USER`(`USER_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_TASK`(`TASK_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_PROCINST`(`PROC_INST_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_procinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_procinst`;
CREATE TABLE `act_hi_procinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT 1,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `DURATION_` bigint(20) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `END_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BUSINESS_STATUS_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `PROC_INST_ID_`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_PRO_INST_END`(`END_TIME_`) USING BTREE,
  INDEX `ACT_IDX_HI_PRO_I_BUSKEY`(`BUSINESS_KEY_`) USING BTREE,
  INDEX `ACT_IDX_HI_PRO_SUPER_PROCINST`(`SUPER_PROCESS_INSTANCE_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_procinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_taskinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_taskinst`;
CREATE TABLE `act_hi_taskinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT 1,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) NULL DEFAULT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `DURATION_` bigint(20) NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PRIORITY_` int(11) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) NULL DEFAULT NULL,
  `FORM_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `LAST_UPDATED_TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_INST_PROCINST`(`PROC_INST_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_taskinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_tsk_log
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_tsk_log`;
CREATE TABLE `act_hi_tsk_log`  (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DATA_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_tsk_log
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_varinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_varinst`;
CREATE TABLE `act_hi_varinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT 1,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DOUBLE_` double NULL DEFAULT NULL,
  `LONG_` bigint(20) NULL DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_NAME_TYPE`(`NAME_`, `VAR_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_VAR_SCOPE_ID_TYPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_VAR_SUB_ID_TYPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_PROC_INST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_TASK_ID`(`TASK_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_EXE`(`EXECUTION_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_varinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `act_id_bytearray`;
CREATE TABLE `act_id_bytearray`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BYTES_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_bytearray
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_group
-- ----------------------------
DROP TABLE IF EXISTS `act_id_group`;
CREATE TABLE `act_id_group`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_group
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_info
-- ----------------------------
DROP TABLE IF EXISTS `act_id_info`;
CREATE TABLE `act_id_info`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `USER_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `VALUE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PASSWORD_` longblob NULL,
  `PARENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_info
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_membership
-- ----------------------------
DROP TABLE IF EXISTS `act_id_membership`;
CREATE TABLE `act_id_membership`  (
  `USER_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`, `GROUP_ID_`) USING BTREE,
  INDEX `ACT_FK_MEMB_GROUP`(`GROUP_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_membership
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_priv
-- ----------------------------
DROP TABLE IF EXISTS `act_id_priv`;
CREATE TABLE `act_id_priv`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_UNIQ_PRIV_NAME`(`NAME_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_priv
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_priv_mapping
-- ----------------------------
DROP TABLE IF EXISTS `act_id_priv_mapping`;
CREATE TABLE `act_id_priv_mapping`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PRIV_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_FK_PRIV_MAPPING`(`PRIV_ID_`) USING BTREE,
  INDEX `ACT_IDX_PRIV_USER`(`USER_ID_`) USING BTREE,
  INDEX `ACT_IDX_PRIV_GROUP`(`GROUP_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_PRIV_MAPPING` FOREIGN KEY (`PRIV_ID_`) REFERENCES `act_id_priv` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_priv_mapping
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_property
-- ----------------------------
DROP TABLE IF EXISTS `act_id_property`;
CREATE TABLE `act_id_property`  (
  `NAME_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`NAME_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_property
-- ----------------------------
INSERT INTO `act_id_property` VALUES ('schema.version', '6.8.0.0', 1);

-- ----------------------------
-- Table structure for act_id_token
-- ----------------------------
DROP TABLE IF EXISTS `act_id_token`;
CREATE TABLE `act_id_token`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TOKEN_VALUE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TOKEN_DATE_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `IP_ADDRESS_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_AGENT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TOKEN_DATA_` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_token
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_user
-- ----------------------------
DROP TABLE IF EXISTS `act_id_user`;
CREATE TABLE `act_id_user`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `FIRST_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LAST_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DISPLAY_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EMAIL_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PWD_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PICTURE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_user
-- ----------------------------

-- ----------------------------
-- Table structure for act_procdef_info
-- ----------------------------
DROP TABLE IF EXISTS `act_procdef_info`;
CREATE TABLE `act_procdef_info`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_UNIQ_INFO_PROCDEF`(`PROC_DEF_ID_`) USING BTREE,
  INDEX `ACT_IDX_INFO_PROCDEF`(`PROC_DEF_ID_`) USING BTREE,
  INDEX `ACT_FK_INFO_JSON_BA`(`INFO_JSON_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_procdef_info
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_re_deployment`;
CREATE TABLE `act_re_deployment`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_re_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_model
-- ----------------------------
DROP TABLE IF EXISTS `act_re_model`;
CREATE TABLE `act_re_model`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) NULL DEFAULT NULL,
  `META_INFO_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_FK_MODEL_SOURCE`(`EDITOR_SOURCE_VALUE_ID_`) USING BTREE,
  INDEX `ACT_FK_MODEL_SOURCE_EXTRA`(`EDITOR_SOURCE_EXTRA_VALUE_ID_`) USING BTREE,
  INDEX `ACT_FK_MODEL_DEPLOYMENT`(`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_re_model
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_procdef
-- ----------------------------
DROP TABLE IF EXISTS `act_re_procdef`;
CREATE TABLE `act_re_procdef`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) NULL DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) NULL DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `ENGINE_VERSION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DERIVED_VERSION_` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_UNIQ_PROCDEF`(`KEY_`, `VERSION_`, `DERIVED_VERSION_`, `TENANT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_re_procdef
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_actinst
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_actinst`;
CREATE TABLE `act_ru_actinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT 1,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `DURATION_` bigint(20) NULL DEFAULT NULL,
  `TRANSACTION_ORDER_` int(11) NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_START`(`START_TIME_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_END`(`END_TIME_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_PROC`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_PROC_ACT`(`PROC_INST_ID_`, `ACT_ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_EXEC`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_EXEC_ACT`(`EXECUTION_ID_`, `ACT_ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_TASK`(`TASK_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_actinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_deadletter_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_deadletter_job`;
CREATE TABLE `act_ru_deadletter_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_DEADLETTER_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_`) USING BTREE,
  INDEX `ACT_IDX_DEADLETTER_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_`) USING BTREE,
  INDEX `ACT_IDX_DEADLETTER_JOB_CORRELATION_ID`(`CORRELATION_ID_`) USING BTREE,
  INDEX `ACT_IDX_DJOB_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_DJOB_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_DJOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_DEADLETTER_JOB_EXECUTION`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_`) USING BTREE,
  INDEX `ACT_FK_DEADLETTER_JOB_PROC_DEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_deadletter_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_entitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_entitylink`;
CREATE TABLE `act_ru_entitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `LINK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ROOT_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ROOT_SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_ENT_LNK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`, `LINK_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_ENT_LNK_REF_SCOPE`(`REF_SCOPE_ID_`, `REF_SCOPE_TYPE_`, `LINK_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_ENT_LNK_ROOT_SCOPE`(`ROOT_SCOPE_ID_`, `ROOT_SCOPE_TYPE_`, `LINK_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_ENT_LNK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`, `LINK_TYPE_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_entitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_event_subscr
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_event_subscr`;
CREATE TABLE `act_ru_event_subscr`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CONFIGURATION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_EVENT_SUBSCR_CONFIG_`(`CONFIGURATION_`) USING BTREE,
  INDEX `ACT_IDX_EVENT_SUBSCR_SCOPEREF_`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_EVENT_EXEC`(`EXECUTION_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_event_subscr
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_execution
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_execution`;
CREATE TABLE `act_ru_execution`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) NULL DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) NULL DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) NULL DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) NULL DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(4) NULL DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) NULL DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) NULL DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(11) NULL DEFAULT NULL,
  `TASK_COUNT_` int(11) NULL DEFAULT NULL,
  `JOB_COUNT_` int(11) NULL DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(11) NULL DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(11) NULL DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(11) NULL DEFAULT NULL,
  `EXTERNAL_WORKER_JOB_COUNT_` int(11) NULL DEFAULT NULL,
  `VAR_COUNT_` int(11) NULL DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) NULL DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BUSINESS_STATUS_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_EXEC_BUSKEY`(`BUSINESS_KEY_`) USING BTREE,
  INDEX `ACT_IDC_EXEC_ROOT`(`ROOT_PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_EXEC_REF_ID_`(`REFERENCE_ID_`) USING BTREE,
  INDEX `ACT_FK_EXE_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_FK_EXE_PARENT`(`PARENT_ID_`) USING BTREE,
  INDEX `ACT_FK_EXE_SUPER`(`SUPER_EXEC_`) USING BTREE,
  INDEX `ACT_FK_EXE_PROCDEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_execution
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_external_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_external_job`;
CREATE TABLE `act_ru_external_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int(11) NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_EXTERNAL_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_`) USING BTREE,
  INDEX `ACT_IDX_EXTERNAL_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_`) USING BTREE,
  INDEX `ACT_IDX_EXTERNAL_JOB_CORRELATION_ID`(`CORRELATION_ID_`) USING BTREE,
  INDEX `ACT_IDX_EJOB_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_EJOB_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_EJOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  CONSTRAINT `ACT_FK_EXTERNAL_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_EXTERNAL_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_external_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_history_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_history_job`;
CREATE TABLE `act_ru_history_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int(11) NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ADV_HANDLER_CFG_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_history_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_identitylink`;
CREATE TABLE `act_ru_identitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_USER`(`USER_ID_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_GROUP`(`GROUP_ID_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_ATHRZ_PROCEDEF`(`PROC_DEF_ID_`) USING BTREE,
  INDEX `ACT_FK_TSKASS_TASK`(`TASK_ID_`) USING BTREE,
  INDEX `ACT_FK_IDL_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_job`;
CREATE TABLE `act_ru_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int(11) NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_`) USING BTREE,
  INDEX `ACT_IDX_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_`) USING BTREE,
  INDEX `ACT_IDX_JOB_CORRELATION_ID`(`CORRELATION_ID_`) USING BTREE,
  INDEX `ACT_IDX_JOB_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_JOB_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_JOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_JOB_EXECUTION`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_`) USING BTREE,
  INDEX `ACT_FK_JOB_PROC_DEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_suspended_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_suspended_job`;
CREATE TABLE `act_ru_suspended_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int(11) NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_SUSPENDED_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_`) USING BTREE,
  INDEX `ACT_IDX_SUSPENDED_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_`) USING BTREE,
  INDEX `ACT_IDX_SUSPENDED_JOB_CORRELATION_ID`(`CORRELATION_ID_`) USING BTREE,
  INDEX `ACT_IDX_SJOB_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_SJOB_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_SJOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_SUSPENDED_JOB_EXECUTION`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_`) USING BTREE,
  INDEX `ACT_FK_SUSPENDED_JOB_PROC_DEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_suspended_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_task
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_task`;
CREATE TABLE `act_ru_task`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DELEGATION_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PRIORITY_` int(11) NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `FORM_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) NULL DEFAULT NULL,
  `VAR_COUNT_` int(11) NULL DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) NULL DEFAULT NULL,
  `SUB_TASK_COUNT_` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_TASK_CREATE`(`CREATE_TIME_`) USING BTREE,
  INDEX `ACT_IDX_TASK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_TASK_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_TASK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_TASK_EXE`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_TASK_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_FK_TASK_PROCDEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_task
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_timer_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_timer_job`;
CREATE TABLE `act_ru_timer_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int(11) NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_TIMER_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_`) USING BTREE,
  INDEX `ACT_IDX_TIMER_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_`) USING BTREE,
  INDEX `ACT_IDX_TIMER_JOB_CORRELATION_ID`(`CORRELATION_ID_`) USING BTREE,
  INDEX `ACT_IDX_TIMER_JOB_DUEDATE`(`DUEDATE_`) USING BTREE,
  INDEX `ACT_IDX_TJOB_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_TJOB_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_TJOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_TIMER_JOB_EXECUTION`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_TIMER_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_`) USING BTREE,
  INDEX `ACT_FK_TIMER_JOB_PROC_DEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_TIMER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_timer_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_variable
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_variable`;
CREATE TABLE `act_ru_variable`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DOUBLE_` double NULL DEFAULT NULL,
  `LONG_` bigint(20) NULL DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_VAR_SCOPE_ID_TYPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_RU_VAR_SUB_ID_TYPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_VAR_BYTEARRAY`(`BYTEARRAY_ID_`) USING BTREE,
  INDEX `ACT_IDX_VARIABLE_TASK_ID`(`TASK_ID_`) USING BTREE,
  INDEX `ACT_FK_VAR_EXE`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_VAR_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_variable
-- ----------------------------

-- ----------------------------
-- Table structure for bpm_form
-- ----------------------------
DROP TABLE IF EXISTS `bpm_form`;
CREATE TABLE `bpm_form`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '表单名',
  `status` tinyint(4) NOT NULL COMMENT '开启状态',
  `conf` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '表单的配置',
  `fields` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '表单项的数组',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '工作流的表单定义' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bpm_form
-- ----------------------------

-- ----------------------------
-- Table structure for bpm_oa_leave
-- ----------------------------
DROP TABLE IF EXISTS `bpm_oa_leave`;
CREATE TABLE `bpm_oa_leave`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '请假表单主键',
  `user_id` bigint(20) NOT NULL COMMENT '申请人的用户编号',
  `type` tinyint(4) NOT NULL COMMENT '请假类型',
  `reason` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '请假原因',
  `start_time` datetime(0) NOT NULL COMMENT '开始时间',
  `end_time` datetime(0) NOT NULL COMMENT '结束时间',
  `day` tinyint(4) NOT NULL COMMENT '请假天数',
  `result` tinyint(4) NOT NULL COMMENT '请假结果',
  `process_instance_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '流程实例的编号',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'OA 请假申请表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bpm_oa_leave
-- ----------------------------

-- ----------------------------
-- Table structure for bpm_process_definition_ext
-- ----------------------------
DROP TABLE IF EXISTS `bpm_process_definition_ext`;
CREATE TABLE `bpm_process_definition_ext`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `process_definition_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '流程定义的编号',
  `model_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '流程模型的编号',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `form_type` tinyint(4) NOT NULL COMMENT '表单类型',
  `form_id` bigint(20) NULL DEFAULT NULL COMMENT '表单编号',
  `form_conf` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '表单的配置',
  `form_fields` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '表单项的数组',
  `form_custom_create_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '自定义表单的提交路径',
  `form_custom_view_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '自定义表单的查看路径',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 141 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'Bpm 流程定义的拓展表\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bpm_process_definition_ext
-- ----------------------------

-- ----------------------------
-- Table structure for bpm_process_instance_ext
-- ----------------------------
DROP TABLE IF EXISTS `bpm_process_instance_ext`;
CREATE TABLE `bpm_process_instance_ext`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `start_user_id` bigint(20) NOT NULL COMMENT '发起流程的用户编号',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '流程实例的名字',
  `process_instance_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '流程实例的编号',
  `process_definition_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '流程定义的编号',
  `category` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '流程分类',
  `status` tinyint(4) NOT NULL COMMENT '流程实例的状态',
  `result` tinyint(4) NOT NULL COMMENT '流程实例的结果',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `form_variables` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '表单值',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 296 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '工作流的流程实例的拓展' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bpm_process_instance_ext
-- ----------------------------

-- ----------------------------
-- Table structure for bpm_task_assign_rule
-- ----------------------------
DROP TABLE IF EXISTS `bpm_task_assign_rule`;
CREATE TABLE `bpm_task_assign_rule`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `model_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '流程模型的编号',
  `process_definition_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '流程定义的编号',
  `task_definition_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '流程任务定义的 key',
  `type` tinyint(4) NOT NULL COMMENT '规则类型',
  `options` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '规则值，JSON 数组',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 276 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'Bpm 任务规则表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bpm_task_assign_rule
-- ----------------------------

-- ----------------------------
-- Table structure for bpm_task_ext
-- ----------------------------
DROP TABLE IF EXISTS `bpm_task_ext`;
CREATE TABLE `bpm_task_ext`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `assignee_user_id` bigint(20) NULL DEFAULT NULL COMMENT '任务的审批人',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '任务的名字',
  `task_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务的编号',
  `result` tinyint(4) NOT NULL COMMENT '任务的结果',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审批建议',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '任务的结束时间',
  `process_instance_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '流程实例的编号',
  `process_definition_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '流程定义的编号',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 351 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '工作流的流程任务的拓展表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bpm_task_ext
-- ----------------------------

-- ----------------------------
-- Table structure for bpm_user_group
-- ----------------------------
DROP TABLE IF EXISTS `bpm_user_group`;
CREATE TABLE `bpm_user_group`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '组名',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
  `member_user_ids` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '成员编号数组',
  `status` tinyint(4) NOT NULL COMMENT '状态（0正常 1停用）',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户组' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bpm_user_group
-- ----------------------------

-- ----------------------------
-- Table structure for flw_channel_definition
-- ----------------------------
DROP TABLE IF EXISTS `flw_channel_definition`;
CREATE TABLE `flw_channel_definition`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `VERSION_` int(11) NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IMPLEMENTATION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_IDX_CHANNEL_DEF_UNIQ`(`KEY_`, `VERSION_`, `TENANT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_channel_definition
-- ----------------------------

-- ----------------------------
-- Table structure for flw_ev_databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `flw_ev_databasechangelog`;
CREATE TABLE `flw_ev_databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DATEEXECUTED` datetime(0) NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_ev_databasechangelog
-- ----------------------------
INSERT INTO `flw_ev_databasechangelog` VALUES ('1', 'flowable', 'org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml', '2023-11-29 15:03:07', 1, 'EXECUTED', '8:1b0c48c9cf7945be799d868a2626d687', 'createTable tableName=FLW_EVENT_DEPLOYMENT; createTable tableName=FLW_EVENT_RESOURCE; createTable tableName=FLW_EVENT_DEFINITION; createIndex indexName=ACT_IDX_EVENT_DEF_UNIQ, tableName=FLW_EVENT_DEFINITION; createTable tableName=FLW_CHANNEL_DEFIN...', '', NULL, '4.9.1', NULL, NULL, '1241387354');
INSERT INTO `flw_ev_databasechangelog` VALUES ('2', 'flowable', 'org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml', '2023-11-29 15:03:07', 2, 'EXECUTED', '8:0ea825feb8e470558f0b5754352b9cda', 'addColumn tableName=FLW_CHANNEL_DEFINITION; addColumn tableName=FLW_CHANNEL_DEFINITION', '', NULL, '4.9.1', NULL, NULL, '1241387354');
INSERT INTO `flw_ev_databasechangelog` VALUES ('3', 'flowable', 'org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml', '2023-11-29 15:03:07', 3, 'EXECUTED', '8:3c2bb293350b5cbe6504331980c9dcee', 'customChange', '', NULL, '4.9.1', NULL, NULL, '1241387354');

-- ----------------------------
-- Table structure for flw_ev_databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `flw_ev_databasechangeloglock`;
CREATE TABLE `flw_ev_databasechangeloglock`  (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime(0) NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_ev_databasechangeloglock
-- ----------------------------
INSERT INTO `flw_ev_databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for flw_event_definition
-- ----------------------------
DROP TABLE IF EXISTS `flw_event_definition`;
CREATE TABLE `flw_event_definition`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `VERSION_` int(11) NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_IDX_EVENT_DEF_UNIQ`(`KEY_`, `VERSION_`, `TENANT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_event_definition
-- ----------------------------

-- ----------------------------
-- Table structure for flw_event_deployment
-- ----------------------------
DROP TABLE IF EXISTS `flw_event_deployment`;
CREATE TABLE `flw_event_deployment`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_event_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for flw_event_resource
-- ----------------------------
DROP TABLE IF EXISTS `flw_event_resource`;
CREATE TABLE `flw_event_resource`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_BYTES_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_event_resource
-- ----------------------------

-- ----------------------------
-- Table structure for flw_ru_batch
-- ----------------------------
DROP TABLE IF EXISTS `flw_ru_batch`;
CREATE TABLE `flw_ru_batch`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `SEARCH_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SEARCH_KEY2_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NOT NULL,
  `COMPLETE_TIME_` datetime(3) NULL DEFAULT NULL,
  `STATUS_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BATCH_DOC_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_ru_batch
-- ----------------------------

-- ----------------------------
-- Table structure for flw_ru_batch_part
-- ----------------------------
DROP TABLE IF EXISTS `flw_ru_batch_part`;
CREATE TABLE `flw_ru_batch_part`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `BATCH_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `SCOPE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SEARCH_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SEARCH_KEY2_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NOT NULL,
  `COMPLETE_TIME_` datetime(3) NULL DEFAULT NULL,
  `STATUS_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RESULT_DOC_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `FLW_IDX_BATCH_PART`(`BATCH_ID_`) USING BTREE,
  CONSTRAINT `FLW_FK_BATCH_PART_PARENT` FOREIGN KEY (`BATCH_ID_`) REFERENCES `flw_ru_batch` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_ru_batch_part
-- ----------------------------

-- ----------------------------
-- Table structure for infra_api_access_log
-- ----------------------------
DROP TABLE IF EXISTS `infra_api_access_log`;
CREATE TABLE `infra_api_access_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `trace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '链路追踪编号',
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户编号',
  `user_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '用户类型',
  `application_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用名',
  `request_method` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '请求方法名',
  `request_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '请求地址',
  `request_params` varchar(8000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '请求参数',
  `user_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户 IP',
  `user_agent` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '浏览器 UA',
  `begin_time` datetime(0) NOT NULL COMMENT '开始请求时间',
  `end_time` datetime(0) NOT NULL COMMENT '结束请求时间',
  `duration` int(11) NOT NULL COMMENT '执行时长',
  `result_code` int(11) NOT NULL DEFAULT 0 COMMENT '结果码',
  `result_msg` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '结果提示',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35832 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'API 访问日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of infra_api_access_log
-- ----------------------------

-- ----------------------------
-- Table structure for infra_api_error_log
-- ----------------------------
DROP TABLE IF EXISTS `infra_api_error_log`;
CREATE TABLE `infra_api_error_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `trace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '链路追踪编号\n     *\n     * 一般来说，通过链路追踪编号，可以将访问日志，错误日志，链路追踪日志，logger 打印日志等，结合在一起，从而进行排错。',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户编号',
  `user_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '用户类型',
  `application_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用名\n     *\n     * 目前读取 spring.application.name',
  `request_method` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '请求方法名',
  `request_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '请求地址',
  `request_params` varchar(8000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '请求参数',
  `user_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户 IP',
  `user_agent` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '浏览器 UA',
  `exception_time` datetime(0) NOT NULL COMMENT '异常发生时间',
  `exception_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '异常名\n     *\n     * {@link Throwable#getClass()} 的类全名',
  `exception_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '异常导致的消息\n     *\n     * {@link cn.iocoder.common.framework.util.ExceptionUtil#getMessage(Throwable)}',
  `exception_root_cause_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '异常导致的根消息\n     *\n     * {@link cn.iocoder.common.framework.util.ExceptionUtil#getRootCauseMessage(Throwable)}',
  `exception_stack_trace` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '异常的栈轨迹\n     *\n     * {@link cn.iocoder.common.framework.util.ExceptionUtil#getServiceException(Exception)}',
  `exception_class_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '异常发生的类全名\n     *\n     * {@link StackTraceElement#getClassName()}',
  `exception_file_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '异常发生的类文件\n     *\n     * {@link StackTraceElement#getFileName()}',
  `exception_method_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '异常发生的方法名\n     *\n     * {@link StackTraceElement#getMethodName()}',
  `exception_line_number` int(11) NOT NULL COMMENT '异常发生的方法所在行\n     *\n     * {@link StackTraceElement#getLineNumber()}',
  `process_status` tinyint(4) NOT NULL COMMENT '处理状态',
  `process_time` datetime(0) NULL DEFAULT NULL COMMENT '处理时间',
  `process_user_id` int(11) NULL DEFAULT 0 COMMENT '处理用户编号',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1964 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统异常日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of infra_api_error_log
-- ----------------------------

-- ----------------------------
-- Table structure for infra_codegen_column
-- ----------------------------
DROP TABLE IF EXISTS `infra_codegen_column`;
CREATE TABLE `infra_codegen_column`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) NOT NULL COMMENT '表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字段名',
  `data_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字段类型',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字段描述',
  `nullable` bit(1) NOT NULL COMMENT '是否允许为空',
  `primary_key` bit(1) NOT NULL COMMENT '是否主键',
  `auto_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否自增',
  `ordinal_position` int(11) NOT NULL COMMENT '排序',
  `java_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Java 属性类型',
  `java_field` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Java 属性名',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典类型',
  `example` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据示例',
  `create_operation` bit(1) NOT NULL COMMENT '是否为 Create 创建操作的字段',
  `update_operation` bit(1) NOT NULL COMMENT '是否为 Update 更新操作的字段',
  `list_operation` bit(1) NOT NULL COMMENT '是否为 List 查询操作的字段',
  `list_operation_condition` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '=' COMMENT 'List 查询操作的条件类型',
  `list_operation_result` bit(1) NOT NULL COMMENT '是否为 List 查询操作的返回字段',
  `html_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '显示类型',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1905 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '代码生成表字段定义' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of infra_codegen_column
-- ----------------------------

-- ----------------------------
-- Table structure for infra_codegen_table
-- ----------------------------
DROP TABLE IF EXISTS `infra_codegen_table`;
CREATE TABLE `infra_codegen_table`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `data_source_config_id` bigint(20) NOT NULL COMMENT '数据源配置的编号',
  `scene` tinyint(4) NOT NULL DEFAULT 1 COMMENT '生成场景',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '表描述',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '类名称',
  `class_comment` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类描述',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '作者',
  `template_type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '模板类型',
  `front_type` tinyint(4) NOT NULL COMMENT '前端类型',
  `parent_menu_id` bigint(20) NULL DEFAULT NULL COMMENT '父菜单编号',
  `master_table_id` bigint(20) NULL DEFAULT NULL COMMENT '主表的编号',
  `sub_join_column_id` bigint(20) NULL DEFAULT NULL COMMENT '子表关联主表的字段编号',
  `sub_join_many` bit(1) NULL DEFAULT NULL COMMENT '主表与子表是否一对多',
  `tree_parent_column_id` bigint(20) NULL DEFAULT NULL COMMENT '树表的父字段编号',
  `tree_name_column_id` bigint(20) NULL DEFAULT NULL COMMENT '树表的名字字段编号',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 146 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '代码生成表定义' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of infra_codegen_table
-- ----------------------------

-- ----------------------------
-- Table structure for infra_config
-- ----------------------------
DROP TABLE IF EXISTS `infra_config`;
CREATE TABLE `infra_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数分组',
  `type` tinyint(4) NOT NULL COMMENT '参数类型',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '参数键名',
  `value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '参数键值',
  `visible` bit(1) NOT NULL COMMENT '是否可见',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of infra_config
-- ----------------------------
INSERT INTO `infra_config` VALUES (2, 'biz', 1, '用户管理-账号初始密码', 'sys.user.init-password', '123456', b'0', '初始化密码 123456', 'admin', '2021-01-05 17:03:48', '1', '2022-03-20 02:25:51', b'0');
INSERT INTO `infra_config` VALUES (7, 'url', 2, 'MySQL 监控的地址', 'url.druid', '', b'1', '', '1', '2023-04-07 13:41:16', '1', '2023-04-07 14:33:38', b'0');
INSERT INTO `infra_config` VALUES (8, 'url', 2, 'SkyWalking 监控的地址', 'url.skywalking', '', b'1', '', '1', '2023-04-07 13:41:16', '1', '2023-04-07 14:57:03', b'0');
INSERT INTO `infra_config` VALUES (9, 'url', 2, 'Spring Boot Admin 监控的地址', 'url.spring-boot-admin', '', b'1', '', '1', '2023-04-07 13:41:16', '1', '2023-04-07 14:52:07', b'0');
INSERT INTO `infra_config` VALUES (10, 'url', 2, 'Swagger 接口文档的地址', 'url.swagger', '', b'1', '', '1', '2023-04-07 13:41:16', '1', '2023-04-07 14:59:00', b'0');
INSERT INTO `infra_config` VALUES (11, 'ui', 2, '腾讯地图 key', 'tencent.lbs.key', 'TVDBZ-TDILD-4ON4B-PFDZA-RNLKH-VVF6E', b'1', '腾讯地图 key', '1', '2023-06-03 19:16:27', '1', '2023-06-03 19:16:27', b'0');

-- ----------------------------
-- Table structure for infra_data_source_config
-- ----------------------------
DROP TABLE IF EXISTS `infra_data_source_config`;
CREATE TABLE `infra_data_source_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '参数名称',
  `url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据源连接',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '密码',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '数据源配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of infra_data_source_config
-- ----------------------------

-- ----------------------------
-- Table structure for infra_demo01_contact
-- ----------------------------
DROP TABLE IF EXISTS `infra_demo01_contact`;
CREATE TABLE `infra_demo01_contact`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名字',
  `sex` tinyint(1) NOT NULL COMMENT '性别',
  `birthday` datetime(0) NOT NULL COMMENT '出生年',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '简介',
  `avatar` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '示例联系人表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of infra_demo01_contact
-- ----------------------------
INSERT INTO `infra_demo01_contact` VALUES (1, '土豆', 2, '2023-11-07 00:00:00', '<p>天蚕土豆！呀</p>', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/46f8fa1a37db3f3960d8910ff2fe3962ab3b2db87cf2f8ccb4dc8145b8bdf237.jpeg', '1', '2023-11-15 23:34:30', '1', '2023-11-15 23:47:39', b'0', 1);

-- ----------------------------
-- Table structure for infra_demo02_category
-- ----------------------------
DROP TABLE IF EXISTS `infra_demo02_category`;
CREATE TABLE `infra_demo02_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名字',
  `parent_id` bigint(20) NOT NULL COMMENT '父级编号',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '示例分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of infra_demo02_category
-- ----------------------------
INSERT INTO `infra_demo02_category` VALUES (1, '土豆', 0, '1', '2023-11-15 23:34:30', '1', '2023-11-16 20:24:23', b'0', 1);
INSERT INTO `infra_demo02_category` VALUES (2, '番茄', 0, '1', '2023-11-16 20:24:00', '1', '2023-11-16 20:24:15', b'0', 1);
INSERT INTO `infra_demo02_category` VALUES (3, '怪怪', 0, '1', '2023-11-16 20:24:32', '1', '2023-11-16 20:24:32', b'0', 1);
INSERT INTO `infra_demo02_category` VALUES (4, '小番茄', 2, '1', '2023-11-16 20:24:39', '1', '2023-11-16 20:24:39', b'0', 1);
INSERT INTO `infra_demo02_category` VALUES (5, '大番茄', 2, '1', '2023-11-16 20:24:46', '1', '2023-11-16 20:24:46', b'0', 1);

-- ----------------------------
-- Table structure for infra_demo03_course
-- ----------------------------
DROP TABLE IF EXISTS `infra_demo03_course`;
CREATE TABLE `infra_demo03_course`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `student_id` bigint(20) NOT NULL COMMENT '学生编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名字',
  `score` tinyint(4) NOT NULL COMMENT '分数',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '学生课程表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of infra_demo03_course
-- ----------------------------
INSERT INTO `infra_demo03_course` VALUES (2, 2, '语文', 66, '1', '2023-11-16 23:21:49', '1', '2023-11-16 23:21:49', b'0', 1);
INSERT INTO `infra_demo03_course` VALUES (3, 2, '数学', 22, '1', '2023-11-16 23:21:49', '1', '2023-11-16 23:21:49', b'0', 1);
INSERT INTO `infra_demo03_course` VALUES (6, 5, '体育', 23, '1', '2023-11-16 23:22:46', '1', '2023-11-16 15:44:40', b'1', 1);
INSERT INTO `infra_demo03_course` VALUES (7, 5, '计算机', 11, '1', '2023-11-16 23:22:46', '1', '2023-11-16 15:44:40', b'1', 1);
INSERT INTO `infra_demo03_course` VALUES (8, 5, '体育', 23, '1', '2023-11-16 23:22:46', '1', '2023-11-16 15:47:09', b'1', 1);
INSERT INTO `infra_demo03_course` VALUES (9, 5, '计算机', 11, '1', '2023-11-16 23:22:46', '1', '2023-11-16 15:47:09', b'1', 1);
INSERT INTO `infra_demo03_course` VALUES (10, 5, '体育', 23, '1', '2023-11-16 23:22:46', '1', '2023-11-16 23:47:10', b'0', 1);
INSERT INTO `infra_demo03_course` VALUES (11, 5, '计算机', 11, '1', '2023-11-16 23:22:46', '1', '2023-11-16 23:47:10', b'0', 1);
INSERT INTO `infra_demo03_course` VALUES (12, 2, '电脑', 33, '1', '2023-11-17 00:20:42', '1', '2023-11-16 16:20:45', b'1', 1);
INSERT INTO `infra_demo03_course` VALUES (13, 9, '滑雪', 12, '1', '2023-11-17 13:13:20', '1', '2023-11-17 13:13:20', b'0', 1);

-- ----------------------------
-- Table structure for infra_demo03_grade
-- ----------------------------
DROP TABLE IF EXISTS `infra_demo03_grade`;
CREATE TABLE `infra_demo03_grade`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `student_id` bigint(20) NOT NULL COMMENT '学生编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名字',
  `teacher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '班主任',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '学生班级表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of infra_demo03_grade
-- ----------------------------
INSERT INTO `infra_demo03_grade` VALUES (7, 2, '三年 2 班', '周杰伦', '1', '2023-11-16 23:21:49', '1', '2023-11-16 23:21:49', b'0', 1);
INSERT INTO `infra_demo03_grade` VALUES (8, 5, '华为', '遥遥领先', '1', '2023-11-16 23:22:46', '1', '2023-11-16 23:47:10', b'0', 1);
INSERT INTO `infra_demo03_grade` VALUES (9, 9, '小图', '小娃111', '1', '2023-11-17 13:10:23', '1', '2023-11-17 13:10:23', b'0', 1);

-- ----------------------------
-- Table structure for infra_demo03_student
-- ----------------------------
DROP TABLE IF EXISTS `infra_demo03_student`;
CREATE TABLE `infra_demo03_student`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名字',
  `sex` tinyint(4) NOT NULL COMMENT '性别',
  `birthday` datetime(0) NOT NULL COMMENT '出生日期',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '简介',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '学生表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of infra_demo03_student
-- ----------------------------
INSERT INTO `infra_demo03_student` VALUES (2, '小白', 1, '2023-11-16 00:00:00', '<p>厉害</p>', '1', '2023-11-16 23:21:49', '1', '2023-11-17 16:49:06', b'0', 1);
INSERT INTO `infra_demo03_student` VALUES (5, '大黑', 2, '2023-11-13 00:00:00', '<p>你在教我做事?</p>', '1', '2023-11-16 23:22:46', '1', '2023-11-17 16:49:07', b'0', 1);
INSERT INTO `infra_demo03_student` VALUES (9, '小花', 1, '2023-11-07 00:00:00', '<p>哈哈哈</p>', '1', '2023-11-17 00:04:47', '1', '2023-11-17 16:49:08', b'0', 1);

-- ----------------------------
-- Table structure for infra_file
-- ----------------------------
DROP TABLE IF EXISTS `infra_file`;
CREATE TABLE `infra_file`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '文件编号',
  `config_id` bigint(20) NULL DEFAULT NULL COMMENT '配置编号',
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件名',
  `path` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件路径',
  `url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件 URL',
  `type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件类型',
  `size` int(11) NOT NULL COMMENT '文件大小',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1128 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '文件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of infra_file
-- ----------------------------

-- ----------------------------
-- Table structure for infra_file_config
-- ----------------------------
DROP TABLE IF EXISTS `infra_file_config`;
CREATE TABLE `infra_file_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配置名',
  `storage` tinyint(4) NOT NULL COMMENT '存储器',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `master` bit(1) NOT NULL COMMENT '是否为主配置',
  `config` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '存储配置',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '文件配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of infra_file_config
-- ----------------------------
INSERT INTO `infra_file_config` VALUES (4, '数据库', 1, '我是数据库', b'1', '{\"@class\":\"cn.iocoder.yudao.framework.file.core.client.db.DBFileClientConfig\",\"domain\":\"http://127.0.0.1:48080\"}', '1', '2022-03-15 23:56:24', '1', '2023-09-15 12:05:12', b'0');

-- ----------------------------
-- Table structure for infra_file_content
-- ----------------------------
DROP TABLE IF EXISTS `infra_file_content`;
CREATE TABLE `infra_file_content`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `config_id` bigint(20) NOT NULL COMMENT '配置编号',
  `path` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件路径',
  `content` mediumblob NOT NULL COMMENT '文件内容',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 221 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '文件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of infra_file_content
-- ----------------------------

-- ----------------------------
-- Table structure for infra_job
-- ----------------------------
DROP TABLE IF EXISTS `infra_job`;
CREATE TABLE `infra_job`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务编号',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `status` tinyint(4) NOT NULL COMMENT '任务状态',
  `handler_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '处理器的名字',
  `handler_param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '处理器的参数',
  `cron_expression` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'CRON 表达式',
  `retry_count` int(11) NOT NULL DEFAULT 0 COMMENT '重试次数',
  `retry_interval` int(11) NOT NULL DEFAULT 0 COMMENT '重试间隔',
  `monitor_timeout` int(11) NOT NULL DEFAULT 0 COMMENT '监控超时时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '定时任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of infra_job
-- ----------------------------
INSERT INTO `infra_job` VALUES (5, '支付通知 Job', 2, 'payNotifyJob', NULL, '* * * * * ?', 0, 0, 0, '1', '2021-10-27 08:34:42', '1', '2023-07-09 20:51:41', b'0');
INSERT INTO `infra_job` VALUES (17, '支付订单同步 Job', 2, 'payOrderSyncJob', NULL, '0 0/1 * * * ?', 0, 0, 0, '1', '2023-07-22 14:36:26', '1', '2023-07-22 15:39:08', b'0');
INSERT INTO `infra_job` VALUES (18, '支付订单过期 Job', 2, 'payOrderExpireJob', NULL, '0 0/1 * * * ?', 0, 0, 0, '1', '2023-07-22 15:36:23', '1', '2023-07-22 15:39:54', b'0');
INSERT INTO `infra_job` VALUES (19, '退款订单的同步 Job', 2, 'payRefundSyncJob', NULL, '0 0/1 * * * ?', 0, 0, 0, '1', '2023-07-23 21:03:44', '1', '2023-07-23 21:09:00', b'0');
INSERT INTO `infra_job` VALUES (20, 'Job 示例', 2, 'demoJob', '', '0 0 0 * * ?', 1, 10, 0, '1', '2023-09-16 14:01:23', '1', '2023-09-26 19:24:01', b'0');
INSERT INTO `infra_job` VALUES (21, '交易订单的自动过期 Job', 2, 'tradeOrderAutoCancelJob', '', '0 * * * * ?', 3, 0, 0, '1', '2023-09-25 23:43:26', '1', '2023-09-26 19:23:30', b'0');
INSERT INTO `infra_job` VALUES (22, '交易订单的自动收货 Job', 2, 'tradeOrderAutoReceiveJob', '', '0 * * * * ?', 3, 0, 0, '1', '2023-09-26 19:23:53', '1', '2023-09-26 23:38:08', b'0');
INSERT INTO `infra_job` VALUES (23, '交易订单的自动评论 Job', 2, 'tradeOrderAutoCommentJob', '', '0 * * * * ?', 3, 0, 0, '1', '2023-09-26 23:38:29', '1', '2023-09-27 11:03:10', b'0');
INSERT INTO `infra_job` VALUES (24, '佣金解冻 Job', 2, 'brokerageRecordUnfreezeJob', '', '0 * * * * ?', 3, 0, 0, '1', '2023-09-28 22:01:46', '1', '2023-09-28 22:01:56', b'0');
INSERT INTO `infra_job` VALUES (25, '访问日志清理 Job', 2, 'accessLogCleanJob', '', '0 0 0 * * ?', 3, 0, 0, '1', '2023-10-03 10:59:41', '1', '2023-10-03 11:01:10', b'0');
INSERT INTO `infra_job` VALUES (26, '错误日志清理 Job', 2, 'errorLogCleanJob', '', '0 0 0 * * ?', 3, 0, 0, '1', '2023-10-03 11:00:43', '1', '2023-10-03 11:01:12', b'0');
INSERT INTO `infra_job` VALUES (27, '任务日志清理 Job', 2, 'jobLogCleanJob', '', '0 0 0 * * ?', 3, 0, 0, '1', '2023-10-03 11:01:33', '1', '2023-10-03 11:01:42', b'0');

-- ----------------------------
-- Table structure for infra_job_log
-- ----------------------------
DROP TABLE IF EXISTS `infra_job_log`;
CREATE TABLE `infra_job_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志编号',
  `job_id` bigint(20) NOT NULL COMMENT '任务编号',
  `handler_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '处理器的名字',
  `handler_param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '处理器的参数',
  `execute_index` tinyint(4) NOT NULL DEFAULT 1 COMMENT '第几次执行',
  `begin_time` datetime(0) NOT NULL COMMENT '开始执行时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束执行时间',
  `duration` int(11) NULL DEFAULT NULL COMMENT '执行时长',
  `status` tinyint(4) NOT NULL COMMENT '任务状态',
  `result` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '结果数据',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 232 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '定时任务日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of infra_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for market_activity
-- ----------------------------
DROP TABLE IF EXISTS `market_activity`;
CREATE TABLE `market_activity`  (
  `id` bigint(20) NOT NULL,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `activity_type` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `start_time` datetime(0) NOT NULL,
  `end_time` datetime(0) NOT NULL,
  `invalid_time` datetime(0) NULL DEFAULT NULL,
  `delete_time` datetime(0) NULL DEFAULT NULL,
  `time_limited_discount` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `full_privilege` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  `tenant_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '促销活动' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of market_activity
-- ----------------------------

-- ----------------------------
-- Table structure for member_address
-- ----------------------------
DROP TABLE IF EXISTS `member_address`;
CREATE TABLE `member_address`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '收件地址编号',
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '收件人名称',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '手机号',
  `area_id` bigint(20) NOT NULL COMMENT '地区编码',
  `detail_address` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '收件详细地址',
  `default_status` bit(1) NOT NULL COMMENT '是否默认',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_userId`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户收件地址' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member_address
-- ----------------------------
INSERT INTO `member_address` VALUES (21, 247, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', b'1', '1', '2022-08-01 22:46:35', '247', '2023-06-26 19:47:46', b'0', 1);
INSERT INTO `member_address` VALUES (23, 247, '测试', '15601691300', 120103, '13232312', b'0', '247', '2023-06-26 19:47:40', '247', '2023-06-26 19:47:46', b'0', 1);
INSERT INTO `member_address` VALUES (24, 248, '芋头', '15601691234', 110101, '灌灌灌灌灌', b'1', '248', '2023-10-06 10:08:24', '248', '2023-10-06 10:08:24', b'0', 1);

-- ----------------------------
-- Table structure for member_config
-- ----------------------------
DROP TABLE IF EXISTS `member_config`;
CREATE TABLE `member_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `point_trade_deduct_enable` bit(1) NOT NULL COMMENT '是否开启积分抵扣',
  `point_trade_deduct_unit_price` int(11) NOT NULL COMMENT '积分抵扣(单位：分)',
  `point_trade_deduct_max_price` int(11) NULL DEFAULT NULL COMMENT '积分抵扣最大值',
  `point_trade_give_point` bigint(20) NULL DEFAULT NULL COMMENT '1 元赠送多少分',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member_config
-- ----------------------------
INSERT INTO `member_config` VALUES (5, b'1', 100, 2, 3, '1', '2023-08-20 09:54:42', '1', '2023-10-01 23:44:01', b'0', 1);

-- ----------------------------
-- Table structure for member_experience_record
-- ----------------------------
DROP TABLE IF EXISTS `member_experience_record`;
CREATE TABLE `member_experience_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户编号',
  `biz_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '业务编号',
  `biz_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '业务类型',
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
  `experience` int(11) NOT NULL DEFAULT 0 COMMENT '经验',
  `total_experience` int(11) NOT NULL DEFAULT 0 COMMENT '变更后的经验',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE COMMENT '会员经验记录-用户编号',
  INDEX `idx_user_biz_type`(`user_id`, `biz_type`) USING BTREE COMMENT '会员经验记录-用户业务类型'
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员经验记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member_experience_record
-- ----------------------------
INSERT INTO `member_experience_record` VALUES (1, 247, '0', 0, '管理员调整', '管理员调整获得100经验', 100, 100, '1', '2023-08-22 21:52:44', '1', '2023-08-22 21:52:44', b'0', 1);
INSERT INTO `member_experience_record` VALUES (2, 247, '0', 0, '管理员调整', '管理员调整获得100经验', -50, 100, '1', '2023-08-22 21:52:44', '1', '2023-08-22 21:52:44', b'0', 1);
INSERT INTO `member_experience_record` VALUES (3, 247, '78', 2, '下单奖励', '下单获得 27 经验', 27, 127, NULL, '2023-08-30 18:46:52', NULL, '2023-08-30 18:46:52', b'0', 1);
INSERT INTO `member_experience_record` VALUES (4, 247, 'null', 3, '退单扣除', '退单获得 -6 经验', -6, 121, NULL, '2023-08-31 19:56:21', NULL, '2023-08-31 19:56:21', b'0', 1);
INSERT INTO `member_experience_record` VALUES (5, 247, '80', 2, '下单奖励', '下单获得 699906 经验', 699906, 700027, NULL, '2023-08-31 23:43:29', NULL, '2023-08-31 23:43:29', b'0', 1);
INSERT INTO `member_experience_record` VALUES (6, 247, '81', 2, '下单奖励', '下单获得 2799606 经验', 2799606, 3499633, NULL, '2023-08-31 23:46:17', NULL, '2023-08-31 23:46:17', b'0', 1);
INSERT INTO `member_experience_record` VALUES (7, 247, '94', 2, '下单奖励', '下单获得 559920 经验', 559920, 4059553, NULL, '2023-09-30 22:07:42', NULL, '2023-09-30 22:07:42', b'0', 1);
INSERT INTO `member_experience_record` VALUES (8, 247, '95', 2, '下单奖励', '下单获得 384945 经验', 384945, 4444498, NULL, '2023-10-01 21:36:13', NULL, '2023-10-01 21:36:13', b'0', 1);
INSERT INTO `member_experience_record` VALUES (9, 247, '96', 2, '下单奖励', '下单获得 699900 经验', 699900, 5144398, NULL, '2023-10-02 09:40:21', NULL, '2023-10-02 09:40:21', b'0', 1);
INSERT INTO `member_experience_record` VALUES (10, 247, '97', 2, '下单奖励', '下单获得 384945 经验', 384945, 5529343, NULL, '2023-10-02 10:21:12', NULL, '2023-10-02 10:21:12', b'0', 1);
INSERT INTO `member_experience_record` VALUES (11, 247, '11', 3, '退单扣除', '退单获得 -699900 经验', -699900, 4829443, NULL, '2023-10-02 15:19:37', NULL, '2023-10-02 15:19:37', b'0', 1);
INSERT INTO `member_experience_record` VALUES (12, 247, '98', 2, '下单奖励', '下单获得 384945 经验', 384945, 5214388, NULL, '2023-10-02 15:38:39', NULL, '2023-10-02 15:38:39', b'0', 1);
INSERT INTO `member_experience_record` VALUES (13, 247, '102', 2, '下单奖励', '下单获得 201 经验', 201, 5214589, NULL, '2023-10-05 23:05:29', NULL, '2023-10-05 23:05:29', b'0', 1);
INSERT INTO `member_experience_record` VALUES (14, 247, '107', 2, '下单奖励', '下单获得 201 经验', 201, 5214790, NULL, '2023-10-05 23:23:00', NULL, '2023-10-05 23:23:00', b'0', 1);
INSERT INTO `member_experience_record` VALUES (15, 248, '108', 2, '下单奖励', '下单获得 275 经验', 275, 275, NULL, '2023-10-06 10:13:44', NULL, '2023-10-06 10:13:44', b'0', 1);
INSERT INTO `member_experience_record` VALUES (16, 248, '118', 2, '下单奖励', '下单获得 203 经验', 203, 478, NULL, '2023-10-07 06:58:52', NULL, '2023-10-07 06:58:52', b'0', 1);
INSERT INTO `member_experience_record` VALUES (17, 248, '119', 2, '下单奖励', '下单获得 700100 经验', 700100, 700578, NULL, '2023-10-10 23:02:36', NULL, '2023-10-10 23:02:36', b'0', 1);
INSERT INTO `member_experience_record` VALUES (21, 248, '15', 3, '退单扣除', '退单获得 -700100 经验', -700100, 478, '1', '2023-10-10 23:11:19', '1', '2023-10-10 23:11:19', b'0', 1);
INSERT INTO `member_experience_record` VALUES (22, 248, '119', 3, '退单扣除', '退单获得 -700100 经验', -700100, 0, '1', '2023-10-10 23:11:23', '1', '2023-10-10 23:11:23', b'0', 1);
INSERT INTO `member_experience_record` VALUES (23, 248, '120', 2, '下单奖励', '下单获得 700100 经验', 700100, 700100, NULL, '2023-10-10 23:16:09', NULL, '2023-10-10 23:16:09', b'0', 1);
INSERT INTO `member_experience_record` VALUES (24, 248, '16', 3, '退单扣除', '退单获得 -700100 经验', -700100, 0, '1', '2023-10-10 23:20:10', '1', '2023-10-10 23:20:10', b'0', 1);
INSERT INTO `member_experience_record` VALUES (25, 248, '120', 3, '退单扣除', '退单获得 -700100 经验', -700100, 0, '1', '2023-10-10 23:20:16', '1', '2023-10-10 23:20:16', b'0', 1);
INSERT INTO `member_experience_record` VALUES (26, 248, '121', 2, '下单奖励', '下单获得 700100 经验', 700100, 700100, NULL, '2023-10-10 23:23:30', NULL, '2023-10-10 23:23:30', b'0', 1);
INSERT INTO `member_experience_record` VALUES (27, 248, '17', 3, '退单扣除', '退单获得 -700100 经验', -700100, 0, '1', '2023-10-10 23:23:50', '1', '2023-10-10 23:23:50', b'0', 1);
INSERT INTO `member_experience_record` VALUES (28, 248, '121', 3, '退单扣除', '退单获得 -700100 经验', -700100, 0, '1', '2023-10-10 23:23:55', '1', '2023-10-10 23:23:55', b'0', 1);
INSERT INTO `member_experience_record` VALUES (29, 248, '122', 2, '下单奖励', '下单获得 700100 经验', 700100, 700100, NULL, '2023-10-10 23:28:07', NULL, '2023-10-10 23:28:07', b'0', 1);
INSERT INTO `member_experience_record` VALUES (30, 248, '18', 3, '退单扣除', '退单获得 -700100 经验', -700100, 0, '1', '2023-10-10 23:29:55', '1', '2023-10-10 23:29:55', b'0', 1);
INSERT INTO `member_experience_record` VALUES (31, 248, '123', 2, '下单奖励', '下单获得 300 经验', 300, 300, NULL, '2023-10-10 23:44:45', NULL, '2023-10-10 23:44:45', b'0', 1);
INSERT INTO `member_experience_record` VALUES (32, 248, '124', 2, '下单奖励', '下单获得 560120 经验', 560120, 560420, NULL, '2023-10-11 07:03:46', NULL, '2023-10-11 07:03:46', b'0', 1);
INSERT INTO `member_experience_record` VALUES (33, 248, '19', 3, '退单扣除', '退单获得 -300 经验', -300, 560120, '1', '2023-10-11 07:04:28', '1', '2023-10-11 07:04:28', b'0', 1);
INSERT INTO `member_experience_record` VALUES (34, 248, '125', 11, '下单奖励', '下单获得 700100 经验', 700100, 700100, NULL, '2023-10-11 07:33:29', NULL, '2023-10-11 07:33:29', b'0', 1);
INSERT INTO `member_experience_record` VALUES (37, 248, '127', 11, '下单奖励', '下单获得 385145 经验', 385145, 385145, NULL, '2023-10-11 07:36:44', NULL, '2023-10-11 07:36:44', b'0', 1);
INSERT INTO `member_experience_record` VALUES (40, 248, '120', 13, '下单奖励（单个取消）', '退款订单获得 -385145 经验', -385145, 0, '1', '2023-10-11 07:39:26', '1', '2023-10-11 07:39:26', b'0', 1);
INSERT INTO `member_experience_record` VALUES (41, 248, '131', 11, '下单奖励', '下单获得 700100 经验', 700100, 700100, NULL, '2023-10-24 12:33:22', NULL, '2023-10-24 12:33:22', b'0', 1);

-- ----------------------------
-- Table structure for member_group
-- ----------------------------
DROP TABLE IF EXISTS `member_group`;
CREATE TABLE `member_group`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户分组' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member_group
-- ----------------------------

-- ----------------------------
-- Table structure for member_level
-- ----------------------------
DROP TABLE IF EXISTS `member_level`;
CREATE TABLE `member_level`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '等级名称',
  `level` int(11) NOT NULL DEFAULT 0 COMMENT '等级',
  `experience` int(11) NOT NULL DEFAULT 0 COMMENT '升级经验',
  `discount_percent` tinyint(4) NOT NULL DEFAULT 100 COMMENT '享受折扣',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '等级图标',
  `background_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '等级背景图',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员等级' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member_level
-- ----------------------------

-- ----------------------------
-- Table structure for member_level_record
-- ----------------------------
DROP TABLE IF EXISTS `member_level_record`;
CREATE TABLE `member_level_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户编号',
  `level_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '等级编号',
  `level` int(11) NOT NULL DEFAULT 0 COMMENT '会员等级',
  `discount_percent` tinyint(4) NOT NULL DEFAULT 100 COMMENT '享受折扣',
  `experience` int(11) NOT NULL DEFAULT 0 COMMENT '升级经验',
  `user_experience` int(11) NOT NULL DEFAULT 0 COMMENT '会员此时的经验',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE COMMENT '会员等级记录-用户编号'
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员等级记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member_level_record
-- ----------------------------

-- ----------------------------
-- Table structure for member_point_record
-- ----------------------------
DROP TABLE IF EXISTS `member_point_record`;
CREATE TABLE `member_point_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `biz_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务编码',
  `biz_type` tinyint(4) NOT NULL COMMENT '业务类型',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '积分标题',
  `description` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '积分描述',
  `point` int(11) NOT NULL COMMENT '积分',
  `total_point` int(11) NOT NULL COMMENT '变动后的积分',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_userId`(`user_id`) USING BTREE,
  INDEX `index_title`(`title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户积分记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member_point_record
-- ----------------------------
INSERT INTO `member_point_record` VALUES (1, 247, '1', 1, '12', NULL, 33, 12, '', '2023-07-02 14:50:23', '', '2023-08-20 11:03:01', b'0', 1);
INSERT INTO `member_point_record` VALUES (2, 247, '12', 1, '123', NULL, 22, 130, '', '2023-07-02 14:50:23', '', '2023-08-20 11:03:00', b'0', 1);
INSERT INTO `member_point_record` VALUES (3, 247, '12', 1, '12', NULL, -12, 12, '', '2023-07-02 14:50:55', '', '2023-08-21 14:19:29', b'0', 1);
INSERT INTO `member_point_record` VALUES (4, 247, '78', 10, '订单消费', '下单获得 81 积分', 81, 91, NULL, '2023-08-30 18:46:52', NULL, '2023-08-30 18:46:52', b'0', 1);
INSERT INTO `member_point_record` VALUES (5, 247, 'null', 11, '订单取消', '退单获得 -18 积分', -18, 73, NULL, '2023-08-31 19:56:21', NULL, '2023-08-31 19:56:21', b'0', 1);
INSERT INTO `member_point_record` VALUES (6, 247, '80', 10, '订单消费', '下单获得 2099718 积分', 2099718, 2099791, NULL, '2023-08-31 23:43:29', NULL, '2023-08-31 23:43:29', b'0', 1);
INSERT INTO `member_point_record` VALUES (7, 247, '81', 10, '订单消费', '下单获得 8398818 积分', 8398818, 10498609, NULL, '2023-08-31 23:46:17', NULL, '2023-08-31 23:46:17', b'0', 1);
INSERT INTO `member_point_record` VALUES (8, 247, '85', 12, '订单使用', '下单使用 -30 积分', -30, 10498579, '247', '2023-09-20 17:11:36', '247', '2023-09-20 17:11:36', b'0', 1);
INSERT INTO `member_point_record` VALUES (9, 247, '86', 12, '订单使用', '下单使用 -30 积分', -30, 10498549, '247', '2023-09-20 19:32:59', '247', '2023-09-20 19:32:59', b'0', 1);
INSERT INTO `member_point_record` VALUES (10, 247, '87', 12, '订单使用', '下单使用 -30 积分', -30, 10498519, '247', '2023-09-20 23:11:21', '247', '2023-09-20 23:11:21', b'0', 1);
INSERT INTO `member_point_record` VALUES (11, 247, '88', 12, '订单使用', '下单使用 -30 积分', -30, 10498489, '247', '2023-09-20 23:20:21', '247', '2023-09-20 23:20:21', b'0', 1);
INSERT INTO `member_point_record` VALUES (12, 247, '89', 12, '订单使用', '下单使用 -30 积分', -30, 10498459, '247', '2023-09-23 23:51:40', '247', '2023-09-23 23:51:40', b'0', 1);
INSERT INTO `member_point_record` VALUES (13, 247, '90', 12, '订单使用', '下单使用 -30 积分', -30, 10498429, '247', '2023-09-23 23:52:34', '247', '2023-09-23 23:52:34', b'0', 1);
INSERT INTO `member_point_record` VALUES (14, 247, '91', 12, '订单使用', '下单使用 -30 积分', -30, 10498399, '247', '2023-09-23 23:54:18', '247', '2023-09-23 23:54:18', b'0', 1);
INSERT INTO `member_point_record` VALUES (15, 247, '92', 12, '订单使用', '下单使用 -30 积分', -30, 10498369, '247', '2023-09-23 23:55:33', '247', '2023-09-23 23:55:33', b'0', 1);
INSERT INTO `member_point_record` VALUES (16, 247, '93', 12, '订单使用', '下单使用 -30 积分', -30, 10498339, '247', '2023-09-23 23:56:53', '247', '2023-09-23 23:56:53', b'0', 1);
INSERT INTO `member_point_record` VALUES (17, 247, '85', 11, '订单取消', '订单取消，退还 10 积分', 10, 10498349, NULL, '2023-09-25 23:54:47', NULL, '2023-09-25 23:54:47', b'0', 1);
INSERT INTO `member_point_record` VALUES (18, 247, '86', 11, '订单取消', '订单取消，退还 10 积分', 10, 10498359, NULL, '2023-09-25 23:54:48', NULL, '2023-09-25 23:54:48', b'0', 1);
INSERT INTO `member_point_record` VALUES (19, 247, '87', 11, '订单取消', '订单取消，退还 10 积分', 10, 10498369, NULL, '2023-09-25 23:54:48', NULL, '2023-09-25 23:54:48', b'0', 1);
INSERT INTO `member_point_record` VALUES (20, 247, '88', 11, '订单取消', '订单取消，退还 10 积分', 10, 10498379, NULL, '2023-09-25 23:54:48', NULL, '2023-09-25 23:54:48', b'0', 1);
INSERT INTO `member_point_record` VALUES (21, 247, '89', 11, '订单取消', '订单取消，退还 10 积分', 10, 10498389, NULL, '2023-09-25 23:54:48', NULL, '2023-09-25 23:54:48', b'0', 1);
INSERT INTO `member_point_record` VALUES (22, 247, '90', 11, '订单取消', '订单取消，退还 10 积分', 10, 10498399, NULL, '2023-09-25 23:54:48', NULL, '2023-09-25 23:54:48', b'0', 1);
INSERT INTO `member_point_record` VALUES (23, 247, '91', 11, '订单取消', '订单取消，退还 10 积分', 10, 10498409, NULL, '2023-09-25 23:54:48', NULL, '2023-09-25 23:54:48', b'0', 1);
INSERT INTO `member_point_record` VALUES (24, 247, '92', 11, '订单取消', '订单取消，退还 10 积分', 10, 10498419, NULL, '2023-09-25 23:54:48', NULL, '2023-09-25 23:54:48', b'0', 1);
INSERT INTO `member_point_record` VALUES (25, 247, '93', 11, '订单取消', '订单取消，退还 10 积分', 10, 10498429, NULL, '2023-09-25 23:54:48', NULL, '2023-09-25 23:54:48', b'0', 1);
INSERT INTO `member_point_record` VALUES (26, 247, '94', 10, '订单奖励', '下单获得 16797 积分', 16797, 10515226, NULL, '2023-09-30 22:07:42', NULL, '2023-09-30 22:07:42', b'0', 1);
INSERT INTO `member_point_record` VALUES (27, 247, '95', 10, '订单奖励', '下单获得 11548 积分', 11548, 10526774, NULL, '2023-10-01 21:36:13', NULL, '2023-10-01 21:36:13', b'0', 1);
INSERT INTO `member_point_record` VALUES (28, 247, '1', 2, '管理员修改', '管理员修改 112 积分', 112, 10526886, '1', '2023-10-01 22:44:05', '1', '2023-10-01 22:44:05', b'0', 1);
INSERT INTO `member_point_record` VALUES (29, 247, '96', 10, '订单奖励', '下单获得 20997 积分', 20997, 10547883, NULL, '2023-10-02 09:40:20', NULL, '2023-10-02 09:40:20', b'0', 1);
INSERT INTO `member_point_record` VALUES (30, 247, '97', 10, '订单奖励', '下单获得 11548 积分', 11548, 10559431, NULL, '2023-10-02 10:21:12', NULL, '2023-10-02 10:21:12', b'0', 1);
INSERT INTO `member_point_record` VALUES (31, 247, '98', 10, '订单奖励', '下单获得 11548 积分', 11548, 10570979, NULL, '2023-10-02 15:38:39', NULL, '2023-10-02 15:38:39', b'0', 1);
INSERT INTO `member_point_record` VALUES (32, 247, '102', 10, '订单奖励', '下单获得 6 积分', 6, 10570985, NULL, '2023-10-05 23:05:29', NULL, '2023-10-05 23:05:29', b'0', 1);
INSERT INTO `member_point_record` VALUES (33, 247, '107', 10, '订单奖励', '下单获得 6 积分', 6, 10570991, NULL, '2023-10-05 23:23:00', NULL, '2023-10-05 23:23:00', b'0', 1);
INSERT INTO `member_point_record` VALUES (34, 248, '108', 10, '订单奖励', '下单获得 8 积分', 8, 8, NULL, '2023-10-06 10:13:44', NULL, '2023-10-06 10:13:44', b'0', 1);
INSERT INTO `member_point_record` VALUES (35, 248, '118', 10, '订单奖励', '下单获得 6 积分', 6, 14, NULL, '2023-10-07 06:58:51', NULL, '2023-10-07 06:58:51', b'0', 1);
INSERT INTO `member_point_record` VALUES (36, 248, '119', 10, '订单奖励', '下单获得 21003 积分', 21003, 21017, NULL, '2023-10-10 23:02:35', NULL, '2023-10-10 23:02:35', b'0', 1);
INSERT INTO `member_point_record` VALUES (40, 248, '15', 14, '订单退款', '订单退款，扣除赠送的 -21003 积分', -21003, 2080697, '1', '2023-10-10 23:11:19', '1', '2023-10-10 23:11:19', b'0', 1);
INSERT INTO `member_point_record` VALUES (41, 248, '119', 11, '订单取消', '订单取消，退还 -21003 积分', -21003, 2059694, '1', '2023-10-10 23:11:23', '1', '2023-10-10 23:11:23', b'0', 1);
INSERT INTO `member_point_record` VALUES (42, 248, '120', 10, '订单奖励', '下单获得 21003 积分', 21003, 2080697, NULL, '2023-10-10 23:16:09', NULL, '2023-10-10 23:16:09', b'0', 1);
INSERT INTO `member_point_record` VALUES (43, 248, '16', 14, '订单退款', '订单退款，扣除赠送的 -21003 积分', -21003, 2059694, '1', '2023-10-10 23:20:10', '1', '2023-10-10 23:20:10', b'0', 1);
INSERT INTO `member_point_record` VALUES (44, 248, '120', 11, '订单取消', '订单取消，退还 -21003 积分', -21003, 2038691, '1', '2023-10-10 23:20:16', '1', '2023-10-10 23:20:16', b'0', 1);
INSERT INTO `member_point_record` VALUES (45, 248, '121', 10, '订单奖励', '下单获得 21003 积分', 21003, 2059694, NULL, '2023-10-10 23:23:30', NULL, '2023-10-10 23:23:30', b'0', 1);
INSERT INTO `member_point_record` VALUES (46, 248, '17', 14, '订单退款', '订单退款，扣除赠送的 -21003 积分', -21003, 2038691, '1', '2023-10-10 23:23:50', '1', '2023-10-10 23:23:50', b'0', 1);
INSERT INTO `member_point_record` VALUES (47, 248, '121', 11, '订单取消', '订单取消，退还 -21003 积分', -21003, 2017688, '1', '2023-10-10 23:23:55', '1', '2023-10-10 23:23:55', b'0', 1);
INSERT INTO `member_point_record` VALUES (48, 248, '122', 10, '订单奖励', '下单获得 21003 积分', 21003, 2038691, NULL, '2023-10-10 23:28:07', NULL, '2023-10-10 23:28:07', b'0', 1);
INSERT INTO `member_point_record` VALUES (49, 248, '18', 14, '订单退款', '订单退款，扣除赠送的 -21003 积分', -21003, 2017688, '1', '2023-10-10 23:29:55', '1', '2023-10-10 23:29:55', b'0', 1);
INSERT INTO `member_point_record` VALUES (50, 248, '123', 10, '订单奖励', '下单获得 9 积分', 9, 2017697, NULL, '2023-10-10 23:44:45', NULL, '2023-10-10 23:44:45', b'0', 1);
INSERT INTO `member_point_record` VALUES (51, 248, '124', 10, '订单奖励', '下单获得 16803 积分', 16803, 2034500, NULL, '2023-10-11 07:03:46', NULL, '2023-10-11 07:03:46', b'0', 1);
INSERT INTO `member_point_record` VALUES (52, 248, '19', 14, '订单退款', '订单退款，扣除赠送的 -9 积分', -9, 2034491, '1', '2023-10-11 07:04:28', '1', '2023-10-11 07:04:28', b'0', 1);
INSERT INTO `member_point_record` VALUES (53, 248, '125', 21, '订单积分奖励', '下单获得 21003 积分', 21003, 21003, NULL, '2023-10-11 07:33:29', NULL, '2023-10-11 07:33:29', b'0', 1);
INSERT INTO `member_point_record` VALUES (56, 248, '127', 21, '订单积分奖励', '下单获得 11554 积分', 11554, 11554, NULL, '2023-10-11 07:36:44', NULL, '2023-10-11 07:36:44', b'0', 1);
INSERT INTO `member_point_record` VALUES (59, 248, '120', 23, '订单积分奖励（单个退款）', '订单退款，扣除赠送的 -11554 积分', -11554, 0, '1', '2023-10-11 07:39:26', '1', '2023-10-11 07:39:26', b'0', 1);
INSERT INTO `member_point_record` VALUES (60, 248, '131', 21, '订单积分奖励', '下单获得 21003 积分', 21003, 21003, NULL, '2023-10-24 12:33:22', NULL, '2023-10-24 12:33:22', b'0', 1);

-- ----------------------------
-- Table structure for member_sign_in_config
-- ----------------------------
DROP TABLE IF EXISTS `member_sign_in_config`;
CREATE TABLE `member_sign_in_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `day` int(11) NOT NULL COMMENT '第几天',
  `point` int(11) NOT NULL COMMENT '奖励积分',
  `experience` int(11) NOT NULL DEFAULT 0 COMMENT '奖励经验',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '签到规则' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member_sign_in_config
-- ----------------------------
INSERT INTO `member_sign_in_config` VALUES (1, 1, 10, 0, 0, '', '2023-08-20 01:38:56', '', '2023-08-20 01:38:56', b'0', 0);
INSERT INTO `member_sign_in_config` VALUES (2, 2, 20, 0, 0, '', '2023-08-20 01:38:56', '', '2023-08-20 01:38:56', b'0', 0);
INSERT INTO `member_sign_in_config` VALUES (3, 7, 1001, 0, 0, '', '2023-08-20 01:38:56', '', '2023-08-20 01:38:56', b'0', 0);
INSERT INTO `member_sign_in_config` VALUES (4, 6, 12121, 0, 0, '', '2023-08-20 01:38:56', '', '2023-08-20 01:38:56', b'0', 0);
INSERT INTO `member_sign_in_config` VALUES (5, 2, 12, 0, 0, '', '2023-08-20 01:38:56', '', '2023-08-20 01:38:56', b'0', 0);
INSERT INTO `member_sign_in_config` VALUES (6, 1, 10, 0, 0, '1', '2023-08-20 19:20:42', '1', '2023-08-20 19:20:56', b'0', 1);
INSERT INTO `member_sign_in_config` VALUES (7, 7, 22, 0, 0, '1', '2023-08-20 19:20:48', '1', '2023-08-20 19:20:48', b'0', 1);
INSERT INTO `member_sign_in_config` VALUES (8, 2, 3, 0, 0, '1', '2023-08-21 20:22:44', '1', '2023-08-21 20:22:44', b'0', 1);
INSERT INTO `member_sign_in_config` VALUES (9, 3, 4, 0, 0, '1', '2023-08-21 20:22:48', '1', '2023-08-21 20:22:48', b'0', 1);
INSERT INTO `member_sign_in_config` VALUES (10, 4, 5, 0, 0, '1', '2023-08-21 20:22:51', '1', '2023-08-21 20:22:51', b'0', 1);
INSERT INTO `member_sign_in_config` VALUES (11, 5, 6, 0, 0, '1', '2023-08-21 20:22:56', '1', '2023-08-21 20:22:56', b'0', 1);
INSERT INTO `member_sign_in_config` VALUES (12, 6, 7, 0, 0, '1', '2023-08-21 20:22:59', '1', '2023-08-21 20:22:59', b'0', 1);

-- ----------------------------
-- Table structure for member_sign_in_record
-- ----------------------------
DROP TABLE IF EXISTS `member_sign_in_record`;
CREATE TABLE `member_sign_in_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '签到自增id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '签到用户',
  `day` int(11) NULL DEFAULT NULL COMMENT '第几天签到',
  `point` int(11) NULL DEFAULT NULL COMMENT '签到的分数',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '签到记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member_sign_in_record
-- ----------------------------
INSERT INTO `member_sign_in_record` VALUES (1, 247, 1, 123, '', '2023-09-24 01:23:47', '', '2023-09-24 01:23:47', b'0', 0);
INSERT INTO `member_sign_in_record` VALUES (2, 247, 12, 12, '', '2023-09-24 01:23:47', '', '2023-09-24 01:23:47', b'0', 0);
INSERT INTO `member_sign_in_record` VALUES (3, 247, 12, 1212, '', '2023-09-24 01:23:47', '', '2023-09-24 01:23:47', b'0', 0);
INSERT INTO `member_sign_in_record` VALUES (4, 247, 12, 1212, '', '2023-09-24 01:23:47', '', '2023-09-24 01:23:47', b'0', 0);

-- ----------------------------
-- Table structure for member_tag
-- ----------------------------
DROP TABLE IF EXISTS `member_tag`;
CREATE TABLE `member_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员标签' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member_tag
-- ----------------------------
INSERT INTO `member_tag` VALUES (1, '绿色', '1', '2023-08-20 09:21:12', '1', '2023-08-20 09:21:12', b'0', 1);
INSERT INTO `member_tag` VALUES (2, '黄色', '1', '2023-08-20 09:21:27', '1', '2023-08-20 09:21:27', b'0', 1);

-- ----------------------------
-- Table structure for member_user
-- ----------------------------
DROP TABLE IF EXISTS `member_user`;
CREATE TABLE `member_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `nickname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '头像',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `register_ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '注册 IP',
  `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_mobile`(`mobile`) USING BTREE COMMENT '手机号'
) ENGINE = InnoDB AUTO_INCREMENT = 248 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member_user
-- ----------------------------

-- ----------------------------
-- Table structure for mp_account
-- ----------------------------
DROP TABLE IF EXISTS `mp_account`;
CREATE TABLE `mp_account`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公众号名称',
  `account` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公众号账号',
  `app_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公众号appid',
  `app_secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公众号密钥',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公众号url',
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公众号token',
  `aes_key` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '加密密钥',
  `qr_code_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '二维码图片URL',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '公众号账号表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mp_account
-- ----------------------------
INSERT INTO `mp_account` VALUES (2, '1', '2', '3', '4', NULL, '5', NULL, NULL, NULL, '1', '2023-01-07 17:30:30', '1', '2023-01-07 10:05:49', b'1', 1);
INSERT INTO `mp_account` VALUES (3, '1', '2', '3', '4', NULL, '5', NULL, NULL, NULL, '1', '2023-01-08 00:34:35', '1', '2023-01-14 01:15:56', b'1', 1);

-- ----------------------------
-- Table structure for mp_auto_reply
-- ----------------------------
DROP TABLE IF EXISTS `mp_auto_reply`;
CREATE TABLE `mp_auto_reply`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_id` bigint(20) NOT NULL COMMENT '公众号账号的编号',
  `app_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公众号 appId',
  `type` tinyint(4) NOT NULL COMMENT '回复类型',
  `request_keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求的关键字',
  `request_match` tinyint(4) NULL DEFAULT NULL COMMENT '请求的关键字的匹配',
  `request_message_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求的消息类型',
  `response_message_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复的消息类型',
  `response_content` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复的消息内容',
  `response_media_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复的媒体文件 id',
  `response_media_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复的媒体文件 URL',
  `response_title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复的标题',
  `response_description` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复的描述',
  `response_thumb_media_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复的缩略图的媒体 id',
  `response_thumb_media_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复的缩略图的媒体 URL',
  `response_articles` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复的图文消息数组',
  `response_music_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复的音乐链接',
  `response_hq_music_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复的高质量音乐链接',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公众号消息自动回复表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mp_auto_reply
-- ----------------------------
INSERT INTO `mp_auto_reply` VALUES (44, 1, 'wx5b23ba7a5589ecbb', 3, '你猜', 1, 'text', 'voice', '', 't1E3ss-niBf29tpzShjljxwaiBoXV_61ln2hzZGDlvAcT3hqLbC9dvl39YwiBWg9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2023-01-04 04:40:55', '', '2023-01-16 16:55:48', b'1', 1);

-- ----------------------------
-- Table structure for mp_material
-- ----------------------------
DROP TABLE IF EXISTS `mp_material`;
CREATE TABLE `mp_material`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_id` bigint(20) NOT NULL COMMENT '公众号账号的编号',
  `app_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公众号 appId',
  `media_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公众号素材 id',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件类型',
  `permanent` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否永久',
  `url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件服务器的 URL',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名字',
  `mp_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公众号文件 URL',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频素材的标题',
  `introduction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频素材的描述',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 98 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公众号素材表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mp_material
-- ----------------------------
INSERT INTO `mp_material` VALUES (80, 1, 'wx5b23ba7a5589ecbb', 'r6ryvl6LrxBU0miaST4Y-tlQmcl3RdC-Jcgns6IQtf7zenGy3b86WLT7GzUcrb1T', 'image', b'1', 'http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-tlQmcl3RdC-Jcgns6IQtf7zenGy3b86WLT7GzUcrb1T.png', 'file', 'http://mmbiz.qpic.cn/mmbiz_png/btUmCVHwbJUoicwBiacjVeQbu6QxgBVrukfSJXz509boa21SpH8OVHAqXCJiaiaAaHQJNxwwsa0gHRXVr0G5EZYamw/0?wx_fmt=png', '', '', '1', '2023-01-14 00:56:06', '1', '2023-01-14 07:45:41', b'1', 1);
INSERT INTO `mp_material` VALUES (81, 1, 'wx5b23ba7a5589ecbb', 'r6ryvl6LrxBU0miaST4Y-pWqXoCgpdNp1fvSv7c6zoTnCsW6BGAVFNJ-E9hkAIXO', 'image', b'1', 'http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-pWqXoCgpdNp1fvSv7c6zoTnCsW6BGAVFNJ-E9hkAIXO.jpg', 'file', 'http://mmbiz.qpic.cn/mmbiz_jpg/btUmCVHwbJUoicwBiacjVeQbu6QxgBVrukzCJPJRkia5cQviaDTbLMc614uobiblN4Au4UApLYOShXNDNjdndjPVswg/0?wx_fmt=jpeg', '', '', '1', '2023-01-14 01:30:49', '1', '2023-01-14 07:31:02', b'1', 1);
INSERT INTO `mp_material` VALUES (82, 1, 'wx5b23ba7a5589ecbb', 'r6ryvl6LrxBU0miaST4Y-vNzhGc_1b37nxAvj0Zt8iuGACe-mC9_a5OhVFIzt0DX', 'image', b'1', 'http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-vNzhGc_1b37nxAvj0Zt8iuGACe-mC9_a5OhVFIzt0DX.png', 'file', 'http://mmbiz.qpic.cn/mmbiz_png/btUmCVHwbJVkZaoiatUmOpaGalzHIVxhUNOGPaZfZUSfKzpS8bPShaicSyErHn2mEzthXochM7GE3tIDAt5FNrUg/0?wx_fmt=png', NULL, NULL, '1', '2023-01-14 08:20:53', '1', '2023-01-14 07:30:59', b'1', 1);
INSERT INTO `mp_material` VALUES (88, 4, 'wx01b971b269525c69', 'rdp2FpJLZJb_Z771EZCE0sdggkEkJ9BXy1wIiory8puv2L0sRYeBBVztrxmjjT_P', 'voice', b'1', 'http://test.yudao.iocoder.cn/rdp2FpJLZJb_Z771EZCE0sdggkEkJ9BXy1wIiory8puv2L0sRYeBBVztrxmjjT_P.amr', 'file', NULL, '', '', '1', '2023-01-14 16:28:53', '1', '2023-01-14 08:29:36', b'1', 1);
INSERT INTO `mp_material` VALUES (89, 4, 'wx01b971b269525c69', 'rdp2FpJLZJb_Z771EZCE0jlwnElym7bDUZUQI6t36O9xlh-wQWZpdDEVNHj_-Zo3', 'video', b'1', 'http://test.yudao.iocoder.cn/rdp2FpJLZJb_Z771EZCE0jlwnElym7bDUZUQI6t36O9xlh-wQWZpdDEVNHj_-Zo3.mp4', 'file', NULL, '1', '2', '1', '2023-01-14 16:53:53', '1', '2023-01-14 08:54:45', b'1', 1);
INSERT INTO `mp_material` VALUES (90, 4, 'wx01b971b269525c69', 'rdp2FpJLZJb_Z771EZCE0nKJFlsOPjLkDApXEgRjaGydiFVTsC0zMq8-x5V6-rG4', 'video', b'1', 'http://test.yudao.iocoder.cn/rdp2FpJLZJb_Z771EZCE0nKJFlsOPjLkDApXEgRjaGydiFVTsC0zMq8-x5V6-rG4.mp4', 'file', NULL, '12', '34', '1', '2023-01-14 16:55:02', '1', '2023-01-14 08:55:06', b'1', 1);

-- ----------------------------
-- Table structure for mp_menu
-- ----------------------------
DROP TABLE IF EXISTS `mp_menu`;
CREATE TABLE `mp_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_id` bigint(20) NOT NULL COMMENT '微信公众号ID',
  `app_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '微信公众号 appid',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `menu_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单标识',
  `parent_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父ID',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '按钮类型',
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网页链接',
  `mini_program_app_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小程序appid',
  `mini_program_page_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小程序页面路径',
  `article_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跳转图文的媒体编号',
  `reply_message_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息类型',
  `reply_content` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复的消息内容',
  `reply_media_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复的媒体文件 id',
  `reply_media_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复的媒体文件 URL',
  `reply_title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复的标题',
  `reply_description` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复的描述',
  `reply_thumb_media_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复的缩略图的媒体 id',
  `reply_thumb_media_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复的缩略图的媒体 URL',
  `reply_articles` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复的图文消息数组',
  `reply_music_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复的音乐链接',
  `reply_hq_music_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复的高质量音乐链接',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 169 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公众号菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mp_menu
-- ----------------------------
INSERT INTO `mp_menu` VALUES (1, 1, 'wx5b23ba7a5589ecbb', '今日歌曲', 'V1001_TODAY_MUSIC', '0', 'click', NULL, NULL, NULL, NULL, 'text', '幸会幸会', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '2023-01-07 02:51:58', '', '2023-01-14 15:44:49', b'1', 1);
INSERT INTO `mp_menu` VALUES (2, 1, 'wx5b23ba7a5589ecbb', '搜索', '', '0', 'view', 'http://www.soso.com/', NULL, NULL, NULL, 'text', '幸会幸会', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '2023-01-07 02:51:58', '', '2023-01-14 13:22:13', b'1', 1);
INSERT INTO `mp_menu` VALUES (3, 1, 'wx5b23ba7a5589ecbb', '父按钮', '', '0', '', '', NULL, NULL, NULL, 'text', '幸会幸会', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '2023-01-07 02:51:58', '', '2023-01-14 15:44:49', b'1', 1);
INSERT INTO `mp_menu` VALUES (4, 1, 'wx5b23ba7a5589ecbb', '归去来兮', 'MUSIC', '3', 'click', NULL, NULL, NULL, NULL, 'text', '幸会幸会', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '2023-01-07 02:51:58', '', '2023-01-14 15:44:49', b'1', 1);
INSERT INTO `mp_menu` VALUES (5, 1, 'wx5b23ba7a5589ecbb', '不说', '', '3', 'view', 'http://www.soso.com/', NULL, NULL, NULL, 'text', '幸会幸会', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '2023-01-07 02:51:58', '', '2023-01-14 15:44:49', b'1', 1);
INSERT INTO `mp_menu` VALUES (26, 1, 'wx5b23ba7a5589ecbb', '今日歌曲', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '1', '2023-01-14 23:44:50', '1', '2023-01-14 16:35:05', b'1', 1);
INSERT INTO `mp_menu` VALUES (27, 1, 'wx5b23ba7a5589ecbb', '搜索', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '1', '2023-01-14 23:44:50', '1', '2023-01-14 16:35:05', b'1', 1);
INSERT INTO `mp_menu` VALUES (28, 1, 'wx5b23ba7a5589ecbb', '父按钮', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '1', '2023-01-14 23:44:50', '1', '2023-01-14 16:35:05', b'1', 1);
INSERT INTO `mp_menu` VALUES (29, 1, 'wx5b23ba7a5589ecbb', '归去来兮', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '1', '2023-01-14 23:44:50', '1', '2023-01-14 16:35:05', b'1', 1);
INSERT INTO `mp_menu` VALUES (30, 1, 'wx5b23ba7a5589ecbb', '不说', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '1', '2023-01-14 23:44:50', '1', '2023-01-14 16:35:05', b'1', 1);
INSERT INTO `mp_menu` VALUES (31, 1, 'wx5b23ba7a5589ecbb', '123', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '1', '2023-01-15 00:35:05', '1', '2023-01-14 16:35:43', b'1', 1);
INSERT INTO `mp_menu` VALUES (32, 1, 'wx5b23ba7a5589ecbb', '123', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '1', '2023-01-15 00:35:43', '1', '2023-01-14 16:39:10', b'1', 1);
INSERT INTO `mp_menu` VALUES (33, 1, 'wx5b23ba7a5589ecbb', '嘿嘿', NULL, '0', 'view', 'https://www.iocoder.cn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '1', '2023-01-15 00:39:10', '1', '2023-01-14 16:40:09', b'1', 1);
INSERT INTO `mp_menu` VALUES (38, 1, 'wx5b23ba7a5589ecbb', '顶级1', NULL, '0', 'view', 'https://www.iocoder.cn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '1', '2023-01-15 00:42:54', '1', '2023-01-14 16:51:35', b'1', 1);
INSERT INTO `mp_menu` VALUES (39, 1, 'wx5b23ba7a5589ecbb', '明星', NULL, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '1', '2023-01-15 00:42:54', '1', '2023-01-14 16:51:35', b'1', 1);
INSERT INTO `mp_menu` VALUES (40, 1, 'wx5b23ba7a5589ecbb', '喊个', NULL, '39', 'view', 'https://www.iocoder.cn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '1', '2023-01-15 00:42:54', '1', '2023-01-14 16:51:35', b'1', 1);
INSERT INTO `mp_menu` VALUES (41, 1, 'wx5b23ba7a5589ecbb', 'haha', NULL, '39', 'view', 'http://soso.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '1', '2023-01-15 00:42:54', '1', '2023-01-14 16:51:35', b'1', 1);
INSERT INTO `mp_menu` VALUES (42, 1, 'wx5b23ba7a5589ecbb', '顶级1', NULL, '0', 'view', 'https://www.iocoder.cn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '1', '2023-01-15 00:51:35', '1', '2023-01-14 16:51:53', b'1', 1);
INSERT INTO `mp_menu` VALUES (43, 1, 'wx5b23ba7a5589ecbb', '明星', NULL, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '1', '2023-01-15 00:51:35', '1', '2023-01-14 16:51:53', b'1', 1);
INSERT INTO `mp_menu` VALUES (44, 1, 'wx5b23ba7a5589ecbb', '喊个', NULL, '43', 'view', 'https://www.iocoder.cn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '1', '2023-01-15 00:51:35', '1', '2023-01-14 16:51:53', b'1', 1);
INSERT INTO `mp_menu` VALUES (45, 1, 'wx5b23ba7a5589ecbb', 'haha', NULL, '43', 'view', 'http://soso.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '1', '2023-01-15 00:51:35', '1', '2023-01-14 16:51:53', b'1', 1);
INSERT INTO `mp_menu` VALUES (46, 1, 'wx5b23ba7a5589ecbb', '测试菜单', NULL, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '1', '2023-01-15 11:32:17', '1', '2023-01-15 04:39:11', b'1', 1);
INSERT INTO `mp_menu` VALUES (47, 1, 'wx5b23ba7a5589ecbb', '跳转网页', NULL, '46', 'view', 'https://www.iocoder.cn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '1', '2023-01-15 11:32:17', '1', '2023-01-15 04:39:11', b'1', 1);
INSERT INTO `mp_menu` VALUES (48, 1, 'wx5b23ba7a5589ecbb', '点击回复', '123', '0', 'click', NULL, NULL, NULL, NULL, 'text', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '1', '2023-01-15 12:39:12', '1', '2023-01-15 09:19:01', b'1', 1);
INSERT INTO `mp_menu` VALUES (49, 1, 'wx5b23ba7a5589ecbb', '点击回复', '123', '0', 'click', NULL, NULL, NULL, NULL, 'image', '', 'r6ryvl6LrxBU0miaST4Y-pgFtUNLu1foMSAMkoOsrQrTZ8EtTMssBLfTtzP0dfjG', 'http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-pgFtUNLu1foMSAMkoOsrQrTZ8EtTMssBLfTtzP0dfjG.png', '', '', NULL, NULL, NULL, '', '', '1', '2023-01-15 17:19:02', '1', '2023-01-15 09:26:50', b'1', 1);
INSERT INTO `mp_menu` VALUES (50, 1, 'wx5b23ba7a5589ecbb', '点击回复', '123', '0', 'click', NULL, NULL, NULL, NULL, 'voice', '', 'a6kOoewXIbX57gB0kCb_Gz-Yg8hVk5OgQ6iWZU_KSOEhpQ31JmkGh0JYPKgi9ebKPthnsckQbQVWfiN58VLrfg', 'http://test.yudao.iocoder.cn/a6kOoewXIbX57gB0kCb_Gz-Yg8hVk5OgQ6iWZU_KSOEhpQ31JmkGh0JYPKgi9ebKPthnsckQbQVWfiN58VLrfg.mp3', '', '', NULL, NULL, NULL, '', '', '1', '2023-01-15 17:26:51', '1', '2023-01-15 09:27:39', b'1', 1);
INSERT INTO `mp_menu` VALUES (51, 1, 'wx5b23ba7a5589ecbb', '点击回复', '123', '0', 'click', NULL, NULL, NULL, NULL, 'video', '', 'XQockIDz-7p8wHuI0wxzd2dZvhKWrQnxM5pPXvaW8Qsid2hLjVxk90wM47ZsYERT', 'http://test.yudao.iocoder.cn/XQockIDz-7p8wHuI0wxzd2dZvhKWrQnxM5pPXvaW8Qsid2hLjVxk90wM47ZsYERT.mp4', '奥特曼', '奥特快', NULL, NULL, NULL, '', '', '1', '2023-01-15 17:27:40', '1', '2023-01-15 09:28:20', b'1', 1);
INSERT INTO `mp_menu` VALUES (52, 1, 'wx5b23ba7a5589ecbb', '点击回复', '123', '0', 'click', NULL, NULL, NULL, NULL, 'video', '', 'XQockIDz-7p8wHuI0wxzd2dZvhKWrQnxM5pPXvaW8Qsid2hLjVxk90wM47ZsYERT', 'http://test.yudao.iocoder.cn/XQockIDz-7p8wHuI0wxzd2dZvhKWrQnxM5pPXvaW8Qsid2hLjVxk90wM47ZsYERT.mp4', NULL, '奥特快', NULL, NULL, NULL, '', '', '1', '2023-01-15 17:28:21', '1', '2023-01-15 09:29:21', b'1', 1);
INSERT INTO `mp_menu` VALUES (53, 1, 'wx5b23ba7a5589ecbb', '点击回复', '123', '0', 'click', NULL, NULL, NULL, NULL, 'video', '', 'XQockIDz-7p8wHuI0wxzd2dZvhKWrQnxM5pPXvaW8Qsid2hLjVxk90wM47ZsYERT', 'http://test.yudao.iocoder.cn/XQockIDz-7p8wHuI0wxzd2dZvhKWrQnxM5pPXvaW8Qsid2hLjVxk90wM47ZsYERT.mp4', NULL, '奥特快', NULL, NULL, NULL, '', '', '1', '2023-01-15 17:29:22', '1', '2023-01-15 09:32:49', b'1', 1);
INSERT INTO `mp_menu` VALUES (54, 1, 'wx5b23ba7a5589ecbb', '回复图片', '01', '0', 'click', NULL, NULL, NULL, NULL, 'image', '', 'r6ryvl6LrxBU0miaST4Y-pgFtUNLu1foMSAMkoOsrQrTZ8EtTMssBLfTtzP0dfjG', 'http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-pgFtUNLu1foMSAMkoOsrQrTZ8EtTMssBLfTtzP0dfjG.png', '', '', NULL, NULL, NULL, '', '', '1', '2023-01-15 17:29:22', '1', '2023-01-15 09:32:49', b'1', 1);
INSERT INTO `mp_menu` VALUES (55, 1, 'wx5b23ba7a5589ecbb', '回复图片', 'image', '0', 'click', NULL, NULL, NULL, NULL, 'image', '', 'r6ryvl6LrxBU0miaST4Y-jVixJGgnBnkBPRbuVptOW0CHYuQFyiOVNtamctS8xU8', 'http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-jVixJGgnBnkBPRbuVptOW0CHYuQFyiOVNtamctS8xU8.jpg', '', '', NULL, NULL, NULL, '', '', '1', '2023-01-15 17:33:06', '1', '2023-01-15 09:33:45', b'1', 1);
INSERT INTO `mp_menu` VALUES (56, 1, 'wx5b23ba7a5589ecbb', '回复图片', 'image', '0', 'click', NULL, NULL, NULL, NULL, 'image', '', 'r6ryvl6LrxBU0miaST4Y-jVixJGgnBnkBPRbuVptOW0CHYuQFyiOVNtamctS8xU8', 'http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-jVixJGgnBnkBPRbuVptOW0CHYuQFyiOVNtamctS8xU8.jpg', NULL, '', NULL, NULL, NULL, '', '', '1', '2023-01-15 17:33:45', '1', '2023-01-15 09:33:55', b'1', 1);
INSERT INTO `mp_menu` VALUES (57, 1, 'wx5b23ba7a5589ecbb', '回复语音', 'aoteman', '0', 'click', NULL, NULL, NULL, NULL, 'voice', '', 'a6kOoewXIbX57gB0kCb_Gz-Yg8hVk5OgQ6iWZU_KSOEhpQ31JmkGh0JYPKgi9ebKPthnsckQbQVWfiN58VLrfg', 'http://test.yudao.iocoder.cn/a6kOoewXIbX57gB0kCb_Gz-Yg8hVk5OgQ6iWZU_KSOEhpQ31JmkGh0JYPKgi9ebKPthnsckQbQVWfiN58VLrfg.mp3', '', '', NULL, NULL, NULL, '', '', '1', '2023-01-15 17:33:45', '1', '2023-01-15 09:33:55', b'1', 1);
INSERT INTO `mp_menu` VALUES (58, 1, 'wx5b23ba7a5589ecbb', '回复图片', 'image', '0', 'click', NULL, NULL, NULL, NULL, 'image', '', 'r6ryvl6LrxBU0miaST4Y-jVixJGgnBnkBPRbuVptOW0CHYuQFyiOVNtamctS8xU8', 'http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-jVixJGgnBnkBPRbuVptOW0CHYuQFyiOVNtamctS8xU8.jpg', NULL, '', NULL, NULL, NULL, '', '', '1', '2023-01-15 17:33:56', '1', '2023-01-15 09:34:02', b'1', 1);
INSERT INTO `mp_menu` VALUES (59, 1, 'wx5b23ba7a5589ecbb', '回复语音', 'aoteman', '0', 'click', NULL, NULL, NULL, NULL, 'voice', '', 'a6kOoewXIbX57gB0kCb_Gz-Yg8hVk5OgQ6iWZU_KSOEhpQ31JmkGh0JYPKgi9ebKPthnsckQbQVWfiN58VLrfg', 'http://test.yudao.iocoder.cn/a6kOoewXIbX57gB0kCb_Gz-Yg8hVk5OgQ6iWZU_KSOEhpQ31JmkGh0JYPKgi9ebKPthnsckQbQVWfiN58VLrfg.mp3', NULL, '', NULL, NULL, NULL, '', '', '1', '2023-01-15 17:33:56', '1', '2023-01-15 09:34:02', b'1', 1);
INSERT INTO `mp_menu` VALUES (60, 1, 'wx5b23ba7a5589ecbb', '回复图片', 'image', '0', 'click', NULL, NULL, NULL, NULL, 'image', '', 'r6ryvl6LrxBU0miaST4Y-jVixJGgnBnkBPRbuVptOW0CHYuQFyiOVNtamctS8xU8', 'http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-jVixJGgnBnkBPRbuVptOW0CHYuQFyiOVNtamctS8xU8.jpg', NULL, '', NULL, NULL, NULL, '', '', '1', '2023-01-15 17:34:02', '1', '2023-01-15 09:34:44', b'1', 1);
INSERT INTO `mp_menu` VALUES (61, 1, 'wx5b23ba7a5589ecbb', '回复语音', 'aoteman', '0', 'click', NULL, NULL, NULL, NULL, 'voice', '', 'a6kOoewXIbX57gB0kCb_Gz-Yg8hVk5OgQ6iWZU_KSOEhpQ31JmkGh0JYPKgi9ebKPthnsckQbQVWfiN58VLrfg', 'http://test.yudao.iocoder.cn/a6kOoewXIbX57gB0kCb_Gz-Yg8hVk5OgQ6iWZU_KSOEhpQ31JmkGh0JYPKgi9ebKPthnsckQbQVWfiN58VLrfg.mp3', NULL, '', NULL, NULL, NULL, '', '', '1', '2023-01-15 17:34:02', '1', '2023-01-15 09:34:44', b'1', 1);
INSERT INTO `mp_menu` VALUES (62, 1, 'wx5b23ba7a5589ecbb', '回复语音', 'aoteman', '0', 'click', NULL, NULL, NULL, NULL, 'voice', '', 'a6kOoewXIbX57gB0kCb_Gz-Yg8hVk5OgQ6iWZU_KSOEhpQ31JmkGh0JYPKgi9ebKPthnsckQbQVWfiN58VLrfg', 'http://test.yudao.iocoder.cn/a6kOoewXIbX57gB0kCb_Gz-Yg8hVk5OgQ6iWZU_KSOEhpQ31JmkGh0JYPKgi9ebKPthnsckQbQVWfiN58VLrfg.mp3', NULL, '', NULL, NULL, NULL, '', '', '1', '2023-01-15 17:34:45', '1', '2023-01-15 09:36:27', b'1', 1);
INSERT INTO `mp_menu` VALUES (63, 1, 'wx5b23ba7a5589ecbb', '回复语音', 'aoteman', '0', 'click', NULL, NULL, NULL, NULL, 'voice', '', 'a6kOoewXIbX57gB0kCb_Gz-Yg8hVk5OgQ6iWZU_KSOEhpQ31JmkGh0JYPKgi9ebKPthnsckQbQVWfiN58VLrfg', 'http://test.yudao.iocoder.cn/a6kOoewXIbX57gB0kCb_Gz-Yg8hVk5OgQ6iWZU_KSOEhpQ31JmkGh0JYPKgi9ebKPthnsckQbQVWfiN58VLrfg.mp3', NULL, '', NULL, NULL, NULL, '', '', '1', '2023-01-15 17:36:28', '1', '2023-01-15 09:37:20', b'1', 1);
INSERT INTO `mp_menu` VALUES (64, 1, 'wx5b23ba7a5589ecbb', '回复语音', 'aoteman', '0', 'click', NULL, NULL, NULL, NULL, 'voice', '', 'a6kOoewXIbX57gB0kCb_Gz-Yg8hVk5OgQ6iWZU_KSOEhpQ31JmkGh0JYPKgi9ebKPthnsckQbQVWfiN58VLrfg', 'http://test.yudao.iocoder.cn/a6kOoewXIbX57gB0kCb_Gz-Yg8hVk5OgQ6iWZU_KSOEhpQ31JmkGh0JYPKgi9ebKPthnsckQbQVWfiN58VLrfg.mp3', NULL, '', NULL, NULL, NULL, '', '', '1', '2023-01-15 17:37:21', '1', '2023-01-15 09:40:13', b'1', 1);
INSERT INTO `mp_menu` VALUES (65, 1, 'wx5b23ba7a5589ecbb', '回复语音', 'aoteman', '0', 'click', NULL, NULL, NULL, NULL, 'voice', '', 'a6kOoewXIbX57gB0kCb_Gz-Yg8hVk5OgQ6iWZU_KSOEhpQ31JmkGh0JYPKgi9ebKPthnsckQbQVWfiN58VLrfg', 'http://test.yudao.iocoder.cn/a6kOoewXIbX57gB0kCb_Gz-Yg8hVk5OgQ6iWZU_KSOEhpQ31JmkGh0JYPKgi9ebKPthnsckQbQVWfiN58VLrfg.mp3', NULL, '', NULL, NULL, NULL, '', '', '1', '2023-01-15 17:40:14', '1', '2023-01-15 09:40:24', b'1', 1);
INSERT INTO `mp_menu` VALUES (66, 1, 'wx5b23ba7a5589ecbb', '回复语音', 'aoteman', '0', 'click', NULL, NULL, NULL, NULL, 'voice', '', 'a6kOoewXIbX57gB0kCb_Gz-Yg8hVk5OgQ6iWZU_KSOEhpQ31JmkGh0JYPKgi9ebKPthnsckQbQVWfiN58VLrfg', 'http://test.yudao.iocoder.cn/a6kOoewXIbX57gB0kCb_Gz-Yg8hVk5OgQ6iWZU_KSOEhpQ31JmkGh0JYPKgi9ebKPthnsckQbQVWfiN58VLrfg.mp3', NULL, '', NULL, NULL, NULL, '', '', '1', '2023-01-15 17:40:24', '1', '2023-01-15 09:41:12', b'1', 1);
INSERT INTO `mp_menu` VALUES (67, 1, 'wx5b23ba7a5589ecbb', '回复语音', 'aoteman', '0', 'click', NULL, NULL, NULL, NULL, 'video', '', 'a6kOoewXIbX57gB0kCb_Gz-Yg8hVk5OgQ6iWZU_KSOEhpQ31JmkGh0JYPKgi9ebKPthnsckQbQVWfiN58VLrfg', 'http://test.yudao.iocoder.cn/a6kOoewXIbX57gB0kCb_Gz-Yg8hVk5OgQ6iWZU_KSOEhpQ31JmkGh0JYPKgi9ebKPthnsckQbQVWfiN58VLrfg.mp3', '', '', NULL, NULL, NULL, '', '', '1', '2023-01-15 17:41:13', '1', '2023-01-15 09:43:32', b'1', 1);
INSERT INTO `mp_menu` VALUES (68, 1, 'wx5b23ba7a5589ecbb', '回复视频', '123', '0', 'click', NULL, NULL, NULL, NULL, 'video', '', 'r6ryvl6LrxBU0miaST4Y-v2-X9sD87sdZ8qoWWgu9QgP2NEjlTvDJ47KfF2xhyiU', 'http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-v2-X9sD87sdZ8qoWWgu9QgP2NEjlTvDJ47KfF2xhyiU.mp4', '我是视频', '我真的是视频', NULL, NULL, NULL, '', '', '1', '2023-01-15 17:41:13', '1', '2023-01-15 09:43:32', b'1', 1);
INSERT INTO `mp_menu` VALUES (69, 1, 'wx5b23ba7a5589ecbb', '回复语音', 'aoteman', '0', 'click', NULL, NULL, NULL, NULL, 'video', '', 'a6kOoewXIbX57gB0kCb_Gz-Yg8hVk5OgQ6iWZU_KSOEhpQ31JmkGh0JYPKgi9ebKPthnsckQbQVWfiN58VLrfg', 'http://test.yudao.iocoder.cn/a6kOoewXIbX57gB0kCb_Gz-Yg8hVk5OgQ6iWZU_KSOEhpQ31JmkGh0JYPKgi9ebKPthnsckQbQVWfiN58VLrfg.mp3', NULL, '', NULL, NULL, NULL, '', '', '1', '2023-01-15 17:43:33', '1', '2023-01-15 10:06:28', b'1', 1);
INSERT INTO `mp_menu` VALUES (70, 1, 'wx5b23ba7a5589ecbb', '回复视频', '123', '0', 'click', NULL, NULL, NULL, NULL, 'video', '', 'r6ryvl6LrxBU0miaST4Y-v2-X9sD87sdZ8qoWWgu9QgP2NEjlTvDJ47KfF2xhyiU', 'http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-v2-X9sD87sdZ8qoWWgu9QgP2NEjlTvDJ47KfF2xhyiU.mp4', NULL, '我真的是视频', NULL, NULL, NULL, '', '', '1', '2023-01-15 17:43:33', '1', '2023-01-15 10:06:28', b'1', 1);
INSERT INTO `mp_menu` VALUES (71, 1, 'wx5b23ba7a5589ecbb', '回复音乐', 'ao11', '0', 'click', NULL, NULL, NULL, NULL, 'music', '', NULL, NULL, '1', '2', NULL, NULL, NULL, '', '', '1', '2023-01-15 17:43:33', '1', '2023-01-15 10:06:28', b'1', 1);
INSERT INTO `mp_menu` VALUES (72, 1, 'wx5b23ba7a5589ecbb', '回复音乐', '01', '0', 'click', NULL, NULL, NULL, NULL, 'music', '', NULL, NULL, '1', '2', 'wBnOlFbeYaWXb7AVX5Ha_Uy373JHA2EoS0FUziAhkwP0r6Hv43PeQHXKY4GADfbl', 'http://test.yudao.iocoder.cn/wBnOlFbeYaWXb7AVX5Ha_Uy373JHA2EoS0FUziAhkwP0r6Hv43PeQHXKY4GADfbl.png', NULL, 'https://www.iocoder.cn/1.mp3', 'https://www.iocoder.cn/2.mp3', '1', '2023-01-15 18:16:12', '1', '2023-01-15 10:21:13', b'1', 1);
INSERT INTO `mp_menu` VALUES (73, 1, 'wx5b23ba7a5589ecbb', '回复音乐', '01', '0', 'click', NULL, NULL, NULL, NULL, 'music', '', NULL, NULL, '1', '2', 'wBnOlFbeYaWXb7AVX5Ha_Uy373JHA2EoS0FUziAhkwP0r6Hv43PeQHXKY4GADfbl', 'http://test.yudao.iocoder.cn/wBnOlFbeYaWXb7AVX5Ha_Uy373JHA2EoS0FUziAhkwP0r6Hv43PeQHXKY4GADfbl.png', NULL, 'https://www.iocoder.cn/1.mp3', 'https://www.iocoder.cn/2.mp3', '1', '2023-01-15 18:21:14', '1', '2023-01-15 10:21:36', b'1', 1);
INSERT INTO `mp_menu` VALUES (74, 1, 'wx5b23ba7a5589ecbb', '回复音乐', '01', '0', 'click', NULL, NULL, NULL, NULL, 'music', '', NULL, NULL, '1', '2', 'wBnOlFbeYaWXb7AVX5Ha_Uy373JHA2EoS0FUziAhkwP0r6Hv43PeQHXKY4GADfbl', 'http://test.yudao.iocoder.cn/wBnOlFbeYaWXb7AVX5Ha_Uy373JHA2EoS0FUziAhkwP0r6Hv43PeQHXKY4GADfbl.png', NULL, 'https://www.iocoder.cn/1.mp3', 'https://www.iocoder.cn/2.mp3', '1', '2023-01-15 18:21:36', '1', '2023-01-15 10:21:59', b'1', 1);
INSERT INTO `mp_menu` VALUES (75, 1, 'wx5b23ba7a5589ecbb', '回复图文', 'music', '0', 'click', NULL, NULL, NULL, NULL, 'news', '', NULL, NULL, '', '', NULL, NULL, '[{\"title\":\"我是标题\",\"description\":null,\"picUrl\":\"http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-pIcmK-zAAId-9TGgy-DrSLhjVuWbuT3ZBjk9K1yQ0Dn.png\",\"url\":\"http://mp.weixin.qq.com/s?__biz=MzA3NjM4MzQzOQ==&mid=2247483662&idx=1&sn=dadf5d7e9aa594b58666fb2013fdf215&chksm=9f6354aea814ddb8fde13b17a34acbe86987b5c3403c6bd47e1e94977f6988b62653f6ab55e6#rd\"},{\"title\":\"我是标题 2\",\"description\":null,\"picUrl\":\"http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-pIcmK-zAAId-9TGgy-DrSLhjVuWbuT3ZBjk9K1yQ0Dn.png\",\"url\":\"http://mp.weixin.qq.com/s?__biz=MzA3NjM4MzQzOQ==&mid=2247483662&idx=2&sn=c8041e2fc639c07d73bbbb6f80cf1784&chksm=9f6354aea814ddb8f48d7b330252c0374878014feb45a8fd4c22aaa0483c062f20ba15463368#rd\"}]', NULL, NULL, '1', '2023-01-15 18:23:23', '1', '2023-01-15 10:23:53', b'1', 1);
INSERT INTO `mp_menu` VALUES (76, 1, 'wx5b23ba7a5589ecbb', '回复图文', 'music', '0', 'click', NULL, NULL, NULL, NULL, 'text', '123', NULL, NULL, '', '', NULL, NULL, '[{\"title\":\"我是标题\",\"description\":null,\"picUrl\":\"http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-pIcmK-zAAId-9TGgy-DrSLhjVuWbuT3ZBjk9K1yQ0Dn.png\",\"url\":\"http://mp.weixin.qq.com/s?__biz=MzA3NjM4MzQzOQ==&mid=2247483662&idx=1&sn=dadf5d7e9aa594b58666fb2013fdf215&chksm=9f6354aea814ddb8fde13b17a34acbe86987b5c3403c6bd47e1e94977f6988b62653f6ab55e6#rd\"},{\"title\":\"我是标题 2\",\"description\":null,\"picUrl\":\"http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-pIcmK-zAAId-9TGgy-DrSLhjVuWbuT3ZBjk9K1yQ0Dn.png\",\"url\":\"http://mp.weixin.qq.com/s?__biz=MzA3NjM4MzQzOQ==&mid=2247483662&idx=2&sn=c8041e2fc639c07d73bbbb6f80cf1784&chksm=9f6354aea814ddb8f48d7b330252c0374878014feb45a8fd4c22aaa0483c062f20ba15463368#rd\"}]', NULL, NULL, '1', '2023-01-15 18:23:54', '1', '2023-01-15 11:13:21', b'1', 1);
INSERT INTO `mp_menu` VALUES (77, 1, 'wx5b23ba7a5589ecbb', '回复图文', NULL, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:13:21', '1', '2023-01-15 11:13:36', b'1', 1);
INSERT INTO `mp_menu` VALUES (78, 1, 'wx5b23ba7a5589ecbb', '文本', 't1', '77', 'click', NULL, NULL, NULL, NULL, 'text', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:13:21', '1', '2023-01-15 11:13:36', b'1', 1);
INSERT INTO `mp_menu` VALUES (79, 1, 'wx5b23ba7a5589ecbb', '回复图文', NULL, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:13:36', '1', '2023-01-15 11:13:49', b'1', 1);
INSERT INTO `mp_menu` VALUES (80, 1, 'wx5b23ba7a5589ecbb', '文本', 't1', '79', 'click', NULL, NULL, NULL, NULL, 'text', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:13:36', '1', '2023-01-15 11:13:49', b'1', 1);
INSERT INTO `mp_menu` VALUES (81, 1, 'wx5b23ba7a5589ecbb', '图片', 'pic', '79', 'click', NULL, NULL, NULL, NULL, 'image', '', 'r6ryvl6LrxBU0miaST4Y-pgFtUNLu1foMSAMkoOsrQrTZ8EtTMssBLfTtzP0dfjG', 'http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-pgFtUNLu1foMSAMkoOsrQrTZ8EtTMssBLfTtzP0dfjG.png', '', '', NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:13:36', '1', '2023-01-15 11:13:49', b'1', 1);
INSERT INTO `mp_menu` VALUES (82, 1, 'wx5b23ba7a5589ecbb', '回复图文', NULL, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:13:49', '1', '2023-01-15 11:14:06', b'1', 1);
INSERT INTO `mp_menu` VALUES (83, 1, 'wx5b23ba7a5589ecbb', '文本', 't1', '82', 'click', NULL, NULL, NULL, NULL, 'text', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:13:49', '1', '2023-01-15 11:14:06', b'1', 1);
INSERT INTO `mp_menu` VALUES (84, 1, 'wx5b23ba7a5589ecbb', '图片', 'pic', '82', 'click', NULL, NULL, NULL, NULL, 'image', '', 'r6ryvl6LrxBU0miaST4Y-pgFtUNLu1foMSAMkoOsrQrTZ8EtTMssBLfTtzP0dfjG', 'http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-pgFtUNLu1foMSAMkoOsrQrTZ8EtTMssBLfTtzP0dfjG.png', '', '', NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:13:49', '1', '2023-01-15 11:14:06', b'1', 1);
INSERT INTO `mp_menu` VALUES (85, 1, 'wx5b23ba7a5589ecbb', '语音', 'v3', '82', 'click', NULL, NULL, NULL, NULL, 'voice', '', 'a6kOoewXIbX57gB0kCb_G0h41eeCLWXi-DiMGrPG1iQwjuxGoAoDZCqt6J7IrUrjYwTfa9dGyTJ7qbQ-8TlNrA', 'http://test.yudao.iocoder.cn/a6kOoewXIbX57gB0kCb_G0h41eeCLWXi-DiMGrPG1iQwjuxGoAoDZCqt6J7IrUrjYwTfa9dGyTJ7qbQ-8TlNrA.mp3', '', '', NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:13:49', '1', '2023-01-15 11:14:06', b'1', 1);
INSERT INTO `mp_menu` VALUES (86, 1, 'wx5b23ba7a5589ecbb', '回复图文', NULL, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:14:07', '1', '2023-01-15 11:14:35', b'1', 1);
INSERT INTO `mp_menu` VALUES (87, 1, 'wx5b23ba7a5589ecbb', '文本', 't1', '86', 'click', NULL, NULL, NULL, NULL, 'text', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:14:07', '1', '2023-01-15 11:14:35', b'1', 1);
INSERT INTO `mp_menu` VALUES (88, 1, 'wx5b23ba7a5589ecbb', '图片', 'pic', '86', 'click', NULL, NULL, NULL, NULL, 'image', '', 'r6ryvl6LrxBU0miaST4Y-pgFtUNLu1foMSAMkoOsrQrTZ8EtTMssBLfTtzP0dfjG', 'http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-pgFtUNLu1foMSAMkoOsrQrTZ8EtTMssBLfTtzP0dfjG.png', '', '', NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:14:07', '1', '2023-01-15 11:14:35', b'1', 1);
INSERT INTO `mp_menu` VALUES (89, 1, 'wx5b23ba7a5589ecbb', '语音', 'v3', '86', 'click', NULL, NULL, NULL, NULL, 'voice', '', 'a6kOoewXIbX57gB0kCb_G0h41eeCLWXi-DiMGrPG1iQwjuxGoAoDZCqt6J7IrUrjYwTfa9dGyTJ7qbQ-8TlNrA', 'http://test.yudao.iocoder.cn/a6kOoewXIbX57gB0kCb_G0h41eeCLWXi-DiMGrPG1iQwjuxGoAoDZCqt6J7IrUrjYwTfa9dGyTJ7qbQ-8TlNrA.mp3', '', '', NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:14:07', '1', '2023-01-15 11:14:35', b'1', 1);
INSERT INTO `mp_menu` VALUES (90, 1, 'wx5b23ba7a5589ecbb', '子菜单名称', 'o', '86', 'click', NULL, NULL, NULL, NULL, 'video', '', 'r6ryvl6LrxBU0miaST4Y-v2-X9sD87sdZ8qoWWgu9QgP2NEjlTvDJ47KfF2xhyiU', 'http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-v2-X9sD87sdZ8qoWWgu9QgP2NEjlTvDJ47KfF2xhyiU.mp4', '我是视频', '我真的是视频', NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:14:07', '1', '2023-01-15 11:14:35', b'1', 1);
INSERT INTO `mp_menu` VALUES (91, 1, 'wx5b23ba7a5589ecbb', '回复图文', NULL, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:14:35', '1', '2023-01-15 11:18:13', b'1', 1);
INSERT INTO `mp_menu` VALUES (92, 1, 'wx5b23ba7a5589ecbb', '文本', 't1', '91', 'click', NULL, NULL, NULL, NULL, 'text', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:14:35', '1', '2023-01-15 11:18:13', b'1', 1);
INSERT INTO `mp_menu` VALUES (93, 1, 'wx5b23ba7a5589ecbb', '图片', 'pic', '91', 'click', NULL, NULL, NULL, NULL, 'image', '', 'r6ryvl6LrxBU0miaST4Y-pgFtUNLu1foMSAMkoOsrQrTZ8EtTMssBLfTtzP0dfjG', 'http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-pgFtUNLu1foMSAMkoOsrQrTZ8EtTMssBLfTtzP0dfjG.png', '', '', NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:14:35', '1', '2023-01-15 11:18:13', b'1', 1);
INSERT INTO `mp_menu` VALUES (94, 1, 'wx5b23ba7a5589ecbb', '语音', 'v3', '91', 'click', NULL, NULL, NULL, NULL, 'voice', '', 'a6kOoewXIbX57gB0kCb_G0h41eeCLWXi-DiMGrPG1iQwjuxGoAoDZCqt6J7IrUrjYwTfa9dGyTJ7qbQ-8TlNrA', 'http://test.yudao.iocoder.cn/a6kOoewXIbX57gB0kCb_G0h41eeCLWXi-DiMGrPG1iQwjuxGoAoDZCqt6J7IrUrjYwTfa9dGyTJ7qbQ-8TlNrA.mp3', '', '', NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:14:35', '1', '2023-01-15 11:18:13', b'1', 1);
INSERT INTO `mp_menu` VALUES (95, 1, 'wx5b23ba7a5589ecbb', '视频', 'o', '91', 'click', NULL, NULL, NULL, NULL, 'video', '', 'r6ryvl6LrxBU0miaST4Y-v2-X9sD87sdZ8qoWWgu9QgP2NEjlTvDJ47KfF2xhyiU', 'http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-v2-X9sD87sdZ8qoWWgu9QgP2NEjlTvDJ47KfF2xhyiU.mp4', '我是视频', '我真的是视频', NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:14:35', '1', '2023-01-15 11:18:13', b'1', 1);
INSERT INTO `mp_menu` VALUES (96, 1, 'wx5b23ba7a5589ecbb', '图文', 'wx', '91', 'click', NULL, NULL, NULL, NULL, 'news', '', NULL, NULL, '', '', NULL, NULL, '[{\"title\":\"我是标题\",\"description\":null,\"picUrl\":\"http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-pIcmK-zAAId-9TGgy-DrSLhjVuWbuT3ZBjk9K1yQ0Dn.png\",\"url\":\"http://mp.weixin.qq.com/s?__biz=MzA3NjM4MzQzOQ==&mid=2247483662&idx=1&sn=dadf5d7e9aa594b58666fb2013fdf215&chksm=9f6354aea814ddb8fde13b17a34acbe86987b5c3403c6bd47e1e94977f6988b62653f6ab55e6#rd\"},{\"title\":\"我是标题 2\",\"description\":null,\"picUrl\":\"http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-pIcmK-zAAId-9TGgy-DrSLhjVuWbuT3ZBjk9K1yQ0Dn.png\",\"url\":\"http://mp.weixin.qq.com/s?__biz=MzA3NjM4MzQzOQ==&mid=2247483662&idx=2&sn=c8041e2fc639c07d73bbbb6f80cf1784&chksm=9f6354aea814ddb8f48d7b330252c0374878014feb45a8fd4c22aaa0483c062f20ba15463368#rd\"}]', NULL, NULL, '1', '2023-01-15 19:14:35', '1', '2023-01-15 11:18:13', b'1', 1);
INSERT INTO `mp_menu` VALUES (97, 1, 'wx5b23ba7a5589ecbb', '回复图文', NULL, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:18:14', '1', '2023-01-15 11:26:07', b'1', 1);
INSERT INTO `mp_menu` VALUES (98, 1, 'wx5b23ba7a5589ecbb', '文本', 't1', '97', 'click', NULL, NULL, NULL, NULL, 'text', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:18:14', '1', '2023-01-15 11:26:07', b'1', 1);
INSERT INTO `mp_menu` VALUES (99, 1, 'wx5b23ba7a5589ecbb', '图片', 'pic', '97', 'click', NULL, NULL, NULL, NULL, 'image', '', 'r6ryvl6LrxBU0miaST4Y-pgFtUNLu1foMSAMkoOsrQrTZ8EtTMssBLfTtzP0dfjG', 'http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-pgFtUNLu1foMSAMkoOsrQrTZ8EtTMssBLfTtzP0dfjG.png', '', '', NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:18:14', '1', '2023-01-15 11:26:07', b'1', 1);
INSERT INTO `mp_menu` VALUES (100, 1, 'wx5b23ba7a5589ecbb', '语音', 'v3', '97', 'click', NULL, NULL, NULL, NULL, 'voice', '', 'a6kOoewXIbX57gB0kCb_G0h41eeCLWXi-DiMGrPG1iQwjuxGoAoDZCqt6J7IrUrjYwTfa9dGyTJ7qbQ-8TlNrA', 'http://test.yudao.iocoder.cn/a6kOoewXIbX57gB0kCb_G0h41eeCLWXi-DiMGrPG1iQwjuxGoAoDZCqt6J7IrUrjYwTfa9dGyTJ7qbQ-8TlNrA.mp3', '', '', NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:18:14', '1', '2023-01-15 11:26:07', b'1', 1);
INSERT INTO `mp_menu` VALUES (101, 1, 'wx5b23ba7a5589ecbb', '视频', 'o', '97', 'click', NULL, NULL, NULL, NULL, 'video', '', 'r6ryvl6LrxBU0miaST4Y-v2-X9sD87sdZ8qoWWgu9QgP2NEjlTvDJ47KfF2xhyiU', 'http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-v2-X9sD87sdZ8qoWWgu9QgP2NEjlTvDJ47KfF2xhyiU.mp4', '我是视频', '我真的是视频', NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:18:14', '1', '2023-01-15 11:26:07', b'1', 1);
INSERT INTO `mp_menu` VALUES (102, 1, 'wx5b23ba7a5589ecbb', '图文', 'wx', '97', 'click', NULL, NULL, NULL, NULL, 'news', '', NULL, NULL, '', '', NULL, NULL, '[{\"title\":\"我是标题\",\"description\":null,\"picUrl\":\"http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-pIcmK-zAAId-9TGgy-DrSLhjVuWbuT3ZBjk9K1yQ0Dn.png\",\"url\":\"http://mp.weixin.qq.com/s?__biz=MzA3NjM4MzQzOQ==&mid=2247483662&idx=1&sn=dadf5d7e9aa594b58666fb2013fdf215&chksm=9f6354aea814ddb8fde13b17a34acbe86987b5c3403c6bd47e1e94977f6988b62653f6ab55e6#rd\"},{\"title\":\"我是标题 2\",\"description\":null,\"picUrl\":\"http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-pIcmK-zAAId-9TGgy-DrSLhjVuWbuT3ZBjk9K1yQ0Dn.png\",\"url\":\"http://mp.weixin.qq.com/s?__biz=MzA3NjM4MzQzOQ==&mid=2247483662&idx=2&sn=c8041e2fc639c07d73bbbb6f80cf1784&chksm=9f6354aea814ddb8f48d7b330252c0374878014feb45a8fd4c22aaa0483c062f20ba15463368#rd\"}]', NULL, NULL, '1', '2023-01-15 19:18:14', '1', '2023-01-15 11:26:07', b'1', 1);
INSERT INTO `mp_menu` VALUES (103, 1, 'wx5b23ba7a5589ecbb', '测试', NULL, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:18:14', '1', '2023-01-15 11:26:07', b'1', 1);
INSERT INTO `mp_menu` VALUES (104, 1, 'wx5b23ba7a5589ecbb', '跳转网页', NULL, '103', 'view', 'https://www.iocoder.cn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:18:14', '1', '2023-01-15 11:26:07', b'1', 1);
INSERT INTO `mp_menu` VALUES (105, 1, 'wx5b23ba7a5589ecbb', '回复图文', NULL, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:26:08', '1', '2023-01-15 11:33:57', b'1', 1);
INSERT INTO `mp_menu` VALUES (106, 1, 'wx5b23ba7a5589ecbb', '文本', 't1', '105', 'click', NULL, NULL, NULL, NULL, 'text', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:26:08', '1', '2023-01-15 11:33:57', b'1', 1);
INSERT INTO `mp_menu` VALUES (107, 1, 'wx5b23ba7a5589ecbb', '图片', 'pic', '105', 'click', NULL, NULL, NULL, NULL, 'image', '', 'r6ryvl6LrxBU0miaST4Y-pgFtUNLu1foMSAMkoOsrQrTZ8EtTMssBLfTtzP0dfjG', 'http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-pgFtUNLu1foMSAMkoOsrQrTZ8EtTMssBLfTtzP0dfjG.png', '', '', NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:26:08', '1', '2023-01-15 11:33:57', b'1', 1);
INSERT INTO `mp_menu` VALUES (108, 1, 'wx5b23ba7a5589ecbb', '语音', 'v3', '105', 'click', NULL, NULL, NULL, NULL, 'voice', '', 'a6kOoewXIbX57gB0kCb_G0h41eeCLWXi-DiMGrPG1iQwjuxGoAoDZCqt6J7IrUrjYwTfa9dGyTJ7qbQ-8TlNrA', 'http://test.yudao.iocoder.cn/a6kOoewXIbX57gB0kCb_G0h41eeCLWXi-DiMGrPG1iQwjuxGoAoDZCqt6J7IrUrjYwTfa9dGyTJ7qbQ-8TlNrA.mp3', '', '', NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:26:08', '1', '2023-01-15 11:33:57', b'1', 1);
INSERT INTO `mp_menu` VALUES (109, 1, 'wx5b23ba7a5589ecbb', '视频', 'o', '105', 'click', NULL, NULL, NULL, NULL, 'video', '', 'r6ryvl6LrxBU0miaST4Y-v2-X9sD87sdZ8qoWWgu9QgP2NEjlTvDJ47KfF2xhyiU', 'http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-v2-X9sD87sdZ8qoWWgu9QgP2NEjlTvDJ47KfF2xhyiU.mp4', '我是视频', '我真的是视频', NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:26:08', '1', '2023-01-15 11:33:57', b'1', 1);
INSERT INTO `mp_menu` VALUES (110, 1, 'wx5b23ba7a5589ecbb', '图文', 'wx', '105', 'click', NULL, NULL, NULL, NULL, 'news', '', NULL, NULL, '', '', NULL, NULL, '[{\"title\":\"我是标题\",\"description\":null,\"picUrl\":\"http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-pIcmK-zAAId-9TGgy-DrSLhjVuWbuT3ZBjk9K1yQ0Dn.png\",\"url\":\"http://mp.weixin.qq.com/s?__biz=MzA3NjM4MzQzOQ==&mid=2247483662&idx=1&sn=dadf5d7e9aa594b58666fb2013fdf215&chksm=9f6354aea814ddb8fde13b17a34acbe86987b5c3403c6bd47e1e94977f6988b62653f6ab55e6#rd\"},{\"title\":\"我是标题 2\",\"description\":null,\"picUrl\":\"http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-pIcmK-zAAId-9TGgy-DrSLhjVuWbuT3ZBjk9K1yQ0Dn.png\",\"url\":\"http://mp.weixin.qq.com/s?__biz=MzA3NjM4MzQzOQ==&mid=2247483662&idx=2&sn=c8041e2fc639c07d73bbbb6f80cf1784&chksm=9f6354aea814ddb8f48d7b330252c0374878014feb45a8fd4c22aaa0483c062f20ba15463368#rd\"}]', NULL, NULL, '1', '2023-01-15 19:26:08', '1', '2023-01-15 11:33:57', b'1', 1);
INSERT INTO `mp_menu` VALUES (111, 1, 'wx5b23ba7a5589ecbb', '测试', NULL, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:26:08', '1', '2023-01-15 11:33:57', b'1', 1);
INSERT INTO `mp_menu` VALUES (112, 1, 'wx5b23ba7a5589ecbb', '跳转网页', NULL, '111', 'view', 'https://www.iocoder.cn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:26:08', '1', '2023-01-15 11:33:57', b'1', 1);
INSERT INTO `mp_menu` VALUES (113, 1, 'wx5b23ba7a5589ecbb', '扫码回复', 'test_02', '111', 'scancode_waitmsg', NULL, NULL, NULL, NULL, 'text', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:26:08', '1', '2023-01-15 11:33:57', b'1', 1);
INSERT INTO `mp_menu` VALUES (114, 1, 'wx5b23ba7a5589ecbb', '回复图文', NULL, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:33:58', '1', '2023-01-15 11:44:54', b'1', 1);
INSERT INTO `mp_menu` VALUES (115, 1, 'wx5b23ba7a5589ecbb', '文本', 't1', '114', 'click', NULL, NULL, NULL, NULL, 'text', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:33:58', '1', '2023-01-15 11:44:54', b'1', 1);
INSERT INTO `mp_menu` VALUES (116, 1, 'wx5b23ba7a5589ecbb', '图片', 'pic', '114', 'click', NULL, NULL, NULL, NULL, 'image', '', 'r6ryvl6LrxBU0miaST4Y-pgFtUNLu1foMSAMkoOsrQrTZ8EtTMssBLfTtzP0dfjG', 'http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-pgFtUNLu1foMSAMkoOsrQrTZ8EtTMssBLfTtzP0dfjG.png', '', '', NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:33:58', '1', '2023-01-15 11:44:54', b'1', 1);
INSERT INTO `mp_menu` VALUES (117, 1, 'wx5b23ba7a5589ecbb', '语音', 'v3', '114', 'click', NULL, NULL, NULL, NULL, 'voice', '', 'a6kOoewXIbX57gB0kCb_G0h41eeCLWXi-DiMGrPG1iQwjuxGoAoDZCqt6J7IrUrjYwTfa9dGyTJ7qbQ-8TlNrA', 'http://test.yudao.iocoder.cn/a6kOoewXIbX57gB0kCb_G0h41eeCLWXi-DiMGrPG1iQwjuxGoAoDZCqt6J7IrUrjYwTfa9dGyTJ7qbQ-8TlNrA.mp3', '', '', NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:33:58', '1', '2023-01-15 11:44:54', b'1', 1);
INSERT INTO `mp_menu` VALUES (118, 1, 'wx5b23ba7a5589ecbb', '视频', 'o', '114', 'click', NULL, NULL, NULL, NULL, 'video', '', 'r6ryvl6LrxBU0miaST4Y-v2-X9sD87sdZ8qoWWgu9QgP2NEjlTvDJ47KfF2xhyiU', 'http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-v2-X9sD87sdZ8qoWWgu9QgP2NEjlTvDJ47KfF2xhyiU.mp4', '我是视频', '我真的是视频', NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:33:58', '1', '2023-01-15 11:44:54', b'1', 1);
INSERT INTO `mp_menu` VALUES (119, 1, 'wx5b23ba7a5589ecbb', '图文', 'wx', '114', 'click', NULL, NULL, NULL, NULL, 'news', '', NULL, NULL, '', '', NULL, NULL, '[{\"title\":\"我是标题\",\"description\":null,\"picUrl\":\"http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-pIcmK-zAAId-9TGgy-DrSLhjVuWbuT3ZBjk9K1yQ0Dn.png\",\"url\":\"http://mp.weixin.qq.com/s?__biz=MzA3NjM4MzQzOQ==&mid=2247483662&idx=1&sn=dadf5d7e9aa594b58666fb2013fdf215&chksm=9f6354aea814ddb8fde13b17a34acbe86987b5c3403c6bd47e1e94977f6988b62653f6ab55e6#rd\"},{\"title\":\"我是标题 2\",\"description\":null,\"picUrl\":\"http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-pIcmK-zAAId-9TGgy-DrSLhjVuWbuT3ZBjk9K1yQ0Dn.png\",\"url\":\"http://mp.weixin.qq.com/s?__biz=MzA3NjM4MzQzOQ==&mid=2247483662&idx=2&sn=c8041e2fc639c07d73bbbb6f80cf1784&chksm=9f6354aea814ddb8f48d7b330252c0374878014feb45a8fd4c22aaa0483c062f20ba15463368#rd\"}]', NULL, NULL, '1', '2023-01-15 19:33:58', '1', '2023-01-15 11:44:54', b'1', 1);
INSERT INTO `mp_menu` VALUES (120, 1, 'wx5b23ba7a5589ecbb', '测试', NULL, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:33:58', '1', '2023-01-15 11:44:54', b'1', 1);
INSERT INTO `mp_menu` VALUES (121, 1, 'wx5b23ba7a5589ecbb', '跳转网页', NULL, '120', 'view', 'https://www.iocoder.cn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:33:58', '1', '2023-01-15 11:44:54', b'1', 1);
INSERT INTO `mp_menu` VALUES (122, 1, 'wx5b23ba7a5589ecbb', '扫码回复', 'test_02', '120', 'scancode_waitmsg', NULL, NULL, NULL, NULL, 'text', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:33:58', '1', '2023-01-15 11:44:54', b'1', 1);
INSERT INTO `mp_menu` VALUES (123, 1, 'wx5b23ba7a5589ecbb', '扫码直接回结果', '2344455', '120', 'scancode_push', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:33:58', '1', '2023-01-15 11:44:54', b'1', 1);
INSERT INTO `mp_menu` VALUES (124, 1, 'wx5b23ba7a5589ecbb', '回复图文', NULL, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:44:55', '1', '2023-01-15 11:52:04', b'1', 1);
INSERT INTO `mp_menu` VALUES (125, 1, 'wx5b23ba7a5589ecbb', '文本', 't1', '124', 'click', NULL, NULL, NULL, NULL, 'text', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:44:55', '1', '2023-01-15 11:52:04', b'1', 1);
INSERT INTO `mp_menu` VALUES (126, 1, 'wx5b23ba7a5589ecbb', '图片', 'pic', '124', 'click', NULL, NULL, NULL, NULL, 'image', '', 'r6ryvl6LrxBU0miaST4Y-pgFtUNLu1foMSAMkoOsrQrTZ8EtTMssBLfTtzP0dfjG', 'http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-pgFtUNLu1foMSAMkoOsrQrTZ8EtTMssBLfTtzP0dfjG.png', '', '', NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:44:55', '1', '2023-01-15 11:52:04', b'1', 1);
INSERT INTO `mp_menu` VALUES (127, 1, 'wx5b23ba7a5589ecbb', '语音', 'v3', '124', 'click', NULL, NULL, NULL, NULL, 'voice', '', 'a6kOoewXIbX57gB0kCb_G0h41eeCLWXi-DiMGrPG1iQwjuxGoAoDZCqt6J7IrUrjYwTfa9dGyTJ7qbQ-8TlNrA', 'http://test.yudao.iocoder.cn/a6kOoewXIbX57gB0kCb_G0h41eeCLWXi-DiMGrPG1iQwjuxGoAoDZCqt6J7IrUrjYwTfa9dGyTJ7qbQ-8TlNrA.mp3', '', '', NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:44:55', '1', '2023-01-15 11:52:04', b'1', 1);
INSERT INTO `mp_menu` VALUES (128, 1, 'wx5b23ba7a5589ecbb', '视频', 'o', '124', 'click', NULL, NULL, NULL, NULL, 'video', '', 'r6ryvl6LrxBU0miaST4Y-v2-X9sD87sdZ8qoWWgu9QgP2NEjlTvDJ47KfF2xhyiU', 'http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-v2-X9sD87sdZ8qoWWgu9QgP2NEjlTvDJ47KfF2xhyiU.mp4', '我是视频', '我真的是视频', NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:44:55', '1', '2023-01-15 11:52:04', b'1', 1);
INSERT INTO `mp_menu` VALUES (129, 1, 'wx5b23ba7a5589ecbb', '图文', 'wx', '124', 'click', NULL, NULL, NULL, NULL, 'news', '', NULL, NULL, '', '', NULL, NULL, '[{\"title\":\"我是标题\",\"description\":null,\"picUrl\":\"http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-pIcmK-zAAId-9TGgy-DrSLhjVuWbuT3ZBjk9K1yQ0Dn.png\",\"url\":\"http://mp.weixin.qq.com/s?__biz=MzA3NjM4MzQzOQ==&mid=2247483662&idx=1&sn=dadf5d7e9aa594b58666fb2013fdf215&chksm=9f6354aea814ddb8fde13b17a34acbe86987b5c3403c6bd47e1e94977f6988b62653f6ab55e6#rd\"},{\"title\":\"我是标题 2\",\"description\":null,\"picUrl\":\"http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-pIcmK-zAAId-9TGgy-DrSLhjVuWbuT3ZBjk9K1yQ0Dn.png\",\"url\":\"http://mp.weixin.qq.com/s?__biz=MzA3NjM4MzQzOQ==&mid=2247483662&idx=2&sn=c8041e2fc639c07d73bbbb6f80cf1784&chksm=9f6354aea814ddb8f48d7b330252c0374878014feb45a8fd4c22aaa0483c062f20ba15463368#rd\"}]', NULL, NULL, '1', '2023-01-15 19:44:55', '1', '2023-01-15 11:52:04', b'1', 1);
INSERT INTO `mp_menu` VALUES (130, 1, 'wx5b23ba7a5589ecbb', '测试', NULL, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:44:55', '1', '2023-01-15 11:52:04', b'1', 1);
INSERT INTO `mp_menu` VALUES (131, 1, 'wx5b23ba7a5589ecbb', '跳转网页', NULL, '130', 'view', 'https://www.iocoder.cn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:44:55', '1', '2023-01-15 11:52:04', b'1', 1);
INSERT INTO `mp_menu` VALUES (132, 1, 'wx5b23ba7a5589ecbb', '扫码回复', 'test_02', '130', 'scancode_waitmsg', NULL, NULL, NULL, NULL, 'text', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:44:55', '1', '2023-01-15 11:52:04', b'1', 1);
INSERT INTO `mp_menu` VALUES (133, 1, 'wx5b23ba7a5589ecbb', '扫码直接回结果', '2344455', '130', 'scancode_push', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:44:55', '1', '2023-01-15 11:52:04', b'1', 1);
INSERT INTO `mp_menu` VALUES (134, 1, 'wx5b23ba7a5589ecbb', '系统拍照', '0x0', '130', 'pic_sysphoto', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:44:55', '1', '2023-01-15 11:52:04', b'1', 1);
INSERT INTO `mp_menu` VALUES (135, 1, 'wx5b23ba7a5589ecbb', '拍照或相册', '0x3', '130', 'pic_photo_or_album', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:44:55', '1', '2023-01-15 11:52:04', b'1', 1);
INSERT INTO `mp_menu` VALUES (136, 1, 'wx5b23ba7a5589ecbb', '测试2', NULL, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:44:55', '1', '2023-01-15 11:52:04', b'1', 1);
INSERT INTO `mp_menu` VALUES (137, 1, 'wx5b23ba7a5589ecbb', '微信相册', 'ppp2222', '136', 'pic_weixin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:44:55', '1', '2023-01-15 11:52:04', b'1', 1);
INSERT INTO `mp_menu` VALUES (138, 1, 'wx5b23ba7a5589ecbb', '回复图文', NULL, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:52:04', '1', '2023-01-15 13:20:22', b'1', 1);
INSERT INTO `mp_menu` VALUES (139, 1, 'wx5b23ba7a5589ecbb', '文本', 't1', '138', 'click', NULL, NULL, NULL, NULL, 'text', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:52:04', '1', '2023-01-15 13:20:22', b'1', 1);
INSERT INTO `mp_menu` VALUES (140, 1, 'wx5b23ba7a5589ecbb', '图片', 'pic', '138', 'click', NULL, NULL, NULL, NULL, 'image', '', 'r6ryvl6LrxBU0miaST4Y-pgFtUNLu1foMSAMkoOsrQrTZ8EtTMssBLfTtzP0dfjG', 'http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-pgFtUNLu1foMSAMkoOsrQrTZ8EtTMssBLfTtzP0dfjG.png', '', '', NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:52:04', '1', '2023-01-15 13:20:22', b'1', 1);
INSERT INTO `mp_menu` VALUES (141, 1, 'wx5b23ba7a5589ecbb', '语音', 'v3', '138', 'click', NULL, NULL, NULL, NULL, 'voice', '', 'a6kOoewXIbX57gB0kCb_G0h41eeCLWXi-DiMGrPG1iQwjuxGoAoDZCqt6J7IrUrjYwTfa9dGyTJ7qbQ-8TlNrA', 'http://test.yudao.iocoder.cn/a6kOoewXIbX57gB0kCb_G0h41eeCLWXi-DiMGrPG1iQwjuxGoAoDZCqt6J7IrUrjYwTfa9dGyTJ7qbQ-8TlNrA.mp3', '', '', NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:52:04', '1', '2023-01-15 13:20:22', b'1', 1);
INSERT INTO `mp_menu` VALUES (142, 1, 'wx5b23ba7a5589ecbb', '视频', 'o', '138', 'click', NULL, NULL, NULL, NULL, 'video', '', 'r6ryvl6LrxBU0miaST4Y-v2-X9sD87sdZ8qoWWgu9QgP2NEjlTvDJ47KfF2xhyiU', 'http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-v2-X9sD87sdZ8qoWWgu9QgP2NEjlTvDJ47KfF2xhyiU.mp4', '我是视频', '我真的是视频', NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:52:04', '1', '2023-01-15 13:20:22', b'1', 1);
INSERT INTO `mp_menu` VALUES (143, 1, 'wx5b23ba7a5589ecbb', '图文', 'wx', '138', 'click', NULL, NULL, NULL, NULL, 'news', '', NULL, NULL, '', '', NULL, NULL, '[{\"title\":\"我是标题\",\"description\":null,\"picUrl\":\"http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-pIcmK-zAAId-9TGgy-DrSLhjVuWbuT3ZBjk9K1yQ0Dn.png\",\"url\":\"http://mp.weixin.qq.com/s?__biz=MzA3NjM4MzQzOQ==&mid=2247483662&idx=1&sn=dadf5d7e9aa594b58666fb2013fdf215&chksm=9f6354aea814ddb8fde13b17a34acbe86987b5c3403c6bd47e1e94977f6988b62653f6ab55e6#rd\"},{\"title\":\"我是标题 2\",\"description\":null,\"picUrl\":\"http://test.yudao.iocoder.cn/r6ryvl6LrxBU0miaST4Y-pIcmK-zAAId-9TGgy-DrSLhjVuWbuT3ZBjk9K1yQ0Dn.png\",\"url\":\"http://mp.weixin.qq.com/s?__biz=MzA3NjM4MzQzOQ==&mid=2247483662&idx=2&sn=c8041e2fc639c07d73bbbb6f80cf1784&chksm=9f6354aea814ddb8f48d7b330252c0374878014feb45a8fd4c22aaa0483c062f20ba15463368#rd\"}]', NULL, NULL, '1', '2023-01-15 19:52:04', '1', '2023-01-15 13:20:22', b'1', 1);
INSERT INTO `mp_menu` VALUES (144, 1, 'wx5b23ba7a5589ecbb', '测试', NULL, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:52:04', '1', '2023-01-15 13:20:22', b'1', 1);
INSERT INTO `mp_menu` VALUES (145, 1, 'wx5b23ba7a5589ecbb', '跳转网页', NULL, '144', 'view', 'https://www.iocoder.cn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:52:04', '1', '2023-01-15 13:20:22', b'1', 1);
INSERT INTO `mp_menu` VALUES (146, 1, 'wx5b23ba7a5589ecbb', '扫码回复', 'test_02', '144', 'scancode_waitmsg', NULL, NULL, NULL, NULL, 'text', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:52:04', '1', '2023-01-15 13:20:22', b'1', 1);
INSERT INTO `mp_menu` VALUES (147, 1, 'wx5b23ba7a5589ecbb', '扫码直接回结果', '2344455', '144', 'scancode_push', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:52:04', '1', '2023-01-15 13:20:22', b'1', 1);
INSERT INTO `mp_menu` VALUES (148, 1, 'wx5b23ba7a5589ecbb', '系统拍照', '0x0', '144', 'pic_sysphoto', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:52:04', '1', '2023-01-15 13:20:22', b'1', 1);
INSERT INTO `mp_menu` VALUES (149, 1, 'wx5b23ba7a5589ecbb', '拍照或相册', '0x3', '144', 'pic_photo_or_album', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:52:04', '1', '2023-01-15 13:20:22', b'1', 1);
INSERT INTO `mp_menu` VALUES (150, 1, 'wx5b23ba7a5589ecbb', '测试2', NULL, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:52:04', '1', '2023-01-15 13:20:22', b'1', 1);
INSERT INTO `mp_menu` VALUES (151, 1, 'wx5b23ba7a5589ecbb', '微信相册', 'ppp2222', '150', 'pic_weixin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:52:04', '1', '2023-01-15 13:20:22', b'1', 1);
INSERT INTO `mp_menu` VALUES (152, 1, 'wx5b23ba7a5589ecbb', '选择地理位置', 'lll2', '150', 'location_select', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-01-15 19:52:04', '1', '2023-01-15 13:20:22', b'1', 1);

-- ----------------------------
-- Table structure for mp_message
-- ----------------------------
DROP TABLE IF EXISTS `mp_message`;
CREATE TABLE `mp_message`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `msg_id` bigint(20) NULL DEFAULT NULL COMMENT '微信公众号的消息编号',
  `account_id` bigint(20) NOT NULL COMMENT '公众号账号的编号',
  `app_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公众号 appId',
  `user_id` bigint(20) NOT NULL COMMENT '公众号粉丝的编号',
  `openid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公众号粉丝标志',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息类型',
  `send_from` tinyint(4) NOT NULL COMMENT '消息来源',
  `content` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息内容',
  `media_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '媒体文件 id',
  `media_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '媒体文件 URL',
  `recognition` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '语音识别后文本',
  `format` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '语音格式',
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `description` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `thumb_media_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图的媒体 id',
  `thumb_media_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图的媒体 URL',
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '点击图文消息跳转链接',
  `location_x` double NULL DEFAULT NULL COMMENT '地理位置维度',
  `location_y` double NULL DEFAULT NULL COMMENT '地理位置经度',
  `scale` double NULL DEFAULT NULL COMMENT '地图缩放大小',
  `label` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `articles` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图文消息数组',
  `music_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '音乐链接',
  `hq_music_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '高质量音乐链接',
  `event` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件类型',
  `event_key` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件 Key',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 407 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公众号消息表 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mp_message
-- ----------------------------

-- ----------------------------
-- Table structure for mp_tag
-- ----------------------------
DROP TABLE IF EXISTS `mp_tag`;
CREATE TABLE `mp_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tag_id` bigint(20) NULL DEFAULT NULL COMMENT '公众号标签 id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签名称',
  `count` int(11) NULL DEFAULT 0 COMMENT '粉丝数量',
  `account_id` bigint(20) NOT NULL COMMENT '公众号账号的编号',
  `app_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公众号 appId',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公众号标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mp_tag
-- ----------------------------
INSERT INTO `mp_tag` VALUES (3, 100, '测试标签啦', 0, 1, 'wx5b23ba7a5589ecbb', '1', '2023-01-01 20:33:28', '1', '2023-01-08 03:23:53', b'1', 1);
INSERT INTO `mp_tag` VALUES (4, 101, '测试', 0, 1, 'wx5b23ba7a5589ecbb', '1', '2023-01-01 20:33:28', '1', '2023-01-08 03:21:00', b'1', 1);
INSERT INTO `mp_tag` VALUES (7, 102, '搞起来', 0, 1, 'wx5b23ba7a5589ecbb', '1', '2023-01-01 20:33:28', '1', '2023-01-08 04:03:00', b'1', 1);

-- ----------------------------
-- Table structure for mp_user
-- ----------------------------
DROP TABLE IF EXISTS `mp_user`;
CREATE TABLE `mp_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `openid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户标识',
  `subscribe_status` tinyint(4) NOT NULL COMMENT '关注状态',
  `subscribe_time` datetime(0) NOT NULL COMMENT '关注时间',
  `nickname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '昵称',
  `head_image_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像地址',
  `unsubscribe_time` datetime(0) NULL DEFAULT NULL COMMENT '取消关注时间',
  `language` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '语言',
  `country` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '国家',
  `province` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '城市',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `tag_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标签编号数组',
  `account_id` bigint(20) NOT NULL COMMENT '微信公众号ID',
  `app_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '微信公众号 appid',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '公众号粉丝表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mp_user
-- ----------------------------

-- ----------------------------
-- Table structure for pay_app
-- ----------------------------
DROP TABLE IF EXISTS `pay_app`;
CREATE TABLE `pay_app`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order_notify_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `refund_notify_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付应用' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay_app
-- ----------------------------

-- ----------------------------
-- Table structure for pay_channel
-- ----------------------------
DROP TABLE IF EXISTS `pay_channel`;
CREATE TABLE `pay_channel`  (
  `id` bigint(20) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fee_rate` double NOT NULL DEFAULT 0,
  `app_id` bigint(20) NOT NULL,
  `config` varchar(10240) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付渠道' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay_channel
-- ----------------------------

-- ----------------------------
-- Table structure for pay_demo_order
-- ----------------------------
DROP TABLE IF EXISTS `pay_demo_order`;
CREATE TABLE `pay_demo_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT '用户编号',
  `spu_id` bigint(20) NOT NULL COMMENT '商品编号',
  `spu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '商品名字',
  `price` int(11) NOT NULL COMMENT '价格，单位：分',
  `payed` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否已支付：[0:未支付 1:已经支付过]',
  `pay_order_id` bigint(20) NULL DEFAULT NULL COMMENT '支付订单编号',
  `pay_channel_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '支付成功的支付渠道',
  `pay_time` datetime(0) NULL DEFAULT NULL COMMENT '订单支付时间',
  `pay_refund_id` bigint(20) NULL DEFAULT NULL COMMENT '退款订单编号',
  `refund_price` int(11) NOT NULL DEFAULT 0 COMMENT '退款金额，单位：分',
  `refund_time` datetime(0) NULL DEFAULT NULL COMMENT '退款时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '示例订单\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay_demo_order
-- ----------------------------

-- ----------------------------
-- Table structure for pay_demo_transfer
-- ----------------------------
DROP TABLE IF EXISTS `pay_demo_transfer`;
CREATE TABLE `pay_demo_transfer`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `app_id` bigint(20) NOT NULL COMMENT '应用编号',
  `type` int(11) NOT NULL COMMENT '转账类型',
  `price` int(11) NOT NULL COMMENT '转账金额，单位：分',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收款人姓名',
  `alipay_logon_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝登录号',
  `openid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信 openId',
  `transfer_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '转账状态',
  `pay_transfer_id` bigint(20) NULL DEFAULT NULL COMMENT '转账订单编号',
  `pay_channel_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '转账支付成功渠道',
  `transfer_time` datetime(0) NULL DEFAULT NULL COMMENT '转账支付时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '示例业务转账订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay_demo_transfer
-- ----------------------------

-- ----------------------------
-- Table structure for pay_merchant
-- ----------------------------
DROP TABLE IF EXISTS `pay_merchant`;
CREATE TABLE `pay_merchant`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商户编号',
  `no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商户号',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商户全称',
  `short_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商户简称',
  `status` tinyint(4) NOT NULL COMMENT '开启状态',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '支付商户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay_merchant
-- ----------------------------

-- ----------------------------
-- Table structure for pay_notify_log
-- ----------------------------
DROP TABLE IF EXISTS `pay_notify_log`;
CREATE TABLE `pay_notify_log`  (
  `id` bigint(20) NOT NULL,
  `task_id` bigint(20) NOT NULL,
  `notify_times` int(11) NOT NULL,
  `response` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付通知日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay_notify_log
-- ----------------------------

-- ----------------------------
-- Table structure for pay_notify_task
-- ----------------------------
DROP TABLE IF EXISTS `pay_notify_task`;
CREATE TABLE `pay_notify_task`  (
  `id` bigint(20) NOT NULL,
  `app_id` bigint(20) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `data_id` bigint(20) NOT NULL,
  `merchant_order_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `next_notify_time` datetime(0) NULL DEFAULT NULL,
  `last_execute_time` datetime(0) NULL DEFAULT NULL,
  `notify_times` int(11) NOT NULL,
  `max_notify_times` int(11) NOT NULL,
  `notify_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付通知任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay_notify_task
-- ----------------------------

-- ----------------------------
-- Table structure for pay_order
-- ----------------------------
DROP TABLE IF EXISTS `pay_order`;
CREATE TABLE `pay_order`  (
  `id` bigint(20) NOT NULL,
  `app_id` bigint(20) NOT NULL,
  `channel_id` bigint(20) NULL DEFAULT NULL,
  `channel_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `merchant_order_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `subject` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `body` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `notify_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` bigint(20) NOT NULL,
  `channel_fee_rate` double NULL DEFAULT 0,
  `channel_fee_price` bigint(20) NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL,
  `user_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `expire_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `success_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `notify_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `extension_id` bigint(20) NULL DEFAULT NULL,
  `no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `refund_price` bigint(20) NOT NULL,
  `channel_user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `channel_order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay_order
-- ----------------------------

-- ----------------------------
-- Table structure for pay_order_extension
-- ----------------------------
DROP TABLE IF EXISTS `pay_order_extension`;
CREATE TABLE `pay_order_extension`  (
  `id` bigint(20) NOT NULL,
  `no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `channel_id` bigint(20) NOT NULL,
  `channel_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `channel_extras` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `channel_error_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `channel_error_msg` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `channel_notify_data` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付订单拓展' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay_order_extension
-- ----------------------------

-- ----------------------------
-- Table structure for pay_refund
-- ----------------------------
DROP TABLE IF EXISTS `pay_refund`;
CREATE TABLE `pay_refund`  (
  `id` bigint(20) NOT NULL,
  `no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `app_id` bigint(20) NOT NULL,
  `channel_id` bigint(20) NOT NULL,
  `channel_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `merchant_order_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `merchant_refund_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `notify_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `pay_price` bigint(20) NOT NULL,
  `refund_price` bigint(20) NOT NULL,
  `reason` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `channel_order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `channel_refund_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `success_time` datetime(0) NULL DEFAULT NULL,
  `channel_error_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `channel_error_msg` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `channel_notify_data` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '退款订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay_refund
-- ----------------------------

-- ----------------------------
-- Table structure for pay_transfer
-- ----------------------------
DROP TABLE IF EXISTS `pay_transfer`;
CREATE TABLE `pay_transfer`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '转账单号',
  `app_id` bigint(20) NOT NULL COMMENT '应用编号',
  `channel_id` bigint(20) NOT NULL COMMENT '转账渠道编号',
  `channel_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '转账渠道编码',
  `merchant_transfer_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户转账单编号',
  `type` int(11) NOT NULL COMMENT '类型',
  `status` tinyint(4) NOT NULL COMMENT '转账状态',
  `success_time` datetime(0) NULL DEFAULT NULL COMMENT '转账成功时间',
  `price` int(11) NOT NULL COMMENT '转账金额，单位：分',
  `subject` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '转账标题',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收款人姓名',
  `alipay_logon_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝登录号',
  `openid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信 openId',
  `notify_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '异步通知商户地址',
  `user_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户 IP',
  `channel_extras` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道的额外参数',
  `channel_transfer_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道转账单号',
  `channel_error_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调用渠道的错误码',
  `channel_error_msg` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调用渠道的错误提示',
  `channel_notify_data` varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道的同步/异步通知的内容',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '转账单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay_transfer
-- ----------------------------

-- ----------------------------
-- Table structure for pay_wallet_recharge
-- ----------------------------
DROP TABLE IF EXISTS `pay_wallet_recharge`;
CREATE TABLE `pay_wallet_recharge`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `wallet_id` bigint(20) NOT NULL COMMENT '会员钱包 id',
  `total_price` int(11) NOT NULL COMMENT '用户实际到账余额，例如充 100 送 20，则该值是 120',
  `pay_price` int(11) NOT NULL COMMENT '实际支付金额',
  `bonus_price` int(11) NOT NULL COMMENT '钱包赠送金额',
  `package_id` bigint(20) NULL DEFAULT NULL COMMENT '充值套餐编号',
  `pay_status` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否已支付：[0:未支付 1:已经支付过]',
  `pay_order_id` bigint(20) NULL DEFAULT NULL COMMENT '支付订单编号',
  `pay_channel_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '支付成功的支付渠道',
  `pay_time` datetime(0) NULL DEFAULT NULL COMMENT '订单支付时间',
  `pay_refund_id` bigint(20) NULL DEFAULT NULL COMMENT '支付退款单编号',
  `refund_total_price` int(11) NOT NULL DEFAULT 0 COMMENT '退款金额，包含赠送金额',
  `refund_pay_price` int(11) NOT NULL DEFAULT 0 COMMENT '退款支付金额',
  `refund_bonus_price` int(11) NOT NULL DEFAULT 0 COMMENT '退款钱包赠送金额',
  `refund_time` datetime(0) NULL DEFAULT NULL COMMENT '退款时间',
  `refund_status` int(11) NOT NULL DEFAULT 0 COMMENT '退款状态',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员钱包充值' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay_wallet_recharge
-- ----------------------------

-- ----------------------------
-- Table structure for pay_wallet_recharge_package
-- ----------------------------
DROP TABLE IF EXISTS `pay_wallet_recharge_package`;
CREATE TABLE `pay_wallet_recharge_package`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '套餐名',
  `pay_price` int(11) NOT NULL COMMENT '支付金额',
  `bonus_price` int(11) NOT NULL COMMENT '赠送金额',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '充值套餐表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay_wallet_recharge_package
-- ----------------------------

-- ----------------------------
-- Table structure for product_brand
-- ----------------------------
DROP TABLE IF EXISTS `product_brand`;
CREATE TABLE `product_brand`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '品牌编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '品牌名称',
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '品牌图片',
  `sort` int(11) NULL DEFAULT 0 COMMENT '品牌排序',
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '品牌描述',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品品牌' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_brand
-- ----------------------------

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类编号',
  `parent_id` bigint(20) NOT NULL COMMENT '父分类编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '移动端分类图',
  `big_pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'PC 端分类图',
  `sort` int(11) NULL DEFAULT 0 COMMENT '分类排序',
  `status` tinyint(4) NOT NULL COMMENT '开启状态',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_category
-- ----------------------------

-- ----------------------------
-- Table structure for product_comment
-- ----------------------------
DROP TABLE IF EXISTS `product_comment`;
CREATE TABLE `product_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评论编号，主键自增',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '评价人的用户编号关联 MemberUserDO 的 id 编号',
  `user_nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '评价人名称',
  `user_avatar` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '评价人头像',
  `anonymous` bit(1) NULL DEFAULT NULL COMMENT '是否匿名',
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '交易订单编号关联 TradeOrderDO 的 id 编号',
  `order_item_id` bigint(20) NULL DEFAULT NULL COMMENT '交易订单项编号关联 TradeOrderItemDO 的 id 编号',
  `spu_id` bigint(20) NULL DEFAULT NULL COMMENT '商品 SPU 编号关联 ProductSpuDO 的 id',
  `spu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '商品 SPU 名称',
  `sku_id` bigint(20) NULL DEFAULT NULL COMMENT '商品 SKU 编号关联 ProductSkuDO 的 id 编号',
  `visible` bit(1) NULL DEFAULT NULL COMMENT '是否可见true:显示false:隐藏',
  `scores` tinyint(4) NULL DEFAULT NULL COMMENT '评分星级1-5分',
  `description_scores` tinyint(4) NULL DEFAULT NULL COMMENT '描述星级1-5 星',
  `benefit_scores` tinyint(4) NULL DEFAULT NULL COMMENT '服务星级1-5 星',
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '评论内容',
  `pic_urls` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '评论图片地址数组',
  `reply_status` bit(1) NULL DEFAULT NULL COMMENT '商家是否回复',
  `reply_user_id` bigint(20) NULL DEFAULT NULL COMMENT '回复管理员编号关联 AdminUserDO 的 id 编号',
  `reply_content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '商家回复内容',
  `reply_time` datetime(0) NULL DEFAULT NULL COMMENT '商家回复时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '商品评论' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_comment
-- ----------------------------

-- ----------------------------
-- Table structure for product_property
-- ----------------------------
DROP TABLE IF EXISTS `product_property`;
CREATE TABLE `product_property`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格名称',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态： 0 开启 ，1 禁用',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '规格名称' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_property
-- ----------------------------

-- ----------------------------
-- Table structure for product_property_value
-- ----------------------------
DROP TABLE IF EXISTS `product_property_value`;
CREATE TABLE `product_property_value`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `property_id` bigint(20) NULL DEFAULT NULL COMMENT '规格键id',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格值名字',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态： 1 开启 ，2 禁用',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '规格值' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_property_value
-- ----------------------------

-- ----------------------------
-- Table structure for product_sku
-- ----------------------------
DROP TABLE IF EXISTS `product_sku`;
CREATE TABLE `product_sku`  (
  `id` bigint(20) NOT NULL,
  `spu_id` bigint(20) NOT NULL COMMENT 'spu编号',
  `properties` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属性数组，JSON 格式',
  `price` int(11) NOT NULL DEFAULT -1 COMMENT '商品价格，单位：分',
  `market_price` int(11) NULL DEFAULT NULL COMMENT '市场价，单位：分',
  `cost_price` int(11) NOT NULL DEFAULT -1 COMMENT '成本价，单位： 分',
  `bar_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'SKU 的条形码',
  `pic_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片地址',
  `stock` int(11) NULL DEFAULT NULL COMMENT '库存',
  `weight` double NULL DEFAULT NULL COMMENT '商品重量，单位：kg 千克',
  `volume` double NULL DEFAULT NULL COMMENT '商品体积，单位：m^3 平米',
  `sub_commission_first_price` int(11) NULL DEFAULT NULL COMMENT '一级分销的佣金，单位：分',
  `sub_commission_second_price` int(11) NULL DEFAULT NULL COMMENT '二级分销的佣金，单位：分',
  `sales_count` int(11) NULL DEFAULT NULL COMMENT '商品销量',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品sku' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_sku
-- ----------------------------

-- ----------------------------
-- Table structure for product_spu
-- ----------------------------
DROP TABLE IF EXISTS `product_spu`;
CREATE TABLE `product_spu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品 SPU 编号，自增',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品名称',
  `keyword` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '关键字',
  `introduction` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品简介',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品详情',
  `bar_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '条形码',
  `category_id` bigint(20) NOT NULL COMMENT '商品分类编号',
  `brand_id` int(11) NULL DEFAULT NULL COMMENT '商品品牌编号',
  `pic_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品封面图',
  `slider_pic_urls` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '商品轮播图地址\n 数组，以逗号分隔\n 最多上传15张',
  `video_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品视频',
  `unit` tinyint(4) NOT NULL COMMENT '单位',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序字段',
  `status` tinyint(4) NOT NULL COMMENT '商品状态: 0 上架（开启） 1 下架（禁用）-1 回收',
  `spec_type` bit(1) NOT NULL COMMENT '规格类型：0 单规格 1 多规格',
  `price` int(11) NOT NULL DEFAULT -1 COMMENT '商品价格，单位使用：分',
  `market_price` int(11) NOT NULL COMMENT '市场价，单位使用：分',
  `cost_price` int(11) NOT NULL DEFAULT -1 COMMENT '成本价，单位： 分',
  `stock` int(11) NOT NULL DEFAULT 0 COMMENT '库存',
  `delivery_template_id` bigint(20) NOT NULL COMMENT '物流配置模板编号',
  `recommend_hot` bit(1) NOT NULL COMMENT '是否热卖推荐: 0 默认 1 热卖',
  `recommend_benefit` bit(1) NOT NULL COMMENT '是否优惠推荐: 0 默认 1 优选',
  `recommend_best` bit(1) NOT NULL COMMENT '是否精品推荐: 0 默认 1 精品',
  `recommend_new` bit(1) NOT NULL COMMENT '是否新品推荐: 0 默认 1 新品',
  `recommend_good` bit(1) NOT NULL COMMENT '是否优品推荐',
  `give_integral` int(11) NOT NULL COMMENT '赠送积分',
  `give_coupon_template_ids` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '赠送的优惠劵编号的数组',
  `sub_commission_type` bit(1) NOT NULL COMMENT '分销类型',
  `activity_orders` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '活动显示排序0=默认, 1=秒杀，2=砍价，3=拼团',
  `sales_count` int(11) NULL DEFAULT 0 COMMENT '商品销量',
  `virtual_sales_count` int(11) NULL DEFAULT 0 COMMENT '虚拟销量',
  `browse_count` int(11) NULL DEFAULT 0 COMMENT '商品点击量',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品spu' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_spu
-- ----------------------------

-- ----------------------------
-- Table structure for promotion_combination_activity
-- ----------------------------
DROP TABLE IF EXISTS `promotion_combination_activity`;
CREATE TABLE `promotion_combination_activity`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `spu_id` bigint(20) NULL DEFAULT NULL,
  `total_limit_count` int(11) NOT NULL,
  `single_limit_count` int(11) NOT NULL,
  `start_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `end_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_size` int(11) NOT NULL,
  `total_num` int(11) NOT NULL,
  `success_num` int(11) NOT NULL,
  `order_user_count` int(11) NOT NULL,
  `virtual_group` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `limit_duration` int(11) NOT NULL,
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updater` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  `tenant_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '拼团活动' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of promotion_combination_activity
-- ----------------------------

-- ----------------------------
-- Table structure for promotion_coupon
-- ----------------------------
DROP TABLE IF EXISTS `promotion_coupon`;
CREATE TABLE `promotion_coupon`  (
  `id` bigint(20) NOT NULL,
  `template_id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `take_type` int(11) NOT NULL,
  `useprice` int(11) NOT NULL,
  `valid_start_time` datetime(0) NOT NULL,
  `valid_end_time` datetime(0) NOT NULL,
  `product_scope` int(11) NOT NULL,
  `product_spu_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `discount_type` int(11) NOT NULL,
  `discount_percent` int(11) NULL DEFAULT NULL,
  `discount_price` int(11) NULL DEFAULT NULL,
  `discount_limit_price` int(11) NULL DEFAULT NULL,
  `use_order_id` bigint(20) NULL DEFAULT NULL,
  `use_time` datetime(0) NULL DEFAULT NULL,
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updater` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '优惠劵' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of promotion_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for promotion_coupon_template
-- ----------------------------
DROP TABLE IF EXISTS `promotion_coupon_template`;
CREATE TABLE `promotion_coupon_template`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` int(11) NOT NULL,
  `total_count` int(11) NOT NULL,
  `take_limit_count` int(11) NOT NULL,
  `take_type` int(11) NOT NULL,
  `use_price` int(11) NOT NULL,
  `product_scope` int(11) NOT NULL,
  `product_spu_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `validity_type` int(11) NOT NULL,
  `valid_start_time` datetime(0) NULL DEFAULT NULL,
  `valid_end_time` datetime(0) NULL DEFAULT NULL,
  `fixed_start_term` int(11) NULL DEFAULT NULL,
  `fixed_end_term` int(11) NULL DEFAULT NULL,
  `discount_type` int(11) NOT NULL,
  `discount_percent` int(11) NULL DEFAULT NULL,
  `discount_price` int(11) NULL DEFAULT NULL,
  `discount_limit_price` int(11) NULL DEFAULT NULL,
  `take_count` int(11) NOT NULL DEFAULT 0,
  `use_count` int(11) NOT NULL DEFAULT 0,
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updater` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  `tenant_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '优惠劵模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of promotion_coupon_template
-- ----------------------------

-- ----------------------------
-- Table structure for promotion_discount_activity
-- ----------------------------
DROP TABLE IF EXISTS `promotion_discount_activity`;
CREATE TABLE `promotion_discount_activity`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` int(11) NOT NULL,
  `start_time` datetime(0) NOT NULL,
  `end_time` datetime(0) NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updater` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  `tenant_id` int(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '限时折扣活动' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of promotion_discount_activity
-- ----------------------------

-- ----------------------------
-- Table structure for promotion_reward_activity
-- ----------------------------
DROP TABLE IF EXISTS `promotion_reward_activity`;
CREATE TABLE `promotion_reward_activity`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` int(11) NOT NULL,
  `start_time` datetime(0) NOT NULL,
  `end_time` datetime(0) NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `condition_type` int(11) NOT NULL,
  `product_scope` int(11) NOT NULL,
  `product_spu_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rules` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updater` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  `tenant_id` int(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '满减送活动' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of promotion_reward_activity
-- ----------------------------

-- ----------------------------
-- Table structure for promotion_seckill_activity
-- ----------------------------
DROP TABLE IF EXISTS `promotion_seckill_activity`;
CREATE TABLE `promotion_seckill_activity`  (
  `id` bigint(20) NOT NULL,
  `spu_id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` int(11) NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `start_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `end_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `config_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `order_count` int(11) NOT NULL,
  `user_count` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `total_limit_count` int(11) NULL DEFAULT NULL,
  `single_limit_count` int(11) NULL DEFAULT NULL,
  `stock` int(11) NULL DEFAULT NULL,
  `total_stock` int(11) NULL DEFAULT NULL,
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updater` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  `tenant_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '秒杀活动' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of promotion_seckill_activity
-- ----------------------------

-- ----------------------------
-- Table structure for promotion_seckill_config
-- ----------------------------
DROP TABLE IF EXISTS `promotion_seckill_config`;
CREATE TABLE `promotion_seckill_config`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `start_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `end_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` int(11) NOT NULL,
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updater` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  `tenant_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '秒杀时段配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of promotion_seckill_config
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CALENDAR_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('schedulerName', 'accessLogCleanJob', 'DEFAULT', '0 0 0 * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('schedulerName', 'brokerageRecordUnfreezeJob', 'DEFAULT', '0 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('schedulerName', 'demoJob', 'DEFAULT', '0 0 0 * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('schedulerName', 'errorLogCleanJob', 'DEFAULT', '0 0 0 * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('schedulerName', 'jobLogCleanJob', 'DEFAULT', '0 0 0 * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('schedulerName', 'payNotifyJob', 'DEFAULT', '* * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('schedulerName', 'payOrderExpireJob', 'DEFAULT', '0 0/1 * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('schedulerName', 'payOrderSyncJob', 'DEFAULT', '0 0/1 * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('schedulerName', 'payRefundSyncJob', 'DEFAULT', '0 0/1 * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('schedulerName', 'tradeOrderAutoCancelJob', 'DEFAULT', '0 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('schedulerName', 'tradeOrderAutoCommentJob', 'DEFAULT', '0 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('schedulerName', 'tradeOrderAutoReceiveJob', 'DEFAULT', '0 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `INSTANCE_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FIRED_TIME` bigint(20) NOT NULL,
  `SCHED_TIME` bigint(20) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('schedulerName', 'accessLogCleanJob', 'DEFAULT', NULL, 'cn.iocoder.yudao.framework.quartz.core.handler.JobHandlerInvoker', '0', '1', '1', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000027400064A4F425F49447372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000197400104A4F425F48414E444C45525F4E414D457400116163636573734C6F67436C65616E4A6F627800);
INSERT INTO `qrtz_job_details` VALUES ('schedulerName', 'brokerageRecordUnfreezeJob', 'DEFAULT', NULL, 'cn.iocoder.yudao.framework.quartz.core.handler.JobHandlerInvoker', '0', '1', '1', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000027400064A4F425F49447372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000187400104A4F425F48414E444C45525F4E414D4574001A62726F6B65726167655265636F7264556E667265657A654A6F627800);
INSERT INTO `qrtz_job_details` VALUES ('schedulerName', 'demoJob', 'DEFAULT', NULL, 'cn.iocoder.yudao.framework.quartz.core.handler.JobHandlerInvoker', '0', '1', '1', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000027400064A4F425F49447372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000147400104A4F425F48414E444C45525F4E414D4574000764656D6F4A6F627800);
INSERT INTO `qrtz_job_details` VALUES ('schedulerName', 'errorLogCleanJob', 'DEFAULT', NULL, 'cn.iocoder.yudao.framework.quartz.core.handler.JobHandlerInvoker', '0', '1', '1', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000027400064A4F425F49447372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000001A7400104A4F425F48414E444C45525F4E414D457400106572726F724C6F67436C65616E4A6F627800);
INSERT INTO `qrtz_job_details` VALUES ('schedulerName', 'jobLogCleanJob', 'DEFAULT', NULL, 'cn.iocoder.yudao.framework.quartz.core.handler.JobHandlerInvoker', '0', '1', '1', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000027400064A4F425F49447372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000001B7400104A4F425F48414E444C45525F4E414D4574000E6A6F624C6F67436C65616E4A6F627800);
INSERT INTO `qrtz_job_details` VALUES ('schedulerName', 'payNotifyJob', 'DEFAULT', NULL, 'cn.iocoder.yudao.framework.quartz.core.handler.JobHandlerInvoker', '0', '1', '1', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000027400064A4F425F49447372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000057400104A4F425F48414E444C45525F4E414D4574000C7061794E6F746966794A6F627800);
INSERT INTO `qrtz_job_details` VALUES ('schedulerName', 'payOrderExpireJob', 'DEFAULT', NULL, 'cn.iocoder.yudao.framework.quartz.core.handler.JobHandlerInvoker', '0', '1', '1', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000027400064A4F425F49447372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000127400104A4F425F48414E444C45525F4E414D457400117061794F726465724578706972654A6F627800);
INSERT INTO `qrtz_job_details` VALUES ('schedulerName', 'payOrderSyncJob', 'DEFAULT', NULL, 'cn.iocoder.yudao.framework.quartz.core.handler.JobHandlerInvoker', '0', '1', '1', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000027400064A4F425F49447372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000117400104A4F425F48414E444C45525F4E414D4574000F7061794F7264657253796E634A6F627800);
INSERT INTO `qrtz_job_details` VALUES ('schedulerName', 'payRefundSyncJob', 'DEFAULT', NULL, 'cn.iocoder.yudao.framework.quartz.core.handler.JobHandlerInvoker', '0', '1', '1', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000027400064A4F425F49447372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000137400104A4F425F48414E444C45525F4E414D45740010706179526566756E6453796E634A6F627800);
INSERT INTO `qrtz_job_details` VALUES ('schedulerName', 'tradeOrderAutoCancelJob', 'DEFAULT', NULL, 'cn.iocoder.yudao.framework.quartz.core.handler.JobHandlerInvoker', '0', '1', '1', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000027400064A4F425F49447372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000157400104A4F425F48414E444C45525F4E414D4574001774726164654F726465724175746F43616E63656C4A6F627800);
INSERT INTO `qrtz_job_details` VALUES ('schedulerName', 'tradeOrderAutoCommentJob', 'DEFAULT', NULL, 'cn.iocoder.yudao.framework.quartz.core.handler.JobHandlerInvoker', '0', '1', '1', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000027400064A4F425F49447372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000177400104A4F425F48414E444C45525F4E414D4574001874726164654F726465724175746F436F6D6D656E744A6F627800);
INSERT INTO `qrtz_job_details` VALUES ('schedulerName', 'tradeOrderAutoReceiveJob', 'DEFAULT', NULL, 'cn.iocoder.yudao.framework.quartz.core.handler.JobHandlerInvoker', '0', '1', '1', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000027400064A4F425F49447372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000167400104A4F425F48414E444C45525F4E414D4574001874726164654F726465724175746F526563656976654A6F627800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('schedulerName', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('schedulerName', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `INSTANCE_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(20) NOT NULL,
  `CHECKIN_INTERVAL` bigint(20) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('schedulerName', 'Yunai1696301772221', 1696327598846, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REPEAT_COUNT` bigint(20) NOT NULL,
  `REPEAT_INTERVAL` bigint(20) NOT NULL,
  `TIMES_TRIGGERED` bigint(20) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `INT_PROP_1` int(11) NULL DEFAULT NULL,
  `INT_PROP_2` int(11) NULL DEFAULT NULL,
  `LONG_PROP_1` bigint(20) NULL DEFAULT NULL,
  `LONG_PROP_2` bigint(20) NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(20) NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(20) NULL DEFAULT NULL,
  `PRIORITY` int(11) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `START_TIME` bigint(20) NOT NULL,
  `END_TIME` bigint(20) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint(6) NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_J`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('schedulerName', 'accessLogCleanJob', 'DEFAULT', 'accessLogCleanJob', 'DEFAULT', NULL, 1696348800000, -1, 5, 'PAUSED', 'CRON', 1696301981000, 0, NULL, 0, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000037400114A4F425F48414E444C45525F504152414D7400007400124A4F425F52455452595F494E54455256414C737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000074000F4A4F425F52455452595F434F554E547371007E000A000000037800);
INSERT INTO `qrtz_triggers` VALUES ('schedulerName', 'brokerageRecordUnfreezeJob', 'DEFAULT', 'brokerageRecordUnfreezeJob', 'DEFAULT', NULL, 1695909720000, -1, 5, 'PAUSED', 'CRON', 1695909706000, 0, NULL, 0, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000037400114A4F425F48414E444C45525F504152414D7400007400124A4F425F52455452595F494E54455256414C737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000074000F4A4F425F52455452595F434F554E547371007E000A000000037800);
INSERT INTO `qrtz_triggers` VALUES ('schedulerName', 'demoJob', 'DEFAULT', 'demoJob', 'DEFAULT', NULL, 1695744000000, 1695726588170, 5, 'PAUSED', 'CRON', 1694844083000, 0, NULL, 0, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000037400114A4F425F48414E444C45525F504152414D7400007400124A4F425F52455452595F494E54455256414C737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000A74000F4A4F425F52455452595F434F554E547371007E000A000000017800);
INSERT INTO `qrtz_triggers` VALUES ('schedulerName', 'errorLogCleanJob', 'DEFAULT', 'errorLogCleanJob', 'DEFAULT', NULL, 1696348800000, -1, 5, 'PAUSED', 'CRON', 1696302043000, 0, NULL, 0, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000037400114A4F425F48414E444C45525F504152414D7400007400124A4F425F52455452595F494E54455256414C737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000074000F4A4F425F52455452595F434F554E547371007E000A000000037800);
INSERT INTO `qrtz_triggers` VALUES ('schedulerName', 'jobLogCleanJob', 'DEFAULT', 'jobLogCleanJob', 'DEFAULT', NULL, 1696348800000, -1, 5, 'PAUSED', 'CRON', 1696302092000, 0, NULL, 0, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000037400114A4F425F48414E444C45525F504152414D7400007400124A4F425F52455452595F494E54455256414C737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000074000F4A4F425F52455452595F434F554E547371007E000A000000037800);
INSERT INTO `qrtz_triggers` VALUES ('schedulerName', 'payNotifyJob', 'DEFAULT', 'payNotifyJob', 'DEFAULT', NULL, 1688907102000, 1688907101000, 5, 'PAUSED', 'CRON', 1635294882000, 0, NULL, 0, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000037400114A4F425F48414E444C45525F504152414D707400124A4F425F52455452595F494E54455256414C737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000074000F4A4F425F52455452595F434F554E5471007E000B7800);
INSERT INTO `qrtz_triggers` VALUES ('schedulerName', 'payOrderExpireJob', 'DEFAULT', 'payOrderExpireJob', 'DEFAULT', NULL, 1690011600000, -1, 5, 'PAUSED', 'CRON', 1690011553000, 0, NULL, 0, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000037400114A4F425F48414E444C45525F504152414D707400124A4F425F52455452595F494E54455256414C737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000074000F4A4F425F52455452595F434F554E5471007E000B7800);
INSERT INTO `qrtz_triggers` VALUES ('schedulerName', 'payOrderSyncJob', 'DEFAULT', 'payOrderSyncJob', 'DEFAULT', NULL, 1690011600000, 1690011540000, 5, 'PAUSED', 'CRON', 1690007785000, 0, NULL, 0, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000037400114A4F425F48414E444C45525F504152414D707400124A4F425F52455452595F494E54455256414C737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000074000F4A4F425F52455452595F434F554E5471007E000B7800);
INSERT INTO `qrtz_triggers` VALUES ('schedulerName', 'payRefundSyncJob', 'DEFAULT', 'payRefundSyncJob', 'DEFAULT', NULL, 1690117560000, 1690117500000, 5, 'PAUSED', 'CRON', 1690117424000, 0, NULL, 0, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000037400114A4F425F48414E444C45525F504152414D707400124A4F425F52455452595F494E54455256414C737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000074000F4A4F425F52455452595F434F554E5471007E000B7800);
INSERT INTO `qrtz_triggers` VALUES ('schedulerName', 'tradeOrderAutoCancelJob', 'DEFAULT', 'tradeOrderAutoCancelJob', 'DEFAULT', NULL, 1695727440000, 1695727380000, 5, 'PAUSED', 'CRON', 1695656605000, 0, NULL, 0, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000037400114A4F425F48414E444C45525F504152414D7400007400124A4F425F52455452595F494E54455256414C737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000074000F4A4F425F52455452595F434F554E547371007E000A000000037800);
INSERT INTO `qrtz_triggers` VALUES ('schedulerName', 'tradeOrderAutoCommentJob', 'DEFAULT', 'tradeOrderAutoCommentJob', 'DEFAULT', NULL, 1695783840000, 1695783780000, 5, 'PAUSED', 'CRON', 1695742709000, 0, NULL, 0, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000037400114A4F425F48414E444C45525F504152414D7400007400124A4F425F52455452595F494E54455256414C737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000074000F4A4F425F52455452595F434F554E547371007E000A000000037800);
INSERT INTO `qrtz_triggers` VALUES ('schedulerName', 'tradeOrderAutoReceiveJob', 'DEFAULT', 'tradeOrderAutoReceiveJob', 'DEFAULT', NULL, 1695742740000, 1695742680000, 5, 'PAUSED', 'CRON', 1695727433000, 0, NULL, 0, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000037400114A4F425F48414E444C45525F504152414D7400007400124A4F425F52455452595F494E54455256414C737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000074000F4A4F425F52455452595F434F554E547371007E000A000000037800);

-- ----------------------------
-- Table structure for system_dept
-- ----------------------------
DROP TABLE IF EXISTS `system_dept`;
CREATE TABLE `system_dept`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '部门名称',
  `parent_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '父部门id',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '显示顺序',
  `leader_user_id` bigint(20) NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` tinyint(4) NOT NULL COMMENT '部门状态（0正常 1停用）',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_dept
-- ----------------------------
INSERT INTO `system_dept` VALUES (100, '芋道源码', 0, 0, 1, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '1', '2023-11-14 23:30:36', b'0', 1);
INSERT INTO `system_dept` VALUES (101, '深圳总公司', 100, 1, 104, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '1', '2022-05-16 20:25:23', b'0', 1);
INSERT INTO `system_dept` VALUES (102, '长沙分公司', 100, 2, NULL, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '', '2021-12-15 05:01:40', b'0', 1);
INSERT INTO `system_dept` VALUES (103, '研发部门', 101, 1, 104, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '103', '2022-01-14 01:04:14', b'0', 1);
INSERT INTO `system_dept` VALUES (104, '市场部门', 101, 2, NULL, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '', '2021-12-15 05:01:38', b'0', 1);
INSERT INTO `system_dept` VALUES (105, '测试部门', 101, 3, NULL, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '1', '2022-05-16 20:25:15', b'0', 1);
INSERT INTO `system_dept` VALUES (106, '财务部门', 101, 4, 103, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '103', '2022-01-15 21:32:22', b'0', 1);
INSERT INTO `system_dept` VALUES (107, '运维部门', 101, 5, NULL, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '', '2021-12-15 05:01:33', b'0', 1);
INSERT INTO `system_dept` VALUES (108, '市场部门', 102, 1, NULL, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '1', '2022-02-16 08:35:45', b'0', 1);
INSERT INTO `system_dept` VALUES (109, '财务部门', 102, 2, NULL, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '', '2021-12-15 05:01:29', b'0', 1);
INSERT INTO `system_dept` VALUES (110, '新部门', 0, 1, NULL, NULL, NULL, 0, '110', '2022-02-23 20:46:30', '110', '2022-02-23 20:46:30', b'0', 121);
INSERT INTO `system_dept` VALUES (111, '顶级部门', 0, 1, NULL, NULL, NULL, 0, '113', '2022-03-07 21:44:50', '113', '2022-03-07 21:44:50', b'0', 122);

-- ----------------------------
-- Table structure for system_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `system_dict_data`;
CREATE TABLE `system_dict_data`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '字典排序',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '字典标签',
  `value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '字典类型',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态（0正常 1停用）',
  `color_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '颜色类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'css 样式',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1455 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_dict_data
-- ----------------------------
INSERT INTO `system_dict_data` VALUES (1, 1, '男', '1', 'system_user_sex', 0, 'default', 'A', '性别男', 'admin', '2021-01-05 17:03:48', '1', '2022-03-29 00:14:39', b'0');
INSERT INTO `system_dict_data` VALUES (2, 2, '女', '2', 'system_user_sex', 0, 'success', '', '性别女', 'admin', '2021-01-05 17:03:48', '1', '2023-11-15 23:30:37', b'0');
INSERT INTO `system_dict_data` VALUES (8, 1, '正常', '1', 'infra_job_status', 0, 'success', '', '正常状态', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 19:33:38', b'0');
INSERT INTO `system_dict_data` VALUES (9, 2, '暂停', '2', 'infra_job_status', 0, 'danger', '', '停用状态', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 19:33:45', b'0');
INSERT INTO `system_dict_data` VALUES (12, 1, '系统内置', '1', 'infra_config_type', 0, 'danger', '', '参数类型 - 系统内置', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 19:06:02', b'0');
INSERT INTO `system_dict_data` VALUES (13, 2, '自定义', '2', 'infra_config_type', 0, 'primary', '', '参数类型 - 自定义', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 19:06:07', b'0');
INSERT INTO `system_dict_data` VALUES (14, 1, '通知', '1', 'system_notice_type', 0, 'success', '', '通知', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 13:05:57', b'0');
INSERT INTO `system_dict_data` VALUES (15, 2, '公告', '2', 'system_notice_type', 0, 'info', '', '公告', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 13:06:01', b'0');
INSERT INTO `system_dict_data` VALUES (16, 0, '其它', '0', 'system_operate_type', 0, 'default', '', '其它操作', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 09:32:46', b'0');
INSERT INTO `system_dict_data` VALUES (17, 1, '查询', '1', 'system_operate_type', 0, 'info', '', '查询操作', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 09:33:16', b'0');
INSERT INTO `system_dict_data` VALUES (18, 2, '新增', '2', 'system_operate_type', 0, 'primary', '', '新增操作', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 09:33:13', b'0');
INSERT INTO `system_dict_data` VALUES (19, 3, '修改', '3', 'system_operate_type', 0, 'warning', '', '修改操作', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 09:33:22', b'0');
INSERT INTO `system_dict_data` VALUES (20, 4, '删除', '4', 'system_operate_type', 0, 'danger', '', '删除操作', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 09:33:27', b'0');
INSERT INTO `system_dict_data` VALUES (22, 5, '导出', '5', 'system_operate_type', 0, 'default', '', '导出操作', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 09:33:32', b'0');
INSERT INTO `system_dict_data` VALUES (23, 6, '导入', '6', 'system_operate_type', 0, 'default', '', '导入操作', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 09:33:35', b'0');
INSERT INTO `system_dict_data` VALUES (27, 1, '开启', '0', 'common_status', 0, 'primary', '', '开启状态', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 08:00:39', b'0');
INSERT INTO `system_dict_data` VALUES (28, 2, '关闭', '1', 'common_status', 0, 'info', '', '关闭状态', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 08:00:44', b'0');
INSERT INTO `system_dict_data` VALUES (29, 1, '目录', '1', 'system_menu_type', 0, '', '', '目录', 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:43:45', b'0');
INSERT INTO `system_dict_data` VALUES (30, 2, '菜单', '2', 'system_menu_type', 0, '', '', '菜单', 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:43:41', b'0');
INSERT INTO `system_dict_data` VALUES (31, 3, '按钮', '3', 'system_menu_type', 0, '', '', '按钮', 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:43:39', b'0');
INSERT INTO `system_dict_data` VALUES (32, 1, '内置', '1', 'system_role_type', 0, 'danger', '', '内置角色', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 13:02:08', b'0');
INSERT INTO `system_dict_data` VALUES (33, 2, '自定义', '2', 'system_role_type', 0, 'primary', '', '自定义角色', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 13:02:12', b'0');
INSERT INTO `system_dict_data` VALUES (34, 1, '全部数据权限', '1', 'system_data_scope', 0, '', '', '全部数据权限', 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:47:17', b'0');
INSERT INTO `system_dict_data` VALUES (35, 2, '指定部门数据权限', '2', 'system_data_scope', 0, '', '', '指定部门数据权限', 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:47:18', b'0');
INSERT INTO `system_dict_data` VALUES (36, 3, '本部门数据权限', '3', 'system_data_scope', 0, '', '', '本部门数据权限', 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:47:16', b'0');
INSERT INTO `system_dict_data` VALUES (37, 4, '本部门及以下数据权限', '4', 'system_data_scope', 0, '', '', '本部门及以下数据权限', 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:47:21', b'0');
INSERT INTO `system_dict_data` VALUES (38, 5, '仅本人数据权限', '5', 'system_data_scope', 0, '', '', '仅本人数据权限', 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:47:23', b'0');
INSERT INTO `system_dict_data` VALUES (39, 0, '成功', '0', 'system_login_result', 0, 'success', '', '登陆结果 - 成功', '', '2021-01-18 06:17:36', '1', '2022-02-16 13:23:49', b'0');
INSERT INTO `system_dict_data` VALUES (40, 10, '账号或密码不正确', '10', 'system_login_result', 0, 'primary', '', '登陆结果 - 账号或密码不正确', '', '2021-01-18 06:17:54', '1', '2022-02-16 13:24:27', b'0');
INSERT INTO `system_dict_data` VALUES (41, 20, '用户被禁用', '20', 'system_login_result', 0, 'warning', '', '登陆结果 - 用户被禁用', '', '2021-01-18 06:17:54', '1', '2022-02-16 13:23:57', b'0');
INSERT INTO `system_dict_data` VALUES (42, 30, '验证码不存在', '30', 'system_login_result', 0, 'info', '', '登陆结果 - 验证码不存在', '', '2021-01-18 06:17:54', '1', '2022-02-16 13:24:07', b'0');
INSERT INTO `system_dict_data` VALUES (43, 31, '验证码不正确', '31', 'system_login_result', 0, 'info', '', '登陆结果 - 验证码不正确', '', '2021-01-18 06:17:54', '1', '2022-02-16 13:24:11', b'0');
INSERT INTO `system_dict_data` VALUES (44, 100, '未知异常', '100', 'system_login_result', 0, 'danger', '', '登陆结果 - 未知异常', '', '2021-01-18 06:17:54', '1', '2022-02-16 13:24:23', b'0');
INSERT INTO `system_dict_data` VALUES (45, 1, '是', 'true', 'infra_boolean_string', 0, 'danger', '', 'Boolean 是否类型 - 是', '', '2021-01-19 03:20:55', '1', '2022-03-15 23:01:45', b'0');
INSERT INTO `system_dict_data` VALUES (46, 1, '否', 'false', 'infra_boolean_string', 0, 'info', '', 'Boolean 是否类型 - 否', '', '2021-01-19 03:20:55', '1', '2022-03-15 23:09:45', b'0');
INSERT INTO `system_dict_data` VALUES (50, 1, '单表（增删改查）', '1', 'infra_codegen_template_type', 0, '', '', NULL, '', '2021-02-05 07:09:06', '', '2022-03-10 16:33:15', b'0');
INSERT INTO `system_dict_data` VALUES (51, 2, '树表（增删改查）', '2', 'infra_codegen_template_type', 0, '', '', NULL, '', '2021-02-05 07:14:46', '', '2022-03-10 16:33:19', b'0');
INSERT INTO `system_dict_data` VALUES (53, 0, '初始化中', '0', 'infra_job_status', 0, 'primary', '', NULL, '', '2021-02-07 07:46:49', '1', '2022-02-16 19:33:29', b'0');
INSERT INTO `system_dict_data` VALUES (57, 0, '运行中', '0', 'infra_job_log_status', 0, 'primary', '', 'RUNNING', '', '2021-02-08 10:04:24', '1', '2022-02-16 19:07:48', b'0');
INSERT INTO `system_dict_data` VALUES (58, 1, '成功', '1', 'infra_job_log_status', 0, 'success', '', NULL, '', '2021-02-08 10:06:57', '1', '2022-02-16 19:07:52', b'0');
INSERT INTO `system_dict_data` VALUES (59, 2, '失败', '2', 'infra_job_log_status', 0, 'warning', '', '失败', '', '2021-02-08 10:07:38', '1', '2022-02-16 19:07:56', b'0');
INSERT INTO `system_dict_data` VALUES (60, 1, '会员', '1', 'user_type', 0, 'primary', '', NULL, '', '2021-02-26 00:16:27', '1', '2022-02-16 10:22:19', b'0');
INSERT INTO `system_dict_data` VALUES (61, 2, '管理员', '2', 'user_type', 0, 'success', '', NULL, '', '2021-02-26 00:16:34', '1', '2022-02-16 10:22:22', b'0');
INSERT INTO `system_dict_data` VALUES (62, 0, '未处理', '0', 'infra_api_error_log_process_status', 0, 'primary', '', NULL, '', '2021-02-26 07:07:19', '1', '2022-02-16 20:14:17', b'0');
INSERT INTO `system_dict_data` VALUES (63, 1, '已处理', '1', 'infra_api_error_log_process_status', 0, 'success', '', NULL, '', '2021-02-26 07:07:26', '1', '2022-02-16 20:14:08', b'0');
INSERT INTO `system_dict_data` VALUES (64, 2, '已忽略', '2', 'infra_api_error_log_process_status', 0, 'danger', '', NULL, '', '2021-02-26 07:07:34', '1', '2022-02-16 20:14:14', b'0');
INSERT INTO `system_dict_data` VALUES (66, 2, '阿里云', 'ALIYUN', 'system_sms_channel_code', 0, 'primary', '', NULL, '1', '2021-04-05 01:05:26', '1', '2022-02-16 10:09:52', b'0');
INSERT INTO `system_dict_data` VALUES (67, 1, '验证码', '1', 'system_sms_template_type', 0, 'warning', '', NULL, '1', '2021-04-05 21:50:57', '1', '2022-02-16 12:48:30', b'0');
INSERT INTO `system_dict_data` VALUES (68, 2, '通知', '2', 'system_sms_template_type', 0, 'primary', '', NULL, '1', '2021-04-05 21:51:08', '1', '2022-02-16 12:48:27', b'0');
INSERT INTO `system_dict_data` VALUES (69, 0, '营销', '3', 'system_sms_template_type', 0, 'danger', '', NULL, '1', '2021-04-05 21:51:15', '1', '2022-02-16 12:48:22', b'0');
INSERT INTO `system_dict_data` VALUES (70, 0, '初始化', '0', 'system_sms_send_status', 0, 'primary', '', NULL, '1', '2021-04-11 20:18:33', '1', '2022-02-16 10:26:07', b'0');
INSERT INTO `system_dict_data` VALUES (71, 1, '发送成功', '10', 'system_sms_send_status', 0, 'success', '', NULL, '1', '2021-04-11 20:18:43', '1', '2022-02-16 10:25:56', b'0');
INSERT INTO `system_dict_data` VALUES (72, 2, '发送失败', '20', 'system_sms_send_status', 0, 'danger', '', NULL, '1', '2021-04-11 20:18:49', '1', '2022-02-16 10:26:03', b'0');
INSERT INTO `system_dict_data` VALUES (73, 3, '不发送', '30', 'system_sms_send_status', 0, 'info', '', NULL, '1', '2021-04-11 20:19:44', '1', '2022-02-16 10:26:10', b'0');
INSERT INTO `system_dict_data` VALUES (74, 0, '等待结果', '0', 'system_sms_receive_status', 0, 'primary', '', NULL, '1', '2021-04-11 20:27:43', '1', '2022-02-16 10:28:24', b'0');
INSERT INTO `system_dict_data` VALUES (75, 1, '接收成功', '10', 'system_sms_receive_status', 0, 'success', '', NULL, '1', '2021-04-11 20:29:25', '1', '2022-02-16 10:28:28', b'0');
INSERT INTO `system_dict_data` VALUES (76, 2, '接收失败', '20', 'system_sms_receive_status', 0, 'danger', '', NULL, '1', '2021-04-11 20:29:31', '1', '2022-02-16 10:28:32', b'0');
INSERT INTO `system_dict_data` VALUES (77, 0, '调试(钉钉)', 'DEBUG_DING_TALK', 'system_sms_channel_code', 0, 'info', '', NULL, '1', '2021-04-13 00:20:37', '1', '2022-02-16 10:10:00', b'0');
INSERT INTO `system_dict_data` VALUES (78, 1, '自动生成', '1', 'system_error_code_type', 0, 'warning', '', NULL, '1', '2021-04-21 00:06:48', '1', '2022-02-16 13:57:20', b'0');
INSERT INTO `system_dict_data` VALUES (79, 2, '手动编辑', '2', 'system_error_code_type', 0, 'primary', '', NULL, '1', '2021-04-21 00:07:14', '1', '2022-02-16 13:57:24', b'0');
INSERT INTO `system_dict_data` VALUES (80, 100, '账号登录', '100', 'system_login_type', 0, 'primary', '', '账号登录', '1', '2021-10-06 00:52:02', '1', '2022-02-16 13:11:34', b'0');
INSERT INTO `system_dict_data` VALUES (81, 101, '社交登录', '101', 'system_login_type', 0, 'info', '', '社交登录', '1', '2021-10-06 00:52:17', '1', '2022-02-16 13:11:40', b'0');
INSERT INTO `system_dict_data` VALUES (83, 200, '主动登出', '200', 'system_login_type', 0, 'primary', '', '主动登出', '1', '2021-10-06 00:52:58', '1', '2022-02-16 13:11:49', b'0');
INSERT INTO `system_dict_data` VALUES (85, 202, '强制登出', '202', 'system_login_type', 0, 'danger', '', '强制退出', '1', '2021-10-06 00:53:41', '1', '2022-02-16 13:11:57', b'0');
INSERT INTO `system_dict_data` VALUES (86, 0, '病假', '1', 'bpm_oa_leave_type', 0, 'primary', '', NULL, '1', '2021-09-21 22:35:28', '1', '2022-02-16 10:00:41', b'0');
INSERT INTO `system_dict_data` VALUES (87, 1, '事假', '2', 'bpm_oa_leave_type', 0, 'info', '', NULL, '1', '2021-09-21 22:36:11', '1', '2022-02-16 10:00:49', b'0');
INSERT INTO `system_dict_data` VALUES (88, 2, '婚假', '3', 'bpm_oa_leave_type', 0, 'warning', '', NULL, '1', '2021-09-21 22:36:38', '1', '2022-02-16 10:00:53', b'0');
INSERT INTO `system_dict_data` VALUES (113, 1, '微信公众号支付', 'wx_pub', 'pay_channel_code', 0, 'success', '', '微信公众号支付', '1', '2021-12-03 10:40:24', '1', '2023-07-19 20:08:47', b'0');
INSERT INTO `system_dict_data` VALUES (114, 2, '微信小程序支付', 'wx_lite', 'pay_channel_code', 0, 'success', '', '微信小程序支付', '1', '2021-12-03 10:41:06', '1', '2023-07-19 20:08:50', b'0');
INSERT INTO `system_dict_data` VALUES (115, 3, '微信 App 支付', 'wx_app', 'pay_channel_code', 0, 'success', '', '微信 App 支付', '1', '2021-12-03 10:41:20', '1', '2023-07-19 20:08:56', b'0');
INSERT INTO `system_dict_data` VALUES (116, 10, '支付宝 PC 网站支付', 'alipay_pc', 'pay_channel_code', 0, 'primary', '', '支付宝 PC 网站支付', '1', '2021-12-03 10:42:09', '1', '2023-07-19 20:09:12', b'0');
INSERT INTO `system_dict_data` VALUES (117, 11, '支付宝 Wap 网站支付', 'alipay_wap', 'pay_channel_code', 0, 'primary', '', '支付宝 Wap 网站支付', '1', '2021-12-03 10:42:26', '1', '2023-07-19 20:09:16', b'0');
INSERT INTO `system_dict_data` VALUES (118, 12, '支付宝 App 支付', 'alipay_app', 'pay_channel_code', 0, 'primary', '', '支付宝 App 支付', '1', '2021-12-03 10:42:55', '1', '2023-07-19 20:09:20', b'0');
INSERT INTO `system_dict_data` VALUES (119, 14, '支付宝扫码支付', 'alipay_qr', 'pay_channel_code', 0, 'primary', '', '支付宝扫码支付', '1', '2021-12-03 10:43:10', '1', '2023-07-19 20:09:28', b'0');
INSERT INTO `system_dict_data` VALUES (120, 10, '通知成功', '10', 'pay_notify_status', 0, 'success', '', '通知成功', '1', '2021-12-03 11:02:41', '1', '2023-07-19 10:08:19', b'0');
INSERT INTO `system_dict_data` VALUES (121, 20, '通知失败', '20', 'pay_notify_status', 0, 'danger', '', '通知失败', '1', '2021-12-03 11:02:59', '1', '2023-07-19 10:08:21', b'0');
INSERT INTO `system_dict_data` VALUES (122, 0, '等待通知', '0', 'pay_notify_status', 0, 'info', '', '未通知', '1', '2021-12-03 11:03:10', '1', '2023-07-19 10:08:24', b'0');
INSERT INTO `system_dict_data` VALUES (123, 10, '支付成功', '10', 'pay_order_status', 0, 'success', '', '支付成功', '1', '2021-12-03 11:18:29', '1', '2023-07-19 18:04:28', b'0');
INSERT INTO `system_dict_data` VALUES (124, 30, '支付关闭', '30', 'pay_order_status', 0, 'info', '', '支付关闭', '1', '2021-12-03 11:18:42', '1', '2023-07-19 18:05:07', b'0');
INSERT INTO `system_dict_data` VALUES (125, 0, '等待支付', '0', 'pay_order_status', 0, 'info', '', '未支付', '1', '2021-12-03 11:18:18', '1', '2023-07-19 18:04:15', b'0');
INSERT INTO `system_dict_data` VALUES (600, 5, '首页', '1', 'promotion_banner_position', 0, 'warning', '', '', '1', '2023-10-11 07:45:24', '1', '2023-10-11 07:45:38', b'0');
INSERT INTO `system_dict_data` VALUES (601, 4, '秒杀活动页', '2', 'promotion_banner_position', 0, 'warning', '', '', '1', '2023-10-11 07:45:24', '1', '2023-10-11 07:45:38', b'0');
INSERT INTO `system_dict_data` VALUES (602, 3, '砍价活动页', '3', 'promotion_banner_position', 0, 'warning', '', '', '1', '2023-10-11 07:45:24', '1', '2023-10-11 07:45:38', b'0');
INSERT INTO `system_dict_data` VALUES (603, 2, '限时折扣页', '4', 'promotion_banner_position', 0, 'warning', '', '', '1', '2023-10-11 07:45:24', '1', '2023-10-11 07:45:38', b'0');
INSERT INTO `system_dict_data` VALUES (604, 1, '满减送页', '5', 'promotion_banner_position', 0, 'warning', '', '', '1', '2023-10-11 07:45:24', '1', '2023-10-11 07:45:38', b'0');
INSERT INTO `system_dict_data` VALUES (1118, 0, '等待退款', '0', 'pay_refund_status', 0, 'info', '', '等待退款', '1', '2021-12-10 16:44:59', '1', '2023-07-19 10:14:39', b'0');
INSERT INTO `system_dict_data` VALUES (1119, 20, '退款失败', '20', 'pay_refund_status', 0, 'danger', '', '退款失败', '1', '2021-12-10 16:45:10', '1', '2023-07-19 10:15:10', b'0');
INSERT INTO `system_dict_data` VALUES (1124, 10, '退款成功', '10', 'pay_refund_status', 0, 'success', '', '退款成功', '1', '2021-12-10 16:46:26', '1', '2023-07-19 10:15:00', b'0');
INSERT INTO `system_dict_data` VALUES (1125, 0, '默认', '1', 'bpm_model_category', 0, 'primary', '', '流程分类 - 默认', '1', '2022-01-02 08:41:11', '1', '2022-02-16 20:01:42', b'0');
INSERT INTO `system_dict_data` VALUES (1126, 0, 'OA', '2', 'bpm_model_category', 0, 'success', '', '流程分类 - OA', '1', '2022-01-02 08:41:22', '1', '2022-02-16 20:01:50', b'0');
INSERT INTO `system_dict_data` VALUES (1127, 0, '进行中', '1', 'bpm_process_instance_status', 0, 'primary', '', '流程实例的状态 - 进行中', '1', '2022-01-07 23:47:22', '1', '2022-02-16 20:07:49', b'0');
INSERT INTO `system_dict_data` VALUES (1128, 2, '已完成', '2', 'bpm_process_instance_status', 0, 'success', '', '流程实例的状态 - 已完成', '1', '2022-01-07 23:47:49', '1', '2022-02-16 20:07:54', b'0');
INSERT INTO `system_dict_data` VALUES (1129, 1, '处理中', '1', 'bpm_process_instance_result', 0, 'primary', '', '流程实例的结果 - 处理中', '1', '2022-01-07 23:48:32', '1', '2022-02-16 09:53:26', b'0');
INSERT INTO `system_dict_data` VALUES (1130, 2, '通过', '2', 'bpm_process_instance_result', 0, 'success', '', '流程实例的结果 - 通过', '1', '2022-01-07 23:48:45', '1', '2022-02-16 09:53:31', b'0');
INSERT INTO `system_dict_data` VALUES (1131, 3, '不通过', '3', 'bpm_process_instance_result', 0, 'danger', '', '流程实例的结果 - 不通过', '1', '2022-01-07 23:48:55', '1', '2022-02-16 09:53:38', b'0');
INSERT INTO `system_dict_data` VALUES (1132, 4, '已取消', '4', 'bpm_process_instance_result', 0, 'info', '', '流程实例的结果 - 撤销', '1', '2022-01-07 23:49:06', '1', '2022-02-16 09:53:42', b'0');
INSERT INTO `system_dict_data` VALUES (1133, 10, '流程表单', '10', 'bpm_model_form_type', 0, '', '', '流程的表单类型 - 流程表单', '103', '2022-01-11 23:51:30', '103', '2022-01-11 23:51:30', b'0');
INSERT INTO `system_dict_data` VALUES (1134, 20, '业务表单', '20', 'bpm_model_form_type', 0, '', '', '流程的表单类型 - 业务表单', '103', '2022-01-11 23:51:47', '103', '2022-01-11 23:51:47', b'0');
INSERT INTO `system_dict_data` VALUES (1135, 10, '角色', '10', 'bpm_task_assign_rule_type', 0, 'info', '', '任务分配规则的类型 - 角色', '103', '2022-01-12 23:21:22', '1', '2022-02-16 20:06:14', b'0');
INSERT INTO `system_dict_data` VALUES (1136, 20, '部门的成员', '20', 'bpm_task_assign_rule_type', 0, 'primary', '', '任务分配规则的类型 - 部门的成员', '103', '2022-01-12 23:21:47', '1', '2022-02-16 20:05:28', b'0');
INSERT INTO `system_dict_data` VALUES (1137, 21, '部门的负责人', '21', 'bpm_task_assign_rule_type', 0, 'primary', '', '任务分配规则的类型 - 部门的负责人', '103', '2022-01-12 23:33:36', '1', '2022-02-16 20:05:31', b'0');
INSERT INTO `system_dict_data` VALUES (1138, 30, '用户', '30', 'bpm_task_assign_rule_type', 0, 'info', '', '任务分配规则的类型 - 用户', '103', '2022-01-12 23:34:02', '1', '2022-02-16 20:05:50', b'0');
INSERT INTO `system_dict_data` VALUES (1139, 40, '用户组', '40', 'bpm_task_assign_rule_type', 0, 'warning', '', '任务分配规则的类型 - 用户组', '103', '2022-01-12 23:34:21', '1', '2022-02-16 20:05:57', b'0');
INSERT INTO `system_dict_data` VALUES (1140, 50, '自定义脚本', '50', 'bpm_task_assign_rule_type', 0, 'danger', '', '任务分配规则的类型 - 自定义脚本', '103', '2022-01-12 23:34:43', '1', '2022-02-16 20:06:01', b'0');
INSERT INTO `system_dict_data` VALUES (1141, 22, '岗位', '22', 'bpm_task_assign_rule_type', 0, 'success', '', '任务分配规则的类型 - 岗位', '103', '2022-01-14 18:41:55', '1', '2022-02-16 20:05:39', b'0');
INSERT INTO `system_dict_data` VALUES (1142, 10, '流程发起人', '10', 'bpm_task_assign_script', 0, '', '', '任务分配自定义脚本 - 流程发起人', '103', '2022-01-15 00:10:57', '103', '2022-01-15 21:24:10', b'0');
INSERT INTO `system_dict_data` VALUES (1143, 20, '流程发起人的一级领导', '20', 'bpm_task_assign_script', 0, '', '', '任务分配自定义脚本 - 流程发起人的一级领导', '103', '2022-01-15 21:24:31', '103', '2022-01-15 21:24:31', b'0');
INSERT INTO `system_dict_data` VALUES (1144, 21, '流程发起人的二级领导', '21', 'bpm_task_assign_script', 0, '', '', '任务分配自定义脚本 - 流程发起人的二级领导', '103', '2022-01-15 21:24:46', '103', '2022-01-15 21:24:57', b'0');
INSERT INTO `system_dict_data` VALUES (1145, 1, '管理后台', '1', 'infra_codegen_scene', 0, '', '', '代码生成的场景枚举 - 管理后台', '1', '2022-02-02 13:15:06', '1', '2022-03-10 16:32:59', b'0');
INSERT INTO `system_dict_data` VALUES (1146, 2, '用户 APP', '2', 'infra_codegen_scene', 0, '', '', '代码生成的场景枚举 - 用户 APP', '1', '2022-02-02 13:15:19', '1', '2022-03-10 16:33:03', b'0');
INSERT INTO `system_dict_data` VALUES (1150, 1, '数据库', '1', 'infra_file_storage', 0, 'default', '', NULL, '1', '2022-03-15 00:25:28', '1', '2022-03-15 00:25:28', b'0');
INSERT INTO `system_dict_data` VALUES (1151, 10, '本地磁盘', '10', 'infra_file_storage', 0, 'default', '', NULL, '1', '2022-03-15 00:25:41', '1', '2022-03-15 00:25:56', b'0');
INSERT INTO `system_dict_data` VALUES (1152, 11, 'FTP 服务器', '11', 'infra_file_storage', 0, 'default', '', NULL, '1', '2022-03-15 00:26:06', '1', '2022-03-15 00:26:10', b'0');
INSERT INTO `system_dict_data` VALUES (1153, 12, 'SFTP 服务器', '12', 'infra_file_storage', 0, 'default', '', NULL, '1', '2022-03-15 00:26:22', '1', '2022-03-15 00:26:22', b'0');
INSERT INTO `system_dict_data` VALUES (1154, 20, 'S3 对象存储', '20', 'infra_file_storage', 0, 'default', '', NULL, '1', '2022-03-15 00:26:31', '1', '2022-03-15 00:26:45', b'0');
INSERT INTO `system_dict_data` VALUES (1155, 103, '短信登录', '103', 'system_login_type', 0, 'default', '', NULL, '1', '2022-05-09 23:57:58', '1', '2022-05-09 23:58:09', b'0');
INSERT INTO `system_dict_data` VALUES (1156, 1, 'password', 'password', 'system_oauth2_grant_type', 0, 'default', '', '密码模式', '1', '2022-05-12 00:22:05', '1', '2022-05-11 16:26:01', b'0');
INSERT INTO `system_dict_data` VALUES (1157, 2, 'authorization_code', 'authorization_code', 'system_oauth2_grant_type', 0, 'primary', '', '授权码模式', '1', '2022-05-12 00:22:59', '1', '2022-05-11 16:26:02', b'0');
INSERT INTO `system_dict_data` VALUES (1158, 3, 'implicit', 'implicit', 'system_oauth2_grant_type', 0, 'success', '', '简化模式', '1', '2022-05-12 00:23:40', '1', '2022-05-11 16:26:05', b'0');
INSERT INTO `system_dict_data` VALUES (1159, 4, 'client_credentials', 'client_credentials', 'system_oauth2_grant_type', 0, 'default', '', '客户端模式', '1', '2022-05-12 00:23:51', '1', '2022-05-11 16:26:08', b'0');
INSERT INTO `system_dict_data` VALUES (1160, 5, 'refresh_token', 'refresh_token', 'system_oauth2_grant_type', 0, 'info', '', '刷新模式', '1', '2022-05-12 00:24:02', '1', '2022-05-11 16:26:11', b'0');
INSERT INTO `system_dict_data` VALUES (1162, 1, '销售中', '1', 'product_spu_status', 0, 'success', '', '商品 SPU 状态 - 销售中', '1', '2022-10-24 21:19:47', '1', '2022-10-24 21:20:38', b'0');
INSERT INTO `system_dict_data` VALUES (1163, 0, '仓库中', '0', 'product_spu_status', 0, 'info', '', '商品 SPU 状态 - 仓库中', '1', '2022-10-24 21:20:54', '1', '2022-10-24 21:21:22', b'0');
INSERT INTO `system_dict_data` VALUES (1164, 0, '回收站', '-1', 'product_spu_status', 0, 'default', '', '商品 SPU 状态 - 回收站', '1', '2022-10-24 21:21:11', '1', '2022-10-24 21:21:11', b'0');
INSERT INTO `system_dict_data` VALUES (1165, 1, '满减', '1', 'promotion_discount_type', 0, 'success', '', '优惠类型 - 满减', '1', '2022-11-01 12:46:41', '1', '2022-11-01 12:50:11', b'0');
INSERT INTO `system_dict_data` VALUES (1166, 2, '折扣', '2', 'promotion_discount_type', 0, 'primary', '', '优惠类型 - 折扣', '1', '2022-11-01 12:46:51', '1', '2022-11-01 12:50:08', b'0');
INSERT INTO `system_dict_data` VALUES (1167, 1, '固定日期', '1', 'promotion_coupon_template_validity_type', 0, 'default', '', '优惠劵模板的有限期类型 - 固定日期', '1', '2022-11-02 00:07:34', '1', '2022-11-04 00:07:49', b'0');
INSERT INTO `system_dict_data` VALUES (1168, 2, '领取之后', '2', 'promotion_coupon_template_validity_type', 0, 'default', '', '优惠劵模板的有限期类型 - 领取之后', '1', '2022-11-02 00:07:54', '1', '2022-11-04 00:07:52', b'0');
INSERT INTO `system_dict_data` VALUES (1169, 1, '通用劵', '1', 'promotion_product_scope', 0, 'default', '', '营销的商品范围 - 全部商品参与', '1', '2022-11-02 00:28:22', '1', '2023-09-28 00:27:42', b'0');
INSERT INTO `system_dict_data` VALUES (1170, 2, '商品劵', '2', 'promotion_product_scope', 0, 'default', '', '营销的商品范围 - 指定商品参与', '1', '2022-11-02 00:28:34', '1', '2023-09-28 00:27:44', b'0');
INSERT INTO `system_dict_data` VALUES (1171, 1, '未使用', '1', 'promotion_coupon_status', 0, 'primary', '', '优惠劵的状态 - 已领取', '1', '2022-11-04 00:15:08', '1', '2023-10-03 12:54:38', b'0');
INSERT INTO `system_dict_data` VALUES (1172, 2, '已使用', '2', 'promotion_coupon_status', 0, 'success', '', '优惠劵的状态 - 已使用', '1', '2022-11-04 00:15:21', '1', '2022-11-04 19:16:08', b'0');
INSERT INTO `system_dict_data` VALUES (1173, 3, '已过期', '3', 'promotion_coupon_status', 0, 'info', '', '优惠劵的状态 - 已过期', '1', '2022-11-04 00:15:43', '1', '2022-11-04 19:16:12', b'0');
INSERT INTO `system_dict_data` VALUES (1174, 1, '直接领取', '1', 'promotion_coupon_take_type', 0, 'primary', '', '优惠劵的领取方式 - 直接领取', '1', '2022-11-04 19:13:00', '1', '2022-11-04 19:13:25', b'0');
INSERT INTO `system_dict_data` VALUES (1175, 2, '指定发放', '2', 'promotion_coupon_take_type', 0, 'success', '', '优惠劵的领取方式 - 指定发放', '1', '2022-11-04 19:13:13', '1', '2022-11-04 19:14:48', b'0');
INSERT INTO `system_dict_data` VALUES (1176, 10, '未开始', '10', 'promotion_activity_status', 0, 'primary', '', '促销活动的状态枚举 - 未开始', '1', '2022-11-04 22:54:49', '1', '2022-11-04 22:55:53', b'0');
INSERT INTO `system_dict_data` VALUES (1177, 20, '进行中', '20', 'promotion_activity_status', 0, 'success', '', '促销活动的状态枚举 - 进行中', '1', '2022-11-04 22:55:06', '1', '2022-11-04 22:55:20', b'0');
INSERT INTO `system_dict_data` VALUES (1178, 30, '已结束', '30', 'promotion_activity_status', 0, 'info', '', '促销活动的状态枚举 - 已结束', '1', '2022-11-04 22:55:41', '1', '2022-11-04 22:55:41', b'0');
INSERT INTO `system_dict_data` VALUES (1179, 40, '已关闭', '40', 'promotion_activity_status', 0, 'warning', '', '促销活动的状态枚举 - 已关闭', '1', '2022-11-04 22:56:10', '1', '2022-11-04 22:56:18', b'0');
INSERT INTO `system_dict_data` VALUES (1180, 10, '满 N 元', '10', 'promotion_condition_type', 0, 'primary', '', '营销的条件类型 - 满 N 元', '1', '2022-11-04 22:59:45', '1', '2022-11-04 22:59:45', b'0');
INSERT INTO `system_dict_data` VALUES (1181, 20, '满 N 件', '20', 'promotion_condition_type', 0, 'success', '', '营销的条件类型 - 满 N 件', '1', '2022-11-04 23:00:02', '1', '2022-11-04 23:00:02', b'0');
INSERT INTO `system_dict_data` VALUES (1182, 10, '申请售后', '10', 'trade_after_sale_status', 0, 'primary', '', '交易售后状态 - 申请售后', '1', '2022-11-19 20:53:33', '1', '2022-11-19 20:54:42', b'0');
INSERT INTO `system_dict_data` VALUES (1183, 20, '商品待退货', '20', 'trade_after_sale_status', 0, 'primary', '', '交易售后状态 - 商品待退货', '1', '2022-11-19 20:54:36', '1', '2022-11-19 20:58:58', b'0');
INSERT INTO `system_dict_data` VALUES (1184, 30, '商家待收货', '30', 'trade_after_sale_status', 0, 'primary', '', '交易售后状态 - 商家待收货', '1', '2022-11-19 20:56:56', '1', '2022-11-19 20:59:20', b'0');
INSERT INTO `system_dict_data` VALUES (1185, 40, '等待退款', '40', 'trade_after_sale_status', 0, 'primary', '', '交易售后状态 - 等待退款', '1', '2022-11-19 20:59:54', '1', '2022-11-19 21:00:01', b'0');
INSERT INTO `system_dict_data` VALUES (1186, 50, '退款成功', '50', 'trade_after_sale_status', 0, 'default', '', '交易售后状态 - 退款成功', '1', '2022-11-19 21:00:33', '1', '2022-11-19 21:00:33', b'0');
INSERT INTO `system_dict_data` VALUES (1187, 61, '买家取消', '61', 'trade_after_sale_status', 0, 'info', '', '交易售后状态 - 买家取消', '1', '2022-11-19 21:01:29', '1', '2022-11-19 21:01:29', b'0');
INSERT INTO `system_dict_data` VALUES (1188, 62, '商家拒绝', '62', 'trade_after_sale_status', 0, 'info', '', '交易售后状态 - 商家拒绝', '1', '2022-11-19 21:02:17', '1', '2022-11-19 21:02:17', b'0');
INSERT INTO `system_dict_data` VALUES (1189, 63, '商家拒收货', '63', 'trade_after_sale_status', 0, 'info', '', '交易售后状态 - 商家拒收货', '1', '2022-11-19 21:02:37', '1', '2022-11-19 21:03:07', b'0');
INSERT INTO `system_dict_data` VALUES (1190, 10, '售中退款', '10', 'trade_after_sale_type', 0, 'success', '', '交易售后的类型 - 售中退款', '1', '2022-11-19 21:05:05', '1', '2022-11-19 21:38:23', b'0');
INSERT INTO `system_dict_data` VALUES (1191, 20, '售后退款', '20', 'trade_after_sale_type', 0, 'primary', '', '交易售后的类型 - 售后退款', '1', '2022-11-19 21:05:32', '1', '2022-11-19 21:38:32', b'0');
INSERT INTO `system_dict_data` VALUES (1192, 10, '仅退款', '10', 'trade_after_sale_way', 0, 'primary', '', '交易售后的方式 - 仅退款', '1', '2022-11-19 21:39:19', '1', '2022-11-19 21:39:19', b'0');
INSERT INTO `system_dict_data` VALUES (1193, 20, '退货退款', '20', 'trade_after_sale_way', 0, 'success', '', '交易售后的方式 - 退货退款', '1', '2022-11-19 21:39:38', '1', '2022-11-19 21:39:49', b'0');
INSERT INTO `system_dict_data` VALUES (1194, 10, '微信小程序', '10', 'terminal', 0, 'default', '', '终端 - 微信小程序', '1', '2022-12-10 10:51:11', '1', '2022-12-10 10:51:57', b'0');
INSERT INTO `system_dict_data` VALUES (1195, 20, 'H5 网页', '20', 'terminal', 0, 'default', '', '终端 - H5 网页', '1', '2022-12-10 10:51:30', '1', '2022-12-10 10:51:59', b'0');
INSERT INTO `system_dict_data` VALUES (1196, 11, '微信公众号', '11', 'terminal', 0, 'default', '', '终端 - 微信公众号', '1', '2022-12-10 10:54:16', '1', '2022-12-10 10:52:01', b'0');
INSERT INTO `system_dict_data` VALUES (1197, 31, '苹果 App', '31', 'terminal', 0, 'default', '', '终端 - 苹果 App', '1', '2022-12-10 10:54:42', '1', '2022-12-10 10:52:18', b'0');
INSERT INTO `system_dict_data` VALUES (1198, 32, '安卓 App', '32', 'terminal', 0, 'default', '', '终端 - 安卓 App', '1', '2022-12-10 10:55:02', '1', '2022-12-10 10:59:17', b'0');
INSERT INTO `system_dict_data` VALUES (1199, 0, '普通订单', '0', 'trade_order_type', 0, 'default', '', '交易订单的类型 - 普通订单', '1', '2022-12-10 16:34:14', '1', '2022-12-10 16:34:14', b'0');
INSERT INTO `system_dict_data` VALUES (1200, 1, '秒杀订单', '1', 'trade_order_type', 0, 'default', '', '交易订单的类型 - 秒杀订单', '1', '2022-12-10 16:34:26', '1', '2022-12-10 16:34:26', b'0');
INSERT INTO `system_dict_data` VALUES (1201, 2, '拼团订单', '2', 'trade_order_type', 0, 'default', '', '交易订单的类型 - 拼团订单', '1', '2022-12-10 16:34:36', '1', '2022-12-10 16:34:36', b'0');
INSERT INTO `system_dict_data` VALUES (1202, 3, '砍价订单', '3', 'trade_order_type', 0, 'default', '', '交易订单的类型 - 砍价订单', '1', '2022-12-10 16:34:48', '1', '2022-12-10 16:34:48', b'0');
INSERT INTO `system_dict_data` VALUES (1203, 0, '待支付', '0', 'trade_order_status', 0, 'default', '', '交易订单状态 - 待支付', '1', '2022-12-10 16:49:29', '1', '2022-12-10 16:49:29', b'0');
INSERT INTO `system_dict_data` VALUES (1204, 10, '待发货', '10', 'trade_order_status', 0, 'primary', '', '交易订单状态 - 待发货', '1', '2022-12-10 16:49:53', '1', '2022-12-10 16:51:17', b'0');
INSERT INTO `system_dict_data` VALUES (1205, 20, '已发货', '20', 'trade_order_status', 0, 'primary', '', '交易订单状态 - 已发货', '1', '2022-12-10 16:50:13', '1', '2022-12-10 16:51:31', b'0');
INSERT INTO `system_dict_data` VALUES (1206, 30, '已完成', '30', 'trade_order_status', 0, 'success', '', '交易订单状态 - 已完成', '1', '2022-12-10 16:50:30', '1', '2022-12-10 16:51:06', b'0');
INSERT INTO `system_dict_data` VALUES (1207, 40, '已取消', '40', 'trade_order_status', 0, 'danger', '', '交易订单状态 - 已取消', '1', '2022-12-10 16:50:50', '1', '2022-12-10 16:51:00', b'0');
INSERT INTO `system_dict_data` VALUES (1208, 0, '未售后', '0', 'trade_order_item_after_sale_status', 0, 'info', '', '交易订单项的售后状态 - 未售后', '1', '2022-12-10 20:58:42', '1', '2022-12-10 20:59:29', b'0');
INSERT INTO `system_dict_data` VALUES (1209, 1, '售后中', '1', 'trade_order_item_after_sale_status', 0, 'primary', '', '交易订单项的售后状态 - 售后中', '1', '2022-12-10 20:59:21', '1', '2022-12-10 20:59:21', b'0');
INSERT INTO `system_dict_data` VALUES (1210, 2, '已退款', '2', 'trade_order_item_after_sale_status', 0, 'success', '', '交易订单项的售后状态 - 已退款', '1', '2022-12-10 20:59:46', '1', '2022-12-10 20:59:46', b'0');
INSERT INTO `system_dict_data` VALUES (1211, 1, '完全匹配', '1', 'mp_auto_reply_request_match', 0, 'primary', '', '公众号自动回复的请求关键字匹配模式 - 完全匹配', '1', '2023-01-16 23:30:39', '1', '2023-01-16 23:31:00', b'0');
INSERT INTO `system_dict_data` VALUES (1212, 2, '半匹配', '2', 'mp_auto_reply_request_match', 0, 'success', '', '公众号自动回复的请求关键字匹配模式 - 半匹配', '1', '2023-01-16 23:30:55', '1', '2023-01-16 23:31:10', b'0');
INSERT INTO `system_dict_data` VALUES (1213, 1, '文本', 'text', 'mp_message_type', 0, 'default', '', '公众号的消息类型 - 文本', '1', '2023-01-17 22:17:32', '1', '2023-01-17 22:17:39', b'0');
INSERT INTO `system_dict_data` VALUES (1214, 2, '图片', 'image', 'mp_message_type', 0, 'default', '', '公众号的消息类型 - 图片', '1', '2023-01-17 22:17:32', '1', '2023-01-17 14:19:47', b'0');
INSERT INTO `system_dict_data` VALUES (1215, 3, '语音', 'voice', 'mp_message_type', 0, 'default', '', '公众号的消息类型 - 语音', '1', '2023-01-17 22:17:32', '1', '2023-01-17 14:20:08', b'0');
INSERT INTO `system_dict_data` VALUES (1216, 4, '视频', 'video', 'mp_message_type', 0, 'default', '', '公众号的消息类型 - 视频', '1', '2023-01-17 22:17:32', '1', '2023-01-17 14:21:08', b'0');
INSERT INTO `system_dict_data` VALUES (1217, 5, '小视频', 'shortvideo', 'mp_message_type', 0, 'default', '', '公众号的消息类型 - 小视频', '1', '2023-01-17 22:17:32', '1', '2023-01-17 14:19:59', b'0');
INSERT INTO `system_dict_data` VALUES (1218, 6, '图文', 'news', 'mp_message_type', 0, 'default', '', '公众号的消息类型 - 图文', '1', '2023-01-17 22:17:32', '1', '2023-01-17 14:22:54', b'0');
INSERT INTO `system_dict_data` VALUES (1219, 7, '音乐', 'music', 'mp_message_type', 0, 'default', '', '公众号的消息类型 - 音乐', '1', '2023-01-17 22:17:32', '1', '2023-01-17 14:22:54', b'0');
INSERT INTO `system_dict_data` VALUES (1220, 8, '地理位置', 'location', 'mp_message_type', 0, 'default', '', '公众号的消息类型 - 地理位置', '1', '2023-01-17 22:17:32', '1', '2023-01-17 14:23:51', b'0');
INSERT INTO `system_dict_data` VALUES (1221, 9, '链接', 'link', 'mp_message_type', 0, 'default', '', '公众号的消息类型 - 链接', '1', '2023-01-17 22:17:32', '1', '2023-01-17 14:24:49', b'0');
INSERT INTO `system_dict_data` VALUES (1222, 10, '事件', 'event', 'mp_message_type', 0, 'default', '', '公众号的消息类型 - 事件', '1', '2023-01-17 22:17:32', '1', '2023-01-17 14:24:49', b'0');
INSERT INTO `system_dict_data` VALUES (1223, 0, '初始化', '0', 'system_mail_send_status', 0, 'primary', '', '邮件发送状态 - 初始化\n', '1', '2023-01-26 09:53:49', '1', '2023-01-26 16:36:14', b'0');
INSERT INTO `system_dict_data` VALUES (1224, 10, '发送成功', '10', 'system_mail_send_status', 0, 'success', '', '邮件发送状态 - 发送成功', '1', '2023-01-26 09:54:28', '1', '2023-01-26 16:36:22', b'0');
INSERT INTO `system_dict_data` VALUES (1225, 20, '发送失败', '20', 'system_mail_send_status', 0, 'danger', '', '邮件发送状态 - 发送失败', '1', '2023-01-26 09:54:50', '1', '2023-01-26 16:36:26', b'0');
INSERT INTO `system_dict_data` VALUES (1226, 30, '不发送', '30', 'system_mail_send_status', 0, 'info', '', '邮件发送状态 -  不发送', '1', '2023-01-26 09:55:06', '1', '2023-01-26 16:36:36', b'0');
INSERT INTO `system_dict_data` VALUES (1227, 1, '通知公告', '1', 'system_notify_template_type', 0, 'primary', '', '站内信模版的类型 - 通知公告', '1', '2023-01-28 10:35:59', '1', '2023-01-28 10:35:59', b'0');
INSERT INTO `system_dict_data` VALUES (1228, 2, '系统消息', '2', 'system_notify_template_type', 0, 'success', '', '站内信模版的类型 - 系统消息', '1', '2023-01-28 10:36:20', '1', '2023-01-28 10:36:25', b'0');
INSERT INTO `system_dict_data` VALUES (1230, 13, '支付宝条码支付', 'alipay_bar', 'pay_channel_code', 0, 'primary', '', '支付宝条码支付', '1', '2023-02-18 23:32:24', '1', '2023-07-19 20:09:23', b'0');
INSERT INTO `system_dict_data` VALUES (1231, 10, 'Vue2 Element UI 标准模版', '10', 'infra_codegen_front_type', 0, '', '', '', '1', '2023-04-13 00:03:55', '1', '2023-04-13 00:03:55', b'0');
INSERT INTO `system_dict_data` VALUES (1232, 20, 'Vue3 Element Plus 标准模版', '20', 'infra_codegen_front_type', 0, '', '', '', '1', '2023-04-13 00:04:08', '1', '2023-04-13 00:04:08', b'0');
INSERT INTO `system_dict_data` VALUES (1233, 21, 'Vue3 Element Plus Schema 模版', '21', 'infra_codegen_front_type', 0, '', '', '', '1', '2023-04-13 00:04:26', '1', '2023-04-13 00:04:26', b'0');
INSERT INTO `system_dict_data` VALUES (1234, 30, 'Vue3 vben 模版', '30', 'infra_codegen_front_type', 0, '', '', '', '1', '2023-04-13 00:04:26', '1', '2023-04-13 00:04:26', b'0');
INSERT INTO `system_dict_data` VALUES (1235, 1, '个', '1', 'product_unit', 0, '', '', '', '1', '2023-05-23 14:38:38', '1', '2023-05-23 14:38:38', b'0');
INSERT INTO `system_dict_data` VALUES (1236, 1, '件', '2', 'product_unit', 0, '', '', '', '1', '2023-05-23 14:38:38', '1', '2023-05-23 14:38:38', b'0');
INSERT INTO `system_dict_data` VALUES (1237, 1, '盒', '3', 'product_unit', 0, '', '', '', '1', '2023-05-23 14:38:38', '1', '2023-05-23 14:38:38', b'0');
INSERT INTO `system_dict_data` VALUES (1238, 1, '袋', '4', 'product_unit', 0, '', '', '', '1', '2023-05-23 14:38:38', '1', '2023-05-23 14:38:38', b'0');
INSERT INTO `system_dict_data` VALUES (1239, 1, '箱', '5', 'product_unit', 0, '', '', '', '1', '2023-05-23 14:38:38', '1', '2023-05-23 14:38:38', b'0');
INSERT INTO `system_dict_data` VALUES (1240, 1, '套', '6', 'product_unit', 0, '', '', '', '1', '2023-05-23 14:38:38', '1', '2023-05-23 14:38:38', b'0');
INSERT INTO `system_dict_data` VALUES (1241, 1, '包', '7', 'product_unit', 0, '', '', '', '1', '2023-05-23 14:38:38', '1', '2023-05-23 14:38:38', b'0');
INSERT INTO `system_dict_data` VALUES (1242, 1, '双', '8', 'product_unit', 0, '', '', '', '1', '2023-05-23 14:38:38', '1', '2023-05-23 14:38:38', b'0');
INSERT INTO `system_dict_data` VALUES (1243, 1, '卷', '9', 'product_unit', 0, '', '', '', '1', '2023-05-23 14:38:38', '1', '2023-05-23 14:38:38', b'0');
INSERT INTO `system_dict_data` VALUES (1244, 0, '按件', '1', 'trade_delivery_express_charge_mode', 0, '', '', '', '1', '2023-05-21 22:46:40', '1', '2023-05-21 22:46:40', b'0');
INSERT INTO `system_dict_data` VALUES (1245, 1, '按重量', '2', 'trade_delivery_express_charge_mode', 0, '', '', '', '1', '2023-05-21 22:46:58', '1', '2023-05-21 22:46:58', b'0');
INSERT INTO `system_dict_data` VALUES (1246, 2, '按体积', '3', 'trade_delivery_express_charge_mode', 0, '', '', '', '1', '2023-05-21 22:47:18', '1', '2023-05-21 22:47:18', b'0');
INSERT INTO `system_dict_data` VALUES (1335, 11, '订单积分抵扣', '11', 'member_point_biz_type', 0, '', '', '', '1', '2023-06-10 12:15:27', '1', '2023-10-11 07:41:43', b'0');
INSERT INTO `system_dict_data` VALUES (1336, 1, '签到', '1', 'member_point_biz_type', 0, '', '', '', '1', '2023-06-10 12:15:48', '1', '2023-08-20 11:59:53', b'0');
INSERT INTO `system_dict_data` VALUES (1341, 20, '已退款', '20', 'pay_order_status', 0, 'danger', '', '已退款', '1', '2023-07-19 18:05:37', '1', '2023-07-19 18:05:37', b'0');
INSERT INTO `system_dict_data` VALUES (1342, 21, '请求成功，但是结果失败', '21', 'pay_notify_status', 0, 'warning', '', '请求成功，但是结果失败', '1', '2023-07-19 18:10:47', '1', '2023-07-19 18:11:38', b'0');
INSERT INTO `system_dict_data` VALUES (1343, 22, '请求失败', '22', 'pay_notify_status', 0, 'warning', '', NULL, '1', '2023-07-19 18:11:05', '1', '2023-07-19 18:11:27', b'0');
INSERT INTO `system_dict_data` VALUES (1344, 4, '微信扫码支付', 'wx_native', 'pay_channel_code', 0, 'success', '', '微信扫码支付', '1', '2023-07-19 20:07:47', '1', '2023-07-19 20:09:03', b'0');
INSERT INTO `system_dict_data` VALUES (1345, 5, '微信条码支付', 'wx_bar', 'pay_channel_code', 0, 'success', '', '微信条码支付\n', '1', '2023-07-19 20:08:06', '1', '2023-07-19 20:09:08', b'0');
INSERT INTO `system_dict_data` VALUES (1346, 1, '支付单', '1', 'pay_notify_type', 0, 'primary', '', '支付单', '1', '2023-07-20 12:23:17', '1', '2023-07-20 12:23:17', b'0');
INSERT INTO `system_dict_data` VALUES (1347, 2, '退款单', '2', 'pay_notify_type', 0, 'danger', '', NULL, '1', '2023-07-20 12:23:26', '1', '2023-07-20 12:23:26', b'0');
INSERT INTO `system_dict_data` VALUES (1348, 20, '模拟支付', 'mock', 'pay_channel_code', 0, 'default', '', '模拟支付', '1', '2023-07-29 11:10:51', '1', '2023-07-29 03:14:10', b'0');
INSERT INTO `system_dict_data` VALUES (1349, 12, '订单积分抵扣（整单取消）', '12', 'member_point_biz_type', 0, '', '', '', '1', '2023-08-20 12:00:03', '1', '2023-10-11 07:42:01', b'0');
INSERT INTO `system_dict_data` VALUES (1350, 0, '管理员调整', '0', 'member_experience_biz_type', 0, '', '', NULL, '', '2023-08-22 12:41:01', '', '2023-08-22 12:41:01', b'0');
INSERT INTO `system_dict_data` VALUES (1351, 1, '邀新奖励', '1', 'member_experience_biz_type', 0, '', '', NULL, '', '2023-08-22 12:41:01', '', '2023-08-22 12:41:01', b'0');
INSERT INTO `system_dict_data` VALUES (1352, 11, '下单奖励', '11', 'member_experience_biz_type', 0, 'success', '', NULL, '', '2023-08-22 12:41:01', '1', '2023-10-11 07:45:09', b'0');
INSERT INTO `system_dict_data` VALUES (1353, 12, '下单奖励（整单取消）', '12', 'member_experience_biz_type', 0, 'warning', '', NULL, '', '2023-08-22 12:41:01', '1', '2023-10-11 07:45:01', b'0');
INSERT INTO `system_dict_data` VALUES (1354, 4, '签到奖励', '4', 'member_experience_biz_type', 0, '', '', NULL, '', '2023-08-22 12:41:01', '', '2023-08-22 12:41:01', b'0');
INSERT INTO `system_dict_data` VALUES (1355, 5, '抽奖奖励', '5', 'member_experience_biz_type', 0, '', '', NULL, '', '2023-08-22 12:41:01', '', '2023-08-22 12:41:01', b'0');
INSERT INTO `system_dict_data` VALUES (1356, 1, '快递发货', '1', 'trade_delivery_type', 0, '', '', '', '1', '2023-08-23 00:04:55', '1', '2023-08-23 00:04:55', b'0');
INSERT INTO `system_dict_data` VALUES (1357, 2, '用户自提', '2', 'trade_delivery_type', 0, '', '', '', '1', '2023-08-23 00:05:05', '1', '2023-08-23 00:05:05', b'0');
INSERT INTO `system_dict_data` VALUES (1358, 3, '品类劵', '3', 'promotion_product_scope', 0, 'default', '', '', '1', '2023-09-01 23:43:07', '1', '2023-09-28 00:27:47', b'0');
INSERT INTO `system_dict_data` VALUES (1359, 1, '人人分销', '1', 'brokerage_enabled_condition', 0, '', '', '所有用户都可以分销', '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', b'0');
INSERT INTO `system_dict_data` VALUES (1360, 2, '指定分销', '2', 'brokerage_enabled_condition', 0, '', '', '仅可后台手动设置推广员', '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', b'0');
INSERT INTO `system_dict_data` VALUES (1361, 1, '首次绑定', '1', 'brokerage_bind_mode', 0, '', '', '只要用户没有推广人，随时都可以绑定推广关系', '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', b'0');
INSERT INTO `system_dict_data` VALUES (1362, 2, '注册绑定', '2', 'brokerage_bind_mode', 0, '', '', '仅新用户注册时才能绑定推广关系', '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', b'0');
INSERT INTO `system_dict_data` VALUES (1363, 3, '覆盖绑定', '3', 'brokerage_bind_mode', 0, '', '', '如果用户已经有推广人，推广人会被变更', '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', b'0');
INSERT INTO `system_dict_data` VALUES (1364, 1, '钱包', '1', 'brokerage_withdraw_type', 0, '', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', b'0');
INSERT INTO `system_dict_data` VALUES (1365, 2, '银行卡', '2', 'brokerage_withdraw_type', 0, '', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', b'0');
INSERT INTO `system_dict_data` VALUES (1366, 3, '微信', '3', 'brokerage_withdraw_type', 0, '', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', b'0');
INSERT INTO `system_dict_data` VALUES (1367, 4, '支付宝', '4', 'brokerage_withdraw_type', 0, '', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', b'0');
INSERT INTO `system_dict_data` VALUES (1368, 1, '订单返佣', '1', 'brokerage_record_biz_type', 0, '', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', b'0');
INSERT INTO `system_dict_data` VALUES (1369, 2, '申请提现', '2', 'brokerage_record_biz_type', 0, '', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', b'0');
INSERT INTO `system_dict_data` VALUES (1370, 3, '申请提现驳回', '3', 'brokerage_record_biz_type', 0, '', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', b'0');
INSERT INTO `system_dict_data` VALUES (1371, 0, '待结算', '0', 'brokerage_record_status', 0, '', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', b'0');
INSERT INTO `system_dict_data` VALUES (1372, 1, '已结算', '1', 'brokerage_record_status', 0, '', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', b'0');
INSERT INTO `system_dict_data` VALUES (1373, 2, '已取消', '2', 'brokerage_record_status', 0, '', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', b'0');
INSERT INTO `system_dict_data` VALUES (1374, 0, '审核中', '0', 'brokerage_withdraw_status', 0, '', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', b'0');
INSERT INTO `system_dict_data` VALUES (1375, 10, '审核通过', '10', 'brokerage_withdraw_status', 0, 'success', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', b'0');
INSERT INTO `system_dict_data` VALUES (1376, 11, '提现成功', '11', 'brokerage_withdraw_status', 0, 'success', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', b'0');
INSERT INTO `system_dict_data` VALUES (1377, 20, '审核不通过', '20', 'brokerage_withdraw_status', 0, 'danger', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', b'0');
INSERT INTO `system_dict_data` VALUES (1378, 21, '提现失败', '21', 'brokerage_withdraw_status', 0, 'danger', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', b'0');
INSERT INTO `system_dict_data` VALUES (1379, 0, '工商银行', '0', 'brokerage_bank_name', 0, '', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', b'0');
INSERT INTO `system_dict_data` VALUES (1380, 1, '建设银行', '1', 'brokerage_bank_name', 0, '', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', b'0');
INSERT INTO `system_dict_data` VALUES (1381, 2, '农业银行', '2', 'brokerage_bank_name', 0, '', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', b'0');
INSERT INTO `system_dict_data` VALUES (1382, 3, '中国银行', '3', 'brokerage_bank_name', 0, '', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', b'0');
INSERT INTO `system_dict_data` VALUES (1383, 4, '交通银行', '4', 'brokerage_bank_name', 0, '', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', b'0');
INSERT INTO `system_dict_data` VALUES (1384, 5, '招商银行', '5', 'brokerage_bank_name', 0, '', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', b'0');
INSERT INTO `system_dict_data` VALUES (1385, 21, '钱包', 'wallet', 'pay_channel_code', 0, 'primary', '', '', '1', '2023-10-01 21:46:19', '1', '2023-10-01 21:48:01', b'0');
INSERT INTO `system_dict_data` VALUES (1386, 1, '砍价中', '1', 'promotion_bargain_record_status', 0, 'default', '', '', '1', '2023-10-05 10:41:26', '1', '2023-10-05 10:41:26', b'0');
INSERT INTO `system_dict_data` VALUES (1387, 2, '砍价成功', '2', 'promotion_bargain_record_status', 0, 'success', '', '', '1', '2023-10-05 10:41:39', '1', '2023-10-05 10:41:39', b'0');
INSERT INTO `system_dict_data` VALUES (1388, 3, '砍价失败', '3', 'promotion_bargain_record_status', 0, 'warning', '', '', '1', '2023-10-05 10:41:57', '1', '2023-10-05 10:41:57', b'0');
INSERT INTO `system_dict_data` VALUES (1389, 1, '拼团中', '1', 'promotion_combination_record_status', 0, '', '', '', '1', '2023-10-08 07:24:44', '1', '2023-10-08 07:24:44', b'0');
INSERT INTO `system_dict_data` VALUES (1390, 2, '拼团成功', '2', 'promotion_combination_record_status', 0, 'success', '', '', '1', '2023-10-08 07:24:56', '1', '2023-10-08 07:24:56', b'0');
INSERT INTO `system_dict_data` VALUES (1391, 3, '拼团失败', '3', 'promotion_combination_record_status', 0, 'warning', '', '', '1', '2023-10-08 07:25:11', '1', '2023-10-08 07:25:11', b'0');
INSERT INTO `system_dict_data` VALUES (1392, 2, '管理员修改', '2', 'member_point_biz_type', 0, 'default', '', '', '1', '2023-10-11 07:41:34', '1', '2023-10-11 07:41:34', b'0');
INSERT INTO `system_dict_data` VALUES (1393, 13, '订单积分抵扣（单个退款）', '13', 'member_point_biz_type', 0, '', '', '', '1', '2023-10-11 07:42:29', '1', '2023-10-11 07:42:29', b'0');
INSERT INTO `system_dict_data` VALUES (1394, 21, '订单积分奖励', '21', 'member_point_biz_type', 0, 'default', '', '', '1', '2023-10-11 07:42:44', '1', '2023-10-11 07:42:44', b'0');
INSERT INTO `system_dict_data` VALUES (1395, 22, '订单积分奖励（整单取消）', '22', 'member_point_biz_type', 0, 'default', '', '', '1', '2023-10-11 07:42:55', '1', '2023-10-11 07:43:01', b'0');
INSERT INTO `system_dict_data` VALUES (1396, 23, '订单积分奖励（单个退款）', '23', 'member_point_biz_type', 0, 'default', '', '', '1', '2023-10-11 07:43:16', '1', '2023-10-11 07:43:16', b'0');
INSERT INTO `system_dict_data` VALUES (1397, 13, '下单奖励（单个退款）', '13', 'member_experience_biz_type', 0, 'warning', '', '', '1', '2023-10-11 07:45:24', '1', '2023-10-11 07:45:38', b'0');
INSERT INTO `system_dict_data` VALUES (1402, 1, 'A 农、林、牧、渔业', '1', 'crm_customer_industry', 0, 'default', '', '', '1', '2023-10-28 23:02:15', '1', '2023-10-28 23:02:15', b'0');
INSERT INTO `system_dict_data` VALUES (1403, 2, 'B 采矿业', '2', 'crm_customer_industry', 0, 'default', '', '', '1', '2023-10-28 23:02:29', '1', '2023-10-28 23:02:29', b'0');
INSERT INTO `system_dict_data` VALUES (1404, 3, 'C 制造业', '3', 'crm_customer_industry', 0, 'default', '', '', '1', '2023-10-28 23:02:41', '1', '2023-10-28 23:02:41', b'0');
INSERT INTO `system_dict_data` VALUES (1405, 4, 'D 电力、热力、燃气及水生产和供应业', '4', 'crm_customer_industry', 0, 'default', '', '', '1', '2023-10-28 23:02:54', '1', '2023-10-28 23:02:54', b'0');
INSERT INTO `system_dict_data` VALUES (1406, 5, 'E 建筑业', '5', 'crm_customer_industry', 0, 'default', '', '', '1', '2023-10-28 23:03:03', '1', '2023-10-28 23:03:03', b'0');
INSERT INTO `system_dict_data` VALUES (1407, 6, 'F 批发和零售业', '6', 'crm_customer_industry', 0, 'default', '', '', '1', '2023-10-28 23:03:13', '1', '2023-10-28 23:03:13', b'0');
INSERT INTO `system_dict_data` VALUES (1408, 7, 'G 交通运输、仓储和邮政业', '7', 'crm_customer_industry', 0, 'default', '', '', '1', '2023-10-28 23:03:27', '1', '2023-10-28 23:03:27', b'0');
INSERT INTO `system_dict_data` VALUES (1409, 8, 'H 住宿和餐饮业', '8', 'crm_customer_industry', 0, 'default', '', '', '1', '2023-10-28 23:03:37', '1', '2023-10-28 23:03:37', b'0');
INSERT INTO `system_dict_data` VALUES (1410, 9, 'I 信息传输、软件和信息技术服务业', '9', 'crm_customer_industry', 0, 'default', '', '', '1', '2023-10-28 23:03:47', '1', '2023-10-28 23:03:47', b'0');
INSERT INTO `system_dict_data` VALUES (1411, 10, 'J 金融业', '10', 'crm_customer_industry', 0, 'default', '', '', '1', '2023-10-28 23:03:57', '1', '2023-10-28 23:03:57', b'0');
INSERT INTO `system_dict_data` VALUES (1412, 11, 'K 房地产业', '11', 'crm_customer_industry', 0, 'default', '', '', '1', '2023-10-28 23:04:15', '1', '2023-10-28 23:04:22', b'0');
INSERT INTO `system_dict_data` VALUES (1413, 12, 'L 租赁和商务服务业', '12', 'crm_customer_industry', 0, 'default', '', '', '1', '2023-10-28 23:04:33', '1', '2023-10-28 23:04:33', b'0');
INSERT INTO `system_dict_data` VALUES (1414, 13, 'M 科学研究和技术服务业', '13', 'crm_customer_industry', 0, 'default', '', '', '1', '2023-10-28 23:04:43', '1', '2023-10-28 23:04:43', b'0');
INSERT INTO `system_dict_data` VALUES (1415, 14, 'N 水利、环境和公共设施管理业', '14', 'crm_customer_industry', 0, 'default', '', '', '1', '2023-10-28 23:04:53', '1', '2023-10-28 23:04:53', b'0');
INSERT INTO `system_dict_data` VALUES (1416, 15, 'O 居民服务、修理和其他服务业', '15', 'crm_customer_industry', 0, 'default', '', '', '1', '2023-10-28 23:05:05', '1', '2023-10-28 23:05:05', b'0');
INSERT INTO `system_dict_data` VALUES (1417, 16, 'P 教育', '16', 'crm_customer_industry', 0, 'default', '', '', '1', '2023-10-28 23:05:15', '1', '2023-10-28 23:05:15', b'0');
INSERT INTO `system_dict_data` VALUES (1418, 17, 'Q 卫生和社会工作', '17', 'crm_customer_industry', 0, 'default', '', '', '1', '2023-10-28 23:05:44', '1', '2023-10-28 23:05:44', b'0');
INSERT INTO `system_dict_data` VALUES (1419, 18, 'R 文化、体育和娱乐业', '18', 'crm_customer_industry', 0, 'default', '', '', '1', '2023-10-28 23:05:55', '1', '2023-10-28 23:05:55', b'0');
INSERT INTO `system_dict_data` VALUES (1420, 19, 'S 公共管理、社会保障和社会组织', '19', 'crm_customer_industry', 0, 'default', '', '', '1', '2023-10-28 23:06:05', '1', '2023-10-28 23:06:05', b'0');
INSERT INTO `system_dict_data` VALUES (1421, 20, 'T 国际组织', '20', 'crm_customer_industry', 0, 'default', '', '', '1', '2023-10-28 23:06:15', '1', '2023-10-28 23:06:15', b'0');
INSERT INTO `system_dict_data` VALUES (1422, 1, 'A （重点客户）', '1', 'crm_customer_level', 0, 'primary', '', '', '1', '2023-10-28 23:07:13', '1', '2023-10-28 23:07:13', b'0');
INSERT INTO `system_dict_data` VALUES (1423, 2, 'B （普通客户）', '2', 'crm_customer_level', 0, 'info', '', '', '1', '2023-10-28 23:07:35', '1', '2023-10-28 23:07:35', b'0');
INSERT INTO `system_dict_data` VALUES (1424, 3, 'C （非优先客户）', '3', 'crm_customer_level', 0, 'default', '', '', '1', '2023-10-28 23:07:53', '1', '2023-10-28 23:07:53', b'0');
INSERT INTO `system_dict_data` VALUES (1425, 1, '促销', '1', 'crm_customer_source', 0, 'default', '', '', '1', '2023-10-28 23:08:29', '1', '2023-10-28 23:08:29', b'0');
INSERT INTO `system_dict_data` VALUES (1426, 2, '搜索引擎', '2', 'crm_customer_source', 0, 'default', '', '', '1', '2023-10-28 23:08:39', '1', '2023-10-28 23:08:39', b'0');
INSERT INTO `system_dict_data` VALUES (1427, 3, '广告', '3', 'crm_customer_source', 0, 'default', '', '', '1', '2023-10-28 23:08:47', '1', '2023-10-28 23:08:47', b'0');
INSERT INTO `system_dict_data` VALUES (1428, 4, '转介绍', '4', 'crm_customer_source', 0, 'default', '', '', '1', '2023-10-28 23:08:58', '1', '2023-10-28 23:08:58', b'0');
INSERT INTO `system_dict_data` VALUES (1429, 5, '线上注册', '5', 'crm_customer_source', 0, 'default', '', '', '1', '2023-10-28 23:09:12', '1', '2023-10-28 23:09:12', b'0');
INSERT INTO `system_dict_data` VALUES (1430, 6, '线上咨询', '6', 'crm_customer_source', 0, 'default', '', '', '1', '2023-10-28 23:09:22', '1', '2023-10-28 23:09:22', b'0');
INSERT INTO `system_dict_data` VALUES (1431, 7, '预约上门', '7', 'crm_customer_source', 0, 'default', '', '', '1', '2023-10-28 23:09:39', '1', '2023-10-28 23:09:39', b'0');
INSERT INTO `system_dict_data` VALUES (1432, 8, '陌拜', '8', 'crm_customer_source', 0, 'default', '', '', '1', '2023-10-28 23:10:04', '1', '2023-10-28 23:10:04', b'0');
INSERT INTO `system_dict_data` VALUES (1433, 9, '电话咨询', '9', 'crm_customer_source', 0, 'default', '', '', '1', '2023-10-28 23:10:18', '1', '2023-10-28 23:10:18', b'0');
INSERT INTO `system_dict_data` VALUES (1434, 10, '邮件咨询', '10', 'crm_customer_source', 0, 'default', '', '', '1', '2023-10-28 23:10:33', '1', '2023-10-28 23:10:33', b'0');
INSERT INTO `system_dict_data` VALUES (1435, 10, 'Gitee', '10', 'system_social_type', 0, '', '', '', '1', '2023-11-04 13:04:42', '1', '2023-11-04 13:04:42', b'0');
INSERT INTO `system_dict_data` VALUES (1436, 20, '钉钉', '20', 'system_social_type', 0, '', '', '', '1', '2023-11-04 13:04:54', '1', '2023-11-04 13:04:54', b'0');
INSERT INTO `system_dict_data` VALUES (1437, 30, '企业微信', '30', 'system_social_type', 0, '', '', '', '1', '2023-11-04 13:05:09', '1', '2023-11-04 13:05:09', b'0');
INSERT INTO `system_dict_data` VALUES (1438, 31, '微信公众平台', '31', 'system_social_type', 0, '', '', '', '1', '2023-11-04 13:05:18', '1', '2023-11-04 13:05:18', b'0');
INSERT INTO `system_dict_data` VALUES (1439, 32, '微信开放平台', '32', 'system_social_type', 0, '', '', '', '1', '2023-11-04 13:05:30', '1', '2023-11-04 13:05:30', b'0');
INSERT INTO `system_dict_data` VALUES (1440, 34, '微信小程序', '34', 'system_social_type', 0, '', '', '', '1', '2023-11-04 13:05:38', '1', '2023-11-04 13:07:16', b'0');
INSERT INTO `system_dict_data` VALUES (1441, 1, '上架', '1', 'crm_product_status', 0, 'success', '', '', '1', '2023-10-30 21:49:34', '1', '2023-10-30 21:49:34', b'0');
INSERT INTO `system_dict_data` VALUES (1442, 0, '下架', '0', 'crm_product_status', 0, 'success', '', '', '1', '2023-10-30 21:49:13', '1', '2023-10-30 21:49:13', b'0');
INSERT INTO `system_dict_data` VALUES (1443, 15, '子表', '15', 'infra_codegen_template_type', 0, 'default', '', '', '1', '2023-11-13 23:06:16', '1', '2023-11-13 23:06:16', b'0');
INSERT INTO `system_dict_data` VALUES (1444, 10, '主表（标准模式）', '10', 'infra_codegen_template_type', 0, 'default', '', '', '1', '2023-11-14 12:32:49', '1', '2023-11-14 12:32:49', b'0');
INSERT INTO `system_dict_data` VALUES (1445, 11, '主表（ERP 模式）', '11', 'infra_codegen_template_type', 0, 'default', '', '', '1', '2023-11-14 12:33:05', '1', '2023-11-14 12:33:05', b'0');
INSERT INTO `system_dict_data` VALUES (1446, 12, '主表（内嵌模式）', '12', 'infra_codegen_template_type', 0, '', '', '', '1', '2023-11-14 12:33:31', '1', '2023-11-14 12:33:31', b'0');
INSERT INTO `system_dict_data` VALUES (1447, 4, '钱包余额', '4', 'pay_transfer_type', 0, 'info', '', '', '1', '2023-10-28 16:28:37', '1', '2023-10-28 16:28:37', b'0');
INSERT INTO `system_dict_data` VALUES (1448, 3, '银行卡', '3', 'pay_transfer_type', 0, 'default', '', '', '1', '2023-10-28 16:28:21', '1', '2023-10-28 16:28:21', b'0');
INSERT INTO `system_dict_data` VALUES (1449, 2, '微信余额', '2', 'pay_transfer_type', 0, 'info', '', '', '1', '2023-10-28 16:28:07', '1', '2023-10-28 16:28:07', b'0');
INSERT INTO `system_dict_data` VALUES (1450, 1, '支付宝余额', '1', 'pay_transfer_type', 0, 'default', '', '', '1', '2023-10-28 16:27:44', '1', '2023-10-28 16:27:44', b'0');
INSERT INTO `system_dict_data` VALUES (1451, 4, '转账失败', '30', 'pay_transfer_status', 0, 'warning', '', '', '1', '2023-10-28 16:24:16', '1', '2023-10-28 16:24:16', b'0');
INSERT INTO `system_dict_data` VALUES (1452, 3, '转账成功', '20', 'pay_transfer_status', 0, 'success', '', '', '1', '2023-10-28 16:23:50', '1', '2023-10-28 16:23:50', b'0');
INSERT INTO `system_dict_data` VALUES (1453, 2, '转账进行中', '10', 'pay_transfer_status', 0, 'info', '', '', '1', '2023-10-28 16:23:12', '1', '2023-10-28 16:23:12', b'0');
INSERT INTO `system_dict_data` VALUES (1454, 1, '等待转账', '0', 'pay_transfer_status', 0, 'default', '', '', '1', '2023-10-28 16:21:43', '1', '2023-10-28 16:23:22', b'0');

-- ----------------------------
-- Table structure for system_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `system_dict_type`;
CREATE TABLE `system_dict_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '字典名称',
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '字典类型',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `deleted_time` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 607 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_dict_type
-- ----------------------------
INSERT INTO `system_dict_type` VALUES (1, '用户性别', 'system_user_sex', 0, NULL, 'admin', '2021-01-05 17:03:48', '1', '2022-05-16 20:29:32', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (6, '参数类型', 'infra_config_type', 0, NULL, 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:36:54', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (7, '通知类型', 'system_notice_type', 0, NULL, 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:35:26', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (9, '操作类型', 'system_operate_type', 0, NULL, 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 09:32:21', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (10, '系统状态', 'common_status', 0, NULL, 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:21:28', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (11, 'Boolean 是否类型', 'infra_boolean_string', 0, 'boolean 转是否', '', '2021-01-19 03:20:08', '', '2022-02-01 16:37:10', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (104, '登陆结果', 'system_login_result', 0, '登陆结果', '', '2021-01-18 06:17:11', '', '2022-02-01 16:36:00', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (106, '代码生成模板类型', 'infra_codegen_template_type', 0, NULL, '', '2021-02-05 07:08:06', '1', '2022-05-16 20:26:50', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (107, '定时任务状态', 'infra_job_status', 0, NULL, '', '2021-02-07 07:44:16', '', '2022-02-01 16:51:11', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (108, '定时任务日志状态', 'infra_job_log_status', 0, NULL, '', '2021-02-08 10:03:51', '', '2022-02-01 16:50:43', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (109, '用户类型', 'user_type', 0, NULL, '', '2021-02-26 00:15:51', '', '2021-02-26 00:15:51', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (110, 'API 异常数据的处理状态', 'infra_api_error_log_process_status', 0, NULL, '', '2021-02-26 07:07:01', '', '2022-02-01 16:50:53', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (111, '短信渠道编码', 'system_sms_channel_code', 0, NULL, '1', '2021-04-05 01:04:50', '1', '2022-02-16 02:09:08', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (112, '短信模板的类型', 'system_sms_template_type', 0, NULL, '1', '2021-04-05 21:50:43', '1', '2022-02-01 16:35:06', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (113, '短信发送状态', 'system_sms_send_status', 0, NULL, '1', '2021-04-11 20:18:03', '1', '2022-02-01 16:35:09', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (114, '短信接收状态', 'system_sms_receive_status', 0, NULL, '1', '2021-04-11 20:27:14', '1', '2022-02-01 16:35:14', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (115, '错误码的类型', 'system_error_code_type', 0, NULL, '1', '2021-04-21 00:06:30', '1', '2022-02-01 16:36:49', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (116, '登陆日志的类型', 'system_login_type', 0, '登陆日志的类型', '1', '2021-10-06 00:50:46', '1', '2022-02-01 16:35:56', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (117, 'OA 请假类型', 'bpm_oa_leave_type', 0, NULL, '1', '2021-09-21 22:34:33', '1', '2022-01-22 10:41:37', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (130, '支付渠道编码类型', 'pay_channel_code', 0, '支付渠道的编码', '1', '2021-12-03 10:35:08', '1', '2023-07-10 10:11:39', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (131, '支付回调状态', 'pay_notify_status', 0, '支付回调状态（包括退款回调）', '1', '2021-12-03 10:53:29', '1', '2023-07-19 18:09:43', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (132, '支付订单状态', 'pay_order_status', 0, '支付订单状态', '1', '2021-12-03 11:17:50', '1', '2021-12-03 11:17:50', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (134, '退款订单状态', 'pay_refund_status', 0, '退款订单状态', '1', '2021-12-10 16:42:50', '1', '2023-07-19 10:13:17', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (138, '流程分类', 'bpm_model_category', 0, '流程分类', '1', '2022-01-02 08:40:45', '1', '2022-01-02 08:40:45', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (139, '流程实例的状态', 'bpm_process_instance_status', 0, '流程实例的状态', '1', '2022-01-07 23:46:42', '1', '2022-01-07 23:46:42', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (140, '流程实例的结果', 'bpm_process_instance_result', 0, '流程实例的结果', '1', '2022-01-07 23:48:10', '1', '2022-01-07 23:48:10', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (141, '流程的表单类型', 'bpm_model_form_type', 0, '流程的表单类型', '103', '2022-01-11 23:50:45', '103', '2022-01-11 23:50:45', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (142, '任务分配规则的类型', 'bpm_task_assign_rule_type', 0, '任务分配规则的类型', '103', '2022-01-12 23:21:04', '103', '2022-01-12 15:46:10', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (143, '任务分配自定义脚本', 'bpm_task_assign_script', 0, '任务分配自定义脚本', '103', '2022-01-15 00:10:35', '103', '2022-01-15 00:10:35', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (144, '代码生成的场景枚举', 'infra_codegen_scene', 0, '代码生成的场景枚举', '1', '2022-02-02 13:14:45', '1', '2022-03-10 16:33:46', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (145, '角色类型', 'system_role_type', 0, '角色类型', '1', '2022-02-16 13:01:46', '1', '2022-02-16 13:01:46', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (146, '文件存储器', 'infra_file_storage', 0, '文件存储器', '1', '2022-03-15 00:24:38', '1', '2022-03-15 00:24:38', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (147, 'OAuth 2.0 授权类型', 'system_oauth2_grant_type', 0, 'OAuth 2.0 授权类型（模式）', '1', '2022-05-12 00:20:52', '1', '2022-05-11 16:25:49', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (149, '商品 SPU 状态', 'product_spu_status', 0, '商品 SPU 状态', '1', '2022-10-24 21:19:04', '1', '2022-10-24 21:19:08', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (150, '优惠类型', 'promotion_discount_type', 0, '优惠类型', '1', '2022-11-01 12:46:06', '1', '2022-11-01 12:46:06', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (151, '优惠劵模板的有限期类型', 'promotion_coupon_template_validity_type', 0, '优惠劵模板的有限期类型', '1', '2022-11-02 00:06:20', '1', '2022-11-04 00:08:26', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (152, '营销的商品范围', 'promotion_product_scope', 0, '营销的商品范围', '1', '2022-11-02 00:28:01', '1', '2022-11-02 00:28:01', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (153, '优惠劵的状态', 'promotion_coupon_status', 0, '优惠劵的状态', '1', '2022-11-04 00:14:49', '1', '2022-11-04 00:14:49', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (154, '优惠劵的领取方式', 'promotion_coupon_take_type', 0, '优惠劵的领取方式', '1', '2022-11-04 19:12:27', '1', '2022-11-04 19:12:27', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (155, '促销活动的状态', 'promotion_activity_status', 0, '促销活动的状态', '1', '2022-11-04 22:54:23', '1', '2022-11-04 22:54:23', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (156, '营销的条件类型', 'promotion_condition_type', 0, '营销的条件类型', '1', '2022-11-04 22:59:23', '1', '2022-11-04 22:59:23', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (157, '交易售后状态', 'trade_after_sale_status', 0, '交易售后状态', '1', '2022-11-19 20:52:56', '1', '2022-11-19 20:52:56', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (158, '交易售后的类型', 'trade_after_sale_type', 0, '交易售后的类型', '1', '2022-11-19 21:04:09', '1', '2022-11-19 21:04:09', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (159, '交易售后的方式', 'trade_after_sale_way', 0, '交易售后的方式', '1', '2022-11-19 21:39:04', '1', '2022-11-19 21:39:04', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (160, '终端', 'terminal', 0, '终端', '1', '2022-12-10 10:50:50', '1', '2022-12-10 10:53:11', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (161, '交易订单的类型', 'trade_order_type', 0, '交易订单的类型', '1', '2022-12-10 16:33:54', '1', '2022-12-10 16:33:54', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (162, '交易订单的状态', 'trade_order_status', 0, '交易订单的状态', '1', '2022-12-10 16:48:44', '1', '2022-12-10 16:48:44', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (163, '交易订单项的售后状态', 'trade_order_item_after_sale_status', 0, '交易订单项的售后状态', '1', '2022-12-10 20:58:08', '1', '2022-12-10 20:58:08', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (164, '公众号自动回复的请求关键字匹配模式', 'mp_auto_reply_request_match', 0, '公众号自动回复的请求关键字匹配模式', '1', '2023-01-16 23:29:56', '1', '2023-01-16 23:29:56', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (165, '公众号的消息类型', 'mp_message_type', 0, '公众号的消息类型', '1', '2023-01-17 22:17:09', '1', '2023-01-17 22:17:09', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (166, '邮件发送状态', 'system_mail_send_status', 0, '邮件发送状态', '1', '2023-01-26 09:53:13', '1', '2023-01-26 09:53:13', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (167, '站内信模版的类型', 'system_notify_template_type', 0, '站内信模版的类型', '1', '2023-01-28 10:35:10', '1', '2023-01-28 10:35:10', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (168, '代码生成的前端类型', 'infra_codegen_front_type', 0, '', '1', '2023-04-12 23:57:52', '1', '2023-04-12 23:57:52', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (169, '商品的单位', 'product_unit', 0, '商品的单位', '1', '2023-05-24 21:23:59', '1', '2023-05-24 21:23:59', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (170, '快递计费方式', 'trade_delivery_express_charge_mode', 0, '用于商城交易模块配送管理', '1', '2023-05-21 22:45:03', '1', '2023-05-21 22:45:03', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (171, '积分业务类型', 'member_point_biz_type', 0, '', '1', '2023-06-10 12:15:00', '1', '2023-06-28 13:48:20', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (173, '支付通知类型', 'pay_notify_type', 0, NULL, '1', '2023-07-20 12:23:03', '1', '2023-07-20 12:23:03', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (174, '会员经验业务类型', 'member_experience_biz_type', 0, NULL, '', '2023-08-22 12:41:01', '', '2023-08-22 12:41:01', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (175, '交易配送类型', 'trade_delivery_type', 0, '', '1', '2023-08-23 00:03:14', '1', '2023-08-23 00:03:14', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (176, '分佣模式', 'brokerage_enabled_condition', 0, NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (177, '分销关系绑定模式', 'brokerage_bind_mode', 0, NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (178, '佣金提现类型', 'brokerage_withdraw_type', 0, NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (179, '佣金记录业务类型', 'brokerage_record_biz_type', 0, NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (180, '佣金记录状态', 'brokerage_record_status', 0, NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (181, '佣金提现状态', 'brokerage_withdraw_status', 0, NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (182, '佣金提现银行', 'brokerage_bank_name', 0, NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (183, '砍价记录的状态', 'promotion_bargain_record_status', 0, '', '1', '2023-10-05 10:41:08', '1', '2023-10-05 10:41:08', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (184, '拼团记录的状态', 'promotion_combination_record_status', 0, '', '1', '2023-10-08 07:24:25', '1', '2023-10-08 07:24:25', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (186, '客户所属行业', 'crm_customer_industry', 0, 'CRM 客户所属行业', '1', '2023-10-28 22:57:07', '1', '2023-10-28 15:11:16', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (187, '客户等级', 'crm_customer_level', 0, 'CRM 客户等级', '1', '2023-10-28 22:59:12', '1', '2023-10-28 15:11:16', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (188, '客户来源', 'crm_customer_source', 0, 'CRM 客户来源', '1', '2023-10-28 23:00:34', '1', '2023-10-28 15:11:16', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (600, 'Banner 位置', 'promotion_banner_position', 0, '', '1', '2023-10-08 07:24:25', '1', '2023-11-04 13:04:02', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (601, '社交类型', 'system_social_type', 0, '', '1', '2023-11-04 13:03:54', '1', '2023-11-04 13:03:54', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (604, '产品状态', 'crm_product_status', 0, '', '1', '2023-10-30 21:47:59', '1', '2023-10-30 21:48:45', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (605, '支付转账类型', 'pay_transfer_type', 0, '', '1', '2023-10-28 16:27:18', '1', '2023-10-28 16:27:18', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (606, '转账订单状态', 'pay_transfer_status', 0, '', '1', '2023-10-28 16:18:32', '1', '2023-10-28 16:18:32', b'0', '1970-01-01 00:00:00');

-- ----------------------------
-- Table structure for system_error_code
-- ----------------------------
DROP TABLE IF EXISTS `system_error_code`;
CREATE TABLE `system_error_code`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '错误码编号',
  `type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '错误码类型',
  `application_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用名',
  `code` int(11) NOT NULL DEFAULT 0 COMMENT '错误码编码',
  `message` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '错误码错误提示',
  `memo` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5932 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '错误码表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_error_code
-- ----------------------------

-- ----------------------------
-- Table structure for system_login_log
-- ----------------------------
DROP TABLE IF EXISTS `system_login_log`;
CREATE TABLE `system_login_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `log_type` bigint(20) NOT NULL COMMENT '日志类型',
  `trace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '链路追踪编号',
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户编号',
  `user_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '用户类型',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户账号',
  `result` tinyint(4) NOT NULL COMMENT '登陆结果',
  `user_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户 IP',
  `user_agent` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '浏览器 UA',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2648 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_login_log
-- ----------------------------
INSERT INTO `system_login_log` VALUES (2647, 100, '', 1, 2, 'admin', 0, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36 Edg/119.0.0.0', NULL, '2023-11-29 14:53:33', NULL, '2023-11-29 14:53:33', b'0', 1);

-- ----------------------------
-- Table structure for system_mail_account
-- ----------------------------
DROP TABLE IF EXISTS `system_mail_account`;
CREATE TABLE `system_mail_account`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮箱',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'SMTP 服务器域名',
  `port` int(11) NOT NULL COMMENT 'SMTP 服务器端口',
  `ssl_enable` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否开启 SSL',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '邮箱账号表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_mail_account
-- ----------------------------
INSERT INTO `system_mail_account` VALUES (1, '7684413@qq.com', '7684413@qq.com', '123457', '127.0.0.1', 8080, b'0', '1', '2023-01-25 17:39:52', '1', '2023-04-12 23:04:49', b'0');
INSERT INTO `system_mail_account` VALUES (2, 'ydym_test@163.com', 'ydym_test@163.com', 'WBZTEINMIFVRYSOE', 'smtp.163.com', 465, b'1', '1', '2023-01-26 01:26:03', '1', '2023-04-12 22:39:38', b'0');
INSERT INTO `system_mail_account` VALUES (3, '76854114@qq.com', '3335', '11234', 'yunai1.cn', 466, b'0', '1', '2023-01-27 15:06:38', '1', '2023-01-27 07:08:36', b'1');
INSERT INTO `system_mail_account` VALUES (4, '7685413x@qq.com', '2', '3', '4', 5, b'1', '1', '2023-04-12 23:05:06', '1', '2023-04-12 15:05:11', b'1');

-- ----------------------------
-- Table structure for system_mail_log
-- ----------------------------
DROP TABLE IF EXISTS `system_mail_log`;
CREATE TABLE `system_mail_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户编号',
  `user_type` tinyint(4) NULL DEFAULT NULL COMMENT '用户类型',
  `to_mail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接收邮箱地址',
  `account_id` bigint(20) NOT NULL COMMENT '邮箱账号编号',
  `from_mail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发送邮箱地址',
  `template_id` bigint(20) NOT NULL COMMENT '模板编号',
  `template_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板编码',
  `template_nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '模版发送人名称',
  `template_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮件标题',
  `template_content` varchar(10240) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮件内容',
  `template_params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮件参数',
  `send_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '发送状态',
  `send_time` datetime(0) NULL DEFAULT NULL COMMENT '发送时间',
  `send_message_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发送返回的消息 ID',
  `send_exception` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发送异常',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 355 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '邮件日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_mail_log
-- ----------------------------

-- ----------------------------
-- Table structure for system_mail_template
-- ----------------------------
DROP TABLE IF EXISTS `system_mail_template`;
CREATE TABLE `system_mail_template`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板名称',
  `code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板编码',
  `account_id` bigint(20) NOT NULL COMMENT '发送的邮箱账号编号',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发送人名称',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板标题',
  `content` varchar(10240) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板内容',
  `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数数组',
  `status` tinyint(4) NOT NULL COMMENT '开启状态',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '邮件模版表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_mail_template
-- ----------------------------
INSERT INTO `system_mail_template` VALUES (13, '后台用户短信登录', 'admin-sms-login', 1, '奥特曼', '你猜我猜', '<p>您的验证码是{code}，名字是{name}</p>', '[\"code\",\"name\"]', 0, '3', '1', '2021-10-11 08:10:00', '1', '2023-01-26 23:22:05', b'0');
INSERT INTO `system_mail_template` VALUES (14, '测试模版', 'test_01', 2, '芋艿', '一个标题', '<p>你是 {key01} 吗？</p><p><br></p><p>是的话，赶紧 {key02} 一下！</p>', '[\"key01\",\"key02\"]', 0, NULL, '1', '2023-01-26 01:27:40', '1', '2023-01-27 10:32:16', b'0');
INSERT INTO `system_mail_template` VALUES (15, '3', '2', 2, '7', '4', '<p>45</p>', '[]', 1, '80', '1', '2023-01-27 15:50:35', '1', '2023-01-27 16:34:49', b'0');

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名称',
  `permission` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '权限标识',
  `type` tinyint(4) NOT NULL COMMENT '菜单类型',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '显示顺序',
  `parent_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '父菜单ID',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '路由地址',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '组件路径',
  `component_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '组件名',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '菜单状态',
  `visible` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否可见',
  `keep_alive` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否缓存',
  `always_show` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否总是显示',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2524 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu` VALUES (1, '系统管理', '', 1, 10, 0, '/system', 'system', NULL, NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (2, '基础设施', '', 1, 20, 0, '/infra', 'monitor', NULL, NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (5, 'OA 示例', '', 1, 40, 1185, 'oa', 'people', NULL, NULL, 0, b'1', b'1', b'1', 'admin', '2021-09-20 16:26:19', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (100, '用户管理', 'system:user:list', 2, 1, 1, 'user', 'user', 'system/user/index', 'SystemUser', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2023-04-08 08:31:59', b'0');
INSERT INTO `system_menu` VALUES (101, '角色管理', '', 2, 2, 1, 'role', 'peoples', 'system/role/index', 'SystemRole', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2023-04-08 08:33:59', b'0');
INSERT INTO `system_menu` VALUES (102, '菜单管理', '', 2, 3, 1, 'menu', 'tree-table', 'system/menu/index', 'SystemMenu', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2023-04-08 08:34:32', b'0');
INSERT INTO `system_menu` VALUES (103, '部门管理', '', 2, 4, 1, 'dept', 'tree', 'system/dept/index', 'SystemDept', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2023-04-08 08:35:32', b'0');
INSERT INTO `system_menu` VALUES (104, '岗位管理', '', 2, 5, 1, 'post', 'post', 'system/post/index', 'SystemPost', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2023-04-08 08:36:21', b'0');
INSERT INTO `system_menu` VALUES (105, '字典管理', '', 2, 6, 1, 'dict', 'dict', 'system/dict/index', 'SystemDictType', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2023-04-08 08:36:45', b'0');
INSERT INTO `system_menu` VALUES (106, '配置管理', '', 2, 6, 2, 'config', 'edit', 'infra/config/index', 'InfraConfig', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2023-04-08 10:31:17', b'0');
INSERT INTO `system_menu` VALUES (107, '通知公告', '', 2, 8, 1, 'notice', 'message', 'system/notice/index', 'SystemNotice', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2023-04-08 08:45:06', b'0');
INSERT INTO `system_menu` VALUES (108, '审计日志', '', 1, 9, 1, 'log', 'log', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (109, '令牌管理', '', 2, 2, 1261, 'token', 'online', 'system/oauth2/token/index', 'SystemTokenClient', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2023-04-08 08:47:41', b'0');
INSERT INTO `system_menu` VALUES (110, '定时任务', '', 2, 12, 2, 'job', 'job', 'infra/job/index', 'InfraJob', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2023-04-08 10:36:49', b'0');
INSERT INTO `system_menu` VALUES (111, 'MySQL 监控', '', 2, 9, 2, 'druid', 'druid', 'infra/druid/index', 'InfraDruid', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2023-04-08 09:09:30', b'0');
INSERT INTO `system_menu` VALUES (112, 'Java 监控', '', 2, 11, 2, 'admin-server', 'server', 'infra/server/index', 'InfraAdminServer', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2023-04-08 10:34:08', b'0');
INSERT INTO `system_menu` VALUES (113, 'Redis 监控', '', 2, 10, 2, 'redis', 'redis', 'infra/redis/index', 'InfraRedis', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2023-04-08 10:33:30', b'0');
INSERT INTO `system_menu` VALUES (114, '表单构建', 'infra:build:list', 2, 2, 2, 'build', 'build', 'infra/build/index', 'InfraBuild', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2023-04-08 09:06:12', b'0');
INSERT INTO `system_menu` VALUES (115, '代码生成', 'infra:codegen:query', 2, 1, 2, 'codegen', 'code', 'infra/codegen/index', 'InfraCodegen', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2023-04-08 09:02:24', b'0');
INSERT INTO `system_menu` VALUES (116, '系统接口', 'infra:swagger:list', 2, 3, 2, 'swagger', 'swagger', 'infra/swagger/index', 'InfraSwagger', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2023-04-08 09:11:28', b'0');
INSERT INTO `system_menu` VALUES (500, '操作日志', '', 2, 1, 108, 'operate-log', 'form', 'system/operatelog/index', 'SystemOperateLog', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2023-04-08 08:47:00', b'0');
INSERT INTO `system_menu` VALUES (501, '登录日志', '', 2, 2, 108, 'login-log', 'logininfor', 'system/loginlog/index', 'SystemLoginLog', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2023-04-08 08:46:18', b'0');
INSERT INTO `system_menu` VALUES (1001, '用户查询', 'system:user:query', 3, 1, 100, '', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1002, '用户新增', 'system:user:create', 3, 2, 100, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1003, '用户修改', 'system:user:update', 3, 3, 100, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1004, '用户删除', 'system:user:delete', 3, 4, 100, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1005, '用户导出', 'system:user:export', 3, 5, 100, '', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1006, '用户导入', 'system:user:import', 3, 6, 100, '', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1007, '重置密码', 'system:user:update-password', 3, 7, 100, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1008, '角色查询', 'system:role:query', 3, 1, 101, '', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1009, '角色新增', 'system:role:create', 3, 2, 101, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1010, '角色修改', 'system:role:update', 3, 3, 101, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1011, '角色删除', 'system:role:delete', 3, 4, 101, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1012, '角色导出', 'system:role:export', 3, 5, 101, '', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1013, '菜单查询', 'system:menu:query', 3, 1, 102, '', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1014, '菜单新增', 'system:menu:create', 3, 2, 102, '', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1015, '菜单修改', 'system:menu:update', 3, 3, 102, '', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1016, '菜单删除', 'system:menu:delete', 3, 4, 102, '', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1017, '部门查询', 'system:dept:query', 3, 1, 103, '', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1018, '部门新增', 'system:dept:create', 3, 2, 103, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1019, '部门修改', 'system:dept:update', 3, 3, 103, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1020, '部门删除', 'system:dept:delete', 3, 4, 103, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1021, '岗位查询', 'system:post:query', 3, 1, 104, '', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1022, '岗位新增', 'system:post:create', 3, 2, 104, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1023, '岗位修改', 'system:post:update', 3, 3, 104, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1024, '岗位删除', 'system:post:delete', 3, 4, 104, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1025, '岗位导出', 'system:post:export', 3, 5, 104, '', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1026, '字典查询', 'system:dict:query', 3, 1, 105, '#', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1027, '字典新增', 'system:dict:create', 3, 2, 105, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1028, '字典修改', 'system:dict:update', 3, 3, 105, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1029, '字典删除', 'system:dict:delete', 3, 4, 105, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1030, '字典导出', 'system:dict:export', 3, 5, 105, '#', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1031, '配置查询', 'infra:config:query', 3, 1, 106, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1032, '配置新增', 'infra:config:create', 3, 2, 106, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1033, '配置修改', 'infra:config:update', 3, 3, 106, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1034, '配置删除', 'infra:config:delete', 3, 4, 106, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1035, '配置导出', 'infra:config:export', 3, 5, 106, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1036, '公告查询', 'system:notice:query', 3, 1, 107, '#', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1037, '公告新增', 'system:notice:create', 3, 2, 107, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1038, '公告修改', 'system:notice:update', 3, 3, 107, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1039, '公告删除', 'system:notice:delete', 3, 4, 107, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1040, '操作查询', 'system:operate-log:query', 3, 1, 500, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1042, '日志导出', 'system:operate-log:export', 3, 2, 500, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1043, '登录查询', 'system:login-log:query', 3, 1, 501, '#', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1045, '日志导出', 'system:login-log:export', 3, 3, 501, '#', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1046, '令牌列表', 'system:oauth2-token:page', 3, 1, 109, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-05-09 23:54:42', b'0');
INSERT INTO `system_menu` VALUES (1048, '令牌删除', 'system:oauth2-token:delete', 3, 2, 109, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-05-09 23:54:53', b'0');
INSERT INTO `system_menu` VALUES (1050, '任务新增', 'infra:job:create', 3, 2, 110, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1051, '任务修改', 'infra:job:update', 3, 3, 110, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1052, '任务删除', 'infra:job:delete', 3, 4, 110, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1053, '状态修改', 'infra:job:update', 3, 5, 110, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1054, '任务导出', 'infra:job:export', 3, 7, 110, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1056, '生成修改', 'infra:codegen:update', 3, 2, 115, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1057, '生成删除', 'infra:codegen:delete', 3, 3, 115, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1058, '导入代码', 'infra:codegen:create', 3, 2, 115, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1059, '预览代码', 'infra:codegen:preview', 3, 4, 115, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1060, '生成代码', 'infra:codegen:download', 3, 5, 115, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1063, '设置角色菜单权限', 'system:permission:assign-role-menu', 3, 6, 101, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-01-06 17:53:44', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1064, '设置角色数据权限', 'system:permission:assign-role-data-scope', 3, 7, 101, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-01-06 17:56:31', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1065, '设置用户角色', 'system:permission:assign-user-role', 3, 8, 101, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-01-07 10:23:28', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1066, '获得 Redis 监控信息', 'infra:redis:get-monitor-info', 3, 1, 113, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-01-26 01:02:31', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1067, '获得 Redis Key 列表', 'infra:redis:get-key-list', 3, 2, 113, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-01-26 01:02:52', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1070, '代码生成案例', '', 1, 1, 2, 'demo', 'ep:aim', 'infra/testDemo/index', NULL, 0, b'1', b'1', b'1', '', '2021-02-06 12:42:49', '1', '2023-11-15 23:45:53', b'0');
INSERT INTO `system_menu` VALUES (1075, '任务触发', 'infra:job:trigger', 3, 8, 110, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-02-07 13:03:10', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1076, '数据库文档', '', 2, 4, 2, 'db-doc', 'table', 'infra/dbDoc/index', 'InfraDBDoc', 0, b'1', b'1', b'1', '', '2021-02-08 01:41:47', '1', '2023-04-08 09:13:38', b'0');
INSERT INTO `system_menu` VALUES (1077, '监控平台', '', 2, 13, 2, 'skywalking', 'eye-open', 'infra/skywalking/index', 'InfraSkyWalking', 0, b'1', b'1', b'1', '', '2021-02-08 20:41:31', '1', '2023-04-08 10:39:06', b'0');
INSERT INTO `system_menu` VALUES (1078, '访问日志', '', 2, 1, 1083, 'api-access-log', 'log', 'infra/apiAccessLog/index', 'InfraApiAccessLog', 0, b'1', b'1', b'1', '', '2021-02-26 01:32:59', '1', '2023-04-08 10:31:34', b'0');
INSERT INTO `system_menu` VALUES (1082, '日志导出', 'infra:api-access-log:export', 3, 2, 1078, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-02-26 01:32:59', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1083, 'API 日志', '', 2, 8, 2, 'log', 'log', NULL, NULL, 0, b'1', b'1', b'1', '', '2021-02-26 02:18:24', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1084, '错误日志', 'infra:api-error-log:query', 2, 2, 1083, 'api-error-log', 'log', 'infra/apiErrorLog/index', 'InfraApiErrorLog', 0, b'1', b'1', b'1', '', '2021-02-26 07:53:20', '1', '2023-04-08 10:32:25', b'0');
INSERT INTO `system_menu` VALUES (1085, '日志处理', 'infra:api-error-log:update-status', 3, 2, 1084, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-02-26 07:53:20', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1086, '日志导出', 'infra:api-error-log:export', 3, 3, 1084, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-02-26 07:53:20', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1087, '任务查询', 'infra:job:query', 3, 1, 110, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2021-03-10 01:26:19', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1088, '日志查询', 'infra:api-access-log:query', 3, 1, 1078, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2021-03-10 01:28:04', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1089, '日志查询', 'infra:api-error-log:query', 3, 1, 1084, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2021-03-10 01:29:09', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1090, '文件列表', '', 2, 5, 1243, 'file', 'upload', 'infra/file/index', 'InfraFile', 0, b'1', b'1', b'1', '', '2021-03-12 20:16:20', '1', '2023-04-08 09:21:31', b'0');
INSERT INTO `system_menu` VALUES (1091, '文件查询', 'infra:file:query', 3, 1, 1090, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-03-12 20:16:20', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1092, '文件删除', 'infra:file:delete', 3, 4, 1090, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-03-12 20:16:20', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1093, '短信管理', '', 1, 11, 1, 'sms', 'validCode', NULL, NULL, 0, b'1', b'1', b'1', '1', '2021-04-05 01:10:16', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1094, '短信渠道', '', 2, 0, 1093, 'sms-channel', 'phone', 'system/sms/channel/index', 'SystemSmsChannel', 0, b'1', b'1', b'1', '', '2021-04-01 11:07:15', '1', '2023-04-08 08:50:41', b'0');
INSERT INTO `system_menu` VALUES (1095, '短信渠道查询', 'system:sms-channel:query', 3, 1, 1094, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-01 11:07:15', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1096, '短信渠道创建', 'system:sms-channel:create', 3, 2, 1094, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-01 11:07:15', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1097, '短信渠道更新', 'system:sms-channel:update', 3, 3, 1094, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-01 11:07:15', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1098, '短信渠道删除', 'system:sms-channel:delete', 3, 4, 1094, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-01 11:07:15', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1100, '短信模板', '', 2, 1, 1093, 'sms-template', 'phone', 'system/sms/template/index', 'SystemSmsTemplate', 0, b'1', b'1', b'1', '', '2021-04-01 17:35:17', '1', '2023-04-08 08:50:50', b'0');
INSERT INTO `system_menu` VALUES (1101, '短信模板查询', 'system:sms-template:query', 3, 1, 1100, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-01 17:35:17', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1102, '短信模板创建', 'system:sms-template:create', 3, 2, 1100, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-01 17:35:17', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1103, '短信模板更新', 'system:sms-template:update', 3, 3, 1100, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-01 17:35:17', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1104, '短信模板删除', 'system:sms-template:delete', 3, 4, 1100, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-01 17:35:17', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1105, '短信模板导出', 'system:sms-template:export', 3, 5, 1100, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-01 17:35:17', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1106, '发送测试短信', 'system:sms-template:send-sms', 3, 6, 1100, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2021-04-11 00:26:40', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1107, '短信日志', '', 2, 2, 1093, 'sms-log', 'phone', 'system/sms/log/index', 'SystemSmsLog', 0, b'1', b'1', b'1', '', '2021-04-11 08:37:05', '1', '2023-04-08 08:50:58', b'0');
INSERT INTO `system_menu` VALUES (1108, '短信日志查询', 'system:sms-log:query', 3, 1, 1107, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-11 08:37:05', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1109, '短信日志导出', 'system:sms-log:export', 3, 5, 1107, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-11 08:37:05', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1110, '错误码管理', '', 2, 12, 1, 'error-code', 'code', 'system/errorCode/index', 'SystemErrorCode', 0, b'1', b'1', b'1', '', '2021-04-13 21:46:42', '1', '2023-04-08 09:01:15', b'0');
INSERT INTO `system_menu` VALUES (1111, '错误码查询', 'system:error-code:query', 3, 1, 1110, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-13 21:46:42', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1112, '错误码创建', 'system:error-code:create', 3, 2, 1110, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-13 21:46:42', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1113, '错误码更新', 'system:error-code:update', 3, 3, 1110, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-13 21:46:42', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1114, '错误码删除', 'system:error-code:delete', 3, 4, 1110, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-13 21:46:42', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1115, '错误码导出', 'system:error-code:export', 3, 5, 1110, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-13 21:46:42', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1117, '支付管理', '', 1, 30, 0, '/pay', 'money', NULL, NULL, 0, b'1', b'1', b'1', '1', '2021-12-25 16:43:41', '1', '2022-12-10 16:33:19', b'0');
INSERT INTO `system_menu` VALUES (1118, '请假查询', '', 2, 0, 5, 'leave', 'user', 'bpm/oa/leave/index', 'BpmOALeave', 0, b'1', b'1', b'1', '', '2021-09-20 08:51:03', '1', '2023-04-08 11:30:40', b'0');
INSERT INTO `system_menu` VALUES (1119, '请假申请查询', 'bpm:oa-leave:query', 3, 1, 1118, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-09-20 08:51:03', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1120, '请假申请创建', 'bpm:oa-leave:create', 3, 2, 1118, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-09-20 08:51:03', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1126, '应用信息', '', 2, 1, 1117, 'app', 'table', 'pay/app/index', 'PayApp', 0, b'1', b'1', b'1', '', '2021-11-10 01:13:30', '1', '2023-07-20 12:13:32', b'0');
INSERT INTO `system_menu` VALUES (1127, '支付应用信息查询', 'pay:app:query', 3, 1, 1126, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-11-10 01:13:31', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1128, '支付应用信息创建', 'pay:app:create', 3, 2, 1126, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-11-10 01:13:31', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1129, '支付应用信息更新', 'pay:app:update', 3, 3, 1126, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-11-10 01:13:31', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1130, '支付应用信息删除', 'pay:app:delete', 3, 4, 1126, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-11-10 01:13:31', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1132, '秘钥解析', 'pay:channel:parsing', 3, 6, 1129, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2021-11-08 15:15:47', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1133, '支付商户信息查询', 'pay:merchant:query', 3, 1, 1132, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-11-10 01:13:41', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1134, '支付商户信息创建', 'pay:merchant:create', 3, 2, 1132, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-11-10 01:13:41', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1135, '支付商户信息更新', 'pay:merchant:update', 3, 3, 1132, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-11-10 01:13:41', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1136, '支付商户信息删除', 'pay:merchant:delete', 3, 4, 1132, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-11-10 01:13:41', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1137, '支付商户信息导出', 'pay:merchant:export', 3, 5, 1132, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-11-10 01:13:41', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1138, '租户列表', '', 2, 0, 1224, 'list', 'peoples', 'system/tenant/index', 'SystemTenant', 0, b'1', b'1', b'1', '', '2021-12-14 12:31:43', '1', '2023-04-08 08:29:08', b'0');
INSERT INTO `system_menu` VALUES (1139, '租户查询', 'system:tenant:query', 3, 1, 1138, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-14 12:31:44', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1140, '租户创建', 'system:tenant:create', 3, 2, 1138, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-14 12:31:44', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1141, '租户更新', 'system:tenant:update', 3, 3, 1138, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-14 12:31:44', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1142, '租户删除', 'system:tenant:delete', 3, 4, 1138, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-14 12:31:44', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1143, '租户导出', 'system:tenant:export', 3, 5, 1138, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-14 12:31:44', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1150, '秘钥解析', '', 3, 6, 1129, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2021-11-08 15:15:47', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1161, '退款订单', '', 2, 3, 1117, 'refund', 'order', 'pay/refund/index', 'PayRefund', 0, b'1', b'1', b'1', '', '2021-12-25 08:29:07', '1', '2023-04-08 10:46:02', b'0');
INSERT INTO `system_menu` VALUES (1162, '退款订单查询', 'pay:refund:query', 3, 1, 1161, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-25 08:29:07', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1163, '退款订单创建', 'pay:refund:create', 3, 2, 1161, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-25 08:29:07', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1164, '退款订单更新', 'pay:refund:update', 3, 3, 1161, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-25 08:29:07', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1165, '退款订单删除', 'pay:refund:delete', 3, 4, 1161, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-25 08:29:07', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1166, '退款订单导出', 'pay:refund:export', 3, 5, 1161, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-25 08:29:07', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1173, '支付订单', '', 2, 2, 1117, 'order', 'pay', 'pay/order/index', 'PayOrder', 0, b'1', b'1', b'1', '', '2021-12-25 08:49:43', '1', '2023-04-08 10:43:37', b'0');
INSERT INTO `system_menu` VALUES (1174, '支付订单查询', 'pay:order:query', 3, 1, 1173, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-25 08:49:43', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1175, '支付订单创建', 'pay:order:create', 3, 2, 1173, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-25 08:49:43', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1176, '支付订单更新', 'pay:order:update', 3, 3, 1173, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-25 08:49:43', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1177, '支付订单删除', 'pay:order:delete', 3, 4, 1173, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-25 08:49:43', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1178, '支付订单导出', 'pay:order:export', 3, 5, 1173, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-25 08:49:43', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1185, '工作流程', '', 1, 50, 0, '/bpm', 'tool', NULL, NULL, 0, b'1', b'1', b'1', '1', '2021-12-30 20:26:36', '103', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1186, '流程管理', '', 1, 10, 1185, 'manager', 'nested', NULL, NULL, 0, b'1', b'1', b'1', '1', '2021-12-30 20:28:30', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1187, '流程表单', '', 2, 0, 1186, 'form', 'form', 'bpm/form/index', 'BpmForm', 0, b'1', b'1', b'1', '', '2021-12-30 12:38:22', '1', '2023-04-08 10:50:37', b'0');
INSERT INTO `system_menu` VALUES (1188, '表单查询', 'bpm:form:query', 3, 1, 1187, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-30 12:38:22', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1189, '表单创建', 'bpm:form:create', 3, 2, 1187, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-30 12:38:22', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1190, '表单更新', 'bpm:form:update', 3, 3, 1187, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-30 12:38:22', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1191, '表单删除', 'bpm:form:delete', 3, 4, 1187, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-30 12:38:22', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1192, '表单导出', 'bpm:form:export', 3, 5, 1187, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-30 12:38:22', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1193, '流程模型', '', 2, 5, 1186, 'model', 'guide', 'bpm/model/index', 'BpmModel', 0, b'1', b'1', b'1', '1', '2021-12-31 23:24:58', '1', '2023-04-08 10:53:38', b'0');
INSERT INTO `system_menu` VALUES (1194, '模型查询', 'bpm:model:query', 3, 1, 1193, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2022-01-03 19:01:10', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1195, '模型创建', 'bpm:model:create', 3, 2, 1193, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2022-01-03 19:01:24', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1196, '模型导入', 'bpm:model:import', 3, 3, 1193, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2022-01-03 19:01:35', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1197, '模型更新', 'bpm:model:update', 3, 4, 1193, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2022-01-03 19:02:28', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1198, '模型删除', 'bpm:model:delete', 3, 5, 1193, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2022-01-03 19:02:43', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1199, '模型发布', 'bpm:model:deploy', 3, 6, 1193, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2022-01-03 19:03:24', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1200, '任务管理', '', 1, 20, 1185, 'task', 'cascader', NULL, NULL, 0, b'1', b'1', b'1', '1', '2022-01-07 23:51:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1201, '我的流程', '', 2, 0, 1200, 'my', 'people', 'bpm/processInstance/index', 'BpmProcessInstance', 0, b'1', b'1', b'1', '', '2022-01-07 15:53:44', '1', '2023-04-08 11:16:55', b'0');
INSERT INTO `system_menu` VALUES (1202, '流程实例的查询', 'bpm:process-instance:query', 3, 1, 1201, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-01-07 15:53:44', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1207, '待办任务', '', 2, 10, 1200, 'todo', 'eye-open', 'bpm/task/todo/index', 'BpmTodoTask', 0, b'1', b'1', b'1', '1', '2022-01-08 10:33:37', '1', '2023-04-08 11:29:08', b'0');
INSERT INTO `system_menu` VALUES (1208, '已办任务', '', 2, 20, 1200, 'done', 'eye', 'bpm/task/done/index', 'BpmDoneTask', 0, b'1', b'1', b'1', '1', '2022-01-08 10:34:13', '1', '2023-04-08 11:29:00', b'0');
INSERT INTO `system_menu` VALUES (1209, '用户分组', '', 2, 2, 1186, 'user-group', 'people', 'bpm/group/index', 'BpmUserGroup', 0, b'1', b'1', b'1', '', '2022-01-14 02:14:20', '1', '2023-04-08 10:51:06', b'0');
INSERT INTO `system_menu` VALUES (1210, '用户组查询', 'bpm:user-group:query', 3, 1, 1209, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-01-14 02:14:20', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1211, '用户组创建', 'bpm:user-group:create', 3, 2, 1209, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-01-14 02:14:20', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1212, '用户组更新', 'bpm:user-group:update', 3, 3, 1209, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-01-14 02:14:20', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1213, '用户组删除', 'bpm:user-group:delete', 3, 4, 1209, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-01-14 02:14:20', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1215, '流程定义查询', 'bpm:process-definition:query', 3, 10, 1193, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2022-01-23 00:21:43', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1216, '流程任务分配规则查询', 'bpm:task-assign-rule:query', 3, 20, 1193, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2022-01-23 00:26:53', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1217, '流程任务分配规则创建', 'bpm:task-assign-rule:create', 3, 21, 1193, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2022-01-23 00:28:15', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1218, '流程任务分配规则更新', 'bpm:task-assign-rule:update', 3, 22, 1193, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2022-01-23 00:28:41', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1219, '流程实例的创建', 'bpm:process-instance:create', 3, 2, 1201, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2022-01-23 00:36:15', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1220, '流程实例的取消', 'bpm:process-instance:cancel', 3, 3, 1201, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2022-01-23 00:36:33', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1221, '流程任务的查询', 'bpm:task:query', 3, 1, 1207, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2022-01-23 00:38:52', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1222, '流程任务的更新', 'bpm:task:update', 3, 2, 1207, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2022-01-23 00:39:24', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1224, '租户管理', '', 2, 0, 1, 'tenant', 'peoples', NULL, NULL, 0, b'1', b'1', b'1', '1', '2022-02-20 01:41:13', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1225, '租户套餐', '', 2, 0, 1224, 'package', 'eye', 'system/tenantPackage/index', 'SystemTenantPackage', 0, b'1', b'1', b'1', '', '2022-02-19 17:44:06', '1', '2023-04-08 08:17:08', b'0');
INSERT INTO `system_menu` VALUES (1226, '租户套餐查询', 'system:tenant-package:query', 3, 1, 1225, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-02-19 17:44:06', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1227, '租户套餐创建', 'system:tenant-package:create', 3, 2, 1225, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-02-19 17:44:06', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1228, '租户套餐更新', 'system:tenant-package:update', 3, 3, 1225, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-02-19 17:44:06', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1229, '租户套餐删除', 'system:tenant-package:delete', 3, 4, 1225, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-02-19 17:44:06', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1237, '文件配置', '', 2, 0, 1243, 'file-config', 'config', 'infra/fileConfig/index', 'InfraFileConfig', 0, b'1', b'1', b'1', '', '2022-03-15 14:35:28', '1', '2023-04-08 09:16:05', b'0');
INSERT INTO `system_menu` VALUES (1238, '文件配置查询', 'infra:file-config:query', 3, 1, 1237, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-03-15 14:35:28', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1239, '文件配置创建', 'infra:file-config:create', 3, 2, 1237, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-03-15 14:35:28', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1240, '文件配置更新', 'infra:file-config:update', 3, 3, 1237, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-03-15 14:35:28', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1241, '文件配置删除', 'infra:file-config:delete', 3, 4, 1237, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-03-15 14:35:28', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1242, '文件配置导出', 'infra:file-config:export', 3, 5, 1237, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-03-15 14:35:28', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1243, '文件管理', '', 2, 5, 2, 'file', 'download', NULL, '', 0, b'1', b'1', b'1', '1', '2022-03-16 23:47:40', '1', '2023-02-10 13:47:46', b'0');
INSERT INTO `system_menu` VALUES (1247, '敏感词管理', '', 2, 13, 1, 'sensitive-word', 'education', 'system/sensitiveWord/index', 'SystemSensitiveWord', 0, b'1', b'1', b'1', '', '2022-04-07 16:55:03', '1', '2023-04-08 09:00:40', b'0');
INSERT INTO `system_menu` VALUES (1248, '敏感词查询', 'system:sensitive-word:query', 3, 1, 1247, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-04-07 16:55:03', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1249, '敏感词创建', 'system:sensitive-word:create', 3, 2, 1247, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-04-07 16:55:03', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1250, '敏感词更新', 'system:sensitive-word:update', 3, 3, 1247, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-04-07 16:55:03', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1251, '敏感词删除', 'system:sensitive-word:delete', 3, 4, 1247, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-04-07 16:55:03', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1252, '敏感词导出', 'system:sensitive-word:export', 3, 5, 1247, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-04-07 16:55:03', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1254, '作者动态', '', 1, 0, 0, 'https://www.iocoder.cn', 'people', NULL, NULL, 0, b'1', b'1', b'1', '1', '2022-04-23 01:03:15', '1', '2023-02-10 00:06:52', b'0');
INSERT INTO `system_menu` VALUES (1255, '数据源配置', '', 2, 1, 2, 'data-source-config', 'rate', 'infra/dataSourceConfig/index', 'InfraDataSourceConfig', 0, b'1', b'1', b'1', '', '2022-04-27 14:37:32', '1', '2023-04-08 09:05:21', b'0');
INSERT INTO `system_menu` VALUES (1256, '数据源配置查询', 'infra:data-source-config:query', 3, 1, 1255, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-04-27 14:37:32', '', '2022-04-27 14:37:32', b'0');
INSERT INTO `system_menu` VALUES (1257, '数据源配置创建', 'infra:data-source-config:create', 3, 2, 1255, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-04-27 14:37:32', '', '2022-04-27 14:37:32', b'0');
INSERT INTO `system_menu` VALUES (1258, '数据源配置更新', 'infra:data-source-config:update', 3, 3, 1255, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-04-27 14:37:32', '', '2022-04-27 14:37:32', b'0');
INSERT INTO `system_menu` VALUES (1259, '数据源配置删除', 'infra:data-source-config:delete', 3, 4, 1255, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-04-27 14:37:32', '', '2022-04-27 14:37:32', b'0');
INSERT INTO `system_menu` VALUES (1260, '数据源配置导出', 'infra:data-source-config:export', 3, 5, 1255, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-04-27 14:37:32', '', '2022-04-27 14:37:32', b'0');
INSERT INTO `system_menu` VALUES (1261, 'OAuth 2.0', '', 1, 10, 1, 'oauth2', 'people', NULL, NULL, 0, b'1', b'1', b'1', '1', '2022-05-09 23:38:17', '1', '2022-05-11 23:51:46', b'0');
INSERT INTO `system_menu` VALUES (1263, '应用管理', '', 2, 0, 1261, 'oauth2/application', 'tool', 'system/oauth2/client/index', 'SystemOAuth2Client', 0, b'1', b'1', b'1', '', '2022-05-10 16:26:33', '1', '2023-04-08 08:47:31', b'0');
INSERT INTO `system_menu` VALUES (1264, '客户端查询', 'system:oauth2-client:query', 3, 1, 1263, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-05-10 16:26:33', '1', '2022-05-11 00:31:06', b'0');
INSERT INTO `system_menu` VALUES (1265, '客户端创建', 'system:oauth2-client:create', 3, 2, 1263, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-05-10 16:26:33', '1', '2022-05-11 00:31:23', b'0');
INSERT INTO `system_menu` VALUES (1266, '客户端更新', 'system:oauth2-client:update', 3, 3, 1263, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-05-10 16:26:33', '1', '2022-05-11 00:31:28', b'0');
INSERT INTO `system_menu` VALUES (1267, '客户端删除', 'system:oauth2-client:delete', 3, 4, 1263, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-05-10 16:26:33', '1', '2022-05-11 00:31:33', b'0');
INSERT INTO `system_menu` VALUES (1281, '报表管理', '', 1, 40, 0, '/report', 'chart', NULL, NULL, 0, b'1', b'1', b'1', '1', '2022-07-10 20:22:15', '1', '2023-02-07 17:16:40', b'0');
INSERT INTO `system_menu` VALUES (1282, '报表设计器', '', 2, 1, 1281, 'jimu-report', 'example', 'report/jmreport/index', 'GoView', 0, b'1', b'1', b'1', '1', '2022-07-10 20:26:36', '1', '2023-04-08 10:47:59', b'0');
INSERT INTO `system_menu` VALUES (2000, '商品中心', '', 1, 60, 2362, 'product', 'fa:product-hunt', NULL, NULL, 0, b'1', b'1', b'1', '', '2022-07-29 15:53:53', '1', '2023-09-30 11:52:36', b'0');
INSERT INTO `system_menu` VALUES (2002, '商品分类', '', 2, 2, 2000, 'category', 'ep:cellphone', 'mall/product/category/index', 'ProductCategory', 0, b'1', b'1', b'1', '', '2022-07-29 15:53:53', '1', '2023-08-21 10:27:15', b'0');
INSERT INTO `system_menu` VALUES (2003, '分类查询', 'product:category:query', 3, 1, 2002, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-07-29 15:53:53', '', '2022-07-29 15:53:53', b'0');
INSERT INTO `system_menu` VALUES (2004, '分类创建', 'product:category:create', 3, 2, 2002, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-07-29 15:53:53', '', '2022-07-29 15:53:53', b'0');
INSERT INTO `system_menu` VALUES (2005, '分类更新', 'product:category:update', 3, 3, 2002, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-07-29 15:53:53', '', '2022-07-29 15:53:53', b'0');
INSERT INTO `system_menu` VALUES (2006, '分类删除', 'product:category:delete', 3, 4, 2002, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-07-29 15:53:53', '', '2022-07-29 15:53:53', b'0');
INSERT INTO `system_menu` VALUES (2008, '商品品牌', '', 2, 3, 2000, 'brand', 'ep:chicken', 'mall/product/brand/index', 'ProductBrand', 0, b'1', b'1', b'1', '', '2022-07-30 13:52:44', '1', '2023-08-21 10:27:28', b'0');
INSERT INTO `system_menu` VALUES (2009, '品牌查询', 'product:brand:query', 3, 1, 2008, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-07-30 13:52:44', '', '2022-07-30 13:52:44', b'0');
INSERT INTO `system_menu` VALUES (2010, '品牌创建', 'product:brand:create', 3, 2, 2008, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-07-30 13:52:44', '', '2022-07-30 13:52:44', b'0');
INSERT INTO `system_menu` VALUES (2011, '品牌更新', 'product:brand:update', 3, 3, 2008, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-07-30 13:52:44', '', '2022-07-30 13:52:44', b'0');
INSERT INTO `system_menu` VALUES (2012, '品牌删除', 'product:brand:delete', 3, 4, 2008, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-07-30 13:52:44', '', '2022-07-30 13:52:44', b'0');
INSERT INTO `system_menu` VALUES (2014, '商品列表', '', 2, 1, 2000, 'spu', 'ep:apple', 'mall/product/spu/index', 'ProductSpu', 0, b'1', b'1', b'1', '', '2022-07-30 14:22:58', '1', '2023-08-21 10:27:01', b'0');
INSERT INTO `system_menu` VALUES (2015, '商品查询', 'product:spu:query', 3, 1, 2014, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-07-30 14:22:58', '', '2022-07-30 14:22:58', b'0');
INSERT INTO `system_menu` VALUES (2016, '商品创建', 'product:spu:create', 3, 2, 2014, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-07-30 14:22:58', '', '2022-07-30 14:22:58', b'0');
INSERT INTO `system_menu` VALUES (2017, '商品更新', 'product:spu:update', 3, 3, 2014, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-07-30 14:22:58', '', '2022-07-30 14:22:58', b'0');
INSERT INTO `system_menu` VALUES (2018, '商品删除', 'product:spu:delete', 3, 4, 2014, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-07-30 14:22:58', '', '2022-07-30 14:22:58', b'0');
INSERT INTO `system_menu` VALUES (2019, '商品属性', '', 2, 4, 2000, 'property', 'ep:cold-drink', 'mall/product/property/index', 'ProductProperty', 0, b'1', b'1', b'1', '', '2022-08-01 14:55:35', '1', '2023-08-26 11:01:05', b'0');
INSERT INTO `system_menu` VALUES (2020, '规格查询', 'product:property:query', 3, 1, 2019, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-08-01 14:55:35', '', '2022-12-12 20:26:24', b'0');
INSERT INTO `system_menu` VALUES (2021, '规格创建', 'product:property:create', 3, 2, 2019, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-08-01 14:55:35', '', '2022-12-12 20:26:30', b'0');
INSERT INTO `system_menu` VALUES (2022, '规格更新', 'product:property:update', 3, 3, 2019, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-08-01 14:55:35', '', '2022-12-12 20:26:33', b'0');
INSERT INTO `system_menu` VALUES (2023, '规格删除', 'product:property:delete', 3, 4, 2019, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-08-01 14:55:35', '', '2022-12-12 20:26:37', b'0');
INSERT INTO `system_menu` VALUES (2025, 'Banner', '', 2, 100, 2387, 'banner', 'fa:bandcamp', 'mall/promotion/banner/index', NULL, 0, b'1', b'1', b'1', '', '2022-08-01 14:56:14', '1', '2023-10-24 20:20:06', b'0');
INSERT INTO `system_menu` VALUES (2026, 'Banner查询', 'promotion:banner:query', 3, 1, 2025, '', '', '', '', 0, b'1', b'1', b'1', '', '2022-08-01 14:56:14', '1', '2023-10-24 20:20:18', b'0');
INSERT INTO `system_menu` VALUES (2027, 'Banner创建', 'promotion:banner:create', 3, 2, 2025, '', '', '', '', 0, b'1', b'1', b'1', '', '2022-08-01 14:56:14', '1', '2023-10-24 20:20:23', b'0');
INSERT INTO `system_menu` VALUES (2028, 'Banner更新', 'promotion:banner:update', 3, 3, 2025, '', '', '', '', 0, b'1', b'1', b'1', '', '2022-08-01 14:56:14', '1', '2023-10-24 20:20:28', b'0');
INSERT INTO `system_menu` VALUES (2029, 'Banner删除', 'promotion:banner:delete', 3, 4, 2025, '', '', '', '', 0, b'1', b'1', b'1', '', '2022-08-01 14:56:14', '1', '2023-10-24 20:20:36', b'0');
INSERT INTO `system_menu` VALUES (2030, '营销中心', '', 1, 70, 2362, 'promotion', 'ep:present', NULL, NULL, 0, b'1', b'1', b'1', '1', '2022-10-31 21:25:09', '1', '2023-09-30 11:54:27', b'0');
INSERT INTO `system_menu` VALUES (2032, '优惠劵列表', '', 2, 1, 2365, 'template', 'ep:discount', 'mall/promotion/coupon/template/index', 'PromotionCouponTemplate', 0, b'1', b'1', b'1', '', '2022-10-31 22:27:14', '1', '2023-10-03 12:40:06', b'0');
INSERT INTO `system_menu` VALUES (2033, '优惠劵模板查询', 'promotion:coupon-template:query', 3, 1, 2032, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-10-31 22:27:14', '', '2022-10-31 22:27:14', b'0');
INSERT INTO `system_menu` VALUES (2034, '优惠劵模板创建', 'promotion:coupon-template:create', 3, 2, 2032, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-10-31 22:27:14', '', '2022-10-31 22:27:14', b'0');
INSERT INTO `system_menu` VALUES (2035, '优惠劵模板更新', 'promotion:coupon-template:update', 3, 3, 2032, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-10-31 22:27:14', '', '2022-10-31 22:27:14', b'0');
INSERT INTO `system_menu` VALUES (2036, '优惠劵模板删除', 'promotion:coupon-template:delete', 3, 4, 2032, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-10-31 22:27:14', '', '2022-10-31 22:27:14', b'0');
INSERT INTO `system_menu` VALUES (2038, '领取记录', '', 2, 2, 2365, 'list', 'ep:collection-tag', 'mall/promotion/coupon/index', 'PromotionCoupon', 0, b'1', b'1', b'1', '', '2022-11-03 23:21:31', '1', '2023-10-03 12:55:30', b'0');
INSERT INTO `system_menu` VALUES (2039, '优惠劵查询', 'promotion:coupon:query', 3, 1, 2038, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-11-03 23:21:31', '', '2022-11-03 23:21:31', b'0');
INSERT INTO `system_menu` VALUES (2040, '优惠劵删除', 'promotion:coupon:delete', 3, 4, 2038, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-11-03 23:21:31', '', '2022-11-03 23:21:31', b'0');
INSERT INTO `system_menu` VALUES (2041, '满减送', '', 2, 10, 2390, 'reward-activity', 'ep:goblet-square-full', 'mall/promotion/rewardActivity/index', 'PromotionRewardActivity', 0, b'1', b'1', b'1', '', '2022-11-04 23:47:49', '1', '2023-10-21 19:24:46', b'0');
INSERT INTO `system_menu` VALUES (2042, '满减送活动查询', 'promotion:reward-activity:query', 3, 1, 2041, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-11-04 23:47:49', '', '2022-11-04 23:47:49', b'0');
INSERT INTO `system_menu` VALUES (2043, '满减送活动创建', 'promotion:reward-activity:create', 3, 2, 2041, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-11-04 23:47:49', '', '2022-11-04 23:47:49', b'0');
INSERT INTO `system_menu` VALUES (2044, '满减送活动更新', 'promotion:reward-activity:update', 3, 3, 2041, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-11-04 23:47:50', '', '2022-11-04 23:47:50', b'0');
INSERT INTO `system_menu` VALUES (2045, '满减送活动删除', 'promotion:reward-activity:delete', 3, 4, 2041, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-11-04 23:47:50', '', '2022-11-04 23:47:50', b'0');
INSERT INTO `system_menu` VALUES (2046, '满减送活动关闭', 'promotion:reward-activity:close', 3, 5, 2041, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2022-11-05 10:42:53', '1', '2022-11-05 10:42:53', b'0');
INSERT INTO `system_menu` VALUES (2047, '限时折扣', '', 2, 7, 2390, 'discount-activity', 'ep:timer', 'mall/promotion/discountActivity/index', 'PromotionDiscountActivity', 0, b'1', b'1', b'1', '', '2022-11-05 17:12:15', '1', '2023-10-21 19:24:21', b'0');
INSERT INTO `system_menu` VALUES (2048, '限时折扣活动查询', 'promotion:discount-activity:query', 3, 1, 2047, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-11-05 17:12:15', '', '2022-11-05 17:12:15', b'0');
INSERT INTO `system_menu` VALUES (2049, '限时折扣活动创建', 'promotion:discount-activity:create', 3, 2, 2047, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-11-05 17:12:15', '', '2022-11-05 17:12:15', b'0');
INSERT INTO `system_menu` VALUES (2050, '限时折扣活动更新', 'promotion:discount-activity:update', 3, 3, 2047, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-11-05 17:12:16', '', '2022-11-05 17:12:16', b'0');
INSERT INTO `system_menu` VALUES (2051, '限时折扣活动删除', 'promotion:discount-activity:delete', 3, 4, 2047, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-11-05 17:12:16', '', '2022-11-05 17:12:16', b'0');
INSERT INTO `system_menu` VALUES (2052, '限时折扣活动关闭', 'promotion:discount-activity:close', 3, 5, 2047, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-11-05 17:12:16', '', '2022-11-05 17:12:16', b'0');
INSERT INTO `system_menu` VALUES (2059, '秒杀商品', '', 2, 2, 2209, 'activity', 'ep:basketball', 'mall/promotion/seckill/activity/index', 'PromotionSeckillActivity', 0, b'1', b'1', b'1', '', '2022-11-06 22:24:49', '1', '2023-06-24 18:57:25', b'0');
INSERT INTO `system_menu` VALUES (2060, '秒杀活动查询', 'promotion:seckill-activity:query', 3, 1, 2059, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-11-06 22:24:49', '', '2022-11-06 22:24:49', b'0');
INSERT INTO `system_menu` VALUES (2061, '秒杀活动创建', 'promotion:seckill-activity:create', 3, 2, 2059, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-11-06 22:24:49', '', '2022-11-06 22:24:49', b'0');
INSERT INTO `system_menu` VALUES (2062, '秒杀活动更新', 'promotion:seckill-activity:update', 3, 3, 2059, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-11-06 22:24:49', '', '2022-11-06 22:24:49', b'0');
INSERT INTO `system_menu` VALUES (2063, '秒杀活动删除', 'promotion:seckill-activity:delete', 3, 4, 2059, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-11-06 22:24:49', '', '2022-11-06 22:24:49', b'0');
INSERT INTO `system_menu` VALUES (2066, '秒杀时段', '', 2, 1, 2209, 'config', 'ep:baseball', 'mall/promotion/seckill/config/index', 'PromotionSeckillConfig', 0, b'1', b'1', b'1', '', '2022-11-15 19:46:50', '1', '2023-06-24 18:57:14', b'0');
INSERT INTO `system_menu` VALUES (2067, '秒杀时段查询', 'promotion:seckill-config:query', 3, 1, 2066, '', '', '', '', 0, b'1', b'1', b'1', '', '2022-11-15 19:46:51', '1', '2023-06-24 17:50:25', b'0');
INSERT INTO `system_menu` VALUES (2068, '秒杀时段创建', 'promotion:seckill-config:create', 3, 2, 2066, '', '', '', '', 0, b'1', b'1', b'1', '', '2022-11-15 19:46:51', '1', '2023-06-24 17:48:39', b'0');
INSERT INTO `system_menu` VALUES (2069, '秒杀时段更新', 'promotion:seckill-config:update', 3, 3, 2066, '', '', '', '', 0, b'1', b'1', b'1', '', '2022-11-15 19:46:51', '1', '2023-06-24 17:50:29', b'0');
INSERT INTO `system_menu` VALUES (2070, '秒杀时段删除', 'promotion:seckill-config:delete', 3, 4, 2066, '', '', '', '', 0, b'1', b'1', b'1', '', '2022-11-15 19:46:51', '1', '2023-06-24 17:50:32', b'0');
INSERT INTO `system_menu` VALUES (2072, '订单中心', '', 1, 65, 2362, 'trade', 'ep:eleme', NULL, NULL, 0, b'1', b'1', b'1', '1', '2022-11-19 18:57:19', '1', '2023-09-30 11:54:07', b'0');
INSERT INTO `system_menu` VALUES (2073, '售后退款', '', 2, 2, 2072, 'after-sale', 'ep:refrigerator', 'mall/trade/afterSale/index', 'TradeAfterSale', 0, b'1', b'1', b'1', '', '2022-11-19 20:15:32', '1', '2023-10-01 21:42:21', b'0');
INSERT INTO `system_menu` VALUES (2074, '售后查询', 'trade:after-sale:query', 3, 1, 2073, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-11-19 20:15:33', '1', '2022-12-10 21:04:29', b'0');
INSERT INTO `system_menu` VALUES (2075, '秒杀活动关闭', 'promotion:seckill-activity:close', 3, 5, 2059, '', '', '', '', 0, b'1', b'1', b'1', '1', '2022-11-28 20:20:15', '1', '2023-10-03 18:34:28', b'0');
INSERT INTO `system_menu` VALUES (2076, '订单列表', '', 2, 1, 2072, 'order', 'ep:list', 'mall/trade/order/index', 'TradeOrder', 0, b'1', b'1', b'1', '1', '2022-12-10 21:05:44', '1', '2023-10-01 21:42:08', b'0');
INSERT INTO `system_menu` VALUES (2083, '地区管理', '', 2, 14, 1, 'area', 'row', 'system/area/index', 'SystemArea', 0, b'1', b'1', b'1', '1', '2022-12-23 17:35:05', '1', '2023-04-08 09:01:37', b'0');
INSERT INTO `system_menu` VALUES (2084, '公众号管理', '', 1, 100, 0, '/mp', 'wechat', NULL, NULL, 0, b'1', b'1', b'1', '1', '2023-01-01 20:11:04', '1', '2023-01-15 11:28:57', b'0');
INSERT INTO `system_menu` VALUES (2085, '账号管理', '', 2, 1, 2084, 'account', 'phone', 'mp/account/index', 'MpAccount', 0, b'1', b'1', b'1', '1', '2023-01-01 20:13:31', '1', '2023-02-09 23:56:39', b'0');
INSERT INTO `system_menu` VALUES (2086, '新增账号', 'mp:account:create', 3, 1, 2085, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-01 20:21:40', '1', '2023-01-07 17:32:53', b'0');
INSERT INTO `system_menu` VALUES (2087, '修改账号', 'mp:account:update', 3, 2, 2085, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-07 17:32:46', '1', '2023-01-07 17:32:46', b'0');
INSERT INTO `system_menu` VALUES (2088, '查询账号', 'mp:account:query', 3, 0, 2085, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-07 17:33:07', '1', '2023-01-07 17:33:07', b'0');
INSERT INTO `system_menu` VALUES (2089, '删除账号', 'mp:account:delete', 3, 3, 2085, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-07 17:33:21', '1', '2023-01-07 17:33:21', b'0');
INSERT INTO `system_menu` VALUES (2090, '生成二维码', 'mp:account:qr-code', 3, 4, 2085, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-07 17:33:58', '1', '2023-01-07 17:33:58', b'0');
INSERT INTO `system_menu` VALUES (2091, '清空 API 配额', 'mp:account:clear-quota', 3, 5, 2085, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-07 18:20:32', '1', '2023-01-07 18:20:59', b'0');
INSERT INTO `system_menu` VALUES (2092, '数据统计', 'mp:statistics:query', 2, 2, 2084, 'statistics', 'chart', 'mp/statistics/index', 'MpStatistics', 0, b'1', b'1', b'1', '1', '2023-01-07 20:17:36', '1', '2023-02-09 23:58:34', b'0');
INSERT INTO `system_menu` VALUES (2093, '标签管理', '', 2, 3, 2084, 'tag', 'rate', 'mp/tag/index', 'MpTag', 0, b'1', b'1', b'1', '1', '2023-01-08 11:37:32', '1', '2023-02-09 23:58:47', b'0');
INSERT INTO `system_menu` VALUES (2094, '查询标签', 'mp:tag:query', 3, 0, 2093, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-08 11:59:03', '1', '2023-01-08 11:59:03', b'0');
INSERT INTO `system_menu` VALUES (2095, '新增标签', 'mp:tag:create', 3, 1, 2093, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-08 11:59:23', '1', '2023-01-08 11:59:23', b'0');
INSERT INTO `system_menu` VALUES (2096, '修改标签', 'mp:tag:update', 3, 2, 2093, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-08 11:59:41', '1', '2023-01-08 11:59:41', b'0');
INSERT INTO `system_menu` VALUES (2097, '删除标签', 'mp:tag:delete', 3, 3, 2093, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-08 12:00:04', '1', '2023-01-08 12:00:13', b'0');
INSERT INTO `system_menu` VALUES (2098, '同步标签', 'mp:tag:sync', 3, 4, 2093, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-08 12:00:29', '1', '2023-01-08 12:00:29', b'0');
INSERT INTO `system_menu` VALUES (2099, '粉丝管理', '', 2, 4, 2084, 'user', 'people', 'mp/user/index', 'MpUser', 0, b'1', b'1', b'1', '1', '2023-01-08 16:51:20', '1', '2023-02-09 23:58:21', b'0');
INSERT INTO `system_menu` VALUES (2100, '查询粉丝', 'mp:user:query', 3, 0, 2099, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-08 17:16:59', '1', '2023-01-08 17:17:23', b'0');
INSERT INTO `system_menu` VALUES (2101, '修改粉丝', 'mp:user:update', 3, 1, 2099, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-08 17:17:11', '1', '2023-01-08 17:17:11', b'0');
INSERT INTO `system_menu` VALUES (2102, '同步粉丝', 'mp:user:sync', 3, 2, 2099, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-08 17:17:40', '1', '2023-01-08 17:17:40', b'0');
INSERT INTO `system_menu` VALUES (2103, '消息管理', '', 2, 5, 2084, 'message', 'email', 'mp/message/index', 'MpMessage', 0, b'1', b'1', b'1', '1', '2023-01-08 18:44:19', '1', '2023-02-09 23:58:02', b'0');
INSERT INTO `system_menu` VALUES (2104, '图文发表记录', '', 2, 10, 2084, 'free-publish', 'education', 'mp/freePublish/index', 'MpFreePublish', 0, b'1', b'1', b'1', '1', '2023-01-13 00:30:50', '1', '2023-02-09 23:57:22', b'0');
INSERT INTO `system_menu` VALUES (2105, '查询发布列表', 'mp:free-publish:query', 3, 1, 2104, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-13 07:19:17', '1', '2023-01-13 07:19:17', b'0');
INSERT INTO `system_menu` VALUES (2106, '发布草稿', 'mp:free-publish:submit', 3, 2, 2104, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-13 07:19:46', '1', '2023-01-13 07:19:46', b'0');
INSERT INTO `system_menu` VALUES (2107, '删除发布记录', 'mp:free-publish:delete', 3, 3, 2104, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-13 07:20:01', '1', '2023-01-13 07:20:01', b'0');
INSERT INTO `system_menu` VALUES (2108, '图文草稿箱', '', 2, 9, 2084, 'draft', 'edit', 'mp/draft/index', 'MpDraft', 0, b'1', b'1', b'1', '1', '2023-01-13 07:40:21', '1', '2023-02-09 23:56:58', b'0');
INSERT INTO `system_menu` VALUES (2109, '新建草稿', 'mp:draft:create', 3, 1, 2108, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-13 23:15:30', '1', '2023-01-13 23:15:44', b'0');
INSERT INTO `system_menu` VALUES (2110, '修改草稿', 'mp:draft:update', 3, 2, 2108, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-14 10:08:47', '1', '2023-01-14 10:08:47', b'0');
INSERT INTO `system_menu` VALUES (2111, '查询草稿', 'mp:draft:query', 3, 0, 2108, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-14 10:09:01', '1', '2023-01-14 10:09:01', b'0');
INSERT INTO `system_menu` VALUES (2112, '删除草稿', 'mp:draft:delete', 3, 3, 2108, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-14 10:09:19', '1', '2023-01-14 10:09:19', b'0');
INSERT INTO `system_menu` VALUES (2113, '素材管理', '', 2, 8, 2084, 'material', 'skill', 'mp/material/index', 'MpMaterial', 0, b'1', b'1', b'1', '1', '2023-01-14 14:12:07', '1', '2023-02-09 23:57:36', b'0');
INSERT INTO `system_menu` VALUES (2114, '上传临时素材', 'mp:material:upload-temporary', 3, 1, 2113, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-14 15:33:55', '1', '2023-01-14 15:33:55', b'0');
INSERT INTO `system_menu` VALUES (2115, '上传永久素材', 'mp:material:upload-permanent', 3, 2, 2113, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-14 15:34:14', '1', '2023-01-14 15:34:14', b'0');
INSERT INTO `system_menu` VALUES (2116, '删除素材', 'mp:material:delete', 3, 3, 2113, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-14 15:35:37', '1', '2023-01-14 15:35:37', b'0');
INSERT INTO `system_menu` VALUES (2117, '上传图文图片', 'mp:material:upload-news-image', 3, 4, 2113, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-14 15:36:31', '1', '2023-01-14 15:36:31', b'0');
INSERT INTO `system_menu` VALUES (2118, '查询素材', 'mp:material:query', 3, 5, 2113, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-14 15:39:22', '1', '2023-01-14 15:39:22', b'0');
INSERT INTO `system_menu` VALUES (2119, '菜单管理', '', 2, 6, 2084, 'menu', 'button', 'mp/menu/index', 'MpMenu', 0, b'1', b'1', b'1', '1', '2023-01-14 17:43:54', '1', '2023-02-09 23:57:50', b'0');
INSERT INTO `system_menu` VALUES (2120, '自动回复', '', 2, 7, 2084, 'auto-reply', 'eye', 'mp/autoReply/index', 'MpAutoReply', 0, b'1', b'1', b'1', '1', '2023-01-15 22:13:09', '1', '2023-02-09 23:56:28', b'0');
INSERT INTO `system_menu` VALUES (2121, '查询回复', 'mp:auto-reply:query', 3, 0, 2120, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-16 22:28:41', '1', '2023-01-16 22:28:41', b'0');
INSERT INTO `system_menu` VALUES (2122, '新增回复', 'mp:auto-reply:create', 3, 1, 2120, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-16 22:28:54', '1', '2023-01-16 22:28:54', b'0');
INSERT INTO `system_menu` VALUES (2123, '修改回复', 'mp:auto-reply:update', 3, 2, 2120, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-16 22:29:05', '1', '2023-01-16 22:29:05', b'0');
INSERT INTO `system_menu` VALUES (2124, '删除回复', 'mp:auto-reply:delete', 3, 3, 2120, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-16 22:29:34', '1', '2023-01-16 22:29:34', b'0');
INSERT INTO `system_menu` VALUES (2125, '查询菜单', 'mp:menu:query', 3, 0, 2119, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-17 23:05:41', '1', '2023-01-17 23:05:41', b'0');
INSERT INTO `system_menu` VALUES (2126, '保存菜单', 'mp:menu:save', 3, 1, 2119, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-17 23:06:01', '1', '2023-01-17 23:06:01', b'0');
INSERT INTO `system_menu` VALUES (2127, '删除菜单', 'mp:menu:delete', 3, 2, 2119, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-17 23:06:16', '1', '2023-01-17 23:06:16', b'0');
INSERT INTO `system_menu` VALUES (2128, '查询消息', 'mp:message:query', 3, 0, 2103, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-17 23:07:14', '1', '2023-01-17 23:07:14', b'0');
INSERT INTO `system_menu` VALUES (2129, '发送消息', 'mp:message:send', 3, 1, 2103, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-17 23:07:26', '1', '2023-01-17 23:07:26', b'0');
INSERT INTO `system_menu` VALUES (2130, '邮箱管理', '', 2, 11, 1, 'mail', 'email', NULL, NULL, 0, b'1', b'1', b'1', '1', '2023-01-25 17:27:44', '1', '2023-01-25 17:27:44', b'0');
INSERT INTO `system_menu` VALUES (2131, '邮箱账号', '', 2, 0, 2130, 'mail-account', 'user', 'system/mail/account/index', 'SystemMailAccount', 0, b'1', b'1', b'1', '', '2023-01-25 09:33:48', '1', '2023-04-08 08:53:43', b'0');
INSERT INTO `system_menu` VALUES (2132, '账号查询', 'system:mail-account:query', 3, 1, 2131, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-25 09:33:48', '', '2023-01-25 09:33:48', b'0');
INSERT INTO `system_menu` VALUES (2133, '账号创建', 'system:mail-account:create', 3, 2, 2131, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-25 09:33:48', '', '2023-01-25 09:33:48', b'0');
INSERT INTO `system_menu` VALUES (2134, '账号更新', 'system:mail-account:update', 3, 3, 2131, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-25 09:33:48', '', '2023-01-25 09:33:48', b'0');
INSERT INTO `system_menu` VALUES (2135, '账号删除', 'system:mail-account:delete', 3, 4, 2131, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-25 09:33:48', '', '2023-01-25 09:33:48', b'0');
INSERT INTO `system_menu` VALUES (2136, '邮件模版', '', 2, 0, 2130, 'mail-template', 'education', 'system/mail/template/index', 'SystemMailTemplate', 0, b'1', b'1', b'1', '', '2023-01-25 12:05:31', '1', '2023-04-08 08:53:34', b'0');
INSERT INTO `system_menu` VALUES (2137, '模版查询', 'system:mail-template:query', 3, 1, 2136, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-25 12:05:31', '', '2023-01-25 12:05:31', b'0');
INSERT INTO `system_menu` VALUES (2138, '模版创建', 'system:mail-template:create', 3, 2, 2136, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-25 12:05:31', '', '2023-01-25 12:05:31', b'0');
INSERT INTO `system_menu` VALUES (2139, '模版更新', 'system:mail-template:update', 3, 3, 2136, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-25 12:05:31', '', '2023-01-25 12:05:31', b'0');
INSERT INTO `system_menu` VALUES (2140, '模版删除', 'system:mail-template:delete', 3, 4, 2136, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-25 12:05:31', '', '2023-01-25 12:05:31', b'0');
INSERT INTO `system_menu` VALUES (2141, '邮件记录', '', 2, 0, 2130, 'mail-log', 'log', 'system/mail/log/index', 'SystemMailLog', 0, b'1', b'1', b'1', '', '2023-01-26 02:16:50', '1', '2023-04-08 08:53:49', b'0');
INSERT INTO `system_menu` VALUES (2142, '日志查询', 'system:mail-log:query', 3, 1, 2141, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-26 02:16:50', '', '2023-01-26 02:16:50', b'0');
INSERT INTO `system_menu` VALUES (2143, '发送测试邮件', 'system:mail-template:send-mail', 3, 5, 2136, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-26 23:29:15', '1', '2023-01-26 23:29:15', b'0');
INSERT INTO `system_menu` VALUES (2144, '站内信管理', '', 1, 11, 1, 'notify', 'message', NULL, NULL, 0, b'1', b'1', b'1', '1', '2023-01-28 10:25:18', '1', '2023-01-28 10:25:46', b'0');
INSERT INTO `system_menu` VALUES (2145, '模板管理', '', 2, 0, 2144, 'notify-template', 'education', 'system/notify/template/index', 'SystemNotifyTemplate', 0, b'1', b'1', b'1', '', '2023-01-28 02:26:42', '1', '2023-04-08 08:54:39', b'0');
INSERT INTO `system_menu` VALUES (2146, '站内信模板查询', 'system:notify-template:query', 3, 1, 2145, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-28 02:26:42', '', '2023-01-28 02:26:42', b'0');
INSERT INTO `system_menu` VALUES (2147, '站内信模板创建', 'system:notify-template:create', 3, 2, 2145, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-28 02:26:42', '', '2023-01-28 02:26:42', b'0');
INSERT INTO `system_menu` VALUES (2148, '站内信模板更新', 'system:notify-template:update', 3, 3, 2145, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-28 02:26:42', '', '2023-01-28 02:26:42', b'0');
INSERT INTO `system_menu` VALUES (2149, '站内信模板删除', 'system:notify-template:delete', 3, 4, 2145, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-28 02:26:42', '', '2023-01-28 02:26:42', b'0');
INSERT INTO `system_menu` VALUES (2150, '发送测试站内信', 'system:notify-template:send-notify', 3, 5, 2145, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-28 10:54:43', '1', '2023-01-28 10:54:43', b'0');
INSERT INTO `system_menu` VALUES (2151, '消息记录', '', 2, 0, 2144, 'notify-message', 'edit', 'system/notify/message/index', 'SystemNotifyMessage', 0, b'1', b'1', b'1', '', '2023-01-28 04:28:22', '1', '2023-04-08 08:54:11', b'0');
INSERT INTO `system_menu` VALUES (2152, '站内信消息查询', 'system:notify-message:query', 3, 1, 2151, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-28 04:28:22', '', '2023-01-28 04:28:22', b'0');
INSERT INTO `system_menu` VALUES (2153, '大屏设计器', '', 2, 2, 1281, 'go-view', 'dashboard', 'report/goview/index', 'JimuReport', 0, b'1', b'1', b'1', '1', '2023-02-07 00:03:19', '1', '2023-04-08 10:48:15', b'0');
INSERT INTO `system_menu` VALUES (2154, '创建项目', 'report:go-view-project:create', 3, 1, 2153, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-02-07 19:25:14', '1', '2023-02-07 19:25:14', b'0');
INSERT INTO `system_menu` VALUES (2155, '更新项目', 'report:go-view-project:delete', 3, 2, 2153, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-02-07 19:25:34', '1', '2023-02-07 19:25:34', b'0');
INSERT INTO `system_menu` VALUES (2156, '查询项目', 'report:go-view-project:query', 3, 0, 2153, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-02-07 19:25:53', '1', '2023-02-07 19:25:53', b'0');
INSERT INTO `system_menu` VALUES (2157, '使用 SQL 查询数据', 'report:go-view-data:get-by-sql', 3, 3, 2153, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-02-07 19:26:15', '1', '2023-02-07 19:26:15', b'0');
INSERT INTO `system_menu` VALUES (2158, '使用 HTTP 查询数据', 'report:go-view-data:get-by-http', 3, 4, 2153, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-02-07 19:26:35', '1', '2023-02-07 19:26:35', b'0');
INSERT INTO `system_menu` VALUES (2159, 'Boot 开发文档', '', 1, 1, 0, 'https://doc.iocoder.cn/', 'education', NULL, NULL, 0, b'1', b'1', b'1', '1', '2023-02-10 22:46:28', '1', '2023-02-10 22:46:28', b'0');
INSERT INTO `system_menu` VALUES (2160, 'Cloud 开发文档', '', 1, 2, 0, 'https://cloud.iocoder.cn', 'documentation', NULL, NULL, 0, b'1', b'1', b'1', '1', '2023-02-10 22:47:07', '1', '2023-02-10 22:47:07', b'0');
INSERT INTO `system_menu` VALUES (2161, '接入示例', '', 2, 99, 1117, 'demo-order', 'drag', 'pay/demo/index', NULL, 0, b'1', b'1', b'1', '', '2023-02-11 14:21:42', '1', '2023-11-29 15:04:49', b'1');
INSERT INTO `system_menu` VALUES (2162, '商品导出', 'product:spu:export', 3, 5, 2014, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-07-30 14:22:58', '', '2022-07-30 14:22:58', b'0');
INSERT INTO `system_menu` VALUES (2164, '配送管理', '', 1, 3, 2072, 'delivery', 'ep:shopping-cart', '', '', 0, b'1', b'1', b'1', '1', '2023-05-18 09:18:02', '1', '2023-09-28 10:58:09', b'0');
INSERT INTO `system_menu` VALUES (2165, '快递发货', '', 1, 0, 2164, 'express', 'ep:bicycle', '', '', 0, b'1', b'1', b'1', '1', '2023-05-18 09:22:06', '1', '2023-08-30 21:02:49', b'0');
INSERT INTO `system_menu` VALUES (2166, '门店自提', '', 1, 1, 2164, 'pick-up-store', 'ep:add-location', '', '', 0, b'1', b'1', b'1', '1', '2023-05-18 09:23:14', '1', '2023-08-30 21:03:21', b'0');
INSERT INTO `system_menu` VALUES (2167, '快递公司', '', 2, 0, 2165, 'express', 'ep:compass', 'mall/trade/delivery/express/index', 'Express', 0, b'1', b'1', b'1', '1', '2023-05-18 09:27:21', '1', '2023-08-30 21:02:59', b'0');
INSERT INTO `system_menu` VALUES (2168, '快递公司查询', 'trade:delivery:express:query', 3, 1, 2167, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-05-18 09:37:53', '', '2023-05-18 09:37:53', b'0');
INSERT INTO `system_menu` VALUES (2169, '快递公司创建', 'trade:delivery:express:create', 3, 2, 2167, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-05-18 09:37:53', '', '2023-05-18 09:37:53', b'0');
INSERT INTO `system_menu` VALUES (2170, '快递公司更新', 'trade:delivery:express:update', 3, 3, 2167, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-05-18 09:37:53', '', '2023-05-18 09:37:53', b'0');
INSERT INTO `system_menu` VALUES (2171, '快递公司删除', 'trade:delivery:express:delete', 3, 4, 2167, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-05-18 09:37:53', '', '2023-05-18 09:37:53', b'0');
INSERT INTO `system_menu` VALUES (2172, '快递公司导出', 'trade:delivery:express:export', 3, 5, 2167, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-05-18 09:37:53', '', '2023-05-18 09:37:53', b'0');
INSERT INTO `system_menu` VALUES (2173, '运费模版', 'trade:delivery:express-template:query', 2, 1, 2165, 'express-template', 'ep:coordinate', 'mall/trade/delivery/expressTemplate/index', 'ExpressTemplate', 0, b'1', b'1', b'1', '1', '2023-05-20 06:48:10', '1', '2023-08-30 21:03:13', b'0');
INSERT INTO `system_menu` VALUES (2174, '快递运费模板查询', 'trade:delivery:express-template:query', 3, 1, 2173, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-05-20 06:49:53', '', '2023-05-20 06:49:53', b'0');
INSERT INTO `system_menu` VALUES (2175, '快递运费模板创建', 'trade:delivery:express-template:create', 3, 2, 2173, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-05-20 06:49:53', '', '2023-05-20 06:49:53', b'0');
INSERT INTO `system_menu` VALUES (2176, '快递运费模板更新', 'trade:delivery:express-template:update', 3, 3, 2173, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-05-20 06:49:53', '', '2023-05-20 06:49:53', b'0');
INSERT INTO `system_menu` VALUES (2177, '快递运费模板删除', 'trade:delivery:express-template:delete', 3, 4, 2173, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-05-20 06:49:53', '', '2023-05-20 06:49:53', b'0');
INSERT INTO `system_menu` VALUES (2178, '快递运费模板导出', 'trade:delivery:express-template:export', 3, 5, 2173, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-05-20 06:49:53', '', '2023-05-20 06:49:53', b'0');
INSERT INTO `system_menu` VALUES (2179, '门店管理', '', 2, 1, 2166, 'pick-up-store', 'ep:basketball', 'mall/trade/delivery/pickUpStore/index', 'PickUpStore', 0, b'1', b'1', b'1', '1', '2023-05-25 10:50:00', '1', '2023-08-30 21:03:28', b'0');
INSERT INTO `system_menu` VALUES (2180, '自提门店查询', 'trade:delivery:pick-up-store:query', 3, 1, 2179, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-05-25 10:53:29', '', '2023-05-25 10:53:29', b'0');
INSERT INTO `system_menu` VALUES (2181, '自提门店创建', 'trade:delivery:pick-up-store:create', 3, 2, 2179, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-05-25 10:53:29', '', '2023-05-25 10:53:29', b'0');
INSERT INTO `system_menu` VALUES (2182, '自提门店更新', 'trade:delivery:pick-up-store:update', 3, 3, 2179, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-05-25 10:53:29', '', '2023-05-25 10:53:29', b'0');
INSERT INTO `system_menu` VALUES (2183, '自提门店删除', 'trade:delivery:pick-up-store:delete', 3, 4, 2179, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-05-25 10:53:29', '', '2023-05-25 10:53:29', b'0');
INSERT INTO `system_menu` VALUES (2184, '自提门店导出', 'trade:delivery:pick-up-store:export', 3, 5, 2179, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-05-25 10:53:29', '', '2023-05-25 10:53:29', b'0');
INSERT INTO `system_menu` VALUES (2209, '秒杀活动', '', 2, 3, 2030, 'seckill', 'ep:place', '', '', 0, b'1', b'1', b'1', '1', '2023-06-24 17:39:13', '1', '2023-06-24 18:55:15', b'0');
INSERT INTO `system_menu` VALUES (2262, '会员中心', '', 1, 55, 0, '/member', 'ep:bicycle', NULL, NULL, 0, b'1', b'1', b'1', '1', '2023-06-10 00:42:03', '1', '2023-08-20 09:23:56', b'0');
INSERT INTO `system_menu` VALUES (2275, '会员配置', '', 2, 0, 2262, 'config', 'fa:archive', 'member/config/index', 'MemberConfig', 0, b'1', b'1', b'1', '', '2023-06-10 02:07:44', '1', '2023-10-01 23:41:29', b'0');
INSERT INTO `system_menu` VALUES (2276, '积分设置查询', 'point:config:query', 3, 1, 2275, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-06-10 02:07:44', '', '2023-06-10 02:07:44', b'0');
INSERT INTO `system_menu` VALUES (2277, '积分设置创建', 'point:config:save', 3, 2, 2275, '', '', '', '', 0, b'1', b'1', b'1', '', '2023-06-10 02:07:44', '1', '2023-06-27 20:32:31', b'0');
INSERT INTO `system_menu` VALUES (2281, '签到配置', '', 2, 2, 2300, 'config', 'ep:calendar', 'member/signin/config/index', 'SignInConfig', 0, b'1', b'1', b'1', '', '2023-06-10 03:26:12', '1', '2023-08-20 19:25:51', b'0');
INSERT INTO `system_menu` VALUES (2282, '积分签到规则查询', 'point:sign-in-config:query', 3, 1, 2281, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-06-10 03:26:12', '', '2023-06-10 03:26:12', b'0');
INSERT INTO `system_menu` VALUES (2283, '积分签到规则创建', 'point:sign-in-config:create', 3, 2, 2281, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-06-10 03:26:12', '', '2023-06-10 03:26:12', b'0');
INSERT INTO `system_menu` VALUES (2284, '积分签到规则更新', 'point:sign-in-config:update', 3, 3, 2281, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-06-10 03:26:12', '', '2023-06-10 03:26:12', b'0');
INSERT INTO `system_menu` VALUES (2285, '积分签到规则删除', 'point:sign-in-config:delete', 3, 4, 2281, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-06-10 03:26:12', '', '2023-06-10 03:26:12', b'0');
INSERT INTO `system_menu` VALUES (2287, '会员积分', '', 2, 10, 2262, 'record', 'fa:asterisk', 'member/point/record/index', 'PointRecord', 0, b'1', b'1', b'1', '', '2023-06-10 04:18:50', '1', '2023-10-01 23:42:11', b'0');
INSERT INTO `system_menu` VALUES (2288, '用户积分记录查询', 'point:record:query', 3, 1, 2287, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-06-10 04:18:50', '', '2023-06-10 04:18:50', b'0');
INSERT INTO `system_menu` VALUES (2293, '签到记录', '', 2, 3, 2300, 'record', 'ep:chicken', 'member/signin/record/index', 'SignInRecord', 0, b'1', b'1', b'1', '', '2023-06-10 04:48:22', '1', '2023-08-20 19:26:02', b'0');
INSERT INTO `system_menu` VALUES (2294, '用户签到积分查询', 'point:sign-in-record:query', 3, 1, 2293, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-06-10 04:48:22', '', '2023-06-10 04:48:22', b'0');
INSERT INTO `system_menu` VALUES (2297, '用户签到积分删除', 'point:sign-in-record:delete', 3, 4, 2293, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-06-10 04:48:22', '', '2023-06-10 04:48:22', b'0');
INSERT INTO `system_menu` VALUES (2300, '会员签到', '', 1, 11, 2262, 'signin', 'ep:alarm-clock', '', '', 0, b'1', b'1', b'1', '1', '2023-06-27 22:49:53', '1', '2023-08-20 09:23:48', b'0');
INSERT INTO `system_menu` VALUES (2301, '回调通知', '', 2, 4, 1117, 'notify', 'example', 'pay/notify/index', 'PayNotify', 0, b'1', b'1', b'1', '', '2023-07-20 04:41:32', '1', '2023-07-20 13:45:08', b'0');
INSERT INTO `system_menu` VALUES (2302, '支付通知查询', 'pay:notify:query', 3, 1, 2301, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-07-20 04:41:32', '', '2023-07-20 04:41:32', b'0');
INSERT INTO `system_menu` VALUES (2303, '拼团活动', '', 2, 3, 2030, 'combination', 'fa:group', '', '', 0, b'1', b'1', b'1', '1', '2023-08-12 17:19:54', '1', '2023-08-12 17:20:05', b'0');
INSERT INTO `system_menu` VALUES (2304, '拼团商品', '', 2, 1, 2303, 'acitivity', 'ep:apple', 'mall/promotion/combination/activity/index', 'PromotionCombinationActivity', 0, b'1', b'1', b'1', '1', '2023-08-12 17:22:03', '1', '2023-08-12 17:22:29', b'0');
INSERT INTO `system_menu` VALUES (2305, '拼团活动查询', 'promotion:combination-activity:query', 3, 1, 2304, '', '', '', '', 0, b'1', b'1', b'1', '1', '2023-08-12 17:54:32', '1', '2023-08-12 17:54:32', b'0');
INSERT INTO `system_menu` VALUES (2306, '拼团活动创建', 'promotion:combination-activity:create', 3, 2, 2304, '', '', '', '', 0, b'1', b'1', b'1', '1', '2023-08-12 17:54:49', '1', '2023-08-12 17:54:49', b'0');
INSERT INTO `system_menu` VALUES (2307, '拼团活动更新', 'promotion:combination-activity:update', 3, 3, 2304, '', '', '', '', 0, b'1', b'1', b'1', '1', '2023-08-12 17:55:04', '1', '2023-08-12 17:55:04', b'0');
INSERT INTO `system_menu` VALUES (2308, '拼团活动删除', 'promotion:combination-activity:delete', 3, 4, 2304, '', '', '', '', 0, b'1', b'1', b'1', '1', '2023-08-12 17:55:23', '1', '2023-08-12 17:55:23', b'0');
INSERT INTO `system_menu` VALUES (2309, '拼团活动关闭', 'promotion:combination-activity:close', 3, 5, 2304, '', '', '', '', 0, b'1', b'1', b'1', '1', '2023-08-12 17:55:37', '1', '2023-10-06 10:51:57', b'0');
INSERT INTO `system_menu` VALUES (2310, '砍价活动', '', 2, 4, 2030, 'bargain', 'ep:box', '', '', 0, b'1', b'1', b'1', '1', '2023-08-13 00:27:25', '1', '2023-08-13 00:27:25', b'0');
INSERT INTO `system_menu` VALUES (2311, '砍价商品', '', 2, 1, 2310, 'activity', 'ep:burger', 'mall/promotion/bargain/activity/index', 'PromotionBargainActivity', 0, b'1', b'1', b'1', '1', '2023-08-13 00:28:49', '1', '2023-10-05 01:16:23', b'0');
INSERT INTO `system_menu` VALUES (2312, '砍价活动查询', 'promotion:bargain-activity:query', 3, 1, 2311, '', '', '', '', 0, b'1', b'1', b'1', '1', '2023-08-13 00:32:30', '1', '2023-08-13 00:32:30', b'0');
INSERT INTO `system_menu` VALUES (2313, '砍价活动创建', 'promotion:bargain-activity:create', 3, 2, 2311, '', '', '', '', 0, b'1', b'1', b'1', '1', '2023-08-13 00:32:44', '1', '2023-08-13 00:32:44', b'0');
INSERT INTO `system_menu` VALUES (2314, '砍价活动更新', 'promotion:bargain-activity:update', 3, 3, 2311, '', '', '', '', 0, b'1', b'1', b'1', '1', '2023-08-13 00:32:55', '1', '2023-08-13 00:32:55', b'0');
INSERT INTO `system_menu` VALUES (2315, '砍价活动删除', 'promotion:bargain-activity:delete', 3, 4, 2311, '', '', '', '', 0, b'1', b'1', b'1', '1', '2023-08-13 00:34:50', '1', '2023-08-13 00:34:50', b'0');
INSERT INTO `system_menu` VALUES (2316, '砍价活动关闭', 'promotion:bargain-activity:close', 3, 5, 2311, '', '', '', '', 0, b'1', b'1', b'1', '1', '2023-08-13 00:35:02', '1', '2023-08-13 00:35:02', b'0');
INSERT INTO `system_menu` VALUES (2317, '会员管理', '', 2, 0, 2262, 'user', 'ep:avatar', 'member/user/index', 'MemberUser', 0, b'1', b'1', b'1', '', '2023-08-19 04:12:15', '1', '2023-08-24 00:50:55', b'0');
INSERT INTO `system_menu` VALUES (2318, '会员用户查询', 'member:user:query', 3, 1, 2317, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-08-19 04:12:15', '', '2023-08-19 04:12:15', b'0');
INSERT INTO `system_menu` VALUES (2319, '会员用户更新', 'member:user:update', 3, 3, 2317, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-08-19 04:12:15', '', '2023-08-19 04:12:15', b'0');
INSERT INTO `system_menu` VALUES (2320, '会员标签', '', 2, 1, 2262, 'tag', 'ep:collection-tag', 'member/tag/index', 'MemberTag', 0, b'1', b'1', b'1', '', '2023-08-20 01:03:08', '1', '2023-08-20 09:23:19', b'0');
INSERT INTO `system_menu` VALUES (2321, '会员标签查询', 'member:tag:query', 3, 1, 2320, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-08-20 01:03:08', '', '2023-08-20 01:03:08', b'0');
INSERT INTO `system_menu` VALUES (2322, '会员标签创建', 'member:tag:create', 3, 2, 2320, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-08-20 01:03:08', '', '2023-08-20 01:03:08', b'0');
INSERT INTO `system_menu` VALUES (2323, '会员标签更新', 'member:tag:update', 3, 3, 2320, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-08-20 01:03:08', '', '2023-08-20 01:03:08', b'0');
INSERT INTO `system_menu` VALUES (2324, '会员标签删除', 'member:tag:delete', 3, 4, 2320, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-08-20 01:03:08', '', '2023-08-20 01:03:08', b'0');
INSERT INTO `system_menu` VALUES (2325, '会员等级', '', 2, 2, 2262, 'level', 'fa:level-up', 'member/level/index', 'MemberLevel', 0, b'1', b'1', b'1', '', '2023-08-22 12:41:01', '1', '2023-08-22 21:47:00', b'0');
INSERT INTO `system_menu` VALUES (2326, '会员等级查询', 'member:level:query', 3, 1, 2325, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-08-22 12:41:02', '', '2023-08-22 12:41:02', b'0');
INSERT INTO `system_menu` VALUES (2327, '会员等级创建', 'member:level:create', 3, 2, 2325, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-08-22 12:41:02', '', '2023-08-22 12:41:02', b'0');
INSERT INTO `system_menu` VALUES (2328, '会员等级更新', 'member:level:update', 3, 3, 2325, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-08-22 12:41:02', '', '2023-08-22 12:41:02', b'0');
INSERT INTO `system_menu` VALUES (2329, '会员等级删除', 'member:level:delete', 3, 4, 2325, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-08-22 12:41:02', '', '2023-08-22 12:41:02', b'0');
INSERT INTO `system_menu` VALUES (2330, '会员分组', '', 2, 3, 2262, 'group', 'fa:group', 'member/group/index', 'MemberGroup', 0, b'1', b'1', b'1', '', '2023-08-22 13:50:06', '1', '2023-10-01 23:42:01', b'0');
INSERT INTO `system_menu` VALUES (2331, '用户分组查询', 'member:group:query', 3, 1, 2330, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-08-22 13:50:06', '', '2023-08-22 13:50:06', b'0');
INSERT INTO `system_menu` VALUES (2332, '用户分组创建', 'member:group:create', 3, 2, 2330, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-08-22 13:50:06', '', '2023-08-22 13:50:06', b'0');
INSERT INTO `system_menu` VALUES (2333, '用户分组更新', 'member:group:update', 3, 3, 2330, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-08-22 13:50:06', '', '2023-08-22 13:50:06', b'0');
INSERT INTO `system_menu` VALUES (2334, '用户分组删除', 'member:group:delete', 3, 4, 2330, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-08-22 13:50:06', '', '2023-08-22 13:50:06', b'0');
INSERT INTO `system_menu` VALUES (2335, '用户等级修改', 'member:user:update-level', 3, 5, 2317, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-08-23 16:49:05', '', '2023-08-23 16:50:48', b'0');
INSERT INTO `system_menu` VALUES (2336, '商品评论', '', 2, 5, 2000, 'comment', 'ep:comment', 'mall/product/comment/index', 'ProductComment', 0, b'1', b'1', b'1', '1', '2023-08-26 11:03:00', '1', '2023-08-26 11:03:38', b'0');
INSERT INTO `system_menu` VALUES (2337, '评论查询', 'product:comment:query', 3, 1, 2336, '', '', '', '', 0, b'1', b'1', b'1', '1', '2023-08-26 11:04:01', '1', '2023-08-26 11:04:01', b'0');
INSERT INTO `system_menu` VALUES (2338, '添加自评', 'product:comment:create', 3, 2, 2336, '', '', '', '', 0, b'1', b'1', b'1', '1', '2023-08-26 11:04:23', '1', '2023-08-26 11:08:18', b'0');
INSERT INTO `system_menu` VALUES (2339, '商家回复', 'product:comment:update', 3, 3, 2336, '', '', '', '', 0, b'1', b'1', b'1', '1', '2023-08-26 11:04:37', '1', '2023-08-26 11:04:37', b'0');
INSERT INTO `system_menu` VALUES (2340, '显隐评论', 'product:comment:update', 3, 4, 2336, '', '', '', '', 0, b'1', b'1', b'1', '1', '2023-08-26 11:04:55', '1', '2023-08-26 11:04:55', b'0');
INSERT INTO `system_menu` VALUES (2341, '优惠劵发送', 'promotion:coupon:send', 3, 2, 2038, '', '', '', '', 0, b'1', b'1', b'1', '1', '2023-09-02 00:03:14', '1', '2023-09-02 00:03:14', b'0');
INSERT INTO `system_menu` VALUES (2342, '交易配置', '', 2, 0, 2072, 'config', 'ep:setting', 'trade/config/index', 'TradeConfig', 0, b'1', b'1', b'1', '', '2023-09-28 02:46:22', '1', '2023-09-28 10:57:36', b'0');
INSERT INTO `system_menu` VALUES (2343, '交易中心配置查询', 'trade:config:query', 3, 1, 2342, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-09-28 02:46:22', '', '2023-09-28 02:46:22', b'0');
INSERT INTO `system_menu` VALUES (2344, '交易中心配置保存', 'trade:config:save', 3, 2, 2342, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-09-28 02:46:22', '', '2023-09-28 02:46:22', b'0');
INSERT INTO `system_menu` VALUES (2345, '分销管理', '', 1, 4, 2072, 'brokerage', 'fa-solid:project-diagram', '', '', 0, b'1', b'1', b'1', '', '2023-09-28 02:46:22', '1', '2023-09-28 10:58:44', b'0');
INSERT INTO `system_menu` VALUES (2346, '分销用户', '', 2, 0, 2345, 'brokerage-user', 'fa-solid:user-tie', 'trade/brokerage/user/index', 'TradeBrokerageUser', 0, b'1', b'1', b'1', '', '2023-09-28 02:46:22', '', '2023-09-28 02:46:22', b'0');
INSERT INTO `system_menu` VALUES (2347, '分销用户查询', 'trade:brokerage-user:query', 3, 1, 2346, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-09-28 02:46:22', '', '2023-09-28 02:46:22', b'0');
INSERT INTO `system_menu` VALUES (2348, '分销用户推广人查询', 'trade:brokerage-user:user-query', 3, 2, 2346, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-09-28 02:46:22', '', '2023-09-28 02:46:22', b'0');
INSERT INTO `system_menu` VALUES (2349, '分销用户推广订单查询', 'trade:brokerage-user:order-query', 3, 3, 2346, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-09-28 02:46:22', '', '2023-09-28 02:46:22', b'0');
INSERT INTO `system_menu` VALUES (2350, '分销用户修改推广资格', 'trade:brokerage-user:update-brokerage-enable', 3, 4, 2346, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-09-28 02:46:22', '', '2023-09-28 02:46:22', b'0');
INSERT INTO `system_menu` VALUES (2351, '分销用户修改推广员', 'trade:brokerage-user:update-bind-user', 3, 5, 2346, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-09-28 02:46:22', '', '2023-09-28 02:46:22', b'0');
INSERT INTO `system_menu` VALUES (2352, '分销用户清除推广员', 'trade:brokerage-user:clear-bind-user', 3, 6, 2346, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-09-28 02:46:22', '', '2023-09-28 02:46:22', b'0');
INSERT INTO `system_menu` VALUES (2353, '佣金记录', '', 2, 1, 2345, 'brokerage-record', 'fa:money', 'trade/brokerage/record/index', 'TradeBrokerageRecord', 0, b'1', b'1', b'1', '', '2023-09-28 02:46:22', '', '2023-09-28 02:46:22', b'0');
INSERT INTO `system_menu` VALUES (2354, '佣金记录查询', 'trade:brokerage-record:query', 3, 1, 2353, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-09-28 02:46:22', '', '2023-09-28 02:46:22', b'0');
INSERT INTO `system_menu` VALUES (2355, '佣金提现', '', 2, 2, 2345, 'brokerage-withdraw', 'fa:credit-card', 'trade/brokerage/withdraw/index', 'TradeBrokerageWithdraw', 0, b'1', b'1', b'1', '', '2023-09-28 02:46:22', '', '2023-09-28 02:46:22', b'0');
INSERT INTO `system_menu` VALUES (2356, '佣金提现查询', 'trade:brokerage-withdraw:query', 3, 1, 2355, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-09-28 02:46:22', '', '2023-09-28 02:46:22', b'0');
INSERT INTO `system_menu` VALUES (2357, '佣金提现审核', 'trade:brokerage-withdraw:audit', 3, 2, 2355, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-09-28 02:46:22', '', '2023-09-28 02:46:22', b'0');
INSERT INTO `system_menu` VALUES (2358, '统计中心', '', 1, 75, 2362, 'statistics', 'ep:data-line', '', '', 0, b'1', b'1', b'1', '', '2023-09-30 03:22:40', '1', '2023-09-30 11:54:48', b'0');
INSERT INTO `system_menu` VALUES (2359, '交易统计', '', 2, 4, 2358, 'trade', 'fa-solid:credit-card', 'statistics/trade/index', 'TradeStatistics', 0, b'1', b'1', b'1', '', '2023-09-30 03:22:40', '', '2023-09-30 03:22:40', b'0');
INSERT INTO `system_menu` VALUES (2360, '交易统计查询', 'statistics:trade:query', 3, 1, 2359, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-09-30 03:22:40', '', '2023-09-30 03:22:40', b'0');
INSERT INTO `system_menu` VALUES (2361, '交易统计导出', 'statistics:trade:export', 3, 2, 2359, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-09-30 03:22:40', '', '2023-09-30 03:22:40', b'0');
INSERT INTO `system_menu` VALUES (2362, '商城系统', '', 1, 59, 0, '/mall', 'ep:shop', '', '', 0, b'1', b'1', b'1', '1', '2023-09-30 11:52:02', '1', '2023-09-30 11:52:18', b'0');
INSERT INTO `system_menu` VALUES (2363, '用户积分修改', 'member:user:update-point', 3, 6, 2317, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-01 14:39:43', '', '2023-10-01 14:39:43', b'0');
INSERT INTO `system_menu` VALUES (2364, '用户余额修改', 'member:user:update-balance', 3, 7, 2317, '', '', '', '', 0, b'1', b'1', b'1', '', '2023-10-01 14:39:43', '1', '2023-10-01 22:42:31', b'0');
INSERT INTO `system_menu` VALUES (2365, '优惠劵', '', 1, 2, 2030, 'coupon', 'fa-solid:disease', '', '', 0, b'1', b'1', b'1', '1', '2023-10-03 12:39:15', '1', '2023-10-05 00:16:07', b'0');
INSERT INTO `system_menu` VALUES (2366, '砍价记录', '', 2, 2, 2310, 'record', 'ep:list', 'mall/promotion/bargain/record/index', 'PromotionBargainRecord', 0, b'1', b'1', b'1', '', '2023-10-05 02:49:06', '1', '2023-10-05 10:50:38', b'0');
INSERT INTO `system_menu` VALUES (2367, '砍价记录查询', 'promotion:bargain-record:query', 3, 1, 2366, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-05 02:49:06', '', '2023-10-05 02:49:06', b'0');
INSERT INTO `system_menu` VALUES (2368, '助力记录查询', 'promotion:bargain-help:query', 3, 2, 2366, '', '', '', '', 0, b'1', b'1', b'1', '1', '2023-10-05 12:27:49', '1', '2023-10-05 12:27:49', b'0');
INSERT INTO `system_menu` VALUES (2369, '拼团记录', 'promotion:combination-record:query', 2, 2, 2303, 'record', 'ep:avatar', 'mall/promotion/combination/record/index.vue', 'PromotionCombinationRecord', 0, b'1', b'1', b'1', '1', '2023-10-08 07:10:22', '1', '2023-10-08 07:34:11', b'0');
INSERT INTO `system_menu` VALUES (2374, '会员统计', '', 2, 2, 2358, 'member', 'ep:avatar', 'statistics/member/index', 'MemberStatistics', 0, b'1', b'1', b'1', '', '2023-10-11 04:39:24', '1', '2023-10-11 12:50:22', b'0');
INSERT INTO `system_menu` VALUES (2375, '会员统计查询', 'statistics:member:query', 3, 1, 2374, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-11 04:39:24', '', '2023-10-11 04:39:24', b'0');
INSERT INTO `system_menu` VALUES (2376, '订单核销', 'trade:order:pick-up', 3, 10, 2076, '', '', '', '', 0, b'1', b'1', b'1', '1', '2023-10-14 17:11:58', '1', '2023-10-14 17:11:58', b'0');
INSERT INTO `system_menu` VALUES (2377, '文章分类', '', 2, 0, 2387, 'article/category', 'fa:certificate', 'mall/promotion/article/category/index', 'ArticleCategory', 0, b'1', b'1', b'1', '', '2023-10-16 01:26:18', '1', '2023-10-16 09:38:26', b'0');
INSERT INTO `system_menu` VALUES (2378, '分类查询', 'promotion:article-category:query', 3, 1, 2377, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-16 01:26:18', '', '2023-10-16 01:26:18', b'0');
INSERT INTO `system_menu` VALUES (2379, '分类创建', 'promotion:article-category:create', 3, 2, 2377, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-16 01:26:18', '', '2023-10-16 01:26:18', b'0');
INSERT INTO `system_menu` VALUES (2380, '分类更新', 'promotion:article-category:update', 3, 3, 2377, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-16 01:26:18', '', '2023-10-16 01:26:18', b'0');
INSERT INTO `system_menu` VALUES (2381, '分类删除', 'promotion:article-category:delete', 3, 4, 2377, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-16 01:26:18', '', '2023-10-16 01:26:18', b'0');
INSERT INTO `system_menu` VALUES (2382, '文章列表', '', 2, 2, 2387, 'article', 'ep:connection', 'mall/promotion/article/index', 'Article', 0, b'1', b'1', b'1', '', '2023-10-16 01:26:18', '1', '2023-10-16 09:41:19', b'0');
INSERT INTO `system_menu` VALUES (2383, '文章管理查询', 'promotion:article:query', 3, 1, 2382, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-16 01:26:18', '', '2023-10-16 01:26:18', b'0');
INSERT INTO `system_menu` VALUES (2384, '文章管理创建', 'promotion:article:create', 3, 2, 2382, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-16 01:26:18', '', '2023-10-16 01:26:18', b'0');
INSERT INTO `system_menu` VALUES (2385, '文章管理更新', 'promotion:article:update', 3, 3, 2382, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-16 01:26:18', '', '2023-10-16 01:26:18', b'0');
INSERT INTO `system_menu` VALUES (2386, '文章管理删除', 'promotion:article:delete', 3, 4, 2382, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-16 01:26:18', '', '2023-10-16 01:26:18', b'0');
INSERT INTO `system_menu` VALUES (2387, '内容管理', '', 1, 1, 2030, 'content', 'ep:collection', '', '', 0, b'1', b'1', b'1', '1', '2023-10-16 09:37:31', '1', '2023-10-16 09:37:31', b'0');
INSERT INTO `system_menu` VALUES (2388, '商城首页', '', 2, 1, 2362, 'home', 'ep:home-filled', 'mall/home/index', 'MallHome', 0, b'1', b'1', b'1', '', '2023-10-16 12:10:33', '', '2023-10-16 12:10:33', b'0');
INSERT INTO `system_menu` VALUES (2389, '核销订单', '', 2, 2, 2166, 'pick-up-order', 'ep:list', 'mall/trade/delivery/pickUpOrder/index', 'PickUpOrder', 0, b'1', b'1', b'1', '', '2023-10-19 16:09:51', '', '2023-10-19 16:09:51', b'0');
INSERT INTO `system_menu` VALUES (2390, '优惠活动', '', 1, 99, 2030, 'youhui', 'ep:aim', '', '', 0, b'1', b'1', b'1', '1', '2023-10-21 19:23:49', '1', '2023-10-21 19:23:49', b'0');
INSERT INTO `system_menu` VALUES (2391, '客户管理', '', 2, 0, 2397, 'customer', 'fa:address-book-o', 'crm/customer/index', 'CrmCustomer', 0, b'1', b'1', b'1', '', '2023-10-29 09:04:21', '1', '2023-10-29 17:11:03', b'0');
INSERT INTO `system_menu` VALUES (2392, '客户查询', 'crm:customer:query', 3, 1, 2391, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 09:04:21', '', '2023-10-29 09:04:21', b'0');
INSERT INTO `system_menu` VALUES (2393, '客户创建', 'crm:customer:create', 3, 2, 2391, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 09:04:21', '', '2023-10-29 09:04:21', b'0');
INSERT INTO `system_menu` VALUES (2394, '客户更新', 'crm:customer:update', 3, 3, 2391, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 09:04:21', '', '2023-10-29 09:04:21', b'0');
INSERT INTO `system_menu` VALUES (2395, '客户删除', 'crm:customer:delete', 3, 4, 2391, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 09:04:21', '', '2023-10-29 09:04:21', b'0');
INSERT INTO `system_menu` VALUES (2396, '客户导出', 'crm:customer:export', 3, 5, 2391, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 09:04:21', '', '2023-10-29 09:04:21', b'0');
INSERT INTO `system_menu` VALUES (2397, '客户管理系统', '', 1, 200, 0, '/crm', 'ep:avatar', '', '', 0, b'1', b'1', b'1', '1', '2023-10-29 17:08:30', '1', '2023-10-29 17:08:30', b'0');
INSERT INTO `system_menu` VALUES (2398, '合同管理', '', 2, 1, 2397, 'contract', 'ep:notebook', 'crm/contract/index', 'CrmContract', 0, b'1', b'1', b'1', '', '2023-10-29 10:50:41', '1', '2023-10-29 18:55:53', b'0');
INSERT INTO `system_menu` VALUES (2399, '合同查询', 'crm:contract:query', 3, 1, 2398, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 10:50:41', '', '2023-10-29 10:50:41', b'0');
INSERT INTO `system_menu` VALUES (2400, '合同创建', 'crm:contract:create', 3, 2, 2398, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 10:50:41', '', '2023-10-29 10:50:41', b'0');
INSERT INTO `system_menu` VALUES (2401, '合同更新', 'crm:contract:update', 3, 3, 2398, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 10:50:41', '', '2023-10-29 10:50:41', b'0');
INSERT INTO `system_menu` VALUES (2402, '合同删除', 'crm:contract:delete', 3, 4, 2398, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 10:50:41', '', '2023-10-29 10:50:41', b'0');
INSERT INTO `system_menu` VALUES (2403, '合同导出', 'crm:contract:export', 3, 5, 2398, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 10:50:41', '', '2023-10-29 10:50:41', b'0');
INSERT INTO `system_menu` VALUES (2404, '线索管理', '', 2, 0, 2397, 'clue', 'fa:pagelines', 'crm/clue/index', 'CrmClue', 0, b'1', b'1', b'1', '', '2023-10-29 11:06:29', '1', '2023-10-29 19:08:35', b'0');
INSERT INTO `system_menu` VALUES (2405, '线索查询', 'crm:clue:query', 3, 1, 2404, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 11:06:29', '', '2023-10-29 11:06:29', b'0');
INSERT INTO `system_menu` VALUES (2406, '线索创建', 'crm:clue:create', 3, 2, 2404, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 11:06:29', '', '2023-10-29 11:06:29', b'0');
INSERT INTO `system_menu` VALUES (2407, '线索更新', 'crm:clue:update', 3, 3, 2404, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 11:06:29', '', '2023-10-29 11:06:29', b'0');
INSERT INTO `system_menu` VALUES (2408, '线索删除', 'crm:clue:delete', 3, 4, 2404, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 11:06:29', '', '2023-10-29 11:06:29', b'0');
INSERT INTO `system_menu` VALUES (2409, '线索导出', 'crm:clue:export', 3, 5, 2404, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 11:06:29', '', '2023-10-29 11:06:29', b'0');
INSERT INTO `system_menu` VALUES (2410, '商机管理', '', 2, 0, 2397, 'business', 'fa:bus', 'crm/business/index', 'CrmBusiness', 0, b'1', b'1', b'1', '', '2023-10-29 11:12:35', '1', '2023-10-29 19:13:01', b'0');
INSERT INTO `system_menu` VALUES (2411, '商机查询', 'crm:business:query', 3, 1, 2410, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 11:12:35', '', '2023-10-29 11:12:35', b'0');
INSERT INTO `system_menu` VALUES (2412, '商机创建', 'crm:business:create', 3, 2, 2410, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 11:12:35', '', '2023-10-29 11:12:35', b'0');
INSERT INTO `system_menu` VALUES (2413, '商机更新', 'crm:business:update', 3, 3, 2410, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 11:12:35', '', '2023-10-29 11:12:35', b'0');
INSERT INTO `system_menu` VALUES (2414, '商机删除', 'crm:business:delete', 3, 4, 2410, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 11:12:35', '', '2023-10-29 11:12:35', b'0');
INSERT INTO `system_menu` VALUES (2415, '商机导出', 'crm:business:export', 3, 5, 2410, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 11:12:35', '', '2023-10-29 11:12:35', b'0');
INSERT INTO `system_menu` VALUES (2416, '联系人管理', '', 2, 0, 2397, 'contact', 'fa:address-book-o', 'crm/contact/index', 'Contact', 0, b'1', b'1', b'1', '', '2023-10-29 11:14:56', '1', '2023-10-29 19:15:32', b'0');
INSERT INTO `system_menu` VALUES (2417, '联系人查询', 'crm:contact:query', 3, 1, 2416, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 11:14:56', '', '2023-10-29 11:14:56', b'0');
INSERT INTO `system_menu` VALUES (2418, '联系人创建', 'crm:contact:create', 3, 2, 2416, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 11:14:56', '', '2023-10-29 11:14:56', b'0');
INSERT INTO `system_menu` VALUES (2419, '联系人更新', 'crm:contact:update', 3, 3, 2416, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 11:14:56', '', '2023-10-29 11:14:56', b'0');
INSERT INTO `system_menu` VALUES (2420, '联系人删除', 'crm:contact:delete', 3, 4, 2416, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 11:14:56', '', '2023-10-29 11:14:56', b'0');
INSERT INTO `system_menu` VALUES (2421, '联系人导出', 'crm:contact:export', 3, 5, 2416, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 11:14:56', '', '2023-10-29 11:14:56', b'0');
INSERT INTO `system_menu` VALUES (2422, '回款管理', '', 2, 0, 2397, 'receivable', 'ep:money', 'crm/receivable/index', 'CrmReceivable', 0, b'1', b'1', b'1', '', '2023-10-29 11:18:09', '1', '2023-10-29 19:18:52', b'0');
INSERT INTO `system_menu` VALUES (2423, '回款管理查询', 'crm:receivable:query', 3, 1, 2422, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 11:18:09', '', '2023-10-29 11:18:09', b'0');
INSERT INTO `system_menu` VALUES (2424, '回款管理创建', 'crm:receivable:create', 3, 2, 2422, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 11:18:09', '', '2023-10-29 11:18:09', b'0');
INSERT INTO `system_menu` VALUES (2425, '回款管理更新', 'crm:receivable:update', 3, 3, 2422, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 11:18:09', '', '2023-10-29 11:18:09', b'0');
INSERT INTO `system_menu` VALUES (2426, '回款管理删除', 'crm:receivable:delete', 3, 4, 2422, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 11:18:09', '', '2023-10-29 11:18:09', b'0');
INSERT INTO `system_menu` VALUES (2427, '回款管理导出', 'crm:receivable:export', 3, 5, 2422, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 11:18:09', '', '2023-10-29 11:18:09', b'0');
INSERT INTO `system_menu` VALUES (2428, '回款计划管理', '', 2, 0, 2397, 'receivable-plan', 'fa:money', 'crm/receivablePlan/index', 'CrmReceivablePlan', 0, b'1', b'1', b'1', '', '2023-10-29 11:18:09', '1', '2023-10-29 19:19:08', b'0');
INSERT INTO `system_menu` VALUES (2429, '回款计划查询', 'crm:receivable-plan:query', 3, 1, 2428, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 11:18:09', '', '2023-10-29 11:18:09', b'0');
INSERT INTO `system_menu` VALUES (2430, '回款计划创建', 'crm:receivable-plan:create', 3, 2, 2428, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 11:18:09', '', '2023-10-29 11:18:09', b'0');
INSERT INTO `system_menu` VALUES (2431, '回款计划更新', 'crm:receivable-plan:update', 3, 3, 2428, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 11:18:09', '', '2023-10-29 11:18:09', b'0');
INSERT INTO `system_menu` VALUES (2432, '回款计划删除', 'crm:receivable-plan:delete', 3, 4, 2428, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 11:18:09', '', '2023-10-29 11:18:09', b'0');
INSERT INTO `system_menu` VALUES (2433, '回款计划导出', 'crm:receivable-plan:export', 3, 5, 2428, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 11:18:09', '', '2023-10-29 11:18:09', b'0');
INSERT INTO `system_menu` VALUES (2434, '核销订单', '', 2, 2, 2166, 'pick-up-order', 'ep:list', 'mall/trade/delivery/pickUpOrder/index', 'PickUpOrder', 0, b'1', b'1', b'1', '', '2023-10-29 14:19:25', '', '2023-10-29 14:19:25', b'0');
INSERT INTO `system_menu` VALUES (2435, '商城装修', '', 2, 20, 2030, 'diy-template', 'fa6-solid:brush', 'mall/promotion/diy/template/index', 'DiyTemplate', 0, b'1', b'1', b'1', '', '2023-10-29 14:19:25', '', '2023-10-29 14:19:25', b'0');
INSERT INTO `system_menu` VALUES (2436, '装修模板', '', 2, 1, 2435, 'diy-template', 'fa6-solid:brush', 'mall/promotion/diy/template/index', 'DiyTemplate', 0, b'1', b'1', b'1', '', '2023-10-29 14:19:25', '', '2023-10-29 14:19:25', b'0');
INSERT INTO `system_menu` VALUES (2437, '装修模板查询', 'promotion:diy-template:query', 3, 1, 2436, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 14:19:25', '', '2023-10-29 14:19:25', b'0');
INSERT INTO `system_menu` VALUES (2438, '装修模板创建', 'promotion:diy-template:create', 3, 2, 2436, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 14:19:25', '', '2023-10-29 14:19:25', b'0');
INSERT INTO `system_menu` VALUES (2439, '装修模板更新', 'promotion:diy-template:update', 3, 3, 2436, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 14:19:25', '', '2023-10-29 14:19:25', b'0');
INSERT INTO `system_menu` VALUES (2440, '装修模板删除', 'promotion:diy-template:delete', 3, 4, 2436, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 14:19:25', '', '2023-10-29 14:19:25', b'0');
INSERT INTO `system_menu` VALUES (2441, '装修模板使用', 'promotion:diy-template:use', 3, 5, 2436, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 14:19:25', '', '2023-10-29 14:19:25', b'0');
INSERT INTO `system_menu` VALUES (2442, '装修页面', '', 2, 2, 2435, 'diy-page', 'foundation:page-edit', 'mall/promotion/diy/page/index', 'DiyPage', 0, b'1', b'1', b'1', '', '2023-10-29 14:19:25', '', '2023-10-29 14:19:25', b'0');
INSERT INTO `system_menu` VALUES (2443, '装修页面查询', 'promotion:diy-page:query', 3, 1, 2442, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 14:19:25', '', '2023-10-29 14:19:25', b'0');
INSERT INTO `system_menu` VALUES (2444, '装修页面创建', 'promotion:diy-page:create', 3, 2, 2442, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 14:19:26', '', '2023-10-29 14:19:26', b'0');
INSERT INTO `system_menu` VALUES (2445, '装修页面更新', 'promotion:diy-page:update', 3, 3, 2442, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 14:19:26', '', '2023-10-29 14:19:26', b'0');
INSERT INTO `system_menu` VALUES (2446, '装修页面删除', 'promotion:diy-page:delete', 3, 4, 2442, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-29 14:19:26', '', '2023-10-29 14:19:26', b'0');
INSERT INTO `system_menu` VALUES (2447, '三方登录', '', 1, 10, 1, 'social', 'fa:500px', '', '', 0, b'1', b'1', b'1', '1', '2023-11-04 12:12:01', '1', '2023-11-04 13:06:45', b'0');
INSERT INTO `system_menu` VALUES (2448, '三方应用', '', 2, 1, 2447, 'client', 'ep:set-up', 'views/system/social/client/index.vue', 'SocialClient', 0, b'1', b'1', b'1', '1', '2023-11-04 12:17:19', '1', '2023-11-04 12:17:19', b'0');
INSERT INTO `system_menu` VALUES (2449, '三方应用查询', 'system:social-client:query', 3, 1, 2448, '', '', '', '', 0, b'1', b'1', b'1', '1', '2023-11-04 12:43:12', '1', '2023-11-04 12:43:33', b'0');
INSERT INTO `system_menu` VALUES (2450, '三方应用创建', 'system:social-client:create', 3, 2, 2448, '', '', '', '', 0, b'1', b'1', b'1', '1', '2023-11-04 12:43:58', '1', '2023-11-04 12:43:58', b'0');
INSERT INTO `system_menu` VALUES (2451, '三方应用更新', 'system:social-client:update', 3, 3, 2448, '', '', '', '', 0, b'1', b'1', b'1', '1', '2023-11-04 12:44:27', '1', '2023-11-04 12:44:27', b'0');
INSERT INTO `system_menu` VALUES (2452, '三方应用删除', 'system:social-client:delete', 3, 4, 2448, '', '', '', '', 0, b'1', b'1', b'1', '1', '2023-11-04 12:44:43', '1', '2023-11-04 12:44:43', b'0');
INSERT INTO `system_menu` VALUES (2453, '三方用户', 'system:social-user:query', 2, 2, 2447, 'user', 'ep:avatar', 'system/social/user/index.vue', 'SocialUser', 0, b'1', b'1', b'1', '1', '2023-11-04 14:01:05', '1', '2023-11-04 14:01:05', b'0');
INSERT INTO `system_menu` VALUES (2472, '主子表（内嵌）', '', 2, 12, 1070, 'demo03-inner', 'fa:power-off', 'infra/demo/demo03/inner/index', 'Demo03StudentInner', 0, b'1', b'1', b'1', '', '2023-11-13 04:39:51', '1', '2023-11-16 23:53:46', b'0');
INSERT INTO `system_menu` VALUES (2478, '单表（增删改查）', '', 2, 1, 1070, 'demo01-contact', 'ep:bicycle', 'infra/demo/demo01/index', 'Demo01Contact', 0, b'1', b'1', b'1', '', '2023-11-15 14:42:30', '1', '2023-11-16 20:34:40', b'0');
INSERT INTO `system_menu` VALUES (2479, '示例联系人查询', 'infra:demo01-contact:query', 3, 1, 2478, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-15 14:42:30', '', '2023-11-15 14:42:30', b'0');
INSERT INTO `system_menu` VALUES (2480, '示例联系人创建', 'infra:demo01-contact:create', 3, 2, 2478, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-15 14:42:30', '', '2023-11-15 14:42:30', b'0');
INSERT INTO `system_menu` VALUES (2481, '示例联系人更新', 'infra:demo01-contact:update', 3, 3, 2478, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-15 14:42:30', '', '2023-11-15 14:42:30', b'0');
INSERT INTO `system_menu` VALUES (2482, '示例联系人删除', 'infra:demo01-contact:delete', 3, 4, 2478, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-15 14:42:30', '', '2023-11-15 14:42:30', b'0');
INSERT INTO `system_menu` VALUES (2483, '示例联系人导出', 'infra:demo01-contact:export', 3, 5, 2478, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-15 14:42:30', '', '2023-11-15 14:42:30', b'0');
INSERT INTO `system_menu` VALUES (2484, '树表（增删改查）', '', 2, 2, 1070, 'demo02-category', 'fa:tree', 'infra/demo/demo02/index', 'Demo02Category', 0, b'1', b'1', b'1', '', '2023-11-16 12:18:27', '1', '2023-11-16 20:35:01', b'0');
INSERT INTO `system_menu` VALUES (2485, '示例分类查询', 'infra:demo02-category:query', 3, 1, 2484, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-16 12:18:27', '', '2023-11-16 12:18:27', b'0');
INSERT INTO `system_menu` VALUES (2486, '示例分类创建', 'infra:demo02-category:create', 3, 2, 2484, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-16 12:18:27', '', '2023-11-16 12:18:27', b'0');
INSERT INTO `system_menu` VALUES (2487, '示例分类更新', 'infra:demo02-category:update', 3, 3, 2484, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-16 12:18:27', '', '2023-11-16 12:18:27', b'0');
INSERT INTO `system_menu` VALUES (2488, '示例分类删除', 'infra:demo02-category:delete', 3, 4, 2484, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-16 12:18:27', '', '2023-11-16 12:18:27', b'0');
INSERT INTO `system_menu` VALUES (2489, '示例分类导出', 'infra:demo02-category:export', 3, 5, 2484, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-16 12:18:27', '', '2023-11-16 12:18:27', b'0');
INSERT INTO `system_menu` VALUES (2490, '主子表（标准）', '', 2, 10, 1070, 'demo03-normal', 'fa:battery-3', 'infra/demo/demo03/normal/index', 'Demo03StudentNormal', 0, b'1', b'1', b'1', '', '2023-11-16 12:53:37', '1', '2023-11-16 23:10:03', b'0');
INSERT INTO `system_menu` VALUES (2491, '学生查询', 'infra:demo03-student:query', 3, 1, 2490, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-16 12:53:37', '', '2023-11-16 12:53:37', b'0');
INSERT INTO `system_menu` VALUES (2492, '学生创建', 'infra:demo03-student:create', 3, 2, 2490, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-16 12:53:37', '', '2023-11-16 12:53:37', b'0');
INSERT INTO `system_menu` VALUES (2493, '学生更新', 'infra:demo03-student:update', 3, 3, 2490, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-16 12:53:37', '', '2023-11-16 12:53:37', b'0');
INSERT INTO `system_menu` VALUES (2494, '学生删除', 'infra:demo03-student:delete', 3, 4, 2490, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-16 12:53:37', '', '2023-11-16 12:53:37', b'0');
INSERT INTO `system_menu` VALUES (2495, '学生导出', 'infra:demo03-student:export', 3, 5, 2490, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-16 12:53:37', '', '2023-11-16 12:53:37', b'0');
INSERT INTO `system_menu` VALUES (2497, '主子表（ERP）', '', 2, 11, 1070, 'demo03-erp', 'ep:calendar', 'infra/demo/demo03/erp/index', 'Demo03StudentERP', 0, b'1', b'1', b'1', '', '2023-11-16 15:50:59', '1', '2023-11-17 13:19:56', b'0');
INSERT INTO `system_menu` VALUES (2504, '钱包管理', '', 1, 5, 1117, 'wallet', 'ep:caret-right', '', '', 0, b'1', b'1', b'1', '', '2023-11-29 15:04:49', '', '2023-11-29 15:04:49', b'0');
INSERT INTO `system_menu` VALUES (2505, '充值套餐', '', 2, 2, 2504, 'wallet-recharge-package', 'fa:leaf', 'pay/wallet/rechargePackage/index', 'WalletRechargePackage', 0, b'1', b'1', b'1', '', '2023-11-29 15:04:49', '', '2023-11-29 15:04:49', b'0');
INSERT INTO `system_menu` VALUES (2506, '钱包充值套餐查询', 'pay:wallet-recharge-package:query', 3, 1, 2505, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-29 15:04:49', '', '2023-11-29 15:04:49', b'0');
INSERT INTO `system_menu` VALUES (2507, '钱包充值套餐创建', 'pay:wallet-recharge-package:create', 3, 2, 2505, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-29 15:04:49', '', '2023-11-29 15:04:49', b'0');
INSERT INTO `system_menu` VALUES (2508, '钱包充值套餐更新', 'pay:wallet-recharge-package:update', 3, 3, 2505, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-29 15:04:49', '', '2023-11-29 15:04:49', b'0');
INSERT INTO `system_menu` VALUES (2509, '钱包充值套餐删除', 'pay:wallet-recharge-package:delete', 3, 4, 2505, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-29 15:04:49', '', '2023-11-29 15:04:49', b'0');
INSERT INTO `system_menu` VALUES (2510, '钱包余额', '', 2, 1, 2504, 'wallet-balance', 'fa:leaf', 'pay/wallet/balance/index', 'WalletBalance', 0, b'1', b'1', b'1', '', '2023-11-29 15:04:49', '', '2023-11-29 15:04:49', b'0');
INSERT INTO `system_menu` VALUES (2511, '钱包余额查询', 'pay:wallet:query', 3, 1, 2510, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-29 15:04:49', '', '2023-11-29 15:04:49', b'0');
INSERT INTO `system_menu` VALUES (2512, '接入示例', '', 1, 99, 1117, 'demo', 'ep:caret-right', '', '', 0, b'1', b'1', b'1', '', '2023-11-29 15:04:49', '', '2023-11-29 15:04:49', b'0');
INSERT INTO `system_menu` VALUES (2513, '支付实战', '', 2, 1, 2512, 'demo-order', 'fa:leaf', 'pay/demo/order/index', NULL, 0, b'1', b'1', b'1', '', '2023-11-29 15:04:49', '', '2023-11-29 15:04:49', b'0');
INSERT INTO `system_menu` VALUES (2514, '转账实战', '', 2, 1, 2512, 'demo-transfer', 'fa:leaf', 'pay/demo/transfer/index', NULL, 0, b'1', b'1', b'1', '', '2023-11-29 15:04:49', '', '2023-11-29 15:04:49', b'0');
INSERT INTO `system_menu` VALUES (2515, '转账订单', '', 2, 3, 1117, 'transfer', 'ep:credit-card', 'pay/transfer/index', 'PayTransfer', 0, b'1', b'1', b'1', '', '2023-11-29 15:04:49', '', '2023-11-29 15:04:49', b'0');
INSERT INTO `system_menu` VALUES (2516, '客户公海配置', '', 2, 0, 2397, 'customer-pool-config', 'ep:data-analysis', 'crm/customerPoolConf/index', 'CustomerPoolConf', 0, b'1', b'1', b'1', '', '2023-11-29 15:05:10', '', '2023-11-29 15:05:10', b'0');
INSERT INTO `system_menu` VALUES (2517, '客户公海配置保存', 'crm:customer-pool-config:update', 3, 1, 2516, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-29 15:05:10', '', '2023-11-29 15:05:10', b'0');
INSERT INTO `system_menu` VALUES (2518, '客户限制配置管理', '', 2, 0, 2397, 'customer-limit-config', '', 'crm/customerLimitConfig/index', 'CrmCustomerLimitConfig', 0, b'1', b'1', b'1', '', '2023-11-29 15:05:10', '', '2023-11-29 15:05:10', b'0');
INSERT INTO `system_menu` VALUES (2519, '客户限制配置查询', 'crm:customer-limit-config:query', 3, 1, 2518, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-29 15:05:10', '', '2023-11-29 15:05:10', b'0');
INSERT INTO `system_menu` VALUES (2520, '客户限制配置创建', 'crm:customer-limit-config:create', 3, 2, 2518, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-29 15:05:10', '', '2023-11-29 15:05:10', b'0');
INSERT INTO `system_menu` VALUES (2521, '客户限制配置更新', 'crm:customer-limit-config:update', 3, 3, 2518, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-29 15:05:10', '', '2023-11-29 15:05:10', b'0');
INSERT INTO `system_menu` VALUES (2522, '客户限制配置删除', 'crm:customer-limit-config:delete', 3, 4, 2518, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-29 15:05:10', '', '2023-11-29 15:05:10', b'0');
INSERT INTO `system_menu` VALUES (2523, '客户限制配置导出', 'crm:customer-limit-config:export', 3, 5, 2518, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-29 15:05:10', '', '2023-11-29 15:05:10', b'0');

-- ----------------------------
-- Table structure for system_notice
-- ----------------------------
DROP TABLE IF EXISTS `system_notice`;
CREATE TABLE `system_notice`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告内容',
  `type` tinyint(4) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '公告状态（0正常 1关闭）',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_notice
-- ----------------------------
INSERT INTO `system_notice` VALUES (1, '芋道的公众', '<p>新版本内容133</p>', 1, 0, 'admin', '2021-01-05 17:03:48', '1', '2022-05-04 21:00:20', b'0', 1);
INSERT INTO `system_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '<p><img src=\"http://test.yudao.iocoder.cn/b7cb3cf49b4b3258bf7309a09dd2f4e5.jpg\" alt=\"\" data-href=\"\" style=\"\"/>1111</p>', 2, 1, 'admin', '2021-01-05 17:03:48', '1', '2023-11-11 12:51:11', b'0', 1);
INSERT INTO `system_notice` VALUES (4, '我是测试标题', '<p>哈哈哈哈123</p>', 1, 0, '110', '2022-02-22 01:01:25', '110', '2022-02-22 01:01:46', b'0', 121);

-- ----------------------------
-- Table structure for system_notify_message
-- ----------------------------
DROP TABLE IF EXISTS `system_notify_message`;
CREATE TABLE `system_notify_message`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `user_type` tinyint(4) NOT NULL COMMENT '用户类型',
  `template_id` bigint(20) NOT NULL COMMENT '模版编号',
  `template_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板编码',
  `template_nickname` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模版发送人名称',
  `template_content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模版内容',
  `template_type` int(11) NOT NULL COMMENT '模版类型',
  `template_params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模版参数',
  `read_status` bit(1) NOT NULL COMMENT '是否已读',
  `read_time` datetime(0) NULL DEFAULT NULL COMMENT '阅读时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '站内信消息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_notify_message
-- ----------------------------
INSERT INTO `system_notify_message` VALUES (2, 1, 2, 1, 'test', '123', '我是 1，我开始 2 了', 1, '{\"name\":\"1\",\"what\":\"2\"}', b'1', '2023-02-10 00:47:04', '1', '2023-01-28 11:44:08', '1', '2023-02-10 00:47:04', b'0', 1);
INSERT INTO `system_notify_message` VALUES (3, 1, 2, 1, 'test', '123', '我是 1，我开始 2 了', 1, '{\"name\":\"1\",\"what\":\"2\"}', b'1', '2023-02-10 00:47:04', '1', '2023-01-28 11:45:04', '1', '2023-02-10 00:47:04', b'0', 1);
INSERT INTO `system_notify_message` VALUES (4, 103, 2, 2, 'register', '系统消息', '你好，欢迎 哈哈 加入大家庭！', 2, '{\"name\":\"哈哈\"}', b'0', NULL, '1', '2023-01-28 21:02:20', '1', '2023-01-28 21:02:20', b'0', 1);
INSERT INTO `system_notify_message` VALUES (5, 1, 2, 1, 'test', '123', '我是 芋艿，我开始 写代码 了', 1, '{\"name\":\"芋艿\",\"what\":\"写代码\"}', b'1', '2023-02-10 00:47:04', '1', '2023-01-28 22:21:42', '1', '2023-02-10 00:47:04', b'0', 1);
INSERT INTO `system_notify_message` VALUES (6, 1, 2, 1, 'test', '123', '我是 芋艿，我开始 写代码 了', 1, '{\"name\":\"芋艿\",\"what\":\"写代码\"}', b'1', '2023-01-29 10:52:06', '1', '2023-01-28 22:22:07', '1', '2023-01-29 10:52:06', b'0', 1);
INSERT INTO `system_notify_message` VALUES (7, 1, 2, 1, 'test', '123', '我是 2，我开始 3 了', 1, '{\"name\":\"2\",\"what\":\"3\"}', b'1', '2023-01-29 10:52:06', '1', '2023-01-28 23:45:21', '1', '2023-01-29 10:52:06', b'0', 1);
INSERT INTO `system_notify_message` VALUES (8, 1, 2, 2, 'register', '系统消息', '你好，欢迎 123 加入大家庭！', 2, '{\"name\":\"123\"}', b'1', '2023-01-29 10:52:06', '1', '2023-01-28 23:50:21', '1', '2023-01-29 10:52:06', b'0', 1);
INSERT INTO `system_notify_message` VALUES (9, 247, 1, 4, 'brokerage_withdraw_audit_approve', 'system', '您在2023-09-28 08:35:46提现￥0.09元的申请已通过审核', 2, '{\"reason\":null,\"createTime\":\"2023-09-28 08:35:46\",\"price\":\"0.09\"}', b'0', NULL, '1', '2023-09-28 16:36:22', '1', '2023-09-28 16:36:22', b'0', 1);
INSERT INTO `system_notify_message` VALUES (10, 247, 1, 4, 'brokerage_withdraw_audit_approve', 'system', '您在2023-09-30 20:59:40提现￥1.00元的申请已通过审核', 2, '{\"reason\":null,\"createTime\":\"2023-09-30 20:59:40\",\"price\":\"1.00\"}', b'0', NULL, '1', '2023-10-03 12:11:34', '1', '2023-10-03 12:11:34', b'0', 1);

-- ----------------------------
-- Table structure for system_notify_template
-- ----------------------------
DROP TABLE IF EXISTS `system_notify_template`;
CREATE TABLE `system_notify_template`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板名称',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模版编码',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发送人名称',
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模版内容',
  `type` tinyint(4) NOT NULL COMMENT '类型',
  `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '参数数组',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '站内信模板表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_notify_template
-- ----------------------------

-- ----------------------------
-- Table structure for system_oauth2_access_token
-- ----------------------------
DROP TABLE IF EXISTS `system_oauth2_access_token`;
CREATE TABLE `system_oauth2_access_token`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `user_type` tinyint(4) NOT NULL COMMENT '用户类型',
  `access_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '访问令牌',
  `refresh_token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '刷新令牌',
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户端编号',
  `scopes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '授权范围',
  `expires_time` datetime(0) NOT NULL COMMENT '过期时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_access_token`(`access_token`) USING BTREE,
  INDEX `idx_refresh_token`(`refresh_token`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3469 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'OAuth2 访问令牌' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_oauth2_access_token
-- ----------------------------
INSERT INTO `system_oauth2_access_token` VALUES (3467, 1, 2, 'e888e005176142a19362c6f2476ff356', 'ff4a68c97bd743369fb06cce9ed64be2', 'default', NULL, '2023-11-29 15:23:33', NULL, '2023-11-29 14:53:33', NULL, '2023-11-29 15:24:17', b'1', 1);
INSERT INTO `system_oauth2_access_token` VALUES (3468, 1, 2, 'adfdc41e9a1c45b1b780e72d9d8006e9', 'ff4a68c97bd743369fb06cce9ed64be2', 'default', NULL, '2023-11-29 15:54:17', NULL, '2023-11-29 15:24:17', NULL, '2023-11-29 15:24:17', b'0', 1);

-- ----------------------------
-- Table structure for system_oauth2_approve
-- ----------------------------
DROP TABLE IF EXISTS `system_oauth2_approve`;
CREATE TABLE `system_oauth2_approve`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `user_type` tinyint(4) NOT NULL COMMENT '用户类型',
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户端编号',
  `scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '授权范围',
  `approved` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否接受',
  `expires_time` datetime(0) NOT NULL COMMENT '过期时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 82 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'OAuth2 批准表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_oauth2_approve
-- ----------------------------

-- ----------------------------
-- Table structure for system_oauth2_client
-- ----------------------------
DROP TABLE IF EXISTS `system_oauth2_client`;
CREATE TABLE `system_oauth2_client`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户端编号',
  `secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户端密钥',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用名',
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用图标',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '应用描述',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `access_token_validity_seconds` int(11) NOT NULL COMMENT '访问令牌的有效期',
  `refresh_token_validity_seconds` int(11) NOT NULL COMMENT '刷新令牌的有效期',
  `redirect_uris` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '可重定向的 URI 地址',
  `authorized_grant_types` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '授权类型',
  `scopes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '授权范围',
  `auto_approve_scopes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '自动通过的授权范围',
  `authorities` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '权限',
  `resource_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '资源',
  `additional_information` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '附加信息',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'OAuth2 客户端表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_oauth2_client
-- ----------------------------
INSERT INTO `system_oauth2_client` VALUES (1, 'default', 'admin123', '芋道源码', 'http://test.yudao.iocoder.cn/a5e2e244368878a366b516805a4aabf1.png', '我是描述', 0, 1800, 43200, '[\"https://www.iocoder.cn\",\"https://doc.iocoder.cn\"]', '[\"password\",\"authorization_code\",\"implicit\",\"refresh_token\"]', '[\"user.read\",\"user.write\"]', '[]', '[\"user.read\",\"user.write\"]', '[]', '{}', '1', '2022-05-11 21:47:12', '1', '2022-07-05 16:23:52', b'0');
INSERT INTO `system_oauth2_client` VALUES (40, 'test', 'test2', 'biubiu', 'http://test.yudao.iocoder.cn/277a899d573723f1fcdfb57340f00379.png', NULL, 0, 1800, 43200, '[\"https://www.iocoder.cn\"]', '[\"password\",\"authorization_code\",\"implicit\"]', '[\"user_info\",\"projects\"]', '[\"user_info\"]', '[]', '[]', '{}', '1', '2022-05-12 00:28:20', '1', '2022-06-19 00:26:13', b'0');
INSERT INTO `system_oauth2_client` VALUES (41, 'yudao-sso-demo-by-code', 'test', '基于授权码模式，如何实现 SSO 单点登录？', 'http://test.yudao.iocoder.cn/fe4ed36596adad5120036ef61a6d0153654544d44af8dd4ad3ffe8f759933d6f.png', NULL, 0, 1800, 43200, '[\"http://127.0.0.1:18080\"]', '[\"authorization_code\",\"refresh_token\"]', '[\"user.read\",\"user.write\"]', '[]', '[]', '[]', NULL, '1', '2022-09-29 13:28:31', '1', '2022-09-29 13:28:31', b'0');
INSERT INTO `system_oauth2_client` VALUES (42, 'yudao-sso-demo-by-password', 'test', '基于密码模式，如何实现 SSO 单点登录？', 'http://test.yudao.iocoder.cn/604bdc695e13b3b22745be704d1f2aa8ee05c5f26f9fead6d1ca49005afbc857.jpeg', NULL, 0, 1800, 43200, '[\"http://127.0.0.1:18080\"]', '[\"password\",\"refresh_token\"]', '[\"user.read\",\"user.write\"]', '[]', '[]', '[]', NULL, '1', '2022-10-04 17:40:16', '1', '2022-10-04 20:31:21', b'0');

-- ----------------------------
-- Table structure for system_oauth2_code
-- ----------------------------
DROP TABLE IF EXISTS `system_oauth2_code`;
CREATE TABLE `system_oauth2_code`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `user_type` tinyint(4) NOT NULL COMMENT '用户类型',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '授权码',
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户端编号',
  `scopes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '授权范围',
  `expires_time` datetime(0) NOT NULL COMMENT '过期时间',
  `redirect_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '可重定向的 URI 地址',
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '状态',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 147 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'OAuth2 授权码表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_oauth2_code
-- ----------------------------

-- ----------------------------
-- Table structure for system_oauth2_refresh_token
-- ----------------------------
DROP TABLE IF EXISTS `system_oauth2_refresh_token`;
CREATE TABLE `system_oauth2_refresh_token`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `refresh_token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '刷新令牌',
  `user_type` tinyint(4) NOT NULL COMMENT '用户类型',
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户端编号',
  `scopes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '授权范围',
  `expires_time` datetime(0) NOT NULL COMMENT '过期时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1116 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'OAuth2 刷新令牌' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_oauth2_refresh_token
-- ----------------------------
INSERT INTO `system_oauth2_refresh_token` VALUES (1115, 1, 'ff4a68c97bd743369fb06cce9ed64be2', 2, 'default', NULL, '2023-11-30 02:53:33', NULL, '2023-11-29 14:53:33', NULL, '2023-11-29 14:53:33', b'0', 1);

-- ----------------------------
-- Table structure for system_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `system_operate_log`;
CREATE TABLE `system_operate_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `trace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '链路追踪编号',
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `user_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '用户类型',
  `module` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模块标题',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '操作名',
  `type` bigint(20) NOT NULL DEFAULT 0 COMMENT '操作分类',
  `content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作内容',
  `exts` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '拓展字段',
  `request_method` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '请求方法名',
  `request_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '请求地址',
  `user_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户 IP',
  `user_agent` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '浏览器 UA',
  `java_method` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Java 方法名',
  `java_method_args` varchar(8000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'Java 方法的参数',
  `start_time` datetime(0) NOT NULL COMMENT '操作时间',
  `duration` int(11) NOT NULL COMMENT '执行时长',
  `result_code` int(11) NOT NULL DEFAULT 0 COMMENT '结果码',
  `result_msg` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '结果提示',
  `result_data` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '结果数据',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9090 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_operate_log
-- ----------------------------

-- ----------------------------
-- Table structure for system_post
-- ----------------------------
DROP TABLE IF EXISTS `system_post`;
CREATE TABLE `system_post`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位编码',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位名称',
  `sort` int(11) NOT NULL COMMENT '显示顺序',
  `status` tinyint(4) NOT NULL COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_post
-- ----------------------------
INSERT INTO `system_post` VALUES (1, 'ceo', '董事长', 1, 0, '', 'admin', '2021-01-06 17:03:48', '1', '2023-02-11 15:19:04', b'0', 1);
INSERT INTO `system_post` VALUES (2, 'se', '项目经理', 2, 0, '', 'admin', '2021-01-05 17:03:48', '1', '2023-11-15 09:18:20', b'0', 1);
INSERT INTO `system_post` VALUES (4, 'user', '普通员工', 4, 0, '111', 'admin', '2021-01-05 17:03:48', '1', '2023-11-15 09:18:18', b'0', 1);

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色权限字符串',
  `sort` int(11) NOT NULL COMMENT '显示顺序',
  `data_scope` tinyint(4) NOT NULL DEFAULT 1 COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `data_scope_dept_ids` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '数据范围(指定部门数组)',
  `status` tinyint(4) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `type` tinyint(4) NOT NULL COMMENT '角色类型',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 140 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_role
-- ----------------------------
INSERT INTO `system_role` VALUES (1, '超级管理员', 'super_admin', 1, 1, '', 0, 1, '超级管理员', 'admin', '2021-01-05 17:03:48', '', '2022-02-22 05:08:21', b'0', 1);
INSERT INTO `system_role` VALUES (2, '普通角色', 'common', 2, 2, '', 0, 1, '普通角色', 'admin', '2021-01-05 17:03:48', '', '2022-02-22 05:08:20', b'0', 1);
INSERT INTO `system_role` VALUES (101, '测试账号', 'test', 0, 1, '[]', 0, 2, '132', '', '2021-01-06 13:49:35', '1', '2023-07-25 23:53:32', b'0', 1);
INSERT INTO `system_role` VALUES (109, '租户管理员', 'tenant_admin', 0, 1, '', 0, 1, '系统自动生成', '1', '2022-02-22 00:56:14', '1', '2022-02-22 00:56:14', b'0', 121);
INSERT INTO `system_role` VALUES (110, '测试角色', 'test', 0, 1, '[]', 0, 2, '嘿嘿', '110', '2022-02-23 00:14:34', '110', '2022-02-23 13:14:58', b'0', 121);
INSERT INTO `system_role` VALUES (111, '租户管理员', 'tenant_admin', 0, 1, '', 0, 1, '系统自动生成', '1', '2022-03-07 21:37:58', '1', '2022-03-07 21:37:58', b'0', 122);
INSERT INTO `system_role` VALUES (113, '租户管理员', 'tenant_admin', 0, 1, '', 0, 1, '系统自动生成', '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_role` VALUES (114, '租户管理员', 'tenant_admin', 0, 1, '', 0, 1, '系统自动生成', '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role` VALUES (115, '租户管理员', 'tenant_admin', 0, 1, '', 0, 1, '系统自动生成', '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role` VALUES (116, '租户管理员', 'tenant_admin', 0, 1, '', 0, 1, '系统自动生成', '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role` VALUES (118, '租户管理员', 'tenant_admin', 0, 1, '', 0, 1, '系统自动生成', '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role` VALUES (136, '租户管理员', 'tenant_admin', 0, 1, '', 0, 1, '系统自动生成', '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role` VALUES (137, '租户管理员', 'tenant_admin', 0, 1, '', 0, 1, '系统自动生成', '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role` VALUES (138, '租户管理员', 'tenant_admin', 0, 1, '', 0, 1, '系统自动生成', '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role` VALUES (139, '租户管理员', 'tenant_admin', 0, 1, '', 0, 1, '系统自动生成', '1', '2023-07-25 23:06:04', '1', '2023-07-25 23:06:04', b'0', 150);

-- ----------------------------
-- Table structure for system_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_role_menu`;
CREATE TABLE `system_role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2901 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_role_menu
-- ----------------------------
INSERT INTO `system_role_menu` VALUES (263, 109, 1, '1', '2022-02-22 00:56:14', '1', '2022-02-22 00:56:14', b'0', 121);
INSERT INTO `system_role_menu` VALUES (434, 2, 1, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (454, 2, 1093, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (455, 2, 1094, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (460, 2, 1100, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (467, 2, 1107, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (470, 2, 1110, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (476, 2, 1117, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (477, 2, 100, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (478, 2, 101, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (479, 2, 102, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (480, 2, 1126, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (481, 2, 103, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (483, 2, 104, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (485, 2, 105, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (488, 2, 107, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (490, 2, 108, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (492, 2, 109, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (498, 2, 1138, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (523, 2, 1224, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (524, 2, 1225, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (541, 2, 500, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (543, 2, 501, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (675, 2, 2, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (689, 2, 1077, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (690, 2, 1078, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (692, 2, 1083, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (693, 2, 1084, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (699, 2, 1090, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (703, 2, 106, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (704, 2, 110, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (705, 2, 111, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (706, 2, 112, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (707, 2, 113, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1296, 110, 1, '110', '2022-02-23 00:23:55', '110', '2022-02-23 00:23:55', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1489, 1, 1, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1490, 1, 2, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1494, 1, 1077, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1495, 1, 1078, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1496, 1, 1083, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1497, 1, 1084, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1498, 1, 1090, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1499, 1, 1093, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1500, 1, 1094, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1501, 1, 1100, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1502, 1, 1107, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1503, 1, 1110, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1505, 1, 1117, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1506, 1, 100, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1507, 1, 101, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1508, 1, 102, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1509, 1, 1126, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1510, 1, 103, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1511, 1, 104, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1512, 1, 105, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1513, 1, 106, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1514, 1, 107, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1515, 1, 108, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1516, 1, 109, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1517, 1, 110, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1518, 1, 111, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1519, 1, 112, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1520, 1, 113, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1522, 1, 1138, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1525, 1, 1224, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1526, 1, 1225, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1527, 1, 500, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1528, 1, 501, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1578, 111, 1, '1', '2022-03-07 21:37:58', '1', '2022-03-07 21:37:58', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1604, 101, 1216, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1605, 101, 1217, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1606, 101, 1218, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1607, 101, 1219, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1608, 101, 1220, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1609, 101, 1221, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1610, 101, 5, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1611, 101, 1222, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1612, 101, 1118, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1613, 101, 1119, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1614, 101, 1120, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1615, 101, 1185, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1616, 101, 1186, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1617, 101, 1187, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1618, 101, 1188, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1619, 101, 1189, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1620, 101, 1190, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1621, 101, 1191, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1622, 101, 1192, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1623, 101, 1193, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1624, 101, 1194, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1625, 101, 1195, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1626, 101, 1196, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1627, 101, 1197, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1628, 101, 1198, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1629, 101, 1199, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1630, 101, 1200, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1631, 101, 1201, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1632, 101, 1202, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1633, 101, 1207, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1634, 101, 1208, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1635, 101, 1209, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1636, 101, 1210, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1637, 101, 1211, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1638, 101, 1212, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1639, 101, 1213, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1640, 101, 1215, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1641, 101, 2, '1', '2022-04-01 22:21:24', '1', '2022-04-01 22:21:24', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1642, 101, 1031, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1643, 101, 1032, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1644, 101, 1033, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1645, 101, 1034, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1646, 101, 1035, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1647, 101, 1050, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1648, 101, 1051, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1649, 101, 1052, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1650, 101, 1053, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1651, 101, 1054, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1652, 101, 1056, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1653, 101, 1057, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1654, 101, 1058, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1655, 101, 1059, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1656, 101, 1060, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1657, 101, 1066, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1658, 101, 1067, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1659, 101, 1070, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1664, 101, 1075, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1665, 101, 1076, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1666, 101, 1077, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1667, 101, 1078, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1668, 101, 1082, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1669, 101, 1083, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1670, 101, 1084, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1671, 101, 1085, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1672, 101, 1086, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1673, 101, 1087, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1674, 101, 1088, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1675, 101, 1089, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1679, 101, 1237, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1680, 101, 1238, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1681, 101, 1239, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1682, 101, 1240, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1683, 101, 1241, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1684, 101, 1242, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1685, 101, 1243, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1687, 101, 106, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1688, 101, 110, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1689, 101, 111, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1690, 101, 112, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1691, 101, 113, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1692, 101, 114, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1693, 101, 115, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1694, 101, 116, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1712, 113, 1024, '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_role_menu` VALUES (1713, 113, 1025, '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_role_menu` VALUES (1714, 113, 1, '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_role_menu` VALUES (1715, 113, 102, '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_role_menu` VALUES (1716, 113, 103, '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_role_menu` VALUES (1717, 113, 104, '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_role_menu` VALUES (1718, 113, 1013, '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_role_menu` VALUES (1719, 113, 1014, '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_role_menu` VALUES (1720, 113, 1015, '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_role_menu` VALUES (1721, 113, 1016, '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_role_menu` VALUES (1722, 113, 1017, '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_role_menu` VALUES (1723, 113, 1018, '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_role_menu` VALUES (1724, 113, 1019, '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_role_menu` VALUES (1725, 113, 1020, '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_role_menu` VALUES (1726, 113, 1021, '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_role_menu` VALUES (1727, 113, 1022, '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_role_menu` VALUES (1728, 113, 1023, '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_role_menu` VALUES (1729, 109, 100, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1730, 109, 101, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1731, 109, 1063, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1732, 109, 1064, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1733, 109, 1001, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1734, 109, 1065, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1735, 109, 1002, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1736, 109, 1003, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1737, 109, 1004, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1738, 109, 1005, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1739, 109, 1006, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1740, 109, 1007, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1741, 109, 1008, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1742, 109, 1009, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1743, 109, 1010, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1744, 109, 1011, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1745, 109, 1012, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1746, 111, 100, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1747, 111, 101, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1748, 111, 1063, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1749, 111, 1064, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1750, 111, 1001, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1751, 111, 1065, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1752, 111, 1002, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1753, 111, 1003, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1754, 111, 1004, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1755, 111, 1005, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1756, 111, 1006, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1757, 111, 1007, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1758, 111, 1008, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1759, 111, 1009, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1760, 111, 1010, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1761, 111, 1011, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1762, 111, 1012, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1763, 109, 100, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1764, 109, 101, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1765, 109, 1063, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1766, 109, 1064, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1767, 109, 1001, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1768, 109, 1065, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1769, 109, 1002, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1770, 109, 1003, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1771, 109, 1004, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1772, 109, 1005, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1773, 109, 1006, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1774, 109, 1007, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1775, 109, 1008, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1776, 109, 1009, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1777, 109, 1010, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1778, 109, 1011, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1779, 109, 1012, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1780, 111, 100, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1781, 111, 101, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1782, 111, 1063, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1783, 111, 1064, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1784, 111, 1001, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1785, 111, 1065, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1786, 111, 1002, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1787, 111, 1003, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1788, 111, 1004, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1789, 111, 1005, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1790, 111, 1006, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1791, 111, 1007, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1792, 111, 1008, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1793, 111, 1009, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1794, 111, 1010, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1795, 111, 1011, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1796, 111, 1012, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1797, 109, 100, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1798, 109, 101, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1799, 109, 1063, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1800, 109, 1064, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1801, 109, 1001, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1802, 109, 1065, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1803, 109, 1002, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1804, 109, 1003, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1805, 109, 1004, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1806, 109, 1005, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1807, 109, 1006, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1808, 109, 1007, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1809, 109, 1008, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1810, 109, 1009, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1811, 109, 1010, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1812, 109, 1011, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1813, 109, 1012, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1814, 111, 100, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1815, 111, 101, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1816, 111, 1063, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1817, 111, 1064, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1818, 111, 1001, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1819, 111, 1065, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1820, 111, 1002, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1821, 111, 1003, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1822, 111, 1004, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1823, 111, 1005, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1824, 111, 1006, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1825, 111, 1007, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1826, 111, 1008, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1827, 111, 1009, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1828, 111, 1010, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1829, 111, 1011, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1830, 111, 1012, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1831, 109, 103, '1', '2022-09-21 22:43:23', '1', '2022-09-21 22:43:23', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1832, 109, 1017, '1', '2022-09-21 22:43:23', '1', '2022-09-21 22:43:23', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1833, 109, 1018, '1', '2022-09-21 22:43:23', '1', '2022-09-21 22:43:23', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1834, 109, 1019, '1', '2022-09-21 22:43:23', '1', '2022-09-21 22:43:23', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1835, 109, 1020, '1', '2022-09-21 22:43:23', '1', '2022-09-21 22:43:23', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1836, 111, 103, '1', '2022-09-21 22:43:24', '1', '2022-09-21 22:43:24', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1837, 111, 1017, '1', '2022-09-21 22:43:24', '1', '2022-09-21 22:43:24', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1838, 111, 1018, '1', '2022-09-21 22:43:24', '1', '2022-09-21 22:43:24', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1839, 111, 1019, '1', '2022-09-21 22:43:24', '1', '2022-09-21 22:43:24', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1840, 111, 1020, '1', '2022-09-21 22:43:24', '1', '2022-09-21 22:43:24', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1841, 109, 1036, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1842, 109, 1037, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1843, 109, 1038, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1844, 109, 1039, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1845, 109, 107, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1846, 111, 1036, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1847, 111, 1037, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1848, 111, 1038, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1849, 111, 1039, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1850, 111, 107, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1851, 114, 1, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1852, 114, 1036, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1853, 114, 1037, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1854, 114, 1038, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1855, 114, 1039, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1856, 114, 100, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1857, 114, 101, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1858, 114, 1063, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1859, 114, 103, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1860, 114, 1064, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1861, 114, 1001, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1862, 114, 1065, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1863, 114, 1002, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1864, 114, 1003, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1865, 114, 107, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1866, 114, 1004, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1867, 114, 1005, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1868, 114, 1006, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1869, 114, 1007, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1870, 114, 1008, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1871, 114, 1009, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1872, 114, 1010, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1873, 114, 1011, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1874, 114, 1012, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1875, 114, 1017, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1876, 114, 1018, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1877, 114, 1019, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1878, 114, 1020, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1879, 115, 1, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1880, 115, 1036, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1881, 115, 1037, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1882, 115, 1038, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1883, 115, 1039, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1884, 115, 100, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1885, 115, 101, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1886, 115, 1063, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1887, 115, 103, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1888, 115, 1064, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1889, 115, 1001, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1890, 115, 1065, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1891, 115, 1002, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1892, 115, 1003, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1893, 115, 107, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1894, 115, 1004, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1895, 115, 1005, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1896, 115, 1006, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1897, 115, 1007, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1898, 115, 1008, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1899, 115, 1009, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1900, 115, 1010, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1901, 115, 1011, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1902, 115, 1012, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1903, 115, 1017, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1904, 115, 1018, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1905, 115, 1019, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1906, 115, 1020, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1907, 116, 1, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1908, 116, 1036, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1909, 116, 1037, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1910, 116, 1038, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1911, 116, 1039, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1912, 116, 100, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1913, 116, 101, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1914, 116, 1063, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1915, 116, 103, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1916, 116, 1064, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1917, 116, 1001, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1918, 116, 1065, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1919, 116, 1002, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1920, 116, 1003, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1921, 116, 107, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1922, 116, 1004, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1923, 116, 1005, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1924, 116, 1006, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1925, 116, 1007, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1926, 116, 1008, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1927, 116, 1009, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1928, 116, 1010, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1929, 116, 1011, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1930, 116, 1012, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1931, 116, 1017, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1932, 116, 1018, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1933, 116, 1019, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1934, 116, 1020, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1963, 118, 1, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1964, 118, 1036, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1965, 118, 1037, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1966, 118, 1038, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1967, 118, 1039, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1968, 118, 100, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1969, 118, 101, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1970, 118, 1063, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1971, 118, 103, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1972, 118, 1064, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1973, 118, 1001, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1974, 118, 1065, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1975, 118, 1002, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1976, 118, 1003, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1977, 118, 107, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1978, 118, 1004, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1979, 118, 1005, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1980, 118, 1006, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1981, 118, 1007, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1982, 118, 1008, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1983, 118, 1009, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1984, 118, 1010, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1985, 118, 1011, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1986, 118, 1012, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1987, 118, 1017, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1988, 118, 1018, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1989, 118, 1019, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1990, 118, 1020, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1991, 2, 1024, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1992, 2, 1025, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1993, 2, 1026, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1994, 2, 1027, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1995, 2, 1028, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1996, 2, 1029, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1997, 2, 1030, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1998, 2, 1031, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1999, 2, 1032, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2000, 2, 1033, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2001, 2, 1034, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2002, 2, 1035, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2003, 2, 1036, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2004, 2, 1037, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2005, 2, 1038, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2006, 2, 1039, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2007, 2, 1040, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2008, 2, 1042, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2009, 2, 1043, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2010, 2, 1045, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2011, 2, 1046, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2012, 2, 1048, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2013, 2, 1050, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2014, 2, 1051, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2015, 2, 1052, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2016, 2, 1053, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2017, 2, 1054, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2018, 2, 1056, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2019, 2, 1057, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2020, 2, 1058, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2021, 2, 2083, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2022, 2, 1059, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2023, 2, 1060, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2024, 2, 1063, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2025, 2, 1064, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2026, 2, 1065, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2027, 2, 1066, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2028, 2, 1067, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2029, 2, 1070, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2034, 2, 1075, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2035, 2, 1076, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2036, 2, 1082, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2037, 2, 1085, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2038, 2, 1086, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2039, 2, 1087, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2040, 2, 1088, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2041, 2, 1089, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2042, 2, 1091, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2043, 2, 1092, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2044, 2, 1095, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2045, 2, 1096, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2046, 2, 1097, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2047, 2, 1098, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2048, 2, 1101, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2049, 2, 1102, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2050, 2, 1103, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2051, 2, 1104, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2052, 2, 1105, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2053, 2, 1106, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2054, 2, 1108, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2055, 2, 1109, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2056, 2, 1111, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2057, 2, 1112, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2058, 2, 1113, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2059, 2, 1114, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2060, 2, 1115, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2061, 2, 1127, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2062, 2, 1128, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2063, 2, 1129, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2064, 2, 1130, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2066, 2, 1132, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2067, 2, 1133, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2068, 2, 1134, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2069, 2, 1135, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2070, 2, 1136, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2071, 2, 1137, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2072, 2, 114, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2073, 2, 1139, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2074, 2, 115, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2075, 2, 1140, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2076, 2, 116, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2077, 2, 1141, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2078, 2, 1142, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2079, 2, 1143, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2080, 2, 1150, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2081, 2, 1161, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2082, 2, 1162, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2083, 2, 1163, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2084, 2, 1164, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2085, 2, 1165, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2086, 2, 1166, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2087, 2, 1173, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2088, 2, 1174, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2089, 2, 1175, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2090, 2, 1176, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2091, 2, 1177, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2092, 2, 1178, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2099, 2, 1226, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2100, 2, 1227, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2101, 2, 1228, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2102, 2, 1229, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2103, 2, 1237, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2104, 2, 1238, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2105, 2, 1239, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2106, 2, 1240, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2107, 2, 1241, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2108, 2, 1242, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2109, 2, 1243, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2110, 2, 1247, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2111, 2, 1248, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2112, 2, 1249, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2113, 2, 1250, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2114, 2, 1251, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2115, 2, 1252, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2116, 2, 1254, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2117, 2, 1255, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2118, 2, 1256, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2119, 2, 1257, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2120, 2, 1258, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2121, 2, 1259, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2122, 2, 1260, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2123, 2, 1261, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2124, 2, 1263, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2125, 2, 1264, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2126, 2, 1265, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2127, 2, 1266, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2128, 2, 1267, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2129, 2, 1001, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2130, 2, 1002, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2131, 2, 1003, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2132, 2, 1004, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2133, 2, 1005, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2134, 2, 1006, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2135, 2, 1007, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2136, 2, 1008, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2137, 2, 1009, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2138, 2, 1010, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2139, 2, 1011, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2140, 2, 1012, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2141, 2, 1013, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2142, 2, 1014, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2143, 2, 1015, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2144, 2, 1016, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2145, 2, 1017, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2146, 2, 1018, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2147, 2, 1019, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2148, 2, 1020, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2149, 2, 1021, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2150, 2, 1022, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2151, 2, 1023, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2152, 2, 1281, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2153, 2, 1282, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2154, 2, 2000, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2155, 2, 2002, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2156, 2, 2003, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2157, 2, 2004, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2158, 2, 2005, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2159, 2, 2006, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2160, 2, 2008, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2161, 2, 2009, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2162, 2, 2010, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2163, 2, 2011, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2164, 2, 2012, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2170, 2, 2019, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2171, 2, 2020, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2172, 2, 2021, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2173, 2, 2022, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2174, 2, 2023, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2175, 2, 2025, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2177, 2, 2027, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2178, 2, 2028, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2179, 2, 2029, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2180, 2, 2014, '1', '2023-01-25 08:43:12', '1', '2023-01-25 08:43:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2181, 2, 2015, '1', '2023-01-25 08:43:12', '1', '2023-01-25 08:43:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2182, 2, 2016, '1', '2023-01-25 08:43:12', '1', '2023-01-25 08:43:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2183, 2, 2017, '1', '2023-01-25 08:43:12', '1', '2023-01-25 08:43:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2184, 2, 2018, '1', '2023-01-25 08:43:12', '1', '2023-01-25 08:43:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2188, 101, 1024, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2189, 101, 1, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2190, 101, 1025, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2191, 101, 1026, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2192, 101, 1027, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2193, 101, 1028, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2194, 101, 1029, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2195, 101, 1030, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2196, 101, 1036, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2197, 101, 1037, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2198, 101, 1038, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2199, 101, 1039, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2200, 101, 1040, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2201, 101, 1042, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2202, 101, 1043, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2203, 101, 1045, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2204, 101, 1046, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2205, 101, 1048, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2206, 101, 2083, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2207, 101, 1063, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2208, 101, 1064, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2209, 101, 1065, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2210, 101, 1093, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2211, 101, 1094, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2212, 101, 1095, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2213, 101, 1096, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2214, 101, 1097, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2215, 101, 1098, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2216, 101, 1100, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2217, 101, 1101, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2218, 101, 1102, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2219, 101, 1103, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2220, 101, 1104, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2221, 101, 1105, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2222, 101, 1106, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2223, 101, 2130, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2224, 101, 1107, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2225, 101, 2131, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2226, 101, 1108, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2227, 101, 2132, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2228, 101, 1109, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2229, 101, 2133, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2230, 101, 2134, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2231, 101, 1110, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2232, 101, 2135, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2233, 101, 1111, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2234, 101, 2136, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2235, 101, 1112, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2236, 101, 2137, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2237, 101, 1113, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2238, 101, 2138, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2239, 101, 1114, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2240, 101, 2139, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2241, 101, 1115, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2242, 101, 2140, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2243, 101, 2141, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2244, 101, 2142, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2245, 101, 2143, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2246, 101, 2144, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2247, 101, 2145, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2248, 101, 2146, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2249, 101, 2147, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2250, 101, 100, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2251, 101, 2148, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2252, 101, 101, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2253, 101, 2149, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2254, 101, 102, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2255, 101, 2150, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2256, 101, 103, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2257, 101, 2151, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2258, 101, 104, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2259, 101, 2152, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2260, 101, 105, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2261, 101, 107, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2262, 101, 108, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2263, 101, 109, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2264, 101, 1138, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2265, 101, 1139, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2266, 101, 1140, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2267, 101, 1141, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2268, 101, 1142, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2269, 101, 1143, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2270, 101, 1224, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2271, 101, 1225, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2272, 101, 1226, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2273, 101, 1227, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2274, 101, 1228, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2275, 101, 1229, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2276, 101, 1247, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2277, 101, 1248, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2278, 101, 1249, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2279, 101, 1250, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2280, 101, 1251, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2281, 101, 1252, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2282, 101, 1261, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2283, 101, 1263, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2284, 101, 1264, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2285, 101, 1265, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2286, 101, 1266, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2287, 101, 1267, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2288, 101, 1001, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2289, 101, 1002, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2290, 101, 1003, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2291, 101, 1004, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2292, 101, 1005, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2293, 101, 1006, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2294, 101, 1007, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2295, 101, 1008, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2296, 101, 1009, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2297, 101, 1010, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2298, 101, 1011, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2299, 101, 1012, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2300, 101, 500, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2301, 101, 1013, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2302, 101, 501, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2303, 101, 1014, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2304, 101, 1015, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2305, 101, 1016, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2306, 101, 1017, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2307, 101, 1018, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2308, 101, 1019, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2309, 101, 1020, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2310, 101, 1021, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2311, 101, 1022, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2312, 101, 1023, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2789, 136, 1, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2790, 136, 1036, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2791, 136, 1037, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2792, 136, 1038, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2793, 136, 1039, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2794, 136, 100, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2795, 136, 101, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2796, 136, 1063, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2797, 136, 103, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2798, 136, 1064, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2799, 136, 1001, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2800, 136, 1065, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2801, 136, 1002, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2802, 136, 1003, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2803, 136, 107, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2804, 136, 1004, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2805, 136, 1005, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2806, 136, 1006, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2807, 136, 1007, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2808, 136, 1008, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2809, 136, 1009, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2810, 136, 1010, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2811, 136, 1011, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2812, 136, 1012, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2813, 136, 1017, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2814, 136, 1018, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2815, 136, 1019, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2816, 136, 1020, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2817, 137, 1, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2818, 137, 1036, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2819, 137, 1037, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2820, 137, 1038, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2821, 137, 1039, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2822, 137, 100, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2823, 137, 101, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2824, 137, 1063, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2825, 137, 103, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2826, 137, 1064, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2827, 137, 1001, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2828, 137, 1065, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2829, 137, 1002, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2830, 137, 1003, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2831, 137, 107, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2832, 137, 1004, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2833, 137, 1005, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2834, 137, 1006, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2835, 137, 1007, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2836, 137, 1008, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2837, 137, 1009, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2838, 137, 1010, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2839, 137, 1011, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2840, 137, 1012, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2841, 137, 1017, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2842, 137, 1018, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2843, 137, 1019, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2844, 137, 1020, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2845, 138, 1, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2846, 138, 1036, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2847, 138, 1037, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2848, 138, 1038, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2849, 138, 1039, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2850, 138, 100, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2851, 138, 101, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2852, 138, 1063, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2853, 138, 103, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2854, 138, 1064, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2855, 138, 1001, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2856, 138, 1065, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2857, 138, 1002, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2858, 138, 1003, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2859, 138, 107, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2860, 138, 1004, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2861, 138, 1005, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2862, 138, 1006, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2863, 138, 1007, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2864, 138, 1008, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2865, 138, 1009, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2866, 138, 1010, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2867, 138, 1011, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2868, 138, 1012, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2869, 138, 1017, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2870, 138, 1018, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2871, 138, 1019, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2872, 138, 1020, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2873, 139, 1, '1', '2023-07-25 23:06:04', '1', '2023-07-25 23:06:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (2874, 139, 1036, '1', '2023-07-25 23:06:04', '1', '2023-07-25 23:06:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (2875, 139, 1037, '1', '2023-07-25 23:06:04', '1', '2023-07-25 23:06:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (2876, 139, 1038, '1', '2023-07-25 23:06:04', '1', '2023-07-25 23:06:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (2877, 139, 1039, '1', '2023-07-25 23:06:04', '1', '2023-07-25 23:06:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (2878, 139, 100, '1', '2023-07-25 23:06:04', '1', '2023-07-25 23:06:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (2879, 139, 101, '1', '2023-07-25 23:06:04', '1', '2023-07-25 23:06:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (2880, 139, 1063, '1', '2023-07-25 23:06:04', '1', '2023-07-25 23:06:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (2881, 139, 103, '1', '2023-07-25 23:06:04', '1', '2023-07-25 23:06:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (2882, 139, 1064, '1', '2023-07-25 23:06:04', '1', '2023-07-25 23:06:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (2883, 139, 1001, '1', '2023-07-25 23:06:04', '1', '2023-07-25 23:06:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (2884, 139, 1065, '1', '2023-07-25 23:06:04', '1', '2023-07-25 23:06:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (2885, 139, 1002, '1', '2023-07-25 23:06:04', '1', '2023-07-25 23:06:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (2886, 139, 1003, '1', '2023-07-25 23:06:04', '1', '2023-07-25 23:06:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (2887, 139, 107, '1', '2023-07-25 23:06:04', '1', '2023-07-25 23:06:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (2888, 139, 1004, '1', '2023-07-25 23:06:04', '1', '2023-07-25 23:06:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (2889, 139, 1005, '1', '2023-07-25 23:06:04', '1', '2023-07-25 23:06:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (2890, 139, 1006, '1', '2023-07-25 23:06:04', '1', '2023-07-25 23:06:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (2891, 139, 1007, '1', '2023-07-25 23:06:04', '1', '2023-07-25 23:06:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (2892, 139, 1008, '1', '2023-07-25 23:06:04', '1', '2023-07-25 23:06:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (2893, 139, 1009, '1', '2023-07-25 23:06:04', '1', '2023-07-25 23:06:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (2894, 139, 1010, '1', '2023-07-25 23:06:04', '1', '2023-07-25 23:06:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (2895, 139, 1011, '1', '2023-07-25 23:06:04', '1', '2023-07-25 23:06:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (2896, 139, 1012, '1', '2023-07-25 23:06:04', '1', '2023-07-25 23:06:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (2897, 139, 1017, '1', '2023-07-25 23:06:04', '1', '2023-07-25 23:06:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (2898, 139, 1018, '1', '2023-07-25 23:06:04', '1', '2023-07-25 23:06:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (2899, 139, 1019, '1', '2023-07-25 23:06:04', '1', '2023-07-25 23:06:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (2900, 139, 1020, '1', '2023-07-25 23:06:04', '1', '2023-07-25 23:06:04', b'0', 150);

-- ----------------------------
-- Table structure for system_sensitive_word
-- ----------------------------
DROP TABLE IF EXISTS `system_sensitive_word`;
CREATE TABLE `system_sensitive_word`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '敏感词',
  `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标签数组',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '敏感词' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_sensitive_word
-- ----------------------------
INSERT INTO `system_sensitive_word` VALUES (3, '土豆', '好呀', '蔬菜,短信', 0, '1', '2022-04-08 21:07:12', '1', '2022-04-09 10:28:14', b'0');
INSERT INTO `system_sensitive_word` VALUES (4, 'XXX', NULL, '短信', 0, '1', '2022-04-08 21:27:49', '1', '2022-06-19 00:36:50', b'0');
INSERT INTO `system_sensitive_word` VALUES (5, '白痴', NULL, '测试', 0, '1', '2022-12-31 19:08:25', '1', '2022-12-31 19:08:25', b'0');

-- ----------------------------
-- Table structure for system_sms_channel
-- ----------------------------
DROP TABLE IF EXISTS `system_sms_channel`;
CREATE TABLE `system_sms_channel`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `signature` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信签名',
  `code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '渠道编码',
  `status` tinyint(4) NOT NULL COMMENT '开启状态',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `api_key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信 API 的账号',
  `api_secret` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '短信 API 的秘钥',
  `callback_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '短信发送回调 URL',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '短信渠道' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_sms_channel
-- ----------------------------
INSERT INTO `system_sms_channel` VALUES (2, 'Ballcat', 'ALIYUN', 0, '啦啦啦', 'LTAI5tCnKso2uG3kJ5gRav88', 'fGJ5SNXL7P1NHNRmJ7DJaMJGPyE55C', NULL, '', '2021-03-31 11:53:10', '1', '2021-04-14 00:08:37', b'0');
INSERT INTO `system_sms_channel` VALUES (4, '测试渠道', 'DEBUG_DING_TALK', 0, '123', '696b5d8ead48071237e4aa5861ff08dbadb2b4ded1c688a7b7c9afc615579859', 'SEC5c4e5ff888bc8a9923ae47f59e7ccd30af1f14d93c55b4e2c9cb094e35aeed67', NULL, '1', '2021-04-13 00:23:14', '1', '2022-03-27 20:29:49', b'0');
INSERT INTO `system_sms_channel` VALUES (6, '测试演示', 'DEBUG_DING_TALK', 0, NULL, '696b5d8ead48071237e4aa5861ff08dbadb2b4ded1c688a7b7c9afc615579859', 'SEC5c4e5ff888bc8a9923ae47f59e7ccd30af1f14d93c55b4e2c9cb094e35aeed67', NULL, '1', '2022-04-10 23:07:59', '1', '2022-06-19 00:33:54', b'0');

-- ----------------------------
-- Table structure for system_sms_code
-- ----------------------------
DROP TABLE IF EXISTS `system_sms_code`;
CREATE TABLE `system_sms_code`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机号',
  `code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '验证码',
  `create_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建 IP',
  `scene` tinyint(4) NOT NULL COMMENT '发送场景',
  `today_index` tinyint(4) NOT NULL COMMENT '今日发送的第几条',
  `used` tinyint(4) NOT NULL COMMENT '是否使用',
  `used_time` datetime(0) NULL DEFAULT NULL COMMENT '使用时间',
  `used_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '使用 IP',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_mobile`(`mobile`) USING BTREE COMMENT '手机号'
) ENGINE = InnoDB AUTO_INCREMENT = 535 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '手机验证码' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_sms_code
-- ----------------------------

-- ----------------------------
-- Table structure for system_sms_log
-- ----------------------------
DROP TABLE IF EXISTS `system_sms_log`;
CREATE TABLE `system_sms_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `channel_id` bigint(20) NOT NULL COMMENT '短信渠道编号',
  `channel_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信渠道编码',
  `template_id` bigint(20) NOT NULL COMMENT '模板编号',
  `template_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板编码',
  `template_type` tinyint(4) NOT NULL COMMENT '短信类型',
  `template_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信内容',
  `template_params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信参数',
  `api_template_id` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信 API 的模板编号',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机号',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户编号',
  `user_type` tinyint(4) NULL DEFAULT NULL COMMENT '用户类型',
  `send_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '发送状态',
  `send_time` datetime(0) NULL DEFAULT NULL COMMENT '发送时间',
  `send_code` int(11) NULL DEFAULT NULL COMMENT '发送结果的编码',
  `send_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发送结果的提示',
  `api_send_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '短信 API 发送结果的编码',
  `api_send_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '短信 API 发送失败的提示',
  `api_request_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '短信 API 发送返回的唯一请求 ID',
  `api_serial_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '短信 API 发送返回的序号',
  `receive_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '接收状态',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '接收时间',
  `api_receive_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'API 接收结果的编码',
  `api_receive_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'API 接收结果的说明',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 502 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '短信日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_sms_log
-- ----------------------------

-- ----------------------------
-- Table structure for system_sms_template
-- ----------------------------
DROP TABLE IF EXISTS `system_sms_template`;
CREATE TABLE `system_sms_template`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` tinyint(4) NOT NULL COMMENT '短信签名',
  `status` tinyint(4) NOT NULL COMMENT '开启状态',
  `code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板编码',
  `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板名称',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板内容',
  `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数数组',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `api_template_id` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信 API 的模板编号',
  `channel_id` bigint(20) NOT NULL COMMENT '短信渠道编号',
  `channel_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信渠道编码',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '短信模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_sms_template
-- ----------------------------
INSERT INTO `system_sms_template` VALUES (2, 1, 0, 'test_01', '测试验证码短信', '正在进行登录操作{operation}，您的验证码是{code}', '[\"operation\",\"code\"]', NULL, '4383920', 6, 'DEBUG_DING_TALK', '', '2021-03-31 10:49:38', '1', '2022-12-10 21:26:20', b'0');
INSERT INTO `system_sms_template` VALUES (3, 1, 0, 'test_02', '公告通知', '您的验证码{code}，该验证码5分钟内有效，请勿泄漏于他人！', '[\"code\"]', NULL, 'SMS_207945135', 2, 'ALIYUN', '', '2021-03-31 11:56:30', '1', '2021-04-10 01:22:02', b'0');
INSERT INTO `system_sms_template` VALUES (6, 3, 0, 'test-01', '测试模板', '哈哈哈 {name}', '[\"name\"]', 'f哈哈哈', '4383920', 6, 'DEBUG_DING_TALK', '1', '2021-04-10 01:07:21', '1', '2022-12-10 21:26:09', b'0');
INSERT INTO `system_sms_template` VALUES (7, 3, 0, 'test-04', '测试下', '老鸡{name}，牛逼{code}', '[\"name\",\"code\"]', NULL, 'suibian', 4, 'DEBUG_DING_TALK', '1', '2021-04-13 00:29:53', '1', '2021-04-14 00:30:38', b'0');
INSERT INTO `system_sms_template` VALUES (8, 1, 0, 'user-sms-login', '前台用户短信登录', '您的验证码是{code}', '[\"code\"]', NULL, '4372216', 6, 'DEBUG_DING_TALK', '1', '2021-10-11 08:10:00', '1', '2022-12-10 21:25:59', b'0');
INSERT INTO `system_sms_template` VALUES (9, 2, 0, 'bpm_task_assigned', '【工作流】任务被分配', '您收到了一条新的待办任务：{processInstanceName}-{taskName}，申请人：{startUserNickname}，处理链接：{detailUrl}', '[\"processInstanceName\",\"taskName\",\"startUserNickname\",\"detailUrl\"]', NULL, 'suibian', 4, 'DEBUG_DING_TALK', '1', '2022-01-21 22:31:19', '1', '2022-01-22 00:03:36', b'0');
INSERT INTO `system_sms_template` VALUES (10, 2, 0, 'bpm_process_instance_reject', '【工作流】流程被不通过', '您的流程被审批不通过：{processInstanceName}，原因：{reason}，查看链接：{detailUrl}', '[\"processInstanceName\",\"reason\",\"detailUrl\"]', NULL, 'suibian', 4, 'DEBUG_DING_TALK', '1', '2022-01-22 00:03:31', '1', '2022-05-01 12:33:14', b'0');
INSERT INTO `system_sms_template` VALUES (11, 2, 0, 'bpm_process_instance_approve', '【工作流】流程被通过', '您的流程被审批通过：{processInstanceName}，查看链接：{detailUrl}', '[\"processInstanceName\",\"detailUrl\"]', NULL, 'suibian', 4, 'DEBUG_DING_TALK', '1', '2022-01-22 00:04:31', '1', '2022-03-27 20:32:21', b'0');
INSERT INTO `system_sms_template` VALUES (12, 2, 0, 'demo', '演示模板', '我就是测试一下下', '[]', NULL, 'biubiubiu', 6, 'DEBUG_DING_TALK', '1', '2022-04-10 23:22:49', '1', '2023-03-24 23:45:07', b'0');
INSERT INTO `system_sms_template` VALUES (14, 1, 0, 'user-update-mobile', '会员用户 - 修改手机', '您的验证码{code}，该验证码 5 分钟内有效，请勿泄漏于他人！', '[\"code\"]', '', 'null', 4, 'DEBUG_DING_TALK', '1', '2023-08-19 18:58:01', '1', '2023-08-19 11:34:04', b'0');
INSERT INTO `system_sms_template` VALUES (15, 1, 0, 'user-update-password', '会员用户 - 修改密码', '您的验证码{code}，该验证码 5 分钟内有效，请勿泄漏于他人！', '[\"code\"]', '', 'null', 4, 'DEBUG_DING_TALK', '1', '2023-08-19 18:58:01', '1', '2023-08-19 11:34:18', b'0');
INSERT INTO `system_sms_template` VALUES (16, 1, 0, 'user-reset-password', '会员用户 - 重置密码', '您的验证码{code}，该验证码 5 分钟内有效，请勿泄漏于他人！', '[\"code\"]', '', 'null', 4, 'DEBUG_DING_TALK', '1', '2023-08-19 18:58:01', '1', '2023-08-19 11:34:18', b'0');

-- ----------------------------
-- Table structure for system_social_client
-- ----------------------------
DROP TABLE IF EXISTS `system_social_client`;
CREATE TABLE `system_social_client`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用名',
  `social_type` tinyint(4) NOT NULL COMMENT '社交平台的类型',
  `user_type` tinyint(4) NOT NULL COMMENT '用户类型',
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户端编号',
  `client_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户端密钥',
  `agent_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '代理编号',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '社交客户端表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_social_client
-- ----------------------------

-- ----------------------------
-- Table structure for system_social_user
-- ----------------------------
DROP TABLE IF EXISTS `system_social_user`;
CREATE TABLE `system_social_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键(自增策略)',
  `type` tinyint(4) NOT NULL COMMENT '社交平台的类型',
  `openid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '社交 openid',
  `token` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '社交 token',
  `raw_token_info` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '原始 Token 数据，一般是 JSON 格式',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户头像',
  `raw_user_info` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '原始用户数据，一般是 JSON 格式',
  `code` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '最后一次的认证 code',
  `state` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '最后一次的认证 state',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '社交用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_social_user
-- ----------------------------

-- ----------------------------
-- Table structure for system_social_user_bind
-- ----------------------------
DROP TABLE IF EXISTS `system_social_user_bind`;
CREATE TABLE `system_social_user_bind`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键(自增策略)',
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `user_type` tinyint(4) NOT NULL COMMENT '用户类型',
  `social_type` tinyint(4) NOT NULL COMMENT '社交平台的类型',
  `social_user_id` bigint(20) NOT NULL COMMENT '社交用户的编号',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 80 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '社交绑定表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_social_user_bind
-- ----------------------------

-- ----------------------------
-- Table structure for system_tenant
-- ----------------------------
DROP TABLE IF EXISTS `system_tenant`;
CREATE TABLE `system_tenant`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '租户编号',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户名',
  `contact_user_id` bigint(20) NULL DEFAULT NULL COMMENT '联系人的用户编号',
  `contact_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系人',
  `contact_mobile` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系手机',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '租户状态（0正常 1停用）',
  `website` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '绑定域名',
  `package_id` bigint(20) NOT NULL COMMENT '租户套餐编号',
  `expire_time` datetime(0) NOT NULL COMMENT '过期时间',
  `account_count` int(11) NOT NULL COMMENT '账号数量',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 151 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '租户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_tenant
-- ----------------------------
INSERT INTO `system_tenant` VALUES (1, '芋道源码', NULL, '芋艿', '17321315478', 0, 'www.iocoder.cn', 0, '2099-02-19 17:14:16', 9999, '1', '2021-01-05 17:03:47', '1', '2023-11-06 11:41:41', b'0');
INSERT INTO `system_tenant` VALUES (121, '小租户', 110, '小王2', '15601691300', 0, 'zsxq.iocoder.cn', 111, '2024-03-11 00:00:00', 20, '1', '2022-02-22 00:56:14', '1', '2023-11-06 11:41:47', b'0');
INSERT INTO `system_tenant` VALUES (122, '测试租户', 113, '芋道', '15601691300', 0, 'test.iocoder.cn', 111, '2022-04-30 00:00:00', 50, '1', '2022-03-07 21:37:58', '1', '2023-11-06 11:41:53', b'0');

-- ----------------------------
-- Table structure for system_tenant_package
-- ----------------------------
DROP TABLE IF EXISTS `system_tenant_package`;
CREATE TABLE `system_tenant_package`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '套餐编号',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '套餐名',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '租户状态（0正常 1停用）',
  `remark` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '备注',
  `menu_ids` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '关联的菜单编号',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '租户套餐表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_tenant_package
-- ----------------------------
INSERT INTO `system_tenant_package` VALUES (111, '普通套餐', 0, '小功能', '[1,1036,1037,1038,1039,100,101,1063,103,1064,1001,1065,1002,1003,107,1004,1005,1006,1007,1008,1009,1010,1011,1012,1017,1018,1019,1020]', '1', '2022-02-22 00:54:00', '1', '2022-09-21 22:48:12', b'0');

-- ----------------------------
-- Table structure for system_user_post
-- ----------------------------
DROP TABLE IF EXISTS `system_user_post`;
CREATE TABLE `system_user_post`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '岗位ID',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 118 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户岗位表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_user_post
-- ----------------------------
INSERT INTO `system_user_post` VALUES (112, 1, 1, 'admin', '2022-05-02 07:25:24', 'admin', '2022-05-02 07:25:24', b'0', 1);
INSERT INTO `system_user_post` VALUES (113, 100, 1, 'admin', '2022-05-02 07:25:24', 'admin', '2022-05-02 07:25:24', b'0', 1);
INSERT INTO `system_user_post` VALUES (114, 114, 3, 'admin', '2022-05-02 07:25:24', 'admin', '2022-05-02 07:25:24', b'0', 1);
INSERT INTO `system_user_post` VALUES (115, 104, 1, '1', '2022-05-16 19:36:28', '1', '2022-05-16 19:36:28', b'0', 1);
INSERT INTO `system_user_post` VALUES (116, 117, 2, '1', '2022-07-09 17:40:26', '1', '2022-07-09 17:40:26', b'0', 1);
INSERT INTO `system_user_post` VALUES (117, 118, 1, '1', '2022-07-09 17:44:44', '1', '2022-07-09 17:44:44', b'0', 1);

-- ----------------------------
-- Table structure for system_user_role
-- ----------------------------
DROP TABLE IF EXISTS `system_user_role`;
CREATE TABLE `system_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_user_role
-- ----------------------------
INSERT INTO `system_user_role` VALUES (1, 1, 1, '', '2022-01-11 13:19:45', '', '2022-05-12 12:35:17', b'0', 1);
INSERT INTO `system_user_role` VALUES (2, 2, 2, '', '2022-01-11 13:19:45', '', '2022-05-12 12:35:13', b'0', 1);
INSERT INTO `system_user_role` VALUES (4, 100, 101, '', '2022-01-11 13:19:45', '', '2022-05-12 12:35:13', b'0', 1);
INSERT INTO `system_user_role` VALUES (5, 100, 1, '', '2022-01-11 13:19:45', '', '2022-05-12 12:35:12', b'0', 1);
INSERT INTO `system_user_role` VALUES (6, 100, 2, '', '2022-01-11 13:19:45', '', '2022-05-12 12:35:11', b'0', 1);
INSERT INTO `system_user_role` VALUES (10, 103, 1, '1', '2022-01-11 13:19:45', '1', '2022-01-11 13:19:45', b'0', 1);
INSERT INTO `system_user_role` VALUES (11, 107, 106, '1', '2022-02-20 22:59:33', '1', '2022-02-20 22:59:33', b'0', 118);
INSERT INTO `system_user_role` VALUES (12, 108, 107, '1', '2022-02-20 23:00:50', '1', '2022-02-20 23:00:50', b'0', 119);
INSERT INTO `system_user_role` VALUES (13, 109, 108, '1', '2022-02-20 23:11:50', '1', '2022-02-20 23:11:50', b'0', 120);
INSERT INTO `system_user_role` VALUES (14, 110, 109, '1', '2022-02-22 00:56:14', '1', '2022-02-22 00:56:14', b'0', 121);
INSERT INTO `system_user_role` VALUES (15, 111, 110, '110', '2022-02-23 13:14:38', '110', '2022-02-23 13:14:38', b'0', 121);
INSERT INTO `system_user_role` VALUES (16, 113, 111, '1', '2022-03-07 21:37:58', '1', '2022-03-07 21:37:58', b'0', 122);
INSERT INTO `system_user_role` VALUES (17, 114, 101, '1', '2022-03-19 21:51:13', '1', '2022-03-19 21:51:13', b'0', 1);
INSERT INTO `system_user_role` VALUES (18, 1, 2, '1', '2022-05-12 20:39:29', '1', '2022-05-12 20:39:29', b'0', 1);
INSERT INTO `system_user_role` VALUES (19, 116, 113, '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_user_role` VALUES (20, 104, 101, '1', '2022-05-28 15:43:57', '1', '2022-05-28 15:43:57', b'0', 1);
INSERT INTO `system_user_role` VALUES (22, 115, 2, '1', '2022-07-21 22:08:30', '1', '2022-07-21 22:08:30', b'0', 1);
INSERT INTO `system_user_role` VALUES (23, 119, 114, '1', '2022-12-30 11:32:04', '1', '2022-12-30 11:32:04', b'0', 125);
INSERT INTO `system_user_role` VALUES (24, 120, 115, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_user_role` VALUES (25, 121, 116, '1', '2022-12-30 11:33:49', '1', '2022-12-30 11:33:49', b'0', 127);
INSERT INTO `system_user_role` VALUES (26, 122, 118, '1', '2022-12-30 11:47:53', '1', '2022-12-30 11:47:53', b'0', 129);
INSERT INTO `system_user_role` VALUES (27, 112, 101, '1', '2023-02-09 23:18:51', '1', '2023-02-09 23:18:51', b'0', 1);
INSERT INTO `system_user_role` VALUES (28, 123, 136, '1', '2023-03-05 21:23:35', '1', '2023-03-05 21:23:35', b'0', 147);
INSERT INTO `system_user_role` VALUES (29, 124, 137, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_user_role` VALUES (30, 125, 138, '1', '2023-03-05 21:59:03', '1', '2023-03-05 21:59:03', b'0', 149);
INSERT INTO `system_user_role` VALUES (31, 126, 139, '1', '2023-07-25 23:06:04', '1', '2023-07-25 23:06:04', b'0', 150);

-- ----------------------------
-- Table structure for system_users
-- ----------------------------
DROP TABLE IF EXISTS `system_users`;
CREATE TABLE `system_users`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户账号',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '密码',
  `nickname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户昵称',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `post_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '岗位编号数组',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` tinyint(4) NULL DEFAULT 0 COMMENT '用户性别',
  `avatar` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '头像地址',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '帐号状态（0正常 1停用）',
  `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username`, `update_time`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_users
-- ----------------------------
INSERT INTO `system_users` VALUES (1, 'admin', '$2a$10$mRMIYLDtRHlf6.9ipiqH1.Z.bh/R9dO9d5iHiGYPigi6r5KOoR2Wm', '芋道源码', '管理员', 103, '[1]', 'aoteman@126.com', '15612345678', 1, 'http://127.0.0.1:48080/admin-api/infra/file/4/get/37e56010ecbee472cdd821ac4b608e151e62a74d9633f15d085aee026eedeb60.png', 0, '127.0.0.1', '2023-11-29 14:53:33', 'admin', '2021-01-05 17:03:47', NULL, '2023-11-29 14:53:33', b'0', 1);
INSERT INTO `system_users` VALUES (100, 'yudao', '$2a$10$11U48RhyJ5pSBYWSn12AD./ld671.ycSzJHbyrtpeoMeYiw31eo8a', '芋道', '不要吓我', 104, '[1]', 'yudao@iocoder.cn', '15601691300', 1, '', 1, '127.0.0.1', '2022-07-09 23:03:33', '', '2021-01-07 09:07:17', NULL, '2022-07-09 23:03:33', b'0', 1);
INSERT INTO `system_users` VALUES (103, 'yuanma', '$2a$10$YMpimV4T6BtDhIaA8jSW.u8UTGBeGhc/qwXP4oxoMr4mOw9.qttt6', '源码', NULL, 106, NULL, 'yuanma@iocoder.cn', '15601701300', 0, '', 0, '127.0.0.1', '2022-07-08 01:26:27', '', '2021-01-13 23:50:35', NULL, '2022-07-08 01:26:27', b'0', 1);
INSERT INTO `system_users` VALUES (104, 'test', '$2a$10$GP8zvqHB//TekuzYZSBYAuBQJiNq1.fxQVDYJ.uBCOnWCtDVKE4H6', '测试号', NULL, 107, '[1,2]', '111@qq.com', '15601691200', 1, '', 0, '0:0:0:0:0:0:0:1', '2023-09-24 18:21:19', '', '2021-01-21 02:13:53', NULL, '2023-09-24 18:21:19', b'0', 1);
INSERT INTO `system_users` VALUES (107, 'admin107', '$2a$10$dYOOBKMO93v/.ReCqzyFg.o67Tqk.bbc2bhrpyBGkIw9aypCtr2pm', '芋艿', NULL, NULL, NULL, '', '15601691300', 0, '', 0, '', NULL, '1', '2022-02-20 22:59:33', '1', '2022-02-27 08:26:51', b'0', 118);
INSERT INTO `system_users` VALUES (108, 'admin108', '$2a$10$y6mfvKoNYL1GXWak8nYwVOH.kCWqjactkzdoIDgiKl93WN3Ejg.Lu', '芋艿', NULL, NULL, NULL, '', '15601691300', 0, '', 0, '', NULL, '1', '2022-02-20 23:00:50', '1', '2022-02-27 08:26:53', b'0', 119);
INSERT INTO `system_users` VALUES (109, 'admin109', '$2a$10$JAqvH0tEc0I7dfDVBI7zyuB4E3j.uH6daIjV53.vUS6PknFkDJkuK', '芋艿', NULL, NULL, NULL, '', '15601691300', 0, '', 0, '', NULL, '1', '2022-02-20 23:11:50', '1', '2022-02-27 08:26:56', b'0', 120);
INSERT INTO `system_users` VALUES (110, 'admin110', '$2a$10$mRMIYLDtRHlf6.9ipiqH1.Z.bh/R9dO9d5iHiGYPigi6r5KOoR2Wm', '小王', NULL, NULL, NULL, '', '15601691300', 0, '', 0, '127.0.0.1', '2022-09-25 22:47:33', '1', '2022-02-22 00:56:14', NULL, '2022-09-25 22:47:33', b'0', 121);
INSERT INTO `system_users` VALUES (111, 'test', '$2a$10$mRMIYLDtRHlf6.9ipiqH1.Z.bh/R9dO9d5iHiGYPigi6r5KOoR2Wm', '测试用户', NULL, NULL, '[]', '', '', 0, '', 0, '0:0:0:0:0:0:0:1', '2023-10-18 23:31:51', '110', '2022-02-23 13:14:33', NULL, '2023-10-18 23:31:51', b'0', 121);
INSERT INTO `system_users` VALUES (112, 'newobject', '$2a$10$3alwklxqfq8/hKoW6oUV0OJp0IdQpBDauLy4633SpUjrRsStl6kMa', '新对象', NULL, 100, '[]', '', '', 1, '', 0, '0:0:0:0:0:0:0:1', '2023-02-10 13:48:13', '1', '2022-02-23 19:08:03', NULL, '2023-02-10 13:48:13', b'0', 1);
INSERT INTO `system_users` VALUES (113, 'aoteman', '$2a$10$0acJOIk2D25/oC87nyclE..0lzeu9DtQ/n3geP4fkun/zIVRhHJIO', '芋道', NULL, NULL, NULL, '', '15601691300', 0, '', 0, '127.0.0.1', '2022-03-19 18:38:51', '1', '2022-03-07 21:37:58', NULL, '2022-03-19 18:38:51', b'0', 122);
INSERT INTO `system_users` VALUES (114, 'hrmgr', '$2a$10$TR4eybBioGRhBmDBWkqWLO6NIh3mzYa8KBKDDB5woiGYFVlRAi.fu', 'hr 小姐姐', NULL, NULL, '[3]', '', '', 0, '', 0, '127.0.0.1', '2022-03-19 22:15:43', '1', '2022-03-19 21:50:58', NULL, '2022-03-19 22:15:43', b'0', 1);
INSERT INTO `system_users` VALUES (115, 'aotemane', '$2a$10$/WCwGHu1eq0wOVDd/u8HweJ0gJCHyLS6T7ndCqI8UXZAQom1etk2e', '1', '11', 101, '[]', '', '', 1, '', 0, '', NULL, '1', '2022-04-30 02:55:43', '1', '2022-06-22 13:34:58', b'0', 1);
INSERT INTO `system_users` VALUES (116, '15601691302', '$2a$10$L5C4S0U6adBWMvFv1Wwl4.DI/NwYS3WIfLj5Q.Naqr5II8CmqsDZ6', '小豆', NULL, NULL, NULL, '', '', 0, '', 0, '', NULL, '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_users` VALUES (117, 'admin123', '$2a$10$WI8Gg/lpZQIrOEZMHqka7OdFaD4Nx.B/qY8ZGTTUKrOJwaHFqibaC', '测试号', '1111', 100, '[2]', '', '15601691234', 1, '', 0, '', NULL, '1', '2022-07-09 17:40:26', '1', '2022-07-09 17:40:26', b'0', 1);
INSERT INTO `system_users` VALUES (118, 'goudan', '$2a$10$Lrb71muL.s5/AFjQ2IHkzOFlAFwUToH.zQL7bnghvTDt/QptjGgF6', '狗蛋', NULL, 103, '[1]', '', '', 2, '', 0, '', NULL, '1', '2022-07-09 17:44:43', '1', '2022-12-31 17:29:13', b'0', 1);

-- ----------------------------
-- Table structure for trade_after_sale
-- ----------------------------
DROP TABLE IF EXISTS `trade_after_sale`;
CREATE TABLE `trade_after_sale`  (
  `id` bigint(20) NOT NULL,
  `no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `way` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `apply_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `apply_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `apply_pic_urls` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order_id` bigint(20) NOT NULL,
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `order_item_id` bigint(20) NOT NULL,
  `spu_id` bigint(20) NOT NULL,
  `spu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sku_id` bigint(20) NOT NULL,
  `properties` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `count` int(11) NOT NULL,
  `audit_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `audit_user_id` bigint(20) NULL DEFAULT NULL,
  `audit_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `refund_price` int(11) NOT NULL,
  `pay_refund_id` bigint(20) NULL DEFAULT NULL,
  `refund_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `logistics_id` bigint(20) NULL DEFAULT NULL,
  `logistics_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `delivery_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `receive_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `receive_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updater` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  `tenant_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '交易售后表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trade_after_sale
-- ----------------------------

-- ----------------------------
-- Table structure for trade_after_sale_log
-- ----------------------------
DROP TABLE IF EXISTS `trade_after_sale_log`;
CREATE TABLE `trade_after_sale_log`  (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_type` int(11) NOT NULL,
  `after_sale_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `order_item_id` bigint(20) NOT NULL,
  `before_status` int(11) NULL DEFAULT NULL,
  `after_status` int(11) NOT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updater` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '交易售后日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trade_after_sale_log
-- ----------------------------

-- ----------------------------
-- Table structure for trade_order
-- ----------------------------
DROP TABLE IF EXISTS `trade_order`;
CREATE TABLE `trade_order`  (
  `id` bigint(20) NOT NULL,
  `no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` int(11) NOT NULL,
  `terminal` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` int(11) NOT NULL,
  `product_count` int(11) NOT NULL,
  `cancel_type` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pay_status` bit(1) NOT NULL,
  `pay_time` datetime(0) NULL DEFAULT NULL,
  `finish_time` datetime(0) NULL DEFAULT NULL,
  `cancel_time` datetime(0) NULL DEFAULT NULL,
  `original_price` int(11) NOT NULL,
  `order_price` int(11) NOT NULL,
  `discount_price` int(11) NOT NULL,
  `delivery_price` int(11) NOT NULL,
  `adjust_price` int(11) NOT NULL,
  `pay_price` int(11) NOT NULL,
  `pay_order_id` bigint(20) NULL DEFAULT NULL,
  `pay_channel_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `delivery_template_id` bigint(20) NULL DEFAULT NULL,
  `logistics_id` bigint(20) NULL DEFAULT NULL,
  `logistics_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `delivery_status` smallint(6) NOT NULL,
  `delivery_time` datetime(0) NULL DEFAULT NULL,
  `receive_time` datetime(0) NULL DEFAULT NULL,
  `receiver_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `receiver_mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `receiver_area_id` int(11) NOT NULL,
  `receiver_post_code` int(11) NULL DEFAULT NULL,
  `receiver_detail_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `after_sale_status` int(11) NOT NULL,
  `refund_price` int(11) NOT NULL,
  `coupon_id` bigint(20) NOT NULL,
  `coupon_price` int(11) NOT NULL,
  `point_price` int(11) NOT NULL,
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updater` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  `tenant_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '交易订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trade_order
-- ----------------------------

-- ----------------------------
-- Table structure for trade_order_item
-- ----------------------------
DROP TABLE IF EXISTS `trade_order_item`;
CREATE TABLE `trade_order_item`  (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `spu_id` bigint(20) NOT NULL,
  `spu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sku_id` bigint(20) NOT NULL,
  `properties` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `count` int(11) NOT NULL,
  `original_price` int(11) NOT NULL,
  `original_unit_price` int(11) NOT NULL,
  `discount_price` int(11) NOT NULL,
  `pay_price` int(11) NOT NULL,
  `order_part_price` int(11) NOT NULL,
  `order_divide_price` int(11) NOT NULL,
  `after_sale_status` int(11) NOT NULL,
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updater` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '交易订单明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trade_order_item
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;

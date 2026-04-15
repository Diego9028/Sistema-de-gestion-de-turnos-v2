/*
 Navicat Premium Dump SQL

 Source Server         : Local - Innhosp -  Producción - 15.160 3306
 Source Server Type    : MySQL
 Source Server Version : 80100 (8.1.0)
 Source Host           : 10.6.15.160:3306
 Source Schema         : innhosp

 Target Server Type    : MySQL
 Target Server Version : 80100 (8.1.0)
 File Encoding         : 65001

 Date: 06/11/2025 15:21:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for conf_tipocontrato
-- ----------------------------
DROP TABLE IF EXISTS `conf_tipocontrato`;
CREATE TABLE `conf_tipocontrato`  (
  `id_tipocontrato` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `date_added` datetime NULL DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_tipocontrato`) USING BTREE,
  INDEX `idx_tct_pk`(`id_tipocontrato` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of conf_tipocontrato
-- ----------------------------
INSERT INTO `conf_tipocontrato` VALUES (1, 'CONTRATADOS', '2021-07-20 08:58:57', NULL, 1);
INSERT INTO `conf_tipocontrato` VALUES (2, 'HSA', '2021-07-20 08:59:10', NULL, 1);
INSERT INTO `conf_tipocontrato` VALUES (3, 'SUPLENTE', '2021-07-20 08:59:23', NULL, 1);
INSERT INTO `conf_tipocontrato` VALUES (4, 'TITULARES', '2021-07-20 08:59:37', NULL, 1);

SET FOREIGN_KEY_CHECKS = 1;

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

 Date: 06/11/2025 15:18:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for conf_estados
-- ----------------------------
DROP TABLE IF EXISTS `conf_estados`;
CREATE TABLE `conf_estados`  (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `date_added` datetime NULL DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_estado`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of conf_estados
-- ----------------------------
INSERT INTO `conf_estados` VALUES (1, 'Activo', '2022-03-23 11:54:32', '2025-07-15 10:00:14', 1);
INSERT INTO `conf_estados` VALUES (2, 'Temporal', '2022-03-23 11:55:57', '2022-03-23 08:55:59', 1);
INSERT INTO `conf_estados` VALUES (3, 'Vencido', '2022-03-23 11:55:59', '2022-03-23 08:56:01', 1);
INSERT INTO `conf_estados` VALUES (4, 'Nulo', '2022-03-23 11:56:02', '2022-03-23 08:56:04', 1);
INSERT INTO `conf_estados` VALUES (5, 'No Activo', '2022-03-23 11:55:55', '2022-03-24 06:10:59', 1);
INSERT INTO `conf_estados` VALUES (6, 'Termino Anticipado / Desvinculado', '2023-07-03 12:53:07', '2025-10-20 12:01:30', 1);
INSERT INTO `conf_estados` VALUES (7, 'Renunciado', '2023-07-03 12:53:13', NULL, 1);
INSERT INTO `conf_estados` VALUES (8, 'Sin Renovacion', '2023-10-02 16:15:43', '2025-10-20 12:02:48', 1);
INSERT INTO `conf_estados` VALUES (9, 'Banned', '2023-10-10 16:44:30', NULL, 1);
INSERT INTO `conf_estados` VALUES (10, 'Traspaso a contrata', '2023-10-11 17:40:06', NULL, 1);
INSERT INTO `conf_estados` VALUES (11, 'Notificada(o)', '2025-04-10 08:54:53', '2025-10-20 12:02:48', 1);

SET FOREIGN_KEY_CHECKS = 1;

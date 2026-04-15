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

 Date: 06/11/2025 15:21:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for conf_tipofuncionario
-- ----------------------------
DROP TABLE IF EXISTS `conf_tipofuncionario`;
CREATE TABLE `conf_tipofuncionario`  (
  `id_tipofuncionario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `date_added` datetime NULL DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `tipo_persona` int NULL DEFAULT 0,
  PRIMARY KEY (`id_tipofuncionario`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of conf_tipofuncionario
-- ----------------------------
INSERT INTO `conf_tipofuncionario` VALUES (1, 'CONTRATO', '2022-07-29 13:23:22', '2024-02-07 12:33:45', 1, 0);
INSERT INTO `conf_tipofuncionario` VALUES (2, 'Becado', '2023-12-05 12:00:44', '2024-02-07 12:28:50', 1, 0);
INSERT INTO `conf_tipofuncionario` VALUES (3, 'Estudiante', '2023-12-05 12:00:44', '2024-02-26 16:29:51', 1, 1);
INSERT INTO `conf_tipofuncionario` VALUES (4, 'Visitante Externo', '2023-12-05 12:00:44', '2024-02-07 12:35:12', 1, 0);
INSERT INTO `conf_tipofuncionario` VALUES (5, 'Carabinero', '2023-12-05 12:00:44', '2024-02-07 12:35:15', 1, 0);
INSERT INTO `conf_tipofuncionario` VALUES (6, 'Gendarmería', '2024-02-07 12:46:59', '2025-11-05 10:44:39', 1, 0);
INSERT INTO `conf_tipofuncionario` VALUES (9, 'Tutor externo', '2024-02-26 15:58:06', NULL, 1, 0);
INSERT INTO `conf_tipofuncionario` VALUES (10, 'TUTOR CLINICO', '2024-02-26 16:16:15', '2024-02-26 16:29:33', 1, 1);
INSERT INTO `conf_tipofuncionario` VALUES (12, 'Supervisor de Práctica', '2024-03-04 09:21:43', '2025-11-05 10:44:39', 1, 1);
INSERT INTO `conf_tipofuncionario` VALUES (13, 'Alumno en pratica no médica', '2024-04-08 16:16:35', '2025-11-05 10:44:39', 1, 0);
INSERT INTO `conf_tipofuncionario` VALUES (14, 'Pasantia', '2025-03-31 08:09:29', NULL, 1, 1);

SET FOREIGN_KEY_CHECKS = 1;

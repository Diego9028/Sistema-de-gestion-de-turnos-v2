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

 Date: 06/11/2025 15:18:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for conf_tipocargo
-- ----------------------------
DROP TABLE IF EXISTS `conf_tipocargo`;
CREATE TABLE `conf_tipocargo`  (
  `id_tipocargo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `clinico` tinyint(1) NULL DEFAULT 0,
  `date_added` datetime NULL DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_tipocargo`) USING BTREE,
  INDEX `indexIdTipoCargo`(`id_tipocargo` ASC) USING BTREE,
  INDEX `idx_tcg_pk`(`id_tipocargo` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of conf_tipocargo
-- ----------------------------
INSERT INTO `conf_tipocargo` VALUES (1, 'ADMINISTRATIVOS', 0, '2021-07-19 17:07:26', '2022-01-04 06:39:20', 0);
INSERT INTO `conf_tipocargo` VALUES (2, 'Enfermera(o)', 1, '2021-07-20 08:53:30', '2022-01-04 06:41:45', 0);
INSERT INTO `conf_tipocargo` VALUES (3, 'Experto(a)', NULL, '2021-07-20 08:53:49', '2022-09-30 09:00:16', 0);
INSERT INTO `conf_tipocargo` VALUES (4, 'Fonoaudiologo(a)', 1, '2021-07-20 08:54:36', '2022-01-04 06:41:47', 0);
INSERT INTO `conf_tipocargo` VALUES (5, 'Kinesiologo(a)', 1, '2021-07-20 08:54:46', '2022-01-04 06:41:48', 0);
INSERT INTO `conf_tipocargo` VALUES (6, 'Matron(a)', 1, '2021-07-20 08:55:00', '2023-03-31 15:49:14', 0);
INSERT INTO `conf_tipocargo` VALUES (7, 'Medicos', 1, '2021-07-20 08:55:08', '2022-01-04 07:48:29', 0);
INSERT INTO `conf_tipocargo` VALUES (8, 'Nutricionista', 1, '2021-07-20 08:55:20', '2022-01-04 06:41:56', 0);
INSERT INTO `conf_tipocargo` VALUES (9, 'Profesional (otros de la salud)', 0, '2021-07-20 08:55:30', '2022-01-04 07:47:48', 0);
INSERT INTO `conf_tipocargo` VALUES (10, 'Profesional (otros)', 0, '2021-07-20 08:55:45', '2022-01-04 07:47:50', 0);
INSERT INTO `conf_tipocargo` VALUES (11, 'Quimicos Farmaceuticos', 1, '2021-07-20 08:56:03', '2022-01-04 07:48:01', 0);
INSERT INTO `conf_tipocargo` VALUES (12, 'Tecnico (otros)', 0, '2021-07-20 08:56:12', '2022-01-04 07:48:02', 0);
INSERT INTO `conf_tipocargo` VALUES (13, 'Tecnico en Alimentacion', 0, '2021-07-20 08:56:27', '2022-01-04 06:42:02', 0);
INSERT INTO `conf_tipocargo` VALUES (14, 'Tecnico Paramedico', 0, '2021-07-20 08:56:37', '2022-01-04 06:42:04', 0);
INSERT INTO `conf_tipocargo` VALUES (15, 'Tecnico Sup. en Enfermeria', 1, '2021-07-20 08:56:47', '2022-01-04 06:42:05', 0);
INSERT INTO `conf_tipocargo` VALUES (16, 'Tecnico Superior', 0, '2021-07-20 08:57:31', '2022-01-04 07:48:02', 0);
INSERT INTO `conf_tipocargo` VALUES (17, 'Tecnico Sup. en Odontologia', 0, '2021-07-20 08:58:00', '2022-01-04 06:42:10', 0);
INSERT INTO `conf_tipocargo` VALUES (18, 'Tecnologo Medico', 0, '2021-07-20 08:58:17', '2022-01-04 06:42:18', 0);
INSERT INTO `conf_tipocargo` VALUES (19, 'AUXILIARES', 0, NULL, '2022-01-04 07:48:10', 0);
INSERT INTO `conf_tipocargo` VALUES (20, 'CARGO EN EXTINCION', 0, NULL, '2022-01-04 07:48:11', 0);
INSERT INTO `conf_tipocargo` VALUES (21, 'DIRECTIVOS', 0, NULL, '2022-01-04 07:48:13', 0);
INSERT INTO `conf_tipocargo` VALUES (22, 'ODONTOLOGOS', 0, NULL, '2022-01-04 07:48:16', 0);
INSERT INTO `conf_tipocargo` VALUES (23, 'PROFESIONALES', 0, NULL, '2022-01-04 07:48:18', 0);
INSERT INTO `conf_tipocargo` VALUES (24, 'QUIMICOS', 0, NULL, '2022-01-04 07:48:19', 0);
INSERT INTO `conf_tipocargo` VALUES (25, 'TECNICOS', 0, NULL, '2022-01-04 07:48:20', 0);
INSERT INTO `conf_tipocargo` VALUES (32, 'Administrativa(o)', NULL, '2022-01-03 17:52:10', '2022-01-04 09:14:41', 1);
INSERT INTO `conf_tipocargo` VALUES (33, 'Administrativa(o) Asignacion Profesional', NULL, '2022-01-03 17:52:55', '2022-01-04 09:14:49', 1);
INSERT INTO `conf_tipocargo` VALUES (34, 'Auxiliar  (hrs)', 1, '2022-01-03 18:01:40', '2025-11-05 09:41:32', 1);
INSERT INTO `conf_tipocargo` VALUES (35, 'Experta(o) Junior', NULL, '2022-01-03 18:01:59', '2022-09-30 09:00:23', 0);
INSERT INTO `conf_tipocargo` VALUES (36, 'Experta(o) Medio', NULL, '2022-01-03 18:02:12', '2022-09-30 11:03:45', 0);
INSERT INTO `conf_tipocargo` VALUES (37, 'Interna(o) Enfermeria', 1, '2022-01-03 18:02:32', NULL, 1);
INSERT INTO `conf_tipocargo` VALUES (38, 'Medico a Honorarios', 1, '2022-01-03 18:03:05', '2023-01-03 17:06:18', 0);
INSERT INTO `conf_tipocargo` VALUES (39, 'Medico Especialista a Honorarios', 1, '2022-01-03 18:03:16', '2023-03-31 15:55:23', 0);
INSERT INTO `conf_tipocargo` VALUES (40, 'Profesional de Salud', 1, '2022-01-03 18:03:28', '2023-01-05 15:38:14', 1);
INSERT INTO `conf_tipocargo` VALUES (41, 'Profesional Junior', NULL, '2022-01-03 18:03:50', '2022-09-30 09:00:37', 0);
INSERT INTO `conf_tipocargo` VALUES (42, 'Profesional Medio', NULL, '2022-01-03 18:04:00', '2022-11-14 16:30:19', 0);
INSERT INTO `conf_tipocargo` VALUES (43, 'Profesional Senior', NULL, '2022-01-03 18:04:10', '2022-11-14 16:30:22', 0);
INSERT INTO `conf_tipocargo` VALUES (44, 'Quimica(o) Farmaceutico', 1, '2022-01-03 18:04:18', NULL, 1);
INSERT INTO `conf_tipocargo` VALUES (45, 'Tecnica(o)  Salud', 1, '2022-01-03 18:04:25', NULL, 1);
INSERT INTO `conf_tipocargo` VALUES (46, 'Tecnica(o) (No Salud)', NULL, '2022-01-03 18:04:35', '2022-01-04 09:16:07', 1);
INSERT INTO `conf_tipocargo` VALUES (47, 'Experta(o) Senior', NULL, '2022-01-04 10:20:12', '2022-09-30 09:04:20', 0);
INSERT INTO `conf_tipocargo` VALUES (48, 'Tecnica(o) (No Salud) Medio', NULL, '2022-01-06 11:58:04', '2022-09-30 09:04:39', 0);
INSERT INTO `conf_tipocargo` VALUES (49, 'Tecnica(o) (No Salud) Senior', NULL, '2022-01-06 11:58:55', '2022-09-30 09:05:31', 0);
INSERT INTO `conf_tipocargo` VALUES (50, 'Tecnico Salud (pabellon)', 1, '2022-01-26 10:55:52', NULL, 1);
INSERT INTO `conf_tipocargo` VALUES (51, 'Auxiliar (pabellon)', 1, '2022-01-30 21:57:59', NULL, 1);
INSERT INTO `conf_tipocargo` VALUES (52, 'Medico a Honorarios Cuidados Medios SIN VINCULO', 1, '2022-10-12 15:16:58', '2023-03-31 15:56:12', 0);
INSERT INTO `conf_tipocargo` VALUES (53, 'Medico a Honorarios Unidades Criticas', 1, '2022-10-12 15:17:14', '2023-03-31 15:56:16', 0);
INSERT INTO `conf_tipocargo` VALUES (54, 'Medico Especialista Honorarios Cuidados Medios', 1, '2022-10-12 15:21:44', '2023-03-31 15:56:19', 0);
INSERT INTO `conf_tipocargo` VALUES (55, 'Medico Especialista Honorarios Unidades Criticas', 1, '2022-10-12 15:22:14', '2023-03-31 15:56:21', 0);
INSERT INTO `conf_tipocargo` VALUES (56, 'Medico Psiquiatra UST', 1, '2022-10-12 16:50:34', '2023-03-31 15:56:36', 1);
INSERT INTO `conf_tipocargo` VALUES (57, 'Medico a Honorarios Unidades Criticas SIN VINCULO', 0, '2022-11-14 13:41:02', '2023-03-31 15:56:41', 0);
INSERT INTO `conf_tipocargo` VALUES (58, 'Medico Especialista Honorarios Unidades Criticas SIN VINCULO', 0, '2022-11-14 13:44:36', '2023-03-31 15:56:46', 0);
INSERT INTO `conf_tipocargo` VALUES (59, 'PROFESIONAL', 1, '2022-11-14 13:51:30', NULL, 1);
INSERT INTO `conf_tipocargo` VALUES (60, 'PROFESIONAL CON EXPERIENCIA', 1, '2022-11-14 13:51:44', NULL, 1);
INSERT INTO `conf_tipocargo` VALUES (61, 'PROFESIONAL', 0, '2022-11-14 13:51:52', '2023-03-31 15:57:05', 0);
INSERT INTO `conf_tipocargo` VALUES (62, 'PROFESIONAL CON EXPERIENCIA', 0, '2022-11-14 13:52:05', '2023-03-31 15:57:10', 0);
INSERT INTO `conf_tipocargo` VALUES (63, 'TECNICO BODEGA', 0, '2022-11-14 14:06:04', '2023-03-31 15:57:25', 0);
INSERT INTO `conf_tipocargo` VALUES (64, 'Tecnica (o) No SALUD CON EXPERIENCIA', 0, '2022-11-14 14:09:07', '2025-11-05 09:41:32', 1);
INSERT INTO `conf_tipocargo` VALUES (65, 'QUIMICO FARMACIA BODEGA', 0, '2022-11-14 14:24:43', '2023-03-31 15:58:00', 1);
INSERT INTO `conf_tipocargo` VALUES (66, 'PROFESIONAL (PSICOLOGA UST)', 1, '2022-11-14 14:25:13', '2025-11-05 09:41:32', 1);
INSERT INTO `conf_tipocargo` VALUES (67, 'Medico a Honorarios Cuidados Medios', 1, '2023-01-03 17:09:05', '2023-03-31 15:58:17', 0);
INSERT INTO `conf_tipocargo` VALUES (68, 'Medico Especialista Honorarios Cuidados Medios SIN VINCULO', 1, '2023-01-04 16:07:51', '2023-03-31 15:58:24', 0);
INSERT INTO `conf_tipocargo` VALUES (69, 'MEDICO ESPECIALISTA', 1, '2023-03-31 15:59:17', NULL, 1);
INSERT INTO `conf_tipocargo` VALUES (70, 'MEDICO GENERAL', 1, '2023-03-31 15:59:25', NULL, 1);
INSERT INTO `conf_tipocargo` VALUES (71, 'Medico Especialista U. Criticas CON VINCULO', 0, '2023-03-31 15:59:56', '2025-11-05 09:41:32', 1);
INSERT INTO `conf_tipocargo` VALUES (72, 'Medico Especialista U. Criticas SIN VINCULO', 1, '2023-03-31 16:00:04', '2025-11-05 09:41:32', 1);
INSERT INTO `conf_tipocargo` VALUES (73, 'Medico General U. Critica CON VINCULO', 1, '2023-03-31 16:00:30', '2025-11-05 09:41:32', 1);
INSERT INTO `conf_tipocargo` VALUES (74, 'Medico General U. Critica SIN VINCULO', 1, '2023-03-31 16:00:46', '2025-11-05 09:41:32', 1);
INSERT INTO `conf_tipocargo` VALUES (75, 'Medico General Cuidados Medios CON VINCULO', 1, '2023-03-31 16:01:28', NULL, 1);
INSERT INTO `conf_tipocargo` VALUES (76, 'Medico General Cuidados Medios SIN VINCULO', 1, '2023-03-31 16:01:36', NULL, 1);
INSERT INTO `conf_tipocargo` VALUES (77, 'Medico Especialista Cuidados Medios CON VINCULO', 1, '2023-03-31 16:08:12', NULL, 1);
INSERT INTO `conf_tipocargo` VALUES (78, 'Medico Especialista Cuidados Medios SIN VINCULO', 1, '2023-03-31 16:08:20', NULL, 1);
INSERT INTO `conf_tipocargo` VALUES (79, 'MEDICOS R1', 1, '2023-03-31 16:08:30', NULL, 1);
INSERT INTO `conf_tipocargo` VALUES (80, 'MEDICO SUBESPECIALISTA', 1, '2024-03-20 15:04:43', NULL, 1);

SET FOREIGN_KEY_CHECKS = 1;

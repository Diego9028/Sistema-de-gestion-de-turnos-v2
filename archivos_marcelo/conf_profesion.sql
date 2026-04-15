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

 Date: 06/11/2025 15:17:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for conf_profesion
-- ----------------------------
DROP TABLE IF EXISTS `conf_profesion`;
CREATE TABLE `conf_profesion`  (
  `id_profesion` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `date_added` datetime NULL DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_profesion`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of conf_profesion
-- ----------------------------
INSERT INTO `conf_profesion` VALUES (1, 'Abogada(o)', '2022-01-04 12:18:45', NULL, 1);
INSERT INTO `conf_profesion` VALUES (2, 'Administrador(a) Publico', '2022-01-04 12:18:55', NULL, 1);
INSERT INTO `conf_profesion` VALUES (3, 'Administrativa(o)', '2022-01-04 12:19:01', NULL, 1);
INSERT INTO `conf_profesion` VALUES (4, 'Analista de Sistema', '2022-01-04 12:19:07', NULL, 1);
INSERT INTO `conf_profesion` VALUES (5, 'Asistente Social', '2022-01-04 12:19:22', NULL, 1);
INSERT INTO `conf_profesion` VALUES (6, 'Auxiliar', '2022-01-04 12:19:30', NULL, 1);
INSERT INTO `conf_profesion` VALUES (7, 'Auxiliar de Enfermeria', '2022-01-04 12:19:43', NULL, 1);
INSERT INTO `conf_profesion` VALUES (8, 'Auxiliar Paramedico de Enfermeria', '2022-01-04 12:19:51', NULL, 1);
INSERT INTO `conf_profesion` VALUES (9, 'Contador Auditor', '2022-01-04 12:20:02', NULL, 1);
INSERT INTO `conf_profesion` VALUES (10, 'Dibujante Tecnico', '2022-01-04 12:20:07', NULL, 1);
INSERT INTO `conf_profesion` VALUES (11, 'Enfermera(o)', '2022-01-04 12:20:16', NULL, 1);
INSERT INTO `conf_profesion` VALUES (12, 'Estadistica(o)', '2022-01-04 12:20:21', NULL, 1);
INSERT INTO `conf_profesion` VALUES (13, 'Fonoaudiologo(a)', '2022-01-04 12:20:27', NULL, 1);
INSERT INTO `conf_profesion` VALUES (14, 'Gasfiter', '2022-01-04 12:20:34', NULL, 1);
INSERT INTO `conf_profesion` VALUES (15, 'Ingeniero(a) (Otros)', '2022-01-04 12:20:56', NULL, 1);
INSERT INTO `conf_profesion` VALUES (16, 'Ingeniero(a) Biomedico', '2022-01-04 12:21:02', NULL, 1);
INSERT INTO `conf_profesion` VALUES (17, 'Ingeniero(a) Civil Industrial', '2022-01-04 12:21:15', NULL, 1);
INSERT INTO `conf_profesion` VALUES (18, 'Ingeniero(a) Civil Informatico', '2022-01-04 12:21:21', NULL, 1);
INSERT INTO `conf_profesion` VALUES (19, 'Ingeniero(a) Comercial', '2022-01-04 12:21:29', NULL, 1);
INSERT INTO `conf_profesion` VALUES (20, 'Ingeniero(a) Electrico', '2022-01-04 12:21:34', NULL, 1);
INSERT INTO `conf_profesion` VALUES (21, 'Ingeniero(a) en Administracion de Empresas', '2022-01-04 12:21:40', NULL, 1);
INSERT INTO `conf_profesion` VALUES (22, 'Ingeniero(a) en Agronegocios', '2022-01-04 12:21:49', NULL, 1);
INSERT INTO `conf_profesion` VALUES (23, 'Ingeniero(a) en Ejec. en Aministracion', '2022-01-04 12:21:57', NULL, 1);
INSERT INTO `conf_profesion` VALUES (24, 'Ingeniero(a) Matematico', '2022-01-04 12:22:10', NULL, 1);
INSERT INTO `conf_profesion` VALUES (25, 'Ingeniero(a) Mecanico', '2022-01-04 12:22:15', NULL, 1);
INSERT INTO `conf_profesion` VALUES (26, 'Interna(o) de Enfermeria', '2022-01-04 12:24:13', NULL, 1);
INSERT INTO `conf_profesion` VALUES (27, 'Interna(o) de Medicina', '2022-01-04 12:24:18', NULL, 1);
INSERT INTO `conf_profesion` VALUES (28, 'Kinesiologa(o)', '2022-01-04 12:24:28', NULL, 1);
INSERT INTO `conf_profesion` VALUES (29, 'Masoterapeuta', '2022-01-04 12:25:10', NULL, 1);
INSERT INTO `conf_profesion` VALUES (30, 'Matron(a)', '2022-01-04 12:25:24', NULL, 1);
INSERT INTO `conf_profesion` VALUES (31, 'Medico', '2022-01-04 12:30:58', NULL, 1);
INSERT INTO `conf_profesion` VALUES (32, 'Medico Anestesiologo(a)', '2022-01-04 12:31:05', NULL, 1);
INSERT INTO `conf_profesion` VALUES (33, 'Medico Cirujana(o)', '2022-01-04 12:31:11', NULL, 1);
INSERT INTO `conf_profesion` VALUES (34, 'Medico Enfermedades Respiratorias', '2022-01-04 12:31:18', NULL, 1);
INSERT INTO `conf_profesion` VALUES (35, 'Medico Geriatra', '2022-01-04 12:31:23', NULL, 1);
INSERT INTO `conf_profesion` VALUES (36, 'Medico Imagenologia', '2022-01-04 12:31:29', NULL, 1);
INSERT INTO `conf_profesion` VALUES (37, 'Medico Infectologo(a)', '2022-01-04 12:31:33', NULL, 1);
INSERT INTO `conf_profesion` VALUES (38, 'Medico Intensiva Adulto', '2022-01-04 12:31:38', NULL, 1);
INSERT INTO `conf_profesion` VALUES (39, 'Medico Internista', '2022-01-04 12:31:44', NULL, 1);
INSERT INTO `conf_profesion` VALUES (40, 'Medico Medicina Legal', '2022-01-04 12:31:50', NULL, 1);
INSERT INTO `conf_profesion` VALUES (41, 'Medico Neurocirujana(o)', '2022-01-04 12:31:56', NULL, 1);
INSERT INTO `conf_profesion` VALUES (42, 'Medico Neurologa(o)', '2022-01-04 12:32:02', NULL, 1);
INSERT INTO `conf_profesion` VALUES (43, 'Medico Otorrinolaringologa(o)', '2022-01-04 12:32:08', NULL, 1);
INSERT INTO `conf_profesion` VALUES (44, 'Medico Otras Especialidades', '2022-01-04 12:32:14', NULL, 1);
INSERT INTO `conf_profesion` VALUES (45, 'Medico Patologa(o)', '2022-01-04 12:32:19', NULL, 1);
INSERT INTO `conf_profesion` VALUES (46, 'Medico Psiquiatra', '2022-01-04 12:32:26', NULL, 1);
INSERT INTO `conf_profesion` VALUES (47, 'Medico Radiologa(a)', '2022-01-04 12:32:31', NULL, 1);
INSERT INTO `conf_profesion` VALUES (48, 'Medico Traumatologa(o)', '2022-01-04 12:32:36', NULL, 1);
INSERT INTO `conf_profesion` VALUES (49, 'Medico Traumatologia y Ortopedia', '2022-01-04 12:32:41', NULL, 1);
INSERT INTO `conf_profesion` VALUES (50, 'Medico Urgenciologa(o)', '2022-01-04 12:32:47', NULL, 1);
INSERT INTO `conf_profesion` VALUES (51, 'Medico Urologa(o)', '2022-01-04 12:32:52', NULL, 1);
INSERT INTO `conf_profesion` VALUES (52, 'Nutricionista', '2022-01-04 12:32:58', NULL, 1);
INSERT INTO `conf_profesion` VALUES (53, 'Planificador Social', '2022-01-04 12:33:03', NULL, 1);
INSERT INTO `conf_profesion` VALUES (54, 'Profesional (Otros)', '2022-01-04 12:33:10', NULL, 1);
INSERT INTO `conf_profesion` VALUES (55, 'Psicologo(a)', '2022-01-04 12:33:17', NULL, 1);
INSERT INTO `conf_profesion` VALUES (56, 'Quimica(o) Farmaceutico', '2022-01-04 12:33:33', NULL, 1);
INSERT INTO `conf_profesion` VALUES (57, 'Quimico Laboratista', '2022-01-04 12:33:39', NULL, 1);
INSERT INTO `conf_profesion` VALUES (58, 'Realizador(a) Audiovisual', '2022-01-04 12:33:45', NULL, 1);
INSERT INTO `conf_profesion` VALUES (59, 'Secretaria Administrativa', '2022-01-04 12:33:50', NULL, 1);
INSERT INTO `conf_profesion` VALUES (60, 'Soldador', '2022-01-04 12:33:55', NULL, 1);
INSERT INTO `conf_profesion` VALUES (61, 'Tecnico de Nivel Medio en Enfermeria', '2022-01-04 12:34:00', NULL, 1);
INSERT INTO `conf_profesion` VALUES (63, 'Tecnico en Alimentacion', '2022-01-04 12:35:49', NULL, 1);
INSERT INTO `conf_profesion` VALUES (64, 'Tecnico en Carpinteria', '2022-01-04 12:35:54', NULL, 1);
INSERT INTO `conf_profesion` VALUES (65, 'Tecnico en Electricidad y Automatizacion Industrial', '2022-01-04 12:36:05', NULL, 1);
INSERT INTO `conf_profesion` VALUES (66, 'Tecnico en Odontologia', '2022-01-04 12:36:11', NULL, 1);
INSERT INTO `conf_profesion` VALUES (67, 'Tecnico en Refrigeracion y Climatizacion', '2022-01-04 12:36:16', NULL, 1);
INSERT INTO `conf_profesion` VALUES (68, 'Tecnico en Turismo', '2022-01-04 12:36:22', NULL, 1);
INSERT INTO `conf_profesion` VALUES (69, 'Tecnico Nivel Superior Higienista Dental', '2022-01-04 12:36:27', NULL, 1);
INSERT INTO `conf_profesion` VALUES (70, 'Tecnico Paramedico', '2022-01-04 12:36:33', NULL, 1);
INSERT INTO `conf_profesion` VALUES (71, 'Tecnico Sup. en Enfermeria', '2022-01-04 12:36:39', NULL, 1);
INSERT INTO `conf_profesion` VALUES (72, 'Tecnico Superior (otros)', '2022-01-04 12:36:48', NULL, 1);
INSERT INTO `conf_profesion` VALUES (73, 'Tecnico Superior Contabilidad y Finanzas', '2022-01-04 12:36:54', NULL, 1);
INSERT INTO `conf_profesion` VALUES (74, 'Tecnico (Otros)', '2022-01-04 12:37:02', NULL, 1);
INSERT INTO `conf_profesion` VALUES (75, 'Tecnologa(a) Medico', '2022-01-04 12:37:10', NULL, 1);
INSERT INTO `conf_profesion` VALUES (76, 'Terapeuta Ocupacional', '2022-01-04 12:37:15', NULL, 1);
INSERT INTO `conf_profesion` VALUES (77, 'Trabajador Social', '2022-01-04 12:37:21', NULL, 1);
INSERT INTO `conf_profesion` VALUES (78, 'Técnico en Administración de Recursos Humanos', '2023-01-11 11:53:15', NULL, 1);
INSERT INTO `conf_profesion` VALUES (79, 'Licenciado (a) Comunicacion Social', '2023-01-11 12:17:16', NULL, 1);
INSERT INTO `conf_profesion` VALUES (80, 'Qumico Farmaceutica(o)', '2024-07-12 11:20:38', NULL, 1);

SET FOREIGN_KEY_CHECKS = 1;

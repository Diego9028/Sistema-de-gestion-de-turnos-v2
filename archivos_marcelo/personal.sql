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

 Date: 06/11/2025 15:17:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for personal
/*
   `id_personal` Identificaión uníca de personal tanto a contrata como a honorarios,
  `rol` identificador interno de Huap para conexión con sistema SIRH
  `rut` sin puntos,
  `dv`  digito Verificador,
  `nombre` ,
  `apel_pat` ,
  `apel_mat` ,
  `rrhh` puede tener 2 valores posibles, 0: significa personala Honorarios, 1 Personal Contratado
  `jefatura`  tiene 2 valores psobles: 0, no es jefe, 1: es jefe
  `id_servicio` identicador del servicio de pertenencia,
  `id_tipocargo` identificador de cargo asociado,
  `id_tipocontrato` identificador tipo contrato,
  `profesion` identificador profesion ,
  `clave`  encriptada mediamte sha2(clave,512),
  `estado` id_estado  1 activo por defecto y 2 usuario activo temporalmente, el rsto de los estado indica no activo no admisible para efectos operativos,
  `date_added` datetime NULL DEFAULT CURRENT_TIMESTAMP Fecha de Incorporaciona BD
*/
-- ----------------------------
DROP TABLE IF EXISTS `personal`;
CREATE TABLE `personalAux`  (
  `id_personal` int NOT NULL DEFAULT 0 AUTO_INCREMENT,
  `rol` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rut` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `dv` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `apel_pat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `apel_mat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rrhh` tinyint(1) NULL DEFAULT 0,
  `jefatura` int NULL DEFAULT NULL,
  `id_servicio` int NULL DEFAULT NULL,
  `id_tipocargo` int NULL DEFAULT NULL,
  `id_tipocontrato` int NULL DEFAULT NULL,
  `profesion` int NULL DEFAULT NULL,
  `clave` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `estado` int NULL DEFAULT 1,
  `date_added` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_personal`) USING BTREE,
  INDEX `personalFk2`(`estado` ASC) USING BTREE,
  INDEX `personalFk3`(`id_tipocargo` ASC) USING BTREE,
  INDEX `perdonalFk4`(`id_tipocontrato` ASC) USING BTREE,
  INDEX `personalFk1`(`id_servicio` ASC) USING BTREE,
  CONSTRAINT `perdonalFk4` FOREIGN KEY (`id_tipocontrato`) REFERENCES `conf_tipocontrato` (`id_tipocontrato`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `personalFk2` FOREIGN KEY (`estado`) REFERENCES `conf_estados` (`id_estado`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `personalFk3` FOREIGN KEY (`id_tipocargo`) REFERENCES `conf_tipocargo` (`id_tipocargo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `personalFk1` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 36199 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

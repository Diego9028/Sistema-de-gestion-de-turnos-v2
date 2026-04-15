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

 Date: 06/11/2025 14:21:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for servicio
-- ----------------------------
DROP TABLE IF EXISTS `servicio`;
CREATE TABLE `servicio`  (
  `id_servicio` int NOT NULL DEFAULT 0,
  `nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_responsable` int NULL DEFAULT NULL,
  `id_subrogante` int NULL DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of servicio
-- ----------------------------
INSERT INTO `servicio` VALUES (511, 'UPC Quemados', 4545, 4123, 1);
INSERT INTO `servicio` VALUES (516, 'Coordinacion Apoyo Clinico y Diagnostico', 240, 240, 1);
INSERT INTO `servicio` VALUES (542, 'Gestión del Cuidado en Pabellón', NULL, NULL, 1);
INSERT INTO `servicio` VALUES (623, 'UPC MQ', 328, 328, 1);
INSERT INTO `servicio` VALUES (701, 'Direccion', 347, 245, 1);
INSERT INTO `servicio` VALUES (702, 'Calidad y Seguridad del Paciente', 157, 329, 1);
INSERT INTO `servicio` VALUES (703, 'IAAS', 3194, 3107, 1);
INSERT INTO `servicio` VALUES (704, 'Asesoria Juridica', 187, 1424, 1);
INSERT INTO `servicio` VALUES (705, 'Secretaria y Oficina de Partes', 2938, 2716, 1);
INSERT INTO `servicio` VALUES (706, 'Dpto.Planificacion y Control de Gestion', 2865, 1350, 1);
INSERT INTO `servicio` VALUES (707, 'Analisis Clinico GRD', 3389, 3455, 1);
INSERT INTO `servicio` VALUES (708, 'Subdireccion de Gestion del Cuidado', 2860, 2900, 1);
INSERT INTO `servicio` VALUES (709, 'Gestion del Cuidado en Pabellon', 2775, 1242, 1);
INSERT INTO `servicio` VALUES (710, 'Auditoria', 3500, 3038, 1);
INSERT INTO `servicio` VALUES (711, 'Dpto.Formacion&comma; Investigacion y Docencia', 244, 2650, 1);
INSERT INTO `servicio` VALUES (712, 'Control de Gestion', 1847, 1350, 1);
INSERT INTO `servicio` VALUES (713, 'Estadistica Hospitalaria', 2636, 71, 1);
INSERT INTO `servicio` VALUES (714, 'Calidad Percibida', 2678, 3765, 1);
INSERT INTO `servicio` VALUES (715, 'Proyectos', 2844, 2865, 1);
INSERT INTO `servicio` VALUES (716, 'Comunicaciones y Relaciones Publicas', 3075, 3282, 1);
INSERT INTO `servicio` VALUES (717, 'Subdireccion de Gestion Clinica', 245, 729, 1);
INSERT INTO `servicio` VALUES (718, 'Gestion de la Demanda', 729, 1170, 1);
INSERT INTO `servicio` VALUES (719, 'Clinica HUAP', 245, 729, 1);
INSERT INTO `servicio` VALUES (721, 'Traumatologia', 3471, 326, 1);
INSERT INTO `servicio` VALUES (722, 'Cuidados Medios 3°-4°-6° Piso', 1035, 1170, 1);
INSERT INTO `servicio` VALUES (723, 'Cirugia', 443, 876, 1);
INSERT INTO `servicio` VALUES (724, 'Neurologia', 489, 2467, 1);
INSERT INTO `servicio` VALUES (725, 'UTI 5° piso', 1025, 931, 1);
INSERT INTO `servicio` VALUES (732, 'Emergencia Hospitalaria', 220, 4596, 1);
INSERT INTO `servicio` VALUES (733, 'Dental', 3580, 3359, 1);
INSERT INTO `servicio` VALUES (734, 'Pabellon', 3366, 3471, 1);
INSERT INTO `servicio` VALUES (735, 'Anestesia', 3037, 3023, 1);
INSERT INTO `servicio` VALUES (736, 'Angiografia', 378, 312, 1);
INSERT INTO `servicio` VALUES (737, 'Endoscopia', 2847, 3522, 1);
INSERT INTO `servicio` VALUES (738, 'Rehabilitacion y Gestion Funcional', 4690, 333, 1);
INSERT INTO `servicio` VALUES (739, 'Psicotrauma', 2975, 1652, 1);
INSERT INTO `servicio` VALUES (740, 'Procuramiento de Organos', 3116, 1856, 1);
INSERT INTO `servicio` VALUES (742, 'Nutricion', 3001, 3041, 1);
INSERT INTO `servicio` VALUES (743, 'Imagenologia', 22, 2466, 1);
INSERT INTO `servicio` VALUES (744, 'Laboratorio Clinico', 1067, 2981, 1);
INSERT INTO `servicio` VALUES (745, 'Anatomia Patologica', 278, 290, 1);
INSERT INTO `servicio` VALUES (746, 'Farmacia', 2475, 1328, 1);
INSERT INTO `servicio` VALUES (747, 'Medicina Transfusional', 240, 317, 1);
INSERT INTO `servicio` VALUES (748, 'Servicio Social', 3008, 2960, 1);
INSERT INTO `servicio` VALUES (749, 'Alta Asistida', 1534, 1580, 1);
INSERT INTO `servicio` VALUES (752, 'Farmacia Clinica', 880, 6209, 1);
INSERT INTO `servicio` VALUES (753, 'Apoyo Clinico Logistico - Ref insumos', 3576, 535, 1);
INSERT INTO `servicio` VALUES (754, 'Apoyo Clinico Asistencial - Jefe de Turno A', 2373, 2373, 1);
INSERT INTO `servicio` VALUES (755, 'Epidemiologia Clinica', 3435, 1236, 1);
INSERT INTO `servicio` VALUES (756, 'Subdireccion de Gestion Administrativa y Financiera', 7064, 3575, 1);
INSERT INTO `servicio` VALUES (757, 'Finanzas', 3575, 2487, 1);
INSERT INTO `servicio` VALUES (758, 'Tecnologia de la Informacion', 2996, 2791, 1);
INSERT INTO `servicio` VALUES (761, 'Gestion del Cuidado en UPC Quemados', 2896, 3048, 1);
INSERT INTO `servicio` VALUES (762, 'UPC 1° piso (SDGC)', 3053, 1038, 1);
INSERT INTO `servicio` VALUES (763, 'Gestion del Cuidado 3° piso', 2900, 3044, 1);
INSERT INTO `servicio` VALUES (764, 'Gestion del Cuidado 6° piso', 2740, 2752, 1);
INSERT INTO `servicio` VALUES (765, 'Gestion del Cuidado 4° piso', 3044, 4982, 1);
INSERT INTO `servicio` VALUES (767, 'Gestion del Cuidado en Clinica HUAP', 2862, 3068, 1);
INSERT INTO `servicio` VALUES (768, 'Abastecimiento', 4122, 4119, 1);
INSERT INTO `servicio` VALUES (771, 'Emergencia Hospitalaria (SDGC)', 2756, 2977, 1);
INSERT INTO `servicio` VALUES (772, 'Dental (SDGC)', 3580, 3359, 1);
INSERT INTO `servicio` VALUES (773, 'Gestion del Cuidado en Angiografia', 1251, 1061, 1);
INSERT INTO `servicio` VALUES (774, 'Gestion del Cuidado en Endoscopia', 535, 2752, 1);
INSERT INTO `servicio` VALUES (775, 'Esterilizacion', 3524, 369, 1);
INSERT INTO `servicio` VALUES (776, 'Roperia y Aseo Hospitalario', 3463, 3524, 1);
INSERT INTO `servicio` VALUES (777, 'Gestion del Cuidado en UTI 5° piso', 2860, 458, 1);
INSERT INTO `servicio` VALUES (779, 'Subdireccion de Gestion y Desarrollo de las Personas', 5902, 2645, 1);
INSERT INTO `servicio` VALUES (780, 'Gestion de Personas', 2780, 6254, 1);
INSERT INTO `servicio` VALUES (781, 'Administracion de Personas', 2780, 6254, 1);
INSERT INTO `servicio` VALUES (782, 'Remuneraciones', 2557, 3234, 1);
INSERT INTO `servicio` VALUES (783, 'Recursos Fisicos', 2751, 3100, 1);
INSERT INTO `servicio` VALUES (784, 'Calidad de Vida', 6254, 2823, 1);
INSERT INTO `servicio` VALUES (785, 'Prevencion de Riesgos', 2935, 2935, 1);
INSERT INTO `servicio` VALUES (786, 'Salud del Trabajador', 1057, 2742, 1);
INSERT INTO `servicio` VALUES (787, 'Sala Cuna y Cuidados Infantiles', 2788, 1887, 1);
INSERT INTO `servicio` VALUES (788, 'Bienestar al Personal', 2823, 3554, 1);
INSERT INTO `servicio` VALUES (789, 'Desarrollo Organizacional', 5902, 2645, 1);
INSERT INTO `servicio` VALUES (790, 'Reclutamiento y Seleccion', 5902, 979, 1);
INSERT INTO `servicio` VALUES (791, 'Capacitacion', 2645, 3505, 1);
INSERT INTO `servicio` VALUES (792, 'Honorarios', 6971, 3213, 1);
INSERT INTO `servicio` VALUES (793, 'Gestion del Cuidado en UPC MQ', 2860, 2860, 1);
INSERT INTO `servicio` VALUES (794, 'Apoyo Gestion Presupuestaria Financiera', 5571, 3575, 1);
INSERT INTO `servicio` VALUES (797, 'Contabilidad', 2487, 2773, 1);
INSERT INTO `servicio` VALUES (798, 'Cobranzas', 2853, 2691, 1);
INSERT INTO `servicio` VALUES (799, 'Tesoreria', 3178, 3196, 1);
INSERT INTO `servicio` VALUES (800, 'Admision', 3029, 2684, 1);
INSERT INTO `servicio` VALUES (801, 'Analisis Financiero', 3575, 7064, 1);
INSERT INTO `servicio` VALUES (802, 'Activo Fijo', 3417, 3575, 1);
INSERT INTO `servicio` VALUES (804, 'Operacion y Soporte', 2932, 2996, 1);
INSERT INTO `servicio` VALUES (805, 'Desarrollo Tecnologico', 2791, 2996, 1);
INSERT INTO `servicio` VALUES (807, 'Licitaciones', 453, 4122, 1);
INSERT INTO `servicio` VALUES (808, 'Administracion por Gestion de Contrato', 5861, 2784, 1);
INSERT INTO `servicio` VALUES (809, 'Adquisicion', 4119, 4122, 1);
INSERT INTO `servicio` VALUES (810, 'Aprovisionamiento y Distribucion', 561, 1744, 1);
INSERT INTO `servicio` VALUES (811, 'Mantenimiento de Infraestructura', 2745, 2751, 1);
INSERT INTO `servicio` VALUES (812, 'Mantenimiento de Equipos Industriales', 3162, 2751, 1);
INSERT INTO `servicio` VALUES (813, 'Mantenimiento de Equipos Medicos', 3100, 2751, 1);
INSERT INTO `servicio` VALUES (830, 'Coordinacion Gestion Clinica Asistencial', 931, 1025, 1);
INSERT INTO `servicio` VALUES (831, 'Gestion de Pacientes', 76, 196, 1);
INSERT INTO `servicio` VALUES (832, 'GES', 3108, 2561, 1);
INSERT INTO `servicio` VALUES (833, 'Area Cuidados Medios MQ', 1035, 1170, 1);
INSERT INTO `servicio` VALUES (834, 'Area Quirurgica', 245, 729, 1);
INSERT INTO `servicio` VALUES (835, 'Coordinacion Especialidades MQ', 834, 834, 1);
INSERT INTO `servicio` VALUES (836, 'Cardiologia', 549, 2992, 1);
INSERT INTO `servicio` VALUES (837, 'Fisiatria', 3235, 3235, 1);
INSERT INTO `servicio` VALUES (838, 'Psiquiatria', 6237, 6237, 1);
INSERT INTO `servicio` VALUES (839, 'Nutriologia', 177, 177, 1);
INSERT INTO `servicio` VALUES (840, 'Nefrologia', 3363, 3363, 1);
INSERT INTO `servicio` VALUES (841, 'Gastroenterologia', 2477, 2477, 1);
INSERT INTO `servicio` VALUES (842, 'Neurocirugia', 3352, 658, 1);
INSERT INTO `servicio` VALUES (843, 'Urologia', 3167, 2286, 1);
INSERT INTO `servicio` VALUES (844, 'Area Critica', 245, 729, 1);
INSERT INTO `servicio` VALUES (845, 'UCI VALECH', 328, 773, 1);
INSERT INTO `servicio` VALUES (846, 'UPC 1° piso', 773, 530, 1);
INSERT INTO `servicio` VALUES (847, 'Cirugia Plastica y Reconstructiva', 1003, 1003, 1);
INSERT INTO `servicio` VALUES (848, 'Apoyo Clinico Asistencial - Jefe de Turno B', 2382, 2382, 1);
INSERT INTO `servicio` VALUES (849, 'Apoyo Clinico Asistencial - Jefe de Turno C', 243, 243, 1);
INSERT INTO `servicio` VALUES (850, 'Apoyo Clinico Asistencial - Jefe de Turno D', 2370, 2370, 1);
INSERT INTO `servicio` VALUES (851, 'Gestion Clinica Asistencial Enfermeria', 2860, 2896, 1);
INSERT INTO `servicio` VALUES (852, 'Area Cuidados Medios MQ (SDGC)', 2860, 2860, 1);
INSERT INTO `servicio` VALUES (853, 'Area Quirurgica (SDGC)', 2860, 2860, 1);
INSERT INTO `servicio` VALUES (854, 'GC en Procedimientos de Cardiologia', 2739, 2860, 1);
INSERT INTO `servicio` VALUES (855, 'Area Critica (SDGC)', 2860, 2860, 1);
INSERT INTO `servicio` VALUES (856, 'UCI VALECH (SDGC)', 1102, 922, 1);
INSERT INTO `servicio` VALUES (857, 'Archivo', 2636, 71, 1);
INSERT INTO `servicio` VALUES (858, 'Apoyo en Control-Coordinacion y Soporte', 5902, 6254, 1);
INSERT INTO `servicio` VALUES (859, 'Induccion Institucional', 3505, 2645, 1);

SET FOREIGN_KEY_CHECKS = 1;

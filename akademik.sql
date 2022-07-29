/*
 Navicat Premium Data Transfer

 Source Server         : Docker MysSQL
 Source Server Type    : MySQL
 Source Server Version : 80021 (8.0.21)
 Source Host           : localhost:2010
 Source Schema         : ujian

 Target Server Type    : MySQL
 Target Server Version : 80021 (8.0.21)
 File Encoding         : 65001

 Date: 29/07/2022 11:01:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for data_kelas
-- ----------------------------
DROP TABLE IF EXISTS `data_kelas`;
CREATE TABLE `data_kelas`  (
  `kelas_id` bigint NOT NULL AUTO_INCREMENT,
  `kelas_dosen_id` bigint NULL DEFAULT NULL,
  `kelas_nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `kelas_created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `kelas_updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`kelas_id`) USING BTREE,
  INDEX `data_kelas_master_dosen_dosen_id_fk`(`kelas_dosen_id` ASC) USING BTREE,
  CONSTRAINT `data_kelas_master_dosen_dosen_id_fk` FOREIGN KEY (`kelas_dosen_id`) REFERENCES `master_dosen` (`dosen_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_kelas
-- ----------------------------

-- ----------------------------
-- Table structure for data_kelas_detail
-- ----------------------------
DROP TABLE IF EXISTS `data_kelas_detail`;
CREATE TABLE `data_kelas_detail`  (
  `kdet_id` bigint NOT NULL AUTO_INCREMENT,
  `kdet_kelas_id` bigint NULL DEFAULT NULL,
  `kdet_krs_id` bigint NULL DEFAULT NULL,
  `kdet_created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `kdet_updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`kdet_id`) USING BTREE,
  INDEX `data_kelas_detail_data_krs_krs_id_fk`(`kdet_krs_id` ASC) USING BTREE,
  INDEX `data_kelas_detail_data_kelas_kelas_id_fk`(`kdet_kelas_id` ASC) USING BTREE,
  CONSTRAINT `data_kelas_detail_data_kelas_kelas_id_fk` FOREIGN KEY (`kdet_kelas_id`) REFERENCES `data_kelas` (`kelas_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `data_kelas_detail_data_krs_krs_id_fk` FOREIGN KEY (`kdet_krs_id`) REFERENCES `data_krs` (`krs_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_kelas_detail
-- ----------------------------

-- ----------------------------
-- Table structure for data_krs
-- ----------------------------
DROP TABLE IF EXISTS `data_krs`;
CREATE TABLE `data_krs`  (
  `krs_id` bigint NOT NULL AUTO_INCREMENT,
  `krs_mhs_id` int NULL DEFAULT NULL,
  `krs_dtmakul_id` bigint NULL DEFAULT NULL,
  `krs_nilai` float NULL DEFAULT NULL,
  `krs_created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `krs_updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`krs_id`) USING BTREE,
  INDEX `data_krs_data_matakuliah_dtmakul_id_fk`(`krs_dtmakul_id` ASC) USING BTREE,
  INDEX `data_krs_master_mahasiswa_mhs_id_fk`(`krs_mhs_id` ASC) USING BTREE,
  CONSTRAINT `data_krs_data_matakuliah_dtmakul_id_fk` FOREIGN KEY (`krs_dtmakul_id`) REFERENCES `data_matakuliah` (`dtmakul_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `data_krs_master_mahasiswa_mhs_id_fk` FOREIGN KEY (`krs_mhs_id`) REFERENCES `master_mahasiswa` (`mhs_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_krs
-- ----------------------------

-- ----------------------------
-- Table structure for data_matakuliah
-- ----------------------------
DROP TABLE IF EXISTS `data_matakuliah`;
CREATE TABLE `data_matakuliah`  (
  `dtmakul_id` bigint NOT NULL AUTO_INCREMENT,
  `makul_id` bigint NOT NULL,
  `dtmakul_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dtmakul_updaated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`dtmakul_id`) USING BTREE,
  INDEX `makul_id`(`makul_id` ASC) USING BTREE,
  CONSTRAINT `data_matakuliah_ibfk_1` FOREIGN KEY (`makul_id`) REFERENCES `master_matakuliah` (`makul_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_matakuliah
-- ----------------------------

-- ----------------------------
-- Table structure for master_dosen
-- ----------------------------
DROP TABLE IF EXISTS `master_dosen`;
CREATE TABLE `master_dosen`  (
  `dosen_id` bigint NOT NULL AUTO_INCREMENT,
  `dosen_user_id` bigint UNSIGNED NOT NULL,
  `dosen_prodi_id` int NOT NULL,
  `dosen_nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dosen_nik` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dosen_kode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dosen_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dosen_updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`dosen_id`) USING BTREE,
  UNIQUE INDEX `dosen_user_id`(`dosen_user_id` ASC) USING BTREE,
  INDEX `dosen_prodi_id`(`dosen_prodi_id` ASC) USING BTREE,
  CONSTRAINT `master_dosen_ibfk_1` FOREIGN KEY (`dosen_prodi_id`) REFERENCES `master_prodi` (`prodi_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `master_dosen_ibfk_2` FOREIGN KEY (`dosen_user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of master_dosen
-- ----------------------------
INSERT INTO `master_dosen` VALUES (1, 2, 1, 'Doni Herlambang', '0128370', 'DH', '2022-02-17 15:47:06', NULL);

-- ----------------------------
-- Table structure for master_dosen_pengampu
-- ----------------------------
DROP TABLE IF EXISTS `master_dosen_pengampu`;
CREATE TABLE `master_dosen_pengampu`  (
  `dp_id` bigint NOT NULL AUTO_INCREMENT,
  `dp_dosen_id` bigint NULL DEFAULT NULL,
  `dp_makul_id` bigint NULL DEFAULT NULL,
  `dp_created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `dp_updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`dp_id`) USING BTREE,
  INDEX `master_dosen_pengampu_master_dosen_dosen_id_fk`(`dp_dosen_id` ASC) USING BTREE,
  INDEX `master_dosen_pengampu_master_matakuliah_makul_id_fk`(`dp_makul_id` ASC) USING BTREE,
  CONSTRAINT `master_dosen_pengampu_master_dosen_dosen_id_fk` FOREIGN KEY (`dp_dosen_id`) REFERENCES `master_dosen` (`dosen_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `master_dosen_pengampu_master_matakuliah_makul_id_fk` FOREIGN KEY (`dp_makul_id`) REFERENCES `master_matakuliah` (`makul_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of master_dosen_pengampu
-- ----------------------------

-- ----------------------------
-- Table structure for master_mahasiswa
-- ----------------------------
DROP TABLE IF EXISTS `master_mahasiswa`;
CREATE TABLE `master_mahasiswa`  (
  `mhs_id` int NOT NULL AUTO_INCREMENT,
  `mhs_user_id` bigint UNSIGNED NOT NULL,
  `mhs_prodi_id` int NOT NULL,
  `mhs_nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mhs_tingkat` int NOT NULL,
  `mhs_nim` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mhs_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mhs_updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`mhs_id`) USING BTREE,
  UNIQUE INDEX `mhs_user_id`(`mhs_user_id` ASC) USING BTREE,
  INDEX `mhs_prodi_id`(`mhs_prodi_id` ASC) USING BTREE,
  CONSTRAINT `master_mahasiswa_ibfk_1` FOREIGN KEY (`mhs_user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `master_mahasiswa_ibfk_2` FOREIGN KEY (`mhs_prodi_id`) REFERENCES `master_prodi` (`prodi_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of master_mahasiswa
-- ----------------------------
INSERT INTO `master_mahasiswa` VALUES (1, 3, 1, 'Salman Alz', 1, 'L2000419', '2022-02-17 15:56:35', NULL);

-- ----------------------------
-- Table structure for master_matakuliah
-- ----------------------------
DROP TABLE IF EXISTS `master_matakuliah`;
CREATE TABLE `master_matakuliah`  (
  `makul_id` bigint NOT NULL AUTO_INCREMENT,
  `makul_tingkat_id` int NOT NULL,
  `makul_nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `makul_kode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `makul_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `makul_updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`makul_id`) USING BTREE,
  UNIQUE INDEX `makul_tingkat_id`(`makul_tingkat_id` ASC, `makul_kode` ASC) USING BTREE,
  CONSTRAINT `master_matakuliah_ibfk_1` FOREIGN KEY (`makul_tingkat_id`) REFERENCES `master_tingkat` (`tingkat_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of master_matakuliah
-- ----------------------------
INSERT INTO `master_matakuliah` VALUES (1, 1, 'Teknik Pemrograman', 'TPM', '2022-02-17 11:46:30', NULL);
INSERT INTO `master_matakuliah` VALUES (2, 1, 'Matematika', 'MTK', '2022-02-17 11:46:30', NULL);
INSERT INTO `master_matakuliah` VALUES (3, 1, 'Fisika', 'FSK', '2022-02-17 11:46:30', NULL);
INSERT INTO `master_matakuliah` VALUES (4, 1, 'Bahasa Inggris', 'ENG', '2022-02-17 11:46:30', NULL);

-- ----------------------------
-- Table structure for master_prodi
-- ----------------------------
DROP TABLE IF EXISTS `master_prodi`;
CREATE TABLE `master_prodi`  (
  `prodi_id` int NOT NULL AUTO_INCREMENT,
  `prodi_nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `prodi_kode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `prodi_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `prodi_updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`prodi_id`) USING BTREE,
  UNIQUE INDEX `prodi_kode`(`prodi_kode` ASC) USING BTREE,
  UNIQUE INDEX `prodi_kode_2`(`prodi_kode` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of master_prodi
-- ----------------------------
INSERT INTO `master_prodi` VALUES (1, 'Teknik Mesin', 'TMI', '2022-02-17 11:45:15', NULL);
INSERT INTO `master_prodi` VALUES (2, 'Teknik Perancangan', 'TPM', '2022-02-17 11:45:15', NULL);
INSERT INTO `master_prodi` VALUES (3, 'Teknik Mekatroniika', 'TMK', '2022-02-17 11:45:15', NULL);

-- ----------------------------
-- Table structure for master_tingkat
-- ----------------------------
DROP TABLE IF EXISTS `master_tingkat`;
CREATE TABLE `master_tingkat`  (
  `tingkat_id` int NOT NULL AUTO_INCREMENT,
  `tingkat_level` tinyint(1) NOT NULL,
  `tingkat_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tingkat_updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`tingkat_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of master_tingkat
-- ----------------------------
INSERT INTO `master_tingkat` VALUES (1, 1, '2022-02-17 11:44:35', NULL);
INSERT INTO `master_tingkat` VALUES (2, 2, '2022-02-17 11:44:35', NULL);
INSERT INTO `master_tingkat` VALUES (3, 3, '2022-02-17 11:44:35', NULL);

-- ----------------------------
-- Table structure for master_ujian_jawaban
-- ----------------------------
DROP TABLE IF EXISTS `master_ujian_jawaban`;
CREATE TABLE `master_ujian_jawaban`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `soal_id` int NULL DEFAULT NULL,
  `jawaban` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `score` int NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of master_ujian_jawaban
-- ----------------------------

-- ----------------------------
-- Table structure for master_ujian_soal
-- ----------------------------
DROP TABLE IF EXISTS `master_ujian_soal`;
CREATE TABLE `master_ujian_soal`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `soal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of master_ujian_soal
-- ----------------------------

-- ----------------------------
-- Table structure for sys_level
-- ----------------------------
DROP TABLE IF EXISTS `sys_level`;
CREATE TABLE `sys_level`  (
  `level_id` int NOT NULL AUTO_INCREMENT,
  `level_nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `level_created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `level_updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`level_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_level
-- ----------------------------
INSERT INTO `sys_level` VALUES (1, 'Dosen', '2022-02-17 11:47:18', NULL);
INSERT INTO `sys_level` VALUES (2, 'Mahasiswa', '2022-02-17 11:47:18', NULL);
INSERT INTO `sys_level` VALUES (3, 'Admin', '2022-02-17 11:47:18', NULL);
INSERT INTO `sys_level` VALUES (4, 'Root', '2022-02-17 11:47:18', NULL);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_level_id` int NOT NULL,
  `user_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_last_login` timestamp NULL DEFAULT NULL,
  `user_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_updated_at` timestamp NULL DEFAULT NULL,
  `user_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `user_level_id`(`user_level_id` ASC) USING BTREE,
  CONSTRAINT `sys_user_ibfk_1` FOREIGN KEY (`user_level_id`) REFERENCES `sys_level` (`level_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 3, 'yustina_tritularsih@atmi.ac.id', '$2y$10$qJ4fJijfDbv5CFNmcIqY6uADguf/NNE4B.Dr5DHJ0W68igTKw4s3O', NULL, '2022-02-17 14:17:55', NULL, NULL);
INSERT INTO `sys_user` VALUES (2, 1, 'doni@google.com', '$2y$10$qJ4fJijfDbv5CFNmcIqY6uADguf/NNE4B.Dr5DHJ0W68igTKw4s3O', NULL, '2022-02-17 15:46:44', NULL, NULL);
INSERT INTO `sys_user` VALUES (3, 2, 'salman@google.com', '$2y$10$qJ4fJijfDbv5CFNmcIqY6uADguf/NNE4B.Dr5DHJ0W68igTKw4s3O', NULL, '2022-02-17 15:56:03', NULL, NULL);

-- ----------------------------
-- Table structure for ujian_jawaban
-- ----------------------------
DROP TABLE IF EXISTS `ujian_jawaban`;
CREATE TABLE `ujian_jawaban`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `soal_id` int NULL DEFAULT NULL,
  `jawaban` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `skor` float NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ujian_jawaban_ujian_soal_id_fk`(`soal_id` ASC) USING BTREE,
  CONSTRAINT `ujian_jawaban_ujian_soal_id_fk` FOREIGN KEY (`soal_id`) REFERENCES `ujian_soal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujian_jawaban
-- ----------------------------
INSERT INTO `ujian_jawaban` VALUES (1, 1, 'Surabaya', 0, '2022-07-29 09:20:32', '2022-07-29 09:20:32');
INSERT INTO `ujian_jawaban` VALUES (2, 1, 'Jakarta', 1, '2022-07-29 09:20:32', '2022-07-29 09:20:32');
INSERT INTO `ujian_jawaban` VALUES (3, 1, 'Yogyakarta', 0, '2022-07-29 09:20:32', '2022-07-29 09:20:32');
INSERT INTO `ujian_jawaban` VALUES (4, 1, 'Semarang', 0, '2022-07-29 09:20:32', '2022-07-29 09:20:32');
INSERT INTO `ujian_jawaban` VALUES (5, 2, 'Halo', 0, '2022-07-29 10:00:20', '2022-07-29 10:00:20');
INSERT INTO `ujian_jawaban` VALUES (6, 2, 'Yes', 0, '2022-07-29 10:00:20', '2022-07-29 10:00:20');
INSERT INTO `ujian_jawaban` VALUES (7, 2, 'COba', 0, '2022-07-29 10:00:20', '2022-07-29 10:00:20');
INSERT INTO `ujian_jawaban` VALUES (8, 2, 'ANswer', 1, '2022-07-29 10:00:20', '2022-07-29 10:00:20');

-- ----------------------------
-- Table structure for ujian_peserta
-- ----------------------------
DROP TABLE IF EXISTS `ujian_peserta`;
CREATE TABLE `ujian_peserta`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `sesi_id` int NULL DEFAULT NULL,
  `peserta_id` bigint UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `peserta_id`(`peserta_id` ASC) USING BTREE,
  INDEX `ujian_peserta_ujian_session_id_fk`(`sesi_id` ASC) USING BTREE,
  CONSTRAINT `ujian_peserta_ibfk_1` FOREIGN KEY (`peserta_id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ujian_peserta_ujian_session_id_fk` FOREIGN KEY (`sesi_id`) REFERENCES `ujian_session` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujian_peserta
-- ----------------------------
INSERT INTO `ujian_peserta` VALUES (1, 1, 3, '2022-07-29 09:42:20', '2022-07-29 09:42:22');

-- ----------------------------
-- Table structure for ujian_peserta_jawaban
-- ----------------------------
DROP TABLE IF EXISTS `ujian_peserta_jawaban`;
CREATE TABLE `ujian_peserta_jawaban`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `peserta_id` int NULL DEFAULT NULL,
  `soal_id` int NULL DEFAULT NULL,
  `jawaban_id` int NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `peserta_id`(`peserta_id` ASC) USING BTREE,
  INDEX `jawaban_id`(`jawaban_id` ASC) USING BTREE,
  INDEX `soal_id`(`soal_id` ASC) USING BTREE,
  CONSTRAINT `ujian_peserta_jawaban_ibfk_1` FOREIGN KEY (`peserta_id`) REFERENCES `ujian_peserta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ujian_peserta_jawaban_ibfk_3` FOREIGN KEY (`jawaban_id`) REFERENCES `ujian_jawaban` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ujian_peserta_jawaban_ibfk_4` FOREIGN KEY (`soal_id`) REFERENCES `ujian_soal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujian_peserta_jawaban
-- ----------------------------

-- ----------------------------
-- Table structure for ujian_session
-- ----------------------------
DROP TABLE IF EXISTS `ujian_session`;
CREATE TABLE `ujian_session`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `waktu_mulai` timestamp NULL DEFAULT NULL,
  `waktu_selesai` timestamp NULL DEFAULT NULL,
  `nilai_minimal` float NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujian_session
-- ----------------------------
INSERT INTO `ujian_session` VALUES (1, 'Ujian CBT Pemrograman', '2022-07-29 10:00:00', '2022-07-29 12:00:00', 5, '2022-07-29 09:18:28', '2022-07-29 09:18:30');

-- ----------------------------
-- Table structure for ujian_soal
-- ----------------------------
DROP TABLE IF EXISTS `ujian_soal`;
CREATE TABLE `ujian_soal`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `sesi_id` int NULL DEFAULT NULL,
  `soal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ujian_soal_ujian_session_id_fk`(`sesi_id` ASC) USING BTREE,
  CONSTRAINT `ujian_soal_ujian_session_id_fk` FOREIGN KEY (`sesi_id`) REFERENCES `ujian_session` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujian_soal
-- ----------------------------
INSERT INTO `ujian_soal` VALUES (1, 1, 'Apa Nama Ibu Kota Indonesia', '2022-07-29 09:19:28', '2022-07-29 09:19:29');
INSERT INTO `ujian_soal` VALUES (2, 1, 'Jenis Apakah Keleawar', '2022-07-29 09:19:42', '2022-07-29 09:19:42');

SET FOREIGN_KEY_CHECKS = 1;

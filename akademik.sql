-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: ujian
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `data_kelas`
--

DROP TABLE IF EXISTS `data_kelas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_kelas` (
  `kelas_id` bigint NOT NULL AUTO_INCREMENT,
  `kelas_dosen_id` bigint DEFAULT NULL,
  `kelas_nama` varchar(255) DEFAULT NULL,
  `kelas_created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `kelas_updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`kelas_id`),
  KEY `data_kelas_master_dosen_dosen_id_fk` (`kelas_dosen_id`),
  CONSTRAINT `data_kelas_master_dosen_dosen_id_fk` FOREIGN KEY (`kelas_dosen_id`) REFERENCES `master_dosen` (`dosen_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_kelas`
--

/*!40000 ALTER TABLE `data_kelas` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_kelas` ENABLE KEYS */;

--
-- Table structure for table `data_kelas_detail`
--

DROP TABLE IF EXISTS `data_kelas_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_kelas_detail` (
  `kdet_id` bigint NOT NULL AUTO_INCREMENT,
  `kdet_kelas_id` bigint DEFAULT NULL,
  `kdet_krs_id` bigint DEFAULT NULL,
  `kdet_created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `kdet_updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`kdet_id`),
  KEY `data_kelas_detail_data_krs_krs_id_fk` (`kdet_krs_id`),
  KEY `data_kelas_detail_data_kelas_kelas_id_fk` (`kdet_kelas_id`),
  CONSTRAINT `data_kelas_detail_data_kelas_kelas_id_fk` FOREIGN KEY (`kdet_kelas_id`) REFERENCES `data_kelas` (`kelas_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `data_kelas_detail_data_krs_krs_id_fk` FOREIGN KEY (`kdet_krs_id`) REFERENCES `data_krs` (`krs_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_kelas_detail`
--

/*!40000 ALTER TABLE `data_kelas_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_kelas_detail` ENABLE KEYS */;

--
-- Table structure for table `data_krs`
--

DROP TABLE IF EXISTS `data_krs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_krs` (
  `krs_id` bigint NOT NULL AUTO_INCREMENT,
  `krs_mhs_id` int DEFAULT NULL,
  `krs_dtmakul_id` bigint DEFAULT NULL,
  `krs_nilai` float DEFAULT NULL,
  `krs_created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `krs_updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`krs_id`),
  KEY `data_krs_data_matakuliah_dtmakul_id_fk` (`krs_dtmakul_id`),
  KEY `data_krs_master_mahasiswa_mhs_id_fk` (`krs_mhs_id`),
  CONSTRAINT `data_krs_data_matakuliah_dtmakul_id_fk` FOREIGN KEY (`krs_dtmakul_id`) REFERENCES `data_matakuliah` (`dtmakul_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `data_krs_master_mahasiswa_mhs_id_fk` FOREIGN KEY (`krs_mhs_id`) REFERENCES `master_mahasiswa` (`mhs_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_krs`
--

/*!40000 ALTER TABLE `data_krs` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_krs` ENABLE KEYS */;

--
-- Table structure for table `data_matakuliah`
--

DROP TABLE IF EXISTS `data_matakuliah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_matakuliah` (
  `dtmakul_id` bigint NOT NULL AUTO_INCREMENT,
  `makul_id` bigint NOT NULL,
  `dtmakul_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dtmakul_updaated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`dtmakul_id`),
  KEY `makul_id` (`makul_id`),
  CONSTRAINT `data_matakuliah_ibfk_1` FOREIGN KEY (`makul_id`) REFERENCES `master_matakuliah` (`makul_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_matakuliah`
--

/*!40000 ALTER TABLE `data_matakuliah` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_matakuliah` ENABLE KEYS */;

--
-- Table structure for table `master_dosen`
--

DROP TABLE IF EXISTS `master_dosen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_dosen` (
  `dosen_id` bigint NOT NULL AUTO_INCREMENT,
  `dosen_user_id` bigint unsigned NOT NULL,
  `dosen_prodi_id` int NOT NULL,
  `dosen_nama` varchar(255) NOT NULL,
  `dosen_nik` varchar(255) NOT NULL,
  `dosen_kode` varchar(20) NOT NULL,
  `dosen_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dosen_updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`dosen_id`),
  UNIQUE KEY `dosen_user_id` (`dosen_user_id`),
  KEY `dosen_prodi_id` (`dosen_prodi_id`),
  CONSTRAINT `master_dosen_ibfk_1` FOREIGN KEY (`dosen_prodi_id`) REFERENCES `master_prodi` (`prodi_id`),
  CONSTRAINT `master_dosen_ibfk_2` FOREIGN KEY (`dosen_user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_dosen`
--

/*!40000 ALTER TABLE `master_dosen` DISABLE KEYS */;
INSERT INTO `master_dosen` (`dosen_id`, `dosen_user_id`, `dosen_prodi_id`, `dosen_nama`, `dosen_nik`, `dosen_kode`, `dosen_created_at`, `dosen_updated_at`) VALUES (1,2,1,'Doni Herlambang','0128370','DH','2022-02-17 08:47:06',NULL);
/*!40000 ALTER TABLE `master_dosen` ENABLE KEYS */;

--
-- Table structure for table `master_dosen_pengampu`
--

DROP TABLE IF EXISTS `master_dosen_pengampu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_dosen_pengampu` (
  `dp_id` bigint NOT NULL AUTO_INCREMENT,
  `dp_dosen_id` bigint DEFAULT NULL,
  `dp_makul_id` bigint DEFAULT NULL,
  `dp_created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `dp_updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`dp_id`),
  KEY `master_dosen_pengampu_master_dosen_dosen_id_fk` (`dp_dosen_id`),
  KEY `master_dosen_pengampu_master_matakuliah_makul_id_fk` (`dp_makul_id`),
  CONSTRAINT `master_dosen_pengampu_master_dosen_dosen_id_fk` FOREIGN KEY (`dp_dosen_id`) REFERENCES `master_dosen` (`dosen_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `master_dosen_pengampu_master_matakuliah_makul_id_fk` FOREIGN KEY (`dp_makul_id`) REFERENCES `master_matakuliah` (`makul_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_dosen_pengampu`
--

/*!40000 ALTER TABLE `master_dosen_pengampu` DISABLE KEYS */;
/*!40000 ALTER TABLE `master_dosen_pengampu` ENABLE KEYS */;

--
-- Table structure for table `master_mahasiswa`
--

DROP TABLE IF EXISTS `master_mahasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_mahasiswa` (
  `mhs_id` int NOT NULL AUTO_INCREMENT,
  `mhs_user_id` bigint unsigned NOT NULL,
  `mhs_prodi_id` int NOT NULL,
  `mhs_nama` varchar(255) NOT NULL,
  `mhs_tingkat` int NOT NULL,
  `mhs_nim` varchar(50) NOT NULL,
  `mhs_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mhs_updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`mhs_id`),
  UNIQUE KEY `mhs_user_id` (`mhs_user_id`),
  KEY `mhs_prodi_id` (`mhs_prodi_id`),
  CONSTRAINT `master_mahasiswa_ibfk_1` FOREIGN KEY (`mhs_user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `master_mahasiswa_ibfk_2` FOREIGN KEY (`mhs_prodi_id`) REFERENCES `master_prodi` (`prodi_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_mahasiswa`
--

/*!40000 ALTER TABLE `master_mahasiswa` DISABLE KEYS */;
INSERT INTO `master_mahasiswa` (`mhs_id`, `mhs_user_id`, `mhs_prodi_id`, `mhs_nama`, `mhs_tingkat`, `mhs_nim`, `mhs_created_at`, `mhs_updated_at`) VALUES (1,3,1,'Salman Alz',1,'L2000419','2022-02-17 08:56:35',NULL);
/*!40000 ALTER TABLE `master_mahasiswa` ENABLE KEYS */;

--
-- Table structure for table `master_matakuliah`
--

DROP TABLE IF EXISTS `master_matakuliah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_matakuliah` (
  `makul_id` bigint NOT NULL AUTO_INCREMENT,
  `makul_tingkat_id` int NOT NULL,
  `makul_nama` varchar(255) NOT NULL,
  `makul_kode` varchar(50) NOT NULL,
  `makul_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `makul_updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`makul_id`),
  UNIQUE KEY `makul_tingkat_id` (`makul_tingkat_id`,`makul_kode`),
  CONSTRAINT `master_matakuliah_ibfk_1` FOREIGN KEY (`makul_tingkat_id`) REFERENCES `master_tingkat` (`tingkat_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_matakuliah`
--

/*!40000 ALTER TABLE `master_matakuliah` DISABLE KEYS */;
INSERT INTO `master_matakuliah` (`makul_id`, `makul_tingkat_id`, `makul_nama`, `makul_kode`, `makul_created_at`, `makul_updated_at`) VALUES (1,1,'Teknik Pemrograman','TPM','2022-02-17 04:46:30',NULL),(2,1,'Matematika','MTK','2022-02-17 04:46:30',NULL),(3,1,'Fisika','FSK','2022-02-17 04:46:30',NULL),(4,1,'Bahasa Inggris','ENG','2022-02-17 04:46:30',NULL);
/*!40000 ALTER TABLE `master_matakuliah` ENABLE KEYS */;

--
-- Table structure for table `master_prodi`
--

DROP TABLE IF EXISTS `master_prodi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_prodi` (
  `prodi_id` int NOT NULL AUTO_INCREMENT,
  `prodi_nama` varchar(255) NOT NULL,
  `prodi_kode` varchar(20) NOT NULL,
  `prodi_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `prodi_updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`prodi_id`),
  UNIQUE KEY `prodi_kode` (`prodi_kode`),
  UNIQUE KEY `prodi_kode_2` (`prodi_kode`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_prodi`
--

/*!40000 ALTER TABLE `master_prodi` DISABLE KEYS */;
INSERT INTO `master_prodi` (`prodi_id`, `prodi_nama`, `prodi_kode`, `prodi_created_at`, `prodi_updated_at`) VALUES (1,'Teknik Mesin','TMI','2022-02-17 04:45:15',NULL),(2,'Teknik Perancangan','TPM','2022-02-17 04:45:15',NULL),(3,'Teknik Mekatroniika','TMK','2022-02-17 04:45:15',NULL);
/*!40000 ALTER TABLE `master_prodi` ENABLE KEYS */;

--
-- Table structure for table `master_tingkat`
--

DROP TABLE IF EXISTS `master_tingkat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_tingkat` (
  `tingkat_id` int NOT NULL AUTO_INCREMENT,
  `tingkat_level` tinyint(1) NOT NULL,
  `tingkat_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tingkat_updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`tingkat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_tingkat`
--

/*!40000 ALTER TABLE `master_tingkat` DISABLE KEYS */;
INSERT INTO `master_tingkat` (`tingkat_id`, `tingkat_level`, `tingkat_created_at`, `tingkat_updated_at`) VALUES (1,1,'2022-02-17 04:44:35',NULL),(2,2,'2022-02-17 04:44:35',NULL),(3,3,'2022-02-17 04:44:35',NULL);
/*!40000 ALTER TABLE `master_tingkat` ENABLE KEYS */;

--
-- Table structure for table `master_ujian_jawaban`
--

DROP TABLE IF EXISTS `master_ujian_jawaban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_ujian_jawaban` (
  `id` int NOT NULL AUTO_INCREMENT,
  `soal_id` int DEFAULT NULL,
  `jawaban` text,
  `score` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_ujian_jawaban`
--

/*!40000 ALTER TABLE `master_ujian_jawaban` DISABLE KEYS */;
/*!40000 ALTER TABLE `master_ujian_jawaban` ENABLE KEYS */;

--
-- Table structure for table `master_ujian_soal`
--

DROP TABLE IF EXISTS `master_ujian_soal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_ujian_soal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `soal` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_ujian_soal`
--

/*!40000 ALTER TABLE `master_ujian_soal` DISABLE KEYS */;
/*!40000 ALTER TABLE `master_ujian_soal` ENABLE KEYS */;

--
-- Table structure for table `sys_level`
--

DROP TABLE IF EXISTS `sys_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_level` (
  `level_id` int NOT NULL AUTO_INCREMENT,
  `level_nama` varchar(255) NOT NULL,
  `level_created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `level_updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_level`
--

/*!40000 ALTER TABLE `sys_level` DISABLE KEYS */;
INSERT INTO `sys_level` (`level_id`, `level_nama`, `level_created_at`, `level_updated_at`) VALUES (1,'Dosen','2022-02-17 04:47:18',NULL),(2,'Mahasiswa','2022-02-17 04:47:18',NULL),(3,'Admin','2022-02-17 04:47:18',NULL),(4,'Root','2022-02-17 04:47:18',NULL);
/*!40000 ALTER TABLE `sys_level` ENABLE KEYS */;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `user_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_level_id` int NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_last_login` timestamp NULL DEFAULT NULL,
  `user_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_updated_at` timestamp NULL DEFAULT NULL,
  `user_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_level_id` (`user_level_id`),
  CONSTRAINT `sys_user_ibfk_1` FOREIGN KEY (`user_level_id`) REFERENCES `sys_level` (`level_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` (`user_id`, `user_level_id`, `user_email`, `user_password`, `user_last_login`, `user_created_at`, `user_updated_at`, `user_token`) VALUES (1,3,'yustina_tritularsih@atmi.ac.id','$2y$10$qJ4fJijfDbv5CFNmcIqY6uADguf/NNE4B.Dr5DHJ0W68igTKw4s3O',NULL,'2022-02-17 07:17:55',NULL,NULL),(2,1,'doni@google.com','$2y$10$qJ4fJijfDbv5CFNmcIqY6uADguf/NNE4B.Dr5DHJ0W68igTKw4s3O',NULL,'2022-02-17 08:46:44',NULL,NULL),(3,2,'salman@google.com','$2y$10$qJ4fJijfDbv5CFNmcIqY6uADguf/NNE4B.Dr5DHJ0W68igTKw4s3O',NULL,'2022-02-17 08:56:03',NULL,NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;

--
-- Table structure for table `ujian_jawaban`
--

DROP TABLE IF EXISTS `ujian_jawaban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujian_jawaban` (
  `id` int NOT NULL AUTO_INCREMENT,
  `soal_id` int DEFAULT NULL,
  `jawaban` varchar(255) DEFAULT NULL,
  `skor` float DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ujian_jawaban_ujian_soal_id_fk` (`soal_id`),
  CONSTRAINT `ujian_jawaban_ujian_soal_id_fk` FOREIGN KEY (`soal_id`) REFERENCES `ujian_soal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujian_jawaban`
--

/*!40000 ALTER TABLE `ujian_jawaban` DISABLE KEYS */;
INSERT INTO `ujian_jawaban` (`id`, `soal_id`, `jawaban`, `skor`, `created_at`, `updated_at`) VALUES (1,1,'Surabaya',0,'2022-07-29 02:20:32','2022-07-29 02:20:32'),(2,1,'Jakarta',1,'2022-07-29 02:20:32','2022-07-29 02:20:32'),(3,1,'Yogyakarta',0,'2022-07-29 02:20:32','2022-07-29 02:20:32'),(4,1,'Semarang',0,'2022-07-29 02:20:32','2022-07-29 02:20:32'),(5,2,'Halo',0,'2022-07-29 03:00:20','2022-07-29 03:00:20'),(6,2,'Yes',0,'2022-07-29 03:00:20','2022-07-29 03:00:20'),(7,2,'COba',0,'2022-07-29 03:00:20','2022-07-29 03:00:20'),(8,2,'ANswer',1,'2022-07-29 03:00:20','2022-07-29 03:00:20'),(9,3,'KOK',0,'2022-07-29 03:00:20','2022-07-29 03:00:20'),(10,3,'aslkdjalsd',0,'2022-07-29 03:00:20','2022-07-29 03:00:20'),(11,3,'alskdjhaskld',0,'2022-07-29 03:00:20','2022-07-29 03:00:20'),(12,3,'answer',1,'2022-07-29 03:00:20','2022-07-29 03:00:20'),(13,4,'aslja',0,'2022-07-29 03:00:20','2022-07-29 03:00:20'),(14,4,'zxc',0,'2022-07-29 03:00:20','2022-07-29 03:00:20'),(15,4,'qwe',0,'2022-07-29 03:00:20','2022-07-29 03:00:20'),(16,4,'answer',1,'2022-07-29 03:00:20','2022-07-29 03:00:20'),(17,5,'answer',1,'2022-07-29 03:00:20','2022-07-29 03:00:20'),(18,5,'asd',0,'2022-07-29 03:00:20','2022-07-29 03:00:20'),(19,5,'asdasd',0,'2022-07-29 03:00:20','2022-07-29 03:00:20'),(20,5,'q3tr2ewf',0,'2022-07-29 03:00:20','2022-07-29 03:00:20');
/*!40000 ALTER TABLE `ujian_jawaban` ENABLE KEYS */;

--
-- Table structure for table `ujian_peserta`
--

DROP TABLE IF EXISTS `ujian_peserta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujian_peserta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sesi_id` int DEFAULT NULL,
  `peserta_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `peserta_id` (`peserta_id`),
  KEY `ujian_peserta_ujian_session_id_fk` (`sesi_id`),
  CONSTRAINT `ujian_peserta_ibfk_1` FOREIGN KEY (`peserta_id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ujian_peserta_ujian_session_id_fk` FOREIGN KEY (`sesi_id`) REFERENCES `ujian_session` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujian_peserta`
--

/*!40000 ALTER TABLE `ujian_peserta` DISABLE KEYS */;
INSERT INTO `ujian_peserta` (`id`, `sesi_id`, `peserta_id`, `created_at`, `updated_at`) VALUES (1,1,3,'2022-07-29 02:42:20','2022-07-29 02:42:22');
/*!40000 ALTER TABLE `ujian_peserta` ENABLE KEYS */;

--
-- Table structure for table `ujian_peserta_jawaban`
--

DROP TABLE IF EXISTS `ujian_peserta_jawaban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujian_peserta_jawaban` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `peserta_id` int DEFAULT NULL,
  `soal_id` int DEFAULT NULL,
  `jawaban_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `peserta_id` (`peserta_id`),
  KEY `jawaban_id` (`jawaban_id`),
  KEY `soal_id` (`soal_id`),
  CONSTRAINT `ujian_peserta_jawaban_ibfk_1` FOREIGN KEY (`peserta_id`) REFERENCES `ujian_peserta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ujian_peserta_jawaban_ibfk_3` FOREIGN KEY (`jawaban_id`) REFERENCES `ujian_jawaban` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ujian_peserta_jawaban_ibfk_4` FOREIGN KEY (`soal_id`) REFERENCES `ujian_soal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujian_peserta_jawaban`
--

/*!40000 ALTER TABLE `ujian_peserta_jawaban` DISABLE KEYS */;
INSERT INTO `ujian_peserta_jawaban` (`id`, `peserta_id`, `soal_id`, `jawaban_id`, `created_at`, `updated_at`) VALUES (1,1,1,3,'2022-07-29 04:35:24','2022-07-29 06:30:57'),(2,1,2,6,'2022-07-29 04:35:30','2022-07-29 06:25:43');
/*!40000 ALTER TABLE `ujian_peserta_jawaban` ENABLE KEYS */;

--
-- Table structure for table `ujian_session`
--

DROP TABLE IF EXISTS `ujian_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujian_session` (
  `id` int NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) DEFAULT NULL,
  `waktu_mulai` timestamp NULL DEFAULT NULL,
  `waktu_selesai` timestamp NULL DEFAULT NULL,
  `nilai_minimal` float DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujian_session`
--

/*!40000 ALTER TABLE `ujian_session` DISABLE KEYS */;
INSERT INTO `ujian_session` (`id`, `judul`, `waktu_mulai`, `waktu_selesai`, `nilai_minimal`, `created_at`, `updated_at`) VALUES (1,'Ujian CBT Pemrograman','2022-07-29 06:00:00','2022-07-29 08:30:00',5,'2022-07-29 02:18:28','2022-07-29 02:18:30');
/*!40000 ALTER TABLE `ujian_session` ENABLE KEYS */;

--
-- Table structure for table `ujian_soal`
--

DROP TABLE IF EXISTS `ujian_soal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujian_soal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sesi_id` int DEFAULT NULL,
  `soal` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ujian_soal_ujian_session_id_fk` (`sesi_id`),
  CONSTRAINT `ujian_soal_ujian_session_id_fk` FOREIGN KEY (`sesi_id`) REFERENCES `ujian_session` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujian_soal`
--

/*!40000 ALTER TABLE `ujian_soal` DISABLE KEYS */;
INSERT INTO `ujian_soal` (`id`, `sesi_id`, `soal`, `created_at`, `updated_at`) VALUES (1,1,'Apa Nama Ibu Kota Indonesia','2022-07-29 02:19:28','2022-07-29 02:19:29'),(2,1,'Jenis Apakah Keleawar','2022-07-29 02:19:42','2022-07-29 02:19:42'),(3,1,'Apa Nama lain sapi','2022-07-29 02:19:42','2022-07-29 02:19:42'),(4,1,'Apa Nama lain kambing','2022-07-29 02:19:42','2022-07-29 02:19:42'),(5,1,'Apa Nama lain singa','2022-07-29 02:19:42','2022-07-29 02:19:42');
/*!40000 ALTER TABLE `ujian_soal` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-29 13:54:08

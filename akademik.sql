-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2022 at 03:46 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `akademik`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_kelas`
--

CREATE TABLE `data_kelas` (
  `kelas_id` bigint(20) NOT NULL,
  `kelas_dosen_id` bigint(20) DEFAULT NULL,
  `kelas_nama` varchar(255) DEFAULT NULL,
  `kelas_created_at` timestamp NULL DEFAULT current_timestamp(),
  `kelas_updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `data_kelas_detail`
--

CREATE TABLE `data_kelas_detail` (
  `kdet_id` bigint(20) NOT NULL,
  `kdet_kelas_id` bigint(20) DEFAULT NULL,
  `kdet_krs_id` bigint(20) DEFAULT NULL,
  `kdet_created_at` timestamp NULL DEFAULT current_timestamp(),
  `kdet_updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `data_krs`
--

CREATE TABLE `data_krs` (
  `krs_id` bigint(11) NOT NULL,
  `krs_mhs_id` int(11) DEFAULT NULL,
  `krs_dtmakul_id` bigint(11) DEFAULT NULL,
  `krs_nilai` float DEFAULT NULL,
  `krs_created_at` timestamp NULL DEFAULT current_timestamp(),
  `krs_updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `data_matakuliah`
--

CREATE TABLE `data_matakuliah` (
  `dtmakul_id` bigint(20) NOT NULL,
  `makul_id` bigint(20) NOT NULL,
  `dtmakul_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `dtmakul_updaated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `master_dosen`
--

CREATE TABLE `master_dosen` (
  `dosen_id` bigint(11) NOT NULL,
  `dosen_user_id` bigint(20) UNSIGNED NOT NULL,
  `dosen_prodi_id` int(11) NOT NULL,
  `dosen_nama` varchar(255) NOT NULL,
  `dosen_nik` varchar(255) NOT NULL,
  `dosen_kode` varchar(20) NOT NULL,
  `dosen_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `dosen_updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `master_dosen`
--

INSERT INTO `master_dosen` (`dosen_id`, `dosen_user_id`, `dosen_prodi_id`, `dosen_nama`, `dosen_nik`, `dosen_kode`, `dosen_created_at`, `dosen_updated_at`) VALUES
(1, 2, 1, 'Doni Herlambang', '0128370', 'DH', '2022-02-17 08:47:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_dosen_pengampu`
--

CREATE TABLE `master_dosen_pengampu` (
  `dp_id` bigint(20) NOT NULL,
  `dp_dosen_id` bigint(11) DEFAULT NULL,
  `dp_makul_id` bigint(11) DEFAULT NULL,
  `dp_created_at` timestamp NULL DEFAULT current_timestamp(),
  `dp_updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `master_mahasiswa`
--

CREATE TABLE `master_mahasiswa` (
  `mhs_id` int(11) NOT NULL,
  `mhs_user_id` bigint(11) UNSIGNED NOT NULL,
  `mhs_prodi_id` int(11) NOT NULL,
  `mhs_nama` varchar(255) NOT NULL,
  `mhs_tingkat` int(11) NOT NULL,
  `mhs_nim` varchar(50) NOT NULL,
  `mhs_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `mhs_updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `master_mahasiswa`
--

INSERT INTO `master_mahasiswa` (`mhs_id`, `mhs_user_id`, `mhs_prodi_id`, `mhs_nama`, `mhs_tingkat`, `mhs_nim`, `mhs_created_at`, `mhs_updated_at`) VALUES
(1, 3, 1, 'Salman Alz', 1, 'L2000419', '2022-02-17 08:56:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_matakuliah`
--

CREATE TABLE `master_matakuliah` (
  `makul_id` bigint(11) NOT NULL,
  `makul_tingkat_id` int(11) NOT NULL,
  `makul_nama` varchar(255) NOT NULL,
  `makul_kode` varchar(50) NOT NULL,
  `makul_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `makul_updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `master_matakuliah`
--

INSERT INTO `master_matakuliah` (`makul_id`, `makul_tingkat_id`, `makul_nama`, `makul_kode`, `makul_created_at`, `makul_updated_at`) VALUES
(1, 1, 'Teknik Pemrograman', 'TPM', '2022-02-17 04:46:30', NULL),
(2, 1, 'Matematika', 'MTK', '2022-02-17 04:46:30', NULL),
(3, 1, 'Fisika', 'FSK', '2022-02-17 04:46:30', NULL),
(4, 1, 'Bahasa Inggris', 'ENG', '2022-02-17 04:46:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_prodi`
--

CREATE TABLE `master_prodi` (
  `prodi_id` int(11) NOT NULL,
  `prodi_nama` varchar(255) NOT NULL,
  `prodi_kode` varchar(20) NOT NULL,
  `prodi_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `prodi_updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `master_prodi`
--

INSERT INTO `master_prodi` (`prodi_id`, `prodi_nama`, `prodi_kode`, `prodi_created_at`, `prodi_updated_at`) VALUES
(1, 'Teknik Mesin', 'TMI', '2022-02-17 04:45:15', NULL),
(2, 'Teknik Perancangan', 'TPM', '2022-02-17 04:45:15', NULL),
(3, 'Teknik Mekatroniika', 'TMK', '2022-02-17 04:45:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_tingkat`
--

CREATE TABLE `master_tingkat` (
  `tingkat_id` int(11) NOT NULL,
  `tingkat_level` tinyint(1) NOT NULL,
  `tingkat_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `tingkat_updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `master_tingkat`
--

INSERT INTO `master_tingkat` (`tingkat_id`, `tingkat_level`, `tingkat_created_at`, `tingkat_updated_at`) VALUES
(1, 1, '2022-02-17 04:44:35', NULL),
(2, 2, '2022-02-17 04:44:35', NULL),
(3, 3, '2022-02-17 04:44:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sys_level`
--

CREATE TABLE `sys_level` (
  `level_id` int(11) NOT NULL,
  `level_nama` varchar(255) NOT NULL,
  `level_created_at` timestamp NULL DEFAULT current_timestamp(),
  `level_updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sys_level`
--

INSERT INTO `sys_level` (`level_id`, `level_nama`, `level_created_at`, `level_updated_at`) VALUES
(1, 'Dosen', '2022-02-17 04:47:18', NULL),
(2, 'Mahasiswa', '2022-02-17 04:47:18', NULL),
(3, 'Admin', '2022-02-17 04:47:18', NULL),
(4, 'Root', '2022-02-17 04:47:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sys_user`
--

CREATE TABLE `sys_user` (
  `user_id` bigint(11) UNSIGNED NOT NULL,
  `user_level_id` int(11) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_last_login` timestamp NULL DEFAULT NULL,
  `user_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_updated_at` timestamp NULL DEFAULT NULL,
  `user_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sys_user`
--

INSERT INTO `sys_user` (`user_id`, `user_level_id`, `user_email`, `user_password`, `user_last_login`, `user_created_at`, `user_updated_at`, `user_token`) VALUES
(1, 3, 'yustina_tritularsih@atmi.ac.id', '$2y$10$nxIHMxSvSDUHV8aq55.k0.kNFyvTG0O/pp2zsPGyz8dqMl/vNHMke', NULL, '2022-02-17 07:17:55', NULL, NULL),
(2, 1, 'doni@google.com', 'dsa', NULL, '2022-02-17 08:46:44', NULL, NULL),
(3, 2, 'salman@google.com', 'asd', NULL, '2022-02-17 08:56:03', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_kelas`
--
ALTER TABLE `data_kelas`
  ADD PRIMARY KEY (`kelas_id`),
  ADD KEY `data_kelas_master_dosen_dosen_id_fk` (`kelas_dosen_id`);

--
-- Indexes for table `data_kelas_detail`
--
ALTER TABLE `data_kelas_detail`
  ADD PRIMARY KEY (`kdet_id`),
  ADD KEY `data_kelas_detail_data_krs_krs_id_fk` (`kdet_krs_id`),
  ADD KEY `data_kelas_detail_data_kelas_kelas_id_fk` (`kdet_kelas_id`);

--
-- Indexes for table `data_krs`
--
ALTER TABLE `data_krs`
  ADD PRIMARY KEY (`krs_id`),
  ADD KEY `data_krs_data_matakuliah_dtmakul_id_fk` (`krs_dtmakul_id`),
  ADD KEY `data_krs_master_mahasiswa_mhs_id_fk` (`krs_mhs_id`);

--
-- Indexes for table `data_matakuliah`
--
ALTER TABLE `data_matakuliah`
  ADD PRIMARY KEY (`dtmakul_id`),
  ADD KEY `makul_id` (`makul_id`);

--
-- Indexes for table `master_dosen`
--
ALTER TABLE `master_dosen`
  ADD PRIMARY KEY (`dosen_id`),
  ADD UNIQUE KEY `dosen_user_id` (`dosen_user_id`),
  ADD KEY `dosen_prodi_id` (`dosen_prodi_id`);

--
-- Indexes for table `master_dosen_pengampu`
--
ALTER TABLE `master_dosen_pengampu`
  ADD PRIMARY KEY (`dp_id`),
  ADD KEY `master_dosen_pengampu_master_dosen_dosen_id_fk` (`dp_dosen_id`),
  ADD KEY `master_dosen_pengampu_master_matakuliah_makul_id_fk` (`dp_makul_id`);

--
-- Indexes for table `master_mahasiswa`
--
ALTER TABLE `master_mahasiswa`
  ADD PRIMARY KEY (`mhs_id`),
  ADD UNIQUE KEY `mhs_user_id` (`mhs_user_id`),
  ADD KEY `mhs_prodi_id` (`mhs_prodi_id`);

--
-- Indexes for table `master_matakuliah`
--
ALTER TABLE `master_matakuliah`
  ADD PRIMARY KEY (`makul_id`),
  ADD UNIQUE KEY `makul_tingkat_id` (`makul_tingkat_id`,`makul_kode`);

--
-- Indexes for table `master_prodi`
--
ALTER TABLE `master_prodi`
  ADD PRIMARY KEY (`prodi_id`),
  ADD UNIQUE KEY `prodi_kode` (`prodi_kode`),
  ADD UNIQUE KEY `prodi_kode_2` (`prodi_kode`);

--
-- Indexes for table `master_tingkat`
--
ALTER TABLE `master_tingkat`
  ADD PRIMARY KEY (`tingkat_id`);

--
-- Indexes for table `sys_level`
--
ALTER TABLE `sys_level`
  ADD PRIMARY KEY (`level_id`);

--
-- Indexes for table `sys_user`
--
ALTER TABLE `sys_user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_level_id` (`user_level_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_kelas`
--
ALTER TABLE `data_kelas`
  MODIFY `kelas_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data_kelas_detail`
--
ALTER TABLE `data_kelas_detail`
  MODIFY `kdet_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data_krs`
--
ALTER TABLE `data_krs`
  MODIFY `krs_id` bigint(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data_matakuliah`
--
ALTER TABLE `data_matakuliah`
  MODIFY `dtmakul_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `master_dosen`
--
ALTER TABLE `master_dosen`
  MODIFY `dosen_id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `master_dosen_pengampu`
--
ALTER TABLE `master_dosen_pengampu`
  MODIFY `dp_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `master_mahasiswa`
--
ALTER TABLE `master_mahasiswa`
  MODIFY `mhs_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `master_matakuliah`
--
ALTER TABLE `master_matakuliah`
  MODIFY `makul_id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `master_prodi`
--
ALTER TABLE `master_prodi`
  MODIFY `prodi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `master_tingkat`
--
ALTER TABLE `master_tingkat`
  MODIFY `tingkat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sys_level`
--
ALTER TABLE `sys_level`
  MODIFY `level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sys_user`
--
ALTER TABLE `sys_user`
  MODIFY `user_id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_kelas`
--
ALTER TABLE `data_kelas`
  ADD CONSTRAINT `data_kelas_master_dosen_dosen_id_fk` FOREIGN KEY (`kelas_dosen_id`) REFERENCES `master_dosen` (`dosen_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `data_kelas_detail`
--
ALTER TABLE `data_kelas_detail`
  ADD CONSTRAINT `data_kelas_detail_data_kelas_kelas_id_fk` FOREIGN KEY (`kdet_kelas_id`) REFERENCES `data_kelas` (`kelas_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `data_kelas_detail_data_krs_krs_id_fk` FOREIGN KEY (`kdet_krs_id`) REFERENCES `data_krs` (`krs_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `data_krs`
--
ALTER TABLE `data_krs`
  ADD CONSTRAINT `data_krs_data_matakuliah_dtmakul_id_fk` FOREIGN KEY (`krs_dtmakul_id`) REFERENCES `data_matakuliah` (`dtmakul_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `data_krs_master_mahasiswa_mhs_id_fk` FOREIGN KEY (`krs_mhs_id`) REFERENCES `master_mahasiswa` (`mhs_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `data_matakuliah`
--
ALTER TABLE `data_matakuliah`
  ADD CONSTRAINT `data_matakuliah_ibfk_1` FOREIGN KEY (`makul_id`) REFERENCES `master_matakuliah` (`makul_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `master_dosen`
--
ALTER TABLE `master_dosen`
  ADD CONSTRAINT `master_dosen_ibfk_1` FOREIGN KEY (`dosen_prodi_id`) REFERENCES `master_prodi` (`prodi_id`),
  ADD CONSTRAINT `master_dosen_ibfk_2` FOREIGN KEY (`dosen_user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `master_dosen_pengampu`
--
ALTER TABLE `master_dosen_pengampu`
  ADD CONSTRAINT `master_dosen_pengampu_master_dosen_dosen_id_fk` FOREIGN KEY (`dp_dosen_id`) REFERENCES `master_dosen` (`dosen_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `master_dosen_pengampu_master_matakuliah_makul_id_fk` FOREIGN KEY (`dp_makul_id`) REFERENCES `master_matakuliah` (`makul_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `master_mahasiswa`
--
ALTER TABLE `master_mahasiswa`
  ADD CONSTRAINT `master_mahasiswa_ibfk_1` FOREIGN KEY (`mhs_user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `master_mahasiswa_ibfk_2` FOREIGN KEY (`mhs_prodi_id`) REFERENCES `master_prodi` (`prodi_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `master_matakuliah`
--
ALTER TABLE `master_matakuliah`
  ADD CONSTRAINT `master_matakuliah_ibfk_1` FOREIGN KEY (`makul_tingkat_id`) REFERENCES `master_tingkat` (`tingkat_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sys_user`
--
ALTER TABLE `sys_user`
  ADD CONSTRAINT `sys_user_ibfk_1` FOREIGN KEY (`user_level_id`) REFERENCES `sys_level` (`level_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.28-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for dbsprindik
CREATE DATABASE IF NOT EXISTS `dbsprindik` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dbsprindik`;


-- Dumping structure for table dbsprindik.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table dbsprindik.admin: ~2 rows (approximately)
DELETE FROM `admin`;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`id`, `username`, `password`, `nama`, `foto`) VALUES
	(1, 'auwfar', 'f0a047143d1da15b630c73f0256d5db0', 'Achmad Chadil Auwfar', 'Koala.jpg'),
	(2, 'ozil', 'f4e404c7f815fc68e7ce8e3c2e61e347', 'Mesut ', 'profil2.jpg');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;


-- Dumping structure for table dbsprindik.kelamin
CREATE TABLE IF NOT EXISTS `kelamin` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table dbsprindik.kelamin: ~2 rows (approximately)
DELETE FROM `kelamin`;
/*!40000 ALTER TABLE `kelamin` DISABLE KEYS */;
INSERT INTO `kelamin` (`id`, `nama`) VALUES
	(1, 'Laki laki'),
	(2, 'Perempuan');
/*!40000 ALTER TABLE `kelamin` ENABLE KEYS */;


-- Dumping structure for table dbsprindik.kota
CREATE TABLE IF NOT EXISTS `kota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- Dumping data for table dbsprindik.kota: ~6 rows (approximately)
DELETE FROM `kota`;
/*!40000 ALTER TABLE `kota` DISABLE KEYS */;
INSERT INTO `kota` (`id`, `nama`) VALUES
	(1, 'Malang'),
	(3, 'Blitar'),
	(4, 'Tulungagung'),
	(17, 'Jakarta'),
	(21, 'Surabaya'),
	(22, 'Paris');
/*!40000 ALTER TABLE `kota` ENABLE KEYS */;


-- Dumping structure for table dbsprindik.pegawai
CREATE TABLE IF NOT EXISTS `pegawai` (
  `id` varchar(255) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `telp` varchar(255) DEFAULT NULL,
  `id_kota` int(11) DEFAULT NULL,
  `id_kelamin` int(1) DEFAULT NULL,
  `id_posisi` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table dbsprindik.pegawai: ~11 rows (approximately)
DELETE FROM `pegawai`;
/*!40000 ALTER TABLE `pegawai` DISABLE KEYS */;
INSERT INTO `pegawai` (`id`, `nama`, `telp`, `id_kota`, `id_kelamin`, `id_posisi`, `status`) VALUES
	('10', 'Antony Febriansyah Hartono', '082199568540', 1, 1, 1, 1),
	('11', 'Hafizh Asrofil Al Banna', '087859615271', 1, 1, 1, 1),
	('12', 'Faiq Fajrullah', '085736333728', 1, 1, 2, 1),
	('3', 'Mustofa Halim', '081330493322', 1, 1, 3, 1),
	('4', 'Dody Ahmad Kusuma Jaya', '083854520015', 1, 1, 2, 1),
	('5', 'Mokhammad Choirul Ikhsan', '085749535400', 3, 1, 2, 1),
	('7', 'Achmad Chadil Auwfar', '08984119934', 2, 1, 1, 1),
	('8', 'Rizal Ferdian', '087777284179', 1, 1, 3, 1),
	('9', 'Redika Angga Pratama', '083834657395', 1, 1, 3, 1),
	('1', 'Tolkha Hasan', '081233072122', 1, 1, 4, 1),
	('2', 'Wawan Dwi Prasetyo', '085745966707', 4, 1, 4, 1);
/*!40000 ALTER TABLE `pegawai` ENABLE KEYS */;


-- Dumping structure for table dbsprindik.posisi
CREATE TABLE IF NOT EXISTS `posisi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table dbsprindik.posisi: ~6 rows (approximately)
DELETE FROM `posisi`;
/*!40000 ALTER TABLE `posisi` DISABLE KEYS */;
INSERT INTO `posisi` (`id`, `nama`) VALUES
	(1, 'IT'),
	(2, 'HRD'),
	(3, 'Keuangan'),
	(4, 'Produk'),
	(5, 'Web Developer'),
	(6, 'Tes');
/*!40000 ALTER TABLE `posisi` ENABLE KEYS */;


-- Dumping structure for table dbsprindik.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nohp` varchar(255) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table dbsprindik.user: ~2 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `password`, `email`, `nohp`, `nama`, `foto`) VALUES
	(1, 'auwfar', 'f0a047143d1da15b630c73f0256d5db0', NULL, NULL, 'Achmad Chadil Auwfar', 'Koala.jpg'),
	(2, 'ozil', 'f4e404c7f815fc68e7ce8e3c2e61e347', NULL, NULL, 'Mesut ', 'profil2.jpg'),
	(3, 'coba', 'c4ca4238a0b923820dcc509a6f75849b', 'coba@gmail.com', '1', 'tes', 'Capture1.PNG'),
	(4, 'coba', 'd41d8cd98f00b204e9800998ecf8427e', '', '', NULL, NULL),
	(5, 'a', 'd41d8cd98f00b204e9800998ecf8427e', '', '', NULL, NULL),
	(6, 'a', 'd41d8cd98f00b204e9800998ecf8427e', '', '', NULL, NULL),
	(7, 'coba', 'c4ca4238a0b923820dcc509a6f75849b', '', '', NULL, NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- Dumping structure for table dbsprindik.user1
CREATE TABLE IF NOT EXISTS `user1` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_mobile` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table dbsprindik.user1: ~4 rows (approximately)
DELETE FROM `user1`;
/*!40000 ALTER TABLE `user1` DISABLE KEYS */;
INSERT INTO `user1` (`user_id`, `user_name`, `user_email`, `user_password`, `user_mobile`) VALUES
	(1, 'Ehtesham', 'ehtesham@gmail.com', '123', 334443333),
	(2, 'Ehtesham', 'ehtesham@gmail.com', '123', 2147483647),
	(3, 'farrukh', 'farrukh@gmail.com', '123', 232342343),
	(4, 'zaid', 'zaid@gmail.com', '202cb962ac59075b964b07152d234b70', 324234234),
	(5, 'coba', 'coba@gmail.com', 'c3ec0f7b054e729c5a716c8125839829', 2147483647);
/*!40000 ALTER TABLE `user1` ENABLE KEYS */;


-- Dumping structure for table dbsprindik.user_copy
CREATE TABLE IF NOT EXISTS `user_copy` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_age` int(11) NOT NULL,
  `user_mobile` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table dbsprindik.user_copy: ~4 rows (approximately)
DELETE FROM `user_copy`;
/*!40000 ALTER TABLE `user_copy` DISABLE KEYS */;
INSERT INTO `user_copy` (`user_id`, `user_name`, `user_email`, `user_password`, `user_age`, `user_mobile`) VALUES
	(1, 'Ehtesham', 'ehtesham@gmail.com', '123', 23, 334443333),
	(2, 'Ehtesham', 'ehtesham@gmail.com', '123', 23, 2147483647),
	(3, 'farrukh', 'farrukh@gmail.com', '123', 32, 232342343),
	(4, 'zaid', 'zaid@gmail.com', '202cb962ac59075b964b07152d234b70', 23, 324234234);
/*!40000 ALTER TABLE `user_copy` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.1.35-MariaDB : Database - evoyproduction
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`evoyproduction` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `evoyproduction`;

/*Table structure for table `baju` */

DROP TABLE IF EXISTS `baju`;

CREATE TABLE `baju` (
  `kode_baju` varchar(5) NOT NULL,
  `nama_baju` varchar(30) DEFAULT NULL,
  `stok_baju` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  PRIMARY KEY (`kode_baju`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `baju` */

/*Table structure for table `detail_sewa` */

DROP TABLE IF EXISTS `detail_sewa`;

CREATE TABLE `detail_sewa` (
  `no_sewa` varchar(5) NOT NULL,
  `kode_baju` varchar(5) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `denda` int(11) DEFAULT '0',
  `total_bayar` int(11) DEFAULT '0',
  PRIMARY KEY (`no_sewa`),
  KEY `kode_baju` (`kode_baju`),
  CONSTRAINT `detail_sewa_ibfk_1` FOREIGN KEY (`no_sewa`) REFERENCES `sewa` (`no_sewa`),
  CONSTRAINT `detail_sewa_ibfk_2` FOREIGN KEY (`kode_baju`) REFERENCES `baju` (`kode_baju`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `detail_sewa` */

/*Table structure for table `pelanggan` */

DROP TABLE IF EXISTS `pelanggan`;

CREATE TABLE `pelanggan` (
  `id_pelanggan` varchar(5) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` varchar(30) DEFAULT NULL,
  `kota` varchar(30) DEFAULT NULL,
  `no_tlp` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_pelanggan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pelanggan` */

/*Table structure for table `sewa` */

DROP TABLE IF EXISTS `sewa`;

CREATE TABLE `sewa` (
  `no_sewa` varchar(5) NOT NULL,
  `id_pelanggan` varchar(5) DEFAULT NULL,
  `tgl_sewa` date DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `dp_sewa` int(11) DEFAULT '0',
  `status` varchar(15) DEFAULT 'BELUM LUNAS',
  PRIMARY KEY (`no_sewa`),
  KEY `id_pelanggan` (`id_pelanggan`),
  CONSTRAINT `sewa_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sewa` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

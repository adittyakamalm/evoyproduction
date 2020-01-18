/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.10-MariaDB : Database - evoyproduction
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`evoyproduction` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `evoyproduction`;

/*Table structure for table `detail_sewa` */

DROP TABLE IF EXISTS `detail_sewa`;

CREATE TABLE `detail_sewa` (
  `no_sewa` varchar(5) NOT NULL,
  `kode_kostum` varchar(5) DEFAULT NULL,
  `qty` int(4) DEFAULT NULL,
  `denda` int(11) DEFAULT NULL,
  `total_bayar` int(11) DEFAULT NULL,
  PRIMARY KEY (`no_sewa`),
  KEY `kode_kostum` (`kode_kostum`),
  CONSTRAINT `detail_sewa_ibfk_1` FOREIGN KEY (`no_sewa`) REFERENCES `sewa` (`no_sewa`),
  CONSTRAINT `detail_sewa_ibfk_2` FOREIGN KEY (`kode_kostum`) REFERENCES `kostum` (`kode_kostum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `detail_sewa` */

insert  into `detail_sewa`(`no_sewa`,`kode_kostum`,`qty`,`denda`,`total_bayar`) values 
('S7881','K7761',2,NULL,NULL);

/*Table structure for table `kostum` */

DROP TABLE IF EXISTS `kostum`;

CREATE TABLE `kostum` (
  `kode_kostum` varchar(5) NOT NULL,
  `nama_kostum` varchar(50) DEFAULT NULL,
  `jml_kostum` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  PRIMARY KEY (`kode_kostum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `kostum` */

insert  into `kostum`(`kode_kostum`,`nama_kostum`,`jml_kostum`,`harga`) values 
('K2212','Tari Kaca',150,75000),
('K2515','Tari Saman',120,80000),
('K7761','Bengkulu',170,75000),
('K8712','Padang',115,90000),
('K9099','Tari Jaipong',250,100000);

/*Table structure for table `pelanggan` */

DROP TABLE IF EXISTS `pelanggan`;

CREATE TABLE `pelanggan` (
  `id_pelanggan` varchar(5) NOT NULL,
  `NIK` varchar(16) NOT NULL,
  `Nama` varchar(30) DEFAULT NULL,
  `Alamat` varchar(30) DEFAULT NULL,
  `Kota` varchar(30) DEFAULT NULL,
  `No. Tlp` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_pelanggan`,`NIK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `pelanggan` */

insert  into `pelanggan`(`id_pelanggan`,`NIK`,`Nama`,`Alamat`,`Kota`,`No. Tlp`) values 
('ID001','3273251607000002','Kujang','Jl. Cipadung','Bandung','081213242123');

/*Table structure for table `sewa` */

DROP TABLE IF EXISTS `sewa`;

CREATE TABLE `sewa` (
  `no_sewa` varchar(5) NOT NULL,
  `id_pelanggan` varchar(5) DEFAULT NULL,
  `tgl_sewa` date DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `dp_sewa` int(11) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`no_sewa`),
  KEY `id_pelanggan` (`id_pelanggan`),
  CONSTRAINT `sewa_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `sewa` */

insert  into `sewa`(`no_sewa`,`id_pelanggan`,`tgl_sewa`,`tgl_kembali`,`dp_sewa`,`status`) values 
('S7881','ID001','2020-01-16','2020-01-19',40000,NULL),
('S8992','ID001','2020-01-15','2020-01-18',30000,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

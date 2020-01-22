/*
SQLyog Professional v12.5.1 (64 bit)
MySQL - 10.4.10-MariaDB : Database - evoyproduction
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
  `denda` int(11) DEFAULT 0,
  `total_bayar` int(11) DEFAULT 0,
  PRIMARY KEY (`no_sewa`),
  KEY `kode_baju` (`kode_baju`),
  CONSTRAINT `detail_sewa_ibfk_1` FOREIGN KEY (`no_sewa`) REFERENCES `sewa` (`no_sewa`),
  CONSTRAINT `detail_sewa_ibfk_2` FOREIGN KEY (`kode_baju`) REFERENCES `baju` (`kode_baju`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `detail_sewa` */

insert  into `detail_sewa`(`no_sewa`,`kode_baju`,`qty`,`denda`,`total_bayar`) values 
('0001',NULL,NULL,0,0),
('0002',NULL,NULL,0,0),
('0003',NULL,NULL,0,0),
('0004',NULL,NULL,0,0),
('0005',NULL,NULL,0,0),
('0006',NULL,NULL,0,0),
('0007',NULL,NULL,0,0),
('0008',NULL,NULL,0,0),
('0009',NULL,NULL,0,0),
('0010',NULL,NULL,0,0),
('0011',NULL,NULL,0,0),
('0012',NULL,NULL,0,0),
('0013',NULL,NULL,0,0),
('0014',NULL,NULL,0,0);

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

insert  into `pelanggan`(`id_pelanggan`,`nama`,`alamat`,`kota`,`no_tlp`) values 
('101','Yeni','Jl.Cijambe Gg nila 1 no.8a','Bandung','081224698211'),
('102','Andika','Jl.Babakan sari 1 no.13 ','Bandung','0881023425611'),
('103','Agung','Jl.Gandapura no.28','Bandung','087822446882'),
('104','Milanita','Jl.Sukanegla no.118','Bandung','085156963828'),
('105','Vincent','Jl.Anggrek no.22','Bandung','082127788156'),
('106','Yogi','Komp.vijaya kusuma no.17','Bandung','089896525132'),
('107','Saeful','Jl.Slamet 1 no.223','Bandung','081141235265'),
('108','Purwaningsih','Komp.Ujungberung indah no.50','Bandung','086332511272'),
('109','Azkia','Jl.Cikajang timur no.30','Bandung','089986524513'),
('110','Riza','Jl.Babakan surabaya no.12','Bandung','\r\n087822446882'),
('111','Bu Lelis','Jl.Sawah kurung no.2','Bandung','081221834673'),
('112','Bu Ratik','Jl.Sukarsah no.7','Bandung','084451213852'),
('113','Bu Rita','Jl.Jumadi no.20','Bandung','0226623710'),
('114','Opah','Jl.Pungkur no.203','Bandung','088872215983'),
('115','Rengga','Jl.Fakfak no.45','Bandung','081224523654');

/*Table structure for table `sewa` */

DROP TABLE IF EXISTS `sewa`;

CREATE TABLE `sewa` (
  `no_sewa` varchar(5) NOT NULL,
  `id_pelanggan` varchar(5) DEFAULT NULL,
  `tgl_sewa` date DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `dp_sewa` int(11) DEFAULT 0,
  `status` varchar(15) DEFAULT 'BELUM LUNAS',
  PRIMARY KEY (`no_sewa`),
  KEY `id_pelanggan` (`id_pelanggan`),
  CONSTRAINT `sewa_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sewa` */

insert  into `sewa`(`no_sewa`,`id_pelanggan`,`tgl_sewa`,`tgl_kembali`,`dp_sewa`,`status`) values 
('0001','101','2020-01-08',NULL,50000,'BELUM LUNAS'),
('0002','102','2020-01-08',NULL,150000,'BELUM LUNAS'),
('0003','103','2020-01-08',NULL,175000,'BELUM LUNAS'),
('0004','104','2020-01-08',NULL,450000,'BELUM LUNAS'),
('0005','105','2020-01-09','2020-01-14',180000,'BELUM LUNAS'),
('0006','106','2020-01-09',NULL,235000,'BELUM LUNAS'),
('0007','107','2020-01-09',NULL,125000,'BELUM LUNAS'),
('0008','108','2020-01-09','2020-01-14',340000,'BELUM LUNAS'),
('0009','109','2020-01-09','2020-01-14',180000,'BELUM LUNAS'),
('0010','110','2020-01-10',NULL,120000,'BELUM LUNAS'),
('0011','111','2020-01-10',NULL,195000,'BELUM LUNAS'),
('0012','112','2020-01-10',NULL,150000,'BELUM LUNAS'),
('0013','113','2020-01-10',NULL,125000,'BELUM LUNAS'),
('0014','114','2020-01-10',NULL,300000,'BELUM LUNAS'),
('0015','115','2020-01-10',NULL,75000,'BELUM LUNAS');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

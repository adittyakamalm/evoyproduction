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

insert  into `baju`(`kode_baju`,`nama_baju`,`stok_baju`,`harga`) values 
('K001','Betawi',25,100000),
('K002','Ulee Balang ',32,75000),
('K003','Kebaya',40,65000),
('K004','Pesa\'an',15,80000),
('K005','Ulos',20,75000),
('K006','Pangsi',20,75000),
('K007','Bundo Kanduang',24,60000),
('K008','Belanga',25,75000),
('K009','Aesan Gede',25,125000),
('K010','Paksian',25,100000);

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
  CONSTRAINT `detail_sewa_ibfk_1` FOREIGN KEY (`no_sewa`) REFERENCES `sewa` (`no_sewa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detail_sewa_ibfk_2` FOREIGN KEY (`kode_baju`) REFERENCES `baju` (`kode_baju`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `detail_sewa` */

insert  into `detail_sewa`(`no_sewa`,`kode_baju`,`qty`,`denda`,`total_bayar`) values 
('S01','K002',1,0,25000),
('S02','K006',2,25000,125000),
('S03','K003',3,0,120000),
('S04','K001',5,125000,375000),
('S05','K005',3,0,150000),
('S06','K008',3,0,170000),
('S07','K009',1,0,80000),
('S08','K010',4,0,300000),
('S09','K007',2,0,90000),
('S10','K004',3,0,150000),
('S11','K003',3,25000,150000),
('S12','K002',2,0,100000),
('S13','K001',1,1,95000),
('S14','K004',3,50000,190000),
('S15','K006',4,0,225000);

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
('P001','Yeni','Jl.Cijambe Gg nila 1 no.8a','Bandung','081224698211'),
('P002','Andika','Jl.Babakan sari 1 no.13 ','Bandung','0881023425611'),
('P003','Agung','Jl.Gandapura no.28','Bandung','087822446882'),
('P004','Milanita','Jl.Sukanegla no.118','Bandung','085156963828'),
('P005','Vincent','Jl.Anggrek no.22','Bandung','082127788156'),
('P006','Yogi','Komp.vijaya kusuma no.17','Bandung','089896525132'),
('P007','Saeful','Jl.Slamet 1 no.223','Bandung','081141235265'),
('P008','Purwaningsih','Komp.Ujungberung indah no.50','Bandung','086332511272'),
('P009','Azkia','Jl.Cikajang timur no.30','Bandung','089986524513'),
('P010','Riza','Jl.Babakan surabaya no.12','Bandung','\r\n087822446882'),
('P011','Bu Lelis','Jl.Sawah kurung no.2','Bandung','081221834673'),
('P012','Bu Ratik','Jl.Sukarsah no.7','Bandung','084451213852'),
('P013','Bu Rita','Jl.Jumadi no.20','Bandung','0226623710'),
('P014','Opah','Jl.Pungkur no.203','Bandung','088872215983'),
('P015','Rengga','Jl.Fakfak no.45','Bandung','081224523654');

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
  CONSTRAINT `sewa_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sewa` */

insert  into `sewa`(`no_sewa`,`id_pelanggan`,`tgl_sewa`,`tgl_kembali`,`dp_sewa`,`status`) values 
('S01','P001','2020-01-08','2020-01-12',50000,'BELUM LUNAS'),
('S02','P002','2020-01-08','2020-01-14',50000,'BELUM LUNAS'),
('S03','P003','2020-01-08','2020-01-12',60000,'BELUM LUNAS'),
('S04','P004','2020-01-08','2020-01-15',250000,'BELUM LUNAS'),
('S05','P005','2020-01-09','2020-01-14',75000,'BELUM LUNAS'),
('S06','P006','2020-01-09','2020-01-13',55000,'BELUM LUNAS'),
('S07','P007','2020-01-09','2020-01-14',45000,'BELUM LUNAS'),
('S08','P008','2020-01-09','2020-01-14',100000,'BELUM LUNAS'),
('S09','P009','2020-01-09','2020-01-14',90000,'BELUM LUNAS'),
('S10','P010','2020-01-10','2020-01-15',90000,'BELUM LUNAS'),
('S11','P011','2020-01-10','2020-01-18',135000,'BELUM LUNAS'),
('S12','P012','2020-01-10','2020-01-14',50000,'BELUM LUNAS'),
('S13','P013','2020-01-10','2020-01-16',30000,'BELUM LUNAS'),
('S14','P014','2020-01-10','2020-01-20',100000,'BELUM LUNAS'),
('S15','P015','2020-01-10','2020-01-15',75000,'BELUM LUNAS');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

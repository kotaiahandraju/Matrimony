/*
SQLyog Community Edition- MySQL GUI v8.02 
MySQL - 5.7.19-log : Database - vasireddy1
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`vasireddy1` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `vasireddy1`;

/*Table structure for table `body_type` */

DROP TABLE IF EXISTS `body_type`;

CREATE TABLE `body_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `body_type` */

insert  into `body_type`(`id`,`name`,`status`,`created_time`,`updated_time`) values (1,'Slim','1','2017-09-21 17:46:18','2017-09-21 17:46:18'),(2,'Athletic','1','2017-09-21 17:46:18','2017-09-21 18:25:52'),(3,'Average','1','2017-09-21 17:46:18','2017-09-21 17:46:18'),(4,'Heavy','1','2017-09-21 17:46:18','2017-09-21 17:46:18'),(5,'Slim11','1','2017-09-27 16:48:38','2017-09-27 16:49:25');

/*Table structure for table `branch` */

DROP TABLE IF EXISTS `branch`;

CREATE TABLE `branch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) NOT NULL,
  `prefix` varchar(255) NOT NULL,
  `admin` varchar(255) NOT NULL,
  `premium` varchar(255) NOT NULL,
  `free` varchar(255) NOT NULL,
  `widow` varchar(255) NOT NULL,
  `sms_sender` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `branch` */

insert  into `branch`(`id`,`created_time`,`updated_time`,`name`,`prefix`,`admin`,`premium`,`free`,`widow`,`sms_sender`,`status`) values (1,'2017-09-22 13:19:09','2017-09-22 13:19:09','Guntur','VMB','1','4','3','2','VMBVJA','1'),(2,'2017-09-22 13:19:09','2017-09-22 13:19:09','Vijayawada','VMB(VJA)','1','4','3','2','VMBVJA','1');

/*Table structure for table `cast` */

DROP TABLE IF EXISTS `cast`;

CREATE TABLE `cast` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

/*Data for the table `cast` */

insert  into `cast`(`id`,`name`,`status`,`created_time`,`updated_time`) values (1,'Reddi','1','2017-09-22 13:13:37','2017-09-22 13:13:37'),(2,'Arya Vysya','1','2017-09-22 13:13:37','2017-09-22 13:13:37'),(3,'Viswabrahmin','1','2017-09-22 13:13:37','2017-09-22 13:13:37'),(4,'Kamma','1','2017-09-22 13:13:37','2017-09-22 13:13:37'),(5,'Kapu','1','2017-09-22 13:13:37','2017-09-22 13:13:37'),(6,'Munnuru Kapu','1','2017-09-22 13:13:37','2017-09-22 13:13:37'),(7,'Padmashali','1','2017-09-22 13:13:37','2017-09-22 13:13:37'),(8,'Yadava','1','2017-09-22 13:13:37','2017-09-22 13:13:37'),(9,'Goud','1','2017-09-22 13:13:37','2017-09-22 13:13:37'),(10,'Brahmin','1','2017-09-22 13:13:37','2017-09-22 13:13:37'),(11,'Intercaste','1','2017-09-22 13:13:37','2017-09-22 13:13:37'),(12,'Muslim','1','2017-09-22 13:13:37','2017-09-22 13:13:37'),(13,'NoorBasha','1','2017-09-22 13:13:37','2017-09-22 13:13:37'),(14,'Syed','1','2017-09-22 13:13:37','2017-09-22 13:13:37'),(16,'Hindu Mala','1','2017-09-22 13:13:37','2017-09-22 13:13:37'),(17,'Naidu','1','2017-09-22 13:13:37','2017-09-22 13:13:37'),(18,'Intercaste','1','2017-09-22 13:13:37','2017-09-22 13:13:37'),(29,'Padmasali','1','2017-09-27 16:53:22','2017-09-27 16:53:22'),(31,'Kshatriya','1',NULL,'2017-11-21 22:17:56'),(32,'Vaishya','1',NULL,'2017-11-21 22:18:54'),(33,'Shudra','1',NULL,'2017-11-21 22:19:06'),(34,'Gujjar','1',NULL,'2017-11-21 22:22:14'),(35,'Baidya','1',NULL,'2017-11-21 22:22:25'),(36,'Parsi','1',NULL,'2017-11-21 22:23:07'),(37,'Nayar','1',NULL,'2017-11-21 22:23:13'),(38,'Dawoodi Bohra','1',NULL,'2017-11-21 22:24:09'),(39,'Kashmiri Brahmin','1',NULL,'2017-11-21 22:24:26'),(40,'Ezhava','1',NULL,'2017-11-21 22:24:41'),(41,'Moplah','1',NULL,'2017-11-21 22:25:14'),(42,'Agrawal','1',NULL,'2017-11-21 22:25:45'),(43,'Sindhis','1',NULL,'2017-11-21 22:25:55'),(44,'Rajput','1',NULL,'2017-11-21 22:26:38'),(45,'Darzi','1',NULL,'2017-11-21 22:26:56'),(46,'Dogras','1',NULL,'2017-11-21 22:28:08'),(47,'Chhipa','1',NULL,'2017-11-21 22:28:36'),(48,'Dhuri','1',NULL,'2017-11-21 22:29:21'),(49,'Ayyangar Brahmin','1',NULL,'2017-11-21 22:30:06'),(50,'Chitrakathi','1',NULL,'2017-11-21 22:30:20'),(51,'Kashmiri Muslim','1',NULL,'2017-11-21 22:32:10');

/*Table structure for table `city` */

DROP TABLE IF EXISTS `city`;

CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(255) NOT NULL,
  `city_code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('0','1') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;

/*Data for the table `city` */

insert  into `city`(`id`,`state`,`city_code`,`name`,`created_time`,`updated_time`,`status`) values (1,'2','GNT','Guntur','2017-11-04 16:58:15','2017-11-04 16:58:15','1'),(2,'2','VJY','Vijayawada','2017-11-04 16:58:24','2017-11-04 16:58:24','1'),(3,'2','TNL','Tenali','2017-11-04 16:58:33','2017-11-04 16:58:33','1'),(4,'2','ONG','Ongole','2017-11-04 16:59:12','2017-11-04 16:59:12','1'),(5,'2','NLR','Nellore','2017-11-04 16:59:24','2017-11-04 16:59:24','1'),(6,'2','VZG','Visakhapatnam','2017-11-04 16:59:40','2017-11-04 16:59:40','1'),(7,'2','TRP','Tirupati','2017-11-04 17:00:15','2017-11-04 17:00:15','1'),(8,'2','KNL','Kurnool','2017-11-04 17:00:35','2017-11-04 17:00:35','1'),(9,'2','KDP','Kadapa','2017-11-04 17:00:48','2017-11-04 17:00:48','1'),(10,'2','ELR','Eluru','2017-11-04 17:01:00','2017-12-19 00:05:34','1'),(11,'2','NRP','Narasaraopet','2017-11-04 17:01:41','2017-11-04 17:01:41','1'),(12,'2','CLP','Chilakaluripet','2017-11-04 17:02:20','2017-11-04 17:02:20','1'),(13,'2','AMV','Amaravati','2017-11-04 17:03:42','2017-11-04 17:03:42','1'),(14,'5','HYD','Hyderabad','2017-11-04 17:04:45','2017-11-04 17:04:45','1'),(15,'5','NLG','Nalgonda','2017-11-04 17:05:02','2017-11-04 17:05:02','1'),(16,'5','NZB','Nizamabad','2017-11-04 17:05:23','2017-11-04 17:05:23','1'),(17,'5','ADB','Adilabad','2017-11-04 17:06:16','2017-11-04 17:06:16','1'),(18,'5','KMM','Khammam','2017-11-04 17:06:46','2017-11-04 17:06:46','1'),(19,'5','MBN','Mahbubnagar','2017-11-04 17:07:25','2017-11-04 17:07:25','1'),(20,'1','BNR','Bangalore','2017-11-04 17:08:44','2017-11-04 17:08:44','1'),(21,'1','MSR','Mysore','2017-11-04 17:09:00','2017-11-04 17:09:00','1'),(22,'1','MNR','Mangalore','2017-11-04 17:09:22','2017-11-04 17:09:22','1'),(23,'4','KCH','Kochi','2017-11-04 17:10:43','2017-11-04 17:10:43','1'),(24,'4','TRI','Trichur','2017-11-04 17:11:21','2017-11-04 17:11:21','1'),(25,'4','KNR','Kannur','2017-11-04 17:11:47','2017-11-04 17:11:47','1'),(26,'3','CHN','Chennai','2017-11-04 17:13:26','2017-11-04 17:13:26','1'),(27,'3','COI','Coimbatore','2017-11-04 17:14:27','2017-11-04 17:14:27','1'),(28,'3','MDR','Madurai','2017-11-04 17:14:53','2017-11-04 17:14:53','1'),(29,'3','KCH','Kancheepuram','2017-11-04 17:17:57','2017-11-04 17:17:57','1'),(30,'3','VLR','Vellore','2017-11-04 17:18:32','2017-11-04 17:18:32','1'),(31,'2','LPK','Lepakshi',NULL,'2017-11-21 22:45:46',NULL),(32,'2','ANP','Anantapur',NULL,'2017-11-21 22:45:59',NULL),(33,'2','KTG','Kothagudem',NULL,'2017-11-21 22:46:41',NULL),(34,'2','CHT','Chittoor',NULL,'2017-11-21 22:48:17',NULL),(35,'1','HMP','Hampi',NULL,'2017-11-21 22:53:54',NULL),(36,'1','SHI','Shimoga',NULL,'2017-11-21 22:54:00',NULL),(37,'1','JOG','Jog Falls',NULL,'2017-11-21 22:54:21',NULL),(38,'1','HSP','Hospet',NULL,'2017-11-21 22:54:32',NULL),(39,'1','BDR','Bidar',NULL,'2017-11-21 22:54:45',NULL),(40,'1','GBR','Gulbarga',NULL,'2017-11-21 22:55:00',NULL),(41,'1','KRW','Karwar',NULL,'2017-11-21 22:55:07',NULL),(42,'1','MER','Mercara',NULL,'2017-11-21 22:55:18',NULL),(43,'1','HAS','Hassan',NULL,'2017-11-21 22:55:40',NULL),(44,'1','CTD','Chitiradurga',NULL,'2017-11-21 22:55:52',NULL),(45,'1','AIH','Aihole',NULL,'2017-11-21 22:55:59',NULL),(46,'1','CHM','Chikmagalur',NULL,'2017-11-21 22:56:30',NULL),(47,'1','PTD','Pattadakal',NULL,'2017-11-21 22:56:45',NULL),(48,'1','SRG','Sringeri',NULL,'2017-11-21 22:56:56',NULL),(49,'1','TKR','Tumkur',NULL,'2017-11-21 22:57:22',NULL),(50,'1','UDP','Udipi',NULL,'2017-11-21 22:57:35',NULL),(51,'1','','Coorg',NULL,'2017-11-21 22:57:43',NULL),(52,'1','','Badami',NULL,'2017-11-21 22:57:52',NULL),(53,'1','','Bijapur',NULL,'2017-11-21 22:57:59',NULL),(54,'1','','Manipal',NULL,'2017-11-21 22:58:15',NULL),(55,'1','','Bellary',NULL,'2017-11-21 22:58:25',NULL),(56,'1','','Davangere',NULL,'2017-11-21 22:58:36',NULL),(57,'1','','Hubli',NULL,'2017-11-21 22:58:55',NULL),(58,'1','','Madikeri',NULL,'2017-11-21 22:59:06',NULL),(59,'1','','Raichur',NULL,'2017-11-21 22:59:18',NULL),(60,'1','','Srirangapatna',NULL,'2017-11-21 22:59:39',NULL),(61,'3','','Tanjore',NULL,'2017-11-21 23:08:34',NULL),(62,'3','','Madurai',NULL,'2017-11-21 23:09:01',NULL),(63,'3','','Coimbatore',NULL,'2017-11-21 23:09:13',NULL),(64,'3','','Chettinad',NULL,'2017-11-21 23:09:42',NULL),(65,'3','','Poompuhar',NULL,'2017-11-21 23:09:52',NULL),(66,'3','','Ooty',NULL,'2017-11-21 23:10:32',NULL),(67,'3','','Mahabalipuram',NULL,'2017-11-21 23:10:44',NULL),(68,'3','','Kanyakumari',NULL,'2017-11-21 23:11:07',NULL),(69,'3','','Dharmapuri',NULL,'2017-11-21 23:11:31',NULL),(70,'3','','Kumbakonam',NULL,'2017-11-21 23:12:11',NULL),(71,'3','','Tiruvarur',NULL,'2017-11-21 23:12:39',NULL),(72,'3','','Coonoor',NULL,'2017-11-21 23:12:56',NULL),(73,'3','','Kodaikanal',NULL,'2017-11-21 23:13:08',NULL),(74,'3','','Trichy',NULL,'2017-11-21 23:13:50',NULL),(75,'3','','Rameswaram',NULL,'2017-11-21 23:14:32',NULL);

/*Table structure for table `community` */

DROP TABLE IF EXISTS `community`;

CREATE TABLE `community` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `community` */

/*Table structure for table `complexion` */

DROP TABLE IF EXISTS `complexion`;

CREATE TABLE `complexion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `complexion` */

insert  into `complexion`(`id`,`name`,`status`,`created_time`,`updated_time`) values (1,'Very Fair','1','2017-09-22 13:19:09','2017-09-22 13:19:09'),(2,'Fair','1','2017-09-22 13:19:09','2017-09-22 13:19:09'),(3,'Wheatish','1','2017-09-22 13:19:09','2017-09-22 13:19:09'),(4,'Wheatish Brown','1','2017-09-22 13:19:09','2017-09-22 13:19:09'),(5,'Dark','1','2017-09-22 13:19:09','2017-09-22 13:19:09'),(6,'Medium','1','2017-09-22 13:19:09','2017-09-22 13:19:09');

/*Table structure for table `countries` */

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(259) NOT NULL,
  `status` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `countries` */

insert  into `countries`(`id`,`created_time`,`updated_time`,`name`,`status`) values (1,'0000-00-00 00:00:00','0000-00-00 00:00:00','India','1'),(2,'0000-00-00 00:00:00','0000-00-00 00:00:00','USA','1'),(3,'0000-00-00 00:00:00','0000-00-00 00:00:00','Australia','1'),(4,'0000-00-00 00:00:00','0000-00-00 00:00:00','UK','1'),(5,'0000-00-00 00:00:00','0000-00-00 00:00:00','Singapore','1'),(6,'0000-00-00 00:00:00','0000-00-00 00:00:00','Sweeden','1'),(7,'0000-00-00 00:00:00','0000-00-00 00:00:00','Soudi Arabia','1'),(8,'0000-00-00 00:00:00','0000-00-00 00:00:00','canada','1'),(9,'0000-00-00 00:00:00','0000-00-00 00:00:00','Netherland','1'),(10,'0000-00-00 00:00:00','0000-00-00 00:00:00','Africa','1'),(11,'0000-00-00 00:00:00','0000-00-00 00:00:00','Scotland','1'),(12,'0000-00-00 00:00:00','0000-00-00 00:00:00','switzerland','1');

/*Table structure for table `dosham` */

DROP TABLE IF EXISTS `dosham`;

CREATE TABLE `dosham` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('0','1') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

/*Data for the table `dosham` */

insert  into `dosham`(`id`,`name`,`created_time`,`updated_time`,`status`) values (18,'Sarpa Dosham','2017-11-04 17:21:51','2017-11-04 17:24:08','1'),(20,'Shani Dosham','2017-11-04 17:22:24','2017-11-04 17:22:24','1'),(21,'Janma Nakshatra Dosham','2017-11-04 17:24:59','2017-11-04 17:24:59','1'),(22,'Kuja Dosham','2017-11-04 17:25:16','2017-11-04 17:25:16','1');

/*Table structure for table `education` */

DROP TABLE IF EXISTS `education`;

CREATE TABLE `education` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

/*Data for the table `education` */

insert  into `education`(`id`,`updated_time`,`name`,`status`,`created_time`) values (1,'2017-09-22 13:19:09','B.Tech','1','2017-09-22 13:19:09'),(2,'2017-09-22 13:19:09','M.Tech','1','2017-09-22 13:19:09'),(3,'2017-09-22 13:19:09','B.A','1','2017-09-22 13:19:09'),(4,'2017-09-22 13:19:09','B.Com','1','2017-09-22 13:19:09'),(5,'2017-09-22 13:19:09','CA','1','2017-09-22 13:19:09'),(6,'2017-09-22 13:19:09','Degree','1','2017-09-22 13:19:09'),(7,'2017-09-22 13:19:09','Diploma','1','2017-09-22 13:19:09'),(8,'2017-09-22 13:19:09','Doctor','1','2017-09-22 13:19:09'),(9,'2017-09-22 13:19:09','Engineer','1','2017-09-22 13:19:09'),(10,'2017-09-22 13:19:09','ICWA','1','2017-09-22 13:19:09'),(11,'2017-09-22 13:19:09','IIM','1','2017-09-22 13:19:09'),(12,'2017-09-22 13:19:09','IIT','1','2017-09-22 13:19:09'),(13,'2017-09-22 13:19:09','Marine Courses','1','2017-09-22 13:19:09'),(14,'2017-09-22 13:19:09','MBA','1','2017-09-22 13:19:09'),(15,'2017-09-22 13:19:09','MCA','1','2017-09-22 13:19:09'),(16,'2017-09-22 13:19:09','MS','1','2017-09-22 13:19:09'),(17,'2017-09-22 13:19:09','PG','1','2017-09-22 13:19:09'),(18,'2017-09-22 13:19:09','PG in Doctors','1','2017-09-22 13:19:09'),(19,'2017-09-22 13:19:09','PG in Engineering','1','2017-09-22 13:19:09'),(20,'2017-09-22 13:19:09','Ph.D','1','2017-09-22 13:19:09'),(21,'2017-09-22 13:19:09','Others','1','2017-09-22 13:19:09'),(22,'2017-09-22 13:19:09','None','1','2017-09-22 13:19:09'),(24,'2017-09-22 13:19:09','BSC','1','2017-09-22 13:19:09'),(25,'2017-10-06 15:18:26','jjjj','1','2017-10-06 15:18:26'),(26,'2017-10-06 15:18:26','Any','1','2017-10-06 15:18:26');

/*Table structure for table `express_intrest` */

DROP TABLE IF EXISTS `express_intrest`;

CREATE TABLE `express_intrest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `intrest_to` varchar(255) NOT NULL,
  `created_on` datetime NOT NULL,
  `status` enum('0','1','2') NOT NULL DEFAULT '0',
  `mobile_no_viewed_status` enum('0','1') NOT NULL DEFAULT '0',
  `interested` enum('0','1') NOT NULL DEFAULT '0',
  `allowed_interested_count` int(11) DEFAULT NULL,
  `allowed_mobile_num_count` int(11) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `express_intrest` */

/*Table structure for table `height` */

DROP TABLE IF EXISTS `height`;

CREATE TABLE `height` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` time DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `inches` varchar(255) NOT NULL,
  `cm` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

/*Data for the table `height` */

insert  into `height`(`id`,`created_time`,`updated_time`,`inches`,`cm`,`status`) values (1,NULL,'0000-00-00 00:00:00','4\'5','135','1'),(2,NULL,'0000-00-00 00:00:00','4\'6','137','1'),(3,NULL,'0000-00-00 00:00:00','4\'7','139','1'),(4,NULL,'0000-00-00 00:00:00','4\'8','142','1'),(5,NULL,'0000-00-00 00:00:00','4\'9','144','1'),(6,NULL,'0000-00-00 00:00:00','4\'10','147','1'),(7,NULL,'0000-00-00 00:00:00','4\'11','149','1'),(8,NULL,'0000-00-00 00:00:00','5\'0','152','1'),(9,NULL,'0000-00-00 00:00:00','5\'1','154','1'),(10,NULL,'0000-00-00 00:00:00','5\'2','157','1'),(12,NULL,'0000-00-00 00:00:00','5\'3','160','1'),(13,NULL,'0000-00-00 00:00:00','5\'4','162','1'),(14,NULL,'0000-00-00 00:00:00','5\'5','165','1'),(15,NULL,'0000-00-00 00:00:00','5\'6','167','1'),(16,NULL,'0000-00-00 00:00:00','5\'7','170','1'),(17,NULL,'0000-00-00 00:00:00','5\'8','172','1'),(18,NULL,'0000-00-00 00:00:00','5\'9','175','1'),(19,NULL,'0000-00-00 00:00:00','5\'10','177','1'),(20,NULL,'0000-00-00 00:00:00','5\'11','180','1'),(21,NULL,'0000-00-00 00:00:00','6\'0','182','1'),(22,NULL,'0000-00-00 00:00:00','6\'1','185','1'),(23,NULL,'0000-00-00 00:00:00','6\'2','187','1'),(24,NULL,'0000-00-00 00:00:00','6\'3','190','1'),(25,NULL,'0000-00-00 00:00:00','6\'4','193','1'),(26,NULL,'0000-00-00 00:00:00','6\'5','195','1'),(27,NULL,'0000-00-00 00:00:00','6\'6','198','1'),(28,NULL,'0000-00-00 00:00:00','6\'7','200','1'),(29,NULL,'0000-00-00 00:00:00','6\'8','203','1'),(30,NULL,'0000-00-00 00:00:00','6\'9','205','1'),(31,NULL,'0000-00-00 00:00:00','6\'10','208','1'),(32,NULL,'0000-00-00 00:00:00','6\'11','210','1'),(33,NULL,'0000-00-00 00:00:00','7\'0','213','1');

/*Table structure for table `language` */

DROP TABLE IF EXISTS `language`;

CREATE TABLE `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

/*Data for the table `language` */

insert  into `language`(`id`,`created_time`,`updated_time`,`name`,`status`) values (1,'2017-09-22 13:19:09','2017-09-22 13:19:09','Telugu','1'),(2,'2017-09-22 13:19:09','2017-09-22 13:19:09','Hindi','1'),(3,'2017-09-22 13:19:09','2017-09-22 13:19:09','Tamil','1'),(4,'2017-09-22 13:19:09','2017-09-22 13:19:09','Kannada','1'),(5,'2017-09-22 13:19:09','2017-09-22 13:19:09','Malayalam','1'),(6,'2017-09-22 13:19:09','2017-09-22 13:19:09','English','1'),(8,'2017-11-21 22:01:12','2017-11-21 22:01:12','Bengali','1'),(9,'2017-11-21 22:01:29','2017-11-21 22:01:29','Marathi','1'),(10,'2017-11-21 22:01:44','2017-11-21 22:01:44','Urdu','1'),(11,'2017-11-21 22:02:06','2017-11-21 22:02:06','Gujarati','1'),(12,'2017-11-21 22:02:33','2017-11-21 22:02:33','Oriya','1'),(13,'2017-11-21 22:02:53','2017-11-21 22:02:53','Punjabi','1'),(14,'2017-11-21 22:03:13','2017-11-21 22:03:13','Assamese/Asomiya','1'),(15,'2017-11-21 22:03:33','2017-11-21 22:03:33','Maithili','1'),(16,NULL,'2017-11-21 22:05:47','Bodo','1'),(17,NULL,'2017-11-21 22:05:56','Dogri','1'),(18,NULL,'2017-11-21 22:06:19','Kashmiri','1'),(19,NULL,'2017-11-21 22:06:38','Konkani','1'),(20,NULL,'2017-11-21 22:06:56','Manipuri','1'),(21,NULL,'2017-11-21 22:07:26','Nepali','1'),(22,NULL,'2017-11-21 22:07:37','Sindhi','1'),(23,NULL,'2017-11-21 22:07:53','Santhali','1');

/*Table structure for table `location` */

DROP TABLE IF EXISTS `location`;

CREATE TABLE `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `location` */

insert  into `location`(`id`,`name`,`status`) values (4,'Australia','1'),(5,'Canada','1'),(6,'India','1'),(7,'London','1'),(8,'UK','1'),(9,'USA','1'),(10,'Singapore','1'),(11,'Others','1');

/*Table structure for table `marital_status` */

DROP TABLE IF EXISTS `marital_status`;

CREATE TABLE `marital_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `marital_status` */

/*Table structure for table `membership_users` */

DROP TABLE IF EXISTS `membership_users`;

CREATE TABLE `membership_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `prof_id` varchar(255) NOT NULL,
  `package_id` int(11) NOT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `valid_from` datetime DEFAULT NULL,
  `valid_to` datetime DEFAULT NULL,
  `cancel_date` datetime DEFAULT NULL,
  `scubsciber_id` varchar(127) DEFAULT '0',
  `transaction_type` enum('PAYPAL','CASH IN OFFICE','BANK DEPOSIT','ONLINE TRANSECTION') NOT NULL DEFAULT 'CASH IN OFFICE',
  `executive_name` varchar(255) DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  `status` enum('0','1','2') NOT NULL DEFAULT '1',
  `updated_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `scbscr_id` (`package_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `membership_users` */

insert  into `membership_users`(`id`,`user_id`,`prof_id`,`package_id`,`amount`,`created_date`,`valid_from`,`valid_to`,`cancel_date`,`scubsciber_id`,`transaction_type`,`executive_name`,`note`,`status`,`updated_date`) values (1,3,'VMB10002',1,3300.00,'2013-01-15 00:00:00','2013-01-15 00:00:00','2013-08-06 00:00:00','0000-00-00 00:00:00','','CASH IN OFFICE','Sk Munni','','1','2015-04-19 05:59:08'),(2,7,'VMB10005',2,5500.00,'2013-01-17 00:00:00','2013-01-17 00:00:00','2014-02-07 00:00:00','0000-00-00 00:00:00','','CASH IN OFFICE','Sk Munni','','1','2015-04-19 05:59:08'),(3,15,'VMB10009',1,3300.00,'2013-01-18 00:00:00','2013-01-18 00:00:00','2013-08-07 00:00:00','0000-00-00 00:00:00','','CASH IN OFFICE','Sk Munni','','1','2015-04-19 05:59:08');

/*Table structure for table `messages` */

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `sender_id` bigint(20) NOT NULL,
  `to_id` bigint(20) NOT NULL,
  `msg_title` varchar(256) NOT NULL,
  `sender_display_name` varchar(200) NOT NULL,
  `sender_email` varchar(200) NOT NULL,
  `to_display_name` varchar(200) NOT NULL,
  `to_email` varchar(200) NOT NULL,
  `msg_content` blob NOT NULL,
  `type` enum('R','S') NOT NULL DEFAULT 'R',
  `folder` enum('I','S','T') NOT NULL DEFAULT 'I',
  `is_deleted` enum('Y','N') NOT NULL DEFAULT 'N',
  `is_read` enum('Y','N') NOT NULL DEFAULT 'N',
  `ip_address` varchar(31) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `messages` */

insert  into `messages`(`id`,`user_id`,`sender_id`,`to_id`,`msg_title`,`sender_display_name`,`sender_email`,`to_display_name`,`to_email`,`msg_content`,`type`,`folder`,`is_deleted`,`is_read`,`ip_address`,`created_on`,`updated_on`) values (1,2,1,2,'Suitable Profiles for you from Vasireddy Marriage Bureau','Admin','support@vasireddymarriagebureau.com','kumar pulipati','jayanagajagadeesh.p@gmail.com','Dear User, Suitable Profiles as Follows<table width=\"600\" border=\"0\" cellpadding=\"1\" cellspacing=\"1\" bgcolor=\"#CCCCCC\">\n					  <tr>\n						<td width=\"150\" bgcolor=\"#FFFFFF\"><img src=\"http://vasireddymarriagebureau.com/newsite/themes/uploads/profiles/thumb/10_1_1427109792.jpg\" width=\"150px\"></td>\n						<td bgcolor=\"#FFFFFF\"><table width=\"100%\" border=\"0\" cellspacing=\"1\" cellpadding=\"2\">\n						  <tbody>\n							<tr>\n							  <td height=\"35\" colspan=\"2\"><strong>Profile ID : <a href=\"http://vasireddymarriagebureau.com/newsite/search/profile?profile=VMB30015\">VMB30015</a></strong></td>\n							</tr>\n							<tr>\n							  <td>Age / Height</td>\n							  <td>: 30 yrs, 140 cm </td>\n							</tr>\n							<tr>\n							  <td>Caste</td>\n							  <td>: Kamma</td>\n							</tr>\n							<tr>\n							  <td>Education</td>\n							  <td>: B.Tech</td>\n							</tr>\n							<tr>\n							  <td>Profession</td>\n							  <td>: Self Employed</td>\n							</tr>\n						  </tbody>\n						</table></td>\n						<td bgcolor=\"#FFFFFF\"><div align=\"center\"><a href=\"http://vasireddymarriagebureau.com/newsite/search/profile?profile=VMB30015\">View Profile</a> </div></td>\n					  </tr>\n					</table>\n					','R','I','N','Y','198.143.47.1','2015-03-25 00:02:05','2015-03-25 00:02:05'),(2,5,1,5,'Suitable Profiles for you from Vasireddy Marriage Bureau','Admin','support@vasireddymarriagebureau.com','Ramesh R','rrbece@gmail.com','Dear User, Suitable Profiles as Follows<table width=\"600\" border=\"0\" cellpadding=\"1\" cellspacing=\"1\" bgcolor=\"#CCCCCC\">\n					  <tr>\n						<td width=\"150\" bgcolor=\"#FFFFFF\"><img src=\"http://vasireddymarriagebureau.com/newsite/themes/uploads/profiles/thumb/10_1_1427109792.jpg\" width=\"150px\"></td>\n						<td bgcolor=\"#FFFFFF\"><table width=\"100%\" border=\"0\" cellspacing=\"1\" cellpadding=\"2\">\n						  <tbody>\n							<tr>\n							  <td height=\"35\" colspan=\"2\"><strong>Profile ID : <a href=\"http://vasireddymarriagebureau.com/newsite/search/profile?profile=VMB30015\">VMB30015</a></strong></td>\n							</tr>\n							<tr>\n							  <td>Age / Height</td>\n							  <td>: 30 yrs, 140 cm </td>\n							</tr>\n							<tr>\n							  <td>Caste</td>\n							  <td>: Kamma</td>\n							</tr>\n							<tr>\n							  <td>Education</td>\n							  <td>: B.Tech</td>\n							</tr>\n							<tr>\n							  <td>Profession</td>\n							  <td>: Self Employed</td>\n							</tr>\n						  </tbody>\n						</table></td>\n						<td bgcolor=\"#FFFFFF\"><div align=\"center\"><a href=\"http://vasireddymarriagebureau.com/newsite/search/profile?profile=VMB30015\">View Profile</a> </div></td>\n					  </tr>\n					</table>\n					','R','I','N','N','198.143.47.1','2015-03-25 08:07:34','2015-03-25 08:07:34');

/*Table structure for table `occupation` */

DROP TABLE IF EXISTS `occupation`;

CREATE TABLE `occupation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

/*Data for the table `occupation` */

insert  into `occupation`(`id`,`created_time`,`updated_time`,`name`,`status`) values (6,'2017-09-22 13:19:09','2017-09-22 13:19:09','Armed Forces','1'),(7,'2017-09-22 13:19:09','2017-09-22 13:19:09','Banking','1'),(8,'2017-09-22 13:19:09','2017-09-22 13:19:09','Business Owner','1'),(9,'2017-09-22 13:19:09','2017-09-22 13:19:09','CA','1'),(10,'2017-09-22 13:19:09','2017-09-22 13:19:09','Caption','1'),(11,'2017-09-22 13:19:09','2017-09-22 13:19:09','Clerical','1'),(12,'2017-09-22 13:19:09','2017-09-22 13:19:09','Student','1'),(13,'2017-09-22 13:19:09','2017-09-22 13:19:09','Construction','1'),(14,'2017-09-22 13:19:09','2017-09-22 13:19:09','Doctor','1'),(15,'2017-09-22 13:19:09','2017-09-22 13:19:09','Engineer','1'),(16,'2017-09-22 13:19:09','2017-09-22 13:19:09','Executive','1'),(17,'2017-09-22 13:19:09','2017-09-22 13:19:09','Fashion Design','1'),(18,'2017-09-22 13:19:09','2017-09-22 13:19:09','Finance','1'),(19,'2017-09-22 13:19:09','2017-09-22 13:19:09','Food Services - Hotel','1'),(20,'2017-09-22 13:19:09','2017-09-22 13:19:09','Government','1'),(21,'2017-09-22 13:19:09','2017-09-22 13:19:09','Human Resource','1'),(22,'2017-09-22 13:19:09','2017-09-22 13:19:09','Independent','1'),(23,'2017-09-22 13:19:09','2017-09-22 13:19:09','Lawyer','1'),(24,'2017-09-22 13:19:09','2017-09-22 13:19:09','Lecturer','1'),(25,'2017-09-22 13:19:09','2017-09-22 13:19:09','Manager','1'),(26,'2017-09-22 13:19:09','2017-09-22 13:19:09','Media','1'),(27,'2017-09-22 13:19:09','2017-09-22 13:19:09','Medical - Dentist','1'),(28,'2017-09-22 13:19:09','2017-09-22 13:19:09','Medical - Doctor','1'),(29,'2017-09-22 13:19:09','2017-09-22 13:19:09','Merchant Navy Officer','1'),(30,'2017-09-22 13:19:09','2017-09-22 13:19:09','Modeling/Acting','1'),(31,'2017-09-22 13:19:09','2017-09-22 13:19:09','Officer','1'),(32,'2017-09-22 13:19:09','2017-09-22 13:19:09','Shipping','1'),(33,'2017-09-22 13:19:09','2017-09-22 13:19:09','Others','1'),(34,'2017-09-22 13:19:09','2017-09-22 13:19:09','Professor','1'),(35,'2017-09-22 13:19:09','2017-09-22 13:19:09','Programmer','1'),(36,'2017-09-22 13:19:09','2017-09-22 13:19:09','Sales/Marketing','1'),(37,'2017-09-22 13:19:09','2017-09-22 13:19:09','Scientist','1'),(38,'2017-09-22 13:19:09','2017-09-22 13:19:09','Software Profession','1'),(39,'2017-09-22 13:19:09','2017-09-22 13:19:09','Teacher','1'),(40,'2017-09-22 13:19:09','2017-09-22 13:19:09','Technical','1'),(41,'2017-09-22 13:19:09','2017-09-22 13:19:09','UnEmployed','1'),(42,'2017-09-22 13:19:09','2017-09-22 13:19:09','Writer','1'),(43,'2017-09-22 13:19:09','2017-09-22 13:19:09','Farmer','1'),(44,'2017-09-22 13:19:09','2017-09-22 13:19:09','None','1'),(45,'2017-09-22 13:19:09','2017-09-22 13:19:09','Housewife','1'),(46,'2017-09-22 13:19:09','2017-09-22 13:19:09','Any','1'),(47,'2017-09-22 13:19:09','2017-09-22 13:19:09','Retd Govt Employee','1'),(48,'2017-09-22 13:19:09','2017-09-22 13:19:09','Medical Business','1');

/*Table structure for table `package` */

DROP TABLE IF EXISTS `package`;

CREATE TABLE `package` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `description` text NOT NULL,
  `status` enum('0','1') NOT NULL,
  `allowed_messages_limit` varchar(100) DEFAULT NULL,
  `allowed_profiles_limit` varchar(50) DEFAULT NULL,
  `highlight_profile` enum('0','1') DEFAULT NULL,
  `chat_allowed` enum('0','1') DEFAULT NULL,
  `horoscope_view` enum('0','1') DEFAULT NULL,
  `Astrology_match` enum('0','1') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `package` */

insert  into `package`(`id`,`created_time`,`updated_time`,`name`,`price`,`duration`,`description`,`status`,`allowed_messages_limit`,`allowed_profiles_limit`,`highlight_profile`,`chat_allowed`,`horoscope_view`,`Astrology_match`) values (1,'2017-09-22 13:19:09','2017-09-22 13:19:09','Classic',1299,3,'<p>\r\n	6 Months Membership</p>\r\n','1',NULL,NULL,NULL,NULL,NULL,NULL),(2,'2017-09-22 13:19:09','2017-09-22 13:19:09','Classic Plus',2499,6,'<p>\r\n	1 Year Membership</p>\r\n','1',NULL,NULL,NULL,NULL,NULL,NULL),(3,'2017-11-23 13:32:19','2017-11-23 13:32:19','Premium',5299,6,'<p>\r\n	Lifetime Membership</p>','1',NULL,NULL,NULL,NULL,NULL,NULL),(4,'2017-12-16 13:32:19','2017-12-16 16:53:03','Premium Plus',7499,6,'ddd','1',NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `pages` */

DROP TABLE IF EXISTS `pages`;

CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `pages` */

insert  into `pages`(`id`,`page_name`,`url`,`description`,`status`) values (1,'About Us','','<p>\r\n	<img alt=\"\" src=\"http://lyratech.in/matrimony/newsite/img/vasireddy_aboutus1.jpg\" /><img height=\"712\" src=\"http://lyratech.in/matrimony/vasi_imgs/vasireddy_aboutus1.jpg\" width=\"417\" /><br />\r\n	<img height=\"712\" src=\"http://lyratech.in/matrimony/vasi_imgs/vasireddy_aboutus2.jpg\" width=\"430\" /><br />\r\n	<img height=\"430\" src=\"http://lyratech.in/matrimony/vasi_imgs/vasireddy_aboutus3.jpg\" width=\"575\" /></p>\r\n','1'),(2,'Services','','<table align=\"center\" border=\"0\" cellpadding=\"1\" cellspacing=\"1\" width=\"95%\">\r\n	<tbody>\r\n		<tr>\r\n			<td height=\"30\">\r\n				<span class=\"style4\">Services</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#FFFFFF\">\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#FFFFFF\" height=\"30\">\r\n				<table border=\"0\" cellpadding=\"6\" cellspacing=\"0\" width=\"100%\">\r\n					<tbody>\r\n						<tr>\r\n							<td bgcolor=\"#F7F7F7\" width=\"12%\">\r\n								<img border=\"1\" height=\"56\" src=\"http://lyratech.in/matrimony/services/pelli.jpg\" width=\"100\" /></td>\r\n							<td bgcolor=\"#F7F7F7\" width=\"21%\">\r\n								<span class=\"style17\">Pelli Chupulu</span></td>\r\n							<td bgcolor=\"#F7F7F7\" width=\"12%\">\r\n								<img border=\"1\" height=\"56\" src=\"http://lyratech.in/matrimony/services/engage.jpg\" width=\"100\" /></td>\r\n							<td bgcolor=\"#F7F7F7\" width=\"25%\">\r\n								<span class=\"style17\">Engagement Function</span></td>\r\n							<td bgcolor=\"#F7F7F7\" width=\"11%\">\r\n								<img border=\"1\" height=\"56\" src=\"http://lyratech.in/matrimony/services/video.jpg\" width=\"100\" /></td>\r\n							<td bgcolor=\"#F7F7F7\" width=\"19%\">\r\n								<span class=\"style17\">Video</span></td>\r\n						</tr>\r\n						<tr>\r\n							<td>\r\n								<img border=\"1\" height=\"56\" src=\"http://lyratech.in/matrimony/services/decoration.jpg\" width=\"100\" /></td>\r\n							<td>\r\n								<span class=\"style17\">Decoration</span></td>\r\n							<td>\r\n								<img border=\"1\" height=\"56\" src=\"http://lyratech.in/matrimony/services/cards.jpg\" width=\"100\" /></td>\r\n							<td>\r\n								<span class=\"style17\">Wedding Cards</span></td>\r\n							<td>\r\n								<img border=\"1\" height=\"56\" src=\"http://lyratech.in/matrimony/services/cards1.jpg\" width=\"100\" /></td>\r\n							<td>\r\n								<span class=\"style17\">Wedding Cards Distribution</span></td>\r\n						</tr>\r\n						<tr>\r\n							<td bgcolor=\"#F7F7F7\">\r\n								<img border=\"1\" height=\"56\" src=\"http://lyratech.in/matrimony/services/mehendi.jpg\" width=\"100\" /></td>\r\n							<td bgcolor=\"#F7F7F7\">\r\n								<span class=\"style17\">Mehndi Function</span></td>\r\n							<td bgcolor=\"#F7F7F7\">\r\n								<img border=\"1\" height=\"56\" src=\"http://lyratech.in/matrimony/services/poojarui.jpg\" width=\"100\" /></td>\r\n							<td bgcolor=\"#F7F7F7\">\r\n								<span class=\"style17\">Poojari</span></td>\r\n							<td bgcolor=\"#F7F7F7\">\r\n								<img border=\"1\" height=\"56\" src=\"http://lyratech.in/matrimony/services/melam.jpg\" width=\"100\" /></td>\r\n							<td bgcolor=\"#F7F7F7\">\r\n								<span class=\"style17\">Mela Sannayelu</span></td>\r\n						</tr>\r\n						<tr>\r\n							<td>\r\n								<img border=\"1\" height=\"56\" src=\"http://lyratech.in/matrimony/services/peta.jpg\" width=\"100\" /></td>\r\n							<td>\r\n								<span class=\"style17\">Pelli Petalu</span></td>\r\n							<td>\r\n								<img border=\"1\" height=\"56\" src=\"http://lyratech.in/matrimony/services/rs.jpg\" width=\"100\" /></td>\r\n							<td>\r\n								<span class=\"style17\">Travelling Cars</span></td>\r\n							<td>\r\n								<img border=\"1\" height=\"56\" src=\"http://lyratech.in/matrimony/services/lighting.jpg\" width=\"100\" /></td>\r\n							<td>\r\n								<span class=\"style17\">Lighting</span></td>\r\n						</tr>\r\n						<tr>\r\n							<td bgcolor=\"#F7F7F7\">\r\n								<img border=\"1\" height=\"56\" src=\"http://lyratech.in/matrimony/services/stage.jpg\" width=\"100\" /></td>\r\n							<td bgcolor=\"#F7F7F7\">\r\n								<span class=\"style17\">Marrige Stage Decoration</span></td>\r\n							<td bgcolor=\"#F7F7F7\">\r\n								<img border=\"1\" height=\"56\" src=\"http://lyratech.in/matrimony/services/function.jpg\" width=\"100\" /></td>\r\n							<td bgcolor=\"#F7F7F7\">\r\n								<span class=\"style17\">Marriage Function</span></td>\r\n							<td bgcolor=\"#F7F7F7\">\r\n								<img border=\"1\" height=\"56\" src=\"http://lyratech.in/matrimony/services/bride.jpg\" width=\"100\" /></td>\r\n							<td bgcolor=\"#F7F7F7\">\r\n								<span class=\"style17\">Bride Decoration</span></td>\r\n						</tr>\r\n						<tr>\r\n							<td>\r\n								<img border=\"1\" height=\"56\" src=\"http://lyratech.in/matrimony/services/hall.jpg\" width=\"100\" /></td>\r\n							<td>\r\n								<span class=\"style17\">Function hall</span></td>\r\n							<td>\r\n								<img border=\"1\" height=\"56\" src=\"http://lyratech.in/matrimony/services/cater.jpg\" width=\"100\" /></td>\r\n							<td>\r\n								<span class=\"style17\">Catering</span></td>\r\n							<td>\r\n								<img border=\"1\" height=\"56\" src=\"http://lyratech.in/matrimony/services/vratam.jpg\" width=\"100\" /></td>\r\n							<td>\r\n								<span class=\"style17\">Poojalu</span></td>\r\n						</tr>\r\n						<tr>\r\n							<td bgcolor=\"#F7F7F7\">\r\n								<img border=\"1\" height=\"56\" src=\"http://lyratech.in/matrimony/services/dersj.jpg\" width=\"100\" /></td>\r\n							<td bgcolor=\"#F7F7F7\">\r\n								<span class=\"style17\">Temple Darshanam</span></td>\r\n							<td bgcolor=\"#F7F7F7\">\r\n								<img border=\"1\" height=\"56\" src=\"http://lyratech.in/matrimony/services/flight.jpg\" width=\"100\" /></td>\r\n							<td bgcolor=\"#F7F7F7\">\r\n								<span class=\"style17\">Flight/Bus/Train Tickets</span></td>\r\n							<td bgcolor=\"#F7F7F7\">\r\n								<img border=\"1\" height=\"56\" src=\"http://lyratech.in/matrimony/services/homey.jpg\" width=\"100\" /></td>\r\n							<td bgcolor=\"#F7F7F7\">\r\n								<span class=\"style17\">Honeymoon Packages</span></td>\r\n						</tr>\r\n						<tr>\r\n							<td>\r\n								<img border=\"1\" height=\"56\" src=\"http://lyratech.in/matrimony/services/SERV.jpg\" width=\"100\" /></td>\r\n							<td>\r\n								<span class=\"style17\">Any Time Any Service</span></td>\r\n							<td>\r\n								<img border=\"1\" height=\"56\" src=\"http://lyratech.in/matrimony/services/wedding.jpg\" width=\"100\" /></td>\r\n							<td>\r\n								<span class=\"style17\">Total Wedding package</span></td>\r\n							<td>\r\n								&nbsp;</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n','1'),(3,'Contact Us','','<p>\r\n	<span class=\"style4\">Contact Us </span></p>\r\n<p align=\"left\" class=\"style2\">\r\n	<span class=\"style3\">Vasireddy Marriage Bureau &amp; Events</span><br />\r\n	<span class=\"style5\">A to Z Marriage Services</span><br />\r\n	G-8, Sudha Towers, Above Queen&#39;s Beauty Parlour,<br />\r\n	Opp. Seetharamaiah High School, Brundavan Gardens, <br />\r\n	Guntur - 522 002<br />\r\n	<br />\r\n	Ph&nbsp; : +91-863 2239555<br />\r\n	M&nbsp;&nbsp;&nbsp; : +91-7702544445, 7674000123.</p>\r\n<p align=\"left\" class=\"style2\">\r\n	<br />\r\n	Email : <a href=\"mailto:info@vasireddymarriagebureau.com\">info@vasireddymarriagebureau.com</a><br />\r\n	Website : <a href=\"http://www.vasireddymarriagebureau.com\">www.vasireddymarriagebureau.com <br />\r\n	<br />\r\n	</a></p>\r\n<h2 align=\"left\" class=\"style2\">\r\n	<strong><u>Branch Office</u></strong></h2>\r\n<p align=\"left\" class=\"style2\">\r\n	<span class=\"style3\">Vasireddy Marriage Bureau &amp; Events</span><br />\r\n	<span class=\"style5\">A to Z Marriage Services</span><br />\r\n	Register Office Road<br />\r\n	Benz Circle, Vijayawada.</p>\r\n<p align=\"left\" class=\"style2\">\r\n	Ph: 7673943333, 7673953333</p>\r\n<p>\r\n	Email : <a href=\"mailto:info@vasireddymarriagebureau.com\">info@vasireddymarriagebureau.com</a><br />\r\n	Website : <a href=\"http://www.vasireddymarriagebureau.com\">www.vasireddymarriagebureau.com </a></p>\r\n','1'),(4,'Footer_contact','','<div class=\"col-md-3 column\">\r\n	<h2>\r\n		GUNTUR Branch</h2>\r\n	A to Z Marriage Services<br />\r\n	G-8, Sudha Towers, Above Queen&#39;s Beauty Parlour,<br />\r\n	Opp. Seetharamaiah High School, Brundavan Gardens,<br />\r\n	Guntur - 522 002<br />\r\n	Ph : +91-863 2239555 M : +91-7702544445, 7674000123</div>\r\n<div class=\"col-md-3 column\">\r\n	<h2>\r\n		VIJAYAWADA Branch</h2>\r\n	A to Z Marriage Services<br />\r\n	Register Office Road,<br />\r\n	Benz Circle,<br />\r\n	Vijayawada.<br />\r\n	Ph: 7673943333,7673953333 ,91-866 6697333</div>\r\n','1'),(5,'Header_contact','','<p>\r\n	<span>GUNTUR -</span>&nbsp; 7702544445,7674000123, 0863 2239555 | VIJAYAWADA -&nbsp;0866 6697333, 7673943333,</p>\r\n','1');

/*Table structure for table `payment_history` */

DROP TABLE IF EXISTS `payment_history`;

CREATE TABLE `payment_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `packageId` varchar(50) NOT NULL,
  `executiveName` varchar(255) NOT NULL,
  `paidAmount` varchar(255) NOT NULL,
  `validFrom` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `payment_history` */

/*Table structure for table `payment_method` */

DROP TABLE IF EXISTS `payment_method`;

CREATE TABLE `payment_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `payment_method` */

/*Table structure for table `paymenthistory` */

DROP TABLE IF EXISTS `paymenthistory`;

CREATE TABLE `paymenthistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `memberId` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `paymentType` varchar(255) DEFAULT NULL,
  `paymentStatus` varchar(255) DEFAULT NULL,
  `txid` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `bankRefNum` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `paymenthistory` */

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_key` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`permission_id`)
) ENGINE=MyISAM AUTO_INCREMENT=118 DEFAULT CHARSET=latin1;

/*Data for the table `permission` */

insert  into `permission`(`permission_id`,`permission_key`,`name`,`description`,`status`) values (12,'menu.success.stories','Success Stories Menu','','NULL'),(11,'menu.express.interest','Express Interest Menu','','NULL'),(10,'menu.profiles','Profiles Menu','','NULL'),(9,'menu.catalog2','Catalog2 Menu','','NULL'),(8,'menu.catalog1','Catalog1 Menu','','NULL'),(7,'menu.dashboard','Admin Dashboard','','NULL'),(13,'menu.pages','Content Pages Menu','','NULL'),(14,'menu.reports','Reports Menu','','NULL'),(15,'catalog1.body.menu','Catalog1 >> Body Type Menu','','NULL'),(16,'catalog1.body.add','Catalog1 >> Body Type >>ADD','','NULL'),(17,'catalog1.body.edit','Catalog1 >> Body Type >> Edit','','NULL'),(18,'catalog1.body.delete','Catalog1 >> Body Type >> Delete','','NULL'),(19,'catalog1.body.list','Catalog1 >> Body Type >>List','','NULL'),(20,'catalog1.branch.menu','Catalog1 >> Branch Menu','','NULL'),(21,'catalog1.branch.list','Catalog1 >> Branch >> List','','NULL'),(22,'catalog1.branch.add','Catalog1 >> Branch >> Add','','NULL'),(23,'catalog1.branch.edit','Catalog1 >> Branch >>Edit','','NULL'),(24,'catalog1.branch.delete','Catalog1 >> Branch >>Delete','','NULL'),(25,'catalog1.caste.menu','Catalog1 >> caste Menu','','NULL'),(26,'catalog1.caste.list','Catalog1 >> caste >> List','','NULL'),(27,'catalog1.caste.add','Catalog1 >> caste >> Add','','NULL'),(28,'catalog1.caste.edit','Catalog1 >> caste >>Edit','','NULL'),(29,'catalog1.caste.delete','Catalog1 >> caste >>Delete','','NULL'),(30,'catalog1.community.menu','Catalog1 >> community Menu','','NULL'),(31,'catalog1.community.list','Catalog1 >> community >> List','','NULL'),(32,'catalog1.community.add','Catalog1 >> community >> Add','','NULL'),(33,'catalog1.community.edit','Catalog1 >> community >>Edit','','NULL'),(34,'catalog1.community.delete','Catalog1 >> community >>Delete','','NULL'),(35,'catalog1.complexion.menu','Catalog1 >> complexion Menu','','NULL'),(36,'catalog1.complexion.list','Catalog1 >> complexion >> List','','NULL'),(37,'catalog1.complexion.add','Catalog1 >> complexion >> Add','','NULL'),(38,'catalog1.complexion.edit','Catalog1 >> complexion >>Edit','','NULL'),(39,'catalog1.complexion.delete','Catalog1 >> complexion >>Delete','','NULL'),(40,'catalog1.countries.menu','Catalog1 >> countries Menu','','NULL'),(41,'catalog1.countries.list','Catalog1 >> countries >> List','','NULL'),(42,'catalog1.countries.add','Catalog1 >> countries >> Add','','NULL'),(43,'catalog1.countries.edit','Catalog1 >> countries >>Edit','','NULL'),(44,'catalog1.countries.delete','Catalog1 >> countries >>Delete','','NULL'),(45,'catalog1.education.menu','Catalog1 >> education Menu','','NULL'),(46,'catalog1.education.list','Catalog1 >> education >> List','','NULL'),(47,'catalog1.education.add','Catalog1 >> education >> Add','','NULL'),(48,'catalog1.education.edit','Catalog1 >> education >>Edit','','NULL'),(49,'catalog1.education.delete','Catalog1 >> education >>Delete','','NULL'),(50,'catalog1.height.menu','Catalog1 >> height Menu','','NULL'),(51,'catalog1.height.list','Catalog1 >> height >> List','','NULL'),(52,'catalog1.height.add','Catalog1 >> height >> Add','','NULL'),(53,'catalog1.height.edit','Catalog1 >> height >>Edit','','NULL'),(54,'catalog1.height.delete','Catalog1 >> height >>Delete','','NULL'),(55,'catalog2.languages.menu','Catalog2 >> languages Menu','','NULL'),(56,'catalog2.languages.list','Catalog2 >> languages >> List','','NULL'),(57,'catalog2.languages.add','Catalog2 >> languages >> Add','','NULL'),(58,'catalog2.languages.edit','Catalog2 >> languages >>Edit','','NULL'),(59,'catalog2.languages.delete','Catalog2 >> languages >>Delete','','NULL'),(60,'catalog2.location.menu','Catalog2 >> location Menu','','NULL'),(61,'catalog2.location.list','Catalog2 >> location >> List','','NULL'),(62,'catalog2.location.add','Catalog2 >> location >> Add','','NULL'),(63,'catalog2.location.edit','Catalog2 >> location >>Edit','','NULL'),(64,'catalog2.location.delete','Catalog2 >> location >>Delete','','NULL'),(65,'catalog2.occupation.menu','Catalog2 >> occupation Menu','','NULL'),(66,'catalog2.occupation.list','Catalog2 >> occupation >> List','','NULL'),(67,'catalog2.occupation.add','Catalog2 >> occupation >> Add','','NULL'),(68,'catalog2.occupation.edit','Catalog2 >> occupation >>Edit','','NULL'),(69,'catalog2.occupation.delete','Catalog2 >> occupation >>Delete','','NULL'),(70,'catalog2.membership.menu','Catalog2 >> membership Menu','','NULL'),(71,'catalog2.membership.list','Catalog2 >> membership >> List','','NULL'),(72,'catalog2.membership.add','Catalog2 >> membership >> Add','','NULL'),(73,'catalog2.membership.edit','Catalog2 >> membership >>Edit','','NULL'),(74,'catalog2.membership.delete','Catalog2 >> membership >>Delete','','NULL'),(75,'catalog2.rassi.menu','Catalog2 >> rassi Menu','','NULL'),(76,'catalog2.rassi.list','Catalog2 >> rassi >> List','','NULL'),(77,'catalog2.rassi.add','Catalog2 >> rassi >> Add','','NULL'),(78,'catalog2.rassi.edit','Catalog2 >> rassi >>Edit','','NULL'),(79,'catalog2.rassi.delete','Catalog2 >> rassi >>Delete','','NULL'),(80,'catalog2.religion.menu','Catalog2 >> religion Menu','','NULL'),(81,'catalog2.religion.list','Catalog2 >> religion >> List','','NULL'),(82,'catalog2.religion.add','Catalog2 >> religion >> Add','','NULL'),(83,'catalog2.religion.edit','Catalog2 >> religion >>Edit','','NULL'),(84,'catalog2.religion.delete','Catalog2 >> religion >>Delete','','NULL'),(85,'catalog2.star.menu','Catalog2 >> star Menu','','NULL'),(86,'catalog2.star.list','Catalog2 >> star >> List','','NULL'),(87,'catalog2.star.add','Catalog2 >> star >> Add','','NULL'),(88,'catalog2.star.edit','Catalog2 >> star >>Edit','','NULL'),(89,'catalog2.star.delete','Catalog2 >> star >>Delete','','NULL'),(90,'profiles.create.menu','create profile menu','','NULL'),(91,'profiles.all.menu','all profiles menu','','NULL'),(92,'profiles.admin.menu','admin profiles menu','','NULL'),(93,'profiles.free.menu','free profiles menu','','NULL'),(94,'profiles.inactive.menu','inactive profiles menu','','NULL'),(95,'profiles.premium.menu','premium profiles menu','','NULL'),(96,'profiles.premium_expired.menu','premium expired profiles menu','','NULL'),(97,'profiles.widow.menu','widow profiles menu','','NULL'),(98,'profiles.hidden.menu','hidden profiles menu','','NULL'),(100,'profiles.deleted.menu','deleted profiles menu','','NULL'),(101,'profile.edit','edit profile','','NULL'),(102,'profile.delete','delete profile','','NULL'),(103,'profile.login','login with user','','NULL'),(104,'profile.hidden','hidden profile','','NULL'),(105,'profile.mail','mail profile','','NULL'),(106,'profile.inactive','inactive profile','','NULL'),(107,'profile.compare','compare profile','','NULL'),(108,'profile.payment','payment profile','','NULL'),(109,'profile.reset_password','reset password','','NULL'),(110,'profile.view','view profile details','','NULL'),(111,'profile.active','active profile','','NULL'),(112,'profile.forward','forward express intrest profile ','','NULL'),(113,'success.stories.add','add success stories','','NULL'),(114,'success.stories.edit','edit success stories','','NULL'),(115,'success.stories.delete','delete success stories','','NULL'),(116,'content.pages.edit','edit content pages','','NULL'),(117,'profile.photos','Upload Profile Photos','',NULL);

/*Table structure for table `profile_created_by` */

DROP TABLE IF EXISTS `profile_created_by`;

CREATE TABLE `profile_created_by` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `profile_created_by` */

/*Table structure for table `raasi` */

DROP TABLE IF EXISTS `raasi`;

CREATE TABLE `raasi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `raasi` */

insert  into `raasi`(`id`,`created_time`,`updated_time`,`name`,`status`) values (4,'2017-09-22 13:19:09','2017-09-22 13:19:09','Mesha','1'),(5,'2017-09-22 13:19:09','2017-09-22 13:19:09','Vrushaba ','1'),(6,'2017-09-22 13:19:09','2017-09-22 13:19:09','Mithuna ','1'),(7,'2017-09-22 13:19:09','2017-09-22 13:19:09','Karkataka ','1'),(8,'2017-09-22 13:19:09','2017-09-22 13:19:09','Simha ','1'),(9,'2017-09-22 13:19:09','2017-09-22 13:19:09','Kanya ','1'),(10,'2017-09-22 13:19:09','2017-09-22 13:19:09','Tula','1'),(11,'2017-09-22 13:19:09','2017-09-22 13:19:09','Vruschika','1'),(12,'2017-09-22 13:19:09','2017-09-22 13:19:09','Dhannus','1'),(13,'2017-09-22 13:19:09','2017-09-22 13:19:09','Makara','1'),(15,'2017-09-22 13:19:09','2017-09-22 13:19:09','Kumba','1'),(16,'2017-09-22 13:19:09','2017-09-22 13:19:09','Meena','1');

/*Table structure for table `religion` */

DROP TABLE IF EXISTS `religion`;

CREATE TABLE `religion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `religion` */

insert  into `religion`(`id`,`created_time`,`updated_time`,`name`,`status`) values (1,'0000-00-00 00:00:00','0000-00-00 00:00:00','Hindu','1'),(2,'0000-00-00 00:00:00','0000-00-00 00:00:00','Muslim','1'),(3,'0000-00-00 00:00:00','0000-00-00 00:00:00','Christian','1'),(4,'2017-09-27 17:44:06','2017-09-27 17:44:06','Jain','1'),(5,'2017-11-21 16:49:23','2017-11-21 16:49:23','Sikh','1'),(6,'2017-11-21 16:52:23','2017-11-21 16:52:23','Islam','1');

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(200) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `id_UNIQUE` (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Data for the table `roles` */

insert  into `roles`(`role_id`,`role_name`,`description`) values (1,'Administrator','Administrator'),(3,'Admin','Admin'),(4,'Free Profile','Free'),(5,'Admin Profile','Admin'),(6,'Premium Profile','Premium'),(7,'Widower Profile','Widower'),(8,'Junior admin','Junior admin'),(9,'Premium Exipared Users','Premium Exipared Users'),(10,'Inactive Profile','Inactive Profile'),(11,'Premium Plus Profile','Premium Plus');

/*Table structure for table `roles_permission` */

DROP TABLE IF EXISTS `roles_permission`;

CREATE TABLE `roles_permission` (
  `role_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL,
  KEY `permission_id_idx` (`permission_id`),
  KEY `roles` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `roles_permission` */

insert  into `roles_permission`(`role_id`,`permission_id`) values (1,7),(1,14),(1,13),(1,8),(1,9),(1,10),(1,11),(1,12),(1,15),(1,19),(1,36),(1,35),(1,34),(1,33),(1,32),(1,31),(1,30),(1,29),(1,28),(1,27),(1,26),(1,25),(1,16),(1,17),(1,18),(1,20),(1,21),(1,22),(1,23),(1,24),(1,66),(1,65),(1,64),(1,63),(1,62),(1,61),(1,60),(1,59),(1,58),(1,57),(1,56),(1,55),(1,54),(1,53),(1,52),(1,51),(1,50),(1,37),(1,38),(1,39),(1,40),(1,41),(1,42),(1,43),(1,44),(1,45),(1,46),(1,47),(1,48),(1,49),(1,89),(1,88),(1,87),(1,86),(1,85),(1,84),(1,83),(1,82),(1,81),(1,80),(1,79),(1,78),(1,77),(1,76),(1,75),(1,74),(1,73),(1,72),(1,71),(1,70),(1,69),(1,68),(1,67),(3,8),(3,12),(8,113),(3,10),(3,15),(3,15),(3,16),(3,17),(3,17),(3,18),(3,18),(3,19),(3,20),(3,20),(3,21),(3,21),(3,22),(3,22),(3,23),(3,23),(3,23),(3,25),(3,25),(3,26),(3,26),(3,27),(3,27),(3,28),(3,28),(3,29),(3,29),(3,30),(3,30),(3,30),(3,30),(3,30),(3,30),(3,31),(3,31),(3,32),(3,32),(3,33),(3,33),(3,34),(3,34),(3,34),(3,35),(3,35),(3,36),(3,36),(8,12),(8,12),(8,11),(8,11),(8,10),(8,10),(8,8),(8,8),(8,15),(8,15),(8,16),(8,16),(8,17),(8,17),(8,18),(8,18),(8,18),(8,19),(8,19),(8,19),(8,20),(8,20),(8,21),(8,21),(8,22),(8,22),(8,22),(3,11),(1,102),(8,93),(8,26),(8,26),(8,25),(8,25),(8,27),(8,27),(8,28),(8,28),(8,95),(8,95),(8,30),(8,30),(8,31),(8,31),(8,32),(8,32),(8,32),(8,33),(8,33),(8,33),(8,33),(8,34),(8,34),(8,35),(8,35),(8,35),(8,35),(8,94),(8,92),(8,91),(3,37),(3,37),(8,37),(8,37),(3,38),(3,38),(3,38),(8,38),(8,38),(3,39),(3,39),(8,39),(3,40),(3,40),(8,40),(3,41),(3,41),(8,41),(8,41),(3,42),(3,42),(8,42),(3,43),(8,43),(8,43),(3,45),(3,45),(8,45),(3,46),(3,46),(8,46),(3,47),(8,47),(8,47),(3,48),(3,48),(8,48),(3,49),(3,49),(3,50),(8,50),(3,51),(3,51),(8,51),(3,52),(3,52),(3,44),(3,44),(8,44),(8,44),(8,49),(8,49),(8,52),(8,52),(3,53),(3,53),(8,53),(8,53),(3,54),(8,54),(8,54),(8,54),(8,54),(3,55),(3,55),(8,55),(3,56),(3,56),(3,57),(3,57),(3,57),(3,57),(3,58),(3,58),(3,59),(3,59),(3,59),(3,60),(3,60),(3,60),(3,61),(3,61),(3,61),(3,62),(3,63),(3,63),(3,63),(3,64),(3,64),(3,64),(3,65),(3,65),(3,65),(3,66),(3,66),(3,66),(3,66),(3,66),(8,56),(8,57),(8,57),(8,58),(8,58),(8,59),(8,59),(8,59),(8,60),(8,60),(8,60),(8,61),(8,61),(8,61),(8,61),(8,62),(8,62),(8,62),(8,63),(8,63),(8,63),(8,64),(8,64),(8,64),(8,64),(8,64),(8,65),(8,65),(8,65),(8,66),(8,66),(8,66),(3,67),(3,67),(3,68),(3,68),(3,68),(3,69),(3,69),(3,69),(3,69),(3,70),(3,70),(3,70),(3,70),(3,71),(3,71),(3,71),(3,71),(3,71),(3,72),(3,72),(3,72),(3,73),(3,73),(3,74),(3,75),(3,75),(3,9),(3,7),(3,13),(8,9),(3,14),(3,24),(8,7),(3,90),(8,13),(8,13),(8,14),(8,90),(3,76),(3,77),(3,77),(3,78),(3,79),(3,80),(3,81),(3,82),(3,83),(3,84),(3,85),(3,86),(3,87),(3,88),(3,89),(8,67),(8,68),(8,68),(8,69),(8,70),(8,71),(8,71),(8,72),(8,72),(8,73),(8,74),(8,75),(8,76),(8,76),(8,77),(8,78),(8,79),(8,80),(8,81),(8,82),(8,83),(8,84),(8,84),(8,85),(8,85),(8,86),(8,87),(8,88),(8,89),(1,116),(1,115),(1,114),(1,113),(1,112),(1,111),(1,110),(1,109),(1,108),(1,107),(1,106),(1,105),(1,104),(1,103),(1,101),(1,100),(1,97),(1,90),(1,91),(1,92),(1,93),(1,94),(1,95),(1,96),(3,91),(3,92),(3,93),(3,94),(3,94),(3,95),(3,96),(3,97),(3,104),(3,112),(3,11),(3,101),(3,103),(3,105),(3,106),(3,107),(3,108),(6,11),(3,110),(3,111),(4,11),(3,113),(3,114),(3,115),(3,116),(1,117),(3,117),(1,98);

/*Table structure for table `salary` */

DROP TABLE IF EXISTS `salary`;

CREATE TABLE `salary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('0','1') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `salary` */

/*Table structure for table `star` */

DROP TABLE IF EXISTS `star`;

CREATE TABLE `star` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

/*Data for the table `star` */

insert  into `star`(`id`,`created_time`,`updated_time`,`name`,`status`) values (2,'0000-00-00 00:00:00','0000-00-00 00:00:00','Anuradha','1'),(3,'0000-00-00 00:00:00','0000-00-00 00:00:00','Arudra','1'),(4,'0000-00-00 00:00:00','0000-00-00 00:00:00','Aslesha','1'),(5,'0000-00-00 00:00:00','0000-00-00 00:00:00','Aswani','1'),(6,'0000-00-00 00:00:00','0000-00-00 00:00:00','Bharani','1'),(7,'0000-00-00 00:00:00','0000-00-00 00:00:00','Chitta','1'),(8,'0000-00-00 00:00:00','0000-00-00 00:00:00','Dhanistta','1'),(9,'0000-00-00 00:00:00','0000-00-00 00:00:00','Hastha','1'),(10,'0000-00-00 00:00:00','0000-00-00 00:00:00','Jwesta','1'),(11,'0000-00-00 00:00:00','0000-00-00 00:00:00','Kruttika','1'),(12,'0000-00-00 00:00:00','0000-00-00 00:00:00','Makha','1'),(13,'0000-00-00 00:00:00','0000-00-00 00:00:00','Mrugasira','1'),(14,'0000-00-00 00:00:00','0000-00-00 00:00:00','Mula','1'),(15,'0000-00-00 00:00:00','0000-00-00 00:00:00','Pubba','1'),(16,'0000-00-00 00:00:00','0000-00-00 00:00:00','Punarvasu','1'),(17,'0000-00-00 00:00:00','0000-00-00 00:00:00','Purva Phalguni','1'),(18,'0000-00-00 00:00:00','0000-00-00 00:00:00','Purvabhadra','1'),(19,'0000-00-00 00:00:00','0000-00-00 00:00:00','Purvashada','1'),(20,'0000-00-00 00:00:00','0000-00-00 00:00:00','Pushyami','1'),(21,'0000-00-00 00:00:00','0000-00-00 00:00:00','Revathi','1'),(22,'0000-00-00 00:00:00','0000-00-00 00:00:00','Rohini','1'),(23,'0000-00-00 00:00:00','0000-00-00 00:00:00','Shathabisham','1'),(24,'0000-00-00 00:00:00','0000-00-00 00:00:00','Sravana','1'),(25,'0000-00-00 00:00:00','0000-00-00 00:00:00','Swathi','1'),(26,'0000-00-00 00:00:00','0000-00-00 00:00:00','Uttara','1'),(27,'0000-00-00 00:00:00','0000-00-00 00:00:00','Uttara Phalguni','1'),(28,'0000-00-00 00:00:00','0000-00-00 00:00:00','Uttarabhadra','1'),(29,'0000-00-00 00:00:00','0000-00-00 00:00:00','Uttarashada','1'),(30,'0000-00-00 00:00:00','0000-00-00 00:00:00','Vishaka','1'),(31,'0000-00-00 00:00:00','0000-00-00 00:00:00','Dont Know','1');

/*Table structure for table `state` */

DROP TABLE IF EXISTS `state`;

CREATE TABLE `state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('0','1') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `state` */

insert  into `state`(`id`,`name`,`created_time`,`updated_time`,`status`) values (1,'Karnataka','2017-11-04 16:49:39','2017-11-04 16:49:39','1'),(2,'Andhrapradesh','2017-11-04 16:49:58','2017-11-04 16:49:58','1'),(3,'Tamilnadu','2017-11-04 16:51:41','2017-11-04 16:51:41','1'),(4,'Kerala','2017-11-04 16:52:03','2017-11-04 16:52:03','1'),(5,'Telangana','2017-11-04 16:55:31','2017-11-04 16:55:31','1');

/*Table structure for table `success_stories` */

DROP TABLE IF EXISTS `success_stories`;

CREATE TABLE `success_stories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groom_id` varchar(255) NOT NULL,
  `bride_id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` varchar(512) NOT NULL,
  `branch` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `success_stories` */

insert  into `success_stories`(`id`,`groom_id`,`bride_id`,`title`,`message`,`branch`,`created_on`,`status`) values (3,'Sai Venkat','Aneela','My Success Story','Thankyou Vasireddy Marriage Bureau for helping me find my soulmate and the love of my life.',1,'2015-03-28 04:03:24','1'),(4,'Dr Sunil','Dr Baby Naga Priya','..','BOTH ARE DOCTOR',1,'2016-06-13 03:45:19','1'),(5,'N SRINIVASARAO','PRIYADARSHINI','-','BOTH ARE MS,USA',1,'2016-06-13 03:47:09','1'),(6,'M NAVEEN KUMAR','K GOWTHAAMI','..','NRI MATCH',1,'2016-06-13 03:50:08','1'),(7,'A RAVI KUMAR','S SWETHA SUGUNA','2ND MATCH','NRI',1,'2016-06-13 03:53:10','1'),(8,'HARSHA','SIREESHA','..','NRI ',1,'2016-06-13 03:55:11','1'),(9,'Galla. Suryanarayana','Valluri.Madhuri Swetha','Marriage Settled','May 27th Engagement , Marriage August 17.',2,'2017-06-18 04:42:49','1'),(10,'Alaparthi. Gopikrishna','Koneru. Vineela','Marriage Settled','July 27th Engagement, Marriage August 17.',2,'2017-06-18 04:44:57','1'),(11,'Gonuguntla Venkata rama krishna','Yalamchili Srivani','NRI','Marriage On March 1st 2017',1,'2017-08-01 03:47:32','1'),(12,'Linga Aravind','Nallapeni Lathasri','Business','Marriage on 31/5/2017',1,'2017-08-01 03:50:36','1'),(13,'N Venkateswara rao','Sri lakshmi','swe','Marriage date 17/4/2017',1,'2017-08-01 03:52:59','1');

/*Table structure for table `transactions` */

DROP TABLE IF EXISTS `transactions`;

CREATE TABLE `transactions` (
  `transaction_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `transaction_type` varchar(16) NOT NULL,
  `transaction_for` enum('PACKAGE','ADDBALANCE','SUBSCR') NOT NULL DEFAULT 'PACKAGE',
  `transaction_message` varchar(128) DEFAULT NULL,
  `transaction_no` varchar(32) DEFAULT NULL,
  `paid_amount` float(10,2) NOT NULL,
  `transaction_date` datetime NOT NULL,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `transactions` */

/*Table structure for table `user_auto_id_setting` */

DROP TABLE IF EXISTS `user_auto_id_setting`;

CREATE TABLE `user_auto_id_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `free` int(11) NOT NULL DEFAULT '0',
  `admin` int(11) NOT NULL DEFAULT '0',
  `widow` int(11) NOT NULL DEFAULT '0',
  `premium` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

/*Data for the table `user_auto_id_setting` */

insert  into `user_auto_id_setting`(`id`,`free`,`admin`,`widow`,`premium`) values (1,30001,0,0,0),(2,30002,0,0,0),(3,30003,0,0,0),(4,30004,0,0,0),(5,30005,0,0,0),(6,30006,0,0,0),(7,30007,0,0,0),(8,30008,0,0,0),(9,30009,0,0,0),(10,0,10001,0,0),(11,30010,0,0,0),(12,30011,0,0,0),(13,30012,0,0,0),(14,30013,0,0,0),(15,30014,0,0,0),(16,0,10002,0,0),(17,30015,0,0,0),(18,30016,0,0,0),(19,30017,0,0,0),(20,30018,0,0,0),(21,30019,0,0,0),(22,30020,0,0,0),(23,30021,0,0,0),(24,30022,0,0,0),(25,30023,0,0,0),(26,30024,0,0,0);

/*Table structure for table `user_images` */

DROP TABLE IF EXISTS `user_images`;

CREATE TABLE `user_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `cnt` int(11) NOT NULL DEFAULT '0',
  `updated_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `approved_status` enum('0','1','2') DEFAULT '0',
  `is_profile_picture` enum('0','1') DEFAULT '0',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_images` */

/*Table structure for table `user_images_bk` */

DROP TABLE IF EXISTS `user_images_bk`;

CREATE TABLE `user_images_bk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `cnt` int(11) NOT NULL DEFAULT '0',
  `updated_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `user_images_bk` */

insert  into `user_images_bk`(`id`,`user_id`,`image`,`cnt`,`updated_on`,`status`) values (1,2,'2_3_1425645266.jpg^2_3_1425645317.jpg^2_3_1426658502.jpg',0,'0000-00-00 00:00:00','1'),(2,3,'3_2_1427618303.jpg',0,'2015-03-30 02:38:24','1'),(3,4,'4_1.jpg',0,'0000-00-00 00:00:00','1'),(4,7,'7_1_1426097080.png^7_2_1426097081.png^7_3_1426097082.jpg',0,'0000-00-00 00:00:00','1'),(6,1,'1_1_1427109279.jpg',0,'2015-03-24 05:14:40','1'),(7,10,'10_1_1427109792.jpg^10_2_1427109904.jpg^10_3_1427110030.jpg',0,'2015-03-24 05:27:11','1'),(10,5,'5_1_1427618895.jpg^5_2_1427618895.jpg',0,'2015-03-30 02:48:15','1');

/*Table structure for table `user_images_bk_08042015` */

DROP TABLE IF EXISTS `user_images_bk_08042015`;

CREATE TABLE `user_images_bk_08042015` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `cnt` int(11) NOT NULL DEFAULT '0',
  `updated_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `user_images_bk_08042015` */

insert  into `user_images_bk_08042015`(`id`,`user_id`,`image`,`cnt`,`updated_on`,`status`) values (1,2,'8.jpg^9.jpg',0,'2013-02-07 13:30:00','1'),(2,3,'197.jpg^196.jpg',0,'2013-03-11 12:30:00','1');

/*Table structure for table `user_meta` */

DROP TABLE IF EXISTS `user_meta`;

CREATE TABLE `user_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `meta_key` varchar(255) NOT NULL,
  `meta_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107698 DEFAULT CHARSET=latin1;

/*Data for the table `user_meta` */

insert  into `user_meta`(`id`,`user_id`,`meta_key`,`meta_value`) values (1,2,'occupation','33'),(2,3,'occupation','38'),(3,4,'occupation','38'),(107649,2731,'sub_cast','Vysya'),(107650,2731,'about',''),(107651,2731,'rassi','16'),(107652,2731,'star','2'),(107653,2731,'padam','3'),(107654,2731,'religion','1'),(107655,2731,'education_details','EEE'),(107656,2731,'occupation','44'),(107657,2731,'occupation_details','None'),(107658,2731,'since_working','None'),(107659,2731,'salary_monthly',''),(107660,2731,'salary_annual',''),(107661,2731,'father_father_name','Raghavulu'),(107662,2731,'mother_father_name','Rangaiah'),(107663,2731,'father_native_address','Guntur'),(107664,2731,'mother_native_address','Srisailam'),(107665,2731,'father_present_address','Guntur'),(107666,2731,'sibuings','Brother'),(107667,2731,'property','2 Crores'),(107668,2731,'req_age','5'),(107669,2731,'req_height','14'),(107670,2731,'req_height_to','16'),(107671,2731,'req_complexion','2'),(107672,2731,'req_profession','46'),(107673,2731,'hours','10'),(107674,2731,'minutes','45'),(107675,2731,'ttype','PM'),(107676,2731,'terms','1'),(107677,2731,'visa_type',''),(107678,2731,'visa_country','1'),(107679,2731,'visa_staying',''),(107680,2731,'gothram','Tallam'),(107681,2731,'citizen_of','1'),(107682,2731,'visa_validity',''),(107683,2731,'about_family','Brother'),(107684,2731,'email2',''),(107685,2731,'defendent_name',''),(107686,2731,'son_of',''),(107687,2731,'court',''),(107688,2731,'wm_reason',''),(107689,2731,'male_childrens',''),(107690,2731,'female_childrens',''),(107691,2731,'wm_mm',''),(107692,2731,'wm_dd',''),(107693,2731,'wm_yy',''),(107694,2731,'ws_mm',''),(107695,2731,'ws_dd',''),(107696,2731,'ws_yy',''),(107697,2731,'education_info','');

/*Table structure for table `user_meta_bk_08042015` */

DROP TABLE IF EXISTS `user_meta_bk_08042015`;

CREATE TABLE `user_meta_bk_08042015` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `meta_key` varchar(255) NOT NULL,
  `meta_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `users.user_meta` FOREIGN KEY (`user_id`) REFERENCES `users_bk_08042015` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `user_meta_bk_08042015` */

insert  into `user_meta_bk_08042015`(`id`,`user_id`,`meta_key`,`meta_value`) values (1,2,'sub_cast',''),(2,2,'about',NULL),(3,2,'rassi',NULL);

/*Table structure for table `userdetails` */

DROP TABLE IF EXISTS `userdetails`;

CREATE TABLE `userdetails` (
  `userdetailsId` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userId` int(11) DEFAULT NULL,
  `executiveName` varchar(255) DEFAULT NULL,
  `SubCaste` varchar(255) DEFAULT NULL,
  `raasi` varchar(255) DEFAULT NULL,
  `star` varchar(255) DEFAULT NULL,
  `padam` varchar(255) DEFAULT NULL,
  `gotram` varchar(255) DEFAULT NULL,
  `Religion` varchar(255) DEFAULT NULL,
  `sLanguages` varchar(255) DEFAULT NULL,
  `aboutYourself` varchar(255) DEFAULT NULL,
  `educationDetails` varchar(255) DEFAULT NULL,
  `educationInfo` varchar(255) DEFAULT NULL,
  `Occupation` varchar(255) DEFAULT NULL,
  `occupationDetails` varchar(255) DEFAULT NULL,
  `sinceWorking` varchar(255) DEFAULT NULL,
  `salaryperMonth` varchar(255) DEFAULT NULL,
  `salaryperyear` varchar(255) DEFAULT NULL,
  `foDetails` varchar(255) DEFAULT NULL,
  `ffName` varchar(255) DEFAULT NULL,
  `fnativeAddress` varchar(255) DEFAULT NULL,
  `mnativeAddress` varchar(255) DEFAULT NULL,
  `presentAddress` varchar(255) DEFAULT NULL,
  `phone1` varchar(255) DEFAULT NULL,
  `phone2` varchar(255) DEFAULT NULL,
  `landLine` varchar(255) DEFAULT NULL,
  `email2` varchar(255) DEFAULT NULL,
  `moDetails` varchar(255) DEFAULT NULL,
  `mfName` varchar(255) DEFAULT NULL,
  `sibilings` varchar(255) DEFAULT NULL,
  `property` varchar(255) DEFAULT NULL,
  `aboutFamily` varchar(255) DEFAULT NULL,
  `ncitizenOf` varchar(255) DEFAULT NULL,
  `crCountry` varchar(255) DEFAULT NULL,
  `visaType` varchar(255) DEFAULT NULL,
  `stayingSince` varchar(255) DEFAULT NULL,
  `visaValidity` varchar(255) DEFAULT NULL,
  `ageGap` varchar(255) DEFAULT NULL,
  `rHeightFrom` varchar(255) DEFAULT NULL,
  `rHeightTo` varchar(255) DEFAULT NULL,
  `rComplexion` varchar(255) DEFAULT NULL,
  `rprofession` varchar(255) DEFAULT NULL,
  `maritalStatus` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `dosham` varchar(255) DEFAULT NULL,
  `workingWith` varchar(255) DEFAULT NULL,
  `companyName` varchar(255) DEFAULT NULL,
  `diet` varchar(255) DEFAULT NULL,
  `smoke` varchar(255) DEFAULT NULL,
  `drink` varchar(255) DEFAULT NULL,
  `bodyType` varchar(255) DEFAULT NULL,
  `disability` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userdetailsId`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;

/*Data for the table `userdetails` */

insert  into `userdetails`(`userdetailsId`,`created_time`,`updated_time`,`userId`,`executiveName`,`SubCaste`,`raasi`,`star`,`padam`,`gotram`,`Religion`,`sLanguages`,`aboutYourself`,`educationDetails`,`educationInfo`,`Occupation`,`occupationDetails`,`sinceWorking`,`salaryperMonth`,`salaryperyear`,`foDetails`,`ffName`,`fnativeAddress`,`mnativeAddress`,`presentAddress`,`phone1`,`phone2`,`landLine`,`email2`,`moDetails`,`mfName`,`sibilings`,`property`,`aboutFamily`,`ncitizenOf`,`crCountry`,`visaType`,`stayingSince`,`visaValidity`,`ageGap`,`rHeightFrom`,`rHeightTo`,`rComplexion`,`rprofession`,`maritalStatus`,`state`,`city`,`dosham`,`workingWith`,`companyName`,`diet`,`smoke`,`drink`,`bodyType`,`disability`) values (50,'2017-10-13 13:29:58','2017-10-13 14:15:34',2786,NULL,NULL,NULL,'17',NULL,'fghfh','3','7','sfgdsgsdg',NULL,NULL,'19',NULL,NULL,NULL,'INR 2 Lakh to 4 Lakh',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Married','AP','Guntur','Yes','Defense/Civil Services',NULL,'Non-Veg','Occasionally','Occasionally','3','None'),(52,'2017-10-13 14:40:58','2017-10-13 14:42:42',2788,NULL,NULL,NULL,'17',NULL,'ragukula','3','6','koti koti',NULL,NULL,'19',NULL,NULL,NULL,'INR 2 Lakh to 4 Lakh',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Married','AP','Guntur','Yes','Government/Public Sector',NULL,'Non-Veg','No','No','2','None'),(53,'2017-10-13 14:40:58','2017-10-13 15:07:16',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,'2017-10-13 15:20:25','2017-10-13 15:23:07',2789,NULL,NULL,NULL,'19',NULL,NULL,'3','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Married','AP','Guntur',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,'2017-10-13 15:22:04','2017-10-13 15:22:04',2790,NULL,NULL,NULL,NULL,NULL,NULL,'3','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,'2017-10-13 17:29:15','2017-10-17 11:41:28',2791,NULL,NULL,NULL,'17',NULL,'gggg','3','6','sdff',NULL,NULL,'18',NULL,NULL,NULL,'INR 2 Lakh to 4 Lakh',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Unmarried','AP','Guntur','No','Private Company',NULL,'Non-Veg','No','No','3','None'),(57,'2017-10-14 10:41:56','2017-10-14 10:42:03',2792,NULL,NULL,NULL,NULL,NULL,NULL,'1','7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(58,'2017-10-14 16:11:50','2017-10-14 16:20:35',2793,'Vijay Krishnan','BC','12','3','4','Pouchakula','1','6','Good','CSE','Computers','8','Systems','Two zero one five','25000','2.5','','Govindaswamy','Chennai','Kavali','Chennai',NULL,'','08632253936','gsaikumari21@yahoo.co.in','House wife','Raghavulu','Brother','One crore','Good','1','1','','','','5 Years','8','9','2','46','Unmarried','','','','','','','','','',''),(59,'2017-10-16 11:40:23','2017-10-16 15:57:16',2794,NULL,NULL,NULL,'12',NULL,'','1','7','dfgdsgf',NULL,NULL,'',NULL,NULL,NULL,'Upto INR 1 Lakh',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Married','AP','Guntur','No','',NULL,'','Occasionally','No','','Physical Disability'),(60,'2017-10-16 12:53:37','2017-10-25 14:37:51',2795,'rajurr','ddd','7','5','','ddddd','1','7','sddsd','','','20','sadfsadf','sadfsafd','','','','','sdsdsdfs','sdfsdfsfd','fsdfsdfs',NULL,'','','','','dssfsdf','sdfsdf','sdfsdfsdf','sdfsdf','10','3','','','','33','17','17','6','45','Unmarried','','','','','','','','','',''),(61,'2017-10-17 13:13:23','2017-10-17 13:13:44',2796,NULL,NULL,NULL,NULL,NULL,'','1','7',NULL,NULL,NULL,'19',NULL,NULL,NULL,'Upto INR 1 Lakh',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Married','AP','Guntur',NULL,'Private Company',NULL,'Veg','No','Occasionally','2',NULL),(62,'2017-10-17 15:23:53','2017-10-17 15:23:53',2797,NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(63,'2017-10-17 15:29:20','2017-10-17 15:31:09',2798,NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Married','AP','Guntur',NULL,'Government/Public Sector',NULL,'Veg','No','No',NULL,NULL),(64,'2017-10-17 15:34:57','2017-10-17 15:34:57',2799,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(65,'2017-10-17 15:36:01','2017-10-17 15:37:17',2800,NULL,NULL,NULL,NULL,NULL,'','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Upto INR 1 Lakh',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Married','AP','Guntur',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(66,'2017-10-17 15:38:32','2017-10-17 15:40:42',2801,NULL,NULL,NULL,'',NULL,'','3',NULL,'',NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Married','AP','Guntur','','Government/Public Sector',NULL,'Non-Veg','Occasionally','No','',''),(67,'2017-10-21 12:05:32','2017-10-21 12:11:12',2802,NULL,NULL,NULL,'22',NULL,'aaa','1',NULL,'notthing',NULL,NULL,'40',NULL,NULL,NULL,'INR 2 Lakh to 4 Lakh',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Unmarried','AP','Guntur','Yes','Private Company',NULL,'Veg','No','Yes','3','None'),(68,'2017-10-24 15:57:30','2017-10-24 16:58:28',2803,NULL,NULL,NULL,'',NULL,'','1',NULL,'',NULL,NULL,'18',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Unmarried','AP','Guntur','Yes','Private Company',NULL,'Non-Veg','Occasionally','Occasionally','2',''),(69,'2017-10-26 11:33:41','2017-10-31 14:48:10',2804,NULL,NULL,NULL,'',NULL,'','1',NULL,'',NULL,NULL,'19',NULL,NULL,NULL,'INR 2 Lakh to 4 Lakh',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Unmarried','AP','Vijayawada','','Defense/Civil Services',NULL,'Non-Veg','Occasionally','No','',''),(70,'2017-10-30 16:29:59','2017-10-30 16:30:47',2805,NULL,NULL,NULL,'17',NULL,'fgghfg','2',NULL,'uyoiuyio',NULL,NULL,'19',NULL,NULL,NULL,'Upto INR 1 Lakh',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Married','AP','Vijayawada','Don\'t Know','Private Company',NULL,'Veg','No','No','3','None'),(71,'2017-10-30 16:32:17','2017-10-30 16:33:00',2806,NULL,NULL,NULL,'',NULL,'ERTYERYT','4',NULL,'TYTYTY',NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Married','AP','Vijayawada','','',NULL,'','Occasionally','No','','None'),(72,'2017-11-02 13:05:38','2017-11-02 13:53:13',2807,NULL,NULL,NULL,'17',NULL,'ragukula','1',NULL,'assdsfgsdfg',NULL,NULL,'20',NULL,NULL,NULL,'Upto INR 1 Lakh',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Widow/Divorced','AP','Vijayawada','Yes','Government/Public Sector',NULL,'Veg','No','No','2','None'),(73,'2017-11-02 13:38:51','2017-11-02 13:39:31',2808,NULL,NULL,NULL,'17',NULL,'ragukula','3',NULL,'sdfsdfsd',NULL,NULL,'19',NULL,NULL,NULL,'INR 2 Lakh to 4 Lakh',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Married','AP','Guntur','Yes','Private Company',NULL,'Veg','No','No','3','Physical Disability'),(74,'2017-11-02 13:49:22','2017-11-02 13:50:07',2809,NULL,NULL,NULL,'18',NULL,'dgf','3',NULL,'dsgfdgf',NULL,NULL,'19',NULL,NULL,NULL,'INR 2 Lakh to 4 Lakh',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Unmarried','AP','Guntur','No','Government/Public Sector',NULL,'Occasionally Non-Veg','Occasionally','Occasionally','2','Physical Disability'),(75,'2017-11-02 13:56:37','2017-11-02 14:00:30',2810,NULL,NULL,NULL,'',NULL,'','2',NULL,'rt',NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Married','AP','Vijayawada','Yes','Private Company',NULL,'Non-Veg','Yes','Occasionally','','None');

/*Table structure for table `userrequirement` */

DROP TABLE IF EXISTS `userrequirement`;

CREATE TABLE `userrequirement` (
  `userrequirementId` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userId` int(11) DEFAULT NULL,
  `rAgeFrom` varchar(255) DEFAULT NULL,
  `rAgeTo` varchar(255) DEFAULT NULL,
  `rHeight` varchar(255) DEFAULT NULL,
  `rMaritalStatus` varchar(255) DEFAULT NULL,
  `rReligion` varchar(255) DEFAULT NULL,
  `rCaste` varchar(255) DEFAULT NULL,
  `rMotherTongue` varchar(255) DEFAULT NULL,
  `rhaveChildren` varbinary(255) DEFAULT NULL,
  `rCountry` varchar(255) DEFAULT NULL,
  `rState` varchar(255) DEFAULT NULL,
  `rEducation` varchar(255) DEFAULT NULL,
  `rWorkingWith` varchar(255) DEFAULT NULL,
  `rOccupation` varchar(255) DEFAULT NULL,
  `rAnnualIncome` varchar(255) DEFAULT NULL,
  `rCreateProfileFor` varchar(255) DEFAULT NULL,
  `rDiet` varchar(255) DEFAULT NULL,
  `rHeightTo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userrequirementId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `userrequirement` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `role_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `createProfileFor` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `religion` varchar(255) DEFAULT NULL,
  `motherTongue` varchar(255) DEFAULT NULL,
  `currentCountry` varchar(255) DEFAULT NULL,
  `currentState` varchar(255) DEFAULT NULL,
  `currentCity` varchar(255) DEFAULT NULL,
  `maritalStatus` varchar(255) DEFAULT NULL,
  `caste` varchar(255) DEFAULT NULL,
  `gotram` varchar(255) DEFAULT NULL,
  `star` varchar(255) DEFAULT NULL,
  `dosam` varchar(255) DEFAULT NULL,
  `dosamName` varchar(255) DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `workingWith` varchar(255) DEFAULT NULL,
  `companyName` varchar(255) DEFAULT NULL,
  `annualIncome` varchar(255) DEFAULT NULL,
  `monthlyIncome` varchar(255) DEFAULT NULL,
  `diet` varchar(255) DEFAULT NULL,
  `smoking` varchar(255) DEFAULT NULL,
  `drinking` varchar(255) DEFAULT NULL,
  `height` varchar(255) DEFAULT NULL,
  `bodyType` varchar(255) DEFAULT NULL,
  `complexion` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `aboutMyself` varchar(255) DEFAULT NULL,
  `disability` varchar(255) DEFAULT NULL,
  `status` enum('0','1','2','3','4') DEFAULT '0' COMMENT '0=>inactive,1=>active,2=>delete,4=>hidden',
  `showall` enum('0','1') DEFAULT '0',
  `occupation` varchar(255) DEFAULT NULL,
  `registerwith` varchar(255) DEFAULT NULL,
  `fatherName` varchar(255) DEFAULT NULL,
  `motherName` varchar(255) DEFAULT NULL,
  `fOccupation` varchar(255) DEFAULT NULL,
  `mOccupation` varchar(255) DEFAULT NULL,
  `noOfBrothers` varchar(255) DEFAULT NULL,
  `noOfSisters` varchar(255) DEFAULT NULL,
  `noOfBrothersMarried` varchar(255) DEFAULT NULL,
  `noOfSistersMarried` varchar(255) DEFAULT NULL,
  `haveChildren` varchar(255) DEFAULT NULL,
  `age` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`id`,`created_time`,`updated_time`,`role_id`,`username`,`password`,`email`,`createProfileFor`,`gender`,`firstName`,`lastName`,`dob`,`religion`,`motherTongue`,`currentCountry`,`currentState`,`currentCity`,`maritalStatus`,`caste`,`gotram`,`star`,`dosam`,`dosamName`,`education`,`workingWith`,`companyName`,`annualIncome`,`monthlyIncome`,`diet`,`smoking`,`drinking`,`height`,`bodyType`,`complexion`,`mobile`,`aboutMyself`,`disability`,`status`,`showall`,`occupation`,`registerwith`,`fatherName`,`motherName`,`fOccupation`,`mOccupation`,`noOfBrothers`,`noOfSisters`,`noOfBrothersMarried`,`noOfSistersMarried`,`haveChildren`,`age`) values (3,'2017-11-13 16:02:06','2017-11-13 16:02:06',1,NULL,'\"—ú<‰Íµ.ÕuèE›¶ù','info@charvikent.com','Self','Male','koti','and','1957-11-13','2','7','7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `users1` */

DROP TABLE IF EXISTS `users1`;

CREATE TABLE `users1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `role_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sname` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `height` varchar(11) DEFAULT NULL,
  `mstatus` enum('Unmarried','Widower','Divorcee','') DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `tob` varchar(255) DEFAULT NULL,
  `pob` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `cast` varchar(11) DEFAULT NULL,
  `complexion` varchar(11) DEFAULT NULL,
  `mtongue` varchar(255) DEFAULT NULL,
  `education` varchar(11) DEFAULT NULL,
  `emply_type` varchar(11) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `feducation` varchar(11) DEFAULT NULL,
  `foccupation` varchar(11) DEFAULT NULL,
  `mname` varchar(255) DEFAULT NULL,
  `meducation` varchar(11) DEFAULT NULL,
  `moccupation` varchar(11) DEFAULT NULL,
  `Address` text,
  `country` varchar(11) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `register_with` varchar(255) DEFAULT NULL,
  `profile_pic_status` enum('0','1') DEFAULT '1',
  `last_login` datetime DEFAULT NULL,
  `last_ip` varchar(255) DEFAULT NULL,
  `status` enum('0','1','2','3','4') DEFAULT '0' COMMENT '0=>inactive,1=>active,2=>married,4=>hidden',
  `showall` enum('0','1') DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2812 DEFAULT CHARSET=latin1;

/*Data for the table `users1` */

insert  into `users1`(`id`,`created_time`,`updated_time`,`role_id`,`username`,`password`,`email`,`name`,`sname`,`gender`,`height`,`mstatus`,`dob`,`tob`,`pob`,`created_by`,`cast`,`complexion`,`mtongue`,`education`,`emply_type`,`fname`,`feducation`,`foccupation`,`mname`,`meducation`,`moccupation`,`Address`,`country`,`mobile`,`branch`,`register_with`,`profile_pic_status`,`last_login`,`last_ip`,`status`,`showall`) values (2,NULL,'0000-00-00 00:00:00',6,'VMB40115','Ã?Â¹Â¶Å½jÃ‡Å“+Â«Â¤â€˜Ã°Â¨','bl_paladugu@yahoo.co.in','  Ramya Nikita','  Vankayalapati','Female','14','Unmarried','1986-11-29','0000-00-00','Vijayawada','Parent','4','3','  Telugu','17','0','V.Viswanadham','0','0','P.Bhaaratha lakshmi','0','0','Native:Poolathota village, Nellore district\nPresent Address:FF-2,Koduru castles,labbipet,vijayawada','0','9440674057','1','','','0000-00-00 00:00:00','','0','1'),(2788,'2017-10-13 14:40:58','2017-10-13 14:42:42',4,NULL,'Ã?Â¹Â¶Å½jÃ‡Å“+Â«Â¤â€˜Ã°Â¨','andraju.kotaiah@gmail.com','kotaiah','andraju','Male','19',NULL,'2017-10-13',NULL,NULL,'Self','14','2',NULL,'23','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9010410484',NULL,NULL,NULL,NULL,NULL,'1',NULL),(2789,'2017-10-13 15:20:25','2017-10-13 15:20:25',4,NULL,'Â¤tPjâ€¢]Â _Â³Ã‰YÃšâ€“','llinux2901@gmail.com','SrinivasaRao','Kota','Male',NULL,NULL,'2017-10-13',NULL,NULL,'Self','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-10-13 15:20:25',NULL,'1',NULL),(2790,'2017-10-13 15:22:04','2017-10-13 15:22:04',4,NULL,'Ã?Â¹Â¶Å½jÃ‡Å“+Â«Â¤â€˜Ã°Â¨','kkkkkk@gmail.com','kk','kk','Male',NULL,NULL,'2017-10-13',NULL,NULL,'Self',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-10-13 15:22:04',NULL,'1',NULL),(2791,'2017-10-13 17:29:15','2017-10-13 17:34:40',4,NULL,'LÂ¼Ã¢EC^Ã†Ã?Q}Ã©','ddd@sadf.com','kk','kkk','Male','18',NULL,'2017-10-13',NULL,NULL,'Self','14','6',NULL,'3','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9999999999',NULL,NULL,NULL,NULL,NULL,'1',NULL),(2792,'2017-10-14 10:41:56','2017-10-14 10:41:56',4,NULL,'Â²Ã¦Ã•Å â€šÃ±I\"Ã‘VÂ°Å¾Ãº{CÅ¾','gfd@hhh.com','dssd','sdsd','Male',NULL,NULL,'2017-10-14',NULL,NULL,'Self',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-10-14 10:41:56',NULL,'1',NULL),(2793,'2017-10-14 16:11:50','2017-10-14 16:20:35',4,'VMB3002793','^â€¡,\\Ã«\\i#\ZÃ¢Ã¿Pâ€œ','gsai.kumari21@gmail.com','Vijay Krishnan','Challa','Male','15',NULL,'2017-10-14','','Guntur','Sai','8','2','Telugu ','1',NULL,'Venkatesan','6','47','Venkataramana','22','44',NULL,NULL,'9346684899','1',NULL,NULL,NULL,'192.168.2.6','2',NULL),(2794,'2017-10-16 11:40:23','2017-10-16 15:55:36',4,NULL,'Ã?Â¹Â¶Å½jÃ‡Å“+Â«Â¤â€˜Ã°Â¨','kdkdk@gg.com','koti','koti','Male','12',NULL,NULL,NULL,NULL,'Self','17','',NULL,'3','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9999999999',NULL,NULL,NULL,NULL,NULL,'1',NULL),(2795,'2017-10-16 12:53:37','2017-10-25 14:37:51',4,'VMB3002795','sÆ’Ã¼u+Ã›YÃ³ZÂºqHÃ˜Â²Â?','andraju.kotaiah@gmail.com','ddddd','ddddd','Female','18',NULL,'1951-10-12','8:32 PM','ddd','kotaiah','9','5','sdsd','4',NULL,'sdsd','2','19','sdsds','15','',NULL,NULL,'999999999999','1','0',NULL,NULL,'0:0:0:0:0:0:0:1','1',NULL),(2796,'2017-10-17 13:13:23','2017-10-17 13:13:23',4,NULL,'Ã?Â¹Â¶Å½jÃ‡Å“+Â«Â¤â€˜Ã°Â¨','koti@gmail.com','kotaiah','andraju','Male','17',NULL,'1966-10-19',NULL,NULL,'Self','14','5',NULL,'3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9010410484',NULL,NULL,NULL,'2017-10-17 13:13:23',NULL,'1',NULL),(2797,'2017-10-17 15:23:53','2017-10-17 15:23:53',4,NULL,'â€?3,cÂ­0	Â¨Ã”6ÃŒÂ§Â²/4','kdkdk@mffd.com','kkk','kkkk','Male',NULL,NULL,'2017-10-11',NULL,NULL,'Self',NULL,NULL,'7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-10-17 15:23:53',NULL,'0',NULL),(2798,'2017-10-17 15:29:20','2017-10-17 15:29:20',4,NULL,'LÂ¼Ã¢EC^Ã†Ã?Q}Ã©','kkkk@sds.com','kkkkkkkkkkkkkk','kkkkkkkkkk','Male','18',NULL,'1965-10-06',NULL,NULL,'Self','14',NULL,'7','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9999999999',NULL,NULL,NULL,'2017-10-17 15:29:20',NULL,'0',NULL),(2799,'2017-10-17 15:34:57','2017-10-17 15:34:57',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-10-17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-10-17 15:34:57',NULL,'0',NULL),(2800,'2017-10-17 15:36:01','2017-10-17 15:36:01',4,NULL,'EÃ‹ÃŠJÂ¡Ã›Ã¥Â?$Ë†s4Ã¾Ã¿Ã²D','kkkkk@fff.com','kkk','kkk','Male',NULL,NULL,'1965-10-13',NULL,NULL,'Self','14',NULL,'7','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-10-17 15:36:01',NULL,'0',NULL),(2801,'2017-10-17 15:38:32','2017-10-17 15:40:42',4,NULL,'LÂ¼Ã¢EC^Ã†Ã?Q}Ã©','gsai.kumari21@gmail1.com','kk','kkk','Male','18',NULL,'2017-10-12',NULL,NULL,'Self','14','','7','4','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'999999999',NULL,NULL,NULL,NULL,NULL,'0',NULL),(2802,'2017-10-21 12:05:32','2017-10-21 12:11:12',4,'pavan','â€ž	x^W	Â¢@Ã—&c(Ã›t','tammineni.pavan@gmail.com','pavan','kumar','Male','19',NULL,'1988-10-12',NULL,NULL,'Self','1','5','1','15','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'7411184869',NULL,NULL,NULL,NULL,NULL,'0',NULL),(2803,'2017-10-24 15:57:30','2017-10-24 16:57:45',4,NULL,'KÃ¯;Â¹â€”/l_Ãˆ|Â¸Â²Ã¼%','ksdjf@gssd.com','jjdfg','j','Male','20',NULL,'1966-10-05',NULL,NULL,'Self','14','','7','23','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'99999999999',NULL,NULL,NULL,NULL,NULL,'0',NULL),(2804,'2017-10-26 11:33:41','2017-10-31 14:48:10',4,NULL,'{Â¹Ã¾Nbâ€™Â¥Ã—ÃŒÃ—Iu[Ã†Âµâ€œ','medasanipurushotham@gmail.com','gfh','fgjhfg','Male','18',NULL,'1964-10-06',NULL,NULL,'Daughter','1','','7','4','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9999999999999',NULL,NULL,NULL,NULL,'0:0:0:0:0:0:0:1','0',NULL),(2805,'2017-10-30 16:29:59','2017-10-30 16:29:59',4,NULL,'{Â¹Ã¾Nbâ€™Â¥Ã—ÃŒÃ—Iu[Ã†Âµâ€œ','medasanipurushotheam@gmail.com','wewe','wewewe','Male','19',NULL,'1965-10-07',NULL,NULL,'Son','3','6','2','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'999999999',NULL,NULL,NULL,'2017-10-30 16:29:59','0:0:0:0:0:0:0:1','0',NULL),(2806,'2017-10-30 16:32:17','2017-10-30 16:33:00',4,NULL,'{Â¹Ã¾Nbâ€™Â¥Ã—ÃŒÃ—Iu[Ã†Âµâ€œ','medasanipurusyyhotham@gmail.com','ttt','HHH','Male','16',NULL,'1963-10-02',NULL,NULL,'Self','14','','7','3','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'999999999',NULL,NULL,NULL,NULL,'0:0:0:0:0:0:0:1','0',NULL),(2807,'2017-11-02 13:05:38','2017-11-02 13:53:13',4,NULL,'Ã?Â¹Â¶Å½jÃ‡Å“+Â«Â¤â€˜Ã°Â¨','kotaiah123@gmail.com','kotaiah','andraj','Male','19',NULL,'2000-11-08',NULL,NULL,'Self','14','2','7','3','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9010410484',NULL,NULL,NULL,NULL,'0:0:0:0:0:0:0:1','0',NULL),(2808,'2017-11-02 13:38:51','2017-11-02 13:39:31',4,NULL,'e7â€”%Â¹Â?3Ã§ËœÃ»ÃœJ~ÃªÃ„','kdkdk@kdk.com','safdsadf','sdgfsdfg','Male','20',NULL,'1965-11-03',NULL,NULL,'Self','3','2','6','4','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9999999999999',NULL,NULL,NULL,NULL,'0:0:0:0:0:0:0:1','0',NULL),(2809,'2017-11-02 13:49:22','2017-11-02 13:50:07',4,NULL,'Ã¥.Â®Ã?c2Â?Â¸Ãšâ„¢Ã…9Ã²Ãƒ','dsgfdsg@ggg.com','sadfsdf','sdafsadf','Male','20',NULL,'1967-11-08',NULL,NULL,'Self','3','2','2','3','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4545454545454',NULL,NULL,NULL,NULL,'0:0:0:0:0:0:0:1','0',NULL),(2810,'2017-11-02 13:56:37','2017-11-02 14:00:30',4,NULL,'Â¼\"<Â±PÃ›qÃƒÃ·0Ã¤qÅ“','gdhdgh@gg.com','dfdf','dfdfd','Male','3',NULL,'1968-11-05',NULL,NULL,'Self','10','','2','1','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3434343434343',NULL,NULL,NULL,NULL,'0:0:0:0:0:0:0:1','0',NULL),(2811,NULL,'0000-00-00 00:00:00',1,'MasterAdmin','Ã?Â¹Â¶Å½jÃ‡Å“+Â«Â¤â€˜Ã°Â¨','info@charvikent.com','Administrator','','','0','','0000-00-00','0000-00-00','','','0','200','','0','0','','0','0','','0','0','','0','0','0','','1','0000-00-00 00:00:00','','1','0');

/*Table structure for table `users_31032015` */

DROP TABLE IF EXISTS `users_31032015`;

CREATE TABLE `users_31032015` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sname` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `height` int(11) NOT NULL,
  `mstatus` enum('Unmarried','Widower','Divorcee','') NOT NULL,
  `dob` date NOT NULL,
  `tob` varchar(255) NOT NULL,
  `pob` varchar(255) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `cast` int(11) NOT NULL,
  `complexion` int(11) NOT NULL,
  `mtongue` varchar(255) NOT NULL,
  `education` int(11) NOT NULL,
  `emply_type` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `feducation` int(11) NOT NULL,
  `foccupation` int(11) NOT NULL,
  `mname` varchar(255) NOT NULL,
  `meducation` int(11) NOT NULL,
  `moccupation` int(11) NOT NULL,
  `Address` text NOT NULL,
  `country` int(11) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `branch` int(11) NOT NULL,
  `register_with` varchar(255) NOT NULL,
  `profile_pic_status` enum('0','1') NOT NULL DEFAULT '1',
  `last_login` datetime NOT NULL,
  `last_ip` varchar(255) NOT NULL,
  `created_on` datetime NOT NULL,
  `status` enum('0','1','2','3') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `users_31032015` */

insert  into `users_31032015`(`id`,`role_id`,`username`,`password`,`email`,`name`,`sname`,`gender`,`height`,`mstatus`,`dob`,`tob`,`pob`,`created_by`,`cast`,`complexion`,`mtongue`,`education`,`emply_type`,`fname`,`feducation`,`foccupation`,`mname`,`meducation`,`moccupation`,`Address`,`country`,`mobile`,`branch`,`register_with`,`profile_pic_status`,`last_login`,`last_ip`,`created_on`,`status`) values (1,1,'Master','$2a$10$iaNr0Ggx39JOTSJ6nsWCqulnvAyZG.nw8d4qp7PdtQ5fIG8T40yY2','','Administrator','','',0,'','0000-00-00','','','',0,0,'',0,0,'',0,0,'',0,0,'',0,0,0,'','1','0000-00-00 00:00:00','','0000-00-00 00:00:00','1'),(2,0,'VMB10002','','caedinesh@gmail.com','Parameswara Reddy','Golamari','Male',0,'Unmarried','0000-00-00','','','',0,0,'Telugu',0,0,'',0,0,'',0,0,'',0,0,1,'','','0000-00-00 00:00:00','','0000-00-00 00:00:00','1'),(3,0,'VMB30001','','satyanarayna.srikara@gmail.com','Brahmani','Avula','Female',0,'Unmarried','0000-00-00','','Vijayawada','',0,0,'Telugu',0,0,'V.Viswanadham',0,0,'P.Bhaaratha lakshmi',0,0,'Native:Poolathota village, Nellore district\nPresent Address:FF-2,Koduru castles,labbipet,vijayawada',0,9440674057,1,'','','0000-00-00 00:00:00','','0000-00-00 00:00:00','1');

/*Table structure for table `users_bk` */

DROP TABLE IF EXISTS `users_bk`;

CREATE TABLE `users_bk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sname` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `height` int(11) NOT NULL,
  `mstatus` enum('Unmarried','Widower','Divorcee','') NOT NULL,
  `dob` date NOT NULL,
  `tob` varchar(255) NOT NULL,
  `pob` varchar(255) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `cast` int(11) NOT NULL,
  `complexion` int(11) NOT NULL,
  `mtongue` varchar(255) NOT NULL,
  `education` int(11) NOT NULL,
  `emply_type` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `feducation` int(11) NOT NULL,
  `foccupation` int(11) NOT NULL,
  `mname` varchar(255) NOT NULL,
  `meducation` int(11) NOT NULL,
  `moccupation` int(11) NOT NULL,
  `Address` text NOT NULL,
  `country` int(11) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `branch` int(11) NOT NULL,
  `register_with` varchar(255) NOT NULL,
  `profile_pic_status` enum('0','1') NOT NULL DEFAULT '1',
  `last_login` datetime NOT NULL,
  `last_ip` varchar(255) NOT NULL,
  `created_on` datetime NOT NULL,
  `status` enum('0','1','2','3') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `users_bk` */

insert  into `users_bk`(`id`,`role_id`,`username`,`password`,`email`,`name`,`sname`,`gender`,`height`,`mstatus`,`dob`,`tob`,`pob`,`created_by`,`cast`,`complexion`,`mtongue`,`education`,`emply_type`,`fname`,`feducation`,`foccupation`,`mname`,`meducation`,`moccupation`,`Address`,`country`,`mobile`,`branch`,`register_with`,`profile_pic_status`,`last_login`,`last_ip`,`created_on`,`status`) values (1,1,'Master','$2a$10$iaNr0Ggx39JOTSJ6nsWCqulnvAyZG.nw8d4qp7PdtQ5fIG8T40yY2','','Administrator','','',0,'','0000-00-00','','','',0,0,'',0,0,'',0,0,'',0,0,'',0,0,0,'','','0000-00-00 00:00:00','','0000-00-00 00:00:00','1'),(2,4,'VMB30001','$2a$10$Q7RFw.3P.xBDQXnEsijaFuPYBLe3bB4xMpG6P1H2cxy9BQtMPiIS.','jayanagajagadeesh.p@gmail.com','kumar','pulipati','Female',1,'Unmarried','1996-02-02','','GUNTUR','SELF',2,2,'Telugu',4,0,'P S S Naryana',4,2,'P Rupa',3,2,'',0,2147483647,1,'free','1','0000-00-00 00:00:00','','2015-02-22 04:29:02','1'),(3,4,'VMB30002','$2a$10$GhKk/Bo1zZ.k2DnAp9Tzb.uFMiSCE1SvOG0./5/B4b2osFpWKfIH6','rrbece@gmail.com','Asdf','Vasireddy','Male',1,'Unmarried','1980-01-01','','Guntur','Self',4,4,'Telugu',1,0,'asdf',3,1,'asdf',3,1,'',0,123456,1,'free','1','0000-00-00 00:00:00','','2015-02-23 09:18:02','1'),(4,4,'VMB30003','$2a$10$NaQa67nfpu1GWvsbtfF.XekBbcTh91ut1ORuzAb.2Ob483ijD9GRu','mallesh.talluri@gmail.com','mallesh','talluri','Male',1,'','1981-07-09','','vijayawada','mallesh',10,2,'telugu ',2,0,'nnnnnn',1,1,'yryrytytytytyt',2,1,'',0,9885098850,1,'free','1','0000-00-00 00:00:00','','2015-02-24 08:58:02','3'),(5,4,'VMB30006','$2a$10$g87hJJlQOfEvLp5KIs54auTlz1Y0E9HbcPvTiIr08QduK.3aQ0xn6','rrbece@gmail.com','Ramesh','R','Male',1,'Unmarried','1981-02-09','','','self',2,2,'asdf',3,0,'asdf',3,1,'asdf',4,1,'',0,123456,1,'free','1','0000-00-00 00:00:00','','2015-03-04 10:10:03','1'),(6,4,'VMB30007','$2a$10$IKGkC6lVGZsgwPBifITekuJGF9D.cbJEeyqJ7w7dMS6NMOe5fHS0.','mallesh.talluri1@gmail.com','SIVARAO','TALLURI','Male',1,'Unmarried','1980-07-09','','VIJAYAWADA','sivarao',10,2,'TELUGU',2,0,'nageswararrao',2,1,'asdf',3,1,'',0,86325469874,1,'free','0','0000-00-00 00:00:00','','2015-03-05 07:40:03','1'),(7,4,'VMB30009','$2a$10$yQ/LBxQiOFHvUVy/b6xOUe5coCmiXRHKCnba7uGPBB2I6Le2jv0uu','productbooking@gmail.com','Ramesh','R','Male',1,'Unmarried','1990-01-01','','Tenali','Self',1,2,'Telugu',2,0,'asdf',3,1,'asdf',3,1,'',0,123456,1,'free','1','0000-00-00 00:00:00','','2015-03-11 11:24:55','1'),(8,5,'VMB10001','$2a$10$aMteSJ39wyyaz80y22cQd.y9Csa0/JgQzT9EJp/dMaKrrW1DDMulG','asdf@asdf.com','Ramya','R','Female',1,'Unmarried','1985-02-01','','Guntur','Self',9,2,'Telugu',3,0,'sdsadas',3,1,'adsadsa',3,1,'',0,123456,1,'free','1','0000-00-00 00:00:00','','2015-03-11 11:52:36','1'),(9,5,'VMB(VJA)10002','$2a$10$ykI6Lixkc4kk7ypBAvfEbOG1HXkJvHUuHxsjORebMyon/6CfLpEh2','mallesh.talluri@gmail.com','TSNMALLESWARARAO','ASDF','Male',1,'Unmarried','1988-01-09','','ASDF','malli',6,4,'telugu',3,0,'asdf',1,3,'asdf',1,1,'',0,9885098850,2,'free','1','0000-00-00 00:00:00','','2015-03-12 02:00:05','1'),(10,4,'VMB30015','$2a$10$Zpm610mtTo5mipdOFWYtkORejTdeVV7fDJN7tMYGI8WYOiW2XLKlG','vmb.guntur1@gmail.com','Naveen','Vasireddy','Male',1,'Unmarried','1984-04-02','','Chilakaluripet','Brother',4,2,'Telugu',1,0,'tgjhsh',3,1,'kjhlkjoi',3,1,'',0,7788995522,1,'free','1','0000-00-00 00:00:00','','2015-03-23 04:09:47','1'),(11,4,'VMB30017','$2a$10$A63h05p3zYppbQOSCsk1ou7tfd65Ck9ivZqABApxfGiAj1172anAG','vineela.yenikepati@gmail.com','LAKSHMI VINEELA','Yenikapati','Female',1,'Unmarried','1989-07-03','','Pasumarru','phani',4,2,'Telugu',1,0,'RANGANAYAKULU',4,1,'SAMBRAJYA LAKSHMI',4,3,'',0,9848560244,1,'free','1','0000-00-00 00:00:00','','2015-03-23 04:19:18','1'),(12,4,'VMB30018','$2a$10$AVa/2Q69dq7kldtaJkyq9eo1BxypLo6DlNiMk0mCvPCf4dj0Di3AO','vmb.guntur@gmail.com','KJDJSJ','RATAN','Male',1,'Unmarried','1981-03-18','','IJO;P9OK;L','Brother',10,2,'JGKJHBJLKH',3,0,'TFGKJHL',3,1,'uihdlksh9gf8dsohj',3,0,'',0,7674000123,1,'free','1','0000-00-00 00:00:00','','2015-03-23 04:23:43','1'),(13,4,'VMB30019','$2a$10$6.7RnfxorCSetYGRyARd7u/4GUqf7JNMssgY73hkM9TsH6..wLAue','PANDUKK4@GMAIL.COM','KALYANA SRAVANTHI ','KANKANAMPATI','Female',1,'Unmarried','1990-07-29','','','phani',4,2,'Telugu',1,0,'K.ADINARAYANA',4,1,'SARALA',3,3,'',0,9441130135,1,'free','1','0000-00-00 00:00:00','','2015-03-23 04:39:39','1'),(14,4,'VMB30020','$2a$10$iRfa8bGGhfPw5jxCaAsLUeHoIylFoSecq8IiUkFqlsx/TAwlRuj7a','gonuguntla@gmail.com','lakshmi narayana','gonuguntla ','Male',1,'Unmarried','1989-06-01','','7.0 am','suhasini',4,2,'TELUGU',3,0,'afatefdfsb',4,1,'arfwe',3,1,'',0,9999999999,1,'free','1','0000-00-00 00:00:00','','2015-03-27 11:08:08','1'),(15,4,'VMB30021','$2a$10$Ts6/2Q3RK29JcrJ7i4hmpeOwbLz2Z7/2Lq.PdC4XD3tAcRsEhS47S','krishnavenikolla92@gmail.com','krishnaveni','kolli','Female',1,'Unmarried','1991-05-19','','','aete',4,2,'TELUGU',4,0,'ftr4wferhggg',4,1,'kolli',3,2,'',0,9502276315,1,'free','1','0000-00-00 00:00:00','','2015-03-27 11:14:15','1'),(16,4,'VMB30024','$2a$10$5sHyDFYy8CEq5fRNt24dQukiBQQpPAFu9l1qNUUbNc12.T/9uCmNS','vasireddyjaya9999@gmail.com','pratab','gadipathi','Male',1,'Unmarried','1988-09-06','','','suhasini',4,2,'TELUGU',3,0,'chandra shekar(Late)',3,1,'nbbhvvb',4,0,'',0,9052014604,1,'free','1','0000-00-00 00:00:00','','2015-03-27 11:27:20','3'),(20,3,'ramesh','$2a$10$htn.Xe7dlt4PHpBGy9SLvey.v/jKCGRoU7r.MZV5MtLLKlENAcFPG','','ramesh','','',0,'Unmarried','0000-00-00','','','',0,0,'',0,0,'',0,0,'',0,0,'',0,0,1,'','1','0000-00-00 00:00:00','','2015-03-29 12:23:31','0');

/*Table structure for table `users_bk_08042015` */

DROP TABLE IF EXISTS `users_bk_08042015`;

CREATE TABLE `users_bk_08042015` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sname` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `height` int(11) NOT NULL,
  `mstatus` enum('Unmarried','Widower','Divorcee','') NOT NULL,
  `dob` date NOT NULL,
  `tob` varchar(255) NOT NULL,
  `pob` varchar(255) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `cast` int(11) NOT NULL,
  `complexion` int(11) NOT NULL,
  `mtongue` varchar(255) NOT NULL,
  `education` int(11) NOT NULL,
  `emply_type` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `feducation` int(11) NOT NULL,
  `foccupation` int(11) NOT NULL,
  `mname` varchar(255) NOT NULL,
  `meducation` int(11) NOT NULL,
  `moccupation` int(11) NOT NULL,
  `Address` text NOT NULL,
  `country` int(11) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `branch` int(11) NOT NULL,
  `register_with` varchar(255) NOT NULL,
  `profile_pic_status` enum('0','1') NOT NULL DEFAULT '1',
  `last_login` datetime NOT NULL,
  `last_ip` varchar(255) NOT NULL,
  `created_on` datetime NOT NULL,
  `status` enum('0','1','2','3') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `users_bk_08042015` */

insert  into `users_bk_08042015`(`id`,`role_id`,`username`,`password`,`email`,`name`,`sname`,`gender`,`height`,`mstatus`,`dob`,`tob`,`pob`,`created_by`,`cast`,`complexion`,`mtongue`,`education`,`emply_type`,`fname`,`feducation`,`foccupation`,`mname`,`meducation`,`moccupation`,`Address`,`country`,`mobile`,`branch`,`register_with`,`profile_pic_status`,`last_login`,`last_ip`,`created_on`,`status`) values (1,1,'Master','$2a$10$iaNr0Ggx39JOTSJ6nsWCqulnvAyZG.nw8d4qp7PdtQ5fIG8T40yY2','','Administrator','','',0,'','0000-00-00','','','',0,0,'',0,0,'',0,0,'',0,0,'',0,0,0,'','1','0000-00-00 00:00:00','','0000-00-00 00:00:00','1'),(2,5,'VMB10002','$2a$10$Z/KFSGM3lMOQMiLEkG4VWu.7WOVocEJZ.xQ/74FKT0sHz3H8L6a1G','caedinesh@gmail.com','Parameswara Reddy','Golamari','Male',16,'Unmarried','0000-00-00','','','skmunni',1,2,'Telugu',17,0,'',0,0,'',0,0,'',0,0,1,'NONE','','0000-00-00 00:00:00','','2013-01-15 00:00:00','1');

/*Table structure for table `users_old` */

DROP TABLE IF EXISTS `users_old`;

CREATE TABLE `users_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `zipcode` int(11) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `users_old` */

insert  into `users_old`(`id`,`role_id`,`fname`,`lname`,`gender`,`email`,`username`,`password`,`address`,`address2`,`city`,`state`,`country`,`zipcode`,`phone`,`mobile`,`status`,`created_on`) values (1,1,'Administrator','','','','master','$2a$10$iaNr0Ggx39JOTSJ6nsWCqulnvAyZG.nw8d4qp7PdtQ5fIG8T40yY2','','','','','',0,'',0,'1','0000-00-00 00:00:00');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

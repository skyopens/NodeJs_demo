/*
SQLyog Enterprise v12.08 (64 bit)
MySQL - 5.7.19 : Database - library
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`library` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `library`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(32) NOT NULL,
  `Password` varchar(32) NOT NULL,
  `IsDeleted` tinyint(4) NOT NULL DEFAULT '0',
  `CreatedDate` datetime NOT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`Id`,`Name`,`Password`,`IsDeleted`,`CreatedDate`,`UpdatedDate`) values (1,'testererere2244','111111',0,'2019-10-28 14:41:59','2019-10-30 19:59:34'),(2,'1111','222222',1,'2019-10-30 06:46:17',NULL);

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Price` decimal(18,2) NOT NULL,
  `Author` varchar(32) NOT NULL,
  `MakeSource` varchar(255) NOT NULL,
  `BookCategoryId` varchar(128) NOT NULL,
  `Inventory` int(11) NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `IsSoldOut` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedDate` datetime NOT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `book` */

insert  into `book`(`Id`,`Name`,`Price`,`Author`,`MakeSource`,`BookCategoryId`,`Inventory`,`IsDeleted`,`IsSoldOut`,`CreatedDate`,`UpdatedDate`) values (1,'ES 6标准入门','69.00','阮一峰','人民报社出版社','1',5,0,0,'2018-10-05 00:00:00',NULL),(3,'ES 6标准入门','69.00','阮一峰','人民报社出版社','1',5,0,0,'2018-10-05 00:00:00',NULL),(4,'测试图书','12.34','TEST','TEST','2',22,0,1,'2019-10-29 10:00:00','2019-10-30 20:19:52'),(5,'string','48.00','string','string','1',512,1,1,'2019-10-29 10:00:00','2019-10-30 20:14:07'),(6,'javascript','80.00','Zero','Zero','1',60,0,1,'2019-10-30 20:23:22','2019-10-30 20:23:30');

/*Table structure for table `bookcategory` */

DROP TABLE IF EXISTS `bookcategory`;

CREATE TABLE `bookcategory` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(32) NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedDate` datetime NOT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `bookcategory` */

insert  into `bookcategory`(`Id`,`Name`,`IsDeleted`,`CreatedDate`,`UpdatedDate`) values (1,'前端开发',0,'0000-00-00 00:00:00',NULL),(2,'后端开发',0,'0000-00-00 00:00:00',NULL);

/*Table structure for table `borrowlog` */

DROP TABLE IF EXISTS `borrowlog`;

CREATE TABLE `borrowlog` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `bookId` int(11) NOT NULL,
  `adminId` int(11) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `borrowlog` */

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(32) NOT NULL,
  `Age` int(11) NOT NULL,
  `Sex` varchar(8) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `member` */

insert  into `member`(`Id`,`Name`,`Age`,`Sex`,`CreatedDate`,`UpdatedDate`) values (1,'哇哈哈',18,'男','2019-10-29 11:00:00',NULL);

/*Table structure for table `setting` */

DROP TABLE IF EXISTS `setting`;

CREATE TABLE `setting` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `BorrowTime` datetime NOT NULL,
  `ReturnTime` datetime NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `setting` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

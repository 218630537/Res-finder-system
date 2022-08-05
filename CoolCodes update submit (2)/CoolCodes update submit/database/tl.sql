/*
SQLyog Community Edition- MySQL GUI v5.22a
Host - 5.5.5-10.4.16-MariaDB : Database - coolcodes
*********************************************************************
Server version : 5.5.5-10.4.16-MariaDB
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `coolcodes`;

USE `coolcodes`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `application` */

DROP TABLE IF EXISTS `application`;

CREATE TABLE `application` (
  `applicationID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `iDNumber` varchar(13) DEFAULT NULL,
  `year` varchar(5) DEFAULT NULL,
  `residentID` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  PRIMARY KEY (`applicationID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

/*Data for the table `application` */

insert  into `application`(`applicationID`,`iDNumber`,`year`,`residentID`,`status`) values (0000000001,'9901206208087','2022','1001','Approved'),(0000000002,'9901206208087','2023','1001','Pending'),(0000000009,'9701306208087','2024','1004','Rejected'),(0000000010,'9701306208087','2022','1001','Pending'),(0000000011,'9701306208087','2022','1003','Pending'),(0000000012,'9701306208087','2026','1003','Approved'),(0000000013,'9703186208087','2022','1002','Pending');

/*Table structure for table `institution` */

DROP TABLE IF EXISTS `institution`;

CREATE TABLE `institution` (
  `institutionID` int(5) NOT NULL AUTO_INCREMENT,
  `institutionName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`institutionID`)
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=utf8mb4;

/*Data for the table `institution` */

insert  into `institution`(`institutionID`,`institutionName`) values (1001,'TUT'),(1002,'UJ'),(1003,'VAAL'),(1004,'DUT');

/*Table structure for table `resident` */

DROP TABLE IF EXISTS `resident`;

CREATE TABLE `resident` (
  `residentID` int(5) NOT NULL AUTO_INCREMENT,
  `residentName` varchar(50) DEFAULT NULL,
  `institutionID` varchar(5) DEFAULT NULL,
  `locationCity` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`residentID`)
) ENGINE=InnoDB AUTO_INCREMENT=1013 DEFAULT CHARSET=utf8mb4;

/*Data for the table `resident` */

insert  into `resident`(`residentID`,`residentName`,`institutionID`,`locationCity`) values (1001,'YEYE','1001','emalahleni'),(1002,'CBD Joburg','1002','Joburg'),(1003,'Sosha South','1001','PTA'),(1004,'Mbombela Ress','1001','MBL'),(1005,'Mabalaleng','1001','emalahleni');

/*Table structure for table `town` */

DROP TABLE IF EXISTS `town`;

CREATE TABLE `town` (
  `TownID` int(5) DEFAULT NULL,
  `TownName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `town` */

insert  into `town`(`TownID`,`TownName`) values (1001,'MBL'),(1002,'Joburg'),(1003,'PTA'),(1004,'emalahleni');

/*Table structure for table `usertable` */

DROP TABLE IF EXISTS `usertable`;

CREATE TABLE `usertable` (
  `name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `iDNumber` varchar(13) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `studentNumber` varchar(10) DEFAULT NULL,
  `InstitutionID` varchar(50) DEFAULT NULL,
  `cellNumber` varchar(10) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`iDNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `usertable` */

insert  into `usertable`(`name`,`surname`,`iDNumber`,`email`,`studentNumber`,`InstitutionID`,`cellNumber`,`password`) values ('Charles','Chilaule','9701306208087','MCHINGISI@GMAIL.COM','216491580','1001','0721510080','11111'),('Phathu','Hlayisi','9703186208087','PHATHU@GMAIL.COM','217491580','1002','0136997231','11111'),('Bongani','Chilaule','9901206208087','MCHINGI@GMAIL.COM','216491580','1003','0721510080','12345');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

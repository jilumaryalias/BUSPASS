/*
SQLyog Community v13.1.1 (64 bit)
MySQL - 10.1.34-MariaDB : Database - bus_pass2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bus_pass2` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `bus_pass2`;

/*Table structure for table `bus` */

DROP TABLE IF EXISTS `bus`;

CREATE TABLE `bus` (
  `bus_id` int(11) NOT NULL AUTO_INCREMENT,
  `reg_no` varchar(200) NOT NULL,
  `driver` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `manufacturer_year` varchar(200) NOT NULL,
  `model` varchar(200) NOT NULL,
  `no_of_seats` varchar(200) NOT NULL,
  `route_id` int(11) NOT NULL,
  PRIMARY KEY (`bus_id`),
  KEY `route_id` (`route_id`),
  CONSTRAINT `route_id` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `bus` */

insert  into `bus`(`bus_id`,`reg_no`,`driver`,`phone`,`manufacturer_year`,`model`,`no_of_seats`,`route_id`) values 
(4,'KL 63 5653','Solomon','9632587412','2013','TATA 346EJ','39',3);

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `feedback` */

insert  into `feedback`(`feedback_id`,`user_id`,`description`,`date`,`status`) values 
(2,2,'i need to change the time.','12 dec 2012','pending'),
(3,3,'is very helpful','12 dec 2013','pending'),
(4,3,'better to avoid kalamasery-vytilla route due to less no of students','12-nov 2018','pending'),
(5,12,'Hdhjd','2018-11-14','sent');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` varchar(200) NOT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`type`) values 
(2,'raju133','raju','user'),
(3,'admin','admin','admin'),
(4,'shalu','shalu','user'),
(5,'raju222','raju','user'),
(6,'jj','jj','user_pending'),
(19,'Asdfghj','Asdfghj','user'),
(22,'Raju','Raju','user'),
(23,'Anu','Anu','user');

/*Table structure for table `new_passenger_request` */

DROP TABLE IF EXISTS `new_passenger_request`;

CREATE TABLE `new_passenger_request` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `date` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `route_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`request_id`),
  KEY `user_id` (`user_id`),
  KEY `route_id` (`route_id`),
  CONSTRAINT `new_passenger_request_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `new_passenger_request_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `new_passenger_request` */

insert  into `new_passenger_request`(`request_id`,`user_id`,`date`,`status`,`route_id`) values 
(3,3,'20 nov 2017','Pass Rejected',3),
(6,12,'2018-11-14','Pass Approved & payment pending',3),
(11,13,'2018-11-15','Pass Approved & payment pending',3);

/*Table structure for table `pass` */

DROP TABLE IF EXISTS `pass`;

CREATE TABLE `pass` (
  `pass_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `issue_adte` varchar(200) DEFAULT NULL,
  `valid_till` varchar(200) DEFAULT NULL,
  `request_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`pass_id`),
  KEY `user_id` (`user_id`),
  KEY `request_id` (`request_id`),
  CONSTRAINT `pass_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `pass_ibfk_4` FOREIGN KEY (`request_id`) REFERENCES `new_passenger_request` (`request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `pass` */

insert  into `pass`(`pass_id`,`user_id`,`issue_adte`,`valid_till`,`request_id`) values 
(2,2,'12-dec-2012','17-dec-2020',3),
(3,3,'12-dec-2012','2103-04-04',3),
(13,12,'2018-11-14','2017-05-14',6),
(14,13,'0','2018-05-15',11),
(15,13,'2018-11-15','2019-05-15',11);

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `pass_id` int(11) DEFAULT NULL,
  `amount` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `user_id` (`user_id`,`pass_id`),
  KEY `pass_id` (`pass_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`pass_id`) REFERENCES `pass` (`pass_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `payment` */

insert  into `payment`(`payment_id`,`user_id`,`pass_id`,`amount`,`status`) values 
(1,2,3,'300','paid'),
(2,3,2,'540','pending'),
(8,12,13,'1200','payment success'),
(9,13,14,'1200','payment success'),
(10,13,15,'1200','payment success');

/*Table structure for table `renewal_request` */

DROP TABLE IF EXISTS `renewal_request`;

CREATE TABLE `renewal_request` (
  `renewal_request` int(11) NOT NULL AUTO_INCREMENT,
  `pass_id` int(11) DEFAULT NULL,
  `date` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`renewal_request`),
  KEY `pass_id` (`pass_id`),
  KEY `route_id` (`route_id`),
  CONSTRAINT `pass_id` FOREIGN KEY (`pass_id`) REFERENCES `pass` (`pass_id`),
  CONSTRAINT `renewal_request_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

/*Data for the table `renewal_request` */

insert  into `renewal_request`(`renewal_request`,`pass_id`,`date`,`status`,`route_id`) values 
(26,13,'2018-11-15','Pass Approved & payment pending',NULL);

/*Table structure for table `route` */

DROP TABLE IF EXISTS `route`;

CREATE TABLE `route` (
  `route_id` int(11) NOT NULL AUTO_INCREMENT,
  `route_name` varchar(200) NOT NULL,
  `start_place` varchar(200) NOT NULL,
  `ending_place` varchar(200) NOT NULL,
  `other_details` varchar(200) NOT NULL,
  `stop_details` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `route` */

insert  into `route`(`route_id`,`route_name`,`start_place`,`ending_place`,`other_details`,`stop_details`) values 
(3,'kalamassery-thripunithura','kalamassery','thripunithura','8am - 9am','k-bjsdv'),
(5,'Kottyam-pala','pala','pala','kckecle','kalamassery-comapnipady-muttom-edapally-pipeline-puthiyaroad-vytilla-thripunithura-ayurveda college.');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `course` varchar(200) NOT NULL,
  `batch` varchar(200) NOT NULL,
  `gender` varchar(200) NOT NULL,
  `dob` varchar(200) NOT NULL,
  `house_name` varchar(200) NOT NULL,
  `place` varchar(200) NOT NULL,
  `pincode` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `parent_name` varchar(200) NOT NULL,
  `parent_phone` varchar(200) NOT NULL,
  `login_id` int(11) DEFAULT NULL,
  `profile_picture` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `login_id` (`login_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`login_id`) REFERENCES `login` (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`user_id`,`first_name`,`last_name`,`course`,`batch`,`gender`,`dob`,`house_name`,`place`,`pincode`,`phone`,`email`,`parent_name`,`parent_phone`,`login_id`,`profile_picture`) values 
(2,'Rajesh','G','MCA','2rd SEM','Male','19-12-1993','pekkattil','kottayam','785214','96325874125','r@','glarance','7412589633',2,'s1.jpg'),
(3,'Shalu','mol','b-tech','2nd sem','female','12-12-12','pekkattil','kottayam','965823','96582334534','s@','babu','9856321447',4,'s2.jpg'),
(4,'Rajesh','G','CS','1st sem','male','12-12-12','pekkattil','idukki','963258','9874563210','e@r','g','9874563210',5,'s3.jpg'),
(12,'Rajesh','G','Msc','1ST year','12/19/1994','Pekkattil','Idukki','Idukki','654333','09876543213','H@gma','Gl','987654322555',22,'14_11_2018_09_53_11.jpg'),
(13,'Anu','Siddara','Bca','1SEM','12-12-1993','Pekkattil','Idukki','Idukki','987655','0987654321','F@gmail.com','Gl','9776562667728',23,'15_11_2018_02_05_37.jpg');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- MySQL dump 10.10
--
-- Host: localhost    Database: acesys
-- ------------------------------------------------------
-- Server version	5.0.18-nt

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `mailtb`
--

DROP TABLE IF EXISTS `mailtb`;
CREATE TABLE `mailtb` (
  `mid` int(11) NOT NULL auto_increment,
  `fromaddress` varchar(35) default NULL,
  `frompassword` varchar(20) default NULL,
  `toaddress` varchar(35) default NULL,
  `temp1` varchar(100) default NULL,
  `temp2` varchar(100) default NULL,
  `temp3` varchar(100) default NULL,
  `temp4` varchar(100) default NULL,
  PRIMARY KEY  (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `mailtb`
--


/*!40000 ALTER TABLE `mailtb` DISABLE KEYS */;
LOCK TABLES `mailtb` WRITE;
INSERT INTO `mailtb` VALUES (1,'lixing051116@163.com','C2008119521','goodluckily@163.com','','','','');
UNLOCK TABLES;
/*!40000 ALTER TABLE `mailtb` ENABLE KEYS */;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `id` int(11) NOT NULL auto_increment,
  `orderid` int(11) default NULL,
  `pid` int(11) default NULL,
  `quantity` varchar(50) default NULL,
  `temp1` varchar(100) default NULL,
  `temp2` varchar(100) default NULL,
  `temp3` varchar(100) default NULL,
  `temp4` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `orderitem`
--


/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
LOCK TABLES `orderitem` WRITE;
INSERT INTO `orderitem` VALUES (2,13,1,'6',NULL,NULL,NULL,NULL),(4,14,1,'4',NULL,NULL,NULL,NULL),(5,15,4,'45g',NULL,NULL,NULL,NULL),(6,16,1,'10g',NULL,NULL,NULL,NULL),(7,16,7,'null',NULL,NULL,NULL,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orderid` int(11) NOT NULL auto_increment,
  `uid` int(11) default NULL,
  `temp1` varchar(100) default NULL,
  `temp2` varchar(100) default NULL,
  `temp3` varchar(100) default NULL,
  `temp4` varchar(100) default NULL,
  `datetime` varchar(45) default NULL,
  `delsoft` varchar(2) default NULL,
  PRIMARY KEY  (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `orders`
--


/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
LOCK TABLES `orders` WRITE;
INSERT INTO `orders` VALUES (13,2,NULL,NULL,NULL,NULL,'2008-12-16 08:20:32','1'),(14,2,NULL,NULL,NULL,NULL,'2008-12-26 02:10:12','1'),(15,2,NULL,NULL,NULL,NULL,'2009-03-06 12:02:01','1'),(16,3,NULL,NULL,NULL,NULL,'2011-07-12 09:42:10','1');
UNLOCK TABLES;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pid` int(11) NOT NULL auto_increment,
  `product_id` varchar(32) default NULL,
  `catalogno` varchar(32) default NULL,
  `cas` varchar(32) default NULL,
  `productname` varchar(64) default NULL,
  `structure` varchar(64) default NULL,
  `mdlnumber` varchar(64) default NULL,
  `formula` varchar(32) default NULL,
  `mw` varchar(32) default NULL,
  `price1` varchar(32) default NULL,
  `price2` varchar(32) default NULL,
  `stock` varchar(32) default NULL,
  `realstock` varchar(32) default NULL,
  `newproduct` varchar(32) default NULL,
  `category` varchar(32) default NULL,
  `note` varchar(32) default NULL,
  `del_flag` int(11) default NULL,
  `temp1` varchar(100) default NULL,
  `temp2` varchar(100) default NULL,
  `temp3` varchar(100) default NULL,
  `temp4` varchar(100) default NULL,
  PRIMARY KEY  (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `product`
--


/*!40000 ALTER TABLE `product` DISABLE KEYS */;
LOCK TABLES `product` WRITE;
INSERT INTO `product` VALUES (1,'001','西药','Lixing','2008-11-28','23007.gif','ss','技术类','23007.gif','45','45','100','45','null','西药',NULL,1,NULL,NULL,NULL,NULL),(4,'004','生化药','lixin','2007-2-1','23007.gif','ee','技术类','23007.gif','24','78','100','75','含光盘','生化药',NULL,1,NULL,NULL,NULL,NULL),(5,'005','保健','lixin','2007-7-1','23007.gif','dd','技术类','23007.gif','38','99','120','100','750分钟的java核心技术','保健药',NULL,1,NULL,NULL,NULL,NULL),(7,'008','维生素','LiangLInxin','2006-5-8','23007.gif','dd','技术类','23007.gif','97','101','520','120','','维生素',NULL,1,NULL,NULL,NULL,NULL),(8,'006','西药','dd','2008-12-16','23007.gif','null','ss','Woa24.jpg','45','67','14','4','null','西药','',1,NULL,NULL,NULL,NULL),(10,'009','aaaaa','s','uuu','23007.gif','ddd','ss','3','55','445','3','4','0','维生素','3',1,NULL,NULL,NULL,NULL),(11,'aa','aa','34','tt','23007.gif','5','e','343','34','34','43','34','0','维生素','34',1,NULL,NULL,NULL,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

--
-- Table structure for table `productuser`
--

DROP TABLE IF EXISTS `productuser`;
CREATE TABLE `productuser` (
  `uid` int(11) NOT NULL auto_increment,
  `username` varchar(32) default NULL,
  `password` varchar(32) default NULL,
  `companyname` varchar(32) default NULL,
  `city` varchar(32) default NULL,
  `job` varchar(32) default NULL,
  `tel` varchar(32) default NULL,
  `email` varchar(32) default NULL,
  `country` varchar(32) default NULL,
  `zip` varchar(32) default NULL,
  `companyaddress` varchar(32) default NULL,
  `superuser` varchar(16) default NULL,
  `note` varchar(32) default NULL,
  `fullname` varchar(32) default NULL,
  `title` varchar(32) default NULL,
  `del_flag` int(11) default NULL,
  `temp1` varchar(100) default NULL,
  `temp2` varchar(100) default NULL,
  `temp3` varchar(100) default NULL,
  `temp4` varchar(100) default NULL,
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `productuser`
--


/*!40000 ALTER TABLE `productuser` DISABLE KEYS */;
LOCK TABLES `productuser` WRITE;
INSERT INTO `productuser` VALUES (1,'admin','123456','aa','aa','aa','135','22','aa','aa','aa','3','aa','aa','aa',1,NULL,NULL,NULL,NULL),(2,'lixing','lixing','ascent','','','123456','lixing@163.com','','','ascent','1','','','',1,NULL,NULL,NULL,NULL),(3,'ascent','ascent','','','','123456','lixing@163.com','','','','1','','','',1,NULL,NULL,NULL,NULL),(4,'shang','shang','ascent','beijing','','1213','lixing051116@163.com','','100085','','1','   ','dfdf','',1,NULL,NULL,NULL,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `productuser` ENABLE KEYS */;

--
-- Table structure for table `user_product`
--

DROP TABLE IF EXISTS `user_product`;
CREATE TABLE `user_product` (
  `user_product_id` int(11) NOT NULL auto_increment,
  `uid` int(11) default NULL,
  `pid` int(11) default NULL,
  PRIMARY KEY  (`user_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `user_product`
--


/*!40000 ALTER TABLE `user_product` DISABLE KEYS */;
LOCK TABLES `user_product` WRITE;
INSERT INTO `user_product` VALUES (1,4,1),(2,4,2),(3,4,3),(4,4,4),(5,4,6),(6,4,7),(7,4,174),(8,4,175),(9,5,175),(10,5,176),(11,5,177);
UNLOCK TABLES;
/*!40000 ALTER TABLE `user_product` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


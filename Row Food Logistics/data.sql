CREATE DATABASE  IF NOT EXISTS `rfl` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `rfl`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: rfl
-- ------------------------------------------------------
-- Server version	5.1.58-community

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
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idname` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `device` varchar(45) DEFAULT NULL,
  `tons` varchar(45) DEFAULT NULL,
  `remain` varchar(45) DEFAULT NULL,
  `standard` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (1,'KD01','1','D','4','5','1'),(3,'AB02','1','F','3','5','1'),(4,'AB001','2','D','4','5','1'),(9,'CCCC','2','F','3','5','1');
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_name` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `client_name` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `cnumber` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'博世','2','赵婷','123','1234','12345','123456','1234567'),(2,'飞利浦','1','婷婷','123','1234','12345','123456','1234567'),(3,'大众','2','小明','123','1234','1111','2222','4123sfsdf'),(4,'谷歌','2','王二麻','123','111','22','333','aslfjla');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `tem` varchar(45) DEFAULT NULL,
  `humidity` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,'冻结牛肉','-11.1~-9.4','90-95'),(2,'冻蛋','-12.2~-9.4','60');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line`
--

DROP TABLE IF EXISTS `line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idname` varchar(45) DEFAULT NULL,
  `lines` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line`
--

LOCK TABLES `line` WRITE;
/*!40000 ALTER TABLE `line` DISABLE KEYS */;
INSERT INTO `line` VALUES (1,'aaa','南京-苏州','1','1'),(2,'BBB','南京-苏州','2','2'),(3,'ccc','南京-常州','2','3');
/*!40000 ALTER TABLE `line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,'abc','123');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise1` varchar(45) DEFAULT NULL,
  `name1` varchar(45) DEFAULT NULL,
  `phone1` varchar(45) DEFAULT NULL,
  `email1` varchar(45) DEFAULT NULL,
  `address1` varchar(45) DEFAULT NULL,
  `name2` varchar(45) DEFAULT NULL,
  `phone2` varchar(45) DEFAULT NULL,
  `email2` varchar(45) DEFAULT NULL,
  `address2` varchar(45) DEFAULT NULL,
  `goods_name` varchar(45) DEFAULT NULL,
  `goods_weight` varchar(45) DEFAULT NULL,
  `goods_tem` varchar(45) DEFAULT NULL,
  `goods_time` varchar(45) DEFAULT NULL,
  `line` varchar(45) DEFAULT NULL,
  `review` varchar(45) DEFAULT '0',
  `plan` varchar(45) DEFAULT '0',
  `status` varchar(45) DEFAULT '0',
  `finish` varchar(45) DEFAULT '0',
  `receive` varchar(45) DEFAULT '0',
  `carid` varchar(45) DEFAULT NULL,
  `carname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'博世','李红',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','D','1','南京-苏州','0','0','0','0','0','0','0'),(2,'飞利浦','张三',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2','D','2','南京-苏州','0','0','0','0','0','0','0'),(7,'一帆风顺','刘帆','123','123','南京师范大学','赵婷','456','456','苏州园区','冻蛋','3','F','3','南京-苏州','0','0','0','0','0','0','0'),(8,'丰田','李四','13','3','3','3','3','3','3','冻结牛肉','4','D','4','南京-苏州','0','0','0','0','0','0','0'),(9,'谷歌','王二麻','111','22','333','库里','1423','@qq.com','金州','冻结牛肉','2','D','2','南京-苏州','0','0','0','0','0',NULL,NULL);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-02  8:57:36

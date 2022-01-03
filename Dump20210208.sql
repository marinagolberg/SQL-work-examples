-- MySQL dump 10.13  Distrib 5.7.33, for Linux (x86_64)
--
-- Host: localhost    Database: CIND110_Assigment1
-- ------------------------------------------------------
-- Server version	5.7.33-0ubuntu0.16.04.1

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
-- Table structure for table `Contracts`
--

DROP TABLE IF EXISTS `Contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Contracts` (
  `contract_id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`contract_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contracts`
--

LOCK TABLES `Contracts` WRITE;
/*!40000 ALTER TABLE `Contracts` DISABLE KEYS */;
INSERT INTO `Contracts` VALUES (1,'2018-10-18','2020-10-18','Contract between Investors and FA...'),(2,'2013-10-01','2020-05-10','Contract between Investors and FA...'),(3,'2015-11-20','2022-10-12','Contract between Investors and FA will be ended on..');
/*!40000 ALTER TABLE `Contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Exchange`
--

DROP TABLE IF EXISTS `Exchange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Exchange` (
  `exchenge_id` int(11) NOT NULL,
  `exchenge_name` varchar(45) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(45) DEFAULT NULL,
  `post_code` int(11) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `phone_no` varchar(45) NOT NULL,
  `currency` char(3) NOT NULL,
  `Financial_Securities_FS_FS_id` int(11) NOT NULL,
  PRIMARY KEY (`exchenge_id`),
  KEY `fk_Exchange_Financial_Securities_FS1_idx` (`Financial_Securities_FS_FS_id`),
  CONSTRAINT `fk_Exchange_Financial_Securities_FS1` FOREIGN KEY (`Financial_Securities_FS_FS_id`) REFERENCES `Financial_Securities_FS` (`FS_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Exchange`
--

LOCK TABLES `Exchange` WRITE;
/*!40000 ALTER TABLE `Exchange` DISABLE KEYS */;
INSERT INTO `Exchange` VALUES (12564,'New York Stock','11 Wall St','New York, NY',10005,'United States','12126563000','USD',1),(25896,'Toronto Stock Exchenge','130 King St W','Toronto, ON',52321,'Canada','4169474700','CAD',2),(32145,'Italian Stock Exchenge','pza degli Affari 6','Milano, MI',20123,'Italy','3902724261','EUR',3);
/*!40000 ALTER TABLE `Exchange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Exchange_has_Financial_Security_Issuers_FSI`
--

DROP TABLE IF EXISTS `Exchange_has_Financial_Security_Issuers_FSI`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Exchange_has_Financial_Security_Issuers_FSI` (
  `Exchange_exchenge_id` int(11) NOT NULL,
  `Financial_Security_Issuers_FSI_FSI_id` int(11) NOT NULL,
  `Contracts_contract_id` int(11) NOT NULL,
  PRIMARY KEY (`Exchange_exchenge_id`,`Financial_Security_Issuers_FSI_FSI_id`),
  KEY `fk_Exchange_has_Financial_Security_Issuers_FSI_Financial_Se_idx` (`Financial_Security_Issuers_FSI_FSI_id`),
  KEY `fk_Exchange_has_Financial_Security_Issuers_FSI_Exchange1_idx` (`Exchange_exchenge_id`),
  KEY `fk_Exchange_has_Financial_Security_Issuers_FSI_Contracts1_idx` (`Contracts_contract_id`),
  CONSTRAINT `fk_Exchange_has_Financial_Security_Issuers_FSI_Contracts1` FOREIGN KEY (`Contracts_contract_id`) REFERENCES `Contracts` (`contract_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Exchange_has_Financial_Security_Issuers_FSI_Exchange1` FOREIGN KEY (`Exchange_exchenge_id`) REFERENCES `Exchange` (`exchenge_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Exchange_has_Financial_Security_Issuers_FSI_Financial_Secu1` FOREIGN KEY (`Financial_Security_Issuers_FSI_FSI_id`) REFERENCES `Financial_Security_Issuers_FSI` (`FSI_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Exchange_has_Financial_Security_Issuers_FSI`
--

LOCK TABLES `Exchange_has_Financial_Security_Issuers_FSI` WRITE;
/*!40000 ALTER TABLE `Exchange_has_Financial_Security_Issuers_FSI` DISABLE KEYS */;
INSERT INTO `Exchange_has_Financial_Security_Issuers_FSI` VALUES (12564,1254,1),(25896,1285,2),(32145,2548,3);
/*!40000 ALTER TABLE `Exchange_has_Financial_Security_Issuers_FSI` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FA_securities_proposal`
--

DROP TABLE IF EXISTS `FA_securities_proposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FA_securities_proposal` (
  `proposal_id` int(11) NOT NULL AUTO_INCREMENT,
  `proposal_date` date NOT NULL,
  `quantity` int(11) NOT NULL,
  `investors_SIN` int(11) NOT NULL,
  `FA_SIN` int(11) NOT NULL,
  `FS_id` int(11) NOT NULL,
  PRIMARY KEY (`proposal_id`,`investors_SIN`,`FA_SIN`,`FS_id`),
  KEY `fk_FA  securities  proposal_Investors1_idx` (`investors_SIN`),
  CONSTRAINT `fk_FA  securities  proposal_Investors1` FOREIGN KEY (`investors_SIN`) REFERENCES `Investors` (`investors_SIN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FA_securities_proposal`
--

LOCK TABLES `FA_securities_proposal` WRITE;
/*!40000 ALTER TABLE `FA_securities_proposal` DISABLE KEYS */;
INSERT INTO `FA_securities_proposal` VALUES (1,'2018-10-17',100,123451478,154789654,1),(2,'2013-10-01',1000,123453658,258963246,2),(3,'2015-11-19',50,123456789,321654781,3);
/*!40000 ALTER TABLE `FA_securities_proposal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Financial_Advisers_FA`
--

DROP TABLE IF EXISTS `Financial_Advisers_FA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Financial_Advisers_FA` (
  `FA_SIN` varchar(45) NOT NULL,
  `FA_specialty` varchar(45) NOT NULL,
  `FA_years_experience` int(11) NOT NULL,
  `FA_name` varchar(45) NOT NULL,
  `Investors_investors_SIN` int(11) NOT NULL,
  PRIMARY KEY (`FA_SIN`),
  KEY `fk_Financial_Advisers_FA_Investors1_idx` (`Investors_investors_SIN`),
  CONSTRAINT `fk_Financial_Advisers_FA_Investors1` FOREIGN KEY (`Investors_investors_SIN`) REFERENCES `Investors` (`investors_SIN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Financial_Advisers_FA`
--

LOCK TABLES `Financial_Advisers_FA` WRITE;
/*!40000 ALTER TABLE `Financial_Advisers_FA` DISABLE KEYS */;
INSERT INTO `Financial_Advisers_FA` VALUES ('154789654','Financial Planer',8,'Jhone Smit',123451478),('258963246','Senior Financial Advidor',15,'Ella Smit',123453658),('321654781','Asset Manager',2,'Julia Weber',123456789);
/*!40000 ALTER TABLE `Financial_Advisers_FA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Financial_Securities_FS`
--

DROP TABLE IF EXISTS `Financial_Securities_FS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Financial_Securities_FS` (
  `FS_id` int(11) NOT NULL AUTO_INCREMENT,
  `trade_name` varchar(45) NOT NULL,
  `FS_date` date NOT NULL,
  `symbol_id` varchar(45) NOT NULL,
  PRIMARY KEY (`FS_id`),
  UNIQUE KEY `symbol_id_UNIQUE` (`symbol_id`),
  UNIQUE KEY `trade_name_UNIQUE` (`trade_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Financial_Securities_FS`
--

LOCK TABLES `Financial_Securities_FS` WRITE;
/*!40000 ALTER TABLE `Financial_Securities_FS` DISABLE KEYS */;
INSERT INTO `Financial_Securities_FS` VALUES (1,'IBM','2018-10-18','12546'),(2,'BMO','2013-10-01','8952'),(3,'Microsoft','2015-11-20','2564');
/*!40000 ALTER TABLE `Financial_Securities_FS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Financial_Security_Issuers_FSI`
--

DROP TABLE IF EXISTS `Financial_Security_Issuers_FSI`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Financial_Security_Issuers_FSI` (
  `trade_name` varchar(45) NOT NULL,
  `FSI_id` int(11) NOT NULL,
  `phone_no` varchar(45) NOT NULL,
  PRIMARY KEY (`FSI_id`),
  UNIQUE KEY `trade_name_UNIQUE` (`trade_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Financial_Security_Issuers_FSI`
--

LOCK TABLES `Financial_Security_Issuers_FSI` WRITE;
/*!40000 ALTER TABLE `Financial_Security_Issuers_FSI` DISABLE KEYS */;
INSERT INTO `Financial_Security_Issuers_FSI` VALUES ('IBM',1254,'12132563000'),('BMO',1285,'41694748890'),('Microsoft',2548,'12132563214');
/*!40000 ALTER TABLE `Financial_Security_Issuers_FSI` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Financial_Security_Issuers_FSI_has_Financial_Securities_FS`
--

DROP TABLE IF EXISTS `Financial_Security_Issuers_FSI_has_Financial_Securities_FS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Financial_Security_Issuers_FSI_has_Financial_Securities_FS` (
  `Financial_Security_Issuers_FSI_FSI_id` int(11) NOT NULL,
  `Financial_Securities_FS_FS_id` int(11) NOT NULL,
  PRIMARY KEY (`Financial_Security_Issuers_FSI_FSI_id`,`Financial_Securities_FS_FS_id`),
  KEY `fk_Financial_Security_Issuers_FSI_has_Financial_Securities__idx` (`Financial_Securities_FS_FS_id`),
  KEY `fk_Financial_Security_Issuers_FSI_has_Financial_Securities__idx1` (`Financial_Security_Issuers_FSI_FSI_id`),
  CONSTRAINT `fk_Financial_Security_Issuers_FSI_has_Financial_Securities_FS1` FOREIGN KEY (`Financial_Security_Issuers_FSI_FSI_id`) REFERENCES `Financial_Security_Issuers_FSI` (`FSI_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Financial_Security_Issuers_FSI_has_Financial_Securities_FS2` FOREIGN KEY (`Financial_Securities_FS_FS_id`) REFERENCES `Financial_Securities_FS` (`FS_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Financial_Security_Issuers_FSI_has_Financial_Securities_FS`
--

LOCK TABLES `Financial_Security_Issuers_FSI_has_Financial_Securities_FS` WRITE;
/*!40000 ALTER TABLE `Financial_Security_Issuers_FSI_has_Financial_Securities_FS` DISABLE KEYS */;
INSERT INTO `Financial_Security_Issuers_FSI_has_Financial_Securities_FS` VALUES (1254,1),(1285,2),(2548,3);
/*!40000 ALTER TABLE `Financial_Security_Issuers_FSI_has_Financial_Securities_FS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Investors`
--

DROP TABLE IF EXISTS `Investors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Investors` (
  `investors_SIN` int(11) NOT NULL,
  `investors_name` varchar(45) NOT NULL,
  `addresses` varchar(255) NOT NULL,
  `city` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `post_code` int(11) NOT NULL,
  `investors_age` varchar(45) NOT NULL,
  PRIMARY KEY (`investors_SIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Investors`
--

LOCK TABLES `Investors` WRITE;
/*!40000 ALTER TABLE `Investors` DISABLE KEYS */;
INSERT INTO `Investors` VALUES (123451478,'Marina','12 Weber St','Toronto, ON','Canada',25879,'47'),(123453658,'Shawn','10 Devenport Rd','Waterloo, ON','Canada',52584,'55'),(123456789,'Marina','100 Maple Grow Rd','Cambridge, ON','Canada',52864,'35');
/*!40000 ALTER TABLE `Investors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recomm_text`
--

DROP TABLE IF EXISTS `Recomm_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Recomm_text` (
  `Recomm_text_id` int(11) NOT NULL AUTO_INCREMENT,
  `FA_securities_proposal_proposal_id` int(11) NOT NULL,
  `FA_securities_proposal_investors_SIN` int(11) NOT NULL,
  `FA_securities_proposal_FA_SIN` int(11) NOT NULL,
  `FA_securities_proposal_FS_id` int(11) NOT NULL,
  PRIMARY KEY (`Recomm_text_id`),
  KEY `fk_Recomm_text_FA_securities_proposal1_idx` (`FA_securities_proposal_proposal_id`,`FA_securities_proposal_investors_SIN`,`FA_securities_proposal_FA_SIN`,`FA_securities_proposal_FS_id`),
  CONSTRAINT `fk_Recomm_text_FA_securities_proposal1` FOREIGN KEY (`FA_securities_proposal_proposal_id`, `FA_securities_proposal_investors_SIN`, `FA_securities_proposal_FA_SIN`, `FA_securities_proposal_FS_id`) REFERENCES `FA_securities_proposal` (`proposal_id`, `investors_SIN`, `FA_SIN`, `FS_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recomm_text`
--

LOCK TABLES `Recomm_text` WRITE;
/*!40000 ALTER TABLE `Recomm_text` DISABLE KEYS */;
INSERT INTO `Recomm_text` VALUES (1,1,123451478,154789654,1),(2,2,123453658,258963246,2),(3,3,123456789,321654781,3);
/*!40000 ALTER TABLE `Recomm_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Securities_price`
--

DROP TABLE IF EXISTS `Securities_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Securities_price` (
  `securities_price_id` int(11) NOT NULL AUTO_INCREMENT,
  `price` int(11) NOT NULL,
  `currency` char(3) NOT NULL,
  `exchenge_id` int(11) NOT NULL,
  PRIMARY KEY (`securities_price_id`,`exchenge_id`),
  KEY `fk_Securities_price_Exchange1_idx` (`exchenge_id`),
  CONSTRAINT `fk_Securities_price_Exchange1` FOREIGN KEY (`exchenge_id`) REFERENCES `Exchange` (`exchenge_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Securities_price`
--

LOCK TABLES `Securities_price` WRITE;
/*!40000 ALTER TABLE `Securities_price` DISABLE KEYS */;
INSERT INTO `Securities_price` VALUES (1,25,'USD',12564),(2,40,'CAD',25896),(3,98,'CAD',32145);
/*!40000 ALTER TABLE `Securities_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'CIND110_Assigment1'
--

--
-- Dumping routines for database 'CIND110_Assigment1'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-08 15:21:31

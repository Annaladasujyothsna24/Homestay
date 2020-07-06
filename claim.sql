-- MySQL dump 10.13  Distrib 5.5.28, for Win32 (x86)
--
-- Host: localhost    Database: claim
-- ------------------------------------------------------
-- Server version	5.5.28

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `userid` varchar(15) DEFAULT NULL,
  `password` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin','admin');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claimrequest`
--

DROP TABLE IF EXISTS `claimrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claimrequest` (
  `uid` varchar(40) NOT NULL DEFAULT '',
  `cid` varchar(30) NOT NULL DEFAULT '',
  `claimtype` varchar(50) DEFAULT NULL,
  `pid` varchar(30) DEFAULT NULL,
  `amount` varchar(40) DEFAULT NULL,
  `cdate` varchar(30) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `processeddate` date DEFAULT NULL,
  PRIMARY KEY (`uid`,`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claimrequest`
--

LOCK TABLES `claimrequest` WRITE;
/*!40000 ALTER TABLE `claimrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `claimrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cus_doc`
--

DROP TABLE IF EXISTS `cus_doc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cus_doc` (
  `uid` varchar(40) DEFAULT NULL,
  `id` varchar(100) DEFAULT NULL,
  `dri_li` varchar(100) DEFAULT NULL,
  `policy` varchar(100) DEFAULT NULL,
  `bill` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cus_doc`
--

LOCK TABLES `cus_doc` WRITE;
/*!40000 ALTER TABLE `cus_doc` DISABLE KEYS */;
/*!40000 ALTER TABLE `cus_doc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `uid` varchar(40) DEFAULT NULL,
  `feedback` varchar(100) DEFAULT NULL,
  `question` varchar(100) DEFAULT NULL,
  `answer` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan`
--

DROP TABLE IF EXISTS `plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan` (
  `pid` varchar(40) DEFAULT NULL,
  `pname` varchar(50) DEFAULT NULL,
  `pdate` date DEFAULT NULL,
  `amt` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan`
--

LOCK TABLES `plan` WRITE;
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
INSERT INTO `plan` VALUES ('38281','Natural Disaster Insurance','2020-05-01','22000'),('80356','Vehicle Insurance','2019-01-10','100000'),('80779','Health Insurance','2018-01-30','200000'),('92649','Home Owner Insurance','2015-06-01','78000'),('94643','Life Insurance','2010-01-01','150000');
/*!40000 ALTER TABLE `plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_reg`
--

DROP TABLE IF EXISTS `plan_reg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_reg` (
  `userid` varchar(40) DEFAULT NULL,
  `planid` varchar(40) DEFAULT NULL,
  `type` varchar(40) DEFAULT NULL,
  `startdate` varchar(30) DEFAULT NULL,
  `enddate` varchar(30) DEFAULT NULL,
  `amount` varchar(30) DEFAULT NULL,
  `regdate` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_reg`
--

LOCK TABLES `plan_reg` WRITE;
/*!40000 ALTER TABLE `plan_reg` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_reg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reg`
--

DROP TABLE IF EXISTS `reg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reg` (
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `dob` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `userid` varchar(25) NOT NULL,
  `password` varchar(15) DEFAULT NULL,
  `usertype` varchar(30) DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `petname` varchar(40) DEFAULT NULL,
  `fschoolname` varchar(50) DEFAULT NULL,
  `fdish` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reg`
--

LOCK TABLES `reg` WRITE;
/*!40000 ALTER TABLE `reg` DISABLE KEYS */;
INSERT INTO `reg` VALUES ('Vamsi','Krishna','1994-06-08','Male','9876543210','022923','1234@asd','Member','waiting','vamsi@gmail.com','ram','Sanskrti','fish'),('Rama','Krishna','1994-10-12','Male','7890654321','059196','1234@asd','Member','Approved','rama@gmail.com','ram','Sanskrti','fish'),('Seetha','Sri','1996-06-05','Female','8890654333','196065','1234@asd','Member','Approved','seetha@gmail.com','pandu','ZPH','Pizza'),('Radha','D','1994-06-11','Female','7777654333','242455','1234@asd','Member','Rejected','radha@gmail.com','Bhujji','SRV nikethan','Dosa'),('krishna','Kanth','1993-06-11','Male','8974563214','727770','1234@asd','Member','waiting','krishna@gmail.com','Nani','PSR','IceCream');
/*!40000 ALTER TABLE `reg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `techissue`
--

DROP TABLE IF EXISTS `techissue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `techissue` (
  `uid` varchar(40) DEFAULT NULL,
  `issue` varchar(100) DEFAULT NULL,
  `answer` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `techissue`
--

LOCK TABLES `techissue` WRITE;
/*!40000 ALTER TABLE `techissue` DISABLE KEYS */;
/*!40000 ALTER TABLE `techissue` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-02 11:29:16

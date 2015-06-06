-- MySQL dump 10.13  Distrib 5.6.20, for Win64 (x86_64)
--
-- Host: localhost    Database: dbtest
-- ------------------------------------------------------
-- Server version	5.6.20

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
-- Table structure for table `myclass`
--

DROP TABLE IF EXISTS `myclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myclass` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` char(20) NOT NULL,
  `sex` int(4) NOT NULL DEFAULT '0',
  `degree` double(16,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myclass`
--

LOCK TABLES `myclass` WRITE;
/*!40000 ALTER TABLE `myclass` DISABLE KEYS */;
INSERT INTO `myclass` VALUES (1,'name1',1,1.00),(2,'name1',1,1.00),(3,'name1',1,1.00),(14,'name1',1,1.00),(15,'name1',1,1.00),(16,'name1',1,1.00),(17,'name1',1,1.00);
/*!40000 ALTER TABLE `myclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_authority_menu`
--

DROP TABLE IF EXISTS `t_authority_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_authority_menu` (
  `FID` varchar(50) NOT NULL,
  `FParentID` varchar(50) NOT NULL,
  `FIncreaseID` int(11) NOT NULL AUTO_INCREMENT,
  `FMenuName` varchar(50) NOT NULL DEFAULT '0',
  `FURL` varchar(200) DEFAULT NULL,
  `FIcon` varchar(200) DEFAULT NULL,
  `FAuthorityVal` bigint(20) NOT NULL,
  `FSysID` int(11) NOT NULL,
  `FCreateUser` varchar(50) DEFAULT NULL,
  `FCreateTime` timestamp NULL DEFAULT NULL,
  `FModifyUser` varchar(50) DEFAULT NULL,
  `FModifyTime` timestamp NULL DEFAULT NULL,
  `FLevel` int(11) DEFAULT NULL,
  `FType` int(11) DEFAULT NULL,
  `FState` int(11) DEFAULT NULL,
  `FIsDeleted` bit(1) DEFAULT NULL,
  `FIsFixed` bit(1) DEFAULT NULL,
  `FDescription` varchar(500) DEFAULT NULL,
  KEY `FIncreaseID` (`FIncreaseID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_authority_menu`
--

LOCK TABLES `t_authority_menu` WRITE;
/*!40000 ALTER TABLE `t_authority_menu` DISABLE KEYS */;
INSERT INTO `t_authority_menu` VALUES ('2eb25d74-4ddc-4e23-9e54-01bb27a70672','00000000-0000-0000-0000-000000000000',8,'Êù®ÊÑè‰πâ123','22111','22',12,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'22'),('c380a718-5e0b-492f-b5fb-e8c098937ff4','70d21ae6-3835-4dbc-92eb-3fc2a9235ff3',11,'23232','ÈóÆÈóÆ','‰øÑÊñá',111,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'‰øÑÊñá'),('131e626a-8916-48da-9906-7d527494d975','6806dc10-080f-4df6-8a52-cf728cde2886',15,'111','22','222',12,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'1'),('bfcee6f3-6be3-4d2a-a054-53e2bf720042','c380a718-5e0b-492f-b5fb-e8c098937ff4',16,'11','22','22',15,1,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,'2'),('c8155606-e437-41e4-8863-98eb71c0dd14','c380a718-5e0b-492f-b5fb-e8c098937ff4',17,'www','ww','22',1,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'1'),('70318c0d-3014-455e-a8fa-282a83566c63','826962b8-cb56-47ec-b2f2-45e5e69d9889',19,'111','11','1',8,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'1'),('a664a272-b847-4a85-bf03-c1ec74e70825','',20,'ÂñÇÂñÇÂñÇÂñÇÂñÇÂñÇ','11','11',15,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'1'),('90c996ab-c803-498c-ae06-250cdc24ec76','',21,'11111111111111','111','111111',12,1,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,'11'),('303f15b1-4332-4b62-abf0-36cd10a38e2b','131e626a-8916-48da-9906-7d527494d975',22,'111‚Äî‚Äî1','111','111',8,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'111'),('b7bfe7c0-b3e0-4e17-9398-b8a3220bb2e0','a664a272-b847-4a85-bf03-c1ec74e70825',23,'111','11','11',14,1,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,'11'),('fc9d62ea-81dd-45b2-a7a2-c90a093f0995','bb860c91-a8ad-4806-bce9-a7b26e78d5f5',25,'222','11','11',15,1,NULL,NULL,NULL,NULL,22,NULL,NULL,NULL,NULL,'2'),('e2fa12a8-30cf-4beb-9327-04150124b055','fc9d62ea-81dd-45b2-a7a2-c90a093f0995',26,'333333','333333333','',0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),('042b4ff0-83b3-4868-9a0d-29696f0e269a','',27,'Âï™Âï™Âï™Âï™Âï™Âï™','iii','uuu',15,1,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,'kkkk'),('531e835d-f663-4438-9fd0-ac600abed9e9','042b4ff0-83b3-4868-9a0d-29696f0e269a',28,'0000','ii','111',8,1,NULL,NULL,NULL,NULL,22,NULL,NULL,NULL,NULL,'11'),('878a18b4-bdba-478b-a8ad-2f9cb65313c0','00000000-0000-0000-0000-000000000000',29,'ppppppp','111','111',7,1,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,'11'),('5a8b76a8-441c-4b8a-8898-d81d59a2d119','',31,'111111111111','#','1',12,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),('8cca6ac4-2b52-41a9-b057-a09189bc6beb','6806dc10-080f-4df6-8a52-cf728cde2886',32,'1111111111','1','1',15,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),('62a5b892-2f83-4756-bfc0-91e7f75fb262','',33,'ÂàÜÈîÄÂïÜÁÆ°ÁêÜ','#','1',15,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'1'),('9e835716-7197-4e94-b557-8b7dfba7836c','62a5b892-2f83-4756-bfc0-91e7f75fb262',34,'‰∏ÄÁ∫ßÂàÜÈîÄÂïÜ','#','`',15,1,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,'2'),('c8dcb429-f7b8-446e-bc1f-370591b32d88','9e835716-7197-4e94-b557-8b7dfba7836c',35,'‰∫åÁ∫ßÂàÜÈîÄÂïÜ','2','2',15,1,NULL,NULL,NULL,NULL,22,NULL,NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `t_authority_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_authority_resval`
--

DROP TABLE IF EXISTS `t_authority_resval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_authority_resval` (
  `FID` varchar(50) DEFAULT NULL,
  `FName` varchar(50) DEFAULT NULL,
  `FSysID` int(11) DEFAULT NULL,
  `FVal` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_authority_resval`
--

LOCK TABLES `t_authority_resval` WRITE;
/*!40000 ALTER TABLE `t_authority_resval` DISABLE KEYS */;
INSERT INTO `t_authority_resval` VALUES ('a6621e18-2f27-11e4-a366-00ffc5cf07b8','Êñ∞Â¢û',1,1),('acdfe14a-2f27-11e4-a366-00ffc5cf07b8','‰øÆÊîπ',1,2),('b39ac086-2f27-11e4-a366-00ffc5cf07b8','Âà†Èô§',1,4),('bd38bd66-2f27-11e4-a366-00ffc5cf07b8','Êü•Áúã',1,8);
/*!40000 ALTER TABLE `t_authority_resval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_authority_rolemenu`
--

DROP TABLE IF EXISTS `t_authority_rolemenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_authority_rolemenu` (
  `FID` char(36) NOT NULL,
  `FRoleID` char(36) NOT NULL,
  `FMenuID` char(36) NOT NULL,
  `FAuthVal` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_authority_rolemenu`
--

LOCK TABLES `t_authority_rolemenu` WRITE;
/*!40000 ALTER TABLE `t_authority_rolemenu` DISABLE KEYS */;
INSERT INTO `t_authority_rolemenu` VALUES ('b0d7bef7-2417-489b-b786-3d130d0cf847','1439e843-6c6d-4367-af4a-90ed1aa217bb','2eb25d74-4ddc-4e23-9e54-01bb27a70672',4),('33a5ea92-921b-4705-9ef0-50e17f38374c','1439e843-6c6d-4367-af4a-90ed1aa217bb','2eb25d74-4ddc-4e23-9e54-01bb27a70672',8),('1251ea03-b928-4535-8ccc-e0f6dadf1567','9b0ee3af-8950-42b6-beec-e6f221508195','878a18b4-bdba-478b-a8ad-2f9cb65313c0',1),('172d5325-e71b-4bb3-8c39-20d12bad6622','9b0ee3af-8950-42b6-beec-e6f221508195','878a18b4-bdba-478b-a8ad-2f9cb65313c0',2),('59b432b5-a53d-41db-843d-dac57cf321bc','9b0ee3af-8950-42b6-beec-e6f221508195','878a18b4-bdba-478b-a8ad-2f9cb65313c0',4),('5b2849f2-efd5-48ea-8c4e-fee490c5d6dc','9b0ee3af-8950-42b6-beec-e6f221508195','878a18b4-bdba-478b-a8ad-2f9cb65313c0',8),('799aedcf-44e5-4b45-b399-5fda6778b225','9b0ee3af-8950-42b6-beec-e6f221508195','2eb25d74-4ddc-4e23-9e54-01bb27a70672',4),('df3c9709-e941-4a39-b887-a455113eda53','9b0ee3af-8950-42b6-beec-e6f221508195','2eb25d74-4ddc-4e23-9e54-01bb27a70672',8),('0278271c-996d-4960-8bc0-7bb1a2386499','a327ee1f-16fa-437e-bf95-18b8d258a160','878a18b4-bdba-478b-a8ad-2f9cb65313c0',1),('a677b0fb-7502-4a68-976b-a9775a7502f0','a327ee1f-16fa-437e-bf95-18b8d258a160','878a18b4-bdba-478b-a8ad-2f9cb65313c0',2),('5c147b6d-0cb4-490e-a919-6eb19a49e1fb','a327ee1f-16fa-437e-bf95-18b8d258a160','878a18b4-bdba-478b-a8ad-2f9cb65313c0',4),('aa065a1d-f11c-4ee2-a46c-1b848490cdc5','a327ee1f-16fa-437e-bf95-18b8d258a160','878a18b4-bdba-478b-a8ad-2f9cb65313c0',8),('8623a672-63cf-4825-ab72-2b4f41768b79','a327ee1f-16fa-437e-bf95-18b8d258a160','2eb25d74-4ddc-4e23-9e54-01bb27a70672',4),('e7994a6c-2227-4153-86b4-d7f56664a0c5','a327ee1f-16fa-437e-bf95-18b8d258a160','2eb25d74-4ddc-4e23-9e54-01bb27a70672',8),('699b3eec-6e24-45ab-8298-7f2c79db58fb','6f0fcf56-c0ae-4eb3-b606-81ff5e560122','878a18b4-bdba-478b-a8ad-2f9cb65313c0',7),('bd4afa54-3132-45cd-90c1-cfa9e9fc4da1','6f0fcf56-c0ae-4eb3-b606-81ff5e560122','2eb25d74-4ddc-4e23-9e54-01bb27a70672',12),('d63dabdb-4772-4581-b91b-67f59bd87734','21753ccb-0077-4248-b5f8-1f30f00eafc9','878a18b4-bdba-478b-a8ad-2f9cb65313c0',7),('441e15d4-516e-48b3-826a-626783140ace','21753ccb-0077-4248-b5f8-1f30f00eafc9','2eb25d74-4ddc-4e23-9e54-01bb27a70672',12),('9f3dbbf8-89b8-4578-ab1c-5a5526a2247a','21753ccb-0077-4248-b5f8-1f30f00eafc9','c380a718-5e0b-492f-b5fb-e8c098937ff4',15),('d8d55aed-aedf-439c-a71f-a84c4653b669','21753ccb-0077-4248-b5f8-1f30f00eafc9','70318c0d-3014-455e-a8fa-282a83566c63',8),('18ae1fa1-4df6-4da9-a25b-8806059126bc','21753ccb-0077-4248-b5f8-1f30f00eafc9','131e626a-8916-48da-9906-7d527494d975',12),('bc116e7c-6818-4cf7-a6b6-ce3ffda41962','21753ccb-0077-4248-b5f8-1f30f00eafc9','b7bfe7c0-b3e0-4e17-9398-b8a3220bb2e0',14),('1c24f8a2-0126-4103-baec-b2ed5d2dfc53','21753ccb-0077-4248-b5f8-1f30f00eafc9','531e835d-f663-4438-9fd0-ac600abed9e9',8);
/*!40000 ALTER TABLE `t_authority_rolemenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_authority_roles`
--

DROP TABLE IF EXISTS `t_authority_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_authority_roles` (
  `FID` char(36) NOT NULL,
  `FIncreaseID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FRoleName` varchar(50) DEFAULT '0',
  `FOrder` int(11) DEFAULT '0',
  `FDescription` varchar(500) DEFAULT '0',
  `FCreateUser` varchar(500) DEFAULT '0',
  `FCreateTime` time DEFAULT '00:00:00',
  `FUpdateUser` varchar(50) DEFAULT '0',
  `FUpdateTime` varchar(50) DEFAULT '0',
  `FIsDelete` bit(1) DEFAULT b'0',
  `FIsFixed` bit(1) DEFAULT b'0',
  KEY `FIncreaseID` (`FIncreaseID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_authority_roles`
--

LOCK TABLES `t_authority_roles` WRITE;
/*!40000 ALTER TABLE `t_authority_roles` DISABLE KEYS */;
INSERT INTO `t_authority_roles` VALUES ('fabf3df5-0ef0-40db-b507-c28157ea20ec',6,'ÈóÆÈóÆ',NULL,'eee',NULL,NULL,NULL,NULL,NULL,NULL),('4dc0f3a2-79d9-4b65-87d3-9b30de6f1bbd',8,'ÂæóÂæóÂæó',NULL,'ÂæóÂæóÂæóÈ¢ù',NULL,NULL,NULL,NULL,NULL,NULL),('c4db82a7-db48-407f-8863-856668c4d2e8',9,'ÂæóÂæóÂæó',NULL,'ÂæóÂæóÂæóÈ¢ù',NULL,NULL,NULL,NULL,NULL,NULL),('56aa4da5-0b3d-4144-9552-a29096e74051',10,'ÂæóÂæóÂæó',NULL,'ÂæóÂæóÂæóÈ¢ù',NULL,NULL,NULL,NULL,NULL,NULL),('64e8d4fb-8b64-42fc-b4be-60e11a2a7727',11,'ÂæóÂæóÂæó',NULL,'ÂæóÂæóÂæóÈ¢ù',NULL,NULL,NULL,NULL,NULL,NULL),('8b47699a-164d-4ca5-8e89-7eb602ad596d',17,'ppp',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL),('c58184f5-81f2-462f-b2d9-b336a402c7e8',18,'ppp',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL),('037dfdaf-2e1e-42a4-a863-45a205e807db',19,'oo',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL),('1604ac2e-beb6-4a2f-9f92-e8d6e8e94226',20,'oo',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL),('222a2f06-d24d-41b2-8543-ca188f4120a5',22,'2222',NULL,'222222222',NULL,NULL,NULL,NULL,NULL,NULL),('41488120-5e7d-440c-9748-271a2a3d70b1',23,'wwwwwwww',NULL,'11111111',NULL,NULL,NULL,NULL,NULL,NULL),('ce88e895-3d5b-4b89-8a10-534b67664870',24,'wwwwwwww',NULL,'11111111',NULL,NULL,NULL,NULL,NULL,NULL),('2b0dfb42-924c-40d0-b8ec-f8bd16e0895c',25,'wwwwwwww',NULL,'11111111',NULL,NULL,NULL,NULL,NULL,NULL),('3923e0d6-b989-4cdc-9ea0-00f9b959b8a0',26,'wwwwwwww',NULL,'11111111',NULL,NULL,NULL,NULL,NULL,NULL),('f8ac2140-6935-4f56-af41-8b6338d999c1',27,'wwwwwwww',NULL,'11111111',NULL,NULL,NULL,NULL,NULL,NULL),('1439e843-6c6d-4367-af4a-90ed1aa217bb',28,'111111',NULL,'11111',NULL,NULL,NULL,NULL,NULL,NULL),('9b0ee3af-8950-42b6-beec-e6f221508195',29,'111111',NULL,'111113333',NULL,NULL,NULL,NULL,NULL,NULL),('a327ee1f-16fa-437e-bf95-18b8d258a160',30,'2',NULL,'222222222222',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `t_authority_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_authority_users`
--

DROP TABLE IF EXISTS `t_authority_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_authority_users` (
  `FID` char(36) NOT NULL,
  `FIncreaseID` bigint(20) NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) DEFAULT NULL,
  `FPwd` varchar(50) DEFAULT NULL,
  `FMobile` varchar(50) DEFAULT NULL,
  `FEmail` varchar(50) DEFAULT NULL,
  `FAdress` varchar(200) DEFAULT NULL,
  `FDescription` mediumtext,
  `FCreateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `FIncreaseID` (`FIncreaseID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_authority_users`
--

LOCK TABLES `t_authority_users` WRITE;
/*!40000 ALTER TABLE `t_authority_users` DISABLE KEYS */;
INSERT INTO `t_authority_users` VALUES ('3c2f36ed-9a5d-45a1-97c9-025c2da3891e',1,'Âì¶Âè£Âè£','qqqqq','q','q','q','q','2015-05-11 14:09:28'),('c2493a3e-fa4a-4647-af3c-59a1e54a1b49',2,'dd','222','ww????ÈóÆÈóÆ','111','??','???','2015-05-11 14:20:39'),('5de3093e-747f-4452-a4db-7b973987d61d',3,'ÁüõÂÆ∂ÂÖ∑ÂÆ∂Áîµ','11','22','11','2','22','2015-05-15 06:51:40'),('990b5ee0-5d5b-4f33-a920-3f51daac3327',4,'11','11','2','2','3','33','2015-05-24 02:17:32');
/*!40000 ALTER TABLE `t_authority_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_scm_distributors`
--

DROP TABLE IF EXISTS `t_scm_distributors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_scm_distributors` (
  `FDistributorID` varchar(50) NOT NULL COMMENT '÷˜º¸£¨∑÷œ˙…ÃID',
  `FParentID` varchar(50) DEFAULT NULL COMMENT '…œº∂∑÷œ˙…ÃID',
  `FIncreaseID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'µ›‘ˆ¡–',
  `FIntroducer` varchar(50) DEFAULT NULL COMMENT 'ΩÈ…‹»ÀID',
  `FIntroerType` int(11) DEFAULT NULL COMMENT 'ΩÈ…‹»À¿‡±',
  `FName` varchar(100) DEFAULT NULL COMMENT '∑÷œ˙…Ã√˚≥∆',
  `FPhone` varchar(20) DEFAULT NULL COMMENT '¡™œµµÁª∞',
  `FMobile` varchar(50) DEFAULT NULL COMMENT '¡™œµ ÷ª˙',
  `FAddress` varchar(150) DEFAULT NULL COMMENT '¡™œµµÿ÷∑',
  `FZipCode` varchar(20) DEFAULT NULL COMMENT '” ±‡',
  `fsex` int(11) DEFAULT NULL,
  `FBirthday` datetime DEFAULT NULL COMMENT '≥ˆ…˙»’∆⁄',
  `FWeight` int(11) DEFAULT NULL COMMENT 'ÃÂ÷ÿkg',
  `FHeight` int(11) DEFAULT NULL COMMENT '…Ì∏ﬂcm',
  `FRemark` varchar(1000) DEFAULT NULL COMMENT '±∏◊¢',
  `FPicture` varchar(100) DEFAULT NULL COMMENT '’’∆¨',
  `FRelativeURL` varchar(200) DEFAULT NULL COMMENT 'œ‡πÿÕ¯÷∑',
  `FRank` int(11) DEFAULT NULL COMMENT '»®÷ÿ',
  `FOrder` int(11) DEFAULT NULL COMMENT '≈≈–Ú',
  `FAddTime` datetime DEFAULT NULL COMMENT '¥¥Ω® ±º‰',
  `FUpdateTime` datetime DEFAULT NULL COMMENT '–ﬁ∏ƒ ±º‰',
  PRIMARY KEY (`FDistributorID`),
  KEY `AK_Key_2` (`FIncreaseID`)
) ENGINE=InnoDB AUTO_INCREMENT=111132 DEFAULT CHARSET=utf8 COMMENT='∑÷œ˙…Ã';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_scm_distributors`
--

LOCK TABLES `t_scm_distributors` WRITE;
/*!40000 ALTER TABLE `t_scm_distributors` DISABLE KEYS */;
INSERT INTO `t_scm_distributors` VALUES ('03ed9cbd-f79e-40ac-aeb5-5dca69db024a','',111129,NULL,NULL,'121','010-13394343','13612456789','','',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'2015-05-31 18:29:50','2015-05-31 18:32:39'),('084920c3-a547-4418-ae56-65e95aa1a6d0','11',11,'',11,'11111111','11','1','1','',NULL,NULL,NULL,NULL,'','','',NULL,NULL,'2015-05-27 14:28:53','2015-05-27 14:28:53'),('1201fef7-6691-4d80-904f-9281e18a5268','1',1,'1',1,'222eee','','','','',NULL,NULL,NULL,NULL,'','','',NULL,NULL,NULL,NULL),('193842d2-a3b7-4f73-8885-306e738cf873','193842d2-a3b7-4f73-8885-306e738cf873',111115,'1',NULL,'111111111w','1','1','1','1',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,'2015-05-28 10:09:28','2015-05-28 10:09:28'),('2ad1ff31-29b4-4875-9190-3d80e46c68c4','2ad1ff31-29b4-4875-9190-3d80e46c68c4',1,'2',NULL,'sssss111','','','','',NULL,NULL,NULL,NULL,'','','',NULL,NULL,NULL,NULL),('3ac0f685-abdc-469d-857f-766512a662fb','',13,'',1,'www','1','','','',NULL,NULL,NULL,NULL,'','','',NULL,NULL,NULL,NULL),('5755d070-4019-4b52-bfda-51961ab36b95','e6c7a528-45ab-49d7-bb3e-bc738a0d7729',111114,'1',NULL,'ÁÅåÁÅåÁÅåÁÅåÁÅå','020-1234593','13824578901','','',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'2015-05-27 18:18:54','2015-05-31 16:24:02'),('70927c23-aa6f-48c0-9382-0e6ca4fef4a7','',1,'1',1,'12222iiii','','','','',NULL,NULL,NULL,NULL,'','','',NULL,NULL,NULL,NULL),('7c6e068e-a938-4aae-af70-b16080784893','1',9,'',NULL,'2','','','','',NULL,NULL,NULL,NULL,'','','',NULL,NULL,NULL,NULL),('8b889605-419b-4678-9990-8eb86331597c','8b889605-419b-4678-9990-8eb86331597c',111116,'1',NULL,'1111222','11111','11','11','11',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'2015-05-28 10:10:06','2015-05-28 10:10:06'),('8db1a070-5e76-4b5a-a20d-6c3954247b43','e894c0cc-8898-4f1c-8577-3d42dfe9ba54',111121,'ÂàÜÈîÄÂïÜÂêçÁß∞:ÈóÆÈóÆ',NULL,'ÂàÜÈîÄÂïÜÂêçÁß∞:ÈóÆÈóÆ122','Â∫ßÊú∫','ÊâãÊú∫Ôºö:','ÊâãÊú∫Ôºö:','ÈÇÆÁºñ:',1,'2015-05-28 00:00:00',NULL,NULL,'Â§áÊ≥®:Â§áÊ≥®:Â§áÊ≥®:',NULL,NULL,NULL,NULL,'2015-05-30 18:34:33','2015-05-30 18:34:59'),('94f5abc4-1301-4c79-9aba-406eeb7566be','1',11,'2',1,'y','','','','',NULL,NULL,NULL,NULL,'','','',NULL,NULL,NULL,NULL),('97bb2e8f-673e-49e4-8548-e3b85357921c','97bb2e8f-673e-49e4-8548-e3b85357921c',111112,'1',NULL,'ssddd','11','11','','111',NULL,NULL,NULL,NULL,'11',NULL,NULL,NULL,NULL,'2015-05-27 18:18:00','2015-05-27 18:18:00'),('99c91ddc-6a33-480b-8c1f-a830e0df2bd4','e6c7a528-45ab-49d7-bb3e-bc738a0d7729',111117,'1',NULL,'ÂàÜÈîÄÂïÜÂêçÁß∞:','1','1','Âú∞ÂùÄ:','ÈÇÆÁºñ:',1,'2015-05-04 00:00:00',NULL,NULL,'111',NULL,NULL,NULL,NULL,'2015-05-28 10:12:33','2015-05-28 14:17:54'),('9a759842-ff13-48a1-b508-d9f6b753cf33','',5,'',NULL,'22','','','','',NULL,NULL,NULL,NULL,'','','',NULL,2,NULL,NULL),('9f646f27-5bf8-4cae-84b7-39d3c26ccf75','',6,'',NULL,'22','','','','',NULL,NULL,NULL,NULL,'','','',NULL,NULL,NULL,NULL),('a16fa1d3-d337-40a2-8140-d4796fb98962','12222222',8,'11',NULL,'222','','','','',NULL,NULL,NULL,NULL,'','','',NULL,NULL,NULL,NULL),('a58d0335-3251-499f-bbcd-817900b78323','1',10,'2',1,'y','','','','',NULL,NULL,NULL,NULL,'','','',NULL,NULL,NULL,NULL),('ab805e0d-f7fb-45b2-b5f7-9bf98123b189','dd3b2df5-62df-4f44-a95c-9e818978c2ec',111131,NULL,NULL,'12121000','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'2015-05-31 18:35:10','2015-05-31 18:35:10'),('b589fbc2-f874-48d0-9456-2c63149a996e','',4,'1',NULL,'11','','','','',NULL,NULL,NULL,NULL,'','','',NULL,NULL,NULL,NULL),('b8a300b1-eb55-438a-9319-baae290ed5dc','2',2,'2',NULL,'2','','','','',NULL,NULL,NULL,NULL,'','','',NULL,NULL,NULL,NULL),('bddea5c6-c735-4070-a71a-f2532224f489','bddea5c6-c735-4070-a71a-f2532224f489',111113,'1',NULL,'ÂÆûÊñΩ','','11','11','',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'2015-05-27 18:18:22','2015-05-27 18:18:22'),('c2dc6c47-42ff-40cb-b07f-b9cae92152a6','1',1,'1',NULL,'123','','','','',NULL,NULL,NULL,NULL,'','','',NULL,NULL,NULL,NULL),('ccc8f1a7-6013-483e-a03c-0e8e42b1ac0f','',111130,NULL,NULL,'2132','','','','',1,'2015-05-05 00:00:00',NULL,NULL,'111',NULL,NULL,NULL,NULL,'2015-05-31 18:32:03','2015-05-31 18:32:29'),('d108d1c7-1c66-467a-9a8c-1e2d606cc43d','dae9af7a-16a0-4ece-941f-82ca61f10bbd',111128,NULL,NULL,'12121','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'2015-05-31 18:29:44','2015-05-31 18:29:44'),('dae9af7a-16a0-4ece-941f-82ca61f10bbd','dd3b2df5-62df-4f44-a95c-9e818978c2ec',111122,'fffeee333',NULL,'ÁöÑÂëÉÂëÉ','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'2015-05-31 00:04:16','2015-05-31 16:21:15'),('dd3b2df5-62df-4f44-a95c-9e818978c2ec','7c6e068e-a938-4aae-af70-b16080784893',111118,'2',NULL,'fffeee333','111','11','11','11',2,'2015-12-12 00:00:00',NULL,NULL,'Â§áÊ≥®:Â§áÊ≥®:Â§áÊ≥®:Â§áÊ≥®:',NULL,NULL,NULL,NULL,'2015-05-28 10:14:38','2015-05-28 14:05:53'),('e6c7a528-45ab-49d7-bb3e-bc738a0d7729','1',1,'1',1,'1','1','','1','',NULL,NULL,NULL,NULL,'','','',NULL,NULL,NULL,NULL),('e894c0cc-8898-4f1c-8577-3d42dfe9ba54','dbf3ae6b-09e4-43af-a383-3b134b54776a',111120,'11yyy',NULL,'ÂàÜÈîÄÂïÜÂêçÁß∞:ÈóÆÈóÆ','020-2120434','13416865416','11','535211',1,'2015-05-01 00:00:00',NULL,NULL,'111',NULL,NULL,NULL,NULL,'2015-05-28 14:07:23','2015-05-31 16:22:10'),('f3a39871-51fe-4146-ab1a-3cf6f34044a6','33',3,'',NULL,'3','3','3','3','',NULL,NULL,NULL,NULL,'','','',NULL,NULL,NULL,NULL),('f5835211-c957-460d-bee9-24fe8f602a3b','qq',2,'qq',NULL,'qq','','','','',NULL,NULL,NULL,NULL,'','','',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `t_scm_distributors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_scm_salesdata`
--

DROP TABLE IF EXISTS `t_scm_salesdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_scm_salesdata` (
  `FSaleDataID` varchar(50) NOT NULL COMMENT '÷˜º¸£¨Œ®“ªID',
  `FDistributorID` varchar(50) DEFAULT NULL COMMENT 'Õ‚º¸£¨∑÷œ˙…ÃID',
  `FIncreaseID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'µ›‘ˆ¡–',
  `FPrice` decimal(12,3) DEFAULT NULL COMMENT 'œ˙ €º€∏Ò',
  `FAmount` int(11) DEFAULT NULL COMMENT 'œ˙ € ˝¡ø',
  `FType` int(11) DEFAULT NULL COMMENT 'œ˙ €¿‡–Õ',
  `FDate` datetime DEFAULT NULL COMMENT 'œ˙ €»’∆⁄( ±º‰)',
  `FAddTime` datetime DEFAULT NULL COMMENT '¥¥Ω® ±º‰',
  `FUpdateTime` datetime DEFAULT NULL COMMENT '–ﬁ∏ƒ ±º‰',
  `fdistributor` varchar(255) DEFAULT NULL,
  `ftotal` decimal(19,2) DEFAULT NULL,
  `fsplit` decimal(19,2) DEFAULT NULL,
  `fsplittoal` decimal(19,2) DEFAULT NULL,
  `fintroducer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FSaleDataID`),
  KEY `AK_Key_2` (`FIncreaseID`),
  KEY `FK_Reference_distributor_saledata` (`FDistributorID`),
  CONSTRAINT `FK_Reference_distributor_saledata` FOREIGN KEY (`FDistributorID`) REFERENCES `t_scm_distributors` (`FDistributorID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='œ˙ € ˝æ›';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_scm_salesdata`
--

LOCK TABLES `t_scm_salesdata` WRITE;
/*!40000 ALTER TABLE `t_scm_salesdata` DISABLE KEYS */;
INSERT INTO `t_scm_salesdata` VALUES ('02cacb6b-a1b3-46a6-a06e-f4cab6efe3b2','8db1a070-5e76-4b5a-a20d-6c3954247b43',23,11.000,11,NULL,NULL,'2015-05-30 23:41:25','2015-05-30 23:41:39',NULL,NULL,NULL,NULL,NULL),('28b4f78b-11a8-4012-a44c-29e8bcadfa3c','99c91ddc-6a33-480b-8c1f-a830e0df2bd4',21,111.000,11,1,'2015-05-28 00:00:00','2015-05-30 23:34:16','2015-05-30 23:34:16',NULL,NULL,NULL,NULL,NULL),('41897cf9-292f-40a2-896e-e50b57a09147','5755d070-4019-4b52-bfda-51961ab36b95',11,1.000,11,1,'2015-05-21 00:00:00',NULL,'2015-05-30 22:52:31',NULL,NULL,NULL,NULL,NULL),('4d3eb508-a6f9-4561-9278-9abbda0f3054','dd3b2df5-62df-4f44-a95c-9e818978c2ec',14,112.990,22,2,'2015-05-13 00:00:00','2015-05-30 13:22:37','2015-05-30 13:22:37',NULL,NULL,NULL,NULL,NULL),('54a4190a-60c8-4bd0-a2e2-0a3574886746','03ed9cbd-f79e-40ac-aeb5-5dca69db024a',30,1212.000,11,1,'2015-05-21 00:00:00','2015-05-31 18:30:18','2015-05-31 18:30:18',NULL,NULL,NULL,NULL,NULL),('743783d5-db98-4014-9031-0ca4a7508564','e894c0cc-8898-4f1c-8577-3d42dfe9ba54',27,0.010,1,1,'2015-05-29 00:00:00','2015-05-30 23:56:49','2015-05-30 23:56:49',NULL,NULL,NULL,NULL,NULL),('7871d1c4-d291-4b13-8f1a-e679bb7dc9f1','e894c0cc-8898-4f1c-8577-3d42dfe9ba54',1,1.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('998841e1-1bf2-4949-b9fb-12481483c84e','dd3b2df5-62df-4f44-a95c-9e818978c2ec',1,1.200,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('b44ec3e9-bad9-485d-8958-28996519c5eb','dd3b2df5-62df-4f44-a95c-9e818978c2ec',12,11.000,NULL,1,'2015-05-27 00:00:00','2015-05-30 13:08:19','2015-05-30 13:49:34',NULL,NULL,NULL,NULL,NULL),('efc36978-d02e-4f00-a2bf-7ea0d1c8ba8e','e894c0cc-8898-4f1c-8577-3d42dfe9ba54',20,1.000,2,1,'2015-05-27 00:00:00','2015-05-30 23:33:50','2015-05-30 23:33:50',NULL,NULL,NULL,NULL,NULL),('ff9d1794-168d-40ec-8724-8ff25e334405','e894c0cc-8898-4f1c-8577-3d42dfe9ba54',26,0.110,0,2,'2015-05-20 00:00:00','2015-05-30 23:49:32','2015-05-30 23:49:32',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `t_scm_salesdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_scm_salesdivided`
--

DROP TABLE IF EXISTS `t_scm_salesdivided`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_scm_salesdivided` (
  `FDivided` varchar(50) NOT NULL COMMENT '÷˜º¸÷µ',
  `FSaleDataID` varchar(50) DEFAULT NULL COMMENT 'Õ‚º¸£¨salseID',
  `FIncreaseID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'µ›‘ˆ¡–',
  `FPercent` decimal(12,3) DEFAULT NULL,
  `FAmount` decimal(12,3) DEFAULT NULL COMMENT '∑÷≥…Ω∂Ó',
  `FDate` datetime DEFAULT NULL COMMENT '∑÷≥… ±º‰',
  `FAddTime` datetime DEFAULT NULL COMMENT '¬º»Î ±º‰',
  `FRemark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`FDivided`),
  KEY `AK_Key_2` (`FIncreaseID`),
  KEY `FK_Reference_2` (`FSaleDataID`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`FSaleDataID`) REFERENCES `t_scm_salesdata` (`FSaleDataID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_scm_salesdivided`
--

LOCK TABLES `t_scm_salesdivided` WRITE;
/*!40000 ALTER TABLE `t_scm_salesdivided` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_scm_salesdivided` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_users`
--

DROP TABLE IF EXISTS `t_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_users` (
  `FID` varchar(255) NOT NULL,
  `FName` varchar(255) DEFAULT NULL,
  `FPwd` varchar(255) DEFAULT NULL,
  `FMobile` varchar(255) DEFAULT NULL,
  `FEmail` varchar(255) DEFAULT NULL,
  `FAdress` varchar(255) DEFAULT NULL,
  `FDescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_users`
--

LOCK TABLES `t_users` WRITE;
/*!40000 ALTER TABLE `t_users` DISABLE KEYS */;
INSERT INTO `t_users` VALUES ('1f7e685f-2f95-408d-b4e3-8e3897bc5ea4','??','??','w','ww','ww','ww'),('a752980b-9c45-40a9-b835-3bd798de44c0','??','22','22','22','2','22');
/*!40000 ALTER TABLE `t_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-31 21:39:02

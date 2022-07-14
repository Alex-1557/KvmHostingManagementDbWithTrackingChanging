-- MariaDB dump 10.19  Distrib 10.5.9-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: 
-- ------------------------------------------------------
-- Server version	10.5.9-MariaDB-1:10.5.9+maria~xenial

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `KvmHostingManagement`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `KvmHostingManagement` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `KvmHostingManagement`;

--
-- Table structure for table `ArpScanVm`
--

DROP TABLE IF EXISTS `ArpScanVm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ArpScanVm` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `ToVm` int(11) DEFAULT NULL,
  `ToKvmBridge` int(11) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  KEY `LinkToKvmBridge6_idx` (`ToKvmBridge`),
  KEY `LinlkToVm6_idx` (`ToVm`),
  CONSTRAINT `LinkToKvmBridge6` FOREIGN KEY (`ToKvmBridge`) REFERENCES `KvmBridge` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `LinlkToVm6` FOREIGN KEY (`ToVm`) REFERENCES `VM` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='arp-scan startip endip';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`ArpScanVm_BEFORE_INSERT` BEFORE INSERT ON `ArpScanVm` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`ArpScanVm-Log`
(`i`,
`ToVm`,
`ToKvmBridge`,
`Comment`,
`LastUpdate`)
VALUES
(NEW.`i`,
NEW.`ToVm`,
NEW.`ToKvmBridge`,
'BEFORE INSERT',
now());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`ArpScanVm_BEFORE_UPDATE` BEFORE UPDATE ON `ArpScanVm` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`ArpScanVm-Log`
(`i`,
`ToVm`,
`ToKvmBridge`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`ToVm`,
OLD.`ToKvmBridge`,
'BEFORE UPDATE',
now());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`ArpScanVm_BEFORE_DELETE` BEFORE DELETE ON `ArpScanVm` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`ArpScanVm-Log`
(`i`,
`ToVm`,
`ToKvmBridge`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`ToVm`,
OLD.`ToKvmBridge`,
'BEFORE DELETE',
now());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ArpScanVm-Log`
--

DROP TABLE IF EXISTS `ArpScanVm-Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ArpScanVm-Log` (
  `j` int(11) NOT NULL AUTO_INCREMENT,
  `i` int(11) DEFAULT NULL,
  `ToVm` int(11) DEFAULT NULL,
  `ToKvmBridge` int(11) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`j`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BashJob`
--

DROP TABLE IF EXISTS `BashJob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BashJob` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `CrDate` datetime DEFAULT NULL,
  `toServer` int(11) DEFAULT NULL,
  `toVm` int(11) DEFAULT NULL,
  `SshDecryptPass` varchar(45) DEFAULT NULL,
  `toUser` int(11) DEFAULT NULL,
  `IsStarted` tinyint(4) DEFAULT NULL,
  `IsCompleted` tinyint(4) DEFAULT NULL,
  `IsBackendHubNotified` tinyint(4) DEFAULT NULL,
  `SubscribeId` varchar(45) DEFAULT NULL,
  `IsSubscriberNotified` tinyint(4) DEFAULT NULL,
  `IsSubscriberError` tinyint(4) DEFAULT NULL,
  `Command` varchar(1000) DEFAULT NULL,
  `Result` text DEFAULT NULL,
  `Error` text DEFAULT NULL,
  `Comment` varchar(45) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  KEY `linkToServer_idx` (`toServer`),
  KEY `linkToVm_idx` (`toVm`),
  KEY `linkToUser_idx` (`toUser`),
  CONSTRAINT `linkToServer` FOREIGN KEY (`toServer`) REFERENCES `KvmHost` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `linkToUser2` FOREIGN KEY (`toUser`) REFERENCES `User` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `linkToVm5` FOREIGN KEY (`toVm`) REFERENCES `VM` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`BashJob_BEFORE_INSERT` BEFORE INSERT ON `BashJob` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`BashJob-Log`
(`i`,
`CrDate`,
`toServer`,
`toVm`,
`SshDecryptPass`,
`toUser`,
`IsStarted`,
`IsCompleted`,
`IsBackendHubNotified`,
`SubscribeId`,
`IsSubscriberNotified`,
`IsSubscriberError`,
`Command`,
`Result`,
`Error`,
`Comment`,
`LastUpdate`)
VALUES
(NEW.`i`,
NEW.`CrDate`,
NEW.`toServer`,
NEW.`toVm`,
NEW.`SshDecryptPass`,
NEW.`toUser`,
NEW.`IsStarted`,
NEW.`IsCompleted`,
NEW.`IsBackendHubNotified`,
NEW.`SubscribeId`,
NEW.`IsSubscriberNotified`,
NEW.`IsSubscriberError`,
NEW.`Command`,
NEW.`Result`,
NEW.`Error`,
'BEFORE INSERT',
now());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`BashJob_BEFORE_UPDATE` BEFORE UPDATE ON `BashJob` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`BashJob-Log`
(`i`,
`CrDate`,
`toServer`,
`toVm`,
`SshDecryptPass`,
`toUser`,
`IsStarted`,
`IsCompleted`,
`IsBackendHubNotified`,
`SubscribeId`,
`IsSubscriberNotified`,
`IsSubscriberError`,
`Command`,
`Result`,
`Error`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`CrDate`,
OLD.`toServer`,
OLD.`toVm`,
OLD.`SshDecryptPass`,
OLD.`toUser`,
OLD.`IsStarted`,
OLD.`IsCompleted`,
OLD.`IsBackendHubNotified`,
OLD.`SubscribeId`,
OLD.`IsSubscriberNotified`,
OLD.`IsSubscriberError`,
OLD.`Command`,
OLD.`Result`,
OLD.`Error`,
'BEFORE UPDATE',
now());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`BashJob_BEFORE_DELETE` BEFORE DELETE ON `BashJob` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`BashJob-Log`
(`i`,
`CrDate`,
`toServer`,
`toVm`,
`SshDecryptPass`,
`toUser`,
`IsStarted`,
`IsCompleted`,
`IsBackendHubNotified`,
`SubscribeId`,
`IsSubscriberNotified`,
`IsSubscriberError`,
`Command`,
`Result`,
`Error`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`CrDate`,
OLD.`toServer`,
OLD.`toVm`,
OLD.`SshDecryptPass`,
OLD.`toUser`,
OLD.`IsStarted`,
OLD.`IsCompleted`,
OLD.`IsBackendHubNotified`,
OLD.`SubscribeId`,
OLD.`IsSubscriberNotified`,
OLD.`IsSubscriberError`,
OLD.`Command`,
OLD.`Result`,
OLD.`Error`,
'BEFORE DELETE',
now());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `BashJob-Log`
--

DROP TABLE IF EXISTS `BashJob-Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BashJob-Log` (
  `j` int(11) NOT NULL AUTO_INCREMENT,
  `i` int(11) NOT NULL,
  `CrDate` datetime DEFAULT NULL,
  `toServer` int(11) DEFAULT NULL,
  `toVm` int(11) DEFAULT NULL,
  `SshDecryptPass` varchar(45) DEFAULT NULL,
  `toUser` int(11) DEFAULT NULL,
  `IsStarted` tinyint(4) DEFAULT NULL,
  `IsCompleted` tinyint(4) DEFAULT NULL,
  `IsBackendHubNotified` tinyint(4) DEFAULT NULL,
  `SubscribeId` varchar(45) DEFAULT NULL,
  `IsSubscriberNotified` tinyint(4) DEFAULT NULL,
  `IsSubscriberError` tinyint(4) DEFAULT NULL,
  `Command` varchar(1000) DEFAULT NULL,
  `Result` text DEFAULT NULL,
  `Error` text DEFAULT NULL,
  `Comment` varchar(45) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`j`)
) ENGINE=InnoDB AUTO_INCREMENT=366 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Coin`
--

DROP TABLE IF EXISTS `Coin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Coin` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `CoinName` varchar(45) DEFAULT NULL,
  `Explorer` varchar(255) DEFAULT NULL,
  `ImageURL` varchar(200) DEFAULT NULL,
  `Base64EncodedImage` text DEFAULT NULL,
  `SourceURL` varchar(255) DEFAULT NULL,
  `AddNode` blob DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  UNIQUE KEY `CoinName_UNIQUE` (`CoinName`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`Coin_BEFORE_INSERT` BEFORE INSERT ON `Coin` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`Coin-Log`
(`i`,
`CoinName`,
`Explorer`,
`ImageURL`,
`Base64EncodedImage`,
`SourceURL`,
`AddNode`,
`Comment`,
`LastUpdate`)
VALUES
(NEW.`i`,
NEW.`CoinName`,
NEW.`Explorer`,
NEW.`ImageURL`,
NEW.`Base64EncodedImage`,
NEW.`SourceURL`,
NEW.`AddNode`,
'BEFORE INSERT',
now());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`Coin_BEFORE_UPDATE` BEFORE UPDATE ON `Coin` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`Coin-Log`
(`i`,
`CoinName`,
`Explorer`,
`ImageURL`,
`Base64EncodedImage`,
`SourceURL`,
`AddNode`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`CoinName`,
OLD.`Explorer`,
OLD.`ImageURL`,
OLD.`Base64EncodedImage`,
OLD.`SourceURL`,
OLD.`AddNode`,
'BEFORE UPDATE',
now());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`Coin_BEFORE_DELETE` BEFORE DELETE ON `Coin` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`Coin-Log`
(`i`,
`CoinName`,
`Explorer`,
`ImageURL`,
`Base64EncodedImage`,
`SourceURL`,
`AddNode`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`CoinName`,
OLD.`Explorer`,
OLD.`ImageURL`,
OLD.`Base64EncodedImage`,
OLD.`SourceURL`,
OLD.`AddNode`,
'BEFORE DELETE',
now());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Coin-Log`
--

DROP TABLE IF EXISTS `Coin-Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Coin-Log` (
  `j` int(11) NOT NULL AUTO_INCREMENT,
  `i` int(11) DEFAULT NULL,
  `CoinName` varchar(45) DEFAULT NULL,
  `Explorer` varchar(255) DEFAULT NULL,
  `ImageURL` varchar(200) DEFAULT NULL,
  `Base64EncodedImage` text DEFAULT NULL,
  `SourceURL` varchar(255) DEFAULT NULL,
  `AddNode` blob DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`j`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Container`
--

DROP TABLE IF EXISTS `Container`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Container` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `toDockerImage` int(11) DEFAULT NULL,
  `Id` varchar(255) DEFAULT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `ImageId` varchar(255) DEFAULT NULL,
  `Command` varchar(255) DEFAULT NULL,
  `Created` varchar(45) DEFAULT NULL,
  `State` varchar(255) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `AllNetworks` varchar(1255) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COMMENT='#sudo docker ps\nDocker.DotNet API';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`Container_BEFORE_INSERT` BEFORE INSERT ON `Container` FOR EACH ROW
BEGIN
    INSERT INTO `Container-Log`
    (`i`,
	`toDockerImage`,
	`Id`,
	`Image`,
	`ImageId`,
	`Command`,
	`Created`,
	`State`,
	`Status`,
	`AllNetworks`,
	`Comment`,
	`LastUpdate`)
    VALUES
    (NEW.`i`,
	NEW.`toDockerImage`,
	NEW.`Id`,
	NEW.`Image`,
	NEW.`ImageId`,
	NEW.`Command`,
	NEW.`Created`,
	NEW.`State`,
	NEW.`Status`,
	NEW.`AllNetworks`,
	'BEFORE INSERT',
	NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`Container_BEFORE_UPDATE` BEFORE UPDATE ON `Container` FOR EACH ROW
BEGIN
    INSERT INTO `Container-Log`
    (`i`,
	`toDockerImage`,
	`Id`,
	`Image`,
	`ImageId`,
	`Command`,
	`Created`,
	`State`,
	`Status`,
	`AllNetworks`,
	`Comment`,
	`LastUpdate`)
    VALUES
    (OLD.`i`,
	OLD.`toDockerImage`,
	OLD.`Id`,
	OLD.`Image`,
	OLD.`ImageId`,
	OLD.`Command`,
	OLD.`Created`,
	OLD.`State`,
	OLD.`Status`,
	OLD.`AllNetworks`,
	'BEFORE UPDATE',
	NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`Container_BEFORE_DELETE` BEFORE DELETE ON `Container` FOR EACH ROW
BEGIN
INSERT INTO `Container-Log`
    (`i`,
	`toDockerImage`,
	`Id`,
	`Image`,
	`ImageId`,
	`Command`,
	`Created`,
	`State`,
	`Status`,
	`AllNetworks`,
	`Comment`,
	`LastUpdate`)
    VALUES
    (OLD.`i`,
	OLD.`toDockerImage`,
	OLD.`Id`,
	OLD.`Image`,
	OLD.`ImageId`,
	OLD.`Command`,
	OLD.`Created`,
	OLD.`State`,
	OLD.`Status`,
	OLD.`AllNetworks`,
	'BEFORE DELETE',
	NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Container-Log`
--

DROP TABLE IF EXISTS `Container-Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Container-Log` (
  `j` int(11) NOT NULL AUTO_INCREMENT,
  `i` int(11) DEFAULT NULL,
  `toDockerImage` int(11) DEFAULT NULL,
  `Id` varchar(255) DEFAULT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `ImageId` varchar(255) DEFAULT NULL,
  `Command` varchar(255) DEFAULT NULL,
  `Created` varchar(45) DEFAULT NULL,
  `State` varchar(255) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `AllNetworks` varchar(1255) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`j`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ContainerIp`
--

DROP TABLE IF EXISTS `ContainerIp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ContainerIp` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `toContainer` int(11) DEFAULT NULL,
  `IP` varchar(45) DEFAULT NULL,
  `PrivatePort` varchar(45) DEFAULT NULL,
  `PublicPort` varchar(45) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  KEY `LinkToContainer4_idx` (`toContainer`),
  CONSTRAINT `LinkToContainer4` FOREIGN KEY (`toContainer`) REFERENCES `Container` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='Docker.DotNet API';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`ContainerIp_BEFORE_INSERT` BEFORE INSERT ON `ContainerIp` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`ContainerIp-Log`
(`i`,
`toContainer`,
`IP`,
`PrivatePort`,
`PublicPort`,
`Type`,
`Comment`,
`LastUpdate`)
VALUES
(NEW.`i`,
NEW.`toContainer`,
NEW.`IP`,
NEW.`PrivatePort`,
NEW.`PublicPort`,
NEW.`Type`,
'BEFORE INSERT',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`ContainerIp_BEFORE_UPDATE` BEFORE UPDATE ON `ContainerIp` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`ContainerIp-Log`
(`i`,
`toContainer`,
`IP`,
`PrivatePort`,
`PublicPort`,
`Type`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toContainer`,
OLD.`IP`,
OLD.`PrivatePort`,
OLD.`PublicPort`,
OLD.`Type`,
'BEFORE UPDATE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`ContainerIp_BEFORE_DELETE` BEFORE DELETE ON `ContainerIp` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`ContainerIp-Log`
(`i`,
`toContainer`,
`IP`,
`PrivatePort`,
`PublicPort`,
`Type`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toContainer`,
OLD.`IP`,
OLD.`PrivatePort`,
OLD.`PublicPort`,
OLD.`Type`,
'BEFORE DELETE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ContainerIp-Log`
--

DROP TABLE IF EXISTS `ContainerIp-Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ContainerIp-Log` (
  `j` int(11) NOT NULL AUTO_INCREMENT,
  `i` int(11) DEFAULT NULL,
  `toContainer` int(11) DEFAULT NULL,
  `IP` varchar(45) DEFAULT NULL,
  `PrivatePort` varchar(45) DEFAULT NULL,
  `PublicPort` varchar(45) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`j`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ContainerLabel`
--

DROP TABLE IF EXISTS `ContainerLabel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ContainerLabel` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `toContainer` int(11) DEFAULT NULL,
  `Key` varchar(255) DEFAULT NULL,
  `Value` varchar(255) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  KEY `LinkToContainer2_idx` (`toContainer`),
  CONSTRAINT `LinkToContainer2` FOREIGN KEY (`toContainer`) REFERENCES `Container` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COMMENT='Docker.DotNet API';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`ContainerLabel_BEFORE_INSERT` BEFORE INSERT ON `ContainerLabel` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`ContainerLabel-Log`
(`i`,
`toContainer`,
`Key`,
`Value`,
`Comment`,
`LastUpdate`)
VALUES
(NEW.`i`,
NEW.`toContainer`,
NEW.`Key`,
NEW.`Value`,
'BEFORE INSERT',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`ContainerLabel_BEFORE_UPDATE` BEFORE UPDATE ON `ContainerLabel` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`ContainerLabel-Log`
(`i`,
`toContainer`,
`Key`,
`Value`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toContainer`,
OLD.`Key`,
OLD.`Value`,
'BEFORE UPDATE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`ContainerLabel_BEFORE_DELETE` BEFORE DELETE ON `ContainerLabel` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`ContainerLabel-Log`
(`i`,
`toContainer`,
`Key`,
`Value`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toContainer`,
OLD.`Key`,
OLD.`Value`,
'BEFORE DELETE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ContainerLabel-Log`
--

DROP TABLE IF EXISTS `ContainerLabel-Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ContainerLabel-Log` (
  `j` int(11) NOT NULL AUTO_INCREMENT,
  `i` int(11) DEFAULT NULL,
  `toContainer` int(11) DEFAULT NULL,
  `Key` varchar(255) DEFAULT NULL,
  `Value` varchar(255) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`j`)
) ENGINE=InnoDB AUTO_INCREMENT=399 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ContainerMount`
--

DROP TABLE IF EXISTS `ContainerMount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ContainerMount` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `toContainer` int(11) DEFAULT NULL,
  `toVolume` int(11) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `Source` varchar(255) DEFAULT NULL,
  `Destination` varchar(255) DEFAULT NULL,
  `Mode` varchar(45) DEFAULT NULL,
  `Propagation` varchar(45) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  KEY `LinkToContainer3_idx` (`toContainer`),
  CONSTRAINT `LinkToContainer3` FOREIGN KEY (`toContainer`) REFERENCES `Container` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COMMENT='Docker.DotNet API';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`ContanerMount_BEFORE_INSERT` BEFORE INSERT ON `ContainerMount` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`ContainerMount-Log`
(`i`,
`toContainer`,
`toVolume`,
`Type`,
`Source`,
`Destination`,
`Mode`,
`Propagation`,
`Comment`,
`LastUpdate`)
VALUES
(NEW.`i`,
NEW.`toContainer`,
NEW.`toVolume`,
NEW.`Type`,
NEW.`Source`,
NEW.`Destination`,
NEW.`Mode`,
NEW.`Propagation`,
'BEFORE INSERT',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`ContanerMount_BEFORE_UPDATE` BEFORE UPDATE ON `ContainerMount` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`ContainerMount-Log`
(`i`,
`toContainer`,
`toVolume`,
`Type`,
`Source`,
`Destination`,
`Mode`,
`Propagation`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toContainer`,
OLD,`toVolume`,
OLD.`Type`,
OLD.`Source`,
OLD.`Destination`,
OLD.`Mode`,
OLD.`Propagation`,
'BEFORE UPDATE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`ContanerMount_BEFORE_DELETE` BEFORE DELETE ON `ContainerMount` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`ContainerMount-Log`
(`i`,
`toContainer`,
`toVolume`,
`Type`,
`Source`,
`Destination`,
`Mode`,
`Propagation`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toContainer`,
OLD.`toVolume`,
OLD.`Type`,
OLD.`Source`,
OLD.`Destination`,
OLD.`Mode`,
OLD.`Propagation`,
'BEFORE DELETE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ContainerMount-Log`
--

DROP TABLE IF EXISTS `ContainerMount-Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ContainerMount-Log` (
  `j` int(11) NOT NULL AUTO_INCREMENT,
  `i` int(11) DEFAULT NULL,
  `toContainer` int(11) DEFAULT NULL,
  `toVolume` int(11) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `Source` varchar(255) DEFAULT NULL,
  `Destination` varchar(255) DEFAULT NULL,
  `Mode` varchar(45) DEFAULT NULL,
  `Propagation` varchar(45) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`j`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ContainerNames`
--

DROP TABLE IF EXISTS `ContainerNames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ContainerNames` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `toContainer` int(11) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  KEY `LinkToContaner1_idx` (`toContainer`),
  CONSTRAINT `LinkToContaner1` FOREIGN KEY (`toContainer`) REFERENCES `Container` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4 COMMENT='Docker.DotNet API';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`ContainerNames_BEFORE_INSERT` BEFORE INSERT ON `ContainerNames` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`ContainerNames-Log`
(`i`,
`toContainer`,
`Name`,
`Comment`,
`LastUpdate`)
VALUES
(NEW.`i`,
NEW.`toContainer`,
NEW.`Name`,
'BEFORE INSERT',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`ContainerNames_BEFORE_UPDATE` BEFORE UPDATE ON `ContainerNames` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`ContainerNames-Log`
(`i`,
`toContainer`,
`Name`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toContainer`,
OLD.`Name`,
'BEFORE UPDATE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`ContainerNames_BEFORE_DELETE` BEFORE DELETE ON `ContainerNames` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`ContainerNames-Log`
(`i`,
`toContainer`,
`Name`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toContainer`,
OLD.`Name`,
'BEFORE DELETE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ContainerNames-Log`
--

DROP TABLE IF EXISTS `ContainerNames-Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ContainerNames-Log` (
  `j` int(11) NOT NULL AUTO_INCREMENT,
  `i` int(11) DEFAULT NULL,
  `toContainer` int(11) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`j`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DockerHubVm`
--

DROP TABLE IF EXISTS `DockerHubVm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DockerHubVm` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `ToVM` int(11) DEFAULT NULL,
  `Url` varchar(45) DEFAULT NULL,
  `Port` int(11) DEFAULT NULL,
  `Login` varchar(45) DEFAULT NULL,
  `Pass` blob DEFAULT NULL,
  `DaemonConfig` blob DEFAULT NULL,
  `ServiceConfig` blob DEFAULT NULL,
  `DockerInfo` blob DEFAULT NULL,
  `DockerNetwork` blob DEFAULT NULL,
  `DockerClientConfig` blob DEFAULT NULL,
  `ProxyConfig` blob DEFAULT NULL,
  `DockerSummary` blob DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  KEY `LinkToVm2_idx` (`ToVM`),
  CONSTRAINT `LinkToVm2` FOREIGN KEY (`ToVM`) REFERENCES `VM` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='UPDATE `DockerHubVm`\nSET\n`DaemonConfig` = ''/etc/docker/daemon.json'',\n`ServiceConfig` = ''/lib/systemd/system/docker.service'',\n`DockerInfo` = ''docker info'',\n`DockerNetwork` = ''docker network ls --no-trunk'',\n`DockerClientConfig` = ''/home/redisadmin/.docker/config.json'',\n`Comment` = <{Comment: }>,\n`LastUpdate` = <{LastUpdate: }>\nWHERE `i` = 1;';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`DockerHubVm_BEFORE_INSERT` BEFORE INSERT ON `DockerHubVm` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`DockerHubVm-Log`
(`i`,
`ToVM`,
`Url`,
`Port`,
`Login`,
`Pass`,
`DaemonConfig`,
`ServiceConfig`,
`DockerInfo`,
`DockerNetwork`,
`DockerClientConfig`,
`ProxyConfig`,
`DockerSummary`,
`Comment`,
`LastUpdate`)
VALUES
(NEW.`i`,
NEW.`ToVM`,
NEW.`Url`,
NEW.`Port`,
NEW.`Login`,
NEW.`Pass`,
NEW.`DaemonConfig`,
NEW.`ServiceConfig`,
NEW.`DockerInfo`,
NEW.`DockerNetwork`,
NEW.`DockerClientConfig`,
NEW.`ProxyConfig`,
NEW.`DockerSummary`,
'BEFORE INSERT',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`DockerHubVm_BEFORE_UPDATE` BEFORE UPDATE ON `DockerHubVm` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`DockerHubVm-Log`
(`i`,
`ToVM`,
`Url`,
`Port`,
`Login`,
`Pass`,
`DaemonConfig`,
`ServiceConfig`,
`DockerInfo`,
`DockerNetwork`,
`DockerClientConfig`,
`ProxyConfig`,
`DockerSummary`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`ToVM`,
OLD.`Url`,
OLD.`Port`,
OLD.`Login`,
OLD.`Pass`,
OLD.`DaemonConfig`,
OLD.`ServiceConfig`,
OLD.`DockerInfo`,
OLD.`DockerNetwork`,
OLD.`DockerClientConfig`,
OLD.`ProxyConfig`,
OLD.`DockerSummary`,
'BEFORE UPDATE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`DockerHubVm_BEFORE_DELETE` BEFORE DELETE ON `DockerHubVm` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`DockerHubVm-Log`
(`i`,
`ToVM`,
`Url`,
`Port`,
`Login`,
`Pass`,
`DaemonConfig`,
`ServiceConfig`,
`DockerInfo`,
`DockerNetwork`,
`DockerClientConfig`,
`ProxyConfig`,
`DockerSummary`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`ToVM`,
OLD.`Url`,
OLD.`Port`,
OLD.`Login`,
OLD.`Pass`,
OLD.`DaemonConfig`,
OLD.`ServiceConfig`,
OLD.`DockerInfo`,
OLD.`DockerNetwork`,
OLD.`DockerClientConfig`,
OLD.`ProxyConfig`,
OLD.`DockerSummary`,
'BEFORE DELETE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `DockerHubVm-Log`
--

DROP TABLE IF EXISTS `DockerHubVm-Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DockerHubVm-Log` (
  `j` int(11) NOT NULL AUTO_INCREMENT,
  `i` int(11) DEFAULT NULL,
  `ToVM` int(11) DEFAULT NULL,
  `Url` varchar(45) DEFAULT NULL,
  `Port` int(11) DEFAULT NULL,
  `Login` varchar(45) DEFAULT NULL,
  `Pass` blob DEFAULT NULL,
  `DaemonConfig` blob DEFAULT NULL,
  `ServiceConfig` blob DEFAULT NULL,
  `DockerInfo` blob DEFAULT NULL,
  `DockerNetwork` blob DEFAULT NULL,
  `DockerClientConfig` blob DEFAULT NULL,
  `ProxyConfig` blob DEFAULT NULL,
  `DockerSummary` blob DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`j`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DockerImage`
--

DROP TABLE IF EXISTS `DockerImage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DockerImage` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `toDockerHub` int(11) DEFAULT NULL,
  `toRegistryImageContent` int(11) DEFAULT NULL,
  `Containers` int(11) DEFAULT NULL,
  `Created` varchar(45) DEFAULT NULL,
  `Id` varchar(255) DEFAULT NULL,
  `ParentId` varchar(255) DEFAULT NULL,
  `SharedSize` bigint(20) DEFAULT NULL,
  `Size` bigint(20) DEFAULT NULL,
  `VirtualSize` bigint(20) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  KEY `LinkToDickerHub_idx` (`toDockerHub`),
  CONSTRAINT `LinkToDickerHub` FOREIGN KEY (`toDockerHub`) REFERENCES `DockerHubVm` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COMMENT='#sudo docker image ls --no-trunc \nDocker.DotNet API\n';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`DockerImage_BEFORE_INSERT` BEFORE INSERT ON `DockerImage` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`DockerImage-Log`
(`i`,
`toDockerHub`,
`toRegistryImageContent`,
`Containers`,
`Created`,
`Id`,
`ParentId`,
`SharedSize`,
`Size`,
`VirtualSize`,
`Comment`,
`LastUpdate`)
VALUES
(NEW.`i`,
NEW.`toDockerHub`,
NEW.`toRegistryImageContent`,
NEW.`Containers`,
NEW.`Created`,
NEW.`Id`,
NEW.`ParentId`,
NEW.`SharedSize`,
NEW.`Size`,
NEW.`VirtualSize`,
'BEFORE INSERT',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`DockerImage_BEFORE_UPDATE` BEFORE UPDATE ON `DockerImage` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`DockerImage-Log`
(`i`,
`toDockerHub`,
`toRegistryImageContent`,
`Containers`,
`Created`,
`Id`,
`ParentId`,
`SharedSize`,
`Size`,
`VirtualSize`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toDockerHub`,
OLD.`toRegistryImageContent`,
OLD.`Containers`,
OLD.`Created`,
OLD.`Id`,
OLD.`ParentId`,
OLD.`SharedSize`,
OLD.`Size`,
OLD.`VirtualSize`,
'BEFORE UPDATE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`DockerImage_BEFORE_DELETE` BEFORE DELETE ON `DockerImage` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`DockerImage-Log`
(`i`,
`toDockerHub`,
`toRegistryImageContent`,
`Containers`,
`Created`,
`Id`,
`ParentId`,
`SharedSize`,
`Size`,
`VirtualSize`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toDockerHub`,
OLD.`toRegistryImageContent`,
OLD.`Containers`,
OLD.`Created`,
OLD.`Id`,
OLD.`ParentId`,
OLD.`SharedSize`,
OLD.`Size`,
OLD.`VirtualSize`,
'BEFORE DELETE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `DockerImage-Log`
--

DROP TABLE IF EXISTS `DockerImage-Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DockerImage-Log` (
  `j` int(11) NOT NULL AUTO_INCREMENT,
  `i` int(11) DEFAULT NULL,
  `toDockerHub` int(11) DEFAULT NULL,
  `toRegistryImageContent` int(11) DEFAULT NULL,
  `Containers` int(11) DEFAULT NULL,
  `Created` varchar(45) DEFAULT NULL,
  `Id` varchar(255) DEFAULT NULL,
  `ParentId` varchar(255) DEFAULT NULL,
  `SharedSize` bigint(20) DEFAULT NULL,
  `Size` bigint(20) DEFAULT NULL,
  `VirtualSize` bigint(20) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`j`)
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DockerImageLabel`
--

DROP TABLE IF EXISTS `DockerImageLabel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DockerImageLabel` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `toDockerImage` int(11) DEFAULT NULL,
  `Key` varchar(255) DEFAULT NULL,
  `Value` varchar(255) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  KEY `LinkToDockerImage_idx` (`toDockerImage`),
  CONSTRAINT `LinkToDockerImage2` FOREIGN KEY (`toDockerImage`) REFERENCES `DockerImage` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COMMENT='Docker.DotNet API';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`DockerImageLabel_BEFORE_INSERT` BEFORE INSERT ON `DockerImageLabel` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`DockerImageLabel-Log`
(`i`,
`toDockerImage`,
`Key`,
`Value`,
`Comment`,
`LastUpdate`)
VALUES
(NEW.i,
NEW.toDockerImage,
NEW.`Key`,
NEW.`Value`,
'BEFORE INSERT',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`DockerImageLabel_BEFORE_UPDATE` BEFORE UPDATE ON `DockerImageLabel` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`DockerImageLabel-Log`
(`i`,
`toDockerImage`,
`Key`,
`Value`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.i,
OLD.toDockerImage,
OLD.`Key`,
OLD.`Value`,
'BEFORE UPDATE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`DockerImageLabel_BEFORE_DELETE` BEFORE DELETE ON `DockerImageLabel` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`DockerImageLabel-Log`
(`i`,
`toDockerImage`,
`Key`,
`Value`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.i,
OLD.toDockerImage,
OLD.`Key`,
OLD.`Value`,
'BEFORE DELETE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `DockerImageLabel-Log`
--

DROP TABLE IF EXISTS `DockerImageLabel-Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DockerImageLabel-Log` (
  `j` int(11) NOT NULL AUTO_INCREMENT,
  `i` int(11) NOT NULL,
  `toDockerImage` int(11) DEFAULT NULL,
  `Key` varchar(255) DEFAULT NULL,
  `Value` varchar(255) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`j`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DockerImageTag`
--

DROP TABLE IF EXISTS `DockerImageTag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DockerImageTag` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `toDockerImage` int(11) DEFAULT NULL,
  `Tag` varchar(255) DEFAULT NULL,
  `Digest` varchar(255) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  KEY `LinkToDockerImage_idx` (`toDockerImage`),
  KEY `LinkToDockerImage1_idx` (`toDockerImage`),
  CONSTRAINT `LinkToDockerImage1` FOREIGN KEY (`toDockerImage`) REFERENCES `DockerImage` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4 COMMENT='Docker.DotNet API';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`DockerImageTag_BEFORE_INSERT` BEFORE INSERT ON `DockerImageTag` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`DockerImageTag-Log`
(`i`,
`toDockerImage`,
`Digest`,
`Tag`,
`Comment`,
`LastUpdate`)
VALUES
(NEW.`i`,
NEW.`toDockerImage`,
NEW.`Digest`,
NEW.`Tag`,
'BEFORE INSERT',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`DockerImageTag_BEFORE_UPDATE` BEFORE UPDATE ON `DockerImageTag` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`DockerImageTag-Log`
(`i`,
`toDockerImage`,
`Digest`,
`Tag`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toDockerImage`,
OLD.`Digest`,
OLD.`Tag`,
'BEFORE UPDATE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`DockerImageTag_BEFORE_DELETE` BEFORE DELETE ON `DockerImageTag` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`DockerImageTag-Log`
(`i`,
`toDockerImage`,
`Digest`,
`Tag`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toDockerImage`,
OLD.`Digest`,
OLD.`Tag`,
'BEFORE DELETE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `DockerImageTag-Log`
--

DROP TABLE IF EXISTS `DockerImageTag-Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DockerImageTag-Log` (
  `j` int(11) NOT NULL AUTO_INCREMENT,
  `i` int(11) DEFAULT NULL,
  `toDockerImage` int(11) DEFAULT NULL,
  `Tag` varchar(255) DEFAULT NULL,
  `Digest` varchar(255) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`j`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DockerRegistryVm`
--

DROP TABLE IF EXISTS `DockerRegistryVm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DockerRegistryVm` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `toVm` int(11) DEFAULT NULL,
  `Url` varchar(255) DEFAULT NULL,
  `Port` int(11) DEFAULT NULL,
  `Login` varchar(45) DEFAULT NULL,
  `Pass` blob DEFAULT NULL,
  `ComposePath` varchar(255) DEFAULT NULL,
  `ComposeConfig` blob DEFAULT NULL,
  `ProxyConfigPath` varchar(255) DEFAULT NULL,
  `ProxyConfig` blob DEFAULT NULL,
  `ProxyPublicCert` blob DEFAULT NULL,
  `ProxyPrivateKey` blob DEFAULT NULL,
  `ProxyHtpasswd` varchar(255) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  KEY `LinkToVm1_idx` (`toVm`),
  CONSTRAINT `LinkToVm1` FOREIGN KEY (`toVm`) REFERENCES `VM` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='update DockerRegistryVm \\\\nset \\\\nComposePath=''/home/redisadmin'',\\\\nProxyConfigPath=''/home/redisadmin/auth'',\\\\nComposeConfig=LOAD_FILE(''/home/redisadmin/registry-compose.yml''),\\\\nProxyConfig=LOAD_FILE(''/home/redisadmin/auth/nginx.conf''),\\\\nProxyPublicCert=LOAD_FILE(''/home/redisadmin/auth/domain.crt''),\\\\nProxyPrivateKey=LOAD_FILE(''/home/redisadmin/auth/domain.key''),\\\\nProxyHtpasswd=LOAD_FILE(''/home/redisadmin/auth/nginx.htpasswd'')\\\\nwhere i=1;';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`DockerRegistryVm_BEFORE_INSERT` BEFORE INSERT ON `DockerRegistryVm` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`DockerRegistryVm-Log`
(`i`,
`toVm`,
`Url`,
`Port`,
`Login`,
`Pass`,
`ComposePath`,
`ComposeConfig`,
`ProxyConfigPath`,
`ProxyConfig`,
`ProxyPublicCert`,
`ProxyPrivateKey`,
`ProxyHtpasswd`,
`Comment`,
`LastUpdate`)
VALUES
(NEW.`i`,
NEW.`toVm`,
NEW.`Url`,
NEW.`Port`,
NEW.`Login`,
NEW.`Pass`,
NEW.`ComposePath`,
NEW.`ComposeConfig`,
NEW.`ProxyConfigPath`,
NEW.`ProxyConfig`,
NEW.`ProxyPublicCert`,
NEW.`ProxyPrivateKey`,
NEW.`ProxyHtpasswd`,
'BEFORE INSERT',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`DockerRegistryVm_BEFORE_UPDATE` BEFORE UPDATE ON `DockerRegistryVm` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`DockerRegistryVm-Log`
(`i`,
`toVm`,
`Url`,
`Port`,
`Login`,
`Pass`,
`ComposePath`,
`ComposeConfig`,
`ProxyConfigPath`,
`ProxyConfig`,
`ProxyPublicCert`,
`ProxyPrivateKey`,
`ProxyHtpasswd`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toVm`,
OLD.`Url`,
OLD.`Port`,
OLD.`Login`,
OLD.`Pass`,
OLD.`ComposePath`,
OLD.`ComposeConfig`,
OLD.`ProxyConfigPath`,
OLD.`ProxyConfig`,
OLD.`ProxyPublicCert`,
OLD.`ProxyPrivateKey`,
OLD.`ProxyHtpasswd`,
'BEFORE UPDATE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`DockerRegistryVm_BEFORE_DELETE` BEFORE DELETE ON `DockerRegistryVm` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`DockerRegistryVm-Log`
(`i`,
`toVm`,
`Url`,
`Port`,
`Login`,
`Pass`,
`ComposePath`,
`ComposeConfig`,
`ProxyConfigPath`,
`ProxyConfig`,
`ProxyPublicCert`,
`ProxyPrivateKey`,
`ProxyHtpasswd`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toVm`,
OLD.`Url`,
OLD.`Port`,
OLD.`Login`,
OLD.`Pass`,
OLD.`ComposePath`,
OLD.`ComposeConfig`,
OLD.`ProxyConfigPath`,
OLD.`ProxyConfig`,
OLD.`ProxyPublicCert`,
OLD.`ProxyPrivateKey`,
OLD.`ProxyHtpasswd`,
'BEFORE DELETE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `DockerRegistryVm-Log`
--

DROP TABLE IF EXISTS `DockerRegistryVm-Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DockerRegistryVm-Log` (
  `j` int(11) NOT NULL AUTO_INCREMENT,
  `i` int(11) DEFAULT NULL,
  `toVm` int(11) DEFAULT NULL,
  `Url` varchar(255) DEFAULT NULL,
  `Port` int(11) DEFAULT NULL,
  `Login` varchar(45) DEFAULT NULL,
  `Pass` blob DEFAULT NULL,
  `ComposePath` varchar(255) DEFAULT NULL,
  `ComposeConfig` blob DEFAULT NULL,
  `ProxyConfigPath` varchar(255) DEFAULT NULL,
  `ProxyConfig` blob DEFAULT NULL,
  `ProxyPublicCert` blob DEFAULT NULL,
  `ProxyPrivateKey` blob DEFAULT NULL,
  `ProxyHtpasswd` varchar(255) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`j`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DockerVolume`
--

DROP TABLE IF EXISTS `DockerVolume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DockerVolume` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `toDockerHubVm` int(11) DEFAULT NULL,
  `CreatedAt` varchar(45) DEFAULT NULL,
  `Driver` varchar(45) DEFAULT NULL,
  `Mountpoint` varchar(255) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Scope` varchar(45) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  KEY `LinkToDockerHubVm1_idx` (`toDockerHubVm`),
  CONSTRAINT `LinkToDockerHubVm1` FOREIGN KEY (`toDockerHubVm`) REFERENCES `DockerHubVm` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COMMENT='Docker.DotNet API';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`DockerVolume_BEFORE_INSERT` BEFORE INSERT ON `DockerVolume` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`DockerVolume-Log`
(`i`,
`toDockerHubVm`,
`CreatedAt`,
`Driver`,
`Mountpoint`,
`Name`,
`Scope`,
`Comment`,
`LastUpdate`)
VALUES
(NEW.`i`,
NEW.`toDockerHubVm`,
NEW.`CreatedAt`,
NEW.`Driver`,
NEW.`Mountpoint`,
NEW.`Name`,
NEW.`Scope`,
'BEFORE INSERT',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`DockerVolume_BEFORE_UPDATE` BEFORE UPDATE ON `DockerVolume` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`DockerVolume-Log`
(`i`,
`toDockerHubVm`,
`CreatedAt`,
`Driver`,
`Mountpoint`,
`Name`,
`Scope`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toDockerHubVm`,
OLD.`CreatedAt`,
OLD.`Driver`,
OLD.`Mountpoint`,
OLD.`Name`,
OLD.`Scope`,
'BEFORE UPDATE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`DockerVolume_BEFORE_DELETE` BEFORE DELETE ON `DockerVolume` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`DockerVolume-Log`
(`i`,
`toDockerHubVm`,
`CreatedAt`,
`Driver`,
`Mountpoint`,
`Name`,
`Scope`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toDockerHubVm`,
OLD.`CreatedAt`,
OLD.`Driver`,
OLD.`Mountpoint`,
OLD.`Name`,
OLD.`Scope`,
'BEFORE DELETE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `DockerVolume-Log`
--

DROP TABLE IF EXISTS `DockerVolume-Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DockerVolume-Log` (
  `j` int(11) NOT NULL AUTO_INCREMENT,
  `i` int(11) DEFAULT NULL,
  `toDockerHubVm` int(11) DEFAULT NULL,
  `CreatedAt` varchar(45) DEFAULT NULL,
  `Driver` varchar(45) DEFAULT NULL,
  `Mountpoint` varchar(255) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Scope` varchar(45) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`j`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `GetDockerHub`
--

DROP TABLE IF EXISTS `GetDockerHub`;
/*!50001 DROP VIEW IF EXISTS `GetDockerHub`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `GetDockerHub` (
  `i` tinyint NOT NULL,
  `ToVM` tinyint NOT NULL,
  `Url` tinyint NOT NULL,
  `Port` tinyint NOT NULL,
  `Login` tinyint NOT NULL,
  `VmName` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `GetDockerImage`
--

DROP TABLE IF EXISTS `GetDockerImage`;
/*!50001 DROP VIEW IF EXISTS `GetDockerImage`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `GetDockerImage` (
  `i` tinyint NOT NULL,
  `toDockerHub` tinyint NOT NULL,
  `Id` tinyint NOT NULL,
  `ParentId` tinyint NOT NULL,
  `Tag` tinyint NOT NULL,
  `Digest` tinyint NOT NULL,
  `toRegistryImageContent` tinyint NOT NULL,
  `Containers` tinyint NOT NULL,
  `Created` tinyint NOT NULL,
  `SharedSize` tinyint NOT NULL,
  `Size` tinyint NOT NULL,
  `VirtualSize` tinyint NOT NULL,
  `Comment` tinyint NOT NULL,
  `LastUpdate` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `GetDockerVolume`
--

DROP TABLE IF EXISTS `GetDockerVolume`;
/*!50001 DROP VIEW IF EXISTS `GetDockerVolume`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `GetDockerVolume` (
  `i` tinyint NOT NULL,
  `toDockerHubVm` tinyint NOT NULL,
  `CreatedAt` tinyint NOT NULL,
  `Driver` tinyint NOT NULL,
  `Mountpoint` tinyint NOT NULL,
  `DockerVolumeName` tinyint NOT NULL,
  `Scope` tinyint NOT NULL,
  `Comment` tinyint NOT NULL,
  `LastUpdate` tinyint NOT NULL,
  `Type` tinyint NOT NULL,
  `Source` tinyint NOT NULL,
  `Destination` tinyint NOT NULL,
  `Mode` tinyint NOT NULL,
  `Propagation` tinyint NOT NULL,
  `ContainerName` tinyint NOT NULL,
  `ContainerId` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `GetFreeKvmVolume`
--

DROP TABLE IF EXISTS `GetFreeKvmVolume`;
/*!50001 DROP VIEW IF EXISTS `GetFreeKvmVolume`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `GetFreeKvmVolume` (
  `i` tinyint NOT NULL,
  `toKvmPool` tinyint NOT NULL,
  `toDevicePartition` tinyint NOT NULL,
  `Name` tinyint NOT NULL,
  `Path` tinyint NOT NULL,
  `Type` tinyint NOT NULL,
  `Capacity` tinyint NOT NULL,
  `Allocation` tinyint NOT NULL,
  `Comment` tinyint NOT NULL,
  `LastUpdate` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `GetKvmVolume`
--

DROP TABLE IF EXISTS `GetKvmVolume`;
/*!50001 DROP VIEW IF EXISTS `GetKvmVolume`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `GetKvmVolume` (
  `i` tinyint NOT NULL,
  `toKvmPool` tinyint NOT NULL,
  `toDevicePartition` tinyint NOT NULL,
  `Name` tinyint NOT NULL,
  `Path` tinyint NOT NULL,
  `Type` tinyint NOT NULL,
  `Capacity` tinyint NOT NULL,
  `Allocation` tinyint NOT NULL,
  `Comment` tinyint NOT NULL,
  `LastUpdate` tinyint NOT NULL,
  `VmName` tinyint NOT NULL,
  `VmI` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `GetServerStorage`
--

DROP TABLE IF EXISTS `GetServerStorage`;
/*!50001 DROP VIEW IF EXISTS `GetServerStorage`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `GetServerStorage` (
  `KvmStorageDevice_i` tinyint NOT NULL,
  `KvmStorageDevice_ToKvmHost` tinyint NOT NULL,
  `KvmStorageDevice_Name` tinyint NOT NULL,
  `KvmStorageDevice_DiskType` tinyint NOT NULL,
  `KvmStorageDevice_DiskId` tinyint NOT NULL,
  `KvmStorageDevice_Model` tinyint NOT NULL,
  `KvmStorageDevice_Capacity` tinyint NOT NULL,
  `KvmStorageDevice_SectorSize` tinyint NOT NULL,
  `KvmStorageDevice_Bytes` tinyint NOT NULL,
  `KvmStorageDevice_Sectors` tinyint NOT NULL,
  `KvmStorageDevice_Comment` tinyint NOT NULL,
  `KvmStorageDevice_LastUpdate` tinyint NOT NULL,
  `KvmPool_i` tinyint NOT NULL,
  `KvmPool_toStorageDevice` tinyint NOT NULL,
  `KvmPool_Type` tinyint NOT NULL,
  `KvmPool_Name` tinyint NOT NULL,
  `KvmPool_State` tinyint NOT NULL,
  `KvmPool_Autostart` tinyint NOT NULL,
  `KvmPool_UUID` tinyint NOT NULL,
  `KvmPool_Format` tinyint NOT NULL,
  `KvmPool_Path` tinyint NOT NULL,
  `KvmPool_Capacity` tinyint NOT NULL,
  `KvmPool_Allocation` tinyint NOT NULL,
  `KvmPool_Available` tinyint NOT NULL,
  `KvmPool_Comment` tinyint NOT NULL,
  `KvmPool_LastUpdate` tinyint NOT NULL,
  `KvmLVM_i` tinyint NOT NULL,
  `KvmLVM_ToKvmStorage` tinyint NOT NULL,
  `KvmLVM_PartName` tinyint NOT NULL,
  `KvmLVM_LvmName` tinyint NOT NULL,
  `KvmLVM_Fmt` tinyint NOT NULL,
  `KvmLVM_Size` tinyint NOT NULL,
  `KvmLVM_Free` tinyint NOT NULL,
  `KvmLVM_Comment` tinyint NOT NULL,
  `KvmLVM_LastUpdate` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `GetSpecialVm`
--

DROP TABLE IF EXISTS `GetSpecialVm`;
/*!50001 DROP VIEW IF EXISTS `GetSpecialVm`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `GetSpecialVm` (
  `DockerHubVm` tinyint NOT NULL,
  `DockerRegistryVm` tinyint NOT NULL,
  `SiteVm` tinyint NOT NULL,
  `ArpScanVm` tinyint NOT NULL,
  `i` tinyint NOT NULL,
  `toKvmHost` tinyint NOT NULL,
  `toUser` tinyint NOT NULL,
  `UUID` tinyint NOT NULL,
  `Id` tinyint NOT NULL,
  `Name` tinyint NOT NULL,
  `OsVersion` tinyint NOT NULL,
  `State` tinyint NOT NULL,
  `CpuSet` tinyint NOT NULL,
  `Vcpu` tinyint NOT NULL,
  `Memory` tinyint NOT NULL,
  `SpicePort` tinyint NOT NULL,
  `MacAdr` tinyint NOT NULL,
  `AdminLogin` tinyint NOT NULL,
  `AdminPassword` tinyint NOT NULL,
  `Comment` tinyint NOT NULL,
  `LastUpdate` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `GetVmIp`
--

DROP TABLE IF EXISTS `GetVmIp`;
/*!50001 DROP VIEW IF EXISTS `GetVmIp`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `GetVmIp` (
  `i` tinyint NOT NULL,
  `Ip` tinyint NOT NULL,
  `toKvmBridgePort` tinyint NOT NULL,
  `toVm` tinyint NOT NULL,
  `Comment` tinyint NOT NULL,
  `LastUpdate` tinyint NOT NULL,
  `VmName` tinyint NOT NULL,
  `AdminLogin` tinyint NOT NULL,
  `KvmBridgePort_Name` tinyint NOT NULL,
  `KvmBridgePort_BridgePort` tinyint NOT NULL,
  `Bridge_i` tinyint NOT NULL,
  `Bridge_toKvmVlanSwitch` tinyint NOT NULL,
  `Bridge_Name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `KvmBridge`
--

DROP TABLE IF EXISTS `KvmBridge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KvmBridge` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `toKvmNetwork` int(11) DEFAULT NULL,
  `toKvmVlanSwitch` int(11) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Id` varchar(45) DEFAULT NULL,
  `STP` varchar(45) DEFAULT NULL,
  `Ip` varchar(45) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  KEY `LinkToKvmNetwork_idx` (`toKvmNetwork`),
  KEY `LinkToKvmVlan_idx` (`toKvmVlanSwitch`),
  CONSTRAINT `LinkToKvmNetwork` FOREIGN KEY (`toKvmNetwork`) REFERENCES `KvmNetworkInterface` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `LinkToKvmVlan` FOREIGN KEY (`toKvmVlanSwitch`) REFERENCES `KvmVlanSwitch` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='brctl\narp -a';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`KvmBridge_BEFORE_INSERT` BEFORE INSERT ON `KvmBridge` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`KvmBridge-Log`
(`i`,
`toKvmNetwork`,
`toKvmVlanSwitch`,
`Name`,
`Id`,
`STP`,
`Ip`,
`Comment`,
`LastUpdate`)
VALUES
(NEW.`i`,
NEW.`toKvmNetwork`,
NEW.`toKvmVlanSwitch`,
NEW.`Name`,
NEW.`Id`,
NEW.`STP`,
NEW.`Ip`,
'BEFORE INSERT',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`KvmBridge_BEFORE_UPDATE` BEFORE UPDATE ON `KvmBridge` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`KvmBridge-Log`
(`i`,
`toKvmNetwork`,
`toKvmVlanSwitch`,
`Name`,
`Id`,
`STP`,
`Ip`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toKvmNetwork`,
OLD.`toKvmVlanSwitch`,
OLD.`Name`,
OLD.`Id`,
OLD.`STP`,
OLD.`Ip`,
'BEFORE UPDATE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`KvmBridge_BEFORE_DELETE` BEFORE DELETE ON `KvmBridge` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`KvmBridge-Log`
(`i`,
`toKvmNetwork`,
`toKvmVlanSwitch`,
`Name`,
`Id`,
`STP`,
`Ip`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toKvmNetwork`,
OLD.`toKvmVlanSwitch`,
OLD.`Name`,
OLD.`Id`,
OLD.`STP`,
OLD.`Ip`,
'BEFORE DELETE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `KvmBridge-Log`
--

DROP TABLE IF EXISTS `KvmBridge-Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KvmBridge-Log` (
  `j` int(11) NOT NULL AUTO_INCREMENT,
  `i` int(11) DEFAULT NULL,
  `toKvmNetwork` int(11) DEFAULT NULL,
  `toKvmVlanSwitch` int(11) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Id` varchar(45) DEFAULT NULL,
  `STP` varchar(45) DEFAULT NULL,
  `Ip` varchar(45) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`j`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `KvmBridgePort`
--

DROP TABLE IF EXISTS `KvmBridgePort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KvmBridgePort` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `toKvmBridge` int(11) DEFAULT NULL,
  `BridgePort` int(11) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `BridgePortMac` varchar(45) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  KEY `LinkToKvmBridge_idx` (`toKvmBridge`),
  CONSTRAINT `LinkToKvmBridge` FOREIGN KEY (`toKvmBridge`) REFERENCES `KvmBridge` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COMMENT='ip a\nbrctl showmacs br1';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `KvmBridgePort-Log`
--

DROP TABLE IF EXISTS `KvmBridgePort-Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KvmBridgePort-Log` (
  `j` int(11) NOT NULL AUTO_INCREMENT,
  `i` int(11) DEFAULT NULL,
  `toKvmBridge` int(11) DEFAULT NULL,
  `BridgePort` int(11) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `BridgePortMac` varchar(45) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`j`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `KvmDevicePartition`
--

DROP TABLE IF EXISTS `KvmDevicePartition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KvmDevicePartition` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `ToKvmStorageDevice` int(11) DEFAULT NULL,
  `ToKvmLvmDevice` int(11) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `UUID` varchar(45) DEFAULT NULL,
  `PartUUID` varchar(45) DEFAULT NULL,
  `PtType` varchar(45) DEFAULT NULL,
  `PartLabel` varchar(45) DEFAULT NULL,
  `BlockSize` varchar(45) DEFAULT NULL,
  `Size` varchar(45) DEFAULT NULL,
  `Start` bigint(20) DEFAULT NULL,
  `End` bigint(20) DEFAULT NULL,
  `Sectors` bigint(20) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  UNIQUE KEY `UUID_UNIQUE` (`UUID`),
  KEY `LinkToPhysicalDevice_idx` (`ToKvmStorageDevice`),
  KEY `LinkToKvmLvm_idx` (`ToKvmLvmDevice`),
  CONSTRAINT `LinkToKvmLvm` FOREIGN KEY (`ToKvmLvmDevice`) REFERENCES `KvmLVM` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `LinkToPhysicalDevice` FOREIGN KEY (`ToKvmStorageDevice`) REFERENCES `KvmStorageDevice` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COMMENT='blkid\\nfdisk DEVICE print\nparted /dev/sdd print';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`KvmDevicePartition_BEFORE_INSERT` BEFORE INSERT ON `KvmDevicePartition` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`KvmDevicePartition-Log`
(`i`,
`ToKvmStorageDevice`,
`ToKvmLvmDevice`,
`Name`,
`Type`,
`UUID`,
`PartUUID`,
`PtType`,
`PartLabel`,
`BlockSize`,
`Size`,
`Start`,
`End`,
`Sectors`,
`Comment`,
`LastUpdate`)
VALUES
(NEW.`i`,
NEW.`ToKvmStorageDevice`,
NEW.`ToKvmLvmDevice`,
NEW.`Name`,
NEW.`Type`,
NEW.`UUID`,
NEW.`PartUUID`,
NEW.`PtType`,
NEW.`PartLabel`,
NEW.`BlockSize`,
NEW.`Size`,
NEW.`Start`,
NEW.`End`,
NEW.`Sectors`,
'BEFORE INSERT',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`KvmDevicePartition_BEFORE_UPDATE` BEFORE UPDATE ON `KvmDevicePartition` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`KvmDevicePartition-Log`
(`i`,
`ToKvmStorageDevice`,
`ToKvmLvmDevice`,
`Name`,
`Type`,
`UUID`,
`PartUUID`,
`PtType`,
`PartLabel`,
`BlockSize`,
`Size`,
`Start`,
`End`,
`Sectors`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`ToKvmStorageDevice`,
OLD.`ToKvmLvmDevice`,
OLD.`Name`,
OLD.`Type`,
OLD.`UUID`,
OLD.`PartUUID`,
OLD.`PtType`,
OLD.`PartLabel`,
OLD.`BlockSize`,
OLD.`Size`,
OLD.`Start`,
OLD.`End`,
OLD.`Sectors`,
'BEFORE UPDATE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`KvmDevicePartition_BEFORE_DELETE` BEFORE DELETE ON `KvmDevicePartition` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`KvmDevicePartition-Log`
(`i`,
`ToKvmStorageDevice`,
`ToKvmLvmDevice`,
`Name`,
`Type`,
`UUID`,
`PartUUID`,
`PtType`,
`PartLabel`,
`BlockSize`,
`Size`,
`Start`,
`End`,
`Sectors`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`ToKvmStorageDevice`,
OLD.`ToKvmLvmDevice`,
OLD.`Name`,
OLD.`Type`,
OLD.`UUID`,
OLD.`PartUUID`,
OLD.`PtType`,
OLD.`PartLabel`,
OLD.`BlockSize`,
OLD.`Size`,
OLD.`Start`,
OLD.`End`,
OLD.`Sectors`,
'BEFORE DELETE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `KvmDevicePartition-Log`
--

DROP TABLE IF EXISTS `KvmDevicePartition-Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KvmDevicePartition-Log` (
  `j` int(11) NOT NULL AUTO_INCREMENT,
  `i` int(11) DEFAULT NULL,
  `ToKvmStorageDevice` int(11) DEFAULT NULL,
  `ToKvmLvmDevice` int(11) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `UUID` varchar(45) DEFAULT NULL,
  `PartUUID` varchar(45) DEFAULT NULL,
  `PtType` varchar(45) DEFAULT NULL,
  `PartLabel` varchar(45) DEFAULT NULL,
  `BlockSize` varchar(45) DEFAULT NULL,
  `Size` varchar(45) DEFAULT NULL,
  `Start` bigint(20) DEFAULT NULL,
  `End` bigint(20) DEFAULT NULL,
  `Sectors` bigint(20) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`j`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `KvmHost`
--

DROP TABLE IF EXISTS `KvmHost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KvmHost` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `ServerName` varchar(45) DEFAULT NULL,
  `OsVersion` varchar(45) DEFAULT NULL,
  `KvmVersion` varchar(145) DEFAULT NULL,
  `UserName` varchar(45) DEFAULT NULL,
  `Password` blob DEFAULT NULL,
  `CpuModel` varchar(45) DEFAULT NULL,
  `CpuCount` int(11) DEFAULT NULL,
  `CpuSocket` int(11) DEFAULT NULL,
  `CorePerSocket` int(11) DEFAULT NULL,
  `ThreadPerSocket` int(11) DEFAULT NULL,
  `NumaCell` int(11) DEFAULT NULL,
  `MemorySize` bigint(20) DEFAULT NULL,
  `MainServerIP` varchar(45) DEFAULT NULL,
  `Location` varchar(450) DEFAULT NULL,
  `MonthPrice` decimal(10,0) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  UNIQUE KEY `i_UNIQUE` (`i`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='virsh nodeinfo';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`KvmHost_BEFORE_INSERT` BEFORE INSERT ON `KvmHost` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`KvmHost-Log`
(`i`,
`ServerName`,
`OsVersion`,
`KvmVersion`,
`UserName`,
`Password`,
`CpuModel`,
`CpuCount`,
`CpuSocket`,
`CorePerSocket`,
`ThreadPerSocket`,
`NumaCell`,
`MemorySize`,
`MainServerIP`,
`Location`,
`MonthPrice`,
`Comment`,
`LastUpdate`)
VALUES
(NEW.`i`,
NEW.`ServerName`,
NEW.`OsVersion`,
NEW.`KvmVersion`,
NEW.`UserName`,
NEW.`Password`,
NEW.`CpuModel`,
NEW.`CpuCount`,
NEW.`CpuSocket`,
NEW.`CorePerSocket`,
NEW.`ThreadPerSocket`,
NEW.`NumaCell`,
NEW.`MemorySize`,
NEW.`MainServerIP`,
NEW.`Location`,
NEW.`MonthPrice`,
'BEFORE INSERT',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`KvmHost_BEFORE_UPDATE` BEFORE UPDATE ON `KvmHost` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`KvmHost-Log`
(`i`,
`ServerName`,
`OsVersion`,
`KvmVersion`,
`UserName`,
`Password`,
`CpuModel`,
`CpuCount`,
`CpuSocket`,
`CorePerSocket`,
`ThreadPerSocket`,
`NumaCell`,
`MemorySize`,
`MainServerIP`,
`Location`,
`MonthPrice`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`ServerName`,
OLD.`OsVersion`,
OLD.`KvmVersion`,
OLD.`UserName`,
OLD.`Password`,
OLD.`CpuModel`,
OLD.`CpuCount`,
OLD.`CpuSocket`,
OLD.`CorePerSocket`,
OLD.`ThreadPerSocket`,
OLD.`NumaCell`,
OLD.`MemorySize`,
OLD.`MainServerIP`,
OLD.`Location`,
OLD.`MonthPrice`,
'BEFORE UPDATE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`KvmHost_BEFORE_DELETE` BEFORE DELETE ON `KvmHost` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`KvmHost-Log`
(`i`,
`ServerName`,
`OsVersion`,
`KvmVersion`,
`UserName`,
`Password`,
`CpuModel`,
`CpuCount`,
`CpuSocket`,
`CorePerSocket`,
`ThreadPerSocket`,
`NumaCell`,
`MemorySize`,
`MainServerIP`,
`Location`,
`MonthPrice`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`ServerName`,
OLD.`OsVersion`,
OLD.`KvmVersion`,
OLD.`UserName`,
OLD.`Password`,
OLD.`CpuModel`,
OLD.`CpuCount`,
OLD.`CpuSocket`,
OLD.`CorePerSocket`,
OLD.`ThreadPerSocket`,
OLD.`NumaCell`,
OLD.`MemorySize`,
OLD.`MainServerIP`,
OLD.`Location`,
OLD.`MonthPrice`,
'BEFORE DELETE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `KvmHost-Log`
--

DROP TABLE IF EXISTS `KvmHost-Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KvmHost-Log` (
  `j` int(11) NOT NULL AUTO_INCREMENT,
  `i` int(11) DEFAULT NULL,
  `ServerName` varchar(45) DEFAULT NULL,
  `OsVersion` varchar(45) DEFAULT NULL,
  `KvmVersion` varchar(145) DEFAULT NULL,
  `UserName` varchar(45) DEFAULT NULL,
  `Password` blob DEFAULT NULL,
  `CpuModel` varchar(45) DEFAULT NULL,
  `CpuCount` int(11) DEFAULT NULL,
  `CpuSocket` int(11) DEFAULT NULL,
  `CorePerSocket` int(11) DEFAULT NULL,
  `ThreadPerSocket` int(11) DEFAULT NULL,
  `NumaCell` int(11) DEFAULT NULL,
  `MemorySize` bigint(20) DEFAULT NULL,
  `MainServerIP` varchar(45) DEFAULT NULL,
  `Location` varchar(450) DEFAULT NULL,
  `MonthPrice` decimal(10,0) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`j`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `KvmHostAccess`
--

DROP TABLE IF EXISTS `KvmHostAccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KvmHostAccess` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `toKvmHost` int(11) DEFAULT NULL,
  `toUser` int(11) DEFAULT NULL,
  `FromIp` varchar(45) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  KEY `LinkToKvmHost_idx` (`toKvmHost`),
  KEY `LinkToUser_idx` (`toUser`),
  CONSTRAINT `LinkToKvmHost` FOREIGN KEY (`toKvmHost`) REFERENCES `KvmHost` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `LinkToUser3` FOREIGN KEY (`toUser`) REFERENCES `User` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='cat ~/.ssh/known_hosts\ncat ~/.ssh/authorized_keys\nufw status verbose';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`KvmHostAccess_BEFORE_INSERT` BEFORE INSERT ON `KvmHostAccess` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`KvmHostAccess-Log`
(`i`,
`toKvmHost`,
`toUser`,
`FromIp`,
`Comment`,
`LastUpdate`)
VALUES
(NEW.`i`,
NEW.`toKvmHost`,
NEW.`toUser`,
NEW.`FromIp`,
'BEFORE INSERT',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`KvmHostAccess_BEFORE_UPDATE` BEFORE UPDATE ON `KvmHostAccess` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`KvmHostAccess-Log`
(`i`,
`toKvmHost`,
`toUser`,
`FromIp`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toKvmHost`,
OLD.`toUser`,
OLD.`FromIp`,
'BEFORE UPDATE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`KvmHostAccess_BEFORE_DELETE` BEFORE DELETE ON `KvmHostAccess` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`KvmHostAccess-Log`
(`i`,
`toKvmHost`,
`toUser`,
`FromIp`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toKvmHost`,
OLD.`toUser`,
OLD.`FromIp`,
'BEFORE DELETE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `KvmHostAccess-Log`
--

DROP TABLE IF EXISTS `KvmHostAccess-Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KvmHostAccess-Log` (
  `j` int(11) NOT NULL AUTO_INCREMENT,
  `i` int(11) DEFAULT NULL,
  `toKvmHost` int(11) DEFAULT NULL,
  `toUser` int(11) DEFAULT NULL,
  `FromIp` varchar(45) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`j`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `KvmLVM`
--

DROP TABLE IF EXISTS `KvmLVM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KvmLVM` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `ToKvmStorage` int(11) DEFAULT NULL,
  `PartName` varchar(45) DEFAULT NULL,
  `LvmName` varchar(45) DEFAULT NULL,
  `Fmt` varchar(45) DEFAULT NULL,
  `Size` varchar(45) DEFAULT NULL,
  `Free` varchar(45) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  KEY `LinkToKvmStorage3_idx` (`ToKvmStorage`),
  CONSTRAINT `LinkToKvmStorage3` FOREIGN KEY (`ToKvmStorage`) REFERENCES `KvmStorageDevice` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='pvs';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`KvmLVM_BEFORE_INSERT` BEFORE INSERT ON `KvmLVM` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`KvmLVM-Log`
(`i`,
`ToKvmStorage`,
`PartName`,
`LvmName`,
`Fmt`,
`Size`,
`Free`,
`Comment`,
`LastUpdate`)
VALUES
(NEW.`i`,
NEW.`ToKvmStorage`,
NEW.`PartName`,
NEW.`LvmName`,
NEW.`Fmt`,
NEW.`Size`,
NEW.`Free`,
'BEFORE INSERT',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`KvmLVM_BEFORE_UPDATE` BEFORE UPDATE ON `KvmLVM` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`KvmLVM-Log`
(`i`,
`ToKvmStorage`,
`PartName`,
`LvmName`,
`Fmt`,
`Size`,
`Free`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`ToKvmStorage`,
OLD.`PartName`,
OLD.`LvmName`,
OLD.`Fmt`,
OLD.`Size`,
OLD.`Free`,
'BEFORE UPDATE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`KvmLVM_BEFORE_DELETE` BEFORE DELETE ON `KvmLVM` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`KvmLVM-Log`
(`i`,
`ToKvmStorage`,
`PartName`,
`LvmName`,
`Fmt`,
`Size`,
`Free`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`ToKvmStorage`,
OLD.`PartName`,
OLD.`LvmName`,
OLD.`Fmt`,
OLD.`Size`,
OLD.`Free`,
'BEFORE DELETE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `KvmLVM-Log`
--

DROP TABLE IF EXISTS `KvmLVM-Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KvmLVM-Log` (
  `j` int(11) NOT NULL AUTO_INCREMENT,
  `i` int(11) DEFAULT NULL,
  `ToKvmStorage` int(11) DEFAULT NULL,
  `PartName` varchar(45) DEFAULT NULL,
  `LvmName` varchar(45) DEFAULT NULL,
  `Fmt` varchar(45) DEFAULT NULL,
  `Size` varchar(45) DEFAULT NULL,
  `Free` varchar(45) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`j`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `KvmLVMmember`
--

DROP TABLE IF EXISTS `KvmLVMmember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KvmLVMmember` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `toKvmLVM` int(11) DEFAULT NULL,
  `DeviceName` varchar(45) DEFAULT NULL,
  `UUID` varchar(45) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `BlockSize` varchar(45) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  KEY `LinkToKvmLVM_idx` (`toKvmLVM`),
  CONSTRAINT `LinkToKvmLVM1` FOREIGN KEY (`toKvmLVM`) REFERENCES `KvmLVM` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='blkid,lvdisplay -m';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`KvmLVMmember_BEFORE_INSERT` BEFORE INSERT ON `KvmLVMmember` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`KvmLVMmember-Log`
(`i`,
`toKvmLVM`,
`DeviceName`,
`UUID`,
`Type`,
`BlockSize`,
`Comment`,
`LastUpdate`)
VALUES
(NEW.`i`,
NEW.`toKvmLVM`,
NEW.`DeviceName`,
NEW.`UUID`,
NEW.`Type`,
NEW.`BlockSize`,
'BEFORE INSERT',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`KvmLVMmember_BEFORE_UPDATE` BEFORE UPDATE ON `KvmLVMmember` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`KvmLVMmember-Log`
(`i`,
`toKvmLVM`,
`DeviceName`,
`UUID`,
`Type`,
`BlockSize`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toKvmLVM`,
OLD.`DeviceName`,
OLD.`UUID`,
OLD.`Type`,
OLD.`BlockSize`,
'BEFORE UPDATE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`KvmLVMmember_BEFORE_DELETE` BEFORE DELETE ON `KvmLVMmember` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`KvmLVMmember-Log`
(`i`,
`toKvmLVM`,
`DeviceName`,
`UUID`,
`Type`,
`BlockSize`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toKvmLVM`,
OLD.`DeviceName`,
OLD.`UUID`,
OLD.`Type`,
OLD.`BlockSize`,
'BEFORE DELETE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `KvmLVMmember-Log`
--

DROP TABLE IF EXISTS `KvmLVMmember-Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KvmLVMmember-Log` (
  `j` int(11) NOT NULL AUTO_INCREMENT,
  `i` int(11) DEFAULT NULL,
  `toKvmLVM` int(11) DEFAULT NULL,
  `DeviceName` varchar(45) DEFAULT NULL,
  `UUID` varchar(45) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `BlockSize` varchar(45) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`j`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `KvmNetworkInterface`
--

DROP TABLE IF EXISTS `KvmNetworkInterface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KvmNetworkInterface` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `toKvmHost` int(11) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Ip` varchar(45) DEFAULT NULL,
  `Gateway` varchar(45) DEFAULT NULL,
  `Netmask` varchar(45) DEFAULT NULL,
  `Broadcast` varchar(45) DEFAULT NULL,
  `Mac` varchar(45) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  KEY `LinkToKvmHost4_idx` (`toKvmHost`),
  CONSTRAINT `LinkToKvmHost4` FOREIGN KEY (`toKvmHost`) REFERENCES `KvmHost` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='ip a';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`KvmNetworkInterface_BEFORE_INSERT` BEFORE INSERT ON `KvmNetworkInterface` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`KvmNetworkInterface-Log`
(`i`,
`toKvmHost`,
`Name`,
`Ip`,
`Gateway`,
`Netmask`,
`Broadcast`,
`Mac`,
`Comment`,
`LastUpdate`)
VALUES
(NEW.`i`,
NEW.`toKvmHost`,
NEW.`Name`,
NEW.`Ip`,
NEW.`Gateway`,
NEW.`Netmask`,
NEW.`Broadcast`,
NEW.`Mac`,
'BEFORE INSERT',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`KvmNetworkInterface_BEFORE_UPDATE` BEFORE UPDATE ON `KvmNetworkInterface` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`KvmNetworkInterface-Log`
(`i`,
`toKvmHost`,
`Name`,
`Ip`,
`Gateway`,
`Netmask`,
`Broadcast`,
`Mac`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toKvmHost`,
OLD.`Name`,
OLD.`Ip`,
OLD.`Gateway`,
OLD.`Netmask`,
OLD.`Broadcast`,
OLD.`Mac`,
'BEFORE UPDATE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`KvmNetworkInterface_BEFORE_DELETE` BEFORE DELETE ON `KvmNetworkInterface` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`KvmNetworkInterface-Log`
(`i`,
`toKvmHost`,
`Name`,
`Ip`,
`Gateway`,
`Netmask`,
`Broadcast`,
`Mac`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toKvmHost`,
OLD.`Name`,
OLD.`Ip`,
OLD.`Gateway`,
OLD.`Netmask`,
OLD.`Broadcast`,
OLD.`Mac`,
'BEFORE DELETE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `KvmNetworkInterface-Log`
--

DROP TABLE IF EXISTS `KvmNetworkInterface-Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KvmNetworkInterface-Log` (
  `j` int(11) NOT NULL AUTO_INCREMENT,
  `i` int(11) DEFAULT NULL,
  `toKvmHost` int(11) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Ip` varchar(45) DEFAULT NULL,
  `Gateway` varchar(45) DEFAULT NULL,
  `Netmask` varchar(45) DEFAULT NULL,
  `Broadcast` varchar(45) DEFAULT NULL,
  `Mac` varchar(45) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`j`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `KvmPool`
--

DROP TABLE IF EXISTS `KvmPool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KvmPool` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `toStorageDevice` int(11) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `State` int(11) DEFAULT NULL,
  `Autostart` int(11) DEFAULT NULL,
  `UUID` varchar(45) DEFAULT NULL,
  `Format` varchar(45) DEFAULT NULL,
  `Path` varchar(45) DEFAULT NULL,
  `Capacity` bigint(20) DEFAULT NULL,
  `Allocation` bigint(20) DEFAULT NULL,
  `Available` bigint(20) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  KEY `LinkToPhysicalDevice1_idx` (`toStorageDevice`),
  CONSTRAINT `LinkToPhysicalDevice1` FOREIGN KEY (`toStorageDevice`) REFERENCES `KvmStorageDevice` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='virsh pool-list --all\nvirsh pool-dumpxml POOLNAME';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`KvmPool_BEFORE_INSERT` BEFORE INSERT ON `KvmPool` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`KvmPool-Log`
(`i`,
`toStorageDevice`,
`Type`,
`Name`,
`State`,
`Autostart`,
`UUID`,
`Format`,
`Path`,
`Capacity`,
`Allocation`,
`Available`,
`Comment`,
`LastUpdate`)
VALUES
(NEW.`i`,
NEW.`toStorageDevice`,
NEW.`Type`,
NEW.`Name`,
NEW.`State`,
NEW.`Autostart`,
NEW.`UUID`,
NEW.`Format`,
NEW.`Path`,
NEW.`Capacity`,
NEW.`Allocation`,
NEW.`Available`,
'BEFORE INSERT',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`KvmPool_BEFORE_UPDATE` BEFORE UPDATE ON `KvmPool` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`KvmPool-Log`
(`i`,
`toStorageDevice`,
`Type`,
`Name`,
`State`,
`Autostart`,
`UUID`,
`Format`,
`Path`,
`Capacity`,
`Allocation`,
`Available`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toStorageDevice`,
OLD.`Type`,
OLD.`Name`,
OLD.`State`,
OLD.`Autostart`,
OLD.`UUID`,
OLD.`Format`,
OLD.`Path`,
OLD.`Capacity`,
OLD.`Allocation`,
OLD.`Available`,
'BEFORE UPDATE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`KvmPool_BEFORE_DELETE` BEFORE DELETE ON `KvmPool` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`KvmPool-Log`
(`i`,
`toStorageDevice`,
`Type`,
`Name`,
`State`,
`Autostart`,
`UUID`,
`Format`,
`Path`,
`Capacity`,
`Allocation`,
`Available`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toStorageDevice`,
OLD.`Type`,
OLD.`Name`,
OLD.`State`,
OLD.`Autostart`,
OLD.`UUID`,
OLD.`Format`,
OLD.`Path`,
OLD.`Capacity`,
OLD.`Allocation`,
OLD.`Available`,
'BEFORE DELETE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `KvmPool-Log`
--

DROP TABLE IF EXISTS `KvmPool-Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KvmPool-Log` (
  `j` int(11) NOT NULL AUTO_INCREMENT,
  `i` int(11) DEFAULT NULL,
  `toStorageDevice` int(11) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `State` int(11) DEFAULT NULL,
  `Autostart` int(11) DEFAULT NULL,
  `UUID` varchar(45) DEFAULT NULL,
  `Format` varchar(45) DEFAULT NULL,
  `Path` varchar(45) DEFAULT NULL,
  `Capacity` bigint(20) DEFAULT NULL,
  `Allocation` bigint(20) DEFAULT NULL,
  `Available` bigint(20) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`j`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `KvmPoolExtent`
--

DROP TABLE IF EXISTS `KvmPoolExtent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KvmPoolExtent` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `toKvmPool` int(11) DEFAULT NULL,
  `Start` bigint(20) DEFAULT NULL,
  `End` bigint(20) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  KEY `LinkToKvmPool2_idx` (`toKvmPool`),
  CONSTRAINT `LinkToKvmPool2` FOREIGN KEY (`toKvmPool`) REFERENCES `KvmPool` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='virsh pool-dumpxml POOLNAME\n';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`KvmPoolExtent_BEFORE_INSERT` BEFORE INSERT ON `KvmPoolExtent` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`KvmPoolExtent-Log`
(`i`,
`toKvmPool`,
`Start`,
`End`,
`Comment`,
`LastUpdate`)
VALUES
(NEW.`i`,
NEW.`toKvmPool`,
NEW.`Start`,
NEW.`End`,
'BEFORE INSERT',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`KvmPoolExtent_BEFORE_UPDATE` BEFORE UPDATE ON `KvmPoolExtent` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`KvmPoolExtent-Log`
(`i`,
`toKvmPool`,
`Start`,
`End`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toKvmPool`,
OLD.`Start`,
OLD.`End`,
'BEFORE UPDATE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`KvmPoolExtent_BEFORE_DELETE` BEFORE DELETE ON `KvmPoolExtent` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`KvmPoolExtent-Log`
(`i`,
`toKvmPool`,
`Start`,
`End`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toKvmPool`,
OLD.`Start`,
OLD.`End`,
'BEFORE DELETE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `KvmPoolExtent-Log`
--

DROP TABLE IF EXISTS `KvmPoolExtent-Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KvmPoolExtent-Log` (
  `j` int(11) NOT NULL AUTO_INCREMENT,
  `i` int(11) DEFAULT NULL,
  `toKvmPool` int(11) DEFAULT NULL,
  `Start` bigint(20) DEFAULT NULL,
  `End` bigint(20) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`j`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `KvmStorageDevice`
--

DROP TABLE IF EXISTS `KvmStorageDevice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KvmStorageDevice` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `ToKvmHost` int(11) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `DiskType` varchar(45) DEFAULT NULL,
  `DiskId` varchar(45) DEFAULT NULL,
  `Model` varchar(45) DEFAULT NULL,
  `Capacity` varchar(45) DEFAULT NULL,
  `SectorSize` varchar(45) DEFAULT NULL,
  `Bytes` bigint(20) DEFAULT NULL,
  `Sectors` bigint(20) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  UNIQUE KEY `Name_UNIQUE` (`Name`),
  UNIQUE KEY `DiskId_UNIQUE` (`DiskId`),
  KEY `LinkToKvmHost_idx` (`ToKvmHost`),
  CONSTRAINT `LinkToKvmHost5` FOREIGN KEY (`ToKvmHost`) REFERENCES `KvmHost` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='lsblk\nfdisk DEVICE print';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`KvmStorageDevice_BEFORE_INSERT` BEFORE INSERT ON `KvmStorageDevice` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`KvmStorageDevice-Log`
(`i`,
`ToKvmHost`,
`Name`,
`DiskType`,
`DiskId`,
`Model`,
`Capacity`,
`SectorSize`,
`Bytes`,
`Sectors`,
`Comment`,
`LastUpdate`)
VALUES
(NEW.`i`,
NEW.`ToKvmHost`,
NEW.`Name`,
NEW.`DiskType`,
NEW.`DiskId`,
NEW.`Model`,
NEW.`Capacity`,
NEW.`SectorSize`,
NEW.`Bytes`,
NEW.`Sectors`,
'BEFORE INSERT',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`KvmStorageDevice_BEFORE_UPDATE` BEFORE UPDATE ON `KvmStorageDevice` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`KvmStorageDevice-Log`
(`i`,
`ToKvmHost`,
`Name`,
`DiskType`,
`DiskId`,
`Model`,
`Capacity`,
`SectorSize`,
`Bytes`,
`Sectors`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`ToKvmHost`,
OLD.`Name`,
OLD.`DiskType`,
OLD.`DiskId`,
OLD.`Model`,
OLD.`Capacity`,
OLD.`SectorSize`,
OLD.`Bytes`,
OLD.`Sectors`,
'BEFORE UPDATE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `KvmStorageDevice-Log`
--

DROP TABLE IF EXISTS `KvmStorageDevice-Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KvmStorageDevice-Log` (
  `j` int(11) NOT NULL AUTO_INCREMENT,
  `i` int(11) DEFAULT NULL,
  `ToKvmHost` int(11) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `DiskType` varchar(45) DEFAULT NULL,
  `DiskId` varchar(45) DEFAULT NULL,
  `Model` varchar(45) DEFAULT NULL,
  `Capacity` varchar(45) DEFAULT NULL,
  `SectorSize` varchar(45) DEFAULT NULL,
  `Bytes` bigint(20) DEFAULT NULL,
  `Sectors` bigint(20) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`j`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `KvmVlanSwitch`
--

DROP TABLE IF EXISTS `KvmVlanSwitch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KvmVlanSwitch` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `toKvmHost` int(11) DEFAULT NULL,
  `toNetworkInterface` int(11) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `VlanName` varchar(45) DEFAULT NULL,
  `VirtSwitch` varchar(45) DEFAULT NULL,
  `SwitchMac` varchar(45) DEFAULT NULL,
  `FromIp` varchar(45) DEFAULT NULL,
  `ToIp` varchar(45) DEFAULT NULL,
  `IpBroadcast` varchar(45) DEFAULT NULL,
  `IpNetmask` varchar(45) DEFAULT NULL,
  `IpGateway` varchar(45) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  KEY `LinkToKvmHost_idx` (`toKvmHost`),
  KEY `LinkToNetwork1_idx` (`toNetworkInterface`),
  CONSTRAINT `LinkToKvmHost1` FOREIGN KEY (`toKvmHost`) REFERENCES `KvmHost` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `LinkToNetwork1` FOREIGN KEY (`toNetworkInterface`) REFERENCES `KvmNetworkInterface` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='brctl show\nip a\nroute -n';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`KvmVlanSwitch_BEFORE_INSERT` BEFORE INSERT ON `KvmVlanSwitch` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`KvmVlanSwitch-Log`
(`i`,
`toKvmHost`,
`toNetworkInterface`,
`id`,
`VlanName`,
`VirtSwitch`,
`SwitchMac`,
`FromIp`,
`ToIp`,
`IpBroadcast`,
`IpNetmask`,
`IpGateway`,
`Comment`,
`LastUpdate`)
VALUES
(NEW.`i`,
NEW.`toKvmHost`,
NEW.`toNetworkInterface`,
NEW.`id`,
NEW.`VlanName`,
NEW.`VirtSwitch`,
NEW.`SwitchMac`,
NEW.`FromIp`,
NEW.`ToIp`,
NEW.`IpBroadcast`,
NEW.`IpNetmask`,
NEW.`IpGateway`,
'BEFORE INSERT',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`KvmVlanSwitch_BEFORE_UPDATE` BEFORE UPDATE ON `KvmVlanSwitch` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`KvmVlanSwitch-Log`
(`i`,
`toKvmHost`,
`toNetworkInterface`,
`id`,
`VlanName`,
`VirtSwitch`,
`SwitchMac`,
`FromIp`,
`ToIp`,
`IpBroadcast`,
`IpNetmask`,
`IpGateway`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toKvmHost`,
OLD.`toNetworkInterface`,
OLD.`id`,
OLD.`VlanName`,
OLD.`VirtSwitch`,
OLD.`SwitchMac`,
OLD.`FromIp`,
OLD.`ToIp`,
OLD.`IpBroadcast`,
OLD.`IpNetmask`,
OLD.`IpGateway`,
'BEFORE UPDATE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`KvmVlanSwitch_BEFORE_DELETE` BEFORE DELETE ON `KvmVlanSwitch` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`KvmVlanSwitch-Log`
(`i`,
`toKvmHost`,
`toNetworkInterface`,
`id`,
`VlanName`,
`VirtSwitch`,
`SwitchMac`,
`FromIp`,
`ToIp`,
`IpBroadcast`,
`IpNetmask`,
`IpGateway`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toKvmHost`,
OLD.`toNetworkInterface`,
OLD.`id`,
OLD.`VlanName`,
OLD.`VirtSwitch`,
OLD.`SwitchMac`,
OLD.`FromIp`,
OLD.`ToIp`,
OLD.`IpBroadcast`,
OLD.`IpNetmask`,
OLD.`IpGateway`,
'BEFORE DELETE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `KvmVlanSwitch-Log`
--

DROP TABLE IF EXISTS `KvmVlanSwitch-Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KvmVlanSwitch-Log` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `toKvmHost` int(11) DEFAULT NULL,
  `toNetworkInterface` int(11) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `VlanName` varchar(45) DEFAULT NULL,
  `VirtSwitch` varchar(45) DEFAULT NULL,
  `SwitchMac` varchar(45) DEFAULT NULL,
  `FromIp` varchar(45) DEFAULT NULL,
  `ToIp` varchar(45) DEFAULT NULL,
  `IpBroadcast` varchar(45) DEFAULT NULL,
  `IpNetmask` varchar(45) DEFAULT NULL,
  `IpGateway` varchar(45) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `KvmVolume`
--

DROP TABLE IF EXISTS `KvmVolume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KvmVolume` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `toKvmPool` int(11) DEFAULT NULL,
  `toDevicePartition` int(11) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Path` varchar(225) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `Capacity` varchar(45) DEFAULT NULL,
  `Allocation` varchar(45) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  UNIQUE KEY `Path_UNIQUE` (`Path`),
  KEY `LinkToKvmPool_idx` (`toKvmPool`),
  KEY `LinkToDevicePartition_idx` (`toDevicePartition`),
  CONSTRAINT `LinkToDevicePartition` FOREIGN KEY (`toDevicePartition`) REFERENCES `KvmDevicePartition` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `LinkToKvmPool` FOREIGN KEY (`toKvmPool`) REFERENCES `KvmPool` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COMMENT='virsh vol-list --details POOL';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`KvmVolume_BEFORE_INSERT` BEFORE INSERT ON `KvmVolume` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`KvmVolume-Log`
(`i`,
`toKvmPool`,
`toDevicePartition`,
`Name`,
`Path`,
`Type`,
`Capacity`,
`Allocation`,
`Comment`,
`LastUpdate`)
VALUES
(NEW.`i`,
NEW.`toKvmPool`,
NEW.`toDevicePartition`,
NEW.`Name`,
NEW.`Path`,
NEW.`Type`,
NEW.`Capacity`,
NEW.`Allocation`,
'BEFORE INSERT',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`KvmVolume_BEFORE_UPDATE` BEFORE UPDATE ON `KvmVolume` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`KvmVolume-Log`
(`i`,
`toKvmPool`,
`toDevicePartition`,
`Name`,
`Path`,
`Type`,
`Capacity`,
`Allocation`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toKvmPool`,
OLD.`toDevicePartition`,
OLD.`Name`,
OLD.`Path`,
OLD.`Type`,
OLD.`Capacity`,
OLD.`Allocation`,
'BEFORE UPDATE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`KvmVolume_BEFORE_DELETE` BEFORE DELETE ON `KvmVolume` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`KvmVolume-Log`
(`i`,
`toKvmPool`,
`toDevicePartition`,
`Name`,
`Path`,
`Type`,
`Capacity`,
`Allocation`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toKvmPool`,
OLD.`toDevicePartition`,
OLD.`Name`,
OLD.`Path`,
OLD.`Type`,
OLD.`Capacity`,
OLD.`Allocation`,
'BEFORE DELETE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `KvmVolume-Log`
--

DROP TABLE IF EXISTS `KvmVolume-Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KvmVolume-Log` (
  `j` int(11) NOT NULL AUTO_INCREMENT,
  `i` int(11) DEFAULT NULL,
  `toKvmPool` int(11) DEFAULT NULL,
  `toDevicePartition` int(11) DEFAULT NULL,
  `toVm` int(11) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Path` varchar(225) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `Capacity` varchar(45) DEFAULT NULL,
  `Allocation` varchar(45) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`j`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MasterNode`
--

DROP TABLE IF EXISTS `MasterNode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MasterNode` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `toVm` int(11) DEFAULT NULL,
  `toContainer` int(11) DEFAULT NULL,
  `toUser` int(11) DEFAULT NULL,
  `toCoin` int(11) DEFAULT NULL,
  `ConfigPath` varchar(255) DEFAULT NULL,
  `Config` blob DEFAULT NULL,
  `StatusCommand` varchar(255) DEFAULT NULL,
  `StatusInfo` blob DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  KEY `LinkToVm1_idx` (`toVm`),
  KEY `LinkoUser2_idx` (`toUser`),
  KEY `LinkToCoin2_idx` (`toCoin`),
  KEY `LinkToContainer_idx` (`toContainer`),
  CONSTRAINT `LinkToCoin3` FOREIGN KEY (`toCoin`) REFERENCES `Coin` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `LinkToContainer` FOREIGN KEY (`toContainer`) REFERENCES `Container` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `LinkToVm3` FOREIGN KEY (`toVm`) REFERENCES `VM` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `LinkoUser2` FOREIGN KEY (`toUser`) REFERENCES `User` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`MasterNode_BEFORE_INSERT` BEFORE INSERT ON `MasterNode` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`MasterNode-Log`
(`i`,
`toVm`,
`toContainer`,
`toUser`,
`toCoin`,
`ConfigPath`,
`Config`,
`StatusCommand`,
`StatusInfo`,
`Comment`,
`LastUpdate`)
VALUES
(NEW.`i`,
NEW.`toVm`,
NEW.`toContainer`,
NEW.`toUser`,
NEW.`toCoin`,
NEW.`ConfigPath`,
NEW.`Config`,
NEW.`StatusCommand`,
NEW.`StatusInfo`,
'BEFORE INSERT',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`MasterNode_BEFORE_UPDATE` BEFORE UPDATE ON `MasterNode` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`MasterNode-Log`
(`i`,
`toVm`,
`toContainer`,
`toUser`,
`toCoin`,
`ConfigPath`,
`Config`,
`StatusCommand`,
`StatusInfo`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toVm`,
OLD.`toContainer`,
OLD.`toUser`,
OLD.`toCoin`,
OLD.`ConfigPath`,
OLD.`Config`,
OLD.`StatusCommand`,
OLD.`StatusInfo`,
'BEFORE UPDATE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`MasterNode_BEFORE_DELETE` BEFORE DELETE ON `MasterNode` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`MasterNode-Log`
(`i`,
`toVm`,
`toContainer`,
`toUser`,
`toCoin`,
`ConfigPath`,
`Config`,
`StatusCommand`,
`StatusInfo`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toVm`,
OLD.`toContainer`,
OLD.`toUser`,
OLD.`toCoin`,
OLD.`ConfigPath`,
OLD.`Config`,
OLD.`StatusCommand`,
OLD.`StatusInfo`,
'BEFORE DELETE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `MasterNode-Log`
--

DROP TABLE IF EXISTS `MasterNode-Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MasterNode-Log` (
  `j` int(11) NOT NULL AUTO_INCREMENT,
  `i` int(11) DEFAULT NULL,
  `toVm` int(11) DEFAULT NULL,
  `toContainer` int(11) DEFAULT NULL,
  `toUser` int(11) DEFAULT NULL,
  `toCoin` int(11) DEFAULT NULL,
  `ConfigPath` varchar(255) DEFAULT NULL,
  `Config` blob DEFAULT NULL,
  `StatusCommand` varchar(255) DEFAULT NULL,
  `StatusInfo` blob DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`j`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RegistryImage`
--

DROP TABLE IF EXISTS `RegistryImage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RegistryImage` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `toCoin` int(11) DEFAULT NULL,
  `toDockerRegistry` int(11) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  KEY `LinkToCoin2_idx` (`toCoin`),
  KEY `LinkToDockerRegistry_idx` (`toDockerRegistry`),
  CONSTRAINT `LinkToCoin2` FOREIGN KEY (`toCoin`) REFERENCES `Coin` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `LinkToDockerRegistry` FOREIGN KEY (`toDockerRegistry`) REFERENCES `DockerRegistryVm` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='sudo curl -v http://localhost:6000/v2/_catalog\n\n';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`RegistryImage_BEFORE_INSERT` BEFORE INSERT ON `RegistryImage` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`RegistryImage-Log`
(`i`,
`toCoin`,
`toDockerRegistry`,
`Name`,
`Comment`,
`LastUpdate`)
VALUES
(NEW.`i`,
NEW.`toCoin`,
NEW.`toDockerRegistry`,
NEW.`Name`,
'BEFORE INSERT',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`RegistryImage_BEFORE_UPDATE` BEFORE UPDATE ON `RegistryImage` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`RegistryImage-Log`
(`i`,
`toCoin`,
`toDockerRegistry`,
`Name`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toCoin`,
OLD.`toDockerRegistry`,
OLD.`Name`,
'BEFORE UPDATE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`RegistryImage_BEFORE_DELETE` BEFORE DELETE ON `RegistryImage` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`RegistryImage-Log`
(`i`,
`toCoin`,
`toDockerRegistry`,
`Name`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toCoin`,
OLD.`toDockerRegistry`,
OLD.`Name`,
'BEFORE DELETE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `RegistryImage-Log`
--

DROP TABLE IF EXISTS `RegistryImage-Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RegistryImage-Log` (
  `j` int(11) NOT NULL AUTO_INCREMENT,
  `i` int(11) DEFAULT NULL,
  `toCoin` int(11) DEFAULT NULL,
  `toDockerRegistry` int(11) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`j`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RegistryImageContent`
--

DROP TABLE IF EXISTS `RegistryImageContent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RegistryImageContent` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `toImageTemplate` int(11) DEFAULT NULL,
  `Tag` varchar(45) DEFAULT NULL,
  `Digest` varchar(255) DEFAULT NULL,
  `Manifest` blob DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  KEY `LinkToRegistryImage_idx` (`toImageTemplate`),
  CONSTRAINT `LinkToRegistryImage` FOREIGN KEY (`toImageTemplate`) REFERENCES `RegistryImage` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='sudo curl -v http://localhost:6000/v2/tags/list\nsudo curl -v http://localhost:6000/v2/coinbase/manifest/latest';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`RegistryImageContent_BEFORE_INSERT` BEFORE INSERT ON `RegistryImageContent` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`RegistryImageContent-Log`
(`i`,
`toImageTemplate`,
`Tag`,
`Digest`,
`Manifest`,
`Comment`,
`LastUpdate`)
VALUES
(NEW.`i`,
NEW.`toImageTemplate`,
NEW.`Tag`,
NEW.`Digest`,
NEW.`Manifest`,
'BEFORE INSERT',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`RegistryImageContent_BEFORE_UPDATE` BEFORE UPDATE ON `RegistryImageContent` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`RegistryImageContent-Log`
(`i`,
`toImageTemplate`,
`Tag`,
`Digest`,
`Manifest`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toImageTemplate`,
OLD.`Tag`,
OLD.`Digest`,
OLD.`Manifest`,
'BEFORE UPDATE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`RegistryImageContent_BEFORE_DELETE` BEFORE DELETE ON `RegistryImageContent` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`RegistryImageContent-Log`
(`i`,
`toImageTemplate`,
`Tag`,
`Digest`,
`Manifest`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toImageTemplate`,
OLD.`Tag`,
OLD.`Digest`,
OLD.`Manifest`,
'BEFORE DELETE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `RegistryImageContent-Log`
--

DROP TABLE IF EXISTS `RegistryImageContent-Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RegistryImageContent-Log` (
  `j` int(11) NOT NULL AUTO_INCREMENT,
  `i` int(11) DEFAULT NULL,
  `toImageTemplate` int(11) DEFAULT NULL,
  `Tag` varchar(45) DEFAULT NULL,
  `Digest` varchar(255) DEFAULT NULL,
  `Manifest` blob DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`j`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SiteVm`
--

DROP TABLE IF EXISTS `SiteVm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SiteVm` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `toVM` int(11) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  KEY `LinkToVm_idx` (`toVM`),
  CONSTRAINT `LinkToVm` FOREIGN KEY (`toVM`) REFERENCES `VM` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='Reserved for delete VM';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`SiteVm_BEFORE_INSERT` BEFORE INSERT ON `SiteVm` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`SiteVm-Log`(
`i`,
`toVm`,
`Comment`,
`LastUpdate`
)
VALUES
(NEW.`i`,
NEW.`toVm`,
'BEFORE INSERT',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`SiteVm_BEFORE_UPDATE` BEFORE UPDATE ON `SiteVm` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`SiteVm-Log`(
`i`,
`toVm`,
`Comment`,
`LastUpdate`
)
VALUES
(OLD.`i`,
OLD.`toVm`,
'BEFORE Update',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`SiteVm_BEFORE_DELETE` BEFORE DELETE ON `SiteVm` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`SiteVm-Log`(
`i`,
`toVm`,
`Comment`,
`LastUpdate`
)
VALUES
(OLD.`i`,
OLD.`toVm`,
'BEFORE Delete',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `SiteVm-Log`
--

DROP TABLE IF EXISTS `SiteVm-Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SiteVm-Log` (
  `j` int(11) NOT NULL AUTO_INCREMENT,
  `i` int(11) DEFAULT NULL,
  `toVm` int(11) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`j`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TableDataSource`
--

DROP TABLE IF EXISTS `TableDataSource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TableDataSource` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `TableName` varchar(45) DEFAULT NULL,
  `DataSource` varchar(255) DEFAULT NULL,
  `Dump` varchar(255) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  `tst` blob DEFAULT NULL,
  PRIMARY KEY (`i`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`TableDataSource_BEFORE_INSERT` BEFORE INSERT ON `TableDataSource` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`TableDataSource-Log`
(`i`,
`TableName`,
`DataSource`,
`Dump`,
`Comment`,
`LastUpdate`)
VALUES
(NEW.`i`,
NEW.`TableName`,
NEW.`DataSource`,
NEW.`Dump`,
'BEFORE INSERT',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`TableDataSource_BEFORE_UPDATE` BEFORE UPDATE ON `TableDataSource` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`TableDataSource-Log`
(`i`,
`TableName`,
`DataSource`,
`Dump`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`TableName`,
OLD.`DataSource`,
OLD.`Dump`,
'BEFORE UPDATE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`TableDataSource_BEFORE_DELETE` BEFORE DELETE ON `TableDataSource` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`TableDataSource-Log`
(`i`,
`TableName`,
`DataSource`,
`Dump`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`TableName`,
OLD.`DataSource`,
OLD.`Dump`,
'BEFORE DELETE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `TableDataSource-Log`
--

DROP TABLE IF EXISTS `TableDataSource-Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TableDataSource-Log` (
  `j` int(11) NOT NULL AUTO_INCREMENT,
  `i` int(11) DEFAULT NULL,
  `TableName` varchar(45) DEFAULT NULL,
  `DataSource` varchar(255) DEFAULT NULL,
  `Dump` varchar(255) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`j`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `Password` blob DEFAULT NULL,
  `IsAdmin` int(11) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  `tst` blob DEFAULT NULL,
  PRIMARY KEY (`i`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `User-Log`
--

DROP TABLE IF EXISTS `User-Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User-Log` (
  `j` int(11) NOT NULL AUTO_INCREMENT,
  `i` int(11) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`j`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `VM`
--

DROP TABLE IF EXISTS `VM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VM` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `toKvmHost` int(11) DEFAULT NULL,
  `toUser` int(11) DEFAULT NULL,
  `UUID` varchar(45) DEFAULT NULL,
  `Id` varchar(45) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `OsVersion` varchar(45) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `CpuSet` varchar(45) DEFAULT NULL,
  `Vcpu` varchar(45) DEFAULT NULL,
  `Memory` int(11) DEFAULT NULL,
  `SpicePort` int(11) DEFAULT NULL,
  `MacAdr` varchar(45) DEFAULT NULL,
  `AdminLogin` varchar(45) DEFAULT NULL,
  `AdminPassword` blob DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  KEY `LinkToUser_idx` (`toUser`),
  KEY `LinkToKvmHost_idx` (`toKvmHost`),
  CONSTRAINT `LinkToKvmHost3` FOREIGN KEY (`toKvmHost`) REFERENCES `KvmHost` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `LinkToUser` FOREIGN KEY (`toUser`) REFERENCES `User` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COMMENT='virsh list --all\\n\nvirsh dumpxml VMNAME';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`VM_BEFORE_INSERT` BEFORE INSERT ON `VM` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`VM-Log`
(`i`,
`toKvmHost`,
`toUser`,
`UUID`,
`Id`,
`Name`,
`OsVersion`,
`State`,
`CpuSet`,
`Vcpu`,
`Memory`,
`SpicePort`,
`MacAdr`,
`AdminLogin`,
`AdminPassword`,
`Comment`,
`LastUpdate`)
VALUES
(NEW.`i`,
NEW.`toKvmHost`,
NEW.`toUser`,
NEW.`UUID`,
NEW.`Id`,
NEW.`Name`,
NEW.`OsVersion`,
NEW.`State`,
NEW.`CpuSet`,
NEW.`Vcpu`,
NEW.`Memory`,
NEW.`SpicePort`,
NEW.`MacAdr`,
NEW.`AdminLogin`,
NEW.`AdminPassword`,
'BEFORE INSERT',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`VM_BEFORE_UPDATE` BEFORE UPDATE ON `VM` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`VM-Log`
(`i`,
`toKvmHost`,
`toUser`,
`UUID`,
`Id`,
`Name`,
`OsVersion`,
`State`,
`CpuSet`,
`Vcpu`,
`Memory`,
`SpicePort`,
`MacAdr`,
`AdminLogin`,
`AdminPassword`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toKvmHost`,
OLD.`toUser`,
OLD.`UUID`,
OLD.`Id`,
OLD.`Name`,
OLD.`OsVersion`,
OLD.`State`,
OLD.`CpuSet`,
OLD.`Vcpu`,
OLD.`Memory`,
OLD.`SpicePort`,
OLD.`MacAdr`,
OLD.`AdminLogin`,
OLD.`AdminPassword`,
'BEFORE UPDATE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`VM_BEFORE_DELETE` BEFORE DELETE ON `VM` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`VM-Log`
(`i`,
`toKvmHost`,
`toUser`,
`UUID`,
`Id`,
`Name`,
`OsVersion`,
`State`,
`CpuSet`,
`Vcpu`,
`Memory`,
`SpicePort`,
`MacAdr`,
`AdminLogin`,
`AdminPassword`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toKvmHost`,
OLD.`toUser`,
OLD.`UUID`,
OLD.`Id`,
OLD.`Name`,
OLD.`OsVersion`,
OLD.`State`,
OLD.`CpuSet`,
OLD.`Vcpu`,
OLD.`Memory`,
OLD.`SpicePort`,
OLD.`MacAdr`,
OLD.`AdminLogin`,
OLD.`AdminPassword`,
'BEFORE DELETE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `VM-Log`
--

DROP TABLE IF EXISTS `VM-Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VM-Log` (
  `j` int(11) NOT NULL AUTO_INCREMENT,
  `i` int(11) DEFAULT NULL,
  `toKvmHost` int(11) DEFAULT NULL,
  `toUser` int(11) DEFAULT NULL,
  `UUID` varchar(45) DEFAULT NULL,
  `Id` varchar(45) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `OsVersion` varchar(45) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `CpuSet` varchar(45) DEFAULT NULL,
  `Vcpu` varchar(45) DEFAULT NULL,
  `Memory` int(11) DEFAULT NULL,
  `SpicePort` int(11) DEFAULT NULL,
  `MacAdr` varchar(45) DEFAULT NULL,
  `AdminLogin` varchar(45) DEFAULT NULL,
  `AdminPassword` blob DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`j`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `VmDisk`
--

DROP TABLE IF EXISTS `VmDisk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VmDisk` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `toVm` int(11) DEFAULT NULL,
  `toKvmVolume` int(11) DEFAULT NULL,
  `Comment` varchar(45) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  KEY `LinkToVm9_idx` (`toVm`),
  KEY `LinkToKvmVolume9_idx` (`toKvmVolume`),
  CONSTRAINT `LinkToKvmVolume9` FOREIGN KEY (`toKvmVolume`) REFERENCES `KvmVolume` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `LinkToVm9` FOREIGN KEY (`toVm`) REFERENCES `VM` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`VmDisk_BEFORE_INSERT` BEFORE INSERT ON `VmDisk` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`VmDisk-Log`
(`i`,
`toKvmVolume`,
`toVm`,
`Comment`,
`LastUpdate`)
VALUES
(NEW.`i`,
NEW.`toKvmVolume`,
NEW.`toVm`,
'BEFORE INSERT',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`VmDisk_BEFORE_UPDATE` BEFORE UPDATE ON `VmDisk` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`VmDisk-Log`
(`i`,
`toKvmVolume`,
`toVm`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toKvmVolume`,
OLD.`toVm`,
'BEFORE UPDATE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`VmDisk_BEFORE_DELETE` BEFORE DELETE ON `VmDisk` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`VmDisk-Log`
(`i`,
`toKvmVolume`,
`toVm`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toKvmVolume`,
OLD.`toVm`,
'BEFORE DELETE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `VmDisk-Log`
--

DROP TABLE IF EXISTS `VmDisk-Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VmDisk-Log` (
  `j` int(11) NOT NULL AUTO_INCREMENT,
  `i` int(11) DEFAULT NULL,
  `toVm` int(11) DEFAULT NULL,
  `toKvmVolume` int(11) DEFAULT NULL,
  `Comment` varchar(45) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`j`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `VmIp`
--

DROP TABLE IF EXISTS `VmIp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VmIp` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `toKvmBridgePort` int(11) DEFAULT NULL,
  `toVm` int(11) DEFAULT NULL,
  `Ip` varchar(45) DEFAULT NULL,
  `Comment` varchar(45) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  KEY `LinkToKvmBridge2_idx` (`toKvmBridgePort`),
  KEY `LinkToVm2_idx` (`toVm`),
  KEY `LinkToKvmBridge3_idx` (`toKvmBridgePort`),
  KEY `LinkToVm3_idx` (`toVm`),
  KEY `LinkToKvmBridge5_idx` (`toKvmBridgePort`),
  KEY `LinkToVm5_idx` (`toVm`),
  KEY `LinkToKvmBridge6_idx` (`toKvmBridgePort`),
  KEY `LinkToVm6_idx` (`toVm`),
  KEY `LinkToKvmBridge7_idx` (`toKvmBridgePort`),
  KEY `LinkToVm7_idx` (`toVm`),
  CONSTRAINT `LinkToKvmBridge7` FOREIGN KEY (`toKvmBridgePort`) REFERENCES `KvmBridgePort` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `LinkToVm7` FOREIGN KEY (`toVm`) REFERENCES `VM` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COMMENT='arping from-to (inside bridge)';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`VmIp_BEFORE_INSERT` BEFORE INSERT ON `VmIp` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`VmIp-Log`
(`i`,
`toKvmBridgePort`,
`toVm`,
`Ip`,
`Comment`,
`LastUpdate`)
VALUES
(NEW.`i`,
NEW.`toKvmBridgePort`,
NEW.`toVm`,
NEW.`Ip`,
'BEFORE INSERT',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`VmIp_BEFORE_UPDATE` BEFORE UPDATE ON `VmIp` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`VmIp-Log`
(`i`,
`toKvmBridgePort`,
`toVm`,
`Ip`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toKvmBridgePort`,
OLD.`toVm`,
OLD.`Ip`,
'BEFORE UPDATE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cryptochest`@`%`*/ /*!50003 TRIGGER `KvmHostingManagement`.`VmIp_BEFORE_DELETE` BEFORE DELETE ON `VmIp` FOR EACH ROW
BEGIN
INSERT INTO `KvmHostingManagement`.`VmIp-Log`
(`i`,
`toKvmBridgePort`,
`toVm`,
`Ip`,
`Comment`,
`LastUpdate`)
VALUES
(OLD.`i`,
OLD.`toKvmBridgePort`,
OLD.`toVm`,
OLD.`Ip`,
'BEFORE DELETE',
NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `VmIp-Log`
--

DROP TABLE IF EXISTS `VmIp-Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VmIp-Log` (
  `j` int(11) NOT NULL AUTO_INCREMENT,
  `i` int(11) DEFAULT NULL,
  `toKvmBridgePort` int(11) DEFAULT NULL,
  `toVm` int(11) DEFAULT NULL,
  `Ip` varchar(45) DEFAULT NULL,
  `Comment` varchar(45) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`j`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `GetDockerHub`
--

/*!50001 DROP TABLE IF EXISTS `GetDockerHub`*/;
/*!50001 DROP VIEW IF EXISTS `GetDockerHub`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cryptochest`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `GetDockerHub` AS select `DockerHubVm`.`i` AS `i`,`DockerHubVm`.`ToVM` AS `ToVM`,`DockerHubVm`.`Url` AS `Url`,`DockerHubVm`.`Port` AS `Port`,`DockerHubVm`.`Login` AS `Login`,`VM`.`Name` AS `VmName` from (`DockerHubVm` join `VM` on(`DockerHubVm`.`ToVM` = `VM`.`i`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `GetDockerImage`
--

/*!50001 DROP TABLE IF EXISTS `GetDockerImage`*/;
/*!50001 DROP VIEW IF EXISTS `GetDockerImage`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cryptochest`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `GetDockerImage` AS select `DockerImage`.`i` AS `i`,`DockerImage`.`toDockerHub` AS `toDockerHub`,`DockerImage`.`Id` AS `Id`,`DockerImage`.`ParentId` AS `ParentId`,`DockerImageTag`.`Tag` AS `Tag`,`DockerImageTag`.`Digest` AS `Digest`,`DockerImage`.`toRegistryImageContent` AS `toRegistryImageContent`,`DockerImage`.`Containers` AS `Containers`,`DockerImage`.`Created` AS `Created`,`DockerImage`.`SharedSize` AS `SharedSize`,`DockerImage`.`Size` AS `Size`,`DockerImage`.`VirtualSize` AS `VirtualSize`,`DockerImage`.`Comment` AS `Comment`,`DockerImage`.`LastUpdate` AS `LastUpdate` from (`DockerImageTag` join `DockerImage` on(`DockerImage`.`i` = `DockerImageTag`.`toDockerImage`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `GetDockerVolume`
--

/*!50001 DROP TABLE IF EXISTS `GetDockerVolume`*/;
/*!50001 DROP VIEW IF EXISTS `GetDockerVolume`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cryptochest`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `GetDockerVolume` AS select `DockerVolume`.`i` AS `i`,`DockerVolume`.`toDockerHubVm` AS `toDockerHubVm`,`DockerVolume`.`CreatedAt` AS `CreatedAt`,`DockerVolume`.`Driver` AS `Driver`,`DockerVolume`.`Mountpoint` AS `Mountpoint`,`DockerVolume`.`Name` AS `DockerVolumeName`,`DockerVolume`.`Scope` AS `Scope`,`DockerVolume`.`Comment` AS `Comment`,`DockerVolume`.`LastUpdate` AS `LastUpdate`,`ContainerMount`.`Type` AS `Type`,`ContainerMount`.`Source` AS `Source`,`ContainerMount`.`Destination` AS `Destination`,`ContainerMount`.`Mode` AS `Mode`,`ContainerMount`.`Propagation` AS `Propagation`,`ContainerNames`.`Name` AS `ContainerName`,`Container`.`Id` AS `ContainerId` from (((`DockerVolume` join `ContainerMount` on(`ContainerMount`.`toVolume` = `DockerVolume`.`i`)) join `Container` on(`ContainerMount`.`toContainer` = `Container`.`i`)) join `ContainerNames` on(`ContainerNames`.`toContainer` = `Container`.`i`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `GetFreeKvmVolume`
--

/*!50001 DROP TABLE IF EXISTS `GetFreeKvmVolume`*/;
/*!50001 DROP VIEW IF EXISTS `GetFreeKvmVolume`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cryptochest`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `GetFreeKvmVolume` AS select `V`.`i` AS `i`,`V`.`toKvmPool` AS `toKvmPool`,`V`.`toDevicePartition` AS `toDevicePartition`,`V`.`Name` AS `Name`,`V`.`Path` AS `Path`,`V`.`Type` AS `Type`,`V`.`Capacity` AS `Capacity`,`V`.`Allocation` AS `Allocation`,`V`.`Comment` AS `Comment`,`V`.`LastUpdate` AS `LastUpdate` from `KvmVolume` `V` where !exists(select 1 from `VmDisk` where `V`.`i` = `VmDisk`.`toKvmVolume` limit 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `GetKvmVolume`
--

/*!50001 DROP TABLE IF EXISTS `GetKvmVolume`*/;
/*!50001 DROP VIEW IF EXISTS `GetKvmVolume`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cryptochest`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `GetKvmVolume` AS select `KvmVolume`.`i` AS `i`,`KvmVolume`.`toKvmPool` AS `toKvmPool`,`KvmVolume`.`toDevicePartition` AS `toDevicePartition`,`KvmVolume`.`Name` AS `Name`,`KvmVolume`.`Path` AS `Path`,`KvmVolume`.`Type` AS `Type`,`KvmVolume`.`Capacity` AS `Capacity`,`KvmVolume`.`Allocation` AS `Allocation`,`KvmVolume`.`Comment` AS `Comment`,`KvmVolume`.`LastUpdate` AS `LastUpdate`,`VM`.`Name` AS `VmName`,`VM`.`i` AS `VmI` from ((`KvmVolume` join `VmDisk` on(`KvmVolume`.`i` = `VmDisk`.`toKvmVolume`)) join `VM` on(`VM`.`i` = `VmDisk`.`toVm`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `GetServerStorage`
--

/*!50001 DROP TABLE IF EXISTS `GetServerStorage`*/;
/*!50001 DROP VIEW IF EXISTS `GetServerStorage`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cryptochest`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `GetServerStorage` AS select `KvmStorageDevice`.`i` AS `KvmStorageDevice_i`,`KvmStorageDevice`.`ToKvmHost` AS `KvmStorageDevice_ToKvmHost`,`KvmStorageDevice`.`Name` AS `KvmStorageDevice_Name`,`KvmStorageDevice`.`DiskType` AS `KvmStorageDevice_DiskType`,`KvmStorageDevice`.`DiskId` AS `KvmStorageDevice_DiskId`,`KvmStorageDevice`.`Model` AS `KvmStorageDevice_Model`,`KvmStorageDevice`.`Capacity` AS `KvmStorageDevice_Capacity`,`KvmStorageDevice`.`SectorSize` AS `KvmStorageDevice_SectorSize`,`KvmStorageDevice`.`Bytes` AS `KvmStorageDevice_Bytes`,`KvmStorageDevice`.`Sectors` AS `KvmStorageDevice_Sectors`,`KvmStorageDevice`.`Comment` AS `KvmStorageDevice_Comment`,`KvmStorageDevice`.`LastUpdate` AS `KvmStorageDevice_LastUpdate`,`KvmPool`.`i` AS `KvmPool_i`,`KvmPool`.`toStorageDevice` AS `KvmPool_toStorageDevice`,`KvmPool`.`Type` AS `KvmPool_Type`,`KvmPool`.`Name` AS `KvmPool_Name`,`KvmPool`.`State` AS `KvmPool_State`,`KvmPool`.`Autostart` AS `KvmPool_Autostart`,`KvmPool`.`UUID` AS `KvmPool_UUID`,`KvmPool`.`Format` AS `KvmPool_Format`,`KvmPool`.`Path` AS `KvmPool_Path`,`KvmPool`.`Capacity` AS `KvmPool_Capacity`,`KvmPool`.`Allocation` AS `KvmPool_Allocation`,`KvmPool`.`Available` AS `KvmPool_Available`,`KvmPool`.`Comment` AS `KvmPool_Comment`,`KvmPool`.`LastUpdate` AS `KvmPool_LastUpdate`,`KvmLVM`.`i` AS `KvmLVM_i`,`KvmLVM`.`ToKvmStorage` AS `KvmLVM_ToKvmStorage`,`KvmLVM`.`PartName` AS `KvmLVM_PartName`,`KvmLVM`.`LvmName` AS `KvmLVM_LvmName`,`KvmLVM`.`Fmt` AS `KvmLVM_Fmt`,`KvmLVM`.`Size` AS `KvmLVM_Size`,`KvmLVM`.`Free` AS `KvmLVM_Free`,`KvmLVM`.`Comment` AS `KvmLVM_Comment`,`KvmLVM`.`LastUpdate` AS `KvmLVM_LastUpdate` from ((`KvmStorageDevice` join `KvmPool` on(`KvmStorageDevice`.`i` = `KvmPool`.`toStorageDevice`)) left join `KvmLVM` on(`KvmStorageDevice`.`i` = `KvmLVM`.`ToKvmStorage`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `GetSpecialVm`
--

/*!50001 DROP TABLE IF EXISTS `GetSpecialVm`*/;
/*!50001 DROP VIEW IF EXISTS `GetSpecialVm`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cryptochest`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `GetSpecialVm` AS select case when (select distinct 1 from `DockerHubVm` where `V`.`i` = `DockerHubVm`.`ToVM`) then 1 else NULL end AS `DockerHubVm`,case when (select distinct 1 from `DockerRegistryVm` where `V`.`i` = `DockerRegistryVm`.`toVm`) then 1 else NULL end AS `DockerRegistryVm`,case when (select distinct 1 from `SiteVm` where `V`.`i` = `SiteVm`.`toVM`) then 1 else NULL end AS `SiteVm`,case when (select distinct 1 from `ArpScanVm` where `V`.`i` = `ArpScanVm`.`ToVm`) then 1 else NULL end AS `ArpScanVm`,`V`.`i` AS `i`,`V`.`toKvmHost` AS `toKvmHost`,`V`.`toUser` AS `toUser`,`V`.`UUID` AS `UUID`,`V`.`Id` AS `Id`,`V`.`Name` AS `Name`,`V`.`OsVersion` AS `OsVersion`,`V`.`State` AS `State`,`V`.`CpuSet` AS `CpuSet`,`V`.`Vcpu` AS `Vcpu`,`V`.`Memory` AS `Memory`,`V`.`SpicePort` AS `SpicePort`,`V`.`MacAdr` AS `MacAdr`,`V`.`AdminLogin` AS `AdminLogin`,`V`.`AdminPassword` AS `AdminPassword`,`V`.`Comment` AS `Comment`,`V`.`LastUpdate` AS `LastUpdate` from `VM` `V` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `GetVmIp`
--

/*!50001 DROP TABLE IF EXISTS `GetVmIp`*/;
/*!50001 DROP VIEW IF EXISTS `GetVmIp`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cryptochest`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `GetVmIp` AS select `VmIp`.`i` AS `i`,`VmIp`.`Ip` AS `Ip`,`VmIp`.`toKvmBridgePort` AS `toKvmBridgePort`,`VmIp`.`toVm` AS `toVm`,`VmIp`.`Comment` AS `Comment`,`VmIp`.`LastUpdate` AS `LastUpdate`,`VM`.`Name` AS `VmName`,`VM`.`AdminLogin` AS `AdminLogin`,`KvmBridgePort`.`Name` AS `KvmBridgePort_Name`,`KvmBridgePort`.`BridgePort` AS `KvmBridgePort_BridgePort`,`KvmBridge`.`i` AS `Bridge_i`,`KvmBridge`.`toKvmVlanSwitch` AS `Bridge_toKvmVlanSwitch`,`KvmBridge`.`Name` AS `Bridge_Name` from (((`VM` join `VmIp` on(`VM`.`i` = `VmIp`.`toVm`)) join `KvmBridgePort` on(`VmIp`.`toKvmBridgePort` = `KvmBridgePort`.`i`)) join `KvmBridge` on(`KvmBridge`.`i` = `KvmBridgePort`.`toKvmBridge`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-14 10:01:15

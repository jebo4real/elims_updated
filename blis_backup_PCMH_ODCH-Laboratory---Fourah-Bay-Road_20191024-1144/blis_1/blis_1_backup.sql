-- MySQL dump 10.11
--
-- Host: localhost    Database: blis_1
-- ------------------------------------------------------
-- Server version	5.0.41-community-nt

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
-- Current Database: `blis_1`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `blis_1` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci */;

USE `blis_1`;

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
CREATE TABLE `bills` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `patient_id` int(11) unsigned NOT NULL,
  `paid_in_full` bit(1) NOT NULL default '\0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bills_test_association`
--

DROP TABLE IF EXISTS `bills_test_association`;
CREATE TABLE `bills_test_association` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `bill_id` int(11) unsigned NOT NULL,
  `test_id` int(11) unsigned NOT NULL,
  `discount_type` int(4) unsigned NOT NULL default '1000',
  `discount_amount` decimal(10,2) unsigned NOT NULL default '0.00',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `bills_test_association`
--

LOCK TABLES `bills_test_association` WRITE;
/*!40000 ALTER TABLE `bills_test_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `bills_test_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `username` varchar(45) NOT NULL default '',
  `page` varchar(45) NOT NULL default '',
  `comment` varchar(150) NOT NULL default '',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_conversion`
--

DROP TABLE IF EXISTS `currency_conversion`;
CREATE TABLE `currency_conversion` (
  `currencya` varchar(200) NOT NULL,
  `currencyb` varchar(200) NOT NULL,
  `exchangerate` float(5,2) default NULL,
  `updatedts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `flag1` int(11) default NULL,
  `flag2` int(11) default NULL,
  `setting1` varchar(200) default NULL,
  `setting2` varchar(200) default NULL,
  PRIMARY KEY  (`currencya`,`currencyb`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currency_conversion`
--

LOCK TABLES `currency_conversion` WRITE;
/*!40000 ALTER TABLE `currency_conversion` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency_conversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_field_type`
--

DROP TABLE IF EXISTS `custom_field_type`;
CREATE TABLE `custom_field_type` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_type` varchar(45) default NULL,
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custom_field_type`
--

LOCK TABLES `custom_field_type` WRITE;
/*!40000 ALTER TABLE `custom_field_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_field_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delay_measures`
--

DROP TABLE IF EXISTS `delay_measures`;
CREATE TABLE `delay_measures` (
  `User_Id` varchar(50) NOT NULL default '',
  `IP_Address` varchar(16) NOT NULL default '',
  `Latency` int(11) NOT NULL default '0',
  `Recorded_At` datetime NOT NULL default '0000-00-00 00:00:00',
  `Page_Name` varchar(45) default NULL,
  `Request_URI` varchar(100) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `delay_measures`
--

LOCK TABLES `delay_measures` WRITE;
/*!40000 ALTER TABLE `delay_measures` DISABLE KEYS */;
/*!40000 ALTER TABLE `delay_measures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_order`
--

DROP TABLE IF EXISTS `field_order`;
CREATE TABLE `field_order` (
  `id` int(11) NOT NULL auto_increment,
  `lab_config_id` int(11) unsigned default NULL,
  `form_id` int(11) default NULL,
  `field_order` varchar(2000) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `field_order`
--

LOCK TABLES `field_order` WRITE;
/*!40000 ALTER TABLE `field_order` DISABLE KEYS */;
INSERT INTO `field_order` VALUES (47,1,2,'Specimen ID,Specimen Additional ID,Comments,Lab Reciept Date,Physician,Ward'),(46,1,1,'Patient ID,Daily Number,Patient Name,Sex,Age,Date of Birth,Address,Marital Status,Ward/Chiefdom,Patient Phone Number,District,Occupation,Contact Person Name,Contact Person Phone No');
/*!40000 ALTER TABLE `field_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_reagent`
--

DROP TABLE IF EXISTS `inv_reagent`;
CREATE TABLE `inv_reagent` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) collate latin1_general_ci NOT NULL,
  `unit` varchar(45) collate latin1_general_ci NOT NULL default 'units',
  `remarks` varchar(245) collate latin1_general_ci default NULL,
  `created_by` varchar(10) collate latin1_general_ci NOT NULL default '0',
  `assocation` varchar(10) collate latin1_general_ci default '0',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `inv_reagent`
--

LOCK TABLES `inv_reagent` WRITE;
/*!40000 ALTER TABLE `inv_reagent` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_reagent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_supply`
--

DROP TABLE IF EXISTS `inv_supply`;
CREATE TABLE `inv_supply` (
  `id` int(11) NOT NULL auto_increment,
  `reagent_id` int(11) NOT NULL,
  `lot` varchar(100) collate latin1_general_ci NOT NULL,
  `expiry_date` date default NULL,
  `manufacturer` varchar(100) collate latin1_general_ci default NULL,
  `supplier` varchar(100) collate latin1_general_ci default NULL,
  `quantity_ordered` int(11) NOT NULL default '0',
  `quantity_supplied` int(11) NOT NULL default '0',
  `cost_per_unit` decimal(10,0) default NULL,
  `user_id` int(11) NOT NULL default '0',
  `date_of_order` date default NULL,
  `date_of_supply` date default NULL,
  `date_of_reception` date default NULL,
  `remarks` varchar(250) collate latin1_general_ci default NULL,
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `reagent_id` (`reagent_id`),
  CONSTRAINT `reagent_id` FOREIGN KEY (`reagent_id`) REFERENCES `inv_reagent` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `inv_supply`
--

LOCK TABLES `inv_supply` WRITE;
/*!40000 ALTER TABLE `inv_supply` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_supply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_usage`
--

DROP TABLE IF EXISTS `inv_usage`;
CREATE TABLE `inv_usage` (
  `id` int(11) NOT NULL auto_increment,
  `reagent_id` int(11) NOT NULL,
  `lot` varchar(100) collate latin1_general_ci NOT NULL,
  `quantity_used` int(11) NOT NULL default '0',
  `date_of_use` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `remarks` varchar(250) collate latin1_general_ci default NULL,
  `ts` timestamp NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `reagent_id` (`reagent_id`),
  KEY `reagent_id2` (`reagent_id`),
  CONSTRAINT `reagent_id2` FOREIGN KEY (`reagent_id`) REFERENCES `inv_reagent` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `inv_usage`
--

LOCK TABLES `inv_usage` WRITE;
/*!40000 ALTER TABLE `inv_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_config`
--

DROP TABLE IF EXISTS `lab_config`;
CREATE TABLE `lab_config` (
  `lab_config_id` int(10) unsigned NOT NULL auto_increment,
  `name` char(45) NOT NULL default '',
  `location` char(45) NOT NULL default '',
  `admin_user_id` int(10) unsigned NOT NULL default '0',
  `db_name` char(45) NOT NULL default '',
  `id_mode` int(10) unsigned NOT NULL default '2',
  `p_addl` int(10) unsigned NOT NULL default '0',
  `s_addl` int(10) unsigned NOT NULL default '0',
  `daily_num` int(10) unsigned NOT NULL default '1',
  `pid` int(10) unsigned NOT NULL default '2',
  `pname` int(10) unsigned NOT NULL default '1',
  `sex` int(10) unsigned NOT NULL default '2',
  `age` int(10) unsigned NOT NULL default '1',
  `dob` int(10) unsigned NOT NULL default '1',
  `sid` int(10) unsigned NOT NULL default '2',
  `refout` int(10) unsigned NOT NULL default '1',
  `rdate` int(10) unsigned NOT NULL default '2',
  `comm` int(10) unsigned NOT NULL default '1',
  `dformat` varchar(45) NOT NULL default 'd-m-Y',
  `dnum_reset` int(10) unsigned NOT NULL default '1',
  `doctor` int(10) unsigned NOT NULL default '1',
  PRIMARY KEY  (`lab_config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;

--
-- Dumping data for table `lab_config`
--

LOCK TABLES `lab_config` WRITE;
/*!40000 ALTER TABLE `lab_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_config_access`
--

DROP TABLE IF EXISTS `lab_config_access`;
CREATE TABLE `lab_config_access` (
  `user_id` int(10) unsigned NOT NULL default '0',
  `lab_config_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`user_id`,`lab_config_id`),
  KEY `lab_config_id` (`lab_config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lab_config_access`
--

LOCK TABLES `lab_config_access` WRITE;
/*!40000 ALTER TABLE `lab_config_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_config_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_config_settings`
--

DROP TABLE IF EXISTS `lab_config_settings`;
CREATE TABLE `lab_config_settings` (
  `id` int(11) NOT NULL,
  `flag1` int(11) default NULL,
  `flag2` int(11) default NULL,
  `flag3` int(11) default NULL,
  `flag4` int(11) default NULL,
  `setting1` varchar(200) collate latin1_general_ci default NULL,
  `setting2` varchar(200) collate latin1_general_ci default NULL,
  `setting3` varchar(200) collate latin1_general_ci default NULL,
  `setting4` varchar(200) collate latin1_general_ci default NULL,
  `misc` varchar(500) collate latin1_general_ci default NULL,
  `remarks` varchar(500) collate latin1_general_ci default NULL,
  `ts` timestamp NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `lab_config_settings`
--

LOCK TABLES `lab_config_settings` WRITE;
/*!40000 ALTER TABLE `lab_config_settings` DISABLE KEYS */;
INSERT INTO `lab_config_settings` VALUES (1,1,2,30,11,'code39',NULL,NULL,NULL,NULL,'Barcode Settings','2019-09-15 19:30:08'),(2,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Search Settings','2019-09-15 19:30:08'),(3,1,NULL,NULL,NULL,'USD','.',NULL,NULL,NULL,'Billing Settings','2019-09-15 19:30:08');
/*!40000 ALTER TABLE `lab_config_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_config_specimen_type`
--

DROP TABLE IF EXISTS `lab_config_specimen_type`;
CREATE TABLE `lab_config_specimen_type` (
  `lab_config_id` int(10) unsigned NOT NULL default '0',
  `specimen_type_id` int(10) unsigned NOT NULL default '0',
  KEY `lab_config_id` (`lab_config_id`),
  KEY `specimen_type_id` (`specimen_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lab_config_specimen_type`
--

LOCK TABLES `lab_config_specimen_type` WRITE;
/*!40000 ALTER TABLE `lab_config_specimen_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_config_specimen_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_config_test_type`
--

DROP TABLE IF EXISTS `lab_config_test_type`;
CREATE TABLE `lab_config_test_type` (
  `lab_config_id` int(10) unsigned NOT NULL default '0',
  `test_type_id` int(10) unsigned NOT NULL default '0',
  KEY `lab_config_id` (`lab_config_id`),
  KEY `test_type_id` (`test_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lab_config_test_type`
--

LOCK TABLES `lab_config_test_type` WRITE;
/*!40000 ALTER TABLE `lab_config_test_type` DISABLE KEYS */;
INSERT INTO `lab_config_test_type` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20);
/*!40000 ALTER TABLE `lab_config_test_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labtitle_custom_field`
--

DROP TABLE IF EXISTS `labtitle_custom_field`;
CREATE TABLE `labtitle_custom_field` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_name` varchar(45) NOT NULL,
  `field_options` tinytext NOT NULL,
  `field_type_id` int(11) unsigned NOT NULL default '0',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `field_type_id` (`field_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `labtitle_custom_field`
--

LOCK TABLES `labtitle_custom_field` WRITE;
/*!40000 ALTER TABLE `labtitle_custom_field` DISABLE KEYS */;
INSERT INTO `labtitle_custom_field` VALUES (1,'Titles','Dr./CHO/Nurse',3,'2019-09-16 14:00:40');
/*!40000 ALTER TABLE `labtitle_custom_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measure`
--

DROP TABLE IF EXISTS `measure`;
CREATE TABLE `measure` (
  `measure_id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL default '',
  `unit_id` int(10) unsigned default NULL,
  `range` varchar(500) default NULL,
  `description` varchar(500) default NULL,
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `unit` varchar(30) default NULL,
  PRIMARY KEY  (`measure_id`),
  KEY `unit_id` (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `measure`
--

LOCK TABLES `measure` WRITE;
/*!40000 ALTER TABLE `measure` DISABLE KEYS */;
INSERT INTO `measure` VALUES (1,'GGT',NULL,':',NULL,'2019-09-16 12:44:30','U/l'),(2,'Urea',NULL,':',NULL,'2019-09-16 12:47:53','mmol/l'),(3,'Urea ',NULL,':',NULL,'2019-09-16 12:48:56','mmol/24hrs'),(4,'Creatinine',NULL,':',NULL,'2019-09-16 12:51:45','umol/l'),(5,'Creatinine',NULL,':',NULL,'2019-09-16 12:57:21','umol/l'),(6,'Urea S',NULL,':',NULL,'2019-09-16 12:57:21','mmol/l'),(7,'Urea U',NULL,':',NULL,'2019-09-16 12:57:21','mmol/24hrs'),(8,'Potassium',NULL,':',NULL,'2019-09-16 13:01:28','mmol/l'),(9,'Fasting Blood Sugar',NULL,':',NULL,'2019-09-16 13:04:02','mmol/l'),(10,'Cholesterol',NULL,':',NULL,'2019-09-16 13:05:05','mmol/l'),(11,'Triglycerides',NULL,':',NULL,'2019-09-16 13:06:10','mmol/l'),(12,'Cholesterol',NULL,':',NULL,'2019-09-16 13:08:06','mmol/l'),(13,'Triglycerides',NULL,':',NULL,'2019-09-16 13:08:06','mmol/l'),(14,'ALP',NULL,':',NULL,'2019-09-16 13:17:21','U/l'),(15,'AST',NULL,':',NULL,'2019-09-16 13:19:00','U/l'),(16,'ALT',NULL,':',NULL,'2019-09-16 13:20:13','U/l'),(17,'Albumin',NULL,':',NULL,'2019-09-16 13:21:53','g/L'),(18,'Total Protein',NULL,':',NULL,'2019-09-16 13:26:19','g/L'),(19,'Direct Bilirubin',NULL,':',NULL,'2019-09-16 13:30:08','mg//dl'),(20,'Total Bilirubin',NULL,':',NULL,'2019-09-16 13:37:39','mg//dl'),(21,'Total Bilirubin',NULL,':',NULL,'2019-09-16 13:44:06','mg//dl'),(22,'Direct Bilirubin',NULL,':',NULL,'2019-09-16 13:44:06','mg//dl'),(23,'Total Bilirubin',NULL,':',NULL,'2019-09-16 13:44:06','g/L'),(24,'Albumin',NULL,':',NULL,'2019-09-16 13:44:06','g/L'),(25,'ALT',NULL,':',NULL,'2019-09-16 13:44:06','U/l'),(26,'AST',NULL,':',NULL,'2019-09-16 13:44:06','U/l'),(27,'ALP',NULL,':',NULL,'2019-09-16 13:44:06','U/l'),(28,'Colour',NULL,'Colourless/Pale Yellow/Dark Yellow/Bloody',NULL,'2019-09-17 11:23:06',''),(29,'Appearance',NULL,'Clear/Amber/Cloudy',NULL,'2019-09-17 11:23:06',''),(30,'PH',NULL,'5/6/7/8/9',NULL,'2019-09-17 11:23:06',''),(31,'Specific Gravity',NULL,'1.000/1.005/1.010/1.015/1.020/1.025/1.030',NULL,'2019-09-17 11:23:06',''),(32,'Protein',NULL,'Negative/+30(0.3)/++100(1.0)/+++300(3.0)/++++1000(10)',NULL,'2019-09-17 11:23:06','mg/dl'),(33,'Glucose',NULL,'Negative/+50(2.8)/++100(5.5)/+++300(17)/++++1000(55)',NULL,'2019-09-17 11:44:06','mg/dl'),(34,'Ketone',NULL,'Negative/+15(1.5)/++40(3.9)/+++100(10)',NULL,'2019-09-17 11:46:00','mg/dl'),(35,'Urobilinogen',NULL,'0.1/1(16)/2(33)/4(66)/8(131)',NULL,'2019-09-17 11:47:17','mg/dl'),(36,'Bilirubin',NULL,'Negative/+/++/+++',NULL,'2019-09-17 11:48:56',''),(37,'Leucocyte',NULL,'Negative/+25/++75/+++500',NULL,'2019-09-17 11:48:56','WBC/ul'),(38,'Nitrite',NULL,'Negative/Positive',NULL,'2019-09-17 11:51:33',''),(39,'Blood',NULL,'Negative/Hemolysis+10/++50/+++250/Non Hemolysis/++50',NULL,'2019-09-17 11:51:33','RBC/ul'),(40,'Pus Cells',NULL,'None seen/(0-20)/+/++/+++/++++',NULL,'2019-09-17 12:20:55',''),(41,'RBC',NULL,'None seen/(0-20)/+/++/+++/++++',NULL,'2019-09-17 12:23:50',''),(42,'Casts',NULL,'WBC cast seen/RBC cast seen/Hyaline cast seen/Granular cast seen/Waxy cast seen',NULL,'2019-09-17 12:23:50',''),(43,'Epith',NULL,'$freetext$$',NULL,'2019-09-17 12:12:39',''),(44,'Crystals',NULL,'$freetext$$',NULL,'2019-09-17 12:12:39',''),(45,'Yeast cells',NULL,'$freetext$$',NULL,'2019-09-17 12:12:39',''),(46,'Trichomonas vaginalis',NULL,'$freetext$$',NULL,'2019-09-17 12:12:39','');
/*!40000 ALTER TABLE `measure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `misc`
--

DROP TABLE IF EXISTS `misc`;
CREATE TABLE `misc` (
  `id` int(11) NOT NULL auto_increment,
  `r_id` int(11) NOT NULL default '0',
  `vr_id` varchar(45) collate latin1_general_ci NOT NULL default '0',
  `i1` int(11) NOT NULL default '0',
  `i2` int(11) NOT NULL default '0',
  `i3` int(11) NOT NULL default '0',
  `i4` int(11) NOT NULL default '0',
  `i5` int(11) NOT NULL default '0',
  `v1` varchar(500) collate latin1_general_ci NOT NULL default '0',
  `v2` varchar(500) collate latin1_general_ci NOT NULL default '0',
  `v3` varchar(500) collate latin1_general_ci NOT NULL default '0',
  `v4` varchar(500) collate latin1_general_ci NOT NULL default '0',
  `v5` varchar(500) collate latin1_general_ci NOT NULL default '0',
  `dt1` datetime default NULL,
  `dt2` datetime default NULL,
  `dt3` datetime default NULL,
  `d1` date default NULL,
  `d2` date default NULL,
  `d3` date default NULL,
  `ts` timestamp NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `misc`
--

LOCK TABLES `misc` WRITE;
/*!40000 ALTER TABLE `misc` DISABLE KEYS */;
/*!40000 ALTER TABLE `misc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numeric_interpretation`
--

DROP TABLE IF EXISTS `numeric_interpretation`;
CREATE TABLE `numeric_interpretation` (
  `range_u` int(10) default NULL,
  `range_l` int(10) default NULL,
  `age_u` int(10) default NULL,
  `age_l` int(10) default NULL,
  `gender` varchar(40) default NULL,
  `description` varchar(40) default NULL,
  `measure_id` int(10) unsigned NOT NULL,
  `id` int(10) NOT NULL auto_increment,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `numeric_interpretation`
--

LOCK TABLES `numeric_interpretation` WRITE;
/*!40000 ALTER TABLE `numeric_interpretation` DISABLE KEYS */;
/*!40000 ALTER TABLE `numeric_interpretation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient` (
  `patient_id` int(11) unsigned NOT NULL default '0',
  `addl_id` varchar(40) default NULL,
  `name` varchar(45) default NULL,
  `sex` char(1) NOT NULL default '',
  `age` decimal(10,0) default NULL,
  `dob` date default NULL,
  `created_by` int(11) unsigned default NULL,
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `partial_dob` varchar(45) default NULL,
  `surr_id` varchar(45) default NULL,
  `hash_value` varchar(100) default NULL,
  PRIMARY KEY  (`patient_id`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'undefined','Lilian H. Bangura','F','0',NULL,520,'2019-09-17 00:00:00','1988-09-17','AD383319','946d4f171c1c6b4534355d1f40fd970fd9afb874'),(2,'undefined','Marie B. Koroma','F','0',NULL,520,'2019-09-17 00:00:00','1992-09-17','AD384519','65691783c5c3fe6efa793d68436c41fc1e15e328');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_custom_data`
--

DROP TABLE IF EXISTS `patient_custom_data`;
CREATE TABLE `patient_custom_data` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL default '0',
  `patient_id` int(11) unsigned NOT NULL default '0',
  `field_value` varchar(45) NOT NULL default '',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`),
  KEY `patient_id` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_custom_data`
--

LOCK TABLES `patient_custom_data` WRITE;
/*!40000 ALTER TABLE `patient_custom_data` DISABLE KEYS */;
INSERT INTO `patient_custom_data` VALUES (1,1,1,'31 Hospital Road','2019-09-17 12:34:25'),(2,2,1,'Married','2019-09-17 12:34:25'),(3,3,1,'','2019-09-17 12:34:25'),(4,4,1,' 23278618531','2019-09-17 12:34:25'),(5,5,1,'Western Area Urban','2019-09-17 12:34:25'),(6,6,1,'Married','2019-09-17 12:34:25'),(7,7,1,'','2019-09-17 12:34:25'),(8,8,1,'','2019-09-17 12:34:25'),(9,1,2,'14 Alpha Terrace','2019-09-17 12:50:13'),(10,2,2,'Married','2019-09-17 12:50:13'),(11,3,2,'','2019-09-17 12:50:13'),(12,4,2,' 23288745590','2019-09-17 12:50:13'),(13,5,2,'Western Area Urban','2019-09-17 12:50:13'),(14,6,2,'Caterer','2019-09-17 12:50:13'),(15,7,2,'Mohamed Ansumana','2019-09-17 12:50:13'),(16,8,2,' 23277837140','2019-09-17 12:50:13');
/*!40000 ALTER TABLE `patient_custom_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_custom_field`
--

DROP TABLE IF EXISTS `patient_custom_field`;
CREATE TABLE `patient_custom_field` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_name` varchar(45) NOT NULL default '',
  `field_options` text NOT NULL,
  `field_type_id` int(11) unsigned NOT NULL default '0',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `field_type_id` (`field_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_custom_field`
--

LOCK TABLES `patient_custom_field` WRITE;
/*!40000 ALTER TABLE `patient_custom_field` DISABLE KEYS */;
INSERT INTO `patient_custom_field` VALUES (1,'Address','',1,'2019-09-16 13:56:33'),(2,'Marital Status','Married/Single',3,'2019-09-16 13:59:30'),(3,'Ward/Chiefdom','',1,'2019-09-16 14:02:27'),(4,'Patient Phone Number','',1,'2019-09-16 14:06:25'),(5,'District','Western Area Urban/Western Area Rural/Port Loko/Kambia/Bombali/Koindugu/Falaba/Karina/Tonkolili/Bo/Pujehun/Moyamba/Bonthe/Kenema/Kailahun/Kono',3,'2019-09-16 14:06:56'),(6,'Occupation','',1,'2019-09-16 14:07:18'),(7,'Contact Person Name','',1,'2019-09-16 14:07:46'),(8,'Contact Person Phone No','',1,'2019-09-16 14:08:12');
/*!40000 ALTER TABLE `patient_custom_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_daily`
--

DROP TABLE IF EXISTS `patient_daily`;
CREATE TABLE `patient_daily` (
  `datestring` varchar(45) NOT NULL,
  `count` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_daily`
--

LOCK TABLES `patient_daily` WRITE;
/*!40000 ALTER TABLE `patient_daily` DISABLE KEYS */;
INSERT INTO `patient_daily` VALUES ('20190917',2);
/*!40000 ALTER TABLE `patient_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments` (
  `id` int(11) NOT NULL auto_increment,
  `amount` decimal(10,2) NOT NULL default '0.00',
  `bill_id` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reference_range`
--

DROP TABLE IF EXISTS `reference_range`;
CREATE TABLE `reference_range` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `measure_id` int(10) unsigned NOT NULL,
  `age_min` varchar(45) default NULL,
  `age_max` varchar(45) default NULL,
  `sex` varchar(10) default NULL,
  `range_lower` varchar(45) NOT NULL,
  `range_upper` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `measure_id` (`measure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reference_range`
--

LOCK TABLES `reference_range` WRITE;
/*!40000 ALTER TABLE `reference_range` DISABLE KEYS */;
INSERT INTO `reference_range` VALUES (1,1,'0','100','M','11','61'),(2,1,'0','100','F','9','39'),(3,2,'0','100','B','1.7','8.3'),(4,3,'0','100','B','333','583'),(5,4,'0','100','M','53','97'),(6,4,'0','100','F','44','80'),(7,5,'0','100','M','53','97'),(8,5,'0','100','F','44','80'),(9,6,'0','100','B','1.7','8.3'),(10,7,'0','100','B','333','583'),(11,8,'0','100','B','3.6','5.5'),(12,9,'0','100','B','4.2','6.4'),(13,10,'0','100','B','0','5.2'),(14,11,'0','100','B','0','2.3'),(15,12,'0','100','B','0','5.2'),(16,13,'0','100','B','0','2.3'),(17,14,'0','100','F','53','128'),(18,14,'0','100','M','42','98'),(21,15,'0','100','M','0','42'),(22,15,'0','100','F','0','31'),(23,16,'0','100','M','0','42'),(24,16,'0','100','F','0','32'),(25,17,'0','100','B','38','51'),(29,19,'0','100','B','0','0.25'),(30,20,'0','100','At birth','0','5'),(31,20,'0','100','5 days','0','12'),(32,20,'0','100','1 month','0','1.5'),(33,20,'0','100','Adults','0','1.1'),(34,21,'0','100','At birth','0','5'),(35,21,'0','100','5 days','0','12'),(36,21,'0','100','1 month','0','1.5'),(37,21,'0','100','Adults','0','1.1'),(38,22,'0','100','B','0','0.25'),(39,23,'1','2','B','46','70'),(40,23,'3','+','B','66','87'),(41,24,'0','100','B','38','51'),(42,25,'0','100','M','0','42'),(43,25,'0','100','F','0','32'),(44,26,'0','100','M','0','37'),(45,26,'0','100','F','0','31'),(46,27,'0','100','M','53','128'),(47,27,'0','100','F','42','98'),(48,18,'1','2',' B','66','87'),(49,18,'3','100','B','46','70');
/*!40000 ALTER TABLE `reference_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `removal_record`
--

DROP TABLE IF EXISTS `removal_record`;
CREATE TABLE `removal_record` (
  `id` int(11) NOT NULL auto_increment,
  `r_id` int(11) NOT NULL default '0',
  `vr_id` varchar(45) collate latin1_general_ci NOT NULL default '0',
  `type` int(11) default NULL,
  `user_id` int(11) default '0',
  `remarks` varchar(500) collate latin1_general_ci default NULL,
  `status` int(11) NOT NULL default '1',
  `ts` timestamp NULL default CURRENT_TIMESTAMP,
  `category` varchar(20) collate latin1_general_ci default 'test',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `removal_record`
--

LOCK TABLES `removal_record` WRITE;
/*!40000 ALTER TABLE `removal_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `removal_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_config`
--

DROP TABLE IF EXISTS `report_config`;
CREATE TABLE `report_config` (
  `report_id` int(10) unsigned NOT NULL auto_increment,
  `header` varchar(500) NOT NULL default '',
  `footer` varchar(500) NOT NULL default '-End-',
  `margins` varchar(45) NOT NULL default '2,0,10,0',
  `p_fields` varchar(45) NOT NULL default '1,1,1,1,1,1,1',
  `s_fields` varchar(45) NOT NULL default '1,1,1,1,1,1',
  `t_fields` varchar(45) NOT NULL default '1,0,1,1,1,0,1,1',
  `p_custom_fields` varchar(45) NOT NULL default '',
  `s_custom_fields` varchar(45) NOT NULL default '',
  `test_type_id` varchar(45) NOT NULL default '0',
  `title` varchar(500) NOT NULL default '',
  `landscape` int(10) unsigned NOT NULL default '0',
  `row_items` int(1) unsigned NOT NULL default '3',
  `show_border` int(1) unsigned NOT NULL default '1',
  `show_result_border` int(1) unsigned NOT NULL default '1',
  `result_border_horizontal` int(1) unsigned NOT NULL default '0',
  `result_border_vertical` int(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report_config`
--

LOCK TABLES `report_config` WRITE;
/*!40000 ALTER TABLE `report_config` DISABLE KEYS */;
INSERT INTO `report_config` VALUES (1,'Patient Report','','2,0,10,0','1,1,0,1,1,0,1,0,0,0,0,0,0','1,0,0,0,0,1,1','1,1,1,0,0,0,0,1,0,1,1,1','','','0','Patient Report',0,1,1,1,1,1),(2,'Specimen Report','','2,0,10,0','1,1,1,1,1,1,1','1,1,1,1,1,1','1,0,1,1,1,0,1,1','','','0','',0,3,1,1,0,0),(3,'Test Records','','2,0,10,0','1,1,1,1,1,1,1','1,1,1,1,1,1','1,0,1,1,1,0,1,1','','','0','',0,3,1,1,0,0),(4,'Daily Log - Specimens','','2,0,10,0','1,1,1,1,1,1,1','1,1,1,1,1,1','1,0,1,1,1,0,1,1','','','0','',0,3,1,1,0,0),(5,'Worksheet','','2,0,10,0','1,1,1,1,1,1,1','1,1,1,1,1,1','1,0,1,1,1,0,1,1','','','0','',0,3,1,1,0,0),(6,'Daily Log - Patients','','2,0,10,0','1,1,1,1,1,1,1','1,1,1,1,1,1','1,0,1,1,1,0,1,1','','','0','',0,3,1,1,0,0),(7,'Grouped Test Count Report Configuration','0:4,4:9,9:14,14:19,19:24,24:29,29:34,34:39,39:44,44:49,49:54,54:59,59:64,64:+','0','1','1','1','1','0','9999009','0',9999009,3,1,1,0,0),(8,'Grouped Specimen Count Report Configuration','0:4,4:9,9:14,14:19,19:24,24:29,29:34,34:39,39:44,44:49,49:54,54:59,59:64,64:+','0','1','1','1','1','0','9999019','0',9999019,3,1,1,0,0);
/*!40000 ALTER TABLE `report_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_disease`
--

DROP TABLE IF EXISTS `report_disease`;
CREATE TABLE `report_disease` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `group_by_age` int(10) unsigned NOT NULL,
  `group_by_gender` int(10) unsigned NOT NULL,
  `age_groups` varchar(500) default NULL,
  `measure_groups` varchar(500) default NULL,
  `measure_id` int(10) unsigned NOT NULL,
  `lab_config_id` int(10) unsigned NOT NULL,
  `test_type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  USING BTREE (`id`),
  KEY `measure_id` (`measure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report_disease`
--

LOCK TABLES `report_disease` WRITE;
/*!40000 ALTER TABLE `report_disease` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_disease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate latin1_general_ci default NULL,
  `lab_id` int(11) default NULL,
  `District` varchar(40) collate latin1_general_ci default NULL,
  `Region` varchar(40) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,'PCMH_ODCH Laboratory',1,'',''),(2,'Regent CHC',1,NULL,NULL),(3,'Tonkolili Govt. Hospital',1,NULL,NULL),(4,'Bo Govt. Hospital',1,NULL,NULL),(5,'Port Loko Govt. Hospital',1,NULL,NULL);
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specimen`
--

DROP TABLE IF EXISTS `specimen`;
CREATE TABLE `specimen` (
  `specimen_id` int(10) unsigned NOT NULL default '0',
  `patient_id` int(11) unsigned NOT NULL default '0',
  `specimen_type_id` int(11) unsigned NOT NULL default '0',
  `user_id` int(11) unsigned default NULL,
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `status_code_id` int(11) unsigned default NULL,
  `referred_to` int(11) unsigned default NULL,
  `comments` text,
  `aux_id` varchar(45) default NULL,
  `date_collected` date NOT NULL default '0000-00-00',
  `date_recvd` date default NULL,
  `session_num` varchar(45) default NULL,
  `time_collected` varchar(45) default NULL,
  `report_to` int(10) unsigned default NULL,
  `doctor` varchar(45) default NULL,
  `date_reported` datetime default NULL,
  `referred_to_name` varchar(70) default NULL,
  `daily_num` varchar(45) NOT NULL default '',
  `referred_from_name` varchar(20) default NULL,
  `site_id` int(11) default NULL,
  PRIMARY KEY  (`specimen_id`),
  KEY `patient_id` (`patient_id`),
  KEY `specimen_type_id` (`specimen_type_id`),
  KEY `user_id` (`user_id`),
  KEY `IDX_DATE` (`date_collected`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `specimen`
--

LOCK TABLES `specimen` WRITE;
/*!40000 ALTER TABLE `specimen` DISABLE KEYS */;
INSERT INTO `specimen` VALUES (1,1,2,520,'2019-09-17 12:40:31',0,0,'','AD383319','2019-09-17','2019-09-17','20190917-3','12:39',1,'Fatmata V',NULL,'','20190917-','',1),(2,2,2,520,'2019-09-17 12:51:12',0,0,'','AD384519','2019-09-17','2019-09-17','20190917-4','12:50',1,'Miatta',NULL,'','20190917-2','',1);
/*!40000 ALTER TABLE `specimen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specimen_custom_data`
--

DROP TABLE IF EXISTS `specimen_custom_data`;
CREATE TABLE `specimen_custom_data` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL default '0',
  `specimen_id` int(10) unsigned NOT NULL default '0',
  `field_value` varchar(45) NOT NULL default '',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`),
  KEY `specimen_id` (`specimen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `specimen_custom_data`
--

LOCK TABLES `specimen_custom_data` WRITE;
/*!40000 ALTER TABLE `specimen_custom_data` DISABLE KEYS */;
INSERT INTO `specimen_custom_data` VALUES (1,2,1,'ANC','2019-09-17 12:40:31'),(2,2,2,'ANC','2019-09-17 12:51:12');
/*!40000 ALTER TABLE `specimen_custom_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specimen_custom_field`
--

DROP TABLE IF EXISTS `specimen_custom_field`;
CREATE TABLE `specimen_custom_field` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_name` varchar(45) NOT NULL default '',
  `field_options` varchar(65474) NOT NULL default '',
  `field_type_id` int(11) unsigned NOT NULL default '0',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `field_type_id` (`field_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `specimen_custom_field`
--

LOCK TABLES `specimen_custom_field` WRITE;
/*!40000 ALTER TABLE `specimen_custom_field` DISABLE KEYS */;
INSERT INTO `specimen_custom_field` VALUES (2,'Ward','Domiciliary 1/Domiciliary 2/Ward 2/Ward 3/Ward 4/Ward 5/Ward 6/Labour Ward/HDU/ODCH Ward 1/ODCH Ward 2 (Step Down)/ODCH Ward 3/SCBU/Observation/ICU/ER/ANC',3,'2019-09-16 14:27:57');
/*!40000 ALTER TABLE `specimen_custom_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specimen_session`
--

DROP TABLE IF EXISTS `specimen_session`;
CREATE TABLE `specimen_session` (
  `session_num` varchar(45) NOT NULL default '',
  `count` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`session_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `specimen_session`
--

LOCK TABLES `specimen_session` WRITE;
/*!40000 ALTER TABLE `specimen_session` DISABLE KEYS */;
INSERT INTO `specimen_session` VALUES ('20190916',1),('20190917',4);
/*!40000 ALTER TABLE `specimen_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specimen_test`
--

DROP TABLE IF EXISTS `specimen_test`;
CREATE TABLE `specimen_test` (
  `test_type_id` int(11) unsigned NOT NULL default '0',
  `specimen_type_id` int(11) unsigned NOT NULL default '0',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  KEY `test_type_id` (`test_type_id`),
  KEY `specimen_type_id` (`specimen_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Relates tests to the specimens that are compatible with thos';

--
-- Dumping data for table `specimen_test`
--

LOCK TABLES `specimen_test` WRITE;
/*!40000 ALTER TABLE `specimen_test` DISABLE KEYS */;
INSERT INTO `specimen_test` VALUES (1,12,'2019-09-16 12:44:30'),(2,12,'2019-09-16 12:47:53'),(3,2,'2019-09-16 12:48:56'),(4,12,'2019-09-16 12:51:45'),(5,12,'2019-09-16 12:57:21'),(5,2,'2019-09-16 12:57:21'),(6,12,'2019-09-16 13:01:28'),(7,12,'2019-09-16 13:04:03'),(8,12,'2019-09-16 13:05:05'),(9,12,'2019-09-16 13:06:10'),(10,12,'2019-09-16 13:08:06'),(11,12,'2019-09-16 13:17:21'),(12,12,'2019-09-16 13:18:34'),(13,12,'2019-09-16 13:20:13'),(14,12,'2019-09-16 13:21:53'),(15,12,'2019-09-16 13:26:19'),(16,12,'2019-09-16 13:28:11'),(17,12,'2019-09-16 13:37:39'),(18,12,'2019-09-16 13:44:06'),(19,2,'2019-09-17 11:23:06'),(20,2,'2019-09-17 12:12:39');
/*!40000 ALTER TABLE `specimen_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specimen_type`
--

DROP TABLE IF EXISTS `specimen_type`;
CREATE TABLE `specimen_type` (
  `specimen_type_id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL default '',
  `description` varchar(100) default NULL,
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `disabled` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`specimen_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `specimen_type`
--

LOCK TABLES `specimen_type` WRITE;
/*!40000 ALTER TABLE `specimen_type` DISABLE KEYS */;
INSERT INTO `specimen_type` VALUES (1,'Stool','','2019-09-16 12:29:37',0),(2,'Urine','','2019-09-16 12:29:47',0),(3,'Throat Swab','','2019-09-16 12:30:04',0),(4,'Urethral Swab','','2019-09-16 12:30:31',0),(5,'Rectal Swab','','2019-09-16 12:36:08',0),(6,'Aspirate','','2019-09-16 12:36:28',0),(7,'CSF','','2019-09-16 12:36:42',0),(8,'Whole Blood','','2019-09-16 12:37:17',0),(9,'Pus Swab','','2019-09-16 12:37:34',0),(10,'Nasal Swab','','2019-09-16 12:38:26',0),(11,'HVS','','2019-09-16 12:38:58',0),(12,'Serum','','2019-09-16 12:39:26',0),(13,'Plasma','','2019-09-16 12:39:55',0),(14,'Pleural Fluid','','2019-09-16 12:40:39',0),(15,'Sputum','','2019-09-16 12:41:19',0);
/*!40000 ALTER TABLE `specimen_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_content`
--

DROP TABLE IF EXISTS `stock_content`;
CREATE TABLE `stock_content` (
  `name` varchar(40) default NULL,
  `current_quantity` int(11) default NULL,
  `date_of_use` date NOT NULL,
  `receiver` varchar(40) default NULL,
  `remarks` text,
  `lot_number` varchar(40) default NULL,
  `new_balance` int(11) default NULL,
  `user_name` varchar(40) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_content`
--

LOCK TABLES `stock_content` WRITE;
/*!40000 ALTER TABLE `stock_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_details`
--

DROP TABLE IF EXISTS `stock_details`;
CREATE TABLE `stock_details` (
  `name` varchar(40) default NULL,
  `lot_number` varchar(40) default NULL,
  `expiry_date` varchar(40) default NULL,
  `manufacturer` varchar(40) default NULL,
  `quantity_ordered` int(11) default NULL,
  `supplier` varchar(40) default NULL,
  `date_of_reception` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `current_quantity` int(11) default NULL,
  `date_of_supply` timestamp NOT NULL default '0000-00-00 00:00:00',
  `quantity_supplied` int(11) default NULL,
  `unit` varchar(10) default NULL,
  `entry_id` int(11) default NULL,
  `cost_per_unit` decimal(10,0) default '0',
  `quantity_used` int(10) default '0',
  UNIQUE KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_details`
--

LOCK TABLES `stock_details` WRITE;
/*!40000 ALTER TABLE `stock_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `test_id` int(10) unsigned NOT NULL auto_increment,
  `test_type_id` int(11) unsigned NOT NULL default '0',
  `result` varchar(5000) default NULL,
  `comments` varchar(200) default NULL,
  `user_id` int(11) unsigned default NULL,
  `verified_by` int(11) unsigned default NULL,
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `specimen_id` int(11) unsigned default NULL,
  `date_verified` datetime default NULL,
  PRIMARY KEY  (`test_id`),
  KEY `test_type_id` (`test_type_id`),
  KEY `user_id` (`user_id`),
  KEY `specimen_id` (`specimen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,19,'','',520,0,'2019-09-17 12:40:31',1,NULL),(2,20,'','',520,0,'2019-09-17 12:40:31',1,NULL),(3,19,'','',520,0,'2019-09-17 12:51:12',2,NULL),(4,20,'','',520,0,'2019-09-17 12:51:12',2,NULL);
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_agg_report_config`
--

DROP TABLE IF EXISTS `test_agg_report_config`;
CREATE TABLE `test_agg_report_config` (
  `id` int(11) NOT NULL auto_increment,
  `test_type_id` int(11) default NULL,
  `title` varchar(255) collate latin1_general_ci default NULL,
  `landscape` tinyint(1) default '1',
  `group_by_age` tinyint(1) default '1',
  `age_unit` int(11) default '1',
  `age_groups` varchar(255) collate latin1_general_ci default NULL,
  `report_type` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `test_agg_report_config`
--

LOCK TABLES `test_agg_report_config` WRITE;
/*!40000 ALTER TABLE `test_agg_report_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_agg_report_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_category`
--

DROP TABLE IF EXISTS `test_category`;
CREATE TABLE `test_category` (
  `test_category_id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL default '',
  `description` varchar(100) default NULL,
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`test_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test_category`
--

LOCK TABLES `test_category` WRITE;
/*!40000 ALTER TABLE `test_category` DISABLE KEYS */;
INSERT INTO `test_category` VALUES (2,'Biochemistry','','2019-09-16 12:44:30'),(3,'Microbiology','','2019-09-17 11:23:06');
/*!40000 ALTER TABLE `test_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_type`
--

DROP TABLE IF EXISTS `test_type`;
CREATE TABLE `test_type` (
  `test_type_id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL default '',
  `description` varchar(100) default NULL,
  `test_category_id` int(11) unsigned NOT NULL default '0',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `is_panel` int(10) unsigned default NULL,
  `disabled` int(10) unsigned NOT NULL default '0',
  `clinical_data` longtext,
  `hide_patient_name` int(1) default NULL,
  `prevalence_threshold` int(3) default '70',
  `target_tat` int(3) default '24',
  `is_reporting_enabled` tinyint(1) default '0',
  PRIMARY KEY  (`test_type_id`),
  KEY `test_category_id` (`test_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test_type`
--

LOCK TABLES `test_type` WRITE;
/*!40000 ALTER TABLE `test_type` DISABLE KEYS */;
INSERT INTO `test_type` VALUES (1,'GGT','',2,'2019-09-16 12:44:30',0,0,NULL,0,70,24,0),(2,'Urea S','',2,'2019-09-16 12:47:53',0,0,NULL,0,70,24,0),(3,'Urea U','',2,'2019-09-16 12:48:56',0,0,NULL,0,70,24,0),(4,'Creatinine','',2,'2019-09-16 12:51:45',0,0,NULL,0,70,24,0),(5,'KFTs','',2,'2019-09-16 12:57:21',0,0,NULL,0,70,24,0),(6,'Potassium','',2,'2019-09-16 13:01:28',0,0,NULL,0,70,24,0),(7,'Fasting Blood Sugar','',2,'2019-09-16 13:04:02',0,0,NULL,0,70,24,0),(8,'Cholesterol','',2,'2019-09-16 13:05:05',0,0,NULL,0,70,24,0),(9,'Triglycerides','',2,'2019-09-16 13:06:10',0,0,NULL,0,70,24,0),(10,'Lipid Profile Test','',2,'2019-09-16 13:08:06',0,0,NULL,0,70,24,0),(11,'ALP','',2,'2019-09-16 13:17:21',0,0,NULL,0,70,24,0),(12,'AST','',2,'2019-09-16 13:19:00',0,0,'',0,70,24,0),(13,'ALT','',2,'2019-09-16 13:20:13',0,0,NULL,0,70,24,0),(14,'Albumin','',2,'2019-09-16 13:21:53',0,0,NULL,0,70,24,0),(15,'Total Protein','',2,'2019-09-16 13:45:18',0,0,'',0,70,24,0),(16,'Direct Bilirubin','',2,'2019-09-16 13:30:08',0,0,'',0,70,24,0),(17,'Total Bilirubin','',2,'2019-09-16 13:37:39',0,0,NULL,0,70,24,0),(18,'Liver Function Test','',2,'2019-09-16 13:44:06',0,0,NULL,0,70,24,0),(19,'Urinalysis Macroscopy','',3,'2019-09-17 12:06:54',0,0,'',0,70,24,0),(20,'Urinalysis Microscopy','',3,'2019-09-17 12:20:55',0,0,'',0,70,24,0);
/*!40000 ALTER TABLE `test_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_type_costs`
--

DROP TABLE IF EXISTS `test_type_costs`;
CREATE TABLE `test_type_costs` (
  `earliest_date_valid` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `test_type_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL default '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `test_type_costs`
--

LOCK TABLES `test_type_costs` WRITE;
/*!40000 ALTER TABLE `test_type_costs` DISABLE KEYS */;
INSERT INTO `test_type_costs` VALUES ('2019-09-16 12:44:30',1,'0.00'),('2019-09-16 12:47:53',2,'0.00'),('2019-09-16 12:48:57',3,'0.00'),('2019-09-16 12:51:45',4,'0.00'),('2019-09-16 12:57:22',5,'0.00'),('2019-09-16 13:01:29',6,'0.00'),('2019-09-16 13:04:03',7,'0.00'),('2019-09-16 13:05:06',8,'0.00'),('2019-09-16 13:06:10',9,'0.00'),('2019-09-16 13:08:06',10,'0.00'),('2019-09-16 13:17:21',11,'0.00'),('2019-09-16 13:18:35',12,'0.00'),('2019-09-16 13:20:13',13,'0.00'),('2019-09-16 13:21:54',14,'0.00'),('2019-09-16 13:26:19',15,'0.00'),('2019-09-16 13:28:12',16,'0.00'),('2019-09-16 13:37:40',17,'0.00'),('2019-09-16 13:44:07',18,'0.00'),('2019-09-17 11:23:07',19,'0.00'),('2019-09-17 12:12:40',20,'0.00');
/*!40000 ALTER TABLE `test_type_costs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_type_measure`
--

DROP TABLE IF EXISTS `test_type_measure`;
CREATE TABLE `test_type_measure` (
  `test_type_id` int(11) unsigned NOT NULL default '0',
  `measure_id` int(11) unsigned NOT NULL default '0',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  KEY `test_type_id` (`test_type_id`),
  KEY `measure_id` (`measure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test_type_measure`
--

LOCK TABLES `test_type_measure` WRITE;
/*!40000 ALTER TABLE `test_type_measure` DISABLE KEYS */;
INSERT INTO `test_type_measure` VALUES (1,1,'2019-09-16 12:44:30'),(2,2,'2019-09-16 12:47:53'),(3,3,'2019-09-16 12:48:56'),(4,4,'2019-09-16 12:51:45'),(5,5,'2019-09-16 12:57:21'),(5,6,'2019-09-16 12:57:21'),(5,7,'2019-09-16 12:57:21'),(6,8,'2019-09-16 13:01:28'),(7,9,'2019-09-16 13:04:03'),(8,10,'2019-09-16 13:05:05'),(9,11,'2019-09-16 13:06:10'),(10,12,'2019-09-16 13:08:06'),(10,13,'2019-09-16 13:08:06'),(11,14,'2019-09-16 13:17:21'),(12,15,'2019-09-16 13:18:34'),(13,16,'2019-09-16 13:20:13'),(14,17,'2019-09-16 13:21:53'),(15,18,'2019-09-16 13:26:19'),(16,19,'2019-09-16 13:28:11'),(17,20,'2019-09-16 13:37:39'),(18,21,'2019-09-16 13:44:06'),(18,22,'2019-09-16 13:44:07'),(18,23,'2019-09-16 13:44:07'),(18,24,'2019-09-16 13:44:07'),(18,25,'2019-09-16 13:44:07'),(18,26,'2019-09-16 13:44:07'),(18,27,'2019-09-16 13:44:07'),(19,28,'2019-09-17 11:23:06'),(19,29,'2019-09-17 11:23:06'),(19,30,'2019-09-17 11:23:06'),(19,31,'2019-09-17 11:23:06'),(19,32,'2019-09-17 11:23:06'),(19,33,'2019-09-17 11:37:54'),(19,34,'2019-09-17 11:37:54'),(19,35,'2019-09-17 11:37:54'),(19,36,'2019-09-17 11:39:45'),(19,37,'2019-09-17 11:39:45'),(19,38,'2019-09-17 11:40:57'),(19,39,'2019-09-17 11:40:58'),(20,40,'2019-09-17 12:12:40'),(20,41,'2019-09-17 12:12:40'),(20,42,'2019-09-17 12:12:40'),(20,43,'2019-09-17 12:12:40'),(20,44,'2019-09-17 12:12:40'),(20,45,'2019-09-17 12:12:40'),(20,46,'2019-09-17 12:12:40');
/*!40000 ALTER TABLE `test_type_measure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit` (
  `unit_id` int(11) unsigned NOT NULL auto_increment,
  `unit` varchar(45) NOT NULL default '',
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) unsigned NOT NULL auto_increment,
  `username` varchar(45) NOT NULL default '',
  `password` varchar(45) NOT NULL default '',
  `actualname` varchar(45) default NULL,
  `email` varchar(45) default NULL,
  `created_by` int(11) unsigned default NULL,
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `lab_config_id` int(10) unsigned NOT NULL,
  `level` int(10) unsigned default NULL,
  `phone` varchar(45) default NULL,
  `lang_id` varchar(45) NOT NULL default 'default',
  PRIMARY KEY  (`user_id`),
  KEY `user_id_index` USING BTREE (`lab_config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Users are anybody that works in the lab.';

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_feedback`
--

DROP TABLE IF EXISTS `user_feedback`;
CREATE TABLE `user_feedback` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `rating` int(3) default NULL,
  `comments` varchar(500) collate latin1_general_ci default NULL,
  `ts` timestamp NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `user_feedback`
--

LOCK TABLES `user_feedback` WRITE;
/*!40000 ALTER TABLE `user_feedback` DISABLE KEYS */;
INSERT INTO `user_feedback` VALUES (1,520,6,'','2019-09-15 19:33:15'),(2,520,6,'','2019-09-16 12:30:59'),(3,520,6,'','2019-09-17 13:01:18');
/*!40000 ALTER TABLE `user_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_props`
--

DROP TABLE IF EXISTS `user_props`;
CREATE TABLE `user_props` (
  `User_Id` varchar(50) NOT NULL default '',
  `AppCodeName` varchar(25) NOT NULL default '',
  `AppName` varchar(25) NOT NULL default '',
  `AppVersion` varchar(25) NOT NULL default '',
  `CookieEnabled` tinyint(1) NOT NULL default '0',
  `Platform` varchar(20) NOT NULL default '',
  `UserAgent` varchar(200) NOT NULL default '',
  `SystemLanguage` varchar(15) NOT NULL default '',
  `UserLanguage` varchar(15) NOT NULL default '',
  `Language` varchar(15) NOT NULL default '',
  `ScreenAvailHeight` int(11) NOT NULL default '0',
  `ScreenAvailWidth` int(11) NOT NULL default '0',
  `ScreenColorDepth` int(11) NOT NULL default '0',
  `ScreenHeight` int(11) NOT NULL default '0',
  `ScreenWidth` int(11) NOT NULL default '0',
  `Recorded_At` datetime NOT NULL default '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_props`
--

LOCK TABLES `user_props` WRITE;
/*!40000 ALTER TABLE `user_props` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_props` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_rating`
--

DROP TABLE IF EXISTS `user_rating`;
CREATE TABLE `user_rating` (
  `user_id` int(10) unsigned NOT NULL,
  `rating` int(10) unsigned NOT NULL,
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`user_id`,`ts`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_rating`
--

LOCK TABLES `user_rating` WRITE;
/*!40000 ALTER TABLE `user_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worksheet_custom`
--

DROP TABLE IF EXISTS `worksheet_custom`;
CREATE TABLE `worksheet_custom` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `header` varchar(500) NOT NULL,
  `footer` varchar(500) NOT NULL,
  `title` varchar(500) NOT NULL,
  `p_fields` varchar(100) NOT NULL,
  `s_fields` varchar(100) NOT NULL,
  `t_fields` varchar(100) NOT NULL,
  `p_custom` varchar(100) NOT NULL,
  `s_custom` varchar(100) NOT NULL,
  `margins` varchar(50) NOT NULL,
  `id_fields` varchar(45) NOT NULL default '0,0,0',
  `landscape` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `worksheet_custom`
--

LOCK TABLES `worksheet_custom` WRITE;
/*!40000 ALTER TABLE `worksheet_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `worksheet_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worksheet_custom_test`
--

DROP TABLE IF EXISTS `worksheet_custom_test`;
CREATE TABLE `worksheet_custom_test` (
  `worksheet_id` int(10) unsigned NOT NULL,
  `test_type_id` int(10) unsigned NOT NULL,
  `measure_id` int(10) unsigned NOT NULL,
  `width` varchar(45) NOT NULL,
  KEY `worksheet_id` (`worksheet_id`),
  KEY `test_type_id` (`test_type_id`),
  KEY `measure_id` (`measure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `worksheet_custom_test`
--

LOCK TABLES `worksheet_custom_test` WRITE;
/*!40000 ALTER TABLE `worksheet_custom_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `worksheet_custom_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worksheet_custom_userfield`
--

DROP TABLE IF EXISTS `worksheet_custom_userfield`;
CREATE TABLE `worksheet_custom_userfield` (
  `worksheet_id` int(10) unsigned NOT NULL,
  `name` varchar(70) NOT NULL default '',
  `width` int(10) unsigned NOT NULL default '10',
  `field_id` int(10) unsigned NOT NULL auto_increment,
  KEY `Primary Key` (`field_id`),
  KEY `worksheet_id` (`worksheet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `worksheet_custom_userfield`
--

LOCK TABLES `worksheet_custom_userfield` WRITE;
/*!40000 ALTER TABLE `worksheet_custom_userfield` DISABLE KEYS */;
/*!40000 ALTER TABLE `worksheet_custom_userfield` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-24 11:44:06

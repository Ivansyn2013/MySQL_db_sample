-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_22
-- ------------------------------------------------------
-- Server version	10.5.12-MariaDB-cll-lve

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
-- Table structure for table `bill`
--
USE  medical_db;
DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT current_timestamp(),
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `history_number` bigint(20) unsigned NOT NULL,
  `bill_status` bit(1) DEFAULT NULL,
  `cost` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bill_idx` (`user_id`),
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `patients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (1,'2013-06-18 14:28:01',11,848146,'',1),(2,'2005-08-01 14:43:35',12,5514,'',1361),(3,'2009-10-15 21:03:40',13,96,'',87873900),(4,'2019-03-18 10:06:58',14,44909,'',82),(5,'1975-09-25 15:32:49',15,93756707,'',33022),(6,'1975-08-08 21:22:29',17,56356460,'',42992944),(7,'2018-09-09 20:24:58',18,61,'',28),(8,'1997-02-08 09:59:53',19,132194,'',446),(9,'1978-10-31 00:29:51',20,9252,'',1173),(10,'2020-11-08 17:10:24',11,7342,'',98);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departmens`
--

DROP TABLE IF EXISTS `departmens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departmens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT current_timestamp(),
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doctor_id` bigint(20) unsigned DEFAULT NULL,
  `nurses_id` bigint(20) unsigned DEFAULT NULL,
  `phone` bigint(20) unsigned NOT NULL,
  `speciality` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  KEY `nurses_id` (`nurses_id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `departmens_ibfk_1` FOREIGN KEY (`nurses_id`) REFERENCES `nurses` (`id`),
  CONSTRAINT `departmens_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`),
  CONSTRAINT `departmens_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `patients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departmens`
--

LOCK TABLES `departmens` WRITE;
/*!40000 ALTER TABLE `departmens` DISABLE KEYS */;
INSERT INTO `departmens` VALUES (1,'2014-06-06 05:56:04','delectus',11,1,517573,'Nostrum nisi soluta quam dolorem nostrum.',11),(2,'2014-09-01 12:20:49','alias',12,2,221,'Numquam excepturi id voluptate deleniti blanditiis.',12),(3,'1971-01-05 19:08:48','enim',13,3,132,'Dolore quam ab ad adipisci non.',13),(4,'1978-10-28 02:16:40','perspiciatis',14,4,30,'Enim minus et totam in modi nulla dolores.',14),(5,'1997-09-28 19:28:13','possimus',15,5,6349361820,'Quidem repellendus et et laboriosam omnis.',15),(6,'1984-11-12 08:22:58','debitis',16,6,120077,'Ipsum tempore sunt eaque est vel laborum.',17),(7,'1996-08-04 00:25:41','omnis',19,7,881139,'Impedit repudiandae tenetur rerum commodi in et consequatur.',18),(8,'2009-02-24 01:07:29','aliquam',20,8,1,'Enim voluptatibus blanditiis omnis ut modi dolorem et.',19),(9,'1989-07-30 05:24:18','aut',11,9,199592,'Ipsa delectus facilis rerum tempore cum.',20),(10,'1987-02-07 03:16:32','dolore',12,10,752,'Tenetur tempore qui tempora rerum et.',11);
/*!40000 ALTER TABLE `departmens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dicom_data`
--

DROP TABLE IF EXISTS `dicom_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dicom_data` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ct_data` longblob DEFAULT NULL,
  `mri_data` longblob DEFAULT NULL,
  `us_data` longblob DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `history_number` bigint(20) unsigned NOT NULL,
  `procedure_numb` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `history_number` (`history_number`),
  KEY `procedure_numb` (`procedure_numb`),
  KEY `dicom_idcx` (`user_id`,`history_number`),
  CONSTRAINT `dicom_data_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `patients` (`id`),
  CONSTRAINT `dicom_data_ibfk_2` FOREIGN KEY (`history_number`) REFERENCES `patients` (`history_number`),
  CONSTRAINT `dicom_data_ibfk_3` FOREIGN KEY (`procedure_numb`) REFERENCES `price` (`procedure_numb`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dicom_data`
--

LOCK TABLES `dicom_data` WRITE;
/*!40000 ALTER TABLE `dicom_data` DISABLE KEYS */;
INSERT INTO `dicom_data` VALUES (72,13,'wgt','uu','deploy','2010-10-31 01:09:25',0,4),(74,15,'scurl','sub','mesh','2017-02-12 19:00:09',5,0);
/*!40000 ALTER TABLE `dicom_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT current_timestamp(),
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `second_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_bithd` datetime NOT NULL,
  `phone` bigint(20) unsigned NOT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qualification` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`),
  KEY `doctors_idx` (`first_name`,`second_name`,`phone`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (11,'2003-11-07 20:31:14','Haskell','aut','2002-02-07 09:22:57',788,'clair21@example.org','',NULL,403),(12,'1972-12-27 14:24:04','Domenica','adipisci','1977-08-04 05:02:14',0,'d\'amore.zachery@example.net','f',NULL,59),(13,'1971-07-17 12:36:11','Darion','ullam','1971-12-30 10:23:01',253,'umaggio@example.com','f',NULL,48427609),(14,'1977-01-23 23:28:06','Maribel','et','1979-10-30 21:47:25',141482,'reichert.pascale@example.net','f',NULL,9100),(15,'2003-11-28 12:26:00','D\'angelo','placeat','2015-05-04 22:22:28',352,'hblick@example.net','',NULL,76383),(16,'1981-10-04 14:20:48','Sabrina','dicta','2012-02-20 05:07:59',4465931733,'guadalupe09@example.com','f',NULL,0),(19,'1999-08-23 07:25:35','Kelton','iusto','1986-08-30 20:47:07',521561,'angelina95@example.com','',NULL,344663594),(20,'1993-10-13 09:40:01','Kenyatta','labore','2000-09-20 11:21:02',1,'jannie.walker@example.net','f',NULL,0);
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT current_timestamp(),
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doctor_id` bigint(20) unsigned DEFAULT NULL,
  `nurses_id` bigint(20) unsigned DEFAULT NULL,
  `departmens_id` bigint(20) unsigned DEFAULT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_type` bigint(20) unsigned DEFAULT NULL,
  `context` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nurses_id` (`nurses_id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `user_id` (`user_id`),
  KEY `departmens_id` (`departmens_id`),
  CONSTRAINT `history_ibfk_1` FOREIGN KEY (`nurses_id`) REFERENCES `nurses` (`id`),
  CONSTRAINT `history_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`),
  CONSTRAINT `history_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `patients` (`id`),
  CONSTRAINT `history_ibfk_4` FOREIGN KEY (`departmens_id`) REFERENCES `departmens` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (1,'2009-08-19 00:52:42','harum',11,1,1,'Explicabo sit earum aut velit excepturi qui. Sed reprehenderit rerum autem voluptate voluptas commodi. Eum repellendus ipsa in quidem itaque quis magnam.',0,'Et ab consequatur nihil laboriosam officia.',11),(2,'2001-09-18 23:23:52','quidem',12,2,2,'Et id est sint. Aut eaque placeat incidunt est quasi. Sunt at enim nobis minima aut quia. Autem cum occaecati quod fugiat quia quam illo.',0,'Voluptatem dicta dolorum et sapiente aut.',12),(3,'1977-05-05 20:27:06','aut',13,3,3,'Ut occaecati inventore sed enim voluptatibus. Rem voluptas labore non et. Quasi ab veritatis qui quia voluptatem vitae. Voluptatum dolores doloremque aut eos eum iure quisquam et.',0,'Vitae est qui ratione voluptatibus qui laudantium ipsam.',13),(4,'1977-05-31 23:56:42','molestiae',14,4,4,'Et dolor aperiam sunt consequuntur. Qui occaecati et qui tempore corporis facere alias ab. Aut sit maxime in cum enim repellat voluptatum. Laudantium illum magni debitis.',0,'Eos voluptatibus et et magnam corporis deleniti et.',14),(5,'1996-01-21 23:38:22','cumque',15,5,5,'Unde minima est dolorum. Itaque provident molestiae perferendis. Fuga perferendis accusantium enim unde excepturi et omnis est. Porro velit aut voluptate nobis est.',0,'Perferendis enim enim ipsum voluptas ad voluptas.',15),(6,'1982-03-22 10:30:45','tempora',16,6,6,'Cum inventore libero qui velit delectus. Optio magni at voluptatem necessitatibus deserunt ut temporibus et. Velit optio et odit est quis optio. Omnis velit vel nemo est sed.',0,'Voluptates nesciunt doloribus voluptates vitae debitis adipisci modi.',17),(7,'1989-04-05 04:06:20','magni',19,7,7,'Saepe fugiat doloremque error repudiandae a qui. Dolor quo dolores et nihil vel non. Non itaque eveniet ratione. Dolorem error cupiditate asperiores rerum reprehenderit.',0,'Molestias aspernatur corporis id aut in distinctio perferendis.',18),(8,'2002-12-06 23:11:22','atque',20,8,8,'Ullam natus eius deleniti quod minima. Ut asperiores placeat similique quia eligendi. Fugiat sed accusantium quia omnis.',0,'Asperiores libero error enim.',19),(9,'2011-02-02 22:17:59','tenetur',11,9,9,'Repellat qui sint debitis nisi. Inventore molestiae voluptatibus aut qui consequatur magni.',0,'Voluptatem nulla est similique quia quia.',20),(10,'1992-01-19 10:40:00','similique',12,10,10,'Est consequuntur sit nostrum voluptatem dolores et ea ab. Totam dignissimos nulla et qui dolorum nostrum recusandae. Sapiente numquam incidunt consequatur explicabo voluptas est laborum. Et voluptas cumque ea quae.',0,'Voluptas quaerat debitis fugiat reiciendis.',11);
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboratory_data`
--

DROP TABLE IF EXISTS `laboratory_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laboratory_data` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `blood_an` mediumblob DEFAULT NULL,
  `urina_an` mediumblob DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `biophsy` mediumblob DEFAULT NULL,
  `history_number` bigint(20) unsigned NOT NULL,
  `procedure_numb` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `history_number` (`history_number`),
  KEY `procedure_numb` (`procedure_numb`),
  KEY `laboratory_idx` (`user_id`),
  CONSTRAINT `laboratory_data_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `patients` (`id`),
  CONSTRAINT `laboratory_data_ibfk_2` FOREIGN KEY (`procedure_numb`) REFERENCES `price` (`procedure_numb`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratory_data`
--

LOCK TABLES `laboratory_data` WRITE;
/*!40000 ALTER TABLE `laboratory_data` DISABLE KEYS */;
INSERT INTO `laboratory_data` VALUES (1,11,'1','9','1994-05-13 09:07:53','7',0,0),(2,12,'3','4','1995-09-04 07:29:23','3',47946,0),(3,13,'4','9','2002-07-23 05:22:19','1',426264535,0),(4,14,'2','3','1988-08-18 17:09:44','9',963631,0),(5,15,'7','5','1983-04-23 11:55:12','7',5,0),(6,17,'5','9','1978-04-21 15:17:09','3',566438,0),(7,18,'9','4','2014-06-07 12:15:34','4',4672,0),(8,19,'2','4','2017-05-08 19:59:22','1',1722,0),(9,20,'1','4','1986-02-23 00:47:46','8',5496,0),(10,11,'3','5','1977-02-07 13:41:00','8',543332654,0);
/*!40000 ALTER TABLE `laboratory_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurses`
--

DROP TABLE IF EXISTS `nurses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nurses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT current_timestamp(),
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `second_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_bithd` datetime NOT NULL,
  `phone` bigint(20) unsigned NOT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qualification` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`),
  KEY `other_w_idx` (`first_name`,`second_name`,`phone`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurses`
--

LOCK TABLES `nurses` WRITE;
/*!40000 ALTER TABLE `nurses` DISABLE KEYS */;
INSERT INTO `nurses` VALUES (1,'1989-11-10 08:28:01','Gwen','autem','1986-07-11 13:15:51',105,'xander30@example.com','m','Earum expedita nam et quibusdam.',270),(2,'2007-03-01 02:06:39','Helene','temporibus','2006-11-30 18:07:12',159,'laila81@example.org','f','Itaque perspiciatis sit autem aut sed eos incidunt delectus.',42778),(3,'2013-01-08 12:09:36','Rigoberto','sequi','1984-10-23 15:22:39',219,'green.nakia@example.net','f','Nulla ullam voluptas sed commodi.',2942720),(4,'2006-12-26 16:45:13','Jennie','maiores','2002-03-28 19:59:49',0,'orville22@example.net','f','Sit numquam qui sit nisi in.',9),(5,'1975-08-19 10:06:42','Beth','dolorum','2003-10-05 22:18:17',232,'jaron.cormier@example.com','m','Iste tempora unde velit ut et iure.',20969978),(6,'1977-11-05 08:43:19','Edmond','magnam','1988-04-22 21:59:56',532,'karen.okuneva@example.org','f','Non velit iusto sit ut alias omnis recusandae.',744175472),(7,'2021-10-22 02:13:41','Zachary','iste','2012-05-23 00:38:51',540776,'samson30@example.net','f','Autem alias aut sunt est totam quasi unde.',0),(8,'1993-06-21 20:02:25','Anais','est','1978-12-22 22:02:44',94,'beer.earnest@example.org','f','Suscipit eveniet recusandae est rem.',3),(9,'2008-09-11 11:41:34','Jewell','ut','1986-07-13 06:04:28',50,'carter.schmeler@example.org','f','Vero doloribus maxime ipsam dolorem aliquid aliquam ullam.',1160606),(10,'2002-04-12 00:07:52','Gregg','dicta','2016-09-21 01:01:55',266854,'hermina27@example.net','f','Est aspernatur voluptatibus dolore sed ut quidem vitae.',13490450);
/*!40000 ALTER TABLE `nurses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `second_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `date_of_bithd` datetime NOT NULL,
  `phone` bigint(20) unsigned NOT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `history_number` bigint(20) unsigned NOT NULL,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doctor_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `history_number` (`history_number`),
  KEY `doctor_id` (`doctor_id`),
  KEY `patients_idx` (`first_name`,`second_name`,`phone`,`email`),
  CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (11,'Lelah','odio','1998-08-23 09:20:56','2017-09-10 07:27:39',764,'ward.fredrick@example.com',4478164,'m',11),(12,'Dina','velit','1985-05-24 08:36:39','1995-02-02 20:26:41',0,'grant90@example.com',372539009,'m',12),(13,'Dayna','debitis','1983-11-04 17:09:01','1981-02-02 13:09:03',959,'wintheiser.zelda@example.com',8917567,'f',13),(14,'Carlos','corrupti','2006-10-30 07:17:37','1980-08-29 19:26:23',409,'xwolff@example.net',7821,'m',14),(15,'Cristina','ut','2011-04-09 02:28:51','2000-02-13 12:01:41',658,'kgrady@example.org',77126454,'m',15),(17,'Sarah','error','1995-03-15 11:12:27','2005-08-27 20:09:04',145,'sauer.raul@example.com',5,'m',19),(18,'Selmer','nobis','2000-03-02 17:54:43','1981-03-01 19:53:35',505,'amos53@example.com',590,'f',20),(19,'Electa','minus','1992-10-04 02:34:09','2006-12-23 08:06:51',2751497386,'dibbert.merlin@example.com',0,'f',11),(20,'Marcella','esse','2008-01-28 04:29:35','2010-02-19 04:58:08',1,'clemmie51@example.net',53087,'m',12);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price`
--

DROP TABLE IF EXISTS `price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `procedure_numb` bigint(20) unsigned NOT NULL,
  `procedure_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `procedure_numb` (`procedure_numb`),
  KEY `price_idx` (`procedure_name`,`procedure_numb`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price`
--

LOCK TABLES `price` WRITE;
/*!40000 ALTER TABLE `price` DISABLE KEYS */;
INSERT INTO `price` VALUES (1,0,'harum',696698),(2,167,'tempora',1),(3,164205246,'nostrum',1110799),(4,5,'tempora',101),(5,90384376,'similique',137),(6,155631,'eaque',52),(7,32,'libero',228203402),(8,4012861,'id',190952197),(9,489426,'aliquam',1396029),(10,4,'hic',102);
/*!40000 ALTER TABLE `price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedures_list`
--

DROP TABLE IF EXISTS `procedures_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procedures_list` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT current_timestamp(),
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doctor_id` bigint(20) unsigned DEFAULT NULL,
  `nurses_id` bigint(20) unsigned DEFAULT NULL,
  `departmens_id` bigint(20) unsigned DEFAULT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_type` bigint(20) unsigned DEFAULT NULL,
  `context` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `procedure_numb` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nurses_id` (`nurses_id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `user_id` (`user_id`),
  KEY `departmens_id` (`departmens_id`),
  KEY `procedure_numb` (`procedure_numb`),
  CONSTRAINT `procedures_list_ibfk_1` FOREIGN KEY (`nurses_id`) REFERENCES `nurses` (`id`),
  CONSTRAINT `procedures_list_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`),
  CONSTRAINT `procedures_list_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `patients` (`id`),
  CONSTRAINT `procedures_list_ibfk_4` FOREIGN KEY (`departmens_id`) REFERENCES `departmens` (`id`),
  CONSTRAINT `procedures_list_ibfk_5` FOREIGN KEY (`procedure_numb`) REFERENCES `price` (`procedure_numb`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedures_list`
--

LOCK TABLES `procedures_list` WRITE;
/*!40000 ALTER TABLE `procedures_list` DISABLE KEYS */;
INSERT INTO `procedures_list` VALUES (16,'1995-10-06 21:21:12','velit',16,6,6,'Quis et nemo vero voluptatum sed ullam dignissimos sit. Accusamus tempora omnis dolorem aliquam quam. Illum neque velit mollitia a ut aut laudantium qui.',0,'Nisi dolorum possimus quo ipsum.',17,5),(17,'1975-01-16 14:26:38','qui',19,7,7,'Laudantium atque sint rerum aut eligendi quia dolores. Ut dolorem vel dolor qui. Eligendi consequatur consectetur amet libero et minima ipsa.',0,'Quaerat odit temporibus accusamus impedit nostrum vel.',18,5),(18,'2003-08-24 19:31:35','excepturi',20,8,8,'Voluptatem voluptas est qui inventore sapiente dolores. Blanditiis voluptates suscipit non accusantium illo rerum quis. Deserunt est excepturi dicta voluptates tempora tempora. Porro distinctio commodi quia sapiente fuga fugiat.',0,'Sint repellat rerum itaque doloremque nihil.',19,4),(19,'1995-11-03 15:48:49','voluptate',11,9,9,'Similique aut fugit exercitationem sunt sint atque necessitatibus. Voluptates quo et quam consequatur dolores. Placeat sint et voluptates.',0,'Expedita assumenda eum sunt illum optio ducimus.',20,5);
/*!40000 ALTER TABLE `procedures_list` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-10 15:36:13

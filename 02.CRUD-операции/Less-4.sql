-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_23
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
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_user_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `communities_name_idx` (`name`),
  KEY `admin_user_id` (`admin_user_id`),
  CONSTRAINT `communities_ibfk_1` FOREIGN KEY (`admin_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Таблица сообществ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'quos',1),(2,'est',2),(3,'recusandae',3),(4,'debitis',4),(5,'ut',5),(6,'itaque',6),(7,'minus',7),(8,'earum',8),(9,'nulla',9),(10,'odit',10),(11,'iure',11),(12,'earum',12),(13,'quia',13),(14,'dolores',14),(15,'sed',15),(16,'ab',16),(17,'corrupti',17),(18,'laborum',18),(19,'sint',19),(20,'ipsam',20);
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `status` enum('requested','approved','unfriended','declined') COLLATE utf8_unicode_ci DEFAULT NULL,
  `requested_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `friend_requests` VALUES ('1','1','requested','1986-04-20 17:01:49','1998-02-23 02:50:02'),
('2','2','declined','1999-10-21 19:09:48','1995-06-01 12:45:33'),
('3','3','requested','1988-09-10 19:37:10','1995-11-02 02:18:28'),
('4','4','declined','2002-08-09 13:11:34','2001-08-17 11:58:56'),
('5','5','unfriended','2010-11-22 08:19:31','2018-02-14 06:25:03'),
('6','6','declined','2003-11-12 04:37:05','1985-03-31 17:13:11'),
('7','7','unfriended','2020-04-30 18:50:29','2013-12-18 12:44:58'),
('8','8','requested','2008-07-23 22:58:22','1989-08-26 17:25:16'),
('9','9','approved','1988-09-11 02:04:43','2018-05-08 16:41:15'),
('10','10','requested','1995-02-07 13:17:08','1987-08-24 13:45:43'),
('11','11','requested','2018-04-03 01:26:05','1978-11-06 04:06:52'),
('12','12','unfriended','1997-07-11 15:04:50','2001-02-28 07:05:32'),
('13','13','approved','1974-02-28 10:08:27','2020-02-17 21:54:48'),
('14','14','unfriended','1983-02-24 19:50:35','2013-03-07 13:27:48'),
('15','15','declined','1974-10-24 21:31:12','1970-04-08 04:39:56'),
('16','16','approved','2008-11-17 13:09:34','1987-02-02 05:34:33'),
('17','17','unfriended','1984-08-29 15:59:49','1998-11-27 00:22:55'),
('18','18','requested','2014-08-20 22:27:13','2015-03-06 16:35:22'),
('19','19','requested','1989-12-16 19:38:39','2018-06-21 00:49:33'),
('20','20','unfriended','1974-01-13 20:41:35','1979-05-24 08:43:32'),
('21','21','unfriended','2014-11-17 17:18:52','2016-12-27 18:14:32'),
('22','22','requested','2003-06-08 01:07:18','2003-11-06 23:43:46'),
('23','23','requested','1973-09-11 07:53:34','1987-02-25 07:14:50'),
('24','24','approved','1986-05-08 21:43:31','2016-11-01 05:53:05'),
('25','25','requested','2007-07-06 17:35:56','1989-12-07 19:59:47'),
('26','26','requested','2019-11-11 21:23:51','1995-07-28 21:11:24'),
('27','27','approved','2019-10-22 22:20:55','1998-10-20 13:03:25'),
('28','28','requested','1977-06-22 08:48:12','1993-02-06 20:33:35'),
('29','29','declined','2013-11-26 22:50:20','2018-07-30 12:38:15'),
('30','30','unfriended','1982-02-06 17:50:29','1983-05-22 18:11:47'),
('31','31','approved','2001-09-08 13:29:13','1988-02-22 23:59:17'),
('32','32','declined','2016-10-25 16:50:51','1994-10-29 18:55:31'),
('33','33','requested','2005-02-26 01:32:35','1998-03-17 11:37:23'),
('34','34','approved','2009-08-23 12:06:52','1973-12-23 10:00:27'),
('35','35','approved','2011-07-27 22:54:06','1994-01-26 04:41:52'),
('36','36','approved','1970-10-21 05:00:23','1978-01-23 11:23:52'),
('37','37','declined','1995-02-03 03:23:30','2010-04-26 04:59:33'),
('38','38','declined','1994-08-23 10:01:42','1987-10-12 18:07:10'),
('39','39','requested','1986-01-08 04:55:38','2006-12-22 15:11:40'),
('40','40','requested','2018-04-07 01:53:59','1999-07-18 21:15:18'),
('41','41','declined','2005-03-11 20:02:13','1988-06-19 20:06:08'),
('42','42','approved','2004-05-23 16:24:55','1975-08-10 06:08:19'),
('43','43','declined','2003-04-18 11:33:22','1990-12-08 07:38:08'),
('44','44','requested','1990-06-06 06:31:16','2004-02-29 19:08:36'),
('45','45','approved','2014-11-14 03:16:10','1971-01-14 08:35:33'),
('46','46','approved','2001-07-08 13:15:12','2014-10-22 01:06:36'),
('47','47','approved','2016-02-26 08:59:12','1996-05-22 11:43:06'),
('48','48','requested','2017-12-10 16:49:19','2013-02-02 06:04:41'),
('49','49','unfriended','2008-01-14 14:04:17','1974-05-10 05:47:23'),
('50','50','declined','1980-11-20 19:14:49','2000-11-18 19:19:58'),
('51','51','declined','2012-12-18 12:45:27','2016-01-12 19:05:27'),
('52','52','declined','2014-02-25 21:29:20','1988-09-27 09:44:47'),
('53','53','approved','1980-01-05 13:23:28','1991-01-13 12:36:04'),
('54','54','unfriended','2007-05-18 21:20:21','1985-08-17 20:47:01'),
('55','55','unfriended','1977-02-09 18:11:37','1976-05-06 21:30:13'),
('56','56','requested','1972-03-10 12:10:42','2014-12-03 00:19:28'),
('57','57','declined','1977-10-13 02:42:04','1976-11-01 11:44:36'),
('58','58','requested','2008-01-23 13:01:10','2003-05-19 00:33:52'),
('59','59','declined','1977-03-08 00:07:35','1997-05-21 19:31:52'),
('60','60','requested','1996-09-02 06:57:51','1987-10-24 05:23:35'),
('61','61','declined','1984-08-02 23:00:56','1979-02-02 11:14:46'),
('62','62','approved','2006-03-26 12:52:20','2011-06-09 11:40:59'),
('63','63','declined','1993-10-05 09:41:54','2019-01-12 09:14:22'),
('64','64','approved','2019-07-12 12:20:32','1977-05-29 08:42:50'),
('65','65','declined','1996-05-31 22:10:09','1996-11-12 17:34:24'),
('66','66','unfriended','2017-01-09 21:38:06','2000-11-21 22:51:19'),
('67','67','approved','1996-06-13 19:40:54','1979-01-19 12:23:44'),
('68','68','unfriended','2002-07-17 09:14:39','1997-12-15 02:30:34'),
('69','69','approved','1971-01-21 04:02:27','2007-01-23 17:48:46'),
('70','70','requested','1982-06-30 13:47:28','1995-10-29 06:03:24'),
('71','71','approved','2019-01-08 00:52:46','2001-10-18 12:41:14'),
('72','72','requested','2000-11-30 10:33:41','2010-07-24 04:48:51'),
('73','73','unfriended','1978-02-11 13:54:41','1982-08-01 22:10:05'),
('74','74','unfriended','1999-01-30 12:56:13','1976-10-26 19:38:08'),
('75','75','unfriended','1996-10-05 23:59:05','1978-09-25 04:38:48'),
('76','76','declined','1980-12-15 05:02:06','2005-11-21 18:55:10'),
('77','77','unfriended','2012-11-07 07:57:17','1978-04-14 02:18:08'),
('78','78','declined','2012-11-10 18:49:09','1994-11-17 08:16:20'),
('79','79','unfriended','1985-06-18 07:23:04','1989-01-16 14:10:08'),
('80','80','requested','2015-07-05 20:07:11','1974-04-25 23:06:52'),
('81','81','requested','1978-02-01 02:54:04','1987-11-09 05:47:25'),
('82','82','declined','2011-09-28 05:04:39','2013-02-02 02:21:40'),
('83','83','unfriended','2007-06-12 08:11:17','1983-12-26 17:41:20'),
('84','84','declined','1996-07-23 04:13:51','2001-10-19 01:04:52'),
('85','85','approved','2009-01-10 23:12:40','1976-04-17 18:21:53'),
('86','86','approved','1974-07-17 02:49:27','2011-11-19 19:48:08'),
('87','87','declined','2000-09-13 16:21:16','2008-07-13 15:11:55'),
('88','88','unfriended','1995-02-15 23:54:17','1998-01-25 18:47:03'),
('89','89','declined','2003-03-28 01:44:55','1971-05-31 02:02:39'),
('90','90','requested','2000-03-20 20:38:47','2005-06-10 12:32:02'),
('91','91','approved','1974-08-18 07:03:20','2006-10-19 18:04:16'),
('92','92','approved','1989-07-15 13:51:06','1979-10-15 03:16:03'),
('93','93','approved','2012-07-16 00:08:54','1975-10-26 15:46:43'),
('94','94','requested','2006-07-07 16:31:22','2015-11-03 06:30:48'),
('95','95','unfriended','1986-11-15 12:20:46','1987-12-29 01:25:10'),
('96','96','declined','1998-03-05 21:43:18','1977-10-13 07:55:27'),
('97','97','declined','1972-06-25 16:37:20','1997-11-24 02:44:24'),
('98','98','requested','1994-01-24 20:38:25','2004-10-12 23:11:20'),
('99','99','unfriended','2012-06-10 12:37:33','1975-08-18 19:08:55'),
('100','100','declined','2012-05-05 00:50:41','2017-03-18 17:23:54'); 

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,1,1,'1981-06-21 23:44:12'),(2,2,2,'1983-05-24 00:35:26'),(3,3,3,'1995-07-02 04:09:38'),(4,4,4,'2003-03-14 05:17:13'),(5,5,5,'1982-11-10 10:57:51'),(6,6,6,'1976-03-05 03:37:16'),(7,7,7,'1979-09-24 17:54:09'),(8,8,8,'1994-11-15 16:08:53'),(9,9,9,'1974-09-23 08:12:18'),(10,10,10,'1987-01-15 02:13:56'),(11,11,11,'2001-09-07 17:33:19'),(12,12,12,'1999-12-01 02:24:53'),(13,13,13,'1990-07-22 22:42:05'),(14,14,14,'1987-11-18 05:45:27'),(15,15,15,'1982-12-09 03:48:04'),(16,16,16,'1992-01-08 02:12:08'),(17,17,17,'2014-03-31 17:33:57'),(18,18,18,'1996-06-16 10:36:45'),(19,19,19,'2000-08-30 05:43:47'),(20,20,20,'2000-05-10 10:45:46');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Таблица медиа';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,1,'Et itaque est non. Consequatur facere vero unde occaecati pariatur odit praesentium. Amet atque ex fuga ad sunt laboriosam. Dolore aliquam nisi sapiente qui dignissimos repellendus.','esse',945499988,NULL,'2020-05-07 12:45:03','1980-01-23 06:21:38'),(2,2,2,'Voluptatem provident in sit aut aspernatur. Facilis neque quisquam itaque maxime veniam. Vitae perspiciatis est amet iusto ducimus. Omnis dolor ut quod voluptates sint ab.','quisquam',0,NULL,'2021-01-10 04:37:25','2002-12-29 18:33:56'),(3,3,3,'Cum quis ea pariatur atque repellat. Temporibus corrupti cumque exercitationem eveniet. Repellendus aut voluptatibus eaque quo fugiat enim ut aut. Voluptas et eveniet laudantium expedita.','voluptatem',57246952,NULL,'2011-10-13 12:44:43','1994-10-22 14:02:00'),(4,4,4,'Doloremque voluptates similique iusto quaerat error. Fuga sit a officiis cumque. Quisquam labore rem autem earum. Eum placeat accusamus dolor a et hic saepe.','illo',1879989,NULL,'2006-01-16 00:06:48','1992-06-12 14:59:06'),(5,1,5,'Libero nobis voluptatum aut et quam. Amet nesciunt corrupti sed suscipit temporibus. Modi accusamus veritatis sit voluptatem quo sint suscipit ut. Non et est repellendus ut accusamus sit quo.','molestiae',508,NULL,'1997-12-21 18:59:27','1973-05-02 13:56:46'),(6,2,6,'Consequuntur minima ut ex possimus hic. Itaque adipisci optio optio sequi vel inventore. Eos quod ipsa fugit neque illo nihil ducimus et. Ut non corporis sunt sunt fugit porro.','minus',0,NULL,'2018-04-10 16:14:09','1999-12-08 03:31:18'),(7,3,7,'Itaque officia aspernatur voluptas cupiditate inventore. Numquam ipsam aperiam et non. Numquam rerum sequi nobis velit id cumque eum non.','eos',300,NULL,'1984-07-10 13:30:00','2013-11-25 19:50:29'),(8,4,8,'Ut culpa qui beatae. Quis est saepe rerum. Sed voluptas eos sit officia.','consectetur',96,NULL,'2017-12-20 04:04:21','1986-01-18 16:03:21'),(9,1,9,'Eos aliquam numquam aut beatae. Exercitationem ab non delectus nemo in ea. Ducimus neque dignissimos officiis occaecati.','quis',534118,NULL,'1992-11-06 16:23:36','2016-07-22 02:56:41'),(10,2,10,'Optio ad aperiam dolorum consequatur ut saepe harum. Quia et hic exercitationem. Maiores provident corrupti minus qui quia.','aut',29525109,NULL,'2012-05-02 16:29:25','2004-09-30 16:03:56'),(11,3,11,'Voluptatem aut sed cum soluta at consequatur quibusdam. Quidem et eum nostrum est. Sunt commodi et ea impedit doloribus quia dolorum est.','consequatur',918,NULL,'2014-03-27 10:47:18','1974-11-26 13:07:39'),(12,4,12,'Nam quia quia vel quam minima aperiam quod eos. Cum maiores dolores non nostrum quasi at. Ratione sit aliquam pariatur facilis. Deserunt et culpa voluptatem ipsam.','molestiae',12320,NULL,'2016-09-08 17:28:54','1986-01-20 00:37:31'),(13,1,13,'Aut dolor maiores voluptatem eos eaque fugiat omnis. Repudiandae nesciunt non dolorum et voluptas omnis. Voluptates voluptatem dolores quis doloremque nulla.','ut',571,NULL,'1981-08-01 06:01:52','1999-08-02 02:03:23'),(14,2,14,'Repellat repudiandae occaecati optio. Laboriosam provident animi ut blanditiis nam. Maiores quo ea rerum qui nemo. Praesentium sunt ut qui eum autem.','velit',675,NULL,'1989-09-19 11:20:05','1974-11-21 09:32:49'),(15,3,15,'Animi voluptatem voluptates eum sed corrupti in. Aperiam totam qui veniam odit repellat temporibus quis earum. Quia voluptates explicabo totam explicabo aut ea.','voluptate',7743619,NULL,'1973-06-29 17:11:18','2016-09-13 00:27:31'),(16,4,16,'Necessitatibus nobis et id molestiae. Quasi ipsum non rerum ut. Dolores dolores ex illo aliquid.','esse',527802333,NULL,'1979-07-18 13:45:26','2006-03-19 01:21:14'),(17,1,17,'Consectetur fugit quos et quibusdam. Impedit inventore excepturi pariatur occaecati ea. Adipisci reiciendis autem illo.','eaque',93,NULL,'1973-06-11 08:05:07','1986-04-08 14:29:20'),(18,2,18,'Itaque maiores eveniet fuga vel sint. Ipsa harum aut velit. Non cumque iusto maiores nisi nisi. Repellendus blanditiis consequuntur commodi et laudantium tenetur necessitatibus. Eligendi nihil autem distinctio rerum et rerum quia.','nihil',9925271,NULL,'1987-04-07 16:13:52','2015-12-13 23:03:48'),(19,3,19,'Non totam et qui et. Labore ratione delectus dignissimos corporis dicta provident voluptas. Quaerat qui nemo non quis. Expedita non ea eveniet quasi.','eum',48,NULL,'1977-11-07 12:11:43','1990-07-09 00:54:44'),(20,4,20,'Vitae eos atque rerum incidunt molestiae quis. Cum in fuga est est nesciunt in et. Et ut et architecto qui laborum fugit. Qui cumque quia placeat totam.','quam',608,NULL,'2012-04-21 13:11:02','1981-10-16 19:15:13');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'здесь хранятся разные типы данных',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Таблица для хранения разных типов данных';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'omnis','1989-06-05 21:08:41','1979-12-08 05:18:16'),(2,'sint','1996-11-24 08:10:22','2013-07-28 19:24:33'),(3,'tempora','2018-05-11 20:43:18','2001-08-18 04:08:49'),(4,'veniam','2018-06-27 03:22:10','1996-02-17 08:36:56');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Таблица сообщений';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,1,'Quae facilis dolorum vitae quae. Rerum dignissimos minus velit numquam sed ut. Qui laboriosam corrupti nulla qui qui et aut molestias. Doloribus omnis et possimus eum incidunt vero facilis.','1987-06-02 21:54:47'),(2,2,2,'Nulla odio quas sint deleniti. Veritatis eaque placeat ex officia nesciunt ea molestias. Quis cumque amet vel sunt. Atque reiciendis debitis quasi natus alias. Dolores ipsum soluta sint sint in.','1998-01-20 08:06:55'),(3,3,3,'Nemo consequuntur cumque similique est. Accusamus vel amet sed illum ipsam tempore beatae.','1989-02-10 21:13:01'),(4,4,4,'Ipsam ex repellendus et quia odio. Vel doloremque vero accusantium earum blanditiis ut nihil. Voluptas reiciendis officiis ipsam numquam. Cumque aut facilis voluptas amet iusto temporibus nulla.','1995-02-11 15:55:21'),(5,5,5,'Et ut sapiente et dolorem eum. Ipsum eligendi facere molestias inventore. Aut at nesciunt facilis esse et vero. Officiis et tempora sed ut. Illum unde et nostrum est veniam dolorem.','2007-06-27 20:37:18'),(6,6,6,'Et repellat placeat praesentium expedita eum sint voluptas est. Nobis veniam repellendus est. Asperiores et eius et minima. Libero modi voluptatem dolorum.','2011-03-09 06:12:47'),(7,7,7,'Qui dolor deserunt officia laborum illo facere. Rerum quibusdam fugit ut fugit.','1983-06-11 16:29:24'),(8,8,8,'Non nam impedit praesentium eius. Voluptas dolore illum voluptatem est est error nulla. Quia ut molestias voluptate quo.','2002-11-22 08:39:34'),(9,9,9,'Ipsa et et possimus nulla aut dolores. Qui corporis quod consequatur enim et magnam. Expedita aliquam aut accusamus ipsam velit quam molestias voluptate. Possimus earum atque consequuntur explicabo.','2004-07-05 00:19:21'),(10,10,10,'Qui et sed sed dolores. Velit omnis adipisci et ullam ratione debitis sunt. Et modi facere et culpa quia ut aut necessitatibus.','2005-01-17 23:06:12'),(11,11,11,'Voluptas impedit suscipit ipsum aut at doloribus quae. Reprehenderit tenetur sequi ducimus vel saepe similique molestiae. Facere suscipit amet reprehenderit quos quia ut a. Dolorem consequatur expedita expedita molestiae. Amet rerum voluptatem asperiores et.','2021-07-07 02:01:06'),(12,12,12,'Nobis occaecati et voluptatum quas. Sed laudantium est vero laborum rerum corporis iste. Necessitatibus et aperiam praesentium praesentium.','2011-09-25 07:23:15'),(13,13,13,'Eligendi asperiores et sequi reiciendis iste voluptate unde et. Ad tenetur sequi quibusdam. Dolore repellat ut odio qui sed optio.','1991-10-27 11:32:56'),(14,14,14,'Dolor aut consequatur ipsam asperiores occaecati consequuntur. Necessitatibus ipsum vel et deleniti. Corrupti voluptatem enim voluptatem laudantium. Cumque sit ut voluptatem nam omnis. Ut est consequatur nihil sint id est nihil laudantium.','1981-01-04 23:29:13'),(15,15,15,'Architecto doloremque delectus consectetur recusandae accusamus delectus rerum sed. Ipsa labore et enim quia id repudiandae optio magnam. Rerum molestias quis error et sit.','2003-11-01 14:44:59'),(16,16,16,'Illum omnis eaque voluptate. Hic iure dolore iste ut dolores fugit qui laudantium. Nihil ex earum earum natus. Facere voluptates ut ipsam.','1990-09-08 17:27:16'),(17,17,17,'Delectus porro similique error ipsam fugit et. Eius et enim reiciendis est et. Iure quia temporibus iste et ut architecto rerum. Iusto ea libero officiis.','2014-01-20 01:49:20'),(18,18,18,'Consectetur autem enim nobis dolor vel mollitia. Quidem ut commodi qui quos velit voluptate et. Sunt deserunt aperiam et dolorem adipisci illum. Aut excepturi rerum molestiae quia reprehenderit. Illum nobis iusto perspiciatis esse.','2018-08-02 08:58:14'),(19,19,19,'Iusto aut ut non nesciunt quia. Fuga ea similique quas laboriosam. Rerum est perspiciatis odio sint provident ut a.','1980-06-23 16:43:05'),(20,20,20,'Deleniti explicabo est ea aliquam omnis. Illum quidem adipisci deserunt accusamus nihil et minima. Doloremque nisi mollitia reprehenderit amet explicabo doloribus.','2009-11-06 02:52:31');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_albums`
--

DROP TABLE IF EXISTS `photo_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_albums` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photo_albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_albums`
--

LOCK TABLES `photo_albums` WRITE;
/*!40000 ALTER TABLE `photo_albums` DISABLE KEYS */;
INSERT INTO `photo_albums` VALUES (1,'dolorem',1),(2,'culpa',2),(3,'explicabo',3),(4,'adipisci',4),(5,'rem',5),(6,'et',6),(7,'omnis',7),(8,'nostrum',8),(9,'qui',9),(10,'est',10),(11,'quos',11),(12,'vel',12),(13,'magni',13),(14,'enim',14),(15,'tenetur',15),(16,'sint',16),(17,'ab',17),(18,'deleniti',18),(19,'dolore',19),(20,'numquam',20);
/*!40000 ALTER TABLE `photo_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) unsigned DEFAULT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `album_id` (`album_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`),
  CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),(11,11,11),(12,12,12),(13,13,13),(14,14,14),(15,15,15),(16,16,16),(17,17,17),(18,18,18),(19,19,19),(20,20,20);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `photo_id` bigint(20) unsigned DEFAULT NULL,
  `hometown` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Таблица профилей';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'P','1980-11-08',1,'South','1998-09-08 04:13:47'),(2,'P','1972-12-19',2,'South','2018-05-16 04:39:55'),(3,'D','1989-08-07',3,'East','1972-04-05 02:08:12'),(4,'M','1978-05-02',4,'New','1980-03-01 04:15:16'),(5,'D','2015-01-21',5,'West','1986-12-26 08:39:28'),(6,'P','2005-05-31',6,'East','2009-09-08 16:52:24'),(7,'D','1986-03-16',7,'Lake','2011-08-06 22:15:39'),(8,'M','1972-03-07',8,'Port','2020-01-31 16:46:02'),(9,'D','2017-05-24',9,'Lake','1972-05-25 05:04:28'),(10,'M','2021-01-01',10,'Lake','1995-05-30 11:22:21'),(11,'D','2013-10-26',11,'Port','2002-08-25 03:45:46'),(12,'M','1971-07-23',12,'Lake','1981-10-19 05:42:39'),(13,'M','1999-09-30',13,'Lake','1985-07-08 17:36:41'),(14,'P','2016-05-11',14,'Port','1988-10-29 05:11:31'),(15,'D','2006-01-26',15,'South','2014-03-21 12:32:03'),(16,'P','2020-01-27',16,'New','1976-10-05 16:33:57'),(17,'D','1992-04-18',17,'North','2010-05-23 10:21:03'),(18,'M','1993-11-20',18,'West','2017-02-13 06:54:10'),(19,'M','1973-04-18',19,'North','1991-07-25 11:17:02'),(20,'P','2004-08-15',20,'North','2000-06-17 12:18:00');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Имя',
  `lastname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'фамилия',
  `email` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `name` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Таблица пользователей';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Arlene','Anderson','keeling.barton@example.com','4fc4a4a99f2e65b11341e0b7822d0a42e8853606',89973844583),(2,'Ahmad','Fisher','zboncak.wilma@example.net','8ce93b1a88320c546476e3df8cac0e9e2e8cda23',89440237022),(3,'Serenity','Zulauf','daphnee.jacobson@example.org','7fa9bf56c39c0fc2f943af5f31cbc895c34f1fc5',89318527238),(4,'Myrtle','Heller','emily58@example.net','3c92409c1b061c1b2af7e4ca34d0bf40a55da9b7',89441681338),(5,'Ike','Kris','gcollier@example.org','9c9cb1a5fc98a0fefa2285c15949bdc3108a4f1c',89357795898),(6,'Juwan','Price','toy.bernice@example.org','38c0f1eda7b584319f3a9000962c4f85d16a61b6',89065869458),(7,'Anibal','Williamson','schaden.lorine@example.net','c9a04ec8ec665cfef17a775d59d4be40edebf815',89442799145),(8,'Orin','Huels','bradtke.beau@example.org','70c7884b1e52488833604a75feb95198c403d160',89584745898),(9,'Jocelyn','Toy','dyost@example.com','9261bb7bdab72be0ea626e217da6e0c469208d33',89572017101),(10,'Ryleigh','Bergstrom','audie74@example.org','f5bd1d99abccda3e64fd26da25b985350e995b69',89042198661),(11,'Orie','Marvin','joesph35@example.com','80303ad621b391b99287777894db0afb5098c781',89120616833),(12,'Maggie','Breitenberg','daugherty.thad@example.com','999dc8136eec7739e3030bbf5a5573239deb5bb4',89544041200),(13,'Cortney','Romaguera','oberbrunner.jettie@example.org','1b1a0a5498cb63aeb9c3a328d6dc56cc31d98658',89114107889),(14,'Virginia','Turcotte','gottlieb.chris@example.com','be10ef4428e3f8f700eacb52de523e01fc28adc9',89602327079),(15,'Avis','Reichel','olson.joshua@example.org','eb415d220372697c69953c5878732b1a0e548e97',89269707319),(16,'Jonas','Leannon','allen.kassulke@example.net','43d71113ecfcf7a6ea544019c2629694312d809f',89995569897),(17,'Thelma','Kris','qhauck@example.org','31fddc96d11fd44b1b9d58a5321afc9546df47dd',89046640025),(18,'Sam','Lehner','kara73@example.net','7b7decb98a948776714e903fd464e477c3465fcf',89047305072),(19,'Lempi','Reinger','grath@example.net','fa81c480dcfabca81927b50c52950937b26019f4',89303147063),(20,'Omer','Wintheiser','kuhlman.maiya@example.org','1fbaf175dc8cd320795d2f8c85ac7631ef12c3f3',89804329484);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_communities`
--

DROP TABLE IF EXISTS `users_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_communities` (
  `user_id` bigint(20) unsigned NOT NULL,
  `community_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Таблица для связки пользователей и сообщества';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_communities`
--

LOCK TABLES `users_communities` WRITE;
/*!40000 ALTER TABLE `users_communities` DISABLE KEYS */;
INSERT INTO `users_communities` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20);
/*!40000 ALTER TABLE `users_communities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-09 15:10:50

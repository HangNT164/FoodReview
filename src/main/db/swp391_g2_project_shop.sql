-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: localhost    Database: swp391_g2_project
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop` (
  `shop_id` int NOT NULL AUTO_INCREMENT,
  `account_id` int DEFAULT NULL,
  `shop_name` varchar(255) DEFAULT NULL,
  `status` varchar(25) DEFAULT 'active',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rate` int DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`shop_id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `shop_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop`
--

LOCK TABLES `shop` WRITE;
/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
INSERT INTO `shop` VALUES (12,3,'shop1','active','abcd1','abcd11',3,'2021-10-26 13:34:45','2021-10-26 13:34:45'),(13,3,'shop2','active','abcd1','abcd1',2,'2021-10-28 14:59:07','2021-10-28 14:59:07'),(14,3,'shop3','active','abcd1','abcd1',1,'2021-10-28 14:59:07','2021-10-28 14:59:07'),(15,3,'shop4','active','abcd1','abcd1',1,'2021-10-28 14:59:07','2021-10-28 14:59:07'),(16,3,'shop5','active','abcd1','abcd1',1,'2021-10-28 14:59:07','2021-10-28 14:59:07'),(17,3,'shop6','active','abcd1','abcd1',2,'2021-10-28 14:59:07','2021-10-28 14:59:07'),(18,3,'shop7','active','abcd1','abcd1',3,'2021-10-28 14:59:07','2021-10-28 14:59:07'),(19,3,'shop8','active','abcd1','abcd1',4,'2021-10-28 14:59:07','2021-10-28 14:59:07'),(20,3,'shop9','active','abcd1','abcd1',5,'2021-10-28 14:59:07','2021-10-28 14:59:07'),(21,3,'shop10','active','abcd1','abcd1',2,'2021-10-28 14:59:07','2021-10-28 14:59:07'),(22,3,'shop11','active','abcd1','abcd1',4,'2021-10-28 14:59:07','2021-10-28 14:59:07'),(23,3,'shop12','active','abcd1','abcd1',3,'2021-10-28 14:59:07','2021-10-28 14:59:07'),(24,3,'shop13','active','abcd1','abcd1',2,'2021-10-28 14:59:59','2021-10-28 14:59:59'),(25,3,'124','active','24','32',NULL,'2021-10-30 08:46:31','2021-10-30 08:46:31'),(26,3,'fff','active','ff','ff',0,'2021-10-30 08:52:58','2021-10-30 08:52:58');
/*!40000 ALTER TABLE `shop` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-30 16:59:05

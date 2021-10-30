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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `account_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dob` varchar(50) DEFAULT NULL,
  `gender` tinyint DEFAULT '0',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `role` varchar(25) DEFAULT 'Reviewer',
  `email` varchar(50) DEFAULT NULL,
  `phone_number` varchar(13) DEFAULT NULL,
  `password` varchar(65) DEFAULT NULL,
  `status` varchar(25) DEFAULT 'active',
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `month` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `Email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'Nguyễn Thúy Hằng','16/04/1999',0,'Nam Định','Admin','hangnt16499@gmail.com','0942578685','$2a$12$CjeKefeyRy6y27JCjQxvm.OXJV2TOImNokn2dA8wPUi5tuZ7Z2nG6','active','2021-09-27 22:33:04','2021-09-27 22:33:04','07/2021'),(2,'Đinh Thế Hiệp','21/04/1999',1,'Hòa Bình','Reviewer','hiepdt@gmail.com','0945167852','$2a$12$CjeKefeyRy6y27JCjQxvm.OXJV2TOImNokn2dA8wPUi5tuZ7Z2nG6','active','2021-09-28 01:17:21','2021-09-28 01:17:21','07/2021'),(3,'Nguyễn Thế Trường Giang','10/10/1999',1,'Hà Nội','ShopOwner','giangntt@gmail.com','0984752694','$2a$12$CjeKefeyRy6y27JCjQxvm.OXJV2TOImNokn2dA8wPUi5tuZ7Z2nG6','active','2021-09-29 01:17:21','2021-09-29 01:17:21','07/2021'),(4,'Nguyễn Minh Hiếu','16/07/1999',1,'Phú Thọ','Admin','hieunm@gmail.com','0963489523','$2a$12$CjeKefeyRy6y27JCjQxvm.OXJV2TOImNokn2dA8wPUi5tuZ7Z2nG6','active','2021-09-28 01:17:21','2021-09-28 01:17:21','07/2021'),(5,'Nguyễn Văn Cường','27/09/1999',1,'Bắc Ninh','Reviewer','cuongnv@gmail.com','097415486','$2a$12$CjeKefeyRy6y27JCjQxvm.OXJV2TOImNokn2dA8wPUi5tuZ7Z2nG6','active','2021-09-28 01:17:21','2021-09-28 01:17:21','07/2021'),(6,'Trần Văn Hà','16/11/1999',1,'Quảng Ninh','Reviewer','hatv@gmail.com','0912475896','$2a$12$CjeKefeyRy6y27JCjQxvm.OXJV2TOImNokn2dA8wPUi5tuZ7Z2nG6','active','2021-09-28 01:17:21','2021-09-28 01:17:21','07/2021'),(7,'Lê Thị Thủy','25/02/1999',0,'Hà Giang','ShopOwner','thuylt@gmail.com','0924561761','$2a$12$CjeKefeyRy6y27JCjQxvm.OXJV2TOImNokn2dA8wPUi5tuZ7Z2nG6','active','2021-09-28 01:17:21','2021-09-28 01:17:21','07/2021'),(8,'Lý Thu Thảo','17/12/1999',0,'Lào Cai','Reviewer','thaolt@gmail.com','0974852159','$2a$12$CjeKefeyRy6y27JCjQxvm.OXJV2TOImNokn2dA8wPUi5tuZ7Z2nG6','active','2021-09-28 01:17:21','2021-09-28 01:17:21','07/2021'),(9,'Trần Thị Mười','22/01/1999',1,'Đà Nẵng','Admin','muoitt@gmail.com','0985943167','$2a$12$CjeKefeyRy6y27JCjQxvm.OXJV2TOImNokn2dA8wPUi5tuZ7Z2nG6','active','2021-09-28 01:17:21','2021-09-28 01:17:21','07/2021'),(10,'Nguyễn Hoàng Bách','06/03/1999',1,'Nghệ An','Reviewer','bachnh@gmail.com','0926742853','$2a$12$CjeKefeyRy6y27JCjQxvm.OXJV2TOImNokn2dA8wPUi5tuZ7Z2nG6','active','2021-09-28 01:17:21','2021-09-28 01:17:21','07/2021'),(11,'Nguyễn Tuấn Anh','09/11/1999',1,'Bình Thuận','ShopOwner','anhnt@gmail.com','0937941324','$2a$12$CjeKefeyRy6y27JCjQxvm.OXJV2TOImNokn2dA8wPUi5tuZ7Z2nG6','active','2021-09-28 01:17:21','2021-09-28 01:17:21','07/2021'),(12,'Lê Tùng Lâm','28/04/1999',1,'Cà Mau','Reviewer','lamlt@gmail.com','0978995817','$2a$12$CjeKefeyRy6y27JCjQxvm.OXJV2TOImNokn2dA8wPUi5tuZ7Z2nG6','active','2021-09-28 01:17:21','2021-09-28 01:17:21','');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-30 16:59:06

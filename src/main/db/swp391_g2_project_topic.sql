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
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topic` (
  `topic_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `status` varchar(25) DEFAULT 'pending',
  `content` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rate` int DEFAULT '0',
  `image` varchar(50) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `month` varchar(45) DEFAULT NULL,
  `account_id` int DEFAULT NULL,
  PRIMARY KEY (`topic_id`),
  KEY `topic_ibfk1_idx` (`account_id`),
  CONSTRAINT `topic_ibfk1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (1,'Quán ngon Cầu Giấy?','approved','Mọi người cho mình hỏi ở chỗ cầu giấy có quán nào ngon mà rẻ không nhỉ?',50,NULL,'2021-10-10 22:33:04','2021-10-10 22:33:04','07/2021',2),(2,'Quán ngon giá rẻ?','approved','Có chỗ nào ăn lẩu mà ngon bổ rẻ không ạ?',60,NULL,'2021-10-13 22:33:04','2021-10-13 22:33:04','07/2021',NULL),(3,'Quán nhậu chất lượng?','pending','Cho hỏi có quán nhậu nào chất lượng ở khu Bách Khoa không?',0,NULL,'2021-10-15 22:33:04','2021-10-15 22:33:04','07/2021',3),(4,'Hàng ăn sáng rẻ?','reject','Quanh khu Hai Bà Trưng có những hàng ăn sáng nào chất lượng mà giá cả hợp lý không ạ, mọi người recommend giúp mình với?',0,NULL,'2021-10-08 22:33:04','2021-10-08 22:33:04','07/2021',3),(48,'abcddd','pending','afdf',0,'a.jpeg','2021-10-30 08:44:26','2021-10-30 08:44:26','10/2021',2),(49,'ff','pending','ff',0,'a.jpeg','2021-10-30 09:03:26','2021-10-30 09:03:26','10/2021',2);
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-30 23:31:24

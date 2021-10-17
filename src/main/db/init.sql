-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE =
        'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema swp391_g2_project
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema swp391_project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `swp391_g2_project` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `swp391_g2_project`;

-- -----------------------------------------------------
-- Table `swp391_g2_project`.`account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `swp391_g2_project`.`account`
(
    `account_id`   int       NOT NULL AUTO_INCREMENT,
    `name`         varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL,
    `dob`          varchar(50)                                             DEFAULT NULL,
    `gender`       tinyint(4)                                              DEFAULT '0',
    `address`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `role`         varchar(25)                                             DEFAULT 'Reviewer',
    `email`        varchar(50)                                             DEFAULT NULL,
    `phone_number` varchar(13)                                             DEFAULT NULL,
    `password`     varchar(65)                                             DEFAULT NULL,
    `status`       varchar(25)                                             DEFAULT 'inactive',
    `created_date` timestamp NULL                                          DEFAULT CURRENT_TIMESTAMP,
    `updated_date` timestamp NULL                                          DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`account_id`),
    UNIQUE KEY `Email` (`email`),
    UNIQUE KEY `PhoneNumber` (`phone_number`)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 1
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account`
    DISABLE KEYS */;
INSERT INTO `account`
VALUES (1, 'Nguyễn Thúy Hằng', '16/04/1999', 0, 'Nam Định', 'Admin', 'hangnt16499@gmail.com', '0942578685',
        '$2a$12$CjeKefeyRy6y27JCjQxvm.OXJV2TOImNokn2dA8wPUi5tuZ7Z2nG6', 'active', '2021-09-28 05:33:04',
        '2021-09-28 05:33:04'),
       (2, 'Đinh Thế Hiệp', '21/04/1999', 1, 'Hòa Bình', 'Reviewer', 'hiepdt@gmail.com', '0945167852',
        '$2a$12$CjeKefeyRy6y27JCjQxvm.OXJV2TOImNokn2dA8wPUi5tuZ7Z2nG6', 'active', '2021-09-28 08:17:21',
        '2021-09-28 08:17:21'),
       (3, 'Nguyễn Thế Trường Giang', '10/10/1999', 1, 'Hà Nội', 'ShopOwner', 'giangntt@gmail.com', '0984752694',
        '$2a$12$CjeKefeyRy6y27JCjQxvm.OXJV2TOImNokn2dA8wPUi5tuZ7Z2nG6', 'active', '2021-09-29 08:17:21',
        '2021-09-29 08:17:21'),
       (4, 'Nguyễn Minh Hiếu', '16/07/1999', 1, 'Phú Thọ', 'Admin', 'hieunm@gmail.com', '0963489523',
        '$2a$12$CjeKefeyRy6y27JCjQxvm.OXJV2TOImNokn2dA8wPUi5tuZ7Z2nG6', 'active', '2021-09-28 08:17:21',
        '2021-09-28 08:17:21'),
       (5, 'Nguyễn Văn Cường', '27/09/1999', 1, 'Bắc Ninh', 'Reviewer', 'cuongnv@gmail.com', '097415486',
        '$2a$12$CjeKefeyRy6y27JCjQxvm.OXJV2TOImNokn2dA8wPUi5tuZ7Z2nG6', 'active', '2021-09-28 08:17:21',
        '2021-09-28 08:17:21'),
       (6, 'Trần Văn Hà', '16/11/1999', 1, 'Quảng Ninh', 'Reviewer', 'hatv@gmail.com', '0912475896',
        '$2a$12$CjeKefeyRy6y27JCjQxvm.OXJV2TOImNokn2dA8wPUi5tuZ7Z2nG6', 'active', '2021-09-28 08:17:21',
        '2021-09-28 08:17:21'),
       (7, 'Lê Thị Thủy', '25/02/1999', 0, 'Hà Giang', 'ShopOwner', 'thuylt@gmail.com', '0924561761',
        '$2a$12$CjeKefeyRy6y27JCjQxvm.OXJV2TOImNokn2dA8wPUi5tuZ7Z2nG6', 'active', '2021-09-28 08:17:21',
        '2021-09-28 08:17:21'),
       (8, 'Lý Thu Thảo', '17/12/1999', 0, 'Lào Cai', 'Reviewer', 'thaolt@gmail.com', '0974852159',
        '$2a$12$CjeKefeyRy6y27JCjQxvm.OXJV2TOImNokn2dA8wPUi5tuZ7Z2nG6', 'active', '2021-09-28 08:17:21',
        '2021-09-28 08:17:21'),
       (9, 'Trần Thị Mười', '22/01/1999', 1, 'Đà Nẵng', 'Admin', 'muoitt@gmail.com', '0985943167',
        '$2a$12$CjeKefeyRy6y27JCjQxvm.OXJV2TOImNokn2dA8wPUi5tuZ7Z2nG6', 'active', '2021-09-28 08:17:21',
        '2021-09-28 08:17:21'),
       (10, 'Nguyễn Hoàng Bách', '06/03/1999', 1, 'Nghệ An', 'Reviewer', 'bachnh@gmail.com', '0926742853',
        '$2a$12$CjeKefeyRy6y27JCjQxvm.OXJV2TOImNokn2dA8wPUi5tuZ7Z2nG6', 'active', '2021-09-28 08:17:21',
        '2021-09-28 08:17:21'),
       (11, 'Nguyễn Tuấn Anh', '09/11/1999', 1, 'Bình Thuận', 'ShopOwner', 'anhnt@gmail.com', '0937941324',
        '$2a$12$CjeKefeyRy6y27JCjQxvm.OXJV2TOImNokn2dA8wPUi5tuZ7Z2nG6', 'active', '2021-09-28 08:17:21',
        '2021-09-28 08:17:21'),
       (12, 'Lê Tùng Lâm', '28/04/1999', 1, 'Cà Mau', 'Reviewer', 'lamlt@gmail.com', '0978995817',
        '$2a$12$CjeKefeyRy6y27JCjQxvm.OXJV2TOImNokn2dA8wPUi5tuZ7Z2nG6', 'active', '2021-09-28 08:17:21',
        '2021-09-28 08:17:21');
/*!40000 ALTER TABLE `account`
    ENABLE KEYS */;
UNLOCK TABLES;


-- -----------------------------------------------------
-- Table `swp391_g2_project`.`shop`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `swp391_g2_project`.`shop`
(
    `shop_id`      int          NOT NULL AUTO_INCREMENT,
    `account_id`   int          NOT NULL,
    `shop_name`    varchar(255) NOT NULL,
    `status`       varchar(25)                                             DEFAULT 'inactive',
    `address`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `description`  text CHARACTER SET utf8 COLLATE utf8_general_ci,
    `rate`         int(11)                                                 DEFAULT NULL,
    `created_date` datetime     NOT NULL,
    `updated_date` datetime                                                DEFAULT NULL,
    PRIMARY KEY (`shop_id`),
    KEY `account_id` (`account_id`),
    CONSTRAINT `shop_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 1
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `swp391_g2_project`.`food`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `swp391_g2_project`.`food`
(
    `food_id`      int          NOT NULL AUTO_INCREMENT,
    `shop_id`      int          NOT NULL,
    `food_name`    varchar(255) NOT NULL,
    `status`       varchar(25) DEFAULT 'inactive',
    `description`  text CHARACTER SET utf8 COLLATE utf8_general_ci,
    `rate`         int(11)     DEFAULT NULL,
    `created_date` datetime     NOT NULL,
    `updated_date` datetime    DEFAULT NULL,
    PRIMARY KEY (`food_id`),
    KEY `shop_id` (`shop_id`),
    CONSTRAINT `food_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`shop_id`)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 1
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `swp391_g2_project`.`topic`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `swp391_g2_project`.`topic`
(
    `topic_id`     int          NOT NULL AUTO_INCREMENT,
    `title`        varchar(255) NOT NULL,
    `status`       varchar(25)       DEFAULT 'pending',
    `content`      text CHARACTER SET utf8 COLLATE utf8_general_ci,
    `rate`         int(11)           DEFAULT 0,
    `created_date` timestamp    NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_date` timestamp    NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`topic_id`)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 1
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;

--
-- Dumping data for table `account`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic`
    DISABLE KEYS */;
INSERT INTO `topic`
VALUES (1, 'Quán ngon Cầu Giấy?', 'approved', 'Mọi người cho mình hỏi ở chỗ cầu giấy có quán nào ngon mà rẻ không nhỉ?',
        50, '2021-10-11 05:33:04', '2021-10-11 05:33:04'),
       (2, 'Quán ngon giá rẻ?', 'approved', 'Có chỗ nào ăn lẩu mà ngon bổ rẻ không ạ?', 60, '2021-10-14 05:33:04',
        '2021-10-14 05:33:04'),
       (3, 'Quán nhậu chất lượng?', 'pending', 'Cho hỏi có quán nhậu nào chất lượng ở khu Bách Khoa không?', 0,
        '2021-10-16 05:33:04', '2021-10-16 05:33:04'),
       (4, 'Hàng ăn sáng rẻ?', 'reject',
        'Quanh khu Hai Bà Trưng có những hàng ăn sáng nào chất lượng mà giá cả hợp lý không ạ, mọi người recommend giúp mình với?',
        0, '2021-10-09 05:33:04', '2021-10-09 05:33:04');
/*!40000 ALTER TABLE `topic`
    ENABLE KEYS */;
UNLOCK TABLES;

-- -----------------------------------------------------
-- Table `swp391_g2_project`.`topic_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `topic_comment`;
CREATE TABLE `swp391_g2_project`.`topic_comment`
(
    `topic_comment_id` int      NOT NULL AUTO_INCREMENT,
    `topic_id`         int      NOT NULL,
    `status`           varchar(25) DEFAULT 'inactive',
    `content`          text CHARACTER SET utf8 COLLATE utf8_general_ci,
    `rate`             int(11)     DEFAULT NULL,
    `created_date`     datetime NOT NULL,
    `updated_date`     datetime    DEFAULT NULL,
    PRIMARY KEY (`topic_comment_id`),
    KEY `topic_id` (`topic_id`),
    CONSTRAINT `topic_comment_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`topic_id`)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 1
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `swp391_g2_project`.`shop_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shop_comment`;
CREATE TABLE `swp391_g2_project`.`shop_comment`
(
    `shop_comment_id` int      NOT NULL AUTO_INCREMENT,
    `shop_id`         int      NOT NULL,
    `status`          varchar(25) DEFAULT 'inactive',
    `content`         text CHARACTER SET utf8 COLLATE utf8_general_ci,
    `rate`            int(11)     DEFAULT NULL,
    `created_date`    datetime NOT NULL,
    `updated_date`    datetime    DEFAULT NULL,
    PRIMARY KEY (`shop_comment_id`),
    KEY `shop_id` (`shop_id`),
    CONSTRAINT `shop_comment_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`shop_id`)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 1
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `swp391_g2_project`.`food_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `food_comment`;
CREATE TABLE `swp391_g2_project`.`food_comment`
(
    `food_comment_id` int      NOT NULL AUTO_INCREMENT,
    `food_id`         int      NOT NULL,
    `status`          varchar(25) DEFAULT 'inactive',
    `content`         text CHARACTER SET utf8 COLLATE utf8_general_ci,
    `rate`            int(11)     DEFAULT NULL,
    `created_date`    datetime NOT NULL,
    `updated_date`    datetime    DEFAULT NULL,
    PRIMARY KEY (`food_comment_id`),
    KEY `food_id` (`food_id`),
    CONSTRAINT `food_comment_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 1
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;

-- Add column --
ALTER TABLE `swp391_g2_project`.`account`
    ADD COLUMN `month` VARCHAR(45) NULL AFTER `updated_date`;
UPDATE `swp391_g2_project`.`account`
SET `month` = '07/2021'
WHERE (`account_id` = '1');
UPDATE `swp391_g2_project`.`account`
SET `month` = '07/2021'
WHERE (`account_id` = '2');
UPDATE `swp391_g2_project`.`account`
SET `month` = '07/2021'
WHERE (`account_id` = '3');
UPDATE `swp391_g2_project`.`account`
SET `month` = '08/2021'
WHERE (`account_id` = '4');
UPDATE `swp391_g2_project`.`account`
SET `month` = '08/2021'
WHERE (`account_id` = '5');
UPDATE `swp391_g2_project`.`account`
SET `month` = '08/2021'
WHERE (`account_id` = '6');
UPDATE `swp391_g2_project`.`account`
SET `month` = '08/2021'
WHERE (`account_id` = '7');
UPDATE `swp391_g2_project`.`account`
SET `month` = '08/2021'
WHERE (`account_id` = '8');
UPDATE `swp391_g2_project`.`account`
SET `month` = '09/2021'
WHERE (`account_id` = '9');
UPDATE `swp391_g2_project`.`account`
SET `month` = '09/2021'
WHERE (`account_id` = '10');
UPDATE `swp391_g2_project`.`account`
SET `month` = '09/2021'
WHERE (`account_id` = '11');
UPDATE `swp391_g2_project`.`account`
SET `month` = '09/2021'
WHERE (`account_id` = '12');

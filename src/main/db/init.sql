CREATE
DATABASE swp391_g2_project CHARACTER SET utf8;

CREATE TABLE `account`
(
    `account_id`   int(11) NOT NULL AUTO_INCREMENT,
    `name`         varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL,
    `dob`          varchar(50)                                             DEFAULT NULL,
    `gender`       tinyint(4) DEFAULT '0',
    `address`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `role`         varchar(25)                                             DEFAULT 'Reviewer',
    `email`        varchar(50)                                             DEFAULT NULL,
    `phone_number` varchar(13)                                             DEFAULT NULL,
    `password`     varchar(65)                                             DEFAULT NULL,
    `status`       varchar(25)                                             DEFAULT 'active',
    `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`account_id`),
    UNIQUE KEY `Email` (`email`),
    UNIQUE KEY `PhoneNumber` (`phone_number`)
)

CREATE TABLE IF NOT EXISTS `swp391_g2_project`.`shop`
(
    `shop_id`
    INT
    NOT
    NULL
    AUTO_INCREMENT,
    `account_id`
    INT
    NOT
    NULL,
    `shop_name`
    INT
    NOT
    NULL,
    `status`
    VARCHAR
(
    25
) NULL DEFAULT 'inactive',
    `address` VARCHAR
(
    255
) CHARACTER SET 'utf8' NULL DEFAULT NULL,
    `description` TEXT CHARACTER SET 'utf8' NULL DEFAULT NULL,
    `rate` INT NULL DEFAULT NULL,
    `created_date` DATETIME NOT NULL,
    `updated_date` DATETIME NULL DEFAULT NULL,
    PRIMARY KEY
(
    `shop_id`
),
    FOREIGN KEY
(
    `account_id`
) REFERENCES `swp391_g2_project`.`account`
(
    `account_id`
))
    ENGINE = InnoDB
    AUTO_INCREMENT = 1
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `swp391_g2_project`.`food`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swp391_g2_project`.`food`
(
    `food_id`
    INT
    NOT
    NULL
    AUTO_INCREMENT,
    `shop_id`
    INT
    NOT
    NULL,
    `food_name`
    INT
    NOT
    NULL,
    `status`
    VARCHAR
(
    25
) NULL DEFAULT 'inactive',
    `description` TEXT CHARACTER SET 'utf8' NULL DEFAULT NULL,
    `rate` INT NULL DEFAULT NULL,
    `created_date` DATETIME NOT NULL,
    `updated_date` DATETIME NULL DEFAULT NULL,
    PRIMARY KEY
(
    `food_id`
),
    FOREIGN KEY
(
    `shop_id`
) REFERENCES `swp391_g2_project`.`shop`
(
    `shop_id`
))
    ENGINE = InnoDB
    AUTO_INCREMENT = 1
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `swp391_g2_project`.`topic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swp391_g2_project`.`topic`
(
    `topic_id`
    INT
    NOT
    NULL
    AUTO_INCREMENT,
    `title`
    INT
    NOT
    NULL,
    `status`
    VARCHAR
(
    25
) NULL DEFAULT 'inactive',
    `content` TEXT CHARACTER SET 'utf8' NULL DEFAULT NULL,
    `rate` INT NULL DEFAULT NULL,
    `created_date` DATETIME NOT NULL,
    `updated_date` DATETIME NULL DEFAULT NULL,
    PRIMARY KEY
(
    `topic_id`
))
    ENGINE = InnoDB
    AUTO_INCREMENT = 1
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `swp391_g2_project`.`topic_comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swp391_g2_project`.`topic_comment`
(
    `topic_comment_id`
    INT
    NOT
    NULL
    AUTO_INCREMENT,
    `topic_id`
    INT
    NOT
    NULL,
    `status`
    VARCHAR
(
    25
) NULL DEFAULT 'inactive',
    `content` TEXT CHARACTER SET 'utf8' NULL DEFAULT NULL,
    `rate` INT NULL DEFAULT NULL,
    `created_date` DATETIME NOT NULL,
    `updated_date` DATETIME NULL DEFAULT NULL,
    PRIMARY KEY
(
    `topic_comment_id`
),
    FOREIGN KEY
(
    `topic_id`
) REFERENCES `swp391_g2_project`.`topic`
(
    `topic_id`
))
    ENGINE = InnoDB
    AUTO_INCREMENT = 1
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `swp391_g2_project`.`shop_comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swp391_g2_project`.`shop_comment`
(
    `shop_comment_id`
    INT
    NOT
    NULL
    AUTO_INCREMENT,
    `shop_id`
    INT
    NOT
    NULL,
    `status`
    VARCHAR
(
    25
) NULL DEFAULT 'inactive',
    `content` TEXT CHARACTER SET 'utf8' NULL DEFAULT NULL,
    `rate` INT NULL DEFAULT NULL,
    `created_date` DATETIME NOT NULL,
    `updated_date` DATETIME NULL DEFAULT NULL,
    PRIMARY KEY
(
    `shop_comment_id`
),
    FOREIGN KEY
(
    `shop_id`
) REFERENCES `swp391_g2_project`.`shop`
(
    `shop_id`
))
    ENGINE = InnoDB
    AUTO_INCREMENT = 1
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `swp391_g2_project`.`food_comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swp391_g2_project`.`food_comment`
(
    `food_comment_id`
    INT
    NOT
    NULL
    AUTO_INCREMENT,
    `food_id`
    INT
    NOT
    NULL,
    `status`
    VARCHAR
(
    25
) NULL DEFAULT 'inactive',
    `content` TEXT CHARACTER SET 'utf8' NULL DEFAULT NULL,
    `rate` INT NULL DEFAULT NULL,
    `created_date` DATETIME NOT NULL,
    `updated_date` DATETIME NULL DEFAULT NULL,
    PRIMARY KEY
(
    `food_comment_id`
),
    FOREIGN KEY
(
    `food_id`
) REFERENCES `swp391_g2_project`.`food`
(
    `food_id`
))
    ENGINE = InnoDB
    AUTO_INCREMENT = 1
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;
USE `swp391_g2_project`;
DROP procedure IF EXISTS `paggingShop`;

DELIMITER $$
USE `swp391_g2_project`$$
CREATE PROCEDURE `paggingShop` (IN page INT, IN size INT)
BEGIN
SELECT * FROM shop
                  LIMIT page,size;
END$$

DELIMITER ;


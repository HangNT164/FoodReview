USE `swp391_g2_project`;
DROP procedure IF EXISTS `paggingShop`;

DELIMITER $$
USE `swp391_g2_project`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `paggingShop`(IN page INT, IN size INT,IN shopName VARCHAR(255))
BEGIN
    SELECT * FROM shop
    where shop_name LIKE CONCAT('%', shopName , '%')
    ORDER BY shop_id desc
    LIMIT page,size;
END$$

DELIMITER ;


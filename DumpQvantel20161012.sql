CREATE DATABASE  IF NOT EXISTS `qvantel` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `qvantel`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: qvantel
-- ------------------------------------------------------
-- Server version	5.7.15-log

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
-- Table structure for table `tbl_product`
--

DROP TABLE IF EXISTS `tbl_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_title` varchar(45) DEFAULT NULL,
  `product_description` varchar(5000) DEFAULT NULL,
  `product_user_id` int(11) DEFAULT NULL,
  `product_date` datetime DEFAULT NULL,
  `product_price` double DEFAULT NULL,
  `product_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_product`
--

LOCK TABLES `tbl_product` WRITE;
/*!40000 ALTER TABLE `tbl_product` DISABLE KEYS */;
INSERT INTO `tbl_product` VALUES (3,'ff','sd',1,'2016-10-08 17:08:56',0,0),(4,'toka','rrr',1,'2016-10-08 17:09:27',0,0),(5,'ll','fg',1,'2016-10-08 17:10:56',0,0),(6,'jj','jhg',1,'2016-10-08 17:16:49',0,0),(7,'oojj','oop',1,'2016-10-08 17:19:20',0,0),(8,'kolmas','dd',1,'2016-10-08 17:24:13',0,0),(9,'a','sfa',1,'2016-10-08 17:24:36',0,0),(10,'ööö2','kj',1,'2016-10-08 17:24:48',0,0),(11,'uusi','viesti',1,'2016-10-08 17:53:40',0,0),(12,'fdfs','fffdfd',1,'2016-10-08 22:22:19',0,0),(13,'fsfdf','sdfsdfd',1,'2016-10-08 22:22:24',0,0),(14,'fsdf','fsdfsfs',1,'2016-10-08 22:22:41',0,0),(15,'fdgfd','dfgdggf',1,'2016-10-08 22:22:46',0,0),(16,'cc','zc',1,'2016-10-09 13:15:44',0,0),(17,'hh','jhhg',1,'2016-10-09 13:39:44',0,0),(18,'hgjjgh','xfgxx',1,'2016-10-09 13:39:53',0,0),(19,'dd','xvx',1,'2016-10-09 14:03:54',0,0),(20,'asdas','dfsdfs',1,'2016-10-09 16:00:24',0,0),(21,'dsf','sfdfsdfsd',1,'2016-10-09 16:40:26',0,0),(22,'sfdaf','fdfadsfsd',7,'2016-10-09 16:56:39',0,0),(23,'affds','sadffasfdas',7,'2016-10-09 16:56:50',0,0),(24,'fsfs','sfdfsd',8,'2016-10-09 17:21:53',66,0),(25,'sdfsd','dsagdsag',8,'2016-10-09 17:22:19',0,0),(26,'fgf','dsdfsd',8,'2016-10-09 17:45:40',33,5),(28,'sfd','sfdsdf',8,'2016-10-09 18:19:28',0,0),(29,'sdf','sfdsdf',8,'2016-10-09 18:19:40',0,0),(30,'sfd','sfdsd',8,'2016-10-09 18:19:46',0,0),(31,'sfds','sffsd',8,'2016-10-09 18:19:51',10,0),(32,'sfsfd','sfdfd',8,'2016-10-09 18:20:17',100,0),(33,'sasa','sdaasd',8,'2016-10-09 18:47:57',0,0),(40,'aaa','sada',8,'2016-10-12 15:00:30',4,53),(41,'dad','sadas',8,'2016-10-12 16:16:43',33,53);
/*!40000 ALTER TABLE `tbl_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) DEFAULT NULL,
  `user_username` varchar(45) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_password` (`user_password`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (1,'root','tuomas.liikala@tuppu.fi','pbkdf2:sha1:1000$OVSTLr8N$148aee7a8df515448e0b71a9a2e5f3024106908b'),(2,'kayttaja','tuppu88@gmail.com','pbkdf2:sha1:1000$Lz8wfByC$42f58ae52f1ea97833efb4e91028a21b07ba3590'),(3,'uusi','jeee@gg.com','pbkdf2:sha1:1000$xMfnpMQM$915b25ba50b0aadd65e174a36fbed7480965cd3e'),(4,'ffffs','sdfsfd@ds.cc','pbkdf2:sha1:1000$SSQllWN6$f8f895ae211e307f0e84b33735110ae9b9f8972d'),(5,'fdgdf','tuomfas.liikalda@tufdsppu.fi','pbkdf2:sha1:1000$a7qwITVh$8ae0a1d77e44b1af37d3992059f8a7d4a25431f8'),(6,'tuomas','tuppu@tuppu.fi','pbkdf2:sha1:1000$XYbqKVJY$fb550eadf679a80e9ad5703aa630b3431576ab6e'),(7,'jeesus','jeesus@jeesus.fi','pbkdf2:sha1:1000$BrBjnEpr$2df78075068fce8d4fb5b20ec8d5559bcc0204c9'),(8,'jee','jee@jee.fi','pbkdf2:sha1:1000$ZqXTDskh$c02753e05b591b8cbec6920a3756f47ca196a952');
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'qvantel'
--

--
-- Dumping routines for database 'qvantel'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_addProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_addProduct`(
    IN p_name varchar(45),
    IN p_description varchar(1000),
    IN p_user_id bigint,
    IN p_price double,
    IN p_count int(11)
)
BEGIN
    insert into tbl_product(
        product_title,
        product_description,
        product_user_id,
        product_date,
        product_price,
        product_count
    )
    values
    (
        p_name,
        p_description,
        p_user_id,
        NOW(),
        p_price,
        p_count
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_createUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_createUser`(
    IN p_name VARCHAR(45),
    IN p_username VARCHAR(45),
    IN p_password VARCHAR(255)
)
BEGIN
    if ( select exists (select 1 from tbl_user where user_username = p_username) ) THEN
     
        select 'Username Exists !!';
     
    ELSE
     
        insert into tbl_product
        (
            user_name,
            user_username,
            user_password
        )
        values
        (
            p_name,
            p_username,
            p_password
        );
     
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_deleteProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteProduct`(
IN p_product_id bigint,
IN p_user_id bigint
)
BEGIN
delete from tbl_product where product_id = p_product_id and product_user_id = p_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Get2ProductByUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Get2ProductByUser`(
IN p_user_id bigint,
IN p_limit int,
IN p_offset int,
IN p_key varchar(25),
IN p_sortBy varchar(25),
IN p_sortWay varchar(25),
out p_total bigint
)
BEGIN
	Set @var = concat( p_key,'%');
   
    select count(*) into p_total from tbl_product where product_user_id = p_user_id and product_title like @var;
    
    SET @t1 = CONCAT( 'select * from tbl_product where product_user_id = ', p_user_id, ' and product_title like "',@var,'" order by ',p_sortBy,' asc limit ',p_limit,' offset ',p_offset);
    
    PREPARE stmt FROM @t1;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetProductById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetProductById`(
IN p_product_id bigint,
IN p_user_id bigint
)
BEGIN
select * from tbl_product where product_id = p_product_id and product_user_id = p_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_updateProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateProduct`(
IN p_title varchar(45),
IN p_description varchar(1000),
IN p_product_id bigint,
In p_user_id bigint,
IN p_price double,
IN p_count int(11)
)
BEGIN
update tbl_product set product_title = p_title,product_description = p_description,product_price = p_price,product_count=p_count
    where product_id = p_product_id and product_user_id = p_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_validateLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_validateLogin`(
IN p_username VARCHAR(45)
)
BEGIN
    select * from tbl_user where user_username = p_username;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-12 16:46:00

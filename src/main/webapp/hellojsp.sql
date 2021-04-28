-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hellojsp
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `tb_blog`
--

DROP TABLE IF EXISTS `tb_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_blog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `att_file_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `att_file_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reg_date` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `reg_user` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_title` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_date` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_user` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_blog`
--

LOCK TABLES `tb_blog` WRITE;
/*!40000 ALTER TABLE `tb_blog` DISABLE KEYS */;
INSERT INTO `tb_blog` VALUES (26,'sub','ss',NULL,NULL,'20210419134016',-1,NULL,NULL,NULL,NULL),(27,'subject','content','Inked04 - question -05 tailbar-1_LI.jpg','0912381a36843724e68983987e9cccafe3e05d7a.jpg','20210422184936',-1,'6','title','20210423102432','6'),(28,'sub','asas','Inked04 - question -05 tailbar-1_LI.jpg','02aac0d3378f9db23483666c90361ea1629cd04d.jpg','20210422195828',-1,'6','useLW',NULL,NULL),(29,'blog subject','lorem ipsum dolar sit amit','','','2021-04-23',1,'6','Title_con','20210426110753','6'),(30,'Blog test','Lorem ipsum dolar sit  amit ...','409a8bf931d876716a4e45ca1401b0b5.png','3408332bfbc72744ede2a2d1dbe686a85cd0d387.png','2021-04-26',-1,'6','Blog t',NULL,NULL),(31,'subje','asas','176525159_129124099145632_6602178733348376936_n (1).jpg','5cbac354bc817b5484388bb01dfa86373229c90b.jpg','2021-04-26',1,'6','title',NULL,NULL);
/*!40000 ALTER TABLE `tb_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_blog_comment`
--

DROP TABLE IF EXISTS `tb_blog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_blog_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reg_user` int DEFAULT NULL,
  `blog_id` int DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reg_date` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_blog_comment`
--

LOCK TABLES `tb_blog_comment` WRITE;
/*!40000 ALTER TABLE `tb_blog_comment` DISABLE KEYS */;
INSERT INTO `tb_blog_comment` VALUES (1,1,29,'comment','2021-04-26'),(2,NULL,29,'ckjklsd','2021-04-26'),(3,NULL,29,'sadas','10');
/*!40000 ALTER TABLE `tb_blog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_category`
--

DROP TABLE IF EXISTS `tb_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `description` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reg_date` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_category`
--

LOCK TABLES `tb_category` WRITE;
/*!40000 ALTER TABLE `tb_category` DISABLE KEYS */;
INSERT INTO `tb_category` VALUES (5,'T-SHIRT',-1,0,'t shirt clothes','4','20210418131514'),(6,'MENS',-1,0,'men all clothes','1','20210418140821'),(7,'WOMENS',1,10,'women all type clothes','3','20210418141255'),(8,'SUNGLASS',1,0,'all type sun glass','3','20210418141744'),(10,'SPORTWEAR',1,0,'sport clothes','3','20210418142144'),(11,'NIKE',1,10,'clothes','1','20210418142156'),(13,'ADIDAS',1,10,'clothes','1','20210418142435'),(14,'T-SHIRT',1,18,'clothes','1','20210418145655'),(15,'WOMENS',1,14,'clothes','3','20210419105529'),(17,'SPORTWEAR',1,0,'sport clothes','3','20210426120450'),(18,'LINZ',1,8,'for human eye','1','20210426120450');
/*!40000 ALTER TABLE `tb_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product`
--

DROP TABLE IF EXISTS `tb_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `explanation` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `att_file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `att_file_code` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_banner` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `reg_date` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reg_user` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `update_date` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_user` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product`
--

LOCK TABLES `tb_product` WRITE;
/*!40000 ALTER TABLE `tb_product` DISABLE KEYS */;
INSERT INTO `tb_product` VALUES (42,'Dress','women red summer dress','girl3.jpg','394537c9a5bb88b6396dfe4c6f643a64e614caa3.jpg','1',7,99,'20210419112208','6',-1,NULL,NULL),(43,'casual clothes','women grey casual ','iframe2.png','9796caec45e932f01686f72ff6cba383119b0554.png',NULL,5,12,'20210419112606','6',-1,NULL,NULL),(44,'Dress','office black dress ','product4.jpg','e8fd5df3816a95df09d60b1cbf6315aec5b28459.jpg','1',7,7,'20210419112631','6',-1,'20210420180906','6'),(45,'Shirt-8','long spring shirt for women ','product1.jpg','2661684a216e03fdaba5bf68473824cf6b7cfdb5.jpg','1',7,5,'20210419112714','6',-1,'20210426113000','6'),(46,'title','explanation','Inked04 - question -05 tailbar-1_LI.jpg','075c23689d94bb2cd69de34c1ece465a8846846a.jpg','',11,11,'20210422170906','6',-1,NULL,NULL),(47,'title','explanation','Inked04 - question -05 tailbar-1_LI.jpg','5dc867529278c6e992af2ccb1e775ddf140895b4.jpg','1',8,11,'20210422180656','6',1,NULL,NULL),(48,'T-Shirt','women casual grey t-shirt','176354243_293334005713706_830942614311679033_n.jpg','c2ed4ae7b7b866b35ba8e9ea3e00e1e1dee966a2.jpg','1',7,5,'20210422200443','6',1,NULL,NULL),(49,'T-Shirt','women casual grey t-shirt','176354243_293334005713706_830942614311679033_n.jpg','d3909be9853feb9c86d2f0c791b81b79455c57ab.jpg','1',7,5,'20210422200452','6',1,NULL,NULL),(50,'T-Shirt','women casual grey t-shirt','176354243_293334005713706_830942614311679033_n.jpg','80730d87ca9d6c4ca3df237d7911747a9d1fa08f.jpg','1',7,5,'20210422200503','6',1,NULL,NULL),(51,'T-Shirt','women casual grey t-shirt','176354243_293334005713706_830942614311679033_n.jpg','13eccf454b687872617a94e71796c44bd4ecdf02.jpg','1',7,5,'20210422200512','6',1,NULL,NULL),(52,'banner','banner top ','Inked120095469_244577966992197_6017029482231978672_n_LI.jpg','4b6bba703146fb1a24f7917c6eac7b5b957276db.jpg','',14,9,'20210423101304','6',-1,NULL,NULL),(53,'My Test Banner','Lorem psum dolar sit amit ...','unnamed (1).jpg','c514bc3f8a697bfd0387ddc51250e998a0213a3d.jpg','',10,55,'20210426105454','6',-1,NULL,NULL);
/*!40000 ALTER TABLE `tb_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product_bag`
--

DROP TABLE IF EXISTS `tb_product_bag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_product_bag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reg_user` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reg_date` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `total` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_bag`
--

LOCK TABLES `tb_product_bag` WRITE;
/*!40000 ALTER TABLE `tb_product_bag` DISABLE KEYS */;
INSERT INTO `tb_product_bag` VALUES (11,'45','1','7','20210421',-1,NULL),(12,'44','1','7','20210421',-1,NULL),(15,'45','1','7','20210421',-1,NULL),(17,'45','1','7','20210421',-1,NULL),(18,'44','1','7','20210421',-1,NULL),(19,'45','1','8','20210422',-1,NULL),(20,'45','1','8','20210422',-1,NULL),(21,'45','1','8','20210422',1,NULL),(22,'44','1','8','20210422',1,NULL),(23,'44','1','8','20210422',1,NULL),(24,'44','1','8','20210422',1,NULL),(25,'45','1','8','20210422',1,NULL),(26,'44','1','8','20210422',1,NULL),(27,'44','1','6','20210422',1,NULL),(28,'51','1','7','20210423',-1,NULL),(29,'47','1','7','20210423',-1,NULL),(30,'45','1','7','20210426',-1,NULL),(31,'48','1','7','20210426',-1,NULL),(32,'46','1','10','20210426',-1,NULL),(33,'47','1','10','20210426',1,NULL),(34,'46','1','10','20210426',1,NULL),(35,'46','1','10','20210426',1,NULL),(36,'47','1','10','20210426',1,NULL),(37,'46','1','10','20210426',1,NULL),(38,'46','1','10','20210426',1,NULL),(39,'47','1','10','20210426',1,NULL),(40,'51','1','10','20210426',1,NULL),(41,'51','1','10','20210426',1,NULL),(42,'51','1','','20210426',1,NULL),(43,'46','1','','20210426',1,NULL);
/*!40000 ALTER TABLE `tb_product_bag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_stamp`
--

DROP TABLE IF EXISTS `tb_stamp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_stamp` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ownername` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stampname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `explanation` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stampimg` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usingplace` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ownerid` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_stamp`
--

LOCK TABLES `tb_stamp` WRITE;
/*!40000 ALTER TABLE `tb_stamp` DISABLE KEYS */;
INSERT INTO `tb_stamp` VALUES (4,'test a','test a','2','test a','','test a','rooter'),(5,'root','root','2','edit check','','kho',''),(6,'root','check','2','check user id','','kh','root'),(7,'root','1234','1','test','','kh','root');
/*!40000 ALTER TABLE `tb_stamp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,'user test','pass',NULL,NULL,NULL),(3,'yanjk','pass',NULL,NULL,NULL),(5,'root','1234',NULL,NULL,NULL),(6,'admin y','XyM1rOLeyVUr++lfLJIa5g==','bbyykkdd1106@gmail.com','admin',1),(7,'yanjka test','XyM1rOLeyVUr++lfLJIa5g==','bbyykkdd1999@gmail.com','user',-1),(8,'yanjka','XyM1rOLeyVUr++lfLJIa5g==','yanjka1106@gmail.com','user',-1),(9,'test','XyM1rOLeyVUr++lfLJIa5g==','yanjka@g.com','user',1),(10,'yanjka','XyM1rOLeyVUr++lfLJIa5g==','bbyykkdd1999@gmail.com','user',1);
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-28 11:06:16

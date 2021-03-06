CREATE DATABASE  IF NOT EXISTS `core_connect_care` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `core_connect_care`;
-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: mysql2019.nbm.vn    Database: core_connect_care
-- ------------------------------------------------------
-- Server version	5.7.27

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
-- Table structure for table `a`
--

DROP TABLE IF EXISTS `a`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a`
--

LOCK TABLES `a` WRITE;
/*!40000 ALTER TABLE `a` DISABLE KEYS */;
INSERT INTO `a` VALUES (1,'tuan'),(2,'tuyen'),(3,'hung');
/*!40000 ALTER TABLE `a` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ads` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `url` varchar(100) DEFAULT NULL,
  `contents` varchar(500) DEFAULT NULL,
  `sites_id` bigint(20) NOT NULL,
  `ads_type_id` bigint(20) NOT NULL,
  `ads_positions_id` bigint(20) NOT NULL,
  `users_creator_id` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title_sites_index` (`title`,`sites_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads`
--

LOCK TABLES `ads` WRITE;
/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
INSERT INTO `ads` VALUES (32,'Gi???i ph??p qu???n l?? nh?? thu???c to??n di???n',NULL,'Gi??p ch??? nh?? thu???c t???i ??u ???????c c??c ho???t ?????ng qu???n l?? v???i h??? th???ng tra c???u v?? b??o c??o theo nhi???u ti??u ch?? kh??c nhau. ',1,23,29,1,'2019-09-24 09:29:49',_binary ''),(33,'Ph??n ph???i ph???n m???m cho m??y t??nh v?? mobile',NULL,'Ph??n ph???i c??c ???ng d???ng ph???n m???m cho c??c thi???t b??? m??y t??nh v?? di ?????ng.',1,24,27,1,'2019-09-24 09:58:23',_binary ''),(34,'Qu???ng c??o 1',NULL,'',1,25,26,1,'2019-09-24 16:33:45',_binary ''),(35,'Qu???ng c??o 1',NULL,NULL,14,25,26,1,'2019-09-30 15:47:11',_binary ''),(36,'Thu???c gi???m c??n',NULL,'  ',15,23,27,32,'2019-10-11 09:51:58',_binary '');
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads_positions`
--

DROP TABLE IF EXISTS `ads_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ads_positions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `sites_id` bigint(20) NOT NULL,
  `users_creator_id` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name_sites_index` (`name`,`sites_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads_positions`
--

LOCK TABLES `ads_positions` WRITE;
/*!40000 ALTER TABLE `ads_positions` DISABLE KEYS */;
INSERT INTO `ads_positions` VALUES (22,'Tr??n tr??i',1,1,'2019-09-23 18:08:22',_binary ''),(23,'Tr??n ph???i',1,1,'2019-09-23 18:08:32',_binary ''),(24,'B??n tr??i',1,1,'2019-09-23 18:08:50',_binary ''),(25,'B??n ph???i',1,1,'2019-09-23 18:09:01',_binary ''),(26,'Ch??nh gi???a',1,1,'2019-09-23 18:09:18',_binary ''),(27,'Gi???a tr??n',1,1,'2019-09-23 18:09:29',_binary ''),(28,'Gi???a d?????i',1,1,'2019-09-23 18:09:41',_binary ''),(29,'D?????i tr??i',1,1,'2019-09-23 18:10:01',_binary ''),(30,'D?????i ph???i',1,1,'2019-09-23 18:10:11',_binary ''),(31,'D?????i ph???i',15,1,'2019-09-30 15:46:34',_binary '');
/*!40000 ALTER TABLE `ads_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads_type`
--

DROP TABLE IF EXISTS `ads_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ads_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `sites_id` bigint(20) NOT NULL,
  `users_creator_id` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_sites_index` (`name`,`sites_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads_type`
--

LOCK TABLES `ads_type` WRITE;
/*!40000 ALTER TABLE `ads_type` DISABLE KEYS */;
INSERT INTO `ads_type` VALUES (23,'Video',1,1,'2019-09-23 17:57:16',_binary ''),(24,'Slide',1,1,'2019-09-23 18:06:56',_binary '\0'),(25,'Text',1,1,'2019-09-23 18:07:11',_binary ''),(26,'Gif',1,1,'2019-09-23 18:07:54',_binary '');
/*!40000 ALTER TABLE `ads_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `short_description` varchar(500) DEFAULT NULL,
  `description` text,
  `image` varchar(300) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `source` varchar(200) DEFAULT NULL,
  `tag` varchar(300) DEFAULT NULL,
  `seo_keywords` varchar(200) DEFAULT NULL,
  `seo_descriptions` varchar(200) DEFAULT NULL,
  `categories_id` bigint(20) NOT NULL,
  `users_creator_id` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_categories_index` (`title`,`categories_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (32,'Cha ????? m??t tay c???a nh???ng ca ????? kh??','H??n 30 y b??c s?? c?? m???t t???i ph??ng c???p c???u l???ng ng?????i ??i. ?? k??p ??ang ti???n h??nh ph???u thu???t tr??n c?? th??? b???nh nh??n c??ng s???ng s???. \n\n\"M???i ng?????i b??nh t??nh, l??c n??y m?? ai c??ng ng??ng m??? ????? ??i t??m c??ch b???o v??? m??nh th?? ch???c ch???n b???nh nh??n s??? ch???t\", m???t b??c s?? l??n ti???ng.\n\nV??i gi??y im l???ng tho??ng qua, k??p m??? l???i nh???p nh??ng c??c thao t??c ph???u thu???t. H??? ?????ng vi??n nhau \"t???t c??? s??? ???n th??i\" ????? ti???p t???c c??ng vi???c.','<p>H??n 30 y b&aacute;c s?? c&oacute; m???t t???i ph&ograve;ng c???p c???u l???ng ng?????i ??i. &Ecirc; k&iacute;p ??ang ti???n h&agrave;nh ph???u thu???t tr&ecirc;n c?? th??? b???nh nh&acirc;n c??ng s???ng s???.&nbsp;</p>\n\n<p>&quot;M???i ng?????i b&igrave;nh t??nh, l&uacute;c n&agrave;y m&agrave; ai c??ng ng??ng m??? ????? ??i t&igrave;m c&aacute;ch b???o v??? m&igrave;nh th&igrave; ch???c ch???n b???nh nh&acirc;n s??? ch???t&quot;, m???t b&aacute;c s?? l&ecirc;n ti???ng.</p>\n\n<p>V&agrave;i gi&acirc;y im l???ng tho&aacute;ng qua, k&iacute;p m??? l???i nh???p nh&agrave;ng c&aacute;c thao t&aacute;c ph???u thu???t. H??? ?????ng vi&ecirc;n nhau &quot;t???t c??? s??? ???n th&ocirc;i&quot; ????? ti???p t???c c&ocirc;ng vi???c.</p>\n\n<p>B&aacute;c s?? L??u Qu???c Kh???i, Tr?????ng Khoa ????? 2 v???n nh??? nh?? in di???n bi???n c???a ca m??? n&agrave;y, 4 n??m tr?????c. Khi ???y s???n ph??? ???????c ????a v&agrave;o ph&ograve;ng c???p c???u B???nh vi???n Ph??? s???n H&agrave; N???i trong t&igrave;nh tr???ng m&aacute;u t??? &acirc;m ?????o ch???y &agrave;o ???t m???c d&ugrave; ??&atilde; ???????c ??&oacute;ng b???m. M&aacute;u phun th&agrave;nh v&ograve;i b???n v&agrave;o qu???n &aacute;o c&aacute;c y b&aacute;c s?? v&agrave; thi???t b??? xung quanh.&nbsp;</p>\n\n<p>B&aacute;c s?? Kh???i khi ???y ??&atilde; h???t ca tr???c, ??ang tr&ecirc;n ???????ng ????a con ??i h???c th&igrave; nh???n ???????c tin b&aacute;o t??? b???nh vi???n. Ngay l???p t???c anh quay xe ph&oacute;ng ?????n b???nh vi???n. B?????c v&agrave;o ph&ograve;ng c???p c???u, anh y&ecirc;u c???u k&iacute;p tr???c ti???p t???c h???i s???c r???i c&ugrave;ng b&aacute;c s?? tr?????ng k&iacute;p tr???c m??? c???t t??? cung b???nh nh&acirc;n ????? c???m m&aacute;u.&nbsp;</p>\n\n<p>Trong t&igrave;nh hu???ng nguy c???p, to&agrave;n b??? k&iacute;p tr???c c&ugrave;ng n??? l???c c???p c???u gi&agrave;nh m???ng s???ng cho ng?????i b???nh n&ecirc;n kh&ocirc;ng k???p d&ugrave;ng trang ph???c b???o h???. &quot;Kh&ocirc;ng ai bi???t b???nh nh&acirc;n nhi???m HIV&quot;, b&aacute;c s?? Kh???i n&oacute;i.&nbsp;</p>\n\n<p>Ca m??? k???t th&uacute;c, b???nh nh&acirc;n ???n ?????nh s???c kh???e. B???nh vi???n ch??? ?????nh c&aacute;c b&aacute;c s?? trong k&iacute;p m???&nbsp;x&eacute;t nghi???m, l???p h??? s?? theo d&otilde;i, u???ng thu???c d??? ph&ograve;ng ARV v&agrave; ???????c x&eacute;t nghi???m l???i sau 3-6 th&aacute;ng n???a.</p>\n\n<p>Theo b&aacute;c s?? Kh???i, ??&acirc;y l&agrave; tr?????ng h???p ?????u ti&ecirc;n b???nh vi???n c&oacute; s??? ng?????i ph??i nhi???m HIV ??&ocirc;ng nh???t. 30 y b&aacute;c s?? tham gia ca c???p c???u v&igrave; c&oacute; ti???p x&uacute;c v???i m&aacute;u v&agrave; d???ch c???a b???nh nh&acirc;n n&ecirc;n c&oacute; nguy c?? ph??i nhi???m HIV, trong ??&oacute; 19 ng?????i g???m 18 y b&aacute;c s?? b???nh vi???n v&agrave; m???t h???c vi&ecirc;n ??&atilde; b??? ph??i nhi???m v&igrave; d&iacute;nh m&aacute;u tr???c ti???p.</p>\n\n<p>&quot;M???c d&ugrave; r???i ro ngh??? nghi???p cao, nguy c?? l&acirc;y nhi???m c&aacute;c b???nh truy???n qua ???????ng m&aacute;u nh?? HIV, vi&ecirc;m gan, giang mai... nh??ng kh&ocirc;ng c&oacute; ngh??a l&agrave; m&igrave;nh ng???i ??&oacute; m&agrave; s???&quot;, b&aacute;c s?? Kh???i n&oacute;i.</p>\n\n<p>B&ecirc;n c???nh vi???c tu&acirc;n th??? ??&uacute;ng quy tr&igrave;nh v??? chuy&ecirc;n m&ocirc;n, b&aacute;c s?? s???n khoa ph???i tuy???t ?????i t&ocirc;n tr???ng s???n ph??? v&agrave; ?????i x??? b&igrave;nh ?????ng v???i t???t c??? b???nh nh&acirc;n. H??n ai h???t anh hi???u ch??? c???n m???t quy???t ?????nh c???a b&aacute;c s?? s??? ???nh h?????ng ?????n &iacute;t nh???t hai m???ng ng?????i.</p>\n\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\n	<tbody>\n		<tr>\n			<td><img alt=\"Th???c s??, b??c s?? L??u Qu???c Kh???i, tr?????ng khoa ????? 2, b???nh vi???n Ph??? S???n H?? N???i. ???nh: Th??y An\" src=\"https://i-suckhoe.vnecdn.net/2019/10/09/img-0838-jpg-1570587350-2132-1570594675.jpg\" /></td>\n		</tr>\n		<tr>\n			<td>\n			<p>Th???c s??, b&aacute;c s?? L??u Qu???c Kh???i, Tr?????ng Khoa ????? 2, B???nh vi???n Ph??? S???n H&agrave; N???i. ???nh:&nbsp;<em>Th&ugrave;y An</em></p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>Tr?????c khi v&agrave;o ngh???, b&aacute;c s?? Kh???i vi???t ????n t&igrave;nh nguy???n tham gia qu&acirc;n ng??. Trong m???t l???n&nbsp;?????n tr???m x&aacute;, anh ch??m ch&uacute; nh&igrave;n ng?????i b&aacute;c s?? tr??? thao t&aacute;c nhanh nh???n v&agrave; t???n t&igrave;nh ch??m s&oacute;c m???t b???nh binh r???i b???ng th???y &quot;tim m&igrave;nh th???n th???c&quot;. T??? ??&oacute;, anh nung n???u ?????c m??, tr??? th&agrave;nh ng?????i th???y thu???c ????? ch???a b???nh cho m???i ng?????i.</p>\n\n<p>Khi xu???t ng??, anh b??? ng??? c???m l???i nh???ng quy???n s&aacute;ch h&oacute;a sinh v&agrave; &ocirc;n thi v&agrave;o ?????i h???c Y H&agrave; N???i. ????? c&oacute; ti???n trang tr???i vi???c h???c, anh l&agrave;m m???i c&ocirc;ng vi???c t??? ph??? h??? ?????n b???o v???... Nh??? ??&oacute;, anh th???u hi???u cu???c s???ng v&agrave; lu&ocirc;n ??u ti&ecirc;n nh???ng s???n ph??? ngh&egrave;o, kh&oacute; kh??n ???????c kh&aacute;m tr?????c.</p>\n\n<p>Th???i gian ?????u c&ocirc;ng t&aacute;c t???i khoa s???n, anh ng???i ng&ugrave;ng khi b??? b???n b&egrave; tr&ecirc;u ch???c v&igrave; l&agrave;m ngh??? nh???y c???m. Th??? nh??ng, anh th???y t??? h&agrave;o v&igrave; ngh?? &quot;??&acirc;u ph???i ai c??ng ???????c ch???ng ki???n gi&acirc;y ph&uacute;t nh???ng ?????a tr??? ch&agrave;o ?????i&quot;. L&acirc;u d???n, anh c&ograve;n h???c ???????c&nbsp;c&aacute;ch th???u hi???u v&agrave; ?????ng c???m v???i ng?????i ph??? n??? gi&uacute;p h??? tin t?????ng v&agrave; t&acirc;m s??? h???t nh???ng n???i lo trong l&ograve;ng.</p>\n\n<p>B&ecirc;n c???nh c&ocirc;ng vi???c kh&aacute;m, s&agrave;ng l???c v&agrave; ph&aacute;t hi???n s???m c&aacute;c b???nh l&yacute; trong th???i k??? mang thai, b&aacute;c s?? Kh???i c&ograve;n tr???c ti???p ??i???u tr??? v&ocirc; sinh, hi???m mu???n, kh&aacute;m ph??? khoa, s&agrave;ng l???c ph&aacute;t hi???n s???m ung th?? ph??? khoa, t?? v???n s???c kh???e sinh s???n v&agrave; ????? ????? cho nh???ng ca sinh kh&oacute; t???i B???nh vi???n Ph??? s???n H&agrave; N???i.</p>\n\n<p>&quot;Nhi???u ng?????i t?????ng c&ocirc;ng vi???c n&agrave;y nh&agrave;n h??? ch??? l&agrave; h?????ng d???n ng?????i m??? r???n r???i ????? em b&eacute;, c???t d&acirc;y r???n song qu&aacute; tr&igrave;nh &quot;v?????t c???n&quot; lu&ocirc;n ti???m ???n nh???ng r???i ro, c???n s??? ?????ng h&agrave;nh c???a b&aacute;c s??&quot;, anh n&oacute;i.</p>\n\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\n	<tbody>\n		<tr>\n			<td><img alt=\"B??c s?? Kh???i d??nh nhi???u th???i gian ????? t?? v???n k????? gi??p m??? b???u y??n t??m v?? c?? thai k??? kh???e m???nh. ???nh: Th??y An\" src=\"https://i-suckhoe.vnecdn.net/2019/10/09/img-0839-1-jpg-1570589201-2844-1570594676.jpg\" /></td>\n		</tr>\n		<tr>\n			<td>\n			<p>B&aacute;c s?? Kh???i d&agrave;nh nhi???u th???i gian ????? t?? v???n k???&nbsp; gi&uacute;p m??? b???u y&ecirc;n t&acirc;m v&agrave; c&oacute; thai k??? kh???e m???nh. ???nh:&nbsp;<em>Th&ugrave;y An</em></p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>??? c????ng v??? m???t ng?????i qu???n l&yacute; g???n 100 c&aacute;n b??? nh&acirc;n vi&ecirc;n y t???, b&aacute;c s?? Kh???i ch???ng l&uacute;c n&agrave;o ng??i tay. Ngo&agrave;i chuy&ecirc;n m&ocirc;n, anh c&ograve;n tr???c ti???p gi???ng d???y v&agrave; ??&agrave;o t???o c&aacute;c y, b&aacute;c s?? tr???.&nbsp;</p>\n\n<p>&quot;C&ocirc;ng vi???c h???ng ng&agrave;y c??? cu???n t&ocirc;i ??i, d?????ng nh?? 24 gi??? l&agrave; kh&ocirc;ng ?????&quot;, b&aacute;c s?? Kh???i n&oacute;i.</p>\n\n<p>Tuy nhi&ecirc;n, anh t??? nh???n m&igrave;nh may m???n khi c&oacute; v??? c&ugrave;ng ngh???. Th???c s??, b&aacute;c s?? T??? Th??? Ho&agrave;i Anh,&nbsp;b???nh vi???n Ph??? s???n Trung ????ng l&agrave; ng?????i b???n ?????ng h&agrave;nh trong c&ocirc;ng vi???c c??ng nh?? cu???c s???ng h&agrave;ng ng&agrave;y. Anh c&ograve;n l&agrave; ng?????i ????? ????? ?????a con ?????u l&ograve;ng c???a hai v??? ch???ng.</p>\n\n<p>Th???i ??i???m ??&oacute;, anh t&igrave;m m???i c&aacute;ch b????n ch???i ????? ki???m s???ng, ????? ?????n v???.&nbsp;&quot;Khi ??&oacute;, v??? t&ocirc;i mang b???u g???n 9 th&aacute;ng, n???u theo t&iacute;nh to&aacute;n ph???i c&ograve;n v&agrave;i tu???n n???a m???i ????? th&igrave; t&ocirc;i m???i c&oacute; th???i gian xoay s???, ki???m ti???n&quot;, anh nh??? l???i.&nbsp;</p>\n\n<p>Th???i gian c???p b&aacute;ch, l???i l&agrave; thai ng&ocirc;i ng?????c, anh quy???t ?????nh ????? ????? t???i nh&agrave; ????? ?????m b???o an to&agrave;n cho hai m??? con d&ugrave; m???i ch??? l&agrave; b&aacute;c s?? h???c vi???c. Nh&igrave;n con trai ch&agrave;o ?????i, anh th???m th&iacute;a &yacute; ngh??a c???a c&acirc;u n&oacute;i &quot;m??? tr&ograve;n con vu&ocirc;ng&quot; m&agrave; c&aacute;c b&aacute;c s?? s???n ph???i kh???c c???t ghi t&acirc;m.&nbsp;</p>\n\n<p>Theo anh, b&agrave;i to&aacute;n kh&oacute; nh???t c???a ngh??? l&agrave; trong th???i gian ng???n ph???i ?????m b???o an to&agrave;n cho m??? kh&ocirc;ng b??? m???t m&aacute;u nhi???u v&agrave; con kh&ocirc;ng b??? ng???t.&nbsp;&nbsp;?????i v???i ca ph???u thu???t, anh lu&ocirc;n c??? g???ng gi??? l???i t??? cung cho ph??? n??? n???u kh&ocirc;ng nguy hi???m t&iacute;nh m???ng. V???i anh, c&ograve;n t??? cung l&agrave; c&ograve;n h???nh ph&uacute;c v&igrave; ng?????i ph??? n??? v???n c&ograve;n c?? h???i l&agrave;m m???. Anh&nbsp;c??ng t??? ?????t cho m&igrave;nh nh???ng quy t???c ngh??? nghi???p ri&ecirc;ng, ph???i nghi&ecirc;m t&uacute;c, t&acirc;m s&aacute;ng, c&oacute; ?????o ?????c th&igrave; m???i g???n b&oacute; ???????c l&acirc;u d&agrave;i.</p>\n\n<p>H??n 20 n??m trong ngh???, b&aacute;c s?? Kh???i kh&ocirc;ng nh??? m&igrave;nh ??&atilde; ????? ????? ???????c bao nhi&ecirc;u ca, nghe ???????c bao nhi&ecirc;u ti???ng kh&oacute;c ch&agrave;o ?????i.&nbsp;H&agrave;ng tr??m l???i ch&uacute;c, tin nh???n t??? nh???ng gia ??&igrave;nh ???????c b&aacute;c s?? ????? ????? l??u l???i nh?? &quot;gia t&agrave;i&quot; c???a s??? nghi???p. Anh c&ograve;n ???????c m???i ng?????i g???i l&agrave; b&aacute;c s?? s???n &quot;m&aacute;t tay&quot; nh???t b???nh vi???n. Nhi???u ng?????i xin l???y t&ecirc;n anh ?????t cho con c???a m&igrave;nh hay xin nh???n b&aacute;c s?? l&agrave;m cha nu&ocirc;i nh?? l???i c???m ??n</p>\n\n<p>&quot;T???n tay ch&agrave;o ??&oacute;n&nbsp;nh???ng s??? s???ng m???i ?????n v???i cu???c ?????i l&agrave; ni???m h???nh ph&uacute;c m???i ng&agrave;y ????? t&ocirc;i ti???p t???c g???n b&oacute; v???i ngh??? d&ugrave; ??&atilde; ngo&agrave;i 50&quot;, b&aacute;c s?? Kh???i n&oacute;i.</p>\n','userfiles/admin_nbm/images/20191010/2019_10_10_17_43_20_259_tv2x.png',NULL,NULL,NULL,'','',21,1,'2019-09-23 14:56:26',_binary ''),(33,'Khi n??o n??n s??? d???ng ph???n m???m qu???n l?? nh?? thu???c','Vi???c s??? d???ng ph???n m???m qu???n l?? ch???c c??ng kh??ng c??n l?? kh??i ni???m xa l??? v???i c??c nh?? ?????u t??, t??? nh???ng ch??? ?????u t?? h??ng h??a cho ?????n c??c ch??? c???a h??ng d???ch v??????. Tuy nhi??n, r???t nhi???u trong s??? h??? v???n ch??a mu???n d??ng ph???n m???m, b???i ch??a th???y ???????c l???i ??ch m?? ph???n m???m mang l???i.','<p>H???u h???t c&aacute;c ch??? ?????u t?? ?????u cho r???ng chi m???t kho???n ti???n kh&ocirc;ng nh??? ra l&agrave; l&atilde;ng ph&iacute;, l&agrave; ch??a c???n thi???t, r???ng bao l&acirc;u nay h??? v???n ??ang d&ugrave;ng ph????ng th???c qu???n l&yacute; c?? nh?? s??? s&aacute;ch, excel c&oacute; sao ??&acirc;u, m???c d&ugrave; m???i ng&agrave;y ?????u ph???i b&ugrave; ?????u, t???n th???i gian cho vi???c th???ng k&ecirc;, qu???n l&yacute;. L??? ????n gi???n, ??&oacute; ??&atilde; tr??? th&agrave;nh th&oacute;i quen c???a h???, l&agrave; vi???c m&agrave; h??? v???n l&agrave;m h&agrave;ng ng&agrave;y.</p>\n\n<p>Vi???c qu???n l&yacute; b???ng ph????ng ph&aacute;p c??, th??? c&ocirc;ng ??&atilde; qu&aacute; l???c h???u trong khi ng&agrave;nh c&ocirc;ng ngh??? th&ocirc;ng tin ??ang ph&aacute;t tri???n v?????t b???c t???ng ng&agrave;y. ??a ph???n gi???i tr??? hi???n nay ?????u c&oacute; hi???u bi???t nh???t ?????nh v??? ph???n m???m, nh??ng nhi???u &ocirc;ng ch??? ??? th??? h??? ??i tr?????c l???i kh&ocirc;ng mu???n m??? h???u bao cho &ldquo;th??? kh&ocirc;ng c???n&rdquo;. Ch&iacute;nh v&igrave; l??? ??&oacute;, kh&ocirc;ng ph???i ??? c?? s??? n&agrave;o c??ng ???????c &aacute;p d???ng&nbsp;ph???n m???m qu???n l&yacute; ti&ecirc;n ti???n.&nbsp;V???y khi n&agrave;o th&igrave; c???n m???t ph???n m???m qu???n l&yacute;? ??&oacute; ch&iacute;nh l&agrave; khi h??? nh???n ra nh???ng ti???n &iacute;ch m&agrave; ph???n m???m mang l???i.</p>\n\n<h2>Khi s??? l?????ng h&agrave;ng h&oacute;a, d???ch v??? v&agrave; kh&aacute;ch h&agrave;ng qu&aacute; nhi???u</h2>\n\n<p><img alt=\"Khi s??? l?????ng h??ng h??a, d???ch v??? v?? kh??ch h??ng qu?? nhi???u\" height=\"493\" src=\"https://xpharma.vn/wp-content/uploads/2017/12/khi-nao-nen-su-dung-phan-mem-quan-ly-1.jpg\" width=\"950\" /></p>\n\n<p>Khi s??? l?????ng h&agrave;ng h&oacute;a, d???ch v??? v&agrave; kh&aacute;ch h&agrave;ng qu&aacute; nhi???u</p>\n\n<p>V???i nh???ng ch??? qu???n l&yacute; h&agrave;ng h&oacute;a th&igrave; vi???c c&oacute; qu&aacute; nhi???u h&agrave;ng h&oacute;a s??? g&acirc;y kh&oacute; kh??n trong vi???c qu???n l&yacute;, ki???m tra h&agrave;ng xu???t ra, nh???p v&agrave;o, th???ng k&ecirc; t???n kho, h&agrave;ng s???p h???t h???n, qu&aacute; h???n &hellip;. V???i c&aacute;c ch??? ?????u t?? kinh doanh d???ch v???, v&iacute; d??? nh?? c&aacute;c b&aacute;n h&agrave;ng, th???m m??? vi???n, ph&ograve;ng kh&aacute;m&hellip; l?????ng kh&aacute;ch h&agrave;ng nhi???u, ?????ng ngh??a v???i vi???c qu???n l&yacute; kh&oacute; kh??n h??n. Vi???c t&igrave;m ki???m th&ocirc;ng tin kh&aacute;ch h&agrave;ng, th???ng k&ecirc; d???ch v??? hay th???ng k&ecirc; l???i l?????ng kh&aacute;ch h&agrave;ng ti???m n??ng l&agrave; m???t chuy???n kh&ocirc;ng h??? d??? d&agrave;ng, ??i???u n&agrave;y ???nh h?????ng kh&ocirc;ng nh??? ?????n vi???c l&ecirc;n k??? ho???ch ch??m s&oacute;c kh&aacute;ch h&agrave;ng, chi???n d???ch marketing.</p>\n\n<p>??&oacute; l&agrave; l&uacute;c c???n ?????n ph???n m???m qu???n l&yacute; nh?? ph???n m???m b&aacute;n h&agrave;ng, ph???n m???m qu???n l&yacute; kho&hellip;</p>\n\n<h2>Quy m&ocirc; ph&aacute;t tri???n m??? r???ng</h2>\n\n<p><img alt=\"Quy m?? ph??t tri???n m??? r???ng\" height=\"500\" src=\"https://xpharma.vn/wp-content/uploads/2017/12/khi-nao-nen-su-dung-phan-mem-quan-ly-2.png\" width=\"650\" /></p>\n\n<p>Quy m&ocirc; ph&aacute;t tri???n m??? r???ng</p>\n\n<ul>\n	<li>Khi s??? l?????ng kh&aacute;ch h&agrave;ng t??ng, s??? l?????ng giao d???ch l???n</li>\n	<li>\n	<p>S??? l?????ng chi nh&aacute;nh t??ng d???n, k&egrave;m theo ??&oacute; l&agrave; s??? l?????ng nh&acirc;n vi&ecirc;n t??ng theo, vi???c qu???n l&yacute; nh&acirc;n vi&ecirc;n, qu???n l&yacute; l????ng c??ng tr??? n&ecirc;n kh&oacute; kh??n.</p>\n	</li>\n	<li>\n	<p>Khi s??? l?????ng m???t h&agrave;ng qu&aacute; nhi???u, nhi???u ch???ng lo???i, m???u m&atilde;, chi ti???t&hellip;</p>\n	</li>\n	<li>\n	<p>Khi c&aacute;c ch??? qu???n l&yacute; c???n m???t c&ocirc;ng c??? h??? tr??? b???i c&aacute;c ph????ng th???c c?? kh&ocirc;ng c&ograve;n ph&ugrave; h???p.</p>\n	</li>\n</ul>\n\n<p>??&oacute; ch&iacute;nh l&agrave; l&uacute;c c???n ?????n ph???n m???m qu???n l&yacute;!</p>\n\n<h2>Thay ?????i c&aacute;ch t?? duy</h2>\n\n<p><img alt=\"Thay ?????i c??ch t?? duy\" height=\"533\" src=\"https://xpharma.vn/wp-content/uploads/2017/12/khi-nao-nen-su-dung-phan-mem-quan-ly.jpg\" width=\"800\" /></p>\n\n<p>Thay ?????i c&aacute;ch t?? duy</p>\n\n<p>Ph???n m???m qu???n l&yacute; ???????c xem nh?? kho???n ?????u t?? l&acirc;u d&agrave;i ch??? kh&ocirc;ng ph???i ch??? l&agrave; tr?????c m???t. C&aacute;c ch??? ?????u t?? ch???c ch???n s??? ph???i ng???c nhi&ecirc;n v???i nh???ng l???i &iacute;ch m&agrave; m???t ph???n m???m ??em l???i, kh&ocirc;ng ch??? l&agrave; ti???t ki???m th???i gian, nh&acirc;n l???c m&agrave; ??&oacute; c&ograve;n l&agrave; m???t c&ocirc;ng c??? h??? tr??? ?????c l???c cho c&aacute;c chi???n d???ch marketing qu???ng b&aacute; th????ng hi???u.</p>\n\n<p>T&iacute;nh xa h??n, vi???c b??? ra m???t kho???n chi ph&iacute; ????? mua ph???n m???m s??? r??? h??n r???t nhi???u so v???i s??? ti???n c???n chi tr??? cho th&ecirc;m nhi???u nh&acirc;n c&ocirc;ng trong m???t th???i gian d&agrave;i.</p>\n\n<p>??&oacute; l&agrave; l&uacute;c b???n c???n m???t ph???n m???m qu???n l&yacute;!</p>\n','userfiles/admin_nbm/images/20191010/2019_10_10_16_48_42_301_tv2x.png',NULL,'https://xpharma.vn/khi-nao-nen-su-dung-phan-mem-quan-ly.html',NULL,'','',21,1,'2019-09-24 10:34:23',_binary ''),(34,'Th??? Gi???i Di ?????ng mua l???i Ph??c An Khang','??ng Tr???n Kinh Doanh, Th??nh vi??n H??QT C??ng ty c??? ph???n ?????u t?? Th??? Gi???i Di ?????ng (M??: MWG) x??c nh???n c??ng ty ???? th???c hi???n mua l???i chu???i nh?? thu???c Ph??c An Khang ????? l???n s??n ng??nh d?????c. Th????ng v??? ???? ???????c ho??n t???t v?? Th??? Gi???i Di ?????ng ???? m??? c???a h??ng m???i c???a chu???i n??y v???i c??i t??n kh??c: Nh?? thu???c An Khang.','<p>&Ocirc;ng Tr???n Kinh Doanh, Th&agrave;nh vi&ecirc;n H??QT C&ocirc;ng ty c??? ph???n ?????u t?? Th??? Gi???i Di ?????ng (M&atilde;: MWG) x&aacute;c nh???n c&ocirc;ng ty ??&atilde; th???c hi???n&nbsp;mua l???i chu???i nh&agrave; thu???c Ph&uacute;c An Khang ????? l???n s&acirc;n ng&agrave;nh d?????c. Th????ng v??? ??&atilde; ???????c ho&agrave;n t???t v&agrave; Th??? Gi???i Di ?????ng ??&atilde; m??? c???a h&agrave;ng m???i c???a chu???i n&agrave;y v???i c&aacute;i t&ecirc;n kh&aacute;c: Nh&agrave; thu???c An Khang.</p>\n\n<p>??&acirc;y l&agrave; l???n ?????u ti&ecirc;n, ?????i di???n Th??? Gi???i Di ?????ng kh???ng ?????nh vi???c mua l???i chu???i nh&agrave; thu???c Ph&uacute;c An Khang. Tr?????c ??&oacute;, th??? tr?????ng c&oacute; nhi???u ?????n ??o&aacute;n v&agrave; m???t s??? c&ocirc;ng ty ch???ng kho&aacute;n ??&atilde; ra b&aacute;o c&aacute;o ph&acirc;n t&iacute;ch v??? kh??? n??ng n&agrave;y.</p>\n\n<p>Chu???i nh&agrave; thu???c Ph&uacute;c An Khang ???????c th&agrave;nh l???p t??? th&aacute;ng 5/2006 v???i 14 nh&agrave; thu???c ho???t ?????ng t???i TP H??? Ch&iacute; Minh. MWG c&oacute; k??? ho???ch m??? r???ng sang b&aacute;n l??? d?????c ph???m, m???c ti&ecirc;u c&oacute; kho???ng 50 ho???c 60 c???a h&agrave;ng trong n??m sau, theo b&aacute;o c&aacute;o HSC.</p>\n\n<p>C&ugrave;ng v???i vi???c M&amp;A chu???i b&aacute;n l???, MWG c??ng ??&atilde; ti???n h&agrave;nh mua c??? ph???n C&ocirc;ng ty Tr???n Anh (M&atilde;: TAG). &Ocirc;ng Doanh cho bi???t MWG ??&atilde; v&agrave;o ti???p qu???n, h??? th???ng IT, k??? to&aacute;n&hellip; v&agrave; g???i nh&acirc;n s??? ch??? ch???t tham gia v???n h&agrave;nh Tr???n Anh. Theo d??? ki???n, trong 1 &ndash; 2 n??m ?????u, MWG gi??? nguy&ecirc;n th????ng hi???u Tr???n Anh, sau ??&oacute; s??? c&oacute; ph????ng &aacute;n kh&aacute;c.</p>\n\n<p>T???ng m???c ?????u t?? th???c hi???n M&amp;A c???a MWG n??m 2017 l&agrave; 2.500 t??? ?????ng.</p>\n','userfiles/admin_nbm/images/20191010/2019_10_10_17_21_53_194_macbook2x.png',NULL,NULL,NULL,'An Khang, thu???c','',21,1,'2019-09-24 10:36:47',_binary ''),(35,'TI???N ??CH C???A WEB NH?? THU???C','??ng Tr???n Kinh Doanh, Th??nh vi??n H??QT C??ng ty c??? ph???n ?????u t?? Th??? Gi???i Di ?????ng (M??: MWG) x??c nh???n c??ng ty ???? th???c hi???n mua l???i chu???i nh?? thu???c Ph??c An Khang ????? l???n s??n ng??nh d?????c. Th????ng v??? ???? ???????c ho??n t???t v?? Th??? Gi???i Di ?????ng ???? m??? c???a h??ng m???i c???a chu???i n??y v???i c??i t??n kh??c: Nh?? thu???c An Khang.','<h5>TRA C???U H&Agrave;NG HO&Aacute;</h5>\n\n<p>V???i 20.000 m???t h&agrave;ng li&ecirc;n t???c ???????c c???p nh???t th&ocirc;ng tin gi&aacute; c???, b???n d??? d&agrave;ng tra c???u m???i th&ocirc;ng tin v??? h&agrave;ng ho&aacute; m&agrave; ????? ph???c v??? kinh doanh.</p>\n\n<p>&nbsp;</p>\n\n<h5>TUY???N D???NG &amp; ??&Agrave;O T???O</h5>\n\n<p>B???n s??? ???????c cung c???p kh&ocirc;ng ch??? c&ocirc;ng c??? ????ng tin m&agrave; c&ograve;n c??? quy tr&igrave;nh ??&agrave;o t???o nh&acirc;n vi&ecirc;n ????? b???n lu&ocirc;n ch??? ?????ng v??? ?????i ng?? nh&acirc;n vi&ecirc;n b&aacute;n h&agrave;ng.</p>\n\n<p>&nbsp;</p>\n\n<h5>QU???N L&Yacute; NH&Agrave; THU???C</h5>\n\n<p>V???i ph???n m???m c???a WEB NH&Agrave; THU???C, b???n s??? c&oacute; m???t c&ocirc;ng c??? qu???n l&yacute; ????n gi???n, hi???n ?????i ????? t??? ?????ng ho&aacute; ho???t ?????ng kinh doanh nh&agrave; thu???c.</p>\n\n<p>&nbsp;</p>\n\n<h5>PH&Aacute;T TRI???N KINH DOANH</h5>\n\n<p>??&acirc;y l&agrave; k&ecirc;nh t?? v???n v&agrave; h??? tr??? tr???c ti???p m???i v???n ????? ph&aacute;t tri???n kinh doanh v&agrave; n&acirc;ng cao n??ng l???c c???nh tranh cho nh&agrave; thu???c</p>\n\n<h2>WEB NH&Agrave; THU???C T?? V???N G&Igrave; CHO B???N</h2>\n\n<h6>B???n ??ang mu???n m??? nh&agrave; thu???c nh??ng ??ang ph&acirc;n v&acirc;n v&agrave; b???n kh&ocirc;ng th??? t&igrave;m hi???u ??&acirc;u ???????c nh???ng kinh nghi???m kinh doanh, qu???n l&yacute; nh&agrave; thu???c. Hay b???n ??ang ph???i ?????i m???t v???i nh???ng kh&oacute; kh??n m&agrave; kh&ocirc;ng c&oacute; l???i gi???i nh??: kh&oacute; th&uacute;c ?????y v&agrave; t???o ?????ng l???c cho nh&acirc;n vi&ecirc;n b&aacute;n h&agrave;ng; kh&oacute; ki???m so&aacute;t m???i ho???t c???a ?????ng nh&agrave; thu???c; &aacute;p l???c c???nh tranh lu&ocirc;n ??&egrave; n???ng; m???t nhi???u th???i gian c&aacute; nh&acirc;n; thua l???, vv&hellip;</h6>\n\n<p>H&atilde;y ????? ch&uacute;ng t&ocirc;i t?? v???n cho b???n.</p>\n\n<p>B???n s??? nh???n ???????c nh???ng t?? v???n r???t th???c t??? t??? ch&iacute;nh nh???ng kinh nghi???m v&agrave; hi???u bi???t c???a ch&uacute;ng t&ocirc;i trong linh v???c b&aacute;n l??? d?????c ph???m. Nh???ng t?? v???n n&agrave;y bao g???m danh m???c v&agrave; c?? c???u danh m???c h&agrave;ng, th&ocirc;ng tin gi&aacute; c??? h&agrave;ng ho&aacute;, l??? tr&igrave;nh v&agrave; t&agrave;i li???u ??&agrave;o t???o nh&acirc;n vi&ecirc;n, l&agrave;m th??? n&agrave;o th??? n&agrave;o n&acirc;ng cao n??ng l???c c???nh tranh v&agrave; m??? r???ng kinh doanh, nh???ng r???i ro b???n c&oacute; th??? g???p trong qu&aacute; tr&igrave;nh kinh doanh vv... T???t c??? nh???ng ??i???u n&agrave;y gi&uacute;p b???n ph&aacute;t tri???n kinh doanh ng&agrave;y c&agrave;ng hi???u qu??? v&agrave; khai th&aacute;c h???t ti???m n??ng c???a nh&agrave; thu???c.</p>\n\n<ul>\n	<li>\n	<p><input type=\"text\" value=\"100\" /></p>\n\n	<h6>??&Aacute;P ???NG NHU C???U</h6>\n\n	<p>WEB NH&Agrave; THU???C ??&aacute;p ???ng m???i nhu c???u ph&aacute;t tri???n v&agrave; ??i???u h&agrave;nh ho???t ?????ng kinh doanh nh&agrave; thu???c.</p>\n	</li>\n	<li>&nbsp;</li>\n	<li>&nbsp;</li>\n	<li>\n	<p><input type=\"text\" value=\"100\" /></p>\n\n	<h6>?????U T?? HI???U QU???</h6>\n\n	<p>WEB NH&Agrave; THU???C cam k???t cung c???p d???ch v??? ch???t l?????ng v???i chi ph&iacute; th???p nh???t nh???m mang t???i c?? h???i s??? d???ng cho t???t c??? c&aacute;c nh&agrave; thu???c.</p>\n	</li>\n</ul>\n\n<h2>CH&Uacute;NG T&Ocirc;I ??? ??&Acirc;Y L&Agrave; ????? H??? TR??? B???N</h2>\n\n<h5>CH&Iacute;NH S&Aacute;CH S??? D???NG</h5>\n\n<p>Ch??? v???i 3.990.000?? b???n s??? s??? d???ng t???t c??? c&aacute;c ti???n &iacute;ch online c???a WEB NH&Agrave; THU???C m&atilde;i m&atilde;i. Click bi???u t?????ng ????? xem chi ti???t.</p>\n\n<h5>C&Acirc;U H???I TH?????NG G???P</h5>\n\n<p>Nhi???u th???c m???c c???a b???n ???????c gi???i ??&aacute;p trong c&acirc;u h???i th?????ng g???p. Click bi???u t?????ng ????? xem chi ti???t.</p>\n\n<h5>NH&Agrave; THU???C TH&Ocirc;NG MINH</h5>\n\n<p>Nh&agrave; thu???c c???a b???n s??? tr??? n&ecirc;n th&ocirc;ng minh h??n nh??? ???ng d???ng c&ocirc;ng ngh???. Click bi???u t?????ng ????? xem chi ti???t.</p>\n\n<h5>TRANG FAN PAGE</h5>\n\n<p>N??i trao ?????i v&agrave; giao l??u c???ng ?????ng kh&aacute;ch h&agrave;ng c???a WEB NH&Agrave; THU???C. Click bi???u t?????ng ????? xem chi ti???t.</p>\n\n<h2>KH&Aacute;CH H&Agrave;NG C???A WEB NH&Agrave; THU???C</h2>\n\n<p>T&iacute;nh ?????n hi???n t???i, WEB NH&Agrave; THU???C ??&atilde; nh???n ???????c h??n 1.500 ????ng k&yacute; s??? d???ng t??? c&aacute;c qu???y/nh&agrave; thu???c tr???i d&agrave;i tr&ecirc;n h??n 40 t???nh/th&agrave;nh tr&ecirc;n c??? n?????c.</p>\n\n<p>H??n 1.500 nh&agrave; thu???c ??&atilde; ????ng k&yacute; s??? d???ng</p>\n\n<p>WEB NH&Agrave; THU???C ??&atilde; nh???n v&agrave; tr??? l???i h??n 10.000 y&ecirc;u c???u t??? vi???c chu???n b??? m??? cho t???i qu???n l&yacute; kinh doanh qu???y/nh&agrave; thu???c sao cho hi???u qu??? nh???t.</p>\n\n<p>H??n 10.000 y&ecirc;u c???u ??&atilde; ???????c h??? tr???c ti???p</p>\n\n<p>??&aacute;p ???ng ?????y ????? m&ocirc; h&igrave;nh kinh doanh nh&agrave; thu???c: nh&agrave; thu???c trong khu d&acirc;n c??, nh&agrave; thu???c k???t h???p ph&ograve;ng kh&aacute;m ho???c c???ng b???nh vi???n, nh&agrave; thu???c b???nh vi&ecirc;n, nh&agrave; thu???c chu???i.</p>\n\n<p>??&aacute;p ???ng ????? 4 m&ocirc; h&igrave;nh kinh doanh nh&agrave; thu???c</p>\n\n<h1>&nbsp;</h1>\n\n<p><iframe height=\"90\" id=\"StefanoAI-youtube-2\" src=\"http://www.youtube.com/embed/p0zc9oU5b08?&amp;autohide=2&amp;color=red&amp;controls=1&amp;disablekb=0&amp;fs=0&amp;iv_load_policy=1&amp;modestbranding=0&amp;rel=0&amp;showinfo=0&amp;theme=dark&amp;vq=default\" width=\"160\"></iframe></p>\n\n<h3>????ng k&yacute; ????? s??? d???ng ph???n m???m v&agrave; c&aacute;c ti???n &iacute;ch c???a WEB NH&Agrave; THU???C</h3>\n\n<p><a href=\"https://goo.gl/3S6hkP\">????NG K&Yacute;</a></p>\n\n<h2>KINH NGHI???M CHIA S???</h2>\n\n<h6><a href=\"http://webnhathuoc.com/home/kinh-nghiem/\">Xem th&ecirc;m [...]</a></h6>\n\n<p><a href=\"http://webnhathuoc.com/home/dung-bien-khoan-tien-mua-phan-mem-thanh-khoan-no-hang-thang/\" title=\"?????NG BI???N KHO???N TI???N MUA PH???N M???M TH??NH KHO???N N??? H??NG TH??NG\"><img alt=\"\" height=\"200\" src=\"http://webnhathuoc.com/home/wp-content/uploads/2019/09/debt.jpg\" width=\"200\" /></a></p>\n\n<h5><a href=\"http://webnhathuoc.com/home/dung-bien-khoan-tien-mua-phan-mem-thanh-khoan-no-hang-thang/\" title=\"?????NG BI???N KHO???N TI???N MUA PH???N M???M TH??NH KHO???N N??? H??NG TH??NG\">?????NG BI???N KHO???N TI???N MUA PH???N M???M TH&Agrave;NH KHO???N N??? H&Agrave;NG TH&Aacute;NG</a></h5>\n\n<p>B???n l&agrave; ng?????i b??? ti???n ra mua ph???n m???m, b???n c&oacute; quy???n: L???a ch???n ????n v??? cung c???p ph???n m???m ph&ugrave; h???p v??? chi ph&iacute; v&agrave; quan t&acirc;m t???i l???i &iacute;ch th???c s??? c???a kh&aacute;ch h&agrave;ng. L???a ch???n ???????c ph???n m???m gi&uacute;p b???n qu???n l&yacute; ???????c ho???t ?????ng kinh doanh th???c t??? v&agrave; v???n ??&aacute;p<a href=\"http://webnhathuoc.com/home/dung-bien-khoan-tien-mua-phan-mem-thanh-khoan-no-hang-thang/\">[&hellip;]</a></p>\n\n<p><a href=\"http://webnhathuoc.com/home/cong-van-khan-so-10045/\" title=\"C??NG V??N KH???N S??? 10045/QLD-PCTTR C???A C???C QU???N L?? D?????C NG??Y 24/06/2019\"><img alt=\"\" height=\"250\" src=\"http://webnhathuoc.com/home/wp-content/uploads/2019/08/Cuc-quan-ly-duoc-300x300-250x250.jpg\" width=\"250\" /></a></p>\n\n<h5><a href=\"http://webnhathuoc.com/home/cong-van-khan-so-10045/\" title=\"C??NG V??N KH???N S??? 10045/QLD-PCTTR C???A C???C QU???N L?? D?????C NG??Y 24/06/2019\">C&Ocirc;NG V??N KH???N S??? 10045/QLD-PCTTR C???A C???C QU???N L&Yacute; D?????C NG&Agrave;Y 24/06/2019</a></h5>\n\n<p>S??? Y t??? t???nh, th&agrave;nh ph??? tr???c thu???c Trung ????ng qu&aacute;n tri???t v&agrave; tri???n khai c&aacute;c n???i dung sau: a) Th&ocirc;ng b&aacute;o cho c&aacute;c c?? s??? b&aacute;n l??? thu???c tr&ecirc;n ?????a b&agrave;n v??? vi???c c&aacute;c c?? s??? b&aacute;n l??? thu???c tr&ecirc;n ?????a b&agrave;n c&oacute; quy???n t??? do l???a ch???n b???t k??? c?? s??? cung c???p<a href=\"http://webnhathuoc.com/home/cong-van-khan-so-10045/\">[&hellip;]</a></p>\n\n<p><a href=\"http://webnhathuoc.com/home/kiem-soat-khang-sinh-hay-luc-soat-hoat-dong-kinh-doanh-nha-thuoc/\" title=\"KI???M SO??T KH??NG SINH HAY L???C SO??T HO???T ?????NG KINH DOANH NH?? THU???C?\"><img alt=\"\" height=\"200\" src=\"http://webnhathuoc.com/home/wp-content/uploads/2019/05/de743_e2_n.jpg\" width=\"200\" /></a></p>\n\n<h5><a href=\"http://webnhathuoc.com/home/kiem-soat-khang-sinh-hay-luc-soat-hoat-dong-kinh-doanh-nha-thuoc/\" title=\"KI???M SO??T KH??NG SINH HAY L???C SO??T HO???T ?????NG KINH DOANH NH?? THU???C?\">KI???M SO&Aacute;T KH&Aacute;NG SINH HAY L???C SO&Aacute;T HO???T ?????NG KINH DOANH NH&Agrave; THU???C?</a></h5>\n\n<p>Web nh&agrave; thu???c r???t ???ng h??? nh???ng ti???ng n&oacute;i nh?? n&agrave;y ????? b???o v??? quy???n l???i cho c&aacute;c qu???y, nh&agrave; thu???c. Vi???c ???ng d???ng c&ocirc;ng ngh??? th&ocirc;ng tin hay ph???n m???m c???n ?????ng tr&ecirc;n quan ??i???m ??&uacute;ng lu???t, b???o m???t t???i ??a d??? li???u kinh doanh c???a kh&aacute;ch h&agrave;ng v&agrave; th???c s??? mang t???i gi&aacute;<a href=\"http://webnhathuoc.com/home/kiem-soat-khang-sinh-hay-luc-soat-hoat-dong-kinh-doanh-nha-thuoc/\">[&hellip;]</a></p>\n\n<p><a href=\"http://webnhathuoc.com/home/phan-mem-quan-ly-nha-thuoc-cua-web-nha-thuoc-co-tinh-nang-gi-noi-bat-so-voi-nhung-phan-mem-khac-tren-thi-truong/\" title=\"PH???N M???M QU???N L?? NH?? THU???C C???A WEB NH?? THU???C C?? T??NH N??NG G?? N???I B???T SO V???I NH???NG PH???N M???M KH??C TR??N TH??? TR?????NG?\"><img alt=\"\" height=\"200\" src=\"http://webnhathuoc.com/home/wp-content/uploads/2019/04/compare-300x300.png\" width=\"200\" /></a></p>\n\n<h5><a href=\"http://webnhathuoc.com/home/phan-mem-quan-ly-nha-thuoc-cua-web-nha-thuoc-co-tinh-nang-gi-noi-bat-so-voi-nhung-phan-mem-khac-tren-thi-truong/\" title=\"PH???N M???M QU???N L?? NH?? THU???C C???A WEB NH?? THU???C C?? T??NH N??NG G?? N???I B???T SO V???I NH???NG PH???N M???M KH??C TR??N TH??? TR?????NG?\">PH???N M???M QU???N L&Yacute; NH&Agrave; THU???C C???A WEB NH&Agrave; THU???C C&Oacute; T&Iacute;NH N??NG G&Igrave; N???I B???T SO V???I NH???NG PH???N M???M KH&Aacute;C TR&Ecirc;N TH??? TR?????NG?</a></h5>\n\n<p>WEB NH&Agrave; THU???C nh???n ???????c m???t c&acirc;u h???i r???t ph??? bi???n t??? kh&aacute;ch h&agrave;ng l&agrave; ph???n m???m qu???n l&yacute; nh&agrave; thu???c c???a ch&uacute;ng t&ocirc;i c&oacute; t&iacute;nh n??ng g&igrave; n???i b???t so v???i nh???ng ph???n m???m kh&aacute;c tr&ecirc;n th??? tr?????ng? Tr?????c khi tr??? l???i c&acirc;u h???i tr&ecirc;n, WEB NH&Agrave; THU???C mu???n k??? cho b???n v??? th???c<a href=\"http://webnhathuoc.com/home/phan-mem-quan-ly-nha-thuoc-cua-web-nha-thuoc-co-tinh-nang-gi-noi-bat-so-voi-nhung-phan-mem-khac-tren-thi-truong/\">[&hellip;]</a></p>\n\n<p><a href=\"http://webnhathuoc.com/home/#carousel-homepage-latestnews\">Previous</a><a href=\"http://webnhathuoc.com/home/#carousel-homepage-latestnews\">Next</a></p>\n\n<h2>G???I Y&Ecirc;U C???U LI&Ecirc;N H???</h2>\n\n<form action=\"http://webnhathuoc.com/home/\" method=\"POST\">\n<p><input name=\"myname\" type=\"text\" value=\"\" /></p>\n\n<p><input name=\"myemail\" type=\"email\" value=\"\" /></p>\n\n<p><input name=\"mysubject\" type=\"text\" value=\"\" /></p>\n\n<p><textarea name=\"mymessage\"></textarea></p>\nG???I LI&Ecirc;N H???</form>\n\n<p><img alt=\"\" src=\"http://webnhathuoc.com/home/wp-content/themes/zerif-lite/images/map25-redish.png\" /></p>\n\n<p>C&ocirc;ng ty TNHH WEB NH&Agrave; THU???C S??? 133, Y&ecirc;n Duy&ecirc;n, P Y&ecirc;n S???, Q Ho&agrave;ng Mai, TP H&agrave; N???i</p>\n\n<p><img alt=\"\" src=\"http://webnhathuoc.com/home/wp-content/themes/zerif-lite/images/envelope4-green.png\" /></p>\n\n<p>Hotro@webnhathuoc.com</p>\n\n<p><img alt=\"\" src=\"http://webnhathuoc.com/home/wp-content/themes/zerif-lite/images/telephone65-blue.png\" /></p>\n\n<p>S??? hot line: 098 919 95 35 S??? kinh doanh: 098 345 64 55</p>\n\n<ul>\n	<li>&nbsp;</li>\n	<li>&nbsp;</li>\n</ul>\n\n<p>&copy; WEB NH&Agrave; THU???C 2018</p>\n\n<p><iframe frameborder=\"0\" id=\"QaGMfdK-1569835818649\" scrolling=\"no\" src=\"about:blank\" title=\"chat widget\"></iframe></p>\n\n<p>&nbsp;</p>\n','userfiles/admin_nbm/images/20191010/2019_10_10_17_23_35_265_welcome2x.png',NULL,NULL,NULL,'','',21,29,'2019-09-30 16:33:00',_binary ''),(36,'B???ng gi??','','<div class=\"col large-12 small-12\">\n<div class=\"col-inner\">\n<table cellpadding=\"0\" cellspacing=\"0\" class=\"desktop-hidden table table-hover table-price table-striped\">\n	<thead>\n		<tr>\n			<td style=\"width:15%\">C?? b???n</td>\n			<td style=\"width:15%\">Th&ocirc;ng d???ng</td>\n			<td style=\"width:15%\">N&acirc;ng cao</td>\n		</tr>\n		<tr>\n			<td style=\"background-color:#5ae08c; text-align:right; width:15%\"><s>200.000/th&aacute;ng</s><br />\n			<strong>100.000<span style=\"font-size:12px\">/th&aacute;ng</span></strong></td>\n			<td style=\"background-color:#2ec264; text-align:right; width:15%\"><s>300.000/th&aacute;ng</s><br />\n			<strong>200.000<span style=\"font-size:12px\">/th&aacute;ng</span></strong></td>\n			<td style=\"background-color:#ade6b5; text-align:right; width:15%\"><s>500.000/th&aacute;ng</s><br />\n			<strong>300.000<span style=\"font-size:12px\">/th&aacute;ng</span></strong></td>\n		</tr>\n	</thead>\n</table>\n\n<table cellpadding=\"0\" cellspacing=\"0\" class=\"table table-hover table-price table-striped\">\n	<thead>\n		<tr>\n			<td rowspan=\"2\">&nbsp;</td>\n			<td style=\"width:15%\">C?? b???n</td>\n			<td style=\"width:15%\">Th&ocirc;ng d???ng</td>\n			<td style=\"width:15%\">N&acirc;ng cao</td>\n		</tr>\n		<tr>\n			<td style=\"background-color:#5ae08c; text-align:right; width:15%\"><s>200.000/th&aacute;ng</s><br />\n			<strong>100.000<span style=\"font-size:12px\">/th&aacute;ng</span></strong></td>\n			<td style=\"background-color:#2ec264; text-align:right; width:15%\"><s>300.000/th&aacute;ng</s><br />\n			<strong>200.000<span style=\"font-size:12px\">/th&aacute;ng</span></strong></td>\n			<td style=\"background-color:#ade6b5; text-align:right; width:15%\"><s>500.000/th&aacute;ng</s><br />\n			<strong>300.000<span style=\"font-size:12px\">/th&aacute;ng</span></strong></td>\n		</tr>\n	</thead>\n	<tbody>\n		<tr>\n			<td>B???ng gi&aacute;</td>\n			<td>&nbsp;</td>\n			<td>&nbsp;</td>\n			<td>&nbsp;</td>\n		</tr>\n		<tr>\n			<td>B&aacute;n thu???c b???ng m&atilde; v???ch</td>\n			<td>&nbsp;</td>\n			<td>&nbsp;</td>\n			<td>&nbsp;</td>\n		</tr>\n		<tr>\n			<td>H??? tr??? nhi???u ????n v??? t&iacute;nh</td>\n			<td>&nbsp;</td>\n			<td>&nbsp;</td>\n			<td>&nbsp;</td>\n		</tr>\n		<tr>\n			<td>Qu???n l&yacute; chu???i nh&agrave; thu???c</td>\n			<td>&nbsp;</td>\n			<td>&nbsp;</td>\n			<td>&nbsp;</td>\n		</tr>\n		<tr>\n			<td>Redmi Nott</td>\n			<td>&nbsp;</td>\n			<td>&nbsp;</td>\n			<td>&nbsp;</td>\n		</tr>\n		<tr>\n			<td>&nbsp;</td>\n			<td>Ch???n</td>\n			<td>Ch???n</td>\n			<td>Ch???n</td>\n		</tr>\n	</tbody>\n</table>\n</div>\n</div>\n','userfiles/admin_nbm/images/20191011/2019_10_11_9_28_47_105_photo20191011090644.jpg',NULL,NULL,NULL,'','',22,32,'2019-10-11 08:58:36',_binary ''),(37,'Qu???n l?? chu???i nh?? thu???ca','1,1,1','','userfiles/admin_nbm/images/20191011/2019_10_11_9_8_59_164_photo20191011090644.jpg','Mobile',NULL,NULL,'','',23,1,'2019-10-11 09:09:01',_binary ''),(38,'H??? tr??? nhi???u ????n v??? t??nh','0,0,1','<p>Qminder has been set up in&nbsp;<a href=\"http://www.verizon.com/\" rel=\"external\" target=\"_blank\">Verizon</a>retail store with cooperation of<a href=\"http://www.wirelesszone.com/\" rel=\"external nofollow\" target=\"_blank\">Wireless Zone</a>, the largest franchise in the US.</p>\n\n<p><img alt=\"Verizon Wireless using Qminder\" src=\"https://www.qminder.com/static/img/blog/verizon/Verizon-Wireless-Qminder.jpg\" title=\"Verizon Wireless using Qminder\" /></p>\n\n<p>Verizon Wireless is the first wireless broadband network provider in USA. The company is a recognized leader in customer service, investing heavily in services and self-service tools that consistently deliver customer satisfaction. They operate in more than 2330 retail locations and provide wireless services to 122 million subscribers.</p>\n\n<p><strong>&ldquo;We have a high volume of customers which sometimes results is a number of customers waiting. Qminder helps us<a href=\"https://www.qminder.com/\" target=\"_blank\">take care of customers in the order they arrived</a>, and gives them peace of mind, from knowing they are in the queue.&rdquo;</strong>&nbsp;tells David Bogart, Owner of Wireless Zone store in Lockport, NY.</p>\n\n<p>Previously the problem of waiting caused many complaints from the clients. How it was managed wasn&rsquo;t clear nor understandable by visitors.</p>\n\n<p><strong>&ldquo;Sometimes with greeters, sometimes with waiting lists maintained as customers entered the store, and sometimes by asking, &ldquo;Who&rsquo;s next&rdquo;?&rdquo;</strong>explains David Bogart.</p>\n\n<p><img alt=\"Qminder iPad app\" src=\"https://www.qminder.com/static/img/blog/verizon/Qminder-iPad-app.jpg\" title=\"Qminder iPad app\" /></p>\n\n<p>The setup at Verizon is simply an iPad for clients to line up, by selecting the desired service and entering their names. It is placed near the entrance for all to see. Employees see the visitors from their computers, tablets or smartphones and greet them by name. Meanwhile customers could browse around in the store and don&rsquo;t need to stand in a line or a&nbsp;<a href=\"https://www.qminder.com/why-queue-barriers-are-ineffective/\" target=\"_self\" title=\"Why queue barriers are ineffective?\">serpentine maze</a>.</p>\n\n<p>Use case of Verizon Wireless retail location is an inspiring example of how large enterprise can simply increase their much valued customer satisfaction and sales by using Qminder tablet application.</p>\n\n<p><a href=\"https://dashboard.qminder.com/signup/\" rel=\"external nofollow\" target=\"_blank\">Try Qminder right now</a>&nbsp;and improve your service today!</p>\n\n<p>&nbsp;</p>\n\n<form action=\"https://qminderapp.us4.list-manage.com/subscribe/post?u=bce3a11cf374bc2b93e260ce8&amp;id=e64ba6dc02\" method=\"post\">\n<h4>Subscribe to Qminder Academy and get valuable service and experience insights delivered straight to your inbox.</h4>\n</form>\n','userfiles/admin_nbm/images/20191011/2019_10_11_9_9_59_867_photo201910110906432.jpg','GREEN',NULL,NULL,'','',23,1,'2019-10-11 09:10:01',_binary ''),(39,'Qu???n l?? chu???i nh?? thu???c','0,0,1','','userfiles/admin_nbm/images/20191011/2019_10_11_9_10_58_732_photo201910110906432.jpg','Mobile',NULL,NULL,'','',23,1,'2019-10-11 09:11:00',_binary ''),(40,'D??ng thu???c gi???m c??n l???i b???t c???p h???i','Long waiting lines and disorganized waiting rooms are among the top 3 reasons why customers bail on businesses. Waiting is just another part of your service package, and it can make or break your customers??? experience.','<p>Sau T???t ??n nhi???u b&aacute;nh ch??ng, th???c ph???m gi&agrave;u ?????m v&agrave; ch???t b&eacute;o, ??n nhi???u b&aacute;nh k???o... khi???n kh&ocirc;ng &iacute;t ng?????i c&oacute; xu h?????ng t??ng c&acirc;n v&agrave; t&igrave;m ?????n thu???c ????? gi???m c&acirc;n.<br />\n<br />\nTuy nhi&ecirc;n vi???c d&ugrave;ng lo???i thu???c n&agrave;y c??ng g&acirc;y cho ng?????i s??? d???ng nhi???u phi???n to&aacute;i.</p>\n\n<p><strong>&nbsp;</strong></p>\n\n<p><strong>L???i &iacute;ch c???a thu???c gi???m c&acirc;n</strong></p>\n\n<p><br />\nV??? nguy&ecirc;n t???c, mu???n gi???m c&acirc;n ch&uacute;ng ta ph???i &ldquo;c???t&rdquo; n??ng l?????ng qua ???????ng ??n u???ng ho???c ti&ecirc;u hao ph???n l???n n??ng l?????ng ??&oacute; qua luy???n t???p. Tuy nhi&ecirc;n, li???u ta c&oacute; th??? nh???n ??n ho???c tr&aacute;nh t???t c??? m&oacute;n ??n m&igrave;nh y&ecirc;u th&iacute;ch, s???ng nh?? nh&agrave; tu h&agrave;nh kh??? h???nh? Ho???c h&agrave;ng ng&agrave;y t???p luy???n c???t l???c ?????n... ki???t s???c?<br />\n<br />\nNh???n ??n qu&aacute; ??&agrave; s??? khi???n c?? th??? thi???u d?????ng ch???t, suy ki???t. Trong khi ??&oacute;, ng?????i th???a c&acirc;n, b&eacute;o ph&igrave; n???u t???p qu&aacute; s???c, t???p n???ng kh&ocirc;ng ph&ugrave; h???p v???i t&igrave;nh tr???ng s???c kh???e... c&oacute; th??? g&acirc;y tho&aacute;i h&oacute;a kh???p, tr???y tim m???ch, t??ng huy???t &aacute;p, ?????t qu???... Cho n&ecirc;n l???i &iacute;ch c???a vi???c d&ugrave;ng thu???c gi???m c&acirc;n l&agrave; kh&ocirc;ng c???n m???t nhi???u th???i gian luy???n t???p th??? thao, kh&ocirc;ng c???n &aacute;p d???ng ch??? ????? ??n ki&ecirc;ng kham kh??? m&agrave; v???n c&oacute; th??? gi???m c&acirc;n. ??i???u n&agrave;y ph&ugrave; h???p v???i ng?????i b???n r???n ho???c ng???i t???p th??? d???c v&agrave; c&oacute; &ldquo;t&acirc;m h???n ??n u???ng&rdquo;, tuy nhi&ecirc;n v???n c???n c&oacute; ch??? ????? ??n u???ng khoa h???c k??? c??? khi d&ugrave;ng thu???c.<br />\n<br />\nC&aacute;c lo???i thu???c gi???m c&acirc;n ?????u ho???t ?????ng b???ng c&aacute;ch t&aacute;c ?????ng tr???c ti???p v&agrave;o h??? ti&ecirc;u h&oacute;a v&agrave; nh???ng b??? ph???n c&oacute; li&ecirc;n quan ????? gi???m s??? h???p thu c&aacute;c ch???t dinh d?????ng v&agrave; g&acirc;y c???m gi&aacute;c kh&ocirc;ng mu???n ??n cho ng?????i s??? d???ng, do ??&oacute; s??? l&agrave;m gi???m l?????ng calo ????a v&agrave;o trong c?? th??? v&agrave; l&agrave;m gi???m c&acirc;n.<br />\n<br />\nB&ecirc;n c???nh vi???c h???n ch??? c???m gi&aacute;c th&egrave;m ??n, m???t s??? thu???c gi???m c&acirc;n c&ograve;n c&oacute; kh??? n??ng t&aacute;c ?????ng ?????n s??? ???c ch??? men lipaza ti&ecirc;u h&oacute;a ch???t b&eacute;o, l&agrave;m cho ch???t b&eacute;o kh&ocirc;ng h???p thu v&agrave;o c?? th???, th???i m??? th???a ra ngo&agrave;i theo ???????ng ti&ecirc;u h&oacute;a.<br />\n<br />\n<strong>V&agrave; t&aacute;c h???i</strong><br />\n<br />\nHi???n nay, tr&ecirc;n th??? tr?????ng c&oacute; r???t nhi???u nh&atilde;n thu???c gi???m c&acirc;n ???????c l??u h&agrave;nh. Thu???c gi???m c&acirc;n th?????ng ???????c chia l&agrave;m 4 lo???i ch&iacute;nh: thu???c g&acirc;y ch&aacute;n ??n, thu???c l&agrave;m no ???ng ti&ecirc;u h&oacute;a, thu???c t??ng c?????ng chuy???n h&oacute;a c&aacute;c ch???t g&acirc;y b&eacute;o trong c?? th??? v&agrave; thu???c ??&ocirc;ng y.<br />\n<br />\nNh&oacute;m thu???c g&acirc;y ch&aacute;n ??n: T&aacute;c d???ng gi???m c&acirc;n c???a thu???c l&agrave; t???o c???m gi&aacute;c kh&ocirc;ng mu???n ??n, l&agrave; lo???i thu???c c&oacute; ch???a amphetamin ho???c c&aacute;c d???n ch???t t????ng t??? nh?? benzedrine, phenamin, mirapront N... Khi u???ng lo???i thu???c n&agrave;y, c&aacute;c ch???t tr&ecirc;n s??? t&aacute;c ?????ng l&ecirc;n h??? th???n kinh trung ????ng l&agrave;m m???t c???m gi&aacute;c ??&oacute;i, ??n m???t ngon, kh&ocirc;ng mu???n ??n, g&acirc;y m???t ng???... l&agrave;m gi???m kh???u ph???n ??n v&agrave; gi???m c&acirc;n. ??&acirc;y l&agrave; lo???i thu???c ???????c s??? d???ng ph??? bi???n nh???t, tuy nhi&ecirc;n thu???c g&acirc;y ra nhi???u t&aacute;c d???ng ph??? nguy hi???m. N???u ch&uacute;ng ta qu&aacute; l???m d???ng, n&oacute; c&oacute; th??? g&acirc;y nghi???n. Khi ng??ng d&ugrave;ng, c&aacute;c b???n c&oacute; th??? r??i v&agrave;o tr???ng th&aacute;i r???i lo???n t&acirc;m l&yacute;, ch&aacute;n n???n, mu???n t??? t???... ?????c bi???t, v???i nh???ng ng?????i b??? b???nh tim m???ch, t??ng huy???t &aacute;p, t??ng nh&atilde;n &aacute;p khi s??? d???ng c&ograve;n c&oacute; nguy c?? b??? suy tim, m&ugrave; m???t...<br />\n<br />\nThu???c gi???m c&acirc;n l&agrave;m no ???ng ti&ecirc;u h&oacute;a: ??&acirc;y l&agrave; lo???i thu???c gi???m c&acirc;n c&oacute; ch???a c&aacute;c ch???t sterculia, methylcellulose... Khi s??? d???ng lo???i thu???c n&agrave;y, c&aacute;c ch???t tr&ecirc;n s??? n???m trong l&ograve;ng ru???t, h&uacute;t n?????c, tr????ng n??? v&agrave; t???o c???m gi&aacute;c ?????y b???ng, khi???n c?? th??? kh&ocirc;ng c???m th???y ??&oacute;i, l&agrave;m gi???m kh???u ph???n ??n. Tuy nhi&ecirc;n, thu???c l&agrave;m no ???ng ti&ecirc;u h&oacute;a c??ng g&acirc;y ra c&aacute;c t&aacute;c d???ng ph??? nh?? tr?????ng b???ng, ?????y h??i. Nh???ng ng?????i m???c ch???ng h???p ???????ng ti&ecirc;u h&oacute;a, ch???ng to k???t tr&agrave;ng, c&oacute; th??? b??? t???c ru???t khi s??? d???ng lo???i thu???c n&agrave;y.<br />\n<br />\nThu???c gi???m c&acirc;n l&agrave;m t??ng c?????ng chuy???n h&oacute;a c&aacute;c ch???t g&acirc;y b&eacute;o: ??&acirc;y l&agrave; lo???i thu???c hi???n nay ???????c nhi???u ng?????i d&ugrave;ng kh&ocirc;ng ch??? ??? n?????c ta m&agrave; nhi???u n?????c tr&ecirc;n th??? gi???i. Lo???i thu???c n&agrave;y c&oacute; ch???a n???i ti???t t??? tuy???n gi&aacute;p thyroxin, l&agrave; ch???t c&oacute; kh??? n??ng l&agrave;m gia t??ng chuy???n h&oacute;a ch???t b&eacute;o b&ecirc;n trong c&aacute;c t??? b&agrave;o, t??? ??&oacute; gi???m ??i l?????ng m??? trong c?? th???. Tuy nhi&ecirc;n, lo???i thu???c n&agrave;y ch??? c&oacute; t&aacute;c d???ng v???i ch???ng b&eacute;o ph&igrave; do c?? th??? thi???u thyroxin g&acirc;y ra (ng?????i b??? suy gi&aacute;p tr???ng). Vi???c s??? d???ng b???a b&atilde;i kh&ocirc;ng ch??? kh&ocirc;ng c&oacute; t&aacute;c d???ng gi???m c&acirc;n m&agrave; c&ograve;n g&acirc;y nguy h???i cho tim, l&agrave;m ???c ch??? ch???c n??ng tuy???n gi&aacute;p, g&acirc;y b?????u c???...<br />\n<br />\nThu???c gi???m c&acirc;n ??&ocirc;ng y: C???n th???n tr???ng v???i c&aacute;c thu???c ??&ocirc;ng y gia truy???n kh&ocirc;ng r&otilde; ngu???n g???c. C&aacute;c thu???c ??&ocirc;ng y th?????ng ch???a nh???ng d?????c li???u g&acirc;y nhu???n tr&agrave;ng, l???i ti???u c??ng g&acirc;y ???nh h?????ng x???u ?????n s???c kh???e nh?? r???i lo???n ??i???n gi???i, tr???y tim m???ch do m???t n?????c.<br />\n<br />\n<em><strong>Theo SK&amp;??S</strong></em></p>\n','userfiles/admin_nbm/images/20191011/2019_10_11_18_39_8_66_macbook2x.png',NULL,NULL,NULL,'thu???c gi???m c??n','',23,32,'2019-10-11 09:21:54',_binary ''),(41,'V???n h??nh tr???c tuy???n On-line','Long waiting lines and disorganized waiting rooms are among the top 3 reasons why customers bail on businesses. Waiting is just another part of your service package, and it can make or break your customers??? experience.','','userfiles/admin_nbm/images/20191011/2019_10_11_9_10_58_732_photo201910110906432.jpg','Mobile',NULL,NULL,'','',23,1,'2019-10-11 11:53:33',_binary ''),(42,'H??? tr??? m??? 2 kho','Long waiting lines and disorganized waiting rooms are among the top 3 reasons why customers bail on businesses. Waiting is just another part of your service package, and it can make or break your customers??? experience.\n\n','','userfiles/admin_nbm/images/20191011/2019_10_11_18_38_26_94_macbook2x.png',NULL,NULL,NULL,'','',23,1,'2019-10-11 11:59:52',_binary ''),(43,'Redmi Nott ','Redmi Nott Redmi Nott Redmi Nott Redmi Nott Redmi Nott ','','userfiles/admin_nbm/images/20191011/2019_10_11_18_38_10_400_welcome2x.png',NULL,NULL,NULL,'','',22,1,'2019-10-11 12:00:37',_binary '');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b`
--

DROP TABLE IF EXISTS `b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b`
--

LOCK TABLES `b` WRITE;
/*!40000 ALTER TABLE `b` DISABLE KEYS */;
INSERT INTO `b` VALUES (1,'tuan'),(2,'tuyen'),(3,'hung');
/*!40000 ALTER TABLE `b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `tags` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'ECMAScript 2015: A SitePoint Anthology','[\"JavaScript\", \"ES2015\", \"JSON\"]');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `sites_id` bigint(20) NOT NULL,
  `url` varchar(300) DEFAULT NULL,
  `image` varchar(300) DEFAULT NULL,
  `seo_keywords` varchar(200) DEFAULT NULL,
  `seo_descriptions` varchar(200) DEFAULT NULL,
  `parent_id` bigint(20) NOT NULL,
  `template_layouts_id` bigint(11) NOT NULL,
  `users_creator_id` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` bit(1) NOT NULL,
  `is_home` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_sites_index` (`name`,`sites_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Trang ch??? 2',14,'/home',NULL,'','',20,23,1,'2019-09-12 18:39:01',_binary '',_binary ''),(19,'thuy nguyen',14,'/chuyen-muc/thuy-nguyen-1-1-19',NULL,'','',20,25,1,'2019-09-26 17:38:39',_binary '',_binary ''),(20,'Trang ch???',14,'/',NULL,'','',0,1,29,'2019-09-30 16:12:04',_binary '',NULL),(21,'T??nh n??ng',14,'/tinh-nang-21',NULL,'','',0,19,29,'2019-09-30 16:12:24',_binary '',_binary '\0'),(22,'B???ng gi??',14,'/bang-gia-22',NULL,'','',0,20,29,'2019-09-30 16:12:42',_binary '',_binary ''),(23,'H??? tr??? h?????ng d???n s??? d???ng',14,'/ho-tro-23',NULL,'','',0,1,29,'2019-09-30 16:12:58',_binary '',_binary '\0'),(24,'Li??n h???',14,'/lien-he-24',NULL,'','',0,21,29,'2019-09-30 16:18:11',_binary '',_binary '\0'),(25,'????ng k??',14,'/trang-chu/dang-ky-14-20-25',NULL,'','',20,29,29,'2019-09-30 16:30:53',_binary '',_binary ''),(26,'D???ch v???',14,'/trang-chu/dang-nhap-14-20-26',NULL,'','',20,2,29,'2019-09-30 16:31:18',_binary '',_binary ''),(28,'Gi???i thi???u',14,'/trang-chu/gioi-thieu-14-20-28',NULL,'','',20,28,1,'2019-10-08 17:03:16',_binary '',_binary ''),(29,'T??n ?????p',14,'/abc-29',NULL,'cx','cx',20,1,1,'2019-10-09 16:31:56',_binary '',_binary ''),(30,'S???c kh???e',15,'/suc-khoe-30',NULL,'','',0,25,32,'2019-10-11 08:58:02',_binary '',_binary '');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `districts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `provinces_id` bigint(20) NOT NULL,
  `users_creator_id` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_provinces_index` (`name`,`provinces_id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (21,'B???c T??? Li??m',18,1,'2019-09-23 14:02:40',_binary ''),(22,'Ba ????nh',18,1,'2019-09-23 14:02:55',_binary ''),(23,'C???u Gi???y',18,1,'2019-09-23 14:03:11',_binary ''),(24,'?????ng ??a',18,1,'2019-09-23 14:03:23',_binary ''),(25,'Hai B?? Tr??ng',18,1,'2019-09-23 14:03:36',_binary ''),(26,'Ho??n Ki???m',18,1,'2019-09-23 14:03:49',_binary ''),(27,'H?? ????ng',18,1,'2019-09-23 14:04:01',_binary ''),(28,'Ho??ng Mai',18,1,'2019-09-23 14:04:15',_binary ''),(29,'Long Bi??n',18,1,'2019-09-23 14:04:26',_binary ''),(30,'Thanh Xu??n',18,1,'2019-09-23 14:04:40',_binary ''),(31,'T??y H???',18,1,'2019-09-23 14:04:53',_binary ''),(32,'Nam T??? Li??m',18,1,'2019-09-23 14:05:05',_binary ''),(33,'??an Ph?????ng',18,1,'2019-09-23 14:05:18',_binary ''),(34,'Gia L??m',18,1,'2019-09-23 14:05:30',_binary ''),(35,'????ng Anh',18,1,'2019-09-23 14:05:46',_binary ''),(36,'Ch????ng M???',18,1,'2019-09-23 14:06:03',_binary ''),(37,'Ho??i ?????c',18,1,'2019-09-23 14:06:16',_binary ''),(38,'Ba V??',18,1,'2019-09-23 14:06:30',_binary ''),(39,'M??? ?????c',18,1,'2019-09-23 14:06:42',_binary ''),(40,'Ph??c Th???',18,1,'2019-09-23 14:06:53',_binary ''),(41,'M?? Linh',18,1,'2019-09-23 14:07:07',_binary ''),(42,'S??c S??n',18,1,'2019-09-23 14:07:21',_binary ''),(43,'Th???ch Th???t',18,1,'2019-09-23 14:07:33',_binary ''),(44,'Qu???c Oai',18,1,'2019-09-23 14:07:45',_binary ''),(45,'Thanh Oai',18,1,'2019-09-23 14:07:58',_binary ''),(46,'Ph?? Xuy??n',18,1,'2019-09-23 14:08:09',_binary ''),(47,'S??n T??y',18,1,'2019-09-23 14:09:31',_binary ''),(48,'Tam ??i???p',34,1,'2019-09-23 14:10:48',_binary ''),(49,'Hoa L??',34,1,'2019-09-23 14:11:18',_binary ''),(50,'Gia Vi???n',34,1,'2019-09-23 14:11:30',_binary ''),(51,'Nho Quan',34,1,'2019-09-23 14:11:44',_binary ''),(52,'Y??n Kh??nh',34,1,'2019-09-23 14:11:55',_binary ''),(53,'Y??n M??',34,1,'2019-09-23 14:12:10',_binary ''),(54,'Kim S??n',34,1,'2019-09-23 14:12:24',_binary ''),(55,'H???i Ch??u',78,1,'2019-09-23 14:13:24',_binary ''),(56,'C???m L???',78,1,'2019-09-23 14:13:37',_binary ''),(57,'Thanh Kh??',78,1,'2019-09-23 14:13:49',_binary ''),(58,'Li??n Chi???u',78,1,'2019-09-23 14:14:02',_binary ''),(59,'Ng?? H??nh S??n',78,1,'2019-09-23 14:14:16',_binary ''),(60,'S??n Tr??',78,1,'2019-09-23 14:14:28',_binary ''),(61,'H??a Vang',78,1,'2019-09-23 14:14:40',_binary ''),(62,'Ho??ng Sa',78,1,'2019-09-23 14:14:52',_binary ''),(63,'C???m Gi??ng',19,1,'2019-09-23 14:15:26',_binary ''),(64,'Gia L???c',19,1,'2019-09-23 14:15:37',_binary ''),(65,'Kim Th??nh',19,1,'2019-09-23 14:15:48',_binary ''),(66,'Kinh M??n',19,1,'2019-09-23 14:16:05',_binary ''),(67,'Nam S??ch',19,1,'2019-09-23 14:16:16',_binary ''),(68,'Ninh Giang',19,1,'2019-09-23 14:16:34',_binary ''),(69,'Thanh H??',19,1,'2019-09-23 14:16:51',_binary ''),(70,'Ch?? Linh',19,1,'2019-09-23 14:17:07',_binary ''),(71,'Thanh Mi???n',19,1,'2019-09-23 14:17:17',_binary ''),(72,'T??? K???',19,1,'2019-09-23 14:17:30',_binary ''),(73,'TP H???i D????ng',19,1,'2019-09-23 14:17:45',_binary ''),(74,'TP Ninh B??nh',34,1,'2019-09-23 14:27:32',_binary ''),(75,'TP H??? Long',66,1,'2019-09-23 14:47:06',_binary ''),(76,'TP M??ng C??i',66,1,'2019-09-23 14:47:24',_binary ''),(77,'TP C???m Ph???',66,1,'2019-09-23 14:47:45',_binary ''),(78,'TP U??ng B??',66,1,'2019-09-23 14:48:12',_binary ''),(79,'V??n ?????n',66,1,'2019-09-23 14:48:27',_binary ''),(80,'C?? T??',66,1,'2019-09-23 14:48:50',_binary ''),(81,'Nam ????n',27,1,'2019-09-23 14:49:24',_binary ''),(82,'Con Cu??ng',27,1,'2019-09-23 14:49:45',_binary ''),(83,'Ch??u Th??nh',42,1,'2019-09-23 14:51:43',_binary ''),(84,'B??nh ?????i',42,1,'2019-09-23 14:51:57',_binary ''),(85,'M??? C??y Nam',42,1,'2019-09-23 14:52:13',_binary ''),(86,'Ninh Ki???u',77,1,'2019-09-23 14:52:56',_binary ''),(87,'?? M??n',77,1,'2019-09-23 14:53:11',_binary ''),(88,'C??i R??ng',77,1,'2019-09-23 14:53:22',_binary ''),(89,'Th???t N???t',77,1,'2019-09-23 14:53:33',_binary ''),(90,'Thanh Tr??',18,1,'2019-09-23 15:37:36',_binary ''),(91,'T??? S??n',26,1,'2019-10-04 08:57:01',_binary ''),(92,'Th???t N???t',38,1,'2019-10-10 10:25:12',_binary '');
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_places`
--

DROP TABLE IF EXISTS `group_places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_places` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `users_creator_id` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_places`
--

LOCK TABLES `group_places` WRITE;
/*!40000 ALTER TABLE `group_places` DISABLE KEYS */;
INSERT INTO `group_places` VALUES (1,'Ph??ng kh??m',1,'2019-09-12 19:21:38',_binary ''),(19,'Nh?? thu???c',1,'2019-09-23 10:31:28',_binary ''),(20,'Th???m m?? vi???n',1,'2019-09-23 10:31:41',_binary ''),(21,'Ph??ng kh??m y h???c c??? truy???n',1,'2019-09-23 10:55:14',_binary ''),(22,'C???a h??ng thi???t b??? y t???',1,'2019-09-23 10:55:37',_binary ''),(23,'Trung t??m y t???',1,'2019-09-23 10:55:48',_binary ''),(24,'Trung t??m t?? v???n t??m l??',1,'2019-09-23 10:56:39',_binary ''),(25,'Tr???m y t???',1,'2019-09-23 10:57:13',_binary ''),(26,'Vi???n d?????ng l??o',1,'2019-09-23 10:57:24',_binary ''),(27,'Trung t??m x??t nghi???m',1,'2019-09-23 10:57:37',_binary ''),(28,'Trung t??m nghi??n c???u sinh h???c v?? y d?????c',1,'2019-09-23 10:58:15',_binary ''),(29,'CONNECTCARE',1,'2019-09-30 15:49:56',_binary '');
/*!40000 ALTER TABLE `group_places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_sites`
--

DROP TABLE IF EXISTS `group_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_sites` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `users_creator_id` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_sites`
--

LOCK TABLES `group_sites` WRITE;
/*!40000 ALTER TABLE `group_sites` DISABLE KEYS */;
INSERT INTO `group_sites` VALUES (1,'Qu???n tr???',1,'2019-09-12 15:11:31',_binary ''),(40,'Landing page',1,'2019-09-23 11:45:31',_binary ''),(41,'Ng?????i d??ng',1,'2019-09-23 11:45:40',_binary ''),(42,'csd',1,'2019-09-30 14:25:08',_binary ''),(43,'Gi???i thi???u',1,'2019-09-30 15:58:56',_binary '');
/*!40000 ALTER TABLE `group_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_users`
--

DROP TABLE IF EXISTS `group_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_users` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `users_creator_id` bigint(20) NOT NULL,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_users`
--

LOCK TABLES `group_users` WRITE;
/*!40000 ALTER TABLE `group_users` DISABLE KEYS */;
INSERT INTO `group_users` VALUES (1,'Qu???n tr??? h??? th???ng','2019-09-12 19:09:30',1,_binary ''),(2,'Qu???n tr??? c?? s??? y t???','2019-09-12 19:09:30',1,_binary ''),(3,'Nh??n vi??n c?? s??? y t???','2019-09-12 19:09:30',1,_binary ''),(4,'Qu???n tr??? nh?? thu???c','2019-09-25 08:26:30',1,_binary '');
/*!40000 ALTER TABLE `group_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `med_customers`
--

DROP TABLE IF EXISTS `med_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `med_customers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT 'T??n duy nh???t tron b???ng theo places_id',
  `wards_id` bigint(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `mobile` varchar(12) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `places_id` bigint(20) NOT NULL,
  `group_customers_id` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `users_creator_id` bigint(20) NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile_UNIQUE` (`mobile`,`places_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='Kh??ch h??ng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `med_customers`
--

LOCK TABLES `med_customers` WRITE;
/*!40000 ALTER TABLE `med_customers` DISABLE KEYS */;
INSERT INTO `med_customers` VALUES (8,'????? Nguy???n Lan Anh',23,'google.com\ngoogle.com','0972290154','admin@nbm.vn.com',35,2,'2019-10-01 11:46:08',28,_binary ''),(9,'Nguy???n Xu??n Th???y',18,'google.com\ngoogle.com','0972290153','123@123.com.vn',35,2,'2019-10-01 12:03:28',28,_binary ''),(11,'Nguyen Thi Huyen Trang',NULL,'a','84916960362','n@gmail.com.vn',35,3,'2019-10-02 10:21:42',28,_binary ''),(12,'Hoan Nguy???n',23,'Keangnam','0368973438','123@123.com',35,2,'2019-10-02 12:03:20',28,_binary ''),(16,'????o H???i',24,'34234','84909222112','sales.lehaoco@gmail.com',35,3,'2019-10-02 14:22:54',28,_binary ''),(17,'Nguy???n Minh Th??y',29,'S??? 1 Th??i H??','0909222111','min@gmail.com',35,2,'2019-10-03 09:16:20',28,_binary ''),(18,'Giang V??n Minh',18,'   ','0372776544','m@gmail.com',35,2,'2019-10-07 08:42:59',32,_binary ''),(19,'Nguy???n H???nh',23,'','0983334989',NULL,35,1,'2019-10-08 11:21:05',1,_binary ''),(22,'????o H???i',24,NULL,'0944733239','',35,2,'2019-10-11 11:43:23',1,_binary ''),(23,'Nguy???n Th??? Hoan',NULL,'','0368973439',NULL,35,1,'2019-10-11 11:44:45',1,_binary ''),(24,'Tr???n An',1,'abc','0985555555','',35,2,'2019-10-14 11:47:24',1,_binary ''),(25,'Tr???n An B??nh',1,'abc','0983334985','',35,2,'2019-10-14 11:48:32',1,_binary ''),(26,'Nguy???n An',1,'abc','0983334912','',35,2,'2019-10-14 11:50:33',1,_binary ''),(27,'Nguy???n Anh Kh??nh',1,'abc','098333495','',35,2,'2019-10-14 14:20:25',1,_binary '');
/*!40000 ALTER TABLE `med_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `med_goods_issue_detail`
--

DROP TABLE IF EXISTS `med_goods_issue_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `med_goods_issue_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'b???ng chi ti???t phi???u xu???t',
  `goods_issues_id` bigint(20) NOT NULL,
  `medicines_id` bigint(20) NOT NULL COMMENT 'thu???c b??n',
  `units_id` bigint(20) NOT NULL COMMENT '????n v??? b??n l???',
  `quantities` bigint(20) NOT NULL COMMENT 's??? l?????n b??n',
  `coefficient` bigint(20) DEFAULT NULL,
  `price` bigint(20) NOT NULL COMMENT 'gi?? b??n ???? bao g???m VAT',
  `dose_per_day` bigint(20) NOT NULL COMMENT 's??? li???u/ng??y ',
  `quantities_per_time` bigint(20) NOT NULL COMMENT 's??? l????ng /l???n u???ng',
  `places_id` bigint(20) NOT NULL,
  `discounts` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Gi???m gi??',
  `is_retail` bit(1) NOT NULL,
  `duong_dung` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `med_goods_issue_detail`
--

LOCK TABLES `med_goods_issue_detail` WRITE;
/*!40000 ALTER TABLE `med_goods_issue_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `med_goods_issue_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `med_goods_issue_receipt_detail`
--

DROP TABLE IF EXISTS `med_goods_issue_receipt_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `med_goods_issue_receipt_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `goods_receipt_detail_id` bigint(20) DEFAULT NULL,
  `quantites` bigint(20) DEFAULT NULL,
  `goods_issue_detail_id` bigint(20) DEFAULT NULL,
  `is_debit` bit(1) DEFAULT NULL,
  `coefficient` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `med_goods_issue_receipt_detail`
--

LOCK TABLES `med_goods_issue_receipt_detail` WRITE;
/*!40000 ALTER TABLE `med_goods_issue_receipt_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `med_goods_issue_receipt_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `med_goods_issues`
--

DROP TABLE IF EXISTS `med_goods_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `med_goods_issues` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `issue_code` varchar(100) NOT NULL COMMENT 'm?? duy nh???t theo places_id',
  `users_seller_id` bigint(20) NOT NULL COMMENT 'ng?????i b??n',
  `payment_methods_id` bigint(20) NOT NULL,
  `warehouses_id` bigint(20) NOT NULL,
  `debit` bit(1) NOT NULL,
  `invoice_code` varchar(100) DEFAULT NULL,
  `invoice_date` datetime DEFAULT NULL,
  `issue_date` datetime DEFAULT NULL COMMENT 'ng??y xu???t ',
  `customers_id` bigint(20) NOT NULL,
  `descriptions` varchar(200) DEFAULT NULL,
  `places_id` bigint(20) DEFAULT NULL,
  `users_creator_id` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'ng??y t???o',
  `status` bit(1) NOT NULL DEFAULT b'1',
  `issue_type` int(11) DEFAULT '1' COMMENT '1: b??n h??ng\n2: Xu???t tr??? nh?? cung c???p\n3: Xu???t h???y\n4: xu???t n???i b???\n5: ki???m kho',
  `good_issue_code` varchar(50) DEFAULT NULL,
  `good_issue_invoice_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `issue_code_UNIQUE` (`issue_code`,`places_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `med_goods_issues`
--

LOCK TABLES `med_goods_issues` WRITE;
/*!40000 ALTER TABLE `med_goods_issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `med_goods_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `med_goods_receipt_detail`
--

DROP TABLE IF EXISTS `med_goods_receipt_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `med_goods_receipt_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `goods_receipts_id` bigint(20) NOT NULL COMMENT 'phi???u nh???p thu???c',
  `medicines_id` bigint(20) NOT NULL COMMENT 't??n thu???c',
  `lotnumber` varchar(100) NOT NULL COMMENT 's??? l?? h??ng nh???p',
  `quantities_request` bigint(20) NOT NULL COMMENT 's??? h??ng y??u c???u/ho???c tr??n phi???u giao',
  `quantities_received` bigint(20) NOT NULL COMMENT 's??? h??ng th???c nh???n',
  `retail_quantities` bigint(20) DEFAULT NULL COMMENT 'S??? l?????ng(b??n l???)',
  `price` bigint(20) NOT NULL COMMENT 'gi?? nh???p',
  `expired_date` datetime NOT NULL COMMENT 'ng??y h???t h???n',
  `quantities_in_stock` bigint(20) DEFAULT NULL COMMENT 'S??? h??ng c??n trong kho ( t??nh theo ????n v??? b??n l???)',
  `manufacturing_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Ng??y s???n xu???t',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `med_goods_receipt_detail`
--

LOCK TABLES `med_goods_receipt_detail` WRITE;
/*!40000 ALTER TABLE `med_goods_receipt_detail` DISABLE KEYS */;
INSERT INTO `med_goods_receipt_detail` VALUES (1,1,1,'025',25,25,50,23,'2019-10-14 09:28:44',50,'2019-10-14 09:28:42');
/*!40000 ALTER TABLE `med_goods_receipt_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `med_goods_receipts`
--

DROP TABLE IF EXISTS `med_goods_receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `med_goods_receipts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `receipt_code` varchar(100) NOT NULL COMMENT 'm?? phi???u duy nh???t theo places_id trong b???ng',
  `shipper_name` varchar(100) DEFAULT NULL COMMENT 'ng?????i giao h??ng',
  `payment_methods_id` bigint(20) NOT NULL COMMENT 'ph????ng th???c thanh to??n',
  `warehouses_id` bigint(20) NOT NULL COMMENT 'kho thu???c',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'ng??y t???o h??? th???ng',
  `date_receipt` datetime NOT NULL COMMENT 'ng??y nh???p h??ng',
  `debit` bit(1) NOT NULL COMMENT 'c??ng n??? c??',
  `invoice_code` varchar(100) DEFAULT NULL COMMENT 's??? h??a ????n VAT',
  `invoice_date` datetime DEFAULT NULL COMMENT 'Ng??y vi???t h??a ????n',
  `descriptions` varchar(200) DEFAULT NULL COMMENT 'ghi ch??',
  `users_recipient_id` bigint(20) NOT NULL COMMENT 'ng?????i nh???n',
  `users_creator_id` bigint(20) NOT NULL COMMENT 'ng?????i c???p nh???t h??? th???ng',
  `suppliers_id` bigint(20) NOT NULL COMMENT 'nh?? cung c???p',
  `status` bit(1) NOT NULL DEFAULT b'1' COMMENT 'tr???ng th??i',
  `places_id` bigint(20) NOT NULL COMMENT 'c?? s??? y t???',
  `receipt_type` int(11) DEFAULT '1' COMMENT '1: Nh???p t??? nh?? cung c???p\n2: Kh??ch tr???\n3: Nh???p t???n',
  `good_receipt_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `receipt_code_UNIQUE` (`receipt_code`,`places_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Phi???u nh???p h??ng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `med_goods_receipts`
--

LOCK TABLES `med_goods_receipts` WRITE;
/*!40000 ALTER TABLE `med_goods_receipts` DISABLE KEYS */;
INSERT INTO `med_goods_receipts` VALUES (1,'KL20055','????? Minh Th??',6,7,'2019-10-14 09:32:08','2019-10-02 09:27:57',_binary '','025','2019-10-03 09:28:16','null',29,1,5,_binary '',35,1,NULL);
/*!40000 ALTER TABLE `med_goods_receipts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `med_group_customers`
--

DROP TABLE IF EXISTS `med_group_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `med_group_customers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT '-T??n duy nh???t trong b???ng places_id',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `users_creator_id` bigint(20) NOT NULL,
  `places_id` bigint(20) NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`,`places_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `med_group_customers`
--

LOCK TABLES `med_group_customers` WRITE;
/*!40000 ALTER TABLE `med_group_customers` DISABLE KEYS */;
INSERT INTO `med_group_customers` VALUES (1,'Kh??ch h??ng b??c s??','2019-09-25 13:34:49',1,35,_binary ''),(2,'Kh??ch h??ng l???','2019-09-25 13:35:16',1,35,_binary ''),(3,'Kh??ch h??ng s???','2019-09-25 13:35:55',1,35,_binary ''),(4,'Kh??ch h??ng th?????ng xuy??n','2019-09-25 13:40:02',1,35,_binary '');
/*!40000 ALTER TABLE `med_group_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `med_group_medicines`
--

DROP TABLE IF EXISTS `med_group_medicines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `med_group_medicines` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT '-T??n duy nh???t trong b???ng theo places_id v?? parentid',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `users_creator_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `places_id` bigint(20) NOT NULL,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`,`places_id`,`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `med_group_medicines`
--

LOCK TABLES `med_group_medicines` WRITE;
/*!40000 ALTER TABLE `med_group_medicines` DISABLE KEYS */;
INSERT INTO `med_group_medicines` VALUES (1,'Nh??m thu???c tim m???ch','2019-09-24 22:53:43',1,0,35,_binary ''),(15,'Nh??m thu???c ??i???u tr??? suy tim sung huy???t','2019-10-02 18:31:01',28,1,35,_binary ''),(16,'Nh??m thu???c ??i???u tr??? thi???u m??u c???c b???','2019-10-02 18:31:20',28,1,35,_binary ''),(17,'Nh??m thu???c ??i???u tr??? lo???n nh???p tim','2019-10-02 18:31:34',28,1,35,_binary ''),(18,'Nh??m thu???c ??i???u tr??? t??ng huy???t ??p','2019-10-02 18:31:50',28,1,35,_binary ''),(19,'Nh??m thu???c ch???ng cho??ng v?? ch???ng s???c','2019-10-02 18:32:52',28,1,35,_binary ''),(20,'Thu???c g??y m??','2019-10-02 18:33:36',28,0,35,_binary ''),(21,'Thu???c g??y m?? v?? oxygen','2019-10-02 18:33:51',28,20,35,_binary ''),(22,'Thu???c g??y t?? t???i ch??? ','2019-10-02 18:34:03',28,20,35,_binary ''),(23,'Thu???c ti???n m??','2019-10-02 18:34:18',28,20,35,_binary ''),(24,'THU???C GI???M ??AU V?? H??? S???T NH??M CH???NG VI??M','2019-10-02 18:35:59',28,0,35,_binary ''),(25,'Thu???c gi???m ??au kh??ng c?? opi','2019-10-02 18:36:19',28,24,35,_binary ''),(26,'Thu???c h??? s???t','2019-10-02 18:36:37',28,24,35,_binary ''),(27,'Thu???c ch???ng vi??m kh??ng steroid','2019-10-02 18:36:54',28,24,35,_binary ''),(28,'Thu???c gi???m ??au lo???i opi','2019-10-02 18:37:14',28,24,35,_binary ''),(29,'Thu???c ??i???u tr??? b???nh g??t','2019-10-02 18:37:57',28,24,35,_binary ''),(30,'THU???C CH???NG D??? ???NG TRONG C??C TR?????NG H???P QU?? M???N','2019-10-02 18:38:29',28,0,35,_binary ''),(31,'THU???C GI???I ?????C','2019-10-02 18:38:43',28,0,35,_binary ''),(32,'Thu???c gi???i ?????c ?????c hi???u','2019-10-02 18:38:58',28,31,35,_binary ''),(33,'Thu???c gi???i ?????c kh??ng ?????c hi???u','2019-10-02 18:39:12',28,31,35,_binary ''),(34,'THU???C CH???NG ?????NG KINH','2019-10-02 18:39:26',28,0,35,_binary ''),(35,'THU???C TR??? K?? SINH TR??NG CH???NG NHI???M KHU???N','2019-10-02 18:39:41',28,0,35,_binary ''),(36,'Thu???c tr??? giun v?? s??n','2019-10-02 18:40:03',28,35,35,_binary ''),(37,'Thu???c tr??? giun ch??? ','2019-10-02 18:40:23',28,35,35,_binary ''),(38,'Thu???c tr??? s??n l??','2019-10-02 18:40:44',28,35,35,_binary ''),(39,'Thu???c r???i lo???n','2019-10-03 09:45:11',28,0,35,_binary ''),(40,'Thu???c Gi???m ??au','2019-10-09 15:31:25',32,0,35,_binary ''),(41,'Thu???c c?????ng d????ng','2019-10-11 15:41:49',32,0,35,_binary '');
/*!40000 ALTER TABLE `med_group_medicines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `med_group_producers`
--

DROP TABLE IF EXISTS `med_group_producers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `med_group_producers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `descriptions` varchar(200) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `users_creator_id` bigint(20) NOT NULL,
  `places_id` bigint(20) NOT NULL,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`,`places_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `med_group_producers`
--

LOCK TABLES `med_group_producers` WRITE;
/*!40000 ALTER TABLE `med_group_producers` DISABLE KEYS */;
INSERT INTO `med_group_producers` VALUES (1,'????ng y',NULL,'2019-09-27 15:09:48',28,35,_binary ''),(2,'Th???c ph???m ch???c n??ng',NULL,'2019-09-27 15:23:52',28,35,_binary ''),(3,'V???t t?? thi???t b??? y t???',NULL,'2019-09-27 15:35:31',28,35,_binary ''),(4,'D?????c ph???m',NULL,'2019-09-27 16:59:41',28,35,_binary ''),(13,'Th???o d?????c',NULL,'2019-10-02 16:26:22',28,35,_binary ''),(14,'Nh??m 01',NULL,'2019-10-14 10:12:56',1,35,_binary ''),(15,'C??ng ty Afeco',NULL,'2019-10-14 10:20:14',1,35,_binary ''),(16,'Nh??m 02',NULL,'2019-10-14 10:22:53',1,35,_binary '');
/*!40000 ALTER TABLE `med_group_producers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `med_group_suppliers`
--

DROP TABLE IF EXISTS `med_group_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `med_group_suppliers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT '-T??n duy nh???t trong b???ng places_id',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `users_creator_id` bigint(20) NOT NULL,
  `places_id` bigint(20) NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`,`places_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `med_group_suppliers`
--

LOCK TABLES `med_group_suppliers` WRITE;
/*!40000 ALTER TABLE `med_group_suppliers` DISABLE KEYS */;
INSERT INTO `med_group_suppliers` VALUES (1,'Nh??m nh?? cung c???p thu???c ????ng y v?? l?? thu???c','2019-09-25 13:40:11',1,35,_binary ''),(2,'Nh??m nh?? cung c???p y d?????c','2019-09-25 13:40:28',1,35,_binary ''),(3,'Nh??m nh?? cung c???p d?????c ph???m','2019-09-25 13:40:30',1,35,_binary ''),(4,'Nh??m nh?? cung c???p thu???c v?? th???o d?????c','2019-09-25 13:44:45',1,35,_binary ''),(5,'Nh?? cung c???p th???c ph???m ch???c n??ng','2019-09-25 16:24:09',28,35,_binary ''),(6,'Nh?? cung c???p trang thi???t b??? y t??? v?? v???t t?? y t???','2019-09-25 16:24:35',28,35,_binary ''),(7,'Nh?? cung c???p thu???c kh??ng sinh ','2019-09-25 16:27:32',28,35,_binary ''),(8,'Nh?? cung c???p thu???c th???o d?????c','2019-10-07 09:33:59',28,35,_binary ''),(9,'Nh?? cung c???p s??? 2','2019-10-08 09:19:46',1,35,_binary '\0'),(10,'Nh??m nh?? cung c???p 01','2019-10-14 10:29:20',1,35,_binary ''),(11,'Nh??m 02','2019-10-14 10:29:35',1,35,_binary ''),(12,'Abc','2019-10-14 10:30:45',1,35,_binary '');
/*!40000 ALTER TABLE `med_group_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `med_medicine_locations`
--

DROP TABLE IF EXISTS `med_medicine_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `med_medicine_locations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `descriptions` varchar(200) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `users_creator_id` bigint(20) NOT NULL,
  `places_id` bigint(20) NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `med_medicine_locations`
--

LOCK TABLES `med_medicine_locations` WRITE;
/*!40000 ALTER TABLE `med_medicine_locations` DISABLE KEYS */;
INSERT INTO `med_medicine_locations` VALUES (1,'D?????i tr??i','D?????i tr??i','2019-09-25 13:47:49',1,35,_binary ''),(2,'D?????i ph???i','D?????i ph???i','2019-09-25 13:48:21',1,35,_binary ''),(3,'Ch??nh gi???a','Ch??nh gi???a','2019-09-25 13:49:06',1,35,_binary ''),(4,'thuy','rdds','2019-09-25 18:09:15',28,36,_binary ''),(5,'Tr??n c??ng','Tr??n c??ng','2019-09-27 17:57:34',28,35,_binary ''),(6,'Tr??n ph???i','Tr??n ph???i\n\nc??ng ????','2019-09-30 10:36:46',28,35,_binary ''),(7,'Tr??n tr??i','Tr??n tr??i','2019-09-30 14:11:16',28,35,_binary ''),(8,'D?????i gi???a','D?????i gi???a','2019-10-03 09:15:19',28,35,_binary ''),(9,'B??n tr??i','B??n tr??i\n','2019-10-03 09:16:31',28,35,_binary ''),(10,'B??n ph???i','B??n ph???i','2019-10-03 09:38:00',28,35,_binary ''),(11,'H12','H12\n','2019-10-03 09:38:17',28,35,_binary ''),(12,'H22','H22\n','2019-10-08 08:26:54',32,35,_binary '\0'),(13,'VT1',NULL,'2019-10-14 11:02:26',1,35,_binary '');
/*!40000 ALTER TABLE `med_medicine_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `med_medicines`
--

DROP TABLE IF EXISTS `med_medicines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `med_medicines` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT 'T??n thu???c duy nh???t theo places_id',
  `images` varchar(300) DEFAULT NULL COMMENT '???nh thu???c',
  `barcode` varchar(200) DEFAULT NULL COMMENT 'm?? v???ch',
  `packages_id` bigint(20) NOT NULL COMMENT 'quy c??ch ????ng g??i',
  `active_element_name` varchar(50) NOT NULL COMMENT 't??n ho???t ch???t',
  `registration_number` varchar(100) NOT NULL COMMENT 's??? ????ng k?? v???i c???c qu???n l?? d?????c',
  `concentrations` varchar(300) NOT NULL COMMENT 'N???ng ?????/h??m l?????ng ',
  `producers_id` bigint(20) NOT NULL COMMENT 'nh?? s???n xu???t',
  `made_in` varchar(100) DEFAULT NULL COMMENT 'thu???c ??c s???n xu???t ',
  `standard` varchar(50) DEFAULT NULL COMMENT 'ti??u chu???n',
  `group_medicines_id` bigint(20) NOT NULL COMMENT 'nh??m thu???c',
  `medicine_locations_id` bigint(20) DEFAULT NULL,
  `places_id` bigint(20) NOT NULL COMMENT 'c?? s??? y t???',
  `retail_price` bigint(20) NOT NULL COMMENT 'gi?? b??n l???',
  `wholesale_price` bigint(20) NOT NULL COMMENT 'gi?? b??n bu??n',
  `types_id` bigint(20) NOT NULL COMMENT 'lo???i thu???c',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'ng??y t???o tr??n h??? th???ng',
  `users_creator_id` bigint(20) NOT NULL COMMENT 'ng?????i t???o b???n ghi',
  `status` bit(1) NOT NULL DEFAULT b'1' COMMENT 'tr???ng th??i',
  `medicine_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`,`places_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `med_medicines`
--

LOCK TABLES `med_medicines` WRITE;
/*!40000 ALTER TABLE `med_medicines` DISABLE KEYS */;
INSERT INTO `med_medicines` VALUES (1,'Golduling','','23456789',9,'Tadalafil','VD-14457-11','20mg',1,'Vi???t Nam','TCCSh',41,1,35,50000,30286,17,'2019-10-12 21:35:49',32,_binary '','DCS000002752338'),(2,'Thu???c 10','','23456789',7,'a','VD-14457-118','a',3,'Vi???t Nam','TCCSh',30,NULL,35,2000,20000,17,'2019-10-14 11:11:51',1,_binary '',NULL);
/*!40000 ALTER TABLE `med_medicines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `med_packages`
--

DROP TABLE IF EXISTS `med_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `med_packages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT '-T??n duy nh???t trong b???ng',
  `units_id` bigint(20) NOT NULL,
  `quantities` bigint(20) NOT NULL,
  `wholesale_units_id` bigint(20) NOT NULL,
  `wholesale_quantities` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `users_creator_id` bigint(20) NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `med_packages`
--

LOCK TABLES `med_packages` WRITE;
/*!40000 ALTER TABLE `med_packages` DISABLE KEYS */;
INSERT INTO `med_packages` VALUES (1,'H???p x 6 l???',3,6,22,1,'2019-09-26 13:33:28',28,_binary ''),(2,'Tu??p 250ml',14,1,14,1,'2019-09-27 15:23:51',28,_binary ''),(3,'H???p 10 v??? x 10 vi??n',1,10,21,1,'2019-09-27 17:04:07',28,_binary ''),(4,'H???p 5 v??? x 20 vi??n',1,100,22,1,'2019-09-27 17:04:48',28,_binary ''),(5,'H???p 20 v??? x 10 vi??n',21,20,21,1,'2019-09-30 10:06:57',28,_binary ''),(6,'H???p 10 t??i x 3 gram',12,10,22,1,'2019-09-30 10:15:27',28,_binary ''),(7,'H???p 1 l???',3,1,3,1,'2019-10-03 09:03:24',28,_binary ''),(8,'H???p 3 v??? 10 vi??n',1,10,21,1,'2019-10-03 09:50:39',28,_binary ''),(9,'H???p 1 v??? x 2 vi??n',1,2,21,1,'2019-10-11 15:37:21',32,_binary '');
/*!40000 ALTER TABLE `med_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `med_producers`
--

DROP TABLE IF EXISTS `med_producers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `med_producers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT 't??n duy nh???t v???i places_id',
  `address` varchar(200) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `group_producers_id` bigint(20) NOT NULL,
  `users_creator_id` bigint(20) NOT NULL,
  `places_id` bigint(20) DEFAULT NULL,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`,`places_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='Qu???n l?? nh?? s???n xu???t';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `med_producers`
--

LOCK TABLES `med_producers` WRITE;
/*!40000 ALTER TABLE `med_producers` DISABLE KEYS */;
INSERT INTO `med_producers` VALUES (1,'C??ng ty c??? ph???n d?????c ph???m trung ????ng Mediplantex','358 ???????ng Gi???i Ph??ng, Ph????ng Li???t, Thanh Xu??n, H?? N???i','2019-09-26 11:46:47',4,28,35,_binary ''),(2,'C??ng Ty C??? Ph???n D?????c Ph???m Trung ????ng I v?? Pharbaco','160 T??n ?????c Th???ng, Q. ?????ng ??a, H?? N???i, Vi???t Nam','2019-09-26 11:46:58',3,28,35,_binary ''),(3,'C??ng Ty C??? Ph???n D?????c Ph???m H?? T??y','S??? 10A Quang Trung, Qu???n H?? ????ng, H?? N???i, Vi???t Nam\n','2019-09-30 11:08:48',4,28,35,_binary ''),(4,'C??ng Ty CP N??ng Nghi???p C??ng Ngh??? Cao Th??ng Long','X?? ?????i Y??n, Ch????ng M???, H?? N???i, Vi???t Nam','2019-09-30 13:52:11',4,28,35,_binary ''),(9,'C??ng ty TNHH Ha San Dermapharm','???????ng s??? 2, KCN ?????ng An, Thu???n An, B??nh D????ng, Vi???t Nam','2019-10-03 09:00:01',4,28,35,_binary ''),(10,'C??ng ty c??? ph???n d?????c ph???m Tipharco','L?? 08,09 CCN v?? TTCN T??n M??? Ch??nh, P.9, TP My?? Tho, Ti????n Giang','2019-10-08 09:03:00',4,1,35,_binary ''),(11,'Cty TNHH s???n xu???t th????ng m???i d?????c ph???m NIC (NIC pharma)','Vi???t Nam','2019-10-08 09:19:06',4,32,35,_binary '');
/*!40000 ALTER TABLE `med_producers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `med_suppliers`
--

DROP TABLE IF EXISTS `med_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `med_suppliers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT '-T??n kh??ng tr??ng theo places_id',
  `tax_code` varchar(45) DEFAULT NULL COMMENT 'M?? s??? thu???',
  `address` varchar(200) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `mobile` varchar(12) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `logo` varchar(300) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `descriptions` varchar(500) DEFAULT NULL,
  `group_suppliers_id` bigint(20) NOT NULL,
  `users_creator_id` bigint(20) NOT NULL,
  `places_id` bigint(20) DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`,`places_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='Nh?? cung c???p';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `med_suppliers`
--

LOCK TABLES `med_suppliers` WRITE;
/*!40000 ALTER TABLE `med_suppliers` DISABLE KEYS */;
INSERT INTO `med_suppliers` VALUES (1,'C??ng Ty C??? Ph???n D?????ng D?????c V??nh Kim','0101054925','186 ?????nh C??ng H???, P. ?????nh C??ng, Q. Ho??ng Mai,H?? N???i','2019-09-25 14:48:21','0919559698','kimluan32@gmail.com','','www.duocvinhkim.com','C??ng Ty CP D?????ng D?????c V??nh Kim chuy??n s???n xu???t v?? cung c???p th???o d?????c v?? s???n ph???m t??? th???o d?????c v???i ch???t l?????ng ?????m b???o, gi?? c??? h???p l??, uy t??n, chuy??n nghi???p tr??n to??n qu???c.',5,1,35,_binary ''),(2,'C??ng Ty CP N??ng Nghi???p C??ng Ngh??? Cao Th??ng Long','0101054925','X?? ?????i Y??n, Ch????ng M???,H?? N???i','2019-09-25 14:49:03','0972339095','cagaileosadu@gmail.com','','www.cagaileosadu.com.vn','C?? Gai Leo Sadu - s???n ph???m ???????c s???n xu???t b???i C??ng Ty C??ng Ngh??? Cao Th??ng Long.\nHi???n t???i C?? Gai Leo Sadu ??ang ph??n ph???i nh???ng s???n ph???m ch??nh nh??: Cao C?? Gai Leo Sadu, C?? Gai Leo Ho?? Tan Sadu, C?? Gai Le',7,1,35,_binary ''),(3,'R?????u Thu???c Xoa B??p Gia Truy???n H???ng Phong','0101054925','99 ???????ng S??? 8, P. 4, Q. 8,Tp. H??? Ch?? Minh (TPHCM)','2019-09-25 14:49:06','0902216004','rxbhongphong@gmail.com','userfiles/admin_nbm/images/20191008/2019_10_08_10_13_12_396_download.png','www.plus.google.com/u/0/115407584113782720816','V???i r???t nhi???u c??ng d???ng ho??n h???o t??? b??i thu???c gia truy???n l??u ?????i, kh???ng ?????nh t??? c??? ch?? kim ch??a c?? b??i thu???c, lo???i R??????? n??o ch???a ???????c nhi???u b???nh nh?? v???y. To??n b??? b???nh ngo??i c?? th??? ?????u ?????c l?????ng th???i g',1,1,35,_binary ''),(4,'Eva Shop','123456','475 ??o??n V??n B??, Ph?????ng 14, Qu???n 4,Tp. H??? Ch?? Minh (TPHCM)','2019-09-26 12:07:24','0903070384','xuandiemthaicorp@gmail.com','','www.evachamsocda.com','Ch??ng t??i chuy??n cung c???p s???, l??? N???m gi???m c??n th???o d?????c, nh?? h??? tr??? kh??ch han gi???m c??n an to??n, s???m ?????t ???????c c??n n???ng nh?? ??.',1,28,35,_binary ''),(5,'C??ng Ty C??? Ph???n Difoco','0313240560','289 ??inh B??? L??nh, P. 26, Q. B??nh Th???nh,Tp. H??? Ch?? Minh (TPHCM)','2019-09-27 11:22:23','0366857787','info@difoco.com','','www.difoco.com','C??ng ty c??? ph???n DIFOCO kinh doanh chuy??n v??? d?????c ph???m & th???c ph???m b???o v??? s???c kh???e c?? ngu???n g???c t??? th???o d?????c thi??n nhi??n.',4,1,35,_binary ''),(6,'C??ng Ty C??? Ph???n Neemtree','0313614992','37/5B Trung M??? T??y, Trung Ch??nh, H??c M??n,Tp. H??? Ch?? Minh (TPHCM)','2019-09-27 11:35:48','0871066869','info@neemtree.vn','','www.neemtree.vn','C??ng Ty C??? Ph???n NeemTree ???????c s???p v??o top 5 c??c th????ng hi???u th???o d?????c h??ng ?????u t???i Vi???t Nam trong l??nh v???c th???o d?????c h??? tr??? ??i???u tr??? c??c b???nh nh?? ti???u ???????ng, huy???t ??p th???p, s???i th???n v?? x????ng kh???p,..',2,1,35,_binary ''),(7,'C??ng Ty TNHH L?? H??o','0101054925','26/36 ???????ng Th?????ng H???i, X?? T??n H???i, H. ??an Ph?????ng H?? N???i','2019-09-27 11:42:16','0337190219','sales.lehaoco@gmail.com','','TNHH L?? H??o','C??ng ty TNHH L?? H??o chuy??n cung c???p n??ng s???n (gia v???, c?? d???u), th???o d?????c, tinh d???u,..',6,1,35,_binary ''),(8,'C??ng ty c??? ph???n d?????c ph???m Tipharco','1200100557','L?? 08,09 CCN v?? TTCN T??n M??? Ch??nh, P.9, TP My?? Tho, Ti????n Giang','2019-10-08 09:18:02','02733871817','tipharco@vnn.vn','','www.tipharco.com.vn','   ',3,32,35,_binary ''),(9,'C??NG TY C??? PH???N D?????C PH???M H?? T??Y','0500391400','10A Quang Trung - H?? ????ng - H?? N???i','2019-10-09 14:08:22','0433522525','duochatay@gmail.com','userfiles/admin_nbm/images/20191009/2019_10_09_15_43_27_984_photo20190821113127.jpg','hataphar.com.vn',NULL,3,32,35,_binary ''),(10,'C??ng ty C??? ph???n D?????c ph???m ?????t Vi Ph??','3700575898 ','???????ng D17, Khu C??ng Nghi???p M??? Ph?????c 1, B???n C??t - B??nh D????ng, Vi???t Nam','2019-10-09 15:49:54','02743567687',NULL,'','support@davipharm.info',NULL,3,32,35,_binary ''),(11,'C??ng ty CP d?????c ph???m Gia Thu???n',NULL,NULL,'2019-10-11 15:53:45','0968506333',NULL,'',NULL,NULL,3,32,35,_binary '');
/*!40000 ALTER TABLE `med_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `med_types`
--

DROP TABLE IF EXISTS `med_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `med_types` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT 'duy nh???t trong b???ng',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `users_creator_id` bigint(20) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `med_types`
--

LOCK TABLES `med_types` WRITE;
/*!40000 ALTER TABLE `med_types` DISABLE KEYS */;
INSERT INTO `med_types` VALUES (17,'Thu???c kh??ng k?? ????n','2019-10-07 09:24:03',28,_binary ''),(18,'Thu???c k?? ????n','2019-10-07 09:58:07',28,_binary '');
/*!40000 ALTER TABLE `med_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `med_units`
--

DROP TABLE IF EXISTS `med_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `med_units` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT '-T??n duy nh???t trong b???ng',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `users_creator_id` bigint(20) NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='B???ng d??? li???u n??y l?? danh m???c, ???????c nh??n all cho h??? th???ng d??ng chung';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `med_units`
--

LOCK TABLES `med_units` WRITE;
/*!40000 ALTER TABLE `med_units` DISABLE KEYS */;
INSERT INTO `med_units` VALUES (1,'Vi??n','2019-09-25 14:52:18',1,_binary ''),(2,'G??i','2019-09-25 14:52:33',1,_binary ''),(3,'L???','2019-09-25 14:52:40',1,_binary ''),(4,'Th??ng','2019-09-25 14:52:43',1,_binary ''),(5,'Kim ti??m','2019-09-25 14:52:48',1,_binary ''),(7,'???ng','2019-09-27 10:41:43',28,_binary ''),(11,'Mi???ng','2019-09-27 10:54:02',28,_binary ''),(12,'T??i','2019-09-27 11:12:47',28,_binary ''),(14,'Tu??p','2019-09-27 11:44:30',28,_binary ''),(21,'V???','2019-09-30 13:33:14',28,_binary ''),(22,'H???p','2019-09-30 14:49:08',28,_binary ''),(24,'DV1','2019-10-14 10:44:13',1,_binary ''),(25,'DVS1','2019-10-14 10:44:28',1,_binary ''),(26,'DVT3','2019-10-14 10:48:45',1,_binary ''),(27,'DVT4','2019-10-14 10:48:54',1,_binary ''),(28,'DVT6','2019-10-14 10:49:00',1,_binary '');
/*!40000 ALTER TABLE `med_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `med_warehouses`
--

DROP TABLE IF EXISTS `med_warehouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `med_warehouses` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT 't??n duy nh???t theo places_id',
  `address` varchar(200) DEFAULT NULL,
  `wards_id` bigint(20) DEFAULT NULL,
  `places_id` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `users_creator_id` bigint(20) NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`,`places_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `med_warehouses`
--

LOCK TABLES `med_warehouses` WRITE;
/*!40000 ALTER TABLE `med_warehouses` DISABLE KEYS */;
INSERT INTO `med_warehouses` VALUES (4,'Kho thu???c Hai B?? Tr??ng H?? N???i','102 Hai b?? Tr??ng\n',49,35,'2019-09-27 14:47:12',28,_binary ''),(5,'kho thu???c ba ????nh','gvv',17,35,'2019-09-27 15:10:43',28,_binary ''),(7,'Kho qu???y thu???c Thu Loan','s??? 8 trung y??n 9, t??a Vinahub',23,35,'2019-09-30 11:13:09',28,_binary ''),(8,'kho qu???y thu???c ?????ng ??a','s??? 9',23,35,'2019-10-09 10:09:07',1,_binary '\0');
/*!40000 ALTER TABLE `med_warehouses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `med_warehouses_details`
--

DROP TABLE IF EXISTS `med_warehouses_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `med_warehouses_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `places_id` bigint(20) NOT NULL COMMENT '????n v???',
  `medicines_id` bigint(20) NOT NULL COMMENT 'thu???c',
  `whosale_quantities` bigint(20) NOT NULL COMMENT 's??? l?????ng ????n v??? theo b??n s???',
  `retail_quantities` bigint(20) NOT NULL COMMENT 's??? l?????ng ????n v??? theo b??n bu??n',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `med_warehouses_details`
--

LOCK TABLES `med_warehouses_details` WRITE;
/*!40000 ALTER TABLE `med_warehouses_details` DISABLE KEYS */;
INSERT INTO `med_warehouses_details` VALUES (20,35,2,200,5996),(21,35,4,200,1100);
/*!40000 ALTER TABLE `med_warehouses_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_positions`
--

DROP TABLE IF EXISTS `menu_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_positions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `users_creator_id` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_positions`
--

LOCK TABLES `menu_positions` WRITE;
/*!40000 ALTER TABLE `menu_positions` DISABLE KEYS */;
INSERT INTO `menu_positions` VALUES (1,'Menu Dashboard',1,'2019-09-13 15:55:13',_binary ''),(2,'Menu con',1,'2019-09-13 15:55:16',_binary ''),(3,'V??? tr?? Menu Bottom',1,'2019-09-13 15:55:19',_binary ''),(4,'V?? tr??? Menu TOP',1,'2019-09-13 15:57:51',_binary '');
/*!40000 ALTER TABLE `menu_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `sites_id` bigint(20) NOT NULL,
  `url` varchar(300) DEFAULT NULL,
  `icon` varchar(20) DEFAULT NULL,
  `parent_id` bigint(20) NOT NULL,
  `menu_positions_id` bigint(20) NOT NULL,
  `order_by` int(11) NOT NULL,
  `users_creator_id` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_sites_index` (`name`,`sites_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'T???ng quan',1,'/dashboard','dashboard',0,1,1,1,'2019-09-14 09:21:18',_binary ''),(2,'Qu???n l?? h??? th???ng',1,'/system','form',0,1,2,1,'2019-09-14 11:06:46',_binary ''),(3,'Qu???n l?? t??i kho???n',1,'/system/users',NULL,2,1,2,1,'2019-09-14 11:07:31',_binary ''),(4,'Qu???n l?? menu',1,'/system/menus',NULL,37,1,1,1,'2019-09-14 11:08:11',_binary ''),(5,'Qu???n l?? danh m???c',1,'/category','form',0,1,5,1,'2019-09-17 12:00:56',_binary ''),(6,'Qu???n l?? chuy??n m???c',1,'/category/categorys',NULL,37,1,10,1,'2019-09-18 09:12:47',_binary ''),(7,'Qu???n l?? quy???n m???u',1,'/system/rolesTemplates',NULL,2,1,4,1,'2019-09-18 10:28:34',_binary ''),(8,'Qu???n l?? nh??m t??i kho???n ',1,'/system/groupUsers',NULL,2,1,3,1,'2019-09-18 10:30:59',_binary ''),(9,'Qu???n l?? T???nh/Th??nh ph???',1,'/category/province',NULL,5,1,1,1,'2019-09-18 10:33:01',_binary ''),(10,'Qu???n l?? Qu???n/Huy???n',1,'/category/district',NULL,5,1,2,1,'2019-09-18 10:33:57',_binary ''),(11,'Qu???n l?? Ph?????ng/X??',1,'/category/ward',NULL,5,1,3,1,'2019-09-18 10:35:00',_binary ''),(12,'Qu???n l?? th?? vi???n giao di???n',1,'/category/templates',NULL,37,1,4,1,'2019-09-18 10:36:02',_binary ''),(13,'Qu???n l?? website',1,'/category/website',NULL,37,1,9,1,'2019-09-18 10:37:06',_binary ''),(14,'Qu???n l?? nh??m c?? s??? y t???',1,'/category/groupPlace',NULL,59,1,3,1,'2019-09-18 10:38:11',_binary ''),(15,'Qu???n l?? v??? tr?? menu',1,'/category/menuPositions',NULL,37,1,2,1,'2019-09-18 10:38:37',_binary ''),(16,'Qu???n l?? c?? s??? y t???',1,'/category/place',NULL,59,1,6,1,'2019-09-18 10:39:26',_binary ''),(17,'Qu???n l?? tin t???c',1,'/category/news',NULL,37,1,3,1,'2019-09-18 10:40:13',_binary ''),(18,'Qu???n l?? nh??m website',1,'/category/groupWebsites',NULL,46,1,5,1,'2019-09-18 10:41:00',_binary ''),(19,'Qu???n l?? qu???ng c??o',1,'/category/ad',NULL,37,1,6,1,'2019-09-18 10:42:20',_binary ''),(20,'Qu???n l?? v??? tr?? qu???ng c??o',1,'/category/adsPosition',NULL,37,1,8,1,'2019-09-18 10:43:47',_binary ''),(21,'Qu???n l?? lo???i qu???ng c??o',1,'/category/adstype',NULL,37,1,7,1,'2019-09-18 10:44:32',_binary ''),(22,'Qu???n l?? giao di???n danh m???c',1,'/category/templateLayouts',NULL,37,1,5,1,'2019-09-18 10:45:37',_binary ''),(27,'Qu???n l?? nh??m nh?? cung c???p',1,'/category/groupSuppliers',NULL,57,1,1,1,'2019-09-24 14:07:35',_binary ''),(28,'Qu???n l?? nh??m nh?? s???n xu???t',1,'/category/groupProducers',NULL,57,1,3,1,'2019-09-24 14:08:37',_binary ''),(29,'Qu???n l?? ????n v??? t??nh',1,'/category/units',NULL,33,1,12,1,'2019-09-24 14:09:32',_binary ''),(30,'Qu???n l?? quy c??ch ????ng g??i',1,'/category/packages',NULL,33,1,11,1,'2019-09-24 14:10:12',_binary ''),(31,'Qu???n l?? nh??m thu???c',1,'/category/groupMedicines',NULL,33,1,9,1,'2019-09-24 14:11:05',_binary ''),(32,'Qu???n l?? thu???c',1,'/category/medicines',NULL,33,1,7,1,'2019-09-24 14:12:02',_binary ''),(33,'NT - Danh m???c',1,'/customers','form',0,1,6,1,'2019-09-24 14:13:18',_binary ''),(34,'Qu???n l?? nh??m kh??ch h??ng',1,'/customers/groupCustomers',NULL,56,1,1,1,'2019-09-24 14:14:37',_binary ''),(35,'Qu???n l?? kh??ch h??ng ',1,'/customers/customers',NULL,56,1,2,1,'2019-09-24 14:18:03',_binary ''),(36,'Qu???n l?? ph????ng th???c thanh to??n',1,'/category/paymentMethods',NULL,46,1,4,1,'2019-09-24 17:16:58',_binary ''),(37,'Qu???n l?? n???i dung website',1,'/importExport','form',0,1,7,1,'2019-09-25 08:36:21',_binary ''),(38,'Qu???n l?? kho thu???c',1,'/importExport/warehouses',NULL,58,1,6,1,'2019-09-25 08:40:47',_binary ''),(39,'Qu???n l?? phi???u nh???p thu???c',1,'/importExport/receipts',NULL,58,1,5,1,'2019-09-25 08:41:55',_binary ''),(40,'Qu???n l?? b??n thu???c',1,'/importExport/issues',NULL,58,1,7,1,'2019-09-25 08:42:58',_binary ''),(41,'Qu???n l?? v??? tr?? thu???c',1,'/category/medicineLocations',NULL,33,1,10,1,'2019-09-25 08:44:29',_binary ''),(42,'Qu???n l?? lo???i thu???c',1,'/category/medTypes',NULL,33,1,8,1,'2019-09-25 08:46:34',_binary ''),(43,'Qu???n l?? nh?? s???n xu???t',1,'/category/producers',NULL,57,1,4,1,'2019-09-25 14:45:30',_binary ''),(44,'Qu???n l?? nh?? cung c???p',1,'/category/suppliers',NULL,57,1,2,1,'2019-09-25 14:46:56',_binary ''),(45,'Qu???n l?? ph??ng kh??m',1,NULL,NULL,0,1,9,29,'2019-09-30 09:08:09',_binary '\0'),(46,'Qu???n l?? chung',1,'/general','form',0,1,4,29,'2019-09-30 09:23:28',_binary ''),(47,'NT - B??o c??o doanh thu',1,'/reports','form',0,1,13,1,'2019-09-30 11:32:55',_binary ''),(48,'B??o c??o doanh thu chi ti???t',1,'/reports/detail',NULL,47,1,1,1,'2019-09-30 11:34:12',_binary ''),(49,'B??o c??o t???ng h???p',1,'/reports/aggregation',NULL,47,1,2,1,'2019-09-30 11:36:49',_binary ''),(50,'B??o c??o theo nh??n vi??n',1,'/reports/staff',NULL,47,1,3,1,'2019-09-30 11:39:25',_binary ''),(51,'B??o c??o theo kh??ch h??ng',1,'/reports/customer',NULL,47,1,4,1,'2019-09-30 11:40:42',_binary ''),(52,'B??o c??o theo b??c s??',1,'/reports/doctor',NULL,47,1,5,1,'2019-09-30 16:22:23',_binary ''),(53,'B??o c??o theo nh?? cung c???p',1,'/reports/supplier',NULL,47,1,6,1,'2019-09-30 16:25:01',_binary ''),(54,'B??o c??o theo thu???c',1,'/reports/medicine',NULL,47,1,7,1,'2019-09-30 16:27:08',_binary ''),(55,'abc',14,'/lien-he-24-22211',NULL,64,1,19,28,'2019-10-02 10:04:26',_binary ''),(56,'NT - Kh??ch h??ng',1,'/NT-khachhang','form',0,1,8,1,'2019-10-06 10:40:53',_binary ''),(57,'NT -Nh?? CC - S???n xu???t',1,'/NCC','form',0,1,10,1,'2019-10-06 10:56:24',_binary ''),(58,'NT - Nh???p/Xu???t thu???c',1,'/quanlykho','form',0,1,11,1,'2019-10-06 11:02:49',_binary ''),(59,'Qu???n l?? th??ng tin c?? s??? y t???',1,'/quanlythongtincoso','form',0,1,3,1,'2019-10-06 11:26:56',_binary ''),(60,'NT - Ti???n ??ch',1,'/utilities','form',0,1,12,1,'2019-10-06 14:12:09',_binary ''),(61,'C???nh b??o thu???c h???t',1,'/utilities/medicine',NULL,60,1,1,1,'2019-10-07 09:25:29',_binary ''),(62,'C???nh b??o thu???c s???p h???t h???n',1,'/utilities/medicineExpired',NULL,60,1,2,1,'2019-10-07 09:26:57',_binary ''),(63,'Trang ch???',14,'/',NULL,0,4,14,1,'2019-10-07 09:44:52',_binary ''),(64,'T??nh n??ng',14,'/tinh-nang-21',NULL,0,4,15,1,'2019-10-07 12:22:54',_binary ''),(65,'B???ng gi??',14,'/bang-gia-22',NULL,0,4,16,1,'2019-10-07 13:30:11',_binary ''),(66,'H??? tr???',14,'/ho-tro-23',NULL,0,4,17,1,'2019-10-07 13:30:56',_binary ''),(67,'Li??n h???',14,'/lien-he-24',NULL,0,4,18,1,'2019-10-07 14:14:50',_binary ''),(68,'Danh m???c 1',15,'http://pharmacy.connectcare.vn/category/danhmuc1',NULL,0,2,1,32,'2019-10-11 08:35:18',_binary '');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `open_shedules`
--

DROP TABLE IF EXISTS `open_shedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_shedules` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `places_id` bigint(20) NOT NULL,
  `weekday` varchar(200) DEFAULT NULL,
  `open` int(11) DEFAULT NULL,
  `close` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_shedules`
--

LOCK TABLES `open_shedules` WRITE;
/*!40000 ALTER TABLE `open_shedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `open_shedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_methods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT '-T??n duy nh???t trong b???ng',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `users_creator_id` bigint(20) NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_methods`
--

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
INSERT INTO `payment_methods` VALUES (1,'Ti???n m???t','2019-09-25 14:55:48',1,_binary ''),(2,'V?? ??i???n t??? MOMO','2019-09-25 14:56:04',1,_binary ''),(3,'Thanh to??n qua c???ng ??i???n t???','2019-09-25 14:56:09',1,_binary ''),(4,'Th??? t??n d???ng','2019-09-25 14:56:18',1,_binary ''),(5,'v?? ??i???n t??? mobile banking','2019-09-25 17:07:41',28,_binary ''),(6,'Ship COD','2019-09-27 10:04:31',28,_binary ''),(7,'Thanh to??n qua ??i???n tho???i','2019-09-27 11:05:48',28,_binary ''),(8,'VNPay','2019-10-07 09:29:56',28,_binary ''),(9,'M?? QR','2019-10-07 09:30:04',28,_binary '');
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `places` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `mobile` varchar(12) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `representative` varchar(100) DEFAULT NULL,
  `phone_of_representative` varchar(12) DEFAULT NULL,
  `tax_code` varchar(20) DEFAULT NULL,
  `place_code` varchar(20) DEFAULT NULL,
  `username_of_place` varchar(20) NOT NULL,
  `password_of_place` varchar(200) NOT NULL,
  `users_creator_id` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `group_places_id` bigint(20) NOT NULL,
  `wards_id` bigint(20) NOT NULL,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_index` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places`
--

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
INSERT INTO `places` VALUES (35,'Qu???y thu???c Thu Loan','0339943399','C???m 6, x?? T??n L???p, huy???n ??an Ph?????ng, th??nh ph??? H?? N???i (nh?? ??ng L?? Ti???n Li??n)','Nguy???n Th??? Thu Loan','0339943399',NULL,'01-004370','hni04_2769_admin','ThuLoan123',1,'2019-09-24 16:31:38',19,81,_binary ''),(36,'C?? s??? y t??? 1','0965606156','87 ch??a L??ng','Bug','0965606156',NULL,NULL,'abc','abc',1,'2019-09-25 09:36:40',19,79,_binary ''),(37,'C?? s??? y t??? 2','0902150091','  ','Nguy???n V??n A','0902150091',NULL,NULL,'min','123',1,'2019-09-30 15:51:55',1,23,_binary ''),(38,'CTY C??? PH???N TRUY???N TH??NG KH???I ?????U M???I','0929890086','T??a nh?? Vinahud','V?? V??n Tuy???n','0929890086',NULL,NULL,'9834382','342432',1,'2019-10-02 21:45:38',29,23,_binary ''),(39,'C?? s??? y t??? 3','84965606156','s??? 9','nguy???n th??? huy???n trang','84965606156',NULL,NULL,'trang','trang',1,'2019-10-10 10:07:55',19,24,_binary '\0');
/*!40000 ALTER TABLE `places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places_users`
--

DROP TABLE IF EXISTS `places_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `places_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `places_id` bigint(20) NOT NULL,
  `users_id` bigint(200) NOT NULL,
  `users_creator_id` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=456 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places_users`
--

LOCK TABLES `places_users` WRITE;
/*!40000 ALTER TABLE `places_users` DISABLE KEYS */;
INSERT INTO `places_users` VALUES (435,35,1,1,'2019-09-25 10:42:02',_binary ''),(436,36,1,1,'2019-09-25 10:42:02',_binary ''),(442,35,28,1,'2019-09-26 15:56:29',_binary ''),(443,35,27,1,'2019-09-27 09:36:43',_binary ''),(447,35,29,29,'2019-10-01 15:26:44',_binary ''),(448,36,29,29,'2019-10-01 15:26:44',_binary ''),(449,37,29,29,'2019-10-01 15:26:44',_binary ''),(452,35,32,1,'2019-10-04 09:20:43',_binary ''),(455,35,33,1,'2019-10-04 13:51:08',_binary '');
/*!40000 ALTER TABLE `places_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provinces`
--

DROP TABLE IF EXISTS `provinces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provinces` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `users_creator_id` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provinces`
--

LOCK TABLES `provinces` WRITE;
/*!40000 ALTER TABLE `provinces` DISABLE KEYS */;
INSERT INTO `provinces` VALUES (18,'H?? N???i',1,'2019-09-23 13:46:10',_binary ''),(19,'H???i D????ng',1,'2019-09-23 13:46:18',_binary ''),(20,'H??ng Y??n',1,'2019-09-23 13:46:32',_binary ''),(21,'H???i Ph??ng',1,'2019-09-23 13:46:52',_binary ''),(22,'Nam ?????nh',1,'2019-09-23 13:47:26',_binary ''),(23,'H?? Giang',1,'2019-09-23 13:47:33',_binary ''),(24,'Th??i B??nh',1,'2019-09-23 13:47:42',_binary ''),(25,'Cao B???ng',1,'2019-09-23 13:47:51',_binary ''),(26,'B???c Ninh',1,'2019-09-23 13:48:00',_binary ''),(27,'Ngh??? An',1,'2019-09-23 13:48:08',_binary ''),(28,'L??o Cai',1,'2019-09-23 13:48:14',_binary ''),(29,'H?? Nam',1,'2019-09-23 13:48:31',_binary ''),(30,'H?? T??nh',1,'2019-09-23 13:48:50',_binary ''),(31,'V??nh Ph??c',1,'2019-09-23 13:48:57',_binary ''),(32,'Y??n B??i',1,'2019-09-23 13:49:10',_binary ''),(33,'S??n La',1,'2019-09-23 13:49:19',_binary ''),(34,'Ninh B??nh',1,'2019-09-23 13:49:37',_binary ''),(35,'??i???n Bi??n',1,'2019-09-23 13:50:09',_binary ''),(36,'B???c Giang',1,'2019-09-23 13:50:24',_binary ''),(37,'Thanh H??a',1,'2019-09-23 13:50:35',_binary ''),(38,'An Giang',1,'2019-09-23 13:51:15',_binary ''),(39,'B?? R???a ',1,'2019-09-23 13:51:28',_binary ''),(40,'B???c K???n',1,'2019-09-23 13:51:38',_binary ''),(41,'B???c Li??u',1,'2019-09-23 13:51:55',_binary ''),(42,'B???n Tre',1,'2019-09-23 13:52:05',_binary ''),(43,'B??nh ?????nh',1,'2019-09-23 13:52:16',_binary ''),(44,'B??nh D????ng',1,'2019-09-23 13:52:24',_binary ''),(45,'B??nh Ph?????c',1,'2019-09-23 13:52:33',_binary ''),(46,'B??nh Thu???n',1,'2019-09-23 13:52:40',_binary ''),(47,'C?? Mau',1,'2019-09-23 13:52:50',_binary ''),(48,'?????k L???k',1,'2019-09-23 13:53:00',_binary ''),(49,'?????k N??ng',1,'2019-09-23 13:53:11',_binary ''),(50,'?????ng Nai',1,'2019-09-23 13:53:20',_binary ''),(51,'?????ng Th??p',1,'2019-09-23 13:53:29',_binary ''),(52,'Gia Lai',1,'2019-09-23 13:53:38',_binary ''),(53,'H???u Giang',1,'2019-09-23 13:53:46',_binary ''),(54,'H??a B??nh',1,'2019-09-23 13:53:55',_binary ''),(55,'Kh??nh H??a',1,'2019-09-23 13:54:04',_binary ''),(56,'Ki??n Giang',1,'2019-09-23 13:54:39',_binary ''),(57,'Kon Tum',1,'2019-09-23 13:54:47',_binary ''),(58,'Lai Ch??u',1,'2019-09-23 13:54:55',_binary ''),(59,'L??m ?????ng',1,'2019-09-23 13:55:02',_binary ''),(60,'L???ng S??n',1,'2019-09-23 13:55:10',_binary '\0'),(61,'Long An',1,'2019-09-23 13:55:19',_binary ''),(62,'Ninh Thu???n',1,'2019-09-23 13:55:28',_binary ''),(63,'Qu???ng B??nh',1,'2019-09-23 13:55:36',_binary ''),(64,'Qu???ng Nam',1,'2019-09-23 13:55:46',_binary ''),(65,'Qu???ng Ng??i',1,'2019-09-23 13:55:54',_binary ''),(66,'Qu???ng Ninh',1,'2019-09-23 13:56:13',_binary ''),(67,'Qu???ng Tr???',1,'2019-09-23 13:56:21',_binary ''),(68,'S??c Tr??ng',1,'2019-09-23 13:56:29',_binary ''),(69,'T??y Ninh',1,'2019-09-23 13:56:36',_binary ''),(70,'Th??i Nguy??n',1,'2019-09-23 13:56:51',_binary ''),(71,'Th???a Thi??n Hu???',1,'2019-09-23 13:57:00',_binary ''),(72,'Ti???n Giang',1,'2019-09-23 13:57:07',_binary ''),(73,'Tr?? Vinh',1,'2019-09-23 13:57:14',_binary ''),(74,'Tuy??n Quang',1,'2019-09-23 13:57:24',_binary ''),(75,'V??nh Long',1,'2019-09-23 13:57:33',_binary ''),(76,'Ph?? Y??n',1,'2019-09-23 13:57:41',_binary ''),(77,'C???n Th??',1,'2019-09-23 13:57:49',_binary ''),(78,'???? N???ng',1,'2019-09-23 13:57:57',_binary ''),(79,'TP HCM',1,'2019-09-23 13:58:14',_binary ''),(80,'Ph?? Th???',1,'2019-09-23 14:43:20',_binary '');
/*!40000 ALTER TABLE `provinces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `users_id` bigint(20) NOT NULL,
  `menus_id` bigint(20) NOT NULL,
  `sites_id` bigint(20) NOT NULL,
  `is_new` bit(1) NOT NULL,
  `is_delete` bit(1) NOT NULL,
  `is_view` bit(1) NOT NULL,
  `is_update` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=366 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,1,1,1,_binary '',_binary '',_binary '',_binary ''),(2,1,2,1,_binary '',_binary '',_binary '',_binary ''),(3,1,3,1,_binary '',_binary '',_binary '',_binary ''),(4,1,4,1,_binary '',_binary '',_binary '',_binary ''),(5,1,5,1,_binary '',_binary '',_binary '',_binary ''),(7,1,6,1,_binary '',_binary '',_binary '',_binary ''),(8,1,7,1,_binary '',_binary '',_binary '',_binary ''),(9,1,8,1,_binary '',_binary '',_binary '',_binary ''),(10,1,9,1,_binary '',_binary '',_binary '',_binary ''),(11,1,10,1,_binary '',_binary '',_binary '',_binary ''),(12,1,11,1,_binary '',_binary '',_binary '',_binary ''),(13,1,12,1,_binary '',_binary '',_binary '',_binary ''),(14,1,13,1,_binary '',_binary '',_binary '',_binary ''),(15,1,14,1,_binary '',_binary '',_binary '',_binary ''),(16,1,15,1,_binary '',_binary '',_binary '',_binary ''),(17,1,16,1,_binary '',_binary '',_binary '',_binary ''),(18,1,17,1,_binary '',_binary '',_binary '',_binary ''),(19,1,18,1,_binary '',_binary '',_binary '',_binary ''),(20,1,19,1,_binary '',_binary '',_binary '',_binary ''),(21,1,20,1,_binary '',_binary '',_binary '',_binary ''),(22,1,21,1,_binary '',_binary '',_binary '',_binary ''),(23,1,22,1,_binary '',_binary '',_binary '',_binary ''),(24,12,1,1,_binary '\0',_binary '\0',_binary '',_binary '\0'),(25,12,2,1,_binary '\0',_binary '\0',_binary '',_binary '\0'),(26,12,3,1,_binary '\0',_binary '\0',_binary '',_binary '\0'),(27,12,4,1,_binary '\0',_binary '\0',_binary '',_binary '\0'),(28,12,5,1,_binary '\0',_binary '\0',_binary '',_binary '\0'),(29,12,6,1,_binary '\0',_binary '\0',_binary '',_binary '\0'),(30,12,7,1,_binary '\0',_binary '\0',_binary '',_binary '\0'),(31,12,8,1,_binary '\0',_binary '\0',_binary '',_binary '\0'),(32,12,9,1,_binary '\0',_binary '\0',_binary '',_binary '\0'),(33,12,10,1,_binary '\0',_binary '\0',_binary '',_binary '\0'),(34,12,11,1,_binary '\0',_binary '\0',_binary '',_binary '\0'),(35,12,12,1,_binary '\0',_binary '\0',_binary '',_binary '\0'),(36,12,13,1,_binary '\0',_binary '\0',_binary '',_binary '\0'),(37,12,14,1,_binary '\0',_binary '\0',_binary '',_binary '\0'),(38,12,15,1,_binary '\0',_binary '\0',_binary '',_binary '\0'),(39,12,16,1,_binary '\0',_binary '\0',_binary '',_binary '\0'),(40,12,17,1,_binary '\0',_binary '\0',_binary '',_binary '\0'),(41,12,18,1,_binary '\0',_binary '\0',_binary '',_binary '\0'),(42,12,19,1,_binary '\0',_binary '\0',_binary '',_binary '\0'),(43,12,20,1,_binary '\0',_binary '\0',_binary '',_binary '\0'),(44,12,21,1,_binary '\0',_binary '\0',_binary '',_binary '\0'),(45,12,22,1,_binary '\0',_binary '\0',_binary '',_binary '\0'),(46,13,1,1,_binary '',_binary '',_binary '',_binary ''),(47,13,2,8,_binary '',_binary '',_binary '',_binary ''),(48,13,3,1,_binary '',_binary '',_binary '',_binary ''),(49,13,4,1,_binary '',_binary '',_binary '',_binary ''),(50,13,5,2,_binary '',_binary '',_binary '',_binary ''),(51,13,6,1,_binary '',_binary '',_binary '',_binary ''),(52,13,7,1,_binary '',_binary '',_binary '',_binary ''),(53,13,8,1,_binary '',_binary '',_binary '',_binary ''),(54,13,9,1,_binary '',_binary '',_binary '',_binary ''),(55,13,10,1,_binary '',_binary '',_binary '',_binary ''),(56,13,11,1,_binary '',_binary '',_binary '',_binary ''),(57,13,12,1,_binary '',_binary '',_binary '',_binary ''),(58,13,13,1,_binary '',_binary '',_binary '',_binary ''),(59,13,14,1,_binary '',_binary '',_binary '',_binary ''),(60,13,15,1,_binary '',_binary '',_binary '',_binary ''),(61,13,16,1,_binary '',_binary '',_binary '',_binary ''),(62,13,17,1,_binary '',_binary '',_binary '',_binary ''),(63,13,18,1,_binary '',_binary '',_binary '',_binary ''),(64,13,19,1,_binary '',_binary '',_binary '',_binary ''),(65,13,20,1,_binary '',_binary '',_binary '',_binary ''),(66,13,21,1,_binary '',_binary '',_binary '',_binary ''),(67,13,22,1,_binary '',_binary '',_binary '',_binary ''),(68,13,25,9,_binary '',_binary '',_binary '',_binary ''),(69,13,26,8,_binary '',_binary '',_binary '',_binary ''),(70,25,1,1,_binary '',_binary '',_binary '',_binary ''),(71,25,2,8,_binary '',_binary '',_binary '',_binary ''),(72,25,3,1,_binary '',_binary '',_binary '',_binary ''),(73,25,4,1,_binary '',_binary '',_binary '',_binary ''),(74,25,5,2,_binary '',_binary '',_binary '',_binary ''),(75,25,6,1,_binary '',_binary '',_binary '',_binary ''),(76,25,7,1,_binary '',_binary '',_binary '',_binary ''),(77,25,8,1,_binary '',_binary '',_binary '',_binary ''),(78,25,9,1,_binary '',_binary '',_binary '',_binary ''),(79,25,10,1,_binary '',_binary '',_binary '',_binary ''),(80,25,11,1,_binary '',_binary '',_binary '',_binary ''),(81,25,12,1,_binary '',_binary '',_binary '',_binary ''),(82,25,13,1,_binary '',_binary '',_binary '',_binary ''),(83,25,14,1,_binary '',_binary '',_binary '',_binary ''),(84,25,15,1,_binary '',_binary '',_binary '',_binary ''),(85,25,16,1,_binary '',_binary '',_binary '',_binary ''),(86,25,17,1,_binary '',_binary '',_binary '',_binary ''),(87,25,18,1,_binary '',_binary '',_binary '',_binary ''),(88,25,19,1,_binary '',_binary '',_binary '',_binary ''),(89,25,20,1,_binary '',_binary '',_binary '',_binary ''),(90,25,21,1,_binary '',_binary '',_binary '',_binary ''),(91,25,22,1,_binary '',_binary '',_binary '',_binary ''),(92,25,25,9,_binary '',_binary '',_binary '',_binary ''),(93,25,26,8,_binary '',_binary '',_binary '',_binary ''),(94,27,1,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(95,27,2,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(96,27,3,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(97,27,4,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(98,27,5,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(99,27,6,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(100,27,7,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(101,27,8,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(102,27,9,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(103,27,10,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(104,27,11,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(105,27,12,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(106,27,13,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(107,27,14,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(108,27,15,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(109,27,16,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(110,27,17,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(111,27,18,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(112,27,19,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(113,27,20,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(114,27,21,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(115,27,22,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(116,1,27,1,_binary '',_binary '',_binary '',_binary ''),(117,1,28,1,_binary '',_binary '',_binary '',_binary ''),(118,1,29,1,_binary '',_binary '',_binary '',_binary ''),(119,1,30,1,_binary '',_binary '',_binary '',_binary ''),(120,1,31,1,_binary '',_binary '',_binary '',_binary ''),(121,1,32,1,_binary '',_binary '',_binary '',_binary ''),(122,1,33,1,_binary '',_binary '',_binary '',_binary ''),(123,1,34,1,_binary '',_binary '',_binary '',_binary ''),(124,1,35,1,_binary '',_binary '',_binary '',_binary ''),(125,28,1,1,_binary '',_binary '',_binary '',_binary ''),(126,28,2,1,_binary '',_binary '',_binary '',_binary ''),(127,28,3,1,_binary '',_binary '',_binary '',_binary ''),(128,28,4,1,_binary '',_binary '',_binary '',_binary ''),(129,28,5,1,_binary '',_binary '',_binary '',_binary ''),(130,28,6,1,_binary '',_binary '',_binary '',_binary ''),(131,28,7,1,_binary '',_binary '',_binary '',_binary ''),(132,28,8,1,_binary '',_binary '',_binary '',_binary ''),(133,28,9,1,_binary '',_binary '',_binary '',_binary ''),(134,28,10,1,_binary '',_binary '',_binary '',_binary ''),(135,28,11,1,_binary '',_binary '',_binary '',_binary ''),(136,28,12,1,_binary '',_binary '',_binary '',_binary ''),(137,28,13,1,_binary '',_binary '',_binary '',_binary ''),(138,28,14,1,_binary '',_binary '',_binary '',_binary ''),(139,28,15,1,_binary '',_binary '',_binary '',_binary ''),(140,28,16,1,_binary '',_binary '',_binary '',_binary ''),(141,28,17,1,_binary '',_binary '',_binary '',_binary ''),(142,28,18,1,_binary '',_binary '',_binary '',_binary ''),(143,28,19,1,_binary '',_binary '',_binary '',_binary ''),(144,28,20,1,_binary '',_binary '',_binary '',_binary ''),(145,28,21,1,_binary '',_binary '',_binary '',_binary ''),(146,28,22,1,_binary '',_binary '',_binary '',_binary ''),(147,28,27,1,_binary '',_binary '',_binary '',_binary ''),(148,28,28,1,_binary '',_binary '',_binary '',_binary ''),(149,28,29,1,_binary '',_binary '',_binary '',_binary ''),(150,28,30,1,_binary '',_binary '',_binary '',_binary ''),(151,28,31,1,_binary '',_binary '',_binary '',_binary ''),(152,28,32,1,_binary '',_binary '',_binary '',_binary ''),(153,28,33,1,_binary '',_binary '',_binary '',_binary ''),(154,28,34,1,_binary '',_binary '',_binary '',_binary ''),(155,28,35,1,_binary '',_binary '',_binary '',_binary ''),(156,28,36,1,_binary '',_binary '',_binary '',_binary ''),(157,27,27,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(158,27,28,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(159,27,29,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(160,27,30,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(161,27,31,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(162,27,32,1,_binary '',_binary '',_binary '',_binary ''),(163,27,33,1,_binary '',_binary '',_binary '',_binary ''),(164,27,34,1,_binary '',_binary '',_binary '',_binary ''),(165,27,35,1,_binary '',_binary '',_binary '',_binary ''),(166,27,36,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(167,29,1,1,_binary '',_binary '\0',_binary '',_binary ''),(168,29,2,1,_binary '',_binary '\0',_binary '',_binary ''),(169,29,3,1,_binary '',_binary '\0',_binary '',_binary ''),(170,29,4,1,_binary '',_binary '\0',_binary '',_binary ''),(171,29,5,1,_binary '',_binary '\0',_binary '',_binary ''),(172,29,6,1,_binary '',_binary '\0',_binary '',_binary ''),(173,29,7,1,_binary '',_binary '\0',_binary '',_binary ''),(174,29,8,1,_binary '',_binary '\0',_binary '',_binary ''),(175,29,9,1,_binary '',_binary '\0',_binary '',_binary ''),(176,29,10,1,_binary '',_binary '\0',_binary '',_binary ''),(177,29,11,1,_binary '',_binary '\0',_binary '',_binary ''),(178,29,12,1,_binary '',_binary '\0',_binary '',_binary ''),(179,29,13,1,_binary '',_binary '\0',_binary '',_binary ''),(180,29,14,1,_binary '',_binary '\0',_binary '',_binary ''),(181,29,15,1,_binary '',_binary '\0',_binary '',_binary ''),(182,29,16,1,_binary '',_binary '\0',_binary '',_binary ''),(183,29,17,1,_binary '',_binary '\0',_binary '',_binary ''),(184,29,18,1,_binary '',_binary '\0',_binary '',_binary ''),(185,29,19,1,_binary '',_binary '\0',_binary '',_binary ''),(186,29,20,1,_binary '',_binary '\0',_binary '',_binary ''),(187,29,21,1,_binary '',_binary '\0',_binary '',_binary ''),(188,29,22,1,_binary '',_binary '\0',_binary '',_binary ''),(189,29,27,1,_binary '',_binary '\0',_binary '',_binary ''),(190,29,28,1,_binary '',_binary '\0',_binary '',_binary ''),(191,29,29,1,_binary '',_binary '\0',_binary '',_binary ''),(192,29,30,1,_binary '',_binary '\0',_binary '',_binary ''),(193,29,31,1,_binary '',_binary '\0',_binary '',_binary ''),(194,29,32,1,_binary '',_binary '\0',_binary '',_binary ''),(195,29,33,1,_binary '',_binary '\0',_binary '',_binary ''),(196,29,34,1,_binary '',_binary '\0',_binary '',_binary ''),(197,29,35,1,_binary '',_binary '\0',_binary '',_binary ''),(198,29,36,1,_binary '',_binary '\0',_binary '',_binary ''),(199,28,37,1,_binary '',_binary '',_binary '',_binary ''),(200,28,38,1,_binary '',_binary '',_binary '',_binary ''),(201,28,39,1,_binary '',_binary '',_binary '',_binary ''),(202,28,40,1,_binary '',_binary '',_binary '',_binary ''),(203,28,41,1,_binary '',_binary '',_binary '',_binary ''),(204,28,42,1,_binary '',_binary '',_binary '',_binary ''),(205,27,37,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(206,27,38,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(207,27,39,1,_binary '',_binary '',_binary '',_binary ''),(208,28,43,1,_binary '',_binary '',_binary '',_binary ''),(209,28,44,1,_binary '',_binary '',_binary '',_binary ''),(210,29,37,1,_binary '',_binary '\0',_binary '',_binary ''),(211,29,38,1,_binary '',_binary '\0',_binary '',_binary ''),(212,29,39,1,_binary '',_binary '\0',_binary '',_binary ''),(213,29,40,1,_binary '',_binary '\0',_binary '',_binary ''),(214,29,41,1,_binary '',_binary '\0',_binary '',_binary ''),(215,29,42,1,_binary '',_binary '\0',_binary '',_binary ''),(216,29,43,1,_binary '',_binary '\0',_binary '',_binary ''),(217,29,44,1,_binary '',_binary '\0',_binary '',_binary ''),(218,1,44,1,_binary '',_binary '',_binary '',_binary ''),(219,1,43,1,_binary '',_binary '',_binary '',_binary ''),(220,29,45,1,_binary '',_binary '\0',_binary '',_binary ''),(221,29,46,1,_binary '',_binary '\0',_binary '',_binary ''),(222,1,47,1,_binary '',_binary '',_binary '',_binary ''),(223,1,48,1,_binary '',_binary '',_binary '',_binary ''),(224,1,49,1,_binary '',_binary '',_binary '',_binary ''),(225,1,50,1,_binary '',_binary '',_binary '',_binary ''),(226,1,51,1,_binary '',_binary '',_binary '',_binary ''),(227,1,37,1,_binary '',_binary '',_binary '',_binary ''),(228,28,48,1,_binary '',_binary '',_binary '',_binary ''),(229,28,47,1,_binary '',_binary '',_binary '',_binary ''),(230,28,49,1,_binary '',_binary '',_binary '',_binary ''),(231,28,46,1,_binary '',_binary '',_binary '',_binary ''),(232,28,50,1,_binary '',_binary '',_binary '',_binary ''),(233,28,51,1,_binary '',_binary '',_binary '',_binary ''),(234,1,52,1,_binary '',_binary '',_binary '',_binary ''),(235,1,53,1,_binary '',_binary '',_binary '',_binary ''),(236,1,54,1,_binary '',_binary '',_binary '',_binary ''),(237,1,36,1,_binary '',_binary '',_binary '',_binary ''),(238,1,38,1,_binary '',_binary '',_binary '',_binary ''),(239,1,39,1,_binary '',_binary '',_binary '',_binary ''),(240,1,40,1,_binary '',_binary '',_binary '',_binary ''),(241,1,41,1,_binary '',_binary '',_binary '',_binary ''),(242,1,42,1,_binary '',_binary '',_binary '',_binary ''),(243,1,46,1,_binary '',_binary '',_binary '',_binary ''),(244,29,47,1,_binary '',_binary '\0',_binary '',_binary ''),(245,29,48,1,_binary '',_binary '\0',_binary '',_binary ''),(246,29,49,1,_binary '',_binary '\0',_binary '',_binary ''),(247,29,50,1,_binary '',_binary '\0',_binary '',_binary ''),(248,29,51,1,_binary '',_binary '\0',_binary '',_binary ''),(249,29,52,1,_binary '',_binary '\0',_binary '',_binary ''),(250,29,53,1,_binary '',_binary '\0',_binary '',_binary ''),(251,29,54,1,_binary '',_binary '\0',_binary '',_binary ''),(252,28,52,1,_binary '',_binary '',_binary '',_binary ''),(253,28,53,1,_binary '',_binary '',_binary '',_binary ''),(254,28,54,1,_binary '',_binary '',_binary '',_binary ''),(255,33,47,1,_binary '',_binary '',_binary '',_binary ''),(256,33,54,1,_binary '',_binary '',_binary '',_binary ''),(257,33,32,1,_binary '',_binary '',_binary '',_binary ''),(258,33,33,1,_binary '',_binary '',_binary '',_binary ''),(259,33,39,1,_binary '',_binary '',_binary '',_binary ''),(260,33,40,1,_binary '',_binary '',_binary '',_binary ''),(261,32,33,1,_binary '',_binary '',_binary '',_binary ''),(262,32,31,1,_binary '',_binary '',_binary '',_binary ''),(263,32,32,1,_binary '',_binary '',_binary '',_binary ''),(264,32,30,1,_binary '',_binary '',_binary '',_binary ''),(265,32,29,1,_binary '',_binary '',_binary '',_binary ''),(266,32,28,1,_binary '',_binary '',_binary '',_binary ''),(267,32,27,1,_binary '',_binary '',_binary '',_binary ''),(268,32,34,1,_binary '',_binary '',_binary '',_binary ''),(269,32,35,1,_binary '',_binary '',_binary '',_binary ''),(270,32,38,1,_binary '',_binary '',_binary '',_binary ''),(271,32,39,1,_binary '',_binary '',_binary '',_binary ''),(272,32,40,1,_binary '',_binary '',_binary '',_binary ''),(273,32,41,1,_binary '',_binary '',_binary '',_binary ''),(274,32,42,1,_binary '',_binary '',_binary '',_binary ''),(275,32,43,1,_binary '',_binary '',_binary '',_binary ''),(276,32,44,1,_binary '',_binary '',_binary '',_binary ''),(277,32,47,1,_binary '',_binary '',_binary '',_binary ''),(278,32,48,1,_binary '',_binary '',_binary '',_binary ''),(279,32,49,1,_binary '',_binary '',_binary '',_binary ''),(280,32,50,1,_binary '',_binary '',_binary '',_binary ''),(281,32,51,1,_binary '',_binary '',_binary '',_binary ''),(282,32,52,1,_binary '',_binary '',_binary '',_binary ''),(283,32,53,1,_binary '',_binary '',_binary '',_binary ''),(284,32,54,1,_binary '',_binary '',_binary '',_binary ''),(285,32,15,1,_binary '',_binary '',_binary '',_binary ''),(286,32,4,1,_binary '',_binary '',_binary '',_binary ''),(287,32,37,1,_binary '',_binary '',_binary '',_binary ''),(288,1,56,1,_binary '',_binary '',_binary '',_binary ''),(289,1,57,1,_binary '',_binary '',_binary '',_binary ''),(290,1,58,1,_binary '',_binary '',_binary '',_binary ''),(291,32,56,1,_binary '',_binary '',_binary '',_binary ''),(292,32,57,1,_binary '',_binary '',_binary '',_binary ''),(293,32,58,1,_binary '',_binary '',_binary '',_binary ''),(294,32,59,1,_binary '',_binary '',_binary '',_binary ''),(295,1,59,1,_binary '',_binary '',_binary '',_binary ''),(296,32,16,1,_binary '',_binary '',_binary '',_binary ''),(297,33,58,1,_binary '',_binary '',_binary '',_binary ''),(298,33,56,1,_binary '',_binary '',_binary '',_binary ''),(299,33,35,1,_binary '',_binary '',_binary '',_binary ''),(300,33,34,1,_binary '',_binary '',_binary '',_binary ''),(301,33,50,1,_binary '',_binary '',_binary '',_binary ''),(302,28,56,1,_binary '',_binary '',_binary '',_binary ''),(303,28,57,1,_binary '',_binary '',_binary '',_binary ''),(304,28,58,1,_binary '',_binary '',_binary '',_binary ''),(305,28,59,1,_binary '',_binary '',_binary '',_binary ''),(306,28,60,1,_binary '',_binary '',_binary '',_binary ''),(307,29,56,1,_binary '',_binary '\0',_binary '',_binary ''),(308,29,57,1,_binary '',_binary '\0',_binary '',_binary ''),(309,29,58,1,_binary '',_binary '\0',_binary '',_binary ''),(310,29,59,1,_binary '',_binary '\0',_binary '',_binary ''),(311,29,60,1,_binary '',_binary '\0',_binary '',_binary ''),(312,1,60,1,_binary '',_binary '',_binary '',_binary ''),(313,1,61,1,_binary '',_binary '',_binary '',_binary ''),(314,1,62,1,_binary '',_binary '',_binary '',_binary ''),(315,27,40,1,_binary '',_binary '',_binary '',_binary ''),(316,27,41,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(317,27,42,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(318,27,43,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(319,27,44,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(320,27,46,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(321,27,47,1,_binary '',_binary '',_binary '',_binary ''),(322,27,48,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(323,27,49,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(324,27,50,1,_binary '',_binary '',_binary '',_binary ''),(325,27,51,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(326,27,52,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(327,27,53,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(328,27,54,1,_binary '',_binary '',_binary '',_binary ''),(329,27,56,1,_binary '',_binary '',_binary '',_binary ''),(330,27,57,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(331,27,58,1,_binary '',_binary '',_binary '',_binary ''),(332,27,59,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(333,27,60,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(334,27,61,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(335,27,62,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(336,27,63,14,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(337,27,64,14,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(338,27,65,14,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(339,27,66,14,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(340,27,67,14,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(341,29,61,1,_binary '',_binary '\0',_binary '\0',_binary ''),(342,29,62,1,_binary '',_binary '\0',_binary '\0',_binary ''),(343,29,63,14,_binary '',_binary '\0',_binary '\0',_binary ''),(344,29,64,14,_binary '',_binary '\0',_binary '\0',_binary ''),(345,29,65,14,_binary '',_binary '\0',_binary '\0',_binary ''),(346,29,66,14,_binary '',_binary '\0',_binary '\0',_binary ''),(347,29,67,14,_binary '',_binary '\0',_binary '\0',_binary ''),(348,32,60,1,_binary '',_binary '',_binary '',_binary ''),(349,32,61,1,_binary '',_binary '',_binary '',_binary ''),(350,32,62,1,_binary '',_binary '',_binary '',_binary ''),(351,32,17,1,_binary '',_binary '',_binary '',_binary ''),(352,32,19,1,_binary '',_binary '',_binary '',_binary ''),(353,32,6,1,_binary '',_binary '',_binary '',_binary ''),(354,32,5,1,_binary '',_binary '',_binary '',_binary ''),(355,32,9,1,_binary '',_binary '',_binary '',_binary ''),(356,32,10,1,_binary '',_binary '',_binary '',_binary ''),(357,32,11,1,_binary '',_binary '',_binary '',_binary ''),(358,32,12,1,_binary '',_binary '',_binary '',_binary ''),(359,32,13,1,_binary '',_binary '',_binary '',_binary ''),(360,32,14,1,_binary '',_binary '',_binary '',_binary ''),(361,32,18,1,_binary '',_binary '',_binary '',_binary ''),(362,32,20,1,_binary '',_binary '',_binary '',_binary ''),(363,32,21,1,_binary '',_binary '',_binary '',_binary ''),(364,32,22,1,_binary '',_binary '',_binary '',_binary ''),(365,32,36,1,_binary '',_binary '',_binary '',_binary '');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_templates`
--

DROP TABLE IF EXISTS `roles_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_templates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `groups_users_id` bigint(20) NOT NULL,
  `users_id` bigint(20) DEFAULT NULL,
  `menus_id` bigint(20) NOT NULL,
  `sites_id` bigint(20) NOT NULL,
  `is_new` bit(1) NOT NULL,
  `is_delete` bit(1) NOT NULL,
  `is_view` bit(1) NOT NULL,
  `is_update` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_templates`
--

LOCK TABLES `roles_templates` WRITE;
/*!40000 ALTER TABLE `roles_templates` DISABLE KEYS */;
INSERT INTO `roles_templates` VALUES (1,1,1,1,1,_binary '',_binary '',_binary '',_binary ''),(2,1,NULL,2,1,_binary '',_binary '',_binary '',_binary ''),(3,2,NULL,1,1,_binary '',_binary '',_binary '',_binary ''),(4,2,NULL,2,1,_binary '',_binary '',_binary '',_binary ''),(5,2,NULL,3,1,_binary '',_binary '',_binary '',_binary ''),(6,2,NULL,4,1,_binary '',_binary '',_binary '',_binary ''),(7,2,NULL,5,1,_binary '',_binary '',_binary '',_binary ''),(8,2,NULL,6,1,_binary '',_binary '',_binary '',_binary ''),(9,2,NULL,7,1,_binary '',_binary '',_binary '',_binary ''),(10,2,NULL,8,1,_binary '',_binary '',_binary '',_binary ''),(11,2,NULL,9,1,_binary '',_binary '',_binary '',_binary ''),(12,2,NULL,10,1,_binary '',_binary '',_binary '',_binary ''),(13,2,NULL,11,1,_binary '',_binary '',_binary '',_binary ''),(14,2,NULL,12,1,_binary '',_binary '',_binary '',_binary ''),(15,2,NULL,13,1,_binary '',_binary '',_binary '',_binary ''),(16,2,NULL,14,1,_binary '',_binary '',_binary '',_binary ''),(17,2,NULL,15,1,_binary '',_binary '',_binary '',_binary ''),(18,2,NULL,16,1,_binary '',_binary '',_binary '',_binary ''),(19,2,NULL,17,1,_binary '',_binary '',_binary '',_binary ''),(20,2,NULL,18,1,_binary '',_binary '',_binary '',_binary ''),(21,2,NULL,19,1,_binary '',_binary '',_binary '',_binary ''),(22,2,NULL,20,1,_binary '',_binary '',_binary '',_binary ''),(23,2,NULL,21,1,_binary '',_binary '',_binary '',_binary ''),(24,2,NULL,22,1,_binary '',_binary '',_binary '',_binary ''),(32,3,NULL,26,8,_binary '',_binary '',_binary '',_binary ''),(33,3,NULL,2,8,_binary '',_binary '',_binary '',_binary ''),(55,3,NULL,1,1,_binary '',_binary '',_binary '',_binary ''),(56,3,NULL,3,1,_binary '',_binary '',_binary '',_binary ''),(57,3,NULL,4,1,_binary '',_binary '',_binary '',_binary ''),(58,3,NULL,6,1,_binary '',_binary '',_binary '',_binary ''),(59,3,NULL,7,1,_binary '',_binary '',_binary '',_binary ''),(60,3,NULL,8,1,_binary '',_binary '',_binary '',_binary ''),(61,3,NULL,9,1,_binary '',_binary '',_binary '',_binary ''),(62,3,NULL,10,1,_binary '',_binary '',_binary '',_binary ''),(63,3,NULL,11,1,_binary '',_binary '',_binary '',_binary ''),(64,3,NULL,12,1,_binary '',_binary '',_binary '',_binary ''),(65,3,NULL,13,1,_binary '',_binary '',_binary '',_binary ''),(66,3,NULL,14,1,_binary '',_binary '',_binary '',_binary ''),(67,3,NULL,15,1,_binary '',_binary '',_binary '',_binary ''),(68,3,NULL,16,1,_binary '',_binary '',_binary '',_binary ''),(69,3,NULL,17,1,_binary '',_binary '',_binary '',_binary ''),(70,3,NULL,18,1,_binary '',_binary '',_binary '',_binary ''),(71,3,NULL,19,1,_binary '',_binary '',_binary '',_binary ''),(72,3,NULL,20,1,_binary '',_binary '',_binary '',_binary ''),(73,3,NULL,21,1,_binary '',_binary '',_binary '',_binary ''),(74,3,NULL,22,1,_binary '',_binary '',_binary '',_binary ''),(75,1,NULL,25,9,_binary '',_binary '',_binary '',_binary ''),(76,2,NULL,47,1,_binary '',_binary '',_binary '',_binary ''),(77,2,NULL,48,1,_binary '',_binary '',_binary '',_binary ''),(78,2,NULL,49,1,_binary '',_binary '',_binary '',_binary ''),(79,2,NULL,50,1,_binary '',_binary '',_binary '',_binary ''),(80,2,NULL,51,1,_binary '',_binary '',_binary '',_binary ''),(81,1,NULL,47,1,_binary '\0',_binary '\0',_binary '',_binary '\0'),(82,1,NULL,48,1,_binary '\0',_binary '\0',_binary '',_binary '\0'),(83,1,NULL,49,1,_binary '\0',_binary '\0',_binary '',_binary '\0'),(84,1,NULL,50,1,_binary '\0',_binary '\0',_binary '',_binary '\0'),(85,1,NULL,51,1,_binary '\0',_binary '\0',_binary '',_binary '\0'),(86,2,NULL,33,1,_binary '',_binary '',_binary '',_binary ''),(87,2,NULL,34,1,_binary '',_binary '',_binary '',_binary ''),(88,2,NULL,35,1,_binary '',_binary '',_binary '',_binary ''),(89,2,NULL,52,1,_binary '',_binary '',_binary '',_binary ''),(90,2,NULL,53,1,_binary '',_binary '',_binary '',_binary ''),(91,2,NULL,54,1,_binary '',_binary '',_binary '',_binary ''),(92,2,NULL,56,1,_binary '',_binary '',_binary '',_binary ''),(93,2,NULL,57,1,_binary '',_binary '',_binary '',_binary ''),(94,2,NULL,58,1,_binary '',_binary '',_binary '',_binary ''),(95,2,NULL,38,1,_binary '',_binary '',_binary '',_binary ''),(96,2,NULL,39,1,_binary '',_binary '',_binary '',_binary ''),(97,2,NULL,40,1,_binary '',_binary '',_binary '',_binary ''),(98,2,NULL,41,1,_binary '',_binary '',_binary '',_binary ''),(99,2,NULL,42,1,_binary '',_binary '',_binary '',_binary ''),(100,2,NULL,43,1,_binary '',_binary '',_binary '',_binary ''),(101,2,NULL,44,1,_binary '',_binary '',_binary '',_binary ''),(102,2,NULL,46,1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(103,2,NULL,27,1,_binary '',_binary '',_binary '',_binary ''),(104,2,NULL,28,1,_binary '',_binary '',_binary '',_binary ''),(105,2,NULL,29,1,_binary '',_binary '',_binary '',_binary ''),(106,2,NULL,30,1,_binary '',_binary '',_binary '',_binary ''),(107,2,NULL,31,1,_binary '',_binary '',_binary '',_binary ''),(108,2,NULL,32,1,_binary '',_binary '',_binary '',_binary '');
/*!40000 ALTER TABLE `roles_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `url` varchar(100) DEFAULT NULL,
  `seo_keywords` varchar(200) DEFAULT NULL,
  `seo_descriptions` varchar(200) DEFAULT NULL,
  `templates_id` bigint(20) DEFAULT NULL,
  `places_id` bigint(20) DEFAULT NULL,
  `group_sites_id` bigint(20) NOT NULL,
  `users_creator_id` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,'core cms','http://pharmacy.connectcare.vn','core','core',1,36,1,1,'2019-09-12 15:11:17',_binary ''),(14,'web gi???i thi???u qu???n l?? nh?? thu???c','http://pharmacy.connectcare.vn',NULL,NULL,1,38,43,1,'2019-09-23 11:46:35',_binary ''),(15,'Ph???n m???m b??n h??ng nh?? thu???c','http://camgroup.com.vn/phan-mem/phan-mem-quan-ly-nha-thuoc-chuoi-nha-thuoc.aspx',NULL,NULL,1,35,41,29,'2019-09-25 15:38:05',_binary '');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_byCustomerID`
--

DROP TABLE IF EXISTS `t_byCustomerID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_byCustomerID` (
  `txt` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_byCustomerID`
--

LOCK TABLES `t_byCustomerID` WRITE;
/*!40000 ALTER TABLE `t_byCustomerID` DISABLE KEYS */;
INSERT INTO `t_byCustomerID` VALUES ('0');
/*!40000 ALTER TABLE `t_byCustomerID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_byMedicinesID`
--

DROP TABLE IF EXISTS `t_byMedicinesID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_byMedicinesID` (
  `txt` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_byMedicinesID`
--

LOCK TABLES `t_byMedicinesID` WRITE;
/*!40000 ALTER TABLE `t_byMedicinesID` DISABLE KEYS */;
INSERT INTO `t_byMedicinesID` VALUES ('0');
/*!40000 ALTER TABLE `t_byMedicinesID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_byUserID`
--

DROP TABLE IF EXISTS `t_byUserID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_byUserID` (
  `txt` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_byUserID`
--

LOCK TABLES `t_byUserID` WRITE;
/*!40000 ALTER TABLE `t_byUserID` DISABLE KEYS */;
INSERT INTO `t_byUserID` VALUES ('0');
/*!40000 ALTER TABLE `t_byUserID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_medicine_ExpiredDate`
--

DROP TABLE IF EXISTS `t_medicine_ExpiredDate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_medicine_ExpiredDate` (
  `txt` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_medicine_ExpiredDate`
--

LOCK TABLES `t_medicine_ExpiredDate` WRITE;
/*!40000 ALTER TABLE `t_medicine_ExpiredDate` DISABLE KEYS */;
INSERT INTO `t_medicine_ExpiredDate` VALUES ('7');
/*!40000 ALTER TABLE `t_medicine_ExpiredDate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_medicine_OutofStock`
--

DROP TABLE IF EXISTS `t_medicine_OutofStock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_medicine_OutofStock` (
  `txt` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_medicine_OutofStock`
--

LOCK TABLES `t_medicine_OutofStock` WRITE;
/*!40000 ALTER TABLE `t_medicine_OutofStock` DISABLE KEYS */;
INSERT INTO `t_medicine_OutofStock` VALUES ('35');
/*!40000 ALTER TABLE `t_medicine_OutofStock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_layouts`
--

DROP TABLE IF EXISTS `template_layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_layouts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `folder` varchar(200) NOT NULL,
  `users_creator_id` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_layouts`
--

LOCK TABLES `template_layouts` WRITE;
/*!40000 ALTER TABLE `template_layouts` DISABLE KEYS */;
INSERT INTO `template_layouts` VALUES (1,'Giao di???n 4 tin n???m ngang ti??u ????? v?? ???nh','templateLayout_6',1,'2019-09-13 14:50:55',_binary ''),(2,'Giao di???n ?????i t??c logo','templateLayout_5',1,'2019-09-13 14:51:02',_binary ''),(19,'Giao di???n 3 tin v?? 1 tin n???i b???t ki???u 3','templateLayout_4',1,'2019-09-24 16:40:51',_binary ''),(20,'Giao di???n ti??u ????? v?? n???i dung chi ti???t','templateLayout_3',29,'2019-09-26 10:57:08',_binary ''),(21,'Giao di???n nhi???u tin n???i dung v?? ???nh chia ????i','templateLayout_2',1,'2019-10-07 15:58:57',_binary ''),(22,'Giao di???n b???ng gi?? ki???u 2','templateLayout_1',1,'2019-10-08 10:20:40',_binary ''),(23,'Giao di???n 3 tin v?? 1 tin n???i b???t ki???u 2','templateLayout_7',1,'2019-10-09 16:52:16',_binary ''),(24,'Giao di???n 3 tin v?? 1 tin n???i b???t ki???u 4','templateLayout_8',1,'2019-10-09 16:52:31',_binary ''),(25,'Giao di???n 3 tin v?? 1 tin n???i b???t ki???u 1','templateLayout_9',1,'2019-10-09 16:52:43',_binary ''),(26,'Giao di???n 3 tin n???m ngang c?? ???nh ki???u 1','templateLayout_10',1,'2019-10-09 16:52:57',_binary ''),(27,'Giao di???n 1 tin k??m n???i dung','templateLayout_11',1,'2019-10-09 16:53:12',_binary ''),(28,'Giao di???n 3 tin n???m ngang c?? ???nh ki???u 2','templateLayout_12',1,'2019-10-09 16:53:29',_binary ''),(29,'Giao di???n 2 tin chia ????i m??n h??nh c?? v??ch ng??n','templateLayout_13',1,'2019-10-09 16:53:46',_binary '\0'),(30,'Giao di???n nhi???u tin c?? ph??n trang','templateLayout_14',1,'2019-10-09 16:53:59',_binary ''),(31,'Giao di???n b???ng gi?? ki???u 1','templateLayout_15',1,'2019-10-09 16:54:10',_binary '');
/*!40000 ALTER TABLE `template_layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templates`
--

DROP TABLE IF EXISTS `templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `folder` varchar(300) NOT NULL,
  `users_creator_id` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templates`
--

LOCK TABLES `templates` WRITE;
/*!40000 ALTER TABLE `templates` DISABLE KEYS */;
INSERT INTO `templates` VALUES (1,'Giao di???n website 1','template_1',1,'2019-09-13 14:31:45',_binary ''),(2,'Giao di???n website 2','template_2',1,'2019-09-13 14:31:53',_binary ''),(3,'Giao di???n website 3','template_3',1,'2019-09-13 14:32:05',_binary ''),(21,'Giao di???n website 4','template_4',1,'2019-09-24 16:39:18',_binary ''),(22,'Giao di???n website 5','template_5',1,'2019-09-24 16:40:06',_binary '');
/*!40000 ALTER TABLE `templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(12) DEFAULT NULL,
  `group_user_id` int(11) NOT NULL,
  `address` varchar(300) DEFAULT NULL,
  `parent_id` bigint(20) NOT NULL,
  `wards_id` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` bit(1) NOT NULL,
  `isLienThong` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_index` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (0,'administration','96e79218965eb72c92a549dd5a330112','administration','administration@nbm.vn','84398765432',1,'fn',-1,23,'2019-10-10 14:05:48',_binary '',_binary '\0'),(1,'admin_nbm','96e79218965eb72c92a549dd5a330112','admin','admin@nbm.vn.com','84398765432',1,'fn',0,23,'2019-09-12 15:03:34',_binary '',_binary '\0'),(27,'trang98','4297f44b13955235245b2497399d7a93','Nguy???n Th??? Huy???n Trang','nguyentrang@gmail.com','0965606156',3,'s??? 9',33,24,'2019-09-23 10:19:34',_binary '',_binary '\0'),(28,'thuy_nbm','96e79218965eb72c92a549dd5a330112','NGUY???N XU??N TH???Y','thuy@nbm.vn','0972290154',3,'r3',1,23,'2019-09-24 14:24:13',_binary '',_binary '\0'),(29,'hoannt','4297f44b13955235245b2497399d7a93','HOAN NGUY???N','HOANNT@NBM.COM.VN','84368973438',1,'Th?????ng ????nh',1,69,'2019-09-25 08:34:25',_binary '',_binary '\0'),(30,'nguyenhongnhung','e10adc3949ba59abbe56e057f20f883e','Nguy???n H???ng Nhung','nguyenhongnhung@nbm.vn','0929893435',3,'S??? nh?? 8',1,17,'2019-10-02 21:30:26',_binary '',_binary '\0'),(32,'QL_nha_thuoc','96e79218965eb72c92a549dd5a330112','Nguy???n Th??? Thanh Loan','thanhloan@gmail.com','0902150091',2,'Minh Khai',1,80,'2019-10-04 08:59:14',_binary '',_binary ''),(33,'nhan_vien','96e79218965eb72c92a549dd5a330112','Nguy???n M???nh H??ng','hungnm@gmail.com','0879232543',3,'Minh Khai',28,80,'2019-10-04 09:00:27',_binary '',_binary '\0');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wards`
--

DROP TABLE IF EXISTS `wards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wards` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `districts_id` bigint(20) NOT NULL,
  `users_creator_id` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_districts_index` (`name`,`districts_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wards`
--

LOCK TABLES `wards` WRITE;
/*!40000 ALTER TABLE `wards` DISABLE KEYS */;
INSERT INTO `wards` VALUES (14,'Ph??c X??',22,1,'2019-09-23 14:18:48',_binary ''),(15,'Ng???c H??',22,1,'2019-09-23 14:19:06',_binary ''),(16,'Qu??n Th??nh',22,1,'2019-09-23 14:19:19',_binary ''),(17,'Kim M??',22,1,'2019-09-23 14:19:39',_binary ''),(18,'Gi???ng V??',22,1,'2019-09-23 14:19:52',_binary ''),(19,'H??ng B??ng',26,1,'2019-09-23 14:20:31',_binary ''),(20,'Tr??ng Ti???n',26,1,'2019-09-23 14:20:48',_binary ''),(21,'Th???y Khu??',26,1,'2019-09-23 14:21:09',_binary ''),(22,'Quan H??a',23,1,'2019-09-23 14:21:32',_binary ''),(23,'Trung H??a',23,1,'2019-09-23 14:21:43',_binary ''),(24,'Y??n H??a',23,1,'2019-09-23 14:21:56',_binary ''),(25,'Quang Trung',24,1,'2019-09-23 14:22:24',_binary ''),(26,'C??t Linh',24,1,'2019-09-23 14:22:42',_binary ''),(27,'Ph????ng Li??n',24,1,'2019-09-23 14:23:05',_binary ''),(28,'Trung Li???t',24,1,'2019-09-23 14:23:22',_binary ''),(29,'Trung T???',24,1,'2019-09-23 14:23:37',_binary ''),(30,'Kim Li??n',24,1,'2019-09-23 14:23:52',_binary ''),(31,'Th??? Tr???n Nho Quan',51,1,'2019-09-23 14:26:06',_binary ''),(32,'C??c Ph????ng',51,1,'2019-09-23 14:26:23',_binary ''),(33,'V??n Phong',51,1,'2019-09-23 14:26:42',_binary ''),(34,'????ng Th??nh',74,1,'2019-09-23 14:27:57',_binary ''),(35,'Thanh B??nh',74,1,'2019-09-23 14:28:27',_binary ''),(36,'B??ch ????o',74,1,'2019-09-23 14:28:42',_binary ''),(37,'Ninh Kh??nh',74,1,'2019-09-23 14:29:03',_binary ''),(38,'Th??? Tr???n Kinh M??n',66,1,'2019-09-23 14:30:11',_binary ''),(39,'Ph??c Th??nh',66,1,'2019-09-23 14:30:33',_binary ''),(40,'Hi???p H??a',66,1,'2019-09-23 14:31:18',_binary ''),(41,'H???ng L???c',69,1,'2019-09-23 14:32:08',_binary ''),(42,'Thanh An',69,1,'2019-09-23 14:32:30',_binary ''),(43,'An L????ng',69,1,'2019-09-23 14:32:56',_binary ''),(44,'Nguy???n Du',25,1,'2019-09-23 14:58:11',_binary ''),(45,'L?? ?????i H??nh',25,1,'2019-09-23 14:58:30',_binary ''),(46,'Thanh Nh??n',25,1,'2019-09-23 14:58:50',_binary ''),(47,'B??ch Khoa',25,1,'2019-09-23 14:59:06',_binary ''),(48,'B???ch Mai',25,1,'2019-09-23 14:59:23',_binary ''),(49,'?????ng T??m',25,1,'2019-09-23 14:59:37',_binary ''),(50,'V??nh Tuy',25,1,'2019-09-23 14:59:52',_binary ''),(51,'Tr????ng ?????nh',25,1,'2019-09-23 15:00:13',_binary ''),(52,'An B??nh',67,1,'2019-09-23 15:15:07',_binary ''),(53,'H???ng Phong',67,1,'2019-09-23 15:15:40',_binary ''),(54,'D??n Ch???',72,1,'2019-09-23 15:16:25',_binary ''),(55,'Nguy??n Gi??p',72,1,'2019-09-23 15:16:49',_binary ''),(56,'Thanh Tr??',28,1,'2019-09-23 15:32:03',_binary ''),(57,'L??nh Nam',28,1,'2019-09-23 15:32:17',_binary ''),(58,'Y??n S???',28,1,'2019-09-23 15:32:30',_binary ''),(59,'Gi??p B??t',28,1,'2019-09-23 15:32:41',_binary ''),(60,'Ho??ng Li???t',28,1,'2019-09-23 15:32:54',_binary ''),(61,'?????nh C??ng',28,1,'2019-09-23 15:33:17',_binary ''),(62,'?????i Kim',28,1,'2019-09-23 15:33:36',_binary ''),(63,'Nh??n Ch??nh',30,1,'2019-09-23 15:34:02',_binary ''),(64,'Kh????ng Trung',30,1,'2019-09-23 15:34:22',_binary ''),(65,'H??? ????nh',30,1,'2019-09-23 15:34:36',_binary ''),(66,'Kim Giang',30,1,'2019-09-23 15:34:54',_binary ''),(67,'Ph????ng Li???t',30,1,'2019-09-23 15:35:11',_binary ''),(68,'Kh????ng Mai',30,1,'2019-09-23 15:35:30',_binary ''),(69,'Th?????ng ????nh',30,1,'2019-09-23 15:36:03',_binary ''),(70,'T??n Tri???u',90,1,'2019-09-23 15:38:34',_binary ''),(71,'Thanh Li???t',90,1,'2019-09-23 15:38:52',_binary ''),(72,'T??? Thanh Oai',90,1,'2019-09-23 15:39:09',_binary ''),(73,'H???u H??a',90,1,'2019-09-23 15:39:21',_binary ''),(74,'Ng?? Hi???p',90,1,'2019-09-23 15:39:41',_binary ''),(75,'Tam Hi???p',90,1,'2019-09-23 15:39:56',_binary ''),(76,'?????i ??ng',90,1,'2019-09-23 15:40:13',_binary ''),(77,'Y??n M???',90,1,'2019-09-23 15:40:40',_binary ''),(78,'Th??? tr???n',71,1,'2019-09-25 08:32:48',_binary ''),(79,'L??ng Th?????ng',24,1,'2019-09-25 09:03:30',_binary ''),(80,'????ng Ng??n',91,1,'2019-10-04 08:57:18',_binary ''),(81,'T??n L???p',33,1,'2019-10-08 10:36:34',_binary '');
/*!40000 ALTER TABLE `wards` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-14 14:50:08

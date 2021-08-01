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
INSERT INTO `ads` VALUES (32,'Giải pháp quản lý nhà thuốc toàn diện',NULL,'Giúp chủ nhà thuốc tối ưu được các hoạt động quản lý với hệ thống tra cứu và báo cáo theo nhiều tiêu chí khác nhau. ',1,23,29,1,'2019-09-24 09:29:49',_binary ''),(33,'Phân phối phần mềm cho máy tính và mobile',NULL,'Phân phối các ứng dụng phần mềm cho các thiết bị máy tính và di động.',1,24,27,1,'2019-09-24 09:58:23',_binary ''),(34,'Quảng cáo 1',NULL,'',1,25,26,1,'2019-09-24 16:33:45',_binary ''),(35,'Quảng cáo 1',NULL,NULL,14,25,26,1,'2019-09-30 15:47:11',_binary ''),(36,'Thuốc giảm cân',NULL,'  ',15,23,27,32,'2019-10-11 09:51:58',_binary '');
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
INSERT INTO `ads_positions` VALUES (22,'Trên trái',1,1,'2019-09-23 18:08:22',_binary ''),(23,'Trên phải',1,1,'2019-09-23 18:08:32',_binary ''),(24,'Bên trái',1,1,'2019-09-23 18:08:50',_binary ''),(25,'Bên phải',1,1,'2019-09-23 18:09:01',_binary ''),(26,'Chính giữa',1,1,'2019-09-23 18:09:18',_binary ''),(27,'Giữa trên',1,1,'2019-09-23 18:09:29',_binary ''),(28,'Giữa dưới',1,1,'2019-09-23 18:09:41',_binary ''),(29,'Dưới trái',1,1,'2019-09-23 18:10:01',_binary ''),(30,'Dưới phải',1,1,'2019-09-23 18:10:11',_binary ''),(31,'Dưới phải',15,1,'2019-09-30 15:46:34',_binary '');
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
INSERT INTO `article` VALUES (32,'Cha đỡ mát tay của những ca đẻ khó','Hơn 30 y bác sĩ có mặt tại phòng cấp cứu lặng người đi. Ê kíp đang tiến hành phẫu thuật trên cơ thể bệnh nhân cũng sững sờ. \n\n\"Mọi người bình tĩnh, lúc này mà ai cũng ngưng mổ để đi tìm cách bảo vệ mình thì chắc chắn bệnh nhân sẽ chết\", một bác sĩ lên tiếng.\n\nVài giây im lặng thoáng qua, kíp mổ lại nhịp nhàng các thao tác phẫu thuật. Họ động viên nhau \"tất cả sẽ ổn thôi\" để tiếp tục công việc.','<p>Hơn 30 y b&aacute;c sĩ c&oacute; mặt tại ph&ograve;ng cấp cứu lặng người đi. &Ecirc; k&iacute;p đang tiến h&agrave;nh phẫu thuật tr&ecirc;n cơ thể bệnh nh&acirc;n cũng sững sờ.&nbsp;</p>\n\n<p>&quot;Mọi người b&igrave;nh tĩnh, l&uacute;c n&agrave;y m&agrave; ai cũng ngưng mổ để đi t&igrave;m c&aacute;ch bảo vệ m&igrave;nh th&igrave; chắc chắn bệnh nh&acirc;n sẽ chết&quot;, một b&aacute;c sĩ l&ecirc;n tiếng.</p>\n\n<p>V&agrave;i gi&acirc;y im lặng tho&aacute;ng qua, k&iacute;p mổ lại nhịp nh&agrave;ng c&aacute;c thao t&aacute;c phẫu thuật. Họ động vi&ecirc;n nhau &quot;tất cả sẽ ổn th&ocirc;i&quot; để tiếp tục c&ocirc;ng việc.</p>\n\n<p>B&aacute;c sĩ Lưu Quốc Khải, Trưởng Khoa Đẻ 2 vẫn nhớ như in diễn biến của ca mổ n&agrave;y, 4 năm trước. Khi ấy sản phụ được đưa v&agrave;o ph&ograve;ng cấp cứu Bệnh viện Phụ sản H&agrave; Nội trong t&igrave;nh trạng m&aacute;u từ &acirc;m đạo chảy &agrave;o ạt mặc d&ugrave; đ&atilde; được đ&oacute;ng bỉm. M&aacute;u phun th&agrave;nh v&ograve;i bắn v&agrave;o quần &aacute;o c&aacute;c y b&aacute;c sĩ v&agrave; thiết bị xung quanh.&nbsp;</p>\n\n<p>B&aacute;c sĩ Khải khi ấy đ&atilde; hết ca trực, đang tr&ecirc;n đường đưa con đi học th&igrave; nhận được tin b&aacute;o từ bệnh viện. Ngay lập tức anh quay xe ph&oacute;ng đến bệnh viện. Bước v&agrave;o ph&ograve;ng cấp cứu, anh y&ecirc;u cầu k&iacute;p trực tiếp tục hồi sức rồi c&ugrave;ng b&aacute;c sĩ trưởng k&iacute;p trực mổ cắt tử cung bệnh nh&acirc;n để cầm m&aacute;u.&nbsp;</p>\n\n<p>Trong t&igrave;nh huống nguy cấp, to&agrave;n bộ k&iacute;p trực c&ugrave;ng nỗ lực cấp cứu gi&agrave;nh mạng sống cho người bệnh n&ecirc;n kh&ocirc;ng kịp d&ugrave;ng trang phục bảo hộ. &quot;Kh&ocirc;ng ai biết bệnh nh&acirc;n nhiễm HIV&quot;, b&aacute;c sĩ Khải n&oacute;i.&nbsp;</p>\n\n<p>Ca mổ kết th&uacute;c, bệnh nh&acirc;n ổn định sức khỏe. Bệnh viện chỉ định c&aacute;c b&aacute;c sĩ trong k&iacute;p mổ&nbsp;x&eacute;t nghiệm, lập hồ sơ theo d&otilde;i, uống thuốc dự ph&ograve;ng ARV v&agrave; được x&eacute;t nghiệm lại sau 3-6 th&aacute;ng nữa.</p>\n\n<p>Theo b&aacute;c sĩ Khải, đ&acirc;y l&agrave; trường hợp đầu ti&ecirc;n bệnh viện c&oacute; số người phơi nhiễm HIV đ&ocirc;ng nhất. 30 y b&aacute;c sĩ tham gia ca cấp cứu v&igrave; c&oacute; tiếp x&uacute;c với m&aacute;u v&agrave; dịch của bệnh nh&acirc;n n&ecirc;n c&oacute; nguy cơ phơi nhiễm HIV, trong đ&oacute; 19 người gồm 18 y b&aacute;c sĩ bệnh viện v&agrave; một học vi&ecirc;n đ&atilde; bị phơi nhiễm v&igrave; d&iacute;nh m&aacute;u trực tiếp.</p>\n\n<p>&quot;Mặc d&ugrave; rủi ro nghề nghiệp cao, nguy cơ l&acirc;y nhiễm c&aacute;c bệnh truyền qua đường m&aacute;u như HIV, vi&ecirc;m gan, giang mai... nhưng kh&ocirc;ng c&oacute; nghĩa l&agrave; m&igrave;nh ngồi đ&oacute; m&agrave; sợ&quot;, b&aacute;c sĩ Khải n&oacute;i.</p>\n\n<p>B&ecirc;n cạnh việc tu&acirc;n thủ đ&uacute;ng quy tr&igrave;nh về chuy&ecirc;n m&ocirc;n, b&aacute;c sĩ sản khoa phải tuyệt đối t&ocirc;n trọng sản phụ v&agrave; đối xử b&igrave;nh đẳng với tất cả bệnh nh&acirc;n. Hơn ai hết anh hiểu chỉ cần một quyết định của b&aacute;c sĩ sẽ ảnh hưởng đến &iacute;t nhất hai mạng người.</p>\n\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\n	<tbody>\n		<tr>\n			<td><img alt=\"Thạc sĩ, bác sĩ Lưu Quốc Khải, trưởng khoa Đẻ 2, bệnh viện Phụ Sản Hà Nội. Ảnh: Thùy An\" src=\"https://i-suckhoe.vnecdn.net/2019/10/09/img-0838-jpg-1570587350-2132-1570594675.jpg\" /></td>\n		</tr>\n		<tr>\n			<td>\n			<p>Thạc sĩ, b&aacute;c sĩ Lưu Quốc Khải, Trưởng Khoa Đẻ 2, Bệnh viện Phụ Sản H&agrave; Nội. Ảnh:&nbsp;<em>Th&ugrave;y An</em></p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>Trước khi v&agrave;o nghề, b&aacute;c sĩ Khải viết đơn t&igrave;nh nguyện tham gia qu&acirc;n ngũ. Trong một lần&nbsp;đến trạm x&aacute;, anh chăm ch&uacute; nh&igrave;n người b&aacute;c sĩ trẻ thao t&aacute;c nhanh nhẹn v&agrave; tận t&igrave;nh chăm s&oacute;c một bệnh binh rồi bỗng thấy &quot;tim m&igrave;nh thổn thức&quot;. Từ đ&oacute;, anh nung nấu ước mơ, trở th&agrave;nh người thầy thuốc để chữa bệnh cho mọi người.</p>\n\n<p>Khi xuất ngũ, anh bỡ ngỡ cầm lại những quyển s&aacute;ch h&oacute;a sinh v&agrave; &ocirc;n thi v&agrave;o Đại học Y H&agrave; Nội. Để c&oacute; tiền trang trải việc học, anh l&agrave;m mọi c&ocirc;ng việc từ phụ hồ đến bảo vệ... Nhờ đ&oacute;, anh thấu hiểu cuộc sống v&agrave; lu&ocirc;n ưu ti&ecirc;n những sản phụ ngh&egrave;o, kh&oacute; khăn được kh&aacute;m trước.</p>\n\n<p>Thời gian đầu c&ocirc;ng t&aacute;c tại khoa sản, anh ngại ng&ugrave;ng khi bị bạn b&egrave; tr&ecirc;u chọc v&igrave; l&agrave;m nghề nhạy cảm. Thế nhưng, anh thấy tự h&agrave;o v&igrave; nghĩ &quot;đ&acirc;u phải ai cũng được chứng kiến gi&acirc;y ph&uacute;t những đứa trẻ ch&agrave;o đời&quot;. L&acirc;u dần, anh c&ograve;n học được&nbsp;c&aacute;ch thấu hiểu v&agrave; đồng cảm với người phụ nữ gi&uacute;p họ tin tưởng v&agrave; t&acirc;m sự hết những nỗi lo trong l&ograve;ng.</p>\n\n<p>B&ecirc;n cạnh c&ocirc;ng việc kh&aacute;m, s&agrave;ng lọc v&agrave; ph&aacute;t hiện sớm c&aacute;c bệnh l&yacute; trong thời kỳ mang thai, b&aacute;c sĩ Khải c&ograve;n trực tiếp điều trị v&ocirc; sinh, hiếm muộn, kh&aacute;m phụ khoa, s&agrave;ng lọc ph&aacute;t hiện sớm ung thư phụ khoa, tư vấn sức khỏe sinh sản v&agrave; đỡ đẻ cho những ca sinh kh&oacute; tại Bệnh viện Phụ sản H&agrave; Nội.</p>\n\n<p>&quot;Nhiều người tưởng c&ocirc;ng việc n&agrave;y nh&agrave;n hạ chỉ l&agrave; hướng dẫn người mẹ rặn rồi đỡ em b&eacute;, cắt d&acirc;y rốn song qu&aacute; tr&igrave;nh &quot;vượt cạn&quot; lu&ocirc;n tiềm ẩn những rủi ro, cần sự đồng h&agrave;nh của b&aacute;c sĩ&quot;, anh n&oacute;i.</p>\n\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\n	<tbody>\n		<tr>\n			<td><img alt=\"Bác sĩ Khải dành nhiều thời gian để tư vấn kỹ  giúp mẹ bầu yên tâm và có thai kỳ khỏe mạnh. Ảnh: Thùy An\" src=\"https://i-suckhoe.vnecdn.net/2019/10/09/img-0839-1-jpg-1570589201-2844-1570594676.jpg\" /></td>\n		</tr>\n		<tr>\n			<td>\n			<p>B&aacute;c sĩ Khải d&agrave;nh nhiều thời gian để tư vấn kỹ&nbsp; gi&uacute;p mẹ bầu y&ecirc;n t&acirc;m v&agrave; c&oacute; thai kỳ khỏe mạnh. Ảnh:&nbsp;<em>Th&ugrave;y An</em></p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>Ở cương vị một người quản l&yacute; gần 100 c&aacute;n bộ nh&acirc;n vi&ecirc;n y tế, b&aacute;c sĩ Khải chẳng l&uacute;c n&agrave;o ngơi tay. Ngo&agrave;i chuy&ecirc;n m&ocirc;n, anh c&ograve;n trực tiếp giảng dạy v&agrave; đ&agrave;o tạo c&aacute;c y, b&aacute;c sĩ trẻ.&nbsp;</p>\n\n<p>&quot;C&ocirc;ng việc hằng ng&agrave;y cứ cuốn t&ocirc;i đi, dường như 24 giờ l&agrave; kh&ocirc;ng đủ&quot;, b&aacute;c sĩ Khải n&oacute;i.</p>\n\n<p>Tuy nhi&ecirc;n, anh tự nhận m&igrave;nh may mắn khi c&oacute; vợ c&ugrave;ng nghề. Thạc sĩ, b&aacute;c sĩ Tạ Thị Ho&agrave;i Anh,&nbsp;bệnh viện Phụ sản Trung Ương l&agrave; người bạn đồng h&agrave;nh trong c&ocirc;ng việc cũng như cuộc sống h&agrave;ng ng&agrave;y. Anh c&ograve;n l&agrave; người đỡ đẻ đứa con đầu l&ograve;ng của hai vợ chồng.</p>\n\n<p>Thời điểm đ&oacute;, anh t&igrave;m mọi c&aacute;ch bươn chải để kiếm sống, đỡ đần vợ.&nbsp;&quot;Khi đ&oacute;, vợ t&ocirc;i mang bầu gần 9 th&aacute;ng, nếu theo t&iacute;nh to&aacute;n phải c&ograve;n v&agrave;i tuần nữa mới đẻ th&igrave; t&ocirc;i mới c&oacute; thời gian xoay sở, kiếm tiền&quot;, anh nhớ lại.&nbsp;</p>\n\n<p>Thời gian cấp b&aacute;ch, lại l&agrave; thai ng&ocirc;i ngược, anh quyết định đỡ đẻ tại nh&agrave; để đảm bảo an to&agrave;n cho hai mẹ con d&ugrave; mới chỉ l&agrave; b&aacute;c sĩ học việc. Nh&igrave;n con trai ch&agrave;o đời, anh thấm th&iacute;a &yacute; nghĩa của c&acirc;u n&oacute;i &quot;mẹ tr&ograve;n con vu&ocirc;ng&quot; m&agrave; c&aacute;c b&aacute;c sĩ sản phải khắc cốt ghi t&acirc;m.&nbsp;</p>\n\n<p>Theo anh, b&agrave;i to&aacute;n kh&oacute; nhất của nghề l&agrave; trong thời gian ngắn phải đảm bảo an to&agrave;n cho mẹ kh&ocirc;ng bị mất m&aacute;u nhiều v&agrave; con kh&ocirc;ng bị ngạt.&nbsp;&nbsp;Đối với ca phẫu thuật, anh lu&ocirc;n cố gắng giữ lại tử cung cho phụ nữ nếu kh&ocirc;ng nguy hiểm t&iacute;nh mạng. Với anh, c&ograve;n tử cung l&agrave; c&ograve;n hạnh ph&uacute;c v&igrave; người phụ nữ vẫn c&ograve;n cơ hội l&agrave;m mẹ. Anh&nbsp;cũng tự đặt cho m&igrave;nh những quy tắc nghề nghiệp ri&ecirc;ng, phải nghi&ecirc;m t&uacute;c, t&acirc;m s&aacute;ng, c&oacute; đạo đức th&igrave; mới gắn b&oacute; được l&acirc;u d&agrave;i.</p>\n\n<p>Hơn 20 năm trong nghề, b&aacute;c sĩ Khải kh&ocirc;ng nhớ m&igrave;nh đ&atilde; đỡ đẻ được bao nhi&ecirc;u ca, nghe được bao nhi&ecirc;u tiếng kh&oacute;c ch&agrave;o đời.&nbsp;H&agrave;ng trăm lời ch&uacute;c, tin nhắn từ những gia đ&igrave;nh được b&aacute;c sĩ đỡ đẻ lưu lại như &quot;gia t&agrave;i&quot; của sự nghiệp. Anh c&ograve;n được mọi người gọi l&agrave; b&aacute;c sĩ sản &quot;m&aacute;t tay&quot; nhất bệnh viện. Nhiều người xin lấy t&ecirc;n anh đặt cho con của m&igrave;nh hay xin nhận b&aacute;c sĩ l&agrave;m cha nu&ocirc;i như lời cảm ơn</p>\n\n<p>&quot;Tận tay ch&agrave;o đ&oacute;n&nbsp;những sự sống mới đến với cuộc đời l&agrave; niềm hạnh ph&uacute;c mỗi ng&agrave;y để t&ocirc;i tiếp tục gắn b&oacute; với nghề d&ugrave; đ&atilde; ngo&agrave;i 50&quot;, b&aacute;c sĩ Khải n&oacute;i.</p>\n','userfiles/admin_nbm/images/20191010/2019_10_10_17_43_20_259_tv2x.png',NULL,NULL,NULL,'','',21,1,'2019-09-23 14:56:26',_binary ''),(33,'Khi nào nên sử dụng phần mềm quản lý nhà thuốc','Việc sử dụng phần mềm quản lý chắc cũng không còn là khái niệm xa lạ với các nhà đầu tư, từ những chủ đầu tư hàng hóa cho đến các chủ cửa hàng dịch vụ…. Tuy nhiên, rất nhiều trong số họ vẫn chưa muốn dùng phần mềm, bởi chưa thấy được lợi ích mà phần mềm mang lại.','<p>Hầu hết c&aacute;c chủ đầu tư đều cho rằng chi một khoản tiền kh&ocirc;ng nhỏ ra l&agrave; l&atilde;ng ph&iacute;, l&agrave; chưa cần thiết, rằng bao l&acirc;u nay họ vẫn đang d&ugrave;ng phương thức quản l&yacute; cũ như sổ s&aacute;ch, excel c&oacute; sao đ&acirc;u, mặc d&ugrave; mỗi ng&agrave;y đều phải b&ugrave; đầu, tốn thời gian cho việc thống k&ecirc;, quản l&yacute;. Lẽ đơn giản, đ&oacute; đ&atilde; trở th&agrave;nh th&oacute;i quen của họ, l&agrave; việc m&agrave; họ vẫn l&agrave;m h&agrave;ng ng&agrave;y.</p>\n\n<p>Việc quản l&yacute; bằng phương ph&aacute;p cũ, thủ c&ocirc;ng đ&atilde; qu&aacute; lạc hậu trong khi ng&agrave;nh c&ocirc;ng nghệ th&ocirc;ng tin đang ph&aacute;t triển vượt bậc từng ng&agrave;y. Đa phần giới trẻ hiện nay đều c&oacute; hiểu biết nhất định về phần mềm, nhưng nhiều &ocirc;ng chủ ở thế hệ đi trước lại kh&ocirc;ng muốn mở hầu bao cho &ldquo;thứ kh&ocirc;ng cần&rdquo;. Ch&iacute;nh v&igrave; lẽ đ&oacute;, kh&ocirc;ng phải ở cơ sở n&agrave;o cũng được &aacute;p dụng&nbsp;phần mềm quản l&yacute; ti&ecirc;n tiến.&nbsp;Vậy khi n&agrave;o th&igrave; cần một phần mềm quản l&yacute;? Đ&oacute; ch&iacute;nh l&agrave; khi họ nhận ra những tiện &iacute;ch m&agrave; phần mềm mang lại.</p>\n\n<h2>Khi số lượng h&agrave;ng h&oacute;a, dịch vụ v&agrave; kh&aacute;ch h&agrave;ng qu&aacute; nhiều</h2>\n\n<p><img alt=\"Khi số lượng hàng hóa, dịch vụ và khách hàng quá nhiều\" height=\"493\" src=\"https://xpharma.vn/wp-content/uploads/2017/12/khi-nao-nen-su-dung-phan-mem-quan-ly-1.jpg\" width=\"950\" /></p>\n\n<p>Khi số lượng h&agrave;ng h&oacute;a, dịch vụ v&agrave; kh&aacute;ch h&agrave;ng qu&aacute; nhiều</p>\n\n<p>Với những chủ quản l&yacute; h&agrave;ng h&oacute;a th&igrave; việc c&oacute; qu&aacute; nhiều h&agrave;ng h&oacute;a sẽ g&acirc;y kh&oacute; khăn trong việc quản l&yacute;, kiểm tra h&agrave;ng xuất ra, nhập v&agrave;o, thống k&ecirc; tồn kho, h&agrave;ng sắp hết hạn, qu&aacute; hạn &hellip;. Với c&aacute;c chủ đầu tư kinh doanh dịch vụ, v&iacute; dụ như c&aacute;c b&aacute;n h&agrave;ng, thẩm mỹ viện, ph&ograve;ng kh&aacute;m&hellip; lượng kh&aacute;ch h&agrave;ng nhiều, đồng nghĩa với việc quản l&yacute; kh&oacute; khăn hơn. Việc t&igrave;m kiếm th&ocirc;ng tin kh&aacute;ch h&agrave;ng, thống k&ecirc; dịch vụ hay thống k&ecirc; lại lượng kh&aacute;ch h&agrave;ng tiềm năng l&agrave; một chuyện kh&ocirc;ng hề dễ d&agrave;ng, điều n&agrave;y ảnh hưởng kh&ocirc;ng nhỏ đến việc l&ecirc;n kế hoạch chăm s&oacute;c kh&aacute;ch h&agrave;ng, chiến dịch marketing.</p>\n\n<p>Đ&oacute; l&agrave; l&uacute;c cần đến phần mềm quản l&yacute; như phần mềm b&aacute;n h&agrave;ng, phần mềm quản l&yacute; kho&hellip;</p>\n\n<h2>Quy m&ocirc; ph&aacute;t triển mở rộng</h2>\n\n<p><img alt=\"Quy mô phát triển mở rộng\" height=\"500\" src=\"https://xpharma.vn/wp-content/uploads/2017/12/khi-nao-nen-su-dung-phan-mem-quan-ly-2.png\" width=\"650\" /></p>\n\n<p>Quy m&ocirc; ph&aacute;t triển mở rộng</p>\n\n<ul>\n	<li>Khi số lượng kh&aacute;ch h&agrave;ng tăng, số lượng giao dịch lớn</li>\n	<li>\n	<p>Số lượng chi nh&aacute;nh tăng dần, k&egrave;m theo đ&oacute; l&agrave; số lượng nh&acirc;n vi&ecirc;n tăng theo, việc quản l&yacute; nh&acirc;n vi&ecirc;n, quản l&yacute; lương cũng trở n&ecirc;n kh&oacute; khăn.</p>\n	</li>\n	<li>\n	<p>Khi số lượng mặt h&agrave;ng qu&aacute; nhiều, nhiều chủng loại, mẫu m&atilde;, chi tiết&hellip;</p>\n	</li>\n	<li>\n	<p>Khi c&aacute;c chủ quản l&yacute; cần một c&ocirc;ng cụ hỗ trợ bởi c&aacute;c phương thức cũ kh&ocirc;ng c&ograve;n ph&ugrave; hợp.</p>\n	</li>\n</ul>\n\n<p>Đ&oacute; ch&iacute;nh l&agrave; l&uacute;c cần đến phần mềm quản l&yacute;!</p>\n\n<h2>Thay đổi c&aacute;ch tư duy</h2>\n\n<p><img alt=\"Thay đổi cách tư duy\" height=\"533\" src=\"https://xpharma.vn/wp-content/uploads/2017/12/khi-nao-nen-su-dung-phan-mem-quan-ly.jpg\" width=\"800\" /></p>\n\n<p>Thay đổi c&aacute;ch tư duy</p>\n\n<p>Phần mềm quản l&yacute; được xem như khoản đầu tư l&acirc;u d&agrave;i chứ kh&ocirc;ng phải chỉ l&agrave; trước mắt. C&aacute;c chủ đầu tư chắc chắn sẽ phải ngạc nhi&ecirc;n với những lợi &iacute;ch m&agrave; một phần mềm đem lại, kh&ocirc;ng chỉ l&agrave; tiết kiệm thời gian, nh&acirc;n lực m&agrave; đ&oacute; c&ograve;n l&agrave; một c&ocirc;ng cụ hỗ trợ đắc lực cho c&aacute;c chiến dịch marketing quảng b&aacute; thương hiệu.</p>\n\n<p>T&iacute;nh xa hơn, việc bỏ ra một khoản chi ph&iacute; để mua phần mềm sẽ rẻ hơn rất nhiều so với số tiền cần chi trả cho th&ecirc;m nhiều nh&acirc;n c&ocirc;ng trong một thời gian d&agrave;i.</p>\n\n<p>Đ&oacute; l&agrave; l&uacute;c bạn cần một phần mềm quản l&yacute;!</p>\n','userfiles/admin_nbm/images/20191010/2019_10_10_16_48_42_301_tv2x.png',NULL,'https://xpharma.vn/khi-nao-nen-su-dung-phan-mem-quan-ly.html',NULL,'','',21,1,'2019-09-24 10:34:23',_binary ''),(34,'Thế Giới Di Động mua lại Phúc An Khang','Ông Trần Kinh Doanh, Thành viên HĐQT Công ty cổ phần Đầu tư Thế Giới Di Động (Mã: MWG) xác nhận công ty đã thực hiện mua lại chuỗi nhà thuốc Phúc An Khang để lấn sân ngành dược. Thương vụ đã được hoàn tất và Thế Giới Di Động đã mở cửa hàng mới của chuỗi này với cái tên khác: Nhà thuốc An Khang.','<p>&Ocirc;ng Trần Kinh Doanh, Th&agrave;nh vi&ecirc;n HĐQT C&ocirc;ng ty cổ phần Đầu tư Thế Giới Di Động (M&atilde;: MWG) x&aacute;c nhận c&ocirc;ng ty đ&atilde; thực hiện&nbsp;mua lại chuỗi nh&agrave; thuốc Ph&uacute;c An Khang để lấn s&acirc;n ng&agrave;nh dược. Thương vụ đ&atilde; được ho&agrave;n tất v&agrave; Thế Giới Di Động đ&atilde; mở cửa h&agrave;ng mới của chuỗi n&agrave;y với c&aacute;i t&ecirc;n kh&aacute;c: Nh&agrave; thuốc An Khang.</p>\n\n<p>Đ&acirc;y l&agrave; lần đầu ti&ecirc;n, đại diện Thế Giới Di Động khẳng định việc mua lại chuỗi nh&agrave; thuốc Ph&uacute;c An Khang. Trước đ&oacute;, thị trường c&oacute; nhiều đồn đo&aacute;n v&agrave; một số c&ocirc;ng ty chứng kho&aacute;n đ&atilde; ra b&aacute;o c&aacute;o ph&acirc;n t&iacute;ch về khả năng n&agrave;y.</p>\n\n<p>Chuỗi nh&agrave; thuốc Ph&uacute;c An Khang được th&agrave;nh lập từ th&aacute;ng 5/2006 với 14 nh&agrave; thuốc hoạt động tại TP Hồ Ch&iacute; Minh. MWG c&oacute; kế hoạch mở rộng sang b&aacute;n lẻ dược phẩm, mục ti&ecirc;u c&oacute; khoảng 50 hoặc 60 cửa h&agrave;ng trong năm sau, theo b&aacute;o c&aacute;o HSC.</p>\n\n<p>C&ugrave;ng với việc M&amp;A chuỗi b&aacute;n lẻ, MWG cũng đ&atilde; tiến h&agrave;nh mua cổ phần C&ocirc;ng ty Trần Anh (M&atilde;: TAG). &Ocirc;ng Doanh cho biết MWG đ&atilde; v&agrave;o tiếp quản, hệ thống IT, kế to&aacute;n&hellip; v&agrave; gửi nh&acirc;n sự chủ chốt tham gia vận h&agrave;nh Trần Anh. Theo dự kiến, trong 1 &ndash; 2 năm đầu, MWG giữ nguy&ecirc;n thương hiệu Trần Anh, sau đ&oacute; sẽ c&oacute; phương &aacute;n kh&aacute;c.</p>\n\n<p>Tổng mức đầu tư thực hiện M&amp;A của MWG năm 2017 l&agrave; 2.500 tỷ đồng.</p>\n','userfiles/admin_nbm/images/20191010/2019_10_10_17_21_53_194_macbook2x.png',NULL,NULL,NULL,'An Khang, thuốc','',21,1,'2019-09-24 10:36:47',_binary ''),(35,'TIỆN ÍCH CỦA WEB NHÀ THUỐC','Ông Trần Kinh Doanh, Thành viên HĐQT Công ty cổ phần Đầu tư Thế Giới Di Động (Mã: MWG) xác nhận công ty đã thực hiện mua lại chuỗi nhà thuốc Phúc An Khang để lấn sân ngành dược. Thương vụ đã được hoàn tất và Thế Giới Di Động đã mở cửa hàng mới của chuỗi này với cái tên khác: Nhà thuốc An Khang.','<h5>TRA CỨU H&Agrave;NG HO&Aacute;</h5>\n\n<p>Với 20.000 mặt h&agrave;ng li&ecirc;n tục được cập nhật th&ocirc;ng tin gi&aacute; cả, bạn dễ d&agrave;ng tra cứu mọi th&ocirc;ng tin về h&agrave;ng ho&aacute; m&agrave; để phục vụ kinh doanh.</p>\n\n<p>&nbsp;</p>\n\n<h5>TUYỂN DỤNG &amp; Đ&Agrave;O TẠO</h5>\n\n<p>Bạn sẽ được cung cấp kh&ocirc;ng chỉ c&ocirc;ng cụ đăng tin m&agrave; c&ograve;n cả quy tr&igrave;nh đ&agrave;o tạo nh&acirc;n vi&ecirc;n để bạn lu&ocirc;n chủ động về đội ngũ nh&acirc;n vi&ecirc;n b&aacute;n h&agrave;ng.</p>\n\n<p>&nbsp;</p>\n\n<h5>QUẢN L&Yacute; NH&Agrave; THUỐC</h5>\n\n<p>Với phần mềm của WEB NH&Agrave; THUỐC, bạn sẽ c&oacute; một c&ocirc;ng cụ quản l&yacute; đơn giản, hiện đại để tự động ho&aacute; hoạt động kinh doanh nh&agrave; thuốc.</p>\n\n<p>&nbsp;</p>\n\n<h5>PH&Aacute;T TRIỂN KINH DOANH</h5>\n\n<p>Đ&acirc;y l&agrave; k&ecirc;nh tư vấn v&agrave; hỗ trợ trực tiếp mọi vấn đề ph&aacute;t triển kinh doanh v&agrave; n&acirc;ng cao năng lực cạnh tranh cho nh&agrave; thuốc</p>\n\n<h2>WEB NH&Agrave; THUỐC TƯ VẤN G&Igrave; CHO BẠN</h2>\n\n<h6>Bạn đang muốn mở nh&agrave; thuốc nhưng đang ph&acirc;n v&acirc;n v&agrave; bạn kh&ocirc;ng thể t&igrave;m hiểu đ&acirc;u được những kinh nghiệm kinh doanh, quản l&yacute; nh&agrave; thuốc. Hay bạn đang phải đối mặt với những kh&oacute; khăn m&agrave; kh&ocirc;ng c&oacute; lời giải như: kh&oacute; th&uacute;c đẩy v&agrave; tạo động lực cho nh&acirc;n vi&ecirc;n b&aacute;n h&agrave;ng; kh&oacute; kiểm so&aacute;t mọi hoạt của động nh&agrave; thuốc; &aacute;p lực cạnh tranh lu&ocirc;n đ&egrave; nặng; mất nhiều thời gian c&aacute; nh&acirc;n; thua lỗ, vv&hellip;</h6>\n\n<p>H&atilde;y để ch&uacute;ng t&ocirc;i tư vấn cho bạn.</p>\n\n<p>Bạn sẽ nhận được những tư vấn rất thực tế từ ch&iacute;nh những kinh nghiệm v&agrave; hiểu biết của ch&uacute;ng t&ocirc;i trong linh vực b&aacute;n lẻ dược phẩm. Những tư vấn n&agrave;y bao gồm danh mục v&agrave; cơ cấu danh mục h&agrave;ng, th&ocirc;ng tin gi&aacute; cả h&agrave;ng ho&aacute;, lộ tr&igrave;nh v&agrave; t&agrave;i liệu đ&agrave;o tạo nh&acirc;n vi&ecirc;n, l&agrave;m thế n&agrave;o thế n&agrave;o n&acirc;ng cao năng lực cạnh tranh v&agrave; mở rộng kinh doanh, những rủi ro bạn c&oacute; thể gập trong qu&aacute; tr&igrave;nh kinh doanh vv... Tất cả những điều n&agrave;y gi&uacute;p bạn ph&aacute;t triển kinh doanh ng&agrave;y c&agrave;ng hiệu quả v&agrave; khai th&aacute;c hết tiềm năng của nh&agrave; thuốc.</p>\n\n<ul>\n	<li>\n	<p><input type=\"text\" value=\"100\" /></p>\n\n	<h6>Đ&Aacute;P ỨNG NHU CẦU</h6>\n\n	<p>WEB NH&Agrave; THUỐC đ&aacute;p ứng mọi nhu cầu ph&aacute;t triển v&agrave; điều h&agrave;nh hoạt động kinh doanh nh&agrave; thuốc.</p>\n	</li>\n	<li>&nbsp;</li>\n	<li>&nbsp;</li>\n	<li>\n	<p><input type=\"text\" value=\"100\" /></p>\n\n	<h6>ĐẦU TƯ HIỆU QUẢ</h6>\n\n	<p>WEB NH&Agrave; THUỐC cam kết cung cấp dịch vụ chất lượng với chi ph&iacute; thấp nhất nhằm mang tới cơ hội sử dụng cho tất cả c&aacute;c nh&agrave; thuốc.</p>\n	</li>\n</ul>\n\n<h2>CH&Uacute;NG T&Ocirc;I Ở Đ&Acirc;Y L&Agrave; ĐỂ HỖ TRỢ BẠN</h2>\n\n<h5>CH&Iacute;NH S&Aacute;CH SỬ DỤNG</h5>\n\n<p>Chỉ với 3.990.000đ bạn sẽ sử dụng tất cả c&aacute;c tiện &iacute;ch online của WEB NH&Agrave; THUỐC m&atilde;i m&atilde;i. Click biểu tượng để xem chi tiết.</p>\n\n<h5>C&Acirc;U HỎI THƯỜNG GẶP</h5>\n\n<p>Nhiều thắc mắc của bạn được giải đ&aacute;p trong c&acirc;u hỏi thường gập. Click biểu tượng để xem chi tiết.</p>\n\n<h5>NH&Agrave; THUỐC TH&Ocirc;NG MINH</h5>\n\n<p>Nh&agrave; thuốc của bạn sẽ trở n&ecirc;n th&ocirc;ng minh hơn nhờ ứng dụng c&ocirc;ng nghệ. Click biểu tượng để xem chi tiết.</p>\n\n<h5>TRANG FAN PAGE</h5>\n\n<p>Nơi trao đổi v&agrave; giao lưu cộng đồng kh&aacute;ch h&agrave;ng của WEB NH&Agrave; THUỐC. Click biểu tượng để xem chi tiết.</p>\n\n<h2>KH&Aacute;CH H&Agrave;NG CỦA WEB NH&Agrave; THUỐC</h2>\n\n<p>T&iacute;nh đến hiện tại, WEB NH&Agrave; THUỐC đ&atilde; nhận được hơn 1.500 đăng k&yacute; sử dụng từ c&aacute;c quầy/nh&agrave; thuốc trải d&agrave;i tr&ecirc;n hơn 40 tỉnh/th&agrave;nh tr&ecirc;n cả nước.</p>\n\n<p>Hơn 1.500 nh&agrave; thuốc đ&atilde; đăng k&yacute; sử dụng</p>\n\n<p>WEB NH&Agrave; THUỐC đ&atilde; nhận v&agrave; trả lời hơn 10.000 y&ecirc;u cầu từ việc chuẩn bị mở cho tới quản l&yacute; kinh doanh quầy/nh&agrave; thuốc sao cho hiệu quả nhất.</p>\n\n<p>Hơn 10.000 y&ecirc;u cầu đ&atilde; được hỗ trực tiếp</p>\n\n<p>Đ&aacute;p ứng đầy đủ m&ocirc; h&igrave;nh kinh doanh nh&agrave; thuốc: nh&agrave; thuốc trong khu d&acirc;n cư, nh&agrave; thuốc kết hợp ph&ograve;ng kh&aacute;m hoặc cổng bệnh viện, nh&agrave; thuốc bệnh vi&ecirc;n, nh&agrave; thuốc chuỗi.</p>\n\n<p>Đ&aacute;p ứng đủ 4 m&ocirc; h&igrave;nh kinh doanh nh&agrave; thuốc</p>\n\n<h1>&nbsp;</h1>\n\n<p><iframe height=\"90\" id=\"StefanoAI-youtube-2\" src=\"http://www.youtube.com/embed/p0zc9oU5b08?&amp;autohide=2&amp;color=red&amp;controls=1&amp;disablekb=0&amp;fs=0&amp;iv_load_policy=1&amp;modestbranding=0&amp;rel=0&amp;showinfo=0&amp;theme=dark&amp;vq=default\" width=\"160\"></iframe></p>\n\n<h3>Đăng k&yacute; để sử dụng phần mềm v&agrave; c&aacute;c tiện &iacute;ch của WEB NH&Agrave; THUỐC</h3>\n\n<p><a href=\"https://goo.gl/3S6hkP\">ĐĂNG K&Yacute;</a></p>\n\n<h2>KINH NGHIỆM CHIA SẺ</h2>\n\n<h6><a href=\"http://webnhathuoc.com/home/kinh-nghiem/\">Xem th&ecirc;m [...]</a></h6>\n\n<p><a href=\"http://webnhathuoc.com/home/dung-bien-khoan-tien-mua-phan-mem-thanh-khoan-no-hang-thang/\" title=\"ĐỪNG BIẾN KHOẢN TIỀN MUA PHẦN MỀM THÀNH KHOẢN NỢ HÀNG THÁNG\"><img alt=\"\" height=\"200\" src=\"http://webnhathuoc.com/home/wp-content/uploads/2019/09/debt.jpg\" width=\"200\" /></a></p>\n\n<h5><a href=\"http://webnhathuoc.com/home/dung-bien-khoan-tien-mua-phan-mem-thanh-khoan-no-hang-thang/\" title=\"ĐỪNG BIẾN KHOẢN TIỀN MUA PHẦN MỀM THÀNH KHOẢN NỢ HÀNG THÁNG\">ĐỪNG BIẾN KHOẢN TIỀN MUA PHẦN MỀM TH&Agrave;NH KHOẢN NỢ H&Agrave;NG TH&Aacute;NG</a></h5>\n\n<p>Bạn l&agrave; người bỏ tiền ra mua phần mềm, bạn c&oacute; quyền: Lựa chọn đơn vị cung cấp phần mềm ph&ugrave; hợp về chi ph&iacute; v&agrave; quan t&acirc;m tới lợi &iacute;ch thực sự của kh&aacute;ch h&agrave;ng. Lựa chọn được phần mềm gi&uacute;p bạn quản l&yacute; được hoạt động kinh doanh thực tế v&agrave; vẫn đ&aacute;p<a href=\"http://webnhathuoc.com/home/dung-bien-khoan-tien-mua-phan-mem-thanh-khoan-no-hang-thang/\">[&hellip;]</a></p>\n\n<p><a href=\"http://webnhathuoc.com/home/cong-van-khan-so-10045/\" title=\"CÔNG VĂN KHẨN SỐ 10045/QLD-PCTTR CỦA CỤC QUẢN LÝ DƯỢC NGÀY 24/06/2019\"><img alt=\"\" height=\"250\" src=\"http://webnhathuoc.com/home/wp-content/uploads/2019/08/Cuc-quan-ly-duoc-300x300-250x250.jpg\" width=\"250\" /></a></p>\n\n<h5><a href=\"http://webnhathuoc.com/home/cong-van-khan-so-10045/\" title=\"CÔNG VĂN KHẨN SỐ 10045/QLD-PCTTR CỦA CỤC QUẢN LÝ DƯỢC NGÀY 24/06/2019\">C&Ocirc;NG VĂN KHẨN SỐ 10045/QLD-PCTTR CỦA CỤC QUẢN L&Yacute; DƯỢC NG&Agrave;Y 24/06/2019</a></h5>\n\n<p>Sở Y tế tỉnh, th&agrave;nh phố trực thuộc Trung ương qu&aacute;n triệt v&agrave; triển khai c&aacute;c nội dung sau: a) Th&ocirc;ng b&aacute;o cho c&aacute;c cơ sở b&aacute;n lẻ thuốc tr&ecirc;n địa b&agrave;n về việc c&aacute;c cơ sở b&aacute;n lẻ thuốc tr&ecirc;n địa b&agrave;n c&oacute; quyền tự do lựa chọn bất kỳ cơ sở cung cấp<a href=\"http://webnhathuoc.com/home/cong-van-khan-so-10045/\">[&hellip;]</a></p>\n\n<p><a href=\"http://webnhathuoc.com/home/kiem-soat-khang-sinh-hay-luc-soat-hoat-dong-kinh-doanh-nha-thuoc/\" title=\"KIỂM SOÁT KHÁNG SINH HAY LỤC SOÁT HOẠT ĐỘNG KINH DOANH NHÀ THUỐC?\"><img alt=\"\" height=\"200\" src=\"http://webnhathuoc.com/home/wp-content/uploads/2019/05/de743_e2_n.jpg\" width=\"200\" /></a></p>\n\n<h5><a href=\"http://webnhathuoc.com/home/kiem-soat-khang-sinh-hay-luc-soat-hoat-dong-kinh-doanh-nha-thuoc/\" title=\"KIỂM SOÁT KHÁNG SINH HAY LỤC SOÁT HOẠT ĐỘNG KINH DOANH NHÀ THUỐC?\">KIỂM SO&Aacute;T KH&Aacute;NG SINH HAY LỤC SO&Aacute;T HOẠT ĐỘNG KINH DOANH NH&Agrave; THUỐC?</a></h5>\n\n<p>Web nh&agrave; thuốc rất ủng hộ những tiếng n&oacute;i như n&agrave;y để bảo về quyền lợi cho c&aacute;c quầy, nh&agrave; thuốc. Việc ứng dụng c&ocirc;ng nghệ th&ocirc;ng tin hay phần mềm cần đứng tr&ecirc;n quan điểm đ&uacute;ng luật, bảo mật tối đa dữ liệu kinh doanh của kh&aacute;ch h&agrave;ng v&agrave; thực sự mang tới gi&aacute;<a href=\"http://webnhathuoc.com/home/kiem-soat-khang-sinh-hay-luc-soat-hoat-dong-kinh-doanh-nha-thuoc/\">[&hellip;]</a></p>\n\n<p><a href=\"http://webnhathuoc.com/home/phan-mem-quan-ly-nha-thuoc-cua-web-nha-thuoc-co-tinh-nang-gi-noi-bat-so-voi-nhung-phan-mem-khac-tren-thi-truong/\" title=\"PHẦN MỀM QUẢN LÝ NHÀ THUỐC CỦA WEB NHÀ THUỐC CÓ TÍNH NĂNG GÌ NỔI BẬT SO VỚI NHỮNG PHẦN MỀM KHÁC TRÊN THỊ TRƯỜNG?\"><img alt=\"\" height=\"200\" src=\"http://webnhathuoc.com/home/wp-content/uploads/2019/04/compare-300x300.png\" width=\"200\" /></a></p>\n\n<h5><a href=\"http://webnhathuoc.com/home/phan-mem-quan-ly-nha-thuoc-cua-web-nha-thuoc-co-tinh-nang-gi-noi-bat-so-voi-nhung-phan-mem-khac-tren-thi-truong/\" title=\"PHẦN MỀM QUẢN LÝ NHÀ THUỐC CỦA WEB NHÀ THUỐC CÓ TÍNH NĂNG GÌ NỔI BẬT SO VỚI NHỮNG PHẦN MỀM KHÁC TRÊN THỊ TRƯỜNG?\">PHẦN MỀM QUẢN L&Yacute; NH&Agrave; THUỐC CỦA WEB NH&Agrave; THUỐC C&Oacute; T&Iacute;NH NĂNG G&Igrave; NỔI BẬT SO VỚI NHỮNG PHẦN MỀM KH&Aacute;C TR&Ecirc;N THỊ TRƯỜNG?</a></h5>\n\n<p>WEB NH&Agrave; THUỐC nhận được một c&acirc;u hỏi rất phổ biến từ kh&aacute;ch h&agrave;ng l&agrave; phần mềm quản l&yacute; nh&agrave; thuốc của ch&uacute;ng t&ocirc;i c&oacute; t&iacute;nh năng g&igrave; nổi bật so với những phần mềm kh&aacute;c tr&ecirc;n thị trường? Trước khi trả lời c&acirc;u hỏi tr&ecirc;n, WEB NH&Agrave; THUỐC muốn kể cho bạn về thực<a href=\"http://webnhathuoc.com/home/phan-mem-quan-ly-nha-thuoc-cua-web-nha-thuoc-co-tinh-nang-gi-noi-bat-so-voi-nhung-phan-mem-khac-tren-thi-truong/\">[&hellip;]</a></p>\n\n<p><a href=\"http://webnhathuoc.com/home/#carousel-homepage-latestnews\">Previous</a><a href=\"http://webnhathuoc.com/home/#carousel-homepage-latestnews\">Next</a></p>\n\n<h2>GỬI Y&Ecirc;U CẦU LI&Ecirc;N HỆ</h2>\n\n<form action=\"http://webnhathuoc.com/home/\" method=\"POST\">\n<p><input name=\"myname\" type=\"text\" value=\"\" /></p>\n\n<p><input name=\"myemail\" type=\"email\" value=\"\" /></p>\n\n<p><input name=\"mysubject\" type=\"text\" value=\"\" /></p>\n\n<p><textarea name=\"mymessage\"></textarea></p>\nGỬI LI&Ecirc;N HỆ</form>\n\n<p><img alt=\"\" src=\"http://webnhathuoc.com/home/wp-content/themes/zerif-lite/images/map25-redish.png\" /></p>\n\n<p>C&ocirc;ng ty TNHH WEB NH&Agrave; THUỐC Số 133, Y&ecirc;n Duy&ecirc;n, P Y&ecirc;n Sở, Q Ho&agrave;ng Mai, TP H&agrave; Nội</p>\n\n<p><img alt=\"\" src=\"http://webnhathuoc.com/home/wp-content/themes/zerif-lite/images/envelope4-green.png\" /></p>\n\n<p>Hotro@webnhathuoc.com</p>\n\n<p><img alt=\"\" src=\"http://webnhathuoc.com/home/wp-content/themes/zerif-lite/images/telephone65-blue.png\" /></p>\n\n<p>Số hot line: 098 919 95 35 Số kinh doanh: 098 345 64 55</p>\n\n<ul>\n	<li>&nbsp;</li>\n	<li>&nbsp;</li>\n</ul>\n\n<p>&copy; WEB NH&Agrave; THUỐC 2018</p>\n\n<p><iframe frameborder=\"0\" id=\"QaGMfdK-1569835818649\" scrolling=\"no\" src=\"about:blank\" title=\"chat widget\"></iframe></p>\n\n<p>&nbsp;</p>\n','userfiles/admin_nbm/images/20191010/2019_10_10_17_23_35_265_welcome2x.png',NULL,NULL,NULL,'','',21,29,'2019-09-30 16:33:00',_binary ''),(36,'Bảng giá','','<div class=\"col large-12 small-12\">\n<div class=\"col-inner\">\n<table cellpadding=\"0\" cellspacing=\"0\" class=\"desktop-hidden table table-hover table-price table-striped\">\n	<thead>\n		<tr>\n			<td style=\"width:15%\">Cơ bản</td>\n			<td style=\"width:15%\">Th&ocirc;ng dụng</td>\n			<td style=\"width:15%\">N&acirc;ng cao</td>\n		</tr>\n		<tr>\n			<td style=\"background-color:#5ae08c; text-align:right; width:15%\"><s>200.000/th&aacute;ng</s><br />\n			<strong>100.000<span style=\"font-size:12px\">/th&aacute;ng</span></strong></td>\n			<td style=\"background-color:#2ec264; text-align:right; width:15%\"><s>300.000/th&aacute;ng</s><br />\n			<strong>200.000<span style=\"font-size:12px\">/th&aacute;ng</span></strong></td>\n			<td style=\"background-color:#ade6b5; text-align:right; width:15%\"><s>500.000/th&aacute;ng</s><br />\n			<strong>300.000<span style=\"font-size:12px\">/th&aacute;ng</span></strong></td>\n		</tr>\n	</thead>\n</table>\n\n<table cellpadding=\"0\" cellspacing=\"0\" class=\"table table-hover table-price table-striped\">\n	<thead>\n		<tr>\n			<td rowspan=\"2\">&nbsp;</td>\n			<td style=\"width:15%\">Cơ bản</td>\n			<td style=\"width:15%\">Th&ocirc;ng dụng</td>\n			<td style=\"width:15%\">N&acirc;ng cao</td>\n		</tr>\n		<tr>\n			<td style=\"background-color:#5ae08c; text-align:right; width:15%\"><s>200.000/th&aacute;ng</s><br />\n			<strong>100.000<span style=\"font-size:12px\">/th&aacute;ng</span></strong></td>\n			<td style=\"background-color:#2ec264; text-align:right; width:15%\"><s>300.000/th&aacute;ng</s><br />\n			<strong>200.000<span style=\"font-size:12px\">/th&aacute;ng</span></strong></td>\n			<td style=\"background-color:#ade6b5; text-align:right; width:15%\"><s>500.000/th&aacute;ng</s><br />\n			<strong>300.000<span style=\"font-size:12px\">/th&aacute;ng</span></strong></td>\n		</tr>\n	</thead>\n	<tbody>\n		<tr>\n			<td>Bảng gi&aacute;</td>\n			<td>&nbsp;</td>\n			<td>&nbsp;</td>\n			<td>&nbsp;</td>\n		</tr>\n		<tr>\n			<td>B&aacute;n thuốc bằng m&atilde; vạch</td>\n			<td>&nbsp;</td>\n			<td>&nbsp;</td>\n			<td>&nbsp;</td>\n		</tr>\n		<tr>\n			<td>Hỗ trợ nhiều đơn vị t&iacute;nh</td>\n			<td>&nbsp;</td>\n			<td>&nbsp;</td>\n			<td>&nbsp;</td>\n		</tr>\n		<tr>\n			<td>Quản l&yacute; chuỗi nh&agrave; thuốc</td>\n			<td>&nbsp;</td>\n			<td>&nbsp;</td>\n			<td>&nbsp;</td>\n		</tr>\n		<tr>\n			<td>Redmi Nott</td>\n			<td>&nbsp;</td>\n			<td>&nbsp;</td>\n			<td>&nbsp;</td>\n		</tr>\n		<tr>\n			<td>&nbsp;</td>\n			<td>Chọn</td>\n			<td>Chọn</td>\n			<td>Chọn</td>\n		</tr>\n	</tbody>\n</table>\n</div>\n</div>\n','userfiles/admin_nbm/images/20191011/2019_10_11_9_28_47_105_photo20191011090644.jpg',NULL,NULL,NULL,'','',22,32,'2019-10-11 08:58:36',_binary ''),(37,'Quản lý chuỗi nhà thuốca','1,1,1','','userfiles/admin_nbm/images/20191011/2019_10_11_9_8_59_164_photo20191011090644.jpg','Mobile',NULL,NULL,'','',23,1,'2019-10-11 09:09:01',_binary ''),(38,'Hỗ trợ nhiều đơn vị tính','0,0,1','<p>Qminder has been set up in&nbsp;<a href=\"http://www.verizon.com/\" rel=\"external\" target=\"_blank\">Verizon</a>retail store with cooperation of<a href=\"http://www.wirelesszone.com/\" rel=\"external nofollow\" target=\"_blank\">Wireless Zone</a>, the largest franchise in the US.</p>\n\n<p><img alt=\"Verizon Wireless using Qminder\" src=\"https://www.qminder.com/static/img/blog/verizon/Verizon-Wireless-Qminder.jpg\" title=\"Verizon Wireless using Qminder\" /></p>\n\n<p>Verizon Wireless is the first wireless broadband network provider in USA. The company is a recognized leader in customer service, investing heavily in services and self-service tools that consistently deliver customer satisfaction. They operate in more than 2330 retail locations and provide wireless services to 122 million subscribers.</p>\n\n<p><strong>&ldquo;We have a high volume of customers which sometimes results is a number of customers waiting. Qminder helps us<a href=\"https://www.qminder.com/\" target=\"_blank\">take care of customers in the order they arrived</a>, and gives them peace of mind, from knowing they are in the queue.&rdquo;</strong>&nbsp;tells David Bogart, Owner of Wireless Zone store in Lockport, NY.</p>\n\n<p>Previously the problem of waiting caused many complaints from the clients. How it was managed wasn&rsquo;t clear nor understandable by visitors.</p>\n\n<p><strong>&ldquo;Sometimes with greeters, sometimes with waiting lists maintained as customers entered the store, and sometimes by asking, &ldquo;Who&rsquo;s next&rdquo;?&rdquo;</strong>explains David Bogart.</p>\n\n<p><img alt=\"Qminder iPad app\" src=\"https://www.qminder.com/static/img/blog/verizon/Qminder-iPad-app.jpg\" title=\"Qminder iPad app\" /></p>\n\n<p>The setup at Verizon is simply an iPad for clients to line up, by selecting the desired service and entering their names. It is placed near the entrance for all to see. Employees see the visitors from their computers, tablets or smartphones and greet them by name. Meanwhile customers could browse around in the store and don&rsquo;t need to stand in a line or a&nbsp;<a href=\"https://www.qminder.com/why-queue-barriers-are-ineffective/\" target=\"_self\" title=\"Why queue barriers are ineffective?\">serpentine maze</a>.</p>\n\n<p>Use case of Verizon Wireless retail location is an inspiring example of how large enterprise can simply increase their much valued customer satisfaction and sales by using Qminder tablet application.</p>\n\n<p><a href=\"https://dashboard.qminder.com/signup/\" rel=\"external nofollow\" target=\"_blank\">Try Qminder right now</a>&nbsp;and improve your service today!</p>\n\n<p>&nbsp;</p>\n\n<form action=\"https://qminderapp.us4.list-manage.com/subscribe/post?u=bce3a11cf374bc2b93e260ce8&amp;id=e64ba6dc02\" method=\"post\">\n<h4>Subscribe to Qminder Academy and get valuable service and experience insights delivered straight to your inbox.</h4>\n</form>\n','userfiles/admin_nbm/images/20191011/2019_10_11_9_9_59_867_photo201910110906432.jpg','GREEN',NULL,NULL,'','',23,1,'2019-10-11 09:10:01',_binary ''),(39,'Quản lý chuỗi nhà thuốc','0,0,1','','userfiles/admin_nbm/images/20191011/2019_10_11_9_10_58_732_photo201910110906432.jpg','Mobile',NULL,NULL,'','',23,1,'2019-10-11 09:11:00',_binary ''),(40,'Dùng thuốc giảm cân lợi bất cập hại','Long waiting lines and disorganized waiting rooms are among the top 3 reasons why customers bail on businesses. Waiting is just another part of your service package, and it can make or break your customers’ experience.','<p>Sau Tết ăn nhiều b&aacute;nh chưng, thực phẩm gi&agrave;u đạm v&agrave; chất b&eacute;o, ăn nhiều b&aacute;nh kẹo... khiến kh&ocirc;ng &iacute;t người c&oacute; xu hướng tăng c&acirc;n v&agrave; t&igrave;m đến thuốc để giảm c&acirc;n.<br />\n<br />\nTuy nhi&ecirc;n việc d&ugrave;ng loại thuốc n&agrave;y cũng g&acirc;y cho người sử dụng nhiều phiền to&aacute;i.</p>\n\n<p><strong>&nbsp;</strong></p>\n\n<p><strong>Lợi &iacute;ch của thuốc giảm c&acirc;n</strong></p>\n\n<p><br />\nVề nguy&ecirc;n tắc, muốn giảm c&acirc;n ch&uacute;ng ta phải &ldquo;cắt&rdquo; năng lượng qua đường ăn uống hoặc ti&ecirc;u hao phần lớn năng lượng đ&oacute; qua luyện tập. Tuy nhi&ecirc;n, liệu ta c&oacute; thể nhịn ăn hoặc tr&aacute;nh tất cả m&oacute;n ăn m&igrave;nh y&ecirc;u th&iacute;ch, sống như nh&agrave; tu h&agrave;nh khổ hạnh? Hoặc h&agrave;ng ng&agrave;y tập luyện cật lực đến... kiệt sức?<br />\n<br />\nNhịn ăn qu&aacute; đ&agrave; sẽ khiến cơ thể thiếu dưỡng chất, suy kiệt. Trong khi đ&oacute;, người thừa c&acirc;n, b&eacute;o ph&igrave; nếu tập qu&aacute; sức, tập nặng kh&ocirc;ng ph&ugrave; hợp với t&igrave;nh trạng sức khỏe... c&oacute; thể g&acirc;y tho&aacute;i h&oacute;a khớp, trụy tim mạch, tăng huyết &aacute;p, đột quỵ... Cho n&ecirc;n lợi &iacute;ch của việc d&ugrave;ng thuốc giảm c&acirc;n l&agrave; kh&ocirc;ng cần mất nhiều thời gian luyện tập thể thao, kh&ocirc;ng cần &aacute;p dụng chế độ ăn ki&ecirc;ng kham khổ m&agrave; vẫn c&oacute; thể giảm c&acirc;n. Điều n&agrave;y ph&ugrave; hợp với người bận rộn hoặc ngại tập thể dục v&agrave; c&oacute; &ldquo;t&acirc;m hồn ăn uống&rdquo;, tuy nhi&ecirc;n vẫn cần c&oacute; chế độ ăn uống khoa học kể cả khi d&ugrave;ng thuốc.<br />\n<br />\nC&aacute;c loại thuốc giảm c&acirc;n đều hoạt động bằng c&aacute;ch t&aacute;c động trực tiếp v&agrave;o hệ ti&ecirc;u h&oacute;a v&agrave; những bộ phận c&oacute; li&ecirc;n quan để giảm sự hấp thu c&aacute;c chất dinh dưỡng v&agrave; g&acirc;y cảm gi&aacute;c kh&ocirc;ng muốn ăn cho người sử dụng, do đ&oacute; sẽ l&agrave;m giảm lượng calo đưa v&agrave;o trong cơ thể v&agrave; l&agrave;m giảm c&acirc;n.<br />\n<br />\nB&ecirc;n cạnh việc hạn chế cảm gi&aacute;c th&egrave;m ăn, một số thuốc giảm c&acirc;n c&ograve;n c&oacute; khả năng t&aacute;c động đến sự ức chế men lipaza ti&ecirc;u h&oacute;a chất b&eacute;o, l&agrave;m cho chất b&eacute;o kh&ocirc;ng hấp thu v&agrave;o cơ thể, thải mỡ thừa ra ngo&agrave;i theo đường ti&ecirc;u h&oacute;a.<br />\n<br />\n<strong>V&agrave; t&aacute;c hại</strong><br />\n<br />\nHiện nay, tr&ecirc;n thị trường c&oacute; rất nhiều nh&atilde;n thuốc giảm c&acirc;n được lưu h&agrave;nh. Thuốc giảm c&acirc;n thường được chia l&agrave;m 4 loại ch&iacute;nh: thuốc g&acirc;y ch&aacute;n ăn, thuốc l&agrave;m no ống ti&ecirc;u h&oacute;a, thuốc tăng cường chuyển h&oacute;a c&aacute;c chất g&acirc;y b&eacute;o trong cơ thể v&agrave; thuốc Đ&ocirc;ng y.<br />\n<br />\nNh&oacute;m thuốc g&acirc;y ch&aacute;n ăn: T&aacute;c dụng giảm c&acirc;n của thuốc l&agrave; tạo cảm gi&aacute;c kh&ocirc;ng muốn ăn, l&agrave; loại thuốc c&oacute; chứa amphetamin hoặc c&aacute;c dẫn chất tương tự như benzedrine, phenamin, mirapront N... Khi uống loại thuốc n&agrave;y, c&aacute;c chất tr&ecirc;n sẽ t&aacute;c động l&ecirc;n hệ thần kinh trung ương l&agrave;m mất cảm gi&aacute;c đ&oacute;i, ăn mất ngon, kh&ocirc;ng muốn ăn, g&acirc;y mất ngủ... l&agrave;m giảm khẩu phần ăn v&agrave; giảm c&acirc;n. Đ&acirc;y l&agrave; loại thuốc được sử dụng phổ biến nhất, tuy nhi&ecirc;n thuốc g&acirc;y ra nhiều t&aacute;c dụng phụ nguy hiểm. Nếu ch&uacute;ng ta qu&aacute; lạm dụng, n&oacute; c&oacute; thể g&acirc;y nghiện. Khi ngưng d&ugrave;ng, c&aacute;c bạn c&oacute; thể rơi v&agrave;o trạng th&aacute;i rối loạn t&acirc;m l&yacute;, ch&aacute;n nản, muốn tự tử... Đặc biệt, với những người bị bệnh tim mạch, tăng huyết &aacute;p, tăng nh&atilde;n &aacute;p khi sử dụng c&ograve;n c&oacute; nguy cơ bị suy tim, m&ugrave; mắt...<br />\n<br />\nThuốc giảm c&acirc;n l&agrave;m no ống ti&ecirc;u h&oacute;a: Đ&acirc;y l&agrave; loại thuốc giảm c&acirc;n c&oacute; chứa c&aacute;c chất sterculia, methylcellulose... Khi sử dụng loại thuốc n&agrave;y, c&aacute;c chất tr&ecirc;n sẽ nằm trong l&ograve;ng ruột, h&uacute;t nước, trương nở v&agrave; tạo cảm gi&aacute;c đầy bụng, khiến cơ thể kh&ocirc;ng cảm thấy đ&oacute;i, l&agrave;m giảm khẩu phần ăn. Tuy nhi&ecirc;n, thuốc l&agrave;m no ống ti&ecirc;u h&oacute;a cũng g&acirc;y ra c&aacute;c t&aacute;c dụng phụ như trướng bụng, đầy hơi. Những người mắc chứng hẹp đường ti&ecirc;u h&oacute;a, chứng to kết tr&agrave;ng, c&oacute; thể bị tắc ruột khi sử dụng loại thuốc n&agrave;y.<br />\n<br />\nThuốc giảm c&acirc;n l&agrave;m tăng cường chuyển h&oacute;a c&aacute;c chất g&acirc;y b&eacute;o: Đ&acirc;y l&agrave; loại thuốc hiện nay được nhiều người d&ugrave;ng kh&ocirc;ng chỉ ở nước ta m&agrave; nhiều nước tr&ecirc;n thế giới. Loại thuốc n&agrave;y c&oacute; chứa nội tiết tố tuyến gi&aacute;p thyroxin, l&agrave; chất c&oacute; khả năng l&agrave;m gia tăng chuyển h&oacute;a chất b&eacute;o b&ecirc;n trong c&aacute;c tế b&agrave;o, từ đ&oacute; giảm đi lượng mỡ trong cơ thể. Tuy nhi&ecirc;n, loại thuốc n&agrave;y chỉ c&oacute; t&aacute;c dụng với chứng b&eacute;o ph&igrave; do cơ thể thiếu thyroxin g&acirc;y ra (người bị suy gi&aacute;p trạng). Việc sử dụng bừa b&atilde;i kh&ocirc;ng chỉ kh&ocirc;ng c&oacute; t&aacute;c dụng giảm c&acirc;n m&agrave; c&ograve;n g&acirc;y nguy hại cho tim, l&agrave;m ức chế chức năng tuyến gi&aacute;p, g&acirc;y bướu cổ...<br />\n<br />\nThuốc giảm c&acirc;n Đ&ocirc;ng y: Cần thận trọng với c&aacute;c thuốc Đ&ocirc;ng y gia truyền kh&ocirc;ng r&otilde; nguồn gốc. C&aacute;c thuốc Đ&ocirc;ng y thường chứa những dược liệu g&acirc;y nhuận tr&agrave;ng, lợi tiểu cũng g&acirc;y ảnh hưởng xấu đến sức khỏe như rối loạn điện giải, trụy tim mạch do mất nước.<br />\n<br />\n<em><strong>Theo SK&amp;ĐS</strong></em></p>\n','userfiles/admin_nbm/images/20191011/2019_10_11_18_39_8_66_macbook2x.png',NULL,NULL,NULL,'thuốc giảm cân','',23,32,'2019-10-11 09:21:54',_binary ''),(41,'Vận hành trực tuyến On-line','Long waiting lines and disorganized waiting rooms are among the top 3 reasons why customers bail on businesses. Waiting is just another part of your service package, and it can make or break your customers’ experience.','','userfiles/admin_nbm/images/20191011/2019_10_11_9_10_58_732_photo201910110906432.jpg','Mobile',NULL,NULL,'','',23,1,'2019-10-11 11:53:33',_binary ''),(42,'Hỗ trợ mở 2 kho','Long waiting lines and disorganized waiting rooms are among the top 3 reasons why customers bail on businesses. Waiting is just another part of your service package, and it can make or break your customers’ experience.\n\n','','userfiles/admin_nbm/images/20191011/2019_10_11_18_38_26_94_macbook2x.png',NULL,NULL,NULL,'','',23,1,'2019-10-11 11:59:52',_binary ''),(43,'Redmi Nott ','Redmi Nott Redmi Nott Redmi Nott Redmi Nott Redmi Nott ','','userfiles/admin_nbm/images/20191011/2019_10_11_18_38_10_400_welcome2x.png',NULL,NULL,NULL,'','',22,1,'2019-10-11 12:00:37',_binary '');
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
INSERT INTO `categories` VALUES (1,'Trang chủ 2',14,'/home',NULL,'','',20,23,1,'2019-09-12 18:39:01',_binary '',_binary ''),(19,'thuy nguyen',14,'/chuyen-muc/thuy-nguyen-1-1-19',NULL,'','',20,25,1,'2019-09-26 17:38:39',_binary '',_binary ''),(20,'Trang chủ',14,'/',NULL,'','',0,1,29,'2019-09-30 16:12:04',_binary '',NULL),(21,'Tính năng',14,'/tinh-nang-21',NULL,'','',0,19,29,'2019-09-30 16:12:24',_binary '',_binary '\0'),(22,'Bảng giá',14,'/bang-gia-22',NULL,'','',0,20,29,'2019-09-30 16:12:42',_binary '',_binary ''),(23,'Hỗ trợ hướng dẫn sử dụng',14,'/ho-tro-23',NULL,'','',0,1,29,'2019-09-30 16:12:58',_binary '',_binary '\0'),(24,'Liên hệ',14,'/lien-he-24',NULL,'','',0,21,29,'2019-09-30 16:18:11',_binary '',_binary '\0'),(25,'Đăng ký',14,'/trang-chu/dang-ky-14-20-25',NULL,'','',20,29,29,'2019-09-30 16:30:53',_binary '',_binary ''),(26,'Dịch vụ',14,'/trang-chu/dang-nhap-14-20-26',NULL,'','',20,2,29,'2019-09-30 16:31:18',_binary '',_binary ''),(28,'Giới thiệu',14,'/trang-chu/gioi-thieu-14-20-28',NULL,'','',20,28,1,'2019-10-08 17:03:16',_binary '',_binary ''),(29,'Tên đẹp',14,'/abc-29',NULL,'cx','cx',20,1,1,'2019-10-09 16:31:56',_binary '',_binary ''),(30,'Sức khỏe',15,'/suc-khoe-30',NULL,'','',0,25,32,'2019-10-11 08:58:02',_binary '',_binary '');
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
INSERT INTO `districts` VALUES (21,'Bắc Từ Liêm',18,1,'2019-09-23 14:02:40',_binary ''),(22,'Ba Đình',18,1,'2019-09-23 14:02:55',_binary ''),(23,'Cầu Giấy',18,1,'2019-09-23 14:03:11',_binary ''),(24,'Đống Đa',18,1,'2019-09-23 14:03:23',_binary ''),(25,'Hai Bà Trưng',18,1,'2019-09-23 14:03:36',_binary ''),(26,'Hoàn Kiếm',18,1,'2019-09-23 14:03:49',_binary ''),(27,'Hà Đông',18,1,'2019-09-23 14:04:01',_binary ''),(28,'Hoàng Mai',18,1,'2019-09-23 14:04:15',_binary ''),(29,'Long Biên',18,1,'2019-09-23 14:04:26',_binary ''),(30,'Thanh Xuân',18,1,'2019-09-23 14:04:40',_binary ''),(31,'Tây Hồ',18,1,'2019-09-23 14:04:53',_binary ''),(32,'Nam Từ Liêm',18,1,'2019-09-23 14:05:05',_binary ''),(33,'Đan Phượng',18,1,'2019-09-23 14:05:18',_binary ''),(34,'Gia Lâm',18,1,'2019-09-23 14:05:30',_binary ''),(35,'Đông Anh',18,1,'2019-09-23 14:05:46',_binary ''),(36,'Chương Mỹ',18,1,'2019-09-23 14:06:03',_binary ''),(37,'Hoài Đức',18,1,'2019-09-23 14:06:16',_binary ''),(38,'Ba Vì',18,1,'2019-09-23 14:06:30',_binary ''),(39,'Mỹ Đức',18,1,'2019-09-23 14:06:42',_binary ''),(40,'Phúc Thọ',18,1,'2019-09-23 14:06:53',_binary ''),(41,'Mê Linh',18,1,'2019-09-23 14:07:07',_binary ''),(42,'Sóc Sơn',18,1,'2019-09-23 14:07:21',_binary ''),(43,'Thạch Thất',18,1,'2019-09-23 14:07:33',_binary ''),(44,'Quốc Oai',18,1,'2019-09-23 14:07:45',_binary ''),(45,'Thanh Oai',18,1,'2019-09-23 14:07:58',_binary ''),(46,'Phú Xuyên',18,1,'2019-09-23 14:08:09',_binary ''),(47,'Sơn Tây',18,1,'2019-09-23 14:09:31',_binary ''),(48,'Tam Điệp',34,1,'2019-09-23 14:10:48',_binary ''),(49,'Hoa Lư',34,1,'2019-09-23 14:11:18',_binary ''),(50,'Gia Viễn',34,1,'2019-09-23 14:11:30',_binary ''),(51,'Nho Quan',34,1,'2019-09-23 14:11:44',_binary ''),(52,'Yên Khánh',34,1,'2019-09-23 14:11:55',_binary ''),(53,'Yên Mô',34,1,'2019-09-23 14:12:10',_binary ''),(54,'Kim Sơn',34,1,'2019-09-23 14:12:24',_binary ''),(55,'Hải Châu',78,1,'2019-09-23 14:13:24',_binary ''),(56,'Cẩm Lệ',78,1,'2019-09-23 14:13:37',_binary ''),(57,'Thanh Khê',78,1,'2019-09-23 14:13:49',_binary ''),(58,'Liên Chiểu',78,1,'2019-09-23 14:14:02',_binary ''),(59,'Ngũ Hành Sơn',78,1,'2019-09-23 14:14:16',_binary ''),(60,'Sơn Trà',78,1,'2019-09-23 14:14:28',_binary ''),(61,'Hòa Vang',78,1,'2019-09-23 14:14:40',_binary ''),(62,'Hoàng Sa',78,1,'2019-09-23 14:14:52',_binary ''),(63,'Cẩm Giàng',19,1,'2019-09-23 14:15:26',_binary ''),(64,'Gia Lộc',19,1,'2019-09-23 14:15:37',_binary ''),(65,'Kim Thành',19,1,'2019-09-23 14:15:48',_binary ''),(66,'Kinh Môn',19,1,'2019-09-23 14:16:05',_binary ''),(67,'Nam Sách',19,1,'2019-09-23 14:16:16',_binary ''),(68,'Ninh Giang',19,1,'2019-09-23 14:16:34',_binary ''),(69,'Thanh Hà',19,1,'2019-09-23 14:16:51',_binary ''),(70,'Chí Linh',19,1,'2019-09-23 14:17:07',_binary ''),(71,'Thanh Miện',19,1,'2019-09-23 14:17:17',_binary ''),(72,'Tứ Kỳ',19,1,'2019-09-23 14:17:30',_binary ''),(73,'TP Hải Dương',19,1,'2019-09-23 14:17:45',_binary ''),(74,'TP Ninh Bình',34,1,'2019-09-23 14:27:32',_binary ''),(75,'TP Hạ Long',66,1,'2019-09-23 14:47:06',_binary ''),(76,'TP Móng Cái',66,1,'2019-09-23 14:47:24',_binary ''),(77,'TP Cẩm Phả',66,1,'2019-09-23 14:47:45',_binary ''),(78,'TP Uông Bí',66,1,'2019-09-23 14:48:12',_binary ''),(79,'Vân Đồn',66,1,'2019-09-23 14:48:27',_binary ''),(80,'Cô Tô',66,1,'2019-09-23 14:48:50',_binary ''),(81,'Nam Đàn',27,1,'2019-09-23 14:49:24',_binary ''),(82,'Con Cuông',27,1,'2019-09-23 14:49:45',_binary ''),(83,'Châu Thành',42,1,'2019-09-23 14:51:43',_binary ''),(84,'Bình Đại',42,1,'2019-09-23 14:51:57',_binary ''),(85,'Mỏ Cày Nam',42,1,'2019-09-23 14:52:13',_binary ''),(86,'Ninh Kiều',77,1,'2019-09-23 14:52:56',_binary ''),(87,'Ô Môn',77,1,'2019-09-23 14:53:11',_binary ''),(88,'Cái Răng',77,1,'2019-09-23 14:53:22',_binary ''),(89,'Thốt Nốt',77,1,'2019-09-23 14:53:33',_binary ''),(90,'Thanh Trì',18,1,'2019-09-23 15:37:36',_binary ''),(91,'Từ Sơn',26,1,'2019-10-04 08:57:01',_binary ''),(92,'Thốt Nốt',38,1,'2019-10-10 10:25:12',_binary '');
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
INSERT INTO `group_places` VALUES (1,'Phòng khám',1,'2019-09-12 19:21:38',_binary ''),(19,'Nhà thuốc',1,'2019-09-23 10:31:28',_binary ''),(20,'Thẩm mĩ viện',1,'2019-09-23 10:31:41',_binary ''),(21,'Phòng khám y học cổ truyền',1,'2019-09-23 10:55:14',_binary ''),(22,'Cửa hàng thiết bị y tế',1,'2019-09-23 10:55:37',_binary ''),(23,'Trung tâm y tế',1,'2019-09-23 10:55:48',_binary ''),(24,'Trung tâm tư vấn tâm lý',1,'2019-09-23 10:56:39',_binary ''),(25,'Trạm y tế',1,'2019-09-23 10:57:13',_binary ''),(26,'Viện dưỡng lão',1,'2019-09-23 10:57:24',_binary ''),(27,'Trung tâm xét nghiệm',1,'2019-09-23 10:57:37',_binary ''),(28,'Trung tâm nghiên cứu sinh học và y dược',1,'2019-09-23 10:58:15',_binary ''),(29,'CONNECTCARE',1,'2019-09-30 15:49:56',_binary '');
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
INSERT INTO `group_sites` VALUES (1,'Quản trị',1,'2019-09-12 15:11:31',_binary ''),(40,'Landing page',1,'2019-09-23 11:45:31',_binary ''),(41,'Người dùng',1,'2019-09-23 11:45:40',_binary ''),(42,'csd',1,'2019-09-30 14:25:08',_binary ''),(43,'Giới thiệu',1,'2019-09-30 15:58:56',_binary '');
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
INSERT INTO `group_users` VALUES (1,'Quản trị hệ thống','2019-09-12 19:09:30',1,_binary ''),(2,'Quản trị cơ sở y tế','2019-09-12 19:09:30',1,_binary ''),(3,'Nhân viên cơ sở y tế','2019-09-12 19:09:30',1,_binary ''),(4,'Quản trị nhà thuốc','2019-09-25 08:26:30',1,_binary '');
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
  `name` varchar(200) NOT NULL COMMENT 'Tên duy nhất tron bảng theo places_id',
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='Khách hàng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `med_customers`
--

LOCK TABLES `med_customers` WRITE;
/*!40000 ALTER TABLE `med_customers` DISABLE KEYS */;
INSERT INTO `med_customers` VALUES (8,'Đỗ Nguyễn Lan Anh',23,'google.com\ngoogle.com','0972290154','admin@nbm.vn.com',35,2,'2019-10-01 11:46:08',28,_binary ''),(9,'Nguyễn Xuân Thủy',18,'google.com\ngoogle.com','0972290153','123@123.com.vn',35,2,'2019-10-01 12:03:28',28,_binary ''),(11,'Nguyen Thi Huyen Trang',NULL,'a','84916960362','n@gmail.com.vn',35,3,'2019-10-02 10:21:42',28,_binary ''),(12,'Hoan Nguyễn',23,'Keangnam','0368973438','123@123.com',35,2,'2019-10-02 12:03:20',28,_binary ''),(16,'Đào Hải',24,'34234','84909222112','sales.lehaoco@gmail.com',35,3,'2019-10-02 14:22:54',28,_binary ''),(17,'Nguyễn Minh Thúy',29,'Số 1 Thái Hà','0909222111','min@gmail.com',35,2,'2019-10-03 09:16:20',28,_binary ''),(18,'Giang Văn Minh',18,'   ','0372776544','m@gmail.com',35,2,'2019-10-07 08:42:59',32,_binary ''),(19,'Nguyễn Hạnh',23,'','0983334989',NULL,35,1,'2019-10-08 11:21:05',1,_binary ''),(22,'Đào Hải',24,NULL,'0944733239','',35,2,'2019-10-11 11:43:23',1,_binary ''),(23,'Nguyễn Thị Hoan',NULL,'','0368973439',NULL,35,1,'2019-10-11 11:44:45',1,_binary ''),(24,'Trần An',1,'abc','0985555555','',35,2,'2019-10-14 11:47:24',1,_binary ''),(25,'Trần An Bình',1,'abc','0983334985','',35,2,'2019-10-14 11:48:32',1,_binary ''),(26,'Nguyễn An',1,'abc','0983334912','',35,2,'2019-10-14 11:50:33',1,_binary ''),(27,'Nguyễn Anh Khánh',1,'abc','098333495','',35,2,'2019-10-14 14:20:25',1,_binary '');
/*!40000 ALTER TABLE `med_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `med_goods_issue_detail`
--

DROP TABLE IF EXISTS `med_goods_issue_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `med_goods_issue_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'bảng chi tiết phiếu xuất',
  `goods_issues_id` bigint(20) NOT NULL,
  `medicines_id` bigint(20) NOT NULL COMMENT 'thuốc bán',
  `units_id` bigint(20) NOT NULL COMMENT 'đơn vị bán lẻ',
  `quantities` bigint(20) NOT NULL COMMENT 'số lượn bán',
  `coefficient` bigint(20) DEFAULT NULL,
  `price` bigint(20) NOT NULL COMMENT 'giá bán đã bao gồm VAT',
  `dose_per_day` bigint(20) NOT NULL COMMENT 'số liều/ngày ',
  `quantities_per_time` bigint(20) NOT NULL COMMENT 'số lương /lần uống',
  `places_id` bigint(20) NOT NULL,
  `discounts` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Giảm giá',
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
  `issue_code` varchar(100) NOT NULL COMMENT 'mã duy nhất theo places_id',
  `users_seller_id` bigint(20) NOT NULL COMMENT 'người bán',
  `payment_methods_id` bigint(20) NOT NULL,
  `warehouses_id` bigint(20) NOT NULL,
  `debit` bit(1) NOT NULL,
  `invoice_code` varchar(100) DEFAULT NULL,
  `invoice_date` datetime DEFAULT NULL,
  `issue_date` datetime DEFAULT NULL COMMENT 'ngày xuất ',
  `customers_id` bigint(20) NOT NULL,
  `descriptions` varchar(200) DEFAULT NULL,
  `places_id` bigint(20) DEFAULT NULL,
  `users_creator_id` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'ngày tạo',
  `status` bit(1) NOT NULL DEFAULT b'1',
  `issue_type` int(11) DEFAULT '1' COMMENT '1: bán hàng\n2: Xuất trả nhà cung cấp\n3: Xuất hủy\n4: xuất nội bộ\n5: kiểm kho',
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
  `goods_receipts_id` bigint(20) NOT NULL COMMENT 'phiếu nhập thuốc',
  `medicines_id` bigint(20) NOT NULL COMMENT 'tên thuốc',
  `lotnumber` varchar(100) NOT NULL COMMENT 'số lô hàng nhập',
  `quantities_request` bigint(20) NOT NULL COMMENT 'số hàng yêu cầu/hoặc trên phiếu giao',
  `quantities_received` bigint(20) NOT NULL COMMENT 'số hàng thực nhận',
  `retail_quantities` bigint(20) DEFAULT NULL COMMENT 'Số lượng(bán lẻ)',
  `price` bigint(20) NOT NULL COMMENT 'giá nhập',
  `expired_date` datetime NOT NULL COMMENT 'ngày hết hạn',
  `quantities_in_stock` bigint(20) DEFAULT NULL COMMENT 'Số hàng còn trong kho ( tính theo đơn vị bán lẻ)',
  `manufacturing_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày sản xuất',
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
  `receipt_code` varchar(100) NOT NULL COMMENT 'mã phiếu duy nhất theo places_id trong bảng',
  `shipper_name` varchar(100) DEFAULT NULL COMMENT 'người giao hàng',
  `payment_methods_id` bigint(20) NOT NULL COMMENT 'phương thức thanh toán',
  `warehouses_id` bigint(20) NOT NULL COMMENT 'kho thuốc',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'ngày tạo hệ thống',
  `date_receipt` datetime NOT NULL COMMENT 'ngày nhập hàng',
  `debit` bit(1) NOT NULL COMMENT 'công nợ có',
  `invoice_code` varchar(100) DEFAULT NULL COMMENT 'số hóa đơn VAT',
  `invoice_date` datetime DEFAULT NULL COMMENT 'Ngày viết hóa đơn',
  `descriptions` varchar(200) DEFAULT NULL COMMENT 'ghi chú',
  `users_recipient_id` bigint(20) NOT NULL COMMENT 'người nhận',
  `users_creator_id` bigint(20) NOT NULL COMMENT 'người cập nhật hệ thống',
  `suppliers_id` bigint(20) NOT NULL COMMENT 'nhà cung cấp',
  `status` bit(1) NOT NULL DEFAULT b'1' COMMENT 'trạng thái',
  `places_id` bigint(20) NOT NULL COMMENT 'cơ sở y tế',
  `receipt_type` int(11) DEFAULT '1' COMMENT '1: Nhập từ nhà cung cấp\n2: Khách trả\n3: Nhập tồn',
  `good_receipt_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `receipt_code_UNIQUE` (`receipt_code`,`places_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Phiếu nhập hàng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `med_goods_receipts`
--

LOCK TABLES `med_goods_receipts` WRITE;
/*!40000 ALTER TABLE `med_goods_receipts` DISABLE KEYS */;
INSERT INTO `med_goods_receipts` VALUES (1,'KL20055','Đỗ Minh Thư',6,7,'2019-10-14 09:32:08','2019-10-02 09:27:57',_binary '','025','2019-10-03 09:28:16','null',29,1,5,_binary '',35,1,NULL);
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
  `name` varchar(200) NOT NULL COMMENT '-Tên duy nhất trong bảng places_id',
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
INSERT INTO `med_group_customers` VALUES (1,'Khách hàng bác sĩ','2019-09-25 13:34:49',1,35,_binary ''),(2,'Khách hàng lẻ','2019-09-25 13:35:16',1,35,_binary ''),(3,'Khách hàng sỉ','2019-09-25 13:35:55',1,35,_binary ''),(4,'Khách hàng thường xuyên','2019-09-25 13:40:02',1,35,_binary '');
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
  `name` varchar(200) NOT NULL COMMENT '-Tên duy nhất trong bảng theo places_id và parentid',
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
INSERT INTO `med_group_medicines` VALUES (1,'Nhóm thuốc tim mạch','2019-09-24 22:53:43',1,0,35,_binary ''),(15,'Nhóm thuốc điều trị suy tim sung huyết','2019-10-02 18:31:01',28,1,35,_binary ''),(16,'Nhóm thuốc điều trị thiếu máu cục bộ','2019-10-02 18:31:20',28,1,35,_binary ''),(17,'Nhóm thuốc điều trị loạn nhịp tim','2019-10-02 18:31:34',28,1,35,_binary ''),(18,'Nhóm thuốc điều trị tăng huyết áp','2019-10-02 18:31:50',28,1,35,_binary ''),(19,'Nhóm thuốc chống choáng và chống sốc','2019-10-02 18:32:52',28,1,35,_binary ''),(20,'Thuốc gây mê','2019-10-02 18:33:36',28,0,35,_binary ''),(21,'Thuốc gây mê và oxygen','2019-10-02 18:33:51',28,20,35,_binary ''),(22,'Thuốc gây tê tại chỗ ','2019-10-02 18:34:03',28,20,35,_binary ''),(23,'Thuốc tiền mê','2019-10-02 18:34:18',28,20,35,_binary ''),(24,'THUỐC GIẢM ĐAU VÀ HẠ SỐT NHÓM CHỐNG VIÊM','2019-10-02 18:35:59',28,0,35,_binary ''),(25,'Thuốc giảm đau không có opi','2019-10-02 18:36:19',28,24,35,_binary ''),(26,'Thuốc hạ sốt','2019-10-02 18:36:37',28,24,35,_binary ''),(27,'Thuốc chống viêm không steroid','2019-10-02 18:36:54',28,24,35,_binary ''),(28,'Thuốc giảm đau loại opi','2019-10-02 18:37:14',28,24,35,_binary ''),(29,'Thuốc điều trị bệnh gút','2019-10-02 18:37:57',28,24,35,_binary ''),(30,'THUỐC CHỐNG DỊ ỨNG TRONG CÁC TRƯỜNG HỢP QUÁ MẪN','2019-10-02 18:38:29',28,0,35,_binary ''),(31,'THUỐC GIẢI ĐỘC','2019-10-02 18:38:43',28,0,35,_binary ''),(32,'Thuốc giải độc đặc hiệu','2019-10-02 18:38:58',28,31,35,_binary ''),(33,'Thuốc giải độc không đặc hiệu','2019-10-02 18:39:12',28,31,35,_binary ''),(34,'THUỐC CHỐNG ĐỘNG KINH','2019-10-02 18:39:26',28,0,35,_binary ''),(35,'THUỐC TRỊ KÝ SINH TRÙNG CHỐNG NHIỄM KHUẨN','2019-10-02 18:39:41',28,0,35,_binary ''),(36,'Thuốc trị giun và sán','2019-10-02 18:40:03',28,35,35,_binary ''),(37,'Thuốc trị giun chỉ ','2019-10-02 18:40:23',28,35,35,_binary ''),(38,'Thuốc trị sán lá','2019-10-02 18:40:44',28,35,35,_binary ''),(39,'Thuốc rối loạn','2019-10-03 09:45:11',28,0,35,_binary ''),(40,'Thuốc Giảm đau','2019-10-09 15:31:25',32,0,35,_binary ''),(41,'Thuốc cường dương','2019-10-11 15:41:49',32,0,35,_binary '');
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
INSERT INTO `med_group_producers` VALUES (1,'Đông y',NULL,'2019-09-27 15:09:48',28,35,_binary ''),(2,'Thực phẩm chức năng',NULL,'2019-09-27 15:23:52',28,35,_binary ''),(3,'Vật tư thiết bị y tế',NULL,'2019-09-27 15:35:31',28,35,_binary ''),(4,'Dược phẩm',NULL,'2019-09-27 16:59:41',28,35,_binary ''),(13,'Thảo dược',NULL,'2019-10-02 16:26:22',28,35,_binary ''),(14,'Nhóm 01',NULL,'2019-10-14 10:12:56',1,35,_binary ''),(15,'Công ty Afeco',NULL,'2019-10-14 10:20:14',1,35,_binary ''),(16,'Nhóm 02',NULL,'2019-10-14 10:22:53',1,35,_binary '');
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
  `name` varchar(200) NOT NULL COMMENT '-Tên duy nhất trong bảng places_id',
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
INSERT INTO `med_group_suppliers` VALUES (1,'Nhóm nhà cung cấp thuốc đông y và lá thuốc','2019-09-25 13:40:11',1,35,_binary ''),(2,'Nhóm nhà cung cấp y dược','2019-09-25 13:40:28',1,35,_binary ''),(3,'Nhóm nhà cung cấp dược phẩm','2019-09-25 13:40:30',1,35,_binary ''),(4,'Nhóm nhà cung cấp thuốc và thảo dược','2019-09-25 13:44:45',1,35,_binary ''),(5,'Nhà cung cấp thực phẩm chức năng','2019-09-25 16:24:09',28,35,_binary ''),(6,'Nhà cung cấp trang thiết bị y tế và vật tư y tế','2019-09-25 16:24:35',28,35,_binary ''),(7,'Nhà cung cấp thuốc kháng sinh ','2019-09-25 16:27:32',28,35,_binary ''),(8,'Nhà cung cấp thuốc thảo dược','2019-10-07 09:33:59',28,35,_binary ''),(9,'Nhà cung cấp số 2','2019-10-08 09:19:46',1,35,_binary '\0'),(10,'Nhóm nhà cung cấp 01','2019-10-14 10:29:20',1,35,_binary ''),(11,'Nhóm 02','2019-10-14 10:29:35',1,35,_binary ''),(12,'Abc','2019-10-14 10:30:45',1,35,_binary '');
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
INSERT INTO `med_medicine_locations` VALUES (1,'Dưới trái','Dưới trái','2019-09-25 13:47:49',1,35,_binary ''),(2,'Dưới phải','Dưới phải','2019-09-25 13:48:21',1,35,_binary ''),(3,'Chính giữa','Chính giữa','2019-09-25 13:49:06',1,35,_binary ''),(4,'thuy','rdds','2019-09-25 18:09:15',28,36,_binary ''),(5,'Trên cùng','Trên cùng','2019-09-27 17:57:34',28,35,_binary ''),(6,'Trên phải','Trên phải\n\ncùng đó','2019-09-30 10:36:46',28,35,_binary ''),(7,'Trên trái','Trên trái','2019-09-30 14:11:16',28,35,_binary ''),(8,'Dưới giữa','Dưới giữa','2019-10-03 09:15:19',28,35,_binary ''),(9,'Bên trái','Bên trái\n','2019-10-03 09:16:31',28,35,_binary ''),(10,'Bên phải','Bên phải','2019-10-03 09:38:00',28,35,_binary ''),(11,'H12','H12\n','2019-10-03 09:38:17',28,35,_binary ''),(12,'H22','H22\n','2019-10-08 08:26:54',32,35,_binary '\0'),(13,'VT1',NULL,'2019-10-14 11:02:26',1,35,_binary '');
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
  `name` varchar(200) NOT NULL COMMENT 'Tên thuốc duy nhất theo places_id',
  `images` varchar(300) DEFAULT NULL COMMENT 'ảnh thuốc',
  `barcode` varchar(200) DEFAULT NULL COMMENT 'mã vạch',
  `packages_id` bigint(20) NOT NULL COMMENT 'quy cách đóng gói',
  `active_element_name` varchar(50) NOT NULL COMMENT 'tên hoạt chất',
  `registration_number` varchar(100) NOT NULL COMMENT 'số đăng ký với cục quản lý dược',
  `concentrations` varchar(300) NOT NULL COMMENT 'Nồng độ/hàm lượng ',
  `producers_id` bigint(20) NOT NULL COMMENT 'nhà sản xuất',
  `made_in` varchar(100) DEFAULT NULL COMMENT 'thuốc đc sản xuất ',
  `standard` varchar(50) DEFAULT NULL COMMENT 'tiêu chuẩn',
  `group_medicines_id` bigint(20) NOT NULL COMMENT 'nhóm thuốc',
  `medicine_locations_id` bigint(20) DEFAULT NULL,
  `places_id` bigint(20) NOT NULL COMMENT 'cơ sở y tế',
  `retail_price` bigint(20) NOT NULL COMMENT 'giá bán lẻ',
  `wholesale_price` bigint(20) NOT NULL COMMENT 'giá bán buôn',
  `types_id` bigint(20) NOT NULL COMMENT 'loại thuốc',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'ngày tạo trên hệ thống',
  `users_creator_id` bigint(20) NOT NULL COMMENT 'người tạo bản ghi',
  `status` bit(1) NOT NULL DEFAULT b'1' COMMENT 'trạng thái',
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
INSERT INTO `med_medicines` VALUES (1,'Golduling','','23456789',9,'Tadalafil','VD-14457-11','20mg',1,'Việt Nam','TCCSh',41,1,35,50000,30286,17,'2019-10-12 21:35:49',32,_binary '','DCS000002752338'),(2,'Thuốc 10','','23456789',7,'a','VD-14457-118','a',3,'Việt Nam','TCCSh',30,NULL,35,2000,20000,17,'2019-10-14 11:11:51',1,_binary '',NULL);
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
  `name` varchar(200) NOT NULL COMMENT '-Tên duy nhất trong bảng',
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
INSERT INTO `med_packages` VALUES (1,'Hộp x 6 lọ',3,6,22,1,'2019-09-26 13:33:28',28,_binary ''),(2,'Tuýp 250ml',14,1,14,1,'2019-09-27 15:23:51',28,_binary ''),(3,'Hộp 10 vỉ x 10 viên',1,10,21,1,'2019-09-27 17:04:07',28,_binary ''),(4,'Hộp 5 vỉ x 20 viên',1,100,22,1,'2019-09-27 17:04:48',28,_binary ''),(5,'Hộp 20 vỉ x 10 viên',21,20,21,1,'2019-09-30 10:06:57',28,_binary ''),(6,'Hộp 10 túi x 3 gram',12,10,22,1,'2019-09-30 10:15:27',28,_binary ''),(7,'Hộp 1 lọ',3,1,3,1,'2019-10-03 09:03:24',28,_binary ''),(8,'Hộp 3 vỉ 10 viên',1,10,21,1,'2019-10-03 09:50:39',28,_binary ''),(9,'Hộp 1 vỉ x 2 viên',1,2,21,1,'2019-10-11 15:37:21',32,_binary '');
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
  `name` varchar(200) NOT NULL COMMENT 'tên duy nhất với places_id',
  `address` varchar(200) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `group_producers_id` bigint(20) NOT NULL,
  `users_creator_id` bigint(20) NOT NULL,
  `places_id` bigint(20) DEFAULT NULL,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`,`places_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='Quản lý nhà sản xuất';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `med_producers`
--

LOCK TABLES `med_producers` WRITE;
/*!40000 ALTER TABLE `med_producers` DISABLE KEYS */;
INSERT INTO `med_producers` VALUES (1,'Công ty cổ phần dược phẩm trung ương Mediplantex','358 đường Giải Phóng, Phương Liệt, Thanh Xuân, Hà Nội','2019-09-26 11:46:47',4,28,35,_binary ''),(2,'Công Ty Cổ Phần Dược Phẩm Trung Ương I và Pharbaco','160 Tôn Đức Thắng, Q. Đống Đa, Hà Nội, Việt Nam','2019-09-26 11:46:58',3,28,35,_binary ''),(3,'Công Ty Cổ Phần Dược Phẩm Hà Tây','Số 10A Quang Trung, Quận Hà Đông, Hà Nội, Việt Nam\n','2019-09-30 11:08:48',4,28,35,_binary ''),(4,'Công Ty CP Nông Nghiệp Công Nghệ Cao Thăng Long','Xã Đại Yên, Chương Mỹ, Hà Nội, Việt Nam','2019-09-30 13:52:11',4,28,35,_binary ''),(9,'Công ty TNHH Ha San Dermapharm','Đường số 2, KCN Đồng An, Thuận An, Bình Dương, Việt Nam','2019-10-03 09:00:01',4,28,35,_binary ''),(10,'Công ty cổ phần dược phẩm Tipharco','Lô 08,09 CCN và TTCN Tân Mỹ Chánh, P.9, TP Mỹ Tho, Tiền Giang','2019-10-08 09:03:00',4,1,35,_binary ''),(11,'Cty TNHH sản xuất thương mại dược phẩm NIC (NIC pharma)','Việt Nam','2019-10-08 09:19:06',4,32,35,_binary '');
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
  `name` varchar(200) NOT NULL COMMENT '-Tên không trùng theo places_id',
  `tax_code` varchar(45) DEFAULT NULL COMMENT 'Mã số thuế',
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='Nhà cung cấp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `med_suppliers`
--

LOCK TABLES `med_suppliers` WRITE;
/*!40000 ALTER TABLE `med_suppliers` DISABLE KEYS */;
INSERT INTO `med_suppliers` VALUES (1,'Công Ty Cổ Phần Dưỡng Dược Vĩnh Kim','0101054925','186 Định Công Hạ, P. Định Công, Q. Hoàng Mai,Hà Nội','2019-09-25 14:48:21','0919559698','kimluan32@gmail.com','','www.duocvinhkim.com','Công Ty CP Dưỡng Dược Vĩnh Kim chuyên sản xuất và cung cấp thảo dược và sản phẩm từ thảo dược với chất lượng đảm bảo, giá cả hợp lý, uy tín, chuyên nghiệp trên toàn quốc.',5,1,35,_binary ''),(2,'Công Ty CP Nông Nghiệp Công Nghệ Cao Thăng Long','0101054925','Xã Đại Yên, Chương Mỹ,Hà Nội','2019-09-25 14:49:03','0972339095','cagaileosadu@gmail.com','','www.cagaileosadu.com.vn','Cà Gai Leo Sadu - sản phẩm được sản xuất bởi Công Ty Công Nghệ Cao Thăng Long.\nHiện tại Cà Gai Leo Sadu đang phân phối những sản phẩm chính như: Cao Cà Gai Leo Sadu, Cà Gai Leo Hoà Tan Sadu, Cà Gai Le',7,1,35,_binary ''),(3,'Rượu Thuốc Xoa Bóp Gia Truyền Hồng Phong','0101054925','99 Đường Số 8, P. 4, Q. 8,Tp. Hồ Chí Minh (TPHCM)','2019-09-25 14:49:06','0902216004','rxbhongphong@gmail.com','userfiles/admin_nbm/images/20191008/2019_10_08_10_13_12_396_download.png','www.plus.google.com/u/0/115407584113782720816','Với rất nhiều công dụng hoàn hảo từ bài thuốc gia truyền lâu đời, khẳng định từ cổ chí kim chưa có bài thuốc, loại Rươụ nào chữa được nhiều bệnh như vậy. Toàn bộ bệnh ngoài cơ thể đều ước lượng thời g',1,1,35,_binary ''),(4,'Eva Shop','123456','475 Đoàn Văn Bơ, Phường 14, Quận 4,Tp. Hồ Chí Minh (TPHCM)','2019-09-26 12:07:24','0903070384','xuandiemthaicorp@gmail.com','','www.evachamsocda.com','Chúng tôi chuyên cung cấp sỉ, lẻ Nấm giảm cân thảo dược, nhă hỗ trợ khách han giảm cân an toàn, sớm đạt được cân nặng như ý.',1,28,35,_binary ''),(5,'Công Ty Cổ Phần Difoco','0313240560','289 Đinh Bộ Lĩnh, P. 26, Q. Bình Thạnh,Tp. Hồ Chí Minh (TPHCM)','2019-09-27 11:22:23','0366857787','info@difoco.com','','www.difoco.com','Công ty cổ phần DIFOCO kinh doanh chuyên về dược phẩm & thực phẩm bảo vệ sức khỏe có nguồn gốc từ thảo dược thiên nhiên.',4,1,35,_binary ''),(6,'Công Ty Cổ Phần Neemtree','0313614992','37/5B Trung Mỹ Tây, Trung Chánh, Hóc Môn,Tp. Hồ Chí Minh (TPHCM)','2019-09-27 11:35:48','0871066869','info@neemtree.vn','','www.neemtree.vn','Công Ty Cổ Phần NeemTree được sếp vào top 5 các thương hiệu thảo dược hàng đầu tại Việt Nam trong lĩnh vực thảo dược hỗ trợ điều trị các bệnh như tiểu đường, huyết áp thấp, sỏi thận và xương khớp,..',2,1,35,_binary ''),(7,'Công Ty TNHH Lê Hào','0101054925','26/36 Đường Thượng Hội, Xã Tân Hội, H. Đan Phượng Hà Nội','2019-09-27 11:42:16','0337190219','sales.lehaoco@gmail.com','','TNHH Lê Hào','Công ty TNHH Lê Hào chuyên cung cấp nông sản (gia vị, có dầu), thảo dược, tinh dầu,..',6,1,35,_binary ''),(8,'Công ty cổ phần dược phẩm Tipharco','1200100557','Lô 08,09 CCN và TTCN Tân Mỹ Chánh, P.9, TP Mỹ Tho, Tiền Giang','2019-10-08 09:18:02','02733871817','tipharco@vnn.vn','','www.tipharco.com.vn','   ',3,32,35,_binary ''),(9,'CÔNG TY CỔ PHẦN DƯỢC PHẨM HÀ TÂY','0500391400','10A Quang Trung - Hà Đông - Hà Nội','2019-10-09 14:08:22','0433522525','duochatay@gmail.com','userfiles/admin_nbm/images/20191009/2019_10_09_15_43_27_984_photo20190821113127.jpg','hataphar.com.vn',NULL,3,32,35,_binary ''),(10,'Công ty Cổ phần Dược phẩm Đạt Vi Phú','3700575898 ','Đường D17, Khu Công Nghiệp Mỹ Phước 1, Bến Cát - Bình Dương, Việt Nam','2019-10-09 15:49:54','02743567687',NULL,'','support@davipharm.info',NULL,3,32,35,_binary ''),(11,'Công ty CP dược phẩm Gia Thuận',NULL,NULL,'2019-10-11 15:53:45','0968506333',NULL,'',NULL,NULL,3,32,35,_binary '');
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
  `name` varchar(100) NOT NULL COMMENT 'duy nhất trong bảng',
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
INSERT INTO `med_types` VALUES (17,'Thuốc không kê đơn','2019-10-07 09:24:03',28,_binary ''),(18,'Thuốc kê đơn','2019-10-07 09:58:07',28,_binary '');
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
  `name` varchar(200) NOT NULL COMMENT '-Tên duy nhất trong bảng',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `users_creator_id` bigint(20) NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='Bảng dữ liệu này là danh mục, được nhìn all cho hệ thống dùng chung';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `med_units`
--

LOCK TABLES `med_units` WRITE;
/*!40000 ALTER TABLE `med_units` DISABLE KEYS */;
INSERT INTO `med_units` VALUES (1,'Viên','2019-09-25 14:52:18',1,_binary ''),(2,'Gói','2019-09-25 14:52:33',1,_binary ''),(3,'Lọ','2019-09-25 14:52:40',1,_binary ''),(4,'Thùng','2019-09-25 14:52:43',1,_binary ''),(5,'Kim tiêm','2019-09-25 14:52:48',1,_binary ''),(7,'Ống','2019-09-27 10:41:43',28,_binary ''),(11,'Miếng','2019-09-27 10:54:02',28,_binary ''),(12,'Túi','2019-09-27 11:12:47',28,_binary ''),(14,'Tuýp','2019-09-27 11:44:30',28,_binary ''),(21,'Vỉ','2019-09-30 13:33:14',28,_binary ''),(22,'Hộp','2019-09-30 14:49:08',28,_binary ''),(24,'DV1','2019-10-14 10:44:13',1,_binary ''),(25,'DVS1','2019-10-14 10:44:28',1,_binary ''),(26,'DVT3','2019-10-14 10:48:45',1,_binary ''),(27,'DVT4','2019-10-14 10:48:54',1,_binary ''),(28,'DVT6','2019-10-14 10:49:00',1,_binary '');
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
  `name` varchar(100) NOT NULL COMMENT 'tên duy nhất theo places_id',
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
INSERT INTO `med_warehouses` VALUES (4,'Kho thuốc Hai Bà Trưng Hà Nội','102 Hai bà Trưng\n',49,35,'2019-09-27 14:47:12',28,_binary ''),(5,'kho thuốc ba đình','gvv',17,35,'2019-09-27 15:10:43',28,_binary ''),(7,'Kho quầy thuốc Thu Loan','số 8 trung yên 9, tòa Vinahub',23,35,'2019-09-30 11:13:09',28,_binary ''),(8,'kho quầy thuốc đống đa','số 9',23,35,'2019-10-09 10:09:07',1,_binary '\0');
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
  `places_id` bigint(20) NOT NULL COMMENT 'đơn vị',
  `medicines_id` bigint(20) NOT NULL COMMENT 'thuốc',
  `whosale_quantities` bigint(20) NOT NULL COMMENT 'số lượng đơn vị theo bán sỉ',
  `retail_quantities` bigint(20) NOT NULL COMMENT 'số lượng đơn vị theo bán buôn',
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
INSERT INTO `menu_positions` VALUES (1,'Menu Dashboard',1,'2019-09-13 15:55:13',_binary ''),(2,'Menu con',1,'2019-09-13 15:55:16',_binary ''),(3,'Vị trí Menu Bottom',1,'2019-09-13 15:55:19',_binary ''),(4,'Ví trị Menu TOP',1,'2019-09-13 15:57:51',_binary '');
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
INSERT INTO `menus` VALUES (1,'Tổng quan',1,'/dashboard','dashboard',0,1,1,1,'2019-09-14 09:21:18',_binary ''),(2,'Quản lý hệ thống',1,'/system','form',0,1,2,1,'2019-09-14 11:06:46',_binary ''),(3,'Quản lý tài khoản',1,'/system/users',NULL,2,1,2,1,'2019-09-14 11:07:31',_binary ''),(4,'Quản lý menu',1,'/system/menus',NULL,37,1,1,1,'2019-09-14 11:08:11',_binary ''),(5,'Quản lý danh mục',1,'/category','form',0,1,5,1,'2019-09-17 12:00:56',_binary ''),(6,'Quản lý chuyên mục',1,'/category/categorys',NULL,37,1,10,1,'2019-09-18 09:12:47',_binary ''),(7,'Quản lý quyền mẫu',1,'/system/rolesTemplates',NULL,2,1,4,1,'2019-09-18 10:28:34',_binary ''),(8,'Quản lý nhóm tài khoản ',1,'/system/groupUsers',NULL,2,1,3,1,'2019-09-18 10:30:59',_binary ''),(9,'Quản lý Tỉnh/Thành phố',1,'/category/province',NULL,5,1,1,1,'2019-09-18 10:33:01',_binary ''),(10,'Quản lý Quận/Huyện',1,'/category/district',NULL,5,1,2,1,'2019-09-18 10:33:57',_binary ''),(11,'Quản lý Phường/Xã',1,'/category/ward',NULL,5,1,3,1,'2019-09-18 10:35:00',_binary ''),(12,'Quản lý thư viện giao diện',1,'/category/templates',NULL,37,1,4,1,'2019-09-18 10:36:02',_binary ''),(13,'Quản lý website',1,'/category/website',NULL,37,1,9,1,'2019-09-18 10:37:06',_binary ''),(14,'Quản lý nhóm cơ sở y tế',1,'/category/groupPlace',NULL,59,1,3,1,'2019-09-18 10:38:11',_binary ''),(15,'Quản lý vị trí menu',1,'/category/menuPositions',NULL,37,1,2,1,'2019-09-18 10:38:37',_binary ''),(16,'Quản lý cơ sở y tế',1,'/category/place',NULL,59,1,6,1,'2019-09-18 10:39:26',_binary ''),(17,'Quản lý tin tức',1,'/category/news',NULL,37,1,3,1,'2019-09-18 10:40:13',_binary ''),(18,'Quản lý nhóm website',1,'/category/groupWebsites',NULL,46,1,5,1,'2019-09-18 10:41:00',_binary ''),(19,'Quản lý quảng cáo',1,'/category/ad',NULL,37,1,6,1,'2019-09-18 10:42:20',_binary ''),(20,'Quản lý vị trí quảng cáo',1,'/category/adsPosition',NULL,37,1,8,1,'2019-09-18 10:43:47',_binary ''),(21,'Quản lý loại quảng cáo',1,'/category/adstype',NULL,37,1,7,1,'2019-09-18 10:44:32',_binary ''),(22,'Quản lý giao diện danh mục',1,'/category/templateLayouts',NULL,37,1,5,1,'2019-09-18 10:45:37',_binary ''),(27,'Quản lý nhóm nhà cung cấp',1,'/category/groupSuppliers',NULL,57,1,1,1,'2019-09-24 14:07:35',_binary ''),(28,'Quản lý nhóm nhà sản xuất',1,'/category/groupProducers',NULL,57,1,3,1,'2019-09-24 14:08:37',_binary ''),(29,'Quản lý đơn vị tính',1,'/category/units',NULL,33,1,12,1,'2019-09-24 14:09:32',_binary ''),(30,'Quản lý quy cách đóng gói',1,'/category/packages',NULL,33,1,11,1,'2019-09-24 14:10:12',_binary ''),(31,'Quản lý nhóm thuốc',1,'/category/groupMedicines',NULL,33,1,9,1,'2019-09-24 14:11:05',_binary ''),(32,'Quản lý thuốc',1,'/category/medicines',NULL,33,1,7,1,'2019-09-24 14:12:02',_binary ''),(33,'NT - Danh mục',1,'/customers','form',0,1,6,1,'2019-09-24 14:13:18',_binary ''),(34,'Quản lý nhóm khách hàng',1,'/customers/groupCustomers',NULL,56,1,1,1,'2019-09-24 14:14:37',_binary ''),(35,'Quản lý khách hàng ',1,'/customers/customers',NULL,56,1,2,1,'2019-09-24 14:18:03',_binary ''),(36,'Quản lý phương thức thanh toán',1,'/category/paymentMethods',NULL,46,1,4,1,'2019-09-24 17:16:58',_binary ''),(37,'Quản lý nội dung website',1,'/importExport','form',0,1,7,1,'2019-09-25 08:36:21',_binary ''),(38,'Quản lý kho thuốc',1,'/importExport/warehouses',NULL,58,1,6,1,'2019-09-25 08:40:47',_binary ''),(39,'Quản lý phiếu nhập thuốc',1,'/importExport/receipts',NULL,58,1,5,1,'2019-09-25 08:41:55',_binary ''),(40,'Quản lý bán thuốc',1,'/importExport/issues',NULL,58,1,7,1,'2019-09-25 08:42:58',_binary ''),(41,'Quản lý vị trí thuốc',1,'/category/medicineLocations',NULL,33,1,10,1,'2019-09-25 08:44:29',_binary ''),(42,'Quản lý loại thuốc',1,'/category/medTypes',NULL,33,1,8,1,'2019-09-25 08:46:34',_binary ''),(43,'Quản lý nhà sản xuất',1,'/category/producers',NULL,57,1,4,1,'2019-09-25 14:45:30',_binary ''),(44,'Quản lý nhà cung cấp',1,'/category/suppliers',NULL,57,1,2,1,'2019-09-25 14:46:56',_binary ''),(45,'Quản lý phòng khám',1,NULL,NULL,0,1,9,29,'2019-09-30 09:08:09',_binary '\0'),(46,'Quản lý chung',1,'/general','form',0,1,4,29,'2019-09-30 09:23:28',_binary ''),(47,'NT - Báo cáo doanh thu',1,'/reports','form',0,1,13,1,'2019-09-30 11:32:55',_binary ''),(48,'Báo cáo doanh thu chi tiết',1,'/reports/detail',NULL,47,1,1,1,'2019-09-30 11:34:12',_binary ''),(49,'Báo cáo tổng hợp',1,'/reports/aggregation',NULL,47,1,2,1,'2019-09-30 11:36:49',_binary ''),(50,'Báo cáo theo nhân viên',1,'/reports/staff',NULL,47,1,3,1,'2019-09-30 11:39:25',_binary ''),(51,'Báo cáo theo khách hàng',1,'/reports/customer',NULL,47,1,4,1,'2019-09-30 11:40:42',_binary ''),(52,'Báo cáo theo bác sĩ',1,'/reports/doctor',NULL,47,1,5,1,'2019-09-30 16:22:23',_binary ''),(53,'Báo cáo theo nhà cung cấp',1,'/reports/supplier',NULL,47,1,6,1,'2019-09-30 16:25:01',_binary ''),(54,'Báo cáo theo thuốc',1,'/reports/medicine',NULL,47,1,7,1,'2019-09-30 16:27:08',_binary ''),(55,'abc',14,'/lien-he-24-22211',NULL,64,1,19,28,'2019-10-02 10:04:26',_binary ''),(56,'NT - Khách hàng',1,'/NT-khachhang','form',0,1,8,1,'2019-10-06 10:40:53',_binary ''),(57,'NT -Nhà CC - Sản xuất',1,'/NCC','form',0,1,10,1,'2019-10-06 10:56:24',_binary ''),(58,'NT - Nhập/Xuất thuốc',1,'/quanlykho','form',0,1,11,1,'2019-10-06 11:02:49',_binary ''),(59,'Quản lý thông tin cơ sở y tế',1,'/quanlythongtincoso','form',0,1,3,1,'2019-10-06 11:26:56',_binary ''),(60,'NT - Tiện ích',1,'/utilities','form',0,1,12,1,'2019-10-06 14:12:09',_binary ''),(61,'Cảnh báo thuốc hết',1,'/utilities/medicine',NULL,60,1,1,1,'2019-10-07 09:25:29',_binary ''),(62,'Cảnh báo thuốc sắp hết hạn',1,'/utilities/medicineExpired',NULL,60,1,2,1,'2019-10-07 09:26:57',_binary ''),(63,'Trang chủ',14,'/',NULL,0,4,14,1,'2019-10-07 09:44:52',_binary ''),(64,'Tính năng',14,'/tinh-nang-21',NULL,0,4,15,1,'2019-10-07 12:22:54',_binary ''),(65,'Bảng giá',14,'/bang-gia-22',NULL,0,4,16,1,'2019-10-07 13:30:11',_binary ''),(66,'Hỗ trợ',14,'/ho-tro-23',NULL,0,4,17,1,'2019-10-07 13:30:56',_binary ''),(67,'Liên hệ',14,'/lien-he-24',NULL,0,4,18,1,'2019-10-07 14:14:50',_binary ''),(68,'Danh mục 1',15,'http://pharmacy.connectcare.vn/category/danhmuc1',NULL,0,2,1,32,'2019-10-11 08:35:18',_binary '');
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
  `name` varchar(200) NOT NULL COMMENT '-Tên duy nhất trong bảng',
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
INSERT INTO `payment_methods` VALUES (1,'Tiền mặt','2019-09-25 14:55:48',1,_binary ''),(2,'Ví điện tử MOMO','2019-09-25 14:56:04',1,_binary ''),(3,'Thanh toán qua cổng điện tử','2019-09-25 14:56:09',1,_binary ''),(4,'Thẻ tín dụng','2019-09-25 14:56:18',1,_binary ''),(5,'ví điện tử mobile banking','2019-09-25 17:07:41',28,_binary ''),(6,'Ship COD','2019-09-27 10:04:31',28,_binary ''),(7,'Thanh toán qua điện thoại','2019-09-27 11:05:48',28,_binary ''),(8,'VNPay','2019-10-07 09:29:56',28,_binary ''),(9,'Mã QR','2019-10-07 09:30:04',28,_binary '');
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
INSERT INTO `places` VALUES (35,'Quầy thuốc Thu Loan','0339943399','Cụm 6, xã Tân Lập, huyện Đan Phượng, thành phố Hà Nội (nhà ông Lê Tiến Liên)','Nguyễn Thị Thu Loan','0339943399',NULL,'01-004370','hni04_2769_admin','ThuLoan123',1,'2019-09-24 16:31:38',19,81,_binary ''),(36,'Cơ sở y tế 1','0965606156','87 chùa Láng','Bug','0965606156',NULL,NULL,'abc','abc',1,'2019-09-25 09:36:40',19,79,_binary ''),(37,'Cơ sở y tế 2','0902150091','  ','Nguyễn Văn A','0902150091',NULL,NULL,'min','123',1,'2019-09-30 15:51:55',1,23,_binary ''),(38,'CTY CỔ PHẦN TRUYỀN THÔNG KHỞI ĐẦU MỚI','0929890086','Tòa nhà Vinahud','Vũ Văn Tuyển','0929890086',NULL,NULL,'9834382','342432',1,'2019-10-02 21:45:38',29,23,_binary ''),(39,'Cơ sở y tế 3','84965606156','số 9','nguyễn thị huyền trang','84965606156',NULL,NULL,'trang','trang',1,'2019-10-10 10:07:55',19,24,_binary '\0');
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
INSERT INTO `provinces` VALUES (18,'Hà Nội',1,'2019-09-23 13:46:10',_binary ''),(19,'Hải Dương',1,'2019-09-23 13:46:18',_binary ''),(20,'Hưng Yên',1,'2019-09-23 13:46:32',_binary ''),(21,'Hải Phòng',1,'2019-09-23 13:46:52',_binary ''),(22,'Nam Định',1,'2019-09-23 13:47:26',_binary ''),(23,'Hà Giang',1,'2019-09-23 13:47:33',_binary ''),(24,'Thái Bình',1,'2019-09-23 13:47:42',_binary ''),(25,'Cao Bằng',1,'2019-09-23 13:47:51',_binary ''),(26,'Bắc Ninh',1,'2019-09-23 13:48:00',_binary ''),(27,'Nghệ An',1,'2019-09-23 13:48:08',_binary ''),(28,'Lào Cai',1,'2019-09-23 13:48:14',_binary ''),(29,'Hà Nam',1,'2019-09-23 13:48:31',_binary ''),(30,'Hà Tĩnh',1,'2019-09-23 13:48:50',_binary ''),(31,'Vĩnh Phúc',1,'2019-09-23 13:48:57',_binary ''),(32,'Yên Bái',1,'2019-09-23 13:49:10',_binary ''),(33,'Sơn La',1,'2019-09-23 13:49:19',_binary ''),(34,'Ninh Bình',1,'2019-09-23 13:49:37',_binary ''),(35,'Điện Biên',1,'2019-09-23 13:50:09',_binary ''),(36,'Bắc Giang',1,'2019-09-23 13:50:24',_binary ''),(37,'Thanh Hóa',1,'2019-09-23 13:50:35',_binary ''),(38,'An Giang',1,'2019-09-23 13:51:15',_binary ''),(39,'Bà Rịa ',1,'2019-09-23 13:51:28',_binary ''),(40,'Bắc Kạn',1,'2019-09-23 13:51:38',_binary ''),(41,'Bạc Liêu',1,'2019-09-23 13:51:55',_binary ''),(42,'Bến Tre',1,'2019-09-23 13:52:05',_binary ''),(43,'Bình Định',1,'2019-09-23 13:52:16',_binary ''),(44,'Bình Dương',1,'2019-09-23 13:52:24',_binary ''),(45,'Bình Phước',1,'2019-09-23 13:52:33',_binary ''),(46,'Bình Thuận',1,'2019-09-23 13:52:40',_binary ''),(47,'Cà Mau',1,'2019-09-23 13:52:50',_binary ''),(48,'Đắk Lắk',1,'2019-09-23 13:53:00',_binary ''),(49,'Đắk Nông',1,'2019-09-23 13:53:11',_binary ''),(50,'Đồng Nai',1,'2019-09-23 13:53:20',_binary ''),(51,'Đồng Tháp',1,'2019-09-23 13:53:29',_binary ''),(52,'Gia Lai',1,'2019-09-23 13:53:38',_binary ''),(53,'Hậu Giang',1,'2019-09-23 13:53:46',_binary ''),(54,'Hòa Bình',1,'2019-09-23 13:53:55',_binary ''),(55,'Khánh Hòa',1,'2019-09-23 13:54:04',_binary ''),(56,'Kiên Giang',1,'2019-09-23 13:54:39',_binary ''),(57,'Kon Tum',1,'2019-09-23 13:54:47',_binary ''),(58,'Lai Châu',1,'2019-09-23 13:54:55',_binary ''),(59,'Lâm Đồng',1,'2019-09-23 13:55:02',_binary ''),(60,'Lạng Sơn',1,'2019-09-23 13:55:10',_binary '\0'),(61,'Long An',1,'2019-09-23 13:55:19',_binary ''),(62,'Ninh Thuận',1,'2019-09-23 13:55:28',_binary ''),(63,'Quảng Bình',1,'2019-09-23 13:55:36',_binary ''),(64,'Quảng Nam',1,'2019-09-23 13:55:46',_binary ''),(65,'Quảng Ngãi',1,'2019-09-23 13:55:54',_binary ''),(66,'Quảng Ninh',1,'2019-09-23 13:56:13',_binary ''),(67,'Quảng Trị',1,'2019-09-23 13:56:21',_binary ''),(68,'Sóc Trăng',1,'2019-09-23 13:56:29',_binary ''),(69,'Tây Ninh',1,'2019-09-23 13:56:36',_binary ''),(70,'Thái Nguyên',1,'2019-09-23 13:56:51',_binary ''),(71,'Thừa Thiên Huế',1,'2019-09-23 13:57:00',_binary ''),(72,'Tiền Giang',1,'2019-09-23 13:57:07',_binary ''),(73,'Trà Vinh',1,'2019-09-23 13:57:14',_binary ''),(74,'Tuyên Quang',1,'2019-09-23 13:57:24',_binary ''),(75,'Vĩnh Long',1,'2019-09-23 13:57:33',_binary ''),(76,'Phú Yên',1,'2019-09-23 13:57:41',_binary ''),(77,'Cần Thơ',1,'2019-09-23 13:57:49',_binary ''),(78,'Đà Nẵng',1,'2019-09-23 13:57:57',_binary ''),(79,'TP HCM',1,'2019-09-23 13:58:14',_binary ''),(80,'Phú Thọ',1,'2019-09-23 14:43:20',_binary '');
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
INSERT INTO `sites` VALUES (1,'core cms','http://pharmacy.connectcare.vn','core','core',1,36,1,1,'2019-09-12 15:11:17',_binary ''),(14,'web giới thiệu quản lý nhà thuốc','http://pharmacy.connectcare.vn',NULL,NULL,1,38,43,1,'2019-09-23 11:46:35',_binary ''),(15,'Phần mềm bán hàng nhà thuốc','http://camgroup.com.vn/phan-mem/phan-mem-quan-ly-nha-thuoc-chuoi-nha-thuoc.aspx',NULL,NULL,1,35,41,29,'2019-09-25 15:38:05',_binary '');
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
INSERT INTO `template_layouts` VALUES (1,'Giao diện 4 tin nằm ngang tiêu đề và ảnh','templateLayout_6',1,'2019-09-13 14:50:55',_binary ''),(2,'Giao diện đối tác logo','templateLayout_5',1,'2019-09-13 14:51:02',_binary ''),(19,'Giao diện 3 tin và 1 tin nổi bật kiểu 3','templateLayout_4',1,'2019-09-24 16:40:51',_binary ''),(20,'Giao diện tiêu đề và nội dung chi tiết','templateLayout_3',29,'2019-09-26 10:57:08',_binary ''),(21,'Giao diện nhiều tin nội dung và ảnh chia đôi','templateLayout_2',1,'2019-10-07 15:58:57',_binary ''),(22,'Giao diện bảng giá kiểu 2','templateLayout_1',1,'2019-10-08 10:20:40',_binary ''),(23,'Giao diện 3 tin và 1 tin nổi bật kiểu 2','templateLayout_7',1,'2019-10-09 16:52:16',_binary ''),(24,'Giao diện 3 tin và 1 tin nổi bật kiểu 4','templateLayout_8',1,'2019-10-09 16:52:31',_binary ''),(25,'Giao diện 3 tin và 1 tin nổi bật kiểu 1','templateLayout_9',1,'2019-10-09 16:52:43',_binary ''),(26,'Giao diện 3 tin nằm ngang có ảnh kiểu 1','templateLayout_10',1,'2019-10-09 16:52:57',_binary ''),(27,'Giao diện 1 tin kèm nội dung','templateLayout_11',1,'2019-10-09 16:53:12',_binary ''),(28,'Giao diện 3 tin nằm ngang có ảnh kiểu 2','templateLayout_12',1,'2019-10-09 16:53:29',_binary ''),(29,'Giao diện 2 tin chia đôi màn hình có vách ngăn','templateLayout_13',1,'2019-10-09 16:53:46',_binary '\0'),(30,'Giao diện nhiều tin có phân trang','templateLayout_14',1,'2019-10-09 16:53:59',_binary ''),(31,'Giao diện bảng giá kiểu 1','templateLayout_15',1,'2019-10-09 16:54:10',_binary '');
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
INSERT INTO `templates` VALUES (1,'Giao diện website 1','template_1',1,'2019-09-13 14:31:45',_binary ''),(2,'Giao diện website 2','template_2',1,'2019-09-13 14:31:53',_binary ''),(3,'Giao diện website 3','template_3',1,'2019-09-13 14:32:05',_binary ''),(21,'Giao diện website 4','template_4',1,'2019-09-24 16:39:18',_binary ''),(22,'Giao diện website 5','template_5',1,'2019-09-24 16:40:06',_binary '');
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
INSERT INTO `users` VALUES (0,'administration','96e79218965eb72c92a549dd5a330112','administration','administration@nbm.vn','84398765432',1,'fn',-1,23,'2019-10-10 14:05:48',_binary '',_binary '\0'),(1,'admin_nbm','96e79218965eb72c92a549dd5a330112','admin','admin@nbm.vn.com','84398765432',1,'fn',0,23,'2019-09-12 15:03:34',_binary '',_binary '\0'),(27,'trang98','4297f44b13955235245b2497399d7a93','Nguyễn Thị Huyền Trang','nguyentrang@gmail.com','0965606156',3,'số 9',33,24,'2019-09-23 10:19:34',_binary '',_binary '\0'),(28,'thuy_nbm','96e79218965eb72c92a549dd5a330112','NGUYỄN XUÂN THỦY','thuy@nbm.vn','0972290154',3,'r3',1,23,'2019-09-24 14:24:13',_binary '',_binary '\0'),(29,'hoannt','4297f44b13955235245b2497399d7a93','HOAN NGUYỄN','HOANNT@NBM.COM.VN','84368973438',1,'Thượng Đình',1,69,'2019-09-25 08:34:25',_binary '',_binary '\0'),(30,'nguyenhongnhung','e10adc3949ba59abbe56e057f20f883e','Nguyễn Hồng Nhung','nguyenhongnhung@nbm.vn','0929893435',3,'Số nhà 8',1,17,'2019-10-02 21:30:26',_binary '',_binary '\0'),(32,'QL_nha_thuoc','96e79218965eb72c92a549dd5a330112','Nguyễn Thị Thanh Loan','thanhloan@gmail.com','0902150091',2,'Minh Khai',1,80,'2019-10-04 08:59:14',_binary '',_binary ''),(33,'nhan_vien','96e79218965eb72c92a549dd5a330112','Nguyễn Mạnh Hưng','hungnm@gmail.com','0879232543',3,'Minh Khai',28,80,'2019-10-04 09:00:27',_binary '',_binary '\0');
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
INSERT INTO `wards` VALUES (14,'Phúc Xá',22,1,'2019-09-23 14:18:48',_binary ''),(15,'Ngọc Hà',22,1,'2019-09-23 14:19:06',_binary ''),(16,'Quán Thánh',22,1,'2019-09-23 14:19:19',_binary ''),(17,'Kim Mã',22,1,'2019-09-23 14:19:39',_binary ''),(18,'Giảng Võ',22,1,'2019-09-23 14:19:52',_binary ''),(19,'Hàng Bông',26,1,'2019-09-23 14:20:31',_binary ''),(20,'Tràng Tiền',26,1,'2019-09-23 14:20:48',_binary ''),(21,'Thụy Khuê',26,1,'2019-09-23 14:21:09',_binary ''),(22,'Quan Hòa',23,1,'2019-09-23 14:21:32',_binary ''),(23,'Trung Hòa',23,1,'2019-09-23 14:21:43',_binary ''),(24,'Yên Hòa',23,1,'2019-09-23 14:21:56',_binary ''),(25,'Quang Trung',24,1,'2019-09-23 14:22:24',_binary ''),(26,'Cát Linh',24,1,'2019-09-23 14:22:42',_binary ''),(27,'Phương Liên',24,1,'2019-09-23 14:23:05',_binary ''),(28,'Trung Liệt',24,1,'2019-09-23 14:23:22',_binary ''),(29,'Trung Tự',24,1,'2019-09-23 14:23:37',_binary ''),(30,'Kim Liên',24,1,'2019-09-23 14:23:52',_binary ''),(31,'Thị Trấn Nho Quan',51,1,'2019-09-23 14:26:06',_binary ''),(32,'Cúc Phương',51,1,'2019-09-23 14:26:23',_binary ''),(33,'Văn Phong',51,1,'2019-09-23 14:26:42',_binary ''),(34,'Đông Thành',74,1,'2019-09-23 14:27:57',_binary ''),(35,'Thanh Bình',74,1,'2019-09-23 14:28:27',_binary ''),(36,'Bích Đào',74,1,'2019-09-23 14:28:42',_binary ''),(37,'Ninh Khánh',74,1,'2019-09-23 14:29:03',_binary ''),(38,'Thị Trấn Kinh Môn',66,1,'2019-09-23 14:30:11',_binary ''),(39,'Phúc Thành',66,1,'2019-09-23 14:30:33',_binary ''),(40,'Hiệp Hòa',66,1,'2019-09-23 14:31:18',_binary ''),(41,'Hồng Lạc',69,1,'2019-09-23 14:32:08',_binary ''),(42,'Thanh An',69,1,'2019-09-23 14:32:30',_binary ''),(43,'An Lương',69,1,'2019-09-23 14:32:56',_binary ''),(44,'Nguyễn Du',25,1,'2019-09-23 14:58:11',_binary ''),(45,'Lê Đại Hành',25,1,'2019-09-23 14:58:30',_binary ''),(46,'Thanh Nhàn',25,1,'2019-09-23 14:58:50',_binary ''),(47,'Bách Khoa',25,1,'2019-09-23 14:59:06',_binary ''),(48,'Bạch Mai',25,1,'2019-09-23 14:59:23',_binary ''),(49,'Đồng Tâm',25,1,'2019-09-23 14:59:37',_binary ''),(50,'Vĩnh Tuy',25,1,'2019-09-23 14:59:52',_binary ''),(51,'Trương Định',25,1,'2019-09-23 15:00:13',_binary ''),(52,'An Bình',67,1,'2019-09-23 15:15:07',_binary ''),(53,'Hồng Phong',67,1,'2019-09-23 15:15:40',_binary ''),(54,'Dân Chủ',72,1,'2019-09-23 15:16:25',_binary ''),(55,'Nguyên Giáp',72,1,'2019-09-23 15:16:49',_binary ''),(56,'Thanh Trì',28,1,'2019-09-23 15:32:03',_binary ''),(57,'Lĩnh Nam',28,1,'2019-09-23 15:32:17',_binary ''),(58,'Yên Sở',28,1,'2019-09-23 15:32:30',_binary ''),(59,'Giáp Bát',28,1,'2019-09-23 15:32:41',_binary ''),(60,'Hoàng Liệt',28,1,'2019-09-23 15:32:54',_binary ''),(61,'Định Công',28,1,'2019-09-23 15:33:17',_binary ''),(62,'Đại Kim',28,1,'2019-09-23 15:33:36',_binary ''),(63,'Nhân Chính',30,1,'2019-09-23 15:34:02',_binary ''),(64,'Khương Trung',30,1,'2019-09-23 15:34:22',_binary ''),(65,'Hạ Đình',30,1,'2019-09-23 15:34:36',_binary ''),(66,'Kim Giang',30,1,'2019-09-23 15:34:54',_binary ''),(67,'Phương Liệt',30,1,'2019-09-23 15:35:11',_binary ''),(68,'Khương Mai',30,1,'2019-09-23 15:35:30',_binary ''),(69,'Thượng Đình',30,1,'2019-09-23 15:36:03',_binary ''),(70,'Tân Triều',90,1,'2019-09-23 15:38:34',_binary ''),(71,'Thanh Liệt',90,1,'2019-09-23 15:38:52',_binary ''),(72,'Tả Thanh Oai',90,1,'2019-09-23 15:39:09',_binary ''),(73,'Hữu Hòa',90,1,'2019-09-23 15:39:21',_binary ''),(74,'Ngũ Hiệp',90,1,'2019-09-23 15:39:41',_binary ''),(75,'Tam Hiệp',90,1,'2019-09-23 15:39:56',_binary ''),(76,'Đại Áng',90,1,'2019-09-23 15:40:13',_binary ''),(77,'Yên Mỹ',90,1,'2019-09-23 15:40:40',_binary ''),(78,'Thị trấn',71,1,'2019-09-25 08:32:48',_binary ''),(79,'Láng Thượng',24,1,'2019-09-25 09:03:30',_binary ''),(80,'Đông Ngàn',91,1,'2019-10-04 08:57:18',_binary ''),(81,'Tân Lập',33,1,'2019-10-08 10:36:34',_binary '');
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

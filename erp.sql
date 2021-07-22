-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: erp
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
  `id` int NOT NULL AUTO_INCREMENT,
  `account_name` varchar(45) DEFAULT NULL,
  `account_code` varchar(45) DEFAULT NULL,
  `account_number` int DEFAULT NULL,
  `account_owner` varchar(45) DEFAULT NULL,
  `account_location` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (20,'상준이네집','a5223',10023949,'김상준','서울'),(21,'상준이네 순대국','a29192',123312213,'임상준','서울'),(22,'상준이네 냉면집','b92392',123123211,'박상준','서울'),(23,'상준이네 떡볶이','c19293',12312322,'황상준','서울'),(24,'상준이네 카페','d29329239',415155,'조지 상준','서울'),(25,'진출이네 문구사','f29329239',31232123,'도널드 진출','서울'),(26,'민현이네 백악관','e22222',222222,'송민현','서울');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anonymous_board`
--

DROP TABLE IF EXISTS `anonymous_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anonymous_board` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `writer` int NOT NULL,
  `nick_name` varchar(45) DEFAULT NULL,
  `write_date` date NOT NULL,
  `count` int DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `filename` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anonymous_board`
--

LOCK TABLES `anonymous_board` WRITE;
/*!40000 ALTER TABLE `anonymous_board` DISABLE KEYS */;
INSERT INTO `anonymous_board` VALUES (1,'더워','더워뒤지겠습니다.sdsad',21300001,'더위극혐','2021-06-28',1,'1234','main3.jpg,main2.jpg,main1.jpg,'),(3,'즐거운 월요일이에요~','<p>모두 열심히 화이팅~!!!</p>',21300001,'sdasd','2021-07-15',1,'1234','30e7b9d42f76cfc9 (1).zip,'),(5,'화장실 변기 또 막혔네 ','<p>&nbsp;화장실에 휴지 작작 좀 넣어라 ~!!!!!</p>',21300001,'dddddd','2021-07-15',1,'1234','badges.less,'),(7,'재밌는 놀이~~','재밌쥬~',21300001,'하이하이','2021-07-18',1,'1234','badges.less,bootstrap.less,button-groups.less,'),(9,'구내 식당 메뉴.....','<p>&nbsp;요즘 들어 너무 맛없어진 듯 하네여.....ㅡ;</p>',21100002,'밥바밥','2021-07-20',1,'1234',NULL),(10,'한국 대 프랑스 ','<p>아쉽게도 1대 1로 비겨버렸네요...ㅠㅠ</p>',21100002,'벤제마','2021-07-20',1,'1234',NULL),(11,'코로나 박태환','<p>박태환 코로나 걸려서 뽕숭아 학당 못보게 됐네요 흑흑 ㅠ&nbsp;</p>',21100002,'박태환','2021-07-20',1,'1234',NULL),(12,'끝말잇기 놀이 - 기러기','<p>ㅎㅎ</p>',21100002,'하이하이','2021-07-20',1,'1234',''),(13,'끝말잇기 놀이 - 기찻길','<p>ㅎㅎ</p>',21100002,'하이하이2','2021-07-20',1,'1234',NULL),(14,'끝말잇기 놀이 - 길동무','<p>ㅎㅎㅎㅎ</p>',21100002,'하이하이3','2021-07-20',1,'1234',NULL),(15,'끝말잇기 끝내기 - 무릎','<p>ㅎㅎㅎㅎㅎㅎㅎㅎ</p>',21100002,'하이하이4','2021-07-20',1,'1234',NULL);
/*!40000 ALTER TABLE `anonymous_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anonymous_comment`
--

DROP TABLE IF EXISTS `anonymous_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anonymous_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `board_id` int DEFAULT NULL,
  `comment` text,
  `writer_id` varchar(45) DEFAULT NULL,
  `nick_name` varchar(45) DEFAULT NULL,
  `write_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anonymous_comment`
--

LOCK TABLES `anonymous_comment` WRITE;
/*!40000 ALTER TABLE `anonymous_comment` DISABLE KEYS */;
INSERT INTO `anonymous_comment` VALUES (22,1,'ㅎㅇㅎㅇ','21300001','하이루여','2021-07-18 08:15:04'),(23,7,'23123','21300001','23','2021-07-18 08:45:07'),(24,12,'ㅎㅎㅎㅎㅎㅎ','21300001','하이하이','2021-07-21 02:09:35');
/*!40000 ALTER TABLE `anonymous_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anonymous_view`
--

DROP TABLE IF EXISTS `anonymous_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anonymous_view` (
  `id` int NOT NULL AUTO_INCREMENT,
  `board_id` varchar(45) DEFAULT NULL,
  `viewer_ip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anonymous_view`
--

LOCK TABLES `anonymous_view` WRITE;
/*!40000 ALTER TABLE `anonymous_view` DISABLE KEYS */;
INSERT INTO `anonymous_view` VALUES (1,'3','172.17.112.1'),(2,'5','172.17.112.1'),(3,'2','172.17.112.1'),(6,'1','172.17.112.1'),(7,'7','172.17.112.1'),(9,'9','172.17.112.1'),(10,'10','172.17.112.1'),(11,'11','172.17.112.1'),(12,'12','172.17.112.1'),(13,'13','172.17.112.1'),(14,'14','172.17.112.1'),(15,'15','172.17.112.1');
/*!40000 ALTER TABLE `anonymous_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `department` varchar(45) DEFAULT NULL,
  `position` varchar(45) DEFAULT NULL,
  `work_type` varchar(45) DEFAULT NULL,
  `work_start` time DEFAULT NULL,
  `work_end` time DEFAULT NULL,
  `working_time` time DEFAULT NULL,
  `work_date` date DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,'박정길','인사팀','사원','정규직','09:00:00','18:00:00','08:00:00','2021-07-18',21300001),(2,'박정길','인사팀','사원','정규직','08:25:44','17:00:00','07:34:16','2021-07-19',21300001),(3,'김상준','경영팀','사원','정규직','14:37:14','17:01:43','02:24:28','2021-07-19',21100001),(5,'박정길','인사팀','상무','정규직','18:52:17',NULL,NULL,'2021-07-21',21300001);
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `department_id` int NOT NULL,
  `department_name` varchar(45) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (10,'경영팀'),(20,'개발팀'),(30,'인사팀'),(40,'영업팀');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education_board`
--

DROP TABLE IF EXISTS `education_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `education_board` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `start_date` timestamp NOT NULL,
  `end_date` timestamp NOT NULL,
  `memo` text NOT NULL,
  `department_id` int NOT NULL,
  `writer` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education_board`
--

LOCK TABLES `education_board` WRITE;
/*!40000 ALTER TABLE `education_board` DISABLE KEYS */;
INSERT INTO `education_board` VALUES (1,'정신교육','2021-06-23 15:00:00','2021-06-24 15:00:00','정신교육',10,NULL),(2,'사내교육','2021-06-24 15:00:00','2021-06-26 15:00:00','사내교육',20,NULL),(3,'사내교육','2021-07-08 01:33:00','2021-07-08 04:33:00','사내교육',20,NULL),(5,'성희롱 교육','2021-07-21 06:40:00','2021-07-21 08:38:00','성희롱 예방교육',10,21300001),(11,'아이언맨','2021-07-21 03:22:00','2021-07-23 03:07:00','213',20,21100001),(12,'인크레더블 헐크','2021-07-21 03:07:00','2021-07-22 03:07:00','123',20,21100001),(13,'아이언맨','2021-07-20 08:52:00','2021-07-21 08:52:00','아이언맨 교육 ㅎㅎ',30,21300001),(14,'사내교육','2021-07-27 07:53:00','2021-07-28 10:53:00','사내교육',30,21300001);
/*!40000 ALTER TABLE `education_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `user_id` int NOT NULL,
  `password` varchar(45) NOT NULL,
  `address_id` varchar(45) NOT NULL,
  `address1` varchar(45) NOT NULL,
  `address2` varchar(45) DEFAULT NULL,
  `phone` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `hire_date` date NOT NULL,
  `birth_date` varchar(45) NOT NULL,
  `sex` varchar(45) NOT NULL,
  `department_id` int NOT NULL,
  `img_name` varchar(45) NOT NULL,
  `position_id` varchar(45) NOT NULL,
  `salary` bigint NOT NULL,
  `manager` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `english_name` varchar(45) DEFAULT NULL,
  `lunar_calendar` varchar(45) DEFAULT NULL,
  `birth` varchar(45) DEFAULT NULL,
  `korean_foreigner` varchar(45) DEFAULT NULL,
  `company_phone` varchar(45) DEFAULT NULL,
  `marriage` varchar(45) DEFAULT NULL,
  `company_address` varchar(45) DEFAULT NULL,
  `salary_payment_standards` varchar(45) DEFAULT NULL,
  `work_type` varchar(45) DEFAULT NULL,
  `remark` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='1010 0001 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'박정길',21300001,'21300001','11111','서울시 무수막 1길 18','','010-0101-0000','anrps@naver.com','2021-06-24','1111111111118','남성',30,'normalImg.jpg','7',200000000,'권한','재직','ParkJung-gil','양력','11월11일','내국인','010-0000-0000','미혼','종로 더 조은 컴퓨터 학원','주급제','정규직',''),(2,'송민현',21200001,'21200001','13480','경기 성남시 분당구 대왕판교로 477','1','010-2222-2222','21321213@naver.com','2021-07-06','1111111111118','남성',20,'21200001.jpg','7',200000000,'권한','재직','Song Min-hyun','양력','11월11일','내국인','02-3333-3333','미혼','종로 더 조은 컴퓨터 학원','연봉제','정규직',''),(3,'김상준',21100001,'21100001','07606','서울 강서구 초원로13길 26','','010-1111-1111','21321213@naver.com','2021-07-14','1111111111118','남성',10,'normalImg.jpg','7',200000000,'비권한','재직','KimSangJun','양력','11월11일','내국인','010-0000-0000','미혼','오주원 상사','연봉제','정규직',''),(4,'오주원',21100002,'21100002','','서울 강남구 영동대로 22','','010-1111-1111','ojwno1@naver.com','2021-07-16','1111111111118','남성',10,'normalImg.jpg','8',200000000,'권한','재직','OhJooWon','양력','11월11일','내국인','010-0000-0000','미혼','오주원 상사','연봉제','정규직',''),(5,'오병현',21100003,'21100003','','서울 강남구 영동대로 22','','010-1131-1111','obh@naver.com','2021-07-16','1111111111118','남성',10,'normalImg.jpg','1',22222222222,'비권한','퇴사','OhByungHyun','양력','11월11일','내국인','010-0000-0000','미혼','오주원 상사','연봉제','정규직',''),(6,'개똥이',21100004,'21100004','','광주 남구 2순환로 1508','','010-1111-1111','21321213@naver.com','2021-07-16','1111111111118','남성',10,'normalImg.jpg','1',61738,'비권한','재직','geaddong','양력','11월11일','내국인','010-0000-0000','미혼','오주원 상사','주급제','정규직',NULL),(7,'김땡땡',21300002,'21300002','','서울 강남구 가로수길 5','','010-2222-2222','21321213@naver.com','2021-07-19','1111111111118','남성',30,'21300002.jpg','1',6035,'비권한','재직','KimDeangDeang','양력','11월11일','내국인','010-0000-0000','미혼','오주원 상사','일급제','비정규직',''),(8,'김길동',21100005,'21100005','','서울 강남구 강남대로 238','','010-2222-2222','21321213@naver.com','2021-07-19','1111111111118','남성',10,'21100005.jpg','1',6267,'비권한','재직','KimGIlDong','양력','11월11일','내국인','010-0000-0000','미혼','오주원 상사','주급제','비정규직',NULL),(9,'구르미',21100006,'21100006','','서울 종로구 김상옥로 1','','010-1234-1111','Kurumi@naver.com','2021-07-19','1111111111118','남성',10,'21100006.jpg','3',3128,'비권한','재직','Kurumi','양력','11월11일','내국인','010-0000-0000','미혼','오주원 상사','연봉제','정규직',''),(10,'기러기',21100007,'21100007','','서울 종로구 김상옥로 1','','010-1111-1111','Kiruk@naver.com','2021-07-19','1111111111118','남성',10,'21100007.jpg','3',3128,'비권한','재직','Kiruki','양력','11월11일','내국인','010-0000-0000','미혼','오주원 상사','연봉제','정규직',''),(11,'고기동',21100008,'21100008','','서울 성동구 금호로 15','','010-2232-2222','Koki@naver.com','2021-07-19','1111111111118','남성',10,'21100008.jpg','2',4740,'비권한','재직','KoKiDong','양력','11월11일','내국인','010-0000-0000','미혼','오주원 상사','연봉제','정규직',''),(12,'김기동',21100009,'21100009','','서울 동대문구 천호대로 지하 405','','010-2222-2222','Kimki@naver.com','2021-07-19','1111111111118','남성',10,'normalImg.jpg','1',2633,'비권한','재직','KimKiDong','양력','11월11일','내국인','010-0000-0000','미혼','오주원 상사','연봉제','정규직',''),(13,'박이사',21400001,'21400001','','서울 성동구 금호로 15','','010-1111-1111','21321213@naver.com','2021-07-21','1111111111118','남성',40,'normalImg.jpg','8',4740,'비권한','재직','ParkYiSa','양력','11월11일','내국인','010-0000-0000','미혼','오주원 상사','연봉제','정규직',NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice_board`
--

DROP TABLE IF EXISTS `notice_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice_board` (
  `id` int NOT NULL AUTO_INCREMENT,
  `writer` int NOT NULL,
  `title` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `write_date` date NOT NULL,
  `count` int DEFAULT NULL,
  `filename` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice_board`
--

LOCK TABLES `notice_board` WRITE;
/*!40000 ALTER TABLE `notice_board` DISABLE KEYS */;
INSERT INTO `notice_board` VALUES (2,21300001,'인사팀 공지사항','코로나로 인한 인사팀 정리해고 30명 감축','1234','2021-06-23',1,''),(3,21200001,'개발팀 공지사항','개발 일손 부족으로 인한 신입 사원 채용 공고','1234','2021-07-02',1,'breadcrumbs.less,buttons.less,'),(6,21300001,'경영팀 공지사항','<p>dddddd</p>','1234','2021-07-12',1,NULL),(7,21300001,'개발팀 공지사항','<p>wqeewqewqeweqw</p>','1234','2021-07-12',1,NULL),(8,21300001,'인사팀 공지사항','<p>32133132</p>','1234','2021-07-12',1,NULL),(9,21300001,'영업팀 공지사항','<p>32133132</p>','1234','2021-07-12',1,NULL),(11,21300001,'영업팀 공지사항','<p>21323232</p>','2132','2021-07-12',1,''),(12,21300001,'인사팀 공지사항','<p>213321321</p>','3212','2021-07-12',1,''),(19,21300001,'경영팀 공지사항','<p>123123123</p>','1234','2021-07-12',1,''),(22,21300001,'경영팀 공지사항','<p>123123</p>','1234','2021-07-12',1,'이클립스 빌드화면2-1.png,'),(23,21300001,'사내 공지사항','<p>122332323</p>','1231','2021-07-12',1,''),(26,21300001,'코로나 안전수칙','<p>123123123</p>','1234','2021-07-12',1,','),(30,21300001,'승진 관련 공고','<p>인사팀  박정길 부장 7월 부로 상무로 승진 되었음을 공지 드립니다.</p>','1234','2021-07-15',1,'이클립스 빌드화면2-1.png,이클립스 빌드화면2-2.png,포트번호셋팅 캡처화면.png,'),(36,21300001,'구인 공고','<p>인사팀 구인 공고 입니다. 주변 지인 있으면 인사팀으로 연락 부탁드립니다.</p>','1234','2021-07-18',1,'이클립스 빌드화면2-1 - 복사본.png,'),(37,21300001,'공지사항입니다.','<p>공지사항입니다.</p><p>화장실 변기가 많이 막힙니다. 변기에 화장지를 넣고 물을 내리지 말아 주시기 바랍니다.</p>','1234','2021-07-18',1,'박정길-UI테스트포트폴리오.xlsx,');
/*!40000 ALTER TABLE `notice_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice_comment`
--

DROP TABLE IF EXISTS `notice_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `board_id` int NOT NULL,
  `comment` text NOT NULL,
  `writer_id` varchar(45) NOT NULL,
  `writer_name` varchar(45) NOT NULL,
  `writer_department_name` varchar(45) NOT NULL,
  `write_date` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice_comment`
--

LOCK TABLES `notice_comment` WRITE;
/*!40000 ALTER TABLE `notice_comment` DISABLE KEYS */;
INSERT INTO `notice_comment` VALUES (5,33,'12323','21300001','박정길','인사팀','2021-07-15 06:50:10'),(9,9,'123213','21300001','박정길','인사팀','2021-07-16 04:19:53'),(12,30,'123333','21300001','박정길','인사팀','2021-07-16 07:26:09'),(13,23,'하이하이','21300001','박정길','인사팀','2021-07-16 07:32:48'),(15,30,'123','21300001','박정길','인사팀','2021-07-17 14:20:04'),(16,30,'123','21100001','김상준','경영팀','2021-07-17 14:50:01'),(17,30,'123','21300001','박정길','인사팀','2021-07-18 03:22:44'),(19,26,'123','21300001','박정길','인사팀','2021-07-18 06:00:40'),(20,26,'2333','21300001','박정길','인사팀','2021-07-18 08:12:51'),(21,37,'1234','21300001','박정길','인사팀','2021-07-21 09:56:02');
/*!40000 ALTER TABLE `notice_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice_view`
--

DROP TABLE IF EXISTS `notice_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice_view` (
  `id` int NOT NULL AUTO_INCREMENT,
  `board_id` int DEFAULT NULL,
  `viewer_ip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice_view`
--

LOCK TABLES `notice_view` WRITE;
/*!40000 ALTER TABLE `notice_view` DISABLE KEYS */;
INSERT INTO `notice_view` VALUES (1,33,'0:0:0:0:0:0:0:1'),(2,34,'0:0:0:0:0:0:0:1'),(3,32,'0:0:0:0:0:0:0:1'),(4,31,'0:0:0:0:0:0:0:1'),(5,24,'0:0:0:0:0:0:0:1'),(6,35,'0:0:0:0:0:0:0:1'),(7,23,'0:0:0:0:0:0:0:1'),(8,22,'0:0:0:0:0:0:0:1'),(9,26,'0:0:0:0:0:0:0:1'),(10,30,'0:0:0:0:0:0:0:1'),(11,12,'0:0:0:0:0:0:0:1'),(12,19,'0:0:0:0:0:0:0:1'),(13,13,'0:0:0:0:0:0:0:1'),(14,21,'0:0:0:0:0:0:0:1'),(15,11,'0:0:0:0:0:0:0:1'),(16,10,'0:0:0:0:0:0:0:1'),(17,9,'0:0:0:0:0:0:0:1'),(18,8,'0:0:0:0:0:0:0:1'),(19,7,'0:0:0:0:0:0:0:1'),(20,6,'0:0:0:0:0:0:0:1'),(21,4,'0:0:0:0:0:0:0:1'),(22,3,'0:0:0:0:0:0:0:1'),(23,2,'0:0:0:0:0:0:0:1'),(24,1,'0:0:0:0:0:0:0:1'),(25,5,'172.17.112.1'),(26,5,'172.17.112.1'),(27,4,'172.17.112.1'),(28,5,'172.17.112.1'),(29,4,'172.17.112.1'),(30,3,'172.17.112.1'),(31,2,'172.17.112.1'),(32,1,'172.17.112.1'),(33,2,'172.17.112.1'),(34,1,'172.17.112.1'),(35,2,'172.17.112.1'),(36,3,'172.17.112.1'),(37,4,'172.17.112.1'),(38,5,'172.17.112.1'),(39,5,'172.17.112.1'),(40,5,'172.17.112.1'),(41,4,'172.17.112.1'),(42,3,'172.17.112.1'),(43,2,'172.17.112.1'),(44,1,'172.17.112.1'),(45,2,'172.17.112.1'),(46,3,'172.17.112.1'),(47,4,'172.17.112.1'),(48,5,'172.17.112.1'),(49,5,'172.17.112.1'),(50,5,'172.17.112.1'),(51,4,'172.17.112.1'),(52,4,'172.17.112.1'),(53,4,'172.17.112.1'),(54,4,'172.17.112.1'),(55,4,'172.17.112.1'),(56,4,'172.17.112.1'),(57,4,'172.17.112.1'),(58,4,'172.17.112.1'),(59,4,'172.17.112.1'),(60,5,'172.17.112.1'),(61,4,'172.17.112.1'),(62,2,'172.17.112.1'),(63,1,'172.17.112.1'),(64,1,'172.17.112.1'),(65,1,'172.17.112.1'),(66,1,'172.17.112.1'),(67,1,'172.17.112.1'),(68,4,'172.17.112.1'),(69,4,'172.17.112.1'),(70,4,'172.17.112.1'),(71,4,'172.17.112.1'),(72,4,'172.17.112.1'),(73,4,'172.17.112.1'),(74,4,'172.17.112.1'),(75,4,'172.17.112.1'),(76,4,'172.17.112.1'),(77,4,'172.17.112.1'),(78,4,'172.17.112.1'),(79,4,'172.17.112.1'),(80,4,'172.17.112.1'),(81,4,'172.17.112.1'),(82,4,'172.17.112.1'),(83,3,'172.17.112.1'),(84,1,'172.17.112.1'),(85,1,'172.17.112.1'),(86,1,'172.17.112.1'),(87,1,'172.17.112.1'),(88,1,'172.17.112.1'),(89,1,'172.17.112.1'),(90,5,'172.17.112.1'),(91,5,'172.17.112.1'),(92,5,'172.17.112.1'),(93,5,'172.17.112.1'),(94,5,'172.17.112.1'),(95,3,'172.17.112.1'),(96,5,'172.17.112.1'),(97,5,'172.17.112.1'),(98,4,'172.17.112.1'),(99,3,'172.17.112.1'),(100,2,'172.17.112.1'),(101,1,'172.17.112.1'),(102,4,'172.17.112.1'),(103,5,'172.17.112.1'),(104,2,'172.17.112.1'),(105,1,'172.17.112.1'),(106,1,'172.17.112.1'),(107,1,'172.17.112.1'),(108,1,'172.17.112.1'),(109,1,'172.17.112.1'),(110,1,'172.17.112.1'),(111,5,'172.17.112.1'),(112,4,'172.17.112.1'),(113,1,'172.17.112.1'),(114,4,'172.17.112.1'),(115,4,'172.17.112.1'),(116,5,'172.17.112.1'),(117,4,'172.17.112.1'),(118,3,'172.17.112.1'),(119,4,'172.17.112.1'),(120,4,'172.17.112.1'),(121,4,'172.17.112.1'),(122,4,'172.17.112.1'),(123,4,'172.17.112.1'),(124,4,'172.17.112.1'),(125,4,'172.17.112.1'),(126,4,'172.17.112.1'),(127,5,'172.17.112.1'),(128,4,'172.17.112.1'),(129,3,'172.17.112.1'),(130,2,'172.17.112.1'),(131,1,'172.17.112.1'),(132,5,'172.17.112.1'),(133,5,'172.17.112.1'),(134,4,'172.17.112.1'),(135,5,'172.17.112.1'),(136,4,'172.17.112.1'),(137,3,'172.17.112.1'),(138,2,'172.17.112.1'),(139,1,'172.17.112.1'),(140,37,'0:0:0:0:0:0:0:1'),(141,3,'172.17.112.1'),(142,1,'172.17.112.1'),(143,3,'172.17.112.1'),(144,1,'172.17.112.1'),(145,2,'172.17.112.1'),(146,2,'172.17.112.1'),(147,36,'0:0:0:0:0:0:0:1');
/*!40000 ALTER TABLE `notice_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_board_id` int NOT NULL,
  `title` varchar(45) NOT NULL,
  `writer` varchar(45) NOT NULL,
  `approver` varchar(45) NOT NULL,
  `payment` varchar(45) NOT NULL,
  `payment_status` varchar(45) NOT NULL,
  `user_id` int NOT NULL,
  `write_date` varchar(45) NOT NULL,
  `start_date` varchar(45) NOT NULL,
  `end_date` varchar(45) NOT NULL,
  PRIMARY KEY (`payment_board_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (55,'사내 점심 식사','송민현','박정길','지출결의서','결제대기',21200001,'2021-07-19','2021-07-19','2021-07-19'),(57,'사내 점심 식사','박정길','송민현','지출결의서','결제대기',21300001,'2021-07-22','2021-07-22','2021-07-22'),(58,'사내 점심 식사','박정길','김상준','지출결의서','결제대기',21300001,'2021-07-22','2021-07-22','2021-07-22'),(59,'사내 점심 식사','박정길','송민현','지출결의서','결제대기',21300001,'2021-07-22','2021-07-22','2021-07-22'),(60,'사내 점심 식사','박정길','김상준','지출결의서','결제대기',21300001,'2021-07-22','2021-07-22','2021-07-23'),(61,'사내 점심 식사','박정길','김상준','지출결의서','결제대기',21300001,'2021-07-22','2021-07-22','2021-07-23'),(62,'사내 점심 식사','박정길','송민현','지출결의서','결제대기',21300001,'2021-07-22','2021-07-22','2021-07-22');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentboardlist`
--

DROP TABLE IF EXISTS `paymentboardlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymentboardlist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payment_board_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `account_company` varchar(45) DEFAULT NULL,
  `writer` varchar(45) NOT NULL,
  `writer_department` varchar(45) NOT NULL,
  `approver` varchar(45) NOT NULL,
  `approver_user_id` int NOT NULL,
  `division` varchar(45) DEFAULT NULL,
  `detail` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `supply_price` varchar(45) DEFAULT NULL,
  `VAT` varchar(45) DEFAULT NULL,
  `ammount_price` varchar(45) DEFAULT NULL,
  `receipt` varchar(45) DEFAULT NULL,
  `remark` varchar(45) DEFAULT NULL,
  `payment_status` varchar(45) NOT NULL,
  `user_id` int NOT NULL,
  `write_date` varchar(45) NOT NULL,
  `title` varchar(45) NOT NULL,
  `all_ammount_price` bigint NOT NULL,
  `approver_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentboardlist`
--

LOCK TABLES `paymentboardlist` WRITE;
/*!40000 ALTER TABLE `paymentboardlist` DISABLE KEYS */;
INSERT INTO `paymentboardlist` VALUES (56,55,'2021-07-19','2021-07-19','상준이네 순대국','송민현','개발팀','박정길',21300001,'식대','99','개인카드영수증','9','9','9',NULL,'9','결제대기',21200001,'2021-07-19','상중잉님 생일 충항링',10009,NULL),(57,57,'2021-07-22','2021-07-22','상준이네 순대국','박정길','인사팀','송민현',101010,'식대','사내회식','개인카드영수증','300000','30000','330000',NULL,'1','결제대기',21300001,'2021-07-22','사내 회식',300000,NULL),(58,58,'2021-07-22','2021-07-22','상준이네 카페','박정길','인사팀','김상준',101010,'식대','사내회식','개인카드영수증','300000','30000','330000',NULL,'1','결제대기',21300001,'2021-07-22','사내 회식',300000,NULL),(59,59,'2021-07-22','2021-07-22','상준이네 카페','박정길','인사팀','송민현',101010,'식대','11','개인카드영수증','300000','30000','330000',NULL,'11','결제대기',21300001,'2021-07-22','사내 회식',11,NULL),(60,60,'2021-07-22','2021-07-23','상준이네집','박정길','인사팀','김상준',101010,'식대','1','개인카드영수증','300000','30000','330000',NULL,'1','결제대기',21300001,'2021-07-22','사내 회식',1,NULL),(61,61,'2021-07-22','2021-07-23','상준이네 순대국','박정길','인사팀','김상준',101010,'식대','1','개인카드영수증','300000','30000','330000',NULL,'1','결제대기',21300001,'2021-07-22','사내 회식',1,NULL),(62,62,'2021-07-22','2021-07-22','상준이네 냉면집','박정길','인사팀','송민현',101010,'식대','2','개인카드영수증','300000','30000','330000',NULL,'2','결제대기',21300001,'2021-07-22','사내 회식',2,NULL);
/*!40000 ALTER TABLE `paymentboardlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `position_id` int NOT NULL,
  `position` varchar(45) NOT NULL,
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'사원'),(2,'대리'),(3,'과장'),(4,'차장'),(5,'팀장'),(6,'부장'),(7,'상무'),(8,'이사'),(9,'회장');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suggestion_board`
--

DROP TABLE IF EXISTS `suggestion_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suggestion_board` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `writer` int DEFAULT NULL,
  `content` text,
  `write_date` date DEFAULT NULL,
  `count` int DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `filename` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suggestion_board`
--

LOCK TABLES `suggestion_board` WRITE;
/*!40000 ALTER TABLE `suggestion_board` DISABLE KEYS */;
INSERT INTO `suggestion_board` VALUES (1,'개발팀 건의사항',21300001,'건의사항','2021-06-28',2,'1234',NULL),(2,'인사팀 건의사항',21300001,'건의사항','2021-07-02',1,'1234',NULL),(3,'경영팀 건의사항',21300001,'건의사항','2021-07-02',2,'1234',''),(5,'개발팀 건의사항',21300001,'건의사항 건의드립니다.33','2021-07-02',1,'1234',''),(6,'사내 교육 건의 사항 드립니다.',21300001,'<p>&nbsp;현재 코로나 확산이 심해 지고 있어 회사 내에서도 다시 한번&nbsp;</p><p>코로나 예방 수칙에 대한 교육 실시가 필요하다 생각되어 건의 드립니다.&nbsp;</p><p>감사합니다.</p>','2021-07-20',0,'1234',NULL),(7,'경영팀 건의사항 전달 드립니다.',21100001,'<p>&nbsp;현재 경영팀 인원이 감축 되어 업무 진행이 어려움에 겪고 있습니다.</p><p>신속한 인원 보충 부탁 드리겠습니다. 감사합니다.</p>','2021-07-20',1,'1234',NULL),(8,'개발팀 건의 사항드립니다.',21200001,'<p>&nbsp;이번 프로젝트 작업이 막바지에 이르렀습니다.</p><p>그동안 밤샘 작업 끝에 프로젝트가 완료 되었는데 각 인원마다 기간 정해서 반차 사용 할 수 있게&nbsp;</p><p>컨펌 부탁 드립니다. 감사합니다.</p>','2021-07-20',0,'1234',NULL),(9,'건의사항',21200001,'<p>건의사항</p>','2021-07-20',1,'1234',NULL),(10,'직원 화장실 고장 관련의건',21200001,'<p> 화장실 고장으로 인해 현재 물이 넘치고 있어 빠르게 </p><p>수리 부탁드립니다. 감사합니다.</p>','2021-07-20',1,'1234','이클립스 빌드화면2-1 - 복사본.png,'),(11,'에어컨 고장으로 인한 냉방 불가',21100002,'<p> 현재 뜨거운 여름 날씨로 매우 더운데 에어컨이 고장 나 냉방이 불가합니다.</p><p>빠르게 처리 부탁드립니다.</p>','2021-07-20',1,'1234','박정길-UI테스트포트폴리오.xlsx,');
/*!40000 ALTER TABLE `suggestion_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suggestion_comment`
--

DROP TABLE IF EXISTS `suggestion_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suggestion_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `board_id` int DEFAULT NULL,
  `comment` text,
  `writer_id` varchar(45) DEFAULT NULL,
  `writer_name` varchar(45) DEFAULT NULL,
  `writer_department_name` varchar(45) DEFAULT NULL,
  `write_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suggestion_comment`
--

LOCK TABLES `suggestion_comment` WRITE;
/*!40000 ALTER TABLE `suggestion_comment` DISABLE KEYS */;
INSERT INTO `suggestion_comment` VALUES (4,1,'123','21300001','박정길','인사팀','2021-07-18 04:48:08'),(5,1,'123','21300001','박정길','인사팀','2021-07-18 04:49:34'),(6,3,'123123','21300001','박정길','인사팀','2021-07-19 01:15:57');
/*!40000 ALTER TABLE `suggestion_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suggestion_view`
--

DROP TABLE IF EXISTS `suggestion_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suggestion_view` (
  `id` int NOT NULL AUTO_INCREMENT,
  `board_id` varchar(45) DEFAULT NULL,
  `viewer_ip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suggestion_view`
--

LOCK TABLES `suggestion_view` WRITE;
/*!40000 ALTER TABLE `suggestion_view` DISABLE KEYS */;
INSERT INTO `suggestion_view` VALUES (1,'3','172.17.112.1'),(3,'5','172.17.112.1'),(4,'1','172.17.112.1'),(5,'2','172.17.112.1'),(6,'11','172.17.112.1'),(8,'7','172.17.112.1'),(9,'9','172.17.112.1'),(10,'10','172.17.112.1');
/*!40000 ALTER TABLE `suggestion_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `welfare`
--

DROP TABLE IF EXISTS `welfare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `welfare` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `position_id` int DEFAULT NULL,
  `option` varchar(45) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `content` text,
  `phone` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `welfare`
--

LOCK TABLES `welfare` WRITE;
/*!40000 ALTER TABLE `welfare` DISABLE KEYS */;
/*!40000 ALTER TABLE `welfare` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-22 11:22:40

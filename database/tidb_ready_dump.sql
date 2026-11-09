USE citizen_service;

-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: citizen_service
-- ------------------------------------------------------
-- Server version	26.10.0

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
-- GTID state at the beginning of the backup 
--


--
-- Table structure for table `birth_certificate`
--

DROP TABLE IF EXISTS `birth_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `birth_certificate` (
  `application_id` bigint NOT NULL AUTO_INCREMENT,
  `child_name` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` varchar(20) NOT NULL,
  `birth_place` varchar(100) NOT NULL,
  `birth_proof` varchar(128) NOT NULL,
  `father_name` varchar(100) NOT NULL,
  `id_proof_father` varchar(128) NOT NULL,
  `mother_name` varchar(100) NOT NULL,
  `id_proof_mother` varchar(128) NOT NULL,
  `marriage_certificate` varchar(500) DEFAULT NULL,
  `mobile_no` varchar(10) NOT NULL,
  `email` varchar(500) NOT NULL,
  `address` varchar(500) NOT NULL,
  `dist` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `pin_code` varchar(20) NOT NULL,
  `father_sign` varchar(128) NOT NULL,
  `mother_sign` varchar(128) NOT NULL,
  `st` varchar(45) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`application_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `birth_certificate`
--

INSERT INTO `birth_certificate` VALUES (1,'KRISSH','male','20/05/1963','astarang','09.jpg','BIJAYA BARIK','21.jpg','NALINI BARIK','21.jpg','21.jpg','6352417895','hjkl@gmail.com','bantilo','PURI','ODISHA','INDIA','752109','09.jpg','21.jpg','APPROVED',1),(4,'Anand Behera','male','25/10/2000','KIIMS,BBSR','09.jpg','Abinash Behera','09.jpg','Sukanti Behera','21.jpg','09.jpg','4563127864','abinashbehera@gmail.com','Denkanal','Denkanal','ODISHA','INDIA','752109','09.jpg','21.jpg','APPROVED',5),(5,'Sushree','female','10/06/2021','Charichhaka Medical ','09.jpg','Sudhir Kumar Rout ','21.jpg','Smrutirekha Barik','21.jpg','09.jpg','8455905063','sudhirkumar@gmail.com','At. Papira , Astarang ','Puri','Odisha','India','753150','21.jpg','09.jpg','APPLIED',7),(8,'Misti Priyadarshini','female','29/02/2029','Mamata Memorial Hospital,Bantilo','09.jpg','Milan Kumar Muduli','09.jpg','Laxmipriya Sarangi','21.jpg','09.jpg','9114441890','milankumar1999@gmail.com','Bantilo','PURI','ODISHA','INDIA','753150','09.jpg','21.jpg','APPLIED',8),(9,'DEBASIS BARIK','male','30/08/1998','CAPITAL HOSPITAL ,BHUBANESWAR ','09.jpg','MADHABA CHANDRA BARIK','09.jpg','MAMATA BARIK','21.jpg','09.jpg','7377782705','MADHABABARIKMB@GMAIL.COM','AT.:-BANTILO ,POST.:-UDAYPUR,ASTARANG','PURI','ODISHA','INDIA','752109','21.jpg','09.jpg','APPROVED',2),(12,'Pritam','0','2/2/2002','','','Prc','','devi','','','7856451263','','','bardhaman','West Bengal','India','','','','APPROVED',22);

--
-- Table structure for table `death_certificate`
--

DROP TABLE IF EXISTS `death_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `death_certificate` (
  `application_id` bigint NOT NULL AUTO_INCREMENT,
  `deceased_name` varchar(100) NOT NULL,
  `father_husband_name` varchar(500) NOT NULL,
  `dob` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dod` varchar(20) NOT NULL,
  `cause` varchar(100) NOT NULL,
  `place_of_death` varchar(100) NOT NULL,
  `death_proof` varchar(200) NOT NULL,
  `address` varchar(500) NOT NULL,
  `police_station` varchar(100) NOT NULL,
  `dist` varchar(30) NOT NULL,
  `state` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `pin` varchar(20) NOT NULL,
  `applicant_name` varchar(100) NOT NULL,
  `id_proof` varchar(200) NOT NULL,
  `relation` varchar(100) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address_of_applicant` varchar(500) NOT NULL,
  `police_station_of_applicant` varchar(100) NOT NULL,
  `dist_of_applicant` varchar(20) NOT NULL,
  `state_of_applicant` varchar(20) NOT NULL,
  `country_of_applicant` varchar(20) NOT NULL,
  `pin_of_applicant` varchar(20) NOT NULL,
  `applicant_sign` varchar(200) NOT NULL,
  `user` bigint NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`application_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `death_certificate`
--

INSERT INTO `death_certificate` VALUES (3,'Sudarshan Muduli','Milan Kumar Muduli','29/02/2029','male','25/06/2014','Kidney Failure','hffhetkjkfhgdhgf','21.jpg','hgsfsgfhj','Astarang','PURI','ODISHA','INDIA','753150','Soumya Ranjan Swain','21.jpg','Nephew','6453897102','hfhdtytiuk','Astarang','PURI','ODISHA','INDIA','754106','09.jpg',2,'APPROVED'),(4,'Bilasini Swain','Krupasindhu Swain','09/06/1975','female','14/11/2019','NATURAL DEATH','At.Nakhara ,Balipatna ,Cuttack','21.jpg','At.Nakhara ,Balipatna ,Cuttack','Balipatna','CUTTACK','ODISHA','India','720103','Soumya Ranjan Swain','09.jpg','GRAND SON','9145678365','At.Nakhara ,Balipatna ,Cuttack','Balipatna','KHURDA','ODISHA','INDIA','754106','09.jpg',5,'APPROVED'),(5,'JKJHGJHGF','BCGFGFDR','20/05/1963','male','25/06/1990','ACCIDENT','HFHSGFVCNBMKHKKYRER','21.jpg','GGDFGSREYTRIHHHHHHHHHHL','ASTARANG','BALASORE','ODISHA','INDIA','546231','CVBNMXZ','09.jpg','SON','4552213648','AARSTYIHMBNV','SAHID NAGAR','BALASORE','ODISHA','INDIA','754106','21.jpg',6,'APPLIED');

--
-- Table structure for table `marriage_certificate`
--

DROP TABLE IF EXISTS `marriage_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marriage_certificate` (
  `application_id` bigint NOT NULL AUTO_INCREMENT,
  `groom_name` varchar(500) NOT NULL,
  `groom_id_proof` varchar(300) NOT NULL,
  `groom_photo` varchar(300) NOT NULL,
  `groom_father` varchar(500) NOT NULL,
  `groom_mother` varchar(500) NOT NULL,
  `groom_dob` varchar(30) NOT NULL,
  `groom_religion` varchar(100) NOT NULL,
  `groom_mobile` varchar(10) NOT NULL,
  `groom_email` varchar(100) NOT NULL,
  `groom_address` varchar(500) NOT NULL,
  `groom_dist` varchar(30) NOT NULL,
  `groom_state` varchar(30) NOT NULL,
  `groom_country` varchar(30) NOT NULL,
  `groom_pin` varchar(10) NOT NULL,
  `groom_witness_name` varchar(500) NOT NULL,
  `groom_witness_id` varchar(300) NOT NULL,
  `groom_witness_mobile` varchar(10) NOT NULL,
  `groom_witness_relation` varchar(100) NOT NULL,
  `groom_witness_address` varchar(500) NOT NULL,
  `bride_name` varchar(500) NOT NULL,
  `bride_id_proof` varchar(300) NOT NULL,
  `bride_photo` varchar(300) NOT NULL,
  `bride_father` varchar(500) NOT NULL,
  `bride_mother` varchar(500) NOT NULL,
  `bride_dob` varchar(30) NOT NULL,
  `bride_religion` varchar(100) NOT NULL,
  `bride_mobile` varchar(10) NOT NULL,
  `bride_email` varchar(100) NOT NULL,
  `bride_address` varchar(500) NOT NULL,
  `bride_dist` varchar(30) NOT NULL,
  `bride_state` varchar(30) DEFAULT NULL,
  `bride_country` varchar(30) NOT NULL,
  `bride_pin` varchar(10) NOT NULL,
  `bride_witness_name` varchar(500) NOT NULL,
  `bride_witness_id` varchar(300) NOT NULL,
  `bride_witness_mobile` varchar(10) NOT NULL,
  `bride_witness_relation` varchar(100) NOT NULL,
  `bride_witness_address` varchar(500) NOT NULL,
  `marriage_date` varchar(50) NOT NULL,
  `marriage_type` varchar(100) NOT NULL,
  `marriage_proof` varchar(300) NOT NULL,
  `groom_sign` varchar(300) NOT NULL,
  `bride_sign` varchar(300) NOT NULL,
  `groom_witness_sign` varchar(300) NOT NULL,
  `bride_witness_sign` varchar(300) NOT NULL,
  `user` bigint NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`application_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marriage_certificate`
--

INSERT INTO `marriage_certificate` VALUES (2,'SUDHIR KUMAR ROUT','09.jpg','21.jpg','SIBA KRUSHNA ROUT','PARBATI ROUT','14/08/1989','HINDU','7865942360','SUDHIRKROUTSKR@GMAIL.COM','AT.:-PAPIRA,POST.:-KORANA,ASTARANG','PURI','ODISHA','INDIA','753210','DIPTI RANJAN BARIK','21.jpg','6459312873','FRIEND','AT.:-PAPIRA, ASTARANG','SMRUTIREKHA BARIK','09.jpg','09.jpg','MADHABA CHANDRA BARIK','MAMATA BARIK','30/03/1995','HINDU','8455905036','SMRUTIREKHASKB@GMAIL.COM','AT.:-BANTILO,POST.:-UDAYAPUR,ASTARANG','PURI','ODISHA','INDIA','752109','DEBASIS BARIK','21.jpg','7750065209','BROTHER','AT.:-BANTILO ,POST.:-UDAYAPUR,ASTARANG','22/06/2019','ARRANGED','21.jpg','21.jpg','09.jpg','09.jpg','09.jpg',2,'APPLIED'),(3,'SRIKANT SWAIN','09.jpg','21.jpg','PITAMBER SWAIN','PAKRUTI SWAIN','23/07/1976','HINDU','9546783210','SKRIKANTSWAIN.SS@GMAIL.COM','AT.BOMIKHAL , POST. NAKHARA , BALIPATNA ','CUTTACK','ODISHA','INDIA','456310','SATYAJEET ROUT','09.jpg','7896541230','COUSIN','AT.C.S PUR , POST. C.S PUR ,BBSR','SRUSTI PRADHAN','09.jpg','21.jpg','SUMANT PRADHAN','SABITA PRADHAN','03/01/1930','HINDU','6325419870','SRUSTI.PRADHAN@GMAIL.COM','AT.AMPORA , POST . CHARICHHAKA ','PURI','ODISHA','INDIA','634589','CHINMAYEE PRIYADARSHINI','21.jpg','6945873210','FRIEND','AT.NIMAPARA , POST. NIMAPARA ,PURI','20/05/2014','LOVE MARRIAGE','21.jpg','09.jpg','09.jpg','09.jpg','09.jpg',5,'APPROVED');

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT,
  `role_type` varchar(50) NOT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `deleted` tinytext,
  `created_by` bigint DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `updated_by` bigint DEFAULT NULL,
  `updated_on` date DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

INSERT INTO `role` VALUES (1,'Admin','Admin',NULL,1,'2019-07-27',NULL,NULL),(2,'user','general citizen',NULL,1,'2019-10-25',NULL,NULL),(3,'viewer','public user','DELETED',1,'2019-10-29',NULL,NULL),(4,'Authority','Citizen Portal Authority',NULL,1,'2019-11-06',NULL,NULL);

--
-- Table structure for table `sign_user`
--

DROP TABLE IF EXISTS `sign_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sign_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) NOT NULL,
  `password` varchar(500) NOT NULL,
  `mobile_no` varchar(10) NOT NULL,
  `created_by` bigint NOT NULL,
  `created_on` date NOT NULL,
  `updated_by` bigint DEFAULT NULL,
  `updated_on` date DEFAULT NULL,
  `remark` varchar(100) NOT NULL,
  `deleted` tinytext,
  `name` varchar(500) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `otp` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sign_user`
--


--
-- Table structure for table `test_upload`
--

DROP TABLE IF EXISTS `test_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_upload` (
  `application_id` bigint NOT NULL AUTO_INCREMENT,
  `upload_file` varchar(250) NOT NULL,
  PRIMARY KEY (`application_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_upload`
--


--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) NOT NULL,
  `password` varchar(500) NOT NULL,
  `mobile_no` varchar(10) NOT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `updated_by` bigint DEFAULT NULL,
  `updated_on` date DEFAULT NULL,
  `remark` varchar(100) NOT NULL,
  `deleted` tinytext,
  `name` varchar(500) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `otp` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

INSERT INTO `user` VALUES (1,'admin','$2a$10$1ILIlFpfTaDO7TTco1PbAOOxlVNGlc04lA73glUKGqRHQddWodWu6','8763532395',1,'2019-07-27',1,'2019-09-26','Test',NULL,'Administrator','medisoft.bhubaneswar@gmail.com','Bhubaneswar',NULL),(2,'debasis','$2a$10$l6jYwwWEJTTYSSUL2XR.PuHInaEsfy23WUNKV8H790oUxQvZKNEtO','7377782705',1,'2019-10-24',NULL,NULL,'testing',NULL,'Debasis Barik','debasisbarikdb@gmail.cOm','bbsr',NULL),(4,'abinash','$2a$10$RHzdH/IYmcPVvK62GsUlAe14jKaGarrcJEBxgVZhVHg911B4O1YNy','7978684347',1,'2019-11-06',NULL,NULL,'Citizen Portal Authority',NULL,'Abinash Mishra','abinashmishra25399@gmail.com','BBSR',NULL),(5,'soumya','$2a$10$6axZYZyWpVuHH9tPFC1pGuv9IHLgwW5WDXqlPhacOpNx1MkfL3f8K','7978197250',1,'2019-11-08',NULL,NULL,'general citizen',NULL,'Soumya Ranjan Swain','soumyaranjan6216@gmail.com','BBSR',NULL),(6,'anand','$2a$10$d0HoAwuwSu1TapO1PjteD.IHKrbbPSzHskroI4GHgFhfHfDcas9tu','8637202334',1,'2019-11-08',NULL,NULL,'general citizen',NULL,'Anand Behera','anandbehera1998@gmail.com','Cuttack',NULL),(7,'sudhir','$2a$10$xfME5XlQyD/j7PUjoe8zgOVsMEvLvjWJ45n33huw4lzaSFNw4e0zy','9145678365',1,'2019-12-08',NULL,NULL,'general citizen',NULL,'Sudhir Kumar Rout','sudhirkumar@gmail.com','At.Papira ,Astarang,Puri',NULL),(8,'milan','$2a$10$sUoZDhCjHgupQ8djCUlIWuxpxNT8.VRDuHCyIzBJHApIF1iuJ1leS','9114441890',1,'2019-12-09',NULL,NULL,'general citizen',NULL,'Milan Kumar Muduli','milankumar1999@gmail.com','At.Bantilo,Astarang Puri',NULL),(12,'saroj','$2a$10$2yL7S5CuqDK6qFDlE7evruOHQQ3zk/dhbbhp1iKkUG4mmYImwcJmq','6534198656',NULL,'2020-03-03',NULL,NULL,'general citizen',NULL,'Saroj Mohanty','sarojmohanty@gmail.com','BBSR',NULL),(13,'swagat','$2a$10$BA5Jbsn32J/6/8./EtgYLOzYGckaa0gXVRe.43mRCAAGI80.Ae2Uy','8964563210',NULL,'2020-03-03',NULL,NULL,'general citizen',NULL,'swagat','swagat@gmail.com','BBSR',NULL),(21,'bittu123','$2a$10$FtZ8dBQhSlI.mL0tg48wi./00RK3jwf6TN68KbzKOvZTsI86zZudW','9382785650',NULL,'2026-11-07',NULL,NULL,'general citizen',NULL,'Bittu','bittu@gmail.com','asn',NULL),(22,'vik456','$2a$10$yx3fDaHIIR2MpRwPtQvaf.pD.xXryZVZGtHZlFcYKCchMq3cmgj9O','800180',1,'2026-11-07',NULL,NULL,'general citizen',NULL,'vikrant','vik@mail.com','kulti',NULL),(23,'shu789','$2a$10$xtsJdDK/2EQrFtfsVU8bKetj.nzEKnttBy8mAKWI2nZlDblySo5I.','7564123412',1,'2026-11-07',NULL,NULL,'authority',NULL,'shu','shu@mail.com','kolkata',NULL);

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_role_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` VALUES (1,1,1),(2,2,2),(3,3,2),(4,4,4),(5,5,2),(6,6,2),(7,7,2),(8,8,2),(10,12,2),(11,13,2),(12,21,2),(13,22,2),(14,23,4);
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-07 18:58:53


-- mysqldump-php https://github.com/ifsnop/mysqldump-php
--
-- Host: localhost	Database: raport
-- ------------------------------------------------------
-- Server version 	5.5.5-10.4.22-MariaDB
-- Date: Wed, 27 Jul 2022 12:37:46 +0200

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
-- Table structure for table `guru`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guru` (
  `nip` varchar(18) NOT NULL,
  `kd_mp` int(11) DEFAULT NULL,
  `nama_guru` varchar(30) DEFAULT NULL,
  `alamat` varchar(30) DEFAULT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `agama` enum('ISLAM','PROTESTAN','KATHOLIK','HINDU','BUDHA','KONGHUCU','LAINNYA') NOT NULL,
  PRIMARY KEY (`nip`),
  KEY `kd_mp` (`kd_mp`),
  CONSTRAINT `guru_ibfk_1` FOREIGN KEY (`kd_mp`) REFERENCES `mata_pelajaran` (`kd_mp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guru`
--

LOCK TABLES `guru` WRITE;
/*!40000 ALTER TABLE `guru` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `guru` VALUES ('197303012006040082',10,'Bambang','Pamengpeuk','L','ISLAM'),('197303012006041013',1,'Budi','Cikancung','L','ISLAM'),('197303012006041093',3,'Rini Sopiati','Ciledug','P','ISLAM'),('197303012006041434',5,'Titin Suratin','Pamengpeuk','P','ISLAM'),('197303012006041439',8,'Tina Martil','Baleendah','P','ISLAM'),('197303012006041801',9,'Jajang','Cikancung','L','PROTESTAN'),('197303012006041867',4,'Abdul Halim','Tarogong','L','ISLAM'),('197303012006042817',2,'Anwar','Pamengpeuk','L','ISLAM'),('197303012006047117',7,'Hani','Tarogong','P','ISLAM'),('197303012006048803',11,'Entis','Panyileukan','P','ISLAM'),('197303012006048865',6,'Tarno','Mengkurakyat','L','ISLAM');
/*!40000 ALTER TABLE `guru` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `guru` with 11 row(s)
--

--
-- Table structure for table `mata_pelajaran`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mata_pelajaran` (
  `kd_mp` int(11) NOT NULL AUTO_INCREMENT,
  `nama_mp` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`kd_mp`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mata_pelajaran`
--

LOCK TABLES `mata_pelajaran` WRITE;
/*!40000 ALTER TABLE `mata_pelajaran` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `mata_pelajaran` VALUES (1,'Pendidikan Agama Islam'),(2,'PKN'),(3,'Bahasa Indonesia'),(4,'Matematika'),(5,'Ilmu Pengetahuan Alam'),(6,'Ilmu Pengetahuan Sosial'),(7,'Bahasa Inggris'),(8,'Seni Budaya'),(9,'Penjasorkes'),(10,'Prakarya'),(11,'Bahasa Sunda');
/*!40000 ALTER TABLE `mata_pelajaran` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `mata_pelajaran` with 11 row(s)
--

--
-- Table structure for table `nilai`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nilai` (
  `nis` varchar(8) NOT NULL,
  `kd_mp` int(11) NOT NULL,
  `semester` enum('1','2') DEFAULT NULL,
  `nilai` int(3) DEFAULT NULL,
  `predikat` char(1) DEFAULT NULL,
  KEY `nis` (`nis`),
  KEY `kd_mp` (`kd_mp`),
  CONSTRAINT `nilai_ibfk_3` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON DELETE CASCADE,
  CONSTRAINT `nilai_ibfk_4` FOREIGN KEY (`kd_mp`) REFERENCES `mata_pelajaran` (`kd_mp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nilai`
--

LOCK TABLES `nilai` WRITE;
/*!40000 ALTER TABLE `nilai` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `nilai` VALUES ('77241560',1,'1',75,'C'),('77241560',2,'1',69,'C'),('77241560',3,'1',83,'B'),('77241560',4,'1',80,'B'),('77241560',5,'1',76,'C'),('77241560',6,'1',67,'C'),('77241560',7,'1',68,'C'),('77241560',8,'1',82,'B'),('77241560',9,'1',79,'B'),('77241560',10,'1',90,'A'),('77241560',11,'1',73,'C'),('77287165',1,'1',80,'B'),('77287165',2,'1',66,'C'),('77287165',3,'1',70,'C'),('77287165',4,'1',67,'C'),('77287165',5,'1',82,'B'),('77287165',6,'1',66,'C'),('77287165',7,'1',92,'A'),('77287165',8,'1',85,'B'),('77287165',9,'1',71,'C'),('77287165',10,'1',70,'C'),('77287165',11,'1',79,'B'),('77228601',1,'1',72,'C'),('77228601',2,'1',81,'B'),('77228601',3,'1',69,'C'),('77228601',4,'1',77,'B'),('77228601',5,'1',85,'B'),('77228601',6,'1',65,'C'),('77228601',7,'1',81,'B'),('77228601',8,'1',72,'C'),('77228601',9,'1',66,'C'),('77228601',10,'1',72,'C'),('77228601',11,'1',82,'B'),('77288132',1,'1',90,'A'),('77288132',2,'1',77,'B'),('77288132',3,'1',65,'C'),('77288132',4,'1',87,'B'),('77288132',5,'1',80,'B'),('77288132',6,'1',70,'C'),('77288132',7,'1',83,'B'),('77288132',8,'1',66,'C'),('77288132',9,'1',72,'C'),('77288132',10,'1',67,'C'),('77288132',11,'1',70,'C');
/*!40000 ALTER TABLE `nilai` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `nilai` with 44 row(s)
--

--
-- Table structure for table `siswa`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `siswa` (
  `nis` varchar(8) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` varchar(30) DEFAULT NULL,
  `kelas` enum('VII','VIII','IX') NOT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `agama` enum('ISLAM','PROTESTAN','KATHOLIK','HINDU','BUDHA','KONGHOCU','LAINNYA') DEFAULT NULL,
  `orang_tua` varchar(30) DEFAULT NULL,
  `asal_sekolah` varchar(50) NOT NULL,
  PRIMARY KEY (`nis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siswa`
--

LOCK TABLES `siswa` WRITE;
/*!40000 ALTER TABLE `siswa` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `siswa` VALUES ('77228601','heri','Jl. Cimarantes','VII','2007-06-05','L','ISLAM','Joko','SDN Ngamplang Sari 4'),('77241560','alika','Jl. Garut Tasik','VII','2007-07-17','P','ISLAM','Tono','SDN Ngamplang Sari 4'),('77287165','siti','Jl. Margalaksana','VII','2007-08-10','P','ISLAM','Jakaria','SDN Ngamplang Sari 4'),('77288132','adi','Jl. Tarogong','VII','2008-08-18','L','ISLAM','Hasan','SDN Ngamplang Sari 4');
/*!40000 ALTER TABLE `siswa` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `siswa` with 4 row(s)
--

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on: Wed, 27 Jul 2022 12:37:46 +0200

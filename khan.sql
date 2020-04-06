-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: khan
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1

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
-- Table structure for table `coachs`
--

DROP TABLE IF EXISTS `coachs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coachs` (
  `idcoachs` int(11) NOT NULL AUTO_INCREMENT COMMENT '	',
  `name` varchar(45) DEFAULT NULL,
  `hired-year` int(11) DEFAULT NULL,
  `skill` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcoachs`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coachs`
--

LOCK TABLES `coachs` WRITE;
/*!40000 ALTER TABLE `coachs` DISABLE KEYS */;
INSERT INTO `coachs` VALUES (1,'Roland',2010,'html'),(2,'Domingo',2012,'css'),(3,'Pamela',2019,'sql'),(4,'Daniela',2015,'express');
/*!40000 ALTER TABLE `coachs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_grades`
--

DROP TABLE IF EXISTS `student_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test` varchar(20) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `Comments` text,
  `coachs_idcoachs` int(11) NOT NULL,
  PRIMARY KEY (`id`,`coachs_idcoachs`),
  KEY `fk_student_grades_students1_idx` (`student_id`),
  KEY `fk_student_grades_coachs1_idx` (`coachs_idcoachs`),
  CONSTRAINT `fk_student_grades_coachs1` FOREIGN KEY (`coachs_idcoachs`) REFERENCES `coachs` (`idcoachs`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_grades_students1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_grades`
--

LOCK TABLES `student_grades` WRITE;
/*!40000 ALTER TABLE `student_grades` DISABLE KEYS */;
INSERT INTO `student_grades` VALUES (1,'html',95,1,'Great!',0),(2,'express',92,2,'Great!',0),(3,'express',85,1,'Well done!',0),(4,'html',95,2,'Good job!',0),(17,'sql',88,2,'well done!',0),(18,'css',80,3,'you did it!',0),(19,'sql',47,3,'work more!',0),(20,'css',77,2,'you did it!',0),(21,'css',77,1,'you did it!',0),(22,'sql',79,1,'you did it!',0),(23,'html',55,3,'work more!',0),(24,'express',40,3,'work more!',0),(25,'html',69,4,'you did it!',0),(26,'css',73,4,'you did it!',0),(27,'sql',69,4,'you did it!',0),(28,'express',82,4,'Good job!',0),(29,'html',85,5,'Good job',0),(30,'css',79,5,'Great!',0),(31,'sql',65,5,'you did it!',0),(32,'express',67,5,'you did it!',0),(33,'html',84,6,'Good job',0),(34,'css',90,6,'Great!',0),(35,'sql',71,6,'Good job!',0),(36,'express',58,6,'you did it!',0),(37,'html',76,7,'Good job',0),(38,'css',60,7,'You did it!',0),(39,'sql',55,7,'work more!',0),(40,'express',39,7,'work more!',0);
/*!40000 ALTER TABLE `student_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_projects`
--

DROP TABLE IF EXISTS `student_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `description` tinytext NOT NULL,
  `starting-date` date DEFAULT NULL,
  `ending-date` date DEFAULT NULL,
  `coachs_idcoachs` int(11) NOT NULL,
  PRIMARY KEY (`id`,`coachs_idcoachs`),
  KEY `fk_student_projects_coachs1_idx` (`coachs_idcoachs`),
  CONSTRAINT `fk_student_projects_coachs1` FOREIGN KEY (`coachs_idcoachs`) REFERENCES `coachs` (`idcoachs`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_projects`
--

LOCK TABLES `student_projects` WRITE;
/*!40000 ALTER TABLE `student_projects` DISABLE KEYS */;
INSERT INTO `student_projects` VALUES (1,'Horsebook','Create an app to identify and lists horses','2020-02-10','2020-04-24',4),(2,'Timesheet','Create an app to help deverlopers to manage work','2020-01-06','2020-05-15',1),(3,'InvoiceMaker','Create an app that helps independents to create invoices','2020-01-27','2020-04-08',3);
/*!40000 ALTER TABLE `student_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `contribution` tinyint(1) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Peter','Rabbit','peter@rabbit.com','555-6666','2002-06-24',1,0),(2,'Alice','Wonderland','alice@wonderland.com','555-4444','2002-07-04',1,0),(3,'Greg','Lafferty','greg@hotmail.com','476-234234','2001-02-22',1,0),(4,'Tom','Wild','tom@hotmail.com','666-9999','2003-05-26',1,0),(5,'Kim','Hanks','kim@hotmail.com','666-7777','2004-06-01',0,0),(6,'Eric','Mash','eric@hotmail.com','666-33433','2003-05-19',0,0),(7,'Demond','Starck','demon@hotmail.com','222-1111','2000-01-31',1,0),(8,'Maria','Lopez','maria@hotmail.com','888-1111','2001-02-28',1,0),(9,'John','Doe','john@hotmail.com','999-9999','2000-01-23',0,0),(10,'Robert','Janssens','janssensrobert@hotmail.com','444-12324','1969-02-28',1,1),(11,'Natacha','Bright','natacha@hotmail.com','9090-8898','1999-03-05',1,1),(12,'Steve','Being','steve@hotmail.com','899-9987','2000-03-04',1,0);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students_has_student_projects`
--

DROP TABLE IF EXISTS `students_has_student_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students_has_student_projects` (
  `students_id` int(11) NOT NULL,
  `student_projects_id` int(11) NOT NULL,
  PRIMARY KEY (`students_id`,`student_projects_id`),
  KEY `fk_students_has_student_projects_student_projects1_idx` (`student_projects_id`),
  KEY `fk_students_has_student_projects_students1_idx` (`students_id`),
  CONSTRAINT `fk_students_has_student_projects_student_projects1` FOREIGN KEY (`student_projects_id`) REFERENCES `student_projects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_students_has_student_projects_students1` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students_has_student_projects`
--

LOCK TABLES `students_has_student_projects` WRITE;
/*!40000 ALTER TABLE `students_has_student_projects` DISABLE KEYS */;
INSERT INTO `students_has_student_projects` VALUES (4,1),(6,1),(9,1),(2,2),(3,2),(8,2),(1,3),(5,3),(7,3);
/*!40000 ALTER TABLE `students_has_student_projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-06 11:34:58

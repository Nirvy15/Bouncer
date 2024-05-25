CREATE DATABASE  IF NOT EXISTS `useraccess` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `useraccess`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: useraccess
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `event_id` int NOT NULL AUTO_INCREMENT,
  `event_name` varchar(255) NOT NULL,
  `event_description` text,
  `event_date` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'Daft Punk Revival','A tribute concert featuring the greatest hits of Daft Punk.','2024-07-15 00:00:00',0),(2,'Red Hot Chilli Peppers Tour','Live tour by the iconic band Red Hot Chilli Peppers, performing their latest album.','2024-08-22 00:00:00',0),(3,'Yo Gabba Gabba Live','A live show for children featuring characters from the popular TV show Yo Gabba Gabba.','2024-09-10 00:00:00',0),(4,'Elon Musk TED Talk','An inspiring talk by Elon Musk about the future of technology and space exploration.','2024-10-05 00:00:00',0),(5,'One Piece On Ice','A spectacular ice skating show based on the famous anime One Piece.','2024-11-20 00:00:00',0);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userevents`
--

DROP TABLE IF EXISTS `userevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userevents` (
  `user_id` int NOT NULL,
  `event_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`event_id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `userevents_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userevents_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userevents`
--

LOCK TABLES `userevents` WRITE;
/*!40000 ALTER TABLE `userevents` DISABLE KEYS */;
INSERT INTO `userevents` VALUES (1,1),(2,1),(3,1),(4,1),(6,1),(7,1),(7,2),(1,3),(2,3),(3,3),(4,3),(5,3),(6,3),(7,3),(8,3),(9,3),(10,3),(3,4),(8,4),(10,4),(5,5),(6,5),(10,5);
/*!40000 ALTER TABLE `userevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `username_2` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'John Doe','user1','user1@example.com','pass1'),(2,'Muhammad Doe','user2','user2@example.com','pass2'),(3,'Maria Doe','user3','user3@example.com','pass3'),(4,'James Doe','user4','user4@example.com','pass4'),(5,'Juan Doe','user5','user5@example.com','pass5'),(6,'Ahmed Doe','user6','user6@example.com','pass6'),(7,'Lisa Doe','user7','user7@example.com','pass7'),(8,'Eileen Doe','user8','user8@example.com','pass8'),(9,'Marge Doe','user9','user9@example.com','pass9'),(10,'Jesus Doe','user10','user10@example.com','pass10');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_calls`
--

DROP TABLE IF EXISTS `video_calls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video_calls` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `event_id` int DEFAULT NULL,
  `video_call_link` varchar(255) DEFAULT NULL,
  `used` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_event_id` (`event_id`),
  CONSTRAINT `fk_event` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`),
  CONSTRAINT `fk_event_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_calls`
--

LOCK TABLES `video_calls` WRITE;
/*!40000 ALTER TABLE `video_calls` DISABLE KEYS */;
INSERT INTO `video_calls` VALUES (24,1,1,'https://us04web.zoom.us/j/72846915344?pwd=jbS65EDM7JRHEagMBbXLUby2d36Dqs.1',0),(25,2,1,'https://us04web.zoom.us/j/77598747242?pwd=ldgO3UewLfKGm8nBONO77RwKXEEwR9.1',0),(26,3,1,'https://us04web.zoom.us/j/78303346035?pwd=ahD2XEW6z0Bx7uFRIlxsTpyN3riKpM.1',0),(27,4,1,'https://us04web.zoom.us/j/75832096038?pwd=ObzqGxxmXrH1aVjJXaFL7dc6m95vlH.1',0),(28,6,1,'https://us04web.zoom.us/j/76828280433?pwd=3HzV5Q1mzvZKGqpwXrSDdd9u4OmaEA.1',0),(29,7,1,'https://us04web.zoom.us/j/73194260471?pwd=pHnGQGsxpmRSnOu6WgPOgcVvWIlD1k.1',0),(30,7,2,'https://us04web.zoom.us/j/73221531553?pwd=zWcwdsaIJjUs7w70J04aIGmVK7DMkE.1',0),(31,1,3,'https://us04web.zoom.us/j/72349483340?pwd=svPt2mWgXgDHiMwbVghakCTz58DH4d.1',0),(32,2,3,'https://us04web.zoom.us/j/74018738240?pwd=0Z5qFvzlBasWqprPO2yOqkaGptnCJQ.1',0),(33,3,3,'https://us04web.zoom.us/j/71502463962?pwd=uRRLJaUS3HP7pfrnzlZkmGSqAzFqpI.1',0),(34,4,3,'https://us04web.zoom.us/j/73243500850?pwd=2HDlLK5SYpWTFfnte00caaI1tbr2Z7.1',0),(35,5,3,'https://us04web.zoom.us/j/77918873882?pwd=qjElxRDaTmbvJLbm7hDy4a6bnd7AWb.1',0),(36,6,3,'https://us04web.zoom.us/j/76678974713?pwd=u581cUMq44LnpAEIcLobjGpwGMIj0o.1',0),(37,7,3,'https://us04web.zoom.us/j/74668084456?pwd=LXSbhaGFNbXMs79TI7RpuL2hLNOyl3.1',0),(38,8,3,'https://us04web.zoom.us/j/79698369832?pwd=ba6a1rWasFpSq3pNvtlx81Gx4FzqTZ.1',0),(39,9,3,'https://us04web.zoom.us/j/76654893989?pwd=HFbOnkRTt2CSbaOCzhOrQAclWVIcPb.1',0),(40,10,3,'https://us04web.zoom.us/j/75369944864?pwd=Q7pQYz1kRgjVw4bDIaEpQKVJhyvgJB.1',0),(41,3,4,'https://us04web.zoom.us/j/72990248380?pwd=20F0KV9a1yNSj34Bb2iCvbrOkIf766.1',0),(42,8,4,'https://us04web.zoom.us/j/77210264529?pwd=mbucwxbszaIs75Un9WYc5bGnXkuSX9.1',0),(43,10,4,'https://us04web.zoom.us/j/72114731848?pwd=w0DptEc9WeoOmAlmLiULPaN6sxAWpW.1',0),(44,5,5,'https://us04web.zoom.us/j/72598149523?pwd=sRL45Q2Vs6YooLLtPzdu0KCGQuWSpV.1',0),(45,6,5,'https://us04web.zoom.us/j/71889631402?pwd=QqW85DzkoeVNj8OhlfEbdWj1Mhbeay.1',0),(46,10,5,'https://us04web.zoom.us/j/75374009026?pwd=A2F1VKyaJjUeJJex1eJYD36qzJ98hN.1',0);
/*!40000 ALTER TABLE `video_calls` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-24 22:52:02

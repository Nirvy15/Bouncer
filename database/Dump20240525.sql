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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_calls`
--

LOCK TABLES `video_calls` WRITE;
/*!40000 ALTER TABLE `video_calls` DISABLE KEYS */;
INSERT INTO `video_calls` VALUES (1,1,1,'https://us04web.zoom.us/j/77101026931?pwd=fpkn8meUfYxtoWmobC1idF1hf6fR4N.1',0),(2,2,1,'https://us04web.zoom.us/j/76249724669?pwd=jCBDZzq57Rv6wEmQX3dEGC2cu3f5T9.1',0),(3,3,1,'https://us04web.zoom.us/j/79879214122?pwd=ERXjUo4dsIoIPlscvdTn2sN8jyaugU.1',0),(4,4,1,'https://us04web.zoom.us/j/72501360497?pwd=Z0pd59wQwnQy9GNpdX5EbxjAkBEInK.1',0),(5,6,1,'https://us04web.zoom.us/j/73385327359?pwd=x6kaYAeAxwlm4tV097uWaayAPCFe6o.1',0),(6,7,1,'https://us04web.zoom.us/j/76344990430?pwd=zhJY8HE8x5NYzyYXb9PmadBDJl0ZqT.1',0),(7,7,2,'https://us04web.zoom.us/j/75120358758?pwd=wrBhampTzvSeX3k1U9rn9FNp4TrFtx.1',0),(8,1,3,'https://us04web.zoom.us/j/72059835363?pwd=wj8LBhQpNTrj2bjeJvQkXTJgx09TeL.1',0),(9,2,3,'https://us04web.zoom.us/j/77736224362?pwd=jB0QcfChZ3tCQh4c07bSDwJXwonPBB.1',0),(10,3,3,'https://us04web.zoom.us/j/75044146640?pwd=cmbOi4LoPqCy5HAM4VYCXcxMavR6Pl.1',0),(11,4,3,'https://us04web.zoom.us/j/72481885270?pwd=0SOiaSRr3vmMgP0MANeFCTfO3YuDQK.1',0),(12,5,3,'https://us04web.zoom.us/j/73802639295?pwd=ti13Qh17IqTRGLiHgPpibzngrO0PUs.1',0),(13,6,3,'https://us04web.zoom.us/j/71873355345?pwd=e69ax16agmpyNPBkeqvWSfutaqtzr8.1',0),(14,7,3,'https://us04web.zoom.us/j/77383493246?pwd=D5VSakAfj034loctebWn7g6u6bZmUD.1',0),(15,8,3,'https://us04web.zoom.us/j/77662116896?pwd=dmBstaTpDDMpAF1ypBSFbroUdeHQyb.1',0),(16,9,3,'https://us04web.zoom.us/j/76922853353?pwd=4T2AS8zoWbUKeNfBFK15fi0ecjXz1X.1',0),(17,10,3,'https://us04web.zoom.us/j/75813130194?pwd=smZ5uvFP2XHY0Ud0mFoF6eAcNJLm3t.1',0),(18,3,4,'https://us04web.zoom.us/j/77244400586?pwd=DOShldba1mmZu9eeyJae4BLVfn4vPE.1',0),(19,8,4,'https://us04web.zoom.us/j/74635981243?pwd=ZRpC8khP5tVxy9jjaMeDH0OpMoezj9.1',0),(20,10,4,'https://us04web.zoom.us/j/77358712484?pwd=ip43Kf5QESfxKlRovawadb330QwR5C.1',0),(21,5,5,'https://us04web.zoom.us/j/76286887373?pwd=e1KgKbnoHOaIavAiIY7ytwMqqA5BIt.1',0),(22,6,5,'https://us04web.zoom.us/j/73397159855?pwd=xqZM4aas4b2e5bxQJgC6W87sG8KRDm.1',0),(23,10,5,'https://us04web.zoom.us/j/71885900663?pwd=okCZX6zBdMvMjJuMfQodDCT0Gf4kZv.1',0);
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

-- Dump completed on 2024-05-25 17:12:30

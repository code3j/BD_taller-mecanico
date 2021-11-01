-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_tallermecanico
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `inventario_vehiculo`
--

DROP TABLE IF EXISTS `inventario_vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario_vehiculo` (
  `id_inventario` int NOT NULL AUTO_INCREMENT,
  `alarma` varchar(15) DEFAULT NULL,
  `espejo_retro` varchar(15) DEFAULT NULL,
  `luces_interiores` varchar(15) DEFAULT NULL,
  `caucho_repuesto` varchar(15) DEFAULT NULL,
  `faros` varchar(15) DEFAULT NULL,
  `observacion` varchar(200) DEFAULT NULL,
  `id_vehiculo` int NOT NULL,
  PRIMARY KEY (`id_inventario`),
  KEY `fk_VEHICULO_id_vehiculo_inv_idx` (`id_vehiculo`),
  CONSTRAINT `fk_VEHICULO_id_vehiculo_inv` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculo` (`id_vehiculo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario_vehiculo`
--

LOCK TABLES `inventario_vehiculo` WRITE;
/*!40000 ALTER TABLE `inventario_vehiculo` DISABLE KEYS */;
INSERT INTO `inventario_vehiculo` VALUES (1,'si','si','si','si','si','choque en la parte trasera derecha',1),(2,'si','si','no','no','si','manilla derecha rota',2),(3,'si','no','no','si','si','Espejo retrovisor derecho con vidrio rayado ',3);
/*!40000 ALTER TABLE `inventario_vehiculo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-19 11:30:04

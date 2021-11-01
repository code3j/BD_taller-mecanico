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
-- Table structure for table `cita`
--

DROP TABLE IF EXISTS `cita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cita` (
  `id_cita` int NOT NULL AUTO_INCREMENT,
  `fecha_solicitud` date DEFAULT NULL,
  `fecha_pautada` date DEFAULT NULL,
  `falla_carro` varchar(250) DEFAULT NULL,
  `observacion` varchar(250) DEFAULT NULL,
  `id_vehiculo` int NOT NULL,
  PRIMARY KEY (`id_cita`),
  KEY `fk_VEHICULO_id_vehiculo_c_idx` (`id_vehiculo`),
  CONSTRAINT `fk_VEHICULO_id_vehiculo_c` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculo` (`id_vehiculo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cita`
--

LOCK TABLES `cita` WRITE;
/*!40000 ALTER TABLE `cita` DISABLE KEYS */;
INSERT INTO `cita` VALUES (1,'2020-08-08','2050-08-09','Cambio de correa de tiempo y tensor','el carro alcanzo el km maximo para el cambio',1),(2,'2019-04-10','2019-04-12','Sonido extraño en la rueda derecha','hace poco el carro cayó en hueco profundo',2),(3,'2020-08-08','2050-08-09','Cambio de correa de tiempo y tensor','el carro alcanzo el km maximo para el cambio',3);
/*!40000 ALTER TABLE `cita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_factura`
--

DROP TABLE IF EXISTS `detalle_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_factura` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_factura` int NOT NULL,
  `id_repuesto` int NOT NULL,
  `cantidad` int DEFAULT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `fk_REPUESTO_id_repuesto_idx` (`id_repuesto`),
  KEY `fk_FACTURA_id_factura_df_idx` (`id_factura`),
  CONSTRAINT `fk_FACTURA_id_factura_df` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id_factura`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_REPUESTO_id_repuesto` FOREIGN KEY (`id_repuesto`) REFERENCES `repuesto` (`id_repuesto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_factura`
--

LOCK TABLES `detalle_factura` WRITE;
/*!40000 ALTER TABLE `detalle_factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_presupuesto`
--

DROP TABLE IF EXISTS `detalle_presupuesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_presupuesto` (
  `id_detalle_presupuesto` int NOT NULL AUTO_INCREMENT,
  `id_repuesto` int DEFAULT NULL,
  `id_presupuesto` int NOT NULL,
  `cantidad` int DEFAULT NULL,
  PRIMARY KEY (`id_detalle_presupuesto`),
  KEY `FK_PRESUPUESTO_id_presupuesto_idx` (`id_presupuesto`),
  CONSTRAINT `FK_PRESUPUESTO_id_presupuesto` FOREIGN KEY (`id_presupuesto`) REFERENCES `presupuesto` (`id_presupuesto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_presupuesto`
--

LOCK TABLES `detalle_presupuesto` WRITE;
/*!40000 ALTER TABLE `detalle_presupuesto` DISABLE KEYS */;
INSERT INTO `detalle_presupuesto` VALUES (1,2,1,5);
/*!40000 ALTER TABLE `detalle_presupuesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `id_factura` int NOT NULL AUTO_INCREMENT,
  `id_vehiculo` int NOT NULL,
  `id_mecanico` int NOT NULL,
  `total_pagar` decimal(10,0) NOT NULL,
  `fecha_factura` date NOT NULL,
  `diagnostico` varchar(300) NOT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `fk_VEHICULO_id_vehiculo_idx` (`id_vehiculo`),
  KEY `fk_MECANICO_id_mecanico_idx` (`id_mecanico`),
  CONSTRAINT `fk_MECANICO_id_mecanico` FOREIGN KEY (`id_mecanico`) REFERENCES `mecanico` (`id_mecanico`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_VEHICULO_id_vehiculo` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculo` (`id_vehiculo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `mecanico`
--

DROP TABLE IF EXISTS `mecanico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mecanico` (
  `id_mecanico` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `cedula` varchar(20) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_mecanico`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mecanico`
--

LOCK TABLES `mecanico` WRITE;
/*!40000 ALTER TABLE `mecanico` DISABLE KEYS */;
INSERT INTO `mecanico` VALUES (1,'xavier','gonzalez','24567789','0424-987265'),(2,'marcos','perez','78982828','0426-982737'),(3,'julian','alvarez','89898283','0424-989823'),(4,'maria','josefina','12892839','0414-283983');
/*!40000 ALTER TABLE `mecanico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presupuesto`
--

DROP TABLE IF EXISTS `presupuesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presupuesto` (
  `id_presupuesto` int NOT NULL AUTO_INCREMENT,
  `id_vehiculo` int NOT NULL,
  `id_mecanico` int NOT NULL,
  `total_pagar` decimal(10,0) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `diagnostico` varchar(300) NOT NULL,
  PRIMARY KEY (`id_presupuesto`),
  KEY `fk_VEHICULO_id_vehiculo2_idx` (`id_vehiculo`),
  KEY `fk_MECANICO_id_mecanico_2_idx` (`id_mecanico`),
  CONSTRAINT `fk_MECANICO_id_mecanico_2` FOREIGN KEY (`id_mecanico`) REFERENCES `mecanico` (`id_mecanico`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_VEHICULO_id_vehiculo2` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculo` (`id_vehiculo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presupuesto`
--

LOCK TABLES `presupuesto` WRITE;
/*!40000 ALTER TABLE `presupuesto` DISABLE KEYS */;
INSERT INTO `presupuesto` VALUES (1,1,1,600,'2020-08-09','valvula del minimo descompuesta');
/*!40000 ALTER TABLE `presupuesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propietario`
--

DROP TABLE IF EXISTS `propietario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propietario` (
  `id_propietario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `num_licencia` varchar(20) DEFAULT NULL,
  `cedula` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id_propietario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propietario`
--

LOCK TABLES `propietario` WRITE;
/*!40000 ALTER TABLE `propietario` DISABLE KEYS */;
INSERT INTO `propietario` VALUES (1,'ALBERTO','SMITH','av don julio, el morro , casa 123-A','0241-8721237','albertogarcia28@hotmail.com','17282732','10989234'),(2,'MODIFICACION ','silva','MERU ITALIA','0241-8729967','alexandra@yahoo.com','16789023','16789023'),(3,'zayn','malik','Av.Principal Arabia, Edificio \"Los Riscos\" apto 32-b','0212-1998723','zaynmalik@gmail.com','24768902','24768902');
/*!40000 ALTER TABLE `propietario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `empresa` varchar(150) DEFAULT NULL,
  `telefono` varchar(11) DEFAULT NULL,
  `direccion_empresa` text,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Martin','luter','ML respuestos C.A','04246781235','Av.Lara, Valencia,Carabobo'),(2,'Keyson','Martinez','autoparte KM','04161289542','Av.Las Ferias , Valencia , carabobo'),(3,'Daniela','Rodriguez','Cars C.A ','04266727892','Calle 4, Sector 11, La isabelica, Carabobo'),(4,'kevin','perez','autorepuestos el kevin','0416-382938','Calle 4, Sector 16, La isabelica, Carabobo');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repuesto`
--

DROP TABLE IF EXISTS `repuesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repuesto` (
  `id_repuesto` int NOT NULL AUTO_INCREMENT,
  `nombre_repuesto` varchar(300) DEFAULT NULL,
  `descripcion` text,
  `precio` decimal(10,0) DEFAULT NULL,
  `existencias` varchar(25) DEFAULT NULL,
  `id_proveedor` int NOT NULL,
  PRIMARY KEY (`id_repuesto`),
  KEY `fk_PROVEEDOR_id_proveedor_idx` (`id_proveedor`),
  CONSTRAINT `fk_PROVEEDOR_id_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repuesto`
--

LOCK TABLES `repuesto` WRITE;
/*!40000 ALTER TABLE `repuesto` DISABLE KEYS */;
INSERT INTO `repuesto` VALUES (1,'valvula del minimo','pequeña valvula que controla la estabilidad del carro en velocidades bajas ',110,'5',1),(2,'correa de tiempo ','correa de tiempo orginal  traido de Francia',70,'7',3),(3,'correa de tiempo ','correa de tiempo orginal  traido de Francia',70,'7',2),(4,'tensor ','tensor original traido de Alemania',35,'3',3);
/*!40000 ALTER TABLE `repuesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_usuario` (
  `id` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_usuario`
--

LOCK TABLES `tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
INSERT INTO `tipo_usuario` VALUES (1,'jeka'),(2,'profe');
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) NOT NULL,
  `tipo_usuarioscol` varchar(45) DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `last_session` datetime DEFAULT '0000-00-00 00:00:00',
  `id_tipo` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'usuario','1','usuario','Jeka','jeka@gmail.com','0000-00-00 00:00:00',1),(2,'admin','2','admin','Profe','profe@gmail.com','0000-00-00 00:00:00',2);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculo` (
  `id_vehiculo` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(20) DEFAULT NULL,
  `anio` int DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `placa` varchar(7) DEFAULT NULL,
  `id_propietario` int NOT NULL,
  PRIMARY KEY (`id_vehiculo`),
  KEY `fk_PROPIETARIO_id_propietario_idx` (`id_propietario`),
  CONSTRAINT `fk_PROPIETARIO_id_propietario` FOREIGN KEY (`id_propietario`) REFERENCES `propietario` (`id_propietario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
INSERT INTO `vehiculo` VALUES (1,'ford',2000,'rojo','AGD98Q',1),(2,'chevrolet',2006,'verde','MNH78A',2),(3,'Mazda',2019,'Negro','LOP876U',3);
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-19 11:33:10

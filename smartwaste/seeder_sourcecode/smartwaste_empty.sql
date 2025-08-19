CREATE DATABASE  IF NOT EXISTS `smartwaste` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `smartwaste`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: smartwaste
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `tbb_contenedores`
--

DROP TABLE IF EXISTS `tbb_contenedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_contenedores` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Ubicacion` varchar(255) NOT NULL,
  `Capacidad` int NOT NULL,
  `Ruta_Id` int DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Estatus` tinyint(1) DEFAULT NULL,
  `Fecha_Registro` datetime DEFAULT NULL,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Ruta_Id` (`Ruta_Id`),
  KEY `ix_tbb_contenedores_ID` (`ID`),
  CONSTRAINT `tbb_contenedores_ibfk_1` FOREIGN KEY (`Ruta_Id`) REFERENCES `tbb_rutas_recoleccion` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_contenedores`
--

LOCK TABLES `tbb_contenedores` WRITE;
/*!40000 ALTER TABLE `tbb_contenedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_contenedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_rutas_recoleccion`
--

DROP TABLE IF EXISTS `tbb_rutas_recoleccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_rutas_recoleccion` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Fecha_Registro` datetime NOT NULL,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  `Estatus` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_tbb_rutas_recoleccion_ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_rutas_recoleccion`
--

LOCK TABLES `tbb_rutas_recoleccion` WRITE;
/*!40000 ALTER TABLE `tbb_rutas_recoleccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_rutas_recoleccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_sensores`
--

DROP TABLE IF EXISTS `tbb_sensores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_sensores` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(50) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Estatus` tinyint(1) DEFAULT NULL,
  `Fecha_Registro` datetime NOT NULL,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  `Contenedor_Id` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Contenedor_Id` (`Contenedor_Id`),
  KEY `ix_tbb_sensores_ID` (`ID`),
  CONSTRAINT `tbb_sensores_ibfk_1` FOREIGN KEY (`Contenedor_Id`) REFERENCES `tbb_contenedores` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_sensores`
--

LOCK TABLES `tbb_sensores` WRITE;
/*!40000 ALTER TABLE `tbb_sensores` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_sensores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_usuarios`
--

DROP TABLE IF EXISTS `tbb_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_usuarios` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Tipo_Usuario` enum('ADMIN','USUARIO','CHOFER') DEFAULT NULL,
  `Nombre_Usuario` varchar(50) DEFAULT NULL,
  `Correo_Electronico` varchar(100) DEFAULT NULL,
  `Contrasena` varchar(255) DEFAULT NULL,
  `Numero_Telefonico_Movil` varchar(20) DEFAULT NULL,
  `Estatus` tinyint(1) DEFAULT NULL,
  `Fecha_Registro` datetime DEFAULT NULL,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_tbb_usuarios_Nombre_Usuario` (`Nombre_Usuario`),
  UNIQUE KEY `ix_tbb_usuarios_Correo_Electronico` (`Correo_Electronico`),
  KEY `ix_tbb_usuarios_ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_usuarios`
--

LOCK TABLES `tbb_usuarios` WRITE;
/*!40000 ALTER TABLE `tbb_usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_usuario_ruta`
--

DROP TABLE IF EXISTS `tbc_usuario_ruta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_usuario_ruta` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Usuario_Id` int NOT NULL,
  `Ruta_Id` int NOT NULL,
  `Fecha_Registro` datetime NOT NULL,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  `Estatus` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`,`Usuario_Id`,`Ruta_Id`),
  KEY `Usuario_Id` (`Usuario_Id`),
  KEY `Ruta_Id` (`Ruta_Id`),
  CONSTRAINT `tbc_usuario_ruta_ibfk_1` FOREIGN KEY (`Usuario_Id`) REFERENCES `tbb_usuarios` (`ID`),
  CONSTRAINT `tbc_usuario_ruta_ibfk_2` FOREIGN KEY (`Ruta_Id`) REFERENCES `tbb_rutas_recoleccion` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_usuario_ruta`
--

LOCK TABLES `tbc_usuario_ruta` WRITE;
/*!40000 ALTER TABLE `tbc_usuario_ruta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_usuario_ruta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_bitacora_contenedor`
--

DROP TABLE IF EXISTS `tbd_bitacora_contenedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_bitacora_contenedor` (
  `Bitacora_Id` int NOT NULL,
  `Contenedor_Id` int NOT NULL,
  `Fecha_Registro` datetime NOT NULL,
  `Estado_Contenedor` varchar(100) DEFAULT NULL,
  `Porcentaje_Llenado` int DEFAULT NULL,
  `Recolectado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Bitacora_Id`,`Contenedor_Id`),
  KEY `Contenedor_Id` (`Contenedor_Id`),
  CONSTRAINT `tbd_bitacora_contenedor_ibfk_1` FOREIGN KEY (`Bitacora_Id`) REFERENCES `tbd_bitacora_recoleccion` (`ID`),
  CONSTRAINT `tbd_bitacora_contenedor_ibfk_2` FOREIGN KEY (`Contenedor_Id`) REFERENCES `tbb_contenedores` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_bitacora_contenedor`
--

LOCK TABLES `tbd_bitacora_contenedor` WRITE;
/*!40000 ALTER TABLE `tbd_bitacora_contenedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_bitacora_contenedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_bitacora_recoleccion`
--

DROP TABLE IF EXISTS `tbd_bitacora_recoleccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_bitacora_recoleccion` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Fecha_Registro` datetime NOT NULL,
  `Ruta_Id` int DEFAULT NULL,
  `Observaciones` varchar(255) DEFAULT NULL,
  `Tiempo_Duracion` int DEFAULT NULL,
  `Cantidad_Contenedores` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Ruta_Id` (`Ruta_Id`),
  CONSTRAINT `tbd_bitacora_recoleccion_ibfk_1` FOREIGN KEY (`Ruta_Id`) REFERENCES `tbb_rutas_recoleccion` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_bitacora_recoleccion`
--

LOCK TABLES `tbd_bitacora_recoleccion` WRITE;
/*!40000 ALTER TABLE `tbd_bitacora_recoleccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_bitacora_recoleccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_lecturas_sensores`
--

DROP TABLE IF EXISTS `tbd_lecturas_sensores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_lecturas_sensores` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Valor` float DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Sensor_Id` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Sensor_Id` (`Sensor_Id`),
  CONSTRAINT `tbd_lecturas_sensores_ibfk_1` FOREIGN KEY (`Sensor_Id`) REFERENCES `tbb_sensores` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_lecturas_sensores`
--

LOCK TABLES `tbd_lecturas_sensores` WRITE;
/*!40000 ALTER TABLE `tbd_lecturas_sensores` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_lecturas_sensores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'smartwaste'
--

--
-- Dumping routines for database 'smartwaste'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-19  0:40:34

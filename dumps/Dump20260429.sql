CREATE DATABASE  IF NOT EXISTS "CINEMA" /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `CINEMA`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: mysql-38c2bea7-estudante-49b9.b.aivencloud.com    Database: CINEMA
-- ------------------------------------------------------
-- Server version	8.0.45

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '86472b8b-3e7c-11f1-a05d-063b2be723c7:1-266';

--
-- Table structure for table `CATEGORIA`
--

DROP TABLE IF EXISTS `CATEGORIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CATEGORIA` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `descricao_cat` varchar(30) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATEGORIA`
--

LOCK TABLES `CATEGORIA` WRITE;
/*!40000 ALTER TABLE `CATEGORIA` DISABLE KEYS */;
INSERT INTO `CATEGORIA` VALUES (1,'Ação'),(2,'Comédia'),(3,'Drama'),(4,'Terror'),(5,'Animação');
/*!40000 ALTER TABLE `CATEGORIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENTE`
--

DROP TABLE IF EXISTS `CLIENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENTE` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome_cliente` varchar(100) NOT NULL,
  `cpf_cliente` varchar(15) NOT NULL,
  `email_cliente` varchar(30) NOT NULL,
  `status_cliente` enum('ativo','inativo') DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `cpf_cliente` (`cpf_cliente`),
  UNIQUE KEY `email_cliente` (`email_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENTE`
--

LOCK TABLES `CLIENTE` WRITE;
/*!40000 ALTER TABLE `CLIENTE` DISABLE KEYS */;
INSERT INTO `CLIENTE` VALUES (1,'João Silva','123.456.789-00','joao@email.com','ativo'),(2,'Maria Souza','987.654.321-00','maria@email.com','ativo'),(3,'Carlos Pereira','111.222.333-44','carlos@email.com','inativo');
/*!40000 ALTER TABLE `CLIENTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FILME`
--

DROP TABLE IF EXISTS `FILME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FILME` (
  `id_filme` int NOT NULL AUTO_INCREMENT,
  `nome_filme` varchar(100) NOT NULL,
  `faixa_etaria` int DEFAULT NULL,
  `duracao_filme` int NOT NULL,
  `status_filme` enum('em cartaz','fora de cartaz') DEFAULT NULL,
  `id_categoria_filme` int NOT NULL,
  PRIMARY KEY (`id_filme`),
  KEY `id_categoria_filme` (`id_categoria_filme`),
  CONSTRAINT `FILME_ibfk_1` FOREIGN KEY (`id_categoria_filme`) REFERENCES `CATEGORIA` (`id_categoria`),
  CONSTRAINT `FILME_chk_1` CHECK ((`faixa_etaria` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FILME`
--

LOCK TABLES `FILME` WRITE;
/*!40000 ALTER TABLE `FILME` DISABLE KEYS */;
INSERT INTO `FILME` VALUES (1,'Velozes e Furiosos 10',14,130,'em cartaz',1),(2,'Se Beber Não Case',16,110,'fora de cartaz',2),(3,'O Poderoso Chefão',18,175,'fora de cartaz',3),(4,'Invocação do Mal',16,120,'em cartaz',4),(5,'Toy Story',0,90,'em cartaz',5);
/*!40000 ALTER TABLE `FILME` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PEDIDO`
--

DROP TABLE IF EXISTS `PEDIDO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PEDIDO` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `data_hora` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_cliente` int DEFAULT NULL,
  `status_pedido` enum('aberto','pago','cancelado') DEFAULT 'aberto',
  PRIMARY KEY (`id_pedido`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `PEDIDO_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `CLIENTE` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PEDIDO`
--

LOCK TABLES `PEDIDO` WRITE;
/*!40000 ALTER TABLE `PEDIDO` DISABLE KEYS */;
INSERT INTO `PEDIDO` VALUES (1,'2026-04-29 19:53:43',1,'aberto'),(2,'2026-04-29 19:53:43',2,'pago'),(3,'2026-04-29 19:53:43',1,'cancelado');
/*!40000 ALTER TABLE `PEDIDO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SALA`
--

DROP TABLE IF EXISTS `SALA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SALA` (
  `id_sala` int NOT NULL AUTO_INCREMENT,
  `descricao_sala` text NOT NULL,
  `tipo_sala` enum('2D','3D','IMAX') DEFAULT '2D',
  `capacidade_sala` int NOT NULL,
  `vip_sala` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_sala`),
  CONSTRAINT `SALA_chk_1` CHECK ((`capacidade_sala` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SALA`
--

LOCK TABLES `SALA` WRITE;
/*!40000 ALTER TABLE `SALA` DISABLE KEYS */;
INSERT INTO `SALA` VALUES (1,'Sala 1 padrão','2D',100,0),(2,'Sala 2 3D','3D',80,0),(3,'Sala 3 IMAX VIP','IMAX',60,1);
/*!40000 ALTER TABLE `SALA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SESSAO`
--

DROP TABLE IF EXISTS `SESSAO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SESSAO` (
  `id_sessao` int NOT NULL AUTO_INCREMENT,
  `data_hora` datetime NOT NULL,
  `status_sessao` enum('aberta','encerrada','cancelada') DEFAULT 'aberta',
  `id_sala` int DEFAULT NULL,
  `id_filme` int DEFAULT NULL,
  PRIMARY KEY (`id_sessao`),
  UNIQUE KEY `data_hora` (`data_hora`,`id_sala`),
  KEY `id_sala` (`id_sala`),
  KEY `id_filme` (`id_filme`),
  CONSTRAINT `SESSAO_ibfk_1` FOREIGN KEY (`id_sala`) REFERENCES `SALA` (`id_sala`),
  CONSTRAINT `SESSAO_ibfk_2` FOREIGN KEY (`id_filme`) REFERENCES `FILME` (`id_filme`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SESSAO`
--

LOCK TABLES `SESSAO` WRITE;
/*!40000 ALTER TABLE `SESSAO` DISABLE KEYS */;
INSERT INTO `SESSAO` VALUES (1,'2026-05-01 18:00:00','aberta',1,1),(2,'2026-05-01 20:00:00','aberta',2,4),(3,'2026-05-01 21:00:00','aberta',3,5),(4,'2026-05-02 19:00:00','encerrada',1,2),(5,'2026-05-02 22:00:00','cancelada',2,3);
/*!40000 ALTER TABLE `SESSAO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TIPO_INGRESSO`
--

DROP TABLE IF EXISTS `TIPO_INGRESSO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TIPO_INGRESSO` (
  `id_tipo_ingresso` int NOT NULL AUTO_INCREMENT,
  `descricao_ingresso` varchar(50) NOT NULL,
  `valor_ingresso` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id_tipo_ingresso`),
  CONSTRAINT `TIPO_INGRESSO_chk_1` CHECK ((`valor_ingresso` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TIPO_INGRESSO`
--

LOCK TABLES `TIPO_INGRESSO` WRITE;
/*!40000 ALTER TABLE `TIPO_INGRESSO` DISABLE KEYS */;
INSERT INTO `TIPO_INGRESSO` VALUES (1,'Inteira',30.00),(2,'Meia',15.00),(3,'VIP',50.00);
/*!40000 ALTER TABLE `TIPO_INGRESSO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingresso`
--

DROP TABLE IF EXISTS `ingresso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingresso` (
  `id_ingresso` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `id_sessao` int NOT NULL,
  `id_tipo_ingresso` int NOT NULL,
  `valor_pago` decimal(5,2) NOT NULL,
  `status_ingresso` enum('reservado','pago','cancelado') DEFAULT 'reservado',
  PRIMARY KEY (`id_ingresso`),
  KEY `id_tipo_ingresso` (`id_tipo_ingresso`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_sessao` (`id_sessao`),
  CONSTRAINT `ingresso_ibfk_1` FOREIGN KEY (`id_tipo_ingresso`) REFERENCES `TIPO_INGRESSO` (`id_tipo_ingresso`),
  CONSTRAINT `ingresso_ibfk_2` FOREIGN KEY (`id_pedido`) REFERENCES `PEDIDO` (`id_pedido`),
  CONSTRAINT `ingresso_ibfk_3` FOREIGN KEY (`id_sessao`) REFERENCES `SESSAO` (`id_sessao`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingresso`
--

LOCK TABLES `ingresso` WRITE;
/*!40000 ALTER TABLE `ingresso` DISABLE KEYS */;
INSERT INTO `ingresso` VALUES (1,1,1,1,30.00,'reservado'),(2,1,2,2,15.00,'reservado'),(3,2,3,3,50.00,'pago'),(4,2,1,1,30.00,'pago'),(5,3,4,2,15.00,'cancelado');
/*!40000 ALTER TABLE `ingresso` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-29 17:04:03

CREATE DATABASE  IF NOT EXISTS "lojinhaMA78" /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `lojinhaMA78`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: mysql-38c2bea7-estudante-49b9.b.aivencloud.com    Database: lojinhaMA78
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

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '86472b8b-3e7c-11f1-a05d-063b2be723c7:1-215';

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome_cliente` varchar(100) NOT NULL,
  `sobrenome_cliente` varchar(100) DEFAULT NULL,
  `cpf_cliente` varchar(11) NOT NULL,
  `telefone_cliente` varchar(20) NOT NULL,
  `email_cliente` varchar(80) NOT NULL,
  `cidade_cliente` varchar(50) NOT NULL,
  `cep_cliente` varchar(10) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `cpf_cliente` (`cpf_cliente`),
  UNIQUE KEY `telefone_cliente` (`telefone_cliente`),
  UNIQUE KEY `email_cliente` (`email_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Virginia','do sul','12345678901','40028922','virgina@hotmail.com','eua','1234'),(2,'João','Silva','12445678901','11987654321','joao.silva@email.com','São Paulo','01010100'),(3,'Maria','Oliveira','23456789012','11976543210','maria.oliveira@email.com','Rio de Janeiro','20202020'),(4,'Carlos','Santos','34567890123','11965432109','carlos.santos@email.com','Belo Horizonte','30303030'),(5,'Fernanda','Costa','45678901234','11954321098','fernanda.costa@email.com','Curitiba','40404040');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `id_estoque` int NOT NULL AUTO_INCREMENT,
  `id_produto` int DEFAULT NULL,
  `quantidade_estoque` int NOT NULL,
  `quantidade_minima_estoque` int NOT NULL,
  `localização_estoque` varchar(30) NOT NULL,
  `data_hora_entrada` datetime NOT NULL,
  `data_hora_saida` datetime NOT NULL,
  `lote` varchar(20) NOT NULL,
  `validade` date NOT NULL,
  `status_estoque` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_estoque`),
  KEY `id_produto` (`id_produto`),
  CONSTRAINT `estoque_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `id_fornecedor` int NOT NULL AUTO_INCREMENT,
  `nome_fornecedor` varchar(100) NOT NULL,
  `cnpj_fornecedor` varchar(20) NOT NULL,
  `telefone_fornecedor` varchar(20) NOT NULL,
  `email_fornecedor` varchar(100) NOT NULL,
  `status_fornecedor` enum('ATIVO','INATIVO','BLOQUEADO') DEFAULT NULL,
  PRIMARY KEY (`id_fornecedor`),
  UNIQUE KEY `cnpj_fornecedor` (`cnpj_fornecedor`),
  UNIQUE KEY `email_fornecedor` (`email_fornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'Fornecedor A','12345678000199','1122334455','fornecedorA@email.com','ATIVO'),(2,'Fornecedor B','23456789000188','2233445566','fornecedorB@email.com','ATIVO'),(3,'Fornecedor C','34567890100177','3344556677','fornecedorC@email.com','INATIVO'),(4,'Fornecedor D','45678901200166','4455667788','fornecedorD@email.com','ATIVO'),(5,'Fornecedor E','56789012300155','5566778899','fornecedorE@email.com','BLOQUEADO');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_venda`
--

DROP TABLE IF EXISTS `item_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_venda` (
  `id_item_venda` int NOT NULL AUTO_INCREMENT,
  `id_venda` int DEFAULT NULL,
  `id_produto` int DEFAULT NULL,
  `quantidade_item` int NOT NULL,
  `preco_item` decimal(5,2) NOT NULL,
  `subtotal_item` decimal(5,2) NOT NULL,
  `imposto_item` decimal(5,2) DEFAULT NULL,
  `observacao_item` text,
  PRIMARY KEY (`id_item_venda`),
  UNIQUE KEY `id_venda` (`id_venda`,`id_produto`),
  KEY `id_produto` (`id_produto`),
  CONSTRAINT `item_venda_ibfk_1` FOREIGN KEY (`id_venda`) REFERENCES `venda` (`id_venda`),
  CONSTRAINT `item_venda_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_venda`
--

LOCK TABLES `item_venda` WRITE;
/*!40000 ALTER TABLE `item_venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `id_pagamento` int NOT NULL AUTO_INCREMENT,
  `id_venda` int DEFAULT NULL,
  `tipo_pagamento` varchar(20) NOT NULL,
  `valor_pagamento` decimal(5,2) NOT NULL,
  `data_pagamento` datetime NOT NULL,
  `parcelas_pagamento` decimal(5,2) NOT NULL,
  `imposto_pagamento` decimal(5,2) NOT NULL,
  `bandeira_pagamento` varchar(20) DEFAULT 'pagamento sem cartao',
  `observacao_pagamento` text,
  PRIMARY KEY (`id_pagamento`),
  KEY `id_venda` (`id_venda`),
  CONSTRAINT `pagamento_ibfk_1` FOREIGN KEY (`id_venda`) REFERENCES `venda` (`id_venda`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `nome_produto` varchar(100) NOT NULL,
  `decricao_produto` text,
  `preco_produto` decimal(5,2) NOT NULL,
  `categoria_produto` varchar(20) NOT NULL,
  `marca_produto` varchar(20) NOT NULL,
  `codigo_barras` varchar(50) NOT NULL,
  `data_validade_produto` date DEFAULT '2026-01-01',
  `peso_produto` decimal(5,2) NOT NULL,
  `status_produto` enum('disponivel','indisponivel') DEFAULT NULL,
  PRIMARY KEY (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venda` (
  `id_venda` int NOT NULL AUTO_INCREMENT,
  `data_hora_venda` datetime NOT NULL,
  `valor_total` decimal(5,2) NOT NULL,
  `forma_pagamento` varchar(30) NOT NULL,
  `desconto_venda` decimal(5,2) DEFAULT NULL,
  `id_cliente_na_tabela_venda` int DEFAULT NULL,
  `status_venda` varchar(20) NOT NULL,
  `observacoes_venda` text,
  `caixa_venda` int NOT NULL,
  PRIMARY KEY (`id_venda`),
  KEY `id_cliente_na_tabela_venda` (`id_cliente_na_tabela_venda`),
  CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`id_cliente_na_tabela_venda`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
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

-- Dump completed on 2026-04-22 21:29:23

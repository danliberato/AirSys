CREATE DATABASE  IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `test`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: test
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.16-MariaDB

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
-- Table structure for table `aeronave`
--

DROP TABLE IF EXISTS `aeronave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aeronave` (
  `matricula` varchar(11) NOT NULL,
  `modelo` varchar(90) NOT NULL,
  `data_fabricacao` date DEFAULT NULL,
  `envergadura` double DEFAULT NULL,
  `total_horas_voo` double DEFAULT NULL,
  `combustivel` double DEFAULT NULL,
  `peso_aviao` double DEFAULT NULL,
  `nro_poltronas` int(11) DEFAULT NULL,
  `peso_maximo` double DEFAULT NULL,
  `consumo` double DEFAULT NULL,
  `autonomia` double DEFAULT NULL,
  `capacidade_bagagem` double DEFAULT NULL,
  `status` enum('ATIVO','INATIVO','EM_VOO','EM_MANUTENCAO','SOB_PERICIA') DEFAULT 'ATIVO',
  `cnpj_companhia` bigint(14) unsigned NOT NULL,
  PRIMARY KEY (`matricula`),
  UNIQUE KEY `matricula_UNIQUE` (`matricula`),
  KEY `Possui_idx` (`cnpj_companhia`),
  CONSTRAINT `Possui` FOREIGN KEY (`cnpj_companhia`) REFERENCES `companhia` (`cnpj`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aeronave`
--

LOCK TABLES `aeronave` WRITE;
/*!40000 ALTER TABLE `aeronave` DISABLE KEYS */;
INSERT INTO `aeronave` VALUES ('A6-ACA','Airbus A380','2015-05-11',79.8,5709,310000,276000,700,560000,20.666666666666668,15000,83000,'EM_MANUTENCAO',8692080000103),('A6-AEA','Airbus A380','2007-05-11',79.8,5709,310000,276000,700,560000,0.04838709677419355,15000,83000,'ATIVO',8692080000103),('A6-AEH','Airbus A380','2008-05-11',79.8,5709,310000,276000,700,560000,0.04838709677419355,15000,83000,'ATIVO',8692080000103),('A6-AGF','Boeing 777-300ER','2014-01-11',64.8,1500,181200,168700,550,351800,0.08057395143487858,14600,68500,'EM_MANUTENCAO',8692080000103),('A6-ANH','Airbus A380','2015-05-11',79.8,5709,310000,276000,700,560000,0.04838709677419355,15000,83000,'EM_VOO',8692080000103),('A6-ASS','Airbus A380','2011-05-11',79.8,5709,310000,276000,700,560000,0.04838709677419355,15000,83000,'ATIVO',8692080000103),('A6-AZZ','Boeing 777-300ER','2011-01-11',64.8,1500,181200,168700,550,351800,0.08057395143487858,14600,68500,'EM_VOO',8692080000103),('A6-CAR','Airbus A380','2015-05-11',79.8,5709,310000,276000,700,560000,0.04838709677419355,15000,83000,'ATIVO',8692080000103),('A6-EDF','Airbus A380','2011-05-11',79.8,5709,310000,276000,700,560000,0.04838709677419355,15000,83000,'ATIVO',8692080000103),('A6-EMV','Boeing 777-300ER','2011-01-11',64.8,1500,181200,168700,550,351800,0.08057395143487858,14600,68500,'ATIVO',8692080000103),('A6-FAK','Boeing 777-300ER','2010-01-11',64.8,1500,181200,168700,550,351800,0.08057395143487858,14600,68500,'ATIVO',8692080000103),('A6-FGK','Boeing 777-300ER','2014-01-11',64.8,1500,181200,168700,550,351800,0.08057395143487858,14600,68500,'ATIVO',8692080000103),('A6-FIU','Airbus A380','2010-05-11',79.8,5709,310000,276000,700,560000,0.04838709677419355,15000,83000,'ATIVO',8692080000103),('A6-FTW','Boeing 777-300ER','2011-01-11',64.8,1500,181200,168700,550,351800,0.08057395143487858,14600,68500,'EM_VOO',8692080000103),('A6-LAJ','Airbus A380','2015-05-11',79.8,5709,310000,276000,700,560000,0.04838709677419355,15000,83000,'ATIVO',8692080000103),('A6-OJD','Airbus A380','2008-05-11',79.8,5709,310000,276000,700,560000,0.04838709677419355,15000,83000,'ATIVO',8692080000103),('A6-OUI','Boeing 777-300ER','2008-01-11',64.8,1500,181200,168700,550,351800,12.41095890410959,14600,68500,'ATIVO',8692080000103),('A6-QOA','Boeing 777-300ER','2015-01-11',64.8,1500,181200,168700,550,351800,0.08057395143487858,14600,68500,'ATIVO',8692080000103),('A6-ROL','Airbus A380','2010-05-11',79.8,5709,310000,276000,700,560000,0.04838709677419355,15000,83000,'ATIVO',8692080000103),('A6-SIO','Boeing 777-300ER','2015-01-11',64.8,1500,181200,168700,550,351800,0.08057395143487858,14600,68500,'EM_VOO',8692080000103),('A6-WTF','Boeing 777-300ER','2012-01-11',64.8,1500,181200,168700,550,351800,0.08057395143487858,14600,68500,'EM_VOO',8692080000103),('LV-BOI','Airbus A320-300','2015-05-15',34.1,4097,29840,42100,180,77000,0.18599195710455765,5550,18600,'ATIVO',33937681000178),('LV-BRA','Airbus A320-300','2015-05-13',34.1,1750,29840,42100,180,77000,5.376576576576577,5550,18600,'ATIVO',33937681000178),('LV-BTM','Airbus A320-300','2015-05-05',34.1,4105,29840,42100,180,77000,0.18599195710455765,5550,18600,'ATIVO',33937681000178),('LV-CDQ','Boeing 767-300ER','2010-01-11',47.6,4800,91000,90010,328,186000,0.12087912087912088,11000,43800,'ATIVO',33937681000178),('LV-CKU','Boeing 767-300ER','2010-11-13',47.6,4800,91000,90010,328,186000,0.12087912087912088,11000,43800,'ATIVO',33937681000178),('LV-GLP','Airbus A320-300','2015-05-11',34.1,4001,29840,42100,180,77000,5.376576576576577,5550,18600,'ATIVO',33937681000178),('N14704','Boeing 737-800','2015-11-14',39.5,40,26020,41140,189,78240,0.207532667179093,5400,20540,'ATIVO',40378333000335),('N16709','Boeing 737-800','2015-11-14',39.5,40,26020,41140,189,78240,0.207532667179093,5400,20540,'ATIVO',40378333000335),('N17963','Boeing 787-800','2015-01-11',58.8,3080,124700,154000,242,228000,0.12590216519647154,15700,85000,'EM_VOO',40378333000335),('N26215','Boeing 737-800','2015-11-14',39.5,40,26020,41140,189,78240,0.207532667179093,5400,20540,'ATIVO',40378333000335),('N26966','Boeing 787-800','2015-01-11',58.8,3080,124700,154000,242,228000,0.12590216519647154,15700,85000,'ATIVO',40378333000335),('N27213','Boeing 737-800','2015-11-14',39.5,40,26020,41140,189,78240,0.207532667179093,5400,20540,'ATIVO',40378333000335),('N27965','Boeing 787-800','2015-01-11',58.8,3080,124700,154000,242,228000,0.12590216519647154,15700,85000,'ATIVO',40378333000335),('N29961','Boeing 787-800','2015-01-11',58.8,3080,124700,154000,242,228000,0.12590216519647154,15700,85000,'ATIVO',40378333000335),('N424UA','Airbus A320-300','2015-05-13',34.1,4018,29840,42100,180,77000,0.18599195710455765,5550,18600,'ATIVO',40378333000335),('N430UA','Airbus A320-300','2015-05-13',34.1,4018,29840,42100,180,77000,5.376576576576577,5550,18600,'ATIVO',40378333000335),('N431UA','Airbus A320-300','2015-05-13',34.1,4018,29840,42100,180,77000,0.18599195710455765,5550,18600,'ATIVO',40378333000335),('N432UA','Airbus A320-300','2015-05-13',34.1,4018,29840,42100,180,77000,0.18599195710455765,5550,18600,'ATIVO',40378333000335),('N433UA','Airbus A320-300','2015-05-13',34.1,4018,29840,42100,180,77000,0.18599195710455765,5550,18600,'EM_VOO',40378333000335),('N434UA','Airbus A320-300','2015-05-13',34.1,4018,29840,42100,180,77000,5.376576576576577,5550,18600,'INATIVO',40378333000335),('N450UA','Airbus A320-300','2015-05-13',34.1,4018,29840,42100,180,77000,0.18599195710455765,5550,18600,'ATIVO',40378333000335),('N461UA','Airbus A320-300','2015-05-13',34.1,4018,29840,42100,180,77000,0.18599195710455765,5550,18600,'ATIVO',40378333000335),('N600UA','Boeing 767-300ER','2010-01-11',47.6,4800,91000,90010,328,186000,0.12087912087912088,11000,43800,'ATIVO',40378333000335),('N608UA','Boeing 767-300ER','2010-01-11',47.6,4800,91000,90010,328,186000,0.12087912087912088,11000,43800,'ATIVO',40378333000335),('N610UA','Boeing 767-300ER','2010-01-11',47.6,4800,91000,90010,328,186000,0.12087912087912088,11000,43800,'ATIVO',40378333000335),('N619UA','Boeing 767-300ER','2010-01-11',47.6,4800,91000,90010,328,186000,0.12087912087912088,11000,43800,'ATIVO',40378333000335),('N679UA','Boeing 767-300ER','2010-01-11',47.6,4800,91000,90010,328,186000,0.12087912087912088,11000,43800,'ATIVO',40378333000335),('N687UA','Boeing 767-300ER','2010-01-11',47.6,4800,91000,90010,328,186000,0.12087912087912088,11000,43800,'ATIVO',40378333000335),('N701UA','Boeing 777-300ER','2011-01-11',64.8,1500,181200,168700,550,351800,12.41095890410959,14600,68500,'ATIVO',40378333000335),('N704UA','Boeing 777-300ER','2011-01-11',64.8,1500,181200,168700,550,351800,0.08057395143487858,14600,68500,'ATIVO',40378333000335),('N711UA','Boeing 777-300ER','2011-01-11',64.8,1500,181200,168700,550,351800,0.08057395143487858,14600,68500,'ATIVO',40378333000335),('N719UA','Boeing 777-300ER','2011-01-11',64.8,1500,181200,168700,550,351800,0.08057395143487858,14600,68500,'ATIVO',40378333000335),('N777UA','Boeing 777-300ER','2011-01-11',64.8,1500,181200,168700,550,351800,0.08057395143487858,14600,68500,'ATIVO',40378333000335),('N778AU','Boeing 777-300ER','2011-01-11',64.8,1500,181200,168700,550,351800,0.08057395143487858,14600,68500,'ATIVO',40378333000335),('N779UA','Boeing 777-300ER','2011-01-11',64.8,1500,181200,168700,550,351800,0.08057395143487858,14600,68500,'ATIVO',40378333000335),('N791UA','Boeing 777-300ER','2011-01-11',64.8,1500,181200,168700,550,351800,0.08057395143487858,14600,68500,'ATIVO',40378333000335),('N798UA','Boeing 777-300ER','2011-01-11',64.8,1500,181200,168700,550,351800,0.08057395143487858,14600,68500,'ATIVO',40378333000335),('PR-ADQ','ATR 72','2009-01-11',27,8807,6400,12950,74,22800,3.878787878787879,1650,7350,'ATIVO',9296295000160),('PR-AQE','Embraer E195','2008-07-17',28.7,900,16250,28970,118,50790,0.24553846153846154,3990,13530,'ATIVO',9296295000160),('PR-AQT','ATR 72','2009-01-11',27,789,6400,12950,74,22800,3.878787878787879,1650,7350,'ATIVO',9296295000160),('PR-ASD','ATR 72','2011-01-11',27,8091,6400,12950,74,22800,3.878787878787879,1650,7350,'ATIVO',9296295000160),('PR-AZD','ATR 72','2010-01-11',27,1998,6400,12950,74,22800,3.878787878787879,1650,7350,'INATIVO',5385049000123),('PR-BIQ','ATR 72','2009-01-11',27,1679,6400,12950,74,22800,3.878787878787879,1650,7350,'INATIVO',2575829000148),('PR-BOO','ATR 72','2009-01-11',27,1679,6400,12950,74,22800,0.2578125,1650,7350,'INATIVO',9296295000160),('PR-BOQ','Embraer E195','2009-01-11',28.7,7990,16250,28970,118,50790,0.24553846153846154,3990,13530,'ATIVO',9296295000160),('PR-DAA','Embraer E195','2008-01-24',28.7,5700,16250,28970,118,50790,0.24553846153846154,3990,13530,'ATIVO',9296295000160),('PR-FJN','ATR 72','2008-01-11',27,9708,6400,12950,74,22800,3.878787878787879,1650,7350,'ATIVO',9296295000160),('PR-GEI','Boeing 737-700','2007-02-05',34.3,150,26020,38140,171,70000,0.2321291314373559,6040,16540,'ATIVO',6164253000187),('PR-GEK','Boeing 737-700','2007-02-07',34.3,150,26020,38140,171,70000,0.2321291314373559,6040,16540,'ATIVO',6164253000187),('PR-GFQ','ATR 72','2008-01-11',27,11001,6400,12950,74,22800,0.2578125,1650,7350,'ATIVO',9296295000160),('PR-GGY','Boeing 737-800','2010-02-18',39.5,40,26020,41140,189,78240,0.207532667179093,5400,20540,'ATIVO',6164253000187),('PR-GUD','Boeing 737-800','2015-11-14',39.5,40,26020,41140,189,78240,0.207532667179093,5400,20540,'ATIVO',6164253000187),('PR-GUE','Boeing 737-800','2015-12-03',39.5,40,26020,41140,189,78240,0.207532667179093,5400,20540,'ATIVO',6164253000187),('PR-GUF','Boeing 737-800','2015-11-17',39.5,40,26020,41140,189,78240,0.207532667179093,5400,20540,'ATIVO',6164253000187),('PR-MVI','Embraer E195','2010-05-01',28.7,9700,16250,28970,118,50790,0.24553846153846154,3990,13530,'ATIVO',9296295000160),('PR-NAH','Embraer E195','2009-01-11',28.7,7990,16250,28970,118,50790,0.24553846153846154,3990,13530,'ATIVO',9296295000160),('PR-OUQ','Embraer E195','2009-01-11',28.7,7990,16250,28970,118,50790,0.24553846153846154,3990,13530,'ATIVO',9296295000160),('PR-PYR','ATR 72','2009-01-11',27,1679,6400,12950,74,22800,0.2578125,1650,7350,'ATIVO',9296295000160),('PR-QQQ','ATR 72','2009-01-11',27,1679,6400,12950,74,22800,0.2578125,1650,7350,'ATIVO',9296295000160),('PR-RJC','Embraer E195','2009-01-11',28.7,7990,16250,28970,118,50790,0.24553846153846154,3990,13530,'ATIVO',9296295000160),('PR-WAA','Embraer E195','2008-03-19',28.7,4891,16250,28970,118,50790,0.24553846153846154,3990,13530,'ATIVO',9296295000160),('PR-WAD','Embraer E195','2008-01-11',28.7,3500,16250,28970,118,50790,0.24553846153846154,3990,13530,'ATIVO',9296295000160),('PR-WKD','Embraer E195','2008-07-17',28.7,900,16250,28970,118,50790,0.24553846153846154,3990,13530,'ATIVO',9296295000160),('PT-RAA','Airbus 000','2016-12-29',11,95,91,159,11,915,0.9578947368421052,95,5919,'ATIVO',5385049000123);
/*!40000 ALTER TABLE `aeronave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companhia`
--

DROP TABLE IF EXISTS `companhia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companhia` (
  `cnpj` bigint(14) unsigned NOT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`cnpj`),
  UNIQUE KEY `cnpj_UNIQUE` (`cnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companhia`
--

LOCK TABLES `companhia` WRITE;
/*!40000 ALTER TABLE `companhia` DISABLE KEYS */;
INSERT INTO `companhia` VALUES (512777000135,'Passaredo'),(2575829000148,'Avianca'),(5385049000123,'Air Canada'),(5508556000107,'Swiss'),(6164253000187,'GOL Linhas Aéreas'),(8692080000103,'Emirates Airlines'),(8734301000150,'Qatar Airways'),(9296295000160,'Azul Linhas Aéreas'),(10829577000164,'Aliatlia'),(13107427000135,'Singapore Airlines'),(17120794000120,'Etihad Airways'),(33013988000930,'Air France'),(33461740000184,'Deutsche Lufthansa'),(33937681000178,'LATAM'),(40378333000335,'United Airlines');
/*!40000 ALTER TABLE `companhia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manutencao`
--

DROP TABLE IF EXISTS `manutencao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manutencao` (
  `ordem_servico` int(11) NOT NULL AUTO_INCREMENT,
  `aeronave_matricula` varchar(11) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`ordem_servico`),
  UNIQUE KEY `ordem_servico_UNIQUE` (`ordem_servico`),
  KEY `manutencao_aeronave` (`aeronave_matricula`),
  CONSTRAINT `manutencao_aeronave` FOREIGN KEY (`aeronave_matricula`) REFERENCES `aeronave` (`matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manutencao`
--

LOCK TABLES `manutencao` WRITE;
/*!40000 ALTER TABLE `manutencao` DISABLE KEYS */;
INSERT INTO `manutencao` VALUES (9,'A6-AGF','2016-01-01'),(10,'A6-ACA','2016-05-01'),(11,'A6-ACA','2016-05-01'),(12,'PT-RAA','2016-01-01'),(13,'PT-RAA','2016-05-01'),(14,'PT-RAA','2016-05-01');
/*!40000 ALTER TABLE `manutencao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manutencia`
--

DROP TABLE IF EXISTS `manutencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manutencia` (
  `cpf_mecanico` bigint(11) NOT NULL,
  `ordem_servico` int(11) NOT NULL,
  KEY `manutencia_mecanico_idx` (`cpf_mecanico`),
  KEY `manutencia_manutencao_idx` (`ordem_servico`),
  CONSTRAINT `manutencia_manutencao` FOREIGN KEY (`ordem_servico`) REFERENCES `manutencao` (`ordem_servico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `manutencia_mecanico` FOREIGN KEY (`cpf_mecanico`) REFERENCES `mecanico` (`cpf`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manutencia`
--

LOCK TABLES `manutencia` WRITE;
/*!40000 ALTER TABLE `manutencia` DISABLE KEYS */;
INSERT INTO `manutencia` VALUES (1234567890,9),(98708048900,9),(19780129971,10),(56749197529,10),(15909159519,10),(19780129971,10),(35497189788,11),(15909159519,11),(78910890019,11),(1234567890,12),(98708048900,12),(19780129971,12),(56749197529,13),(15909159519,13),(19780129971,13),(35497189788,14),(15909159519,14),(78910890019,14);
/*!40000 ALTER TABLE `manutencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mecanico`
--

DROP TABLE IF EXISTS `mecanico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mecanico` (
  `cpf` bigint(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `endereco` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`cpf`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mecanico`
--

LOCK TABLES `mecanico` WRITE;
/*!40000 ALTER TABLE `mecanico` DISABLE KEYS */;
INSERT INTO `mecanico` VALUES (1234567890,'Agnaldo José','Rua da penha, 157'),(15909159519,'Romão Batista','Rua do Carmo, 77'),(19780129971,'Miriam Souza','Av. Campinas, 5154'),(35497189788,'Clodoaldo Miranda','Rua da Luz, 707'),(56749197529,'Bastião Silva','Rua da Bondade, 347'),(78910890019,'Carlos Alberto da Silva','Av. Marechal Deodoro, 7800'),(98708048900,'Maria Eugênia','Rua Moares Sales, 1971');
/*!40000 ALTER TABLE `mecanico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefone`
--

DROP TABLE IF EXISTS `telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefone` (
  `telefone` varchar(45) NOT NULL,
  `mecanico_cpf` bigint(11) NOT NULL,
  KEY `telefone_mecanico_idx` (`mecanico_cpf`),
  CONSTRAINT `telefone_mecanico` FOREIGN KEY (`mecanico_cpf`) REFERENCES `mecanico` (`cpf`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefone`
--

LOCK TABLES `telefone` WRITE;
/*!40000 ALTER TABLE `telefone` DISABLE KEYS */;
INSERT INTO `telefone` VALUES ('(19) 91597-1877',1234567890),('(11) 98441-0000',1234567890),('(19) 99917-1811',19780129971),('(19) 97981-1999',19780129971),('(15) 97971-1117',98708048900),('(11) 98156-1859',78910890019),('(11) 99870-1919',35497189788),('(15) 93496-1189',56749197529);
/*!40000 ALTER TABLE `telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voo`
--

DROP TABLE IF EXISTS `voo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voo` (
  `nro_voo` int(11) NOT NULL AUTO_INCREMENT,
  `data_hora` datetime DEFAULT NULL,
  `aeroporto_origem` varchar(3) DEFAULT NULL,
  `aeroporto_destino` varchar(3) DEFAULT NULL,
  `portao_embarque` varchar(45) DEFAULT NULL,
  `matricula_aeronave` varchar(11) NOT NULL,
  PRIMARY KEY (`nro_voo`),
  UNIQUE KEY `nro_voo_UNIQUE` (`nro_voo`),
  KEY `Compoe_idx` (`matricula_aeronave`),
  CONSTRAINT `Compoe` FOREIGN KEY (`matricula_aeronave`) REFERENCES `aeronave` (`matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voo`
--

LOCK TABLES `voo` WRITE;
/*!40000 ALTER TABLE `voo` DISABLE KEYS */;
INSERT INTO `voo` VALUES (1,'2016-11-23 02:47:28','JFK','LAX','30','PT-RAA'),(2,'2016-11-23 02:50:29','GRU','VCP','150','PT-RAA'),(3,'2016-11-23 02:50:30','GRU','DBI','14','PT-RAA'),(4,'2016-11-23 02:52:55','GRU','DBI','86A','LV-BOI'),(5,'2016-11-23 02:52:57','GRU','DBI','45C','LV-BOI'),(6,'2016-11-23 02:52:58','GRU','DBI','82C','PR-AZD'),(7,'2016-11-23 02:52:59','GRU','DBI','199A','PR-AZD'),(8,'2016-11-23 02:52:59','GRU','DBI','97G','PR-ADQ'),(9,'2016-11-23 02:53:00','GRU','DBI','13D','PR-ADQ'),(10,'2016-11-30 16:32:09','GRU','DBI','13D','A6-AGF');
/*!40000 ALTER TABLE `voo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-30 18:14:43

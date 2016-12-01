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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-01  1:27:58

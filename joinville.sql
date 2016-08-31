-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: 0.0.0.0    Database: c9
-- ------------------------------------------------------
-- Server version	5.5.49-0ubuntu0.14.04.1

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
-- Current Database: `c9`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c9` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `c9`;

--
-- Table structure for table `bairro`
--

DROP TABLE IF EXISTS `bairro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bairro` (
  `idBairro` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `aid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idBairro`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bairro`
--

LOCK TABLES `bairro` WRITE;
/*!40000 ALTER TABLE `bairro` DISABLE KEYS */;
INSERT INTO `bairro` VALUES (1,'Rio Bonito','rio-bonito'),(2,'Dona Francisca','dona-francisca'),(3,'Pirabeiraba Centro','pirabeiraba-cidade'),(4,'Zona Industrial Norte','z-ind-norte'),(5,'Jardim Sofia','j-sofia'),(6,'Jardim Paraiso','j-paraiso'),(7,'Costa e Silva','c-silva'),(8,'Vila Nova','vila-nova'),(9,'Vila Cubatao','vila-cubatao'),(10,'Itinga','itinga'),(11,'Santa Catarina','santa-catarina'),(12,'Morro do Meio','morro-meio'),(13,'Nova Brasilia','nova-brasilia'),(14,'Floresta','floresta'),(15,'Sao Marcos','sao-marcos'),(16,'Zona Tupy','z-tupy'),(17,'Comasa','comasa'),(18,'Bom Retiro','bom-retiro'),(19,'Santo Antonio','santo-antonio'),(20,'America','america'),(21,'Gloria','gloria'),(22,'Boehmerwald','boehmerwald'),(23,'Parque Guarani','parque-guarani'),(24,'Paranaguamirim','paranaguamirim'),(25,'Aventureiro','aventureiro'),(26,'Espinheiros','espinheiros'),(27,'Petropolis','petropolis'),(28,'Jardim Iririu','j-iririu'),(29,'Ulysses Guimaraes','ulysses-guimaraes'),(30,'Adhemar  Garcia','adhemar-garcia'),(31,'Boa Vista','boa-vista'),(32,'Iririu','iririu'),(33,'Saguacu','saguacu'),(34,'Jarivatuba','jarivatuba'),(35,'Itaum','itaum'),(36,'Fatima','fatima'),(37,'Guanabara','guanabara'),(38,'Bucarein','bucarein'),(39,'Anita Garibaldi','anita-garibaldi'),(40,'Atiradores','atiradores'),(41,'Centro','centro'),(42,'Profipo','profipo'),(43,'Joao Costa','joao-costa'),(44,'teste','teste');
/*!40000 ALTER TABLE `bairro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classe`
--

DROP TABLE IF EXISTS `classe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classe` (
  `idClasse` int(11) NOT NULL AUTO_INCREMENT,
  `classe` varchar(45) NOT NULL,
  PRIMARY KEY (`idClasse`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classe`
--

LOCK TABLES `classe` WRITE;
/*!40000 ALTER TABLE `classe` DISABLE KEYS */;
INSERT INTO `classe` VALUES (1,'normal'),(2,'alert');
/*!40000 ALTER TABLE `classe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historicoCidade`
--

DROP TABLE IF EXISTS `historicoCidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historicoCidade` (
  `idHistoricoCidade` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  `dataIni` varchar(20) DEFAULT NULL,
  `dataFim` varchar(20) DEFAULT NULL,
  `idBairro` int(11) NOT NULL,
  `idClasse` int(11) NOT NULL,
  PRIMARY KEY (`idHistoricoCidade`,`idBairro`,`idClasse`),
  KEY `FK_historicoCidade_Bairro` (`idBairro`),
  KEY `FK_historicoCidade_Classe` (`idClasse`),
  CONSTRAINT `FK_historicoCidade_bairro` FOREIGN KEY (`idBairro`) REFERENCES `bairro` (`idBairro`),
  CONSTRAINT `FK_historicoCidade_classe` FOREIGN KEY (`idClasse`) REFERENCES `classe` (`idClasse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historicoCidade`
--

LOCK TABLES `historicoCidade` WRITE;
/*!40000 ALTER TABLE `historicoCidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `historicoCidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statusCidade`
--

DROP TABLE IF EXISTS `statusCidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statusCidade` (
  `idStatusCidade` int(11) NOT NULL AUTO_INCREMENT,
  `idBairro` int(11) NOT NULL,
  `idClasse` int(11) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `dataIni` varchar(20) DEFAULT NULL,
  `dataFim` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idStatusCidade`,`idBairro`,`idClasse`),
  KEY `FK_statusCidade_Bairro1_idx` (`idBairro`),
  KEY `FK_statusCidade_Classe1_idx` (`idClasse`),
  CONSTRAINT `FK_statusCidade_Bairro` FOREIGN KEY (`idBairro`) REFERENCES `bairro` (`idBairro`),
  CONSTRAINT `FK_statusCidade_Classe` FOREIGN KEY (`idClasse`) REFERENCES `classe` (`idClasse`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statusCidade`
--

LOCK TABLES `statusCidade` WRITE;
/*!40000 ALTER TABLE `statusCidade` DISABLE KEYS */;
INSERT INTO `statusCidade` VALUES (1,1,1,'jsafasigjgosdgjsodgisdjgo','2016-01-01T10:10','2016-01-02T10:10'),(2,2,1,'Melhoria','2016-06-22T10:10','2016-06-22T10:10'),(3,3,1,'Melhoria','2016-06-22T10:10','2016-06-22T10:10'),(4,4,1,'Melhoria','2016-06-22T10:10','2016-06-22T10:10'),(5,5,1,'Melhoria','2016-06-22T10:10','2016-06-22T10:10'),(6,6,1,'Vazamento Rua TimbÃ©','2016-06-23T10:00','2016-06-23T15:00'),(7,7,1,'Vazamento rua MaceiÃ³','2016-06-23T03:00','2016-06-23T22:00'),(8,8,1,'VazÃ£o reduzida - ETA PiraÃ­: Turbidez elevada','2016-06-22T00:00','2016-06-22T23:00'),(9,9,1,'Parada ETA CubatÃ£o','2016-01-01T10:10','2016-01-02T10:10'),(10,10,1,'IntermitÃªncia no abastecimento','2016-06-22T09:00','2016-06-22T23:00'),(11,11,1,'IntermitÃªncia no abastecimento','2016-06-22T09:00','2016-06-22T23:00'),(12,12,1,'ManutenÃ§Ã£o Franz Carl Brunken','2016-06-24T10:00','2016-06-24T15:00'),(13,13,1,NULL,NULL,NULL),(14,14,1,NULL,NULL,NULL),(15,15,1,NULL,NULL,NULL),(16,16,1,NULL,NULL,NULL),(17,17,1,'Parada ETA CubatÃ£o','2016-01-01T10:10','2016-01-02T10:10'),(18,18,1,'Parada ETA CubatÃ£o','2016-01-01T10:10','2016-01-02T10:10'),(19,19,1,'Vazamento rua MaceiÃ³','2016-06-23T03:00','2016-06-23T22:00'),(20,20,1,'Vazamento rua MaceiÃ³','2016-06-23T03:00','2016-06-23T22:00'),(21,21,1,'VazÃ£o reduzida - ETA PiraÃ­: Turbidez elevad','2016-06-22T00:00','2016-06-22T23:00'),(22,22,1,'IntermitÃªncia no abastecimento','2016-06-22T09:00','2016-06-22T23:00'),(23,23,1,NULL,NULL,NULL),(24,24,1,'ManutenÃ§Ã£o: Troca de registro','2016-06-22T10:40','2016-06-22T12:00'),(25,25,1,'jsafasigjgosdgjsodgisdjgo','2016-01-01T10:10','2016-01-02T10:10'),(26,26,1,'Parada ETA CubatÃ£o','2016-01-01T10:10','2016-01-02T10:10'),(27,27,1,NULL,NULL,NULL),(28,28,1,'Parada ETA CubatÃ£o','2016-01-01T10:10','2016-01-02T10:10'),(29,29,1,NULL,NULL,NULL),(30,30,1,NULL,NULL,NULL),(31,31,1,'Vazamento Hellmuth','2016-06-24T10:00','2016-06-24T12:00'),(32,32,1,'Parada ETA CubatÃ£o','2016-01-01T10:10','2016-01-02T10:10'),(33,33,1,'Vazamento rua MaceiÃ³','2016-06-23T03:00','2016-06-23T22:00'),(34,34,1,NULL,NULL,NULL),(35,35,1,NULL,NULL,NULL),(36,36,1,NULL,NULL,NULL),(37,37,1,NULL,NULL,NULL),(38,38,1,'Vazamento Hellmuth','2016-06-24T10:00','2016-06-24T12:00'),(39,39,1,NULL,NULL,NULL),(40,40,1,'VazÃ£o reduzida - ETA PiraÃ­: Turbidez elevad','2016-06-22T00:00','2016-06-22T23:00'),(41,41,1,NULL,NULL,NULL),(42,42,1,'IntermitÃªncia no abastecimento','2016-06-22T09:00','2016-06-22T23:00'),(43,43,1,'IntermitÃªncia no abastecimento','2016-06-22T09:00','2016-06-22T23:00'),(44,44,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `statusCidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statusCidadeProgramado`
--

DROP TABLE IF EXISTS `statusCidadeProgramado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statusCidadeProgramado` (
  `idStatusCidadeProgramado` int(11) NOT NULL AUTO_INCREMENT,
  `idBairro` int(11) NOT NULL,
  `idClasse` int(11) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `dataIni` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idStatusCidadeProgramado`,`idBairro`,`idClasse`),
  KEY `FK_statusCidadeProgramado_Bairro` (`idBairro`),
  KEY `FK_statusCidadeProgramado_Classe` (`idClasse`),
  CONSTRAINT `FK_statusCidadeProgramado_Bairro` FOREIGN KEY (`idBairro`) REFERENCES `bairro` (`idBairro`),
  CONSTRAINT `FK_statusCidadeProgramado_Classe` FOREIGN KEY (`idClasse`) REFERENCES `classe` (`idClasse`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statusCidadeProgramado`
--

LOCK TABLES `statusCidadeProgramado` WRITE;
/*!40000 ALTER TABLE `statusCidadeProgramado` DISABLE KEYS */;
INSERT INTO `statusCidadeProgramado` VALUES (1,1,1,'',''),(2,2,1,NULL,NULL),(3,3,1,NULL,NULL),(4,4,1,NULL,NULL),(5,5,1,NULL,NULL),(6,6,1,NULL,NULL),(7,7,1,NULL,NULL),(8,8,1,NULL,NULL),(9,9,1,NULL,NULL),(10,10,1,NULL,NULL),(11,11,1,NULL,NULL),(12,12,1,NULL,NULL),(13,13,1,NULL,NULL),(14,14,1,NULL,NULL),(15,15,1,NULL,NULL),(16,16,1,NULL,NULL),(17,17,1,NULL,NULL),(18,18,1,NULL,NULL),(19,19,1,NULL,NULL),(20,20,1,NULL,NULL),(21,21,1,NULL,NULL),(22,22,1,NULL,NULL),(23,23,1,NULL,NULL),(24,24,1,NULL,NULL),(25,25,1,NULL,NULL),(26,26,1,NULL,NULL),(27,27,1,NULL,NULL),(28,28,1,NULL,NULL),(29,29,1,NULL,NULL),(30,30,1,NULL,NULL),(31,31,1,NULL,NULL),(32,32,1,NULL,NULL),(33,33,1,NULL,NULL),(34,34,1,NULL,NULL),(35,35,1,NULL,NULL),(36,36,1,NULL,NULL),(37,37,1,NULL,NULL),(38,38,1,NULL,NULL),(39,39,1,NULL,NULL),(40,40,1,NULL,NULL),(41,41,1,NULL,NULL),(42,42,1,NULL,NULL),(43,43,1,NULL,NULL);
/*!40000 ALTER TABLE `statusCidadeProgramado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `passWord` varchar(45) NOT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `userName` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'administrador','administrador.comunicaj@aguasdejoinville.com.br','123','Administrador'),(8,'Luanna','luanna.souza@aguasdejoinville.com.br','luanna123','Luanna'),(9,'Jeferson','jeferson.machado@aguasdejoinville.com.br','jeferson123','Jeferson');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-04 17:08:23

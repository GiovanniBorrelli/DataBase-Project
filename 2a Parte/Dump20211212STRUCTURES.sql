-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: applicazione
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `accessorio`
--

DROP TABLE IF EXISTS `accessorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accessorio` (
  `codiceAccessorio` int NOT NULL,
  `tipoAccessorio` varchar(45) NOT NULL,
  `prezzo` int NOT NULL,
  `applicazioneSingola` tinyint NOT NULL,
  `macchinario` varchar(45) NOT NULL,
  PRIMARY KEY (`codiceAccessorio`),
  KEY `macchinario_idx` (`macchinario`),
  CONSTRAINT `macchinario` FOREIGN KEY (`macchinario`) REFERENCES `macchinario` (`codiceSeriale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `acquisto accessorio`
--

DROP TABLE IF EXISTS `acquisto accessorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acquisto accessorio` (
  `codiceFiscale` varchar(16) NOT NULL,
  `codiceAccessorio` int NOT NULL,
  PRIMARY KEY (`codiceFiscale`,`codiceAccessorio`),
  KEY `accessorio_idx` (`codiceAccessorio`),
  CONSTRAINT `accessorio` FOREIGN KEY (`codiceAccessorio`) REFERENCES `accessorio` (`codiceAccessorio`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cliente4` FOREIGN KEY (`codiceFiscale`) REFERENCES `cliente` (`codiceFiscale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categoria accessoria`
--

DROP TABLE IF EXISTS `categoria accessoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria accessoria` (
  `nome` varchar(45) NOT NULL,
  `destinazioneUso` varchar(45) NOT NULL,
  PRIMARY KEY (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categoria base`
--

DROP TABLE IF EXISTS `categoria base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria base` (
  `nome` varchar(45) NOT NULL,
  `destinazioneuso` varchar(45) NOT NULL,
  `lunghezza` int NOT NULL,
  `larghezza` int NOT NULL,
  `altezza` int NOT NULL,
  PRIMARY KEY (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `codiceFiscale` varchar(16) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cognome` varchar(45) NOT NULL,
  `dataNascita` date NOT NULL,
  `#telefono` int DEFAULT NULL,
  `#acquisti` int NOT NULL,
  `residenza` varchar(45) NOT NULL,
  PRIMARY KEY (`codiceFiscale`),
  KEY `indirizzo_idx` (`residenza`),
  CONSTRAINT `indirizzo` FOREIGN KEY (`residenza`) REFERENCES `indirizzo` (`codiceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coinvolgimento1`
--

DROP TABLE IF EXISTS `coinvolgimento1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coinvolgimento1` (
  `dataInizio` date NOT NULL,
  `dataFine` date NOT NULL,
  `#oreManodopera` int NOT NULL,
  `codiceID` int NOT NULL,
  `#progressivo` int NOT NULL,
  `macchinario` varchar(45) NOT NULL,
  PRIMARY KEY (`codiceID`,`#progressivo`,`macchinario`),
  KEY `intervento3_idx` (`#progressivo`),
  KEY `intervento4_idx` (`macchinario`),
  CONSTRAINT `datilavorativi5` FOREIGN KEY (`codiceID`) REFERENCES `dati lavorativi` (`codiceID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `intervento3` FOREIGN KEY (`#progressivo`) REFERENCES `intervento` (`#progressivo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `intervento4` FOREIGN KEY (`macchinario`) REFERENCES `intervento` (`macchinario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coinvolgimento2`
--

DROP TABLE IF EXISTS `coinvolgimento2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coinvolgimento2` (
  `dataInizio` date NOT NULL,
  `dataFine` date NOT NULL,
  `#oreManodopera` varchar(45) NOT NULL,
  `codiceFiscale` varchar(16) NOT NULL,
  `#progressivo` int NOT NULL,
  `macchinario` varchar(45) NOT NULL,
  PRIMARY KEY (`codiceFiscale`,`#progressivo`,`macchinario`),
  KEY `intervento7_idx` (`#progressivo`),
  KEY `intervento8_idx` (`macchinario`),
  CONSTRAINT `datianagrafici2` FOREIGN KEY (`codiceFiscale`) REFERENCES `dati anagrafici` (`codiceFiscale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `intervento7` FOREIGN KEY (`#progressivo`) REFERENCES `intervento` (`#progressivo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `intervento8` FOREIGN KEY (`macchinario`) REFERENCES `intervento` (`macchinario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `corriere`
--

DROP TABLE IF EXISTS `corriere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corriere` (
  `targa` varchar(45) NOT NULL,
  `dataPrimoImpiego` date NOT NULL,
  `societa` varchar(45) NOT NULL,
  PRIMARY KEY (`targa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dati anagrafici`
--

DROP TABLE IF EXISTS `dati anagrafici`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dati anagrafici` (
  `codiceFiscale` varchar(16) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cognome` varchar(45) NOT NULL,
  `dataNascita` date NOT NULL,
  `eta` int NOT NULL,
  `codiceLavorativo` int NOT NULL,
  PRIMARY KEY (`codiceFiscale`),
  KEY `datilavorativi_idx` (`codiceLavorativo`),
  CONSTRAINT `datilavorativi` FOREIGN KEY (`codiceLavorativo`) REFERENCES `dati lavorativi` (`codiceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dati lavorativi`
--

DROP TABLE IF EXISTS `dati lavorativi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dati lavorativi` (
  `codiceID` int NOT NULL,
  `tipoContratto` varchar(45) NOT NULL,
  `#telefono` int NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `alboProfessionale` varchar(45) DEFAULT NULL,
  `specializzazione` varchar(45) DEFAULT NULL,
  `responsabile` tinyint DEFAULT NULL,
  PRIMARY KEY (`codiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `destinazione`
--

DROP TABLE IF EXISTS `destinazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destinazione` (
  `nome` varchar(45) NOT NULL,
  `codiceID` int NOT NULL,
  PRIMARY KEY (`nome`,`codiceID`),
  KEY `trattamento_idx` (`codiceID`),
  CONSTRAINT `categoriabase5` FOREIGN KEY (`nome`) REFERENCES `categoria base` (`nome`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trattamento` FOREIGN KEY (`codiceID`) REFERENCES `trattamento` (`codiceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `indirizzo`
--

DROP TABLE IF EXISTS `indirizzo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `indirizzo` (
  `codiceID` varchar(45) NOT NULL,
  `via` varchar(45) NOT NULL,
  `nCivico` int NOT NULL,
  `cap` int NOT NULL,
  `citta` varchar(45) NOT NULL,
  PRIMARY KEY (`codiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `intervento`
--

DROP TABLE IF EXISTS `intervento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intervento` (
  `#progressivo` int NOT NULL,
  `macchinario` varchar(45) NOT NULL,
  `dataArrivo` date NOT NULL,
  `dataCompletamento` date NOT NULL,
  `statoIntervento` varchar(45) NOT NULL,
  PRIMARY KEY (`#progressivo`),
  KEY `macchinario2_idx` (`macchinario`),
  CONSTRAINT `macchinario2` FOREIGN KEY (`macchinario`) REFERENCES `macchinario` (`codiceSeriale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `macchinario`
--

DROP TABLE IF EXISTS `macchinario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `macchinario` (
  `codiceSeriale` varchar(45) NOT NULL,
  `prezzo` int NOT NULL,
  `#lotto` int NOT NULL,
  `progetto` int NOT NULL,
  `cliente` varchar(16) DEFAULT NULL,
  `appartenenza1` varchar(45) DEFAULT NULL,
  `appartenenza2` varchar(45) DEFAULT NULL,
  `corriere` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codiceSeriale`),
  KEY `progetto3_idx` (`progetto`),
  KEY `cliente_idx` (`cliente`),
  KEY `categoriabase_idx` (`appartenenza1`),
  KEY `categoriaaccessoria_idx` (`appartenenza2`),
  KEY `corriere_idx` (`corriere`),
  CONSTRAINT `categoriaaccessoria` FOREIGN KEY (`appartenenza2`) REFERENCES `categoria accessoria` (`nome`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `categoriabase2` FOREIGN KEY (`appartenenza1`) REFERENCES `categoria base` (`nome`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cliente2` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`codiceFiscale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `corriere` FOREIGN KEY (`corriere`) REFERENCES `corriere` (`targa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `progetto3` FOREIGN KEY (`progetto`) REFERENCES `progetto` (`codiceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `partecipazione1`
--

DROP TABLE IF EXISTS `partecipazione1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partecipazione1` (
  `codiceID1` int NOT NULL,
  `codiceID2` int NOT NULL,
  PRIMARY KEY (`codiceID1`,`codiceID2`),
  KEY `dati lavorativi_idx` (`codiceID2`),
  CONSTRAINT `dati lavorativi` FOREIGN KEY (`codiceID2`) REFERENCES `dati lavorativi` (`codiceID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `progetto2` FOREIGN KEY (`codiceID1`) REFERENCES `progetto` (`codiceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `partecipazione2`
--

DROP TABLE IF EXISTS `partecipazione2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partecipazione2` (
  `codiceID` int NOT NULL,
  `codiceFiscale` varchar(16) NOT NULL,
  PRIMARY KEY (`codiceID`,`codiceFiscale`),
  KEY `dati anagrafici_idx` (`codiceFiscale`),
  CONSTRAINT `dati anagrafici` FOREIGN KEY (`codiceFiscale`) REFERENCES `dati anagrafici` (`codiceFiscale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `progetto` FOREIGN KEY (`codiceID`) REFERENCES `progetto` (`codiceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `progetto`
--

DROP TABLE IF EXISTS `progetto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `progetto` (
  `codiceID` int NOT NULL,
  `tipo` varchar(20) NOT NULL,
  PRIMARY KEY (`codiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trattamento`
--

DROP TABLE IF EXISTS `trattamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trattamento` (
  `codiceID` int NOT NULL,
  `tipologia` varchar(45) NOT NULL,
  PRIMARY KEY (`codiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-12 19:21:04

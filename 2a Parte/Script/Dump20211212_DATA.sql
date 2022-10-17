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
-- Dumping data for table `accessorio`
--

LOCK TABLES `accessorio` WRITE;
/*!40000 ALTER TABLE `accessorio` DISABLE KEYS */;
INSERT INTO `accessorio` VALUES (211232,'accessorio5',213,1,'fdgfsd'),(235354,'accessorio4',234,1,'pdfsds'),(546523,'accessorio1',112,0,'asdasd'),(845723,'accessorio2',220,0,'fdgfsd'),(860246,'accessorio3',113,0,'pdfsds');
/*!40000 ALTER TABLE `accessorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `acquisto accessorio`
--

LOCK TABLES `acquisto accessorio` WRITE;
/*!40000 ALTER TABLE `acquisto accessorio` DISABLE KEYS */;
INSERT INTO `acquisto accessorio` VALUES ('AHDSOIH67',211232),('JAKSLJDL33',235354),('SAHDUID45',546523),('AHDSOIH67',845723),('JAKSLJDL33',860246);
/*!40000 ALTER TABLE `acquisto accessorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `categoria accessoria`
--

LOCK TABLES `categoria accessoria` WRITE;
/*!40000 ALTER TABLE `categoria accessoria` DISABLE KEYS */;
INSERT INTO `categoria accessoria` VALUES ('222','azienda'),('456','scuola');
/*!40000 ALTER TABLE `categoria accessoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `categoria base`
--

LOCK TABLES `categoria base` WRITE;
/*!40000 ALTER TABLE `categoria base` DISABLE KEYS */;
INSERT INTO `categoria base` VALUES ('123','scuola',78,22,34),('124','azienda',23,12,45),('465','industria',89,23,33);
/*!40000 ALTER TABLE `categoria base` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('AHDSOIH67','Alberto','Rossi','1990-11-11',23932039,2,'AB1'),('JAKSLJDL33','Luigi','Verdi','1978-10-09',23902929,1,'FG2'),('SAHDUID45','Carlo','Bianchi','1988-02-05',12103923,2,'AS2');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `coinvolgimento1`
--

LOCK TABLES `coinvolgimento1` WRITE;
/*!40000 ALTER TABLE `coinvolgimento1` DISABLE KEYS */;
INSERT INTO `coinvolgimento1` VALUES ('2021-01-01','2021-12-01',23,1123,1,'asdasd'),('2020-09-04','2020-10-10',34,2345,3,'sdfsdf'),('2020-02-01','2020-03-02',55,6438,4,'pdfsds'),('2021-12-11','2021-12-12',12,6767,5,'wqrwqk');
/*!40000 ALTER TABLE `coinvolgimento1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `coinvolgimento2`
--

LOCK TABLES `coinvolgimento2` WRITE;
/*!40000 ALTER TABLE `coinvolgimento2` DISABLE KEYS */;
INSERT INTO `coinvolgimento2` VALUES ('2021-01-03','2021-02-04','45','as1123',2,'fdgfsd');
/*!40000 ALTER TABLE `coinvolgimento2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `corriere`
--

LOCK TABLES `corriere` WRITE;
/*!40000 ALTER TABLE `corriere` DISABLE KEYS */;
INSERT INTO `corriere` VALUES ('23abc45','2021-11-10','societa1'),('23mmd98','2019-05-02','societa4'),('29ffr77','2018-04-03','societa5'),('44dft33','2019-02-03','societa2'),('53ddw23','2020-07-03','societa3');
/*!40000 ALTER TABLE `corriere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `dati anagrafici`
--

LOCK TABLES `dati anagrafici` WRITE;
/*!40000 ALTER TABLE `dati anagrafici` DISABLE KEYS */;
INSERT INTO `dati anagrafici` VALUES ('as1123','Alfonso','Blu','1990-01-01',23,1123),('df1234','Carmine','Gialli','1998-02-04',45,1234),('fg2345','Luigi','Verdi','1978-06-05',44,2345),('gh6438','Mario','Bianchi','1997-09-10',67,6438),('kl6767','Alberto','Rossi','1994-03-02',34,6767);
/*!40000 ALTER TABLE `dati anagrafici` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `dati lavorativi`
--

LOCK TABLES `dati lavorativi` WRITE;
/*!40000 ALTER TABLE `dati lavorativi` DISABLE KEYS */;
INSERT INTO `dati lavorativi` VALUES (1123,'supervisione',94039490,'determinato',NULL,NULL,NULL),(1234,'supervisione',23219203,'determinato','nazionale','manager',NULL),(2345,'manutenzione',23490324,'indeterminato',NULL,NULL,NULL),(6438,'controllo',93949832,'determinato',NULL,NULL,NULL),(6767,'costruzione',34892849,'part-time',NULL,NULL,NULL);
/*!40000 ALTER TABLE `dati lavorativi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `destinazione`
--

LOCK TABLES `destinazione` WRITE;
/*!40000 ALTER TABLE `destinazione` DISABLE KEYS */;
/*!40000 ALTER TABLE `destinazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `indirizzo`
--

LOCK TABLES `indirizzo` WRITE;
/*!40000 ALTER TABLE `indirizzo` DISABLE KEYS */;
INSERT INTO `indirizzo` VALUES ('AB1','capitale',12,80045,'napoli'),('AS2','debito',3,80076,'fisciano'),('FG2','nazionale',8,34545,'bari');
/*!40000 ALTER TABLE `indirizzo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `intervento`
--

LOCK TABLES `intervento` WRITE;
/*!40000 ALTER TABLE `intervento` DISABLE KEYS */;
INSERT INTO `intervento` VALUES (1,'asdasd','2020-11-11','2020-11-12','completato'),(2,'fdgfsd','2020-09-09','2020-09-10','completato'),(3,'pdfsds','2020-08-07','2020-09-01','completato'),(4,'sdfsdf','2020-05-02','2020-06-01','completato'),(5,'wqrwqk','2020-03-03','2020-04-09','sospeso');
/*!40000 ALTER TABLE `intervento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `macchinario`
--

LOCK TABLES `macchinario` WRITE;
/*!40000 ALTER TABLE `macchinario` DISABLE KEYS */;
INSERT INTO `macchinario` VALUES ('asdasd',104,62,111,'AHDSOIH67','123',NULL,'23abc45'),('fdgfsd',112,91,123,'AHDSOIH67','124',NULL,'23mmd98'),('pdfsds',453,45,234,'SAHDUID45',NULL,'222','44dft33'),('sdfsdf',114,67,233,'JAKSLJDL33','465',NULL,'29ffr77'),('wqrwqk',223,23,667,'SAHDUID45',NULL,'456','53ddw23');
/*!40000 ALTER TABLE `macchinario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `partecipazione1`
--

LOCK TABLES `partecipazione1` WRITE;
/*!40000 ALTER TABLE `partecipazione1` DISABLE KEYS */;
INSERT INTO `partecipazione1` VALUES (111,1123),(123,1234),(233,2345),(234,6438);
/*!40000 ALTER TABLE `partecipazione1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `partecipazione2`
--

LOCK TABLES `partecipazione2` WRITE;
/*!40000 ALTER TABLE `partecipazione2` DISABLE KEYS */;
INSERT INTO `partecipazione2` VALUES (111,'as1123');
/*!40000 ALTER TABLE `partecipazione2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `progetto`
--

LOCK TABLES `progetto` WRITE;
/*!40000 ALTER TABLE `progetto` DISABLE KEYS */;
INSERT INTO `progetto` VALUES (111,'collaudato'),(123,'pilota'),(233,'pilota'),(234,'prototipale'),(667,'pilota');
/*!40000 ALTER TABLE `progetto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `trattamento`
--

LOCK TABLES `trattamento` WRITE;
/*!40000 ALTER TABLE `trattamento` DISABLE KEYS */;
INSERT INTO `trattamento` VALUES (111222,'tipo3'),(123212,'tipo2'),(234324,'tipo1');
/*!40000 ALTER TABLE `trattamento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-12 19:43:07

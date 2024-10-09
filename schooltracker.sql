-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: schooltracker
-- ------------------------------------------------------
-- Server version	8.4.0

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
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ra` int NOT NULL,
  `nome` varchar(80) DEFAULT NULL,
  `tempoestudo` int NOT NULL,
  `rendafamiliar` decimal(10,2) DEFAULT NULL,
  `senha` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (6,20230005,'Eduardo Lima',3,1500.40,NULL),(7,20230006,'Fernanda Oliveira',8,4000.60,NULL),(8,20230007,'Gustavo Santos',6,2700.30,NULL),(10,20230009,'Igor Martins',4,2300.00,NULL),(11,20230010,'Julia Mendes',7,3100.10,NULL),(12,20230011,'Lucas Almeida',6,2800.80,NULL),(13,20230012,'Mariana Barbosa',5,2600.50,NULL),(14,20230013,'Nicolas Ferreira',8,4200.40,NULL),(15,20230014,'Olivia Cardoso',3,1700.20,NULL),(16,20230015,'Pedro Azevedo',5,2500.00,NULL),(17,20230016,'Quezia Farias',4,2200.70,NULL),(18,20230017,'Ricardo Ribeiro',7,3400.90,NULL),(19,20230018,'Sofia Vasconcelos',6,2900.50,NULL),(20,20230019,'Tiago Macedo',5,2400.30,NULL),(21,20230020,'Ursula Braga',4,2100.10,NULL),(22,20230021,'Victor Neves',6,2700.70,NULL),(23,20230022,'Wesley Nunes',7,3100.40,NULL),(24,20230023,'Ximena Silva',8,3800.50,NULL),(25,20230024,'Yuri Cunha',5,2600.60,NULL),(26,20230025,'Zara Monteiro',4,2400.70,NULL),(27,20230026,'Arthur Ramos',6,2700.80,NULL),(28,20230027,'Beatriz Nogueira',7,3200.90,NULL),(29,20230028,'Caio Teixeira',8,3500.00,NULL),(30,20230029,'Diana Carvalho',5,2800.10,NULL),(31,20230030,'Emilio Araujo',6,2900.20,NULL),(32,20230031,'Fabiana Costa',7,3300.30,NULL),(33,20230032,'Gabriel Rocha',4,2200.40,NULL),(34,20230033,'Heloisa Mendes',5,2500.50,NULL),(35,20230034,'Isabela Lima',6,2900.60,NULL),(36,20230035,'Joao Cardoso',7,3200.70,NULL),(37,20230036,'Karina Oliveira',8,3500.80,NULL),(38,20230037,'Leandro Silva',5,2600.90,NULL),(39,20230038,'Manuela Santos',4,2300.00,NULL),(40,20230039,'Natalia Correia',6,2800.10,NULL),(41,20230040,'Otavio Melo',7,3100.20,NULL),(42,20230041,'Paula Silva',8,3400.30,NULL),(43,20230042,'Quintino Costa',5,2700.40,NULL),(44,20230043,'Raquel Sousa',4,2200.50,NULL),(45,20230044,'Samuel Fernandes',6,2800.60,NULL),(46,20230045,'Tatiana Barros',7,3200.70,NULL),(47,20230046,'Ugo Lima',8,3600.80,NULL),(48,20230047,'Valeria Pereira',5,2500.90,NULL),(49,20230048,'Wagner Silva',4,2300.00,NULL),(50,20230049,'Xuxa Braga',6,2900.10,NULL),(51,20230050,'Yara Santos',7,3200.20,NULL),(52,12245655,'Andre Rodrigues ',10,5000.00,NULL),(53,11223334,'Ana Silvas as',1,1222.00,NULL),(55,99999999,'Teste Senha',23,2000.00,'e10adc3949ba59abbe56e057f20f883e');
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliacao`
--

DROP TABLE IF EXISTS `avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avaliacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nota1` int DEFAULT NULL,
  `nota2` int DEFAULT NULL,
  `nota3` int DEFAULT NULL,
  `nota4` int DEFAULT NULL,
  `fk_Aluno_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_avaliacao_2` (`fk_Aluno_id`),
  CONSTRAINT `FK_avaliacao_2` FOREIGN KEY (`fk_Aluno_id`) REFERENCES `aluno` (`id`) ON DELETE CASCADE,
  CONSTRAINT `avaliacao_chk_1` CHECK ((`nota1` <= 25)),
  CONSTRAINT `avaliacao_chk_2` CHECK ((`nota2` <= 25)),
  CONSTRAINT `avaliacao_chk_3` CHECK ((`nota3` <= 25)),
  CONSTRAINT `avaliacao_chk_4` CHECK ((`nota4` <= 25))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao`
--

LOCK TABLES `avaliacao` WRITE;
/*!40000 ALTER TABLE `avaliacao` DISABLE KEYS */;
INSERT INTO `avaliacao` VALUES (1,25,25,25,25,NULL);
/*!40000 ALTER TABLE `avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diariobordo`
--

DROP TABLE IF EXISTS `diariobordo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diariobordo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `datahora` datetime NOT NULL,
  `texto` text NOT NULL,
  `fk_Aluno_id` int DEFAULT NULL,
  `sentimento` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_avaliacao_3` (`fk_Aluno_id`),
  CONSTRAINT `FK_avaliacao_3` FOREIGN KEY (`fk_Aluno_id`) REFERENCES `aluno` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diariobordo`
--

LOCK TABLES `diariobordo` WRITE;
/*!40000 ALTER TABLE `diariobordo` DISABLE KEYS */;
INSERT INTO `diariobordo` VALUES (1,'2024-07-31 17:40:00','nesta aula aprendemos comandos mais avanÃ§ados de sql, como impedir valores duplicados, e como utilizar o join, Ã³tima aula prof :)',NULL,NULL),(2,'2024-09-30 15:24:56','asdsadasdasdasd',12,NULL),(3,'2024-09-30 15:24:59','asdsdasdsadsad',12,NULL),(4,'2024-09-30 15:30:57','dasdasdasd',12,NULL),(5,'2024-09-30 15:43:52','dfsdfdsfsdf',12,NULL),(6,'2024-09-30 15:43:55','fdfdsfdsfdf',12,NULL),(7,'2024-09-30 18:06:06','sdgfsdsdfsdfdfdf',8,NULL),(8,'2024-09-30 18:06:09','dfgdfgdfgdfgf',8,NULL),(9,'2024-09-30 18:06:22','rttrt',8,NULL),(10,'2024-10-02 17:25:38','neutrina é muito legal',7,NULL),(11,'2024-10-02 17:40:46','minha aula foi muito legal gostei',7,NULL),(12,'2024-10-02 17:47:57','foi muito boa',7,NULL),(13,'2024-10-02 17:53:24','aprendemos sobre Flash',7,NULL),(14,'2024-10-03 14:57:34','aula foi muito legal a gente aprendeu várias coisas e é isso',14,NULL),(15,'2024-10-03 14:58:20','teste de sistema',14,NULL),(16,'2024-10-03 15:02:40','quando a gente testou o sistema e aprender sobre Python e ciência de dados',14,NULL),(17,'2024-10-04 14:46:48','Hoje tivemos uma aula introdutória sobre redes neurais. Foi empolgante ver como as máquinas podem aprender com dados! No entanto, achei difícil entender alguns conceitos iniciais. Preciso revisar mais o material para ficar mais à vontade.',NULL,NULL),(18,'2024-10-04 14:46:59','Hoje exploramos o Jupyter Notebook e a biblioteca Pandas. O professor mostrou como manipular dados de forma simples, o que me deixou animado! Porém, encontrei dificuldades ao trabalhar com DataFrames. Preciso de mais prática para me sentir confiante.\r\n\r\n',NULL,NULL),(19,'2024-10-04 14:47:17','A aula de Python foi incrível! Aprendemos sobre funções e listas, e a prática foi muito boa. Consegui resolver os exercícios, mas fiquei confuso em algumas partes sobre listas aninhadas. Acho que vou pedir ajuda ao professor.',NULL,NULL),(20,'2024-10-04 14:47:26','Nesta aula, discutimos algoritmos de aprendizado supervisionado. A teoria foi fascinante, mas a parte prática foi desafiadora. O código não funcionou como esperado, o que me deixou frustrado. No entanto, aprendi muito sobre depuração.',NULL,NULL),(21,'2024-10-04 14:47:35','Hoje praticamos loops e condicionais. A aula foi bem dinâmica e interativa. Consegui criar um pequeno jogo, o que foi super divertido! No entanto, me confundi um pouco com a indentação do código. Vou me atentar mais a isso nas próximas aulas.',NULL,NULL),(22,'2024-10-04 14:47:42','Exploramos como visualizar dados com Pandas e Matplotlib. Ver gráficos gerados a partir de dados foi muito gratificante! Porém, o tempo foi curto para praticar. Espero que possamos revisitar essa parte nas próximas aulas.',NULL,NULL),(23,'2024-10-04 14:47:50','Hoje discutimos o impacto da IA na sociedade. Foi uma aula muito enriquecedora e reflexiva! No entanto, a quantidade de informações me deixou um pouco sobrecarregado. Preciso organizar melhor meus estudos para acompanhar.',NULL,NULL),(24,'2024-10-04 14:48:03','A aula foi sobre bibliotecas externas. Aprendi sobre como instalar e usar o NumPy. Fiquei empolgado com a rapidez que conseguimos realizar operações matemáticas! Mas tive dificuldade ao instalar algumas bibliotecas. Vou buscar um guia mais detalhado.',NULL,NULL),(25,'2024-10-04 14:48:16','Hoje, fizemos uma análise de dados real usando o Pandas. Consegui aplicar o que aprendi e foi muito gratificante ver os resultados! No entanto, levei um tempo considerável para entender algumas funções específicas. Preciso praticar mais.',NULL,NULL),(26,'2024-10-04 14:48:26','Finalizamos o módulo de IA com um projeto em grupo. Foi muito bom colaborar com meus colegas e aplicar os conceitos aprendidos. Porém, enfrentamos dificuldades em conciliar as ideias de todos. A comunicação é fundamental!',NULL,NULL),(27,'2024-10-04 15:21:06','Hoje tivemos uma aula introdutória sobre redes neurais. Foi empolgante ver como as máquinas podem aprender com dados! No entanto, achei difícil entender alguns conceitos iniciais. Preciso revisar mais o material para ficar mais à vontade.\r\n\r\n',15,'?'),(28,'2024-10-04 15:22:00','A aula de Python foi incrível! Aprendemos sobre funções e listas, e a prática foi muito boa. Consegui resolver os exercícios, mas fiquei confuso em algumas partes sobre listas aninhadas. Acho que vou pedir ajuda ao professor.\r\n\r\n',15,'?'),(29,'2024-10-04 15:22:28','Hoje exploramos o Jupyter Notebook e a biblioteca Pandas. O professor mostrou como manipular dados de forma simples, o que me deixou animado! Porém, encontrei dificuldades ao trabalhar com DataFrames. Preciso de mais prática para me sentir confiante.',15,'?'),(30,'2024-10-04 15:23:02','Hoje praticamos loops e condicionais. A aula foi bem dinâmica e interativa. Consegui criar um pequeno jogo, o que foi super divertido! ',15,'?'),(31,'2024-10-04 15:23:26','Exploramos como visualizar dados com Pandas e Matplotlib. Ver gráficos gerados a partir de dados foi muito gratificante! ',15,'?'),(32,'2024-10-04 15:24:02','A aula foi sobre bibliotecas externas. Aprendi sobre como instalar e usar o NumPy. Fiquei empolgado com a rapidez que conseguimos realizar operações matemáticas! ',15,'?'),(33,'2024-10-04 15:24:29','Hoje, fizemos uma análise de dados real usando o Pandas. Consegui aplicar o que aprendi e foi muito gratificante ver os resultados! ',15,'?'),(34,'2024-10-04 15:42:30','Hoje aprendemos sobre funções em Python. Achei bem interessante e consegui entender tudo!\r\n',47,'neutro'),(35,'2024-10-04 15:42:46','A aula de IA foi bem desafiadora. Não consegui acompanhar algumas explicações e isso me deixou frustrado.',47,'neutro'),(36,'2024-10-04 15:43:06','Hoje tivemos uma introdução ao aprendizado de máquina. Foi um conteúdo muito legal, mas preciso praticar mais.',47,'feliz'),(37,'2024-10-04 15:43:23','Fiz um projeto simples em Python e funcionou perfeitamente! Estou animado para as próximas aulas.',47,'neutro'),(38,'2024-10-04 15:45:09','Hoje aprendemos sobre funções em Python. Achei bem interessante e consegui entender tudo!',47,'neutro'),(39,'2024-10-04 15:51:44','Hoje aprendemos sobre funções em Python. Achei bem interessante e consegui entender tudo!',47,'triste'),(40,'2024-10-04 15:51:54','Fiz um projeto simples em Python e funcionou perfeitamente! Estou animado para as próximas aulas.',47,'triste'),(41,'2024-10-04 15:55:08','Hoje aprendemos sobre funções em Python. Achei bem interessante e consegui entender tudo!',47,'neutro'),(42,'2024-10-04 16:03:08','Hoje aprendemos sobre funções em Python. Achei bem interessante e consegui entender tudo!',47,'neutro'),(43,'2024-10-04 16:04:07','Hoje aprendemos sobre funções em Python. Achei bem interessante e consegui entender tudo!',47,'neutro'),(44,'2024-10-04 16:04:40','Fiz um projeto simples em Python e funcionou perfeitamente! Estou animado para as próximas aulas.',47,'neutro'),(45,'2024-10-04 16:06:03','A aula de IA foi bem desafiadora. Não consegui acompanhar algumas explicações e isso me deixou frustrado.',47,'vazio'),(46,'2024-10-04 16:08:56','Hoje aprendemos sobre funções em Python. Achei bem interessante e consegui entender tudo!',47,'feliz'),(47,'2024-10-04 16:09:13','Fiz um projeto simples em Python e funcionou perfeitamente! Estou animado para as próximas aulas.',47,'feliz'),(48,'2024-10-04 16:09:21','A aula de IA foi bem desafiadora. Não consegui acompanhar algumas explicações e isso me deixou frustrado.',47,'triste'),(49,'2024-10-04 16:10:36','Fiz um projeto simples em Python e funcionou perfeitamente! Estou animado para as próximas aulas.',47,'feliz'),(50,'2024-10-04 16:11:04','Hoje tivemos uma introdução ao aprendizado de máquina. Foi um conteúdo muito legal, mas preciso praticar mais.',47,'feliz'),(51,'2024-10-04 16:12:51','Eu gosto da pogramação, mas o instrutor enrrola muito para ensiar e isso me deixa entediado durante a aula;',47,'triste'),(52,'2024-10-04 16:13:45','Aula top demais!!!',47,'feliz'),(53,'2024-10-04 18:00:35','aprendemos py e js',47,'neutro'),(54,'2024-10-07 14:37:04','Aula muito legal \r\n',50,'feliz'),(55,'2024-10-07 14:37:16','aula ruim',50,'triste'),(56,'2024-10-07 14:37:49','py e computadfor',50,'neutro'),(57,'2024-10-08 17:38:24','teste',55,'neutro'),(58,'2024-10-08 17:38:32','legal',55,'feliz'),(59,'2024-10-08 17:38:38','ruim',55,'triste'),(60,'2024-10-09 14:59:13','normal',55,'feliz'),(61,'2024-10-09 15:35:28','muito muito feliz',55,'feliz'),(62,'2024-10-09 17:07:07','pessimo',55,'neutro'),(63,'2024-10-09 17:07:13','péssimo',55,'triste'),(64,'2024-10-09 17:12:43','felis',55,'neutro'),(65,'2024-10-09 17:13:00','teste de correçã',55,'neutro'),(66,'2024-10-09 17:13:44','dfsf',55,'neutro'),(67,'2024-10-09 17:17:06','dffsfdfd',55,'neutro'),(68,'2024-10-09 17:26:07','test de correcao de testo',55,'neutro'),(69,'2024-10-09 17:27:56','test de correcao de testo',55,'neutro'),(70,'2024-10-09 17:28:39','classificacao de erros em texto sem acentuacao',55,'neutro'),(71,'2024-10-09 17:29:03','A aula foi muito boa ',55,'feliz'),(72,'2024-10-09 17:29:26','A aula foi cansativa ',55,'neutro'),(73,'2024-10-09 17:29:47','Aula nao aprendi muito achei o conteudo extenso',55,'neutro'),(74,'2024-10-09 17:30:52','feliz',55,'feliz'),(75,'2024-10-09 17:36:28','Texte com erro de digitaca',55,'neutro'),(76,'2024-10-09 17:37:11','Texte com erro de digitaca',55,'neutro');
/*!40000 ALTER TABLE `diariobordo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-09 17:54:55

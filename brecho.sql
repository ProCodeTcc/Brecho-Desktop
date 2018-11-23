CREATE DATABASE  IF NOT EXISTS `brecho` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `brecho`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: brecho
-- ------------------------------------------------------
-- Server version	5.6.10-log

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
-- Table structure for table `cartaocredito`
--

DROP TABLE IF EXISTS `cartaocredito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartaocredito` (
  `idCartao` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primaria que identifica um cartão de crédito.',
  `numeroCartao` varchar(19) NOT NULL COMMENT 'Atributo que armazena o numero principal do cartao de crédito.',
  `nomeTitular` varchar(25) NOT NULL COMMENT 'Atributo que armazena o nome do titular do cartao.',
  `mesValidade` char(2) NOT NULL COMMENT 'Atributo que armazena o mes de validade do cartão de crédito.',
  `anoValidade` char(2) NOT NULL COMMENT 'Atributo que armazena o ano de validade do cartão de crédito.',
  PRIMARY KEY (`idCartao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartaocredito`
--

LOCK TABLES `cartaocredito` WRITE;
/*!40000 ALTER TABLE `cartaocredito` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartaocredito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária que identifica a categoria.',
  `nomeCategoria` varchar(50) NOT NULL COMMENT 'Atributo que armazena o nome da categoria.',
  `genero` varchar(1) NOT NULL,
  `idSubcategoria` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idCategoria`),
  KEY `fk_categoria_subcategoria_idx` (`idSubcategoria`),
  CONSTRAINT `fk_categoria_subcategoria` FOREIGN KEY (`idSubcategoria`) REFERENCES `subcategoria` (`idSubcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Blusas','',NULL,1),(2,'Calças','',NULL,1),(3,'Calçados','',NULL,1),(4,'Íntimo','',NULL,1);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientefisico`
--

DROP TABLE IF EXISTS `clientefisico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientefisico` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primaria para identificar um cliente fisico.',
  `nome` varchar(60) NOT NULL COMMENT 'Atributo que armazena o nome de um cliente fisico.',
  `sobrenome` varchar(45) NOT NULL COMMENT 'Atributo que armazena o sobrenome de um cliente fisico.',
  `telefone` varchar(14) NOT NULL COMMENT 'Atributo que armazena o telefone de um cliente fisico.',
  `celular` varchar(15) DEFAULT NULL COMMENT 'Atributo que armazena o celular de um cliente fisico.',
  `email` varchar(75) NOT NULL COMMENT 'Atributo que armazena o email de um cliente fisico.',
  `cpf` varchar(14) NOT NULL COMMENT 'Atributo que armazena o cpf de um cliente fisico.',
  `dataNascimento` date NOT NULL COMMENT 'Atributo que armazena a data de nascimento de um cliente fisico.',
  `login` varchar(13) NOT NULL COMMENT 'Atributo que armazena o login do usuario.',
  `senha` varchar(50) NOT NULL COMMENT 'Atributo que armazena a senha de um usuario.',
  `app` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Campo que identifica se o cliente possui o alplicativo.',
  `sexo` varchar(1) NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientefisico`
--

LOCK TABLES `clientefisico` WRITE;
/*!40000 ALTER TABLE `clientefisico` DISABLE KEYS */;
INSERT INTO `clientefisico` VALUES (1,'Lucas','Eduardo','(11) 4789-2892','(11) 94271-0174','lucased78@hotmail.com','449.621.908-57','1999-07-03','lucased78','01040205',0,'M'),(2,'teste','teste','(11) 4789-2892','(11) 94271-0174','teste@hotmail.com','449.621.908-57','1999-07-03','teste','teste',0,'M'),(3,'Felipe','Monteiro','(11) 1111-1111','(22) 22222-2222','felipe@email.com.br','000.000.000-00','1999-10-06','felipe','123',0,'M'),(4,'Maria','Sla','(11) 1111-1111','(11) 11111-1111','maria@email.com','000.000.000-00','1999-10-22','maria','123',0,'F');
/*!40000 ALTER TABLE `clientefisico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientefisico_cartao`
--

DROP TABLE IF EXISTS `clientefisico_cartao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientefisico_cartao` (
  `idClienteFisico` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica o cliente fisico e relaciona com o cartão.',
  `idCartao` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica o cartão fisico e relaciona com o cliente fisico.',
  KEY `fk_cartao_clienteJuridico_idx` (`idCartao`),
  KEY `fk_clienteFisico_cartao_idx` (`idClienteFisico`),
  CONSTRAINT `fk_cartao_clienteFisico` FOREIGN KEY (`idCartao`) REFERENCES `cartaocredito` (`idCartao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_clienteFisico_cartao` FOREIGN KEY (`idClienteFisico`) REFERENCES `clientefisico` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientefisico_cartao`
--

LOCK TABLES `clientefisico_cartao` WRITE;
/*!40000 ALTER TABLE `clientefisico_cartao` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientefisico_cartao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientefisico_endereco`
--

DROP TABLE IF EXISTS `clientefisico_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientefisico_endereco` (
  `idClienteFisico` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica o cliente fisico e relaciona com o endereço.',
  `idEndereco` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica o endereço e relaciona com o cliente fisico.',
  KEY `fk_idClientePessoaFisica_endereco_idx` (`idClienteFisico`),
  KEY `fk_endereco_clientePessoaFisica_idx` (`idEndereco`),
  CONSTRAINT `fk_endereco_clienteFisico` FOREIGN KEY (`idEndereco`) REFERENCES `endereco` (`idEndereco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_idClienteFisico_endereco` FOREIGN KEY (`idClienteFisico`) REFERENCES `clientefisico` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientefisico_endereco`
--

LOCK TABLES `clientefisico_endereco` WRITE;
/*!40000 ALTER TABLE `clientefisico_endereco` DISABLE KEYS */;
INSERT INTO `clientefisico_endereco` VALUES (1,4),(2,9),(3,12),(4,14);
/*!40000 ALTER TABLE `clientefisico_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientefisico_pedidocompra`
--

DROP TABLE IF EXISTS `clientefisico_pedidocompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientefisico_pedidocompra` (
  `idClienteFisico` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica o cliente.',
  `idPedidoCompra` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica o pedido.',
  KEY `fk_pedidoCompra_clienteFisico_idx` (`idPedidoCompra`),
  KEY `fk_clienteFsicico_pedidoCompra_idx` (`idClienteFisico`),
  CONSTRAINT `fk_clienteFsicico_pedidoCompra` FOREIGN KEY (`idClienteFisico`) REFERENCES `clientefisico` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidoCompra_clienteFisico` FOREIGN KEY (`idPedidoCompra`) REFERENCES `pedidocompra` (`idPedidoCompra`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientefisico_pedidocompra`
--

LOCK TABLES `clientefisico_pedidocompra` WRITE;
/*!40000 ALTER TABLE `clientefisico_pedidocompra` DISABLE KEYS */;
INSERT INTO `clientefisico_pedidocompra` VALUES (1,3);
/*!40000 ALTER TABLE `clientefisico_pedidocompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientefisico_pedidovenda`
--

DROP TABLE IF EXISTS `clientefisico_pedidovenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientefisico_pedidovenda` (
  `idClienteFisico` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica o cliente.',
  `idPedidoVenda` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica o pedido.',
  KEY `fk_clienteFsicico_pedidoCompra_idx` (`idClienteFisico`),
  KEY `fk_pedidoVenda_clienteFisico_idx` (`idPedidoVenda`),
  CONSTRAINT `fk_clienteFisico_pedidoVenda` FOREIGN KEY (`idClienteFisico`) REFERENCES `clientefisico` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidoVenda_clienteFisico` FOREIGN KEY (`idPedidoVenda`) REFERENCES `pedidovenda` (`idPedidoVenda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientefisico_pedidovenda`
--

LOCK TABLES `clientefisico_pedidovenda` WRITE;
/*!40000 ALTER TABLE `clientefisico_pedidovenda` DISABLE KEYS */;
INSERT INTO `clientefisico_pedidovenda` VALUES (1,6),(1,7),(1,8),(1,9),(1,10),(3,19);
/*!40000 ALTER TABLE `clientefisico_pedidovenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientefisico_produtoavaliacao`
--

DROP TABLE IF EXISTS `clientefisico_produtoavaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientefisico_produtoavaliacao` (
  `idClienteFisico` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica um cliente fisico.',
  `idProdutoAvaliacao` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica um produto em avaliação.',
  `data` date NOT NULL,
  KEY `fk_clienteFisico_produtoAvaliacao_idx` (`idClienteFisico`),
  KEY `fk_produtoAvaliacao_clienteFisico_idx` (`idProdutoAvaliacao`),
  CONSTRAINT `fk_clienteFisico_produtoAvaliacao` FOREIGN KEY (`idClienteFisico`) REFERENCES `clientefisico` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_produtoAvaliacao_clienteFisico` FOREIGN KEY (`idProdutoAvaliacao`) REFERENCES `produtoavaliacao` (`idProdutoAvaliacao`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientefisico_produtoavaliacao`
--

LOCK TABLES `clientefisico_produtoavaliacao` WRITE;
/*!40000 ALTER TABLE `clientefisico_produtoavaliacao` DISABLE KEYS */;
INSERT INTO `clientefisico_produtoavaliacao` VALUES (1,9,'2018-11-08');
/*!40000 ALTER TABLE `clientefisico_produtoavaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientejuridico`
--

DROP TABLE IF EXISTS `clientejuridico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientejuridico` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primaria que identifica o cliente juridico.',
  `razao` varchar(100) NOT NULL COMMENT 'Atributo que armazena o nome do cliente juridico.',
  `telefone` varchar(14) NOT NULL COMMENT 'Atributo que armazena o telefone do cliente juridico.',
  `celular` varchar(15) DEFAULT NULL COMMENT 'Atributo que armazena o celular do cliente juridico.',
  `email` varchar(75) NOT NULL COMMENT 'Atributo que armazena o email do cliente juridico.',
  `cnpj` varchar(18) NOT NULL COMMENT 'Atributo que armazena o cnpj do cliente juridico.',
  `login` varchar(13) NOT NULL COMMENT 'Atributo que armazena o login do cliente juridico.',
  `senha` varchar(50) NOT NULL COMMENT 'Atributo que armazena a senha do cliente juridico.',
  `app` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Campo que identifica se o cliente possui o alplicativo.',
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientejuridico`
--

LOCK TABLES `clientejuridico` WRITE;
/*!40000 ALTER TABLE `clientejuridico` DISABLE KEYS */;
INSERT INTO `clientejuridico` VALUES (1,'aq','(11) 4789-2892','(11) 94271-0174','lucased78@hotmail.com','15.641.513/2132-61','lucased78','01040205',0),(2,'teste','(11) 4789-2892','(11) 94271-0174','lucased78@hotmail.com','15.641.513/2132-61','base','0104',0),(3,'teste','(11) 4789-2892','(11) 94271-0174','lucased78@hotmail.com','15.641.513/2132-61','base','0104',0),(4,'a','(11) 4789-2892','(11) 94271-0174','lucased78@hotmail.com','15.641.513/2132-61','sadsadsa','asdsadsa',0),(5,'teste','(11) 4789-2892','(11) 94271-0174','teste@hotmail.com','15.641.513/2132-61','teste','teste',0),(6,'Teste Empresa','(24) 3142-4323','(34) 23142-4242','xpto@hotmail.com','54.646.546/5456-46','teste2','teste',0);
/*!40000 ALTER TABLE `clientejuridico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientejuridico_cartao`
--

DROP TABLE IF EXISTS `clientejuridico_cartao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientejuridico_cartao` (
  `idClienteJuridico` int(11) NOT NULL COMMENT 'Chave estrangeira identifica um cliente juridico.',
  `idCartao` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica um cartão.',
  KEY `fk_cartao_clienteJuridico_idx` (`idCartao`),
  KEY `fk_clienteJuridico_cartao_idx` (`idClienteJuridico`),
  CONSTRAINT `fk_cartao_clienteJuridico` FOREIGN KEY (`idCartao`) REFERENCES `cartaocredito` (`idCartao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_clienteJuridico_cartao` FOREIGN KEY (`idClienteJuridico`) REFERENCES `clientejuridico` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientejuridico_cartao`
--

LOCK TABLES `clientejuridico_cartao` WRITE;
/*!40000 ALTER TABLE `clientejuridico_cartao` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientejuridico_cartao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientejuridico_pedidocompra`
--

DROP TABLE IF EXISTS `clientejuridico_pedidocompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientejuridico_pedidocompra` (
  `idClienteJuridico` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica o cliente.',
  `idPedidoCompra` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica o pedido.',
  KEY `fk_clienteJuridico_pedidoCompra_idx` (`idClienteJuridico`),
  KEY `fk_pedidoCompra_clienteJuridico_idx` (`idPedidoCompra`),
  CONSTRAINT `fk_clienteJuridico_pedidoCompra` FOREIGN KEY (`idClienteJuridico`) REFERENCES `clientejuridico` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidoCompra_clienteJuridico` FOREIGN KEY (`idPedidoCompra`) REFERENCES `pedidocompra` (`idPedidoCompra`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientejuridico_pedidocompra`
--

LOCK TABLES `clientejuridico_pedidocompra` WRITE;
/*!40000 ALTER TABLE `clientejuridico_pedidocompra` DISABLE KEYS */;
INSERT INTO `clientejuridico_pedidocompra` VALUES (1,1),(1,2);
/*!40000 ALTER TABLE `clientejuridico_pedidocompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientejuridico_pedidovenda`
--

DROP TABLE IF EXISTS `clientejuridico_pedidovenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientejuridico_pedidovenda` (
  `idClienteJuridico` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica o cliente.',
  `idPedidoVenda` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica o pedido.',
  KEY `fk_clienteJuridico_pedidoCompra_idx` (`idClienteJuridico`),
  KEY `fk_pedidoVenda_clienteJuridico_idx` (`idPedidoVenda`),
  CONSTRAINT `fk_clienteJuridico_pedidoVenda` FOREIGN KEY (`idClienteJuridico`) REFERENCES `clientejuridico` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidoVenda_clienteJuridico` FOREIGN KEY (`idPedidoVenda`) REFERENCES `pedidovenda` (`idPedidoVenda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientejuridico_pedidovenda`
--

LOCK TABLES `clientejuridico_pedidovenda` WRITE;
/*!40000 ALTER TABLE `clientejuridico_pedidovenda` DISABLE KEYS */;
INSERT INTO `clientejuridico_pedidovenda` VALUES (1,18);
/*!40000 ALTER TABLE `clientejuridico_pedidovenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientejuridico_produtoavaliacao`
--

DROP TABLE IF EXISTS `clientejuridico_produtoavaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientejuridico_produtoavaliacao` (
  `idClienteJuridico` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica o cliente juridico.',
  `idProdutoAvaliacao` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica o produto em avaliação.',
  `data` date NOT NULL,
  KEY `fk_produtoAvaliacao_clienteFisico_idx` (`idProdutoAvaliacao`),
  KEY `fk_clienteJuridico_produtoAvaliacao_idx` (`idClienteJuridico`),
  CONSTRAINT `fk_clienteJuridico_produtoAvaliacao` FOREIGN KEY (`idClienteJuridico`) REFERENCES `clientejuridico` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_produtoAvaliacao_clienteJuridico` FOREIGN KEY (`idProdutoAvaliacao`) REFERENCES `produtoavaliacao` (`idProdutoAvaliacao`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientejuridico_produtoavaliacao`
--

LOCK TABLES `clientejuridico_produtoavaliacao` WRITE;
/*!40000 ALTER TABLE `clientejuridico_produtoavaliacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientejuridico_produtoavaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contabanco`
--

DROP TABLE IF EXISTS `contabanco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contabanco` (
  `idConta` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária que identifica a conta do banco',
  `agencia` int(11) NOT NULL COMMENT 'Atributo de agencia do banco',
  `numeroConta` int(11) NOT NULL COMMENT 'Atributo de numero de conta ',
  `digito` int(11) NOT NULL COMMENT 'Atributo de digito do núemto da conta',
  `idBanco` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica o banco relacionado a esta conta.',
  PRIMARY KEY (`idConta`),
  KEY `fk_conta_banco_idx` (`idBanco`),
  CONSTRAINT `fk_conta_banco` FOREIGN KEY (`idBanco`) REFERENCES `listabanco` (`idBanco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contabanco`
--

LOCK TABLES `contabanco` WRITE;
/*!40000 ALTER TABLE `contabanco` DISABLE KEYS */;
INSERT INTO `contabanco` VALUES (1,3006,5224,3,1);
/*!40000 ALTER TABLE `contabanco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corroupa`
--

DROP TABLE IF EXISTS `corroupa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corroupa` (
  `idCor` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária que identifica uma cor de roupa.',
  `nome` varchar(45) NOT NULL COMMENT 'Atributo que armazena o nome de uma cor.',
  `cor` varchar(7) NOT NULL COMMENT 'Atributo com o nome da cor da roupa.',
  PRIMARY KEY (`idCor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corroupa`
--

LOCK TABLES `corroupa` WRITE;
/*!40000 ALTER TABLE `corroupa` DISABLE KEYS */;
INSERT INTO `corroupa` VALUES (1,'vermelho','#ff0000'),(2,'Azul','#0000ff');
/*!40000 ALTER TABLE `corroupa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `despesas`
--

DROP TABLE IF EXISTS `despesas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `despesas` (
  `idDespesa` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `dataVencimento` date NOT NULL,
  `valor` int(11) NOT NULL,
  `idConta` int(11) NOT NULL,
  PRIMARY KEY (`idDespesa`),
  KEY `fk_despesa_conta_idx` (`idConta`),
  CONSTRAINT `fk_despesa_conta` FOREIGN KEY (`idConta`) REFERENCES `contabanco` (`idConta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `despesas`
--

LOCK TABLES `despesas` WRITE;
/*!40000 ALTER TABLE `despesas` DISABLE KEYS */;
INSERT INTO `despesas` VALUES (1,'teste','1999-10-06',10,1),(2,'Despesa Teste','2018-11-21',101,1),(3,'Teste Data','2019-12-21',10,1),(4,'TEste Dnv','2018-11-22',50,1),(5,'aaaaa','2018-12-31',90,1),(6,'Pagamento De Funcionario (João)','2018-11-22',500,1);
/*!40000 ALTER TABLE `despesas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duplicatapagar`
--

DROP TABLE IF EXISTS `duplicatapagar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `duplicatapagar` (
  `idDuplicataPagar` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primaria que identifica um duplicata a receber.',
  `vencida` tinyint(1) NOT NULL COMMENT 'atributo que mostra se ja está vencida.',
  `statusBaixa` tinyint(1) NOT NULL COMMENT 'atributo que mostra se ja foi dado baixa.',
  `dtPagamento` date DEFAULT NULL,
  `valorReal` decimal(10,0) DEFAULT NULL,
  `dtVencimento` date DEFAULT NULL,
  `idConta` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDuplicataPagar`),
  KEY `fk_duplicata_conta_idx` (`idConta`),
  CONSTRAINT `fk_duplicata_conta` FOREIGN KEY (`idConta`) REFERENCES `contabanco` (`idConta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duplicatapagar`
--

LOCK TABLES `duplicatapagar` WRITE;
/*!40000 ALTER TABLE `duplicatapagar` DISABLE KEYS */;
INSERT INTO `duplicatapagar` VALUES (1,0,0,'0000-00-00',50,'2018-01-05',1),(2,0,0,'0000-00-00',50,'2018-02-04',1),(3,0,0,'0000-00-00',13,'2018-01-05',1),(4,0,0,'0000-00-00',13,'2018-02-04',1),(5,0,0,'0000-00-00',13,'2018-03-06',1),(6,0,0,'0000-00-00',13,'2018-04-05',1),(7,0,0,'0000-00-00',13,'2018-05-05',1),(8,0,0,'0000-00-00',13,'2018-06-04',1),(9,0,0,'0000-00-00',13,'2018-07-04',1),(10,0,0,'0000-00-00',13,'2018-08-03',1),(11,0,0,'0000-00-00',13,'2018-09-02',1),(12,0,0,'0000-00-00',13,'2018-10-02',1),(13,0,0,'0000-00-00',13,'2018-11-01',1),(14,0,0,'0000-00-00',13,'2018-12-01',1),(15,0,0,'0000-00-00',100,'2018-11-21',1),(16,0,0,'0000-00-00',50,'2018-11-22',1),(17,0,0,'0000-00-00',50,'2018-12-22',1),(18,0,0,'0000-00-00',7,'2018-11-22',1),(19,0,0,'0000-00-00',7,'2018-12-22',1),(20,0,0,'0000-00-00',7,'2019-01-21',1),(21,0,0,'0000-00-00',89,'2018-11-22',1),(22,0,0,'0000-00-00',1,'1999-10-06',1),(23,0,0,'0000-00-00',1,'1999-11-05',1);
/*!40000 ALTER TABLE `duplicatapagar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duplicatapagar_pedidocompra`
--

DROP TABLE IF EXISTS `duplicatapagar_pedidocompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `duplicatapagar_pedidocompra` (
  `idDuplicata` int(11) NOT NULL,
  `idPedidoCompra` int(11) NOT NULL,
  KEY `fk_duplicata_pedido_idx` (`idDuplicata`),
  KEY `fk_pedido_duplicata_idx` (`idPedidoCompra`),
  CONSTRAINT `fk_duplicata_pedido` FOREIGN KEY (`idDuplicata`) REFERENCES `duplicatapagar` (`idDuplicataPagar`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_duplicata` FOREIGN KEY (`idPedidoCompra`) REFERENCES `pedidocompra` (`idPedidoCompra`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duplicatapagar_pedidocompra`
--

LOCK TABLES `duplicatapagar_pedidocompra` WRITE;
/*!40000 ALTER TABLE `duplicatapagar_pedidocompra` DISABLE KEYS */;
INSERT INTO `duplicatapagar_pedidocompra` VALUES (1,13),(2,13),(3,14),(4,14),(5,14),(6,14),(7,14),(8,14),(9,14),(10,14),(11,14),(12,14),(13,14),(14,14),(15,15),(16,16),(17,16),(18,17),(19,17),(20,17),(21,18),(22,19),(23,19);
/*!40000 ALTER TABLE `duplicatapagar_pedidocompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duplicatareceber`
--

DROP TABLE IF EXISTS `duplicatareceber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `duplicatareceber` (
  `idDuplicata` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primaria que identifica um duplicata.',
  `idPedidoVenda` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica o pedido de venda.',
  `statusBaixa` tinyint(1) NOT NULL COMMENT 'Atributo que mostra se uma duplicata ja foi dado baixa ou não.',
  `vencida` tinyint(1) NOT NULL COMMENT 'Atributo que mostra se uma duplicata ja foi recebida ou não.',
  `dtVencimento` date DEFAULT NULL,
  `dtRecebimento` date DEFAULT NULL,
  `valorReal` decimal(10,0) DEFAULT NULL,
  `idConta` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDuplicata`),
  KEY `fk_pedido_duplicata_idx` (`idPedidoVenda`),
  KEY `fk_duplicata_conta_idx` (`idConta`),
  CONSTRAINT `fk_duplicatareceber_banco` FOREIGN KEY (`idConta`) REFERENCES `contabanco` (`idConta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidoVenda_duplicata` FOREIGN KEY (`idPedidoVenda`) REFERENCES `pedidovenda` (`idPedidoVenda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duplicatareceber`
--

LOCK TABLES `duplicatareceber` WRITE;
/*!40000 ALTER TABLE `duplicatareceber` DISABLE KEYS */;
/*!40000 ALTER TABLE `duplicatareceber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endereco` (
  `idEndereco` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primaria que identifica o endereço.',
  `logradouro` varchar(150) NOT NULL COMMENT 'Atributo que armazena o endereço, por exemplo: Rua Castro Alves.',
  `bairro` varchar(50) NOT NULL COMMENT 'Atributo que armazena o bairro daquele endereço.',
  `cidade` varchar(70) NOT NULL COMMENT 'Atributo que armazena a cidade daquele endereço.',
  `estado` varchar(70) NOT NULL COMMENT 'Atributo que armazena o estado do endereço.',
  `numero` int(11) NOT NULL COMMENT 'Atributo que armazena o numero da casa, apartamento do endereço.',
  `complemento` varchar(45) DEFAULT NULL COMMENT 'Atributo que armazena um complemento para o endereço.',
  `latitude` varchar(100) DEFAULT NULL COMMENT 'Atributo que armazena a latitude do endereço.',
  `longitude` varchar(100) DEFAULT NULL COMMENT 'Atributo que armazena a longitude do endereço.',
  `cep` varchar(9) NOT NULL COMMENT 'Atributo que armazena o cep do endereço.',
  PRIMARY KEY (`idEndereco`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,'Avenida Carmine Gragnano','Centro','Jandira','SP',664,'BL04 AP53',NULL,NULL,'06600-010'),(2,'Avenida Carmine Gragnano','Centro','Jandira','SP',664,'BL04 AP53',NULL,NULL,'06600-010'),(3,'Avenida Carmine Gragnano','Centro','Jandira','SP',664,'BL04 AP53',NULL,NULL,'06600-010'),(4,'Avenida Carmine Gragnano','Centro','SP','SP',664,'BL04 AP53',NULL,NULL,'06600-010'),(5,'Avenida Carmine Gragnano','Centro','Jandira','SP',664,NULL,NULL,NULL,'06600010'),(6,'Avenida Carmine Gragnano','Centro','Jandira','SP',664,NULL,NULL,NULL,'06600010'),(7,'Avenida Carmine Gragnano','Centro','Jandira','SP',664,NULL,NULL,NULL,'06600010'),(8,'Avenida Carmine Gragnano','Centro','Jandira','SP',664,NULL,NULL,NULL,'06600010'),(9,'Avenida Carmine Gragnano','Centro','SP','SP',664,'BL04 AP53',NULL,NULL,'06600-010'),(10,'Avenida Carmine Gragnano','Centro','Jandira','SP',664,'BL04 AP53',NULL,NULL,'06600-010'),(12,'Rua João Del Moura','Vila Cecília','SP','SP',123,'',NULL,NULL,'06602-150'),(13,'Avenida Carmine Gragnano','Centro','Jandira','SP',664,'BL04',NULL,NULL,'06600-010'),(14,'Rua Odilon Correia Pires','Vila Eunice','Jandira','SP',100,'',NULL,NULL,'06602-190'),(15,'Rua Odilon Correia Pires','Vila Eunice','Jandira','SP',100,NULL,'-100.445882','39.78373','06602-190');
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco_clientejuridico`
--

DROP TABLE IF EXISTS `endereco_clientejuridico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endereco_clientejuridico` (
  `idEndereco` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica o endereço.',
  `idCliente` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica o cliente juridico.',
  KEY `fk_endereco_has_clientePessoaJuridica_clientePessoaJuridica_idx` (`idCliente`),
  KEY `fk_endereco_has_clientePessoaJuridica_endereco1_idx` (`idEndereco`),
  CONSTRAINT `fk_clienteJuridico_endereco` FOREIGN KEY (`idCliente`) REFERENCES `clientejuridico` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_endereco_clienteJuridico` FOREIGN KEY (`idEndereco`) REFERENCES `endereco` (`idEndereco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco_clientejuridico`
--

LOCK TABLES `endereco_clientejuridico` WRITE;
/*!40000 ALTER TABLE `endereco_clientejuridico` DISABLE KEYS */;
INSERT INTO `endereco_clientejuridico` VALUES (1,1),(3,4),(10,5),(13,6);
/*!40000 ALTER TABLE `endereco_clientejuridico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco_fornecedor`
--

DROP TABLE IF EXISTS `endereco_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endereco_fornecedor` (
  `idEndereco` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica o endereço.',
  `idFornecedor` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica o fornecedor.',
  KEY `fk_endereco_has_fornecedor_fornecedor1_idx` (`idFornecedor`),
  KEY `fk_endereco_has_fornecedor_endereco1_idx` (`idEndereco`),
  CONSTRAINT `fk_endereco_fornecedor` FOREIGN KEY (`idEndereco`) REFERENCES `endereco` (`idEndereco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fornecedor_endereco` FOREIGN KEY (`idFornecedor`) REFERENCES `fornecedor` (`idFornecedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco_fornecedor`
--

LOCK TABLES `endereco_fornecedor` WRITE;
/*!40000 ALTER TABLE `endereco_fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `endereco_fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enquete`
--

DROP TABLE IF EXISTS `enquete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enquete` (
  `idEnquete` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária que identifica a enquete',
  `pergunta` varchar(100) NOT NULL COMMENT 'campo que armazena a pergunta',
  `dataInicial` date NOT NULL COMMENT 'data que começará a enquete\n',
  `dataFinal` date NOT NULL COMMENT 'campo que definirá o final da enquete\n',
  `alternativaA` varchar(60) NOT NULL COMMENT 'primeira alternaiva da pergunta',
  `alternativaB` varchar(60) NOT NULL COMMENT 'segunda alternativa da pergunta\n',
  `alternativaC` varchar(60) NOT NULL COMMENT 'terceira alternativa da pergunta',
  `alternativaD` varchar(60) NOT NULL COMMENT 'quarta alternativa da pergunta\n',
  `qtdAlternativaA` mediumint(4) DEFAULT '0' COMMENT 'quantidade de respostas da primeira alternativa',
  `qtdAlternativaB` mediumint(4) DEFAULT '0' COMMENT 'quantidade de respostas da segunda alternativa',
  `qtdAlternativaC` mediumint(4) DEFAULT '0' COMMENT 'quantidade de respostas da terceira alternativa',
  `qtdAlternativaD` mediumint(4) DEFAULT '0' COMMENT 'quantidade de respostas da quarta alternativa',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'o status mostra se a enquete está ativa ou não',
  `idTema` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica o tema de uma enquete.',
  PRIMARY KEY (`idEnquete`),
  KEY `fk_enquete_tema_idx` (`idTema`),
  CONSTRAINT `fk_enquete_tema` FOREIGN KEY (`idTema`) REFERENCES `temaenquete` (`idTema`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enquete`
--

LOCK TABLES `enquete` WRITE;
/*!40000 ALTER TABLE `enquete` DISABLE KEYS */;
INSERT INTO `enquete` VALUES (5,'Qual sua opiniãoo sobre nosso site?','2018-11-11','2018-11-11','a','b','c','d',0,0,0,0,1,1),(9,'teste','2018-11-11','2018-11-11','a','b','c','d',0,0,0,0,0,1),(14,'1','2018-11-11','2018-11-11','1','1','1','1',0,0,0,0,0,1);
/*!40000 ALTER TABLE `enquete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enquete_traducao`
--

DROP TABLE IF EXISTS `enquete_traducao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enquete_traducao` (
  `idTraducao` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária que identifica a enquete',
  `pergunta` varchar(100) NOT NULL COMMENT 'campo que armazena a pergunta',
  `alternativaA` varchar(60) NOT NULL COMMENT 'primeira alternaiva da pergunta',
  `alternativaB` varchar(60) NOT NULL COMMENT 'segunda alternativa da pergunta\n',
  `alternativaC` varchar(60) NOT NULL COMMENT 'terceira alternativa da pergunta',
  `alternativaD` varchar(60) NOT NULL COMMENT 'quarta alternativa da pergunta\n',
  `codigo_idioma` varchar(10) NOT NULL,
  `idEnquete` int(11) NOT NULL,
  PRIMARY KEY (`idTraducao`),
  KEY `fk_traducao_enquete_idx` (`codigo_idioma`),
  KEY `fk_traducao_enquete_idx1` (`idEnquete`),
  CONSTRAINT `fk_enquete_idioma` FOREIGN KEY (`codigo_idioma`) REFERENCES `idioma` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_traducao_enquete` FOREIGN KEY (`idEnquete`) REFERENCES `enquete` (`idEnquete`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enquete_traducao`
--

LOCK TABLES `enquete_traducao` WRITE;
/*!40000 ALTER TABLE `enquete_traducao` DISABLE KEYS */;
INSERT INTO `enquete_traducao` VALUES (1,'2','2','2','2','2','en',14);
/*!40000 ALTER TABLE `enquete_traducao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento` (
  `idEvento` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária que identifica um evento.',
  `nomeEvento` varchar(45) NOT NULL COMMENT 'Atributo que armazena o nome/titulo de um evento.',
  `descricaoEvento` mediumtext NOT NULL COMMENT 'Atributo que armazena a descrição de um evento.',
  `imagemEvento` varchar(255) NOT NULL COMMENT 'Atributo que armazena o caminho da imagem de um evento.',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Atrbiuto que identifica se este item está ativo ou não.',
  PRIMARY KEY (`idEvento`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES (1,'Evento Teste',' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eget tellus vitae diam dapibus scelerisque. Morbi hendrerit at eros ac blandit. Fusce sed tristique sapien, in varius ligula. In malesuada dolor ac turpis pulvinar, vel pretium dolor dapibus. Suspendisse molestie enim non elit vestibulum, a suscipit justo rhoncus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed ipsum justo, congue non quam nec, tincidunt venenatis justo. Curabitur tempor arcu elementum metus maximus interdum. ','b28cc0d0e91e9c8b38adc7ce896c9c03evento.jpg',1);
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento_nossaloja`
--

DROP TABLE IF EXISTS `evento_nossaloja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento_nossaloja` (
  `idEvento` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica um evento.',
  `idLoja` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica uma loja.',
  `dataInicio` date NOT NULL COMMENT 'Atributo que armazena a data que o evento vai iniciar.',
  `dataFim` date NOT NULL COMMENT 'Atributo que armazena a data que vai acabar o evento.',
  KEY `fk_evento_nossaLoja_nossaLoja1_idx` (`idLoja`),
  KEY `fk_evento_nossaLoja_evento1_idx` (`idEvento`),
  CONSTRAINT `fk_evento_nossaLoja_evento1` FOREIGN KEY (`idEvento`) REFERENCES `evento` (`idEvento`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_evento_nossaLoja_nossaLoja1` FOREIGN KEY (`idLoja`) REFERENCES `nossaloja` (`idLoja`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento_nossaloja`
--

LOCK TABLES `evento_nossaloja` WRITE;
/*!40000 ALTER TABLE `evento_nossaloja` DISABLE KEYS */;
INSERT INTO `evento_nossaloja` VALUES (1,1,'2018-10-22','2018-10-30');
/*!40000 ALTER TABLE `evento_nossaloja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento_traducao`
--

DROP TABLE IF EXISTS `evento_traducao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento_traducao` (
  `idTraducao` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária que identifica um evento.',
  `nomeEvento` varchar(45) NOT NULL COMMENT 'Atributo que armazena o nome/titulo de um evento.',
  `descricaoEvento` mediumtext NOT NULL COMMENT 'Atributo que armazena a descrição de um evento.',
  `codigo_idioma` varchar(10) NOT NULL,
  `idEvento` int(11) NOT NULL,
  PRIMARY KEY (`idTraducao`),
  KEY `fk_evento_idioma_idx` (`codigo_idioma`),
  KEY `fk_traducao_evento_idx` (`idEvento`),
  CONSTRAINT `fk_evento_idioma` FOREIGN KEY (`codigo_idioma`) REFERENCES `idioma` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_traducao_evento` FOREIGN KEY (`idEvento`) REFERENCES `evento` (`idEvento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento_traducao`
--

LOCK TABLES `evento_traducao` WRITE;
/*!40000 ALTER TABLE `evento_traducao` DISABLE KEYS */;
/*!40000 ALTER TABLE `evento_traducao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faleconosco`
--

DROP TABLE IF EXISTS `faleconosco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faleconosco` (
  `idRegistro` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador do registro',
  `nomePessoa` varchar(45) NOT NULL COMMENT 'Campo que armazena o nome da pessoa que ',
  `email` varchar(60) NOT NULL COMMENT 'Atributo de email do cliente que entrou em contato',
  `telefone` varchar(15) NOT NULL COMMENT 'Atributo de telefone do cliente que entrou em contato',
  `sexo` char(1) NOT NULL COMMENT 'Atributo de sexo, genêro sexual do cliente que entrou em contato',
  `assunto` varchar(45) NOT NULL COMMENT 'Atributo que armazena o assunto que a selecionou',
  `comentario` mediumtext NOT NULL COMMENT 'Atributo que armazena a mensagem escrita pelo cliente que entrou em contato.',
  PRIMARY KEY (`idRegistro`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='										';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faleconosco`
--

LOCK TABLES `faleconosco` WRITE;
/*!40000 ALTER TABLE `faleconosco` DISABLE KEYS */;
INSERT INTO `faleconosco` VALUES (1,'Lucas','lucased78@hotmail.com','(11) 4789-2892','M','SugestÃ£o','site bem legal');
/*!40000 ALTER TABLE `faleconosco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fornecedor` (
  `idFornecedor` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária que identifica o fornecedor.',
  `nomeFornecedor` varchar(60) NOT NULL COMMENT 'Atributo que armazena o nome do fornecedor.',
  `telefone` varchar(14) NOT NULL COMMENT 'Atributo que armazena o telefone do fornecedor.',
  `celular` varchar(15) DEFAULT NULL COMMENT 'Atributo que armazena o celular do fornecedor.',
  `email` varchar(75) NOT NULL COMMENT 'Atributo que armazena o email do fornecedor.',
  `cnpj` varchar(18) NOT NULL COMMENT 'Atributo que armazena o cnpj do fornecedor.',
  PRIMARY KEY (`idFornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (26,'qdff','fqfqe','fqefqe','ffqfqef','fqfqe');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor_pedidocompra`
--

DROP TABLE IF EXISTS `fornecedor_pedidocompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fornecedor_pedidocompra` (
  `idFornecedor` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica o fornecedor e relaciona com o pedido de compra.',
  `idPedidoCompra` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica o pedido de compra e relaciona com o fornecedor.',
  KEY `fk_fornecedor_has_pedodoCompra_pedodoCompra1_idx` (`idPedidoCompra`),
  KEY `fk_fornecedor_has_pedodoCompra_fornecedor1_idx` (`idFornecedor`),
  CONSTRAINT `fk_fornecedor_pedidoCompra` FOREIGN KEY (`idFornecedor`) REFERENCES `fornecedor` (`idFornecedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidoCompra__fornecedor` FOREIGN KEY (`idPedidoCompra`) REFERENCES `pedidocompra` (`idPedidoCompra`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor_pedidocompra`
--

LOCK TABLES `fornecedor_pedidocompra` WRITE;
/*!40000 ALTER TABLE `fornecedor_pedidocompra` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedor_pedidocompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fotoproduto`
--

DROP TABLE IF EXISTS `fotoproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fotoproduto` (
  `idImagemProduto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primaria que identifica uma foto salva nesta tabela.',
  `caminhoImagem` varchar(255) NOT NULL COMMENT 'Atributo que armazena o caminho de uma imagem.',
  PRIMARY KEY (`idImagemProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fotoproduto`
--

LOCK TABLES `fotoproduto` WRITE;
/*!40000 ALTER TABLE `fotoproduto` DISABLE KEYS */;
INSERT INTO `fotoproduto` VALUES (1,'643c084a2fe901962190798767bebab0ca1.jpg'),(2,'5a3ecbbda40b7f0340e89e1240eef177ca1.jpg'),(3,'ed41b501d91a5fa9564f0887196bdcceca1.jpg'),(5,'86e5c44f034e33342d262bdec94d668aca3.jpg'),(6,'eeef2406f9b8878532a9cf52f68d27f3ca3.jpg'),(7,'64c3382f6268dba2542af1724f5c294cca3.jpg'),(8,'86e5c44f034e33342d262bdec94d668aca3.jpg'),(9,'eeef2406f9b8878532a9cf52f68d27f3ca3.jpg'),(10,'64c3382f6268dba2542af1724f5c294cca3.jpg'),(11,'86e5c44f034e33342d262bdec94d668aca3.jpg'),(12,'eeef2406f9b8878532a9cf52f68d27f3ca3.jpg'),(14,'ce2450363e3a517da80bb2d24d891953ca1.jpg'),(15,'264c517f2838faaa345051c43fdb9d35ca1.jpg'),(16,'0e25748df8c9201002da90d63580f0feca2.jpg'),(17,'471bc249f4540bf5a42406dd7e74b07dca2.jpg'),(18,'b615311dd1deb59cb7a78c8f4d9c845cca2.jpg'),(20,'2756593b4d6a213994d7e7d90beb06c7ca4.jpg'),(21,'81b1d6229da7b5e37f3adbb7ed32c45cca4.jpg'),(23,'2ea5b50d02c7edcee73c7f240c07d537ca5.jpg'),(24,'1e0c1d1fedb4fe5e36a6c706465e352cca5.jpg'),(26,'7680b5e5932d2ac57467af146b47a85cca6.jpg'),(27,'3f616fc10c2a1bc19d534e8a1a0281d3ca6.jpg'),(28,'7a2b5a3bf103da3f26a16625147dc2f6dress.png'),(29,'a83b2dfe4eba9327c22e4f671a3f6311dress.png'),(30,'18359e44542e9e5054061d702124af32dress.png'),(31,'ae0cb2ea0befa7ae2310da0c625a7e75ca6.jpg'),(32,'7680b5e5932d2ac57467af146b47a85cca6.jpg'),(33,'3f616fc10c2a1bc19d534e8a1a0281d3ca6.jpg'),(35,'ccb2e94aab02174a3ce865e1154f97eedress.png'),(36,'39335e0f78df3a0cd1dddff01e906309dress.png'),(38,'d18f1e95e6d913e811e31277c03b41b9blusa.jpg'),(39,'eff68e623862b44d8b035d229fb685ffblusa.jpg'),(40,'7c108c003504c859c4c89b7c8af7ee940126530045421_main_or_1.jpg'),(41,'254152fbe4432be4df13ccced56853510126530045421_main_or_1.jpg'),(42,'0862ba406a574aaeea9df796d4ae73900126530045421_main_or_1.jpg'),(43,'28bbf77e8416b7ec3a7164fca974b4000126530045421_main_or_1.jpg'),(44,'446dc320a174406c2837348225a0ceaa0126530045421_main_or_1.jpg'),(45,'ce26e0f48609a0971d284f20a1db79e00126530045421_main_or_1.jpg'),(46,'02701d537b564a959b0803e9e41d7c610126530045421_main_or_1.jpg'),(47,'d5511086e95063e5ea8333fdc75565180126530045421_main_or_1.jpg'),(48,'adad6f73c9d162a3a6722ee21fbf028d0126530045421_main_or_1.jpg'),(50,'2ea5b50d02c7edcee73c7f240c07d537ca5.jpg'),(51,'1e0c1d1fedb4fe5e36a6c706465e352cca5.jpg'),(53,'11d6a15bce2aa156c49da15d13ec3cd7blusa.jpg'),(55,'959f7c51117f13f66f6af9209a855a87android.png'),(56,'959f7c51117f13f66f6af9209a855a87android.png'),(58,'46a5d8e1a4fe4cc8082fdadb347fad57boy.png'),(60,'a6afdacd518e67f26360f5b59feee508android.png'),(61,'b35a6501021e93a54203c5523c117b71android.png'),(63,'9e8e35a682971d3a6be925a7591d678bajax.png'),(64,'5c630d022fdc09add64668632807c445ajax.png'),(66,'0b677d7f22253f31da27b9788910131cajax.png'),(67,'f8ff9d85b4cd7debe05142c884a5f8eeajax.png'),(68,'9d1de4e26614238e42f2d825593f4eb7ajax.png'),(69,'1e4c7469b8645d2edbe99823fee44501ajax.png'),(70,'d6f4568cf123b1245a236d383f43ef91ajax.png'),(71,'25a41288fdc4ae09dcc050926b3a668aajax.png'),(72,'de3267f03ac6c0b2b7db45f83e6d0a6eajax.png'),(73,'dfee1286ae75c1590e9ee04884cbc2a6ajax.png'),(74,'4d1f231c98bd91d2e069b851b45b4946android.png'),(75,'b3446e07d6f102d9e6fcd22e7c64b2b0android.png'),(76,'70718421d937002cff7b7ad71947e354android.png'),(77,'482dba36645b4844729072f6cf4718b8android.png'),(78,'74064335de976aea3b4cc601afbbc9c9android.png'),(79,'ea57aeb09fdd6509303c0f06522cbe7fandroid.png'),(81,'c0696ea205499faf4ed328950abd2a88ajax.png'),(82,'10aad2df967848d916b38b9dcd06247aajax.png'),(84,'7a84b2ce9f4376b5e527f15f68d15e6fajax.png'),(85,'93476f10deee5c46bc5a1d3fa0cdde56ajax.png'),(86,'9660ed57a09e8c1de450f59b23b900a9ajax.png'),(87,'867ff2490939f0abc9e91480c1fda907ajax.png'),(88,'b93bdc00deaa874d1b880fecd66137d9ajax.png'),(89,'e032bba90287d3b686ce76952ed46232ajax.png'),(90,'3a3612bd37cbf628e2840c4da149b246ajax.png'),(91,'9c9d718814a14b28770112111222bd81ajax.png'),(93,'f2f74934507282e851f30dfaeb7b1210ajax.png'),(94,'9f8444d93baeee84e9856fa53914a0d0ajax.png'),(96,'9310b342d1fb0632659b66217959c5bcajax.png'),(97,'96cc33618be9b790636e296ee52e23e7ajax.png'),(99,'5999babcd4d16c5af5d1a0be0bcd0928ajax.png'),(100,'a45ebd235846fb3f2844ec16321f68c0ajax.png'),(102,'bb271c0e743f75bf1086bfd41e16a334ajax.png'),(103,'fb996935a37eb3c9b3c8844d67d7ea6cajax.png'),(104,'08422e7e235e028b8f23856d8cee58c7ajax.png'),(105,'7f71c8f2c44b2f861b01b0c100056ca2ajax.png'),(106,'a0c934e1689a0c96ffcf6f274ad70dfbajax.png'),(108,'c1888f2b7f53caaebea95ff6b0246026ajax.png'),(109,'23f8387bea8164b740e11598f5fd57f0ajax.png'),(111,'e0a9846f6ed20488af50c0f84adac835ajax.png'),(112,'fa1850f00761ea3bd6be3e7a5acce348ajax.png'),(114,'6b4c664cdb6af476214909b8b7a47faeajax.png'),(115,'92d04f493e832a8a898e238b7b2ffc9fajax.png'),(117,'fed0ae7c9843eedd5106926c02cfc90bajax.png'),(118,'c536775cdecb6c1cd7341a4ac2c63e2eajax.png'),(119,'832a7940a0009b51e5d9b00f66082c8fajax.png'),(120,'59bb79a83a956d3b39a7efdc7210a7a2ajax.png'),(121,'f9d65e57fac4cb7140bbe4750a0881cbajax.png');
/*!40000 ALTER TABLE `fotoproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genero` (
  `idGenero` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária que identifica o gênero',
  `genero` varchar(45) NOT NULL COMMENT 'Atributo de nome do gênero',
  PRIMARY KEY (`idGenero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idioma`
--

DROP TABLE IF EXISTS `idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idioma` (
  `codigo` varchar(10) NOT NULL,
  `nome` varchar(155) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idioma`
--

LOCK TABLES `idioma` WRITE;
/*!40000 ALTER TABLE `idioma` DISABLE KEYS */;
INSERT INTO `idioma` VALUES ('en','inglês');
/*!40000 ALTER TABLE `idioma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listabanco`
--

DROP TABLE IF EXISTS `listabanco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listabanco` (
  `idBanco` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária que identifica o banco',
  `nomeBanco` varchar(45) NOT NULL COMMENT 'Atributo que armazena o nome do banco.',
  PRIMARY KEY (`idBanco`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listabanco`
--

LOCK TABLES `listabanco` WRITE;
/*!40000 ALTER TABLE `listabanco` DISABLE KEYS */;
INSERT INTO `listabanco` VALUES (1,'Bradesco'),(2,'Banco do Brasil'),(3,'Santander');
/*!40000 ALTER TABLE `listabanco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marca` (
  `idMarca` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária que identifica a marca',
  `nomeMarca` varchar(45) NOT NULL COMMENT 'Atributo que armazena-se o nome da marca',
  PRIMARY KEY (`idMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'adidas'),(2,'nike'),(3,'oakley'),(4,'umbro'),(5,'under armour');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materialinsumo`
--

DROP TABLE IF EXISTS `materialinsumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materialinsumo` (
  `idMaterial` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária que identifica o material/insumo.',
  `nomeMaterial` varchar(50) NOT NULL COMMENT 'Atributo que armazena o nome daquele material/insumo.',
  `valorMaterial` float NOT NULL COMMENT 'Atributo que armazena o valor total daquele material/insumo.',
  `idPedido` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica e relaciona um material/insumo com um pedido de compra.',
  PRIMARY KEY (`idMaterial`),
  KEY `fk_pedido_material_idx` (`idPedido`),
  CONSTRAINT `fk_pedido_material` FOREIGN KEY (`idPedido`) REFERENCES `pedidocompra` (`idPedidoCompra`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materialinsumo`
--

LOCK TABLES `materialinsumo` WRITE;
/*!40000 ALTER TABLE `materialinsumo` DISABLE KEYS */;
/*!40000 ALTER TABLE `materialinsumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivel_tela`
--

DROP TABLE IF EXISTS `nivel_tela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nivel_tela` (
  `idNivel` int(11) NOT NULL COMMENT 'Chave estrangeira que indentifica o nivel, para relacionamento com uma tela(permissão)',
  `idTela` int(11) NOT NULL COMMENT 'Chave estrangeira que indentifica a tela, para relacionamento com um nivel',
  KEY `fk_tela_nivel_idx` (`idTela`),
  KEY `fk_nivel_tela` (`idNivel`),
  CONSTRAINT `fk_nivel_tela` FOREIGN KEY (`idNivel`) REFERENCES `nivelusuario` (`idNivel`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_tela_nivel` FOREIGN KEY (`idTela`) REFERENCES `tela` (`idTela`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel_tela`
--

LOCK TABLES `nivel_tela` WRITE;
/*!40000 ALTER TABLE `nivel_tela` DISABLE KEYS */;
INSERT INTO `nivel_tela` VALUES (1,1),(1,3),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,2),(1,4),(1,15);
/*!40000 ALTER TABLE `nivel_tela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivelusuario`
--

DROP TABLE IF EXISTS `nivelusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nivelusuario` (
  `idNivel` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária que identifica o nivel.',
  `nomeNivel` varchar(45) NOT NULL COMMENT 'Atributo que armazena o nome do nivel.',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Atrbiuto que identifica se este item está ativo ou não.',
  PRIMARY KEY (`idNivel`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivelusuario`
--

LOCK TABLES `nivelusuario` WRITE;
/*!40000 ALTER TABLE `nivelusuario` DISABLE KEYS */;
INSERT INTO `nivelusuario` VALUES (1,'administrador',1);
/*!40000 ALTER TABLE `nivelusuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nossaloja`
--

DROP TABLE IF EXISTS `nossaloja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nossaloja` (
  `idLoja` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária que identifica uma loja.',
  `nomeLoja` varchar(50) NOT NULL COMMENT 'Atributo que armazena o nome/titulo de uma loja.',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Atrbiuto que identifica se este item está ativo ou não.',
  PRIMARY KEY (`idLoja`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nossaloja`
--

LOCK TABLES `nossaloja` WRITE;
/*!40000 ALTER TABLE `nossaloja` DISABLE KEYS */;
INSERT INTO `nossaloja` VALUES (1,'Brechó Bernadette',1);
/*!40000 ALTER TABLE `nossaloja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nossaloja_unidade`
--

DROP TABLE IF EXISTS `nossaloja_unidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nossaloja_unidade` (
  `idUnidade` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primaria que identifica uma unidade de uma loja.',
  `nomeUnidade` varchar(45) NOT NULL COMMENT 'Atributo que armazena o nome da unidade.',
  `idLoja` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica e relaciona uma unidade com uma loja.',
  PRIMARY KEY (`idUnidade`),
  KEY `fk_endereco_nossaLoja_idx` (`idLoja`),
  CONSTRAINT `fk_endereco_nossaLoja` FOREIGN KEY (`idLoja`) REFERENCES `nossaloja` (`idLoja`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nossaloja_unidade`
--

LOCK TABLES `nossaloja_unidade` WRITE;
/*!40000 ALTER TABLE `nossaloja_unidade` DISABLE KEYS */;
INSERT INTO `nossaloja_unidade` VALUES (6,'Unidade 1',1),(7,'Unidade 1',1),(8,'sla',1);
/*!40000 ALTER TABLE `nossaloja_unidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notafiscal`
--

DROP TABLE IF EXISTS `notafiscal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notafiscal` (
  `numeroNF` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária que vai identificar a nota, chamada de numero de nota fiscal.',
  `titulo` varchar(45) NOT NULL COMMENT 'Atributo que armazena um titulo para a nota fiscal.',
  `valorNF` float NOT NULL COMMENT 'Atributo que armazena o valor total desta nota fiscal.',
  `idPedido` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica e relaciona uma nota fiscal com um pedido de compra.',
  `tipoNf` char(1) NOT NULL COMMENT 'Atributo para identificar se a nota fiscal é de entrada ou de saida.\nDe entrada(pedidoCompra), gera duplicata a pagar.\nsaida(pedidoVenda), gera duplicata a receber, caso for consignado, gera tambpem uma a pagar.',
  PRIMARY KEY (`numeroNF`),
  KEY `fk_nota_pedidoCompra_idx` (`idPedido`),
  CONSTRAINT `fk_nota_pedidoCompra` FOREIGN KEY (`idPedido`) REFERENCES `pedidocompra` (`idPedidoCompra`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notafiscal`
--

LOCK TABLES `notafiscal` WRITE;
/*!40000 ALTER TABLE `notafiscal` DISABLE KEYS */;
/*!40000 ALTER TABLE `notafiscal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidocompra`
--

DROP TABLE IF EXISTS `pedidocompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidocompra` (
  `idPedidoCompra` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária, que identifica o pedido de compra.',
  `valorPedido` float DEFAULT NULL COMMENT 'Atributo que armazena o valor do pedido de compra.',
  `data` date DEFAULT NULL,
  `dataVencimento` date DEFAULT NULL,
  `titulo` varchar(155) DEFAULT NULL,
  `descricao` mediumtext,
  `qtdparcelas` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPedidoCompra`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidocompra`
--

LOCK TABLES `pedidocompra` WRITE;
/*!40000 ALTER TABLE `pedidocompra` DISABLE KEYS */;
INSERT INTO `pedidocompra` VALUES (1,23,'2018-10-29',NULL,NULL,NULL,NULL),(2,23,'2018-10-29',NULL,NULL,NULL,NULL),(3,213213000,'2018-10-29',NULL,NULL,NULL,NULL),(5,10,NULL,NULL,NULL,NULL,NULL),(6,10,'2018-11-13',NULL,NULL,NULL,NULL),(7,10,'2018-11-13',NULL,NULL,NULL,NULL),(8,10,'2018-11-13','2018-11-13',NULL,NULL,NULL),(9,10,'2018-11-13','2018-11-13','Teste','teste dnv',NULL),(10,10,'2018-11-13','2018-11-13','Teste','teste dnv',1),(12,10,'2018-11-13','2018-11-13','Teste','teste dnv',1),(13,100,'2018-11-21','2018-01-05','Teste','Teste',2),(14,150,'2018-11-21','2018-01-05','Teste Duplicatas','Teste Duplicatas',12),(15,100,'2018-11-21','2018-11-21','Teste','Teste',1),(16,100,'2018-11-22','2018-11-22','Teste','Teste',2),(17,20,'2018-11-22','2018-11-22','Teste','Teste',3),(18,89,'2018-11-22','2018-11-22','Camiseta Super Mario Run','Camiseta Super Mario Run',1),(19,1,'2018-11-22','1999-10-06','a','sla',2);
/*!40000 ALTER TABLE `pedidocompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidoconsignacao`
--

DROP TABLE IF EXISTS `pedidoconsignacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidoconsignacao` (
  `idConsignacao` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária que identifica o pedido de consignação.',
  `valorConsignacao` float NOT NULL COMMENT 'Atributo que armazena-se o valor total de um pedido de consignação.',
  `dataInicial` date NOT NULL COMMENT 'Atributo que armazena a data que começa o pedido de consignação.',
  `dataFinal` date NOT NULL COMMENT 'Atributo que armazena a data final do periodo de um pedido de consignação.',
  `idStatus` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica e relaciona o pedido de consignação com um status.',
  PRIMARY KEY (`idConsignacao`),
  KEY `fk_consignacao_status_idx` (`idStatus`),
  CONSTRAINT `fk_consignacao_status` FOREIGN KEY (`idStatus`) REFERENCES `statusconsignacao` (`idStatus`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidoconsignacao`
--

LOCK TABLES `pedidoconsignacao` WRITE;
/*!40000 ALTER TABLE `pedidoconsignacao` DISABLE KEYS */;
INSERT INTO `pedidoconsignacao` VALUES (3,21,'1999-07-03','1999-07-03',1);
/*!40000 ALTER TABLE `pedidoconsignacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidoconsignacao_clientefisico`
--

DROP TABLE IF EXISTS `pedidoconsignacao_clientefisico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidoconsignacao_clientefisico` (
  `idPedidoConsignacao` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica o pedido.',
  `idClienteFisico` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica o cliente.',
  KEY `fk_pedidoConsignacao_idx` (`idPedidoConsignacao`),
  KEY `fk_clienteFisico_pedidoConsignacao_idx` (`idClienteFisico`),
  CONSTRAINT `fk_clienteFisico_pedidoConsignacao` FOREIGN KEY (`idClienteFisico`) REFERENCES `clientefisico` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidoConsignacao_clienteFisico` FOREIGN KEY (`idPedidoConsignacao`) REFERENCES `pedidoconsignacao` (`idConsignacao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidoconsignacao_clientefisico`
--

LOCK TABLES `pedidoconsignacao_clientefisico` WRITE;
/*!40000 ALTER TABLE `pedidoconsignacao_clientefisico` DISABLE KEYS */;
INSERT INTO `pedidoconsignacao_clientefisico` VALUES (3,1);
/*!40000 ALTER TABLE `pedidoconsignacao_clientefisico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidoconsignacao_clientejuridico`
--

DROP TABLE IF EXISTS `pedidoconsignacao_clientejuridico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidoconsignacao_clientejuridico` (
  `idPedidoConsignacao` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica o pedido.',
  `idClienteJuridico` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica o cliente.',
  KEY `fk_pedidoConsignacao_clienteJuridico_idx` (`idPedidoConsignacao`),
  KEY `fk_clienteJuridico_pedidoConsignacao_idx` (`idClienteJuridico`),
  CONSTRAINT `fk_clienteJuridico_pedidoConsignacao` FOREIGN KEY (`idClienteJuridico`) REFERENCES `clientejuridico` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidoConsignacao_clienteJuridico` FOREIGN KEY (`idPedidoConsignacao`) REFERENCES `pedidoconsignacao` (`idConsignacao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidoconsignacao_clientejuridico`
--

LOCK TABLES `pedidoconsignacao_clientejuridico` WRITE;
/*!40000 ALTER TABLE `pedidoconsignacao_clientejuridico` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidoconsignacao_clientejuridico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidovenda`
--

DROP TABLE IF EXISTS `pedidovenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidovenda` (
  `idPedidoVenda` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária que identifica o pedido de venda.',
  `dataPedidoVenda` date DEFAULT NULL COMMENT 'Atributo que armazena a data que foi realizado o pedido de venda.',
  `valorPedidoVenda` float DEFAULT NULL COMMENT 'Atributo que armazena o valor total de um pedido de venda.',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Campo que identifia se o pedido foi aprovado ou não',
  `dtVencimento` date DEFAULT NULL,
  `qtdParcelas` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPedidoVenda`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidovenda`
--

LOCK TABLES `pedidovenda` WRITE;
/*!40000 ALTER TABLE `pedidovenda` DISABLE KEYS */;
INSERT INTO `pedidovenda` VALUES (1,NULL,NULL,0,NULL,NULL),(2,NULL,NULL,0,NULL,NULL),(3,'2018-10-25',200,0,NULL,NULL),(4,'2018-10-25',200,0,NULL,NULL),(5,'2018-10-25',200,0,NULL,NULL),(6,'2018-10-25',200,0,NULL,NULL),(7,'2018-10-25',0,0,NULL,NULL),(8,'2018-10-25',50,0,NULL,NULL),(9,'2018-10-25',50,0,NULL,NULL),(10,'2018-10-29',50,0,NULL,NULL),(11,'2018-10-29',50,0,NULL,NULL),(12,'2018-10-29',50,0,NULL,NULL),(13,'2018-10-29',50,0,NULL,NULL),(14,'2018-10-29',50,0,NULL,NULL),(15,'2018-10-29',50,0,NULL,NULL),(16,'2018-10-29',50,0,NULL,NULL),(17,'2018-10-29',50,0,NULL,NULL),(18,'2018-10-29',50,0,NULL,NULL),(19,'2018-11-07',23,0,NULL,NULL);
/*!40000 ALTER TABLE `pedidovenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidovenda_duplicatapagar`
--

DROP TABLE IF EXISTS `pedidovenda_duplicatapagar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidovenda_duplicatapagar` (
  `idPedidoVenda` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica e relaciona o pedido de venda com uma duplicata a pagar.',
  `idDuplicataPagar` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica e relaciona uma duplicata a pagar com um pedido de venda .',
  KEY `fk_pedidoVenda_duplicataPagar_idx` (`idPedidoVenda`),
  KEY `fk_duplicataPagar_pedidoVenda_idx` (`idDuplicataPagar`),
  CONSTRAINT `fk_duplicataPagar_pedidoVenda` FOREIGN KEY (`idDuplicataPagar`) REFERENCES `duplicatapagar` (`idDuplicataPagar`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidoVenda_duplicataPagar` FOREIGN KEY (`idPedidoVenda`) REFERENCES `pedidovenda` (`idPedidoVenda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidovenda_duplicatapagar`
--

LOCK TABLES `pedidovenda_duplicatapagar` WRITE;
/*!40000 ALTER TABLE `pedidovenda_duplicatapagar` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidovenda_duplicatapagar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidovenda_produto`
--

DROP TABLE IF EXISTS `pedidovenda_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidovenda_produto` (
  `idPedidoVenda` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica e relaciona o pedido de venda com um produto.',
  `idProduto` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica e relaciona o produto com um pedido de venda.',
  KEY `fk_pediVenda_produto_idx` (`idPedidoVenda`),
  KEY `fk_produto_pedidoVenda_idx` (`idProduto`),
  CONSTRAINT `fk_pediVenda_produto` FOREIGN KEY (`idPedidoVenda`) REFERENCES `pedidovenda` (`idPedidoVenda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_pedidoVenda` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidovenda_produto`
--

LOCK TABLES `pedidovenda_produto` WRITE;
/*!40000 ALTER TABLE `pedidovenda_produto` DISABLE KEYS */;
INSERT INTO `pedidovenda_produto` VALUES (4,1),(4,2),(4,3),(5,1),(5,2),(5,3),(6,1),(6,2),(6,3),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,9);
/*!40000 ALTER TABLE `pedidovenda_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `idProduto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária que identifica o produto',
  `nomeProduto` varchar(70) NOT NULL COMMENT 'Atributo de nome do produto',
  `descricao` mediumtext NOT NULL COMMENT 'atributo de descrição do produto',
  `preco` float NOT NULL COMMENT 'Atrinuto que armazena o valor de um produto.',
  `classificacao` char(1) NOT NULL COMMENT 'Atributo que identifica o estado do produto.',
  `idMarca` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica a marca do produto',
  `idCategoria` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica a categoria do produto',
  `idCor` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica a cor do produto',
  `idTamanho` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica o tamanho do produto',
  `naturezaProduto` char(1) NOT NULL COMMENT 'Atributo que serve para identificar se o produto é de consignação ou próprio da loja',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Atrbiuto que identifica se este item está ativo ou não.',
  `cliques` int(11) DEFAULT '0',
  PRIMARY KEY (`idProduto`),
  KEY `fk_produto_marca_idx` (`idMarca`),
  KEY `fk_produto_categoria_idx` (`idCategoria`),
  KEY `fk_produto_cor_idx` (`idCor`),
  KEY `fk_produto_tamanho_idx` (`idTamanho`),
  CONSTRAINT `fk_produto_categoria` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_cor` FOREIGN KEY (`idCor`) REFERENCES `corroupa` (`idCor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_marca` FOREIGN KEY (`idMarca`) REFERENCES `marca` (`idMarca`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_tamanho` FOREIGN KEY (`idTamanho`) REFERENCES `tamanho` (`idTamanho`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Camiseta Teste','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eget tellus vitae diam dapibus scelerisque. Morbi hendrerit at eros ac blandit. Fusce sed tristique sapien, in varius ligula. In malesuada dolor ac turpis pulvinar, vel pretium dolor dapibus. Suspendisse molestie enim non elit vestibulum, a suscipit justo rhoncus. ',50,'A',1,1,1,2,'1',1,3),(2,'Produto Avaliado','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eget tellus vitae diam dapibus scelerisque. Morbi hendrerit at eros ac blandit. Fusce sed tristique sapien, in varius ligula. In malesuada dolor ac turpis pulvinar, vel pretium dolor dapibus. Suspendisse molestie enim non elit vestibulum, a suscipit justo rhoncus. ',50,'C',1,1,1,1,'2',1,4),(3,'teste 2',' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eget tellus vitae diam dapibus scelerisque. Morbi hendrerit at eros ac blandit. Fusce sed tristique sapien, in varius ligula. In malesuada dolor ac turpis pulvinar, vel pretium dolor dapibus. Suspendisse molestie enim non elit vestibulum, a suscipit justo rhoncus. ',100,'B',1,1,1,3,'1',1,2),(5,'Produto Avaliado 3',' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eget tellus vitae diam dapibus scelerisque. Morbi hendrerit at eros ac blandit. Fusce sed tristique sapien, in varius ligula. In malesuada dolor ac turpis pulvinar, vel pretium dolor dapibus. Suspendisse molestie enim non elit vestibulum, a suscipit justo rhoncus. ',100,'B',1,2,1,1,'2',1,2),(7,'teste','sadsadsdsa',21,'A',1,2,1,1,'2',1,0),(8,'teste','adasdsa',23,'A',1,1,1,1,'2',1,0),(9,'teste','adasdsa',23,'A',1,1,1,1,'2',1,1),(10,'teste','asdsadasdas',213213000,'A',1,2,1,1,'2',1,0),(14,'asdsadsa','asdsadsada',23432,'A',1,1,1,1,'1',1,0),(15,'asdsadsadas','sadsadsadas',2312,'A',1,1,1,1,'1',1,0),(16,'asdsadasdas','asdsadasdas',23,'A',1,1,1,1,'1',1,0),(17,'asdsadasdas','sadsadasdas',232,'A',1,1,1,1,'1',1,0),(20,'asdasdas','asdsadsadas',232,'A',1,1,1,1,'1',1,0),(21,'asdsadas','sadsadsadas',2322,'A',1,1,1,1,'1',1,0),(26,'asdsadsadsa','asdsadsad',234,'A',1,1,1,1,'1',1,0);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_consignacao`
--

DROP TABLE IF EXISTS `produto_consignacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto_consignacao` (
  `idProduto` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica o produto e relaciona com uma consignação.',
  `idConsignacao` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica uma consignação e relaciona com um produto.',
  `percentualLoja` int(11) NOT NULL COMMENT 'Atributo que armazena qual a porcentagem referente ao preço do produto que será para a loja.',
  `percentualCliente` int(11) NOT NULL COMMENT 'Atributo que armazena qual a porcentagem referente ao preço do produto que será para o cliente que forneceu a roupa.',
  KEY `fk_produto_consignacao_idx` (`idProduto`),
  KEY `fk_consignacao_idx` (`idConsignacao`),
  CONSTRAINT `fk_consignacao` FOREIGN KEY (`idConsignacao`) REFERENCES `pedidoconsignacao` (`idConsignacao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_consignacao` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_consignacao`
--

LOCK TABLES `produto_consignacao` WRITE;
/*!40000 ALTER TABLE `produto_consignacao` DISABLE KEYS */;
INSERT INTO `produto_consignacao` VALUES (7,3,50,50);
/*!40000 ALTER TABLE `produto_consignacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_fotoproduto`
--

DROP TABLE IF EXISTS `produto_fotoproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto_fotoproduto` (
  `idProduto` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica o produto e relaciona com a imagem do produto.',
  `idImagemProduto` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica a imagem do produto e relaciona com o produto.',
  KEY `fk_produto_has_fortoProduto_produto1_idx` (`idProduto`),
  KEY `fk_fortoProduto_produto_idx` (`idImagemProduto`),
  CONSTRAINT `fk_fortoProduto_produto` FOREIGN KEY (`idImagemProduto`) REFERENCES `fotoproduto` (`idImagemProduto`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_fortoProduto` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_fotoproduto`
--

LOCK TABLES `produto_fotoproduto` WRITE;
/*!40000 ALTER TABLE `produto_fotoproduto` DISABLE KEYS */;
INSERT INTO `produto_fotoproduto` VALUES (1,1),(1,2),(1,3),(2,10),(2,11),(2,12),(3,16),(3,17),(3,18),(5,31),(5,32),(5,33),(7,53),(8,55),(9,56),(10,58);
/*!40000 ALTER TABLE `produto_fotoproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_pedidocompra`
--

DROP TABLE IF EXISTS `produto_pedidocompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto_pedidocompra` (
  `idProduto` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica o cliente fisico e relaciona com o pedido de compra.',
  `idPedidoCompra` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica o pedido de compra fisico e relaciona com o cliente fisico.',
  KEY `fk_pedidoCompra_clienteFisico_idx` (`idPedidoCompra`),
  KEY `fk_produto_pedidoCOmpra_idx` (`idProduto`),
  CONSTRAINT `fk_pedidoCompra_produto` FOREIGN KEY (`idPedidoCompra`) REFERENCES `pedidocompra` (`idPedidoCompra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_pedidoCOmpra` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_pedidocompra`
--

LOCK TABLES `produto_pedidocompra` WRITE;
/*!40000 ALTER TABLE `produto_pedidocompra` DISABLE KEYS */;
INSERT INTO `produto_pedidocompra` VALUES (8,1),(9,2),(10,3);
/*!40000 ALTER TABLE `produto_pedidocompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_traducao`
--

DROP TABLE IF EXISTS `produto_traducao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto_traducao` (
  `idTraducao` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária que identifica o produto',
  `nomeProduto` varchar(70) NOT NULL COMMENT 'Atributo de nome do produto',
  `descricao` mediumtext NOT NULL COMMENT 'atributo de descrição do produto',
  `idProduto` int(11) NOT NULL,
  `codigo_idioma` varchar(10) NOT NULL,
  PRIMARY KEY (`idTraducao`),
  KEY `fk_produto_traducao_idx` (`idProduto`),
  KEY `fk_produto_idioma_idx` (`codigo_idioma`),
  CONSTRAINT `fk_produto_idioma` FOREIGN KEY (`codigo_idioma`) REFERENCES `idioma` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_traducao` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_traducao`
--

LOCK TABLES `produto_traducao` WRITE;
/*!40000 ALTER TABLE `produto_traducao` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_traducao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtoavaliacao`
--

DROP TABLE IF EXISTS `produtoavaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produtoavaliacao` (
  `idProdutoAvaliacao` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária que identifca o produto em avaliação.',
  `nomeProduto` varchar(50) NOT NULL COMMENT 'Atributo que armazena o nome do produto em avaliação.',
  `descricao` mediumtext NOT NULL COMMENT 'Atributo da descrição do produto em avaliação.',
  `preco` float NOT NULL COMMENT 'Atributo que armazena o valor de um produto.',
  `classificacao` char(1) NOT NULL,
  `idMarca` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica e relaciona o produto em avaliação com uma marca.',
  `idCategoria` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica e relaciona o produto em avaliação com uma categoria.',
  `idCor` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica e relaciona o produto em avaliação com uma cor.',
  `idTamanho` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica e relaciona o produto em avaliação com um tamanho.',
  `naturezaProduto` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`idProdutoAvaliacao`),
  KEY `fk_produto_marca_idx` (`idMarca`),
  KEY `fk_produto_categoria_idx` (`idCategoria`),
  KEY `fk_produto_cor_idx` (`idCor`),
  KEY `fk_produto_tamanho_idx` (`idTamanho`),
  CONSTRAINT `fk_produtoAvaliaxao_categoria` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_produtoAvaliaxao_cor` FOREIGN KEY (`idCor`) REFERENCES `corroupa` (`idCor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_produtoAvaliaxao_marca` FOREIGN KEY (`idMarca`) REFERENCES `marca` (`idMarca`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_produtoAvaliaxao_tamanho` FOREIGN KEY (`idTamanho`) REFERENCES `tamanho` (`idTamanho`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtoavaliacao`
--

LOCK TABLES `produtoavaliacao` WRITE;
/*!40000 ALTER TABLE `produtoavaliacao` DISABLE KEYS */;
INSERT INTO `produtoavaliacao` VALUES (5,'Produto Avaliado 3',' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eget tellus vitae diam dapibus scelerisque. Morbi hendrerit at eros ac blandit. Fusce sed tristique sapien, in varius ligula. In malesuada dolor ac turpis pulvinar, vel pretium dolor dapibus. Suspendisse molestie enim non elit vestibulum, a suscipit justo rhoncus. ',150,'B',1,1,1,1,'2'),(9,'teste','asdasdsa',121,'A',1,1,1,1,'2');
/*!40000 ALTER TABLE `produtoavaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtoavaliacao_fotoproduto`
--

DROP TABLE IF EXISTS `produtoavaliacao_fotoproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produtoavaliacao_fotoproduto` (
  `idProdutoAvaliacao` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica o produto em avaliação e o relaciona com uma foto de produto.',
  `idImagemProduto` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica uma foto e a relaciona com um produto em avaliação.',
  KEY `fk_produtoAvaliacao_has_fortoProduto_fortoProduto1_idx` (`idImagemProduto`),
  KEY `fk_produtoAvaliacao_has_fortoProduto_produtoAvaliacao1_idx` (`idProdutoAvaliacao`),
  CONSTRAINT `fk_fortoProduto_produtoAvaliacao` FOREIGN KEY (`idImagemProduto`) REFERENCES `fotoproduto` (`idImagemProduto`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_produtoAvaliacao_fortoProduto` FOREIGN KEY (`idProdutoAvaliacao`) REFERENCES `produtoavaliacao` (`idProdutoAvaliacao`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtoavaliacao_fotoproduto`
--

LOCK TABLES `produtoavaliacao_fotoproduto` WRITE;
/*!40000 ALTER TABLE `produtoavaliacao_fotoproduto` DISABLE KEYS */;
INSERT INTO `produtoavaliacao_fotoproduto` VALUES (5,28),(5,29),(5,30),(9,119),(9,120),(9,121);
/*!40000 ALTER TABLE `produtoavaliacao_fotoproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promocao`
--

DROP TABLE IF EXISTS `promocao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promocao` (
  `idPromocao` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primaria que identifica a promoção.',
  `percentualDesconto` int(11) DEFAULT '0' COMMENT 'Atributo que armazena a porcentagem que um produto terá de desconto.',
  `idProduto` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica o produto.',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Atrbiuto que identifica se este item está ativo ou não.',
  `dataInicial` date DEFAULT NULL,
  `dataFinal` date DEFAULT NULL,
  PRIMARY KEY (`idPromocao`),
  KEY `fk_promocao_produto_idx` (`idProduto`),
  CONSTRAINT `fk_promocao_produto` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocao`
--

LOCK TABLES `promocao` WRITE;
/*!40000 ALTER TABLE `promocao` DISABLE KEYS */;
INSERT INTO `promocao` VALUES (1,20,1,1,'2018-10-22','2018-10-25');
/*!40000 ALTER TABLE `promocao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retirada`
--

DROP TABLE IF EXISTS `retirada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `retirada` (
  `idRetirada` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária que identifica a retirada.',
  `dataRetirada` date NOT NULL COMMENT 'Atributo que armazena a data que ocorrerá uma retirada.',
  `idUnidade` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica e relaciona uma retirada com uma loja/unidade.',
  `idPedido` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica e relaciona uma retirada com um pedido.',
  PRIMARY KEY (`idRetirada`),
  KEY `fk_retirada_pedido_idx` (`idPedido`),
  KEY `fk_retirada_unidade_idx` (`idUnidade`),
  CONSTRAINT `fk_retirada_pedido` FOREIGN KEY (`idPedido`) REFERENCES `pedidovenda` (`idPedidoVenda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_retirada_unidade` FOREIGN KEY (`idUnidade`) REFERENCES `nossaloja_unidade` (`idUnidade`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retirada`
--

LOCK TABLES `retirada` WRITE;
/*!40000 ALTER TABLE `retirada` DISABLE KEYS */;
INSERT INTO `retirada` VALUES (1,'2018-10-22',6,1),(2,'2018-10-30',6,1);
/*!40000 ALTER TABLE `retirada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slider`
--

DROP TABLE IF EXISTS `slider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slider` (
  `idSlider` int(11) NOT NULL AUTO_INCREMENT,
  `caminhoImagem` varchar(255) NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idSlider`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slider`
--

LOCK TABLES `slider` WRITE;
/*!40000 ALTER TABLE `slider` DISABLE KEYS */;
INSERT INTO `slider` VALUES (1,'def1d00c23aff97d3c654edb55973137slider.jpg',1),(2,'d61b3d9bc346af0552b790aaa1399b25slide2.jpg',1),(3,'23493bb5ff17969969c74d3bbcb148a7slide3.jpg',1),(4,'b0bffc2f1bbc61db6e8358d75fb14213pexels-photo-264554.jpeg',0);
/*!40000 ALTER TABLE `slider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sobre`
--

DROP TABLE IF EXISTS `sobre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sobre` (
  `idSobre` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador do registro da pagina sobre',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Atrbiuto que identifica se este item está ativo ou não.',
  `titulo` varchar(255) NOT NULL,
  `descricao` mediumtext NOT NULL,
  `descricao2` mediumtext,
  `imagem` varchar(255) NOT NULL,
  `tipoLayout` varchar(1) NOT NULL,
  PRIMARY KEY (`idSobre`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sobre`
--

LOCK TABLES `sobre` WRITE;
/*!40000 ALTER TABLE `sobre` DISABLE KEYS */;
INSERT INTO `sobre` VALUES (2,1,'Titulo do Layout 1',' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eget tellus vitae diam dapibus scelerisque. Morbi hendrerit at eros ac blandit. Fusce sed tristique sapien, in varius ligula. In malesuada dolor ac turpis pulvinar, vel pretium dolor dapibus. Suspendisse molestie enim non elit vestibulum, a suscipit justo rhoncus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed ipsum justo, congue non quam nec, tincidunt venenatis justo. Curabitur tempor arcu elementum metus maximus interdum. ',NULL,'d233dda89a2fc8320e115e164642ad30sobre_dois.jpg','1'),(5,1,'Titulo do Layout 2',' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eget tellus vitae diam dapibus scelerisque. Morbi hendrerit at eros ac blandit. Fusce sed tristique sapien, in varius ligula. In malesuada dolor ac turpis pulvinar, vel pretium dolor dapibus. Suspendisse molestie enim non elit vestibulum, a suscipit justo rhoncus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed ipsum justo, congue non quam nec, tincidunt venenatis justo. Curabitur tempor arcu elementum metus maximus interdum. ',' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eget tellus vitae diam dapibus scelerisque. Morbi hendrerit at eros ac blandit. Fusce sed tristique sapien, in varius ligula. In malesuada dolor ac turpis pulvinar, vel pretium dolor dapibus. Suspendisse molestie enim non elit vestibulum, a suscipit justo rhoncus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed ipsum justo, congue non quam nec, tincidunt venenatis justo. Curabitur tempor arcu elementum metus maximus interdum. ','19fcd7037ee621e4deb5804bbd8b1eb7sobre_dois.jpg','2'),(7,0,'sadasda','sadsadas',NULL,'1fc7cc3d7d0ca07f9ee683f4e8e0ac76boy.png','1');
/*!40000 ALTER TABLE `sobre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sobre_traducao`
--

DROP TABLE IF EXISTS `sobre_traducao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sobre_traducao` (
  `idTraducao` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador do registro da pagina sobre',
  `titulo` varchar(255) NOT NULL,
  `descricao` mediumtext NOT NULL,
  `descricao2` mediumtext,
  `codigo_idioma` varchar(10) NOT NULL,
  `idSobre` int(11) NOT NULL,
  PRIMARY KEY (`idTraducao`),
  KEY `fk_sobre_idioma_idx` (`codigo_idioma`),
  KEY `fk_traducao_sobre_idx` (`idSobre`),
  CONSTRAINT `fk_sobre_idioma` FOREIGN KEY (`codigo_idioma`) REFERENCES `idioma` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_traducao_sobre` FOREIGN KEY (`idSobre`) REFERENCES `sobre` (`idSobre`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sobre_traducao`
--

LOCK TABLES `sobre_traducao` WRITE;
/*!40000 ALTER TABLE `sobre_traducao` DISABLE KEYS */;
INSERT INTO `sobre_traducao` VALUES (2,'asdsadsadsa','sadsadsa',NULL,'en',7);
/*!40000 ALTER TABLE `sobre_traducao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statusconsignacao`
--

DROP TABLE IF EXISTS `statusconsignacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statusconsignacao` (
  `idStatus` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária que identifica o status.',
  `status` varchar(45) NOT NULL COMMENT 'Atributo que armazena o nome do status.',
  PRIMARY KEY (`idStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statusconsignacao`
--

LOCK TABLES `statusconsignacao` WRITE;
/*!40000 ALTER TABLE `statusconsignacao` DISABLE KEYS */;
INSERT INTO `statusconsignacao` VALUES (1,'aguardando pagamento'),(2,'concluído'),(3,'expirado');
/*!40000 ALTER TABLE `statusconsignacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategoria`
--

DROP TABLE IF EXISTS `subcategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcategoria` (
  `idSubcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `genero` varchar(1) NOT NULL,
  PRIMARY KEY (`idSubcategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategoria`
--

LOCK TABLES `subcategoria` WRITE;
/*!40000 ALTER TABLE `subcategoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `subcategoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tamanho`
--

DROP TABLE IF EXISTS `tamanho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tamanho` (
  `idTamanho` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária que identifica o tamanho de roupa',
  `tamanho` varchar(5) NOT NULL COMMENT 'Atributo que armazena o tamanho de roupa.',
  `idTipoTamanho` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica e relaciona o tamanho com o tipo de tamanho.',
  PRIMARY KEY (`idTamanho`),
  KEY `fk_tamanho_tipoTamanho1_idx` (`idTipoTamanho`),
  CONSTRAINT `fk_tamanho_tipoTamanho` FOREIGN KEY (`idTipoTamanho`) REFERENCES `tipotamanho` (`idTipoTamanho`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tamanho`
--

LOCK TABLES `tamanho` WRITE;
/*!40000 ALTER TABLE `tamanho` DISABLE KEYS */;
INSERT INTO `tamanho` VALUES (1,'P',1),(2,'M',1),(3,'G',1),(4,'GG',1),(5,'XGG',1),(16,'1',2),(17,'2',2),(18,'3',2),(19,'4',2),(20,'36',2),(21,'38',2),(22,'40',2),(23,'42',2),(24,'44',2),(25,'46',2),(26,'48',2),(27,'50',2),(28,'52',2);
/*!40000 ALTER TABLE `tamanho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tela`
--

DROP TABLE IF EXISTS `tela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tela` (
  `idTela` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária que identifica a tela',
  `nomeTela` varchar(45) NOT NULL COMMENT 'Atributo de nome da tela',
  PRIMARY KEY (`idTela`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tela`
--

LOCK TABLES `tela` WRITE;
/*!40000 ALTER TABLE `tela` DISABLE KEYS */;
INSERT INTO `tela` VALUES (1,'usuario'),(2,'nivel'),(3,'unidade'),(4,'enquete'),(5,'sobre'),(6,'evento'),(7,'slider'),(8,'faleconosco'),(9,'avaliação'),(10,'roupa'),(11,'promoção'),(12,'retiradas'),(13,'temas'),(14,'cores'),(15,'consignação');
/*!40000 ALTER TABLE `tela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temaenquete`
--

DROP TABLE IF EXISTS `temaenquete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temaenquete` (
  `idTema` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária que identifica o tema de uma enquete.',
  `tema` varchar(50) NOT NULL COMMENT 'Atributo que armazena o nome de um tema de enquete.',
  PRIMARY KEY (`idTema`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temaenquete`
--

LOCK TABLES `temaenquete` WRITE;
/*!40000 ALTER TABLE `temaenquete` DISABLE KEYS */;
INSERT INTO `temaenquete` VALUES (1,'produtos'),(2,'site');
/*!40000 ALTER TABLE `temaenquete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temasite`
--

DROP TABLE IF EXISTS `temasite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temasite` (
  `idTema` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primaria que identifica o tema do site',
  `nomeTema` varchar(45) NOT NULL COMMENT 'Atributo de nome do tema',
  `corTema` varchar(7) NOT NULL COMMENT 'Atributo que armazena-se a cor do tema',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Atributo de status do tema, mostra quando está ativo ou não',
  `genero` varchar(1) NOT NULL,
  PRIMARY KEY (`idTema`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temasite`
--

LOCK TABLES `temasite` WRITE;
/*!40000 ALTER TABLE `temasite` DISABLE KEYS */;
INSERT INTO `temasite` VALUES (1,'Tema Roxo','#8000ff',1,'M'),(2,'Salmão','#ff8080',1,'F'),(3,'Preto','#000000',0,'M');
/*!40000 ALTER TABLE `temasite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipotamanho`
--

DROP TABLE IF EXISTS `tipotamanho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipotamanho` (
  `idTipoTamanho` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária que identifica o tipo de tamanho',
  `tipoTamanho` varchar(25) NOT NULL COMMENT 'Atributo que armazena o tipo de tamanho',
  PRIMARY KEY (`idTipoTamanho`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipotamanho`
--

LOCK TABLES `tipotamanho` WRITE;
/*!40000 ALTER TABLE `tipotamanho` DISABLE KEYS */;
INSERT INTO `tipotamanho` VALUES (1,'medida'),(2,'numero');
/*!40000 ALTER TABLE `tipotamanho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidade_endereco`
--

DROP TABLE IF EXISTS `unidade_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidade_endereco` (
  `idUnidade` int(11) NOT NULL,
  `idEndereco` int(11) NOT NULL,
  KEY `fk_endereco_unidade_idx` (`idUnidade`),
  KEY `fk_unidade_endereco_idx` (`idEndereco`),
  CONSTRAINT `fk_endereco_unidade` FOREIGN KEY (`idUnidade`) REFERENCES `nossaloja_unidade` (`idUnidade`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_unidade_endereco` FOREIGN KEY (`idEndereco`) REFERENCES `endereco` (`idEndereco`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidade_endereco`
--

LOCK TABLES `unidade_endereco` WRITE;
/*!40000 ALTER TABLE `unidade_endereco` DISABLE KEYS */;
INSERT INTO `unidade_endereco` VALUES (7,8),(8,15);
/*!40000 ALTER TABLE `unidade_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuariocms`
--

DROP TABLE IF EXISTS `usuariocms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuariocms` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária que identifica o usuário',
  `nomeUsuario` varchar(45) NOT NULL COMMENT 'Atributo que armazena o nome do usuário',
  `login` varchar(13) NOT NULL COMMENT 'Atributo de login, usado para entrar no sistema',
  `senha` varchar(50) NOT NULL COMMENT 'Atributo de senha do usuário',
  `imagem` varchar(255) DEFAULT NULL COMMENT 'Atributo que armazena o caminho da foto do usuário.',
  `idNivel` int(11) NOT NULL COMMENT 'Chave estrangeira que identifica o nive que aquele usuário pertence.',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Atributo que mostra se este registro está ativo ou não.',
  PRIMARY KEY (`idUsuario`),
  KEY `fk_usuario_nivel_idx` (`idNivel`),
  CONSTRAINT `fk_usuario_nivel` FOREIGN KEY (`idNivel`) REFERENCES `nivelusuario` (`idNivel`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuariocms`
--

LOCK TABLES `usuariocms` WRITE;
/*!40000 ALTER TABLE `usuariocms` DISABLE KEYS */;
INSERT INTO `usuariocms` VALUES (1,'administrador','admin','21232f297a57a5a743894a0e4a801fc3','9da98559952b59672d34bb3f1e0b91d9dress.png',1,1),(2,'Felipe','felipe','202cb962ac59075b964b07152d234b70',NULL,1,1),(3,'Teste Desktop','teste','123',NULL,1,1);
/*!40000 ALTER TABLE `usuariocms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `visualizar_promocao`
--

DROP TABLE IF EXISTS `visualizar_promocao`;
/*!50001 DROP VIEW IF EXISTS `visualizar_promocao`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `visualizar_promocao` AS SELECT 
 1 AS `idProduto`,
 1 AS `nomeProduto`,
 1 AS `preco`,
 1 AS `percentual`,
 1 AS `imagem`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `visualizar_promocao_id`
--

DROP TABLE IF EXISTS `visualizar_promocao_id`;
/*!50001 DROP VIEW IF EXISTS `visualizar_promocao_id`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `visualizar_promocao_id` AS SELECT 
 1 AS `idProduto`,
 1 AS `nomeProduto`,
 1 AS `descricao`,
 1 AS `preco`,
 1 AS `percentual`,
 1 AS `cor`,
 1 AS `marca`,
 1 AS `categoria`,
 1 AS `tamanho`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `visualizar_promocao`
--

/*!50001 DROP VIEW IF EXISTS `visualizar_promocao`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `visualizar_promocao` AS select `p`.`idProduto` AS `idProduto`,`p`.`nomeProduto` AS `nomeProduto`,`p`.`preco` AS `preco`,`pr`.`percentualDesconto` AS `percentual`,`f`.`caminhoImagem` AS `imagem`,(`p`.`preco` - ((`pr`.`percentualDesconto` / 100) * `p`.`preco`)) AS `total` from (((`produto` `p` join `promocao` `pr` on((`p`.`idProduto` = `pr`.`idProduto`))) join `produto_fotoproduto` `pf` on((`pf`.`idProduto` = `p`.`idProduto`))) join `fotoproduto` `f` on((`f`.`idImagemProduto` = `pf`.`idImagemProduto`))) group by `p`.`idProduto` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `visualizar_promocao_id`
--

/*!50001 DROP VIEW IF EXISTS `visualizar_promocao_id`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `visualizar_promocao_id` AS select `p`.`idProduto` AS `idProduto`,`p`.`nomeProduto` AS `nomeProduto`,`p`.`descricao` AS `descricao`,`p`.`preco` AS `preco`,`pr`.`percentualDesconto` AS `percentual`,`c`.`nome` AS `cor`,`m`.`nomeMarca` AS `marca`,`ct`.`nomeCategoria` AS `categoria`,`t`.`tamanho` AS `tamanho`,(`p`.`preco` - ((`pr`.`percentualDesconto` / 100) * `p`.`preco`)) AS `total` from (((((`produto` `p` join `promocao` `pr` on((`p`.`idProduto` = `pr`.`idProduto`))) join `corroupa` `c` on((`c`.`idCor` = `p`.`idCor`))) join `marca` `m` on((`m`.`idMarca` = `p`.`idMarca`))) join `categoria` `ct` on((`ct`.`idCategoria` = `p`.`idCategoria`))) join `tamanho` `t` on((`t`.`idTamanho` = `p`.`idTamanho`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-23 13:59:54

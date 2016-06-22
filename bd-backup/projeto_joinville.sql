-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 20-Jun-2016 às 14:17
-- Versão do servidor: 5.7.9
-- PHP Version: 5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;




-- --------------------------------------------------------

--
-- Estrutura da tabela `bairro`
--

DROP TABLE IF EXISTS `bairro`;
CREATE TABLE IF NOT EXISTS `bairro` (
  `idBairro` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `aid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idbairro`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `bairro`
--

INSERT INTO `bairro` (`idBairro`, `nome`, `aid`) VALUES
(1, 'Rio Bonito', 'rio-bonito'),
(2, 'Dona Francisca', 'dona-francisca'),
(3, 'Pirabeiraba Centro', 'pirabeiraba-cidade'),
(4, 'Zona Industrial Norte', 'z-ind-norte'),
(5, 'Jardim Sofia', 'j-sofia'),
(6, 'Jardim Paraiso', 'j-paraiso'),
(7, 'Costa e Silva', 'c-silva'),
(8, 'Vila Nova', 'vila-nova'),
(9, 'Vila Cubatao', 'vila-cubatao'),
(10, 'Itinga', 'itinga'),
(11, 'Santa Catarina', 'santa-catarina'),
(12, 'Morro do Meio', 'morro-meio'),
(13, 'Nova Brasilia', 'nova-brasilia'),
(14, 'Floresta', 'floresta'),
(15, 'Sao Marcos', 'sao-marcos'),
(16, 'Zona Tupy', 'z-tupy'),
(17, 'Comasa', 'comasa'),
(18, 'Bom Retiro', 'bom-retiro'),
(19, 'Santo Antonio', 'santo-antonio'),
(20, 'America', 'america'),
(21, 'Gloria', 'gloria'),
(22, 'Boehmerwald', 'boehmerwald'),
(23, 'Parque Guarani', 'parque-guarani'),
(24, 'Paranaguamirim', 'paranaguamirim'),
(25, 'Aventureiro', 'aventureiro'),
(26, 'Espinheiros', 'espinheiros'),
(27, 'Petropolis', 'petropolis'),
(28, 'Jardim Iririu', 'j-iririu'),
(29, 'Ulysses Guimaraes', 'ulysses-guimaraes'),
(30, 'Adhemar  Garcia', 'adhemar-garcia'),
(31, 'Boa Vista', 'boa-vista'),
(32, 'Iririu', 'iririu'),
(33, 'Saguacu', 'saguacu'),
(34, 'Jarivatuba', 'jarivatuba'),
(35, 'Itaum', 'itaum'),
(36, 'Fatima', 'fatima'),
(37, 'Guanabara', 'guanabara'),
(38, 'Bucarein', 'bucarein'),
(39, 'Anita Garibaldi', 'anita-garibaldi'),
(40, 'Atiradores', 'atiradores'),
(41, 'Centro', 'centro'),
(42, 'Profipo', 'profipo'),
(43, 'Joao Costa', 'joao-costa'),
(44, 'teste', 'teste');

-- --------------------------------------------------------

--
-- Estrutura da tabela `classe`
--

DROP TABLE IF EXISTS `classe`;
CREATE TABLE IF NOT EXISTS `classe` (
  `idClasse` int(11) NOT NULL AUTO_INCREMENT,
  `classe` varchar(45) NOT NULL,
  PRIMARY KEY (`idClasse`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `classe`
--

INSERT INTO `classe` (`idClasse`, `classe`) VALUES
(1, 'normal'),
(2, 'alert');

-- --------------------------------------------------------

--
-- Estrutura da tabela `historicocidade`
--

DROP TABLE IF EXISTS `historicoCidade`;
CREATE TABLE IF NOT EXISTS `historicoCidade` (
  `idHistoricoCidade` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  `dataIni` varchar(20) DEFAULT NULL,
  `dataFim` varchar(20) DEFAULT NULL,
  `idBairro` int(11) NOT NULL,
  `idClasse` int(11) NOT NULL,
  PRIMARY KEY (`idHistoricoCidade`,`idBairro`,`idClasse`),
  KEY `FK_historicoCidade_Bairro` (`idBairro`),
  KEY `FK_historicoCidade_Classe` (`idClasse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `statusCidade`
--

DROP TABLE IF EXISTS `statusCidade`;
CREATE TABLE IF NOT EXISTS `statusCidade` (
  `idStatusCidade` int(11) NOT NULL AUTO_INCREMENT,
  `idBairro` int(11) NOT NULL,
  `idClasse` int(11) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `dataIni` varchar(20) DEFAULT NULL,
  `dataFim` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idStatusCidade`,`idBairro`,`idClasse`),
  KEY `FK_statusCidade_Bairro1_idx` (`idBairro`),
  KEY `FK_statusCidade_Classe1_idx` (`idClasse`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `statuscidade`
--

INSERT INTO `statusCidade` (`idStatusCidade`, `idBairro`, `idClasse`, `descricao`, `dataIni`, `dataFim`) VALUES
(1, 1, 2, 'Vazamento SuÃ­Ã§os', '2016-01-27T13:10', '2016-01-27T17:00'),
(2, 2, 1, 'Parada ETA CubatÃ£o', '2016-01-01T10:10', '2016-01-02T10:10'),
(3, 3, 2, 'Vazamento SuÃ­Ã§os', '2016-01-27T13:10', '2016-01-27T17:00'),
(4, 4, 2, 'Vazamento SuÃ­Ã§os', '2016-01-27T13:10', '2016-01-27T17:00'),
(5, 5, 1, 'Parada ETA CubatÃ£o', '2016-01-01T10:10', '2016-01-02T10:10'),
(6, 6, 1, 'Parada ETA CubatÃ£o', '2016-01-01T10:10', '2016-01-02T10:10'),
(7, 7, 1, NULL, NULL, NULL),
(8, 8, 1, 'Vazamento SuÃ­Ã§os', '2016-01-27T13:10', '2016-01-27T17:00'),
(9, 9, 1, 'Parada ETA CubatÃ£o', '2016-01-01T10:10', '2016-01-02T10:10'),
(10, 10, 2, 'ManutenÃ§Ã£o VRV Araquari', '2016-01-27T08:00', '2016-01-27T18:00'),
(11, 11, 1, NULL, NULL, NULL),
(12, 12, 1, NULL, NULL, NULL),
(13, 13, 1, NULL, NULL, NULL),
(14, 14, 1, NULL, NULL, NULL),
(15, 15, 1, NULL, NULL, NULL),
(16, 16, 1, NULL, NULL, NULL),
(17, 17, 1, 'Parada ETA CubatÃ£o', '2016-01-01T10:10', '2016-01-02T10:10'),
(18, 18, 1, 'Parada ETA CubatÃ£o', '2016-01-01T10:10', '2016-01-02T10:10'),
(19, 19, 1, NULL, NULL, NULL),
(20, 20, 1, NULL, NULL, NULL),
(21, 21, 1, NULL, NULL, NULL),
(22, 22, 1, NULL, NULL, NULL),
(23, 23, 1, NULL, NULL, NULL),
(24, 24, 1, NULL, NULL, NULL),
(25, 25, 1, 'Parada ETA CubatÃ£o', '2016-01-01T10:10', '2016-01-02T10:10'),
(26, 26, 1, 'Parada ETA CubatÃ£o', '2016-01-01T10:10', '2016-01-02T10:10'),
(27, 27, 1, NULL, NULL, NULL),
(28, 28, 1, 'Parada ETA CubatÃ£o', '2016-01-01T10:10', '2016-01-02T10:10'),
(29, 29, 1, NULL, NULL, NULL),
(30, 30, 1, NULL, NULL, NULL),
(31, 31, 1, NULL, NULL, NULL),
(32, 32, 1, 'Parada ETA CubatÃ£o', '2016-01-01T10:10', '2016-01-02T10:10'),
(33, 33, 1, NULL, NULL, NULL),
(34, 34, 1, NULL, NULL, NULL),
(35, 35, 1, NULL, NULL, NULL),
(36, 36, 1, NULL, NULL, NULL),
(37, 37, 1, NULL, NULL, NULL),
(38, 38, 1, NULL, NULL, NULL),
(39, 39, 1, NULL, NULL, NULL),
(40, 40, 1, NULL, NULL, NULL),
(41, 41, 1, NULL, NULL, NULL),
(42, 42, 1, NULL, NULL, NULL),
(43, 43, 1, NULL, NULL, NULL),
(44, 44, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `statuscidadeprogramado`
--

DROP TABLE IF EXISTS `statusCidadeProgramado`;
CREATE TABLE IF NOT EXISTS `statusCidadeProgramado` (
  `idStatusCidadeProgramado` int(11) NOT NULL AUTO_INCREMENT,
  `idBairro` int(11) NOT NULL,
  `idClasse` int(11) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `dataIni` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idStatusCidadeProgramado`,`idBairro`,`idClasse`),
  KEY `FK_statusCidadeProgramado_Bairro` (`idBairro`),
  KEY `FK_statusCidadeProgramado_Classe` (`idClasse`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `statuscidadeprogramado`
--

INSERT INTO `statusCidadeProgramado` (`idStatusCidadeProgramado`, `idBairro`, `idClasse`, `descricao`, `dataIni`) VALUES
(1, 1, 1, 'ManutenÃ§Ã£o SuÃ­Ã§os\nmanutenÃ§Ã£o Santos Dumont x Tuiuti', '2016-01-29T08:00'),
(2, 2, 1, NULL, NULL),
(3, 3, 1, NULL, NULL),
(4, 4, 1, NULL, NULL),
(5, 5, 1, NULL, NULL),
(6, 6, 2, NULL, NULL),
(7, 7, 1, NULL, NULL),
(8, 8, 2, NULL, NULL),
(9, 9, 2, NULL, NULL),
(10, 10, 1, NULL, NULL),
(11, 11, 1, NULL, NULL),
(12, 12, 1, NULL, NULL),
(13, 13, 1, NULL, NULL),
(14, 14, 1, NULL, NULL),
(15, 15, 1, NULL, NULL),
(16, 16, 1, NULL, NULL),
(17, 17, 1, NULL, NULL),
(18, 18, 1, NULL, NULL),
(19, 19, 1, NULL, NULL),
(20, 20, 1, NULL, NULL),
(21, 21, 1, NULL, NULL),
(22, 22, 1, NULL, NULL),
(23, 23, 1, NULL, NULL),
(24, 24, 1, NULL, NULL),
(25, 25, 2, NULL, NULL),
(26, 26, 1, NULL, NULL),
(27, 27, 1, NULL, NULL),
(28, 28, 1, NULL, NULL),
(29, 29, 1, NULL, NULL),
(30, 30, 1, NULL, NULL),
(31, 31, 1, NULL, NULL),
(32, 32, 1, NULL, NULL),
(33, 33, 1, NULL, NULL),
(34, 34, 1, NULL, NULL),
(35, 35, 1, NULL, NULL),
(36, 36, 1, NULL, NULL),
(37, 37, 1, NULL, NULL),
(38, 38, 1, NULL, NULL),
(39, 39, 1, NULL, NULL),
(40, 40, 1, NULL, NULL),
(41, 41, 1, NULL, NULL),
(42, 42, 1, NULL, NULL),
(43, 43, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `passWord` varchar(45) NOT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `userName` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idusuario`, `username`, `email`, `password`, `nome`) VALUES
(1, 'administrador', 'administrador.comunicaj@aguasdejoinville.com.br', '123', 'Administrador');


--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `historicocidade`
--
ALTER TABLE `historicoCidade`
  ADD CONSTRAINT `FK_historicoCidade_bairro` FOREIGN KEY (`idBairro`) REFERENCES `bairro` (`idBairro`),
  ADD CONSTRAINT `FK_historicoCidade_classe` FOREIGN KEY (`idClasse`) REFERENCES `classe` (`idClasse`);

--
-- Limitadores para a tabela `statusCidade`
--
ALTER TABLE `statusCidade`
  ADD CONSTRAINT `FK_statusCidade_Bairro` FOREIGN KEY (`idBairro`) REFERENCES `bairro` (`idBairro`),
  ADD CONSTRAINT `FK_statusCidade_Classe` FOREIGN KEY (`idClasse`) REFERENCES `classe` (`idClasse`);

--
-- Limitadores para a tabela `statuscidadeprogramado`
--
ALTER TABLE `statusCidadeProgramado`
  ADD CONSTRAINT `FK_statusCidadeProgramado_Bairro` FOREIGN KEY (`idBairro`) REFERENCES `bairro` (`idBairro`),
  ADD CONSTRAINT `FK_statusCidadeProgramado_Classe` FOREIGN KEY (`idClasse`) REFERENCES `classe` (`idClasse`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

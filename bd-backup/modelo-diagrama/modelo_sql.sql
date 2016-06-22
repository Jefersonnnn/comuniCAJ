-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 18-Jan-2016 às 10:35
-- Versão do servidor: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `projeto_joinville`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `bairro`
--

CREATE TABLE IF NOT EXISTS `bairro` (
  `idbairro` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `aid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idbairro`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=45 ;

--
-- Extraindo dados da tabela `bairro`
--

INSERT INTO `bairro` (`idbairro`, `nome`, `aid`) VALUES
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

CREATE TABLE IF NOT EXISTS `classe` (
  `idclasse` int(11) NOT NULL AUTO_INCREMENT,
  `classe` varchar(45) NOT NULL,
  PRIMARY KEY (`idclasse`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `classe`
--

INSERT INTO `classe` (`idclasse`, `classe`) VALUES
(1, 'normal'),
(2, 'alert');

-- --------------------------------------------------------

--
-- Estrutura da tabela `historicocidade`
--

CREATE TABLE IF NOT EXISTS `historicocidade` (
  `idhistoricoCidade` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  `data_ini` varchar(20) DEFAULT NULL,
  `data_fim` varchar(20) DEFAULT NULL,
  `bairro_idbairro` int(11) NOT NULL,
  `classe_idclasse` int(11) NOT NULL,
  PRIMARY KEY (`idhistoricoCidade`,`bairro_idbairro`,`classe_idclasse`),
  KEY `fk_historicoCidade_bairro_idx` (`bairro_idbairro`),
  KEY `fk_historicoCidade_classe1_idx` (`classe_idclasse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `statuscidade`
--

CREATE TABLE IF NOT EXISTS `statuscidade` (
  `idstatusCidade` int(11) NOT NULL AUTO_INCREMENT,
  `bairro_idbairro` int(11) NOT NULL,
  `classe_idclasse` int(11) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `data_ini` varchar(20) DEFAULT NULL,
  `data_fim` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idstatusCidade`,`bairro_idbairro`,`classe_idclasse`),
  KEY `fk_statusCidade_bairro1_idx` (`bairro_idbairro`),
  KEY `fk_statusCidade_classe1_idx` (`classe_idclasse`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=45 ;

--
-- Extraindo dados da tabela `statuscidade`
--

INSERT INTO `statuscidade` (`idstatusCidade`, `bairro_idbairro`, `classe_idclasse`, `descricao`, `data_ini`, `data_fim`) VALUES
(1, 1, 2, 'Vazamento', '2016-01-01T10:10', '2016-01-01T15:15'),
(2, 2, 1, NULL, NULL, NULL),
(3, 3, 2, 'Melhoria na rede Olavo Bilac', '2016-01-27T12:00', '2016-01-28T12:01'),
(4, 4, 1, NULL, NULL, NULL),
(5, 5, 1, NULL, NULL, NULL),
(6, 6, 1, NULL, NULL, NULL),
(7, 7, 1, NULL, NULL, NULL),
(8, 8, 1, NULL, NULL, NULL),
(9, 9, 1, NULL, NULL, NULL),
(10, 10, 1, NULL, NULL, NULL),
(11, 11, 1, NULL, NULL, NULL),
(12, 12, 1, NULL, NULL, NULL),
(13, 13, 1, NULL, NULL, NULL),
(14, 14, 1, NULL, NULL, NULL),
(15, 15, 1, NULL, NULL, NULL),
(16, 16, 1, NULL, NULL, NULL),
(17, 17, 1, NULL, NULL, NULL),
(18, 18, 1, NULL, NULL, NULL),
(19, 19, 1, NULL, NULL, NULL),
(20, 20, 1, NULL, NULL, NULL),
(21, 21, 1, NULL, NULL, NULL),
(22, 22, 1, NULL, NULL, NULL),
(23, 23, 1, NULL, NULL, NULL),
(24, 24, 1, NULL, NULL, NULL),
(25, 25, 1, NULL, NULL, NULL),
(26, 26, 1, NULL, NULL, NULL),
(27, 27, 1, NULL, NULL, NULL),
(28, 28, 1, NULL, NULL, NULL),
(29, 29, 1, NULL, NULL, NULL),
(30, 30, 1, NULL, NULL, NULL),
(31, 31, 1, NULL, NULL, NULL),
(32, 32, 1, NULL, NULL, NULL),
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

CREATE TABLE IF NOT EXISTS `statuscidadeprogramado` (
  `idstatusCidadeProgramado` int(11) NOT NULL AUTO_INCREMENT,
  `bairro_idbairro` int(11) NOT NULL,
  `classe_idclasse` int(11) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `data_ini` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idstatusCidadeProgramado`,`bairro_idbairro`,`classe_idclasse`),
  KEY `fk_statusCidade_bairro1_idx` (`bairro_idbairro`),
  KEY `fk_statusCidade_classe1_idx` (`classe_idclasse`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- Extraindo dados da tabela `statuscidadeprogramado`
--

INSERT INTO `statuscidadeprogramado` (`idstatusCidadeProgramado`, `bairro_idbairro`, `classe_idclasse`, `descricao`, `data_ini`) VALUES
(1, 1, 2, 'Parada ETA CubatÃ£o', '2016-01-30T20:20'),
(2, 2, 1, NULL, NULL),
(3, 3, 2, NULL, NULL),
(4, 4, 1, NULL, NULL),
(5, 5, 1, NULL, NULL),
(6, 6, 1, NULL, NULL),
(7, 7, 1, NULL, NULL),
(8, 8, 1, NULL, NULL),
(9, 9, 1, NULL, NULL),
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
(25, 25, 1, NULL, NULL),
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

CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idusuario`, `username`, `email`, `password`, `nome`) VALUES
(1, 'Jeferson', 'jeferson.machado@aguasdejoinville.com.br', '123', 'Jeferson Machado');

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `historicocidade`
--
ALTER TABLE `historicocidade`
  ADD CONSTRAINT `fk_historicoCidade_bairro` FOREIGN KEY (`bairro_idbairro`) REFERENCES `bairro` (`idbairro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_historicoCidade_classe1` FOREIGN KEY (`classe_idclasse`) REFERENCES `classe` (`idclasse`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `statuscidade`
--
ALTER TABLE `statuscidade`
  ADD CONSTRAINT `fk_statusCidade_bairro1` FOREIGN KEY (`bairro_idbairro`) REFERENCES `bairro` (`idbairro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_statusCidade_classe1` FOREIGN KEY (`classe_idclasse`) REFERENCES `classe` (`idclasse`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `statuscidadeprogramado`
--
ALTER TABLE `statuscidadeprogramado`
  ADD CONSTRAINT `fk_statusCidade_bairro10` FOREIGN KEY (`bairro_idbairro`) REFERENCES `bairro` (`idbairro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_statusCidade_classe10` FOREIGN KEY (`classe_idclasse`) REFERENCES `classe` (`idclasse`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 12-Jan-2016 às 20:01
-- Versão do servidor: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `projeto-joinville`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidade`
--

CREATE TABLE IF NOT EXISTS `cidade` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `classe` varchar(20) DEFAULT NULL,
  `aid` varchar(20) NOT NULL,
  `descricao` text,
  `data_ini` varchar(20) DEFAULT NULL,
  `data_fim` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

--
-- Extraindo dados da tabela `cidade`
--

INSERT INTO `cidade` (`id`, `nome`, `classe`, `aid`, `descricao`, `data_ini`, `data_fim`) VALUES
(1, 'Rio Bonito', 'alert', 'rio-bonito', 'Vazamento 200mm', '2016-01-25T10:15', '2016-01-27T20:20'),
(2, 'Pirabeiraba Serra', 'normal', 'pirabeiraba-serra', 'Vazamento na SC-301', '2015-1', '2015-12-08'),
(3, 'Pirabeiraba Cidade', 'alert', 'pirabeiraba-cidade', 'vazamento', '2016-01-04T10:10', '2016-01-05T23:29'),
(4, 'Zona Industrial Norte', 'normal', 'z-ind-norte', 'Vazamento 200mm', '2016-01-05T15:00', '2016-01-05T18:00'),
(5, 'Jardim Sofia', 'normal', 'j-sofia', NULL, NULL, NULL),
(6, 'Jardim Paraiso', 'normal', 'j-paraiso', 'teste', '', ''),
(7, 'Costa e Silva', 'normal', 'c-silva', 'Vazamento 200mm Rua Inambu', '2016-01-05T15:00', '2016-01-05T18:00'),
(8, 'Vila Nova', 'normal', 'vila-nova', NULL, NULL, NULL),
(9, 'Vila Cubatao', 'normal', 'vila_cubatao', NULL, NULL, NULL),
(10, 'Itinga', 'normal', 'itinga', NULL, NULL, NULL),
(11, 'Santa Catarina', 'normal', 'santa-catarina', NULL, NULL, NULL),
(12, 'Morro do Meio', 'normal', 'morro-meio', NULL, NULL, NULL),
(13, 'Nova Brasilia', 'normal', 'nova-brasilia', NULL, NULL, NULL),
(14, 'Floresta', 'normal', 'floresta', NULL, NULL, NULL),
(15, 'Sao Marcos', 'normal', 'sao-marcos', NULL, NULL, NULL),
(16, 'Zona Tupy', 'normal', 'z-tupy', NULL, NULL, NULL),
(17, 'Comasa', 'normal', 'comasa', NULL, NULL, NULL),
(18, 'Bom Retiro', 'normal', 'bom-retiro', NULL, NULL, NULL),
(19, 'Santo Antonio', 'normal', 'santo-antonio', NULL, NULL, NULL),
(20, 'America', 'normal', 'america', NULL, NULL, NULL),
(21, 'Gloria', 'normal', 'gloria', NULL, NULL, NULL),
(22, 'Boehmerwald', 'normal', 'boehmerwald', NULL, NULL, NULL),
(23, 'Parque Guarani', 'normal', 'parque-guarani', NULL, NULL, NULL),
(24, 'Paranaguamirim', 'normal', 'paranaguamirim', NULL, NULL, NULL),
(25, 'Aventureiro', 'normal', 'aventureiro', 'seila', '2016-0', '2016-01-12'),
(26, 'Espinheiros', 'normal', 'espinheiros', NULL, NULL, NULL),
(27, 'Petropolis', 'normal', 'petropolis', NULL, NULL, NULL),
(29, 'Rio Velho', 'normal', 'rio-velho', NULL, NULL, NULL),
(30, 'Adhemar  Garcia', 'normal', 'adhemar-garcia', NULL, NULL, NULL),
(31, 'Boa Vista', 'normal', 'boa-vista', NULL, NULL, NULL),
(32, 'Iririu', 'normal', 'iririu', NULL, NULL, NULL),
(33, 'Saguacu', 'normal', 'saguacu', '', NULL, NULL),
(34, 'Jarivatuba', 'normal', 'jarivatuba', NULL, NULL, NULL),
(35, 'Itaum', 'normal', 'itaum', NULL, NULL, NULL),
(36, 'Fatima', 'normal', 'fatima', 'Vazamento...', '2016-01-07T07:00', '2016-01-08T18:00'),
(37, 'Guanabara', 'normal', 'guanabara', NULL, NULL, NULL),
(38, 'Bucarein', 'normal', 'bucarein', NULL, NULL, NULL),
(39, 'Anita Garibaldi', 'normal', 'anita-garibaldi', NULL, NULL, NULL),
(40, 'Atiradores', 'normal', 'atiradores', NULL, NULL, NULL),
(41, 'Centro', 'normal', 'centro', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidadeparadaprogramada`
--

CREATE TABLE IF NOT EXISTS `cidadeparadaprogramada` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `aid` varchar(20) NOT NULL,
  `classe` varchar(10) NOT NULL,
  `data_fim` varchar(20) DEFAULT NULL,
  `data_ini` varchar(20) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `nome` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

--
-- Extraindo dados da tabela `cidadeparadaprogramada`
--

INSERT INTO `cidadeparadaprogramada` (`id`, `aid`, `classe`, `data_fim`, `data_ini`, `descricao`, `nome`) VALUES
(1, 'rio-bonito', 'alert', '2016-01-27T20:20', '2016-01-25T10:15', 'Vazamento 500mm', 'Rio Bonito'),
(2, 'pirabeiraba-serra', 'alert', '2015-12-08', '2015-1', 'Vazamento na SC-301', 'Pirabeiraba Serra'),
(3, 'pirabeiraba-cidade', 'alert', '2016-01-05T23:29', '2016-01-04T10:10', 'Vazamento na Rua Vereador Guilherme Zuege', 'Pirabeiraba Cidade'),
(4, 'z-ind-norte', 'alert', '2016-01-05T18:00', '2016-01-05T15:00', 'Vazamento 200mm', 'Zona Industrial Nort'),
(5, 'j-sofia', 'alert', NULL, NULL, NULL, 'Jardim Sofia'),
(6, 'j-paraiso', 'alert', '', '', 'teste', 'Jardim Paraiso'),
(7, 'c-silva', 'normal', '2016-01-05T18:00', '2016-01-05T15:00', 'Vazamento 200mm Rua Inambu', 'Costa e Silva'),
(8, 'vila-nova', 'normal', NULL, NULL, NULL, 'Vila Nova'),
(9, 'vila_cubatao', 'alert', NULL, NULL, NULL, 'Vila Cubatao'),
(10, 'itinga', 'alert', NULL, NULL, NULL, 'Itinga'),
(11, 'santa-catarina', 'normal', NULL, NULL, NULL, 'Santa Catarina'),
(12, 'morro-meio', 'normal', NULL, NULL, NULL, 'Morro do Meio'),
(13, 'nova-brasilia', 'normal', NULL, NULL, NULL, 'Nova Brasilia'),
(14, 'floresta', 'normal', NULL, NULL, NULL, 'Floresta'),
(15, 'sao-marcos', 'normal', NULL, NULL, NULL, 'Sao Marcos'),
(16, 'z-tupy', 'alert', NULL, NULL, NULL, 'Zona Tupy'),
(17, 'comasa', 'alert', NULL, NULL, NULL, 'Comasa'),
(18, 'bom-retiro', 'alert', NULL, NULL, NULL, 'Bom Retiro'),
(19, 'santo-antonio', 'normal', NULL, NULL, NULL, 'Santo Antonio'),
(20, 'america', 'normal', NULL, NULL, NULL, 'America'),
(21, 'gloria', 'normal', NULL, NULL, NULL, 'Gloria'),
(22, 'boehmerwald', 'alert', NULL, NULL, NULL, 'Boehmerwald'),
(23, 'parque-guarani', 'alert', NULL, NULL, NULL, 'Parque Guarani'),
(24, 'paranaguamirim', 'alert', NULL, NULL, NULL, 'Paranaguamirim'),
(25, 'aventureiro', 'alert', '2016-01-12', '2016-0', 'seila', 'Aventureiro'),
(26, 'espinheiros', 'alert', NULL, NULL, NULL, 'Espinheiros'),
(27, 'petropolis', 'alert', NULL, NULL, NULL, 'Petropolis'),
(29, 'rio-velho', 'alert', NULL, NULL, NULL, 'Rio Velho'),
(30, 'adhemar-garcia', 'alert', NULL, NULL, NULL, 'Adhemar  Garcia'),
(31, 'boa-vista', 'alert', NULL, NULL, NULL, 'Boa Vista'),
(32, 'iririu', 'alert', NULL, NULL, NULL, 'Iririu'),
(33, 'saguacu', 'alert', NULL, NULL, '', 'Saguacu'),
(34, 'jarivatuba', 'alert', NULL, NULL, NULL, 'Jarivatuba'),
(35, 'itaum', 'alert', NULL, NULL, NULL, 'Itaum'),
(36, 'fatima', 'alert', NULL, NULL, NULL, 'Fatima'),
(37, 'guanabara', 'alert', NULL, NULL, NULL, 'Guanabara'),
(38, 'bucarein', 'alert', NULL, NULL, NULL, 'Bucarein'),
(39, 'anita-garibaldi', 'normal', NULL, NULL, NULL, 'Anita Garibaldi'),
(40, 'atiradores', 'normal', NULL, NULL, NULL, 'Atiradores'),
(41, 'centro', 'normal', NULL, NULL, NULL, 'Centro');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jardim paraiso`
--

CREATE TABLE IF NOT EXISTS `jardim paraiso` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  `data_ini` varchar(20) NOT NULL,
  `data_fim` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `paradaprogramada`
--

CREATE TABLE IF NOT EXISTS `paradaprogramada` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `local` varchar(20) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `data` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `paradaprogramada`
--

INSERT INTO `paradaprogramada` (`id`, `local`, `descricao`, `data`) VALUES
(1, 'Joinville', 'Parada da ETA Cubatao', '2016-01-20T12:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `usuario`, `senha`, `email`) VALUES
(1, 'Jeferson Machado', 'Jeferson', 'jefe123', 'jeferson.machado@aguasdejoinville.com.br'),
(2, 'Luanna Souza', 'Luanna', '1234', 'luanna.souza@aguasdejoinville.com.br'),
(3, 'Rivanildo Geremias', 'rivajoin', '1234', 'rivanildo.geremias@aguasdejoinville.com.br');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 07-Jan-2016 às 19:06
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
-- Estrutura da tabela `jardim paraiso`
--

CREATE TABLE IF NOT EXISTS `jardim paraiso` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  `data_ini` varchar(20) NOT NULL,
  `data_fim` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `iririu` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  `data_ini` varchar(20) NOT NULL,
  `data_fim` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `rio_bonito` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  `data_ini` varchar(20) NOT NULL,
  `data_fim` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `pirabeiraba_serra` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  `data_ini` varchar(20) NOT NULL,
  `data_fim` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `pirabeiraba_cidade` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  `data_ini` varchar(20) NOT NULL,
  `data_fim` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `zona_ind_norte` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  `data_ini` varchar(20) NOT NULL,
  `data_fim` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `jardim_sofia` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  `data_ini` varchar(20) NOT NULL,
  `data_fim` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


(7, 'Costa e Silva', 'normal', 'c-silva', NULL, NULL, NULL),
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
(25, 'Aventureiro', 'normal', 'aventureiro', 'dia inteiro', NULL, NULL),
(26, 'Espinheiros', 'normal', 'espinheiros', NULL, NULL, NULL),
(27, 'Petropolis', 'normal', 'petropolis', NULL, NULL, NULL),
(29, 'Rio Velho', 'normal', 'rio-velho', NULL, NULL, NULL),
(30, 'Adhemar  Garcia', 'normal', 'adhemar-garcia', NULL, NULL, NULL),
(31, 'Boa Vista', 'normal', 'boa-vista', NULL, NULL, NULL),
(32, 'Iririu', 'normal', '', NULL, NULL, NULL),
(33, 'Saguacu', 'normal', 'saguacu', '', NULL, NULL),
(34, 'Jarivatuba', 'normal', 'jarivatuba', NULL, NULL, NULL),
(35, 'Itaum', 'normal', 'itaum', NULL, NULL, NULL),
(36, 'Fatima', 'normal', 'fatima', NULL, NULL, NULL),
(37, 'Guanabara', 'normal', 'guanabara', NULL, NULL, NULL),
(38, 'Bucarein', 'normal', 'bucarein', NULL, NULL, NULL),
(39, 'Anita Garibaldi', 'normal', 'anita-garibaldi', NULL, NULL, NULL),
(40, 'Atiradores', 'normal', 'atiradores', NULL, NULL, NULL),
(41, 'Centro', 'normal', 'centro', NULL, NULL, NULL);


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

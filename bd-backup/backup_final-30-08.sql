
#
# Criação da Tabela : bairro
#

CREATE TABLE `bairro` (
  `idBairro` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `aid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idBairro`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 ;

#
# Dados a serem incluídos na tabela
#

INSERT INTO bairro VALUES ( '1', 'Rio Bonito', 'rio-bonito');
INSERT INTO bairro VALUES ( '2', 'Dona Francisca', 'dona-francisca');
INSERT INTO bairro VALUES ( '3', 'Pirabeiraba Centro', 'pirabeiraba-cidade');
INSERT INTO bairro VALUES ( '4', 'Zona Industrial Norte', 'z-ind-norte');
INSERT INTO bairro VALUES ( '5', 'Jardim Sofia', 'j-sofia');
INSERT INTO bairro VALUES ( '6', 'Jardim Paraiso', 'j-paraiso');
INSERT INTO bairro VALUES ( '7', 'Costa e Silva', 'c-silva');
INSERT INTO bairro VALUES ( '8', 'Vila Nova', 'vila-nova');
INSERT INTO bairro VALUES ( '9', 'Vila Cubatao', 'vila-cubatao');
INSERT INTO bairro VALUES ( '10', 'Itinga', 'itinga');
INSERT INTO bairro VALUES ( '11', 'Santa Catarina', 'santa-catarina');
INSERT INTO bairro VALUES ( '12', 'Morro do Meio', 'morro-meio');
INSERT INTO bairro VALUES ( '13', 'Nova Brasilia', 'nova-brasilia');
INSERT INTO bairro VALUES ( '14', 'Floresta', 'floresta');
INSERT INTO bairro VALUES ( '15', 'Sao Marcos', 'sao-marcos');
INSERT INTO bairro VALUES ( '16', 'Zona Tupy', 'z-tupy');
INSERT INTO bairro VALUES ( '17', 'Comasa', 'comasa');
INSERT INTO bairro VALUES ( '18', 'Bom Retiro', 'bom-retiro');
INSERT INTO bairro VALUES ( '19', 'Santo Antonio', 'santo-antonio');
INSERT INTO bairro VALUES ( '20', 'America', 'america');
INSERT INTO bairro VALUES ( '21', 'Gloria', 'gloria');
INSERT INTO bairro VALUES ( '22', 'Boehmerwald', 'boehmerwald');
INSERT INTO bairro VALUES ( '23', 'Parque Guarani', 'parque-guarani');
INSERT INTO bairro VALUES ( '24', 'Paranaguamirim', 'paranaguamirim');
INSERT INTO bairro VALUES ( '25', 'Aventureiro', 'aventureiro');
INSERT INTO bairro VALUES ( '26', 'Espinheiros', 'espinheiros');
INSERT INTO bairro VALUES ( '27', 'Petropolis', 'petropolis');
INSERT INTO bairro VALUES ( '28', 'Jardim Iririu', 'j-iririu');
INSERT INTO bairro VALUES ( '29', 'Ulysses Guimaraes', 'ulysses-guimaraes');
INSERT INTO bairro VALUES ( '30', 'Adhemar  Garcia', 'adhemar-garcia');
INSERT INTO bairro VALUES ( '31', 'Boa Vista', 'boa-vista');
INSERT INTO bairro VALUES ( '32', 'Iririu', 'iririu');
INSERT INTO bairro VALUES ( '33', 'Saguacu', 'saguacu');
INSERT INTO bairro VALUES ( '34', 'Jarivatuba', 'jarivatuba');
INSERT INTO bairro VALUES ( '35', 'Itaum', 'itaum');
INSERT INTO bairro VALUES ( '36', 'Fatima', 'fatima');
INSERT INTO bairro VALUES ( '37', 'Guanabara', 'guanabara');
INSERT INTO bairro VALUES ( '38', 'Bucarein', 'bucarein');
INSERT INTO bairro VALUES ( '39', 'Anita Garibaldi', 'anita-garibaldi');
INSERT INTO bairro VALUES ( '40', 'Atiradores', 'atiradores');
INSERT INTO bairro VALUES ( '41', 'Centro', 'centro');
INSERT INTO bairro VALUES ( '42', 'Profipo', 'profipo');
INSERT INTO bairro VALUES ( '43', 'Joao Costa', 'joao-costa');
INSERT INTO bairro VALUES ( '44', 'teste', 'teste');

#
# Criação da Tabela : classe
#

CREATE TABLE `classe` (
  `idClasse` int(11) NOT NULL AUTO_INCREMENT,
  `classe` varchar(45) NOT NULL,
  PRIMARY KEY (`idClasse`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ;

#
# Dados a serem incluídos na tabela
#

INSERT INTO classe VALUES ( '1', 'normal');
INSERT INTO classe VALUES ( '2', 'alert');

#
# Criação da Tabela : historicoCidade
#

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;

#
# Dados a serem incluídos na tabela
#


#
# Criação da Tabela : statusCidade
#

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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 ;

#
# Dados a serem incluídos na tabela
#

INSERT INTO statusCidade VALUES ( '1', '1', '1', 'AS', '2016-01-08T10:10', '2016-01-02T10:10');
INSERT INTO statusCidade VALUES ( '2', '2', '1', 'Melhoria', '2016-06-22T10:10', '2016-06-22T10:10');
INSERT INTO statusCidade VALUES ( '3', '3', '1', 'Melhoria', '2016-06-22T10:10', '2016-06-22T10:10');
INSERT INTO statusCidade VALUES ( '4', '4', '1', 'Melhoria', '2016-06-22T10:10', '2016-06-22T10:10');
INSERT INTO statusCidade VALUES ( '5', '5', '1', 'Melhoria', '2016-06-22T10:10', '2016-06-22T10:10');
INSERT INTO statusCidade VALUES ( '6', '6', '1', 'Vazamento Rua Timbé', '2016-06-23T10:00', '2016-06-23T15:00');
INSERT INTO statusCidade VALUES ( '7', '7', '1', 'Vazamento rua Maceió', '2016-06-23T03:00', '2016-06-23T22:00');
INSERT INTO statusCidade VALUES ( '8', '8', '1', 'Vazão reduzida - ETA Piraí: Turbidez elevada', '2016-06-22T00:00', '2016-06-22T23:00');
INSERT INTO statusCidade VALUES ( '9', '9', '1', 'Parada ETA Cubatão', '2016-01-01T10:10', '2016-01-02T10:10');
INSERT INTO statusCidade VALUES ( '10', '10', '1', 'Intermitência no abastecimento', '2016-06-22T09:00', '2016-06-22T23:00');
INSERT INTO statusCidade VALUES ( '11', '11', '1', 'Intermitência no abastecimento', '2016-06-22T09:00', '2016-06-22T23:00');
INSERT INTO statusCidade VALUES ( '12', '12', '1', 'Manutenção Franz Carl Brunken', '2016-06-24T10:00', '2016-06-24T15:00');
INSERT INTO statusCidade VALUES ( '13', '13', '1', '', '', '');
INSERT INTO statusCidade VALUES ( '14', '14', '1', '', '', '');
INSERT INTO statusCidade VALUES ( '15', '15', '1', '', '', '');
INSERT INTO statusCidade VALUES ( '16', '16', '1', '', '', '');
INSERT INTO statusCidade VALUES ( '17', '17', '1', 'Parada ETA Cubatão', '2016-01-01T10:10', '2016-01-02T10:10');
INSERT INTO statusCidade VALUES ( '18', '18', '1', 'Parada ETA Cubatão', '2016-01-01T10:10', '2016-01-02T10:10');
INSERT INTO statusCidade VALUES ( '19', '19', '1', 'Vazamento rua Maceió', '2016-06-23T03:00', '2016-06-23T22:00');
INSERT INTO statusCidade VALUES ( '20', '20', '1', 'Vazamento rua Maceió', '2016-06-23T03:00', '2016-06-23T22:00');
INSERT INTO statusCidade VALUES ( '21', '21', '1', 'Vazão reduzida - ETA Piraí: Turbidez elevad', '2016-06-22T00:00', '2016-06-22T23:00');
INSERT INTO statusCidade VALUES ( '22', '22', '1', 'Intermitência no abastecimento', '2016-06-22T09:00', '2016-06-22T23:00');
INSERT INTO statusCidade VALUES ( '23', '23', '1', '', '', '');
INSERT INTO statusCidade VALUES ( '24', '24', '1', 'Manutenção: Troca de registro', '2016-06-22T10:40', '2016-06-22T12:00');
INSERT INTO statusCidade VALUES ( '25', '25', '1', 'jsafasigjgosdgjsodgisdjgo', '2016-01-01T10:10', '2016-01-02T10:10');
INSERT INTO statusCidade VALUES ( '26', '26', '1', 'Parada ETA Cubatão', '2016-01-01T10:10', '2016-01-02T10:10');
INSERT INTO statusCidade VALUES ( '27', '27', '1', '', '', '');
INSERT INTO statusCidade VALUES ( '28', '28', '1', 'Parada ETA Cubatão', '2016-01-01T10:10', '2016-01-02T10:10');
INSERT INTO statusCidade VALUES ( '29', '29', '1', '', '', '');
INSERT INTO statusCidade VALUES ( '30', '30', '1', '', '', '');
INSERT INTO statusCidade VALUES ( '31', '31', '1', 'Vazamento Hellmuth', '2016-06-24T10:00', '2016-06-24T12:00');
INSERT INTO statusCidade VALUES ( '32', '32', '1', 'Parada ETA Cubatão', '2016-01-01T10:10', '2016-01-02T10:10');
INSERT INTO statusCidade VALUES ( '33', '33', '1', 'Vazamento rua Maceió', '2016-06-23T03:00', '2016-06-23T22:00');
INSERT INTO statusCidade VALUES ( '34', '34', '1', '', '', '');
INSERT INTO statusCidade VALUES ( '35', '35', '1', '', '', '');
INSERT INTO statusCidade VALUES ( '36', '36', '1', '', '', '');
INSERT INTO statusCidade VALUES ( '37', '37', '1', '', '', '');
INSERT INTO statusCidade VALUES ( '38', '38', '1', 'Vazamento Hellmuth', '2016-06-24T10:00', '2016-06-24T12:00');
INSERT INTO statusCidade VALUES ( '39', '39', '1', '', '', '');
INSERT INTO statusCidade VALUES ( '40', '40', '1', 'Vazão reduzida - ETA Piraí: Turbidez elevad', '2016-06-22T00:00', '2016-06-22T23:00');
INSERT INTO statusCidade VALUES ( '41', '41', '1', '', '', '');
INSERT INTO statusCidade VALUES ( '42', '42', '1', 'Intermitência no abastecimento', '2016-06-22T09:00', '2016-06-22T23:00');
INSERT INTO statusCidade VALUES ( '43', '43', '1', 'Intermitência no abastecimento', '2016-06-22T09:00', '2016-06-22T23:00');
INSERT INTO statusCidade VALUES ( '44', '44', '1', '', '', '');

#
# Criação da Tabela : statusCidadeProgramado
#

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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 ;

#
# Dados a serem incluídos na tabela
#

INSERT INTO statusCidadeProgramado VALUES ( '1', '1', '2', 'teste', '2016-08-17T12:22');
INSERT INTO statusCidadeProgramado VALUES ( '2', '2', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '3', '3', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '4', '4', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '5', '5', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '6', '6', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '7', '7', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '8', '8', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '9', '9', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '10', '10', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '11', '11', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '12', '12', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '13', '13', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '14', '14', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '15', '15', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '16', '16', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '17', '17', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '18', '18', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '19', '19', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '20', '20', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '21', '21', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '22', '22', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '23', '23', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '24', '24', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '25', '25', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '26', '26', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '27', '27', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '28', '28', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '29', '29', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '30', '30', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '31', '31', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '32', '32', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '33', '33', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '34', '34', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '35', '35', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '36', '36', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '37', '37', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '38', '38', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '39', '39', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '40', '40', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '41', '41', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '42', '42', '1', '', '');
INSERT INTO statusCidadeProgramado VALUES ( '43', '43', '1', '', '');

#
# Criação da Tabela : usuario
#

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `passWord` varchar(45) NOT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `userName` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ;

#
# Dados a serem incluídos na tabela
#

INSERT INTO usuario VALUES ( '1', 'admin', 'admin@admin', 'admin', 'admin');
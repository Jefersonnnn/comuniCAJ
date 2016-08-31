<?php

require 'adm/config/conexao/conexao.php';
echo '<body bgcolor="#3C3F46">';

echo '<h1 style="color: #5e9ca0;">Criando as tabelas do banco <span style="color: #F6BA3E;">'. $databasename . '</span></h1>';

#
# Criação da Tabela : bairro
#

if (!$result = $mysqli->query("CREATE TABLE IF NOT EXISTS `bairro` (
                              `idBairro` int(11) NOT NULL AUTO_INCREMENT,
                              `nome` varchar(45) NOT NULL,
                              `aid` varchar(20) DEFAULT NULL,
                               PRIMARY KEY (`idBairro`)
                              ) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;")) 
    {
        echo '<p style="color:white">Erro ao tentar criar a tabela
        <span style="background-color: #D71C09; color: #fff; display: inline-block; padding: 3px 10px; font-weight: bold; border-radius: 5px;">bairro</span>
            :/</p>';
    }else{
        echo '<p style="color:white">Tabela
        <span style="background-color: #F6BA3E; color: #fff; display: inline-block; padding: 3px 10px; font-weight: bold; border-radius: 5px;">bairro</span>
            criada!</p>';
    }

#
# Dados a serem incluídos na tabela
#

if (!$result = $mysqli->query("INSERT INTO `bairro` VALUES ( '1', 'Rio Bonito', 'rio-bonito'),
                                 ( '2', 'Dona Francisca', 'dona-francisca'),
                                 ( '3', 'Pirabeiraba Centro', 'pirabeiraba-cidade'),
                                 ( '4', 'Zona Industrial Norte', 'z-ind-norte'),
                                 ( '5', 'Jardim Sofia', 'j-sofia'),
                                 ( '6', 'Jardim Paraiso', 'j-paraiso'),
                                 ( '7', 'Costa e Silva', 'c-silva'),
                                 ( '8', 'Vila Nova', 'vila-nova'),
                                 ( '9', 'Vila Cubatao', 'vila-cubatao'),
                                 ( '10', 'Itinga', 'itinga'),
                                 ( '11', 'Santa Catarina', 'santa-catarina'),
                                 ( '12', 'Morro do Meio', 'morro-meio'),
                                 ( '13', 'Nova Brasilia', 'nova-brasilia'),
                                 ( '14', 'Floresta', 'floresta'),
                                 ( '15', 'Sao Marcos', 'sao-marcos'),
                                 ( '16', 'Zona Tupy', 'z-tupy'),
                                 ( '17', 'Comasa', 'comasa'),
                                 ( '18', 'Bom Retiro', 'bom-retiro'),
                                 ( '19', 'Santo Antonio', 'santo-antonio'),
                                 ( '20', 'America', 'america'),
                                 ( '21', 'Gloria', 'gloria'),
                                 ( '22', 'Boehmerwald', 'boehmerwald'),
                                 ( '23', 'Parque Guarani', 'parque-guarani'),
                                 ( '24', 'Paranaguamirim', 'paranaguamirim'),
                                 ( '25', 'Aventureiro', 'aventureiro'),
                                 ( '26', 'Espinheiros', 'espinheiros'),
                                 ( '27', 'Petropolis', 'petropolis'),
                                 ( '28', 'Jardim Iririu', 'j-iririu'),
                                 ( '29', 'Ulysses Guimaraes', 'ulysses-guimaraes'),
                                 ( '30', 'Adhemar  Garcia', 'adhemar-garcia'),
                                 ( '31', 'Boa Vista', 'boa-vista'),
                                 ( '32', 'Iririu', 'iririu'),
                                 ( '33', 'Saguacu', 'saguacu'),
                                 ( '34', 'Jarivatuba', 'jarivatuba'),
                                 ( '35', 'Itaum', 'itaum'),
                                 ( '36', 'Fatima', 'fatima'),
                                 ( '37', 'Guanabara', 'guanabara'),
                                 ( '38', 'Bucarein', 'bucarein'),
                                 ( '39', 'Anita Garibaldi', 'anita-garibaldi'),
                                 ( '40', 'Atiradores', 'atiradores'),
                                 ( '41', 'Centro', 'centro'),
                                 ( '42', 'Profipo', 'profipo'),
                                 ( '43', 'Joao Costa', 'joao-costa'),
                                 ( '44', 'teste', 'teste');")) 
    {
        echo '<p style="color:white">Erro ao tentar inserir dados na tabela
        <span style="background-color: #D71C09; color: #fff; display: inline-block; padding: 3px 10px; font-weight: bold; border-radius: 5px;">bairro</span>
            :/</p>';
            
        printf("Errormessage: %s\n", $mysqli->error);
    }else{
        echo '<p style="color:white">Dados inseridos na tabela
        <span style="background-color: #F6BA3E; color: #fff; display: inline-block; padding: 3px 10px; font-weight: bold; border-radius: 5px;">bairro</span>
            com sucesso!</p>';
    }

#
# Criação da Tabela : classe
#

if (!$result = $mysqli->query("CREATE TABLE IF NOT EXISTS `classe` (
                             `idClasse` int(11) NOT NULL AUTO_INCREMENT,
                             `classe` varchar(45) NOT NULL,
                              PRIMARY KEY (`idClasse`)
                              ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;")) 
    {
        echo '<p style="color:white">Erro ao tentar criar a tabela
        <span style="background-color: #D71C09; color: #fff; display: inline-block; padding: 3px 10px; font-weight: bold; border-radius: 5px;"> classe</span>
            :/</p>';
    }else{
        echo '<p style="color:white">Tabela
        <span style="background-color: #F6BA3E; color: #fff; display: inline-block; padding: 3px 10px; font-weight: bold; border-radius: 5px;"> classe</span>
            criada!</p>';
    }

#
# Dados a serem incluídos na tabela
#

if (!$result = $mysqli->query("INSERT INTO classe ('classe') VALUES ('normal'),
                                ('alert');"))
    {
        echo '<p style="color:white">Erro ao tentar inserir dados na tabela
        <span style="background-color: #D71C09; color: #fff; display: inline-block; padding: 3px 10px; font-weight: bold; border-radius: 5px;"> classe</span>
            :/</p>';
    }else{
        echo '<p style="color:white">Dados inseridos na tabela
        <span style="background-color: #F6BA3E; color: #fff; display: inline-block; padding: 3px 10px; font-weight: bold; border-radius: 5px;"> classe</span>
            com sucesso!</p>';
    }

#
# Criação da Tabela : historicoCidade
#

if (!$result = $mysqli->query("CREATE TABLE IF NOT EXISTS `historicoCidade` (
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
                                ) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;")) 
    {
        echo '<p style="color:white">Erro ao tentar criar a tabela
        <span style="background-color: #D71C09; color: #fff; display: inline-block; padding: 3px 10px; font-weight: bold; border-radius: 5px;"> historicoCidade</span>
            :/</p>';
    }else{
        echo '<p style="color:white">Tabela
        <span style="background-color: #F6BA3E; color: #fff; display: inline-block; padding: 3px 10px; font-weight: bold; border-radius: 5px;"> historicoCidade</span>
            criada!</p>';
    }

#
# Dados a serem incluídos na tabela
#


#
# Criação da Tabela : statusCidade
#

if (!$result = $mysqli->query("CREATE TABLE IF NOT EXISTS `statusCidade` (
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
                                ) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 ;")) 
    {
        echo '<p style="color:white">Erro ao tentar criar a tabela
        <span style="background-color: #D71C09; color: #fff; display: inline-block; padding: 3px 10px; font-weight: bold; border-radius: 5px;"> statusCidade</span>
            :/</p>';
        printf("Errormessage: %s\n", $mysqli->error);
    }else{
        echo '<p style="color:white">Tabela
        <span style="background-color: #F6BA3E; color: #fff; display: inline-block; padding: 3px 10px; font-weight: bold; border-radius: 5px;"> statusCidade</span>
            criada!</p>';
    }

#
# Dados a serem incluídos na tabela
#

if (!$result = $mysqli->query("INSERT INTO statusCidade VALUES ( '1', '1', '1', '', '', ''),
                                 ( '2', '2', '1', '', '', ''),
                                 ( '3', '3', '1', '', '', ''),
                                 ( '4', '4', '1', '', '', ''),
                                 ( '5', '5', '1', '', '', ''),
                                 ( '6', '6', '1', '', '', ''),
                                 ( '7', '7', '1', '', '', ''),
                                 ( '8', '8', '1', '', '', ''),
                                 ( '9', '9', '1', '', '', ''),
                                 ( '10', '10', '1', '', '', ''),
                                 ( '11', '11', '1', '', '', ''),
                                 ( '12', '12', '1', '', '', ''),
                                 ( '13', '13', '1', '', '', ''),
                                 ( '14', '14', '1', '', '', ''),
                                 ( '15', '15', '1', '', '', ''),
                                 ( '16', '16', '1', '', '', ''),
                                 ( '17', '17', '1', '', '', ''),
                                 ( '18', '18', '1', '', '', ''),
                                 ( '19', '19', '1', '', '', ''),
                                 ( '20', '20', '1', '', '', ''),
                                 ( '21', '21', '1', '', '', ''),
                                 ( '22', '22', '1', '', '', ''),
                                 ( '23', '23', '1', '', '', ''),
                                 ( '24', '24', '1', '', '', ''),
                                 ( '25', '25', '1', '', '', ''),
                                 ( '26', '26', '1', '', '', ''),
                                 ( '27', '27', '1', '', '', ''),
                                 ( '28', '28', '1', '', '', ''),
                                 ( '29', '29', '1', '', '', ''),
                                 ( '30', '30', '1', '', '', ''),
                                 ( '31', '31', '1', '', '', ''),
                                 ( '32', '32', '1', '', '', ''),
                                 ( '33', '33', '1', '', '', ''),
                                 ( '34', '34', '1', '', '', ''),
                                 ( '35', '35', '1', '', '', ''),
                                 ( '36', '36', '1', '', '', ''),
                                 ( '37', '37', '1', '', '', ''),
                                 ( '38', '38', '1', '', '', ''),
                                 ( '39', '39', '1', '', '', ''),
                                 ( '40', '40', '1', '', '', ''),
                                 ( '41', '41', '1', '', '', ''),
                                 ( '42', '42', '1', '', '', ''),
                                 ( '43', '43', '1', '', '', ''),
                                 ( '44', '44', '1', '', '', '');"))
    {
        echo '<p style="color:white">Erro ao tentar inserir dados na tabela
        <span style="background-color: #D71C09; color: #fff; display: inline-block; padding: 3px 10px; font-weight: bold; border-radius: 5px;"> statusCidade</span>
            :/</p>';
        printf("Errormessage: %s\n", $mysqli->error);
    }else{
        echo '<p style="color:white">Dados inseridos na tabela
        <span style="background-color: #F6BA3E; color: #fff; display: inline-block; padding: 3px 10px; font-weight: bold; border-radius: 5px;"> statusCidade</span>
            com sucesso!</p>';
    }

#
# Criação da Tabela : statusCidadeProgramado
#

if (!$result = $mysqli->query("CREATE TABLE IF NOT EXISTS `statusCidadeProgramado` (
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
                            ) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 ;")) 
    {
        echo '<p style="color:white">Erro ao tentar criar a tabela
        <span style="background-color: #D71C09; color: #fff; display: inline-block; padding: 3px 10px; font-weight: bold; border-radius: 5px;"> statusCidadeProgramado</span>
            :/</p>';
    }else{
        echo '<p style="color:white">Tabela
        <span style="background-color: #F6BA3E; color: #fff; display: inline-block; padding: 3px 10px; font-weight: bold; border-radius: 5px;"> statusCidadeProgramado</span>
            criada!</p>';
    }


#
# Dados a serem incluídos na tabela
#

if (!$result = $mysqli->query("INSERT INTO statusCidadeProgramado VALUES ( '1', '1', '2', 'teste', '2016-08-17T12:22'),
                                 ( '2', '2', '1', '', ''),
                                 ( '3', '3', '1', '', ''),
                                 ( '4', '4', '1', '', ''),
                                 ( '5', '5', '1', '', ''),
                                 ( '6', '6', '1', '', ''),
                                 ( '7', '7', '1', '', ''),
                                 ( '8', '8', '1', '', ''),
                                 ( '9', '9', '1', '', ''),
                                 ( '10', '10', '1', '', ''),
                                 ( '11', '11', '1', '', ''),
                                 ( '12', '12', '1', '', ''),
                                 ( '13', '13', '1', '', ''),
                                 ( '14', '14', '1', '', ''),
                                 ( '15', '15', '1', '', ''),
                                 ( '16', '16', '1', '', ''),
                                 ( '17', '17', '1', '', ''),
                                 ( '18', '18', '1', '', ''),
                                 ( '19', '19', '1', '', ''),
                                 ( '20', '20', '1', '', ''),
                                 ( '21', '21', '1', '', ''),
                                 ( '22', '22', '1', '', ''),
                                 ( '23', '23', '1', '', ''),
                                 ( '24', '24', '1', '', ''),
                                 ( '25', '25', '1', '', ''),
                                 ( '26', '26', '1', '', ''),
                                 ( '27', '27', '1', '', ''),
                                 ( '28', '28', '1', '', ''),
                                 ( '29', '29', '1', '', ''),
                                 ( '30', '30', '1', '', ''),
                                 ( '31', '31', '1', '', ''),
                                 ( '32', '32', '1', '', ''),
                                 ( '33', '33', '1', '', ''),
                                 ( '34', '34', '1', '', ''),
                                 ( '35', '35', '1', '', ''),
                                 ( '36', '36', '1', '', ''),
                                 ( '37', '37', '1', '', ''),
                                 ( '38', '38', '1', '', ''),
                                 ( '39', '39', '1', '', ''),
                                 ( '40', '40', '1', '', ''),
                                 ( '41', '41', '1', '', ''),
                                 ( '42', '42', '1', '', ''),
                                 ( '43', '43', '1', '', '');"))
    {
        echo '<p style="color:white">Erro ao tentar inserir dados na tabela
        <span style="background-color: #D71C09; color: #fff; display: inline-block; padding: 3px 10px; font-weight: bold; border-radius: 5px;"> statusCidadeProgramado</span>
            :/</p>';
        printf("Errormessage: %s\n", $mysqli->error);
    }else{
        echo '<p style="color:white">Dados inseridos na tabela
        <span style="background-color: #F6BA3E; color: #fff; display: inline-block; padding: 3px 10px; font-weight: bold; border-radius: 5px;"> statusCidadeProgramado</span>
            com sucesso!</p>';
    }



#
# Criação da Tabela : usuario
#

if (!$result = $mysqli->query("CREATE TABLE `usuario` (
                              `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
                              `userName` varchar(45) NOT NULL,
                              `email` varchar(100) DEFAULT NULL,
                              `passWord` varchar(45) NOT NULL,
                              `nome` varchar(45) NOT NULL,
                              PRIMARY KEY (`idUsuario`),
                              UNIQUE KEY `userName` (`userName`)
                            ) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ;")) 
    {
        echo '<p style="color:white">Erro ao tentar criar a tabela
        <span style="background-color: #D71C09; color: #fff; display: inline-block; padding: 3px 10px; font-weight: bold; border-radius: 5px;"> usuario</span>
            :/</p>';
    }else{
        echo '<p style="color:white">Tabela
        <span style="background-color: #F6BA3E; color: #fff; display: inline-block; padding: 3px 10px; font-weight: bold; border-radius: 5px;"> usuario</span>
            criada!</p>';
    }



#
# Dados a serem incluídos na tabela
#



if (!$result = $mysqli->query("INSERT INTO usuario VALUES
                                 ( '1', 'admin', 'admin@admin', 'admin', 'Administrador');"))
    {
        echo '<p style="color:white">Erro ao tentar inserir dados na tabela
        <span style="background-color: #D71C09; color: #fff; display: inline-block; padding: 3px 10px; font-weight: bold; border-radius: 5px;"> usuario</span>
            :/</p>';
        printf("Errormessage: %s\n", $mysqli->error);
    }else{
        echo '<p style="color:white">Dados inseridos na tabela
        <span style="background-color: #F6BA3E; color: #fff; display: inline-block; padding: 3px 10px; font-weight: bold; border-radius: 5px;"> usuario</span>
            com sucesso!</p>';
        echo '<p style="color:white">Usuario inicial criado : 
        <span style="background-color: #F6BA3E; color: #fff; display: inline-block; padding: 3px 10px; font-weight: bold; border-radius: 5px;"> User = admin</span>
        <span style="background-color: #F6BA3E; color: #fff; display: inline-block; padding: 3px 10px; font-weight: bold; border-radius: 5px;"> Pass = admin</span></p>';
    }
    
    echo '<center><h2> Favor deletar o arquivo <span style="background-color: #264281; color: #fff; display: inline-block; padding: 3px 10px; font-weight: bold; border-radius: 5px;"> setup.php</span></h2></center>';
    echo '</body>'
?>
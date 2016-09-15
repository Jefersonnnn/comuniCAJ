<?php

  include 'adm/config/seguranca/mostra_erros.php';
  
?>



<!DOCTYPE HTML>

<html>

<head>
  <link rel="stylesheet" href="css/styles.css" type="text/css" />
  <meta charset="utf-8">
  <title>Águas de Joinville</title>
</head>
<xml version="1.0" encoding="utf-8" ?>

  <body ondragstart='return false' onselectstart="return false">

    <div id="topo">
      <div id="topo_logo">
        <a href="#" target="_blank"><img class="logo" src="imagens/logo_caj.png"></a>
      </div>
      <div id="topo_menu">
        
        <nav id="nav-3">
        <a class="link-3" href="?inicio">Home</a>
        <a class="link-3" href="/adm">Administração</a>
        <a class="link-3" href="?contato">Contato</a>
      </nav>

      </div>
    </div>

    <div id="wrapper">
      <div id="conteudo">

        <div id="carregando">
          <img src="imagens/carregando.gif" />
        </div>

        <div id="mapa">

          <?php
        if(isset($_GET['mapa'])){ 
            include("mapa.php"); 
        }else if(isset($_GET['contato'])){
          include("contato.php");
        }else if(isset($_GET['inicio'])){
          include("mapa.php");
        }else{include("mapa.php");}
        ?>

        </div>

        <div id="menu_direita">
          <div id="parada_prog">
            <h1>Proxima parada programada</h1>
            <h2 id="data-programado">Data: 26/12/2015</h2>
            <p id="descricao-programado">Melhoria nas bombas</p>

          </div>


          <div id="resultado">
            <h1>Regiões afetadas</h1>
            <?php 
            clearstatcache();
            include "config/regioes_afetadas_user.php" ?>

          </div>

        </div>
      </div>
    </div>

    </div>


    <?php include_once("footer.php") ?>
    
    
    <!-- JAVASCRIPT INCLUDE -->
    <script src="js/tooltip.js"></script>
    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/functions_user.js"></script>


  </body>

</html>
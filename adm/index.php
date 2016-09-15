<!--
 * Sistema de segurança com acesso restrito
 *
 * Usado para restringir o acesso de certas páginas do seu site
 *
  -->
<?php 
  include_once("config/seguranca/seguranca.php");
  include("config/seguranca/mostra_erros.php");
  apenasSair();
?>

<!DOCTYPE HTML>

<html>
<head>


  <link rel="stylesheet" href="../css/styles.css" type="text/css" />
  <link rel="stylesheet" href="../css/styles_adm.css" type="text/css" />

  <meta charset="utf-8">
  <title>Administração</title>
</head>


<body>
  <div id="msg">MENSAGEM</div>

  <div id="login-box">
    <div id="login-box-interno">
      <div id="login-box-label">Faça seu login ou <a href="../index.php">clique para voltar </a></div>

      <form id="formulario-login" method="post" action="config/seguranca/valida.php" autocomplete="off" >
      <div class="input-div" id="input-usuario">

        <input name="usuario" type="text" id="usuario" value="usuario" maxlength="50"/>

      </div>
         <div class="input-div" id="input-senha">

        <input name="senha" type="password" id="senha" value="senha" maxlength="50" autocomplete="off" />

      </div>
      
      
      <div id="botoes">
        <input id="botao" type="submit"value="Entrar" />

      </form>
        <div id="lembrar-senha"><input type="checkbox" />Lembrar minha senha</div>
      </div>
    </div>   

  </div>

  <div id="login-box-footer">ÁGUAS DE JOINVILLE</div>



<!-- JAVASCRIPT INCLUDE -->

  <script src="../js/jquery-2.1.4.min.js"></script>
  
  <script src="../js/paginaAdm.js"></script>  

</body>
</html>


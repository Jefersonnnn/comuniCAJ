<?php 
  include("config/seguranca/seguranca.php");

  protegePagina();
?>

<!DOCTYPE HTML>

<html>
<head>
  <link rel="stylesheet" href="../css/styles.css" type="text/css" />
  <link rel="stylesheet" href="../css/styles_adm.css" type="text/css"/>


  <meta charset="utf-8">
  <title>Administração</title>
</head>
	<xml version="1.0" encoding="utf-8"?>  
  <body>


<?php include_once("topo.php") ?>

<div id="wrapper">

	
    <div id="conteudo">
      <div id="carregando">
          <img src="../imagens/carregando.gif"/>
        </div>       

   		<div id="mapa">        

        <?php 

        if(isset($_GET['mapa'])){ 
            include("mapa.php"); 
        }else if(isset($_GET['cadastrar'])){
          include("cadastrar.php");
        }else if(isset($_GET['contato'])){
          include("../contato.php");
        }else if(isset($_GET['inicio'])){
          include("inicio.php");
        }else{echo "Pagina não encontrada!";}
        ?>   

      </div>

    	<div id="menu_direita">

        <div id="parada_prog_adm">
            <form>
                 <fieldset>
                    <legend><h3>Próxima parada programada</h3></legend>
                    <label>
                    Descrição:</br>
                      <textarea rows="3" cols="30" id="descricao-programado"></textarea>
                    </label>   
                   <label><br>
                    Data:</br>
                      <input type="datetime-local" id="data-programado"/>
                    </label></br>
                      <input id="atualiza-programado" onClick="atualizaMapaProgramado()" type="button" value="Atualizar"/>  
                 </fieldset>       
            </form> 

        </div>
     
      <div id="resultado">
        <h1>Regiões afetadas</h1>  
        <?php if(isset($_GET['mapa'])){ 
         include("config/regioes_afetadas_adm.php");
        }else{include("inicio.php");}
        ?>           
        
      </div>
            
    </div>
    </div>
    </div>

</div>

<?php include_once("../footer.php") ?>



<!-- JAVASCRIPT INCLUDE -->
  
          <script src="../js/jquery-2.1.4.min.js"></script>
          <script src="config/js/functions.js"></script>
          <script src="config/js/initial.js"></script>

</body>
</html>


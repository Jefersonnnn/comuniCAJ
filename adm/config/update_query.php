<?php

//Proteger arquivo de acesso direto
include("seguranca/seguranca.php");
protegePagina();

$resposta = "";


//Atribui na variavel $aid o id do bairro a ser atualizado.
if (isset($_GET['aid']) == true) {	
	$aid       =   ($_GET['aid']);

    $bairros = (explode(',', $aid));
    $bairros = str_replace(",", "", $bairros);
}

//Atribui o classe (Alerta/Normal) a variavel $classe
if (isset($_GET['classe']) == true){

    if($_GET['classe'] == "alert"){ $classe = 2;}
    else{ $classe = 1; }
}

//Atribui a variavel $func a função a ser processada na requisição.
if (isset($_GET['func']) == true){
    $func    = ($_GET['func']);
}

//Atribui na variavel $desc a descrição do bairro em manutenção
if (isset($_GET['desc']) == true){
    $desc    = ($_GET['desc']);
}

//Atribui na variavel $data_i a data inicial prevista para manutenção no bairro selecionado
if (isset($_GET['data_i']) == true){
    $data_i   = ($_GET['data_i']);
}
if (isset($_GET['data_f']) == true){
    $data_f   = ($_GET['data_f']);
}
if (isset($_GET['local']) == true){
    $local    = ($_GET['local']);
}

//Busca os dados de conexao com o banco de dados.
require 'conexao/conexao.php';

//Executa Querys



/*Altera a classe do bairro
* 1 = Normal
* 2 = Alerta
*/
if($func == "atualiza_cor"){
    if($classe == "" or $aid == ""){
        
        $resposta = "SEM INFORMAÇÕES";
        
    }else{
        if (!$result = $db->query("UPDATE statusCidade as s, bairro as b 
                                    SET s.idClasse = '" . $classe . "' 
                                    WHERE s.idBairro = b.idBairro AND b.aid = '" . $aid . "'"))
        {
            $resposta = "ERRO ao tentar atualizar";
        }else {
            $resposta = "Atualizado!";
        }
    }
}

/*Altera a classe do bairro (Mapa de parada programada)
* 1 = Normal
* 2 = Alerta
*/
if($func == "atualiza_cor_parada"){
    if (!$result = $db->query("UPDATE statusCidadeProgramado S, bairro B 
                               SET S.idClasse = '" . $classe . "' 
                               WHERE S.idBairro = B.idBairro AND B.aid = '" . $aid . "'")) 
    {
        $resposta = "ERRO ao tentar atualizar";
    }else{
        $resposta = "Atualizado!";
    }      

}

/*Atualiza as informações do bairro
* Descrição, Data inicial prevista, Data Final prevista
*/
if($func == "atualiza_desc"){
   $desc = trim($desc);

try{
    foreach ($bairros as $value) {

        $db->query("UPDATE statusCidade S, bairro B SET S.dataIni  = '" . $data_i    .    "',
                                                 S.dataFim  = '" . $data_f    .    "',
                                                 S.descricao = '" . $desc .    "'
                                                 WHERE S.idBairro = B.idBairro AND B.aid = '" . $value . "'");
        }
    
    $resposta = "Atualizado!";

    }catch(Exception $e){
    $resposta = ("ERRO!. Ao tentar atualizar");
    }
}


//Altera a descrição e data da proxima parada programada
if($func == "atualiza_parada"){

    $desc = trim($desc);

    if (!$result = $db->query("UPDATE statusCidadeProgramado S
                               SET descricao = '" . $desc   . "',
                                   dataIni  = '" . $data_i . "'
                               WHERE idStatusCidadeProgramado = 1")) 

    {
        $resposta = "ERRO ao tentar atualizar";
    }else{
        $resposta = "Atualizado!";
    }   

}


//Verifica se existe uma resposta
//Se não, retorna uma "Resposta vazia"
if ($resposta == ""){
    $resposta = "Resposta Vazia!";
}

?>



{
    "RESPOSTA":"<?php echo $resposta ?>"
}

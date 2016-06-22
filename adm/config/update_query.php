<?php
$resposta = "";
if (isset($_GET['aid']) == true) {	
	$aid       =   ($_GET['aid']);

    $bairros = (explode(',', $aid));
    $bairros = str_replace(",", "", $bairros);

    //?aid=aid&desc=descricao&data_i=data_ini&data_f=data_fim=func: "atualiza_desc"

}

if (isset($_GET['classe']) == true){

    if($_GET['classe'] == "alert")
    {
        $classe = 2;
    }else{
        $classe = 1;
        
    }
    
}

if (isset($_GET['func']) == true){
    $func    = ($_GET['func']);
}
if (isset($_GET['desc']) == true){
    $desc    = ($_GET['desc']);
}
if (isset($_GET['data_i']) == true){
    $data_i   = ($_GET['data_i']);
}
if (isset($_GET['data_f']) == true){
    $data_f   = ($_GET['data_f']);
}
if (isset($_GET['local']) == true){
    $local    = ($_GET['local']);
}

   // echo ("DESCRICAO: " . $descricao . "");

require 'conexao/conexao.php';

//Executa Querys



if($func == "atualiza_cor"){
    
    if($classe == "" or $aid == ""){
        $resposta = "SEM INFORMAÇÕES";
    }else{
    

        if (!$result = $mysqli->query("UPDATE statusCidade as s, bairro as b 
                                    SET s.idClasse = '" . $classe . "' 
                                    WHERE s.idBairro = b.idBairro AND b.aid = '" . $aid . "'"))
                                    
                    
        {
            $resposta = "ERRO ao tentar atualizar";
        }else {
            $resposta = "Atualizado!";
            
        }
    }
}


if($func == "atualiza_cor_parada"){
    if (!$result = $mysqli->query("UPDATE statusCidadeProgramado S, bairro B 
                               SET S.idClasse = '" . $classe . "' 
                               WHERE S.idBairro = B.idBairro AND B.aid = '" . $aid . "'")) 
                               
           
    {
        $resposta = "ERRO ao tentar atualizar";
    }else{
        $resposta = "Atualizado!";
    }      

}


if($func == "atualiza_desc"){
   $desc = trim($desc);


try{
    foreach ($bairros as $value) {
        /*$mysqli->query("INSERT INTO historicoCidade (descricao, dataIni, dataFim, idBairro, idClasse) 
                            VALUES ('$desc', '$data_i', '$data_f', '$value', '2')");*/

        $mysqli->query("UPDATE statusCidade S, bairro B SET S.dataIni  = '" . $data_i    .    "',
                                                 S.dataFim  = '" . $data_f    .    "',
                                                 S.descricao = '" . $desc .    "'
                                                 WHERE S.idBairro = B.idBairro AND B.aid = '" . $value . "'");
       
        }
    
    $resposta = "Atualizado!";
    

    }catch(\Exception $e){
        $resposta = ($e->getMessage());
    }
}



if($func == "atualiza_parada"){

    $desc = trim($desc);

    if (!$result = $mysqli->query("UPDATE statusCidadeProgramado S
                               SET descricao = '" . $desc   . "',
                                   dataIni  = '" . $data_i . "'
                               WHERE idStatusCidadeProgramado = 1")) 

    {
        $resposta = "ERRO ao tentar atualizar";
    }else{
        $resposta = "Atualizado!";
    }   

}

$mysqli->close();

if ($resposta == ""){
    $resposta = "Resposta Vazia!";
}

?>
{
    "RESPOSTA":"<?php echo $resposta ?>"
}

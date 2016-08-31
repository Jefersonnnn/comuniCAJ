<?php
//Variavel para retornar mensagem ao usuario
$resposta = "";

//Verifica se foi informado o 'nome' e adicional na variavel $nome
if (isset($_GET['id']) == true){
    $id    = $_GET['id'];
}

//Busca os dados para conexão
require '../conexao/conexao.php';

//Tenta inserir o usuario no banco de dados
if (!$result = $mysqli->query("DELETE FROM usuario WHERE idUsuario = '$id'")) 
{
    var_dump($mysqli);
}else{
    $resposta = "SUCESSO! Usuario Deletado";
}

//Fecha a conexão
$mysqli->close();


 #abaixo, criamos uma variavel que terá como conteúdo o endereço para onde haverá o redirecionamento:  
 $redirect = "../../index2.php?cadastrar";
 
 #abaixo, chamamos a função header() com o atributo location: apontando para a variavel $redirect, que por 
 #sua vez aponta para o endereço de onde ocorrerá o redirecionamento
 header("location:$redirect");


?>

{
    "RESPOSTA":"<?php echo $resposta ?>"
}



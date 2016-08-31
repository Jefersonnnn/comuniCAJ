<?php
//Variavel para retornar mensagem ao usuario
$resposta = "";

//Verifica se foi informado o 'nome' e adicional na variavel $nome
if (isset($_GET['nome']) == true){
    $nome    = $_GET['nome'];
}

//Verifica se foi infomardo o 'Username' e adicional na variavel $un
if (isset($_GET['un']) == true){
    $un    = $_GET['un'];
}

//Verifica se foi infomardo o 'email' e adicional na variavel $email
if (isset($_GET['email']) == true){
    $email    = $_GET['email'];
}

//Verifica se foi infomardo o 'password' e adicional na variavel $pw
if (isset($_GET['pw']) == true){
    $pw    = $_GET['pw'];
}

//Confirma se as principais informações foram inseridas.
//Caso contrario 'mata' a requisição
if($nome == "" || $un == "" || $pw == ""){
    $resposta = "Falta Informações";
    die("Falta Informações");
}else{

//Busca os dados para conexão
require '../conexao/conexao.php';

//Tenta inserir o usuario no banco de dados
if (!$result = $mysqli->query("INSERT INTO usuario (username, email , password, nome) VALUES ('$un', '$email', '$pw', '$nome')")) 
{
    $resposta = "ERRO! possivel username repetido";
}else{
    $resposta = "SUCESSO! Usuario cadastrado";
}

//Fecha a conexão
$mysqli->close();
}

?>

{
    "RESPOSTA":"<?php echo $resposta ?>"
}



<?php
//nome
///username
//email
//password
$resposta = "";

if (isset($_GET['nome']) == true){
    $nome    = $_GET['nome'];
}

if (isset($_GET['un']) == true){
    $un    = $_GET['un'];
}

if (isset($_GET['email']) == true){
    $email    = $_GET['email'];
}

if (isset($_GET['pw']) == true){
    $pw    = $_GET['pw'];
}

if($nome == "" || $un == "" || $pw == ""){
    $resposta = "Falta Informações";
}else{

require '../conexao/conexao.php';


if (!$result = $mysqli->query("INSERT INTO usuario (username, email , password, nome) VALUES ('$un', '$email', '$pw', '$nome')")) 


{
    $resposta = "ERRO! possivel username repetido";
}else{
    $resposta = "SUCESSO! Usuario cadastrado";
}

$mysqli->close();
}

?>

{
    "RESPOSTA":"<?php echo $resposta ?>"
}



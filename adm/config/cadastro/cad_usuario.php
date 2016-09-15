<?php
//Proteger arquivo de acesso direto
include("../seguranca/seguranca.php");
protegePagina();


//Variavel para retornar mensagem ao usuario
$resposta = "";

//Verifica se foi informado o 'nome' e adicional na variavel $nome
if (isset($_GET['nome']) == true){
    $nome    = $_GET['nome'];
}

//Verifica se foi informado o 'Username' e adicional na variavel $un
if (isset($_GET['un']) == true){
    $un    = $_GET['un'];
}

//Verifica se foi informado o 'email' e adicional na variavel $email
if (isset($_GET['email']) == true){
    $email    = $_GET['email'];
}

//Verifica se foi informado o telefone
if(isset($_GET['telefone']) == true){
    $telefone = $_GET['telefone'];
}

//Verifica se foi informado o 'password' e adicional na variavel $pw
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


//Criptografia da senha {API https://github.com/ircmaxell/password_compat)
//Usage: ->  $hash = password_hash($password, PASSWORD_BCRYPT);
//require "../seguranca/password.php";
//$hash = password_hash($pw, PASSWORD_DEFAULT);


//PHP 5.2
//$encryptedString = encrypt('This String Will Be encrypted');
require "../seguranca/crypt.php";
$hash = encrypt($pw);

//Tenta inserir o usuario no banco de dados
if (!$result = $db->query("INSERT INTO usuario (username, email , password, nome, telefone) VALUES ('$un', '$email', '$hash', '$nome', '$telefone')")) 
{
    $resposta = "ERRO! possivel username repetido";
}else{
    $resposta = "SUCESSO! usuario cadastrado";
}

}

?>

{
    "RESPOSTA":"<?php echo $resposta ?>"
    
}



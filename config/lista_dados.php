<!--Conexao Banco de dados-->
<?php
//header('Content-Type: application/json');

require 'conexao.php';

$result = $mysqli->query("SELECT nome, descricao, dataIni, dataFim FROM cidade WHERE classe = 'alert' ORDER BY nome");

$n = $result->num_rows; //Número de Linhas retornadas

// transforma os dados em um array
$linha = mysqli_fetch_assoc($result);
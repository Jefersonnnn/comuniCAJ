<?php

/*
* Retorna o bairro (aid) com as seguintes informações para edição.
* nome, descricao, data de inicio previsto, data de fim previsto.
*/

//Cabeçalho para definir o tipo de resposta.
header('Content-Type: application/json');
require 'conexao/conexao.php';

//$aid = $mysqli->real_escape_string($_GET["aid"]);
$aid = $_GET["aid"];

$result = $mysqli->query("SELECT b.nome, s.descricao, s.dataIni, s.dataFim 
	FROM statusCidade s, bairro b 
	WHERE s.idBairro = b.idBairro AND b.aid = ('$aid')") or die("Erro na conexão!");  

$row = $result->fetch_array();

$result->free();
$mysqli->close();

$desc = $row['descricao'];
$desc = str_replace("\n", " ", $desc);

?>

{
  "nome":"<?php echo $row['nome']; ?>",
  "descricao":"<?php echo $desc; ?>",
  "data_ini":"<?php echo $row['dataIni']; ?>",
  "data_fim":"<?php echo $row['dataFim']; ?>"
}

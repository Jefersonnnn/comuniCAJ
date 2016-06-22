<?php
header('Content-Type: application/json');
require 'conexao/conexao.php';

$aid = $mysqli->real_escape_string($_GET["aid"]);

$result = $mysqli->query("SELECT b.nome, s.descricao, s.dataIni, s.dataFim 
	FROM statusCidade s, bairro b 
	WHERE s.idBairro = b.idBairro AND b.aid = ('$aid')") or die("Erro na conexão!");  

//$result = $mysqli->query("SELECT p.idstatusCidadeProgramado, p.bairro_idbairro, p.data_ini, p.descricao, b.nome FROM statuscidadeprogramado p, bairro b
//WHERE p.idstatusCidadeProgramado = b.idbairro AND p.idstatusCidadeProgramado = 1");

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






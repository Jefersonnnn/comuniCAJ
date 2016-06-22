<?php
header('Content-Type: application/json');
require 'conexao.php';


$result = $mysqli->query("SELECT nome, descricao FROM cidade WHERE aid = '" . $_GET["aid"] . "'") or die("Erro na conexão!");;

$row = $result->fetch_array();

$result->free();
$mysqli->close();


?>
{
  "nome": "<?php echo $row['nome']; ?>",
  "descricao": "<?php echo $row['descricao']; ?>"
}




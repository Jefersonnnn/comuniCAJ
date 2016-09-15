<?php
header('Content-Type: application/json');
require 'conexao.php';


$result = $db->query("SELECT nome, descricao FROM cidade WHERE aid = '" . $_GET["aid"] . "'") or die("Erro na conexão!");;

$row = $result->fetchAll();

?>
{
  "nome": "<?php echo $row['nome']; ?>",
  "descricao": "<?php echo $row['descricao']; ?>"
}




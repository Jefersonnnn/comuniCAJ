<?php 
function antiSqlInjection($dados){
		require 'conexao/conexao.php';
		return	$mysqli->real_escape_string($dados);
}

?>
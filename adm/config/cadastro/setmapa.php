<?php
sleep(3);

header('Content-Type: application/json');
require '../conexao/conexao.php';

if (isset($_GET['func']) == true) {	
	$func = $mysqli->real_escape_string($_GET['func']);

	if($func == 'estiloMapaProgramado'){

		
		$result = $mysqli->query("SELECT b.aid, c.classe 
			FROM statusCidadeProgramado s, bairro b, classe c 
			WHERE b.idBairro = s.idBairro AND c.idClasse = s.idClasse");

		$n      = $result->num_rows; //Número de Linhas retornadas

		//Mesclar resultados em um array
		for($i = 0; $i<$n; $i++) {
			$dados[] = mysqli_fetch_array($result, MYSQLI_NUM);

		}

		echo json_encode($dados);
		exit;
	}

}else{


$result = $mysqli->query("SELECT b.aid, c.classe 
						  FROM statusCidade s, bairro b, classe c 
						  WHERE b.idBairro = s.idBairro AND c.idClasse = s.idClasse ORDER BY s.idStatusCidade");

$n      = $result->num_rows; //Número de Linhas retornadas

//Mesclar resultados em um array
for($i = 0; $i<$n; $i++) {
	$dados[] = mysqli_fetch_array($result, MYSQLI_NUM);

}

echo json_encode($dados);
}

?>

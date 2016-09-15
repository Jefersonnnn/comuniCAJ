<?php
header('Content-Type: application/json');
require '../conexao/conexao.php';

if (isset($_GET['func']) == true) {	
	
	$func = ($_GET['func']);

	if($func == 'estiloMapaProgramado'){

		$result = $db->query("SELECT b.aid, c.classe FROM statusCidadeProgramado s, bairro b, classe c WHERE b.idBairro = s.idBairro AND c.idClasse = s.idClasse");
		
		$n      = $result->rowCount(); //Número de Linhas retornadas

	
		//Mesclar resultados em um array
		for($i = 0; $i<$n; $i++) {
			
			$dados[] = $result->fetch(PDO::FETCH_ASSOC);

		}

		echo json_encode($dados);
		exit;
	}

}else{
	
	$result = $db->query("SELECT b.aid, c.classe 
						  FROM statusCidade s, bairro b, classe c 
						  WHERE b.idBairro = s.idBairro AND c.idClasse = s.idClasse ORDER BY s.idStatusCidade");

	$n      = $result->rowCount(); //Número de Linhas retornadas
	
	//Mesclar resultados em um array
	for($i = 0; $i<$n; $i++) {
		$dados[] =  $result->fetch(PDO::FETCH_ASSOC);

	}

	echo json_encode($dados);

}

?>

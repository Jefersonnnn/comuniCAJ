<?php
	//Abre uma conexao com Mysql	
	function DBconnect(){
		$link = @mysqli_connect(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE) or die(mysqli_connect_error());
		mysqli_set_charset($link, DB_CHARSET) or die(mysqli_error($link));
		
		return $link;
	}
	
	//Fecha conexao com Mysql
	function DBClose($link){
		@mysqli_close($link) or die(mysqli_error($link));
	}

// Protege contra SQL Injection
	function DBEscape($dados){
		$link = DBconnect();
		
		if(!is_array($dados))
			$dados = mysqli_real_escape_string($link, $dados);
		else{
			 
			}		
		
		DBClose($link);
		return $dados;
	}

?>
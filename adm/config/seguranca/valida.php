<?php 
	//Inclui arquivo com sistema de segurança
	require_once("seguranca.php");

	//Verifica se um formulario foi enviado;
	if ($_SERVER['REQUEST_METHOD'] == 'POST'){
		//Salva duas variaveis com o que foi digitado no forumulario
		//Detalhe: faz uma verificação com 'isset()' para saber se o campo foi preenchido
		$usuario = (isset($_POST['usuario'])) ? $_POST['usuario'] : '';
		$senha = (isset($_POST['senha'])) ? $_POST['senha'] : '';
		
		//Utiliza uma funcao criada no seguraca.php para validar os dados digitados
		if (validaUsuario($usuario, $senha) == true) {
			//O usuario e a senha foram validados, manda para pagina interna
			header("Location: ../../index2.php?mapa");
		} else {
			// O usuario e/ou senha sao invalidos, manda fazer login
			//Para alterar o endereco da pagina de login verificar seguraca.php
			expulsaVisitante();
		}
	}


 ?>
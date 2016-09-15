<?php 
	/**
	* Sistema de segurança com acesso restrito
	*
	* Usado para restringir o acesso de certas páginas do seu site
	*
	*/

	//Configuracoes
	//######################
	$_SG['abreSessao']      = true;
	/* define o prazo do cache em 30 minutos */
	$_SG['tempoSessao']     = 30;
	$_SG['caseSensitive']   = false;
	$_SG['validaSempre']    = true;


	$_SG['paginaLogin']     = '../../index.php';
	$_SG['tabela']          = 'usuario';
	//############################
    

    //####################################
	//- Nao editar a partir deste ponto
	//#######################################

	// Verifica se precisa iniciar a sessão
	if ($_SG['abreSessao'] == true) {
		
				
		// **PREVENTING SESSION HIJACKING**
		// Prevents javascript XSS attacks aimed to steal the session ID
		ini_set('session.cookie_httponly', 1);
		
		// **PREVENTING SESSION FIXATION**
		// Session ID cannot be passed through URLs
		ini_set('session.use_only_cookies', 1);
		
		// Uses a secure connection (HTTPS) if possible
		ini_set('session.cookie_secure', 1);
		

		session_cache_expire($_SG['tempoSessao']);
		
		session_start();
	}

	/*
	*Função que valida um usuario e senha
	*@param string $usuario - O usuario a ser validado
	*@param string $senha   - A senha a ser validada
	*
	*@return bool - se o usuario foi validado ou nao(true/false)
	**/

	function validaUsuario($usuario, $senha){
		global $_SG;

		$cS = ($_SG['caseSensitive']) ? 'BINARY' : '';
		

		//Usa a funcao addSlashes para escapar as aspas
		$nusuario = addSlashes($usuario);
		$nsenha   = addSlashes($senha);

		//Monta uma consulta SQL (query) para procurar um usuario
		require '../conexao/conexao.php';
		//	$sql = "SELECT idusuario, nome FROM " . $_SG['tabela'] . " WHERE ". $cS . "username = '" . $nusuario . "' AND " . $cS . "password = '" . $nsenha . "' LIMIT 1";

		$sql = "SELECT idusuario, nome, password FROM " . $_SG['tabela'] . " WHERE ". $cS . "username = :username LIMIT 1";

		try {
    		$stmt = $db->prepare($sql, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
    		
	 	    try {
	 
		        $stmt->execute(array(':username' => $nusuario));

		        $resultado = $stmt->fetch(PDO::FETCH_ASSOC);

		    } catch (Exception $e) {
		        $stmt->debugDumpParams();
		        echo "Código: 1 <br /> <pre>";
		        print_r($e);
		        exit();
		    }
	
		} catch (Exception $e) {
		    echo "Código: 2 <br /> <pre>";
		    print_r($e);
		    exit();
		}
		
		//Verifica se encontrou algum registro
		if(empty($resultado)){
			//Nenhum registro foi encontrado => usuario é invalido
			return false;
		}else {
			//PHP >= 5.3
			//Criptografia da senha {API https://github.com/ircmaxell/password_compat)
			//Usage: ->  $hash = password_hash($password, PASSWORD_BCRYPT);
			
			//require "password.php";
	
			//if (password_verify($nsenha, $resultado['password'])) {
			
			//PHP 5.2
			//$encryptedString = encrypt('This String Will Be encrypted');
			//echo decrypt($encryptedString);
			
			require "crypt.php";
			if(decrypt($resultado['password']) == $nsenha || $resultado['password'] == $nsenha){

				//Definimos dois valores na sessão com os dados do usuario
				$_SESSION['usuarioID'] = $resultado['idusuario']; //Pega o valor da coluna id do registro encontrado no Mysql
				$_SESSION['usuarioNome'] = $resultado['nome']; //pega o valor da coluna nome
			
				//Verifica a opcao se sempre validar o login
				if($_SG['validaSempre'] == true){
					//Definimos dois valores na sessao com os dados do login
					$_SESSION['usuarioLogin'] = $usuario;
					$_SESSION['usuarioSenha'] = $senha;
				}

				return true;
			} else {
    			return false;
			}
		}
	}


	/**
	* Funcao que protege a pagina
	*/
	function protegePagina(){
		global $_SG;

		if(!isset($_SESSION['usuarioID']) OR !isset($_SESSION['usuarioNome'])) {
			//Nao ha usuario logado, manda para apagina de login
			expulsaVisitante();
		} else if (!isset($_SESSION['usuarioID']) OR !isset($_SESSION['usuarioNome'])) {
			//Ha usuario logado, verifica se precisa validar o login novamente
			if($_SG['validaSempre'] == true){
				//Verifica se os dados salvos na sessao batem com os dados do banco.
				if(!validaUsuario($_SESSION['usuarioLogin'], $_SESSION['usuarioSenha'])){
					expulsaVisitante();
				}
			}
		}
	}

	/*
	*Funcao para expulsar visitante
	*/

	function expulsaVisitante(){
		global $_SG;

		//Remove as variaves da sessa(caso exista)
		unset($_SESSION['usuarioID'], $_SESSION['usuarioNome'], $_SESSION['usuarioLogin'], $_SESSION['usuarioSenha']);

		//Manda para tela de login
		header("Location: ". $_SG['paginaLogin']);
	}


	/*
	* Apenas da um unset
	*/
	function apenasSair(){
		global $_SG;

		unset($_SESSION['usuarioID'], $_SESSION['usuarioNome'], $_SESSION['usuarioLogin'], $_SESSION['usuarioSenha']);

	}

 ?>
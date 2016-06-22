<?php
	require 'adm/config/conexao/conexao.php';
	
		
if ($mysqli->connect_errno) {
    echo "Sorry, this website is experiencing problems.";
    echo "Error: Failed to make a MySQL connection, here is why: \n";
    echo "Errno: " . $mysqli->connect_errno . "\n";
    echo "Error: " . $mysqli->connect_error . "\n";
    exit;
}

//$total = $mysqli->query("SELECT count(aid) as classes from cidade WHERE classe = 'alert' ");

$total = $mysqli->query("SELECT count(idBairro) as idBairro from statusCidade WHERE idClasse = 2 ");

/*Se encontrou o total*/
if($t =  mysqli_fetch_assoc($total)){

    // Total de regstros
    $n = $t['idBairro'];
	
    // Limite máximo de registros por página
    $limite = 5;
    /*
     * A função round basicamente retorna, caso o número seja quebrado, o menor valor inteiro
     * Retorna Quantidade de páginas, que é basicamente, a quantidade de agrupamentos possíveis com o total de  registros que temos
     * Esta quantidade é obtida dividindo-se o total de registros pelo limite por página
     * */
    $paginas = round($n / $limite);
	
    /*Caso, na requisição, nenhuma página for especificada, será usada o valor padrão 1. Ou seja, obrigatoriamente estará na primeira página*/
    $pagina = empty($_REQUEST['pagina'])?1:$_REQUEST['pagina'];

    /*Com base na página, é definido o registro de início para fazer a consulta*/
    $inicio = ($pagina - 1) * $limite;
	
	$sql = "SELECT b.nome, s.descricao, s.dataIni, s.dataFim from statusCidade s, bairro b WHERE s.idBairro = b.idBairro AND idClasse = 2 ORDER BY b.nome LIMIT $inicio, $limite "; 

	/*Fazendo a consulta */

    $dados = $mysqli->query($sql);

    /*Montando a apresentação*/
	
	
    $saida = "<html><head><title>Regioes afetadas</title></head><body>";
	

    /*Percorrendo todos os registros*/	

    /*Funcao para formatar a data vinda do datetime-local YYYY-MM-ddThh:mm:ss  -> dd/mm/yyyy hh:mm:ss*/
    function formataData($data){
        if(isset($data)){
        $data = str_replace(
            "T", "", $data);
        $data = str_replace("/", "-", $data); //verifica se ja esta no padrao correto
        $dataReturn = new DateTime($data);
        $dataReturn = $dataReturn->format('d/m/Y H:i:s');
        return $dataReturn;
        }
    }
	
    while($d = mysqli_fetch_assoc($dados)){
		$titulo = $d['nome'];
        $desc   = $d['descricao'];
			
        $dataI = formataData($d['dataIni']); 
        $dataF = formataData($d['dataFim']);

		$saida .= "<table border='0'><tr><th colspan='2'> $titulo </th></tr>";
		
        $saida .="<tr ><td colspan='2'><b>Descricao:</b> <label>"  .$desc.    "</label></td></tr>";		
		$saida .="<tr ><td colspan='2'><b>Inicio:</b>    <label>"  .$dataI.             "</label></td></tr>";	
		$saida .="<tr ><td colspan='2'><b>Estimativa de retorno:</b>       <label>"  .$dataF.             "</label></td></tr>";	
        $saida .="<tr>_____________________________________</tr>";
		$saida .= "<tr>";

	}	
  	
	
	
	
	
    /*INcluindo paginação simples: Se houver próxima,, exibirá o link Próxima. Se houver página anterior, exibirá Anterior. Sendo assim, os dois links não são exibidos na primeira e nem na ultima página*/

    /*-----------------------------------RODAPÉ---------------------------------*/
    /*
     * Caso a página atual não seja 1, mas um valor menor, aparecerá o link para a página anterior
     * */
        /*Caso a página não tenha chegado na última, haverá um link para a próxima página*/

    if($pagina -1 > 0){
        $saida .= "<td><a href='?pagina=" . ($pagina - 1 ) . "'>Anterior</a></td>";
    }else{
        //$saida .= "<td>Primeira</td>";
    }

    if($pagina < $paginas){
        $saida .= "<td><a href='?pagina=".( $pagina + 1) ."'>Próxima</a></td>";
    }else{
        //$saida .= "<td>última</td>";
    }

    /*-----------------------------------FECHANDO O RODAPÉ---------------------------------*/

    /*
     * Caso voçê queira uma paginação diferente, tipo, em que o usuário pode selecionar uma determinada página diretamente, é só comentar o trecho do rodapé acima e descomentar o trecho abaixo
     * */
    /*-----------------------------------RODAPÉ---------------------------------*/
    /*$saida .= "<td colspan='2'>";
    for($x=1;$x<=$paginas;$x++){
        $saida .= ($pagina == $x?" <b> ":" ")."<a href ='?pagina=$x'>".$x."</a>".($pagina == $x?" </b> ":" ");
    }
    $saida .= "</td>";*/
    /*-----------------------------------FECHANDO O RODAPÉ---------------------------------*/
    $saida .= "</tr>";
    $saida .= "</table></body></html>";
}
echo $saida;

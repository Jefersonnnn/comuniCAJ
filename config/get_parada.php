<?php
header('Content-Type: application/json');
require '../adm/config/conexao/conexao.php';


//$result = $mysqli->query("SELECT data_ini, descricao, bairro_idbairro FROM statuscidadeprogramado WHERE idstatusCidadeProgramado = 1");

//$result = $mysqli->query("SELECT statuscidadeprogramado.*, bairro_idbairro ")



//Consulta com banco de dados para selecionar a "Parada de ETA programada"
//p.idstatusCidadeProgramado = 1 pois esta na primeira linha a descricao da "Parada programada"
$result = $mysqli->query("SELECT p.idStatusCidadeProgramado, p.idBairro, p.dataIni, p.descricao, b.nome
                          FROM statusCidadeProgramado p, bairro b
                          WHERE p.idStatusCidadeProgramado = b.idBairro AND p.idStatusCidadeProgramado = 1");



$row = $result->fetch_array();

$result->free();
$mysqli->close();



//Formata a data que esta salva no banco de dados para o padrão d/m/ano H:m:s
function formataData($data){
        if(isset($data)){
        $data = str_replace( 
            "T", "", $data); // 2016-01-29T08:00 
        $data = str_replace("/", "-", $data); //verifica se ja esta no padrao correto
        $dataReturn = new DateTime($data);
        $dataReturn = $dataReturn->format('d/m/Y H:i:s');
        return $dataReturn;
        }
}

$desc = $row['descricao'];

//Susbtitui a quebra de linha "\n" para "</br>" formato de visualização
$desc = str_replace("\n", "</br>", $desc);


?>
{
  "data": "<?php echo "Data: " . formataData($row['dataIni']); ?>",
  "descricao": "<?php echo $desc ?>", 
  "bairro:": "<?php echo $row['nome']; ?>"
}




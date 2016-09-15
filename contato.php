
<h1>Contatos</h1>
<br>


<div id="list-usuarios">   
<table cellspacing="2" cellpadding="0" border="0" align="center" bgcolor="#A1DBFF">      
<tr>         
<td class="tabela-usuario"><span>Nome</span></td>         
<td class="tabela-usuario"><span>Email</span></td>    
<td class="tabela-usuario"><span>Telefone</span></td>

</tr>            

<?php        
include 'adm/config/conexao/conexao.php';        
$sql_visualizar = $db->query("SELECT nome, email, telefone, idUsuario FROM usuario");   

while ($usuario = $sql_visualizar->fetch()){ 
	echo "<tr>
	<td bgcolor=\"#FFF\">{$usuario['nome']}</td>
	<td bgcolor=\"#FFF\" width=\"250\"> <a href=\"mailto:{$usuario['email']}\" target=\"_top\">{$usuario['email']}</td>
	<td bgcolor=\"#FFF\" width=\"100\">{$usuario['telefone']}</td>";
	
}

?>    

</table>        
</div>
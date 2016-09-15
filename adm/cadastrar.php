<div id="cadastrar_corpo">	
	<h1>Gerenciar Usuários</h1>


	<div class="menu-label" id="cadastrar-label-user" onClick="abrirMenuCadastroUsuario()">
		<h2>Cadastrar Usuario</h2>
	</div>

	<div class="menu-corpo" id="cadastrar-corpo-user">
		<form>
			<label>
				Nome:</br>
				<input type="text" id="nome_user" />
			</label>   
			
			<label><br>
				Usuario:</br>
				<input type="text" id="user_user" />
			</label>
			<label><br>
				Senha:</br>
				<input type="password"  id="pass_user"/>
			</label></br>
			<label>
				Confirmar senha:</br>
				<input type="password"  id="pass_confirm_user"/>
			</label></br>
			<label>
				E-mail:</br>
				<input type="email"  id="email_user"/>
			</label></br>
						<label>
				Telefone:</br>
				<input type="text" name="telefone" class="telefone" id="telefone_user" data-mask="(00) 0000-0000" data-mask-selectonfocus="true" />
			</label></br>
			
			
			<input type="button"  onClick="cadastraUsuario()" value="Cadastrar" />    

		</form> 
	</div>
	
<!-- 
	<div class="menu-label" id="cadastrar-label-rel">
		<h2>Gerar Relatorio</h2>
	</div>

	<div class="menu-corpo" id="relatorio">
		<form>
			<label>
				Relatorio dos bairros afetados</br>
			</label>  
			<input type="button" id="atualiza-bairro" value="Gerar Relatorio" />  
			
		</form> 
	</div>
-->

<div id="list-usuarios">   
<table width="500" border="0" cellpadding="3" cellspacing="3">      
<tr>         
<td class="tabela-usuario"><span>Nome</span></td>         
<td class="tabela-usuario"><span>Login</span></td>    
<td class="tabela-usuario"><span>Telefone</span></td>
<td class="tabela-usuario"><span>Excluir?</span></td>  


</tr>            

<?php        
include 'config/conexao/conexao.php';        
$sql_visualizar = $db->query("SELECT nome, userName, telefone, idUsuario FROM usuario");   

while ($usuario = $sql_visualizar->fetch(PDO::FETCH_ASSOC)){ 

	echo "<tr>
	<td>{$usuario['nome']}</td>
	<td>{$usuario['userName']}</td>
	<td>{$usuario['telefone']}</td>
	<td align=\"center\"><a href=\"config/cadastro/del_usuario.php?id={$usuario['idUsuario']}\">Excluir</a></td></tr>"; 
}

?>    

</table>        
</div>
<!--fim div pesquisar-->
</div>
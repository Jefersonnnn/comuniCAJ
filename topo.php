  
  <div id="topo">
    <div id="topo_logo"><a href="#" target="_blank"><img  class="logo" src="../imagens/logo_caj.png"></a> </div>

    <div id="topo_menu">
      <?php echo "Olá, ". $_SESSION['usuarioNome']; ?> <input type="button" id="sair" value="Sair" /> 
        <ul>
        <li><a href="?inicio">Home</a></li>
        <li><a href="?mapa">Mapa</a></li>
        <li><a href="?cadastrar">Cadastrar</a></li>
        <li><a href="?contato">Contato</a></li>
      </ul>
     </div>
  </div>
 

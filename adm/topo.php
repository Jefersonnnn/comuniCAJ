
  <div id="topo">
    <div id="topo_logo"><a href="#" ><img  class="logo" src="../imagens/logo_caj.png"></a></div>
    <div id="topo_menu">
      <div id="topo_adm">
         <?php echo "Olá, ". $_SESSION['usuarioNome'];  ?> <a href="#" onclick="logOut()">Sair</a>
      </div>
      
      <nav id="nav-3">
        <a class="link-3" href="?inicio">Home</a>
        <a class="link-3" href="?mapa">Mapa</a>
        <a class="link-3" href="?cadastrar">Usuários</a>
        <a class="link-3" href="?contato">Contato</a>
      </nav>
      
     </div>
  </div>
 

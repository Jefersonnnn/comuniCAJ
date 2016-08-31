var estilo_mapa;

//Define o estilo do mapa para o administrador 0 para NORMAL 1 para PROGRAMADO
estilo_mapa = 0;
var aberto = 0;

window.onload = function() {
	// códigos JavaScript a serem executados quando a página carregar
	var paths = document.querySelectorAll('path'),
      i = paths.length;
    for (; i--;) {
      paths[i].addEventListener('click', pathclick);
    }
    
    visualizaMapaNormal();
}

//Funcao para alterar FavIcon para o da Cia.
(function() {
  var link = document.createElement('link');
  link.type = 'image/x-icon';
  link.rel = 'shortcut icon';
  link.href = '../imagens/favicon.png';
  document.getElementsByTagName('head')[0].appendChild(link);
}());

function atualizaMapaProgramado(){
  
  var data_ini = document.getElementById('data-programado').value,
      descricao = document.getElementById('descricao-programado').value;

    $.ajax({
      dataType: "json",
      type: "GET",
      url: "config/update_query.php",
      data: {
        desc: descricao,
        data_i: data_ini,
        func: "atualiza_parada"
      },
      success: function(data) {
        alert(data['RESPOSTA']);
     
      }
    })
}

//Pagina CADASTRO

function abrirMenuCadastroUsuario(){

  if (aberto == 0) {
    $('#cadastrar-corpo-user').slideDown('slow');
    $('#relatorio').slideUp('slow');
    aberto = 1;

  }
  else {
    if (aberto == 1) {
      $('#cadastrar-corpo-user').slideUp('slow');
      $('#relatorio').slideUp('slow');
      $('#cadastrar-label-rel').slideDown('slow');

      aberto = 0;
    }
  }
  
}


$('#editar-label-user').click(function() {

  if (aberto == 0) {
    $('#cadastrar-corpo-user').slideUp('slow');
    $('#relatorio').slideUp('slow');
    $('#editar-corpo-user').slideDown('slow');

    aberto = 1;

  }
  else {
    if (aberto == 1) {
      $('#cadastrar-corpo-user').slideUp('slow');
      $('#relatorio').slideUp('slow');
      $('#editar-corpo-user').slideUp('slow');

      aberto = 0;
    }
  }
})

$('#cadastrar-label-rel').click(function() {

  if (aberto == 0) {
    $('#relatorio').slideDown('slow');
    $('#cadastrar-corpo-user').slideUp('slow');
    aberto = 1;

  }
  else {
    if (aberto == 1) {
      $('#cadastrar-corpo-user').slideUp('slow');
      $('#relatorio').slideUp('slow');
      $('#cadastrar-label-rel').slideDown('slow');

      aberto = 0;
    }
  }
})

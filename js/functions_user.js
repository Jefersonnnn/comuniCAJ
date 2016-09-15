var estilo_mapa = 1; //Variavel para armazenar o estilo de mapa atual (1 = Mapa Normal ; 0 = Mapa Programado)
var timer; //Variavel tempo para atualizar o site

//Funcao para mostrar tooltop com informações do local selecionado. (ao passar o mouse)

 comecarReload();
 mudaEstiloMapaNormal();


function getRegioes(jsonArr) {

  $.ajax({
    dataType: "json",
    type: "GET",
    url: "adm/config/get_regioes.php",
    data: {
      "aid": jsonArr
    },
    success: function(data) {

    }
  })
}


//Funcao para alterar FavIcon para o da Cia.
(function() {
  var link = document.createElement('link');
  link.type = 'image/x-icon';
  link.rel = 'shortcut icon';
  link.href = 'imagens/favicon.png';
  document.getElementsByTagName('head')[0].appendChild(link);
}());


//Funcao para alterar o padrão do mapa para o atual.
function mudaEstiloMapaNormal() {

  $.ajax({
    dataType: "json",
    type: "GET",
    url: "adm/config/cadastro/setmapa.php",
    beforeSend: function() {
      $("#mapa").hide("fast");
      //$("#conteudo").html("<b>Carregando...</b>");
      $("#carregando").show();
    },

    success: function(data) {
      $("#mapa").show("fast");
      $("#carregando").hide();
      $("#parada_prog").slideUp('slow');
      $("#resultado").slideDown('slow');
      
      for(var i = 0; i < data.length ; i++){

        if( document.getElementById(data[i].aid) != null){
          
           document.getElementById(data[i].aid).setAttribute('class', data[i].classe);
         
        }
      }
    }
  })
}



$('#visualiza-programado').click(
  function() {

    if (estilo_mapa == 1) {
      document.getElementById('visualiza-mapa-normal').className = 'desactive';
      document.getElementById('visualiza-programado').className = 'active';
      $("#parada_prog").slideDown('slow');
      $("#resultado").slideUp('slow');


      estilo_mapa = 0;


      //Pega a parada programada salva no banco de dados
      $.ajax({
        dataType: "json",
        type: "GET",
        url: "config/get_parada.php",
        success: function(data) {
          
         var now = new Date();

         var dataProgramada = new Date(data.data);
 
        if(dataProgramada > now) { //Verifica se a Data recebida é menor que a data Atual.Boolean
          document.getElementById('data-programado').innerHTML = "Data: " + dataProgramada.getFullYear();
          document.getElementById('descricao-programado').innerHTML = data.descricao;
          
        }else{
  
          document.getElementById('data-programado').innerHTML = "SEM PROGRAMAÇÃO";
          document.getElementById('descricao-programado').innerHTML = "";
        }
        }
      })

      $.ajax({
        dataType: "json",
        type: "GET",
        url: "adm/config/cadastro/setmapa.php",
        data: {
          "func": "estiloMapaProgramado"
        },
        beforeSend: function() {
          $("#mapa").hide();
          //$("#conteudo").html("<b>Carregando...</b>");
          $("#carregando").show();
        },
        success: function(data) {
          $("#mapa").show("fast");
          $("#carregando").hide();
          
          for(var i = 0; i< data.length; i++){
            document.getElementById(data[i].aid).setAttribute('class', data[i].classe);
          }
        }
      })


      $('#visualiza-mapa-normal').click(
        function() {
          if (estilo_mapa == 0) {
            estilo_mapa = 1;

            mudaEstiloMapaNormal();

            document.getElementById('visualiza-mapa-normal').className = 'active';
            document.getElementById('visualiza-programado').className = 'desactive';
          }
        }
      )

     
    }
  });



//Funcao para atualizar a pagina
function comecarReload() {
  timer = window.setTimeout("location.reload()", 60 * 5000); //60 * 5000 = 5m
}



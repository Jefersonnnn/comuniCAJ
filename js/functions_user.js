var estilo_mapa = 1; //Variavel para armazenar o estilo de mapa atual (1 = Mapa Normal ; 0 = Mapa Programado)
var timer; //Variavel tempo para atualizar o site

//Funcao para mostrar tooltop com informações do local selecionado. (ao passar o mouse)

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

      var quebra;
      $(data).each(function(key, value) { //Atribui o resultado [["rio-bonito","alert"],["dona-francisca","alert"],
        //Atribui no quebra[0] = rio-bonito; quebra[1] = status [alert][normal] 
        quebra = value.toString().split(",");
        document.getElementById(quebra[0]).setAttribute('class', quebra[1]);

      })
    }
  })
}

mudaEstiloMapaNormal();


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
         //15/12/2016 12:00:00
         var diaHoje = now.getDate() + "/" + now.getMonth() + "/" + now.getFullYear();
        
        if(data['data'] > diaHoje) { //Verifica se a Data recebida é menor que a data Atual.
          
          document.getElementById('data-programado').innerHTML = "Data: " + data['data'];
          document.getElementById('descricao-programado').innerHTML = data['descricao'];
        }else{
        //alert(data['data']);
          
          
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
          var quebra;
          $(data).each(function(key, value) {
            quebra = value.toString().split(",");
            document.getElementById(quebra[0]).setAttribute('class', quebra[1]);
          })


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



      //Funcao para atualizar a pagina
      function comecarReload() {
        timer = window.setTimeout("location.reload()", 60 * 10000); //60 * 10000 = 10m
      }

      comecarReload();
    }
  });




/**
 *  adm/index.php
 * */
 
$('#usuario').click(
  function() {
    if ($(this).val() == 'usuario') {
      $(this).val('');
    }
  }
);

$('#senha').click(
  function() {
    if ($(this).val() == 'senha') {
      $(this).val('');
    }
  }
);

$('#botao').click(
  function() {

    $('#msg').click();

    if ($('#usuario').val() == '' || $('#usuario').val() == 'usuario') {
      document.getElementById('botao').type = "button";
      $('#msg').html('Senha/Usuario invalida');
      $('#msg').slideDown('slow');

    }
    else if ($('senha').val() == '' || $('senha').val() == 'senha') {
      document.getElementById('botao').type = "button";
      $('#msg').html('Senha/Usuario invalida').slideDown('slow');
    }
    else {
      document.getElementById('botao').type = "submit";
    }

  }
)

$('#msg').click(
  function() {
    $(this).slideUp('fast');
  }
)







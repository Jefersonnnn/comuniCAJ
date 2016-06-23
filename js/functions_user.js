var estilo_mapa = 1; //Variavel para armazenar o estilo de mapa atual (1 = Mapa Normal ; 0 = Mapa Programado)
var timer; //Variavel tempo para atualizar o site

//Funcao para mostrar tooltop com informações do local selecionado. (ao passar o mouse)



/*

});


  $.ajax({
    dataType: "json",
    type: "GET",
    url: "config/get_regioes.php",
    data: {"aid": tag.id},
    success: function(data) {
      console.log("get_regioes");
     document.getElementById('data_ini').value = data['data_ini']; 
     document.getElementById('descricao').value =  data['descricao']; 
     document.getElementById('data_fim').value = data['data_fim']; 
     
     
   },
   error: function(XMLHttpRequest, textStatus, errorThrown) {
    alert("Erro ao atualizar o mapa\n Atualize a página"); 

   }
 })

  $(tag).click(
      function(){
        
        

      })
  
  
  
 }  
  
  */




//Funcao para alterar FavIcon para o da Cia.
(function() {
  var link = document.createElement('link');
  link.type = 'image/x-icon';
  link.rel = 'shortcut icon';
  link.href = 'imagens/ico_caj.png';
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



//Funcao pathclick do usuario
function pathclick(evt) {
  var tag = evt.target;

  //   valor = "normal";
  // if (tag.getAttribute("class") === "normal") {
  //   valor = "alert";
  // }
  // tag.setAttribute("class", valor);

  $.ajax({
    dataType: "json",
    type: "GET",
    url: "adm/config/get_regioes.php",
    data: {
      "aid": tag.id
    },
    success: function(data) {

      tooltip.show(data['nome'] + "<br>Descricao: " + data['descricao'] + "<br>Retorno: " + data['data_fim']);

      tag.addEventListener('mouseout', function() {
        tooltip.hide();
      })

      // document.getElementById('data_ini').value = data['data_ini']; 
      // document.getElementById('descricao').value =  ; 
      // document.getElementById('data_fim').value = data['data_fim']; 

    }
  })
}





$(function() {

      //Adiciona a funcao pathclick() em todas as tags path(bairros) do mapa
      var paths = document.querySelectorAll('path');
     
      var i = paths.length;
      
      for (; i--; i) {

      $.ajax({
          dataType: "json",
          type: "GET",
          url: "adm/config/get_regioes.php",
          data: {"aid": paths[i].getAttribute('id')},
          success: function(data) {
            
          
            
            alert(data['nome']);
            
            alert(paths[i].class);
            
           // document.setAttribute('onclick', function(){
            //  tooltip.show(data['nome'] + "<br>Descricao: " + data['descricao'] + "<br>Retorno: " + data['data_fim']);
          //  })
            
            // data['nome'].addEventListener('click', function(){
            // tooltip.show(data['nome'] + "<br>Descricao: " + data['descricao'] + "<br>Retorno: " + data['data_fim']);
            // })
            // paths[i].addEventListener('mouseout', function(){
            // tooltip.hide();
            // })
     
          }
        })
        
      }
      
      

          mudaEstiloMapaNormal();
          comecarReload();

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


          //Adiciona a funcao Pathclick em todos os bairros do mapa;
          // var paths = document.querySelectorAll('path'),
          //  i = paths.length;
          //  for (; i--;) {
          //      paths[i].addEventListener('click', pathclick());
          //    }



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
                    document.getElementById('data-programado').innerHTML = data['data'];
                    document.getElementById('descricao-programado').innerHTML = data['descricao'];
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
        });

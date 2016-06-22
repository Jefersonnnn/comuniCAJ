var estilo_mapa;

  //Define o estilo do mapa para o administrador 0 para normal 1 para programado
  estilo_mapa = 0;


  $('#limpar-bairro').click(function(){
      document.getElementById('data_ini').value ="";
      document.getElementById('descricao').value ="";
      document.getElementById('data_fim').value =""  ;     
      document.getElementById('aid').innerHTML = "";

  })

  $('#cadastrar-usuario').click(function(){

    var un = document.getElementById('user_user').value;
    var nome = document.getElementById('nome_user').value;
    var pw = document.getElementById('pass_user').value;
    var email = document.getElementById('email_user').value;

     $.ajax({
         dataType: "json",
         type: "GET",
         url: "config/cadastro/cad_usuario.php",
         data: {"un": un, "email": email, "nome": nome, "pw": pw},
         success: function(r) 
         {
            alert(r['RESPOSTA']);
         } 
      })
  })

  $('#atualiza-bairro').click(
    function(){
      var data_ini  = document.getElementById('data_ini').value, 
      descricao = document.getElementById('descricao').value,
      data_fim  = document.getElementById('data_fim').value,       
      aid       = document.getElementById('aid').innerHTML;


      if(data_ini == "" || data_fim == ""){alert("Verifique as datas digitadas!");exit;};
      if(aid === ''){alert("Selecione um bairro!");exit;};
      if(descricao === ''){alert("descricao Vazia");exit;};
      
  
      if(estilo_mapa == 0){

        
        $.ajax({
          dataType: "json",
          type: "GET",
          url: "config/update_query.php", 
          data: {"aid": aid, "desc": descricao, "data_i": data_ini, "data_f": data_fim, "func" : "atualiza_desc"},
          success: function(resp){
            alert(resp['RESPOSTA']);
          },
          error: function(){
            alert("ERROR");
          }
   
        });
        
        
        
      }
    }
  )


  $('#visualiza-programado').click(
    function(){

      $('#resultado').slideUp('slow');
      $('#parada_prog_adm').slideDown('slow');



      document.getElementById('visualiza-mapa-normal').className  = 'desactive';
      document.getElementById('visualiza-programado').className  = 'active';
      estilo_mapa = 1;
      if(estilo_mapa == 1){
       $.ajax({
         dataType: "json",
         type: "GET",
         url: "config/cadastro/setmapa.php",
         data: {"func": "estiloMapaProgramado"},
         beforeSend: function(){
          $( "#mapa" ).hide();
          //$("#conteudo").html("<b>Carregando...</b>");
          $("#carregando").show();  
          },
         success: function(data) 
         {
          $( "#mapa" ).show( "slow");
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
    function(){

      $('#parada_prog_adm').slideUp('slow');
      $('#resultado').slideDown('slow');
      mudaEstiloMapaNormal();
      document.getElementById('visualiza-mapa-normal').className  = 'active';
      document.getElementById('visualiza-programado').className  = 'desactive';
    } 
  )




  $('#atualiza-programado').click(
    function(){
      var data_ini  = document.getElementById('data-programado').value, 
      descricao = document.getElementById('descricao-programado').value;
      
      
      $.ajax({
        dataType: "json",
        type: "GET",
        url: "config/update_query.php", 
        data: {desc: descricao, data_i: data_ini, func: "atualiza_parada"}, 
        succes: function(data)
        {
          alert("ATualizado!");
          console.log(data);

        }
      })
      
  mudaEstiloMapaNormal();
  
  var paths = document.querySelectorAll('path'),
  i = paths.length;
  for (; i--;) {
    paths[i].addEventListener('click', pathclick);
  }
  
  
}());


$(
  function(){
    $('#sair').click(
      function(){

        if(confirm("Deseja sair?")){

          $.ajax({
            type: "POST",
            url: "config/seguranca/seguranca.php",
            data: "sair: 'sair'",
            success: function(data) 
            {
             javascript:location.href="index.php";
           }
         })
        }
      })
  } 
  )




//Pagina CADASTRO
var aberto = 0;
$('#cadastrar-label-user').click(function(){  

  if(aberto == 0){    
    $('#cadastrar-corpo-user').slideDown('slow');
    $('#relatorio').slideUp('slow');   
    aberto = 1;

  }else{if(aberto == 1){
    $('#cadastrar-corpo-user').slideUp('slow');
    $('#relatorio').slideUp('slow');
    $('#cadastrar-label-rel').slideDown('slow');

    aberto = 0;
  }
  }
})

$('#editar-label-user').click(function(){  

  if(aberto == 0){    
    $('#cadastrar-corpo-user').slideUp('slow');
    $('#relatorio').slideUp('slow');   
    $('#editar-corpo-user').slideDown('slow');  
    
    aberto = 1;

  }else{if(aberto == 1){
    $('#cadastrar-corpo-user').slideUp('slow');
    $('#relatorio').slideUp('slow');
    $('#editar-corpo-user').slideUp('slow');

    aberto = 0;
  }
  }
})

$('#cadastrar-label-rel').click(function(){  

  if(aberto == 0){    
    $('#relatorio').slideDown('slow');
  $('#cadastrar-corpo-user').slideUp('slow');
    aberto = 1;
    
  }else{if(aberto == 1){
    $('#cadastrar-corpo-user').slideUp('slow');
    $('#relatorio').slideUp('slow');
    $('#cadastrar-label-rel').slideDown('slow');

    aberto = 0;
  }
  }
})

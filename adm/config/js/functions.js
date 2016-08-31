var CTRL = 0;
var vetorBairro = new Array();


//Verifica se a tecla CTRL foi precionada.. caso sim funcao de selecionar varios bairros funciona.
$(window).keydown(function(e) {
  if (e.ctrlKey) {
    if (CTRL == 0) {
      CTRL = 1;
      document.getElementById('aid').innerHTML = "";
    }
    else {
      CTRL = 0;
    }
  }
})



//Funcao para selecionar varios bairros para alterar a descrição
function selecionaVariosBairros(bairro) {

  if (CTRL == 0) {
    document.getElementById('aid').innerHTML = "";
    document.getElementById('aid').innerHTML = bairro;
  }

  if (CTRL == 1) {
    vetorBairro = document.getElementById('aid').innerHTML.split(',');
    if (vetorBairro.indexOf(bairro) === -1) {
      document.getElementById('aid').innerHTML += bairro + ",";
    }
  }
}



//Função para pegar o path (Bairro do svg[xml]).
//Muda a classe (alerta/normal)
//Busca informações no banco de dados.
function pathclick(evt) {
  var tag = evt.target,
    valor = "normal";
  if (tag.getAttribute("class") === "normal") {
    valor = "alert";
  }
  tag.setAttribute("class", valor);

  if (estilo_mapa == 1) {
    $.get("config/update_query.php", {
      aid: tag.id,
      classe: valor,
      func: "atualiza_cor_parada"
    });
  }
  else {
    $.get("config/update_query.php", {
      aid: tag.id,
      classe: valor,
      func: "atualiza_cor"
    });
  }

  selecionaVariosBairros(tag.id);

  $.ajax({
    dataType: "json",
    type: "GET",
    url: "config/get_regioes.php",
    data: {
      "aid": tag.id
    },
    success: function(data) {
      console.log("get_regioes");
      document.getElementById('data_ini').value = data['data_ini'];
      document.getElementById('descricao').value = data['descricao'];
      document.getElementById('data_fim').value = data['data_fim'];
    },
    error: function(XMLHttpRequest, textStatus, errorThrown) {
      alert("Erro ao atualizar o mapa\n Atualize a págin");

    }
  })
}


//Funcao para mudar a cor do mapa automaticamente
function mudaEstiloMapaNormal() {
  estilo_mapa = 0;
  $.ajax({
    dataType: "json",
    type: "GET",
    url: "config/cadastro/setmapa.php",
    beforeSend: function() {
      $("#mapa").hide();
      //$("#conteudo").html("<b>Carregando...</b>");
      $("#carregando").show();
    },
    success: function(data) {
      $("#mapa").show("slow");

      $("#carregando").hide();

      var quebra;
      $(data).each(function(key, value) {
        quebra = value.toString().split(",");
        document.getElementById(quebra[0]).setAttribute('class', quebra[1]);
      })
    }
  })

}

//Função para limpar o formulario da área administrativa para edição do Bairro.
function limpaBairro(evt){
    document.getElementById('data_ini').value = "";
    document.getElementById('descricao').value = "";
    document.getElementById('data_fim').value = "";
    document.getElementById('aid').innerHTML = "";
}


//Metodo para adicionar novo usuario
//Pega as informações inseridas nos campos e atribui as variaveis.
//Chamando o arquivo cadastro/cad_usuario.php e passando as informações.
function cadastraUsuario(){
  
  var un = document.getElementById('user_user').value;
  var nome = document.getElementById('nome_user').value;
  var pw = document.getElementById('pass_user').value;
  var email = document.getElementById('email_user').value;

  $.ajax({
    dataType: "json",
    type: "GET",
    url: "config/cadastro/cad_usuario.php",
    data: {
      "un": un,
      "email": email,
      "nome": nome,
      "pw": pw
    },
    success: function(r) {
      alert(r['RESPOSTA']);
      location.reload();

    }
  })
  
}

function atualizaBairro(){
  
  var data_ini = document.getElementById('data_ini').value,
      descricao  = document.getElementById('descricao').value,
      data_fim   = document.getElementById('data_fim').value,
      aid        = document.getElementById('aid').innerHTML;

    if (data_ini == "" || data_fim == "") {
      alert("Verifique as datas digitadas!");
      exit;
    };
    if (aid === '') {
      alert("Selecione um bairro!");
      exit;
    };
    if (descricao === '') {
      alert("descricao Vazia");
      exit;
    };

    if (estilo_mapa == 0) {

      $.ajax({
        dataType: "json",
        type: "GET",
        url: "config/update_query.php",
        data: {
          "aid": aid,
          "desc": descricao,
          "data_i": data_ini,
          "data_f": data_fim,
          "func": "atualiza_desc"
        },
        success: function(resp) {
          alert(resp['RESPOSTA']);
        },
        error: function() {
          alert("ERROR");
        }

      });
    }
}


//Muda o mapa exibido para o mapa programado.
function visualizaMapaProgramado(){
  
  $('#resultado').slideUp('slow');
    $('#parada_prog_adm').slideDown('slow');

    document.getElementById('visualiza-mapa-normal').className = 'desactive';
    document.getElementById('visualiza-programado').className = 'active';
    
    estilo_mapa = 1;
    
    if (estilo_mapa == 1) {
      $.ajax({
        dataType: "json",
        type: "GET",
        url: "config/cadastro/setmapa.php",
        data: {
          "func": "estiloMapaProgramado"
        },
        beforeSend: function() {
          $("#mapa").hide();
          $("#carregando").show();
        },
        success: function(data) {
          $("#mapa").show("slow");
          $("#carregando").hide();
          var quebra;
          $(data).each(function(key, value) {
            quebra = value.toString().split(",");
            document.getElementById(quebra[0]).setAttribute('class', quebra[1]);
          })
        }
      })
    }
}


//Muda o mapa exibido para o mapa normal (O mapa usado para exibição dos problemas do dia).
function visualizaMapaNormal(){
  
   $('#parada_prog_adm').slideUp('slow');
    $('#resultado').slideDown('slow');
    mudaEstiloMapaNormal();
    document.getElementById('visualiza-mapa-normal').className = 'active';
    document.getElementById('visualiza-programado').className = 'desactive';
  
}

//Faz logOut do sistema
function logOut() {
  if (confirm("Deseja sair?")) {

    $.ajax({
      type: "POST",
      url: "config/seguranca/seguranca.php",
      data: "sair: 'sair'",
      success: function(data) {
        javascript: location.href = "index.php";
      }
    })
  }

}
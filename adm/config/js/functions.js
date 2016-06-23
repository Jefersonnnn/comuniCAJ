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


//document.getElementById('rio-bonito_1').addEventListener('click', pathclick);
//document.getElementById('c-silva_1').addEventListener('click', pathclick);





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

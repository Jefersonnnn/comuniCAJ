//Funcao para alterar FavIcon para o da Cia.
(function() {
    var link = document.createElement('link');
    link.type = 'image/x-icon';
    link.rel = 'shortcut icon';
    link.href = 'imagens/favicon.png';
    document.getElementsByTagName('head')[0].appendChild(link);
}());


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

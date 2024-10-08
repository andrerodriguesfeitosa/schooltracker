$(document).ready(function() {
    $('#money').inputmask('currency', { 
        prefix: 'R$ ',
        allowMinus: false,
        autoUnmask: true,
        rightAlign: false,
        digits: 2,  
        digitsOptional: false,
        decimalSeparator: ',',
        groupSeparator: '.',
        removeMaskOnSubmit: true
    });

    
    $('#ra').inputmask({
        mask: '99999999',
        definitions: {
            '9': {
                validator: '[0-9]',
                cardinality: 1
            }
        },
        placeholder: 'xxxxxxxx',
        autoUnmask: true,
        rightAlign: false,
        removeMaskOnSubmit: true
    });

    $('#ra').on('input', function() {
        var value = $(this).val().replace(/\D/g, '');
        if (value.length > 8) {
            $(this).val(value.slice(0, 8));
        }
    });
        
});

function verificaRA(ra) {
    if (ra.length === 8) {
        $.ajax({
            url: '/verificar_ra',
            type: 'POST',
            data: { ra: ra },
            success: function(response) {
                if (response.valido) {
                    $('#senha-container').show();
                    $('#entrar-button').show();
                    $('#mensagem-ra').hide();
                } else {
                    $('#senha-container').hide();
                    $('#entrar-button').hide();
                    $('#mensagem-ra').text("Digite um RA válido").show();
                }
            },
            error: function() {
                $('#senha-container').hide();
                $('#entrar-button').hide();
                $('#mensagem-ra').text("Erro ao verificar RA").show();
            }
        });
    } else {
        $('#senha-container').hide();
        $('#entrar-button').hide();
        $('#mensagem-ra').hide();
    }
};


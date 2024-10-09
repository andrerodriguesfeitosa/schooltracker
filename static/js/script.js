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


//Scripts SENIA

const statusText = document.getElementById('status-text');
const statusIcon = document.getElementById('status-icon');
const microphoneStatus = document.getElementById('microphone-status');

function getFemaleVoice() {
    return new Promise((resolve) => {
        window.speechSynthesis.onvoiceschanged = function() {
            const voices = window.speechSynthesis.getVoices();
            const femaleVoice = voices.find(voice => voice.name.includes('Microsoft Maria'));
            resolve(femaleVoice || voices[0]); 
        };
    });
}

document.getElementById('activate-senia').addEventListener('click', async function() {
    const nome = '{{ aluno.nome }}';
    const femaleVoice = await getFemaleVoice();
    const msg = new SpeechSynthesisUtterance(`Olá ${nome}, sou a SENIA, sua assistente virtual e gostaria de saber como foi sua aula hoje.`);
    msg.voice = femaleVoice;

    window.speechSynthesis.speak(msg);

    msg.onend = function() {
        startRecognition();
    };
});

function startRecognition() {
    const recognition = new (window.SpeechRecognition || window.webkitSpeechRecognition)();
    recognition.lang = 'pt-BR';

    recognition.onstart = function() {
        microphoneStatus.style.display = 'block';
        statusText.textContent = 'Microfone ativado, escutando...';
        statusIcon.className = 'fas fa-microphone';
    };

    recognition.onresult = function(event) {
        const texto = event.results[0][0].transcript;
        document.getElementById('texto').value = texto;
    };

    recognition.onerror = function(event) {
        statusText.textContent = 'Erro no reconhecimento de voz: ' + event.error;
        statusIcon.className = 'fas fa-exclamation-triangle';
    };

    recognition.onend = function() {
        setTimeout(() => {
            statusText.textContent = 'Microfone desativado.';
            statusIcon.className = 'fas fa-microphone-slash'; 
            microphoneStatus.style.display = 'none'; 
        }, 2000); 
    };

    recognition.start();
}

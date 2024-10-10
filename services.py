from flask import redirect, url_for, session
import hashlib
from textblob import TextBlob
from googletrans import Translator
from functools import wraps

def criptografar_senha(senha):
    return hashlib.md5(senha.encode()).hexdigest()

def aluno_required(f):
    @wraps(f)
    def decorated_function(ra, *args, **kwargs):
        if 'user_id' not in session or session['user_id'] != ra:
            return redirect(url_for('index'))
        return f(ra, *args, **kwargs)
    return decorated_function

def admin_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if 'user_id' not in session or session['user_id'] != 'admin':
            return redirect(url_for('admin_login'))
        return f(*args, **kwargs)
    return decorated_function

def analisar_sentimento(texto):
    translator = Translator()

    if not texto:
        return 'neutro'
    try:
        texto_traduzido = translator.translate(texto, src='pt', dest='en').text
        
        sentimento = TextBlob(texto_traduzido).sentiment
        polaridade = sentimento.polarity

        if polaridade > 0:
            return 'feliz'
        elif polaridade < 0:
            return 'triste'
        else:
            return 'neutro'
    except Exception as e:
        return 'neutro'
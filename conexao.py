from abc import ABC, abstractmethod
from sqlalchemy import create_engine
import urllib.parse

class Conexao(ABC):
    @abstractmethod
    def get_engine(self):
        pass

class ConexaoSingleton(Conexao):
    _instance = None
    _engine = None

    def __new__(cls, *args, **kwargs):
        if cls._instance is None:
            cls._instance = super(ConexaoSingleton, cls).__new__(cls, *args, **kwargs)
            cls._engine = cls._create_engine()
        return cls._instance
    
    @staticmethod
    def _create_engine():
        user = 'root'
        password = urllib.parse.quote_plus('senai@123')
        host = 'localhost'
        database = 'schooltracker'
        connection_string = f'mysql+pymysql://{user}:{password}@{host}/{database}'
        return create_engine(connection_string)

    def get_engine(self):
        return self._engine

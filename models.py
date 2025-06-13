from sqlalchemy import Column, Integer, String, ForeignKey, Date
from sqlalchemy.orm import relationship
from database import Base

class Entidade(Base):
    __tablename__ = 'entidades'
    id = Column(Integer, primary_key=True, index=True)
    nome = Column(String(100), nullable=False)


class Servidor(Base):
    __tablename__ = 'servidores'
    id = Column(Integer, primary_key=True, index=True)
    cpf = Column(String(14), unique=True, nullable=False)
    matricula = Column(String(20), unique=True, nullable=False)
    nome = Column(String(100), nullable=False)
    venc_base = Column(String(20), nullable=True)
    jornada = Column(String(20), nullable=True)
    funcao = Column(String(100), nullable=True)
    admissao = Column(Date, nullable=True)
    cargo = Column(String(100), nullable=True)
    investidura = Column(String(100), nullable=True)
    lotacao = Column(String(100), nullable=True)
    id_entidade = Column(Integer, nullable=False)
    mes = Column(Integer, nullable=False)
    ano = Column(Integer, nullable=False)
    
class LOA(Base):
    __tablename__ = 'loa'
    id = Column(Integer, primary_key=True, index=True)
    ano = Column(Integer, nullable=False)
    documento = Column(String(100), nullable=False)
    numero = Column(String(10), nullable=False)
    titulo = Column(String(200), nullable=False)
    arquivo = Column(String(500), nullable=False)
    
class LDO(Base):
    __tablename__ = 'ldo'
    id = Column(Integer, primary_key=True, index=True)
    ano = Column(Integer, nullable=False)
    documento = Column(String(100), nullable=False)
    numero = Column(String(10), nullable=False)
    titulo = Column(String(200), nullable=False)
    arquivo = Column(String(500), nullable=False)
    
class PPA(Base):
    __tablename__ = 'ppa'
    id = Column(Integer, primary_key=True, index=True)
    ano = Column(Integer, nullable=False)
    documento = Column(String(100), nullable=False)
    numero = Column(String(10), nullable=False)
    titulo = Column(String(200), nullable=False)
    arquivo = Column(String(500), nullable=False)
    
class Prestacao_Contas(Base):
    __tablename__ = 'prestacao_contas'
    id = Column(Integer, primary_key=True, index=True)
    ano = Column(Integer, nullable=False)
    arquivo = Column(String(500), nullable=False)
    demais_atos = Column(String(500), nullable=True)
    
from sqlalchemy import Column, Integer, String, ForeignKey, Date, Text
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
    id_entidade = Column(Integer, nullable=False)
    
    
class LDO(Base):
    __tablename__ = 'ldo'
    id = Column(Integer, primary_key=True, index=True)
    ano = Column(Integer, nullable=False)
    documento = Column(String(100), nullable=False)
    numero = Column(String(10), nullable=False)
    titulo = Column(String(200), nullable=False)
    arquivo = Column(String(500), nullable=False)
    id_entidade = Column(Integer, nullable=False)
    
    
class PPA(Base):
    __tablename__ = 'ppa'
    id = Column(Integer, primary_key=True, index=True)
    ano = Column(Integer, nullable=False)
    documento = Column(String(100), nullable=False)
    numero = Column(String(10), nullable=False)
    titulo = Column(String(200), nullable=False)
    arquivo = Column(String(500), nullable=False)
    id_entidade = Column(Integer, nullable=False)
    
    
class Prestacao_Contas(Base):
    __tablename__ = 'prestacao_contas'
    id = Column(Integer, primary_key=True, index=True)
    ano = Column(Integer, nullable=False)
    arquivo = Column(String(500), nullable=False)
    demais_atos = Column(String(500), nullable=True)
    id_entidade = Column(Integer, nullable=False)
    
class Licitacoes(Base):
    __tablename__ = 'licitacoes'
    id = Column(Integer, primary_key=True, index=True)
    sequecial = Column(String(20), nullable=False)
    processo = Column(String(100), nullable=False)
    modalidade = Column(String(50), nullable=False)
    data =  Column(Date, nullable=False)
    ano = Column(Integer, nullable=False)
    processo_srp = Column(String(1), nullable=True)
    objeto = Column(Text, nullable=False)
    fase = Column(String(50), nullable=False)
    situacao = Column(String(50), nullable=False)
    valor_estimado = Column(String(20), nullable=True)
    homologado = Column(String(30), nullable=True)
    anexos = Column(String(500), nullable=True)
    entidade = Column(String(100), nullable=False)
    id_entidade = Column(Integer, nullable=False)
    
class Contratos(Base):
    __tablename__ = 'contratos'
    id = Column(Integer, primary_key=True, index=True)
    numero = Column(String(20), nullable=False)
    ano = Column(Integer, nullable=False)
    cpf_cnpj = Column(String(20), nullable=False)
    razao_social = Column(String(100), nullable=False)
    objeto = Column(Text, nullable=False)
    vigencia_inicio = Column(Date, nullable=False)
    vigencia_fim = Column(Date, nullable=False)
    processo = Column(String(100), nullable=False)
    valor_contratual = Column(String(20), nullable=False)
    tipo_instrumento = Column(String(50), nullable=False)
    unidade_gestora = Column(String(100), nullable=False)
    id_entidade = Column(Integer, nullable=False)
    
class Despesas(Base):
    __tablename__ = 'despesas'
    id = Column(Integer, primary_key=True, index=True)
    ano = Column(Integer, nullable=False)
    data = Column(Date, nullable=False)
    fase_despesa = Column(String(50), nullable=False)
    empenho = Column(String(20), nullable=False)
    documento = Column(String(100), nullable=False)
    fornecedor = Column(String(100), nullable=False)
    data_empenho = Column(Date, nullable=False)
    tipo_empenho = Column(String(50), nullable=False)
    valor_empenhado = Column(String(20), nullable=False)
    valor_liquidado = Column(String(20), nullable=False)
    valor_pago = Column(String(20), nullable=False)
    elemento = Column(String(20), nullable=False)
    unidade_orcamentaria = Column(String(100), nullable=False)
    categoria = Column(String(50), nullable=False)
    programa = Column(String(50), nullable=False)
    funcao = Column(String(50), nullable=False)
    subfuncao = Column(String(50), nullable=False)
    natureza_despesa = Column(String(50), nullable=False)
    fonte_recurso = Column(String(20), nullable=False)
    acao = Column(String(20), nullable=False)
    grupo = Column(String(50), nullable=False)
    natureza = Column(String(50), nullable=False)
    despesa = Column(String(20), nullable=False)
    num_proc_licitacao = Column(String(100), nullable=True)
    id_entidade = Column(Integer, nullable=False)

class Receitas(Base):
    __tablename__ = 'receitas'
    id = Column(Integer, primary_key=True, index=True)
    mes = Column(Integer, nullable=False)
    ano = Column(Integer, nullable=False)
    codigo = Column(String(50), nullable=False)
    origem = Column(String(100), nullable=False)
    descricao = Column(String(200), nullable=False)
    data = Column(Date, nullable=False)
    previsao = Column(String(20), nullable=False)
    arrecadacao = Column(String(20), nullable=False)
    arrecadado = Column(String(20), nullable=False)
    lancado = Column(String(20), nullable=True)
    periodo = Column(String(20), nullable=True)
    competencia = Column(String(20), nullable=True)
    id_entidade = Column(Integer, nullable=False)
    
class Relatorio_Gestao_Fiscal(Base):
    __tablename__ = 'relatorio_gestao_fiscal'
    id = Column(Integer, primary_key=True, index=True)
    ano = Column(Integer, nullable=False)
    documento = Column(String(100), nullable=False)
    numero = Column(String(10), nullable=False)
    titulo = Column(String(200), nullable=False)
    anexo = Column(String(500), nullable=False)
    id_entidade = Column(Integer, nullable=False)

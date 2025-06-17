from fastapi import FastAPI, Depends, Request, Query
from fastapi.responses import JSONResponse
from slowapi import Limiter, _rate_limit_exceeded_handler
from slowapi.util import get_remote_address
from slowapi.errors import RateLimitExceeded
from sqlalchemy.orm import Session
from sqlalchemy import between
from database import get_db
from models import Servidor, LOA, LDO, PPA, Prestacao_Contas, Entidade, Licitacoes, Contratos, Despesas, Relatorio_Gestao_Fiscal
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import PlainTextResponse

limiter = Limiter(key_func=get_remote_address)
app = FastAPI()
app.state.limiter = limiter
app.add_exception_handler(RateLimitExceeded, _rate_limit_exceeded_handler)

@app.get("/")
def index():
    return {"message": "Hello, World!"}


def valida_id_entidade(
    id_entidade: int,
    db: Session = Depends(get_db)   
):
    entidade = db.query(Entidade).filter(Entidade.id == id_entidade).first()
    if not entidade:
        return False
    else:
        return True
    
    
@app.get("/consulta_salario_servidores/{id_entidade}")
@limiter.limit("5/minute")
def consulta_salario_servidores(
    request: Request,
    id_entidade: int, 
    db: Session = Depends(get_db)
):
    entidade = valida_id_entidade(id_entidade, db)
    
    if entidade == False:
        return JSONResponse(status_code=404, content={"message": "Entidade não encontrada"})
    elif entidade == True and db.query(Servidor).filter(Servidor.id_entidade == id_entidade).count() < 1:
        return JSONResponse(status_code=404, content={"message": "Não há dados suficientes para esta entidade"})
    else:
        servidores = db.query(Servidor).filter(Servidor.id_entidade == id_entidade).all()
        return servidores
    
@app.get("/consulta_servidores_filtrado/{id_entidade}")
@limiter.limit("5/minute")
def consulta_servidores_filtrado(
    request: Request,
    id_entidade: int,
    ano: int = Query(None, description="Ano de referência"),
    mes: int = Query(None, description="Mês de referência"),
    lotacao: str = Query('', description="Lotação do servidor"),
    investidura: str = Query('', description="Tipo de investidura do servidor"),
    db: Session = Depends(get_db)
):
    entidade = valida_id_entidade(id_entidade, db)
    
    if entidade == False:
        return JSONResponse(status_code=404, content={"message": "Entidade não encontrada"})
    elif entidade == True and db.query(Servidor).filter(Servidor.id_entidade == id_entidade).count() < 1:
        return JSONResponse(status_code=404, content={"message": "Não há dados suficientes para esta entidade"})
    else:
        query = db.query(Servidor).filter(
            Servidor.id_entidade == id_entidade,
            Servidor.ano == ano if ano is not None else True,
            Servidor.mes == mes if mes is not None else True
        )
        if lotacao:
            query = query.filter(Servidor.lotacao == lotacao)
        if investidura:
            query = query.filter(Servidor.investidura == investidura)
            
        return query.all()  
    

@app.get("/consulta_loa/{id_entidade}")
@limiter.limit("5/minute")
def consulta_loa(
    request: Request,
    id_entidade: int,
    data_inicial: str = Query(None, description="Data inicial no formato YYYY-MM-DD"),
    data_final: str  = Query(None, description="Data final no formato YYYY-MM-DD"),
    db: Session = Depends(get_db)
):
    entidade = valida_id_entidade(id_entidade, db)
    # Valida se a entidade existe e se há dados suficientes
    
    if entidade == False:
        return JSONResponse(status_code=404, content={"message": "Entidade não encontrada"})
    elif entidade == True and db.query(Servidor).filter(Servidor.id_entidade == id_entidade).count() < 1:
        return JSONResponse(status_code=404, content={"message": "Não há dados suficientes para esta entidade"})
    else:
        if data_inicial and data_final:
            query = db.query(LOA).filter(between(LOA.ano, data_inicial, data_final))
            return query.all()
        else:
            query = db.query(LOA)
            return query.all()

@app.get("/consulta_ldo/{id_entidade}")
@limiter.limit("5/minute")
def consulta_ldo(
    request: Request,
    id_entidade: int,
    data_inicial: str = Query(None, description="Data inicial no formato YYYY-MM-DD"),
    data_final: str  = Query(None, description="Data final no formato YYYY-MM-DD"),
    db: Session = Depends(get_db)
):
    entidade = valida_id_entidade(id_entidade, db)
    # Valida se a entidade existe e se há dados suficientes
    
    if entidade == False:
        return JSONResponse(status_code=404, content={"message": "Entidade não encontrada"})
    elif entidade == True and db.query(Servidor).filter(Servidor.id_entidade == id_entidade).count() < 1:
        return JSONResponse(status_code=404, content={"message": "Não há dados suficientes para esta entidade"})
    else:
        if data_inicial and data_final:
            query = db.query(LDO).filter(between(LDO.ano, data_inicial, data_final))
            return query.all()
        else:
            query = db.query(LDO)
            return query.all()  
    
@app.get("/consulta_ppa/{id_entidade}")
@limiter.limit("5/minute")
def consulta_ppa(
    request: Request,
    id_entidade: int,
    data_inicial: str = Query(None, description="Data inicial no formato YYYY-MM-DD"),
    data_final: str  = Query(None, description="Data final no formato YYYY-MM-DD"),
    db: Session = Depends(get_db)
):
    entidade = valida_id_entidade(id_entidade, db)
    # Valida se a entidade existe e se há dados suficientes
    
    if entidade == False:
        return JSONResponse(status_code=404, content={"message": "Entidade não encontrada"})
    elif entidade == True and db.query(Servidor).filter(Servidor.id_entidade == id_entidade).count() < 1:
        return JSONResponse(status_code=404, content={"message": "Não há dados suficientes para esta entidade"})
    else:
        if data_inicial and data_final:
            query = db.query(PPA).filter(between(PPA.ano, data_inicial, data_final))
            return query.all()
        else:
            query = db.query(PPA)
            return query.all()  
    
@app.get("/consulta_prestacao_contas/{id_entidade}")
@limiter.limit("5/minute")
def consulta_prestacao_contas(
    request: Request,
    id_entidade: int,
    ano: int = Query(None, description="Ano de referência"),
    db: Session = Depends(get_db)
):
    entidade = valida_id_entidade(id_entidade, db)
    # Valida se a entidade existe e se há dados suficientes
    if entidade == False:
        return JSONResponse(status_code=404, content={"message": "Entidade não encontrada"})
    elif entidade == True and db.query(Prestacao_Contas).filter(Prestacao_Contas.id_entidade == id_entidade).count() < 1:
        return JSONResponse(status_code=404, content={"message": "Não há dados suficientes para esta entidade"})
    else:
        query = db.query(Prestacao_Contas)
        if ano:
            query = db.query(Prestacao_Contas).filter(Prestacao_Contas.ano == ano)
            return query.all()
        else:
            query = db.query(Prestacao_Contas)
            return query.all()
        
@app.get("/consulta_licitacoes/{id_entidade}")
@limiter.limit("5/minute")
def consulta_licitacoes(
    request: Request,
    id_entidade: int,
    db: Session = Depends(get_db),
    data_inicial: str = Query(None, description="Data inicial no formato YYYY-MM-DD"),
    data_final: str = Query(None, description="Data final no formato YYYY-MM-DD"),
    ano: int = Query(None, description="Ano de referência"),
    processo_srp: str = Query(None, description="Filtrar por processo SRP (S/N)"),
    modalidade: str = Query(None, description="Modalidade da licitação"),
    situacao : str = Query(None, description="Situação da licitação"),
    entidade: str = Query(None, description="Entidade responsável pela licitação")
    
):
    entidade = valida_id_entidade(id_entidade, db)
    # Valida se a entidade existe e se há dados suficientes
    
    if entidade == False:
        return JSONResponse(status_code=404, content={"message": "Entidade não encontrada"})
    elif entidade == True and db.query(Prestacao_Contas).filter(Prestacao_Contas.id_entidade == id_entidade).count() < 1:
        return JSONResponse(status_code=404, content={"message": "Não há dados suficientes para esta entidade"})
    else:
        query = db.query(Licitacoes).filter(
            Licitacoes.id_entidade == id_entidade,
            Licitacoes.ano == ano if ano is not None else True,
            Licitacoes.processo_srp == processo_srp if processo_srp is not None else True,
            Licitacoes.modalidade == modalidade if modalidade is not None else True,
            Licitacoes.situacao == situacao if situacao is not None else True,
            Licitacoes.entidade == entidade if entidade is not None else True
        )
        
        if data_inicial and data_final:
            query = query.filter(
                between(Licitacoes.data, data_inicial, data_final)
            )
        
        return query.all()  
    
@app.get("/consulta_contratos/{id_entidade}")
@limiter.limit("5/minute")
def consulta_contratos(
    request: Request,
    id_entidade: int,
    db: Session = Depends(get_db),
    ano: int = Query(None, description="Ano de referência"),
    data_inicial: str = Query(None, description="Data inicial no formato YYYY-MM-DD"),
    data_final: str = Query(None, description="Data final no formato YYYY-MM-DD"),
    tipo_instrumento: str = Query(None, description="Tipo de instrumento do contrato"),
    unidade_gestora: str = Query(None, description="Unidade gestora do contrato")
):
    entidade = valida_id_entidade(id_entidade, db)
    # Valida se a entidade existe e se há dados suficientes
    
    if entidade == False:
        return JSONResponse(status_code=404, content={"message": "Entidade não encontrada"})
    elif entidade == True and db.query(Prestacao_Contas).filter(Prestacao_Contas.id_entidade == id_entidade).count() < 1:
        return JSONResponse(status_code=404, content={"message": "Não há dados suficientes para esta entidade"})
    else:
        query = db.query(Contratos).filter(
            Contratos.id_entidade == id_entidade,
            Contratos.ano == ano if ano is not None else True,
            Contratos.tipo_instrumento == tipo_instrumento if tipo_instrumento is not None else True,
            Contratos.unidade_gestora == unidade_gestora if unidade_gestora is not None else True
        )
        if data_inicial and data_final:
            query = query.filter(
                between(Contratos.vigencia_inicio, data_inicial, data_final)
            )
        return query.all() 
    
@app.get("/consulta_despesas/{id_entidade}")
@limiter.limit("5/minute")
def consulta_despesas(
    request: Request,
    id_entidade: int,
    db: Session = Depends(get_db),
    ano: int = Query(None, description="Ano de referência"),
    data_inicial: str = Query(None, description="Data inicial no formato YYYY-MM-DD"),
    data_final: str = Query(None, description="Data final no formato YYYY-MM-DD"),
    fase_despesa: str = Query(None, description="Fase da despesa"),
    documento: str = Query(None, description="Número do documento"),
    empenho: str = Query(None, description="Número do empenho"),
    natureza_despesa: str = Query(None, description="Natureza da despesa")
):
    entidade = valida_id_entidade(id_entidade, db)
    # Valida se a entidade existe e se há dados suficientes
    
    if entidade == False:
        return JSONResponse(status_code=404, content={"message": "Entidade não encontrada"})
    elif entidade == True and db.query(Prestacao_Contas).filter(Prestacao_Contas.id_entidade == id_entidade).count() < 1:
        return JSONResponse(status_code=404, content={"message": "Não há dados suficientes para esta entidade"})
    else:
        query = db.query(Despesas).filter(
            Despesas.id_entidade == id_entidade,
            Despesas.ano == ano if ano is not None else True,
            Despesas.fase_despesa == fase_despesa if fase_despesa is not None else True,
            Despesas.documento == documento if documento is not None else True,
            Despesas.empenho == empenho if empenho is not None else True,
            Despesas.natureza_despesa == natureza_despesa if natureza_despesa is not None else True
        )
        if data_inicial and data_final:
            query = query.filter(
                between(Despesas.data, data_inicial, data_final)
            )
            
        return query.all() 

@app.get("/consulta_receitas/{id_entidade}")
@limiter.limit("5/minute")
def consulta_receitas(
    request: Request,
    id_entidade: int,
    db: Session = Depends(get_db),
    ano: int = Query(None, description="Ano de referência"),
):
    entidade = valida_id_entidade(id_entidade, db)
    # Valida se a entidade existe e se há dados suficientes

    if entidade == False:
        return JSONResponse(status_code=404, content={"message": "Entidade não encontrada"})
    elif entidade == True and db.query(Prestacao_Contas).filter(Prestacao_Contas.id_entidade == id_entidade).count() < 1:
        return JSONResponse(status_code=404, content={"message": "Não há dados suficientes para esta entidade"})
    else:
        query = db.query(Despesas).filter(
            Despesas.id_entidade == id_entidade,
            Despesas.ano == ano if ano is not None else True
        )
        return query.all()
    
@app.get("/consulta_rgf/{id_entidade}")
@limiter.limit("5/minute")
def consulta_rgf(
    request: Request,
    id_entidade: int,
    ano: int = Query(None, description="Ano de referência"),
    data_inicial: str = Query(None, description="Data inicial no formato YYYY-MM-DD"),
    data_final: str  = Query(None, description="Data final no formato YYYY-MM-DD"),
    db: Session = Depends(get_db)
):
    entidade = valida_id_entidade(id_entidade, db)
    # Valida se a entidade existe e se há dados suficientes
    
    query = db.query(Servidor).filter(
        Relatorio_Gestao_Fiscal.id_entidade == id_entidade,
        Relatorio_Gestao_Fiscal.ano == ano if ano is not None else True    
    )
    
    if entidade == False:
        return JSONResponse(status_code=404, content={"message": "Entidade não encontrada"})
    elif entidade == True and db.query(Servidor).filter(Servidor.id_entidade == id_entidade).count() < 1:
        return JSONResponse(status_code=404, content={"message": "Não há dados suficientes para esta entidade"})
    else:
        
        if data_inicial and data_final:
            query = db.query(Relatorio_Gestao_Fiscal).filter(between(Relatorio_Gestao_Fiscal.ano, data_inicial, data_final))
            return query.all()
        else:
            query = db.query(Relatorio_Gestao_Fiscal)
            return query.all()  
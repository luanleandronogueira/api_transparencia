from fastapi import FastAPI, Depends, Request, Query
from fastapi.responses import JSONResponse
from slowapi import Limiter, _rate_limit_exceeded_handler
from slowapi.util import get_remote_address
from slowapi.errors import RateLimitExceeded
from sqlalchemy.orm import Session
from sqlalchemy import between
from database import get_db
from models import Servidor, LOA, LDO, PPA, Prestacao_Contas, Entidade
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
    
@app.get("/consulta_servidores_filtrado")
@limiter.limit("5/minute")
def consulta_servidores_filtrado(
    request: Request,
    ano: int = Query(..., description="Ano de referência"),
    mes: int = Query(..., description="Mês de referência"),
    lotacao: str = Query('', description="Lotação do servidor"),
    investidura: str = Query('', description="Tipo de investidura do servidor"),
    db: Session = Depends(get_db)
):
    query = db.query(Servidor).filter(Servidor.ano == ano, Servidor.mes == mes)
    
    if lotacao != '':
        query = query.filter(Servidor.lotacao == lotacao)
    if investidura != '':
        query = query.filter(Servidor.investidura == investidura)
    if lotacao != '' and investidura != '':
        query = query.filter(Servidor.lotacao == lotacao, Servidor.investidura == investidura)
        
    return query.all()

@app.get("/consulta_loa")
@limiter.limit("5/minute")
def consulta_loa(
    request: Request,
    data_inicial: str = Query(None, description="Data inicial no formato YYYY-MM-DD"),
    data_final: str  = Query(None, description="Data final no formato YYYY-MM-DD"),
    db: Session = Depends(get_db)
):
    if data_inicial and data_final:
        query = db.query(LOA).filter(between(LOA.ano, data_inicial, data_final))
        return query.all()
    else:
        query = db.query(LOA)
        return query.all()

@app.get("/consulta_ldo")
@limiter.limit("5/minute")
def consulta_ldo(
    request: Request,
    data_inicial: str = Query(None, description="Data inicial no formato YYYY-MM-DD"),
    data_final: str  = Query(None, description="Data final no formato YYYY-MM-DD"),
    db: Session = Depends(get_db)
):
    if data_inicial and data_final:
        query = db.query(LDO).filter(between(LDO.ano, data_inicial, data_final))
        return query.all()
    else:
        query = db.query(LDO)
        return query.all()  
    
@app.get("/consulta_ppa")
@limiter.limit("5/minute")
def consulta_ppa(
    request: Request,
    data_inicial: str = Query(None, description="Data inicial no formato YYYY-MM-DD"),
    data_final: str  = Query(None, description="Data final no formato YYYY-MM-DD"),
    db: Session = Depends(get_db)
):
    if data_inicial and data_final:
        query = db.query(PPA).filter(between(PPA.ano, data_inicial, data_final))
        return query.all()
    else:
        query = db.query(PPA)
        return query.all()  
    
@app.get("/consulta_prestacao_contas")
@limiter.limit("5/minute")
def consulta_prestacao_contas(
    request: Request,
    ano: int = Query(None, description="Ano de referência"),
    db: Session = Depends(get_db)
):
    query = db.query(Prestacao_Contas)
    
    if ano:
        query = db.query(Prestacao_Contas).filter(Prestacao_Contas.ano == ano)
        return query.all()
    else:
        query = db.query(Prestacao_Contas)
        return query.all()
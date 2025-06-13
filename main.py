from fastapi import FastAPI, Depends, Request, Query
from fastapi.responses import JSONResponse
from slowapi import Limiter, _rate_limit_exceeded_handler
from slowapi.util import get_remote_address
from slowapi.errors import RateLimitExceeded
from sqlalchemy.orm import Session
from sqlalchemy import between
from database import get_db
from models import Servidor
from models import LOA


limiter = Limiter(key_func=get_remote_address)
app = FastAPI()
app.state.limiter = limiter
app.add_exception_handler(RateLimitExceeded, _rate_limit_exceeded_handler)

@app.get("/")
def index():
    return {"message": "Hello, World!"}

@app.get("/consulta_salario_servidores")
@limiter.limit("5/minute")
def consulta_salario_servidores(request: Request, db: Session = Depends(get_db)):
    servidores = db.query(Servidor).all()
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
    data_final: str = Query(None, description="Data final no formato YYYY-MM-DD"),
    db: Session = Depends(get_db)
):
    if data_inicial and data_final:
        query = db.query(LOA).filter(between(LOA.ano, data_inicial, data_final))
        return query.all()
    else:
        query = db.query(LOA)
        return query.all()
    
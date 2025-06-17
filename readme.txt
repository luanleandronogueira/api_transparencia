# API Transparência

Este projeto é uma API desenvolvida em **FastAPI** para consulta de dados públicos relacionados à transparência, como informações de servidores, LOA, LDO, PPA, licitações, contratos, despesas e outros dados de interesse público.

## Funcionalidades

- Consulta de servidores públicos com filtros por ano, mês, lotação e investidura.
- Consulta de leis orçamentárias (LOA, LDO, PPA).
- Consulta de licitações, contratos e despesas.
- Limite de requisições por IP (rate limiting) para evitar abusos.
- Autenticação opcional via Bearer Token para rotas sensíveis.

## Tecnologias Utilizadas

- [FastAPI](https://fastapi.tiangolo.com/)
- [SQLAlchemy](https://www.sqlalchemy.org/)
- [Alembic](https://alembic.sqlalchemy.org/) (migrations)
- [MySQL](https://www.mysql.com/) (ou outro banco relacional)
- [slowapi](https://pypi.org/project/slowapi/) (rate limiting)
- [python-dotenv](https://pypi.org/project/python-dotenv/) (variáveis de ambiente)

## Pré-requisitos

- Python 3.8+
- MySQL ou outro banco relacional compatível
- Redis (opcional, se usar fastapi-limiter)
- Docker (opcional, para rodar banco/redis em container)

## Instalação

1. Clone o repositório:
    ```
    git clone https://github.com/seuusuario/api_transparencia.git
    cd api_transparencia
    ```

2. Crie e ative um ambiente virtual:
    ```
    python -m venv venv
    venv\Scripts\activate  # Windows
    source venv/bin/activate  # Linux/Mac
    ```

3. Instale as dependências:
    ```
    pip install -r requirements.txt
    ```

4. Configure o arquivo `.env` com as informações do seu banco de dados:
    ```
    DB_USER=seu_usuario
    DB_PASSWORD=sua_senha
    DB_HOST=localhost
    DB_NAME=nome_do_banco
    ```

5. Execute as migrations para criar as tabelas:
    ```
    alembic upgrade head
    ```

6. Inicie o servidor FastAPI:
    ```
    uvicorn main:app --reload
    ```

7. Acesse a documentação interativa:
    ```
    http://127.0.0.1:8000/docs
    ```

## Exemplos de Uso

- Consulta de servidores:
    ```
    GET /consulta_salario_servidores/{id_entidade}
    ```

- Consulta de LOA:
    ```
    GET /consulta_loa/{data_inicio}/{data_fim}
    ```

- Consulta com filtros:
    ```
    GET /consulta_salario_servidores?ano=2025&mes=1&lotacao=TODOS&investidura=TODOS
    ```

## Segurança

- Algumas rotas podem exigir autenticação via Bearer Token.
- O rate limiting está configurado para evitar abusos.

## Contribuição

**Desenvolvido por It Soluções Inteligentes (Luan Leandro Nogueira)**
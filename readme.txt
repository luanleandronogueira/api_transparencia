# API Transparência

Este projeto é uma API desenvolvida em **FastAPI** para consulta de dados públicos relacionados à transparência municipal, utilizando um banco de dados MySQL/MariaDB. O sistema permite acessar informações sobre servidores, contratos, despesas, receitas, leis orçamentárias, licitações, prestação de contas e mais.

---

## Tabelas do Banco de Dados

O banco de dados `db_api_transparencia` possui as seguintes tabelas principais:

- **servidores**: Dados dos servidores públicos (id, cpf, matrícula, nome, venc_base, jornada, função, admissão, cargo, investidura, lotação, id_entidade, mês, ano)
- **contratos**: Contratos firmados (id, número, ano, cpf_cnpj, razão social, objeto, vigência, processo, valor, tipo, unidade gestora, id_entidade)
- **despesas**: Despesas públicas detalhadas (id, ano, data, fase, empenho, fornecedor, valores, elementos, unidade orçamentária, categoria, programa, função, subfunção, natureza, fonte, ação, grupo, despesa, licitação, id_entidade)
- **entidades**: Entidades públicas cadastradas (id, nome)
- **ldo**: Leis de Diretrizes Orçamentárias (id, ano, documento, número, título, arquivo, id_entidade)
- **loa**: Leis Orçamentárias Anuais (id, ano, documento, número, título, arquivo, id_entidade)
- **ppa**: Planos Plurianuais (id, ano, documento, número, título, arquivo, id_entidade)
- **licitacoes**: Licitações realizadas (id, sequencial, processo, modalidade, data, objeto, fase, valor, homologado, anexos, id_entidade, situação, entidade, ano)
- **prestacao_contas**: Prestação de contas (id, ano, arquivo, demais_atos, id_entidade)
- **relatorio_gestao_fiscal**: Relatórios de gestão fiscal (id, ano, documento, número, título, anexo, id_entidade)
- **receitas**: Receitas públicas (id, mês, ano, código, origem, descrição, data, previsão, arrecadação, arrecadado, id_entidade)

---

## Pré-requisitos

- Python 3.8+
- MySQL ou MariaDB
- [FastAPI](https://fastapi.tiangolo.com/)
- [SQLAlchemy](https://www.sqlalchemy.org/)
- [Alembic](https://alembic.sqlalchemy.org/)
- [slowapi](https://pypi.org/project/slowapi/) (opcional, para rate limiting)
- [python-dotenv](https://pypi.org/project/python-dotenv/)

---

## Instalação e Configuração

1. **Clone o repositório:**
    ```bash
    git clone https://github.com/seuusuario/api_transparencia.git
    cd api_transparencia
    ```

2. **Crie e ative o ambiente virtual:**
    ```bash
    python -m venv venv
    venv\Scripts\activate  # Windows
    source venv/bin/activate  # Linux/Mac
    ```

3. **Instale as dependências:**
    ```bash
    pip install -r requirements.txt
    ```

4. **Crie o banco de dados e as tabelas:**
    - Importe o arquivo `db_api_transparencia.sql` no seu MySQL/MariaDB usando o phpMyAdmin ou via terminal:
      ```bash
      mysql -u seu_usuario -p db_api_transparencia < db_api_transparencia.sql
      ```

5. **Configure o arquivo `.env` com os dados do seu banco:**
    ```
    DB_USER=seu_usuario
    DB_PASSWORD=sua_senha
    DB_HOST=localhost
    DB_NAME=db_api_transparencia
    ```

6. **Execute as migrations (caso use Alembic para evoluções futuras):**
    ```bash
    alembic upgrade head
    ```

7. **Inicie o servidor FastAPI:**
    ```bash
    uvicorn main:app --reload
    ```

8. **Acesse a documentação interativa:**
    ```
    http://127.0.0.1:8000/docs
    ```

---

## Exemplos de Uso

- **Consulta de servidores por entidade:**
    ```
    GET /consulta_salario_servidores/{id_entidade}
    ```

- **Consulta de contratos:**
    ```
    GET /contratos?id_entidade=1
    ```

- **Consulta de despesas:**
    ```
    GET /despesas?id_entidade=1&ano=2025
    ```

- **Consulta de LOA, LDO, PPA, licitações, prestação de contas, etc.:**
    ```
    GET /loa?id_entidade=1
    GET /ldo?id_entidade=1
    GET /ppa?id_entidade=1
    GET /licitacoes?id_entidade=1
    GET /prestacao_contas?id_entidade=1
    ```

---

## Segurança

- Algumas rotas podem exigir autenticação via Bearer Token.
- O rate limiting pode ser configurado para evitar abusos.

---

## Contribuição

Contribuições são bem-vindas! Abra uma issue ou envie um pull request.

---

**Desenvolvido por It Soluções Inteligentes (Luan Leandro Nogueira)**
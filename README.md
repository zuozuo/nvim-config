# qabot

## setup dev environment

### 1. install poetry
```shell
curl -sSL https://install.python-poetry.org | python3 -
```
for more info about poetry: https://python-poetry.org/docs/#installation


### 2. install python dependencies
```shell
poetry install
```

if this command is too slow for you, try the following command:
```shell
poetry source add --priority=default mirrors https://pypi.tuna.tsinghua.edu.cn/simple/
```

### 3. setup database

- install postgresql
- create database named `qabot`
```shell
psql -h localhost -p 5432 -c 'create database qabot;'
```
- add database url to `.env` file
```shell
POSTGRES_DB_USER=test
POSTGRES_DB_HOST=localhost
POSTGRES_DB_PORT=5432
POSTGRES_DB_PASS=password
POSTGRES_DB_NAME=qabot
```
- run db migrations
```shell
make migrate
```

### start dev server:
```
make start
```

### How to work with database migrations

For example you want to create a new model named `User` with a table in database:

- create a model file in `app/models/user.py`
```python
from .base import Base

from sqlalchemy import Column
from sqlalchemy import VARCHAR, INT, BIGINT, TEXT, ForeignKey

class User(Base):
    name = Column('name', VARCHAR(128), nullable=False)
    email = Column('email', VARCHAR(128), nullable=False)
```

The defined `User` class will be automatically imported in `app/models/__init__.py`
So once you have created the model file `app/models/user.py` with a `User` class,
you can use it by `from app.models import User`

- create a migration
```shell
make create_migration name=create_user_model # name should be a valid variable name, no space
```

you will see output like this:

```shell
(qabot) ➜  qabot git:(dev) ✗ make create_migration name=create_user_model
alembic revision --autogenerate -m create_user_model
INFO  [alembic.runtime.migration] Context impl PostgresqlImpl.
INFO  [alembic.runtime.migration] Will assume transactional DDL.
INFO  [alembic.ddl.postgresql] Detected sequence named 'company_id_seq' as owned by integer column 'company(id)', assuming SERIAL and omitting
  Generating /Users/zurro.zuo/workspace/workstream/qabot/migrations/versions/e4bad9bf74d5_create_user_model.py ...  done
(qabot) ➜  qabot git:(dev) ✗
```
- run migration
```shell
make migrate
```
you will see output like this:
```shell
(qabot) ➜  qabot git:(dev) ✗ make migrate
alembic upgrade head
INFO  [alembic.runtime.migration] Context impl PostgresqlImpl.
INFO  [alembic.runtime.migration] Will assume transactional DDL.
INFO  [alembic.runtime.migration] Running upgrade df58c58e20ee -> e4bad9bf74d5, create_user_model
(qabot) ➜  qabot git:(dev) ✗
```

- about rollback migration

```shell
flask db downgrade --help
```
for more info please refer to https://flask-migrate.readthedocs.io/en/latest

### How to create models

please refer to the documentation: https://flask-sqlalchemy.palletsprojects.com/en/2.x/models/

or follow the code examples in: `app/models/user.py`
























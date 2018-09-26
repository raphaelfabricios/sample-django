# sample-django

Como executar?
------

- Pré-requisitos

1 - docker 18.06 ou superior

2 - docker-compose 1.22 ou superior

- Executando com o compose

Está sendo utilizado a imagem do MariaDB para banco de dados em um container separado. 

1 - Realizar o clone do repositório.

2 - Entrar na pasta do projeto.

3 - executar docker-compose up mysql backend.

3.1 - Será exibido uma mensagem de erro no container backend, não se preocupe. Isso ocorre devido ao tempo necessário para o carregamento completo do container 'mysql', logo em seguida o acesso estára normal

4 - Criar uma super usuário no django executando o comando no shell do container backend
    
    python manage.py createsuperuser

5 - Pronto, agora você tera acesso a aplicação na porta 80

Como funciona?
------

A aplicação foi desenvolvimento utilizando o django e django-rest-framework.

Docker Environments
------

>`SECRET_KEY`: usado para informar uma chave de criptografia. Mais detalhes em https://docs.djangoproject.com/en/2.1/ref/settings/#std:setting-SECRET_KEY. O django vai gerar uma chave se não for especificado um valor.
> `DJANGO_DATABASE_USER`: usado para informar o usuário para conexão com o banco de dados. O valor default é `backend_user`

> `DJANGO_DATABASE_NAME`: usado para informar um nome do banco de dados. No arquivo compose é criado um banco default mas caso queria executar manualmente será preciso criar o database antes de iniciar o container da aplicação django. O valor default é `backend_db`

> `DJANGO_DATABASE_HOST`= usado para informar qual o host/ip que hospeda o banco de dados

> `DJANGO_DATABASE_PORT`= usado para informar qual a porta de conexão com o mysql/mariadb. O valor default é `3306`

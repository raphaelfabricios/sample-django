# sample-django

Como executar?
------

- Pré-requisitos

1 - docker 18.06 ou superior
2 - docker-compose 1.22 ou superior

- Executando com o compose

Está sendo utilizado a imagem do MariaDB para banco de dados em um container separado. 

1 - Realizar o clone do repositório
2 - Entrar na pasta do projeto
3 - executar docker-compose up mysql backend
3.1 - Será exibido uma mensagem de erro no container backend, não se preocupe. Isso ocorre devido ao tempo necessário para o carregamento completo do container 'mysql', logo em seguida o acesso estára normal
4 - Criar uma super usuário no django executando o comando no shell do container backend
    
    python manage.py createsuperuser
5 - Pronto, agora você tera acesso a aplicação na porta 80

Como funciona?
------

A aplicação foi desenvolvimento utilizando o django e django-rest-framework.

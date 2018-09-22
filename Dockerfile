FROM python:3.6

ENV PYTHONUNBUFFERED 1
ENV BACKEND_PORT 80
ENV BACKEND_IP 0
ENV SECRET_KEY 0
ENV DEBUG = True
ENV ALLOWED_HOSTS = '*'

#database connection

ENV DJANGO_DATABASE_NAME='backend_db'
ENV DJANGO_DATABASE_USER='backend_user'
ENV DJANGO_DATABASE_PASSWORD='backend_password'
ENV DJANGO_DATABASE_HOST='backend_host'
ENV DJANGO_DATABASE_PORT='backend_db_port'

ADD . /code
WORKDIR /code
RUN pip install -r requirements.txt
EXPOSE $BACKEND_PORT

CMD sed -i 's/SECRETKEY/'"$SECRETKEY"'/g' /code/backend/.env

CMD python manage.py runserver $BACKEND_IP:$BACKEND_PORT

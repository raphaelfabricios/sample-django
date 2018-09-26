FROM python:3.6

## ENV for django run
## ENV for .env file (settings.py)
ENV SECRET_KEY 0
#database connection
ENV DJANGO_DATABASE_USER 'user'
ENV DJANGO_DATABASE_PASSWORD 'passwd'
ENV DJANGO_DATABASE_NAME='banckend'
ENV DJANGO_DATABASE_HOST='backend_db_host'
ENV DJANGO_DATABASE_PORT='3306'


RUN ["/bin/bash","-c","echo 'deb http://nginx.org/packages/mainline/debian/ stretch nginx' >> /etc/apt/sources.list "]
RUN ["/bin/bash","-c","apt-key adv --fetch-keys http://nginx.org/keys/nginx_signing.key"]
RUN ["/bin/bash","-c","apt-get update"] 
RUN ["/bin/bash","-c","apt-get install -y nginx supervisor "] 


COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisor-app.conf /etc/supervisor/conf.d/supervisor-app.conf

ADD . /code
WORKDIR /code
RUN pip3.6 install -r requirements.txt

#change settings on files
CMD sed -i 's/SECRETKEY/'"$SECRETKEY"'/g' /code/backend/.env && sed -i 's/backend_db/'"$DJANGO_DATABASE_NAME"'/g' /code/backend/.env && sed -i 's/backend_db_user/'"$DJANGO_DATABASE_USER"'/g' /code/backend/.env && sed -i 's/backend_db_password/'"$DJANGO_DATABASE_PASSWORD"'/g' /code/backend/.env && sed -i 's/backend_db_host/'"  $DJANGO_DATABASE_HOST"'/g' /code/backend/.env && sed -i 's/backend_db_port/'"$DJANGO_DATABASE_PORT"'/g' /code/backend/.env && python3.6 manage.py migrate && supervisord -n -c /etc/supervisor/conf.d/supervisor-app.conf
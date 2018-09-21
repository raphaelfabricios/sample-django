FROM python:3.6

ENV PYTHONUNBUFFERED 1
ENV BACKEND_PORT 80
ENV BACKEND_IP 0

ADD . /code
WORKDIR /code
RUN pip install -r requirements.txt
EXPOSE $BACKEND_PORT
CMD python manage.py runserver $BACKEND_IP:$BACKEND_PORT
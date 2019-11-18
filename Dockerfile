FROM python:3.7-alpine
MAINTAINER Pedro Tavares

ENV PYTHONUNBUFFERED 1

RUN apk add apache2
RUN apk add wget
RUN apk add unzip

RUN wget https://github.com/ptavaresh/front_test/archive/master.zip
RUN ls
RUN unzip master.zip
RUN cp -a /front_test-master/* var/www/html

#RUN pip install -r /requirements.txt
#RUN apk del .tmp-build-deps

RUN mkdir /app
WORKDIR /app
#COPY ./app /app
#RUN python manage.py migrate

RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/static
RUN adduser -D user
RUN chown -R user:user /vol/
RUN chmod -R 755 /vol/web
USER user



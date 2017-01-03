# Download base image python:3.5
FROM python:3.5
MAINTAINER Udlei Nati <udlei@protonmail.ch>

RUN groupadd celery && useradd --shell /bin/bash --create-home --home-dir /home/celery -g celery celery

WORKDIR /app

RUN pip install celery=="4.0.2" \
 && pip install Django=="1.10.4" \
 && pip install redis=="2.10.5" \
 && pip install flower=="0.9.1" \
 && pip install boto3=="1.4.3" \
 && pip install mysqlclient=="1.3.9" \
 && pip install psycopg2=="2.6.2" \
 && pip install SQLAlchemy=="1.1.4" \
 && pip install Twisted=="16.6.0" \
 && pip install NumPy==1.11.3 \
 && pip install requests=="2.12.4"

COPY celeryconfig.py celeryconfig.py
COPY helloworld.py helloworld.py

USER celery
CMD ["celery", "worker", "--loglevel=INFO"]

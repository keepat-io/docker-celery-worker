# Download base image python:3.5
FROM python:3.5
MAINTAINER Udlei Nati <udlei@protonmail.ch>

RUN groupadd celery \
 && useradd --shell /bin/bash --create-home --home-dir /home/celery -g celery celery

WORKDIR /home/celery

COPY celeryconfig.py celeryconfig.py
COPY helloworld.py helloworld.py
COPY docker-entrypoint.sh docker-entrypoint.sh

ENV CELERY_WORKER_START=true

RUN mkdir /app
RUN cp /home/celery/*.py /app

RUN pip install celery=="4.0.2"

# Set the default command to run when starting the container
USER celery
ENTRYPOINT ["/home/celery/docker-entrypoint.sh"]

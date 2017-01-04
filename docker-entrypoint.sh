#! /bin/bash

set -e

if [ "$1" = '' ] && [ "$CELERY_WORKER_START" = 'true' ]; then
    celery worker --loglevel=INFO
fi

exec "$@"

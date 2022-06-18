#!/usr/bin/env bash
set -e

use_tag="ppss1806/uvicorn-gunicorn:$NAME"

DOCKERFILE="$NAME"

if [ "$NAME" == "latest" ] ; then
    DOCKERFILE="python3.10"
fi

if [ "$NAME" == "alpine" ] ; then
    DOCKERFILE="python3.10-alpine3.16"
fi

if [ "$NAME" == "slim" ] ; then
    DOCKERFILE="python3.10-slim"
fi

docker build -t "$use_tag" --file "./docker-images/${DOCKERFILE}.dockerfile" "./docker-images/"

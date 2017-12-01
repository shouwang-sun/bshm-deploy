#!/bin/bash

#
# Usuage: mongo-shell.sh [URI]
#
# Use this script to connect to mongodb in docker container.
# URI's format refers to https://docs.mongodb.com/manual/reference/connection-string/
#

readonly MONGO_VERSION="3.4.10"

[ $# -ge 1 ] && URI="$1" || URI="mongodb://mongodb:27017/test"

docker run -it --rm \
    --net bshm_net \
    mongo:${MONGO_VERSION} \
    mongo ${URI}

#!/usr/bin/env bash

#
# Usage: storm-submit.sh JAR MAIN_CLASS [ARG...] [TOPO_NAME]
#
# Used to submit topology to storm docker cluster.
#

readonly STORM_VERSION=1.1.1
readonly STORM_BASE=$(dirname $0)

[ $# -lt 2 ] && { echo "Usage: storm-submit.sh JAR MAIN_CLASS [ARG...] [TOPO_NAME]" >&2; exit 1; }
[ -f $1 ] || { echo "The topology jar '$1' doesn't exist." >&2; exit 1; }

JAR=$(readlink -f $1); shift
ARGS=$*
CONF=$(readlink -f "${STORM_BASE}/conf")

docker run -it --rm \
    --net bshm_net \
    --volume ${CONF}:/conf \
    --volume ${JAR}:/topo.jar \
    storm:${STORM_VERSION} \
    storm jar /topo.jar ${ARGS}


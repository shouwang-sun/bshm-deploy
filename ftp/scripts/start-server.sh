#!/usr/bin/env bash

#
# start-server -- start the pure-ftpd service
#
# Usage: start-server.sh
#

readonly FTP_HOME=$(readlink -f "$(dirname $0)/..")

docker-compose -f ${FTP_HOME}/docker-compose.yml up -d

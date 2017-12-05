#!/usr/bin/env bash

#
# stop-server -- stop the pure-ftpd service
#
# Usage: stop-server.sh [OPTIONS]
# Options:
#     -d, --delete-users   Delete ftp users when stopping the service
#

readonly FTP_HOME=$(readlink -f "$(dirname $0)/..")

# don't delete users by default
delete_users=false

# parse options
options=$(getopt -o d --long delete-users -n 'stop-server' -- "$@")
[ $? != 0 ] && { echo "Failed parsing options." >&2; exit 1; }
eval set -- "${options}"

while true; do
  case "$1" in
    -d | --delete-users ) delete_users=true; shift ;;
    -- ) shift; break ;;
    * ) break ;;
  esac
done

# stop the ftpd service with docker-compose
docker-compose -f ${FTP_HOME}/docker-compose.yml down $(${delete_users} && echo '--volumes')

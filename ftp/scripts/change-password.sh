#!/usr/bin/env bash

set -xv

#
# change-password -- change given user's password
#
# Usage: change-password.sh USERNAME
#

# exit with error if username isn't provided
[ $# -ge 1 ] && username=$1 || { echo "Usage: change-password.sh USERNAME" >&2; exit 1; }

# acquire the ftpd container id
container=$(docker ps --quiet --filter "publish=21/tcp")
# exit with error if no containers running
[ -z ${container} ] && { echo "Please start ftpd server first" >&2; exit 1; }

# execute passwd command in the ftpd container
docker exec -it ${container} \
    pure-pw passwd ${username} -f /etc/pure-ftpd/passwd/pureftpd.passwd -m

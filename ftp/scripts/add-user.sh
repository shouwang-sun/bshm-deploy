#!/usr/bin/env bash

#
# add-user -- create a new ftp user
#
# Usage: add-user.sh USERNAME
#

# exit with error if username isn't provided
[ $# -ge 1 ] && username=$1 || { echo "Usage: add-user.sh USERNAME" >&2; exit 1; }

# acquire the ftpd container id
container=$(docker ps --quiet --filter "publish=21/tcp")
# exit with error if no containers running
[ -z ${container} ] && { echo "Please start ftpd server first" >&2; exit 1; }

# execute useradd command in the ftpd container
docker exec -it ${container} \
    pure-pw useradd ${username} -m \
    -u ftpuser \
    -f /etc/pure-ftpd/passwd/pureftpd.passwd \
    -d /home/ftpusers/${username}

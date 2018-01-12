#!/usr/bin/env bash

#
# create-connector -- create a new kafka connector
#
# Usage: create-connector.sh CONFIG
#

# exit with error if config isn't provided
[ $# -ge 1 ] || { echo "Usage: create-connector CONFIG" >&2; exit 1; }

curl -X POST \
    -H "Content-Type: application/json" -H "Accept: application/json" \
    -d @"${1}" http://localhost:8083/connectors

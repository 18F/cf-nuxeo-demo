#!/bin/bash
set -euo pipefail

fail() {
  echo $0 FAIL: "$@"
  exit 1
}

DB_CREDS=$(echo $VCAP_SERVICES | jq -r '.["aws-rds"][] | select(.name == "database") | .credentials') ||
  fail "Unable to parse DB_CREDS from VCAP_SERVICES for aws-rds[].name = database"

export NUXEO_DB_HOST=`echo $DB_CREDS | jq -r '.host'`
export NUXEO_DB_NAME=`echo $DB_CREDS | jq -r '.db_name'`
export NUXEO_DB_USER=`echo $DB_CREDS | jq -r '.username'`
export NUXEO_DB_PASSWORD=`echo $DB_CREDS | jq -r '.password'`

exec /docker-entrypoint.sh "$@"
#!/bin/sh

function update_nuxeo_conf () {
  sed --in-place -r -e "s/^($1)/# \1/" $NUXEO_CONF
  echo "$1=$2" >> $NUXEO_CONF
}

## AWS ###
awsrds_creds=$(echo $VCAP_SERVICES | jq '."aws-rds"[0].credentials')

db_host=`echo $awsrds_creds     | jq -r '.host'`
db_name=`echo $awsrds_creds     | jq -r '.db_name'`
db_user=`echo $awsrds_creds     | jq -r '.username'`
db_password=`echo $awsrds_creds | jq -r '.password'`

[ $db_host ] && update_nuxeo_conf nuxeo.db.host $db_host
[ $db_name ] && update_nuxeo_conf nuxeo.db.name $db_name
[ $db_user ] && update_nuxeo_conf nuxeo.db.user $db_user
[ $db_password ] && update_nuxeo_conf nuxeo.db.password $db_password
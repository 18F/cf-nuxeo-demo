#!/bin/sh

awsrds_creds=$(echo $VCAP_SERVICES | jq '."aws-rds"[0].credentials')

db_host=`echo $awsrds_creds     | jq -r '.host'`
db_name=`echo $awsrds_creds     | jq -r '.db_name'`
db_user=`echo $awsrds_creds     | jq -r '.username'`
db_password=`echo $awsrds_creds | jq -r '.password'`

[ $db_host ] && echo "nuxeo.db.host=$db_host" >> $NUXEO_CONF
[ $db_name ] && echo "nuxeo.db.name=$db_name" >> $NUXEO_CONF
[ $db_user ] && echo "nuxeo.db.user=$db_user" >> $NUXEO_CONF
[ $db_password ] && echo "nuxeo.db.password=$db_password" >> $NUXEO_CONF

echo ==== NUXEO_CONF ====
cat $NUXEO_CONF
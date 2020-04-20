#!/bin/sh

set -e

chown -R $USERID:$GROUPID /share

echo "Mounting $SERVER_SHARE with user $SERVER_DOMAIN\\$SERVER_USERNAME.."
mount -t cifs -o username=$SERVER_USERNAME,password=$SERVER_PASSWORD,domain=$SERVER_DOMAIN,vers=3.0,uid=$USERID,gid=$GROUPID \
    $SERVER_SHARE /share

echo "Starting samba.."
export USER="$PROXY_USERNAME;$PROXY_PASSWORD"
export SHARE="$PROXY_SHARE;/share;yes;no;no;$PROXY_USERNAME"
export RECYCLE=x # disable recycle bin
export SMB=x # disable SMB2 minimum version
/sbin/tini -s -- /usr/bin/samba.sh
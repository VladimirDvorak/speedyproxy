#!/bin/bash

set -e

/usr/sbin/nginx -t
err=$(echo $?)

if [ "$err" != "0" ]; then 
echo "NGINX cannot be restarted. Syntax error."
exit 1;
fi

#/usr/sbin/nginx -s reload
/etc/init.d/nginx restart

echo "NGINX succesfully restared."



#!/bin/bash

set -e

if [ -z "$1" ]; then echo "Usage: $0 [add|del] nazevdomeny cilove_url frontend"; exit 1; fi

DOMAIN=$2
TMPDOMAIN=$2
NEWDOMAIN=$3
declare -x FRONTEND=$4

declare -x DEST_URL=$3

BACKEND=null

source /etc/hosting/config.properties

variable_validation
domain_validation ${DOMAIN}

DOMAIN=$TMPDOMAIN

echo $DOMAIN


case $1 in
add)
	check_existence ${DOMAIN}
	eval "echo \"$(< ${NGINX_REDIRECT_URL_TEMPLATE})\"" > ${NGINX_CONFIG_DIR}/${DOMAIN}.conf.redirect
	echo "Redirect $DOMAIN -> $NEWDOMAIN succesfully added."
;;
del)
	rm ${NGINX_CONFIG_DIR}/${DOMAIN}.conf.redirect
	echo "Redirect for $DOMAIN succesfully deleted."
;;
esac



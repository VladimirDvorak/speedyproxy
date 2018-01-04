#!/bin/bash

set -e

if [ -z "$1" ]; then echo "Usage: $0 nazevdomeny novadomena frontend"; exit 1; fi

DOMAIN=$1
TMPDOMAIN=$1
NEWDOMAIN=$2
declare -x FRONTEND=$3

BACKEND=null

source /etc/hosting/config.properties

variable_validation
domain_validation ${DOMAIN}
domain_validation ${NEWDOMAIN}

DOMAIN=$TMPDOMAIN

echo $DOMAIN
check_existence ${DOMAIN}

eval "echo \"$(< ${NGINX_REDIRECT_TEMPLATE})\"" > ${NGINX_CONFIG_DIR}/${DOMAIN}.conf.redirect

echo "Redirect $DOMAIN -> $NEWDOMAIN succesfully added."



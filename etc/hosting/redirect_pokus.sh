#!/bin/bash

set -e

if [ -z "$1" ]; then echo "Usage: $0 nazevdomeny novadomena frontend"; exit 1; fi

DOMAIN=$1
TMPDOMAIN=$1
NEWDOMAIN=$2
declare -x FRONTEND=$3

#FRONTEND=null
BACKEND=null

source /etc/hosting/config.properties

variable_validation
#domain_validation ${DOMAIN}
#domain_validation ${NEWDOMAIN}

DOMAIN=$TMPDOMAIN

echo $DOMAIN
#check_existence ${DOMAIN}
#echo $NEWDOMAIN
#check_existence ${NEWDOMAIN}


#block_domain_override ${DOMAIN}

eval "echo \"$(< ${NGINX_REDIRECT_TEMPLATE})\"" > ${NGINX_CONFIG_DIR}/${DOMAIN}.conf.redirect
# Fix 22.6.2016
#eval "echo \"$(< ${NGINX_REDIRECT_TEMPLATE})\"" > ${NGINX_CONFIG_DIR}/${NEWDOMAIN}.conf.redirect

echo "Redirect $DOMAIN -> $NEWDOMAIN succesfully added."



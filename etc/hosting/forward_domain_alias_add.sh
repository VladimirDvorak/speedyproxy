#!/bin/bash

set -e

if [ -z "$1" ]; then echo "Usage: $0 nazevdomeny alias"; exit 1; fi

DOMAIN=$1
ALIAS=$2

FRONTEND=null
BACKEND=null

source /etc/hosting/config.properties

variable_validation
domain_validation ${DOMAIN}
domain_exist ${DOMAIN}
domain_alias_exist ${DOMAIN} ${ALIAS}
#block_domain_override ${DOMAIN}


echo "server_name $ALIAS;" >> ${NGINX_CONFIG_DIR}/${DOMAIN}.conf.alias

echo "Alias $ALIAS for $DOMAIN succesfully added."


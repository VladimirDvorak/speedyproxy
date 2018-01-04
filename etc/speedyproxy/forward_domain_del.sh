#!/bin/bash

set -e

if [ -z "$1" ]; then echo "Usage: $0 nazevdomeny"; exit 1; fi

DOMAIN=$1
declare -x FRONTEND=$2
declare -x BACKEND=$3

FRONTEND=null
BACKEND=null

source /etc/speedyproxy/config.properties

variable_validation
domain_validation ${DOMAIN}
#domain_exist ${DOMAIN}
#block_domain_override ${DOMAIN}


rm ${NGINX_CONFIG_DIR}/${DOMAIN}.conf.alias
rm ${NGINX_CONFIG_DIR}/${DOMAIN}.conf

echo "Domain $DOMAIN succesfully deleted." 


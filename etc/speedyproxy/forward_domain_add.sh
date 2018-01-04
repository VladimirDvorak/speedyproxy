#!/bin/bash

set -e

if [ -z "$1" ]; then echo "Usage: $0 nazevdomeny frontend1 backend1 [letsencrypt]"; exit 1; fi

DOMAIN=$1
declare -x FRONTEND=$2
declare -x BACKEND=$3
# declare -x LETSENCRYPT=$4

source /etc/speedyproxy/config.properties

variable_validation
domain_validation ${DOMAIN}
#block_domain_override ${DOMAIN}


# if [ "$LETSENCRYPT" = "letsencrypt" ]; then
#	gen_letsencrypt_csr ${DOMAIN}
#	export FRONTEND=${DOMAIN}
# fi


eval "echo \"$(< ${NGINX_DOMAIN_TEMPLATE})\"" > ${NGINX_CONFIG_DIR}/${DOMAIN}.conf

touch ${NGINX_CONFIG_DIR}/${DOMAIN}.conf.alias

echo "server_name ${DOMAIN} www.${DOMAIN};" >> ${NGINX_CONFIG_DIR}/${DOMAIN}.conf.alias

echo "DOMAIN $DOMAIN succesfully added."


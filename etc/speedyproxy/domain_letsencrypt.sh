#!/bin/bash

set -e

if [ -z "$1" ]; then echo "Usage: $0 nazevdomeny frontend_ip1 backend_ip1 [enable|disable]"; exit 1; fi

DOMAIN=$1
declare -x FRONTEND=$2
declare -x BACKEND=$3
declare -x ACTION=$4

source /etc/speedyproxy/config.properties

variable_validation
domain_validation ${DOMAIN}
#block_domain_override ${DOMAIN}


# if [ "$LETSENCRYPT" = "letsencrypt" ]; then
#	gen_letsencrypt_csr ${DOMAIN}
#	export FRONTEND=${DOMAIN}
# fi

case "$ACTION" in

enable)
	letsencrypt_genkeys $DOMAIN

	eval "echo \"$(< ${NGINX_DOMAIN_LETSENCRYPT_TEMPLATE})\"" > ${NGINX_CONFIG_DIR}/${DOMAIN}.conf
	echo "DOMAIN $DOMAIN succesfully added for Let's Encrypt processing.."
	exit 0;
;;
disable)
	eval "echo \"$(< ${NGINX_DOMAIN_TEMPLATE})\"" > ${NGINX_CONFIG_DIR}/${DOMAIN}.conf
	echo "DOMAIN $DOMAIN succesfully removed from Let's Encrypt processing."
	exit 0;
;;

*)	
	echo "Parameter in invalid."
	exit 1;
esac


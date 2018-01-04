#!/bin/bash

set -e

if [ -z "$1" ]; then echo "Usage: $0 backend_ipX 1.1.1.1"; exit 1; fi

declare -x BACKEND_NAME=$1
declare -x BACKEND_IPADDR=$2

if [ -z $BACKEND_NAME ]; then echo "BACKEND_NAME not defined"; exit 1; fi
if [ -z $BACKEND_IPADDR ]; then echo "BACKEND_IPADDR not defined"; exit 1; fi



source /etc/hosting/config.properties

entry="$BACKEND_NAME=\"$BACKEND_IPADDR\""

exist=$(grep ^$BACKEND_NAME /etc/hosting/config.properties /etc/hosting/backends| wc -l)


if [ "$exist" -gt 0 ]; then
	echo "backend $BACKEND_NAME already defined. Existing."
	exit 1;
fi

echo "$entry" >> /etc/hosting/backends



#!/bin/bash

set -e

if [ -z "$1" ]; then echo "Usage: $0 backend_ipX"; exit 1; fi

declare -x BACKEND_NAME=$1

source /etc/speedyproxy/config.properties

exist=$(grep ^$BACKEND_NAME /etc/speedyproxy/config.properties /etc/speedyproxy/backends| wc -l)

if [ ! "$exist" -gt 0 ]; then
	echo "backend $BACKEND_NAME not defined. Existing."
	exit 1;
fi

sed -i /^$BACKEND_NAME=.*/d /etc/speedyproxy/backends



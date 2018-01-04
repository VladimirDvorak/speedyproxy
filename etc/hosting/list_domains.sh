#!/bin/bash

set -e

source /etc/hosting/config.properties

ls -1 ${NGINX_CONFIG_DIR}/*.conf


#!/bin/bash

set -e

source /etc/speedyproxy/config.properties

ls -1 ${NGINX_CONFIG_DIR}/*.conf


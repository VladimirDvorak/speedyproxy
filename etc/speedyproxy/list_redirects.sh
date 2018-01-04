#!/bin/bash

set -e

source /etc/speedyproxy/config.properties

redirs=$(ls -1 ${NGINX_CONFIG_DIR}/*.conf.redirect)

for i in $redirs; do
	target=$(grep return $i | cut -d "/" -f3)
	source=$(echo $i | cut -d"/" -f 6)
	echo "$source -> $target"
done

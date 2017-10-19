#!/bin/bash

# check if the `server.xml` file has been changed since the creation of this
# Docker image. If the file has been changed the entrypoint script will not
# perform modifications to the configuration file.

export NAMESERVERS=$(cat /etc/resolv.conf | grep "nameserver" | awk '{print $2}' | tr '\n' ' ')

envsubst '$NAMESERVERS' < /etc/nginx/nginx.conf.tmpl > /etc/nginx/nginx.conf

envsubst '${X_PROXY_NAME}' < /etc/nginx/conf.d/altassian.conf.tmpl > /etc/nginx/conf.d/altassian.conf

exec "$@"
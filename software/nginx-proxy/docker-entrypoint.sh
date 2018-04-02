#!/bin/bash

# check if the `server.xml` file has been changed since the creation of this
# Docker image. If the file has been changed the entrypoint script will not
# perform modifications to the configuration file.

export NAMESERVERS=$(cat /etc/resolv.conf | grep "nameserver" | awk '{print $2}' | tr '\n' ' ')
envsubst '$NAMESERVERS' < /usr/local/nginx/conf/nginx.conf.tmpl > /usr/local/nginx/conf/nginx.conf

exec "$@"
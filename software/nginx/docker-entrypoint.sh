#!/bin/bash

# check if the `server.xml` file has been changed since the creation of this
# Docker image. If the file has been changed the entrypoint script will not
# perform modifications to the configuration file.

sed -i "s/SERVER_NAME/${SERVER_NAME}/" /etc/nginx/conf.d/altassian.conf

exec "$@"
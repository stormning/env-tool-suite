FROM redis:4
COPY redis.conf.tmpl /usr/local/etc/redis/redis.conf.tmpl
COPY "docker-entrypoint.sh" "/"
ENTRYPOINT ["/docker-entrypoint.sh"]
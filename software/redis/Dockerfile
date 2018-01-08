FROM redis:4
ENV MODE master
ENV QUORUM 2
ENV IP 127.0.0.1
ENV PORT 6379
ENV MASTER_NAME mymaster
COPY master.conf /usr/local/etc/redis/master.conf
COPY slave.conf /usr/local/etc/redis/slave.conf
COPY sentinel.conf /usr/local/etc/redis/sentinel.conf

RUN set -x \
    && echo "deb http://mirrors.163.com/debian/ jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list \
    && apt-get update --quiet \
    && apt-get install --quiet --yes --no-install-recommends -t jessie-backports libtcnative-1 xmlstarlet vim gettext\
    && apt-get clean

COPY "docker-entrypoint.sh" "/"
EXPOSE 6379
ENTRYPOINT ["/docker-entrypoint.sh"]
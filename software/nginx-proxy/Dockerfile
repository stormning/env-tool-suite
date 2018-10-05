FROM hub.slyak.com/common-debain
COPY nginx-1.9.2.tar.gz /
COPY ngx_http_proxy_connect_module.zip /
COPY "docker-entrypoint.sh" /
RUN set -x \
    && apt-get install -y patch libpcre3 libpcre3-dev openssl libssl-dev zlib1g-dev\
    && tar -xzvf /nginx-1.9.2.tar.gz \
    && rm -f /nginx-1.9.2.tar.gz \
    && unzip /ngx_http_proxy_connect_module.zip \
    && rm -f /ngx_http_proxy_connect_module.zip \
    && cd /nginx-1.9.2/ \
    && patch -p1 < /ngx_http_proxy_connect_module/proxy_connect.patch \
    && ./configure --add-module=/ngx_http_proxy_connect_module \
    && make && make install \
    && mkdir -p /var/log/nginx \
    && chmod -R 700 /var/log/nginx \
    && touch /var/log/nginx/error.log \
    && apt-get clean


COPY nginx.conf.tmpl /usr/local/nginx/conf/nginx.conf.tmpl
#/usr/local/nginx/conf/mirrors.conf
#/usr/local/nginx/html
#
VOLUME ["/usr/local/nginx/html","/etc/nginx/conf.d"]
EXPOSE 80

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]
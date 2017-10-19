FROM nginx:1.13.3

ENV X_PROXY_NAME  dev.slyak.com

RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests -y vim inetutils-ping

COPY index.html /usr/share/nginx/html/
COPY nginx.conf.tmpl /etc/nginx/
COPY altassian.conf.tmpl /etc/nginx/conf.d/

VOLUME ["/usr/share/nginx/html","/etc/nginx/conf.d"]

COPY "docker-entrypoint.sh" "/"

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
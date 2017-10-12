FROM nginx:1.13.3

ENV SERVER_NAME  dev.slyak.com

COPY index.html /usr/share/nginx/html/index.html
COPY nginx.conf /etc/nginx/nginx.conf
COPY altassian.conf /etc/nginx/conf.d/altassian.conf

VOLUME ["/usr/share/nginx/html","/etc/nginx/conf.d"]

COPY "docker-entrypoint.sh" "/"

ENTRYPOINT ["/docker-entrypoint.sh"]
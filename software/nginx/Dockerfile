FROM nginx:1.13.3

ENV SERVER_NAME  dev.slyak.com

COPY index.html /usr/share/nginx/html/
COPY nginx.conf.tmpl /etc/nginx/
COPY altassian.conf.tmpl /etc/nginx/conf.d/

VOLUME ["/usr/share/nginx/html","/etc/nginx/conf.d"]

COPY "docker-entrypoint.sh" "/"

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
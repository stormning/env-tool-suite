FROM slyak/common-debain-openjdk
MAINTAINER stormning <stormning@163.com>

RUN set -x \
 && yum install -y nginx git\
 && mkdir /repo \
 && mkdir -p /logs/nginx

#TODO add WEBUI to manage it

ADD nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
EXPOSE 81

CMD ["nginx","-g","daemon off;"]



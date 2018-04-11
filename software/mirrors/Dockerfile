FROM slyak/common-centos-openjdk
MAINTAINER stormning <stormning@163.com>

RUN set -x \
 && yum install -y nginx git\
 && mkdir /repo \
 && mkdir -p /logs/nginx
 && wget

ADD nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx","-g","daemon off;"]
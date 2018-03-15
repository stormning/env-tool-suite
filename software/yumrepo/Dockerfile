FROM centos:7
MAINTAINER stormning <stormning@163.com>

RUN set -x \
 && yum install -y epel-release \
 && yum -y install createrepo yum-utils nginx \
 && yum clean all \
 && mkdir /repo \
 && mkdir -p /logs/nginx

ADD nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx","-g","daemon off;"]
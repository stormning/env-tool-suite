FROM hub.slyak.com/nginx-proxy
MAINTAINER stormning <stormning@163.com>

#TODO add WEBUI to manage it

ADD mirrors.conf /etc/nginx/conf.d/mirrors.conf

EXPOSE 80
EXPOSE 3128

CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]
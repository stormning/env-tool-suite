FROM centos:7
MAINTAINER stormning <stormning@163.com>

RUN set -x \
 && mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup \
 && curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo \
 && yum clean all \
 && yum install -y wget xmlstarlet vim gettext sudo zip \
 && wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
 && rpm -ivh epel-release-latest-7.noarch.rpm \
 && yum makecache

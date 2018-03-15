FROM openjdk:8
ENV LANG C.UTF-8
#debain加速
#xmlstarlet for xml replacement
#vim
#gettext for envsubst
#COPY sources.list /etc/apt/sources.list
RUN set -x \
    && echo "deb http://mirrors.163.com/debian/ jessie main non-free contrib \
             deb http://mirrors.163.com/debian/ jessie-updates main non-free contrib \
             deb http://mirrors.163.com/debian/ jessie-backports main non-free contrib \
             deb-src http://mirrors.163.com/debian/ jessie main non-free contrib \
             deb-src http://mirrors.163.com/debian/ jessie-updates main non-free contrib \
             deb-src http://mirrors.163.com/debian/ jessie-backports main non-free contrib \
             deb http://mirrors.163.com/debian-security/ jessie/updates main non-free contrib \
             deb-src http://mirrors.163.com/debian-security/ jessie/updates main non-free contrib" > /etc/apt/sources.list \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && apt-get update --quiet \
    && apt-get install --quiet --yes --no-install-recommends -t jessie-backports libtcnative-1 xmlstarlet vim gettext sudo \
    && apt-get clean
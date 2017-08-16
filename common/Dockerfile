FROM openjdk:8
ENV LANG C.UTF-8
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

#debain加速
COPY sources.list /etc/apt/sources.list
RUN set -x \
    && echo "deb http://mirrors.163.com/debian/ jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list \
    && apt-get update --quiet \
    && apt-get install --quiet --yes --no-install-recommends -t jessie-backports libtcnative-1 xmlstarlet \
    && apt-get clean

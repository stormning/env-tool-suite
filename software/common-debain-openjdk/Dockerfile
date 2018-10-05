FROM openjdk:8-slim-stretch
ENV LANG C.UTF-8
#debain加速
#xmlstarlet for xml replacement
#vim
#gettext for envsubst
COPY sources.list /etc/apt/sources.list
RUN set -x \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && apt-get update \
    && apt-get install -y build-essential libtcnative-1 xmlstarlet vim gettext sudo zip\
    && apt-get clean
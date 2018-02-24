FROM openjdk:8
ENV LANG C.UTF-8
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

#debain加速
#xmlstarlet for xml replacement
#vim
#gettext for envsubst
COPY sources.list /etc/apt/sources.list
RUN set -x \
    && apt-get update --quiet \
    && apt-get install --quiet --yes --no-install-recommends -t jessie-backports libtcnative-1 xmlstarlet vim gettext sudo\
    && apt-get clean
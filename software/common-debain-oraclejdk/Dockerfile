FROM airdock/oracle-jdk:1.8
ENV LANG C.UTF-8
#debain加速
#xmlstarlet for xml replacement
#vim
#gettext for envsubst
RUN set -x \
    && sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && apt-get update \
    && apt-get install -y build-essential libtcnative-1 xmlstarlet vim gettext sudo zip\
    && apt-get clean
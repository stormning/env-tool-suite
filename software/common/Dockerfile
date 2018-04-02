FROM debian:stretch-slim
ENV LANG C.UTF-8
#debain加速
#xmlstarlet for xml replacement
#vim
#gettext for envsubst
RUN set -x \
    && echo 'deb http://mirrors.ustc.edu.cn/debian/ stretch main contrib non-free \
       deb-src http://mirrors.ustc.edu.cn/debian/ stretch main contrib non-free \
       deb http://mirrors.ustc.edu.cn/debian/ stretch-updates main contrib non-free \
       deb-src http://mirrors.ustc.edu.cn/debian/ stretch-updates main contrib non-free \
       deb http://mirrors.ustc.edu.cn/debian/ stretch-backports main contrib non-free \
       deb-src http://mirrors.ustc.edu.cn/debian/ stretch-backports main contrib non-free \
       deb http://mirrors.ustc.edu.cn/debian-security/ stretch/updates main contrib non-free \
       deb-src http://mirrors.ustc.edu.cn/debian-security/ stretch/updates main contrib non-free' > /etc/apt/sources.list \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && apt-get update \
    && apt-get install -y build-essential libtcnative-1 xmlstarlet vim gettext sudo zip\
    && apt-get clean
#!/usr/bin/env bash
echo 'export http_proxy=repository.com:1080 \
      export https_proxy=repository.com:1081' > ~/.bash_profile
source ~/.bash_profile

yum remove docker \
           docker-client \
           docker-client-latest \
           docker-common \
           docker-latest \
           docker-latest-logrotate \
           docker-logrotate \
           docker-selinux \
           docker-engine-selinux \
           docker-engine

yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2


yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

yum-config-manager --enable docker-ce-edge

yum install docker-ce

systemctl start docker

systemctl enable docker
#!/usr/bin/env bash
## install.sh for CentOS-7

#wget
sudo yum install -y wget

#lrzsz
sudo yum install -y lrzsz git

#git
sudo yum install -y git

#nodejs
sudo yum install -y nodejs npm --enablerepo=epel

#add epel repo
wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -ivh epel-release-latest-7.noarch.rpm

#Docker CE
sudo yum remove docker \
                  docker-common \
                  container-selinux \
                  docker-selinux \
                  docker-engine \
                  docker-engine-selinux
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum-config-manager --enable docker-ce-edge
#INSTALL DOCKER
sudo yum makecache fast
sudo systemctl start docker
sudo systemctl enable docker

#docker-compose
curl -L https://github.com/docker/compose/releases/download/1.14.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version
#!/usr/bin/env bash
## install.sh for CentOS-7
#epel
wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -ivh epel-release-latest-7.noarch.rpm

#docker
sudo yum remove docker \
                  docker-common \
                  container-selinux \
                  docker-selinux \
                  docker-engine
sudo yum install -y yum-utils
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum-config-manager --enable docker-ce-edge
sudo yum makecache fast
sudo systemctl start docker
systemctl enable docker

#docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.11.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version

#lrzsz
sudo yum install -y lrzsz

#git
sudo yum install -y git

#nodejs
yum -y install nodejs npm --enablerepo=epel

#qiniu for backup
#http://zhangge.net/4221.html
#TODO conf.json
curl -L http://devtools.qiniu.io/qiniu-devtools-linux_amd64-current.tar.gz -o /opt/bin
tar cvf /opt/bin/qiniu-devtools-linux_amd64-current.tar.gz
rm -fr /opt/bin/qiniu-devtools-linux_amd64-current.tar.gz
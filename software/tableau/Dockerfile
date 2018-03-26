FROM centos/systemd
COPY tableau-server-10-5-2.x86_64.rpm /
COPY tableau-init.sh /usr/local/bin/
RUN set -x \
    && yum install -y sudo \
    && useradd tabadmin \
    && echo "tabadmin" | passwd --stdin "tabadmin" \
    && groupadd tsmadmin \
    && usermod -aG tsmadmin tabadmin \
    && echo "tabadmin ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers \
    && chmod 777 /usr/local/bin/tableau-init.sh
USER tabadmin
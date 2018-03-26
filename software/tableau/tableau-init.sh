#!/bin/bash
su - tabadmin
export LANG=en_US.UTF-8
set -x \
    && sudo yum install -y tableau-server-10-5-2.x86_64.rpm \
    && cd /opt/tableau/tableau_server/packages/scripts.10500.18.0305.1200 \
    && sudo ./initialize-tsm --accepteula
exit
tableau对宿主机有要求，如果配置不够无法安装

```
----Your system does NOT meet the minimum system requirements for Tableau Server--
  Tableau Server requires these minimum hardware requirements: http://www.tableau.com/products/server/specs
  Either try the install on a different computer, or explore our other options for running a trial of Tableau Server: http://www.tableau.com/products/server/download
  WARNING: The ip command is not installed. Skipping verification that temporary IPv6 addresses are disabled for all nodes in the cluster. For details, see:
  http://kb.tableau.com/articles/knowledgebase/temporary-ipv6 (Disabling temporary IPv6 addresses)
  systemd doesn't not appear to be running.
  To run a Tableau Server on Linux, you must use a distro running with systemd. For details on supported distros, see:
  http://onlinehelp.tableau.com/current/serverlinux/en-us/confirm_requirements.htm
  
  error: %pre(tableau-server-10500.18.0305.1200-10500-18.0305.1200.x86_64) scriptlet failed, exit status 1
  Error in PREIN scriptlet in rpm package tableau-server-10500.18.0305.1200-10500-18.0305.1200.x86_64
  error: tableau-server-10500.18.0305.1200-10500-18.0305.1200.x86_64: install failed
```
[安装要求](https://onlinehelp.tableau.com/current/server-linux/en-us/confirm_requirements.htm)

系统最低配置：
- 8 core, 2.0 GHz or higher processor
- 64-bit processor architecture
- 32 GB memory
- 50 GB disk space available

启动容器：
docker run -itd --privileged --name tableau --storage-opt size=100G -v /sys/fs/cgroup:/sys/fs/cgroup:ro slyak/tableau

初始化：
docker exec -it tableau /bin/bash
su tabadmin
tableau-init.sh
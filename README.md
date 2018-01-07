# [宿主机软件](install.sh)
* docker
* docker-compose
* git
* nodejs
* supervisor

# docker镜像
* 基本镜像
    * docker-registry
    * docker-registry-ui
    * [redis](./software/redis) Key-Value数据库
    * [nginx](./software/nginx) http反向代理，TCP/UDP代理
    * mysql
* 研发管理镜像
    * nexus 代码仓库
    * [jira](./software/jira) 项目管理事务跟踪
    * [confluence](./software/confluence) 团队协同与知识管理
    * [bitbucket](./software/bitbucket) 企业级Git代码库
    * [fecru](./software/fecru) 源码深度查看和代码评审工具
    * [bamboo](./software/bamboo) 持续集成服务器
    * [clover](./software/clover) 测试代码覆盖率分析
    * [crowd](./software/crowd) 单点登录与认证管理
    * portainer docker镜像和容器管理
    * 邮件服务器 TODO
    * DNS服务器 TODO
    * FTP服务器 TODO
    
* 参考资料
    * 数据库设置
        * https://confluence.atlassian.com/doc/database-setup-for-mysql-128747.html
    * CROWD创建应用和用户组初始化
        * jira
            * https://confluence.atlassian.com/crowd/integrating-crowd-with-atlassian-jira-192625.html
        * confluence
            * https://confluence.atlassian.com/crowd/integrating-crowd-with-atlassian-confluence-198573.html
        * bitbucket
            * https://confluence.atlassian.com/bitbucketserver/connecting-bitbucket-server-to-crowd-776640399.html
        * fecru
            * https://confluence.atlassian.com/crowd/integrating-crowd-with-atlassian-fisheye-200895.html
        * bamboo
            * https://confluence.atlassian.com/crowd/integrating-crowd-with-atlassian-bamboo-198785.html


<table style="margin-left:80px">
	<tr><th>CROWD中初始化应用</th><th>CROWD中初始化用户组</th></tr>
	<tr><td rowspan="3">jira</td><td>jira-users</td></tr>
	<tr><td>jira-developers</td></tr>
	<tr><td>jira-administrators</td></tr>
	<tr><td rowspan="2">confluence</td><td>confluence-users</td></tr>
	<tr><td>confluence-administrators</td></tr>
</table>      
 
* FAQ
    * 如何编译相关镜像?
        * 执行build.sh即可编译所有
        * 执行build.sh \[镜像所在文件夹名1,镜像所在文件夹名2\]，选择性编译
        * 软件的安装包体积太大暂未上传，请至官网下载
    * 如何自由选择性启动相关软件?
        * 注释掉docker-compose.yaml中不要的软件
    * 如何个性化域名?
        * 修改common.env的X_PROXY_NAME和CROWD_BASE_URL
        * 修改docker-compose.yaml中nginx的alias修改
    * mysql为什么不放compose里?
        * 考虑到mysql可能会单独部署的问题
    * jira重装时启动报错？
        * rm /var/atlassian/jira/.jira-home.lock
        * rm -fr /var/atlassian/jira/caches
        
        
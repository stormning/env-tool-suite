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
    * nginx
    * mysql
* 应用镜像
    * nexus 代码仓库
    * jira 项目管理事务跟踪
    * confluence 团队协同与知识管理
    * bitbucket 企业级Git代码库
    * fecru 源码深度查看和代码评审工具
    * bamboo 持续集成服务器
    * clover 测试代码覆盖率分析
    * crowd 单点登录与认证管理
    * portainer docker镜像和容器管理
    * 邮件服务器 TODO
    * DNS服务器 TODO
    * FTP服务器 TODO
    
* 参考资料
    * 数据库设置
        * https://confluence.atlassian.com/doc/database-setup-for-mysql-128747.html
    * CROWD创建应用和用户组初始化
        * import users 或者创建对应应用的用户角色
        * 如:https://confluence.atlassian.com/crowd/integrating-crowd-with-atlassian-jira-192625.html
        
* FAQ
    * 如何编译相关镜像?
        * 首先编译common，再分别编译其他软件
        * 目前镜像命名规则为hub.slyak.com/{文件夹名称}
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
        
        
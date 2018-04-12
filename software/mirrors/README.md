### slyak/mirrors 软件镜像/缓存服务
```bash
docker run -idt -p 80:80 -p 1080:1080 -p 1081:1081 -v /var/www/html:/repo -it slyak/mirrors
```

相关项目
https://github.com/stormning/mirror-manager
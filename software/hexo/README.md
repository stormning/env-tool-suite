# slyak/hexo
![hexo](./hexo.png)

1. Init your blog by setting `GIT_URL` by which we will clone your github repository at the first time.
2. If the cloned repository is empty , we will use `hexo init` to init your bolg.
3. Generate hexo by using command `hexo generate`.
4. Deploy hexo by using command `hexo deploy`.
5. We commit something to github.
6. Github notify the hexo server with the changes using webhook.
7. We receive changes and generate hexo again by using command `hexo generate` .
8. Deploy changes to github by using command `hexo deploy`.
9. We can see the changes without any delay.

That's all , all these things will be automatically done by this amazing docker image.


yum install nginx

mv hexo.cnf /etc/nginx/conf.d/

docker run -idt -p 4000:4000 -p 4001:4001 --name hexo -e GIT_URL=git@github.com:stormning/blog.git -e GIT_ACCOUNT=stormning@163.com -e WEB_HOOK_SECRET=slyak123 -v /var/hexo:/var/hexo slyak/hexo

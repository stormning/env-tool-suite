FROM slyak/common
ENV HEXO_HOME /var/hexo
ENV GIT_URL
ENV GIT_ACCOUNT
COPY _config.yml /

#nodejs git hexo
RUN set -x \
    && apt-get install -y nodejs && apt-get install -y git \
    && npm install -g hexo-cli && npm install hexo-deployer-git --save && npm install hexo-generator-feed --save \
    && npm install hexo-generator-sitemap --save
#rsa key for git
RUN ssh-keygen -t rsa -C ""
VOLUME ["$HEXO_HOME"]
WORKDIR $HEXO_HOME
EXPOSE 4000
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD hexo server
FROM node:10
ENV HEXO_HOME /var/hexo
ENV GIT_URL ''
ENV GIT_ACCOUNT ''
ENV WEB_HOOK_SECRET secret
COPY _config.yml /
COPY webhook-server.js /
COPY generate.sh /

#nodejs git hexo
RUN set -x \
    && apt-get install -y git-core \
    && npm install -g hexo-cli \
    && npm install -g github-webhook-handler \
    && mkdir $HEXO_HOME

VOLUME ["$HEXO_HOME"]
EXPOSE 4000
EXPOSE 4001
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD /bin/sh

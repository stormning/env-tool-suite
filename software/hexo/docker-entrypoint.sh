#!/bin/bash

sshKeyNotSet=''
GIT_USER=$(echo "$GIT_ACCOUNT" | awk -F '@' '{print $1}')

git config --global user.email "${GIT_ACCOUNT}"
git config --global user.name "${GIT_USER}"

function checkSSHKey(){
    sshKeyNotSet=$(ssh -T git@github.com 2>&1 | grep "Permission denied")
}

function loopCheckSSHKey(){
    checkSSHKey
    if [[ $sshKeyNotSet ]];then
        sleep 3
        loopCheckSSHKey
    fi
}

function createSSHKey(){
    if [ ! -f ~/.ssh/id_rsa.pub ]; then
        #rsa key for git
        ssh-keygen -t rsa -b 4096 -C "$GIT_ACCOUNT" -P '' -f ~/.ssh/id_rsa
        eval `ssh-agent -s`
        ssh-add ~/.ssh/id_rsa
        ssh -o 'stricthostkeychecking=no' git@github.com
    fi
    echo 'Next steps will not be started until adding your public key to github.'
    echo | cat ~/.ssh/id_rsa.pub
    loopCheckSSHKey
}

function initByClone(){
    echo 'Trying to init hexo from $GIT_URL ...'
    cd $HEXO_HOME
    git clone $GIT_URL .
    git remote add origin $GIT_URL
}

function initByDefault(){
    echo 'The given $GIT_URL repository is empty, trying to init hexo by default'
    set -x \
        && rm -fr $HEXO_HOME/.git \
        && hexo init $HEXO_HOME \
        && mv -f /_config.yml $HEXO_HOME/_config.yml \
        && sed --in-place "s|repo_url|$GIT_URL|g" "$HEXO_HOME/_config.yml" \
        && sed --in-place "s|git_account|$GIT_ACCOUNT|g" "$HEXO_HOME/_config.yml" \
        && sed --in-place "s|git_user|$GIT_USER|g" "$HEXO_HOME/_config.yml" \
        && cd $HEXO_HOME \
        && git init \
        && git add . \
        && git commit -m 'Init hexo by default' \
        && git remote add origin $GIT_URL \
        && git push -u origin master --force
}

function installExtraPlugins(){
    set -x \
    && cd $HEXO_HOME \
    && npm install hexo-deployer-git --save \
    && npm install hexo-generator-feed --save \
    && npm install hexo-generator-sitemap --save
}

function generate(){
    cd $HEXO_HOME && npm install && hexo clean && hexo generate
}

if [[ $GIT_URL && $GIT_ACCOUNT ]]; then
    createSSHKey
    if [ ! -f "$HEXO_HOME/package.json" ]; then
        initByClone
        if [ ! -f "$HEXO_HOME/package.json" ]; then
            initByDefault
        fi
        installExtraPlugins
    fi
    generate
else
    echo 'GIT_URL and GIT_ACCOUNT must be set'
fi

export NODE_PATH=$(npm root -g)
sed --in-place "s|_secret_holder|$WEB_HOOK_SECRET|g" "/webhook-server.js"
nohup node /webhook-server.js > /webhook.log &
exec "$@"
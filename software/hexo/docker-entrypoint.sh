#!/bin/bash
if [ $GIT_URL && $GIT_ACCOUNT ]; then
    if [ ! -f "$HEXO_HOME/package.json" ]; then
        echo 'Trying to init hexo from $GIT_URL ...'
        cd $HEXO_HOME && git clone $GIT_URL .
        if [ ! -f "$HEXO_HOME/package.json" ]; then
            echo 'The given $GIT_URL repository is empty, trying to init hexo by default'
            set -x \
                && rm -fr $HEXO_HOME/.git \
                && hexo init $HEXO_HOME \
                && mv -f /_config.yml $HEXO_HOME/_config.yml \
                && sed --in-place "s/repo_url/$GIT_URL/g" "$HEXO_HOME/_config.yml" \
                && cd $HEXO_HOME && git add .gitignore && git commit -m 'add .gitignore' \
                && git add . && git commit -m 'Init hexo by default' && git push origin master

             #create directories
             else cd $HEXO_HOME && npm install
        fi
        #create directories
    fi
    #generate static files and run server
    hexo clean && hexo generate && hexo server
else
    echo 'GIT_URL and GIT_ACCOUNT must be set'
fi
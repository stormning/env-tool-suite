#!/bin/bash
echo "Start generate static sources ..."
echo "pulling source code..."
cd $HEXO_HOME
git reset --hard origin/master
git clean -f
git pull
git checkout master
hexo clean && hexo generate
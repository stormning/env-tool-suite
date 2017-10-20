#!/usr/bin/env bash
docker build -t "hub.slyak.com/common" ./software/common
for file in ./software/*
do
    imgName=$(basename $file)
    if [ $imgName != 'common' ]; then
        docker build -t "hub.slyak.com/$imgName" ${file}
    fi
done
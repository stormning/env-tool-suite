#!/usr/bin/env bash
function buildByName (){
    docker build -t "slyak/$1" "./software/$1"
}

function buildAll (){
    buildByName 'common'
    buildByName 'common-openjdk'
    for file in ./software/*
    do
        imgName=$(basename $file)
        result=$(echo $imgName | grep "common")
        if [[ $result ]]; then
            buildByName $imgName
        fi
    done
}

if [ $# -gt 0 ]; then
    for var in $@; do
        buildByName $var
    done
else
    buildAll
fi
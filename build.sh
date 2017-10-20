#!/usr/bin/env bash
function buildOne (){
    docker build -t "hub.slyak.com/$1" "$2"
}

function buildByName (){
    buildOne  "$1" "./software/$1"
}

function buildAll (){
    docker build -t "hub.slyak.com/common" ./software/common
    for file in ./software/*
    do
        imgName=$(basename $file)
        if [ $imgName != 'common' ]; then
            buildOne "hub.slyak.com/$imgName" ${file}
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
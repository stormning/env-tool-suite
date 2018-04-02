#!/usr/bin/env bash
deps=()
depOrderList=[]
for file in ./software/*
 do
    firstLine=$(sed -n '1p' $file/Dockerfile)
    dep=${firstLine#*FROM }
    imgName=$(basename $file)
    if [ $(echo $dep | grep 'slyak') ];then
        if [ indexOf "${deps[@]}" $dep > 0 ];then
            echo $dep
        fi
#        depAndCount[$dep]+=1
    fi
#    echo $dep
#    echo slyak/$imgName
done

function indexOf(){
    array=("$@")
    last_idx=$(( ${#array[@]} - 1 ))
    value=${array[$last_idx]}
    unset array[$last_idx]
    exist=-1
    for i in "${!array[@]}"; do
       if [[ "${array[$i]}" = "${value}" ]]; then
           exist=${i};
       fi
    done
    echo $exist;
}
my_array=(red orange green)
v='green'

indexOf "${my_array[@]}" $v
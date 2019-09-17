#!/bin/bash

commit=$(git log --pretty=oneline --abbrev-commit | awk '{print $1}' | head -n 1)
echo $commit
commit_msg=$(git log --format=%B -n 1 $commit)
echo $commit_msg
exec $commit_msg

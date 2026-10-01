#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init -b main

echo "##### main commit 1 #####" > /dev/null
echo "main commit 1" > app.sh
echo "main commit 1" > config.txt
git add app.sh config.txt
git commit -m "main commit 1 - add app.sh and config.txt"

echo "##### main commit 2 - commit -am also took the local change to config.txt along #####" > /dev/null
echo "main commit 2" > app.sh
echo "local experiment" > config.txt
git commit -am "main commit 2 - update app.sh"
git show --stat HEAD

echo "##### put config.txt in the staging area back as it was before the last commit #####" > /dev/null
git restore --staged --source=HEAD~1 config.txt
git status

echo "##### rewrite the last commit, config.txt keeps its change in the working tree #####" > /dev/null
git commit --amend --no-edit

git show --stat HEAD
git status
cat config.txt

#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init

echo "##### commit in production #####" > /dev/null
echo "version 1" > file.txt
git add file.txt
git commit -m "commit 1 - in production"

echo "##### main moves on with risky, not-yet-released work #####" > /dev/null
echo "version 2" > file.txt
git add file.txt
git commit -m "commit 2 - risky change"

echo "version 3" > file.txt
git add file.txt
git commit -m "commit 3 - another risky change"

echo "##### the hotfix belongs on production, not on top of the risky work #####" > /dev/null
git switch --detach HEAD~2

echo "##### build the hotfix branch with three commits of its own #####" > /dev/null
git switch -c hotfix
echo "hotfix 1" >> file.txt
git add file.txt
git commit -m "hotfix 1"

echo "hotfix 2" >> file.txt
git add file.txt
git commit -m "hotfix 2"

echo "hotfix 3" >> file.txt
git add file.txt
git commit -m "hotfix 3"

git log --oneline

echo "##### a second, independent hotfix is needed on top of hotfix 2 only #####" > /dev/null
git switch --detach HEAD~1
cat file.txt

echo "##### turn that detached HEAD into hotfix-2 and commit the second fix #####" > /dev/null
git switch -c hotfix-2
echo "hotfix 2b" >> file.txt
git add file.txt
git commit -m "hotfix 2b"

git status
git log --oneline --graph --all

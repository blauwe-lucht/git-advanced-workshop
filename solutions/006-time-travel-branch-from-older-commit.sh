#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init

echo "##### this commit is what's currently in production #####" > /dev/null
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

git log --oneline

echo "##### a hotfix is needed on top of production, not on top of main #####" > /dev/null
git switch --detach HEAD~2
git status

echo "##### turn the detached HEAD into a real branch and commit the hotfix #####" > /dev/null
git switch -c hotfix
echo "hotfix" >> file.txt
git add file.txt
git commit -m "hotfix"

git status
git log --oneline --graph --all

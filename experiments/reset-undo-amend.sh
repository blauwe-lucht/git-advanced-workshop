#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init

echo "version 1" > file1.txt
git add file1.txt
git commit -m "initial commit"

git log --oneline

echo "version 1 amended" > file1.txt
git add file1.txt
git commit --amend -m "amended initial commit"

git log --oneline

# the original commit is gone from the log, but the reflog still has it
git reflog

# HEAD@{1} is where HEAD pointed to before the amend, i.e. the original commit
git reset --hard HEAD@{1}

git log --oneline
cat file1.txt

#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init

echo "version 1" > file1.txt
git add file1.txt
git commit -m "initial commit"

echo "version 2" > file1.txt
git add file1.txt
git commit -m "second commit"

git log --oneline
git status

# hard: moves the branch pointer back, unstages, and discards working tree changes
# the second commit is gone and the file is back to version 1
git reset --hard HEAD~1

git log --oneline
git status
cat file1.txt

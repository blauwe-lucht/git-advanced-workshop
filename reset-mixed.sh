#!/bin/bash

set -xe

rm -rf demo

mkdir demo
cd demo

git init

echo "version 1" > file1.txt
git add file1.txt
git commit -m "initial commit"

echo "version 2" > file1.txt
git add file1.txt
git commit -m "second commit"

git log --oneline
git status

# mixed (default): moves the branch pointer back and unstages changes,
# but keeps them in the working tree
git reset --mixed HEAD~1

git log --oneline
git status

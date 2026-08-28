#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init

echo "##### build up a small history on main #####" > /dev/null
echo "version 1" > file.txt
git add file.txt
git commit -m "commit 1"

echo "version 2" > file.txt
git add file.txt
git commit -m "commit 2"

echo "version 3" > file.txt
git add file.txt
git commit -m "commit 3"

echo "version 4" > file.txt
git add file.txt
git commit -m "commit 4"

git log --oneline

echo "##### time travel two commits back - HEAD detaches from main #####" > /dev/null
git switch --detach HEAD~2

git status
cat file.txt

echo "##### switch back - main has not moved at all #####" > /dev/null
git switch main

git log --oneline
cat file.txt

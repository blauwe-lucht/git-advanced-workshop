#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init --bare -b main origin
git clone origin alice
cd alice

echo "##### main commit 1, pushed to origin #####" > /dev/null
echo "version 1" > hello.txt
echo "main commit 1" > other.txt
git add hello.txt other.txt
git commit -m "main commit 1 - add hello.txt and other.txt"
git push

git status
git log --oneline --graph --all

# inspect the staging area and work with the four versions of hello.txt yourself

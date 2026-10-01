#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init -b main

echo "##### main commit 1 #####" > /dev/null
echo "main commit 1" > config.txt
echo "main commit 1" > readme.txt
git add config.txt readme.txt
git commit -m "main commit 1 - add config.txt and readme.txt"

echo "##### feature commit 1 - changes both files #####" > /dev/null
git switch -c feature
echo "feature commit 1" > config.txt
echo "feature commit 1" > readme.txt
git commit -am "feature commit 1 - update config.txt and readme.txt"

echo "##### main commit 2 - changes both files independently #####" > /dev/null
git switch main
echo "main commit 2" > config.txt
echo "main commit 2" > readme.txt
git commit -am "main commit 2 - update config.txt and readme.txt"

git log --oneline --graph --all

# merging feature into main conflicts in both files, try it yourself

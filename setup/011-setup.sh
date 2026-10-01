#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init -b main

echo "##### main commit 1 #####" > /dev/null
echo "main commit 1" > main.txt
git add main.txt
git commit -m "main commit 1 - add main.txt"

echo "##### feature commit 1 #####" > /dev/null
git switch -c feature
echo "feature commit 1" > feature.txt
git add feature.txt
git commit -m "feature commit 1 - add feature.txt"

echo "##### feature commit 2 #####" > /dev/null
echo "feature commit 2" >> feature.txt
git commit -am "feature commit 2 - update feature.txt"

git status
git log --oneline --graph --all

# merge feature into main yourself

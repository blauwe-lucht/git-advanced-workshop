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

echo "##### feature branch starts working on its own file #####" > /dev/null
git switch -c feature
echo "feature commit 1" > feature.txt
git add feature.txt
git commit -m "feature commit 1 - add feature.txt"

echo "##### main commit 2 - meanwhile main keeps moving too, on a different file #####" > /dev/null
git switch main
echo "main commit 2" >> main.txt
git commit -am "main commit 2 - update main.txt"

git status
git log --oneline --graph --all

# merge feature into main yourself

#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init

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

echo "##### feature commit 3 - fix typo #####" > /dev/null
echo "feature commit 3" >> feature.txt
git commit -am "feature commit 3 - fix typo"

echo "##### squash all of feature's commits into one staged change on main #####" > /dev/null
git switch main
git merge --squash feature
git commit -m "add feature (squashed)"

git log --oneline --graph --all

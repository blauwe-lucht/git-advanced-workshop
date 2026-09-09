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

echo "##### main commit 2 - a colleague sneaks in a commit right before the merge #####" > /dev/null
git switch main
echo "main commit 2" >> main.txt
git commit -am "main commit 2 - update main.txt"

echo "##### fast-forward is no longer possible - --ff-only refuses instead of silently doing something else #####" > /dev/null
git merge --ff-only feature || true
git status

echo "##### resolve it properly with a normal merge instead #####" > /dev/null
git merge feature -m "merge feature into main"

git log --oneline --graph --all

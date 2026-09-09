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

echo "##### main commit 2 - main moves on so the branches actually diverge #####" > /dev/null
echo "main commit 2" >> main.txt
git commit -am "main commit 2 - update main.txt"

echo "##### feature branch starts from before main commit 2 #####" > /dev/null
git switch -c feature HEAD~1

echo "##### feature commit 1 #####" > /dev/null
echo "feature commit 1" > feature.txt
git add feature.txt
git commit -m "feature commit 1 - add feature.txt"

echo "##### feature commit 2 #####" > /dev/null
echo "feature commit 2" >> feature.txt
git commit -am "feature commit 2 - update feature.txt"

git log --oneline --graph --all

echo "##### rebase replays feature's commits on top of main's tip, rewriting their hashes #####" > /dev/null
git rebase main

echo "##### now a clean fast-forward - no merge commit, linear history #####" > /dev/null
git switch main
git merge --ff-only feature

git log --oneline --graph --all

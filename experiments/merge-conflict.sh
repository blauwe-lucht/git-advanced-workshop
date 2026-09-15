#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init

echo "##### main commit 1 #####" > /dev/null
echo "main commit 1" > file1.txt
git add file1.txt
git commit -m "main commit 1 - add file1.txt"

echo "##### feature commit 1 - changes the same line #####" > /dev/null
git switch -c feature
echo "feature commit 1" > file1.txt
git commit -am "feature commit 1 - update file1.txt"

echo "##### main commit 2 - changes the same line independently #####" > /dev/null
git switch main
echo "main commit 2" > file1.txt
git commit -am "main commit 2 - update file1.txt"

git log --oneline --graph --all

echo "##### both sides touched the same line - this conflicts #####" > /dev/null
git merge feature || true

cat file1.txt

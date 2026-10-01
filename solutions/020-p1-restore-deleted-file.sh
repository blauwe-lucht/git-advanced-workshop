#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init -b main

echo "##### main commit 1 #####" > /dev/null
echo "main commit 1" > file1.txt
echo "main commit 1" > file2.txt
git add file1.txt file2.txt
git commit -m "main commit 1 - add file1.txt and file2.txt"

echo "##### oops: file1.txt removed from the working tree, file2.txt also from the staging area #####" > /dev/null
rm file1.txt
git rm file2.txt
git status

echo "##### get file1.txt back from the staging area #####" > /dev/null
git restore file1.txt

echo "##### get file2.txt back in both the staging area and the working tree #####" > /dev/null
git restore --staged --worktree file2.txt

git status
git log --oneline
cat file1.txt file2.txt

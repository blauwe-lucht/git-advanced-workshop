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

echo "##### changes everywhere: one staged, one unstaged, and a new untracked file #####" > /dev/null
echo "staged change" >> file1.txt
git add file1.txt
echo "unstaged change" >> file2.txt
echo "new file" > new.txt
git status

echo "##### throw away all changes to tracked files in one go #####" > /dev/null
git restore --staged --worktree .

echo "##### new.txt is still there: restore leaves untracked files alone #####" > /dev/null
git status
ls

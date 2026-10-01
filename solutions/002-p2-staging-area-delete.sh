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

echo "##### rm only removes file1.txt from the working tree, it is still in the staging area #####" > /dev/null
rm file1.txt
git ls-files --stage
git show :file1.txt
git status

echo "##### git rm removes file2.txt from the working tree and the staging area #####" > /dev/null
git rm file2.txt
git ls-files --stage
git show :file2.txt || true
git status

echo "##### a commit now only removes file2.txt, file1.txt is still in it #####" > /dev/null
git commit -m "main commit 2 - remove file2.txt"
git ls-tree --name-only HEAD
git status

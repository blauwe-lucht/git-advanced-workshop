#!/bin/bash

set -xe

rm -rf demo

mkdir demo
cd demo

git init

echo "version 1" > file1.txt
git add file1.txt
git commit -m "initial commit"

git log --oneline
git show --stat HEAD

# oops — forgot to include file2.txt in the commit
echo "version 1" > file2.txt
git add file2.txt
git commit --amend --no-edit

git log --oneline
git show --stat HEAD

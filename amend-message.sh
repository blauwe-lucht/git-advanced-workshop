#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init

echo "version 1" > file1.txt
git add file1.txt
git commit -m "inital commit"

git log --oneline

# fix the typo in the commit message without changing any files
git commit --amend -m "initial commit"

git log --oneline

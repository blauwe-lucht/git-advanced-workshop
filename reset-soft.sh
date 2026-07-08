#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init

echo "version 1" > file1.txt
git add file1.txt
git commit -m "initial commit"

echo "version 2" > file1.txt
git add file1.txt
git commit -m "second commit"

git log --oneline
git status

# soft: moves the branch pointer back, but keeps changes staged
git reset --soft HEAD~1

git log --oneline
git status

#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init

echo "version 1" > file1.txt
git add file1.txt
git commit -m "initial commit"

git checkout -b feature

echo "feature work" > feature.txt
git add feature.txt
git commit -m "add feature"

echo "more feature work" >> feature.txt
git add feature.txt
git commit -m "improve feature"

git checkout main

# --no-ff always creates a merge commit, even when fast-forward is possible
git merge --no-ff feature -m "merge feature into main"

git log --oneline --graph --all

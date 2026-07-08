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

# fast-forward: main has not diverged, so git just moves the pointer forward
# no merge commit is created — the history looks linear
git merge --ff-only feature

git log --oneline --graph --all

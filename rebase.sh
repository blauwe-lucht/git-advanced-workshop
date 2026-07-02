#!/bin/bash

set -xe

rm -rf demo

mkdir demo
cd demo

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

echo "main work" > main.txt
git add main.txt
git commit -m "work on main"

echo "more main work" >> main.txt
git add main.txt
git commit -m "more work on main"

echo "--- before rebase ---"
git log --oneline --graph --all

git checkout feature

# rebase replays feature's commits on top of main's tip
# the original commits are abandoned and replaced with new ones (different hashes)
git rebase main

echo "--- after rebase ---"
git log --oneline --graph --all

# the reflog shows the old commits still exist — rebase didn't delete them,
# it created new ones and moved the branch pointer
git reflog

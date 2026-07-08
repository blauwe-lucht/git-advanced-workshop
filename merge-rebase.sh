#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init

echo "version 1" > file1.txt
git add file1.txt
git commit -m "initial commit"

# add a commit to main so the branches actually diverge
echo "main work" > main.txt
git add main.txt
git commit -m "work on main"

git checkout -b feature HEAD~1

echo "feature work" > feature.txt
git add feature.txt
git commit -m "add feature"

echo "more feature work" >> feature.txt
git add feature.txt
git commit -m "improve feature"

git log --oneline --graph --all

# rebase replays feature commits on top of main's tip, rewriting their hashes
git rebase main

git checkout main

# now a clean fast-forward — no merge commit, linear history
git merge --ff-only feature

git log --oneline --graph --all

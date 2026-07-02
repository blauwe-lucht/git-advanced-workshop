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

echo "fix typo" >> feature.txt
git add feature.txt
git commit -m "fix typo"

git checkout main

# --squash: folds all feature commits into staged changes on main
# you then make a single clean commit — the feature branch commits don't appear in main's history
git merge --squash feature
git commit -m "add feature (squashed)"

git log --oneline --graph --all

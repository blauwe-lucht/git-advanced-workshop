#!/bin/bash

set -xe

rm -rf demo

mkdir demo
cd demo

git init

echo "hello world" > file1.txt
git add file1.txt
git commit -m "initial commit"

git checkout -b feature

echo "hello from feature" > file1.txt
git add file1.txt
git commit -m "update greeting on feature"

git checkout main

echo "hello from main" > file1.txt
git add file1.txt
git commit -m "update greeting on main"

git log --oneline --graph --all

# both branches edited the same line — this will conflict
git merge feature || true

cat file1.txt

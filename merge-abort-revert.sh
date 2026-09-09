#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init

echo "##### main commit 1 #####" > /dev/null
echo "main commit 1" > file1.txt
git add file1.txt
git commit -m "main commit 1 - add file1.txt"

echo "##### feature commit 1 - changes the same line #####" > /dev/null
git switch -c feature
echo "feature commit 1" > file1.txt
git commit -am "feature commit 1 - update file1.txt"

echo "##### main commit 2 - changes the same line independently #####" > /dev/null
git switch main
echo "main commit 2" > file1.txt
git commit -am "main commit 2 - update file1.txt"

echo "##### part A: this time we finish the merge instead of aborting #####" > /dev/null
git merge feature || true
# Fake resolving the conflict by simply putting the correct contents in the file:
echo "correct contents" > file1.txt
git commit -am "Merge branch 'feature' - resolve conflict in file1.txt"
git log --oneline --graph --all

echo "##### part B: try to revert it like a normal commit - this fails #####" > /dev/null
git revert --no-edit HEAD || true

echo "##### part C: revert the merge properly, against the main parent #####" > /dev/null
# -m 1 means 'use the first parent', that's always the branch from where git merge was used,
# in this case main.
git revert --no-edit -m 1 HEAD

git status
cat file1.txt
git log --oneline --graph --all

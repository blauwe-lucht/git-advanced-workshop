#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init -b main

echo "##### main commit 1 #####" > /dev/null
echo "main commit 1" > notes.txt
git add notes.txt
git commit -m "main commit 1 - add notes.txt"

echo "##### a commit thrown away with reset --hard is still in the reflog #####" > /dev/null
echo "main commit 2" > notes.txt
git commit -am "main commit 2 - update notes.txt"
git reset --hard HEAD~1
git reflog

echo "##### a working tree change thrown away with restore is not #####" > /dev/null
echo "never committed, never staged" > notes.txt
git restore notes.txt
git reflog
cat notes.txt

echo "##### extra: a change that was staged before is stored as a blob, without any commit pointing to it #####" > /dev/null
echo "staged once, then thrown away" > notes.txt
git add notes.txt
git restore --staged --worktree notes.txt
cat notes.txt

echo "##### find the dangling blob and get its content back #####" > /dev/null
git fsck --lost-found
blob=$(git fsck --lost-found | awk '/dangling blob/ {print $3}')
git show "$blob" > notes.txt

cat notes.txt
git status

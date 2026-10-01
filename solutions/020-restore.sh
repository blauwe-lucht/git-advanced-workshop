#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init -b main

echo "##### main commit 1 #####" > /dev/null
echo "main commit 1" > config.txt
echo "main commit 1" > app.sh
echo "main commit 1" > notes.txt
git add config.txt app.sh notes.txt
git commit -m "main commit 1 - add config.txt, app.sh and notes.txt"

echo "##### work on config.txt and app.sh, the change to config.txt is a bad idea #####" > /dev/null
echo "bad idea" >> config.txt
echo "good change" >> app.sh
git status
git diff

echo "##### discard the change to config.txt only, app.sh keeps its change #####" > /dev/null
git restore config.txt
git status
cat config.txt

echo "##### git add . also stages a debug log that does not belong in a commit #####" > /dev/null
echo "debug output" > debug.log
git add .
git status

echo "##### take debug.log out of the staging area again, the file itself stays #####" > /dev/null
git restore --staged debug.log
git status

echo "##### notes.txt is both staged and changed again, throw everything away #####" > /dev/null
echo "staged change" >> notes.txt
git add notes.txt
echo "unstaged change" >> notes.txt
git status
git restore --staged --worktree notes.txt

git status
git diff --staged
cat config.txt notes.txt
git show HEAD:app.sh
git show :app.sh
cat app.sh

#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init repo
cd repo

echo "##### first commit #####" > /dev/null
echo "line 1" > file.txt
echo "other 1" > other.txt
git add file.txt other.txt
git commit -m "initial commit"

echo "##### stage a change to both files, then stash it #####" > /dev/null
echo "line 1 - staged change" > file.txt
echo "other 1 - staged change" > other.txt
git add file.txt other.txt
git stash
git status

echo "##### make a different, unstaged change to file.txt only #####" > /dev/null
echo "line 1 - different local change" > file.txt
git status

echo "##### try to pop: git refuses instead of guessing how to combine them #####" > /dev/null
git stash pop || true
# error: Your local changes to the following files would be overwritten by merge.
# Please commit your changes or stash them before you merge.
# Aborting
# The stash entry is kept in case you need it again.
#
# Unlike a merge conflict, this never touches file.txt or writes conflict
# markers - it bails out up front and leaves both your local change and
# the stash exactly as they were.
#
# other.txt has no conflicting local change, but the pop is all-or-nothing:
# it never even got applied. It's still sitting untouched in the stash -
# check `cat other.txt` and `git status` after the failure and you'll see
# it's still "other 1", not "other 1 - staged change".

git status
git stash list

#!/bin/bash

set -xeuo pipefail

rm -rf repos
mkdir repos
cd repos

git init --bare origin

git clone origin alice
git clone origin bob
git clone origin charlie

echo "##### Setting up commits #####" > /dev/null

cd alice
echo First commit > A.txt
echo First commit > B.txt
git add .
git commit -m"Initial commit"

echo Second commit > A.txt
echo Second commit > B.txt
git add B.txt
git commit -m"Second commit"
# A.txt was modified but never `git add`ed, so the change is still unstaged here.

echo Third commit >> B.txt
git add B.txt
git commit -m"Third commit"

echo "##### Status: A.txt's change was forgotten and is still unstaged #####" > /dev/null
git status
# git rebase -i refuses to start with unstaged changes to a tracked file
# (unlike an untracked file, which it just leaves alone), so we can't
# rebase yet - commit the forgotten change first, then fix it up in place.

echo "##### Committing the forgotten change on top, to fix up into place later #####" > /dev/null
git commit -am"Forgot to add A.txt in the second commit"

echo "##### rebase #####" > /dev/null
git rebase -i HEAD~3
# The todo list (oldest to newest) starts as:
#   pick <Second commit>
#   pick <Third commit>
#   pick <Forgot to add A.txt in the second commit>
#
# Reorder it to:
#   pick   <Second commit>
#   squash <Forgot to add A.txt in the second commit>
#   pick   <Third commit>
#
# "squash" merges that commit into the one above it and then opens an
# editor so you can combine/edit the two commit messages into one -
# e.g. just keep "Second commit" and discard the other message.

git log --oneline --graph --all

git show HEAD~2
git show HEAD~1
git show HEAD

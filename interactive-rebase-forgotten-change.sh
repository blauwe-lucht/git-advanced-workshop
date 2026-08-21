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
echo First commit > file.txt
git add .
git commit -m"Initial commit"

echo Second commit >> file.txt
echo New file added in the second commit > new-file.txt
git commit -am"Second commit"
# new-file.txt was never `git add`ed, so it's still untracked here.

echo Third commit >> file.txt
git commit -am"Third commit"

echo "##### Status: new-file.txt was forgotten and is still untracked #####" > /dev/null
git status

echo "##### The old way: edit the second commit directly #####" > /dev/null
git rebase -i HEAD~2
# set commands to
# edit
# pick
# rebase will stop at the second commit.

echo "##### Status after rebase -i #####" > /dev/null
git status
echo "##### Adding the forgotten file and amending #####" > /dev/null
git add new-file.txt
git commit --amend --no-edit
git status

echo "##### Continuing and finishing rebase #####" > /dev/null
git rebase --continue

git log --oneline --graph --all

git show HEAD~2
git show HEAD~1
git show HEAD

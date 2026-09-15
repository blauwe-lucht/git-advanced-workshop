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

echo Second commit > file.txt
echo Creating and adding second file by accident > secret.txt
git add .
git commit -m"Second commit"

echo Third commit > file.txt
echo Changing second file > secret.txt
git commit -am"Third commit"

git rebase -i HEAD~2
# set commands to
# edit
# pick
# rebase will stop at second commit.

echo "##### Status after rebase -i #####" > /dev/null
git status
echo "##### Removing secret.txt and committing #####" > /dev/null
git rm secret.txt
git commit --amend --no-edit
git status

echo "##### Continuing rebase #####" > /dev/null
git rebase --continue || true

# Rebase will now find a conflict: in commit 3 a diff is applied to a non-existing file.
git status

echo "##### Removing secret.txt from third commit #####" > /dev/null
git rm secret.txt

echo "##### Continuing and finishing rebase #####" > /dev/null
# Note: no git commit here!
git rebase --continue
# This will show an editor for the commit that fixes the conflict.
# Since it shows the description of the third commit, we can simply save and exit.

git log --oneline --graph --all

git show HEAD~2
git show HEAD~1
git show HEAD

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
git add .
git commit -m"Second commit"

echo Third commit >> B.txt
git add B.txt
git commit -m"Third commit"

echo "##### Making an unstaged change to a tracked file #####" > /dev/null
echo Local change >> A.txt
git status
# A.txt is tracked (added back in the initial commit), so this is a
# modified-but-unstaged file - not an untracked one.

echo "##### rebase -i refuses to start #####" > /dev/null
git rebase -i HEAD~2

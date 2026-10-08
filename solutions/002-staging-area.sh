#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init --bare -b main origin
git clone origin alice
cd alice

echo "##### main commit 1, pushed to origin #####" > /dev/null
echo "version 1" > hello.txt
echo "main commit 1" > other.txt
git add hello.txt other.txt
git commit -m "main commit 1 - add hello.txt and other.txt"
git push

echo "##### nothing to commit, yet the staging area contains every tracked file #####" > /dev/null
git status
git ls-files --stage

echo "##### origin/main, the last commit and the staging area hold the same version #####" > /dev/null
git show origin/main:hello.txt
git show HEAD:hello.txt
git show :hello.txt

echo "##### version 2 goes into the staging area, version 3 stays in the working tree #####" > /dev/null
echo "version 2" > hello.txt
git add hello.txt
echo "version 3" > hello.txt

echo "##### three different versions of the same file, origin/main still equals HEAD #####" > /dev/null
git show origin/main:hello.txt
git show HEAD:hello.txt
git show :hello.txt
cat hello.txt

echo "##### git status shows both differences: HEAD vs staging area, and staging area vs working tree #####" > /dev/null
git status
git diff --staged
git diff

echo "##### git commit takes the staging area, not the working tree; origin/main stays behind #####" > /dev/null
git commit -m "main commit 2 - update hello.txt"
git show origin/main:hello.txt
git show HEAD:hello.txt
git show :hello.txt
cat hello.txt
git status

echo "##### git push moves origin/main to HEAD #####" > /dev/null
git push
git show origin/main:hello.txt
git status

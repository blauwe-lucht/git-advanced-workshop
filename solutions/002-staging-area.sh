#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init -b main

echo "##### main commit 1 #####" > /dev/null
echo "version 1" > hello.txt
echo "main commit 1" > other.txt
git add hello.txt other.txt
git commit -m "main commit 1 - add hello.txt and other.txt"

echo "##### nothing to commit, yet the staging area contains every tracked file #####" > /dev/null
git status
git ls-files --stage

echo "##### the version in the last commit and in the staging area are the same #####" > /dev/null
git show HEAD:hello.txt
git show :hello.txt

echo "##### version 2 goes into the staging area, version 3 stays in the working tree #####" > /dev/null
echo "version 2" > hello.txt
git add hello.txt
echo "version 3" > hello.txt

echo "##### three different versions of the same file #####" > /dev/null
git show HEAD:hello.txt
git show :hello.txt
cat hello.txt

echo "##### git status shows both differences: HEAD vs staging area, and staging area vs working tree #####" > /dev/null
git status
git diff --staged
git diff

echo "##### git commit takes the staging area, not the working tree #####" > /dev/null
git commit -m "main commit 2 - update hello.txt"
git show HEAD:hello.txt
git show :hello.txt
cat hello.txt
git status

#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init

echo "##### commit 1 #####" > /dev/null
echo "line 1" > notes.txt
git add notes.txt
git commit -m "commit 1"

echo "##### commit 2 #####" > /dev/null
echo "line 2" >> notes.txt
git add notes.txt
git commit -m "commit 2"

echo "##### commit 3 #####" > /dev/null
echo "line 3" >> notes.txt
git add notes.txt
git commit -m "commit 3"

git log --oneline

echo "##### look at the tip, no hash needed #####" > /dev/null
git show HEAD

echo "##### look one commit back #####" > /dev/null
git show HEAD~1

echo "##### look two commits back #####" > /dev/null
git show HEAD~2

echo "##### rev-parse gives you just the hash, no diff #####" > /dev/null
git rev-parse HEAD~1

echo "##### branch off and add a commit that isn't on main #####" > /dev/null
git switch -c feature
echo "line 4" >> notes.txt
git add notes.txt
git commit -m "commit 4"

echo "##### HEAD now follows feature, not main #####" > /dev/null
git show HEAD

echo "##### from feature, look at main's tip - no need to switch back #####" > /dev/null
git show main

echo "##### and one commit before that, still without switching #####" > /dev/null
git show main~1

echo "##### two different expressions, same commit - prove it with rev-parse #####" > /dev/null
git rev-parse HEAD~2
git rev-parse main~1

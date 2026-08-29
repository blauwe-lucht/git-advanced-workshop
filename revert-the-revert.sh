#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init

echo "##### commit 1 - notes.txt exists #####" > /dev/null
echo "meeting notes" > notes.txt
git add notes.txt
git commit -m "commit 1 - add notes.txt"

echo "##### commit 2 - a mistake sneaks in #####" > /dev/null
echo "wrong info that should not be here" >> notes.txt
git add notes.txt
git commit -m "commit 2 - update notes"

echo "##### commit 3 - an unrelated change lands on top #####" > /dev/null
echo "agenda" > agenda.txt
git add agenda.txt
git commit -m "commit 3 - add agenda.txt"

echo "##### revert commit 2 #####" > /dev/null
git revert --no-edit HEAD~1

git log --oneline
cat notes.txt

echo "##### turns out the reverted change was actually needed - revert the revert #####" > /dev/null
git revert --no-edit HEAD

git log --oneline
cat notes.txt

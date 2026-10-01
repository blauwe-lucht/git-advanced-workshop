#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init -b main

echo "##### main commit 1 #####" > /dev/null
echo "main commit 1" > notes.txt
git add notes.txt
git commit -m "main commit 1 - add notes.txt"

echo "##### main commit 2 - a failed experiment and good notes in the same commit #####" > /dev/null
echo "main commit 2 - failed experiment" > experiment.txt
echo "main commit 2 - good notes" > notes.txt
git add experiment.txt notes.txt
git commit -m "main commit 2 - experiment and notes"

echo "##### too eager: the whole commit is thrown away, including the good notes #####" > /dev/null
git reset --hard HEAD~1
cat notes.txt

echo "##### find the lost commit in the reflog and take only notes.txt from it #####" > /dev/null
git reflog
git restore --source=HEAD@{1} notes.txt
git commit -am "main commit 3 - good notes from the lost commit"

git log --oneline
ls
cat notes.txt

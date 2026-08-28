#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init

echo "##### commit version A #####" > /dev/null
echo "version A" > file.txt
git add file.txt
git commit -m "initial commit"

echo "##### amend to version B - version A is now only reachable via the reflog #####" > /dev/null
echo "version B" > file.txt
git add file.txt
git commit --amend --no-edit

git log --oneline

echo "##### turns out we need version A back - find it in the reflog #####" > /dev/null
git reflog
git show HEAD@{1}

echo "##### switch --detach to that commit to confirm its content #####" > /dev/null
git switch --detach HEAD@{1}
cat file.txt

echo "##### set the content aside, switch back, and recommit it #####" > /dev/null
cp file.txt rescued-file.txt
git switch main
mv rescued-file.txt file.txt
git add file.txt
git commit -m "restore version A"

git log --oneline
cat file.txt

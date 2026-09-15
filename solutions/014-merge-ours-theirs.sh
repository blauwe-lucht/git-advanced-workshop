#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init

echo "##### main commit 1 #####" > /dev/null
echo "main commit 1" > config.txt
git add config.txt
git commit -m "main commit 1 - add config.txt"

echo "##### feature commit 1 - feature changes the setting #####" > /dev/null
git switch -c feature
echo "feature commit 1" > config.txt
git commit -am "feature commit 1 - update config.txt"

echo "##### main commit 2 - main changes the same setting independently, this would normally conflict #####" > /dev/null
git switch main
echo "main commit 2" > config.txt
git commit -am "main commit 2 - update config.txt"

git log --oneline --graph --all

echo "##### force the merge to always keep main's own version of config.txt #####" > /dev/null
git merge -X ours feature -m "merge feature into main, keep config from main"

cat config.txt
git log --oneline --graph --all

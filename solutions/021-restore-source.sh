#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init -b main

echo "##### main commit 1 #####" > /dev/null
echo "main commit 1" > config.txt
echo "main commit 1" > app.sh
git add config.txt app.sh
git commit -m "main commit 1 - add config.txt and app.sh"

echo "##### a colleague improves config.txt on their feature branch #####" > /dev/null
git switch -c feature
echo "feature commit 1 - improved config" > config.txt
git commit -am "feature commit 1 - improve config.txt"

echo "##### ... and continues with work that is not finished yet #####" > /dev/null
echo "feature commit 2 - unfinished work" > app.sh
git commit -am "feature commit 2 - unfinished work on app.sh"

echo "##### you need only the improved config.txt on main now #####" > /dev/null
git switch main
git restore --source=feature config.txt
git status
git commit -am "main commit 2 - take config.txt from feature"

git log --oneline --graph --all
cat config.txt app.sh

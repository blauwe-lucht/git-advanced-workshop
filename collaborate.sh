#!/bin/bash

set -xeuo pipefail

rm -rf repos
mkdir repos && cd repos
git init --bare origin

git clone origin alice
git clone origin bob

echo "##### alice sets up the project and pushes #####" > /dev/null
cd alice
echo "# project" > README.md
git add README.md
git commit -m "add README"
git push
cd ..

echo "##### bob pulls main and starts work on a branch #####" > /dev/null
cd bob
git pull
git checkout -b feature/bob
echo "feature 1" > feature1.txt
git add feature1.txt
git commit -m "add feature 1"
git push -u origin feature/bob

echo "##### bob merges his branch into main, emulating a merged PR #####" > /dev/null
git switch main
git merge --no-ff feature/bob -m "merge feature/bob"
git push
cd ..

echo "##### alice pulls main, starts her own branch on top of it #####" > /dev/null
cd alice
git pull
git switch -c feature/alice
echo "feature 2" > feature2.txt
git add feature2.txt
git commit -m "add feature 2"
git push -u origin feature/alice

echo "##### alice merges her branch into main #####" > /dev/null
git switch main
git merge --no-ff feature/alice -m "merge feature/alice"
git push
cd ..

echo "##### bob pulls and both are in sync #####" > /dev/null
cd bob
git pull
git log --oneline --graph --all

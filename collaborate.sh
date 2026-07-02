#!/bin/bash

set -xeuo pipefail

rm -rf demo
mkdir demo && cd demo
git init --bare origin

git clone origin alice
git clone origin bob

# alice sets up the project and pushes
cd alice
echo "# project" > README.md
git add README.md
git commit -m "add README"
git push
cd ..

# bob pulls main and starts work on a branch
cd bob
git pull
git checkout -b feature/bob
echo "feature 1" > feature1.txt
git add feature1.txt
git commit -m "add feature 1"
git push -u origin feature/bob

# bob merges his branch into main, emulating a merged PR
git checkout main
git merge --no-ff feature/bob -m "merge feature/bob"
git push
cd ..

# alice pulls main, starts her own branch on top of it
cd alice
git pull
git checkout -b feature/alice
echo "feature 2" > feature2.txt
git add feature2.txt
git commit -m "add feature 2"
git push -u origin feature/alice

# alice merges her branch into main
git checkout main
git merge --no-ff feature/alice -m "merge feature/alice"
git push
cd ..

# bob pulls and both are in sync
cd bob
git pull
git log --oneline --graph --all

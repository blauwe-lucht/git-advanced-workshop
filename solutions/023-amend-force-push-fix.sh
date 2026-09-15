#!/bin/bash

set -xeuo pipefail

rm -rf repos
mkdir repos && cd repos
git init --bare origin

git clone origin alice

cd alice
echo "version 1" > file1.txt
git add file1.txt
git commit -m "initial commit by alice"
echo "version 2" > file1.txt
git add file1.txt
git commit -m "second commit by alice"
git push
cd ..

git clone origin bob

cd alice
echo "new file by alice" >> file2.txt
git add file2.txt
git commit -am "third commit by alice"
cd ..

cd bob
echo "version 2 amended" > file1.txt
git commit --amend -am "bob amended second commit"
git push --force-with-lease
cd ..

cd alice
git pull --no-rebase || true

git log --oneline --graph --all

# abort the conflicting merge — origin/main is already up to date from the pull
git merge --abort

# alice's branch still contains her copy of "second commit" which bob already
# amended — a plain rebase would replay it and conflict. HEAD~1 points to
# that commit, so --onto skips it and only replays alice's unique "third commit"
git rebase --onto origin/main HEAD~1

git log --oneline --graph --all

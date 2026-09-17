#!/bin/bash

set -xeuo pipefail

rm -rf repos
mkdir repos && cd repos
git init --bare -b main origin

git clone origin alice

echo "====> Alice creates and pushes two commits" > /dev/null
cd alice
echo "version 1" > file1.txt
git add file1.txt
git commit -m "initial commit by alice"
echo "version 2" > file1.txt
git add file1.txt
git commit -m "second commit by alice"
git push
cd ..

echo "====> Bob clones repo" > /dev/null
git clone origin bob

echo "====> Alice creates third commit" > /dev/null
cd alice
echo "new file by alice" >> file2.txt
git add file2.txt
git commit -am "third commit by alice"
cd ..

echo "====> Bob amends second commit of Alice and force pushes" > /dev/null
cd bob
echo "version 2 amended" > file1.txt
git commit --amend -am "bob amended second commit"
git push --force-with-lease
cd ..

echo "====> Alice performs a pull --rebase and all is well" > /dev/null
cd alice
git fetch
git log --oneline --graph --all
# pull --rebase uses fork-point, show it:
git merge-base --fork-point origin/main main
git pull --rebase --no-edit
git log --oneline --graph --all
cat file1.txt

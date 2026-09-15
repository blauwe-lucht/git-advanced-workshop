#!/bin/bash

set -xeuo pipefail

rm -rf repos
mkdir repos && cd repos
git init --bare origin

git clone origin alice

echo "====> Alice creates two commits." > /dev/null
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

echo "====> Alice makes a new commit (but doesn't push)." > /dev/null
cd alice
echo "new file by alice" >> file2.txt
git add file2.txt
git commit -am "third commit by alice"
cd ..

echo "====> Bob rewrites history and force pushes." > /dev/null
cd bob
echo "version 2 amended" > file1.txt
git commit --amend -am "bob amended second commit"
git push --force-with-lease
cd ..

echo "====> Alice doesn't know about the forced push and does a pull." > /dev/null
cd alice
git pull || true
# pull gives a fatal error
git status
git log --oneline --graph --all

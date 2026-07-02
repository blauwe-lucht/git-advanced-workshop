#!/bin/bash

set -xeuo pipefail

rm -rf demo
mkdir demo && cd demo
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

# Alice makes a new commit (but doesn't push).
cd alice
echo "new file by alice" >> file2.txt
git add file2.txt
git commit -am "third commit by alice"
cd ..

# Bob rewrites history and force pushes.
cd bob
echo "version 2 amended" > file1.txt
git commit --amend -am "bob amended second commit"
git push --force-with-lease
cd ..

# Alice doesn't know about the forced push and does a pull.
cd alice
git pull --no-rebase
# conflicts

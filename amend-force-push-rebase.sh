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
git pull --rebase --no-edit
cat file1.txt

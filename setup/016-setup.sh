#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

echo "##### project-a: this is the main project #####" > /dev/null
mkdir project-a
cd project-a
git init -b main
echo "main commit 1" > app.txt
git add app.txt
git commit -m "main commit 1 - add app.txt"
cd ..

echo "##### project-old: a completely separate repo with its own, unrelated history #####" > /dev/null
mkdir project-old
cd project-old
git init -b main
echo "old commit 1" > legacy.txt
git add legacy.txt
git commit -m "old commit 1 - add legacy.txt"
cd ..

echo "##### bring project-old in as a remote of project-a #####" > /dev/null
cd project-a
git remote add old ../project-old
git fetch old

# try to merge it in yourself

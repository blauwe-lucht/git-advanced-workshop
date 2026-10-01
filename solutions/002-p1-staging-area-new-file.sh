#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init -b main

echo "##### main commit 1 #####" > /dev/null
echo "main commit 1" > hello.txt
git add hello.txt
git commit -m "main commit 1 - add hello.txt"

echo "##### a new file exists only in the working tree #####" > /dev/null
echo "new file" > new.txt
git ls-files --stage
git show :new.txt || true
git show HEAD:new.txt || true

echo "##### after git add it is in the staging area, but not yet in HEAD #####" > /dev/null
git add new.txt
git ls-files --stage
git show :new.txt
git show HEAD:new.txt || true

echo "##### after git commit it is in all three #####" > /dev/null
git commit -m "main commit 2 - add new.txt"
git show HEAD:new.txt
git show :new.txt
cat new.txt

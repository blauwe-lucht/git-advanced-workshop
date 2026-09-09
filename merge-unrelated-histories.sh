#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

echo "##### project-a: this is the main project #####" > /dev/null
mkdir project-a
cd project-a
git init
echo "main commit 1" > app.txt
git add app.txt
git commit -m "main commit 1 - add app.txt"
cd ..

echo "##### project-old: a completely separate repo with its own, unrelated history #####" > /dev/null
mkdir project-old
cd project-old
git init
echo "old commit 1" > legacy.txt
git add legacy.txt
git commit -m "old commit 1 - add legacy.txt"
cd ..

echo "##### bring project-old in as a remote of project-a #####" > /dev/null
cd project-a
git remote add old ../project-old
git fetch old

echo "##### a normal merge refuses - there is no common ancestor #####" > /dev/null
git merge old/main || true

echo "##### explicitly allow merging these two unrelated histories #####" > /dev/null
git merge --allow-unrelated-histories old/main -m "merge project-old into project-a"

ls
git log --oneline --graph --all

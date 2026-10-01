#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init -b main

echo "##### main commit 1 - a shopping list with lines far enough apart to become separate hunks #####" > /dev/null
printf "%s\n" apples bread butter cheese eggs flour milk pasta rice sugar tea > shopping.txt
git add shopping.txt
git commit -m "main commit 1 - add shopping.txt"

echo "##### two unrelated changes in the same file, only the first belongs in the next commit #####" > /dev/null
sed -i 's/^apples$/green apples/' shopping.txt
sed -i 's/^tea$/chocolate/' shopping.txt
git diff

echo "##### answer y for the apples hunk and n for the chocolate hunk #####" > /dev/null
git add -p shopping.txt

echo "##### the staging area now holds a version of the file that never existed in the working tree #####" > /dev/null
git status
git show :shopping.txt
git diff --staged
git diff

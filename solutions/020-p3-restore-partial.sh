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

echo "##### two unrelated changes in the same file: keep the first, discard the second #####" > /dev/null
sed -i 's/^apples$/green apples/' shopping.txt
sed -i 's/^tea$/chocolate/' shopping.txt
git diff

echo "##### answer n for the apples hunk and y for the chocolate hunk #####" > /dev/null
git restore -p shopping.txt

git diff

#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init -b main

echo "##### main commit 1 #####" > /dev/null
echo "main commit 1" > config.txt
echo "main commit 1" > app.sh
echo "main commit 1" > notes.txt
git add config.txt app.sh notes.txt
git commit -m "main commit 1 - add config.txt, app.sh and notes.txt"

echo "##### work on config.txt and app.sh, the change to config.txt is a bad idea #####" > /dev/null
echo "bad idea" >> config.txt
echo "good change" >> app.sh

git status
git diff

# restore config.txt only, then continue with debug.log and notes.txt yourself

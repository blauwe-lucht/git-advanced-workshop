#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init

echo "##### build up four commits on main #####" > /dev/null
echo "version 1" > file.txt
git add file.txt
git commit -m "commit 1"

echo "version 2" > file.txt
git add file.txt
git commit -m "commit 2"

echo "version 3" > file.txt
git add file.txt
git commit -m "commit 3"

echo "version 4" > file.txt
git add file.txt
git commit -m "commit 4"

git log --oneline

echo "##### jump two commits back #####" > /dev/null
git switch --detach HEAD~2
cat file.txt

echo "##### jump three commits back #####" > /dev/null
git switch --detach HEAD~1
cat file.txt

echo "##### jump one commit back #####" > /dev/null
# Since the commit we want to jump to is not part of the history of our detached HEAD,
# we have to refer to it by other means, for example by using the 'main' ref.
# Switching to main and then switching to HEAD~1 would work as well.
git switch --detach main~1
cat file.txt

echo "##### switch back to main - nothing has changed there #####" > /dev/null
git switch main

git log --oneline
cat file.txt

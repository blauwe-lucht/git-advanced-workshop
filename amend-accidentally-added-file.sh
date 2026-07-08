#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init

echo "version 1" > file1.txt
echo "secret" > secret.txt
git add .
git commit -m "initial commit"

git log --oneline
git show --stat HEAD

# oops — secret.txt should not have been committed
git rm --cached secret.txt
git commit --amend --no-edit

git log --oneline
git show --stat HEAD

# secret.txt is still in the working tree, just no longer tracked
ls

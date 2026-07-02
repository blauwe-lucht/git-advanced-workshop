#!/bin/bash

set -xe

rm -rf demo

mkdir demo
cd demo

git init

echo "version 1" > file1.txt
git add file1.txt
git commit -m "initial commit"

echo "wip" >> file1.txt
git add file1.txt
git commit -m "wip"

echo "wip 2" >> file1.txt
git add file1.txt
git commit -m "wip 2"

echo "done" >> file1.txt
git add file1.txt
git commit -m "add feature"

git log --oneline

# hand off to the student — mark the wip commits as 'squash' or 'fixup'
# to fold them into the first commit
git rebase -i HEAD~3

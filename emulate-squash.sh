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
git commit -m "done"

git log --oneline

# soft reset moves the branch pointer back but leaves all changes staged
git reset --soft HEAD~3

# all three commits are now squashed into a single staged change
git commit -m "add feature"

git log --oneline

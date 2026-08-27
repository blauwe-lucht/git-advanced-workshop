#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init repo
cd repo

echo "##### first commit #####" > /dev/null
echo "readme v1" > readme.txt
echo "config v1" > config.txt
echo "notes v1" > notes.txt
git add readme.txt config.txt notes.txt
git commit -m "initial commit"

echo "##### change two files, stage only one of them #####" > /dev/null
echo "readme v2" > readme.txt
echo "config v2" > config.txt
git add readme.txt
git status

echo "##### stash both the staged and unstaged change #####" > /dev/null
git stash
git stash list
git status

echo "##### change a third file and stash it too - two stashes on the stack #####" > /dev/null
echo "notes v2" > notes.txt
git stash
git stash list
git stash show stash@{0}
git stash show stash@{1}

echo "##### pop the most recent stash back - keep its staged/unstaged split #####" > /dev/null
git stash pop --index
git stash list

echo "##### pop the remaining, oldest stash back too #####" > /dev/null
git stash pop --index
git stash list
git status

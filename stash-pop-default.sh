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
git add readme.txt config.txt
git commit -m "initial commit"

echo "##### stage one change, leave the other unstaged, then stash both #####" > /dev/null
echo "readme v2" > readme.txt
echo "config v2" > config.txt
git add readme.txt
git status
git stash

echo "##### something else touches the staging area #####" > /dev/null
echo "notes v1" > notes.txt
git add notes.txt
git commit -m "unrelated commit that touches the staging area"

echo "##### pop the stash #####" > /dev/null
git stash pop
git status

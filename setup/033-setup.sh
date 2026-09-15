#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init repo
cd repo

echo "##### first commit on main #####" > /dev/null
echo "first commit" > readme.txt
git add readme.txt
git commit -m "initial commit"

echo "##### feature branch from main with its own commit #####" > /dev/null
git switch -c feature/new-feature

echo "first commit on feature branch" > feature.txt
git add feature.txt
git commit -m "added feature"

echo "##### unfinished change on the feature branch, not committed yet #####" > /dev/null
echo "unfinished..." >> readme.txt

git status
git log --oneline --graph --all

# add a second worktree with a hotfix branch from main yourself

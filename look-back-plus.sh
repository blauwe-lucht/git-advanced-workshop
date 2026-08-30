#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init

echo "##### commit 1 #####" > /dev/null
echo "line 1" > notes.txt
git add notes.txt
git commit -m "main commit 1"

echo "##### commit 2 - this is where main splits off from the rest #####" > /dev/null
echo "line 2" >> notes.txt
git add notes.txt
git commit -m "main commit 2"

echo "##### feature-b continues past commit 2 - main will continue separately #####" > /dev/null
git switch -c feature-b
echo "on the way to feature-a" > shared.txt
git add shared.txt
git commit -m "feature-a commit 1"

echo "shared.txt" >> shared.txt
git add shared.txt
git commit -m "featura-a commit 2"

echo "##### feature-a branches off here, one commit #####" > /dev/null
git switch -c feature-a
echo "feature a" > feature-a.txt
git add feature-a.txt
git commit -m "feature-a commit 3"

echo "##### back to feature-b, which continues three more commits #####" > /dev/null
git switch feature-b
echo "feature b 1" > feature-b.txt
git add feature-b.txt
git commit -m "feature-b commit 1"

echo "feature b 2" >> feature-b.txt
git add feature-b.txt
git commit -m "feature-b commit 2"

echo "feature b 3" >> feature-b.txt
git add feature-b.txt
git commit -m "feature-b commit 3"

echo "##### back to main, which only gets one more commit of its own #####" > /dev/null
git switch main
echo "line 3" >> notes.txt
git add notes.txt
git commit -m "main commit 3"

git log --oneline --graph --all

echo "##### three different ways to point at the same commit (commit 2) #####" > /dev/null
git show main~1
git show feature-a~3
git show feature-b~5

echo "##### a fourth way #####" > /dev/null
# We're on branch main, so HEAD~1 also points to the second commit.
# On other branches the number changes accordingly.
git show HEAD~1

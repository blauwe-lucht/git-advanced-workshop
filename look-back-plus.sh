#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init

echo "##### main commit 1 #####" > /dev/null
echo "line 1" > notes.txt
git add notes.txt
git commit -m "main commit 1"
sleep 1

echo "##### main commit 2 #####" > /dev/null
echo "line 2" >> notes.txt
git add notes.txt
git commit -m "main commit 2"
sleep 1

echo "##### feature-a splits of from commit 2 - main will continue separately #####" > /dev/null
git switch -c feature-a
echo "first commit on feature-a" > feature-a.txt
git add feature-a.txt
git commit -m "feature-a commit 1"
sleep 1

echo "##### back to main, which only gets one more commit of its own #####" > /dev/null
git switch main
echo "line 3" >> notes.txt
git add notes.txt
git commit -m "main commit 3"
sleep 1

echo "##### commit 2 on feature-a #####" > /dev/null
git switch feature-a
echo "second commit on feature-a" >> feature-a.txt
git commit -am "feature-a commit 2"
sleep 1

echo "##### feature-b branches off here #####" > /dev/null
git switch -c feature-b
echo "first commit on feature-b" > feature-b.txt
git add feature-b.txt
git commit -m "feature-b commit 1"
sleep 1

echo "##### back to feature-a, which adds one more commit #####" > /dev/null
git switch feature-a
echo "third commit on feature-a" > feature-a.txt
git commit -am "feature-a commit 3"
sleep 1

echo "##### add the other two commits on feature-b #####" > /dev/null
git switch feature-b
echo "second commit on feature-b" >> feature-b.txt
git commit -am "feature-b commit 2"
sleep 1

echo "third commt on feature-b" >> feature-b.txt
git commit -am "feature-b commit 3"

git log --oneline --graph --all

echo "##### three different ways to point at the same commit (commit 2) #####" > /dev/null
git show main~1
git show feature-a~3
git show feature-b~5

echo "##### a fourth way #####" > /dev/null
# We're on branch main, so HEAD~1 also points to the second commit.
# On other branches the number changes accordingly.
git show HEAD~1

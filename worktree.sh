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
git checkout -b feature/new-feature

echo "first commit on feature branch" > feature.txt
git add feature.txt
git commit -m "added feature"

echo "##### unfinished change on the feature branch, not committed yet #####" > /dev/null
echo "unfinished..." >> readme.txt
git status

echo "##### a hotfix is needed urgently, but the uncommitted change on the #####" > /dev/null
echo "##### feature branch must not be touched. the hotfix also shouldn't be #####" > /dev/null
echo "##### committed directly on main, so add a second worktree with a new #####" > /dev/null
echo "##### hotfix branch from main #####" > /dev/null
git worktree add -b hotfix/urgent ../repo-hotfix main
git worktree list

echo "##### make the hotfix in the second worktree #####" > /dev/null
cd ../repo-hotfix

echo "hotfix" > hotfix.txt
git add hotfix.txt
git commit -m "hotfix: fixed!"

echo "##### back to the original worktree #####" > /dev/null
cd ../repo
git status

echo "##### merge the hotfix branch into main from the original worktree #####" > /dev/null
git switch main
git merge --no-ff hotfix/urgent -m "merge hotfix/urgent into main"

echo "##### clean up the second worktree and the hotfix branch #####" > /dev/null
git worktree remove ../repo-hotfix
git branch -d hotfix/urgent
git worktree list
git branch
git log --oneline --graph --all
git status
git diff

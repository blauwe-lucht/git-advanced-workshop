#!/bin/bash

# Startpunt voor een nieuwe oefening. Kopieer dit bestand en bouw je scenario.
# Elke oefening staat op zichzelf en maakt een verse repos/ from scratch, net
# als de demo-scripts in de root. Heb je geen remote nodig? Laat de bare repo
# en de clones weg en gebruik gewoon `git init` in repos/.

set -xeuo pipefail

rm -rf repos
mkdir repos
cd repos

git init --bare origin

git clone origin alice
git clone origin bob
git clone origin charlie

echo "##### Setting up old commit with secret #####" > /dev/null

cd alice
echo First commit > file.txt
git add .
git commit -m"Initial commit"

echo Second commit > file.txt
echo Creating and adding second file by accident > secret.txt
git add .
git commit -m"Second commit"

echo Third commit > file.txt
git commit -am"Third commit"

git rebase -i HEAD~2
# set commands to
# edit
# pick
# rebase will stop at second commit.

echo "##### Status after rebase -i #####" > /dev/null
git status
echo "##### Removing secret.txt and committing #####" > /dev/null
git rm secret.txt
git commit --amend --no-edit
git status

echo "##### Continuing and finishing rebase #####" > /dev/null
git rebase --continue

git log --oneline --graph --all

git show HEAD~2
git show HEAD~1
git show HEAD

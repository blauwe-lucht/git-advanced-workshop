#!/bin/bash

set -xeuo pipefail

rm -rf repos
mkdir repos
cd repos

git init --bare origin

git clone origin alice
git clone origin bob
git clone origin charlie

echo "##### Setting up commits #####" > /dev/null

cd alice
echo First commit > file.txt
git add .
git commit -m"Initial commit"

echo Second commit >> file.txt
echo New file added in the second commit > new-file.txt
git commit -am"Second commit"
# new-file.txt was never `git add`ed, so it's still untracked here.

echo Third commit >> file.txt
git commit -am"Third commit"

echo "##### Status: new-file.txt was forgotten and is still untracked #####" > /dev/null
git status

echo "##### Committing the forgotten file as a fixup for the second commit #####" > /dev/null
git add new-file.txt
git commit --fixup=HEAD~1

echo "##### Autosquash rebase: fixup will move next to and merge into the second commit #####" > /dev/null
git rebase -i --autosquash HEAD~3
# The todo list is already ordered correctly by --autosquash (the fixup
# commit is placed right after "Second commit" and set to "fixup").
# Just save and close the editor.

git log --oneline --graph --all

git show HEAD~2
git show HEAD~1
git show HEAD

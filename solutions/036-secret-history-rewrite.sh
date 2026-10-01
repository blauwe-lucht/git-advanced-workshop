#!/bin/bash

set -xeuo pipefail

rm -rf repos
mkdir repos
cd repos

git init --bare -b main origin

git clone origin bob
git clone origin alice

echo "##### bob commit 1 #####" > /dev/null
cd bob
echo "bob commit 1" > file.txt
git add file.txt
git commit -m"bob commit 1"

echo "##### bob commit 2 - a real change, plus a secret committed by accident #####" > /dev/null
echo "bob commit 2" >> file.txt
echo "API_KEY=sk-live-1234567890abcdef" > secrets.txt
git add file.txt secrets.txt
git commit -m"bob commit 2 - update file.txt and add config (oops, real API key)"
git push
cd ..

echo "##### alice pulls while the secret is still in the history #####" > /dev/null
cd alice
git pull
cd ..

echo "##### bob commit 3 #####" > /dev/null
cd bob
echo "bob commit 3" >> file.txt
git commit -am"bob commit 3"
git push
cd ..

echo "##### alice commit 4 #####" > /dev/null
cd alice
echo "alice commit 4" >> file.txt
git commit -am"alice commit 4"
cd ..

echo "##### bob discovers the secret and needs to remove it, keeping his real change #####" > /dev/null
cd bob
git log --oneline --graph --all
git rebase -i HEAD~2
# Set "bob commit 2" to `edit`, leave "bob commit 3" on `pick`.
# The rebase stops right after "bob commit 2".

echo "##### removing the secret from that commit, keeping the real change #####" > /dev/null
git rm secrets.txt
git commit --amend --no-edit
git rebase --continue

git log --oneline --graph --all

echo "##### bob force-pushes the rewritten, secret-free history #####" > /dev/null
git push --force-with-lease
cd ..

echo "##### alice's push is rejected - her history no longer matches origin #####" > /dev/null
cd alice
git push || true

echo "##### a naive fetch + merge brings back a conflict, and the secret #####" > /dev/null
git fetch
git merge origin/main || true
git status
ls secrets.txt
echo "##### secrets.txt is back - her side of the merge still has it #####" > /dev/null
git merge --abort

echo "##### plain rebase onto origin/main isn't enough either - her old, tainted #####" > /dev/null
echo "##### commit 2 is a different commit than bob's, so it would be replayed too #####" > /dev/null
echo "##### the fix: skip it with --onto, replaying only her own commit #####" > /dev/null
git rebase --onto origin/main HEAD~1
# Resolve the conflict in file.txt so it contains bob's commit 3 line
# followed by alice's commit 4 line, then continue.

git log --oneline --graph --all

echo "##### her main is a straight continuation of origin/main again #####" > /dev/null
git push

echo "##### verify: the secret is nowhere in the history anymore #####" > /dev/null
git log --all -p -- secrets.txt
cat file.txt

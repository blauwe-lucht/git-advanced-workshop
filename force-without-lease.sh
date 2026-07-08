#!/bin/bash

set -xeuo pipefail

rm -rf repos
mkdir repos
cd repos

git init --bare origin
git clone origin alice
git clone origin bob

echo "alice creates initial commit"
cd alice
echo "version 1" > file1.txt
git add file1.txt
git commit -m "initial commit"
git push
cd ..

echo "bob pulls all changes"
cd bob
git pull
cd ..

echo "alice pushes new work while bob is still working:"
cd alice
echo "alice's new work" > file2.txt
git add file2.txt
git commit -m "alice adds file2"
git push
git log --oneline
cd ..

echo "bob amends hist last known commit and force-pushes without fetching first"
# plain --force overwrites whatever is on the remote, no matter what's there,
# unlike --force-with-lease it does not check that the remote hasn't moved
cd bob
echo "version 1 amended" > file1.txt
git commit --amend -am "initial commit (amended)"
git push --force
cd ..

echo "alice's commit is gone from the remote - a normal fetch shows no trace of it"
cd alice
git fetch
git log --oneline origin/main

# the only way alice can recover her work is through her own local reflog,
# since her branch still points at the commit that got overwritten
git reflog

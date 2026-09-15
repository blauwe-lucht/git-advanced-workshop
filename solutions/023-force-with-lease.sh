#!/bin/bash

set -xeuo pipefail

rm -rf repos
mkdir repos && cd repos
git init --bare origin

git clone origin alice
git clone origin bob

cd alice
echo "version 1" > file1.txt
git add file1.txt
git commit -m "initial commit"
git push
cd ..

cd bob
git pull
cd ..

# --- success case ---
# bob amends and force-pushes; nobody else has pushed in the meantime
# --force-with-lease checks that the remote ref still matches bob's last known state
cd bob
echo "version 1 amended" > file1.txt
git commit --amend -am "initial commit (amended)"
git push --force-with-lease
cd ..

# --- failure case ---
# alice pushes a new commit while bob is still working
cd alice
git pull --rebase
echo "alice's new work" > file2.txt
git add file2.txt
git commit -m "alice adds file2"
git push
cd ..

# bob amends again without fetching first — his lease is now stale
# --force-with-lease detects that the remote has moved and rejects the push
cd bob
echo "version 1 amended again" > file1.txt
git commit --amend -am "initial commit (amended again)"
git push --force-with-lease

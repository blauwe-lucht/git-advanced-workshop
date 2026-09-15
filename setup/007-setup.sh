#!/bin/bash

set -xeuo pipefail

rm -rf repos
mkdir repos && cd repos
git init --bare origin

git clone origin alice
git clone origin bob

echo "##### alice writes a small script, commit by commit, and pushes #####" > /dev/null
cd alice
echo "echo hello" > greet.sh
git add greet.sh
git commit -m "v1 - say hello"

echo "echo hello, world" > greet.sh
git commit -am "v2 - greet the world"

echo "echo Hello, World!" > greet.sh
git commit -am "v3 - capitalize and add punctuation"
git push
cd ..

echo "##### bob fetches, now on the same commit as alice #####" > /dev/null
cd bob
git pull
git log --oneline --graph --all
cd ..

# tag alice's current commit as the v1.0 release yourself

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
cd ..

echo "##### alice tags v3 as the v1.0 release #####" > /dev/null
cd alice
git tag -a v1.0 -m "release v1.0"
cd ..

echo "##### main keeps moving after the tag #####" > /dev/null
cd alice
echo "echo Hello, World! >&2" > greet.sh
git commit -am "v4 - write to stderr instead"
cd ..

echo "##### a plain push sends the new commit, but not the tag #####" > /dev/null
cd alice
git push
git ls-remote --tags origin
cd ..

echo "##### bob fetches - gets the new commit, still no tag #####" > /dev/null
cd bob
git fetch
git tag
cd ..

echo "##### alice pushes the tag explicitly #####" > /dev/null
cd alice
git push origin v1.0
cd ..

echo "##### a plain fetch picks it up #####" > /dev/null
cd bob
git fetch
git tag

echo "##### bob needs a hotfix on exactly the v1.0 release #####" > /dev/null
git switch -c hotfix v1.0
echo "echo Hello, World! # hotfix" > greet.sh
git commit -am "hotfix: quick fix on top of v1.0"

git log --oneline --graph --all
cd ..

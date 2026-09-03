#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init --bare origin

echo "##### alice fills the repo with three commits #####" > /dev/null
git clone origin alice
cd alice

echo "v1" > file.txt
git add file.txt
git commit -m "v1"

echo "v2" > file.txt
git add file.txt
git commit -m "v2"

echo "v3" > file.txt
git add file.txt
git commit -m "v3"

git log --oneline

git push

cd ..

echo "##### bob clones with --depth 1: only the tip commit is fetched #####" > /dev/null
# a plain path clone is a local clone and Git ignores --depth for those, so bob uses file:// to force a real network-style shallow clone
git clone --depth 1 "file://$(pwd)/origin" bob
cd bob

echo "##### log works fine, but only shows the one commit bob has #####" > /dev/null
git log --oneline

echo "##### bob knows the earlier commit hashes from alice, but their objects were never fetched #####" > /dev/null
git switch --detach HEAD~1 || true

echo "##### git fetch --unshallow turns it into a full clone, after which the old commit works #####" > /dev/null
git fetch --unshallow
git switch --detach HEAD~1
git log --oneline

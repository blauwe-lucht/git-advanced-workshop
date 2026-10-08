#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init -b main

echo "##### main commit 1 #####" > /dev/null
echo "version 1" > hello.txt
echo "main commit 1" > other.txt
git add hello.txt other.txt
git commit -m "main commit 1 - add hello.txt and other.txt"

git status
git log --oneline --graph --all

# inspect the staging area and work with the three versions of hello.txt yourself

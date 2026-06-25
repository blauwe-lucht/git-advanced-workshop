#!/bin/bash

set -xe

rm -rf demo

mkdir demo
cd demo

git init

echo "version 1" > file1.txt
git add file1.txt
git commit -m "initial commit"

git log --oneline

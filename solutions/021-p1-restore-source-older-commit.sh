#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init -b main

echo "##### main commit 1 #####" > /dev/null
echo "price: 10" > prices.txt
echo "main commit 1" > readme.txt
git add prices.txt readme.txt
git commit -m "main commit 1 - add prices.txt and readme.txt"

echo "##### main commit 2 - a colleague breaks prices.txt but improves readme.txt #####" > /dev/null
echo "price: -10" > prices.txt
echo "main commit 2 - improved readme" > readme.txt
git commit -am "main commit 2 - update prices and readme"

echo "##### two more commits before anyone notices #####" > /dev/null
echo "main commit 3" > file3.txt
git add file3.txt
git commit -m "main commit 3 - add file3.txt"
echo "main commit 4" > file4.txt
git add file4.txt
git commit -m "main commit 4 - add file4.txt"

echo "##### get only prices.txt back as it was before main commit 2 #####" > /dev/null
git restore --source=HEAD~3 prices.txt
git status
git commit -am "main commit 5 - restore prices.txt from before main commit 2"

git log --oneline
cat prices.txt readme.txt

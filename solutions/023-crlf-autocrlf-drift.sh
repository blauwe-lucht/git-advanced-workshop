#!/bin/bash

set -xeuo pipefail

rm -rf repos
mkdir repos
cd repos

git init --bare origin

git clone origin alice

echo "##### alice seeds the repo with plain LF files, like any typical commit made on Linux/macOS #####" > /dev/null
cd alice
git config core.autocrlf false
printf 'line one\nline two\n' > file1.txt
printf 'line one\nline two\n' > file2.txt
printf 'line one\nline two\n' > file3.txt
git add file1.txt file2.txt file3.txt
git commit -m "add files with LF endings"
git push
cd ..

echo "##### bob clones with autocrlf=true, the Windows Git installer default - checkout converts every file to CRLF #####" > /dev/null
git clone -c core.autocrlf=true origin bob
cd bob
git ls-files --eol
git status --short
echo "##### clean - autocrlf=true tells git to expect CRLF locally and convert back to LF when comparing #####" > /dev/null

echo "##### bob's autocrlf setting changes to false/input without a fresh checkout #####" > /dev/null
# e.g. following well-meaning "cross-platform" advice, or simply because a
# different tool touches this same clone (WSL terminal vs. native Windows
# Git, a different IDE, a global config change) with a different autocrlf
# value than the one this clone was originally checked out with
git config core.autocrlf false

echo "##### nobody touched a single file, but every file in the repo now shows as modified #####" > /dev/null
git status --short
git diff --stat
git diff -- file1.txt | cat -A

echo "##### the fix: a fresh checkout re-applies the CURRENT autocrlf setting to the whole working tree #####" > /dev/null
git checkout -- .
git status --short
git ls-files --eol
cd ..

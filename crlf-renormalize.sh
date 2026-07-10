#!/bin/bash

set -xeuo pipefail

rm -rf repos
mkdir repos
cd repos

git init --bare origin

git clone origin alice
git clone origin bob

# core.autocrlf is pinned explicitly per clone so this demo reproduces the same
# behavior no matter which OS or global git config actually runs it
cd alice
git config core.autocrlf false
cd ..

cd bob
git config core.autocrlf false
cd ..

echo "##### alice commits one LF file and one CRLF file - autocrlf=false means git leaves both untouched #####" > /dev/null
cd alice
printf 'line one\nline two\n' > unix.txt
printf 'line one\r\nline two\r\n' > windows.txt
git add unix.txt windows.txt
git commit -m "add files with different line endings"
git push

echo "##### the mix already exists in history - windows.txt is CRLF in the committed blob #####" > /dev/null
git ls-files --eol

echo "##### alice pins *.txt to LF, but adding .gitattributes alone doesn't touch already-committed files #####" > /dev/null
echo "*.txt text eol=lf" > .gitattributes
git add .gitattributes
git commit -m "pin text files to LF via .gitattributes"
git ls-files --eol

echo "##### --renormalize re-applies attributes to everything in the index, fixing the file that predates the rule #####" > /dev/null
git add --renormalize .
git status
git diff --cached --stat
git commit -m "renormalize line endings to LF"
git push

echo "##### the committed blob is now LF, and a fresh pull gives bob the fixed file #####" > /dev/null
git ls-files --eol
cd ..

cd bob
git pull
git ls-files --eol
cd ..

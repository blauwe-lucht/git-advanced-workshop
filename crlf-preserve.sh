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
git ls-files --eol
git push
cd ..

echo "##### bob's checkout of the same commit keeps both line endings exactly as committed #####" > /dev/null
cd bob
git pull
git ls-files --eol
cd ..

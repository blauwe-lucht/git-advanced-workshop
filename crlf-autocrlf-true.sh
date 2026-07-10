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
git config core.autocrlf true
cd ..

cd bob
git config core.autocrlf false
cd ..

echo "##### alice's editor writes CRLF locally, e.g. simulating a Windows text editor #####" > /dev/null
cd alice
printf 'line one\r\nline two\r\n' > windows.txt
file windows.txt

echo "##### autocrlf=true converts CRLF to LF on the way into the object database #####" > /dev/null
git add windows.txt
git commit -m "add windows.txt"
git ls-files --eol windows.txt
git push
cd ..

echo "##### bob's fresh clone has no autocrlf conversion, so index and working tree both show LF #####" > /dev/null
cd bob
git pull
git ls-files --eol windows.txt
cd ..

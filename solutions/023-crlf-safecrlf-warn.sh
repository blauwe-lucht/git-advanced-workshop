#!/bin/bash

set -xeuo pipefail

rm -rf repos
mkdir repos
cd repos

git init --bare origin
git clone origin alice
cd alice
git config core.autocrlf true
git config core.safecrlf warn

echo "##### alice's editor writes an ordinary LF file - nothing mixed, nothing exotic #####" > /dev/null
printf 'line one\nline two\n' > plain.txt
cat -A plain.txt

echo "##### autocrlf=true will rewrite this file to CRLF the next time it's touched - safecrlf=warn flags exactly that, but doesn't block it #####" > /dev/null
git add plain.txt

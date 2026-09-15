#!/bin/bash

set -xeuo pipefail

rm -rf repos
mkdir repos
cd repos

git init --bare origin
git clone origin alice
cd alice
git config core.autocrlf true
git config core.safecrlf true

echo "##### alice's editor writes an ordinary LF file - nothing mixed, nothing exotic #####" > /dev/null
printf 'line one\nline two\n' > plain.txt
cat -A plain.txt

echo "##### autocrlf=true would rewrite this file to CRLF on its next touch - safecrlf=true refuses to stage it at all #####" > /dev/null
git add plain.txt

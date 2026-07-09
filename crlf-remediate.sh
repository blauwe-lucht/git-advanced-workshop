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
git config core.autocrlf true
cd ..

echo "##### alice writes a shell script that runs fine on her own machine #####" > /dev/null
cd alice
printf '#!/bin/bash\necho "hello from greet.sh"\n' > greet.sh
chmod +x greet.sh
./greet.sh
git add greet.sh
git commit -m "add greet.sh"
git push
cd ..

echo "##### bob checks out the exact same commit and it breaks #####" > /dev/null
cd bob
git pull
./greet.sh || echo "##### bob notices the breakage - time to detect and fix it #####" > /dev/null
cd ..

echo "##### detect: file(1) and grep both confirm the CRLF that autocrlf=true added on checkout #####" > /dev/null
cd bob
file greet.sh
grep -c $'\r$' greet.sh
cd ..

echo "##### bob fixes it himself #####" > /dev/null
cd bob
echo "*.sh text eol=lf" > .gitattributes
git add .gitattributes
git commit -m "pin shell scripts to LF via .gitattributes"
git push
cd ..

echo "##### bob fixes local mess #####" > /dev/null
cd bob
# The rm --cached is needed to remove greet.sh with incorrect line endings from the local repo
git rm --cached greet.sh
git reset --hard
file greet.sh
./greet.sh

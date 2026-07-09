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

echo "##### fix: pin scripts to LF up front, before anyone commits a script #####" > /dev/null
cd alice
echo "*.sh text eol=lf" > .gitattributes
git add .gitattributes
git commit -m "pin shell scripts to LF via .gitattributes"
cd ..

echo "##### alice writes her shell script - it runs fine on her own machine #####" > /dev/null
cd alice
printf '#!/bin/bash\necho "hello from greet.sh"\n' > greet.sh
chmod +x greet.sh
./greet.sh
git add greet.sh
git commit -m "add greet.sh"
git push
cd ..

echo "##### bob checks out the same commit, shell script works #####" > /dev/null
cd bob
git pull
file greet.sh
./greet.sh
cd ..

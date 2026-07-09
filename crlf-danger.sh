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

echo "##### bob checks out the exact same commit #####" > /dev/null
# autocrlf=true (a common Windows Git Bash default) silently rewrites LF to CRLF on checkout, nobody edited the file"
cd bob
git pull
file greet.sh
./greet.sh
# broken by his own git config's automatic conversion, not by anything either of them did on purpose

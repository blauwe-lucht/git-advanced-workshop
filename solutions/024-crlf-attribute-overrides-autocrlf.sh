#!/bin/bash

set -xeuo pipefail

rm -rf repos
mkdir repos
cd repos

git init --bare origin

echo "##### alice writes the original files and pins *.sh to LF via .gitattributes; notes.txt is left unpinned #####" > /dev/null
git clone origin alice
cd alice
git config core.autocrlf false
printf '* text=auto\n*.sh text eol=lf\n' > .gitattributes
printf '#!/bin/bash\necho hi\n' > greet.sh
printf 'just a note\nsecond line\n' > notes.txt
git add .gitattributes greet.sh notes.txt
git commit -m "add greet.sh (pinned LF) and notes.txt (unpinned, text=auto)"
git ls-files --eol
git push
cd ..

echo "##### bob fakes cloning on Linux/macOS: autocrlf=false, eol=lf pinned explicitly to stand in for the native default #####" > /dev/null
git clone -c core.autocrlf=false -c core.eol=lf origin bob
cd bob
git ls-files --eol
cd ..

echo "##### charlie fakes cloning on Windows: autocrlf=false, eol=crlf pinned explicitly to stand in for the native default #####" > /dev/null
git clone -c core.autocrlf=false -c core.eol=crlf origin charlie
cd charlie
git ls-files --eol
echo "##### greet.sh is LF for charlie too - the eol=lf attribute overrides his core.eol=crlf #####" > /dev/null
echo "##### notes.txt has no such pin, so his core.eol=crlf still converts it to CRLF on checkout #####" > /dev/null
cd ..

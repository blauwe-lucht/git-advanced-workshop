#!/bin/bash

set -xeuo pipefail

# local file:// submodule URLs are blocked by default since Git 2.38 (CVE-2022-39253);
# allow them for this script only, without touching global git config
export GIT_ALLOW_PROTOCOL=file

rm -rf repos
mkdir repos && cd repos

git init --bare -b main origin-shared-lib
git init --bare -b main origin-app

# alice seeds the library with a first commit before she can add it as a
# submodule: an empty repo has no HEAD to check out, so "git submodule add"
# on origin-shared-lib as-is would fail with "You are on a branch yet to be
# born" - it needs at least one commit to point at first
echo "##### alice seeds the library with an initial commit #####" > /dev/null
git clone origin-shared-lib alice-shared-lib
cd alice-shared-lib
echo "function greet() { echo Hello; }" > greet.sh
git add greet.sh
git commit -m "add greet function"
git push
cd ..
rm -rf alice-shared-lib

git clone origin-app alice-app
cd alice-app

# add origin-shared-lib as a submodule yourself

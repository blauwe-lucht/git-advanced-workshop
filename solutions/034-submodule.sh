#!/bin/bash

set -xeuo pipefail

# local file:// submodule URLs are blocked by default since Git 2.38 (CVE-2022-39253);
# allow them for this script only, without touching global git config
export GIT_ALLOW_PROTOCOL=file

rm -rf repos
mkdir repos && cd repos

git init --bare origin-shared-lib
git init --bare origin-app

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

# alice creates the app and adds the library as a submodule, and writes a
# script that actually uses it
echo "##### alice creates the app #####" > /dev/null
git clone origin-app alice-app
cd alice-app
git submodule add ../origin-shared-lib libs/shared-lib
cat > app.sh <<'EOF'
#!/bin/bash
source libs/shared-lib/greet.sh
greet
EOF
git add app.sh
git commit -m "add app.sh that uses greet from shared-lib"
git push
bash app.sh
cd ..

# bob clones the app; without --recurse-submodules libs/shared-lib is an empty
# directory - the actual reference lives as a gitlink in the app's tree, not
# as a file inside the submodule path
echo "##### bob clones the app, doesn't update submodules yet #####" > /dev/null
git clone origin-app bob-app
cd bob-app
ls -al libs/shared-lib
git ls-tree HEAD libs/shared-lib
# the leading "-" on the commit hash is git's way of flagging that this
# submodule hasn't been initialized yet - the sign bob should actually look for
git submodule status
bash app.sh || echo "app.sh failed - the submodule is still empty"

# bob has to explicitly initialize and fetch the submodule content; afterwards
# the submodule path has its own .git file, pointing at the real git dir that
# was created under the superproject's .git/modules/
echo "##### bob initializes the submodule #####" > /dev/null
git submodule update --init
ls -al libs/shared-lib
cat libs/shared-lib/.git
bash app.sh
cd ..

# alice adds a new function to the library right where she uses it: inside her
# own app checkout. She edits and tests it there like any other dependency,
# then publishes the library change and the app change that relies on it.
echo "##### alice extends the library and tests it in app.sh #####" > /dev/null
cd alice-app/libs/shared-lib
echo "function farewell() { echo Bye; }" >> greet.sh
git commit -am "add farewell function"
git push
cd ../..
cat > app.sh <<'EOF'
#!/bin/bash
source libs/shared-lib/greet.sh
greet
farewell
EOF
bash app.sh
git status
git add libs/shared-lib app.sh
git commit -m "use the new farewell function"
git push
cd ..

# bob pulls the app; his HEAD now records alice's new pointer, but his
# submodule checkout is still on the old commit until he updates it
echo "##### bob picks up alice's change #####" > /dev/null
cd bob-app
git pull
git status
git diff --submodule
git submodule update
bash app.sh
cd ..

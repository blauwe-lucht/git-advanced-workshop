#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init

echo "##### main commit 1 - with a typo (ehco instead of echo) #####" > /dev/null
echo 'ehco "First commit"' > run.sh
git add run.sh
git commit -m "commit 1 - add run.sh"

echo "##### main commit 2 - unrelated line, the typo is still there #####" > /dev/null
echo 'echo "Second commit"' >> run.sh
git commit -am "commit 2 - update run.sh"

echo "##### the feature branch starts from commit 2 #####" > /dev/null
git switch -c feature

echo "##### main commit 3 - main moves on, the typo is still there #####" > /dev/null
git switch main
echo 'echo "Third commit"' >> run.sh
git commit -am "commit 3 - update run.sh"

echo "##### feature commit 1 #####" > /dev/null
git switch feature
echo 'echo "First commit from branch"' >> run.sh
git commit -am "feature commit 1 - add line"

echo "##### feature commit 2 - the typo is spotted and fixed along the way #####" > /dev/null
sed -i 's/ehco/echo/' run.sh
git commit -am "feature commit 2 - fix typo"

echo "##### feature commit 3 - more own work #####" > /dev/null
echo 'echo "Third commit from branch"' >> run.sh
git commit -am "feature commit 3 - add line"

git log --oneline --graph --all

echo "##### the fix needs to reach main, without the rest of the feature branch #####" > /dev/null
git switch main
git cherry-pick feature~1

bash run.sh
git log --oneline --graph --all

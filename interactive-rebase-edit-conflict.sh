#!/bin/bash

# Startpunt voor een nieuwe oefening. Kopieer dit bestand en bouw je scenario.
# Elke oefening staat op zichzelf en maakt een verse repos/ from scratch, net
# als de demo-scripts in de root. Heb je geen remote nodig? Laat de bare repo
# en de clones weg en gebruik gewoon `git init` in repos/.

set -xeuo pipefail

rm -rf repos
mkdir repos
cd repos

git init --bare origin

git clone origin alice
git clone origin bob
git clone origin charlie

cd alice
echo First commit > file.txt
git add .
git commit -m"Initial commit"

echo Second commit > file.txt
echo Creating and adding second file by accident > secret.txt
git add .
git commit -m"Second commit"

echo Third commit > file.txt
echo Changing second file > secret.txt
git commit -am"Third commit"

git rebase -i HEAD~2

git log --oneline --graph --all

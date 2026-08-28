#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init

echo "##### commit 1 - greet.sh works #####" > /dev/null
cat > greet.sh << 'EOF'
#!/bin/bash
echo "Hello, $1!"
EOF
git add greet.sh
git commit -m "v1"

echo "##### commit 2 - a subtle bug #####" > /dev/null
cat > greet.sh << 'EOF'
#!/bin/bash
ehco "Hello, $1!"
EOF
git add greet.sh
git commit -m "v2"

echo "##### commit 3 - bug fixed again #####" > /dev/null
cat > greet.sh << 'EOF'
#!/bin/bash
echo "Hello, $1!"
EOF
git add greet.sh
git commit -m "v3"

git log --oneline

echo "##### a client says the script v2 is not working - verify #####" > /dev/null

echo "##### check commit 2 #####" > /dev/null
git switch --detach HEAD~1
git status
git log --oneline
bash greet.sh Alice || true

echo "##### switch back - main has not moved at all #####" > /dev/null
git switch main

git log --oneline

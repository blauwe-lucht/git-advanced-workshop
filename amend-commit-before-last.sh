#!/bin/bash

set -xe

rm -rf repos

mkdir repos
cd repos

git init

echo "version 1" > file1.txt
git add file1.txt
git commit -m "add file1"

echo "version 1" > file2.txt
git add file2.txt
git commit -m "ad file2"

echo "version 1" > file3.txt
git add file3.txt
git commit -m "add file3"

git log --oneline

# "ad file2" has a typo, but it's not HEAD - it's the commit before the last
# commit ("add file3"). `git commit --amend` only ever touches HEAD, so it
# can't fix this one directly. Fix it like this:
#
# 1. git log --oneline
#    Confirm "ad file2" is HEAD~1 (second from the top).
#
# 2. git rebase -i HEAD~2
#    Opens an editor with a todo list:
#      pick <sha> ad file2
#      pick <sha> add file3
#
# 3. Change "pick" to "edit" (or "e") on the "ad file2" line, then save and
#    close the editor. Git replays up to that commit and stops, with it
#    checked out as HEAD.
#
# 4. git commit --amend -m "add file2"
#    Fix the message (edit files and `git add` them first instead, if
#    what needs fixing is the content).
#
# 5. git rebase --continue
#    Replays "add file3" on top of the corrected commit.
#
# 6. git log --oneline
#    The history now reads cleanly; "add file3" has a new SHA since its
#    parent changed underneath it.

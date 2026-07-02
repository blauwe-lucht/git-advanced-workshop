# Git Advanced Workshop

Each script is a self-contained demo that sets up a fresh `demo/` directory and
runs through a scenario with `set -x` so every command is visible as it executes.

## Basics

| Script | What it shows |
| --- | --- |
| `commit.sh` | Creating a simple commit |
| `amend.sh` | Amending a commit and viewing the reflog |

## Rebase

| Script | What it shows |
| --- | --- |
| `rebase.sh` | Graph before and after a rebase, plus the reflog to show the original commits were replaced |

## Merging

| Script | What it shows |
| --- | --- |
| `merge-fast-forward.sh` | Fast-forward merge — pointer moves forward, no merge commit |
| `merge-no-ff.sh` | Explicit merge commit even when fast-forward is possible |
| `merge-squash.sh` | Squash all feature commits into a single commit on main |
| `merge-rebase.sh` | Rebase feature onto main, then fast-forward — linear history, individual commits preserved |
| `merge-conflict.sh` | What a merge conflict looks like and the conflict markers Git leaves behind |

## Amend and force push

These scripts all share the same base scenario: Bob amends a commit that Alice already
has locally and force-pushes it. The difference is whether Alice has her own unpushed
commits, and how she handles the pull.

| Script | Alice has local commit? | Alice's pull strategy | Outcome |
| --- | --- | --- | --- |
| `amend-force-push-alice-no-new-commit-pull-rebase.sh` | No | `--rebase` | Clean, no issues |
| `amend-force-push-alice-new-commit-rebase.sh` | Yes | `--rebase` | Works cleanly |
| `amend-force-push-pull-conflict.sh` | Yes | `--no-rebase` | Conflict — the problem |
| `amend-force-push-fix.sh` | Yes | `--no-rebase` then fixed | Resolution using `rebase --onto` |

The last two are a pair: `pull-conflict` sets up the problem, `fix` shows how to
resolve it without losing Alice's work.

## Force push safety

| Script | What it shows |
| --- | --- |
| `force-with-lease.sh` | `--force-with-lease` succeeding when the remote hasn't changed, and being rejected when someone else has pushed in the meantime |

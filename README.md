# Git Advanced Workshop

Each script is a self-contained demo that sets up a fresh `demo/` directory and
runs through a scenario with `set -x` so every command is visible as it executes.

## Collaboration

| Script | What it shows |
| --- | --- |
| `collaborate.sh` | Alice and Bob working on feature branches and merging to main to emulate a PR/MR workflow |

## Basics

| Script | What it shows |
| --- | --- |
| `commit.sh` | Creating a simple commit |
| `reflog.sh` | Uses amend to show how the reflog retains the original commit |

## Amend

| Script | What it shows |
| --- | --- |
| `amend-message.sh` | Fix a typo in the commit message |
| `amend-forgotten-file.sh` | Add a file that was accidentally left out of the commit |
| `amend-accidentally-added-file.sh` | Remove a file that was accidentally included in the commit |

## Merging

| Script | What it shows |
| --- | --- |
| `merge-fast-forward.sh` | Fast-forward merge — pointer moves forward, no merge commit |
| `merge-no-ff.sh` | Explicit merge commit even when fast-forward is possible |
| `merge-squash.sh` | Squash all feature commits into a single commit on main |
| `merge-conflict.sh` | What a merge conflict looks like and the conflict markers Git leaves behind |

## Rebase

| Script | What it shows |
| --- | --- |
| `rebase.sh` | Graph before and after a rebase, plus the reflog to show the original commits were replaced |
| `merge-rebase.sh` | Rebase feature onto main, then fast-forward — linear history, individual commits preserved |
| `emulate-squash.sh` | Emulate a squash using `git reset --soft` — same result, different mechanism |
| `interactive-rebase.sh` | Sets up WIP commits then hands off to the student to squash them with `git rebase -i` |

## Reset

| Script | What it shows |
| --- | --- |
| `reset-soft.sh` | Moves the branch pointer back, changes remain staged |
| `reset-mixed.sh` | Moves the branch pointer back, changes dropped to working tree |
| `reset-hard.sh` | Moves the branch pointer back, changes are gone |

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

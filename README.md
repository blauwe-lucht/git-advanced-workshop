# Git Advanced Workshop

Each script is a self-contained demo that sets up a fresh `repos/` directory and
runs through a scenario with `set -x` so every command is visible as it executes.

## Basics

| Script | What it shows |
| --- | --- |
| `commit.sh` | Creating a simple commit |
| `collaborate.sh` | Alice and Bob working on feature branches and merging to main to emulate a PR/MR workflow |

## Amend

| Script | What it shows |
| --- | --- |
| `amend-message.sh` | Fix a typo in the commit message |
| `amend-forgotten-file.sh` | Add a file that was accidentally left out of the commit |
| `amend-accidentally-added-file.sh` | Remove a file that was accidentally included in the commit |

## Reflog

| Script | What it shows |
| --- | --- |
| `reflog.sh` | Uses amend to show how the reflog retains the original commit |

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
| `reset-undo-amend.sh` | Uses the reflog and `HEAD@{1}` to undo an amend |

## Force push safety

| Script | What it shows |
| --- | --- |
| `force-without-lease.sh` | Plain `--force` silently overwrites someone else's pushed commit instead of being rejected |
| `force-with-lease.sh` | `--force-with-lease` succeeding when the remote hasn't changed, and being rejected when someone else has pushed in the meantime |

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

## Line endings (CRLF/LF)

| Script | What it shows |
| --- | --- |
| `crlf-danger.sh` | Alice writes a clean LF shell script; Bob's `autocrlf=true` silently rewrites it to CRLF on checkout and his `./greet.sh` breaks with a "bad interpreter" error, even though nobody edited the file |
| `crlf-fix.sh` | Same setup, but `.gitattributes` pins `*.sh` to `eol=lf` before the script is ever committed, so Bob's checkout stays LF and `./greet.sh` just works |
| `crlf-remediate.sh` | Same breakage as `crlf-danger.sh`, but Bob detects it (`file`, `grep`) and fixes it himself: adds `.gitattributes`, finds that a plain `git checkout --` won't rewrite a file it thinks is already up to date, then uses `git rm --cached` + `git reset --hard` to force it |
| `crlf-preserve.sh` | With `autocrlf=false`, Git doesn't normalize anything: Alice commits one LF file and one CRLF file side by side, and both the committed blobs and Bob's checkout keep their original line endings byte-for-byte |
| `crlf-renormalize.sh` | Same mixed LF/CRLF history as `crlf-preserve.sh`, but Alice adds `.gitattributes` to pin `*.txt` to `eol=lf` after the fact - which alone changes nothing - then `git add --renormalize .` rewrites just the file that predates the rule so history and Bob's checkout end up with LF |
| `crlf-autocrlf-true.sh` | Alice's `autocrlf=true` converts her local CRLF file to LF on the way into the object database; Bob's fresh clone with no autocrlf conversion gets exactly what's stored - LF |

`core.autocrlf` is pinned explicitly per clone in these scripts (rather than left
to the machine's actual default) so they reproduce the exact same behavior
whether run on Linux, macOS, or Windows Git Bash.

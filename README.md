# Git Advanced Workshop

Each script is a self-contained demo that sets up a fresh `repos/` directory and
runs through a scenario with `set -x` so every command is visible as it executes.

## Basics

| Script | What it shows |
| --- | --- |
| `commit.sh` | Creating a simple commit |
| `collaborate.sh` | Alice and Bob working on feature branches and merging to main to emulate a PR/MR workflow |
| `time-travel.sh` | A client reports a version of your script is broken; `git switch --detach` to verify, then switch back to `main` |
| `time-travel-branch-from-older-commit.sh` | Starting a hotfix branch from an older commit instead of the tip of `main`, by detaching there first and turning it into a real branch with `git switch -c` |
| `time-travel-back-and-forth.sh` | Jumping between several old commits with `git switch --detach main~N` — each jump has to be relative to `main`, since `HEAD~N` breaks the moment you're already detached elsewhere |
| `time-travel-branch-from-branch-commit.sh` | Starting a second, independent hotfix branch from the middle of an existing `hotfix` branch (its second commit), leaving `hotfix`'s later commit out |

## Looking back

| Script | What it shows |
| --- | --- |
| `look-back.sh` | Use ~-notation to look at earlier commits and commits on other branches without needing to copy a commit hash or switch branches |
| `look-back-plus.sh` | `main` splits off early (1 commit of its own), then `feature-a` splits off further along a shared line (3 commits from its tip), then `feature-b` continues that same line further still (5 commits from its tip); the shared split point is reachable four different ways - `main~1`, `feature-a~3`, `feature-b~5`, and `main^` - all resolving to the exact same commit |

## Amend

| Script | What it shows |
| --- | --- |
| `amend-message.sh` | Fix a typo in the commit message |
| `amend-forgotten-file.sh` | Add a file that was accidentally left out of the commit |
| `amend-accidentally-added-file.sh` | Remove a file that was accidentally included in the commit |
| `amend-commit-before-last.sh` | Fix a typo in the commit before the last commit using `git rebase -i` - the exact steps are commented in the script |

## Revert

| Script | What it shows |
| --- | --- |
| `revert.sh` | A mistake lands in commit 2, but commit 3 already landed on top so `--amend` can't reach it anymore; `git revert` undoes just commit 2 with a new commit, leaving commit 3 untouched |
| `revert-the-revert.sh` | The reverted change turns out to be needed after all - reverting the revert commit itself brings it back; Git labels this one "Reapply" instead of "Revert" |

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
| `crlf-autocrlf-drift.sh` | The most common cause of "every file in the repo shows a diff": Bob's clone was checked out under `autocrlf=true` (CRLF in his working tree), then his `autocrlf` setting changes to `false` without a fresh checkout - now every file compares as modified even though nobody touched one, and `git checkout -- .` is the fix |
| `crlf-attribute-overrides-autocrlf.sh` | Alice pins `*.sh` to LF via `.gitattributes` but leaves `notes.txt` unpinned; with `autocrlf=false` for both, Bob fakes cloning on Linux (`core.eol=lf`) and Charlie fakes cloning on Windows (`core.eol=crlf`) - Charlie's `greet.sh` still comes out LF because the `eol=lf` attribute overrides his `core.eol=crlf`, while his unpinned `notes.txt` still gets converted to CRLF |
| `crlf-safecrlf-warn.sh` | Alice adds a perfectly ordinary LF file under `autocrlf=true` - `core.safecrlf=warn` prints "LF will be replaced by CRLF the next time Git touches it", naming the exact file, but lets the add/commit through anyway |
| `crlf-safecrlf-true.sh` | Same ordinary LF file and `autocrlf=true`, but `core.safecrlf=true` refuses the `git add` outright with a fatal error |

`core.autocrlf` is pinned explicitly per clone in these scripts (rather than left
to the machine's actual default) so they reproduce the exact same behavior
whether run on Linux, macOS, or Windows Git Bash.

## Submodules

| Script | What it shows |
| --- | --- |
| `submodule.sh` | Alice adds `shared-lib` as a submodule of `app` and writes `app.sh`, which sources `greet.sh` from it; Bob clones `app` and finds `libs/shared-lib` empty, so `app.sh` fails until `git submodule update --init`; alice pushes a new function to `shared-lib`, and Bob has to explicitly `git submodule update --remote`, start using it in `app.sh`, and commit the updated pointer before Alice sees it too |

## TODO

- restore
- cherrypick
- git hooks
- LFS
- make sure topics are introduced while solving practical problems

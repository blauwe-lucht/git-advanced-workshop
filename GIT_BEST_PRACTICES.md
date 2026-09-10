# Git Best Practices

## Commits

- Keep commits small and focused on one logical change — this is called an
  **atomic commit**. Don't mix an unrelated refactor, a formatting pass, and
  a bug fix into the same commit just because you touched the same files.
- Each commit should leave the repo in a working state (it builds, tests
  pass) on its own, not just the final commit in a series. This is what makes
  `git bisect`, `git revert`, and `git cherry-pick` reliable — reverting or
  picking one commit shouldn't require also reverting or picking three others
  to keep things working.
- Write commit messages that explain *why*, not just *what* — the diff already
  shows what changed.
- Don't commit half-finished or broken work to shared branches.

## Rewriting history

- Only amend or rebase commits that haven't been pushed, or that you're
  certain nobody else has based work on.
- If you must rewrite published history, use `git push --force-with-lease`
  instead of `--force` — it fails safely if someone else pushed in the
  meantime, instead of silently overwriting their work.
- Prefer `git reset --soft`/`--mixed` over `--hard` when you're unsure —
  `--hard` discards working directory changes with no easy way back.

## Merging vs. rebasing

- Fast-forward or `--no-ff` merges preserve the true history; rebasing
  rewrites it into a straight line. Pick one convention per team/repo and
  stay consistent.
- Never rebase a branch that others are already building on top of.

## Line endings

- Add a `.gitattributes` file to the repo rather than relying on every
  contributor to set `core.autocrlf` correctly themselves — the attribute
  travels with the repo, the config setting doesn't.
- A good baseline:

  ```gitignore
  * text=auto
  ```

  This lets Git auto-detect text vs. binary files and normalizes line
  endings to LF in the repository, regardless of what each contributor's
  local `core.autocrlf` is set to.
- Pin specific file types when they need a fixed ending regardless of
  platform, e.g. `*.sh text eol=lf` or `*.bat text eol=crlf`.
- Mark true binaries explicitly (`*.png binary`) so they're never touched.
- Adding `.gitattributes` to an existing repo doesn't retroactively fix
  already-committed files — follow up with `git add --renormalize .` to
  apply the new rules to everything already in the staging area.
- To check what's actually stored (independent of local checkout
  conversion), use `git ls-files --eol` rather than trusting
  `core.autocrlf=false` alone.

## Branching

- Keep `main`/`master` always deployable.
- Delete branches after merging to keep the branch list meaningful.

## Safety nets

- The reflog (`git reflog`) keeps a record of where branch tips have been,
  even after a reset or rebase — most "lost" commits are recoverable from it.

# Git Advanced Workshop - Oefeningen

Welkom! Hier vind je de hands-on oefeningen. Elke oefening bestaat uit een
**basisoefening** die één of meerdere concepten uitleg en één
of meerdere **Plus-oefeningen** die meer uitdaging en verdieping geven.

## Zo werk je

1. Kopieer [`template.sh`](template.sh) naar een eigen script met de bestandsnaam
   die in de oefening staat.
2. Lees de oefening en bouw het scenario stap voor stap op in je script. Je werkt
   altijd in de verse `repos/`-map die het script zelf aanmaakt.
3. Draai je script (`bash mijn-script.sh`) en controleer de "klaar wanneer"-check.
4. Wil je meer oefenen? Doe de Plus-oefening(en).

## Oefeningen

### Basis & samenwerken

- [001 - Committen en samenwerken via branches](001-committen-en-samenwerken.md)

### Terugkijken

- [002 - Terugkijken met de `~`-notatie](002-terugkijken-met-tilde-notatie.md)

### Amend

- [003 - Commits repareren met `--amend`](003-commits-repareren-met-amend.md)

### Revert

- [004 - Een eerdere commit terugdraaien met `git revert`](004-revert.md)

### Tijdreizen

- [005 - Tijdreizen met `git switch --detach`](005-tijdreizen-met-switch-detach.md)
- [006 - Branchen vanaf een oudere commit voor een hotfix](006-branchen-vanaf-oudere-commit.md)

### Reflog

- [007 - Redden met de reflog](007-redden-met-de-reflog.md)

### Mergen

- [008 - Mergen naar een branch met nieuwere commits](008-merge-diverged.md)
- [009 - Mergen naar een branch zonder nieuwere commits (fast-forward)](009-merge-fast-forward.md)
- [010 - Een merge-commit afdwingen met `--no-ff`](010-merge-no-ff.md)
- [011 - Opschonen met squash merge](011-merge-squash.md)
- [012 - Een merge afbreken met `git merge --abort`](012-merge-abort.md)
- [013 - Een merge met conflicten oplossen met `-X ours`/`-X theirs`](013-merge-ours-theirs.md)
- [014 - Twee losse histories samenvoegen](014-merge-unrelated-histories.md)

### Reset

- [015 - `reset --soft`, `--mixed` en `--hard`](015-reset-soft-mixed-hard.md)

### Cherry-pick

- [016 - Een losse commit overzetten met `git cherry-pick`](016-cherrypick.md)

### Rebase

- [017 - Rebase: een branch bijwerken op `main`](017-rebase-branch-bijwerken.md)
- [018 - Commits verplaatsen met `git rebase --onto`](018-rebase-onto.md)

### Force push veilig

- [019 - Veilig force-pushen met `--force-with-lease`](019-veilig-force-pushen.md)

### Amend & force push

- [020 - Amend + force push in een team](020-amend-en-force-push-in-een-team.md)

### Regeleindes (CRLF/LF)

- [021 - Regeleindes en `.gitattributes`](021-regeleindes-en-gitattributes.md)

### Interactive rebase

- [022 - Een typefout in een oudere commit repareren](022-interactive-rebase-typefout-repareren.md)
- [023 - WIP-commits opschonen met interactive rebase](023-interactive-rebase-wip-opschonen.md)
- [024 - Een per ongeluk toegevoegd bestand uit een oudere commit halen](024-interactive-rebase-edit-bestand-verwijderen.md)
- [025 - Een commit echt weggooien met `drop`](025-interactive-rebase-drop.md)
- [026 - Een vergeten wijziging in de juiste commit krijgen](026-interactive-rebase-vergeten-wijziging.md)
- [027 - Eén commit opsplitsen in twee](027-interactive-rebase-splitsen.md)
- [028 - Een vergeten bestand alsnog in de juiste commit krijgen](028-interactive-rebase-vergeten-bestand.md)

### Stash

- [029 - Werk opzijzetten met `git stash`](029-stash.md)

### Worktree

- [030 - Werk onderbreken met `git worktree`](030-worktree.md)

### Submodules

- [031 - Een link naar een andere repo opnemen met `git submodule`](031-submodule.md)

### Atomic commits

TODO

### Bonus: Jujutsu (jj)

Je hebt nu gezien hoe lastig Git's interface kan zijn, terwijl het onderliggende
model (commits, branches, merges) prima in elkaar zit. [Jujutsu](https://github.com/jj-vcs/jj)
(`jj`) is een nieuwere VCS die met Git kan werken: Je repo blijft
gewoon een `.git`-map, compatibel met Git, maar met een eenvoudigere
en veiligere interface: geen staging area, elke actie is ongedaan te maken met
`jj undo`, en conflicten blokkeren je werk niet meer maar worden gewoon
meegenomen totdat je ze oplost. Deze bonusoefeningen volgen later.

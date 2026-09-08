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

- [008 - Merge-strategieën & conflicten](008-merge-strategieen-en-conflicten.md)

### Reset

- [009 - `reset --soft`, `--mixed` en `--hard`](009-reset-soft-mixed-hard.md)

### Cherry-pick

- [010 - Een losse commit overzetten met `git cherry-pick`](010-cherrypick.md)

### Rebase

- [011 - Rebase: een branch bijwerken op `main`](011-rebase-branch-bijwerken.md)
- [012 - Commits verplaatsen met `git rebase --onto`](012-rebase-onto.md)

### Force push veilig

- [013 - Veilig force-pushen met `--force-with-lease`](013-veilig-force-pushen.md)

### Amend & force push

- [014 - Amend + force push in een team](014-amend-en-force-push-in-een-team.md)

### Regeleindes (CRLF/LF)

- [015 - Regeleindes en `.gitattributes`](015-regeleindes-en-gitattributes.md)

### Interactive rebase

- [016 - Een typefout in een oudere commit repareren](016-interactive-rebase-typefout-repareren.md)
- [017 - WIP-commits opschonen met interactive rebase](017-interactive-rebase-wip-opschonen.md)
- [018 - Een per ongeluk toegevoegd bestand uit een oudere commit halen](018-interactive-rebase-edit-bestand-verwijderen.md)
- [019 - Een commit echt weggooien met `drop`](019-interactive-rebase-drop.md)
- [020 - Een vergeten wijziging in de juiste commit krijgen](020-interactive-rebase-vergeten-wijziging.md)
- [021 - Eén commit opsplitsen in twee](021-interactive-rebase-splitsen.md)
- [022 - Een vergeten bestand alsnog in de juiste commit krijgen](022-interactive-rebase-vergeten-bestand.md)

### Stash

- [023 - Werk opzijzetten met `git stash`](023-stash.md)

### Worktree

- [024 - Werk onderbreken met `git worktree`](024-worktree.md)

### Submodules

- [025 - Een link naar een andere repo opnemen met `git submodule`](025-submodule.md)

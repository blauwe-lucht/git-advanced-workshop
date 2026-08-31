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

### Rebase

- [010 - Rebase: een branch bijwerken op `main`](010-rebase-branch-bijwerken.md)
- [011 - Commits verplaatsen met `git rebase --onto`](011-rebase-onto.md)

### Force push veilig

- [012 - Veilig force-pushen met `--force-with-lease`](012-veilig-force-pushen.md)

### Amend & force push

- [013 - Amend + force push in een team](013-amend-en-force-push-in-een-team.md)

### Regeleindes (CRLF/LF)

- [014 - Regeleindes en `.gitattributes`](014-regeleindes-en-gitattributes.md)

### Interactive rebase

- [015 - Een typefout in een oudere commit repareren](015-interactive-rebase-typefout-repareren.md)
- [016 - WIP-commits opschonen met interactive rebase](016-interactive-rebase-wip-opschonen.md)
- [017 - Een per ongeluk toegevoegd bestand uit een oudere commit halen](017-interactive-rebase-edit-bestand-verwijderen.md)
- [018 - Een commit echt weggooien met `drop`](018-interactive-rebase-drop.md)
- [019 - Een vergeten wijziging in de juiste commit krijgen](019-interactive-rebase-vergeten-wijziging.md)
- [020 - Eén commit opsplitsen in twee](020-interactive-rebase-splitsen.md)
- [021 - Een vergeten bestand alsnog in de juiste commit krijgen](021-interactive-rebase-vergeten-bestand.md)

### Stash

- [022 - Werk opzijzetten met `git stash`](022-stash.md)

### Worktree

- [023 - Werk onderbreken met `git worktree`](023-worktree.md)

### Submodules

- [024 - Een link naar een andere repo opnemen met `git submodule`](024-submodule.md)

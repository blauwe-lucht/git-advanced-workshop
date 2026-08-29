# Git Advanced Workshop - Oefeningen

Welkom! Hier vind je de hands-on oefeningen. Elke oefening bestaat uit een
**basisoefening** die iedereen binnen de tijd afkrijgt, en een **Plus-oefening**
voor als je snel klaar bent en je tanden ergens op wilt stukbijten. De Plus is
opgedeeld in delen, dus ook een half afgemaakte Plus levert al een succesje op.

## Zo werk je

1. Kopieer [`template.sh`](template.sh) naar een eigen script met de bestandsnaam
   die in de oefening staat.
2. Lees de oefening en bouw het scenario stap voor stap op in je script. Je werkt
   altijd in de verse `repos/`-map die het script zelf aanmaakt.
3. Draai je script (`bash mijn-script.sh`) en controleer de "klaar wanneer"-check.
4. Tijd over? Doe de Plus-oefening: Deel A → B → C.

## Oefeningen

### Basis & samenwerken

- [001 - Committen en samenwerken via branches](001-committen-en-samenwerken.md)

### Amend

- [002 - Commits repareren met `--amend`](002-commits-repareren-met-amend.md)

### Revert

- [003 - Een eerder commit terugdraaien met `git revert`](003-revert.md)

### Tijdreizen

- [004 - Tijdreizen met `git switch --detach`](004-tijdreizen-met-switch-detach.md)
- [005 - Branchen vanaf een oudere commit voor een hotfix](005-branchen-vanaf-oudere-commit.md)

### Reflog

- [006 - Redden met de reflog](006-redden-met-de-reflog.md)

### Mergen

- [007 - Merge-strategieën & conflicten](007-merge-strategieen-en-conflicten.md)

### Rebase

- [008 - Rebase: een branch bijwerken op `main`](008-rebase-branch-bijwerken.md)
- [009 - Commits verplaatsen met `git rebase --onto`](009-rebase-onto.md)

### Reset

- [010 - `reset --soft`, `--mixed` en `--hard`](010-reset-soft-mixed-hard.md)

### Force push veilig

- [011 - Veilig force-pushen met `--force-with-lease`](011-veilig-force-pushen.md)

### Amend & force push

- [012 - Amend + force push in een team](012-amend-en-force-push-in-een-team.md)

### Regeleindes (CRLF/LF)

- [013 - Regeleindes en `.gitattributes`](013-regeleindes-en-gitattributes.md)

### Interactive rebase

- [014 - Een typefout in een oudere commit repareren](014-interactive-rebase-typefout-repareren.md)
- [015 - WIP-commits opschonen met interactive rebase](015-interactive-rebase-wip-opschonen.md)
- [016 - Een per ongeluk toegevoegd bestand uit een oudere commit halen](016-interactive-rebase-edit-bestand-verwijderen.md)
- [017 - Een commit echt weggooien met `drop`](017-interactive-rebase-drop.md)
- [018 - Een vergeten wijziging in de juiste commit krijgen](018-interactive-rebase-vergeten-wijziging.md)
- [019 - Eén commit opsplitsen in twee](019-interactive-rebase-splitsen.md)
- [020 - Een vergeten bestand alsnog in de juiste commit krijgen](020-interactive-rebase-vergeten-bestand.md)

### Stash

- [021 - Werk opzijzetten met `git stash`](021-stash.md)

### Worktree

- [022 - Werk onderbreken met `git worktree`](022-worktree.md)

### Submodules

- [023 - Een link naar een andere repo opnemen met `git submodule`](023-submodule.md)

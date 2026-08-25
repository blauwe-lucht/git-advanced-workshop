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

> **Tip:** vastgelopen? De reflog (`git reflog`) is je vangnet - bijna alles is
> terug te halen. Bekijk ook [`../GIT_BEST_PRACTICES.md`](../GIT_BEST_PRACTICES.md).

## Oefeningen

### Basis & samenwerken

- [001 - Committen en samenwerken via branches](001-committen-en-samenwerken.md)

### Amend

- [002 - Commits repareren met `--amend`](002-commits-repareren-met-amend.md)

### Reflog

- [003 - Redden met de reflog](003-redden-met-de-reflog.md)

### Mergen

- [004 - Merge-strategieën & conflicten](004-merge-strategieen-en-conflicten.md)

### Rebase

- [005 - Rebase: een branch bijwerken op `main`](005-rebase-branch-bijwerken.md)
- [006 - Commits verplaatsen met `git rebase --onto`](006-rebase-onto.md)

### Reset

- [007 - `reset --soft`, `--mixed` en `--hard`](007-reset-soft-mixed-hard.md)

### Force push veilig

- [008 - Veilig force-pushen met `--force-with-lease`](008-veilig-force-pushen.md)

### Amend & force push

- [009 - Amend + force push in een team](009-amend-en-force-push-in-een-team.md)

### Regeleindes (CRLF/LF)

- [010 - Regeleindes en `.gitattributes`](010-regeleindes-en-gitattributes.md)

### Interactive rebase

- [011 - Een typefout in een oudere commit repareren](011-interactive-rebase-typefout-repareren.md)
- [012 - WIP-commits opschonen met interactive rebase](012-interactive-rebase-wip-opschonen.md)
- [013 - Een per ongeluk toegevoegd bestand uit een oudere commit halen](013-interactive-rebase-edit-bestand-verwijderen.md)
- [014 - Een commit echt weggooien met `drop`](014-interactive-rebase-drop.md)
- [015 - Een vergeten wijziging in de juiste commit krijgen](015-interactive-rebase-vergeten-wijziging.md)
- [016 - Eén commit opsplitsen in twee](016-interactive-rebase-splitsen.md)
- [017 - Een vergeten bestand alsnog in de juiste commit krijgen](017-interactive-rebase-vergeten-bestand.md)

### Stash

- [018 - Werk opzijzetten met `git stash`](018-stash.md)

### Worktree

- [019 - Werk onderbreken met `git worktree`](019-worktree.md)

### Submodules

- [020 - Een link naar een andere repo opnemen met `git submodule`](020-submodule.md)

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

### Tijdreizen

- [003 - Tijdreizen met `git switch --detach`](003-tijdreizen-met-switch-detach.md)

### Reflog

- [004 - Redden met de reflog](004-redden-met-de-reflog.md)

### Mergen

- [005 - Merge-strategieën & conflicten](005-merge-strategieen-en-conflicten.md)

### Rebase

- [006 - Rebase: een branch bijwerken op `main`](006-rebase-branch-bijwerken.md)
- [007 - Commits verplaatsen met `git rebase --onto`](007-rebase-onto.md)

### Reset

- [008 - `reset --soft`, `--mixed` en `--hard`](008-reset-soft-mixed-hard.md)

### Force push veilig

- [009 - Veilig force-pushen met `--force-with-lease`](009-veilig-force-pushen.md)

### Amend & force push

- [010 - Amend + force push in een team](010-amend-en-force-push-in-een-team.md)

### Regeleindes (CRLF/LF)

- [011 - Regeleindes en `.gitattributes`](011-regeleindes-en-gitattributes.md)

### Interactive rebase

- [012 - Een typefout in een oudere commit repareren](012-interactive-rebase-typefout-repareren.md)
- [013 - WIP-commits opschonen met interactive rebase](013-interactive-rebase-wip-opschonen.md)
- [014 - Een per ongeluk toegevoegd bestand uit een oudere commit halen](014-interactive-rebase-edit-bestand-verwijderen.md)
- [015 - Een commit echt weggooien met `drop`](015-interactive-rebase-drop.md)
- [016 - Een vergeten wijziging in de juiste commit krijgen](016-interactive-rebase-vergeten-wijziging.md)
- [017 - Eén commit opsplitsen in twee](017-interactive-rebase-splitsen.md)
- [018 - Een vergeten bestand alsnog in de juiste commit krijgen](018-interactive-rebase-vergeten-bestand.md)

### Stash

- [019 - Werk opzijzetten met `git stash`](019-stash.md)

### Worktree

- [020 - Werk onderbreken met `git worktree`](020-worktree.md)

### Submodules

- [021 - Een link naar een andere repo opnemen met `git submodule`](021-submodule.md)

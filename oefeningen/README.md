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
- [004 - Branchen vanaf een oudere commit voor een hotfix](004-branchen-vanaf-oudere-commit.md)

### Reflog

- [005 - Redden met de reflog](005-redden-met-de-reflog.md)

### Mergen

- [006 - Merge-strategieën & conflicten](006-merge-strategieen-en-conflicten.md)

### Rebase

- [007 - Rebase: een branch bijwerken op `main`](007-rebase-branch-bijwerken.md)
- [008 - Commits verplaatsen met `git rebase --onto`](008-rebase-onto.md)

### Reset

- [009 - `reset --soft`, `--mixed` en `--hard`](009-reset-soft-mixed-hard.md)

### Force push veilig

- [010 - Veilig force-pushen met `--force-with-lease`](010-veilig-force-pushen.md)

### Amend & force push

- [011 - Amend + force push in een team](011-amend-en-force-push-in-een-team.md)

### Regeleindes (CRLF/LF)

- [012 - Regeleindes en `.gitattributes`](012-regeleindes-en-gitattributes.md)

### Interactive rebase

- [013 - Een typefout in een oudere commit repareren](013-interactive-rebase-typefout-repareren.md)
- [014 - WIP-commits opschonen met interactive rebase](014-interactive-rebase-wip-opschonen.md)
- [015 - Een per ongeluk toegevoegd bestand uit een oudere commit halen](015-interactive-rebase-edit-bestand-verwijderen.md)
- [016 - Een commit echt weggooien met `drop`](016-interactive-rebase-drop.md)
- [017 - Een vergeten wijziging in de juiste commit krijgen](017-interactive-rebase-vergeten-wijziging.md)
- [018 - Eén commit opsplitsen in twee](018-interactive-rebase-splitsen.md)
- [019 - Een vergeten bestand alsnog in de juiste commit krijgen](019-interactive-rebase-vergeten-bestand.md)

### Stash

- [020 - Werk opzijzetten met `git stash`](020-stash.md)

### Worktree

- [021 - Werk onderbreken met `git worktree`](021-worktree.md)

### Submodules

- [022 - Een link naar een andere repo opnemen met `git submodule`](022-submodule.md)

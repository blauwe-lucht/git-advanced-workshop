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

- [015 - Twee slordige commits samenvoegen met `git reset --soft`](015-reset-soft.md)
- [016 - Een te vroege commit terugdraaien met `git reset --mixed`](016-reset-mixed.md)
- [017 - Een mislukt experiment weggooien met `git reset --hard`](017-reset-hard.md)

### Cherry-pick

- [018 - Een losse commit overzetten met `git cherry-pick`](018-cherrypick.md)

### Rebase

- [019 - Rebase: een branch bijwerken op `main`](019-rebase-branch-bijwerken.md)
- [020 - Commits verplaatsen met `git rebase --onto`](020-rebase-onto.md)

### Force push veilig

- [021 - Force-pushen zonder bescherming: een collega's commit verdwijnt](021-force-push-unsafe.md)
- [022 - Veilig force-pushen met `--force-with-lease`](022-force-push-safe.md)

### Amend & force push

- [023 - Amend + force push in een team](023-amend-en-force-push-in-een-team.md)

### Regeleindes (CRLF/LF)

- [024 - Regeleindes en `.gitattributes`](024-regeleindes-en-gitattributes.md)

### Interactive rebase

- [025 - Een typefout in een oudere commit repareren](025-interactive-rebase-typefout-repareren.md)
- [026 - WIP-commits opschonen met interactive rebase](026-interactive-rebase-wip-opschonen.md)
- [027 - Een per ongeluk toegevoegd bestand uit een oudere commit halen](027-interactive-rebase-edit-bestand-verwijderen.md)
- [028 - Een commit echt weggooien met `drop`](028-interactive-rebase-drop.md)
- [029 - Een vergeten wijziging in de juiste commit krijgen](029-interactive-rebase-vergeten-wijziging.md)
- [030 - Eén commit opsplitsen in twee](030-interactive-rebase-splitsen.md)
- [031 - Een vergeten bestand alsnog in de juiste commit krijgen](031-interactive-rebase-vergeten-bestand.md)

### Stash

- [032 - Werk opzijzetten met `git stash`](032-stash.md)

### Worktree

- [033 - Werk onderbreken met `git worktree`](033-worktree.md)

### Submodules

- [034 - Een link naar een andere repo opnemen met `git submodule`](034-submodule.md)

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

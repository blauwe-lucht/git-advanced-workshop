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

### Tags

- [007 - Een release markeren met `git tag`](007-tags.md)

### Reflog

- [008 - Redden met de reflog](008-redden-met-de-reflog.md)

### Mergen

- [009 - Mergen naar een branch met nieuwere commits](009-merge-diverged.md)
- [010 - Mergen naar een branch zonder nieuwere commits (fast-forward)](010-merge-fast-forward.md)
- [011 - Een merge-commit afdwingen met `--no-ff`](011-merge-no-ff.md)
- [012 - Opschonen met squash merge](012-merge-squash.md)
- [013 - Een merge afbreken met `git merge --abort`](013-merge-abort.md)
- [014 - Een merge met conflicten oplossen met `-X ours`/`-X theirs`](014-merge-ours-theirs.md)
- [015 - Twee losse histories samenvoegen](015-merge-unrelated-histories.md)

### Reset

- [016 - Twee slordige commits samenvoegen met `git reset --soft`](016-reset-soft.md)
- [017 - Een te vroege commit terugdraaien met `git reset --mixed`](017-reset-mixed.md)
- [018 - Een mislukt experiment weggooien met `git reset --hard`](018-reset-hard.md)

### Cherry-pick

- [019 - Een losse commit overzetten met `git cherry-pick`](019-cherrypick.md)

### Rebase

- [020 - Rebase: een branch bijwerken op `main`](020-rebase-branch-bijwerken.md)
- [021 - Commits verplaatsen met `git rebase --onto`](021-rebase-onto.md)

### Force push veilig

- [022 - Force-pushen zonder bescherming: een collega's commit verdwijnt](022-force-push-unsafe.md)
- [023 - Veilig force-pushen met `--force-with-lease`](023-force-push-safe.md)

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

### Geheim uit de geschiedenis in een team

- [032 - Een geheim uit de geschiedenis halen en veilig force-pushen in een team](032-geheim-uit-geschiedenis-team.md)

### Stash

- [033 - Werk opzijzetten met `git stash`](033-stash.md)

### Worktree

- [034 - Werk onderbreken met `git worktree`](034-worktree.md)

### Submodules

- [035 - Een link naar een andere repo opnemen met `git submodule`](035-submodule.md)

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

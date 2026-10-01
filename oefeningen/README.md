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

### De staging area

- [002 - De staging area: drie versies van een bestand](002-staging-area.md)

### Terugkijken

- [003 - Terugkijken met de `~`-notatie](003-terugkijken-met-tilde-notatie.md)

### Amend

- [004 - Commits repareren met `--amend`](004-commits-repareren-met-amend.md)

### Revert

- [005 - Een eerdere commit terugdraaien met `git revert`](005-revert.md)

### Tijdreizen

- [006 - Tijdreizen met `git switch --detach`](006-tijdreizen-met-switch-detach.md)
- [007 - Branchen vanaf een oudere commit voor een hotfix](007-branchen-vanaf-oudere-commit.md)

### Tags

- [008 - Een release markeren met `git tag`](008-tags.md)

### Reflog

- [009 - Redden met de reflog](009-redden-met-de-reflog.md)

### Mergen

- [010 - Mergen naar een branch met nieuwere commits](010-merge-diverged.md)
- [011 - Mergen naar een branch zonder nieuwere commits (fast-forward)](011-merge-fast-forward.md)
- [012 - Een merge-commit afdwingen met `--no-ff`](012-merge-no-ff.md)
- [013 - Opschonen met squash merge](013-merge-squash.md)
- [014 - Een merge afbreken met `git merge --abort`](014-merge-abort.md)
- [015 - Een merge met conflicten oplossen met `-X ours`/`-X theirs`](015-merge-ours-theirs.md)
- [016 - Twee losse histories samenvoegen](016-merge-unrelated-histories.md)

### Reset

- [017 - Twee slordige commits samenvoegen met `git reset --soft`](017-reset-soft.md)
- [018 - Een te vroege commit terugdraaien met `git reset --mixed`](018-reset-mixed.md)
- [019 - Een mislukt experiment weggooien met `git reset --hard`](019-reset-hard.md)

### Restore

- [020 - Wijzigingen in working tree en staging area ongedaan maken met `git restore`](020-restore-working-tree.md)
- [021 - Een bestand uit een andere branch of commit halen met `git restore --source`](021-restore-source.md)
- [022 - Een merge conflict per bestand oplossen met `git restore`](022-restore-merge-conflict.md)

### Cherry-pick

- [023 - Een losse commit overzetten met `git cherry-pick`](023-cherrypick.md)

### Rebase

- [024 - Rebase: een branch bijwerken op `main`](024-rebase-branch-bijwerken.md)
- [025 - Commits verplaatsen met `git rebase --onto`](025-rebase-onto.md)

### Force push veilig

- [026 - Force-pushen zonder bescherming: een collega's commit verdwijnt](026-force-push-unsafe.md)
- [027 - Veilig force-pushen met `--force-with-lease`](027-force-push-safe.md)

### Regeleindes (CRLF/LF)

- [028 - Regeleindes en `.gitattributes`](028-regeleindes-en-gitattributes.md)

### Interactive rebase

- [029 - Een typefout in een oudere commit repareren](029-interactive-rebase-typefout-repareren.md)
- [030 - WIP-commits opschonen met interactive rebase](030-interactive-rebase-wip-opschonen.md)
- [031 - Een per ongeluk toegevoegd bestand uit een oudere commit halen](031-interactive-rebase-edit-bestand-verwijderen.md)
- [032 - Een commit echt weggooien met `drop`](032-interactive-rebase-drop.md)
- [033 - Een vergeten wijziging in de juiste commit krijgen](033-interactive-rebase-vergeten-wijziging.md)
- [034 - Eén commit opsplitsen in twee](034-interactive-rebase-splitsen.md)
- [035 - Een vergeten bestand alsnog in de juiste commit krijgen](035-interactive-rebase-vergeten-bestand.md)

### Geheim uit de geschiedenis in een team

- [036 - Een geheim uit de geschiedenis halen en veilig force-pushen in een team](036-geheim-uit-geschiedenis-team.md)

### Stash

- [037 - Werk opzijzetten met `git stash`](037-stash.md)

### Worktree

- [038 - Werk onderbreken met `git worktree`](038-worktree.md)

### Submodules

- [039 - Een link naar een andere repo opnemen met `git submodule`](039-submodule.md)

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

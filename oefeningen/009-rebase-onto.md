# Oefening 009 — Commits verplaatsen met `git rebase --onto`

## Doel

Je leert een reeks commits van de ene plek naar de andere verplaatsen zonder
ongewenste commits mee te slepen — bijvoorbeeld wanneer een feature-branch
per ongeluk vanaf een andere feature-branch is gestart in plaats van vanaf
`main`.

## Basisoefening

Schrijf vanaf `template.sh` een script `rebase-onto.sh` (een gewone repo in
`repos/` volstaat) dat het volgende doet:

1. Maak `main` met een eerste commit.
2. Maak `feature-a` vanaf `main` met een of twee eigen commits.
3. Maak, per ongeluk, `feature-b` vanaf `feature-a` (in plaats van vanaf
   `main`) met een of twee eigen commits.
4. Bekijk met `git log --oneline --graph --all` dat de commits van
   `feature-b` bovenop die van `feature-a` staan.
5. Gebruik `git rebase --onto main feature-a feature-b` om alleen de
   commits van `feature-b` te verplaatsen naar bovenop `main`.
6. Bekijk de historie opnieuw.

**Klaar wanneer:** `feature-b` bevat alleen zijn eigen commits, direct
bovenop `main`, niet meer bovenop die van `feature-a`, en `feature-a` is
ongewijzigd.

## Plus-oefening — lastigere verplaatsingen

Elk deel is een **eigen script** dat je vanaf `template.sh` schrijft. Zodra
een deel interactie vereist, staat die aan het **eind** van het script,
hooguit gevolgd door een statuscommando (`git status`, `git log`).

### Deel A — een stukje uit het midden

Schrijf een apart script `rebase-onto-uit-midden.sh`.

- **Doel:** een lange reeks commits bevat ergens in het midden een paar
  commits die eigenlijk op een heel andere branch thuishoren. Haal precies
  dát stukje eruit en zet het op een nieuwe branch, zonder de commits
  ervóór of erna.
- **Klaar wanneer:** de gekozen commits staan nu los op de nieuwe branch, en
  de oorspronkelijke branch is exact hetzelfde gebleven als vóór de
  operatie.

### Deel B — met een conflict

Schrijf een apart script `rebase-onto-conflict.sh`.

- **Doel:** doe iets vergelijkbaars als de basisoefening, maar de nieuwe
  bestemming heeft intussen ook een wijziging die conflicteert met een van
  de verplaatste commits. Los dat conflict op.
- **Klaar wanneer:** het conflict is opgelost, alle verplaatste commits
  staan correct op de nieuwe plek, en er is geen lopende rebase meer.

### Deel C — opruimen na afloop

Schrijf een apart script `rebase-onto-opruimen.sh`.

- **Doel:** nadat commits succesvol verplaatst zijn, blijft de branch waar ze
  oorspronkelijk op stonden overbodig achter. Ruim die op zonder de
  verplaatste commits te raken.
- **Klaar wanneer:** de overbodige branch bestaat niet meer, en de verplaatste
  commits zijn nog gewoon aanwezig en bereikbaar.

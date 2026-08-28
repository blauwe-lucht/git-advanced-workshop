# Oefening 021 - Werk onderbreken met `git worktree`

## Doel

Je leert een tweede werkmap toevoegen aan dezelfde repo met `git worktree`,
zodat je aan een andere branch kunt werken zonder je onafgemaakte,
niet-gecommitte werk in de huidige map aan te raken - een beter alternatief voor
stashen.

## Basisoefening

Schrijf vanaf `template.sh` een script `worktree.sh` (een gewone repo in
`repos/` volstaat) dat het volgende doet:

1. Maak op `main` een eerste commit.
2. Maak een feature-branch vanaf `main` met een eigen commit.
3. Wijzig op de feature-branch een bestand, maar commit die wijziging niet.
4. Stel je voor: er moet nu snel een hotfix, maar je wilt de onafgemaakte
   wijziging op de feature-branch niet aanraken. Ook een hotfix committeer je
   nooit rechtstreeks op `main`, maar altijd via een eigen branch. Voeg met
   `git worktree add -b` een tweede werkmap toe met een nieuwe hotfix-branch
   vanaf `main`.
5. Maak in die tweede werkmap de hotfix: wijzig een bestand, commit op de
   hotfix-branch.
6. Ga terug naar de oorspronkelijke werkmap en bekijk met `git status` dat de
   onafgemaakte wijziging op de feature-branch nog precies zo staat.
7. Merge de hotfix-branch vanuit de oorspronkelijke werkmap in `main`.
8. Ruim de tweede werkmap en de hotfix-branch op.

**Klaar wanneer:** de hotfix nooit rechtstreeks op `main` is gecommit maar via
een eigen branch daarin gemerged is, de onafgemaakte wijziging op de
feature-branch nooit weg is geweest, en `git worktree list` en `git branch`
tonen geen resten meer van de hotfix-branch of de tweede werkmap.

## Plus-oefening - meer met worktrees

Elk deel is een **eigen script** dat je vanaf `template.sh` schrijft.

### Deel A - meerdere worktrees tegelijk

Schrijf een apart script `worktree-meerdere.sh`.

- **Doel:** werk tegelijk in drie werkmappen aan drie verschillende branches,
  elk met hun eigen onafgemaakte wijziging, zonder dat die elkaar in de weg
  zitten.
- **Klaar wanneer:** alle drie de werkmappen bestaan naast elkaar, elk met
  zijn eigen branch en onafgemaakte wijziging, en `git worktree list` toont
  ze alle drie.

### Deel B - dezelfde branch, twee keer

Schrijf een apart script `worktree-dubbel.sh`.

- **Doel:** probeer een tweede worktree toe te voegen voor een branch die al
  in een andere worktree is uitgecheckt, en ontdek waarom dat niet zomaar
  kan. Zorg dat je alsnog op twee plekken tegelijk met die code kunt werken.
- **Klaar wanneer:** je hebt twee werkmappen die allebei bruikbaar zijn voor
  dezelfde broncode, zonder dat Git een fout geeft over een branch die al
  ergens anders is uitgecheckt.

### Deel C - samenvoegen met een addertje

Schrijf een apart script `worktree-opruimen.sh`.

- **Doel:** terwijl je in een extra worktree op een eigen branch werkt,
  verandert er op `main` (vanuit de oorspronkelijke werkmap) iets dat
  conflicteert met jouw wijziging. Merge je branch alsnog netjes in `main`,
  en ruim daarna de extra worktree en de branch op.
- **Klaar wanneer:** het conflict is opgelost, de wijzigingen staan in
  `main`, de extra werkmap bestaat niet meer, en `git worktree list` en
  `git branch` bevatten geen resten meer van de opgeruimde branch of
  worktree.

# Oefening 011 — Een typefout in een oudere commit repareren

## Doel

Je weet dat `git commit --amend` alleen de laatste commit repareert. Voor een
typefout in de boodschap van een oudere commit heb je `git rebase -i` nodig: je
markeert die ene commit als `reword`, en Git laat je alleen de boodschap
aanpassen zonder verder iets aan de inhoud te wijzigen.

## Basisoefening

Schrijf vanaf `template.sh` een script `interactive-rebase-reword.sh` (een
gewone repo in `repos/` volstaat) dat het volgende doet:

1. Maak drie commits na elkaar, elk met een eigen bestand of wijziging.
2. Zorg dat de **middelste** commit een tikfout in de boodschap heeft.
3. Bekijk de historie met `git log --oneline`.
4. Start `git rebase -i HEAD~3`.

De rest is handwerk: zet in de todo-lijst uitsluitend die
middelste commit op `reword`, de rest op `pick`. Git stopt bij die commit
en laat je de boodschap corrigeren.

**Klaar wanneer:** `git log --oneline` de gecorrigeerde boodschap toont bij de
middelste commit, de andere twee commits ongewijzigd zijn, en er nog steeds
drie commits zijn (geen extra commit erbij).

## Plus-oefeningen — meer bewegingsvrijheid in de todo-lijst

### Oefening P1 - meerdere typefouten, één rebase

Schrijf een apart script `interactive-rebase-meerdere-typefouten.sh` dat eindigt
met ```git rebase -i ...```.

- **Doel:** een langere reeks commits bevat verspreid meerdere tikfouten in de
  boodschap, tussen prima commits door. Repareer ze allemaal in één
  interactive rebase.
- **Klaar wanneer:** alle commit-boodschappen kloppen, en de bestandsinhoud van
  geen enkele commit is veranderd.

### Oefening P2 - herordenen met een addertje

Schrijf een apart script `interactive-rebase-herordenen-conflict.sh` dat eindigt
met ```git rebase -i ...```.

- **Doel:** meerdere commits met daartussen twee commits die dezelfde regel(s)
  in hetzelfde bestand raken,
  krijgen tijdens de rebase een andere volgorde waardoor een conflict
  ontstaat. Los dat conflict op en rond de rebase af.
- **Klaar wanneer:** de nieuwe volgorde klopt, het conflict is opgelost, en
  `git status` geen lopende rebase meer toont.

### Oefening P3 - automatiseer alles

Automatiseer de rebase van P1. Je script stopt dus niet meer na ```git rebase```
maar zorgt er voor dat de interactive rebase automatisch plaats vindt.

### Oefening P4 - controleer elke stap met `exec`

Schrijf een apart script `interactive-rebase-exec.sh` dat eindigt met
```git rebase -i ...```.

- **Doel:** de todo-lijst van een interactive rebase kan ook een controle
  bevatten die na iedere commit automatisch draait — zodat je meteen ziet bij
  welke commit iets misgaat, in plaats van dat pas achteraf te ontdekken.
  Bouw een reeks commits op waarvan er ergens in het midden eentje is die de
  controle laat falen, en zorg dat de rebase daar duidelijk op wijst.
- **Klaar wanneer:** de rebase stopt bij precies de commit waar de controle
  faalt, en na het herstellen daarvan is de hele rebase zonder verdere
  problemen afgerond.

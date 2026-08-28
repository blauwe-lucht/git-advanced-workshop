# Oefening 015 — Een per ongeluk toegevoegd bestand uit een oudere commit halen

## Doel

Bij `reword` en `squash` rondt Git de rebase na jouw editor-stap vanzelf af.
Met `edit` is dat voor het eerst niet zo: Git stopt bij de gemarkeerde commit
en checkt die uit, maar jíj moet zelf de wijziging aanbrengen én de rebase
expliciet laten doorgaan.

## Basisoefening

Schrijf vanaf `template.sh` een script `interactive-rebase-edit.sh` (een
gewone repo in `repos/` volstaat) dat het volgende doet:

1. Maak een eerste commit.
2. Maak een tweede commit die, per ongeluk, naast de bedoelde wijziging ook een
   bestand toevoegt dat er niet in hoort.
3. Maak een derde commit.
4. Bekijk de historie met `git log --oneline`.
5. Start `git rebase -i HEAD~2`.

De rest is handwerk:

1. Zet in de todo-lijst uitsluitend die
   tweede commit op `edit`, de rest op `pick`. Git stopt en checkt die commit
   uit.
2. Haal het overbodige bestand uit die commit en voer de aanpassing uit.
3. Laat de rebase verdergaan met `git rebase --continue`.
4. Bekijk de historie opnieuw.

**Klaar wanneer:** de tweede commit het overbodige bestand niet meer bevat
maar de bedoelde wijziging wel, de andere twee commits zijn ongewijzigd, er
zijn nog steeds drie commits, en `git status` toont geen lopende rebase meer.

## Plus-oefening — meerdere stops, en niet elke stop is vanzelfsprekend

### Deel A — twee keer stoppen, twee keer verdergaan

Schrijf een apart script `interactive-rebase-edit-meerdere.sh`.

- **Doel:** twee verschillende oudere commits bevatten allebei een bestand dat
  er niet in hoort. Repareer ze allebei in één interactive rebase.
- **Klaar wanneer:** geen van beide commits het overbodige bestand nog bevat,
  de rest van de historie is ongewijzigd, en er is geen lopende rebase meer.

### Deel B — edit met een addertje

Schrijf een apart script `interactive-rebase-edit-conflict.sh`.

- **Doel:** een latere commit wijzigt toevallig dezelfde regel als de commit
  die je met `edit` aanpast. Rond de rebase af, inclusief het conflict dat
  daardoor ontstaat.
- **Klaar wanneer:** het overbodige bestand is weg, de latere wijziging is nog
  aanwezig, het conflict is opgelost, en er is geen lopende rebase meer.

### Deel C — alles bij elkaar

Schrijf een apart script `interactive-rebase-groot-opschonen.sh`.

- **Doel:** een rommelige historie met een overbodig bestand in een oudere
  commit, een tikfout in een boodschap elders, en twee wip-commits die bij
  elkaar horen — in één rebase opschonen tot een nette, korte historie.
- **Klaar wanneer:** `git log --oneline` een schone historie toont zonder het
  overbodige bestand, zonder tikfout en zonder losse wip-commits, en er is
  geen lopende rebase meer.

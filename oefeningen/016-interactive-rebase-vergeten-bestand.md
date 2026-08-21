# Oefening 016 - Een vergeten bestand alsnog in de juiste commit krijgen

## Doel

Je maakt een commit die een nieuw bestand hoort toe te voegen, maar vergeet
het te `git add`en voordat je commit. Pas later, na nog een volgende
commit, valt het je op: het bestand staat nog steeds als untracked in je
working directory. Je leert het alsnog in de juiste, oudere commit te krijgen
met dezelfde `edit`-aanpak als oefening 013.

## Basisoefening

Schrijf vanaf `template.sh` een script
`interactive-rebase-vergeten-bestand.sh` (een gewone repo in `repos/`
volstaat) dat het volgende doet:

1. Maak een eerste commit.
2. Maak een tweede commit die een bestaand bestand A wijzigt én een nieuw
   bestand B aanmaakt - maar commit alleen met `git commit -am`, zodat het
   nieuwe bestand 'per ongeluk' untracked blijft.
3. Maak een derde commit die het bestaande bestand A nogmaals wijzigt.
4. Zie met `git status` dat bestand B nog steeds untracked is.
5. Start `git rebase -i HEAD~2` en zet in de todo-lijst uitsluitend die
   tweede commit op `edit`, de laatste op `pick`.

De rest is handwerk: Git stopt bij de tweede commit. Voeg het
bestand B alsnog toe en pas de commit aan met `git commit --amend --no-edit`.
Laat de rebase daarna verdergaan met `git rebase --continue`.

**Klaar wanneer:** de tweede commit het vergeten bestand bevat, de derde
commit nog steeds zijn eigen wijziging heeft, er zijn nog steeds drie
commits, en `git status` toont geen ongetrackte bestanden en geen lopende
rebase meer.

## Plus-oefening - dezelfde reparatie zonder te stoppen

`git rebase -i` met `edit` is niet de enige manier om een wijziging met
terugwerkende kracht in een oudere commit te krijgen. Git heeft ook
`--fixup` en `--autosquash`, waarmee veel automatisch gaat.
Zoek zelf uit hoe die combinatie werkt. Elk deel is een
**eigen script** dat je vanaf `template.sh` schrijft.

### Deel A - dezelfde reparatie, andere techniek

Schrijf een apart script `interactive-rebase-fixup-vergeten-bestand.sh`.

- **Doel:** zet hetzelfde scenario op als de basisoefening, maar los het nu
  op met fixup.
- **Klaar wanneer:** hetzelfde eindresultaat als de basisoefening, maar de
  rebase zelf vraagt onderweg niets anders dan het opslaan van een
  voorgevulde todo-lijst.

### Deel B - twee vergeten stukjes

Schrijf een apart script `interactive-rebase-fixup-meerdere.sh`.

- **Doel:** je ontdekt niet alleen een vergeten bestand, maar ook een wijziging
  die allebei bij een andere, oudere commit horen (niet de laatste).
  Repareer ze allebei in één rebase met fixup, met minimaal handwerk.
- **Klaar wanneer:** beide oudere commits bevatten hun eigen vergeten
  wijziging, de rest van de historie is ongewijzigd, er is geen lopende
  rebase meer, git status is schoon.

# Oefening 016 — WIP-commits opschonen met interactive rebase

## Doel

Je leert een rommelige reeks "wip"-commits opschonen tot één nette commit
voordat je die deelt. De sleutel is `git rebase -i`: daarmee open je een
todo-lijst waarin je per commit kiest wat ermee gebeurt (`pick`, `squash`,
`fixup`, …).

## Oefening 1

Schrijf vanaf `template.sh` een script `interactive-rebase.sh` (een gewone repo
in `repos/` volstaat) dat het volgende doet:

1. Maak een eerste, zinnige commit (bijv. `file1.txt` met "version 1").
2. Voeg er daarna drie losse "wip"-commits bovenop toe die stukje bij beetje aan
   hetzelfde bestand werken.
3. Bekijk de historie met `git log --oneline`.
4. Start `git rebase -i HEAD~3` en zet in de todo-lijst de eerste commit op
   `pick` en de rest op `squash`, zodat ze in de eerste worden gevouwen. Schrijf
   een nette gecombineerde boodschap.
5. Bekijk de historie opnieuw.

**Klaar wanneer:** `git log --oneline` nog maar twee commits toont (de initiële
commit en één opgeschoonde feature-commit) en `git show` alle wijzigingen in die
ene commit bevat.

### Plus-oefening — squash, fixup en de reflog

Elk deel is een **eigen script** dat je vanaf `template.sh` schrijft. Een
interactive rebase is interactief, dus elk script eindigt op hooguit één
`rebase -i` (evt. gevolgd door een `git log`/`git reflog` als status) — zet dus
geen tweede rebase achter de eerste in hetzelfde script.

#### Deel A — fixup + autosquash

Schrijf een apart script `interactive-rebase-fixup.sh` vanaf `template.sh`.
Gebruik ```git commit --fixup```, eindig met ```git rebase -i --autosquash```.

- **Doel:** je hebt al een nette feature-commit; voeg dáárna een klein
  reparatiecommitje toe dat van zichzelf al weet bij welke commit het hoort, en
  laat de afsluitende rebase het automatisch op de juiste plek invouwen — mét
  weggegooide reparatie-boodschap.
- **Klaar wanneer:** na de rebase de reparatie geen losse commit meer is, de
  inhoud ervan in de feature-commit zit, en er geen "fixup!"-boodschap is blijven
  hangen.

#### Deel B — terug van weggeweest via de reflog

Geen script maar een handmatige actie: we doen alsof de rebase van deel A
is gefaald.

- **Doel:** een interactive rebase herschrijft commits. Laat, ná die ene rebase,
  met niet-interactieve commando's zien dat je de toestand van vóór jouw rebase
  weer volledig terughaalt. Sluit af met een status (`git log`, `git reflog`).
- **Klaar wanneer:** de originele losse wip-commits weer zichtbaar zijn
  in ```git log```.

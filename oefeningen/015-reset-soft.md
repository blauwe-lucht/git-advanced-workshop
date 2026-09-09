# Oefening 015 — Twee slordige commits samenvoegen met `git reset --soft`

## Doel

Je hebt lokaal (nog niet gepusht) twee kleine commits achter elkaar gemaakt
die eigenlijk gewoon één logische wijziging vormen (een typefout die je
meteen daarna weer repareerde, bijvoorbeeld). Voordat je pusht wil je die
opschonen tot één nette commit. `git reset --soft` verplaatst de
branch-pointer terug, maar laat alles wat die commits bevatten staan in de
staging area, precies wat je nodig hebt om ze in één keer opnieuw te
committen.

## Basisoefening

Schrijf vanaf `template.sh` een script `reset-soft.sh` (een gewone repo in
`repos/` volstaat) dat het volgende doet:

1. Maak op `main` een eerste commit met een bestand `notes.txt` met inhoud
   "first commit".
2. Maak een tweede commit die daaraan een regel toevoegt, maar met een
   tikfout erin, bv "second comit".
3. Maak een derde commit die alleen die tikfout repareert.
4. Bekijk met `git log --oneline` dat je nu drie commits hebt, waarvan de
   laatste twee eigenlijk bij elkaar horen.
5. Gebruik `git reset --soft HEAD~2` om de branch-pointer terug te zetten tot vóór
   die twee laatste commits.
6. Bekijk met `git status` dat de wijzigingen van beide commits nu samen
   gestaged staan.
7. Maak hiervan één nieuwe, nette commit.

**Klaar wanneer:** `git log --oneline` toont twee commits in plaats van drie,
de tikfout-commit is nergens meer los terug te vinden, en `notes.txt` bevat
de juiste, gerepareerde inhoud.

## Plus-oefening — nog een vergeten wijziging erbij

Schrijf één script `reset-soft-expand.sh` vanaf `template.sh` dat je in
de volgende delen uitbreidt.

### Deel A — drie commits samenvoegen tot één

Bouw een situatie op met drie losse lokale commits die logisch bij elkaar
horen (bijvoorbeeld drie kleine stapjes van dezelfde feature). Voeg ze samen
tot één commit met een duidelijke boodschap, zonder dat je zelf commando's
per bestand hoeft te gebruiken om de inhoud terug te halen.

**Klaar wanneer:** `git log --oneline` toont één nieuwe commit in plaats van
drie, en die commit bevat de volledige inhoud van alle drie de oorspronkelijke
commits.

### Deel B — vlak voor het committen nog iets toevoegen

Je hebt de drie commits net samengevoegd tot staged wijzigingen zoals in Deel
A, maar vóórdat je de nieuwe commit maakt, besef je dat er nog een kleine
wijziging in hetzelfde bestand ontbreekt. Voeg die toe aan wat al staged
staat, en rond dan pas de commit af.

**Klaar wanneer:** de uiteindelijke commit bevat zowel de inhoud van de drie
oorspronkelijke commits als de extra wijziging, en dit alles zit in precies
één commit.

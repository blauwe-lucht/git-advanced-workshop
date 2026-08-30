# Oefening 004 — Een eerdere commit terugdraaien met `git revert`

## Doel

Je leert een eerdere commit ongedaan maken met `git revert`, voor het geval
dat je de fout pas ontdekt nadat er alweer een volgende commit bovenop is
gekomen - `--amend` werkt dan namelijk niet meer, want die repareert alleen
de allerlaatste commit.

## Basisoefening

Schrijf vanaf `template.sh` een script `revert.sh` (een gewone repo in
`repos/` volstaat, een remote heb je niet nodig).

1. Maak een eerste commit met `notes.txt` met daarin een regel tekst.
2. Maak een tweede commit waarin je per ongeluk een regel toevoegt aan
   `notes.txt` die er niet in hoort.
3. Maak een derde commit met een heel andere, op zichzelf staande wijziging
   (bijvoorbeeld een nieuw bestand). Draai `git log --oneline`: de foute
   wijziging uit stap 2 zit niet meer in de laatste commit, dus `--amend`
   kan hem niet meer repareren.
4. Gebruik `git revert --no-edit HEAD~1` om specifiek de commit uit stap 2
   ongedaan te maken.
5. Bekijk met `git log --oneline` dat er een nieuwe commit is bijgekomen die
   de fout terugdraait, en met `cat notes.txt` dat de ongewenste regel weg is
   terwijl de rest van het bestand en de commit uit stap 3 onaangeroerd zijn.

**Klaar wanneer:** `git log --oneline` toont alle oorspronkelijke commits nog
steeds (er is niets herschreven of verdwenen) plus één nieuwe revert-commit,
en `notes.txt` bevat de inhoud van stap 1 en 3, maar niet meer de ongewenste
regel uit stap 2.

## Plus-oefening — de revert weer terugdraaien

Schrijf een apart script `revert-the-revert.sh` vanaf `template.sh`.

- **Doel:** bouw dezelfde situatie op als in de basisoefening (een foute
  commit, een latere commit erbovenop, en een revert die de fout ongedaan
  maakt). Blijkt dat de teruggedraaide wijziging toch weer nodig is - draai
  nu de revert-commit zelf ook terug, zodat de oorspronkelijke wijziging
  weer terugkomt.
- **Klaar wanneer:** `notes.txt` bevat weer de wijziging uit de
  oorspronkelijke, foute commit, `git log --oneline` toont nu twee extra
  commits bovenop de eerste drie (de revert en de revert van die revert), en
  er is nog steeds niets herschreven of verdwenen.

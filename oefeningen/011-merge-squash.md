# Oefening 011 — Opschonen met squash merge

## Doel

Je leert een rommelige feature-branch met een aantal kleine, niet zo
interessante commits (WIP, typefouten) als één nette commit op `main` te
krijgen, zonder die losse commits mee te nemen in de hoofdhistorie.

## Basisoefening

Schrijf vanaf `template.sh` een script `merge-squash.sh` (een gewone repo in
`repos/` volstaat) dat het volgende doet:

1. Maak op `main` een eerste commit.
2. Maak een `feature`-branch en voeg daar drie kleine commits na elkaar toe
   (bijvoorbeeld: bestand toevoegen, iets uitbreiden, een tikfout
   herstellen).
3. Ga terug naar `main` en gebruik `git merge --squash feature`.
4. Rond het af met een eigen, nette commit-boodschap.
5. Bekijk met `git log --oneline --graph --all` dat `main` maar één nieuwe
   commit heeft gekregen, terwijl `feature` zelf nog steeds zijn drie losse
   commits heeft.

**Klaar wanneer:** `main` bevat precies één nieuwe commit met daarin alle
wijzigingen van de feature, de drie losse commits van `feature` staan niet
in de historie van `main`, en de `feature`-branch zelf is ongewijzigd.

## Plus-oefening — de branch opruimen na een squash

Schrijf een apart script `merge-squash-cleanup.sh` vanaf `template.sh`.

- **Doel:** bouw dezelfde situatie op als in de basisoefening. Probeer
  daarna de nu overbodige `feature`-branch op te ruimen. Blijkt dat Git dat
  niet zomaar toestaat - zoek uit waarom niet, en ruim de branch alsnog op.
- **Klaar wanneer:** je kunt uitleggen waarom Git in eerste instantie weigert,
  en de `feature`-branch bestaat aan het eind van je script niet meer.

# Oefening 008 — Mergen naar een branch met nieuwe commits

## Doel

Je hebt in de basiscursus al geleerd hoe je een mergeconflict herkent en met
de hand oplost. Deze oefening gaat over wat een merge doet als er géén
conflict is maar de doelbranch (`main`) intussen verder is gegaan: je
krijgt een extra commit (de merge-commit) met twee parents.

## Basisoefening

Schrijf vanaf `template.sh` een script `merge-diverged.sh` (een gewone repo
in `repos/` volstaat) dat het volgende doet:

1. Maak op `main` een eerste commit.
2. Maak een `feature`-branch en voeg daar een commit toe die een nieuw
   bestand toevoegt.
3. Ga terug naar `main` en voeg daar een eigen commit toe die een ander
   bestand wijzigt - zodat `main` en `feature` allebei verder zijn gegaan,
   zonder dat ze elkaars werk raken.
4. Bekijk met `git log --oneline --graph --all` dat de branches uit elkaar
   zijn gaan lopen.
5. Merge `feature` in `main`.
6. Bekijk de historie opnieuw, en bekijk met `git log --oneline --graph --all` dat
   de nieuwe merge-commit twee ouders heeft.

**Klaar wanneer:** er is geen conflict geweest, `main` bevat na de merge het
werk van beide branches, en de laatste commit op `main` heeft volgens
`git log --oneline --graph --all` twee ouder-commits.

## Plus-oefening — de andere kant van de merge bekijken

Schrijf een apart script `merge-diverged-andere-kant.sh` vanaf `template.sh`.

- **Doel:** bouw dezelfde situatie op als in de basisoefening. Bekijk na de
  merge specifiek de wijzigingen die uit `feature` kwamen, zonder de
  wijzigingen die al vanuit `main` zelf kwamen erbij te pakken.
- **Klaar wanneer:** je hebt met een los commando de inhoud of de diff van
  precies de tweede ouder van de merge-commit laten zien, zonder daarvoor de
  hash van de oude `feature`-branch te hoeven opzoeken.

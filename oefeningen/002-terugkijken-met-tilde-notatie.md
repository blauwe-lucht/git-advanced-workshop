# Oefening 002 — Terugkijken met de `~`-notatie

## Doel

Je leert met `git show` terugkijken naar eerdere commits zonder dat je hun
commit-hash hoeft op te zoeken of te onthouden, met de `~`-notatie
(`HEAD~1`, `HEAD~2`, ...). Je leert ook met `git rev-parse` de commit-hash
achter zo'n uitdrukking rechtstreeks op te vragen, zonder de rest van de
`git show`-uitvoer erbij.

## Basisoefening

Schrijf vanaf `template.sh` een script `terugkijken.sh` (een gewone repo in
`repos/` volstaat, een remote heb je niet nodig).

### Deel A — terugkijken op je eigen branch

1. Maak een eerste commit waarin `notes.txt` een regel tekst bevat.
2. Maak een tweede commit waarin je een regel aan `notes.txt` toevoegt.
3. Maak een derde commit waarin je nog een regel aan `notes.txt` toevoegt.
4. Bekijk met `git show HEAD` de meest recente commit (de derde).
5. Bekijk met `git show HEAD~1` de commit daarvoor (de tweede), zonder dat je
   daarvoor zijn commit-hash hebt hoeven opzoeken.
6. Bekijk met `git show HEAD~2` de allereerste commit.
7. Vraag met `git rev-parse HEAD~1` alleen de commit-hash van de tweede
   commit op, zonder de rest van de `git show`-uitvoer.

**Klaar wanneer:** je met `git show HEAD`, `git show HEAD~1` en
`git show HEAD~2` alle drie de commits hebt kunnen bekijken, in de juiste
volgorde, zonder ook maar één keer een commit-hash te hoeven kopiëren of
opzoeken, en je met `git rev-parse HEAD~1` de kale hash van de tweede commit
hebt gezien.

### Deel B — terugkijken op een andere branch

1. Maak vanaf de huidige stand van `main` een branch `feature`, en maak daar
   een vierde commit die ook een regel aan `notes.txt` toevoegt.
2. Bekijk met `git show HEAD` de nieuwe commit - `HEAD` volgt nu
   dus `feature`, niet meer `main`.
3. Bekijk met `git show main` de laatste commit van `main` (de derde), zonder
   dat je daarvoor terug hoeft te wisselen naar `main`.
4. Bekijk met `git show main~1` de commit daarvoor op `main` (de tweede).
5. Diezelfde tweede commit is vanaf `feature` ook met een `HEAD`-uitdrukking
   te bereiken. Bewijs met `git rev-parse` dat die uitdrukking en `main~1`
   naar exact dezelfde commit-hash wijzen.

**Klaar wanneer:** je vanaf `feature` met `git show HEAD` je eigen vierde
commit hebt gezien, met `git show main` en `git show main~1` twee commits op
`main` hebt kunnen bekijken zonder van branch te wisselen en zonder een
commit-hash te hoeven opzoeken, en je met twee `git rev-parse`-commando's hebt
aangetoond dat een `HEAD`-uitdrukking en `main~1` dezelfde commit-hash
opleveren.

## Plus-oefening — drie (en een vierde) manier naar dezelfde commit

Schrijf een apart script `terugkijken-plus.sh` vanaf `template.sh`. Bouw
precies deze geschiedenis op:

```ascii-art
      *
      |
      *
      |
    * *
    |/
    *
    |
  * *
  |/
  *
  |
  *
      ^- feature-b
    ^- feature-a
  ^- main
```

### Deel A — drie manieren voor dezelfde commit

- **Doel:** er is precies één commit in deze geschiedenis die vanaf alle drie
  de branches met een `~`-uitdrukking te
  bereiken is. Zoek hem op, en bewijs het met drie verschillende
  commando's - één per branch - die alle drie exact dezelfde
  commit-hash laten zien, zonder dat je die hash zelf hoeft over te typen of
  te onthouden.
- **Klaar wanneer:** je drie verschillende commando's hebt (één voor `main`,
  één voor `feature-a`, één voor `feature-b`) die alle drie dezelfde
  commit-hash tonen.

### Deel B — een vierde manier

- **Doel:** er is nog een vierde, andere manier om met `~` naar diezelfde commit
  te verwijzen - zonder een nieuwe branch te maken en zonder de commit-hash zelf
  te gebruiken. Vind deze vierde manier.
- **Klaar wanneer:** je een vierde commando hebt, met een andere
  schrijfwijze dan de eerste drie, dat nog steeds dezelfde commit-hash
  oplevert.

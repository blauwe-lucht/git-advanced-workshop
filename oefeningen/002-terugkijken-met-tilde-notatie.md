# Oefening 002 — Terugkijken met de `~`-notatie

## Doel

Je leert met `git show` terugkijken naar eerdere commits zonder dat je hun
commit-hash hoeft op te zoeken of te onthouden, met de `~`-notatie
(`HEAD~1`, `HEAD~2`, ...).

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

**Klaar wanneer:** je met `git show HEAD`, `git show HEAD~1` en
`git show HEAD~2` alle drie de commits hebt kunnen bekijken, in de juiste
volgorde, zonder ook maar één keer een commit-hash te hoeven kopiëren of
opzoeken.

### Deel B — terugkijken op een andere branch

1. Maak vanaf de huidige stand van `main` een branch `feature`, en maak daar
   een vierde commit die ook een regel aan `notes.txt` toevoegt.
2. Bekijk met `git show HEAD` de nieuwe commit - `HEAD` volgt nu
   dus `feature`, niet meer `main`.
3. Bekijk met `git show main` de laatste commit van `main` (de derde), zonder
   dat je daarvoor terug hoeft te wisselen naar `main`.
4. Bekijk met `git show main~1` de commit daarvoor op `main` (de tweede).

**Klaar wanneer:** je vanaf `feature` met `git show HEAD` je eigen vierde
commit hebt gezien, en met `git show main` en `git show main~1` twee commits
op `main` hebt kunnen bekijken, zonder van branch te wisselen en zonder een
commit-hash te hoeven opzoeken.

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
  `git show`-commando's - één per branch - die alle drie exact dezelfde
  commit laten zien.
- **Klaar wanneer:** je drie verschillende `git show`-commando's
  hebt (één voor `main`, één voor `feature-a`, één voor `feature-b`) die alle
  drie dezelfde commit-hash tonen.

### Deel B — een vierde manier

- **Doel:** er is nog een vierde, andere manier om met `~` naar diezelfde commit
  te verwijzen - zonder een nieuwe branch te maken en zonder de commit-hash zelf
  te gebruiken. Vind deze vierde manier.
- **Klaar wanneer:** je een vierde `git show`-commando hebt, met een andere
  schrijfwijze dan de eerste drie, dat nog steeds naar diezelfde commit
  wijst.

# Oefening 010 — Een losse commit overzetten met `git cherry-pick`

## Doel

Je leert één specifieke commit van de ene branch naar de andere overzetten
met `git cherry-pick`, zonder de rest van die branch mee te nemen — handig
als een fix per ongeluk op de verkeerde branch is beland en niet kan wachten
tot die branch klaar en gemerged is.

## Basisoefening

Schrijf vanaf `template.sh` een script `cherrypick.sh` (een gewone repo in
`repos/` volstaat) dat het volgende doet:

1. Maak op `main` een eerste commit met `run.sh` met daarin de regel
   `ehco "First commit"` - let op de tikfout in `ehco`.
2. Maak een tweede commit die daaraan `echo "Second commit"` toevoegt.
3. Vanaf deze tweede commit is, vóór er nog iets anders gebeurt, een
   feature-branch gestart. Maak die branch nu aan.
4. Maak op `main` een derde commit die `echo "Third commit"` toevoegt - dit
   simuleert werk dat op `main` doorgaat terwijl de feature-branch al
   bestaat.
5. Ga naar de feature-branch en maak daar drie commits na elkaar: een die
   `echo "First commit from branch"` toevoegt, een die de tikfout uit stap 1
   repareert (`ehco` wordt `echo`), en een die `echo "Third commit from
   branch"` toevoegt. Om de tikfout te fixen kun je sed gebruiken:
   `sed -i 's/ehco/echo/' run.sh`
6. Bekijk met `git log --oneline --graph --all` dat de fix ergens middenin de
   feature-branch verstopt zit, tussen twee commits die niets met de fix te
   maken hebben.
7. Ga naar `main` en gebruik `git cherry-pick feature~1` om alleen de fix-commit
   over te zetten.
8. Draai `bash run.sh` om te controleren dat de tikfout weg is.

**Klaar wanneer:** `bash run.sh` op `main` foutloos "First commit", "Second
commit" en "Third commit" print, `main` bevat verder niets van de
feature-branch, en de feature-branch zelf is ongewijzigd (alle drie zijn
commits staan er nog steeds op).

## Plus-oefeningen — meer met cherry-pick

Dit zijn losstaande oefeningen, geen opvolgende delen. Elke oefening is een
**eigen script** dat je vanaf `template.sh` schrijft.

### Oefening P1 - cherry-pick met conflict

Schrijf een apart script `cherrypick-conflict.sh`.

- **Doel:** bouw een situatie op waarin `main` intussen dezelfde regel heeft
  gewijzigd als de commit die je wilt cherry-picken, zodat het overzetten
  een conflict oplevert. Los dat conflict op en rond de cherry-pick af.
- **Klaar wanneer:** het conflict is opgelost met de juiste inhoud, en
  `git status` toont geen lopende cherry-pick meer.

### Oefening P2 - meerdere commits in één keer

Schrijf een apart script `cherrypick-meerdere-commits.sh`.

- **Doel:** een branch bevat, verspreid tussen andere commits, een paar
  commits die je allemaal naar `main` wilt overzetten. Zet ze in één keer
  over, in de juiste volgorde.
- **Klaar wanneer:** `main` bevat precies de gekozen commits, in dezelfde
  volgorde als op de oorspronkelijke branch, en verder niets van die branch.

### Oefening P3 - de fix bestaat al

Schrijf een apart script `cherrypick-al-aanwezig.sh`.

- **Doel:** iemand anders heeft dezelfde fix intussen al, onafhankelijk, op
  `main` doorgevoerd. Probeer de commit alsnog te cherry-picken en zorg dat
  je daar netjes mee omgaat, zonder een zinloze lege commit achter te laten.
- **Klaar wanneer:** `main` bevat de fix (hoe dan ook tot stand gekomen), en
  er staat geen lege of dubbele commit in de historie.

### Oefening P4 - meerdere fixes samenvoegen

Schrijf een apart script `cherrypick-samenvoegen.sh`.

- **Doel:** een branch bevat een paar losse commits die je wilt overzetten
  naar `main`, maar dit keer niet als aparte commits - je wilt dat ze op
  `main` als één enkele, samengevoegde commit terechtkomen.
- **Klaar wanneer:** `main` heeft één nieuwe commit die de inhoud van alle
  gekozen commits bevat, en er zijn niet meerdere losse commits voor
  bijgekomen.

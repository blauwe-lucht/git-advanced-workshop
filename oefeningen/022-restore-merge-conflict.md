# Oefening 022 - Een merge conflict per bestand oplossen met `git restore`

## Doel

Een merge levert conflicten op in twee bestanden. Voor het ene bestand weet je
zeker dat de versie van `main` goed is, voor het andere juist de versie van de
feature-branch. Met de hand alle conflict markers weghalen is dan zonde van je
tijd. Met `git restore --ours <bestand>` of `--theirs <bestand>` kies je per
bestand één kant.

Vergelijk dit met `-X ours`/`-X theirs` uit oefening 015: dat geldt voor de
hele merge en alleen voor de conflicterende stukken. `git restore --ours`
neemt het **hele bestand** van één kant, ook als de andere kant ergens anders
in dat bestand een wijziging had zonder conflict.

## Basisoefening

Schrijf vanaf `template.sh` een script `restore-merge-conflict.sh` (een gewone
repo in `repos/` volstaat) dat het volgende doet:

1. Maak op `main` een eerste commit met `config.txt` en `readme.txt`.
2. Maak een `feature`-branch en wijzig daar beide bestanden.
3. Ga terug naar `main` en wijzig daar beide bestanden onafhankelijk anders.
4. Merge `feature` in `main`. Bekijk met `git status` dat beide bestanden een
   conflict hebben. Bekijk de staging area met `git ls-files --stage`: tijdens
   een conflict staan er per bestand **drie** versies in, genummerd 1 (de
   gemeenschappelijke voorouder), 2 (`ours`, `main`) en 3 (`theirs`,
   `feature`). `git restore --ours` en `--theirs` halen hun versie uit stap 2
   of 3.
5. Neem voor `config.txt` de versie van `main` met `git restore --ours
   config.txt`, en voor `readme.txt` de versie van `feature` met
   `git restore --theirs readme.txt`.
6. Markeer beide bestanden als opgelost met `git add` en rond de merge af met
   `git commit`. Bekijk vóór de commit nog een keer `git ls-files --stage`:
   `git add` heeft de drie versies vervangen door één.

**Klaar wanneer:** de merge commit bestaat, `config.txt` heeft de inhoud van
`main`, `readme.txt` heeft de inhoud van `feature`, en geen van beide bevat
nog conflict markers.

## Plus-oefening - opnieuw beginnen met één conflict

Schrijf één script `restore-merge-redo.sh` vanaf `template.sh` dat je in de
volgende delen uitbreidt.

### Deel A - een mislukte oplossing

Zorg voor een merge met conflicten in twee bestanden. Los het conflict in één
bestand met de hand op, maar doe dat slordig: er blijven een paar conflict
markers staan. Je hebt het niet door en markeert het bestand toch als
opgelost.

**Klaar wanneer:** `git status` toont het slordige bestand als opgelost, terwijl
er nog conflict markers in staan.

### Deel B - het conflict terughalen

Je wilt niet met de hand de rommel opruimen, maar opnieuw beginnen met het
oorspronkelijke conflict, zonder de hele merge af te breken en opnieuw te
starten. Haal het oorspronkelijke conflict van alleen dat ene bestand terug,
en los daarna beide bestanden netjes op.

**Klaar wanneer:** na het terughalen toont `git status` het bestand weer als
conflict met alle conflict markers er weer volledig in, en na het oplossen bestaat
de merge commit en zitten er in geen van beide bestanden nog conflict markers.

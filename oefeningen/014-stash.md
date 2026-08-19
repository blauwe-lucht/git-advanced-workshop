# Oefening 014 - Werk opzijzetten met `git stash`

## Doel

Je leert onafgemaakt werk tijdelijk opzij te zetten zonder het te committen,
zodat je een schone working tree hebt - bijvoorbeeld om snel iets anders te
doen - en het later weer terug te halen.

## Basisoefening

Schrijf vanaf `template.sh` een script `stash.sh` (een gewone repo in `repos/`
volstaat) dat het volgende doet:

1. Maak een eerste commit.
2. Wijzig een bestand, maar commit dat niet.
3. Bekijk met `git status` dat er een niet-gecommitte wijziging is.
4. Zet die wijziging opzij met `git stash`.
5. Bekijk met `git status` dat de working tree weer schoon is.
6. Bekijk de opgeslagen stash met `git stash list`.
7. Haal de wijziging terug met `git stash pop`.

**Klaar wanneer:** de working tree na stap 4 schoon is, `git stash list` daar
één entry toont, en na stap 7 de wijziging weer aanwezig is en `git stash
list` weer leeg is.

## Plus-oefening - alles wat `git stash` kan

`git stash` kan meer dan alleen "opzijzetten en terughalen". Zoek zelf uit wat
er allemaal mogelijk is. Elk deel is een **eigen script** dat je vanaf
`template.sh` schrijft. Zodra een deel interactief is, staat die interactie
aan het **eind** van het script, hooguit gevolgd door een statuscommando
(`git status`, `git stash list`).

### Deel A - meerdere stashes, en niet zomaar de laatste

Schrijf een apart script `stash-meerdere.sh`.

- **Doel:** zet twee verschillende, onafhankelijke wijzigingen na elkaar
  opzij, en haal daarna specifiek de *oudste* van de twee weer terug - zonder
  de andere kwijt te raken.
- **Klaar wanneer:** de oudste wijziging is teruggehaald, de andere staat nog
  veilig in de stash-lijst.

### Deel B - alleen een deel van je wijzigingen stashen

Schrijf een apart script `stash-gedeeltelijk.sh`.

- **Doel:** je hebt wijzigingen in meerdere bestanden, maar wilt er maar een
  deel van opzijzetten - de rest moet gewoon in je working tree blijven staan
  zodat je die meteen kunt committen.
- **Klaar wanneer:** de wijziging die je wilde behouden staat nog steeds in je
  working tree (of is gecommit), en alleen de rest zit in de stash.

### Deel C - ook nieuwe bestanden meenemen

Schrijf een apart script `stash-nieuwe-bestanden.sh`.

- **Doel:** naast een wijziging in een bestaand bestand heb je ook een
  compleet nieuw, nog niet getrackt bestand. Zorg dat beide worden opgeslagen
  in de stash.
- **Klaar wanneer:** de working tree na het stashen volledig schoon is -
  inclusief het nieuwe bestand - en na het terughalen beide weer aanwezig
  zijn.

### Deel D - een stash die niet zomaar terug wil

Schrijf een apart script `stash-conflict.sh`.

- **Doel:** zorg dat het terughalen van een stash een conflict oplevert met
  wat er inmiddels in je working tree staat, en los dat conflict op zonder
  iets van beide kanten kwijt te raken.
- **Klaar wanneer:** het conflict is opgelost, de inhoud van zowel de
  teruggehaalde stash als de wijziging die er al was, is terug te vinden in
  het eindresultaat, en de stash-lijst bevat geen rommel meer die daar niet
  hoort.

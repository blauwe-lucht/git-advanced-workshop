# Oefening 016 - Werk opzijzetten met `git stash`

## Doel

Je leert onafgemaakt werk tijdelijk opzij te zetten zonder het te committen,
zodat je een schone working tree hebt - bijvoorbeeld om snel iets anders te
doen - en het later weer terug te halen. Een stash is geen los geheugentje
maar een **stack**: je kunt meerdere keren achter elkaar iets opzijzetten, en
haalt dan steeds de bovenste eraf.

## Basisoefening

Schrijf vanaf `template.sh` een script `stash.sh` (een gewone repo in `repos/`
volstaat) dat het volgende doet:

1. Maak een eerste commit.
2. Wijzig twee bestanden. Stage er één van (`git add`), laat de ander
   unstaged.
3. Bekijk met `git status` dat er zowel een staged als een unstaged wijziging
   is.
4. Zet beide opzij met `git stash`.
5. Bekijk met `git status` dat de working tree en staging area schoon zijn.
6. Wijzig een derde bestand, en zet ook die wijziging opzij met `git stash`.
   Er staan nu twee stashes op de stack.
7. Bekijk de stack met `git stash list`, en de inhoud van beide entries met
   `git stash show`.
8. Haal de bovenste (dus meest recente) stash terug met `git stash pop`.
9. Bekijk met `git stash list` dat er nog maar één stash over is - de oudste.
10. Haal ook die terug met `git stash pop`.
11. Bekijk met `git status` dat de oorspronkelijke situatie weer hersteld is.

**Klaar wanneer:** na stap 6 toont `git stash list` twee entries met de
meest recente bovenaan, na stap 8 nog maar één - de oudste - en na stap 10
zijn alle drie de wijzigingen weer aanwezig — inclusief dat het bestand dat
je stage'de weer staged staat — en `git stash list` is weer leeg.

## Plus-oefening - alles wat `git stash` kan

`git stash` kan meer dan alleen "opzijzetten en terughalen". Zoek zelf uit wat
er allemaal mogelijk is. Elk deel is een **eigen script** dat je vanaf
`template.sh` schrijft. Zodra een deel interactief is, staat die interactie
aan het **eind** van het script, hooguit gevolgd door een statuscommando
(`git status`, `git stash list`).

### Deel A - de stack opruimen

Schrijf een apart script `stash-pop-en-drop.sh`.

- **Doel:** zet twee verschillende, onafhankelijke wijzigingen na elkaar
  opzij. Haal specifiek de *oudste* van de twee terug, en verwijder de
  nieuwste - zonder hem terug te halen - van de stack.
- **Klaar wanneer:** de wijziging van de oudste stash staat weer in je
  working tree, de wijziging van de nieuwste stash is nergens meer terug te
  vinden, en `git stash list` is leeg.

### Deel B - meerdere stashes, en niet zomaar de laatste

Schrijf een apart script `stash-meerdere.sh`.

- **Doel:** zet drie verschillende, onafhankelijke wijzigingen na elkaar
  opzij, en haal daarna specifiek de *oudste* van de drie weer terug - zonder
  de andere twee kwijt te raken of van volgorde te laten wisselen.
- **Klaar wanneer:** de oudste wijziging is teruggehaald, de andere twee staan
  nog veilig en in de oorspronkelijke volgorde in de stash-lijst.

### Deel C - alleen een deel van je wijzigingen stashen

Schrijf een apart script `stash-gedeeltelijk.sh`.

- **Doel:** je hebt wijzigingen in meerdere bestanden, maar wilt er maar een
  deel van opzijzetten - de rest moet gewoon in je working tree blijven staan
  zodat je die meteen kunt committen.
- **Klaar wanneer:** de wijziging die je wilde behouden staat nog steeds in je
  working tree (of is gecommit), en alleen de rest zit in de stash.

### Deel D - ook nieuwe bestanden meenemen

Schrijf een apart script `stash-nieuwe-bestanden.sh`.

- **Doel:** naast een wijziging in een bestaand bestand heb je ook een
  compleet nieuw, nog niet getrackt bestand. Zorg dat beide worden opgeslagen
  in de stash.
- **Klaar wanneer:** de working tree na het stashen volledig schoon is -
  inclusief het nieuwe bestand - en na het terughalen beide weer aanwezig
  zijn.

### Deel E - een stash die niet zomaar terug wil

Schrijf een apart script `stash-conflict.sh`.

- **Doel:** zorg dat het terughalen van een stash een conflict oplevert met
  wat er inmiddels in je working tree staat, en los dat conflict op zonder
  iets van beide kanten kwijt te raken.
- **Klaar wanneer:** het conflict is opgelost, de inhoud van zowel de
  teruggehaalde stash als de wijziging die er al was, is terug te vinden in
  het eindresultaat, en de stash-lijst bevat geen rommel meer die daar niet
  hoort.

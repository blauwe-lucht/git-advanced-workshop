# Oefening 020 - Wijzigingen in working tree en staging area ongedaan maken met `git restore`

## Doel

Je bent aan het werk en niet alles wat je wijzigt is een goed idee. Soms wil
je één bestand terugzetten naar hoe het in de laatste commit stond, soms heb
je met `git add .` iets in de staging area gezet dat daar niet hoort.
`git reset` (017-019) werkt op commits en neemt de hele branch mee;
`git restore` werkt **per bestand** en laat je commits met rust.

Denk aan de drie versies uit oefening 002: `restore` kopieert een versie één
stap terug naar links, tegen de richting van `git add` en `git commit` in:

```text
working tree  <--git restore--  staging area  <--git restore --staged--  HEAD
```

| Commando | Zet terug | Haalt de versie uit |
| --- | --- | --- |
| `git restore <bestand>` | working tree | staging area |
| `git restore --staged <bestand>` | staging area | HEAD |
| `git restore --staged --worktree <bestand>` | beide | HEAD |

Let goed op de eerste regel: een kale `git restore` haalt de versie uit de
**staging area**, niet uit de laatste commit. Heb je niets gestaged, dan zijn
die twee gelijk en merk je het verschil niet.

Let op: `git status` stelt deze commando's zelf ook voor - kijk maar eens naar
de hints in de uitvoer.

## Basisoefening

Schrijf vanaf `template.sh` een script `restore.sh` (een gewone repo in
`repos/` volstaat) dat het volgende doet:

1. Maak op `main` een eerste commit met drie bestanden: `config.txt`, `app.sh`
   en `notes.txt`.
2. Wijzig `config.txt` en `app.sh`. Bekijk met `git status` en `git diff` beide
   wijzigingen.
3. De wijziging aan `config.txt` was een slecht idee. Zet alleen dat bestand
   terug met `git restore config.txt`; de wijziging aan `app.sh` moet blijven.
4. Maak een bestand `debug.log` aan en stage alles met `git add .`. Bekijk met
   `git status` dat ook `debug.log` in de staging area staat.
5. Haal `debug.log` weer uit de staging area met `git restore --staged
   debug.log`. Het bestand zelf moet blijven bestaan.
6. Wijzig `notes.txt`, stage het, en wijzig het daarna nog een keer. Gooi
   beide wijzigingen in één keer weg met `git restore --staged --worktree
   notes.txt`.
7. Bekijk met `git status`, `git diff --staged` en de inhoud van de bestanden
   het resultaat. Bekijk voor `app.sh` ook de drie versies met
   `git show HEAD:app.sh`, `git show :app.sh` en `cat app.sh`.

**Klaar wanneer:** `config.txt` en `notes.txt` hebben weer exact de inhoud van
de eerste commit, alleen `app.sh` staat nog (gestaged) gewijzigd, `debug.log`
bestaat nog maar staat als untracked bestand in `git status`, en
`git log --oneline` toont nog steeds alleen de eerste commit.

## Plus-oefeningen

Dit zijn **losstaande oefeningen**, geen opvolgende delen. Elke oefening is een
eigen scenario met een **eigen script** vanaf `template.sh`.

### Oefening P1 - per ongeluk verwijderd

Schrijf een script `restore-deleted-file.sh`.

- **Doel:** je hebt twee getrackte bestanden per ongeluk verwijderd: het ene
  met `rm`, het andere met `git rm`. Haal ze allebei terug, zonder een nieuwe
  commit te maken.
- **Klaar wanneer:** beide bestanden bestaan weer met hun oorspronkelijke
  inhoud, `git status` toont een schone working tree, en `git log --oneline`
  is niet veranderd.

### Oefening P2 - alles in één keer weggooien

Schrijf een script `restore-everything.sh`.

- **Doel:** je hebt wijzigingen in meerdere bestanden, een deel gestaged, een
  deel niet, en daarnaast een compleet nieuw bestand. Gooi in één keer alle
  wijzigingen aan getrackte bestanden weg, zonder elk bestand apart te
  noemen.
- **Klaar wanneer:** alle getrackte bestanden hebben weer de inhoud van de
  laatste commit, en je kunt uitleggen waarom het nieuwe bestand er nog steeds
  is.

### Oefening P3 - de helft van een bestand terugzetten

Schrijf een script `restore-partial.sh`.

- **Doel:** je hebt in één bestand twee losstaande wijzigingen gedaan, ver uit
  elkaar. De ene is goed, de andere wil je kwijt. Gooi alleen die ene
  wijziging weg, zonder het bestand met de hand te bewerken. Deze stap is
  interactief; zet hem aan het **eind** van je script, hooguit gevolgd door
  `git diff`.
- **Klaar wanneer:** `git diff` toont alleen nog de wijziging die je wilde
  houden.

### Oefening P4 - weg is weg?

Schrijf een script `restore-irreversible.sh`.

- **Doel:** in oefening 009 en 019 zag je dat een commit die je met
  `reset --hard` weggooit nog terug te vinden is. Laat zien dat dat voor een
  wijziging die je met `git restore` weggooit (en die nooit gecommit is) niet
  geldt.
- **Klaar wanneer:** je script laat een commit zien die na `reset --hard` nog
  in de reflog staat, en een met `restore` weggegooide wijziging die nergens
  meer terug te vinden is.
- **Extra pittig:** had je de wijziging vóór het weggooien wél een keer
  gestaged, dan is hij er nog, ergens in `.git`. Haal hem terug. Hiervoor heb
  je een commando nodig dat in deze workshop niet aan bod komt - zoek het zelf
  uit.

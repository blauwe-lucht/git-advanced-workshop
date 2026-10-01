# Oefening 021 - Een bestand uit een andere branch of commit halen met `git restore --source`

## Doel

Een collega heeft op een feature-branch `config.txt` verbeterd. Die branch is
nog lang niet af, maar jij hebt die ene verbeterde `config.txt` nu al nodig
op `main`. Mergen haalt de hele branch binnen, inclusief het onafgemaakte
werk. Met `git restore --source=<branch of commit> <bestand>` haal je precies
één bestand op uit een andere branch of commit, en de rest blijft buiten
schot.

## Basisoefening

Schrijf vanaf `template.sh` een script `restore-source.sh` (een gewone repo in
`repos/` volstaat) dat het volgende doet:

1. Maak op `main` een eerste commit met `config.txt` en `app.sh`.
2. Maak een `feature`-branch. Verbeter daar `config.txt` en commit.
3. Wijzig op `feature` daarna ook `app.sh` (onafgemaakt werk) en commit.
4. Ga terug naar `main` en haal met `git restore --source=feature config.txt`
   alleen `config.txt` van `feature` op.
5. Bekijk met `git status` dat `config.txt` als gewijzigd, maar **niet**
   gestaged bestand op `main` staat: zonder `--staged` schrijft `restore`
   alleen naar de working tree. Commit het daarna.
6. Bekijk met `git log --oneline --graph --all` en de inhoud van beide
   bestanden het resultaat.

**Klaar wanneer:** `config.txt` op `main` heeft de verbeterde inhoud van
`feature`, `app.sh` op `main` is niet veranderd, en de graph laat zien dat
`main` en `feature` niet gemerged zijn.

## Plus-oefeningen

Dit zijn **losstaande oefeningen**, geen opvolgende delen. Elke oefening is een
eigen scenario met een **eigen script** vanaf `template.sh`.

### Oefening P1 - één bestand terug in de tijd

Schrijf een script `restore-source-older-commit.sh`.

- **Doel:** een collega heeft in één commit `prices.txt` kapotgemaakt en
  `readme.txt` verbeterd. Pas twee commits later valt het op. Zet alleen
  `prices.txt` terug naar hoe het vóór die commit was, zonder de goede
  wijziging aan `readme.txt` kwijt te raken. Waarom is `git revert` (005) hier
  niet de goede keus?
- **Klaar wanneer:** `prices.txt` heeft weer de oude, goede inhoud,
  `readme.txt` heeft nog de verbeterde inhoud, en het herstel staat als nieuwe
  commit bovenop de geschiedenis.

### Oefening P2 - te veel in je laatste commit

Schrijf een script `restore-source-amend.sh`.

- **Doel:** je hebt met `git commit -am` een commit gemaakt, en daarbij is ook
  een lokale wijziging aan `config.txt` meegegaan die er niet in hoort. Haal
  `config.txt` uit die laatste commit, maar houd je wijziging aan
  `config.txt` in je working tree.
- **Klaar wanneer:** `git show --stat HEAD` toont `config.txt` niet meer, er
  is geen extra commit bijgekomen, en `git diff` toont je wijziging aan
  `config.txt` nog.

### Oefening P3 - één bestand uit een weggegooide commit

Schrijf een script `restore-source-reflog.sh`.

- **Doel:** in één commit staan een mislukt experiment én goede wijzigingen
  aan `notes.txt`. Je gooit te enthousiast de hele commit weg met
  `reset --hard`. Haal alleen `notes.txt` uit die weggegooide commit terug,
  zonder je branch terug te zetten naar die commit.
- **Klaar wanneer:** `notes.txt` heeft de goede inhoud uit de weggegooide
  commit en is opnieuw gecommit, het experiment-bestand is nergens in je
  working tree, en de weggegooide commit staat niet op je branch.

# Oefening 001 — Committen & samenwerken via branches

## Doel

Je oefent een PR/MR-achtige workflow: op een
feature-branch werken en die mergen naar `main`, dus zonder ooit direct op
`main` te committen.

## Basisoefening

Schrijf vanaf `template.sh` een script `feature-branch.sh` dat het volgende doet:

1. Initialiseer een gewone repo in `repos/` (geen remote nodig).
2. Maak een `README.md` met één regel tekst, stage en commit met een duidelijke
   boodschap.
3. Maak een branch `feature/begroeting`, voeg daar `begroet.txt` toe met een
   regel tekst en commit.
4. Ga terug naar `main` en voeg de feature-branch samen met `--no-ff`, zodat er
   bewust een merge-commit ontstaat.
5. Toon de historie als graph.

**Klaar wanneer:** `git log --oneline --graph --all` een merge-commit toont waar
`feature/begroeting` weer op `main` samenkomt.

## Plus-oefening — twee "personen", één remote

Simuleer Alice én Bob die via één gedeelde remote samenwerken. Je hebt geen
server nodig: een lokale *bare* repo is je remote. Schrijf hiervoor een apart
script `collaborate.sh`, vanaf `template.sh`. Zoek zelf uit welke commando's je
nodig hebt.

### Deel A — de gedeelde remote opzetten

- **Doel:** een werkende remote met twee losse clones, Alice en Bob.
- Laat Alice een eerste commit op `main` plaatsen en delen via de remote.
- **Klaar wanneer:** Bob die commit in zijn eigen clone binnenhaalt.

### Deel B — parallel werken

- **Doel:** twee features netjes op `main` krijgen.
- Bob maakt een eigen feature-branch, commit, deelt die en voegt hem via een
  merge-commit samen naar `main`; daarna deelt hij `main`.
- Alice doet vervolgens hetzelfde met haar eigen feature-branch, maar zorgt dat
  ze eerst de laatste `main` ophaalt, zodat haar werk bovenop dat van Bob komt.
- **Klaar wanneer:** beide features op `main` staan en de remote up-to-date is.

### Deel C — synchroon eindigen & verklaren

- **Doel:** begrijpen waarom dit conflictvrij ging.
- Zorg dat beide clones synchroon eindigen en toon in allebei de historie als
  graph.
- **Klaar wanneer:** Alice en Bob exact dezelfde graph zien. Leg in een
  commentaarregel in je script uit waarom Alice géén conflict kreeg.

# Oefening 003 — Tijdreizen met `git switch --detach`

## Doel

Je leert veilig terugreizen naar een oudere commit met `git switch --detach`,
zonder dat dit een branch beïnvloedt, en hoe je daar weer veilig vandaan komt.

## Basisoefening

Schrijf vanaf `template.sh` een script `time-travel.sh` (een gewone repo in
`repos/` volstaat, een remote heb je niet nodig).

1. Maak op `main` een reeks van drie commits, elk met een duidelijk zichtbare
   wijziging in hetzelfde bestand (bijvoorbeeld oplopende versienummers).
   Bekijk met `git log --oneline` de huidige commit historie.
2. Reis terug met `git switch --detach HEAD~2` naar de commit van twee stappen
   terug.
3. Bekijk met `git status` dat Git waarschuwt dat je "HEAD detached" bent, en
   bekijk de inhoud van het bestand om te zien dat je echt op dat oudere punt
   in de geschiedenis zit.
4. Ga terug naar `main` (`git switch main`) en bevestig met `git log
   --oneline` dat `main` weer steeds naar exact dezelfde commit wijst als in
   stap 2.

**Klaar wanneer:** er is gedurende de hele oefening geen enkele commit
bijgekomen of verplaatst, `main` wijst aan het eind naar precies dezelfde
commit als vóór het tijdreizen, en `git status` toonde tijdens het tijdreizen
duidelijk een "HEAD detached at ..."-melding.

## Plus-oefening — heen en weer springen door de geschiedenis

Schrijf een apart script `time-travel-back-and-forth.sh` vanaf `template.sh`.

- **Doel:** maak vier commits na elkaar. Spring daarna vlak na elkaar naar de
  commit van twee terug, dan naar de commit van drie terug, dan naar de
  commit van één terug, en tot slot terug naar `main`. Bekijk bij elke sprong
  de inhoud van het bestand om te controleren dat je steeds op de juiste
  plek in de geschiedenis zit.
- **Klaar wanneer:** je bij elke tussenstap de inhoud zag die bij die commit
  hoort, en `main` staat aan het eind weer op de laatste (vierde) commit,
  ongewijzigd.

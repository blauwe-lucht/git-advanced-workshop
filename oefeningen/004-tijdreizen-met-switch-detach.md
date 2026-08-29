# Oefening 004 — Tijdreizen met `git switch --detach`

## Doel

Je leert `git switch --detach` gebruiken om uit te zoeken of een oudere versie
van je code daadwerkelijk werkte - niet door de inhoud te bekijken, maar door
hem echt te draaien - en hoe je daar weer veilig vandaan komt.

## Basisoefening

Schrijf vanaf `template.sh` een script `time-travel.sh` (een gewone repo in
`repos/` volstaat, een remote heb je niet nodig).

1. Schrijf een bash-script `greet.sh` dat bij het draaien met `bash greet.sh
   Alice` de tekst "Hello, Alice!" print. Commit dit (commit 1: v1).
2. Wijzig `greet.sh` met een subtiele bug, zodat `bash greet.sh Alice` niet
   meer werkt - het script geeft een error. Blijkbaar
   is het zonder te testen bij een klant beland.
   Commit dit (commit 2: v2).
3. Herstel de bug weer en commit (commit 3: v3).
4. Een klant belt: "jullie script v2 werkt niet meer".
5. Reis met `git switch --detach`
   terug naar commit 2 en draai `bash greet.sh Alice` om te controleren of
   het toen werkte.
6. Bekijk met `git status` dat Git waarschuwt dat je "HEAD detached" bent, en
   bekijk de inhoud van het bestand om te zien dat je echt op dat oudere punt
   in de geschiedenis zit.
7. Ga terug naar `main` (`git switch main`) en bevestig met `git log
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

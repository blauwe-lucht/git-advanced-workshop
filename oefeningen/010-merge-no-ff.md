# Oefening 010 — Een merge-commit afdwingen met `--no-ff`

## Doel

In de vorige oefening zag je dat met een fast-foward merge een `feature`-branch
stilletjes
opgaat in `main` zonder sporen achter te laten. Soms wil je dat juist niet:
je wilt in de historie kunnen zien waar een feature is geland, ook al was
een fast-forward mogelijk. Dat forceer je met `git merge --no-ff`.

## Basisoefening

Schrijf vanaf `template.sh` een script `merge-no-ff.sh` (een gewone repo in
`repos/` volstaat) dat het volgende doet:

1. Maak op `main` een eerste commit.
2. Maak een `feature`-branch en voeg daar twee commits toe.
3. Ga terug naar `main` - die is, net als in de vorige oefening, niet
   veranderd, dus een fast-forward zou hier gewoon kunnen.
4. Merge `feature` in `main` met `git merge --no-ff feature`.
5. Bekijk met `git log --oneline --graph --all` dat er, in tegenstelling tot
   de vorige oefening, wél een merge-commit is bijgekomen met twee parents.

**Klaar wanneer:** `main` bevat het werk van `feature`, en er staat een
expliciete merge-commit in de historie (zichtbaar als vertakking in
`git log --oneline --graph`), ook al was een fast-forward mogelijk geweest.

## Plus-oefening — een hele feature in één keer terugdraaien

Schrijf een apart script `merge-no-ff-terugdraaien.sh` vanaf `template.sh`.

- **Doel:** bouw dezelfde situatie op als in de basisoefening. Blijkt na de
  merge dat de hele feature toch niet gewenst is - draai `main` met één
  commando terug naar de staat van vóór de merge, zonder de commits van
  `feature` zelf aan te tasten.
- **Klaar wanneer:** geen van de bestanden of wijzigingen uit `feature` is nog
  aanwezig op `main`, er is precies één nieuwe commit bijgekomen die dat
  regelt, `feature` zelf is ongewijzigd, en er is niets uit de historie
  verdwenen of herschreven.

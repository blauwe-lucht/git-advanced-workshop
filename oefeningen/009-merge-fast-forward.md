# Oefening 009 — Mergen naar een branch zonder nieuwe commits (fast-forward)

## Doel

Als `main` sinds het afsplitsen van je
branch helemaal niet is veranderd, is een merge geen echte merge: Git
verzet gewoon de branch-pointer. Er komt geen merge-commit bij en de
historie blijft lineair. Dit heet *fast forward*.

## Basisoefening

Schrijf vanaf `template.sh` een script `merge-fast-forward.sh` (een gewone
repo in `repos/` volstaat) dat het volgende doet:

1. Maak op `main` een eerste commit.
2. Maak een `feature`-branch en voeg daar twee commits toe.
3. Ga terug naar `main` - die is intussen niet veranderd.
4. Merge `feature` in `main` met `git merge feature`.
5. Bekijk met `git log --oneline --graph --all` dat er geen merge-commit is
   bijgekomen: de historie is precies zo lineair als die van `feature` zelf
   was.

**Klaar wanneer:** `main` bevat na de merge exact dezelfde twee commits als
`feature`, er is geen nieuwe merge-commit bijgekomen, en `git log --oneline`
toont een rechte lijn zonder vertakking.

## Plus-oefening — als fast-forward niet meer kan

Schrijf een apart script `merge-fast-forward-mislukt.sh` vanaf `template.sh`.

- **Doel:** bouw dezelfde situatie op als in de basisoefening, maar laat
  `main` op het laatste moment tóch nog een eigen commit krijgen, vlak voordat
  je de merge uitvoert. Gebruik `--ff-only` om een fast forward merge te
  forceren en zorg dat je script laat zien dat Git de merge weigert.
  Los het daarna alsnog netjes op zodat `feature` volledig in `main`
  terechtkomt.
- **Klaar wanneer:** de `--ff-only`-poging is aantoonbaar mislukt,
  en `main` bevat daarna alsnog al het werk van zowel zijn eigen
  laatste commit als van `feature`.

# Oefening 009 — Rebase: een branch bijwerken op `main`

## Doel

Je leert een feature-branch bijwerken op een intussen veranderde `main` met
`git rebase`, inclusief het oplossen van een conflict dat daarbij ontstaat.

## Basisoefening

Schrijf vanaf `template.sh` een script `rebase-bijwerken.sh` (een gewone repo
in `repos/` volstaat) dat het volgende doet:

1. Maak op `main` een eerste commit met bestand A.
2. Maak een feature-branch vanaf `main` en voeg daar een commit toe die een
   regel in bestand A wijzigt.
3. Ga terug naar `main` en voeg daar een commit toe die **dezelfde regel** in
   bestand A anders wijzigt — dit simuleert een collega die intussen `main`
   heeft bijgewerkt.
4. Bekijk met `git log --oneline --graph --all` dat `main` en de
   feature-branch uit elkaar zijn gaan lopen.
5. Ga naar de feature-branch en start `git rebase main`.

Het conflict dat hierdoor ontstaat, los je met de hand op: bekijk het
conflict, kies de juiste inhoud, en rond de rebase af.

**Klaar wanneer:** `git log --oneline --graph` een lineaire historie toont
met de feature-commit bovenop de nieuwste `main`-commit, het conflict is
opgelost met de juiste inhoud, en `git status` geen lopende rebase meer
toont.

## Plus-oefening — meer dan één conflict tegelijk

Elk deel is een **eigen script** dat je vanaf `template.sh` schrijft. Zodra
een deel interactie vereist (conflict oplossen, kiezen tussen opties), staat
die aan het **eind** van het script, hooguit gevolgd door een
statuscommando (`git status`, `git log`).

### Deel A — twee conflicten na elkaar

Schrijf een apart script `rebase-meerdere-conflicten.sh`.

- **Doel:** de feature-branch heeft twee commits die allebei conflicteren met
  wijzigingen die intussen op `main` zijn beland. Los beide conflicten op
  binnen één rebase.
- **Klaar wanneer:** de rebase is volledig afgerond, beide conflicten zijn
  correct opgelost, en `git status` toont geen lopende rebase meer.

### Deel B — een commit die overbodig wordt

Schrijf een apart script `rebase-lege-commit.sh`.

- **Doel:** na het oplossen van een conflict blijkt een van de latere
  feature-commits niets meer toe te voegen — `main` bevat die wijziging
  inmiddels al. Zorg dat de rebase hier overheen komt zonder een lege,
  zinloze commit in de resulterende historie achter te laten.
- **Klaar wanneer:** de resulterende historie bevat geen lege of overbodige
  commit, de overige commits zijn intact, en er is geen lopende rebase meer.

### Deel C — toch maar opnieuw beginnen

Schrijf een apart script `rebase-opnieuw-beginnen.sh`.

- **Doel:** halverwege een rebase met een conflict besluit je dat je liever
  opnieuw begint. Zorg dat je volledig terugkomt op de situatie van vóór de
  rebase, zonder iets van je feature-commits kwijt te raken — en rond de
  rebase daarna alsnog af.
- **Klaar wanneer:** je hebt op enig moment weer de originele feature-branch
  met alle oorspronkelijke commits gehad, en aan het eind is de rebase
  volledig afgerond zonder lopende rebase-status.

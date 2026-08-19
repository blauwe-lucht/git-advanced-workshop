# Oefening 002 — Commits repareren met `--amend`

## Doel

Je leert de laatste commit repareren zonder een rommelige "fix typo"-commit:
een boodschap corrigeren, een vergeten bestand alsnog meenemen, en een per
ongeluk toegevoegd bestand er weer uit halen.

## Basisoefening

Schrijf vanaf `template.sh` een script `amend.sh` (een gewone repo in `repos/`
volstaat) dat drie amend-scenario's laat zien:

1. **Boodschap fixen:** maak een commit met een tikfout in de boodschap en
   corrigeer die met `git commit --amend`.
2. **Vergeten bestand:** maak een commit, ontdek dat een bestand ontbrak, stage
   het alsnog en vouw het in de vorige commit met `--amend`.
3. **Per ongeluk toegevoegd bestand:** maak een commit met een bestand dat er
   niet in hoort, haal het uit de commit en amend.

**Klaar wanneer:** `git log --oneline` in alle drie de gevallen nog steeds maar
één relevante commit toont (geen losse "fix"-commit) en `git show` de juiste
inhoud laat zien.

## Plus-oefening — een commit vóór de laatste repareren

`--amend` werkt alleen op de *laatste* commit. Voor een oudere commit heb je een
andere aanpak nodig. Schrijf een apart script `amend-commit-before-last.sh` en
zoek zelf uit hoe je dit voor elkaar krijgt - zonder `git rebase`, `git reset`
of `git cherry-pick` te gebruiken. Je hebt tot nu toe alleen branches,
`checkout` en `commit` nodig.

### Deel A — de historie opzetten

- **Doel:** een reeks van minstens drie commits waarin de *middelste* een
  tikfout in de boodschap heeft.
- **Klaar wanneer:** de historie je drie commits toont met de fout in het midden.

### Deel B — de foute commit isoleren

- **Doel:** Git zover krijgen dat je precies die middelste commit kunt bewerken,
  zonder de commits die erna komen kwijt te raken.
- **Klaar wanneer:** je in een toestand zit waarin je uitsluitend die ene commit
  aan het bewerken bent.

### Deel C — repareren en de historie weer heel maken

- **Doel:** de boodschap corrigeren en de bewerking afronden.
- **Klaar wanneer:** de historie de gecorrigeerde boodschap toont, de overige
  commits ongewijzigd zijn, en je de originele (foute) commit nog kunt
  terugvinden als vangnet.

### Deel D (uitdaging) — inhoud in plaats van boodschap

- **Doel:** herhaal Deel B/C, maar wijzig nu de *inhoud* van de middelste commit
  in plaats van alleen de boodschap.
- **Klaar wanneer:** die commit de nieuwe inhoud bevat, zonder dat er een extra
  commit is bijgekomen.

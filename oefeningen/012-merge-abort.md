# Oefening 012 — Een merge afbreken met `git merge --abort`

## Doel

Soms merk je halverwege een merge dat het toch gaat zoals je wilde:
onverwachte conflicten, de conflicten zijn groter dan verwacht, of
het blijkt de verkeerde branch te
zijn. Je leert hoe je zo'n merge volledig terugdraait en weer terugkomt op de
staat van vóór de merge, zonder zelf iets te hoeven opruimen.

## Basisoefening

Schrijf vanaf `template.sh` een script `merge-abort.sh` (een gewone repo in
`repos/` volstaat) dat het volgende doet:

1. Maak op `main` een eerste commit met een bestand.
2. Maak een `feature`-branch en wijzig daar dezelfde regel in dat bestand.
3. Ga terug naar `main` en wijzig daar diezelfde regel in iets anders
   (we willen een conflict genereren).
4. Start `git merge feature` - dit levert een conflict op.
5. Bekijk met `git status` dat je middenin een merge zit.
6. Breek de merge volledig af met `git merge --abort`.
7. Bekijk met `git status` en de inhoud van het bestand dat je weer precies
   op de staat van vóór de merge zit.

**Klaar wanneer:** na het afbreken toont `git status` een schone working
tree zonder lopende merge, en het bestand bevat weer exact de inhoud die
`main` had vóór stap 4 - niets van het conflict of van `feature` is
achtergebleven.

## Plus-oefening — te laat beseffen dat de merge fout was

`git merge --abort` werkt alleen zolang je nog middenin de merge zit. Deze
Plus-oefening gaat over het moment dat je dat te laat beseft: de merge is al
helemaal afgerond, inclusief commit, en pas dan zie je dat het toch de
verkeerde keuze was. Schrijf één script `merge-abort-revert.sh` vanaf
`template.sh` dat je in de volgende delen uitbreidt.

### Deel A — de merge dit keer wél afronden

Bouw dezelfde situatie op als in de basisoefening (conflict tussen `main` en
`feature`), maar breek de merge deze keer niet af: los het conflict op en
rond de merge volledig af met een commit.

**Klaar wanneer:** `git log --oneline --graph --all` toont een afgeronde
merge-commit met twee ouders, en `git status` is schoon.

### Deel B — proberen terug te draaien

Bedenk je dat de merge er toch niet had moeten komen. Probeer de merge-commit
op dezelfde manier ongedaan te maken als je een gewone commit zou
terugdraaien. Dat lukt niet zomaar - bekijk de foutmelding goed en begrijp
waarom een merge-commit iets anders nodig heeft dan een gewone commit.

**Klaar wanneer:** je hebt de foutmelding gezien en kunt uitleggen waarom
deze aanpak hier niet vanzelf werkt.

### Deel C — de merge netjes terugdraaien

Draai de merge-commit nu wel op de juiste manier terug, zonder de geschiedenis
te herschrijven (dus geen `reset`).

**Klaar wanneer:** het bestand bevat weer exact de inhoud van vóór de merge,
`git status` is schoon, en de oorspronkelijke merge-commit is nog gewoon
zichtbaar in `git log --oneline --graph --all` - hij is niet verwijderd, maar
teruggedraaid met een nieuwe commit erbovenop.

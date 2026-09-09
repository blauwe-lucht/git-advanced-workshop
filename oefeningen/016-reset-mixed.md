# Oefening 016 — Een te vroege commit terugdraaien met `git reset --mixed`

## Doel

Je hebt met `git add .` in één keer alles gestaged en gecommit, maar daar zat
ook een bestand tussen dat helemaal niet klaar was om gecommit te worden (een
lokaal debug- of instellingenbestand bijvoorbeeld). `git reset --mixed`
(de standaardvorm van `reset`) verplaatst de branch-pointer terug én haalt
alles uit de staging area, maar laat de wijzigingen gewoon in je working tree staan
zodat je opnieuw kunt kiezen wat je wel en niet commit.

## Basisoefening

Schrijf vanaf `template.sh` een script `reset-mixed.sh` (een gewone repo in
`repos/` volstaat) dat het volgende doet:

1. Maak op `main` een eerste commit met een bestand `app.txt`.
2. Wijzig `app.txt` en maak daarnaast een nieuw bestand `debug.txt` aan dat
   je eigenlijk niet wilde committen.
3. Voeg beide bestanden in één keer toe met `git add .` en commit ze samen.
4. Bekijk met `git show --stat` dat de commit per ongeluk beide bestanden
   bevat.
5. Gebruik `git reset --mixed HEAD~1` (of gewoon `git reset HEAD~1`, dat is
   de standaardvorm) om de laatste commit ongedaan te maken.
6. Bekijk met `git status` dat beide bestanden weer als wijzigingen in de
   working tree staan, niet meer gestaged en niet meer gecommit.
7. Commit nu alleen `app.txt` opnieuw.

**Klaar wanneer:** `git log --oneline` toont één commit minder dan na stap 3,
die nieuwe commit bevat alleen `app.txt`, en `debug.txt` staat nog gewoon
(untracked) in de working tree.

## Plus-oefening — de rest nog even bijschaven

Schrijf één script `reset-mixed-expand.sh` vanaf `template.sh` dat je in
de volgende delen uitbreidt.

### Deel A — dezelfde situatie, maar met drie bestanden

Bouw een vergelijkbare situatie op als in de basisoefening, maar nu met drie
bestanden in één (te vroege) commit: twee die je uiteindelijk wél wilt
committen, en één die je er voorlopig buiten wilt houden. Draai de commit
terug en commit alleen de twee bestanden die je wilt bewaren.

**Klaar wanneer:** de nieuwe commit bevat precies de twee gewenste bestanden,
en het derde bestand staat nog steeds ongecommit in de working tree.

### Deel B — nog een correctie voordat je opnieuw commit

Na het terugdraaien in Deel A merk je dat een van de twee bestanden die je
wilt bewaren, ook nog een kleine fout bevat. Omdat de wijzigingen nu gewoon
in je working tree staan, kun je dat rechtstreeks repareren voordat je
opnieuw commit.

**Klaar wanneer:** de uiteindelijke commit bevat de gerepareerde inhoud van
beide bestanden, en het derde bestand is nog altijd niet meegenomen.

# Oefening 020 — Eén commit opsplitsen in twee

## Doel

Je leert een commit die eigenlijk twee losse, onafhankelijke wijzigingen
bevat, tijdens een interactive rebase op te splitsen in twee nette commits —
het omgekeerde van squashen.

## Basisoefening

Schrijf vanaf `template.sh` een script `interactive-rebase-splitsen.sh` (een
gewone repo in `repos/` volstaat) dat het volgende doet:

1. Maak een eerste commit.
2. Maak een tweede commit die twee onafhankelijke bestanden tegelijk
   wijzigt — die had eigenlijk twee aparte commits moeten zijn.
3. Maak een derde commit.
4. Bekijk de historie met `git log --oneline`.
5. Start `git rebase -i HEAD~3` en zet in de todo-lijst uitsluitend die
   tweede commit op `edit`, de rest op `pick`.

De rest is handwerk: Git stopt bij die commit. Maak de commit ongedaan tot
vlak ervóór (de wijzigingen blijven staan), en commit de twee bestanden apart
als twee nieuwe commits. Laat de rebase daarna verdergaan.

**Klaar wanneer:** waar eerst één commit stond, staan nu twee commits — elk
met één van de twee bestanden — de oorspronkelijk derde commit is
ongewijzigd, en `git status` toont geen lopende rebase meer.

## Plus-oefening — lastiger splitsen

Elk deel is een **eigen script** dat je vanaf `template.sh` schrijft. Een
interactive rebase is interactief, dus elk script eindigt op hooguit één
`rebase -i` (evt. gevolgd door een statuscommando).

### Deel A — opsplitsen binnen één bestand

Schrijf een apart script `interactive-rebase-splitsen-binnen-bestand.sh`.

- **Doel:** de te splitsen commit wijzigt maar één bestand, maar bevat
  inhoudelijk twee losse wijzigingen (bijv. twee functies). Splits die toch
  in twee commits.
- **Klaar wanneer:** er zijn twee commits, elk met precies één van de twee
  wijzigingen, en samen bevatten ze exact dezelfde eindinhoud als het
  origineel.

### Deel B — drie stukken

Schrijf een apart script `interactive-rebase-splitsen-drie.sh`.

- **Doel:** splits een commit met drie losse wijzigingen erin, in drie
  aparte commits in plaats van twee.
- **Klaar wanneer:** er zijn drie commits, elk met een duidelijk eigen stukje
  van de oorspronkelijke wijziging, en samen leveren ze weer exact de
  oorspronkelijke inhoud op.

### Deel C — splitsen met een addertje

Schrijf een apart script `interactive-rebase-splitsen-addertje.sh`.

- **Doel:** de commit die je splitst wordt gevolgd door een latere commit die
  één van de twee losse wijzigingen verder bewerkt. Splits de oudere commit
  alsnog, zonder dat er onderweg iets misgaat.
- **Klaar wanneer:** de opsplitsing is gelukt, de latere commit bevat nog
  steeds zijn eigen wijziging bovenop het juiste deel, en er is geen lopende
  rebase meer.

# Oefening 017 — Een mislukt experiment weggooien met `git reset --hard`

## Doel

Je bent lokaal aan het experimenteren: je hebt al één commit gemaakt voor de
eerste stap, en daarna nog het een en ander gewijzigd zonder te committen
voor de tweede stap. Dan besef je dat de hele aanpak niet klopt, zowel de
laatste commit als alles dat daarna kwam mag weg. `git reset --hard` is de
enige van de drie vormen die zowel de staging area als de working tree meeneemt:
in één klap ben je terug bij een schone, bekende staat.

## Basisoefening

Schrijf vanaf `template.sh` een script `reset-hard.sh` (een gewone repo in
`repos/` volstaat) dat het volgende doet:

1. Maak op `main` een eerste commit met een bestand `feature.txt`.
2. Maak een tweede commit die `feature.txt` wijzigt (dit is "stap 1" van je
   experiment).
3. Wijzig `feature.txt` nogmaals, maar commit dit keer niets (dit is "stap 2",
   nog in de working tree).
4. Bekijk met `git status` en `git diff` dat je zowel een extra commit als
   ongecommitte wijzigingen hebt.
5. Gebruik `git reset --hard HEAD~1` om in één keer terug te gaan tot de eerste
   commit, zowel de tweede commit als de ongecommitte wijziging moeten
   verdwijnen.
6. Bekijk met `git log --oneline`, `git status` en de inhoud van
   `feature.txt` dat je weer precies in de situatie van de eerste commit zit.

**Klaar wanneer:** `git log --oneline` toont alleen de eerste commit nog,
`git status` toont een schone working tree, en `feature.txt` bevat weer
exact de inhoud van die eerste commit.

## Plus-oefening — te enthousiastig gereset

`git reset --hard` is onomkeerbaar via de gewone git-commando's die je tot
nu toe hebt gebruikt, maar de commits zelf zijn niet meteen weg.

Schrijf één script `reset-hard-redden.sh` vanaf `template.sh` dat je in de
volgende delen uitbreidt.

### Deel A — een commit die je eigenlijk nog nodig had

Bouw een reeks van minstens drie commits op. Reset daarna met `--hard` te
ver terug, zodat je per ongeluk ook een commit weggooit die je eigenlijk nog
nodig had.

**Klaar wanneer:** `git log --oneline` toont dat de laatste, nog benodigde
commit niet meer op de branch staat.

### Deel B — de weggegooide commit terugvinden en herstellen

Zoek de weggegooide commit op en zorg dat je branch er weer op wijst, zonder
dat je die commit opnieuw met de hand hoeft te maken.

**Klaar wanneer:** `git log --oneline` toont de eerder verdwenen commit weer
gewoon als laatste commit op de branch, en de inhoud van het bijbehorende
bestand klopt weer.

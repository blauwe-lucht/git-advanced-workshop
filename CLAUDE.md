# Context voor wie aan de demo-scripts werkt

Deze root bevat de **demo-scripts** (de `.sh`-bestanden) die tijdens de workshop
gedraaid worden om een git-scenario te laten zien, en die als voorbeeldoplossing
dienen voor de oefeningen in [`oefeningen/`](oefeningen/CLAUDE.md).

## Scriptconventies

- Elk script is zelfstandig: `set -x` (of `set -xe`/`set -xeuo pipefail`) staat
  bovenaan, en het script maakt een verse `repos/`-map from scratch aan.
- **Geen `#`-commentaarregels als sectiemarkering.** Gebruik in plaats daarvan
  `echo "##### omschrijving #####" > /dev/null` vlak vóór het stukje dat het
  beschrijft. Houd het compact, gebruik maar 1 regel.
  Zie [`stash.sh`](stash.sh) of [`collaborate.sh`](collaborate.sh) als
  voorbeeld.
- **Herkenbare commit-inhoud en -boodschappen.** Waar het voor het scenario
  zinvol is, laat zowel de bestandsinhoud als de commit-boodschap zien om
  welke commit het gaat, bijvoorbeeld `main commit 1`, `feature commit 1`.
  Zie [`cherrypick.sh`](cherrypick.sh) of [`merge-diverged.sh`](merge-diverged.sh)
  als voorbeeld.
- **Scripts zijn uitvoerbaar.** Zet `chmod u+x` op elk `.sh`-bestand.
- **Gebruik `git commit -am` waar mogelijk** om `git add` en `git commit` in
  één regel te combineren en het script compacter te houden. Dit werkt alleen
  voor wijzigingen aan bestanden die al getrackt zijn - de eerste keer dat een
  bestand wordt toegevoegd blijft dat gewoon `git add` gevolgd door
  `git commit`.
- **Alles in de demo-scripts is in het Engels** - bestandsinhoud,
  commit-boodschappen, de `echo "##### ... #####"`-omschrijvingen, én de
  bestandsnamen van de scripts zelf.
- **Gebruik `git switch` in plaats van `git checkout` waar van toepassing.**
  Voor het aanmaken/wisselen van branches (`git switch -c <branch>`,
  `git switch <branch>`) is `switch` het modernere en duidelijkere commando.
  `git checkout` blijft gebruikt voor wat `switch` niet dekt, zoals het
  terugzetten van bestanden (`git checkout -- <pad>`) of andere
  detached-HEAD/pad-specifieke scenario's.
- **Gebruik de term "staging area", niet "index".** Beide betekenen hetzelfde,
  maar "staging area" is de begrijpelijkere, gangbare term voor cursisten.
  Letterlijke commando's/flags die toevallig "index" heten (`git stash pop
  --index`, `git update-index`) blijven natuurlijk ongewijzigd - het gaat om
  de term in prose (comments, `echo`-omschrijvingen).

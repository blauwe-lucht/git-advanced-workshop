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
  Met `set -x` print Git de echo-opdracht zelf (dus de omschrijving
  is zichtbaar in de trace), terwijl `> /dev/null` voorkomt dat de tekst ook in
  de eigenlijke scriptoutput verschijnt. Een gewone `#`-comment wordt door
  `set -x` niet getoond en is daardoor onzichtbaar tijdens het afspelen van het
  script. Zie [`stash.sh`](stash.sh) of [`collaborate.sh`](collaborate.sh) als
  voorbeeld.

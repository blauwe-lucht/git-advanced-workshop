# Oefening 003 — Redden met de reflog

## Doel

Je leert dat "verloren" werk in Git bijna nooit echt weg is. Zolang een commit
ooit door `HEAD` is aangewezen, blijft hij terug te vinden via de reflog - ook
als je hem met `--amend` hebt overschreven of een branch hebt verwijderd. Zie
ook [`../GIT_BEST_PRACTICES.md`](../GIT_BEST_PRACTICES.md).

## Basisoefening

Schrijf vanaf `template.sh` een script `reflog.sh` (een gewone repo in
`repos/` volstaat, een remote heb je niet nodig).

1. Maak een commit waarin `file.txt` de tekst "versie A" bevat.
2. Wijzig `file.txt` naar "versie B" en vouw die wijziging in de laatste
   commit met `git commit --amend`. Draai `git log --oneline`: je ziet nog
   steeds maar één commit, nu met "versie B" erin.
3. Je ontdekt dat je eigenlijk "versie A" nog een keer nodig hebt. Draai
   `git reflog` en zie dat de oude commit daar in staat. Met
   `git show HEAD@{1}` kun je de inhoud van die commit bekijken.
4. Ga met `git switch --detach HEAD@{1}` naar die commit om te bevestigen dat
   `file.txt` daar inderdaad "versie A" bevat. Zet die inhoud even opzij
   buiten Git om (bijvoorbeeld door het bestand naar een tijdelijke plek te
   kopiëren), ga terug naar de main branch (`git switch -` brengt je terug naar
   waar je vandaan kwam), zet de bewaarde inhoud terug in `file.txt`, en leg
   dat vast als nieuwe commit.

**Klaar wanneer:** `file.txt` bevat weer "versie A", vastgelegd in een nieuwe
commit bovenop de bestaande historie - je hebt dus geen enkele bestaande
commit hoeven verplaatsen of overschrijven om "versie A" terug te krijgen.

## Plus-oefeningen — meer reddingsacties met de reflog

Dit zijn losstaande oefeningen, geen opvolgende delen. Elke oefening is een
**eigen script** dat je vanaf `template.sh` schrijft. Geen hints over de
benodigde git-commando's hieronder - zoek zelf uit hoe. Je hebt voor deze
oefeningen nog geen `reset`, `rebase` of `restore` nodig.

### Oefening P1 — een verwijderde branch terughalen

Schrijf een apart script `reflog-branch-terughalen.sh`.

- **Doel:** maak een branch met een paar eigen commits, verwijder die branch
  (geforceerd, zodat Git niet waarschuwt over niet-gemergde wijzigingen), en
  herstel daarna zowel de branch zelf als al zijn commits alsof er niets is
  gebeurd.
- **Klaar wanneer:** de branch bestaat weer onder dezelfde naam, wijst naar
  dezelfde laatste commit als vóór het verwijderen, en `git log --oneline` op
  die branch toont weer alle oorspronkelijke commits.

### Oefening P2 — de juiste reflog kiezen

Schrijf een apart script `reflog-juiste-reflog.sh`.

- **Doel:** `git reflog` toont standaard de geschiedenis van `HEAD`, maar elke
  branch heeft ook zijn eigen reflog. Zet een scenario op met twee branches
  waarin je op de ene branch een paar keer amendt, ondertussen naar de andere
  branch wisselt en daar ook iets doet, en dan terugwisselt. Zorg dat de
  algemene `git reflog` niet meer duidelijk genoeg is om de versie terug te
  vinden die je zoekt, en vind hem toch terug door specifiek naar de reflog
  van de juiste branch te kijken.
- **Klaar wanneer:** je de gezochte inhoud hebt teruggehaald op basis van een
  reflog die je expliciet aan één branch hebt gevraagd, niet aan `HEAD` in het
  algemeen.

### Oefening P3 — de commit die nergens meer naar wijst

Schrijf een apart script `reflog-dangling-commit.sh`.

- **Doel:** breng een commit tot stand die niet meer terug te vinden is via
  `HEAD@{n}` in je eigen reflog (bijvoorbeeld doordat je hem op een tijdelijke
  branch maakte en die branch daarna weer verwijderde, zonder dat commit ooit
  via `switch` je `HEAD` was op het moment van verwijderen). Vind die commit
  toch terug, met een andere aanpak dan gewoon je reflog-regels aflopen.
- **Klaar wanneer:** je de inhoud van die commit weer zichtbaar hebt gemaakt
  in je working tree (bijvoorbeeld via een nieuwe branch die ernaar wijst),
  puur op basis van wat er nog in de lokale `.git`-map aanwezig is.

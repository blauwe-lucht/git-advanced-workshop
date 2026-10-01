# Oefening 002 - Drie versies van een bestand

## Doel

Je hebt een bestand gewijzigd en `git add` gedaan, en daarna nog iets
aangepast. Wat komt er nu eigenlijk in je commit? Om dat (en straks ook
`amend`, `reset` en `restore`) echt te snappen, moet je weten dat Git van elk
getrackt bestand **drie versies** kan hebben:

```text
working tree        --git add-->   staging area   --git commit-->  HEAD
(bestanden op schijf)          (de volgende commit)           (de laatste commit)
```

- De **working tree** zijn de bestanden zoals ze nu op je schijf staan.
- De **staging area** is een **complete snapshot van de volgende commit**:
  álle getrackte bestanden, niet alleen de gewijzigde. `git add` overschrijft
  de versie van een bestand in die snapshot, `git commit` maakt van de hele
  snapshot een nieuwe commit.
- **HEAD** is de laatste commit.

`git status` laat niet de staging area zelf zien, maar alleen de **verschillen**:
"Changes to be committed" is staging area vs HEAD (`git diff --staged`),
"Changes not staged for commit" is working tree vs staging area  (`git diff`).
Na een verse commit zijn alle drie gelijk en zegt `git status` "nothing to
commit", maar de staging area is dan niet leeg.

In de documentatie en foutmeldingen van Git heet de staging area ook wel de
**index** of de **cache**. Het verwijst allemaal naar hetzelfde: het bestand
`.git/index`. Bij `git diff` zijn `--cached` en `--staged` daarom synoniemen.
Pas wel op: niet elke optie met "cache" of "stage" in de naam betekent
hetzelfde in elk commando - `git ls-files --stage` gaat bijvoorbeeld over
*stage-nummers* (zie stap 2), niet over "gestaged".

## Basisoefening

Schrijf vanaf `template.sh` een script `staging-area.sh` (een gewone repo in
`repos/` volstaat) dat het volgende doet:

1. Maak op `main` een eerste commit met twee bestanden: `hello.txt` met inhoud
   `version 1`, en `other.txt`.
2. Bekijk met `git status` dat er niets te committen is, en daarna met
   `git ls-files --stage` dat de staging area toch beide bestanden bevat. Je
   ziet per bestand de mode, de hash van de inhoud en een stage-nummer. Dat
   nummer is normaal `0`; alleen tijdens een merge conflict staan er per
   bestand meerdere versies met de nummers 1, 2 en 3 (dat komt pas terug in
   oefening 022).
3. Bekijk de versie van `hello.txt` in de laatste commit met
   `git show HEAD:hello.txt`, en die in de staging area met
   `git show :hello.txt`. Ze zijn gelijk.
4. Zet `version 2` in `hello.txt` en doe `git add hello.txt`.
5. Zet daarna `version 3` in `hello.txt`, zonder `git add`.
6. Bekijk alle drie de versies: `git show HEAD:hello.txt`,
   `git show :hello.txt` en `cat hello.txt`.
7. Bekijk met `git status` dat `hello.txt` in **beide** secties staat, en met
   `git diff --staged` en `git diff` welke twee verschillen dat zijn.
8. Commit met `git commit -m "..."` (zonder `-a`) en bekijk de drie versies
   opnieuw.

**Klaar wanneer:** na stap 6 zie je `version 1`, `version 2` en `version 3`,
en na stap 8 bevat de nieuwe commit `version 2` - niet `version 3`, want die
stond alleen in je working tree. Voorspel vóór elke `show`/`cat` wat je gaat
zien.

## Plus-oefeningen

Dit zijn **losstaande oefeningen**, geen opvolgende delen. Elke oefening is een
eigen scenario met een **eigen script** vanaf `template.sh`. Gebruik in elke
oefening de commando's uit de basisoefening om steeds te laten zien in welke
van de drie plekken een bestand staat.

### Oefening P1 - een nieuw bestand

Schrijf een script `staging-area-new-file.sh`.

- **Doel:** volg een nieuw bestand vanaf het moment dat je het aanmaakt tot
  het in een commit zit.
- **Klaar wanneer:** je script laat voor elk van de drie momenten (net
  aangemaakt, na `git add`, na `git commit`) zien in welke van de drie plekken
  het bestand wel en niet bestaat. Lees de foutmeldingen van Git goed: welk
  woord gebruikt Git voor de staging area?

### Oefening P2 - twee manieren van verwijderen

Schrijf een script `staging-area-delete.sh`.

- **Doel:** verwijder één getrackt bestand alleen van je schijf, en een ander
  getrackt bestand zo dat het ook uit de volgende commit verdwijnt. Commit
  daarna.
- **Klaar wanneer:** je script laat zien dat het eerste bestand na het
  verwijderen nog in de staging area staat en daardoor ook nog in de nieuwe
  commit zit, en dat het tweede bestand uit de staging area én uit de nieuwe
  commit verdwenen is.

### Oefening P3 - een gedeelte van een bestand stagen

Schrijf een script `staging-area-partial.sh`.

- **Doel:** je hebt in één bestand twee losstaande wijzigingen gedaan, ver uit
  elkaar. Alleen de eerste hoort in de volgende commit. Zet alleen die in de
  staging area, zonder het bestand met de hand te bewerken. Deze stap is
  interactief; daarna mag je script gewoon doorlopen met statuscommando's.
- **Klaar wanneer:** `git status` toont hetzelfde bestand in beide secties, en
  de staging area bevat een versie van het bestand die nooit zo op je schijf
  heeft gestaan: alleen met de eerste wijziging.

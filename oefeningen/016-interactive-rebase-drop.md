# Oefening 016 — Een commit echt weggooien met `drop`

## Doel

Soms wil je een
commit helemaal niet behouden maar volledig verwijderen uit
de historie, inclusief zijn wijzigingen. Daarvoor zet je hem in de todo-lijst
van `git rebase -i` op `drop`.

## Basisoefening

Schrijf vanaf `template.sh` een script `interactive-rebase-drop.sh` (een
gewone repo in `repos/` volstaat) dat het volgende doet:

1. Maak een eerste commit.
2. Maak een tweede commit die een regel in het bestand wijzigt — dit is een
   mislukt experiment dat je helemaal niet had moeten committen.
3. Maak een derde commit die diezelfde regel nóg een keer wijzigt.
4. Bekijk de historie met `git log --oneline`.
5. Start `git rebase -i HEAD~2` en zet in de todo-lijst de tweede commit op
   `drop`, de derde op laat je op `pick` staan.

Omdat de derde commit dezelfde regel wijzigt die de tweede commit al had
aangepast, levert het droppen een conflict op: Git kan de wijziging van de
derde commit niet zomaar toepassen op een regel die er, zonder de tweede
commit, anders uitziet. Los het conflict op zodat het eindresultaat de
oorspronkelijke regel bevat mét de bedoelde wijziging van de derde commit —
niets van het mislukte experiment. Laat de rebase daarna verdergaan met
`git rebase --continue`.

**Klaar wanneer:** de mislukte commit en zijn wijziging komen nergens meer
voor in `git log` of in de bestandsinhoud, de wijziging van de derde commit
is aanwezig, er zijn nog maar twee commits, en `git status` toont geen
lopende rebase meer.

## Plus-oefening — lastiger droppen

Elk deel is een **eigen script** dat je vanaf `template.sh` schrijft. Een
interactive rebase is interactief, dus elk script eindigt op hooguit één
`rebase -i` (evt. gevolgd door een statuscommando).

### Deel A — meerdere, niet-aaneengesloten commits droppen

Schrijf een apart script `interactive-rebase-drop-meerdere.sh`.

- **Doel:** verspreid tussen een paar prima commits zitten twee losse
  commits die je geen van beide wilt behouden. Gooi ze allebei weg in één
  interactive rebase.
- **Klaar wanneer:** geen van beide ongewenste commits of hun wijzigingen
  komt nog voor in `git log` of in de bestandsinhoud, de overige commits
  zijn ongewijzigd, en er is geen lopende rebase meer.

### Deel B — droppen van een commit waar een latere commit op voortbouwt

Schrijf een apart script `interactive-rebase-drop-bestand.sh`.

- **Doel:** een oudere commit voegt een bestand toe; een latere commit
  wijzigt datzelfde bestand verder. Droppen van de oudere commit levert nu
  een conflict op omdat het bestand niet meer bestaat. Rond het droppen af
  zodat het bestand — inclusief de latere wijziging — alsnog het gewenste
  eindresultaat oplevert.
- **Klaar wanneer:** het conflict is opgelost, het eindresultaat bevat de
  latere wijziging (niet die van de gedropte commit), en er is geen lopende
  rebase meer.

### Deel C — droppen én repareren in één rebase

Schrijf een apart script `interactive-rebase-drop-en-edit.sh`.

- **Doel:** de historie bevat zowel een commit die je volledig wilt droppen
  als, los daarvan, een oudere commit die een overbodig bestand bevat dat je
  eruit wilt halen (zoals in oefening 015). Doe beide reparaties in één
  interactive rebase.
- **Klaar wanneer:** de gedropte commit en zijn wijziging zijn nergens meer
  te vinden, de andere commit bevat het overbodige bestand niet meer maar
  wel zijn bedoelde wijziging, en er is geen lopende rebase meer.

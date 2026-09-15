# Oefening 007 — Een release markeren met `git tag`

## Doel

In oefening 006 verwees je naar "de commit die nu in productie staat" door
zijn hash te onthouden. Dat is foutgevoelig en onleesbaar. Een tag geeft die
commit een blijvende, betekenisvolle naam - zoals `v1.0` - die je overal kunt
gebruiken waar je ook een commit-hash of branchnaam zou gebruiken.

## Basisoefening

Schrijf vanaf `template.sh` een script `tags.sh`.

1. Laat Alice een paar commits op `main` maken, alsof ze een klein script
   steeds verder afmaakt, en pushen.
2. Laat Bob die commits ophalen, zodat hij dezelfde stand heeft.
3. Laat Alice de huidige stand markeren als release met een annotated tag
   `v1.0` (`git tag -a v1.0 -m "..."`).
4. Laat Alice nog een commit aan `main` toevoegen, ná de tag.
5. Laat Alice gewoon `git push` doen (geen tags erbij) en met
   `git ls-remote --tags origin` bekijken dat de tag niet is meegegaan. Een
   gewone push neemt tags niet automatisch mee, ook al ging de nieuwe commit
   wel gewoon mee.
6. Laat Bob een gewone `git fetch` doen: hij krijgt alices nieuwe commit
   keurig binnen, maar `git tag` toont nog steeds niets - de tag stond nog
   nergens op de remote om op te halen.
7. Laat Alice de tag alsnog expliciet pushen (`git push origin v1.0`).
8. Laat Bob nog een keer een gewone `git fetch` doen en bekijk met `git tag`
   dat hij hem nu wél krijgt, zonder dat daar iets extra's voor nodig was -
   een tag die al ergens in de geschiedenis zit die je ophaalt, komt
   vanzelf mee zodra hij op de remote staat.
9. Er blijkt bij Bob een hotfix nodig op precies de release van `v1.0` -
   begin bij hem een `hotfix`-branch vanaf de tag (`git switch -c hotfix
   v1.0`) in plaats van vanaf een onthouden hash, en maak daar de
   hotfix-commit.

**Klaar wanneer:** `git ls-remote --tags origin` bij Alice pas na de
expliciete tag-push de tag toont, Bob ziet `v1.0` pas verschijnen na de
tag-push en niet al bij zijn eerdere `git fetch`, en Bobs `hotfix`-branch
bevat de hotfix-commit maar niets van de latere commits die Alice na de tag
nog aan `main` toevoegde.

## Plus-oefeningen — meer met tags

Dit zijn losstaande oefeningen, geen opvolgende delen. Elke oefening is een
**eigen script** dat je vanaf `template.sh` schrijft.

### Oefening P1 — lightweight versus annotated

Schrijf een apart script `tags-lightweight-vs-annotated.sh`.

- **Doel:** zet op dezelfde commit zowel een lightweight tag (`git tag`,
  zonder verdere opties) als een annotated tag (`git tag -a`) en bekijk het
  verschil met `git show` voor allebei.
- **Klaar wanneer:** je met `git show` kunt aantonen dat de annotated tag een
  eigen boodschap, auteur en datum heeft en de lightweight tag niet, die is
  niets meer dan een naam die naar een commit wijst.

### Oefening P2 — een release achteraf markeren

Schrijf een apart script `tag-in-hindsight.sh`.

- **Doel:** je bent vergeten een release te taggen op het moment zelf. Bouw
  een reeks commits op `main` op en zet daarna, zonder die oudere commit ooit
  uit te checken, alsnog een tag op precies de juiste, inmiddels niet meer
  laatste commit.
- **Klaar wanneer:** de tag naar de juiste, oudere commit wijst, `main` zelf
  ongewijzigd is gebleven, en je op geen enkel moment een detached HEAD nodig
  had om de tag te zetten.

### Oefening P3 — een verkeerde tag herstellen en delen

Schrijf een apart script `tags-remove-and-push.sh`.

- **Doel:** je zet een tag op de verkeerde commit en pusht hem
  naar de remote voordat je de fout
  ontdekt. Een tag verwijderen werkt niet vanzelf mee met een gewone push -
  zoek uit hoe je hem zowel lokaal als op de remote weg krijgt. Zet daarna de
  tag opnieuw op de juiste commit en deel die versie wel.
- **Klaar wanneer:** de remote bevat uiteindelijk alleen de tag op de juiste
  commit, nergens (lokaal of op de remote) is de foute tag nog te vinden, en
  je kunt aanwijzen op welk moment de eerste, foute tag nog wél lokaal bestond
  maar nog niet op de remote.

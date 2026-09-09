# Oefening 013 — Een merge forceren met `-X ours`/`-X theirs`

## Doel

Je kunt een merge conflict met de hand oplossen. Soms wil je dat helemaal
niet per conflict doen, maar gewoon zeggen: "bij twijfel wint deze kant",
voor het hele bestand, in één keer. Dat doe je met `git merge -X ours` of
`-X theirs`. `ours` betekent 'behoud de wijzigingen van de huidige branch',
`theirs` betekent 'neem de wijzigingen van de inkomende branch over'.

## Basisoefening

Schrijf vanaf `template.sh` een script `merge-ours.sh` (een gewone
repo in `repos/` volstaat) dat het volgende doet:

1. Maak op `main` een eerste commit met een instellingenbestand
   `config.txt`.
2. Maak een `feature`-branch en wijzig daar `config.txt`.
3. Ga terug naar `main` en wijzig daar dezelfde regel in `config.txt`
   onafhankelijk anders - dit zou normaal een conflict opleveren.
4. Merge `feature` in `main` met `git merge -X ours feature`, zodat de versie
   van `main` altijd wint.
5. Bekijk `config.txt`: er is geen conflict geweest, en de inhoud is die van
   `main`.

**Klaar wanneer:** de merge is zonder conflict afgerond, `git status` toont
niets bijzonders meer, en `config.txt` bevat de inhoud die op `main` stond,
niet die van `feature`.

## Plus-oefening — een bestand dat altijd zijn eigen kant moet houden

Schrijf een apart script `merge-ours-selective-always.sh` vanaf
`template.sh`.

- **Doel:** in plaats van bij elke merge apart aan `-X ours` te moeten
  denken, wil je dat één specifiek bestand (bijvoorbeeld een lokaal
  configuratiebestand) bij *elke* toekomstige merge automatisch de eigen
  versie behoudt, zonder dat je daar iets voor hoeft mee te geven op de
  commandoregel. Bouw dat structureel in voor dat ene bestand, en bewijs dat
  het werkt door een merge te doen zonder `-X` erbij.
- **Klaar wanneer:** een gewone `git merge` (zonder `-X`) van een branch die
  hetzelfde bestand anders heeft gewijzigd, verloopt zonder conflict en
  behoudt de eigen versie van dat bestand - andere bestanden worden nog
  gewoon normaal gemerged.

# Oefening 014 — Twee losse histories samenvoegen

## Doel

Soms wil je twee repo's die niets met elkaar te maken hebben
toch samenvoegen, bijvoorbeeld omdat
een oud apart bijgehouden project alsnog in je hoofdproject moet landen.
Een gewone `git merge` weigert dat. Je leert hoe je dat bewust forceert.

## Basisoefening

Schrijf vanaf `template.sh` een script `merge-unrelated-histories.sh`. Je
hebt hiervoor **twee losse repo's** nodig, dus wijk op dat punt af van
`template.sh` (geen bare origin, gewoon twee gewone repo's naast elkaar in
`repos/`).

1. Maak een repo `project-a` met een eigen eerste commit.
2. Maak, volledig los daarvan, een tweede repo `project-old` met zijn eigen
   eerste commit - twee onafhankelijke repo's zonder enige gedeelde
   geschiedenis.
3. Voeg vanuit `project-a` de map van `project-old` toe als remote met
   `git remote add old ../project-old`, en haal de geschiedenis daarvan
   op met `git fetch old`.
4. Probeer `project-old` in `project-a` te mergen met een gewone
   `git merge`. Zie dat Git dit weigert.
5. Merge opnieuw, maar nu met de vlag `--allow-unrelated-histories`
   die Git toestemming geeft om twee losse histories samen te voegen.
6. Zie dat de bestanden van beide projecten nu naast elkaar in
   `project-a` staan.

**Klaar wanneer:** de eerste, gewone merge-poging aantoonbaar is geweigerd,
de tweede poging wel is geslaagd, `project-a` na afloop de bestanden
van beide oorspronkelijke repo's bevat , en `git log --oneline --graph --all`
een merge-commit met twee compleet gescheiden geschiedenissen toont die
samenkomen.

## Plus-oefening — het oude project in een submap onderbrengen

Schrijf een apart script `merge-unrelated-histories-submap.sh` vanaf
`template.sh`.

- **Doel:** bouw dezelfde twee-repo's-situatie op als in de basisoefening,
  maar zorg er deze keer voor dat de inhoud van `project-old` na het
  samenvoegen niet los in de root van `project-a` terechtkomt, maar netjes
  in een eigen submap - zonder dat je bestanden met de hand hoeft te
  verplaatsen ná de merge.
- **Klaar wanneer:** na de merge staan alle bestanden van `project-old`
  binnen één duidelijk afgebakende submap in `project-a`, de bestanden van
  `project-a` zelf staan nog gewoon in de root, en de volledige
  commitgeschiedenis van `project-old` is behouden.

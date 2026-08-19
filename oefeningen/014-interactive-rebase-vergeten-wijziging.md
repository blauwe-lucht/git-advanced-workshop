# Oefening 014 — Een vergeten wijziging in de juiste commit krijgen

## Doel

Je hebt drie commits: commit 1, commit 2 en commit 3. Bestand A is gewijzigd
in commit 3. Nu ontdek je dat je lokaal, nog niet gecommit, een wijziging aan
bestand A hebt staan die eigenlijk in commit 2 had moeten zitten.

## Basisoefening

Schrijf vanaf `template.sh` een script `interactive-rebase-vergeten-wijziging.sh`
(een gewone repo in `repos/` volstaat) dat deze situatie opzet: drie commits,
met in commit 3 een wijziging aan bestand A, en daarna een niet-gecommitte
lokale wijziging aan bestand A die eigenlijk bij commit 2 hoort.

Zorg dat die lokale wijziging alsnog in commit 2 terechtkomt, zonder dat de
wijziging onderweg ooit alleen nog maar in een risicovolle tussenstap bestaat,
en zonder dat de wijziging van commit 3 verloren gaat.

**Klaar wanneer:** commit 2 bevat de vergeten wijziging, commit 3 bevat nog
steeds zijn eigen wijziging aan bestand A, er zijn nog steeds drie commits, en
`git status` toont geen lopende rebase meer.

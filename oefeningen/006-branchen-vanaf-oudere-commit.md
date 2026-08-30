# Oefening 006 — Branchen vanaf een oudere commit voor een hotfix

## Doel

Je leert een nieuwe branch beginnen vanaf een oudere commit in plaats van
vanaf de huidige stand van `main` - bijvoorbeeld omdat je een hotfix nodig
hebt op wat er nu in productie draait, zonder de nieuwere, nog niet
uitgerolde commits van `main` mee te nemen.

## Basisoefening

Schrijf vanaf `template.sh` een script `time-travel-branch-from-older-commit.sh`
(een gewone repo in `repos/` volstaat, een remote heb je niet nodig).

1. Maak op `main` een commit die je markeert als "dit staat nu in productie".
2. Voeg daarna nog een paar extra commits toe aan `main` die je (nog) niet
   wilt meenemen in je hotfix.
3. Begin een nieuwe branch `hotfix` niet vanaf de huidige `main`, maar
   precies vanaf de commit uit stap 1.
4. Maak op die nieuwe branch een eigen commit (de hotfix zelf), en bevestig
   met `git status` dat je op een normale, "aangehechte" branch zit - geen
   detached HEAD meer.
5. Bekijk met `git log --oneline --graph --all` dat `hotfix` afsplitst vanaf
   de commit uit stap 1, los van de latere commits op `main`.

**Klaar wanneer:** de `hotfix`-branch bevat geen van de latere commits die na
stap 1 aan `main` zijn toegevoegd, wel zijn eigen hotfix-commit, `main` zelf
is ongewijzigd, en `git status` toont op `hotfix` geen "detached HEAD" meer.

## Plus-oefening — een tweede hotfix, midden in de eerste

Schrijf een apart script `time-travel-branch-from-branch-commit.sh` vanaf
`template.sh`.

- **Doel:** bouw een `hotfix`-branch op (zoals in de basisoefening) met
  **drie** eigen commits erop. Blijkt dat er een tweede
  hotfix nodig is die alleen bovenop de eerste twee van die drie commits
  hoort - niet op de derde, en niet op `main`. Begin een nieuwe branch
  `hotfix-2` precies op dat punt, midden in de geschiedenis van `hotfix`
  zelf, en maak daar de tweede hotfix-commit.
- **Klaar wanneer:** `hotfix-2` bevat de eerste twee commits van `hotfix` plus
  zijn eigen nieuwe commit, maar niet de derde commit van `hotfix`; `hotfix`
  zelf is ongewijzigd; en `git log --oneline --graph --all` laat zien dat
  `hotfix-2` afsplitst vanaf het midden van `hotfix`, los van diens laatste
  commit.

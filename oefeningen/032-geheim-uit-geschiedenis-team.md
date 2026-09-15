# Oefening 032 — Een geheim uit de geschiedenis halen en veilig force-pushen in een team

## Doel

Bob commit per ongeluk een bestand met een secret erin, samen
met een gewone, legitieme wijziging in diezelfde commit. Een nieuwe commit
die het geheime bestand weer verwijdert lost niets op: de key staat nog
gewoon in die oudere commit, voor iedereen nog te bekijken. Bob
moet de commit repareren en de geschiedenis daarachter herschrijven — en dat
vervolgens veilig naar `origin` pushen zonder het werk van een teamgenoot te
vernielen. Alice heeft inmiddels verder gewerkt en merkt dat ze haar
veranderingen niet kan pushen. Hoe lost ze dat op?

## Basisoefening

Schrijf vanaf `template.sh` een script `secret-history-rewrite.sh` dat het
volgende doet:

1. Maak een kale `origin`-repo en twee clones: `bob` en `alice`.
2. Laat `bob` een eerste commit maken met `file.txt` — "Commit 1".
3. Laat `bob` een tweede commit maken die zowel `file.txt` verder wijzigt als
   `secrets.txt` toevoegt, met wat inhoud: "Commit 2: update file.txt and
   add config (oops, real API key)".
4. Laat `bob` dit pushen, en laat `alice` op dit punt pullen — ze heeft nu
   dezelfde, besmette geschiedenis lokaal staan (commit 1 en 2).
5. Laat `bob` daarna, zonder dat `alice` opnieuw pullt, nog een derde commit
   maken met een gewone wijziging aan `file.txt` — "Commit 3" — en die
   pushen. `alice` weet hier nog niets van.
6. Laat `alice`, gebaseerd op haar eigen lokale stand (commit 1 en 2), een
   eigen commit maken met een wijziging aan `file.txt` — "Commit 4 by
   alice" — maar nog niet pushen.
7. Bob merkt intussen op dat `secrets.txt` een geheim bevat. Omdat commit 2
   ook een legitieme wijziging aan `file.txt` bevat, kan hij die commit niet
   zomaar droppen. Start `git rebase -i` en zet commit 2 op `edit`; haal
   binnen die commit alleen `secrets.txt` weg en behoud de wijziging aan
   `file.txt`, en laat de rebase daarna doorlopen.
8. Laat bobs script na deze ene interactieve stap gewoon automatisch
   doorlopen: push de herschreven geschiedenis veilig met
   `git push --force-with-lease`.
9. Laat `alice` nu `git push` proberen en bekijk de foutmelding: de push
   wordt geweigerd.
10. Laat `alice` vervolgens, zonder verder na te denken, fetchen en mergen
    (`git fetch` gevolgd door `git merge origin/main`) en bekijk wat dat
    oplevert: niet alleen een conflict, maar ook het geheime bestand duikt
    zomaar weer op — haar kant van de merge bevat het nog gewoon, dus git
    voegt het doodleuk weer toe. Breek deze merge af.
11. Los het voor `alice` op de juiste manier op. Een gewone `git rebase
    origin/main` is hier niet genoeg: haar eigen, oude commit 2 (met het
    geheim erin) is voor git een andere commit dan bobs herschreven versie,
    dus die zou opnieuw worden toegepast. Gebruik in plaats daarvan
    `git rebase --onto origin/main HEAD~1` om alleen haar eigen, laatste
    commit los te maken van haar oude, besmette basis en opnieuw toe te
    passen bovenop bobs schone geschiedenis. Los het conflict op zodat het
    eindresultaat bobs derde commit én haar eigen wijziging bevat, zonder het
    geheim. Omdat haar main na deze rebase weer gewoon een lineaire
    voortzetting is van `origin/main`, volstaat daarna een gewone
    `git push`.

**Klaar wanneer:** `origin/main` bevat bob's geschiedenis zonder
`secrets.txt` in wélke commit dan ook (`git log --all --full-history --
secrets.txt` levert niets meer op), de legitieme wijziging uit commit 2 is
nog gewoon aanwezig, en alices vierde commit staat er ook op, zonder dat er
ergens een merge-commit is ontstaan die het geheim alsnog terugbrengt.

## Plus-oefening — alice had haar werk al gepusht

Schrijf een apart script `secret-history-rewrite-lost-push.sh` vanaf
`template.sh`.

- **Doel:** bouw hetzelfde scenario op als in de basisoefening, maar laat
  `alice` haar vierde commit al pushen vóórdat bob zijn geschiedenis
  herschrijft. Bobs force-push dreigt daarmee ook alices al gepushte werk te
  overschrijven. Zorg dat bob zijn geheim alsnog volledig uit de geschiedenis
  krijgt én veilig pusht, zonder alices werk kwijt te raken en zonder een
  kale `--force` te gebruiken.
- **Klaar wanneer:** `origin/main` bevat nergens meer het geheime bestand, de
  legitieme wijziging uit commit 2 is nog aanwezig, en de inhoud van alices
  vierde commit staat er ook nog steeds op.

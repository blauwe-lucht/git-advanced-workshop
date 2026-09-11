# Oefening 021 — Force-pushen zonder bescherming: een collega's commit verdwijnt

## Doel

Je hebt lokaal een commit ge-amend en wilt die aangepaste commit naar de
gedeelde `origin` pushen. Omdat de geschiedenis is veranderd, weigert een
gewone `git push` dat. Met `git push --force` lukt het wel, maar `--force`
overschrijft de remote-branch klakkeloos met jouw versie, ongeacht wat daar
intussen is bijgekomen. Als een teamgenoot ondertussen ook heeft gepusht,
verdwijnt hun werk zonder enige waarschuwing.

## Basisoefening

Schrijf vanaf `template.sh` een script `force-push-unsafe.sh` dat het
volgende doet:

1. Maak een kale `origin`-repo (`git init --bare`) en twee losse clones
   daarvan: `alice` en `bob`.
2. Laat `alice` een eerste commit maken met `file1.txt` en die pushen.
3. Laat `bob` die commit ophalen (`git pull`).
4. Laat `alice`, terwijl `bob` nog aan het werk is, een nieuwe commit maken
   met een tweede bestand `file2.txt` en die pushen.
5. Laat `bob` - zonder eerst te fetchen - zijn eigen laatste commit amenden
   (bijvoorbeeld de inhoud van `file1.txt` aanpassen) en die met
   `git push --force` naar `origin` pushen.
6. Laat `alice` fetchen en bekijk met `git log --oneline origin/main` dat
   haar commit met `file2.txt` nergens meer te bekennen is op de remote.

**Klaar wanneer:** `origin` bevat na stap 5 alleen nog bobs ge-amende commit,
en `git log --oneline origin/main` bij alice toont geen spoor meer van haar
`file2.txt`-commit, terwijl zij die zelf wel degelijk had gepusht.

## Plus-oefening — alices werk terugvinden

`alice`'s commit is van de remote verdwenen, maar haar eigen lokale
`origin/main` branch wist tot voor kort nog waar die commit stond.
Schrijf één script `force-push-unsafe-repair.sh` vanaf `template.sh` dat
je in de volgende delen uitbreidt.

### Deel A — dezelfde dataverlies-situatie opnieuw opbouwen

Bouw dezelfde situatie op als in de basisoefening: alice's commit met
`file2.txt` verdwijnt van de remote doordat bob force-pusht zonder eerst te
fetchen.

**Klaar wanneer:** `origin` bevat geen spoor meer van alices
`file2.txt`-commit.

### Deel B — de verdwenen commit terugvinden bij alice

Zoek, uitsluitend vanuit alices eigen lokale repo, de hash op van de commit
die van de remote is verdwenen.

**Klaar wanneer:** je hebt een commit-hash gevonden die overeenkomt met
alices verdwenen `file2.txt`-commit, zonder dat je die hash ergens had
opgeschreven of onthouden.

### Deel C — het werk alsnog veilig terugzetten op de remote

Zorg dat alices verdwenen werk weer op `origin` terechtkomt, zonder dat je
daarbij bobs ge-amende commit kwijtraakt.

**Klaar wanneer:** `origin` bevat zowel bobs ge-amende commit als de inhoud
van alices eerder verdwenen `file2.txt`-commit.

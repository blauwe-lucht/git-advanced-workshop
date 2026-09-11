# Oefening 022 — Veilig force-pushen met `--force-with-lease`

## Doel

In de vorige oefening zag je hoe `git push --force` het werk van een
teamgenoot zonder waarschuwing kan wegvagen. `git push --force-with-lease`
lost dat op: het controleert eerst of de remote-branch nog op dezelfde
commit staat als toen jij voor het laatst hebt gefetcht, en weigert de push
als dat niet meer zo is.

## Basisoefening

Schrijf vanaf `template.sh` een script `force-push-safe.sh` dat het volgende
doet:

1. Maak, net als in de vorige oefening, een kale `origin`-repo en twee
   clones: `alice` en `bob`.
2. Laat `alice` een eerste commit maken met `file1.txt` en die pushen.
3. Laat `bob` die commit ophalen.
4. Laat `bob`, zonder dat er ondertussen iets anders op de remote is
   veranderd, zijn laatste commit amenden en pushen met
   `git push --force-with-lease`.
5. Bekijk dat deze push gewoon lukt: niemand anders had immers iets gepusht.
6. Laat `alice` daarna een nieuwe commit maken met `file2.txt` en pushen.
7. Laat `bob` - weer zonder eerst te fetchen - zijn laatste commit nogmaals
   amenden en opnieuw `git push --force-with-lease` proberen.
8. Bekijk de foutmelding: de push wordt geweigerd omdat de remote intussen is
   veranderd.

**Klaar wanneer:** de push in stap 4 lukt zonder problemen, de push in stap 7
wordt geweigerd met een foutmelding over de remote die niet meer overeenkomt
met de verwachte staat, en alices `file2.txt`-commit staat nog gewoon op
`origin`.

## Plus-oefening — de weigering oplossen en toch verder

Schrijf één script `force-push-safe-resolve.sh` vanaf `template.sh` dat je
in de volgende delen uitbreidt.

### Deel A — dezelfde geweigerde push opbouwen

Bouw dezelfde situatie op als in de basisoefening tot en met de geweigerde
`--force-with-lease`-push van bob in stap 7.

**Klaar wanneer:** bobs push is geweigerd, en `origin` bevat nog steeds
zowel zijn eerste ge-amende commit als alices `file2.txt`-commit, ongewijzigd.

### Deel B — bobs werk alsnog netjes op de remote krijgen

Zorg dat bob zijn ge-amende wijziging alsnog op `origin` krijgt, zonder
alices `file2.txt`-commit kwijt te raken en zonder alsnog een kale
`--force` te gebruiken.

**Klaar wanneer:** `origin` bevat zowel bobs ge-amende wijziging als alices
`file2.txt`-commit, en de push waarmee dat is gelukt was geen kale
`--force`.

### Deel C — een race condition tussen fetchen en pushen

Bob fetcht keurig eerst, ziet dat de remote overeenkomt met zijn laatste
bekende staat, en amendt zijn commit. Maar vlak vóór hij pusht, glipt er
tussendoor toch nog een nieuwe commit van alice op de remote. Simuleer dat
en laat zien dat `--force-with-lease` ook dit smalle tijdvenster nog steeds
opvangt.

**Klaar wanneer:** bobs push wordt ook in dit scenario geweigerd, ondanks dat
hij vlak daarvoor nog had gefetcht, en alices nieuwste commit staat nog
steeds op `origin`.

# Oefening 021 - Een andere repo opnemen met `git submodule`

## Doel

Je leert een andere repo als **submodule** op te nemen in je eigen repo, zodat
je gedeelde code (zoals een library) los kunt beheren, maar wel
op een vaste, expliciete commit in je eigen project laat meelopen. Je ziet ook
waarom dat anders werkt dan een gewone map: de submodule wordt pas gevuld na
een expliciete stap, en een wijziging in de submodule moet je zelf doorvoeren
naar de hoofdrepo.

## Basisoefening

Schrijf vanaf `template.sh` een script `submodule.sh` dat het volgende doet.
Je hebt hiervoor twee bare repos nodig in plaats van één, dus wijk op dat punt
af van `template.sh`.

1. Maak twee bare repo's aan: `origin-shared-lib` en `origin-app`.
2. Zet bovenaan je script `export GIT_ALLOW_PROTOCOL=file` - zonder die regel
   weigert Git een submodule toe te voegen via een lokaal pad.
3. Een lege repo kan niet als submodule toegevoegd worden: Git probeert bij
   `git submodule add` meteen de `HEAD` van de gecloneerde repo uit te
   checken, en een lege repo heeft geen `HEAD` om uit te checken. Alice moet
   `origin-shared-lib` dus eerst een eerste commit geven voordat ze hem als
   submodule kan toevoegen. Clone `origin-shared-lib` als alice, schrijf een
   bestand `greet.sh` met daarin een functie `greet` die iets print, commit,
   en push.
4. Clone `origin-app` als alice, voeg `origin-shared-lib` toe als submodule
   op pad `libs/shared-lib` met `git submodule add`, en schrijf een script
   `app.sh` dat `libs/shared-lib/greet.sh` sourcet en de `greet`-functie
   aanroept. Commit beide, push, en draai `bash app.sh` om te zien dat het
   werkt.
5. Clone `origin-app` als bob. Bekijk met `ls -al libs/shared-lib` dat de map
   leeg is, en met `git ls-tree HEAD libs/shared-lib` dat de eigenlijke
   referentie (een commit-SHA) niet in die map staat maar in de tree van
   `app` zelf. Bekijk ook `git submodule status`: het streepje (`-`) vóór de
   commit-hash is het echte signaal dat de submodule nog niet
   geïnitialiseerd is. Draai daarna `bash app.sh` om te zien dat het script
   daardoor faalt.
6. Initialiseer en haal de submodule-inhoud op met `git submodule update --init`.
   Bekijk met `ls -al libs/shared-lib` dat de map nu een eigen `.git`-bestand
   heeft (geen map!), en met `cat libs/shared-lib/.git` waar dat naartoe
   verwijst. Draai `bash app.sh` opnieuw om te zien dat het nu wel werkt.
7. Alice werkt in haar eigen `app`-checkout: ga naar `libs/shared-lib` en voeg
   daar een tweede functie `farewell` toe aan `greet.sh`, commit en push die
   wijziging vanuit de submodule zelf. Ga terug naar `app`, breid `app.sh` uit
   zodat die ook `farewell` aanroept, en draai `bash app.sh` om het meteen te
   testen voordat je het publiceert. Commit zowel de bijgewerkte
   submodule-pointer als `app.sh`, en push.
8. Bob pullt `app`. Bekijk met `git status` dat `libs/shared-lib` als
   gewijzigd wordt getoond ("new commits"), ook al heb je nog niets gedaan.
   Update de submodule met `git submodule update`, en draai `bash app.sh`
   om het resultaat te zien.

**Klaar wanneer:** bobs `libs/shared-lib` na stap 6 dezelfde inhoud heeft als
wat in stap 3 gepusht is en `bash app.sh` bij hem "Hello" print, na stap 7
print `bash app.sh` bij alice zowel "Hello" als "Bye", en na stap 8 print
`bash app.sh` ook bij bob beide regels en bevat zijn `libs/shared-lib` dezelfde
commit als alices submodule-pointer uit stap 7.

## Plus-oefeningen - meer met submodules

Dit zijn losstaande oefeningen, geen opvolgende delen. Elke oefening is een
**eigen script** dat je vanaf `template.sh` schrijft.

### Oefening P1 - in één keer meenemen

Schrijf een apart script `submodule-recursief-clonen.sh`.

- **Doel:** een nieuwe collega clonet `app` en wil meteen, in één commando,
  ook de inhoud van `libs/shared-lib` erbij - zonder de aparte
  initialisatie-stap uit de basisoefening.
- **Klaar wanneer:** direct na het clonen staat de inhoud van de submodule al
  in de working tree, zonder dat daarvoor een los `update`-commando nodig was.

### Oefening P2 - de submodule een branch laten volgen

Schrijf een apart script `submodule-branch-volgen.sh`.

- **Doel:** zorg dat de submodule niet aan één losse commit vastzit, maar een
  specifieke branch van `shared-lib` volgt, zodat een update van de submodule
  automatisch de nieuwste commit van die branch pakt in plaats van dat je zelf
  moet weten welke commit dat is.
- **Klaar wanneer:** na een wijziging en push op die branch in `shared-lib`,
  haalt een update van de submodule in `app` die wijziging op zonder dat je
  een commit-hash hoeft op te zoeken of op te geven.

### Oefening P3 - een submodule weer verwijderen

Schrijf een apart script `submodule-verwijderen.sh`.

- **Doel:** je hebt de submodule uit de basisoefening niet meer nodig. Haal
  hem volledig en netjes uit de repo.
- **Klaar wanneer:** de map van de submodule bestaat niet meer, er staat geen
  configuratie van de submodule meer in `.git/config` of `.gitmodules`, en
  `git status` toont geen resten meer die op de submodule wijzen.

### Oefening P4 - twee bijgewerkte pointers die botsen

Schrijf een apart script `submodule-conflict.sh`.

- **Doel:** alice en bob werken allebei, onafhankelijk van elkaar, de
  submodule-pointer in `app` bij naar een andere commit van `shared-lib`, en
  pushen dat allebei. Zorg dat wie als laatste pusht het conflict oplost, zo
  dat de pointer in `app` uiteindelijk naar de commit wijst die beide nieuwe
  wijzigingen van `shared-lib` bevat.
- **Klaar wanneer:** het conflict is opgelost, en de submodule-pointer in
  `app` wijst na afloop naar een commit van `shared-lib` waarin zowel alices
  als bobs wijziging aanwezig is.

### Oefening P5 - een submodule binnen een submodule

Schrijf een apart script `submodule-genest.sh`. Je gaat een submodule maken
die zelf ook weer een submodule gebruikt.

- **Doel:** `shared-lib` heeft op zijn beurt ook weer een eigen submodule
  nodig (bijvoorbeeld een repo `util`) - een submodule binnen een submodule
  dus. Bouw dat geneste geheel op, en zorg dat een collega die `app` clonet
  met één toereikende actie meteen ook de inhoud van die geneste submodule
  binnenkrijgt, niet alleen die van `shared-lib` zelf.
- **Klaar wanneer:** na het clonen en initialiseren van `app` staat niet
  alleen de inhoud van `libs/shared-lib` in de working tree, maar ook de
  inhoud van de submodule daarbinnen, zonder dat je die geneste submodule
  apart hoeft te clonen of initialiseren.

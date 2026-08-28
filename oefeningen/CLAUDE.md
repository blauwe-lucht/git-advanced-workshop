# Context voor wie aan de oefeningen werkt

Deze map bevat de hands-on **oefeningen** voor de Git Advanced Workshop. Lees dit
voordat je oefeningen toevoegt of aanpast.

## Oorspronkelijke opdracht

> Ik wil de oefeningen die ik tijdens de workshop geef opschrijven in deze repo
> in het Nederlands. Daarnaast wil ik naast iedere oefening voor snelle
> cursisten een **Plus**-oefening hebben waar ze hun tanden op kunnen
> stukbijten. Lastig, maar niet superlastig. Ik wil dat iedere Plus-oefening is
> opgedeeld in een aantal onderdelen zodat er een gevoel van voldoening is, ook
> al heeft een student niet voldoende tijd om de oefening volledig af te maken.

## Vorm-afspraken (uit de reviews)

- **`README.md` is de landingspagina voor cursisten** — geen AI-/onderhoudsinstructies
  daarin, die horen hier thuis. De README heeft secties per onderwerp met links
  naar de oefeningen.
- **De opdrachten staan in genummerde `.md`-bestanden** in deze map, `001` t/m
  `999`. Elke `.md` bevat de tekst van de basisoefening én de Plus-oefening.
- **De cursist schrijft zelf het oplossings-script** vanaf [`template.sh`](template.sh).
  De `.md` is de *opdracht*, niet de oplossing. Noem in elke oefening expliciet de
  bestandsnaam die de cursist voor het script moet gebruiken; leen die naam van
  het bijbehorende voorbeeldscript in de root als die logisch is, kies anders een
  duidelijke eigen naam.
- **De voorbeeldoplossingen zijn de `.sh`-scripts in de root** van de repo — voor
  de trainer. **Link daar niet naartoe** vanuit de oefeningen: niet te
  verleidelijk maken dat cursisten spieken.
- Elke oefening maakt een verse `repos/`-map *from scratch* aan (zoals de
  demo-scripts) en staat op zichzelf.

## Schrijfrichtlijnen

- Nederlands, je-vorm, korte stappen.
- **Basisoefening:** haalbaar voor iedereen binnen de tijd. Concrete git-commando's
  benoemen mag hier — het is de gedeelde basis.
- **Plus-oefening:** lastig maar niet superlastig. **Geef geen hints over de
  benodigde git-commando's** — cursisten zoeken die zelf uit. Beschrijf alleen
  het doel en een "klaar wanneer"-check.
- Deel de Plus altijd op in meerdere delen, zodat elk afgerond deel al een
  succesje is. Er zijn twee vormen, kies op basis van of de delen op elkaar
  voortbouwen:
  - **Opvolgende delen** (deel B bouwt voort op de staat na deel A, één
    doorlopend of uitbreidend script): noem ze **Deel A / B / C** (soms D),
    oplopend in moeilijkheid.
  - **Losstaande oefeningen** (elk deel is een eigen scenario met een eigen
    script vanaf `template.sh`, staat op zichzelf): noem ze **Oefening P1 /
    P2 / P3** (soms P4), niet oplopend in moeilijkheid t.o.v. elkaar per se.
    Zet er een zin bij dat het losstaande oefeningen zijn, geen opvolgende
    delen. Zie `012-interactive-rebase-typefout-repareren.md` en
    `021-submodule.md` als voorbeeld.
- **Interactie-regel:** een script mag geen meerdere interactieve stappen
  vereisen. Als er interactie is (bijv. `git rebase -i`), staat die aan het
  **eind** van het script, hooguit gevolgd door een statuscommando (`git log`,
  `git reflog`). Ideaal is één script dat per Plus-deel verder wordt uitgebreid;
  maar zodra een deel interactief is, wordt dát deel een **eigen script** (dus
  bij interactive rebase: één script per deel). Zet nooit een tweede `rebase -i`
  achter de eerste in hetzelfde script.
- **Volgorde van concepten:** een oefening mag alleen git-concepten gebruiken
  (ook impliciet, om iets op te lossen) die al in een eerdere, lager genummerde
  oefening zijn geïntroduceerd - dit geldt zowel voor de basisoefening als de
  Plus. Kijk in `README.md` welke oefening welk onderwerp introduceert. Kom je
  tijdens het schrijven een oefening tegen die alleen op te lossen is met een
  concept dat pas later aan bod komt (bijv. `reset` of `rebase` gebruiken vóór
  die oefeningen), meld dat dan expliciet aan de gebruiker in plaats van het
  stilzwijgend op te lossen of te negeren.
- Verwijs naar [`../GIT_BEST_PRACTICES.md`](../GIT_BEST_PRACTICES.md) waar relevant.
- Houd de markdown lint-schoon (witregels rond koppen en lijsten).

## Nog te doen

- Oefeningen 005, 008, 009, 010 en 011 afmaken in dezelfde stijl als de
  bestaande oefeningen (per onderwerp uit de root-README: mergen, reset,
  force push, amend+force push, regeleindes - rebase en reflog/tijdreizen
  zijn al gedaan). Zet nieuwe oefeningen ook in de juiste sectie van
  `README.md`.

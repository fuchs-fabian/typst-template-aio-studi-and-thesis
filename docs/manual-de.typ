#import "../src/lib.typ": *

#show: project.with(
  lang: "de",
  authors: (
    (name: "Fabian Fuchs"),
  ),
  title: "aio-studi-and-thesis v0.1.2",
  subtitle: "Deutsches Handbuch",
  cover-sheet: (
    cover-image: none,
    description: [
      #text(fill: blue)[#link("https://github.com/fuchs-fabian/typst-template-aio-studi-and-thesis")]

      Eine Vorlage für Studierende zur Erstellung von Dokumentationen und Abschlussarbeiten
    ]
  ),
  abstract: [
    Diese Vorlage kann sowohl für umfangreiche Dokumentationen als auch für Abschlussarbeiten wie z.B. Bachelorarbeiten verwendet werden.

    Es sollte jedoch in jedem Fall vorab geklärt werden, ob das Template für den geplanten Einsatz akzeptiert wird.

    Die Vorlage ist sowohl für deutschsprachige als auch für englischsprachige Arbeiten geeignet.

    Es zeichnet sich dadurch aus, dass es trotz des vorgegebenen Designs in hohem Maße anpassbar ist.

    Standardmäßig sind zunächst alle Parameter des Templates optional. Dann ist es für Dokumentationen geeignet.
    Um es für Abschlussarbeiten tauglich zu machen, muss nur ein Parameter geändert werden.
  ]
)

= Verwendung des Templates

Nach dem Import der Vorlage stehen einige Optionen zur Verfügung. Wie es vielleicht schwer zu erkennen ist, ist diese Vorlage in hohem Maße anpassbar. Aber keine Sorge, alle Parameter sind optional. Es wird jedoch empfohlen, mindestens einen Autor unter `authors` mit `name` anzugeben und einen `title` zu vergeben.

Es ist wichtig zu wissen, dass dem Benutzer des Templates standardmäßig externe Pakete zur Verfügung stehen.

Diese sind:
- #link("https://Typst.app/universe/package/codly", "codly") (voller Funktionsumfang)
- #link("https://Typst.app/universe/package/glossarium", "glossarium") (`gls`, `glspl`)

== Minimale Verwendung

Der Import von mindestens `project` ist erforderlich.

```Typst
#show: project.with(
  // lang: "de",
  authors: (
    (name: "Dein Name"),
  ),
  title: "Titel des Dokuments"
)
```

Wenn die Vorlage in englischer Sprache verwendet werden soll, muss `lang` auf `"en"` geändert werden.

#card[
  Die Übersetzung wurde mit #link("https://www.deepl.com", "Deepl") vorgenommen, so dass keine Garantie für die Richtigkeit und Vollständigkeit der Übersetzung übernommen werden kann.
]

== Maximale Konfigurationsmöglichkeiten

Sollen bestimmte Verzeichnisse ausgeblendet werden, so müssen nur die Parameter, die `show` im Namen haben, auf `false` gesetzt werden.

Wenn `custom-cover-sheet` nicht `none` ist, wird das Deckblatt überschrieben und `cover-sheet` hat keinen Einfluss mehr. Das gleiche gilt für `custom-declaration`. Wenn hier nicht `none` steht, dann wird `declaration-on-the-final-thesis` überschrieben.

`declaration-on-the-final-thesis` funktioniert nur, wenn `thesis-compliant` auf `true` steht.

Wenn bestimmte Dictionaries verwendet werden, muss darauf geachtet werden, dass Parameter, bei denen ein Kommentar mit `required` steht, auch im Dictionary enthalten sind.

```Typst
#show: project.with(
  lang: "de",
  authors: (
    (
      name: "Unknown author", // required
      id: "",
      email: ""
    ),
  ),
  title: "Unknown title",
  subtitle: none,
  date: none,
  version: none,
  thesis-compliant: false,

  // Format
  side-margins: (
    left: 3.5cm,  // required
    right: 3.5cm, // required
    top: 3.5cm,   // required
    bottom: 3.5cm // required
  ),
  h1-spacing: 0.5em,
  line-spacing: 0.65em,
  font: default-font,
  font-size: 11pt,
  hyphenate: false,

  // Color settings
  primary-color: dark-blue,
  secondary-color: blue,
  text-color: dark-grey,
  background-color: light-blue,

  // Cover sheet
  custom-cover-sheet: none,
  cover-sheet: (    // none
    university: (   // none
      name: none,   // required
      street: none, // required
      city: none,   // required
      logo: none
    ), 
    employer: (     // none
      name: none,   // required
      street: none, // required
      city: none,   // required
      logo: none
    ), 
    cover-image: none,
    description: none,
    faculty: none,
    programme: none,
    semester: none,
    course: none,
    examiner: none,
    submission-date: none
  ),

  // Declaration
  custom-declaration: none,
  declaration-on-the-final-thesis: (             // none
    legal-reference: none,                       // required
    thesis-name: none,                           // required
    consent-to-publication-in-the-library: none, // required | true, false
    genitive-of-university: none                 // required
  ),

  // Abstract
  abstract: none,

  // Outlines
  outlines-indent: 1em,
  depth-toc: 4,   // none to disable
  show-list-of-figures: false,
  show-list-of-abbreviations: true,
  list-of-abbreviations: (
    (
      key: "",    // required
      short: "",  // required
      plural: "",
      long: "",
      longplural: "",
      description: none,
      group: "",
    ),
  ),
  show-list-of-formulas: false,
  custom-outlines: ( // none
    (
      title: none,   // required
      custom: none   // required
    ),
  ),
  show-list-of-tables: false,
  show-list-of-todos: false,
  literature-and-bibliography: none,
  list-of-attachements: ( // none
    (a: none),            // required
  )
)
```

#pagebreak()
= Verwendung der eigenen "Utils"

Da es in Typst einige Funktionen nicht gibt, die z.B. in anderen Programmiersprachen üblich sind, wurden diese selbst implementiert. Diese stehen dem Benutzer des Templates ebenfalls zur Verfügung.

== Verwendete Farben

```Typst
blue        // rgb("#009fe3")
dark-blue   // rgb("#152f4e")
light-blue  // rgb("#e8eff7")
dark-grey   // rgb("#4a4a49")
green       // rgb("#26a269")
purple      // rgb("#613583")
```

== Eigene Logik-Funktionen

Dies erleichterte die Umsetzung bestimmter Logiken für das Modell.

=== Validierung, ob etwas `none` oder ein leerer String (`""`) ist.

```Typst
#is-not-none-or-empty(content)
```

=== Validierung, ob ein Dictionary einen bestimmten `key` enthält

```Typst
#dict-contains-key(dict: (), key)
```

=== Umwandlung von Content zu einem String

```Typst
#to-string(content)
```

== Vorgefertigte Inhalte

=== Einfaches Verzeichnis (`simple-outline`)

Diese sind im Inhaltsverzeichnis aufgeführt.

```Typst
#simple-outline(
  title: none,
  target: none,
  indent: 1em,
  depth: none
)
```

=== Inhalt für das Unterschreiben (`signing`)

```Typst
#signing(text: none)
```

#v(1em)

#signing()

#pagebreak()
=== Einheitliches Hervorheben von Schlagwörtern (`emphasized`)

```Typst
#emphasized(fill: dark-blue, it)
```

*Beispiel*:

```Typst
#show "Mein Schlagwort" : it => emphasized(fill: purple, it)
```

#show "Mein Schlagwort" : it => emphasized(fill: purple, it)

Mein Schlagwort

=== TODO Handling

Um den TODO-String zu erhalten, kann einfach die folgendes aufgerufen werden:

```Typst
#txt-todo
```

#txt-todo

Um ein TODO zu haben, das auch in einem Inhaltsverzeichnis mit TODOs aufgelistet und im Text hervorgehoben werden kann, kann die folgende Funktion verwendet werden:

```Typst
#todo(it)
```

*Beispiel*:

```Typst
#todo("Noch ausfüllen")
// oder
#todo[Das muss auch ausgefüllt werden]
```

#todo("Noch ausfüllen")

#todo[Das muss auch ausgefüllt werden]

Damit für diese TODOs ein Inhaltsverzeichnis erzeugt wird, muss der Parameter `show-list-of-todos` in `project` auf `true` gesetzt werden:

```Typst
show-list-of-todos: true,
```

#pagebreak()
= Verwendung der "allgemeinen Assets"

== Karte (`card`)

```Typst
#card(
  primary-color: dark-blue,
  background-color: light-blue,
  title: none,
  img: none,
  body
)
```

=== Beispiel für die einfachste Verwendung

```Typst
#card[Mein Text in einer Karte]
```

#card[Mein Text in einer Karte]

=== Beispiel mit Titel

```Typst
#card(title: "Meine Karte")[Inhalt]
```

#card(title: "Meine Karte")[Inhalt]

=== Beispiel mit Bild

```Typst
#card(img: image("certificate.png"))[Inhalt]
```

#card(img: image("certificate.png"))[Inhalt]

#pagebreak()
=== Beispiel mit Titel und Bild

```Typst
#card(
  title: "Karte mit Titel und Bild",
  img: image("certificate.png")
)[Inhalt]
```

#card(
  title: "Karte mit Titel und Bild",
  img: image("certificate.png")
)[Inhalt]

== Autor/en Box (`author-box`)

```Typst
#author-box(
  background-color: light-blue,
  plural: false,
  body
)
```

=== Beispiel mit einem Autor

```Typst
#author-box[Vorname Nachname]
```

#author-box[Vorname Nachname]

=== Beispiel mit mehreren Autoren

```Typst
#author-box(
  plural: true
)[Vorname1 Nachname1, Vorname2 Nachname2]
```

#author-box(
  plural: true
)[Vorname1 Nachname1, Vorname2 Nachname2]

#pagebreak()
== Button (`button`)

Hier kann die Füllfarbe (`fill`), die Umrandung (`stroke`) und die Textfarbe (`text-color`) eingestellt werden.

```Typst
#button(
  url: "",
  fill: none,
  stroke: none,
  text-color: none,
  body
)
```

=== Beispiel für die einfachste Verwendung

```Typst
#button[Mein Button]
```

#button[Mein Button]

=== Beispiel mit einem Link

```Typst
#button(url: "https://github.com/fuchs-fabian")[Mein Link]
```

#button(url: "https://github.com/fuchs-fabian")[Mein Link]

#pagebreak()
= Verwendung der "Assets für Projektmanagement"

#card[
  Diese Assets eignen sich zur Dokumentation. Es ist zu beachten, dass die Verwendung für eine Abschlussarbeit vorher mit dem Betreuer abgesprochen werden muss.
]

== Persona (`persona`)

```Typst
#persona(
  primary-color: dark-blue,
  text-color: dark-grey,
  background-color: light-blue,
  title: txt-todo,
  img: image("images/persona.png", width: 6.5em),
  name: txt-todo,
  age: txt-todo,
  family: txt-todo,
  job: txt-todo,
  do-and-say: txt-todo,
  wishes: txt-todo,
  see-and-hear: txt-todo,
  challenges: txt-todo,
  typical-day: txt-todo,
  goals: txt-todo 
)
```

#pagebreak()
*Beispiel*:

```Typst
#persona(
  title: [Student],
  //img: none,
  name: [Max Mustermann],
  age: [26],
  family: [ledig],
  job: [Werksstudent],
  do-and-say: [
    Ich habe keine Ahnung, wie ich mit LaTex oder Word eine Dokumentation oder Abschlussarbeit schreiben soll. Das ist mir zu viel Arbeit alles händisch anpassen zu müssen.
  ],
  wishes: [
    Ein Template, welches ich sowohl für Dokumentationen als auch Abschlussarbeiten verwenden kann.
  ],
  see-and-hear: [
    - Word ist nicht besonders nutzerfreundlich, wenn es um das erstellen eines professionellen Dokumentes geht.
    - LaTex ist ein Urgestein, welches zu mächtig ist, um es gut verstehen zu können.
  ],
  challenges: [
    - Professoren davon zu überzeugen, dass es auch neue und schönere Möglichkeiten gibt, Dokumente zu erstellen
    - Das dieses Template verwendet werden darf.
  ],
  typical-day: [
    Projektarbeit und Dokumentation schreiben.
  ],
  goals: [
    Eine einfachere Möglichkeit Dokumentationen und Abschlussarbeiten zu erstellen, ohne dabei Word oder LaTex verwenden zu müssen.
  ] 
)
```

#persona(
  title: [Student],
  //img: none,
  name: [Max Mustermann],
  age: [26],
  family: [ledig],
  job: [Werksstudent],
  do-and-say: [
    Ich habe keine Ahnung, wie ich mit LaTex oder Word eine Dokumentation oder Abschlussarbeit schreiben soll. Das ist mir zu viel Arbeit alles händisch anpassen zu müssen.
  ],
  wishes: [
    Ein Template, welches ich sowohl für Dokumentationen als auch Abschlussarbeiten verwenden kann.
  ],
  see-and-hear: [
    - Word ist nicht besonders nutzerfreundlich, wenn es um das erstellen eines professionellen Dokumentes geht.
    - LaTex ist ein Urgestein, welches zu mächtig ist, um es gut verstehen zu können.
  ],
  challenges: [
    - Professoren davon zu überzeugen, dass es auch neue und schönere Möglichkeiten gibt, Dokumente zu erstellen
    - Das dieses Template verwendet werden darf.
  ],
  typical-day: [
    Projektarbeit und Dokumentation schreiben.
  ],
  goals: [
    Eine einfachere Möglichkeit Dokumentationen und Abschlussarbeiten zu erstellen, ohne dabei Word oder LaTex verwenden zu müssen.
  ] 
)

#pagebreak()
== Retrospektive (`retro`)

```Typst
#retro(
  primary-color: dark-blue,
  secondary-color: blue,
  text-color: dark-grey,
  background-color: light-blue,
  heading-starts-with: 2,
  day: txt-todo,
  sprint: none,
  info: none,
  img: image("images/starfish.png", height: 100pt),
  more: none,
  keep: none,
  start: none,
  stop: none,
  less: none,
  improvements: none,
  impediments: none,
  measures: none
)
```

#pagebreak()
*Beispiel*:

```Typst
#retro(
  heading-starts-with: 3,
  day: [29.07.2024],
  sprint: [1],
  info: [
    Das ist meine Beschreibung der Retrospektive.
  ],
  //img: none,
  more: [
    Verständnis für neue Technologien und Programmiersprachen
  ],
  keep: none,
  start: [
    Dokumentationen und Abschlussarbeiten immer mit Typst erstellen
  ],
  stop: none,
  less: none,
  improvements: [
    - Einfacheres Schreiben von Dokumentationen und Abschlussarbeiten
    - Einheitliche Vorlage für alle Dokumentationen an der Universität
  ],
  impediments: [
    - Formalitäten und Design-Richtlinien
  ],
  measures: [
    - Mit Professoren reden
  ],
)
```

#pagebreak()
#retro(
  heading-starts-with: 3,
  day: [29.07.2024],
  sprint: [1],
  info: [
    Das ist meine Beschreibung der Retrospektive.
  ],
  //img: none,
  more: [
    Verständnis für neue Technologien und Programmiersprachen
  ],
  keep: none,
  start: [
    Dokumentationen und Abschlussarbeiten immer mit Typst erstellen
  ],
  stop: none,
  less: none,
  improvements: [
    - Einfacheres Schreiben von Dokumentationen und Abschlussarbeiten
    - Einheitliche Vorlage für alle Dokumentationen an der Universität
  ],
  impediments: [
    - Formalitäten und Design-Richtlinien
  ],
  measures: [
    - Mit Professoren reden
  ],
)

#pagebreak()
== SMART-Tabelle (`smart`)

```Typst
#smart(
  primary-color: dark-blue,
  text-color: dark-grey,
  background-color: light-blue,
  justify: false,
  s: txt-todo,
  m: txt-todo,
  a: txt-todo,
  r: txt-todo,
  t: txt-todo
)
```

*Beispiel*:

```Typst
#smart(
  justify: false,
  s: [
    #lorem(10)
  ],
  m: [
    #lorem(10)
  ],
  a: [
    #lorem(10)
  ],
  r: [
    #lorem(10)
  ],
  t: [
    #lorem(10)
  ]
)
```

#smart(
  justify: false,
  s: [
    #lorem(10)
  ],
  m: [
    #lorem(10)
  ],
  a: [
    #lorem(10)
  ],
  r: [
    #lorem(10)
  ],
  t: [
    #lorem(10)
  ]
)

#pagebreak()
== User Story

```Typst
#user-story(
  primary-color: dark-blue,
  text-color: dark-grey,
  background-color: light-blue,
  id: txt-todo,
  title: txt-todo,
  sprint: txt-todo,
  status: txt-todo,
  description: txt-todo,
  url: "",
  url-without-id: "",
  acceptance-criteria: none,
  s: none,
  m: none,
  a: none,
  r: none,
  t: none,
  body
)
```

#pagebreak()
*Beispiel*:

```Typst
#user-story(
  id: [1],
  title: [Der Titel der User Story],
  sprint: [1],
  status: [Abgenommen],
  description: [
    #lorem(10)
  ],
  s: [
    #lorem(10)
  ],
  m: [
    #lorem(10)
  ],
  a: [
    #lorem(10)
  ],
  r: [
    #lorem(10)
  ],
  t: [
    #lorem(10)
  ],
  lorem(10)
)
```

#user-story(
  id: [1],
  title: [Der Titel der User Story],
  sprint: [1],
  status: [Abgenommen],
  description: [
    #lorem(10)
  ],
  s: [
    #lorem(10)
  ],
  m: [
    #lorem(10)
  ],
  a: [
    #lorem(10)
  ],
  r: [
    #lorem(10)
  ],
  t: [
    #lorem(10)
  ],
  none
)

#pagebreak()
#set heading(numbering: none)

= Besonderer Dank und Empfehlung

Bei der Erstellung und Veröffentlichung dieses Templates war die Unterstützung einer Person und ihres Templates von unschätzbarem Wert. Dank ihrer Hilfe konnte ich dieses Template für alle zugänglich machen:

#text(size: 1.5em)[#link("https://github.com/SillyFreak", "Clemens Koza (SillyFreak)")]

Ich empfehle, sich auch seine Templates anzuschauen:
- #link("https://github.com/TGM-HIT/typst-diploma-thesis")
- #link("https://github.com/SillyFreak/typst-package-template")\
  Fork von: #link("https://github.com/typst-community/typst-package-template")\
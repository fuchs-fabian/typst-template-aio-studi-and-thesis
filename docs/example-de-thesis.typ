#import "../src/lib.typ": *

// md in .typ umwandeln: pandoc README.md -o README.typ

#show: project.with(
  lang: "de",
  authors: (
    (
      name: "Max Mustermann",
      id: "12 34 567",
      email: "mustermann@email.com"
    ),
  ),
  title: "Beispiel Thesis",
  subtitle: "Deutsch",
  date: "29.07.2024",
  version: none,
  thesis-compliant: true,

  // Format
  side-margins: (
    left: 3.5cm,
    right: 3.5cm,
    top: 3.5cm,
    bottom: 3.5cm
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
  cover-sheet: (
    university: (
      name: "University of Applied Typst Sciences",
      street: "Musterstraße 1",
      city: "D-12345 Musterstadt",
      logo: none
    ), 
    employer: (
      name: "Arbeitgeber xy",
      street: "Musterstraße 2",
      city: "D-12345 Musterstadt",
      logo: none
    ), 
    cover-image: none,
    description: [
      Bachelorarbeit zur Erlangung des akademischen Grades Bachelor of Science
    ],
    faculty: "Ingenieurwissenschaften",
    programme: "Typst Sciences",
    semester: "SoSe2024",
    course: "Templates with Typst",
    examiner: "Prof. Dr.-Ing Mustermann",
    second-examiner: "Prof. Dr.-Ing Musterfrau",
    submission-date: "30.07.2024",
  ),

  // Declaration
  custom-declaration: none,
  declaration-on-the-final-thesis: (
    legal-reference: "§42",
    thesis-name: "Bachelorarbeit",
    consent-to-publication-in-the-library: true,
    genitive-of-university: "University of Applied Typst Sciences"
  ),

  // Abstract
  abstract: [
    Eine knappe Zusammenfassung (falls erforderlich) in deutscher und/oder englischer Sprache skizziert auf etwa 1/2 bis 1 Seite die Problemstellung, die verwendete(n) Methode(n) und das wichtigste Ergebnis.
  ],

  // Outlines
  outlines-indent: 1em,
  depth-toc: 4,
  show-list-of-figures: false, // Wird trotzdem angezeigt, da es i.d.R. Pflicht ist
  show-list-of-abbreviations: true, // Taucht nur auf, wenn tatsächlich mit gls Abkürzungen im Text aufgerufen werden
  list-of-abbreviations: (
    (
      key: "uoats",
      short: "UOATS",
      plural: "",
      long: "University of Applied Typst Sciences",
      longplural: "",
      description: [
        Universität, welche eigentlich nicht existiert
      ],
      group: "University",
    ),
    (
      key: "repo-vorlage",
      short: "aio-studi-and-thesis",
      long: "Repository der aktuellen Typst-Vorlage",
      description: [
        #link("https://github.com/fuchs-fabian/typst-template-aio-studi-and-thesis")
      ]
    ),
  ),
  show-list-of-formulas: true,
  // `custom-outlines` kann ignoriert werden. Das ist nur wichtig, wenn die zur Verfügung stehenden Verzeichnisse nicht dem entsprechen, was benötigt wird.
  custom-outlines: ( // none
    (
      title: none,   // required
      custom: none   // required
    ),
  ),
  show-list-of-tables: true,
  show-list-of-todos: true,
  literature-and-bibliography: [ // Im Template ist ein Beispiel enthalten
    Hier ist meine Literatur...
  ],
  list-of-attachements: (
    (a: [ Irgendeine Anlage ]),
    (a: [ Noch eine Anlage ]),
  )
)

= Einleitung

Das Ihnen vorliegende Dokument dient als Vorlage für wissenschaftliche Seminar- und Abschlussarbeiten. 
Diese Vorlage kann vielseitig verwendet werden. Bitte klären Sie jedoch mit Ihrem Betreuer/Ihrer Betreuerin, ob sie den Vorgaben des jeweiligen Studienfachs entspricht, bevor Sie sie verwenden und passen Sie die Vorlage ggf. an.

Für die Vorbereitung Ihrer wissenschaftlichen Arbeit empfehlen wir Ihnen außerdem, die Ressourcen der Bibliothek zu nutzen.

Dort finden Sie diverse Informationen zu Themen wie Zeitmanagement, Fachliteratur oder richtiges Zitieren.

Sichern Sie diese Dokumentvorlage bitte mit "GIT" oder einem ZIP-Export durch die Typst-eigene Backup-Funktion.

*Wichtiger Hinweis*: Diese Vorlage ersetzt nicht die konkreten Vorgaben der jeweiligen Fächer. Falls spezifische formale Anforderungen in Ihrem Fach existieren, sind diese zu beachten.

= Allgemeiner Aufbau

In diesem Abschnitt erhalten Sie grundlegende Vorgaben für den Aufbau Ihrer Arbeit und erfahren, aus welchen Bestandteilen eine wissenschaftliche Arbeit üblicherweise besteht.

== Abfolge der Abschnitte

Folgende Teile sollten in Ihrer wissenschaftlichen Arbeit enthalten sein:

+ Deckblatt
+ Erklärung
+ Abstract (optional)
+ Inhaltsverzeichnis
+ Abbildungsverzeichnis
+ Abkürzungsverzeichnis
+ Formelverzeichnis
+ Tabellenverzeichnis
+ Einleitung
+ Hauptteil
+ Schluss/Zusammenfassung/Fazit
+ Literatur-/Quellenverzeichnis
+ Anlagenverzeichnis

== Deckblatt

Das Deckblatt beinhaltet Angaben zum Titel der Abschlussarbeit, zum Verfasser der Arbeit sowie zum Datum der Abgabe. Ebenso sind hier Informationen zum Studiengang, zu den Prüfenden und zur Fakultät anzugeben. Das Deckblatt wird nicht mit einer Seitenzahl versehen. Bitte beachten Sie: TODOs müssen Sie mit Ihren individuellen Informationen ersetzt werden!

== Inhaltsverzeichnis

Es wird empfohlen, eine Dezimalgliederung zu verwenden, ähnlich der Struktur in diesem Dokument. Falls innerhalb eines Kapitels Unterüberschriften genutzt werden, sollten mindestens zwei existieren. Dort, wo beispielsweise eine Nummerierung wie 2.1 vorliegt, sollte auch eine 2.2 vorhanden sein.

Das Inhaltsverzeichnis gibt stets die Seitenzahlen für die aufgeführten Gliederungspunkte an, ist jedoch selbst nicht in diesem Verzeichnis aufgeführt. Die Seiten, die das Inhaltsverzeichnis einnimmt, können mit römischen Ziffern nummeriert werden.

Für eine Abschlussarbeit ist es üblich, im Hauptteil eine Gliederungstiefe von mindestens drei Ebenen zu verwenden. In der Regel werden jedoch nur bis zu vier Ebenen im vorderen Teil des Inhaltsverzeichnisses abgebildet. Bitte beachten Sie an dieser Stelle dringend die spezifischen Vorgaben in Ihrem Fach.

In dieser Vorlage wird das Inhaltsverzeichnis automatisch für die Überschriftenebenen 1 bis 4 generiert. Dies setzt jedoch voraus, dass Sie `depth-toc` nicht überschreiben.

== Literaturverzeichnis

Das Literaturverzeichnis richtet sich nach den Vorgaben der Betreuenden bzw. dem vorgegeben Zitierstil. Es wird häufig nach den Nachnamen der Autoren in alphabetischer Reihenfolge geordnet und beinhaltet ausschließlich die im Text verwendeten Quellen. Werke desselben Autors werden nach Erscheinungsjahr sortiert, wobei Sie selbst für eine eindeutige Unterscheidung bei Schriften aus demselben Jahr sorgen müssen.

In der technischen Fachwelt hingegen wird oft im IEEE-Stil zitiert, was auch auf das Literaturverzeichnis entscheidende Auswirkungen hat.

Das Literaturverzeichnis listet in diesem Fall die Werke in der Reihenfolge ihrer Erstnennung im Text auf, wobei die zugewiesenen Zahlen als Orientierung dienen. Es ist somit numerisch und nicht alphabetisch sortiert, um eine direkte Korrelation zwischen den Zitaten im Text und den detaillierten Referenzen im Literaturverzeichnis zu ermöglichen.

Im Fließtext werden also Zahlen verwendet, um auf Einträge im Literaturverzeichnis zu verweisen, beispielsweise durch [1]. Diese Ziffer repräsentiert ein spezifisches Werk und wird immer wieder verwendet, wann immer das Werk erneut zitiert wird. Für Verweise auf mehrere Werke in einem Zitat können die Zahlen in einer einzigen Klammer kombiniert werden, wie in den Beispielen [2,3,8] oder [7-9] gezeigt.

Beachten Sie darüber hinaus zur Verwendung des Zitierstils, des Nachweissystems (Fußnoten, Textnachweise, Index, etc.) und zur Gestaltung des Literaturverzeichnisses die Vorgaben Ihrer Betreuenden.
Für die effektive Verwaltung der genutzten Literatur bieten sich geeignete Softwaretools wie Zotero an, die mit verschiedenen Textverarbeitungsprogrammen kompatibel sind.

== Weitere Verzeichnisse

Abbildungen, Abkürzungen, Formeln und Tabellen werden in den entsprechenden Verzeichnissen aufgeführt. In dieser Vorlage sind sie direkt nach dem Inhaltsverzeichnis platziert, wobei die Seiten römisch nummeriert werden.

Die Überschriften der Verzeichnisse (z. B. Abbildungsverzeichnis) werden nicht nummeriert.

Bitte informieren Sie sich darüber hinaus, ob in Ihrem Fach Abbildungen und Tabellen bei der Berechnung der vorgegebenen Seitananzahl berücksichtigt werden. Dies macht es erforderlich, dass ein Fork von dem #gls("repo-vorlage", long: true) erstellt werden muss. Dies ist aktuell nicht anpassbar.

= Formatierung

Dieses Kapitel thematisiert die Formatierung und Gestaltung der Vorlage für wissenschaftliche Arbeiten.

== Seitennummerierung

Die vorliegende Dokumentvorlage folgt der Gliederung mit römischen und arabischen Ziffern: Alle Abschnitte nach dem Deckblatt und vor dem eigentlichen Text (eventuelle Kurzfassung/Abstract, Inhaltsverzeichnis, gegebenenfalls Abbildungs-/Tabellenverzeichnis, gegebenenfalls Abkürzungsverzeichnis) sind seitenweise mit römischen Ziffern nummeriert, während die Seiten ab dem eigentlichen Textteil mit arabischen Ziffern versehen werden.

Die Seitennummerierung ist nicht einheitlich geregelt und abhängig von den individuellen Vorlieben Ihres Betreuenden. Die Seitenzahlen können entweder unten mittig, oben mittig oder unten rechts platziert werden. Das Deckblatt erhält in keinem Fall eine Seitennummerierung.

Sofern eine Anpassung erforderlich ist, ist wieder ein Fork von dem #gls("repo-vorlage", long: true) notwendig.

== Seitenlayout

Diese Vorlage ist sowohl für einen einseitigen als auch für einen zweiseitigen Druck angelegt.

Die Seitenränder betragen oben und unten jeweils 3,5 cm. Innerhalb dieser Seitenränder existiert die Kopf- und Fußzeile.

Wegen der Bindung und der Korrekturen Ihrer Prüfenden ist sowohl links als auch rechts ein Rand von 3,5 cm eingestellt.

Wie auch bereits bei diversen anderen Einstellungen, beachten Sie bitte auch hier die Vorgaben Ihrer Prüfenden bzw. Ihres Fachs.

== Kopfzeile

Die Vorlage wurde so konfiguriert, dass die aktuelle Hauptüberschrift eines Kapitels (Ebene 1) immer korrekt in den Kopfzeilen der zugehörigen Seiten erscheint.

== Quellenangaben

Die Art der Quellenangabe kann, abhängig vom Zitierstil, als Fußnote, Indexnummer oder Kurzverweis im Text erfolgen. Die Auswahl des passenden Zitierstils richtet sich immer nach Ihrer Fachrichtung und häufig sogar nach den individuellen Anforderungen der Prüfenden.
Wir legen Ihnen nahe, sich sorgfältig über die korrekte Zitierweise in Ihrem Fach zu informieren.

== Abbildungen und Tabellen

Bitte achten Sie darauf, dass Grafiken und Tabellen gut verständlich, eindeutig und lesbar sind. Bedenken Sie, dass Sie alle Abbildungen und Tabellen beschriften und somit in das entsprechende Verzeichnis aufnehmen müssen.

Hierzu gehen Sie bei Abbildungen wie folgt vor:

```Typst
#figure(caption: "Beispielbild")[
  #image("../manuals/certificate.png", width: 10em)
]
```

#figure(caption: "Beispielbild")[
  #image("certificate.png", width: 10em)
]

Bei Tabellen ist die Vorgehensweise sehr ähnlich:

```Typst
#figure(caption: "Beispieltabelle")[
  #table(
    columns: 2,
    [hier steht etwas], [hier auch],
    [und hier], [aber auch hier],
  )
]
```

#figure(caption: "Beispieltabelle")[
  #table(
    columns: 2,
    [hier steht etwas], [hier auch],
    [und hier], [aber auch hier],
  )
]

Somit werden die Abbildungen und Tabellen automatisch in dem Inhaltsverzeichnis aufgenommen.

#pagebreak()
== Abkürzungen

Damit Abkürzungen im Abkürzungsverzeichnis auftauchen, müssen lediglich 2 Schritte gemacht werden:

1. Hinzufügen der Abkürzung oben in `show: project.with(...)`:

```Typst
list-of-abbreviations: (
  (
    key: "uoats",
    short: "UOATS",
    plural: "",
    long: "University of Applied Typst Sciences",
    longplural: "",
    description: [
      Universität, welche eigentlich nicht existiert
    ],
    group: "University",
  ),
)
```

2. Aufruf der Abkürzung mit `gls` oder `glspl` (siehe #link("https://typst.app/universe/package/glossarium", "Typst package \"glossarium\"")):

```Typst
#gls("uoats")
```

#gls("uoats")


== Formeln

Um Formeln im Formelverzeichnis aufzunehmen muss folgender Syntax verwendet werden:

```Typst
#figure(
  kind: custom-figure-kind.formula,
  caption: "Pythagoras",
  $ a^2 + b^2 = c^2 $
)
```

#figure(
  kind: custom-figure-kind.formula,
  caption: "Pythagoras",
  $ a^2 + b^2 = c^2 $
)

== Formatvorlagen

Es gibt nur diese eine Vorlage wenn sie #gls("repo-vorlage") nutzen. Verwende sie und Sie werden viel Zeit sparen. Die Zeit, sich Gedanken machen zu müssen, wie etwas formatiert oder eingestellt werden muss, ist vorbei. Falls Sie dennoch Anpassungen vornehmen möchten, ist dies großteils an einer Stelle möglich.

Außer Sie greifen natürlich auf Word zurück. Dann gilt: Viel Erfolg und reichlich Nerven.

== Schrift

Wenn die Schriftart *Roboto* existiert, wird diese standardmäßig verwendet. Passen Sie die Schriftart bei Bedarf an.

Die voreingestellte Schriftgröße ist *11pt*.

Der Zeilenabstand in diesem Dokument ist auf *0.65em* eingestellt. Für den Textteil ist die Textausrichtung Blocksatz vorgesehen während in Verzeichnissen linksbündig gearbeitet wird.

== Abschnittsumbrüche

Sind durch die Verwendung dieser Vorlage nicht notwendig.

Es wird automatisch ein Umbruch bei Überschriften der Ebene 1 vorgenommen.

Wenn Sie einen Umbruch machen möchten können Sie dies einfach folgendermaßen tun:

```Typst
#pagebreak()
```

Es besteht keine Notwendigkeit, Kopf- und Fußzeilen anzupassen. Dies wird automatisch gehandhabt.

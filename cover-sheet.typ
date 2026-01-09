#import "lib.typ": is-not-none-or-empty

#let get-cover-sheet(
  university: (
    name: "UNIVERSITÄTS_NAME",
    logo: square(size: 15mm, stroke: 2pt),
  ),
  company: (
    name: "FIRMEN_NAME",
    logo: square(size: 15mm, stroke: 2pt),
  ),
  title: "THESIS_TITEL",
  degree: (
    level: "AKADEMISCHER_GRAD",
    title: "AKADEMISCHER_TITEL",
  ),
  author: (
    name: "AUTHOR_NAME",
    id: "MATRIKEL_NUMMER",
  ),
  faculty: "FAKULTÄT",
  examiner: "ERSTPRÜFER",
  second_examiner: none,
  supervisor: "BETRIEBLICHE_BETREUUNG",
  timeframe: (
    from: "TIMEFRAME_FROM",
    to: "TIMEFRAME_TO",
  ),
  thesis_number: none,
) = {
  set text(size: 11pt)
  set par(spacing: 0.75em)

  align(center)[
    #box(university.logo, height: 12mm)
    #box(company.logo, height: 12mm)
  ]

  align(center)[
    // #set par(leading: 1em, spacing: 0.5em)

    #v(25mm)

    #block()[
      #university.name

      #faculty
    ]

    #v(10mm)

    #line(length: 100%)

    #block(inset: (y: 1em))[
      #heading(outlined: false, {
      set text(1.2em)

        title
      })
    ]

    #line(length: 100%)

    #v(10mm)

    #heading(outlined: false)[*#(degree.level + "arbeit")*]

    Zur Erlangung des akademischen Grades

    #degree.title

    #v(1fr)

    #table(
      columns: (auto, auto),
      stroke: none,
      align: (right, left),
      "Vorgelegt von:", author.name,
      "Matrikelnummer:", author.id,
      ..if is-not-none-or-empty(thesis_number) { ("Nummer der Arbeit:", thesis_number) },
      ..if is-not-none-or-empty(second_examiner) {
        (
          "Erstgutachter:",
          examiner,
          "Zweitgutachter:",
          second_examiner,
        )
      } else {
        (
          "Gutachter:",
          examiner,
        )
      },
      "Betriebliche Betreuung:", supervisor,
      "Betrieb", company.name,
      "Zeitraum:", timeframe.from + " - " + timeframe.to,
    )
  ]
}

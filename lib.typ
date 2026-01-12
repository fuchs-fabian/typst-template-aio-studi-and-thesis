
#import "@preview/citegeist:0.2.0": load-bibliography
#import "@preview/codly:1.3.0": *

#import "utils.typ": *

#import "assets.typ": *

#let project(
  lang: "de",
  authors: (
    (
      name: "Unknown author", // required
      id: "",
      email: "",
    ),
  ),
  title: "Unknown title",
  subtitle: none,
  date: none,
  version: none,
  degree: "Bachelor",
  // Format
  side-margins: (
    left: 3.5cm, // required
    right: 3.5cm, // required
    top: 3.5cm, // required
    bottom: 3.5cm, // required
  ),
  h1-spacing: 0.5em,
  line-spacing: 1.1em,
  font-heading: "Lexend",
  font-text: "Vollkorn",
  font-size: 11pt,
  hyphenate: false,
  // Color settings
  primary-color: dark-blue,
  secondary-color: blue,
  text-color: dark-grey,
  background-color: light-blue,
  // Cover sheet
  cover-sheet: none,
  cover-image: none,
  description: none,
  faculty: none,
  programme: none,
  semester: none,
  course: none,
  location: "ORT",
  // Abstract
  abstract: none,
  // Outlines
  outlines-indent: 1em,
  depth-toc: 4, // none to disable
  show-list-of-figures: false,
  show-list-of-abbreviations: true,
  list-of-abbreviations: (
    "": (
      short: "", // required
      plural: "",
      long: "",
      longplural: "",
      description: none,
      group: "",
    ),
  ),
  show-list-of-formulas: false,
  custom-outlines: (
    // none
    (
      title: none, // required
      custom: none, // required
    ),
  ),
  show-list-of-tables: false,
  show-list-of-todos: false,
  literature-and-bibliography: none,
  attachements: none,
  body,
) = {
  import "@preview/hydra:0.6.2": hydra
  import "@preview/glossy:0.9.0": *
  import "declaration-of-independence.typ": *

  import "dictionary.typ": *

  // Metadata
  let date-format = if lang == "de" { "[day].[month].[year]" } else { "[day]/[month]/[year]" }

  set document(
    title: title + if is-not-none-or-empty(version) { " v" + version },
    author: authors.map(a => a.name),
  )

  // Basics
  set page(
    paper: "a4",
    flipped: false,
    margin: side-margins,
    header: context {
      let odd = calc.odd(here().page())

      align(
        if odd { right } else { left },
        text(size: 8.5pt, hydra(if not odd { 1 } else { 2 })),
      )
    },
    footer: context {
      let cnt = counter(page).display()

      let odd = calc.odd(counter(page).get().first())

      if odd {
        h(1fr)
      }

      text(fill: text-color, move(
        dx: 11mm * if odd { 1 } else { -1 },
        {
          if odd {
            h(1fr)
          }

          box(
            height: 1.5em,
            inset: (top: 0.2em, left: if odd { 0.25em } else { 0em }, right: if not odd { 0.25em } else { 0em }),
            stroke: (left: if odd { 1.5pt + black }, right: if not odd { 1.5pt + black }),
            [
              #cnt
            ],
          )

          if not odd {
            h(1fr)
          }
        },
      ))
    },
  )

  set text(
    lang: lang,
    font: font-text,
    size: font-size,
    fill: text-color,
  )

  show heading: it => text(font: font-heading, it)

  set quote(block: true)
  show quote: body => {
    box(stroke: (left: 3pt + luma(221)))[
      #v(0.5em)
      #pad(left: 0.5em, body)
      #v(0.5em)
    ]
  }

  use-dictionary()

  show: codly-init.with()

  show: body => {
    if show-list-of-abbreviations and is-not-none-or-empty(list-of-abbreviations) {
      show: init-glossary.with(list-of-abbreviations)

      body
    } else {
      body
    }
  }

  if is-not-none-or-empty(date) == false {
    date = datetime.today().display(date-format)
  }

  // Cover Sheet
  if is-not-none-or-empty(cover-sheet) {
    cover-sheet
  }
  pagebreak()

  // Content basics
  let get-heading-str(key) = get-lang-str(lang: lang, key)
  show heading.where(level: 1): set text(fill: primary-color)
  show heading.where(level: 1): it => {
    let is-num = it.numbering != none

    let br = if is-num {
      pagebreak(weak: true)
    } else {
      colbreak(weak: true)
    }

    br + it + v(h1-spacing)
  }

  set page(numbering: "1")

  set par(
    leading: line-spacing,
    spacing: line-spacing + 0.55em,
    justify: true,
  )

  set text(
    hyphenate: hyphenate,
  )

  let get-figure-caption(it) = [
    #set align(left)
    #h(1em)
    #box[
      *#it.supplement
      #context it.counter.display(it.numbering)*
      #text(fill: primary-color)[#it.body]
    ]
  ]

  show figure.caption.where(kind: image): it => get-figure-caption(it)
  show figure.caption.where(kind: table): it => get-figure-caption(it)
  show figure.caption.where(kind: custom-figure-kind.formula): it => get-figure-caption(it)
  show figure.where(kind: custom-figure-kind.formula): set figure(supplement: txt-supplement-formula, numbering: "1")

  set figure(numbering: n => {
    let hdr = counter(heading).get().first()
    let num = query(selector(heading).before(here())).last().numbering
    numbering(num, hdr, n)
  })

  show heading.where(level: 1): hdr => {
    counter(figure.where(kind: image)).update(0)
    counter(figure.where(kind: table)).update(0)
    hdr
  }

  show link: set text(fill: secondary-color.darken(60%))

  // Declaration
  roman-page[#get-declaration-of-independence(
    title: title,
    degree-level: degree.level,
    location: location,
    date: date,
  )]

  // Abstract
  if is-not-none-or-empty(abstract) {
    roman-page[
      #heading(depth: 1, bookmarked: true)[ #get-heading-str("abstract") ]

      #abstract()
    ]
  }

  // Table of contents (TOC)
  roman-page[
    #show outline.entry.where(level: 1): it => {
      v(1.5em, weak: true)
      upper(strong(it))
    }

    #outline(
      indent: outlines-indent,
      depth: if is-not-none-or-empty(depth-toc) { depth-toc } else { 4 },
    )
  ]

  // List of Formulas
  show math.equation.where(block: true): it => rect(width: 100%, fill: background-color)[
    #v(0.5em)
    #it
    #v(0.5em)
  ]

  // Custom outlines
  if is-not-none-or-empty(custom-outlines) {
    for o in custom-outlines {
      if o.title != none and o.custom != none {
        roman-page[
          #if is-not-none-or-empty(o.title) {
            heading(depth: 1, bookmarked: true)[ #o.title ]
          }
          #o.custom
        ]
      }
    }
  }

  // Body
  counter(page).update(1)

  if show-list-of-todos {
    page(numbering: "1")[

      #context {
        let elems = query(<todo>)

        if elems.len() == 0 { return }

        heading(depth: 1)[ TODOs ]

        for body in elems {
          text([+ #link(body.location(), body.text)], red)
        }
      }
    ]
  }

  set heading(numbering: "1.1")

  body

  counter(heading).update(0)
  set heading(numbering: "A.1.1")

  // Literature, bibliography, attachements
  if is-not-none-or-empty(literature-and-bibliography) {
    page[
      #heading(depth: 1, bookmarked: true)[ #get-heading-str("literature-and-bibliography") ]
      #literature-and-bibliography
    ]
  }

  // List of Tables
  if show-list-of-tables {
    page[
      #simple-outline(
        title: get-heading-str("list-of-tables"),
        indent: outlines-indent,
        target: figure.where(kind: table),
      )
    ]
  }

  // List of Figures
  page[
    #heading(depth: 1, bookmarked: true)[ #get-heading-str("list-of-figures") ]

    #simple-outline(
      indent: outlines-indent,
      target: figure.where(kind: image),
    )
  ]

  // List of Formulas
  if show-list-of-formulas {
    page[
      #simple-outline(
        title: get-heading-str("list-of-formulas"),
        indent: outlines-indent,
        target: figure.where(kind: custom-figure-kind.formula),
      )
    ]
  }

  // List of Abbreviations
  if show-list-of-abbreviations and is-not-none-or-empty(list-of-abbreviations) {
    page[
      #heading(depth: 1, bookmarked: true)[ #get-heading-str("list-of-abbreviations") ]

      #glossary(
        sort: true, // Optional: whether or not to sort the glossary
        ignore-case: false, // Optional: ignore case when sorting terms
        show-all: false, // Optional; Show all terms even if unreferenced
      )
    ]
  }

  // Attachments
  if is-not-none-or-empty(attachements) {
    page[
      #heading(depth: 1, bookmarked: true)[ #get-heading-str("list-of-attachements") ]

      #attachements
    ]
  }
}


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
  thesis-compliant: false,
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
  custom-cover-sheet: none,
  cover-sheet: (
    // none
    university: (
      // none
      name: none, // required
      street: none, // required
      city: none, // required
      logo: none,
    ),
    employer: (
      // none
      name: none, // required
      street: none, // required
      city: none, // required
      logo: none,
    ),
    cover-image: none,
    description: none,
    faculty: none,
    programme: none,
    semester: none,
    course: none,
    examiner: none,
    submission-date: none,
  ),
  // Declaration
  custom-declaration: none,
  declaration-on-the-final-thesis: (
    // none
    legal-reference: none, // required
    thesis-name: none, // required
    consent-to-publication-in-the-library: none, // required | true, false
    genitive-of-university: none, // required
  ),
  // Abstract
  abstract: none,
  abstract-function: none,
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

  import "dictionary.typ": *
  import "cover_sheet.typ": *
  import "declaration_on_the_final_thesis.typ": *

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
        if odd {right} else {left},
        text(size: 8.5pt,
        hydra(if not odd {1} else {2}))
      )
    },
    footer: context {
      let cnt = counter(page).display()

      let odd = calc.odd(counter(page).get().first())

      if odd {
        h(1fr)
      }

      text(fill: text-color, 
        move(
          dx: -1%,
          box(
            height: 1.5em,
            inset: (top: 0.2em, left: if odd {0.25em} else {0em}, right: if not odd {0.25em} else {0em}),
            stroke: (left: if odd {1.5pt + black}, right: if not odd {1.5pt + black}),
            [
              #cnt#v(1fr)
            ]
          )
        )
      )

      // TODO: shift outside of text

      if not odd {
        h(1fr)
      }
    }
  )

  set text(
    lang: lang,
    font: font-text,
    size: font-size,
    fill: text-color,
  )

  show heading: it => text(font: font-heading, it)

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
  if is-not-none-or-empty(custom-cover-sheet) == false and is-not-none-or-empty(cover-sheet) {
    let cover-sheet-dict-contains-key(key) = {
      return dict-contains-key(dict: cover-sheet, key)
    }

    get-cover-sheet(
      primary-color: primary-color,
      secondary-color: secondary-color,
      text-color: text-color,
      background-color: background-color,
      visualise-content-boxes: (flag: false, fill: background-color, stroke: text-color),
      university: if cover-sheet-dict-contains-key("university") { cover-sheet.university },
      employer: if cover-sheet-dict-contains-key("employer") { cover-sheet.employer },
      cover-image: if cover-sheet-dict-contains-key("cover-image") { cover-sheet.cover-image },
      date: date,
      version: version,
      title: title,
      subtitle: subtitle,
      description: if cover-sheet-dict-contains-key("description") { cover-sheet.description },
      authors: authors,
      faculty: if cover-sheet-dict-contains-key("faculty") { cover-sheet.faculty },
      programme: if cover-sheet-dict-contains-key("programme") { cover-sheet.programme },
      semester: if cover-sheet-dict-contains-key("semester") { cover-sheet.semester },
      course: if cover-sheet-dict-contains-key("course") { cover-sheet.course },
      examiner: if cover-sheet-dict-contains-key("examiner") { cover-sheet.examiner },
      submission-date: if cover-sheet-dict-contains-key("submission-date") { cover-sheet.submission-date },
    )
  } else {
    custom-cover-sheet
  }
  pagebreak()

  // Content basics
  let get-heading-str(key) = get-lang-str(lang: lang, key)
  show heading.where(level: 1): set text(fill: primary-color)
  show heading.where(level: 1): it => {
    let is-num = it.numbering != none

    let br = if not thesis-compliant {
      none
    } else if is-num {
      pagebreak(weak: true)
    } else {
      colbreak(weak: true)
    }

    br + it + v(h1-spacing)
  }

  set page(
    numbering: "1",
    // header: context { // NOTE: ehemalige Kopfzeile
    //   if thesis-compliant {
    //     align(
    //       left,
    //       text(weight: "bold", size: 8.5pt)[
    //         #let h1 = hydra(1, skip-starting: false)
    //
    //         #let numbered-heading = to-string(h1).split(regex("[.]\s")).at(1, default: none)
    //         #if numbered-heading != none {
    //           numbered-heading
    //         } else {
    //           h1
    //         }
    //       ],
    //     )
    //     v(-1em)
    //     line(length: 100%, stroke: 1.2pt + text-color)
    //   }
    // },
  )

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
  if is-not-none-or-empty(custom-declaration) {
    page(
      header: "",
      footer: "",
    )[
      #custom-declaration
    ]
  } else if thesis-compliant and is-not-none-or-empty(declaration-on-the-final-thesis) {
    page(
      header: "",
      footer: "",
    )[
      #get-declaration-on-the-final-thesis(
        lang: lang,
        legal-reference: declaration-on-the-final-thesis.legal-reference,
        thesis-name: declaration-on-the-final-thesis.thesis-name,
        consent-to-publication-in-the-library: declaration-on-the-final-thesis.consent-to-publication-in-the-library,
        genitive-of-university: declaration-on-the-final-thesis.genitive-of-university,
      )
    ]
  }

  counter(page).update(1)

  // Abstract
  if is-not-none-or-empty(abstract) or is-not-none-or-empty(abstract-function) {
    roman-page[
      #heading(depth: 1, bookmarked: true)[ #get-heading-str("abstract") ]

      #if is-not-none-or-empty(abstract) {
        abstract
      } else {
        abstract-function()
      }
    ]
  }

  // Table of contents (TOC)
  if thesis-compliant or is-not-none-or-empty(depth-toc) {
    page(
      numbering: none,
    )[
      #show outline.entry.where(level: 1): it => {
        v(1.5em, weak: true)
        upper(strong(it))
      }

      #outline(
        indent: outlines-indent,
        // If `depth-toc` is set to `none`, then it will be set to 4 if `thesis-compliant` is true
        depth: if is-not-none-or-empty(depth-toc) { depth-toc } else { 4 },
      )
    ]
  }

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

  let todos() = context {
    let elems = query(<todo>)

    if elems.len() == 0 { return }

    heading(depth: 1)[ TODOs ]

    for body in elems {
      text([+ #link(body.location(), body.text)], red)
    }
  }

  if show-list-of-todos { todos() }

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
  if thesis-compliant or show-list-of-figures {
    page[
      #heading(depth: 1, bookmarked: true)[ #get-heading-str("list-of-figures") ]

      #simple-outline(
        indent: outlines-indent,
        target: figure.where(kind: image),
      )
    ]
  }

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

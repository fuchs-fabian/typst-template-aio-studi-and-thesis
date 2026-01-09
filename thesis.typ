#import "lib.typ": *

#import "cover-sheet.typ": get-cover-sheet
#import "declaration-of-independence.typ": get-declaration-of-independence

#let thesis(
  body,
  title: "THESIS_TITEL",
  author: (
    name: "AUTHOR_NAME",
    id: "MATRIKEL_NUMMER",
  ),
  degree: (
    level: "Bachelor",
    title: "Bachelor of Engineering",
  ),
  timeframe: (
    from: "TIMEFRAME_FROM",
    to: "TIMEFRAME_TO",
  ),
  university: (
    name: "UNIVERSITÄT",
    logo: rect(height: 15mm, width: 45mm, stroke: 1pt)[university_logo],
  ),
  company: (
    name: "FIRMA",
    logo: rect(height: 15mm, width: 45mm, stroke: 1pt)[company_logo],
  ),
  faculty: "FAKULTÄT",
  examiner: "ERSTPRÜFER",
  second_examiner: none,
  supervisor: "BETRIEBLICHE_BETREUUNG",
  thesis_number: "THESIS_NUMBER",
  submission: (
    location: "ORT",
    date: "DATUM",
  ),
  abstract: none,
  abstract-function: none,
  list-of-abbreviations: none,
  literature-and-bibliography: none,
  attachements: none,
  font-heading: "Lexend",
  font-text: "Vollkorn",
  primary-color: dark-blue,
  secondary-color: blue,
  text-color: black,
  background-color: light-blue,
) = {
  project(
    body,
    lang: "de",
    authors: (author,),
    title: title,
    subtitle: none,
    date: submission.date,
    version: none,
    thesis-compliant: true,

    // Format
    side-margins: (
      inside: 32mm,
      outside: 30mm,
      top: 30mm,
      bottom: 30mm,
    ),
    h1-spacing: 0.5em,
    line-spacing: 1.1em,
    font-heading: font-heading,
    font-text: font-text,
    font-size: 12pt,
    hyphenate: true,

    // Color settings
    primary-color: primary-color,
    secondary-color: secondary-color,
    text-color: text-color,
    background-color: background-color,

    // Cover sheet
    custom-cover-sheet: get-cover-sheet(
      title: title,
      author: author,
      degree: degree,
      company: company,
      university: university,
      faculty: faculty,
      examiner: examiner,
      second_examiner: second_examiner,
      supervisor: supervisor,
      timeframe: timeframe,
      thesis_number: thesis_number,
    ),

    // Declaration
    custom-declaration: get-declaration-of-independence(
      title: title,
      degree-level: degree.level,
      location: submission.location,
      date: submission.date,
    ),

    // Abstract (eines von beiden)
    abstract: abstract, // Setze es auf none, wenn es nicht angezeigt werden soll // TODO: kontrollieren / überprüfen
    abstract-function: abstract-function,

    // Outlines
    outlines-indent: 1em,
    depth-toc: 4, // Wenn `thesis-compliant` true ist, dann wird es auf 4 gesetzt wenn hier none steht
    show-list-of-figures: false, // Wird immer angezeigt, wenn `thesis-compliant` true ist
    show-list-of-abbreviations: true, // Achtung: Schlägt fehl wenn glossary leer ist und trotzdem dargestellt werden soll!
    list-of-abbreviations: list-of-abbreviations,
    show-list-of-formulas: true, // Setze es auf false, wenn es nicht angezeigt werden soll
    custom-outlines: (
      // none
      (
        title: none, // required
        custom: none, // required
      ),
    ),
    show-list-of-tables: true, // Setze es auf false, wenn es nicht angezeigt werden soll
    show-list-of-todos: true, // Setze es auf false, wenn es nicht angezeigt werden soll
    literature-and-bibliography: literature-and-bibliography,
    attachements: attachements,
  )
}

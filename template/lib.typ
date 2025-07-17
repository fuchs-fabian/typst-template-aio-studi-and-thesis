//#import "@preview/aio-studi-and-thesis:0.1.1": *  // TODO: Change to latest version
#import "../src/lib.typ": *                         // TODO: Remove this line

#let additional-styling(body) = {

  // General table formatting
  show table.cell.where(y: 0): set text(fill: dark-blue, weight: "bold")
  show table.cell.where(x: 0): set par(justify: false)
  //#show table.cell.where(x: 0): set text(hyphenate: true)

  let frame(stroke) = (x, y) => (
    left: stroke,
    right: stroke,
    top: if y < 2 { stroke } else { 0pt },
    bottom: stroke,
  )

  set table(
    fill: (_, y) => if calc.odd(y) { light-blue },
    stroke: frame(dark-grey),
  )

  // Body
  body
}
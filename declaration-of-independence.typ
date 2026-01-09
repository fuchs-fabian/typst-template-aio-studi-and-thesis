#import "@preview/aio-studi-and-thesis:0.1.2": *

#let get-declaration-of-independence(
    title: "TITLE",
    degree-level: "DEGREE_LEVEL",
    location: "LOCATION",
    date: "DATE",
) = {
    [
        #set par(spacing: 2em)
        #set heading(outlined: false) // hide from toc

        = Erklärung der selbstständigen Anfertigung der #(degree-level + "thesis")
        Ich versichere hiermit wahrheitsgemäß, die #(degree-level + "thesis") mit dem Titel

        #align(center)[_ #title _]

        selbstständig angefertigt, alle benutzten Hilfsmittel vollständig und genau angegeben und
        alles einzeln kenntlich gemacht zu haben, was aus Arbeiten anderer unverändert oder mit
        Abänderungen entnommen wurde.
        Die Arbeit hat in gleicher oder ähnlicher Form noch keiner
        Prüfungsbehörde vorgelegen und ist auch noch nicht veröffentlicht worden.

        #v(5em)

        #[
            #set par(spacing: 0.5em)

            #line(length: 40%, stroke: 0.5pt)

            #location, den #date
        ]

        #v(1fr)

        = Sperrvermerk
        Dieses Dokument enthält vertrauliche Daten und Informationen, die ausschließlich für den internen Gebrauch bestimmt sind.
        Jegliche Verbreitung oder Vervielfältigung ist ohne vorherige schriftliche Genehmigung der Secon GmbH untersagt.
    ]
}

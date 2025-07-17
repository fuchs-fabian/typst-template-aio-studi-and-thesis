#import "../src/lib.typ": *

#show: project.with(
  lang: "en",
  authors: (
    (name: "Fabian Fuchs"),
  ),
  title: "aio-studi-and-thesis v0.1.2",
  subtitle: "English Manual",
  cover-sheet: (
    cover-image: none,
    description: [
      #text(fill: blue)[#link("https://github.com/fuchs-fabian/typst-template-aio-studi-and-thesis")]

      A template for students to create documentation and theses

      Translated with: #text(fill: blue.darken(60%))[#link("https://www.deepl.com")]
    ]
  ),
  abstract: [
    This template can be used for extensive documentation as well as for final theses such as bachelor theses.

    However, it should always be clarified in advance whether the template is accepted for the planned use.

    The template is suitable for both German-language and English-language theses.

    It is characterised by the fact that it is highly customisable despite the predefined design.

    Initially, all template parameters are optional by default. It is then suitable for documentation.
    To make it suitable for theses, only one parameter needs to be changed.
  ]
)

= Use of the template

After importing the template, a number of options are available. As it may be hard to tell, this template is highly customisable. But don't worry, all parameters are optional. However, it is recommended to specify at least one author under `authors` with `name` and assign a `title`.

It is important to know that external packages are available to the template user by default.

These are:
- #link("https://Typst.app/universe/package/codly", "codly") (Full functional scope)
- #link("https://Typst.app/universe/package/glossarium", "glossarium") (`gls`, `glspl`)

== Minimal use

The import of at least `project` is required.

```Typst
#show: project.with(
  // lang: "de",
  authors: (
    (name: "Your name"),
  ),
  title: "Title of the document"
)
```

If the template is to be used in English, `lang` must be changed to `"en"`.

#card[
  The translation was made with #link("https://www.deepl.com", "Deepl"), so that no guarantee can be given for the correctness and completeness of the translation.
]

== Maximum configuration options

If certain directories are to be hidden, only the parameters that have `show` in their name must be set to `false`.

If `custom-cover-sheet` is not `none`, the cover sheet is overwritten and `cover-sheet` no longer has any influence. The same applies to `custom-declaration`. If it is not `none`, then `declaration-on-the-final-thesis` is overwritten.

`declaration-on-the-final-thesis` only works if `thesis-compliant` is set to `true`.

If certain dictionaries are used, care must be taken to ensure that parameters with a `required` comment are also contained in the dictionary.

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
= Use of your own ‘Utils’

As there are some functions in Typst that are not available in other programming languages, for example, we have implemented them ourselves. These are also available to the user of the template.

== Colors used

```Typst
blue        // rgb("#009fe3")
dark-blue   // rgb("#152f4e")
light-blue  // rgb("#e8eff7")
dark-grey   // rgb("#4a4a49")
green       // rgb("#26a269")
purple      // rgb("#613583")
```

== Own logic functions

This facilitated the implementation of certain logics for the template.

=== Validation of whether something is `none` or an empty string (`""`).

```Typst
#is-not-none-or-empty(content)
```

=== Validation of whether a dictionary contains a specific `key`.

```Typst
#dict-contains-key(dict: (), key)
```

=== Conversion of content to a string

```Typst
#to-string(content)
```

== Prefabricated contents

=== Simple outline (`simple-outline`)

These are listed in the table of contents.

```Typst
#simple-outline(
  title: none,
  target: none,
  indent: 1em,
  depth: none
)
```

=== Content for signing (`signing`)

```Typst
#signing(text: none)
```

#v(1em)

#signing()

#pagebreak()
=== Uniform highlighting of keywords (`emphasised`)

```Typst
#emphasized(fill: dark-blue, it)
```

*Example*:

```Typst
#show "My keyword" : it => emphasized(fill: purple, it)
```

#show "My keyword" : it => emphasized(fill: purple, it)

My keyword

=== TODO Handling

To obtain the TODO string, simply call up the following:

```Typst
#txt-todo
```

#txt-todo

To have a TODO that can also be listed in a table of contents with TODOs and highlighted in the text, the following function can be used:

```Typst
#todo(it)
```

*Example*:

```Typst
#todo("Still to be completed")
// or
#todo[This must also be filled in]
```

#todo("Still to be completed")

#todo[This must also be filled in]

To generate a table of contents for these TODOs, the parameter `show-list-of-todos` in `project` must be set to `true`:

```Typst
show-list-of-todos: true,
```

#pagebreak()
= Use of the ‘general assets’

== Card (`card`)

```Typst
#card(
  primary-color: dark-blue,
  background-color: light-blue,
  title: none,
  img: none,
  body
)
```

=== Example of the simplest use

```Typst
#card[My text in a card]
```

#card[My text in a card]

=== Example with title

```Typst
#card(title: "My Card")[Content]
```

#card(title: "My Card")[Content]

=== Example with image

```Typst
#card(img: image("certificate.png"))[Content]
```

#card(img: image("certificate.png"))[Content]

#pagebreak()
=== Example with title and image

```Typst
#card(
  title: "Card with title and image",
  img: image("certificate.png")
)[Content]
```

#card(
  title: "Card with title and image",
  img: image("certificate.png")
)[Content]

== Author(s) box (`author-box`)

```Typst
#author-box(
  background-color: light-blue,
  plural: false,
  body
)
```

=== Example with one author

```Typst
#author-box[firstname lastname]
```

#author-box[firstname lastname]

=== Example with several authors

```Typst
#author-box(
  plural: true
)[firstname1 lastname1, firstname2 lastname2]
```

#author-box(
  plural: true
)[firstname1 lastname1, firstname2 lastname2]

#pagebreak()
== Button (`button`)

The fill color (`fill`), the border (`stroke`) and the text color (`text-color`) can be set here.

```Typst
#button(
  url: "",
  fill: none,
  stroke: none,
  text-color: none,
  body
)
```

=== Example of the simplest use

```Typst
#button[My Button]
```

#button[My button]

=== Example with a link

```Typst
#button(url: "https://github.com/fuchs-fabian")[My link]
```

#button(url: "https://github.com/fuchs-fabian")[My link]

#pagebreak()
= Use of the ‘Assets for project management’

#card[
  These assets are suitable for documentation. Please note that their use for a thesis must be agreed with the supervisor in advance.
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
*Example*:

```Typst
#persona(
  title: [Student],
  //img: none,
  name: [Max Mustermann],
  age: [26],
  family: [single],
  job: [working student],
  do-and-say: [
    I have no idea how to write documentation or a thesis using LaTex or Word. It's too much work for me to have to adapt everything by hand.
  ],
  wishes: [
    A template that I can use for both documentation and theses.
  ],
  see-and-hear: [
    - Word is not particularly user-friendly when it comes to creating a professional document.
    - LaTex is too powerful to understand well.
  ],
  challenges: [
    - To convince professors that there are new and more beautiful ways to create documents
    - That this template may be used.
  ],
  typical-day: [
    Writing project work and documentation.
  ],
  goals: [
    An easier way to create documentation and theses without having to use Word or LaTex.
  ] 
)
```

#persona(
  title: [Student],
  //img: none,
  name: [Max Mustermann],
  age: [26],
  family: [single],
  job: [working student],
  do-and-say: [
    I have no idea how to write documentation or a thesis using LaTex or Word. It's too much work for me to have to adapt everything by hand.
  ],
  wishes: [
    A template that I can use for both documentation and theses.
  ],
  see-and-hear: [
    - Word is not particularly user-friendly when it comes to creating a professional document.
    - LaTex is too powerful to understand well.
  ],
  challenges: [
    - To convince professors that there are new and more beautiful ways to create documents
    - That this template may be used.
  ],
  typical-day: [
    Writing project work and documentation.
  ],
  goals: [
    An easier way to create documentation and theses without having to use Word or LaTex.
  ] 
)

#pagebreak()
== Retrospective (`retro`)

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
*Example*:

```Typst
#retro(
  heading-starts-with: 3,
  day: [29/07/2024],
  sprint: [1],
  info: [
    This is my description of the retrospective.
  ],
  //img: none,
  more: [
    Understanding new technologies and programming languages
  ],
  keep: none,
  start: [
    Always create documentation and theses with Typst
  ],
  stop: none,
  less: none,
  improvements: [
    - Easier writing of documentation and theses
    - Standardised template for all documentation at the university
  ],
  impediments: [
    - Formalities and design guidelines
  ],
  measures: [
    - Talking to professors
  ],
)
```

#pagebreak()
#retro(
  heading-starts-with: 3,
  day: [29/07/2024],
  sprint: [1],
  info: [
    This is my description of the retrospective.
  ],
  //img: none,
  more: [
    Understanding new technologies and programming languages
  ],
  keep: none,
  start: [
    Always create documentation and theses with Typst
  ],
  stop: none,
  less: none,
  improvements: [
    - Easier writing of documentation and theses
    - Standardised template for all documentation at the university
  ],
  impediments: [
    - Formalities and design guidelines
  ],
  measures: [
    - Talking to professors
  ],
)

#pagebreak()
== SMART-Table (`smart`)

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

*Example*:

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
*Example*:

```Typst
#user-story(
  id: [1],
  title: [The title of the user story],
  sprint: [1],
  status: [Accepted],
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
```

#user-story(
  id: [1],
  title: [The title of the user story],
  sprint: [1],
  status: [Accepted],
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

= Special thanks and recommendation

In creating and publishing this template, the support of one person and their template was invaluable. Thanks to their help, I was able to make this template available to everyone:

#text(size: 1.5em)[#link("https://github.com/SillyFreak", "Clemens Koza (SillyFreak)")]

I recommend taking a look at his templates as well:
- #link("https://github.com/TGM-HIT/typst-diploma-thesis")
- #link("https://github.com/SillyFreak/typst-package-template")\
  Fork of: #link("https://github.com/typst-community/typst-package-template")\
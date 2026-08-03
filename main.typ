#let introduction = include "chapters/01-introduction.typ"
#let accounting = include "chapters/02-accounting.typ"
#let costing = include "chapters/03-costing.typ"


#document("index.html", title: [Example Book])[
  #title()

  This is the online version of *Example Book*.

  == Chapters

  - #link(<html-introduction>)[Introduction]
  - #link(<html-accounting>)[Accounting Fundamentals]
  - #link(<html-costing>)[Introduction to Costing]

  == Other formats

  #link(<book-pdf>)[Download the complete book as PDF.]
]


#document("chapters/introduction.html", title: [Introduction])[
  #introduction

  #link(<html-accounting>)[Next: Accounting Fundamentals →]
] <html-introduction>


#document("chapters/accounting.html", title: [Accounting Fundamentals])[
  #link(<html-introduction>)[← Previous: Introduction]

  #accounting

  #link(<html-costing>)[Next: Introduction to Costing →]
] <html-accounting>


#document("chapters/costing.html", title: [Introduction to Costing])[
  #link(<html-accounting>)[← Previous: Accounting Fundamentals]

  #costing
] <html-costing>

#document(
  "book.pdf",
  title: [Example Book],
)[
  #set page(
    paper: "a4",
    margin: 2.5cm,
  )

  #set text(
    size: 11pt,
  )

  #align(center)[
    #text(24pt, weight: "bold")[
      Example Book
    ]

    #v(1em)

    A demonstration book built with Typst.
  ]

  #pagebreak()

  #outline(
    title: [Contents],
  )

  #pagebreak()

  #introduction

  #pagebreak()

  #accounting

  #pagebreak()

  #costing
] <book-pdf>


// ------------------------------------
// Assets
// ------------------------------------

#asset(
  "favicon.ico",
  read("images/favicon.ico", encoding: none),
)
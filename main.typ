#let introduction = include "chapters/01-introduction.typ"
#let accounting = include "chapters/02-accounting.typ"
#let costing = include "chapters/03-costing.typ"
#let foreword = include "foreword.typ"

#let common = [
  #foreword
]

#let theme = [
  #html.elem("link", attrs: (rel: "stylesheet", href: "../style.css"))
  #html.script(src: "../theme.js")
  #html.button(id: "theme-toggle", class: "theme-btn")[Theme: Tomato]
]

#document("index.html", title: [Example Book])[
  #html.elem("link", attrs: (rel: "stylesheet", href: "style.css"))
  // Add the script and button
  #html.script(src: "theme.js")
  #html.button(id: "theme-toggle", class: "theme-btn")[Theme: Tomato]


  #title()
  #set heading(numbering: "1.")
  #outline()
  #foreword

  This is the online version of *Example Book*.

  == Chapters

  - #link(<html-introduction>)[Introduction]
  - #link(<html-accounting>)[Accounting Fundamentals]
  - #link(<html-costing>)[Introduction to Costing]

  == Other formats

  #link(<book-pdf>)[Download the complete book as PDF.]
]


#document("chapters/introduction.html", title: [Introduction])[
  #theme
  #introduction
  #link(<html-accounting>)[Next: Accounting Fundamentals →]
] <html-introduction>


#document("chapters/accounting.html", title: [Accounting Fundamentals])[
  #theme
  #link(<html-introduction>)[← Previous: Introduction]
  #accounting
  #link(<html-costing>)[Next: Introduction to Costing →]
] <html-accounting>


#document("chapters/costing.html", title: [Introduction to Costing])[
  #theme
  #link(<html-accounting>)[← Previous: Accounting Fundamentals]
  #costing
] <html-costing>

#document("book.pdf", title: [Example Book])[
  #set page(paper: "a4", margin: 2.5cm)
  #set text(size: 11pt)

  #align(center)[
    #text(24pt, weight: "bold")[Example Book]
    #v(1em)
    A demonstration book built with Typst.
  ]
  #pagebreak()

  #set heading(numbering: "1.")
  #outline()
  #pagebreak()

  #introduction
  #pagebreak()

  #accounting
  #pagebreak()

  #costing
] <book-pdf>


// Export these into the output bundle
#asset("style.css", read("static/style.css"))
#asset("variables.css", read("static/variables.css"))
#asset("base.css", read("static/base.css"))
#asset("components.css", read("static/components.css"))
#asset("theme.js", read("static/theme.js")) 
#asset("favicon.ico", read("images/favicon.ico", encoding: none))
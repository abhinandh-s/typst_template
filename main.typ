#let web-theme(rel-path: "./") = [
  #html.elem("link", attrs: (rel: "stylesheet", href: rel-path + "style.css"))
  #html.elem("link", attrs: (rel: "stylesheet", href: rel-path + "variables.css"))
  #html.elem("link", attrs: (rel: "stylesheet", href: rel-path + "base.css"))
  #html.elem("link", attrs: (rel: "stylesheet", href: rel-path + "components.css"))
  #html.script(src: rel-path + "theme.js")
  #html.button(id: "theme-toggle", class: "theme-btn")[Theme: Tomato]
]

// ==========================================
// HTML Pages
// ==========================================

#document("index.html", title: [Example Book])[
  #web-theme(rel-path: "./")
  
  #align(center)[
    = Abhi's Guide to Indian Partnership Act, 1932
    A simplified study guide
  ]

  #include "foreword.typ"

  == Table of Contents
  - #link(<html-introduction>)[1. Introduction]
  - #link(<html-accounting>)[2. Accounting Fundamentals]
  - #link(<html-costing>)[3. Introduction to Costing]

  == Downloads
  - #link(<book-pdf>)[Download Full PDF Edition]
]

#document("chapters/introduction.html", title: [Introduction])[
  #web-theme(rel-path: "../")
  #include "chapters/01-introduction.typ"
  #v(2em)
  #link(<html-accounting>)[Next: Accounting Fundamentals →]
] <html-introduction>

#document("chapters/accounting.html", title: [Accounting Fundamentals])[
  #web-theme(rel-path: "../")
  #link(<html-introduction>)[← Previous: Introduction] | #link(<html-costing>)[Next: Introduction to Costing →]
  #include "chapters/02-accounting.typ"
] <html-accounting>

#document("chapters/costing.html", title: [Introduction to Costing])[
  #web-theme(rel-path: "../")
  #link(<html-accounting>)[← Previous: Accounting Fundamentals]
  #include "chapters/03-costing.typ"
] <html-costing>

// ==========================================
// PDF Book Output
// ==========================================

#document("book.pdf", title: [Example Book])[
  #set page(paper: "a4", margin: 2.5cm)
  #set text(size: 11pt)

  #align(center)[
    #text(24pt, weight: "bold")[Abhi's Guide to Indian Partnership Act, 1932]
    #v(1em)
    Simplified Revision Notes
  ]
  #pagebreak()

  // Unnumbered Front Matter
  #include "foreword.typ"
  #pagebreak()

  // Single Automatic PDF Outline
  #set heading(numbering: "1.")
  #outline(title: [Table of Contents], indent: auto)
  #pagebreak()

  // Main Chapters
  #include "chapters/01-introduction.typ"
  #pagebreak()

  #include "chapters/02-accounting.typ"
  #pagebreak()

  #include "chapters/03-costing.typ"
] <book-pdf>

// ==========================================
// Static Assets
// ==========================================
#asset("style.css", read("static/style.css"))
#asset("variables.css", read("static/variables.css"))
#asset("base.css", read("static/base.css"))
#asset("components.css", read("static/components.css"))
#asset("theme.js", read("static/theme.js")) 
#asset("favicon.ico", read("images/favicon.ico", encoding: none))

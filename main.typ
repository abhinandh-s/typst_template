#import "template.typ": web-theme, book-pdf-template

// --- HTML Pages ---

#document("index.html", title: [Example Book])[
  #web-theme
  #title()
  #include "foreword.typ"

  This is the online version of *Example Book*.

  == Chapters
  - #link(<html-introduction>)[Introduction]
  - #link(<html-accounting>)[Accounting Fundamentals]
  - #link(<html-costing>)[Introduction to Costing]

  == Other formats
  #link(<book-pdf>)[Download the complete book as PDF.]
]

#document("chapters/introduction.html", title: [Introduction])[
  #web-theme
  #include "chapters/01-introduction.typ"
  #link(<html-accounting>)[Next: Accounting Fundamentals →]
] <html-introduction>

#document("chapters/accounting.html", title: [Accounting Fundamentals])[
  #web-theme
  #link(<html-introduction>)[← Previous: Introduction]
  #include "chapters/02-accounting.typ"
  #link(<html-costing>)[Next: Introduction to Costing →]
] <html-accounting>

#document("chapters/costing.html", title: [Introduction to Costing])[
  #web-theme
  #link(<html-accounting>)[← Previous: Accounting Fundamentals]
  #include "chapters/03-costing.typ"
] <html-costing>

// --- PDF Compilation ---

#document("book.pdf", title: [Example Book])[
  #show: book-pdf-template.with(title: [Example Book])

  #include "foreword.typ"
  #pagebreak()

  #include "chapters/01-introduction.typ"
  #pagebreak()

  #include "chapters/02-accounting.typ"
  #pagebreak()

  #include "chapters/03-costing.typ"
] <book-pdf>

// --- Static Assets ---
#asset("style.css", read("static/style.css"))
#asset("variables.css", read("static/variables.css"))
#asset("base.css", read("static/base.css"))
#asset("components.css", read("static/components.css"))
#asset("theme.js", read("static/theme.js")) 
#asset("favicon.ico", read("images/favicon.ico", encoding: none))

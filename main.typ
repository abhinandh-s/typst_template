#let theme = [
  #html.elem("link", attrs: (rel: "stylesheet", href: "css/style.css"))
  #html.script(src: "js/theme.js")
  #html.button(id: "theme-toggle", class: "theme-btn")[Theme: Tomato]
]

#let html-page(filename, page-title, body) = {
  document(filename, title: page-title)[
    #theme
    #set heading(numbering: "1.", bookmarked: false)
    #body
  ]
}

#html-page("index.html", [Home])[
  #title()
  #outline(target: heading.where(bookmarked: false, outlined: true))
  #include "foreword.typ"
  #link(<blog>)[Go to blog]
]

#html-page("chapter-01.html", [Blog])[
  #title()
  #include "chapters/chapter-01.typ"
  This blog also exists as a
  #link(<blog-pdf>)[single PDF].
] <blog>

#html-page("chapter-02.html", [Chapter 2])[
  #include "chapters/chapter-02.typ"
]
#document("book.pdf", title: [Full Book])[
  #set page(paper: "a4", margin: 2.5cm)
  #set text(size: 11pt)

  #align(center)[
    #text(24pt, weight: "bold")[Example Book]
    #v(1em)
    A demonstration book built with Typst.
  ]
  #pagebreak()
  #set heading(bookmarked: true)
  #outline(target: heading.where(bookmarked: true, outlined: true))

  #include "foreword.typ"
  #include "chapters/chapter-01.typ"
  #include "chapters/chapter-02.typ"
] <blog-pdf>

// Export these into the output bundle
#asset("css/style.css", read("/static/css/style.css"))
#asset("css/variables.css", read("/static/css/variables.css"))
#asset("css/base.css", read("/static/css/base.css"))
#asset("css/components.css", read("/static/css/components.css"))
#asset("js/theme.js", read("/static/js/theme.js")) 
#asset("favicon.ico", read("/images/favicon.ico", encoding: none))

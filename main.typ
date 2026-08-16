#let theme = [
  #html.elem("link", attrs: (rel: "stylesheet", href: "../style.css"))
  #html.script(src: "../theme.js")
  #html.button(id: "theme-toggle", class: "theme-btn")[Theme: Tomato]
]

#document("index.html", title: [Home])[
  #html.elem("link", attrs: (rel: "stylesheet", href: "style.css"))
  #html.script(src: "theme.js")
  #html.button(id: "theme-toggle", class: "theme-btn")[Theme: Tomato]
  #set heading(numbering: "1.", bookmarked: false)
  #title()
  #outline(target: heading.where(bookmarked: false, outlined: true))

  #link(<blog>)[Go to blog]
]

#document("chapter-01.html", title: [Blog])[
  #theme
  #set heading(bookmarked: false)
  
  #title()
  #include "chapters/chapter-01.typ"
  This blog also exists as a
  #link(<blog-pdf>)[single PDF].
] <blog>


#document("chapter-02.html", title: [Chapter 2])[
  #theme
  #set heading(bookmarked: false)
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
  
  #include "chapters/chapter-01.typ"
  #include "chapters/chapter-02.typ"
] <blog-pdf>



// Export these into the output bundle
#asset("style.css", read("/static/style.css"))
#asset("variables.css", read("/static/variables.css"))
#asset("base.css", read("/static/base.css"))
#asset("components.css", read("/static/components.css"))
#asset("theme.js", read("/static/theme.js")) 
#asset("favicon.ico", read("/images/favicon.ico", encoding: none))

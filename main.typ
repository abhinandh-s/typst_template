#let theme = [
  #html.elem("link", attrs: (rel: "stylesheet", href: "css/style.css"))
  #html.script(src: "js/sidebar.js")
  
  #html.elem("link", attrs: (
    rel: "stylesheet", 
    href: "https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20,400,0,0"
  ))
  
  #html.elem("div", attrs: (class: "top-bar"))[
    #html.button(id: "sidebar-toggle", class: "btn")[
      #html.elem("span", attrs: (class: "material-symbols-outlined"))[menu]
      Menu
    ]
    #html.button(id: "theme-toggle", class: "btn")[
      #html.elem("span", attrs: (class: "material-symbols-outlined"))[palette]
      Theme: Tomato
    ]
  ]
]


#let html-page(filename, page-title, body) = {
  document(filename, title: page-title)[
    #theme
    #set heading(numbering: "1.", bookmarked: false)
    
    #html.elem("nav", attrs: (id: "sidebar"))[
      #text(size: 1.5em, weight: "bold")[Table of Contents]
      #v(1em)
      #outline(target: heading.where(bookmarked: false, outlined: true))
    ]

    // Main Content Container
    #html.elem("main", attrs: (id: "content"))[
      #body
    ]
  ]
}

#html-page("index.html", [Home])[
  #title()
  #outline(target: heading.where(bookmarked: false, outlined: true))
  #link(<ch1>)[Go to Chapter 01]

This guide also exists as a
  #link(<book-pdf>)[single PDF].
]

#html-page("foreword.html", [Foreword])[
  #include "foreword.typ"
]

#html-page("chapter-01.html", [Chapter 01])[
  #title()
  #include "chapters/chapter-01.typ"
] <ch1>

#html-page("chapter-02.html", [Chapter 2])[
  #include "chapters/chapter-02.typ"
]

#document("ag.pdf", title: [Full Book])[
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
  #pagebreak()
  #include "foreword.typ"
  #include "chapters/chapter-01.typ"
  #include "chapters/chapter-02.typ"
] <book-pdf>

// Export these into the output bundle
#asset("css/style.css", read("/static/css/style.css"))
#asset("css/variables.css", read("/static/css/variables.css"))
#asset("css/base.css", read("/static/css/base.css"))
#asset("css/components.css", read("/static/css/components.css"))
#asset("js/theme.js", read("/static/js/theme.js")) 
#asset("js/sidebar.js", read("/static/js/sidebar.js")) 
#asset("favicon.ico", read("/images/favicon.ico", encoding: none))

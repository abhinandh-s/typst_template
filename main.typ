#let theme = [
  #html.elem("script")[
    let savedTheme = localStorage.getItem('theme');
    if (!savedTheme) {
      const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
      savedTheme = prefersDark ? 'dark' : 'light';
    } document.documentElement.setAttribute('data-theme', savedTheme);
  ]
  #html.script("
    document.addEventListener('DOMContentLoaded', function() {
      const nav = document.querySelector('.bottom-nav');
      const endnotes = document.querySelector('section[role=\"doc-endnotes\"]');
      
      if (nav) {
        if (endnotes) {
          endnotes.insertAdjacentElement('afterend', nav);
        } else {
          document.body.appendChild(nav);
        }
      }
    });
  ")

  #html.elem("link", attrs: (rel: "stylesheet", href: "css/style.css"))
  #html.script(src: "js/sidebar.js")
  #html.script(src: "js/theme.js")
  #html.script(src: "js/comment-box.js")
  
  // Google Material Symbols
  #html.elem("link", attrs: (
    rel: "stylesheet", 
    href: "https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20,400,0,0"
  ))
  
  #html.elem("div", attrs: (class: "top-bar"))[
    #html.button(id: "sidebar-toggle", class: "btn icon-btn")[
      #html.elem("span", attrs: (class: "material-symbols-outlined"))[menu]
    ]
    #html.button(id: "theme-toggle", class: "btn icon-btn")[
      #html.elem("span", attrs: (class: "material-symbols-outlined"))[palette]
    ]
  ]
]

#let html-page(filename, page-title, body) = {
  document(filename, title: page-title)[
    #theme
    #set heading(numbering: "1.", bookmarked: false)
    
    #html.elem("nav", attrs: (id: "sidebar"))[
      #outline(target: heading.where(bookmarked: false, outlined: true))
    ]

    // Main Content Container
    #html.elem("main", attrs: (id: "content"))[
      #body
    ]
  ]
}

#let prev(target) = link(target)[
  #html.elem("div", attrs: (class: "nav-btn"))[
    #html.elem("span", attrs: (class: "material-symbols-outlined"))[keyboard_double_arrow_left]
  ]
]

#let next(target) = link(target)[
  #html.elem("div", attrs: (class: "nav-btn"))[
    #html.elem("span", attrs: (class: "material-symbols-outlined"))[keyboard_double_arrow_right]
  ]
]

// We use 'none' when there is no prev/next page.
#let nav(p, n) = html.elem("div", attrs: (class: "bottom-nav"))[
  // If no previous link, insert an empty span so flexbox still pushes 'next' to the right
  #if p != none [ #prev(p) ] else [ #html.elem("span")[] ]
  #if n != none [ #next(n) ] else [ #html.elem("span")[] ]
]


#html-page("index.html", [Home])[
  #title()
  #outline(target: heading.where(bookmarked: false, outlined: true))
  #link(<ch1>)[Go to Chapter 01]

This guide also exists as a
  #link(<book-pdf>)[single PDF].
  #nav(none, <foreword>)
] <home>

#html-page("foreword.html", [Foreword])[
  #include "foreword.typ"
  #nav(<home>, <ch1>)
] <foreword>

#html-page("chapter-01.html", [Chapter 01])[
  #title()
  #include "chapters/chapter-01.typ"
  #nav(<foreword>, <ch2>)
] <ch1>

#html-page("chapter-02.html", [Chapter 2])[
  #include "chapters/chapter-02.typ"
  #nav(<ch1>, none)
] <ch2>

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
#asset("css/comment-box.css", read("/static/css/comment-box.css"))
#asset("js/theme.js", read("/static/js/theme.js")) 
#asset("js/sidebar.js", read("/static/js/sidebar.js")) 
#asset("js/comment-box.js", read("/static/js/comment-box.js")) 
#asset("favicon.ico", read("/images/favicon.ico", encoding: none))

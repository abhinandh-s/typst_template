#let init-theme-script = html.script("
  let savedTheme = localStorage.getItem('theme');
  if (!savedTheme) {
    const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
    savedTheme = prefersDark ? 'dark' : 'light';
  } 
  document.documentElement.setAttribute('data-theme', savedTheme);
")

#let layout-fixes-script = html.script("
  document.addEventListener('DOMContentLoaded', function() {
    const nav = document.querySelector('.bottom-nav');
    const endnotes = document.querySelector('section[role=\"doc-endnotes\"]');
    
    if (endnotes) {
      const divider = document.createElement('hr');
      divider.className = 'footnotes-divider';
      endnotes.insertAdjacentElement('beforebegin', divider);
      
      if (nav) {
        endnotes.insertAdjacentElement('afterend', nav);
      }
    } else if (nav) {
      document.body.appendChild(nav);
    }
  });
")

#let external-assets = [
  #html.elem("link", attrs: (rel: "stylesheet", href: "css/style.css"))
  #html.script(src: "js/sidebar.js")
  #html.script(src: "js/theme.js")
  #html.script(src: "js/comment-box.js")

  // Google Material Symbols
  #html.elem("link", attrs: (
    rel: "stylesheet", 
    href: "https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20,400,0,0"
  ))
]

#let icon-menu = html.elem("span", attrs: (class: "material-symbols-outlined"))[menu]
#let icon-palette = html.elem("span", attrs: (class: "material-symbols-outlined"))[palette]

// Extracted the SVG so it doesn't clutter the UI layout
#let icon-pdf = html.elem("svg", attrs: (
  xmlns: "http://www.w3.org/2000/svg", 
  viewBox: "0 0 640 640",
  class: "svg-icon"
))[
  #html.elem("path", attrs: (d: "M240 112L128 112C119.2 112 112 119.2 112 128L112 512C112 520.8 119.2 528 128 528L208 528L208 576L128 576C92.7 576 64 547.3 64 512L64 128C64 92.7 92.7 64 128 64L261.5 64C278.5 64 294.8 70.7 306.8 82.7L429.3 205.3C441.3 217.3 448 233.6 448 250.6L448 400.1L400 400.1L400 272.1L312 272.1C272.2 272.1 240 239.9 240 200.1L240 112.1zM380.1 224L288 131.9L288 200C288 213.3 298.7 224 312 224L380.1 224zM272 444L304 444C337.1 444 364 470.9 364 504C364 537.1 337.1 564 304 564L292 564L292 592C292 603 283 612 272 612C261 612 252 603 252 592L252 464C252 453 261 444 272 444zM304 524C315 524 324 515 324 504C324 493 315 484 304 484L292 484L292 524L304 524zM400 444L432 444C460.7 444 484 467.3 484 496L484 560C484 588.7 460.7 612 432 612L400 612C389 612 380 603 380 592L380 464C380 453 389 444 400 444zM432 572C438.6 572 444 566.6 444 560L444 496C444 489.4 438.6 484 432 484L420 484L420 572L432 572zM508 464C508 453 517 444 528 444L576 444C587 444 596 453 596 464C596 475 587 484 576 484L548 484L548 508L576 508C587 508 596 517 596 528C596 539 587 548 576 548L548 548L548 592C548 603 539 612 528 612C517 612 508 603 508 592L508 464z"))[]
]

#let top-bar-nav = html.elem("div", attrs: (class: "top-bar"))[
  // Left side
  #html.button(id: "sidebar-toggle", class: "btn icon-btn")[
    #icon-menu
  ]
  
  // Right side
  #html.elem("div", attrs: (class: "top-bar-right"))[
    #html.elem("a", attrs: (href: "ag.pdf", class: "btn icon-btn", target: "_blank", title: "Download PDF"))[
      #icon-pdf
    ]
    #html.button(id: "theme-toggle", class: "btn icon-btn")[
      #icon-palette
    ]
  ]
]

#let theme = [
  #init-theme-script
  #layout-fixes-script
  #external-assets
  #top-bar-nav
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

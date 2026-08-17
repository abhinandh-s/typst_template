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
  // Google Material Symbols font link removed since we are 100% SVG now!
]

#let icon-menu = html.elem("svg", attrs: (
  xmlns: "http://www.w3.org/2000/svg", 
  viewBox: "0 0 640 640",
  class: "svg-icon"
))[
  #html.elem("path", attrs: (d: "M96 160C96 142.3 110.3 128 128 128L512 128C529.7 128 544 142.3 544 160C544 177.7 529.7 192 512 192L128 192C110.3 192 96 177.7 96 160zM96 320C96 302.3 110.3 288 128 288L512 288C529.7 288 544 302.3 544 320C544 337.7 529.7 352 512 352L128 352C110.3 352 96 337.7 96 320zM544 480C544 497.7 529.7 512 512 512L128 512C110.3 512 96 497.7 96 480C96 462.3 110.3 448 128 448L512 448C529.7 448 544 462.3 544 480z"))[]
]

#let icon-palette = html.elem("svg", attrs: (
  xmlns: "http://www.w3.org/2000/svg", 
  viewBox: "0 0 640 640",
  class: "svg-icon"
))[
  #html.elem("path", attrs: (d: "M512.5 74.3L291.1 222C262 241.4 243.5 272.9 240.5 307.3C302.8 320.1 351.9 369.2 364.8 431.6C399.3 428.6 430.7 410.1 450.1 381L597.7 159.5C604.4 149.4 608 137.6 608 125.4C608 91.5 580.5 64 546.6 64C534.5 64 522.6 67.6 512.5 74.3zM320 464C320 402.1 269.9 352 208 352C146.1 352 96 402.1 96 464C96 467.9 96.2 471.8 96.6 475.6C98.4 493.1 86.4 512 68.8 512L64 512C46.3 512 32 526.3 32 544C32 561.7 46.3 576 64 576L208 576C269.9 576 320 525.9 320 464z"))[]
]

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

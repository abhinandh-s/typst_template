#let web-theme = [
  #html.elem("link", attrs: (rel: "stylesheet", href: "../style.css"))
  #html.script(src: "../theme.js")
  #html.button(id: "theme-toggle", class: "theme-btn")[Theme: Tomato]
]

#let book-pdf-template(title: "", body) = {
  set page(paper: "a4", margin: 2.5cm)
  set text(size: 11pt)
  set heading(numbering: "1.")

  align(center)[
    #text(24pt, weight: "bold")[#title]
    #v(1em)
    A demonstration book built with Typst.
  ]
  pagebreak()

  outline(title: [Contents])
  pagebreak()

  body
}
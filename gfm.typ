#let github-alert(kind, title, icon-file, accent-color, body) = {
  html.elem("div", attrs: (class: "github-alert github-alert-" + kind))[
    #block(
      width: 100%,
      stroke: (left: 4pt + accent-color),
      inset: (x: 1em, top: 0.6em, bottom: 0.8em),
      fill: accent-color.lighten(95%),
      radius: (right: 3pt),
      [
        #text(fill: accent-color, weight: "bold")[
          #box(baseline: 20%, width: 1.1em, height: 1.1em)[#image(icon-file)] 
          #h(0.3em) #title
        ]
        #v(0.5em, weak: true)
        #body
      ]
    )
  ]
}

// 6 Standard Types (Using project-root absolute paths)
#let note(body) = github-alert("note", "Note", "/assets/icons/note.svg", rgb("#0969da"), body)
#let tip(body) = github-alert("tip", "Tip", "/assets/icons/tip.svg", rgb("#1a7f37"), body)
#let important(body) = github-alert("important", "Important", "/assets/icons/important.svg", rgb("#8250df"), body)
#let warning(body) = github-alert("warning", "Warning", "/assets/icons/warning.svg", rgb("#bf8700"), body)
#let caution(body) = github-alert("caution", "Caution", "/assets/icons/caution.svg", rgb("#d1242f"), body)
#let quote(body) = github-alert("quote", "Quote", "/assets/icons/quote.svg", rgb("#656d76"), body)

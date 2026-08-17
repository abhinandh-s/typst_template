#let github-alert(kind, title, icon-file, accent-color, bg-color, body) = {
  block(
    width: 100%,
    stroke: (left: 4pt + accent-color),
    inset: (x: 1em, top: 0.6em, bottom: 0.8em),
    fill: bg-color,
    radius: (right: 3pt),
    [
      #text(fill: accent-color, weight: "bold")[
        // Injects the alert type (e.g., "gh-alert-note") into the invisible hook
        #html.elem("span", attrs: (class: "gh-icon-hook gh-alert-" + kind))[\u{200B}]
        #box(baseline: 0.25em)[#image(icon-file, width: 1.1em, height: 1.1em)] 
        #h(0.3em) #title
      ]
      #v(0.5em, weak: true)
      #body
    ]
  )
}

#let note(body) = github-alert("note", "Note", "/assets/icons/note.svg", rgb("#0969da"), rgb("#0969da1a"), body)
#let tip(body) = github-alert("tip", "Tip", "/assets/icons/tip.svg", rgb("#1a7f37"), rgb("#1a7f371a"), body)
#let important(body) = github-alert("important", "Important", "/assets/icons/important.svg", rgb("#8250df"), rgb("#8250df1a"), body)
#let warning(body) = github-alert("warning", "Warning", "/assets/icons/warning.svg", rgb("#bf8700"), rgb("#bf87001a"), body)
#let caution(body) = github-alert("caution", "Caution", "/assets/icons/caution.svg", rgb("#d1242f"), rgb("#d1242f1a"), body)
#let quote(body) = github-alert("quote", "Quote", "/assets/icons/quote.svg", rgb("#656d76"), rgb("#656d761a"), body)

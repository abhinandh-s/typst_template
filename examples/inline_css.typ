#let my-inline-style = html.elem("style")[
  body {
    font-family: sans-serif;
    max-width: 800px;
    margin: 0 auto;
    padding: 2rem;
  }
]

#document("index.html", title: [Example Book])[
  #my-inline-style
  
  #title()
  // ...
]

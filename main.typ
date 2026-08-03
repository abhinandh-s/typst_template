#let introduction = include "chapters/01-introduction.typ"
#let accounting = include "chapters/02-accounting.typ"
#let costing = include "chapters/03-costing.typ"

// its in root of `dist/`
#let my-stylesheet = html.elem("link", attrs: (rel: "stylesheet", href: "style.css"))

#let theme-switcher-script = html.script("
  // Define themes array
  const themes = ['tomato', 'latte', 'mocha', 'macchiato', 'frappe'];
  
  // Get saved theme or default to Mocha
  let currentTheme = localStorage.getItem('catppuccin-theme') || 'tomato';
  
  // Apply it instantly to avoid flashing white screens
  document.documentElement.setAttribute('data-theme', currentTheme);

  // The function to cycle themes when button is clicked
  function toggleTheme() {
    let index = themes.indexOf(currentTheme);
    currentTheme = themes[(index + 1) % themes.length];
    
    document.documentElement.setAttribute('data-theme', currentTheme);
    localStorage.setItem('catppuccin-theme', currentTheme);
    
    // Update button text
    const btn = document.getElementById('theme-toggle');
    if(btn) btn.innerText = 'Theme: ' + currentTheme.charAt(0).toUpperCase() + currentTheme.slice(1);
  }

  // Hook up the button after the page loads
  window.addEventListener('DOMContentLoaded', () => {
    const btn = document.getElementById('theme-toggle');
    if (btn) {
        btn.innerText = 'Theme: ' + currentTheme.charAt(0).toUpperCase() + currentTheme.slice(1);
        btn.onclick = toggleTheme;
    }
  });
")

// The HTML Button element
#let theme-button = html.button(id: "theme-toggle", class: "theme-btn")[Theme: Mocha]

#document("index.html", title: [Example Book])[
  #my-stylesheet
  // Add the script and button
  #theme-switcher-script
  #theme-button

  #title()

  This is the online version of *Example Book*.

  == Chapters

  - #link(<html-introduction>)[Introduction]
  - #link(<html-accounting>)[Accounting Fundamentals]
  - #link(<html-costing>)[Introduction to Costing]

  == Other formats

  #link(<book-pdf>)[Download the complete book as PDF.]
]


#document("chapters/introduction.html", title: [Introduction])[
  #introduction
  #link(<html-accounting>)[Next: Accounting Fundamentals →]
] <html-introduction>


#document("chapters/accounting.html", title: [Accounting Fundamentals])[
  #link(<html-introduction>)[← Previous: Introduction]
  #accounting
  #link(<html-costing>)[Next: Introduction to Costing →]
] <html-accounting>


#document("chapters/costing.html", title: [Introduction to Costing])[
  #link(<html-accounting>)[← Previous: Accounting Fundamentals]
  #costing
] <html-costing>

#document("book.pdf", title: [Example Book])[
  #set page(paper: "a4", margin: 2.5cm)
  #set text(size: 11pt)

  #align(center)[
    #text(24pt, weight: "bold")[Example Book]
    #v(1em)
    A demonstration book built with Typst.
  ]
  #pagebreak()

  #outline(title: [Contents])
  #pagebreak()

  #introduction
  #pagebreak()

  #accounting
  #pagebreak()

  #costing
] <book-pdf>


// Export these into the output bundle
#asset("style.css", read("static/style.css"))
#asset("variables.css", read("static/variables.css"))
#asset("base.css", read("static/base.css"))
#asset("components.css", read("static/components.css"))

#asset("favicon.ico", read("images/favicon.ico", encoding: none))
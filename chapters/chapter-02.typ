= Accounting Fundamentals <accounting>

Accounting is the process of recording, classifying,
summarising, analysing, and interpreting financial
transactions.

== Accounting equation

The basic accounting equation is:

$ "Assets" = "Liabilities" + "Equity" $

For example, suppose a business has:

- Assets: ₹100,000
- Liabilities: ₹40,000
- Owner's equity: ₹60,000

Then:

$ 100000 = 40000 + 60000 $

== Example

Suppose a business purchases machinery for ₹20,000 in cash.

The transaction affects two assets:

- Machinery increases by ₹20,000.
- Cash decreases by ₹20,000.

Therefore, total assets remain unchanged.

== Going further

The next chapter discusses cost concepts.


// =====

// Store all SVG paths (We use the 'info' circle for Note, and 'warning' for Caution)
#let alert-paths = (
  info: "M272 112C272 85.5 293.5 64 320 64C346.5 64 368 85.5 368 112C368 138.5 346.5 160 320 160C293.5 160 272 138.5 272 112zM224 256C224 238.3 238.3 224 256 224L320 224C337.7 224 352 238.3 352 256L352 512L384 512C401.7 512 416 526.3 416 544C416 561.7 401.7 576 384 576L256 576C238.3 576 224 561.7 224 544C224 526.3 238.3 512 256 512L288 512L288 288L256 288C238.3 288 224 273.7 224 256z",
  tip: "M424.5 355.1C449 329.2 464 294.4 464 256C464 176.5 399.5 112 320 112C240.5 112 176 176.5 176 256C176 294.4 191 329.2 215.5 355.1C236.8 377.5 260.4 409.1 268.8 448L371.2 448C379.6 409 403.2 377.5 424.5 355.1zM459.3 388.1C435.7 413 416 443.4 416 477.7L416 496C416 540.2 380.2 576 336 576L304 576C259.8 576 224 540.2 224 496L224 477.7C224 443.4 204.3 413 180.7 388.1C148 353.7 128 307.2 128 256C128 150 214 64 320 64C426 64 512 150 512 256C512 307.2 492 353.7 459.3 388.1zM272 248C272 261.3 261.3 272 248 272C234.7 272 224 261.3 224 248C224 199.4 263.4 160 312 160C325.3 160 336 170.7 336 184C336 197.3 325.3 208 312 208C289.9 208 272 225.9 272 248z",
  important: "M320.1 32C329.1 32 337.4 37.1 341.5 45.1L415 189.3L574.9 214.7C583.8 216.1 591.2 222.4 594 231C596.8 239.6 594.5 249 588.2 255.4L473.7 369.9L499 529.8C500.4 538.7 496.7 547.7 489.4 553C482.1 558.3 472.4 559.1 464.4 555L320.1 481.6L175.8 555C167.8 559.1 158.1 558.3 150.8 553C143.5 547.7 139.8 538.8 141.2 529.8L166.4 369.9L52 255.4C45.6 249 43.4 239.6 46.2 231C49 222.4 56.3 216.1 65.3 214.7L225.2 189.3L298.8 45.1C302.9 37.1 311.2 32 320.2 32zM320.1 108.8L262.3 222C258.8 228.8 252.3 233.6 244.7 234.8L119.2 254.8L209 344.7C214.4 350.1 216.9 357.8 215.7 365.4L195.9 490.9L309.2 433.3C316 429.8 324.1 429.8 331 433.3L444.3 490.9L424.5 365.4C423.3 357.8 425.8 350.1 431.2 344.7L521 254.8L395.5 234.8C387.9 233.6 381.4 228.8 377.9 222L320.1 108.8z",
  warning: "M320 64C334.7 64 348.2 72.1 355.2 85L571.2 485C577.9 497.4 577.6 512.4 570.4 524.5C563.2 536.6 550.1 544 536 544L104 544C89.9 544 76.8 536.6 69.6 524.5C62.4 512.4 62.1 497.4 68.8 485L284.8 85C291.8 72.1 305.3 64 320 64zM320 416C302.3 416 288 430.3 288 448C288 465.7 302.3 480 320 480C337.7 480 352 465.7 352 448C352 430.3 337.7 416 320 416zM320 224C301.8 224 287.3 239.5 288.6 257.7L296 361.7C296.9 374.2 307.4 384 319.9 384C332.5 384 342.9 374.3 343.8 361.7L351.2 257.7C352.5 239.5 338.1 224 319.8 224z"
)

// Dynamic recoloring: Injects the Typst color directly into the SVG
#let get-svg-icon(path, color) = {
  let svg-str = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 640 640\" fill=\"" + color.to-hex() + "\"><path d=\"" + path + "\"/></svg>"
  box(width: 1.1em, height: 1.1em, baseline: 18%, image.decode(svg-str))
}

#let github-alert(kind, title, path, accent-color, body) = {
  // The html.elem wrapper does not appear in PDF. It strictly serves 
  // as a CSS hook to override the background for Dark Mode in HTML.
  html.elem("div", attrs: (class: "github-alert github-alert-" + kind))[
    #block(
      width: 100%,
      stroke: (left: 4pt + accent-color),
      inset: (x: 1em, top: 0.6em, bottom: 0.8em),
      fill: accent-color.lighten(95%),
      radius: (right: 3pt),
      [
        #text(fill: accent-color, weight: "bold")[
          #get-svg-icon(path, accent-color) #h(0.3em) #title
        ]
        #v(0.5em, weak: true)
        #body
      ]
    )
  ]
}

// The 5 standard GitHub alert types
#let note(body) = github-alert("note", "Note", alert-paths.info, rgb("#0969da"), body)
#let tip(body) = github-alert("tip", "Tip", alert-paths.tip, rgb("#1a7f37"), body)
#let important(body) = github-alert("important", "Important", alert-paths.important, rgb("#8250df"), body)
#let warning(body) = github-alert("warning", "Warning", alert-paths.warning, rgb("#bf8700"), body)
#let caution(body) = github-alert("caution", "Caution", alert-paths.warning, rgb("#d1242f"), body)



#note[
  This is a standard note. Use it to highlight information that users should 
  take into consideration, even when skimming.
]

#tip[
  Optional information to help a user be more successful.
]

#important[
  Crucial information necessary for users to succeed.
]

#warning[
  Critical content demanding immediate user attention due to potential risks.
]

#caution[
  Negative potential consequences of an action.
]


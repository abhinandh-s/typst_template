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

#let github-alert(title, icon, accent-color, body) = block(
  width: 100%,
  stroke: (left: 4pt + accent-color),
  inset: (x: 1em, top: 0.6em, bottom: 0.8em),
  fill: accent-color.lighten(95%), // Creates a very faint background tint
  radius: (right: 3pt),
  [
    #text(fill: accent-color, weight: "bold")[
      // Box baseline aligns the icon perfectly with the text
      #box(baseline: 15%)[#icon] #title
    ]
    #v(0.5em, weak: true)
    #body
  ]
)

// The 5 standard GitHub alert types
#let note(body) = github-alert("Note", "ℹ️", rgb("#0969da"), body)
#let tip(body) = github-alert("Tip", "💡", rgb("#1a7f37"), body)
#let important(body) = github-alert("Important", "💬", rgb("#8250df"), body)
#let warning(body) = github-alert("Warning", "⚠️", rgb("#bf8700"), body)
#let caution(body) = github-alert("Caution", "🛑", rgb("#d1242f"), body)


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


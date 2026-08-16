// ─────────────────────────────────────────────────────────────────────────
// WHY THIS FILE LOOKS THE WAY IT DOES
//
// In bundle mode, every #document(...) block shares ONE introspection
// tree: a query() or #outline() anywhere sees headings from every
// #document block, not just the one it's physically written inside.
// (Confirmed in the Typst team's own multi-file-output RFC: "the whole
// bundle is one large output that is iterated on, rather than each
// document iterating separately.")
//
// So a bare #outline() picks up headings from index.html, every
// chapter-NN.html, AND book.pdf all at once — that's the bug.
//
// Fix: bracket whichever chapters belong to a given output with two
// #metadata() markers, then scope that output's #outline() to
// "headings after the start marker and before the end marker" via
// selector(heading).after(<start>).before(<end>). This needs two
// separate marker pairs — one for the HTML site's TOC, one for the
// PDF's — since they draw from overlapping but distinct sets of
// chapters.
// ─────────────────────────────────────────────────────────────────────────

// ── index.html ──────────────────────────────────────────────────────────
// Site-wide TOC: headings from every chapter that has an HTML page,
// scoped to the <site-start>/<site-end> markers below.
#document("index.html", title: [Home])[
  #heading(outlined: false)[Home]

  Welcome. This is the landing page.

  #link(<book-pdf>)[Download the single-PDF book]

  #metadata(none) <site-start>

  #context outline(
    title: [Site Contents],
    target: selector(heading)
      .after(<site-start>)
      .before(<site-end>),
  )

  #metadata(none) <site-end>
]

// ── chapter-01.html ──────────────────────────────────────────────────────
// Per-chapter HTML page. No outline here — individual chapter pages
// don't get their own TOC. The headings still need <site-start>/<end>
// markers around them so index.html's outline can find them.
#document("chapter-01.html", title: [Chapter 1: Blog])[
  #heading(outlined: false)[Chapter 1: Blog]

  #metadata(none) <site-start>
  #include "chapter-01.typ"
  #metadata(none) <site-end>

  #parbreak()
  This blog also exists as a #link(<book-pdf>)[single PDF].
] <blog>

// ── chapter-02.html ──────────────────────────────────────────────────────
#document("chapter-02.html", title: [Chapter 2: Pointers])[
  #heading(outlined: false)[Chapter 2: Pointers]

  #metadata(none) <site-start>
  #include "chapter-02.typ"
  #metadata(none) <site-end>
]

// ── book.pdf ─────────────────────────────────────────────────────────────
// The PDF's own outline, scoped with its own separate marker pair
// (<book-start>/<book-end>) so it only sees headings inside the PDF —
// not the HTML pages' headings, even though both sets of markers share
// the label names <site-start>/<site-end> vs <book-start>/<book-end>.
#document("book.pdf", title: [The Book])[
  #set heading(numbering: "1.")

  #metadata(none) <book-start>

  #context outline(
    target: selector(heading)
      .after(<book-start>)
      .before(<book-end>),
  )

  #include "chapter-01.typ"
  #pagebreak()
  #include "chapter-02.typ"

  #metadata(none) <book-end>
] <book-pdf>

// ── favicon (unchanged) ────────────────────────────────────────────────
#asset(
  "favicon.ico",
  read("images/favicon.ico", encoding: none),
)

// ─────────────────────────────────────────────────────────────────────────
// SCALING TO "MANY .html + MANY .typ VIA #include":
//
// Every chapter stays a plain .typ file with no #document/#metadata of
// its own. Whenever a chapter is #include'd somewhere that needs to
// show up in a TOC, wrap that #include in the matching marker pair for
// that output: <site-start>/<site-end> if it belongs on the HTML site,
// <book-start>/<book-end> if it belongs in the PDF, potentially both if
// it belongs in both. A given #outline() only ever queries between its
// own pair, so adding chapters to one output doesn't pollute the other.
// Never write a bare #outline() inside a #document(...) block in bundle
// mode — by design, it will always see the whole bundle's headings.
// ─────────────────────────────────────────────────────────────────────────
// ─────────────────────────────────────────────────────────────────────────
// WHY THIS FILE LOOKS THE WAY IT DOES
//
// In bundle mode, every #document(...) block shares ONE introspection
// tree: a query() or #outline() anywhere sees headings from every
// #document block, not just the one it's physically written inside.
// (Confirmed directly in the Typst team's own multi-file-output RFC:
// "the whole bundle is one large output that is iterated on, rather
// than each document iterating separately.")
//
// So a bare #outline() inside #document("book.pdf", ...) also picks up
// headings from index.html and every chapter-NN.html — which is exactly
// the bug you hit.
//
// The fix used here: bracket the content that belongs in the PDF with
// two #metadata() markers (locatable + queryable), then scope the
// outline's heading query to "headings after the start marker and
// before the end marker" using selector(...).after(loc)/.before(loc),
// which is the documented, idiomatic way to scope a query by position.
// This needs no content-variable tricks and no array passed to
// outline()'s `target` (target only accepts a label, selector,
// location, or function — never an array).
// ─────────────────────────────────────────────────────────────────────────

// ── index.html ──────────────────────────────────────────────────────────
// Landing page. No #outline() here — only book.pdf gets a real TOC,
// per the brief.
#document("index.html", title: [Home])[
  #heading(outlined: false)[Home]

  Welcome. This is the landing page.

  #link(<blog>)[Go to the blog]
  #linebreak()
  #link(<book-pdf>)[Download the single-PDF book]
]

// ── chapter-01.html ──────────────────────────────────────────────────────
// Per-chapter HTML page. No outline here either — individual chapter
// pages don't get their own TOC.
#document("chapter-01.html", title: [Chapter 1: Blog])[
  #heading(outlined: false)[Chapter 1: Blog]
  #include "chapter-01.typ"
  #parbreak()
  This blog also exists as a #link(<book-pdf>)[single PDF].
] <blog>

// ── chapter-02.html ──────────────────────────────────────────────────────
#document("chapter-02.html", title: [Chapter 2: Pointers])[
  #heading(outlined: false)[Chapter 2: Pointers]
  #include "chapter-02.typ"
]

// ── book.pdf ─────────────────────────────────────────────────────────────
// The one place with a real #outline(). Markers bracket the chapters so
// the outline query can be scoped to just what's between them.
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

// ── favicon (unchanged from your original) ───────────────────────────────
#asset(
  "favicon.ico",
  read("images/favicon.ico", encoding: none),
)

// ─────────────────────────────────────────────────────────────────────────
// SCALING TO "MANY .html + MANY .typ VIA #include":
//
// The pattern that scales: every chapter is a plain .typ file with no
// document(...) call and no top-level metadata of its own. main.typ
// #include's each chapter wherever it's needed (once per output that
// wants it — an #include'd file's content is realized fresh each time
// it's included, so the same chapter can appear in both an .html page
// and inside the book.pdf bracket without conflict). Any #outline() you
// add is scoped the same way as book.pdf's: metadata markers bracketing
// the relevant #include calls, then
//   target: selector(heading).after(<start-label>).before(<end-label>)
// Never write a bare #outline() inside a #document(...) block in bundle
// mode — by design, it will always see the whole bundle's headings.
// ─────────────────────────────────────────────────────────────────────────

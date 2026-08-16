#document("index.html", title: [Home])[
  // 1. Tag all headings in this document as HTML headings
  #set heading(numbering: "1.", bookmarked: false)
  #title()
  
  // 2. Filter the outline to ONLY show HTML headings
  #outline(target: heading.where(bookmarked: false, outlined: true))

  #link(<blog>)[Go to blog]
]

#document("chapter-01.html", title: [Blog])[
  // Tag all headings in this chapter as HTML headings
  #set heading(bookmarked: false)
  
  #title()
  Welcome to my blog!
  = Heading 01
  == Heading 02
  === Heading 03
  ==== Heading 04
  ===== Heading 05
  This blog also exists as a
  #link(<blog-pdf>)[single PDF].
] <blog>

#document("book.pdf", title: [Blog])[
  // 3. Tag all headings in the PDF as PDF headings
  #set heading(numbering: "1.", bookmarked: true)
  
  // 4. Filter the outline to ONLY show PDF headings
  #outline(target: heading.where(bookmarked: true, outlined: true))
  
  #title()
  Welcome to my blog!
  = Heading 01
  == Heading 02
  === Heading 03
  ==== Heading 04
  ===== Heading 05
  // include "other chapters..."
] <blog-pdf>

#asset(
  "favicon.ico",
  read("images/favicon.ico", encoding: none),
)

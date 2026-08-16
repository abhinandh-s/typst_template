#document("index.html", title: [Home])[
  #set heading(numbering: "1.", bookmarked: false)
  #title()
  #outline(target: heading.where(bookmarked: false, outlined: true))

  #link(<blog>)[Go to blog]
]

#document("chapter-01.html", title: [Blog])[
  #set heading(bookmarked: false)
  
  #title()
  #include "chapter-01.typ"
  This blog also exists as a
  #link(<blog-pdf>)[single PDF].
] <blog>


#document("chapter-02.html", title: [Chapter 2])[
  #set heading(bookmarked: false)
  #include "chapter-02.typ"
]

#document("book.pdf", title: [Full Book])[
  #set heading(bookmarked: true)
  #outline(target: heading.where(bookmarked: true, outlined: true))
  
  #include "chapter-01.typ"
  #include "chapter-02.typ"
] <blog-pdf>

#asset(
  "favicon.ico",
  read("images/favicon.ico", encoding: none),
)

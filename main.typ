#document("index.html", title: [Home])[
  #title()
  #outline()
  - #link(<blog>)[Go to blog]
]
#let ctx = [
= Heading 01
== Heading 02
=== Heading 03
==== Heading 04
===== Heading 05
]
#document("blog.html", title: [Blog])[
  #title()
  Welcome to my blog!
  #ctx
  This blog also exists as a
  #link(<blog-pdf>)[single PDF].
] <blog>

#document("blog.pdf", title: [Blog])[
  #outline ()
  Welcome to my blog!
  #ctx
] <blog-pdf>

#asset(
  "favicon.ico",
  read("images/favicon.ico", encoding: none),
)

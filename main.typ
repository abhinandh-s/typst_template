#document("index.html", title: [Home])[
#title()
#set heading(numbering: "1.")
#outline(target: heading.where(outlinable: true))

#link(<blog>)[Go to blog]
]


#document("chapter-01.html", title: [Blog])[
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
#set heading(numbering: "1.")
#outline()
Welcome to my blog!
= Heading 01
== Heading 02
=== Heading 03
==== Heading 04
===== Heading 05
//include "other chapters..."
] <blog-pdf>

#asset(
"favicon.ico",
read("images/favicon.ico", encoding: none),
)
#let blog = [
  Welcome to my blog!

  In this report, we will explore the
  various factors that influence fluid
  dynamics in glaciers and how they
  contribute to the formation and
  behaviour of these natural structures.

  = Introduction

  In this report, we will explore the
  various factors that influence _fluid
  dynamics_ in glaciers and how they
  contribute to the formation and
  behaviour of these natural structures.

  + The climate
    - Temperature
    - Precipitation
  + The topography
  + The geology
]

#document("index.html", title: [Home])[
  #title()

  - #link(<blog>)[Go to blog]
]

#document("blog.html", title: [Blog])[
  #title()

  #blog

  This blog also exists as a
  #link(<blog-pdf>)[single PDF].
] <blog>

#document("blog.pdf", title: [Blog])[
  #title()

  #blog
] <blog-pdf>
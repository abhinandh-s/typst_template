= Foreword

#import "gfm.typ": note, tip, warning
#import "gfm.typ"

= Getting Started

Welcome to the first chapter of the book.

#note[
  Because we used `/assets/icons/note.svg`, this will find the image 
  perfectly even though we are currently inside the `chapters/` folder!
]

#tip[
  You can import just the specific alerts you need for the current file.
]

#gfm.important[
  This works too, and keeps your global namespace clean!
]

#include "copyright.typ"


@harry

#bibliography("bibliography.yml")


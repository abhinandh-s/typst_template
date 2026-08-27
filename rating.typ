#let octicon(path, hw: "24", fill: "currentColor", frac: 1.0) = context {
   let percent = str(calc.round(frac * 100, digits: 1)) + "%"

  if target() == "html" {
    html.elem("svg", attrs: (
      xmlns: "http://www.w3.org/2000/svg",
      viewBox: "0 0 " + hw + " " + hw,
      height: hw,
      width: hw,
    ))[
      #html.elem("defs")[
        #html.elem("linearGradient", attrs: (id: "grad"))[
          #html.elem("stop", attrs: (
          offset: percent,
          "stop-color": fill,
        ))
          #html.elem("stop", attrs: (
          offset: percent,
          "stop-color": "transparent"
        ))
      ]
      ]
      #html.elem("path", attrs: (
        d: path, 
        fill: "url(#grad)",
        stroke: fill,
        "stroke-width": "1.5",
      ), 
      )[]
    ]
  } else {
     image(bytes(
      "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 " + hw + " " + hw + "\">
    <defs>
      <linearGradient id=\"grad\">
        <stop offset=\"" + percent + "\" stop-color=\"" + fill + "\"/>
        <stop offset=\"" + percent + "\" stop-color=\"transparent\"/>
      </linearGradient>
    </defs>
    <!-- We draw the solid path, add a stroke for the outline, and fill it with the gradient -->
    <path d=\"" + path + "\" fill=\"url(#grad)\" stroke=\"" + fill + "\" stroke-width=\"1.5\" />
  </svg>"
    ), format: "svg", width: 1.1em, height: 1.1em)
  }
}

#let _icons = (
  star: "m12.672.668 3.059 6.197 6.838.993a.75.75 0 0 1 .416 1.28l-4.948 4.823 1.168 6.812a.75.75 0 0 1-1.088.79L12 18.347l-6.116 3.216a.75.75 0 0 1-1.088-.791l1.168-6.811-4.948-4.823a.749.749 0 0 1 .416-1.279l6.838-.994L11.327.668a.75.75 0 0 1 1.345 0Z",
  heart: "M14 20.408c-.492.308-.903.546-1.192.709-.153.086-.308.17-.463.252h-.002a.75.75 0 0 1-.686 0 16.709 16.709 0 0 1-.465-.252 31.147 31.147 0 0 1-4.803-3.34C3.8 15.572 1 12.331 1 8.513 1 5.052 3.829 2.5 6.736 2.5 9.03 2.5 10.881 3.726 12 5.605 13.12 3.726 14.97 2.5 17.264 2.5 20.17 2.5 23 5.052 23 8.514c0 3.818-2.801 7.06-5.389 9.262A31.146 31.146 0 0 1 14 20.408Z",
  sparkle: "M11.296 1.924c.24-.656 1.168-.656 1.408 0l.717 1.958a11.25 11.25 0 0 0 6.697 6.697l1.958.717c.657.24.657 1.168 0 1.408l-1.958.717a11.25 11.25 0 0 0-6.697 6.697l-.717 1.958c-.24.657-1.168.657-1.408 0l-.717-1.958a11.25 11.25 0 0 0-6.697-6.697l-1.958-.717c-.656-.24-.656-1.168 0-1.408l1.958-.717a11.25 11.25 0 0 0 6.697-6.697l.717-1.958Z",
  dot: "M12 18a6 6 0 1 0 0-12 6 6 0 0 0 0 12Z",
  square: "M7.75 6h8.5c.966 0 1.75.784 1.75 1.75v8.5A1.75 1.75 0 0 1 16.25 18h-8.5A1.75 1.75 0 0 1 6 16.25v-8.5C6 6.784 6.784 6 7.75 6Z",
)

#let get_icon_path(name) = _icons.at(name, default: _icons.star)


#let rating(rating: 0.0, total: 5, icon: "star") = context {
  let path = get_icon_path(icon)

  box({
    for i in range(0, total) {
      // Calculate fraction for this specific icon (0.0 to 1.0)
      let fraction = calc.min(1.0, calc.max(0.0, rating - i))

      box(baseline: 0.25em)[
        #octicon(path, frac: fraction)
      ]
    }
  })
}


#table(
  columns: (1fr, auto),
  inset: 10pt,
  align: horizon,
  table.header(
    [*Movies/Series*], [*Rating*],
  ),
  [Breaking Bad], [#rating(rating: 4, icon: "sparkle")],
  [Better Call Soul],
  [#rating(rating: 4)],
  [Breaking Bad], [#rating(rating: 4.5, icon: "dot")],
  [Breaking Bad], [#rating(rating: 4.9, icon: "square")],
  [Breaking Bad], [#rating(rating: 4.3, icon: "heart")],
)



#rating(rating: 3.4) \
#rating(rating: 4.8, icon: "heart") \
#rating(rating: 1.5, icon: "sparkle")
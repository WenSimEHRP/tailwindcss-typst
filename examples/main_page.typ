#import "../lib.typ": *
#import html: *

#let links = (
  (
    ("Commons", "Free media collection"),
    ("Wikivoyage", "Free travel guide"),
    ("Wikionary", "Free dictionary"),
    ("Wikibooks", "Free textbooks"),
    ("Wikidata", "Free knowledge base"),
    ("Wikiversity", "Free laerning resources"),
  )
    + (("Foobar", "Placeholder"),) * 4
)

#let languages = (
  ("English", 123123123),
  ("German", 456456456),
  ("Russian", 789789789),
  ("Spanish", 123123123),
  ("Portuguese", 456456456),
  ("Japanese", 789789789),
  ("Chinese", 123123123),
  ("French", 456456456),
  ("Italian", 789789789),
  ("Polish", 123123123),
)

#let simple-button(c, extra-classes: "") = button(
  class: "hover:ring-1 transition-all " + "hover:bg-white/10 p-4 text-start " + extra-classes,
  c,
)

#let colourful-link = a.with(class: "text-blue-300 underline hover:text-purple-300 transition-all")

#let content = main(class: "min-h-screen w-screen text-white text-sm", {
  div(class: "pt-10 p-6 flex flex-col gap-4 max-w-5xl mx-auto", {
    div(div(
      class: "mx-auto md:relative md:h-100 md:w-150 grid grid-cols-2 gap-4 md:flex md:items-center",
      {
        img(
          class: "mx-auto w-50 hidden md:block",
          src: "https://upload.wikimedia.org/wikipedia/commons/8/80/Wikipedia-logo-v2.svg",
        )
        for (idx, (lang, num)) in languages.enumerate() {
          let side = if idx > 4 { "left" } else { "right" }
          let idx = calc.rem(idx, 5)
          let top = str(idx * 20) + "%"
          let horizontal = ("60%", "71%", "73%", "70%", "60%").at(idx)
          simple-button(
            extra-classes: (
              "md:absolute",
              "md:top-[" + top + "] ",
              "md:" + side + "-[" + horizontal + "]",
            ).join(" "),
            {
              span(class: "text-blue-300", lang)
              linebreak()
              span(str(num))
            },
          )
        }
      },
    ))
    div(class: "border-t")
    div(class: "text-center", [
      Wikipedia is hosted by the Wikimedia Foundation, a non-profit organization that also hosts a range of other
      projects. \
      #colourful-link(href: "https://donate.wikimedia.org")[
        You can support our work with a donation.
      ]
    ])
    div(class: "grid grid-cols-2 md:grid-cols-3 gap-4", {
      for (key, desc) in links {
        simple-button({
          span(class: "text-blue-300", key)
          linebreak()
          span(class: "text-white", desc)
        })
      }
    })
    footer(class: "mx-auto text-center")[
      This page is available as an example of Typhoon, the Tailwind CSS extension for Typst\
      #colourful-link(href: "https://github.com/wensimehrp/tailwindcss-typst")[
        View the repository
      ]
    ]
  })
})

#html({
  head({
    meta(charset: "utf-8")
    meta(name: "viewport", content: "width=device-width,initial-scale=1")
    title[Typhoon Main Page Showcase]
    context { style(tailwind-css()) }
  })
  show std.html.elem: update-elem
  body(class: "bg-neutral-800", {
    content
  })
})

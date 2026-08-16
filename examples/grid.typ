#import "../lib.typ": *
#import html: *

#let content = div(class: "h-full w-full dark:bg-neutral-900", div(
  class: "min-h-screen max-w-4xl mx-auto py-20",
  div(class: "flex flex-row gap-4 flex-wrap", {
    input(type: "checkbox", class: "peer p-4 flex-1")
    div(class: "flex-3 flex-row p-4 bg-white shadow-sm rounded-sm")[Check for interesting colours!]
    lorem(255)
      .split(" ")
      .enumerate()
      .map(((idx, it)) => button(
        it,
        class: {
          "flex-1 p-4 rounded-sm shadow-sm"
          " bg-[" + color.map.rainbow.at(calc.rem(idx, 255)).darken(30%).desaturate(50%).to-hex() + "]"
          " peer-checked:bg-[" + color.map.rainbow.at(calc.rem(idx, 255)).to-hex() + "]"
          " ring-blue-400"
          " hover:ring-5"
          " hover:bg-blue-200"
          " transition-all"
        },
      ))
      .join()
  }),
))

#html({
  head({
    meta(charset: "utf-8")
    meta(name: "viewport", content: "width=device-width,initial-scale=1")
    title[Typhoon Grid Showcase]
    context { style(tailwind-css()) }
  })
  body({
    show std.html.elem: update-elem
    content
  })
})

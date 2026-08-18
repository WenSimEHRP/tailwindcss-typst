#!/usr/bin/env bash
#let _ = ```sh
case "$1" in
  compile) typst compile --features bundle,html --format bundle $0 --root .. _site ;;
  watch)   typst watch   --features bundle,html --format bundle --pretty $0 --root .. _site ;;
  *)       echo "Unknown option: $1. Enter 'compile' or 'watch'"; exit 1 ;;
esac
exit 0
```
#document("grid.html", include "grid.typ") <grid>
#document("main_page.html", include "main_page.typ") <main-page>
#document("index.html", html.html({
  import "../lib.typ": *
  import html: *
  head({
    meta(charset: "utf-8")
    meta(name: "viewport", content: "width=device-width,initial-scale=1")
    title[Typhoon Main Page Showcase]
    context { style(tailwind-css()) }
  })
  show std.html.elem: update-elem
  body(class: "prose mx-auto my-5 prose-pre:bg-black p-4", [
    #std.title[Typhoon]
    = Examples
    #div(class: {
      "flex gap-4"
      " *:flex-1 *:text-center *:bg-neutral-100 *:hover:bg-neutral-200"
      " *:p-2"
    })[
      #std.link(<grid>)[Grid]
      #std.link(<main-page>)[Main Page]
    ]
    #import "@preview/cmarker:0.1.10"
    #cmarker.render(read("../README.md"))
  ])
}))

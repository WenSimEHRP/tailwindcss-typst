#let _plugin = plugin("main.wasm")
#let tailwind-state = state("TAILWIND_CSS_GENERATION_STATE+alotofentropy", (:))

#let tailwind-css(config: auto, state: tailwind-state) = context {
  let classes = state.final().keys().join(" ")
  let config = if config == auto {
    (:)
  } else {
    config
  }
  let s = str(_plugin.generate(bytes(classes), cbor.encode(config)))
  html.style(s)
}

// Update the element.
#let update-elem(elem, state: tailwind-state) = {
  let classes = elem.attrs.at("class", default: ())
  let classes = if type(classes) = str { classes.split(" ") } else { classes }
  elem.update(d => d + classes.map(c => (c, none)).to-dict())
  elem
}

#import "./basic-style.typ": *
#import "@preview/pointless-size:0.1.1": zh

// 致谢
#let acknowledgment(body) = {
  set text(font: ("Times New Roman", "SimSun"), size: zh(-4))
  set par(first-line-indent: 2em, leading: 1.25em, justify: true)
  
  body

  show: _page_header_style
}

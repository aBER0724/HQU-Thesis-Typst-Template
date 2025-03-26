#import "./basic-style.typ": *
#import "@preview/pointless-size:0.1.1": zh

// 致谢
#let acknowledgement-content(body) = {
  show:_static_page_header_style.with(title: [致#h(2em)谢])
  set text(font: "SimHei", size: zh(3))
  heading(level: 1, numbering: none)[致#h(2em)谢]

  set text(font: ("Times New Roman", "STFangsong"), size: zh(4))
  set par(first-line-indent: 2em, leading: 1.15em, justify: true)
  v(1em)
  body
}
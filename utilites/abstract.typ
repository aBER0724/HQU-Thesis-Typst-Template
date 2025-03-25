#import "./basic-style.typ": *

// 中文摘要
#let chinese-abstract(body, keywords) = {
  counter(page).update(1)
  show:_static_page_header_style.with(title: [摘#h(2em)要])
  show: _static_page_footer_style
  v(1.55em)
  align(center)[
    #text(font: ("Times New Roman", "SimHei"), size: zh(3))[摘要]
  ]
  v(0.5em)
  set text(font: ("Times New Roman", "SimSun"), size: zh(-4))
  set par(first-line-indent: 2em, leading: 1em)

  body

  // 中文关键词
  if keywords.len() > 0 {
    v(3.25em)
    set par(first-line-indent: 0em)
    [#text(font: "SimHei", weight: "bold")[关键词：]#h(0.5em)#keywords.join("；")]
  }
  pagebreak()
}

// 英文摘要
#let english-abstract(body, keywords-en) = {
  v(1.55em)
  align(center)[
    #text(font: "Arial", size: zh(3))[*ABSTRACT*]
  ]
  v(0.5em)
  
  body

  if keywords-en.len() > 0 {
    v(3.25em)
    set par(first-line-indent: 0em, leading: 0.5em)
    [#text(weight: "bold")[Keywords: ]#h(0.5em)#keywords-en.join("; ")]
  }
  pagebreak()
}

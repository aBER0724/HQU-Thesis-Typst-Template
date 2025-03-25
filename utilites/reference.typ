#import "./basic-style.typ": *
#import "@preview/pointless-size:0.1.1": zh

// 参考文献
#let reference-content(body) = {
  set text(size: zh(5)) // 五号字
  set par(leading: 1em)

  // 隐藏引用所有参考文献，但不显示引用标记
  {
    set text(size: 0pt)
    [@girshick2014rich; @redmon2016you; @liu2016ssd]
  }

  bibliography("../references.bib", title: none, style: "gb-7714-2005-numeric")
}

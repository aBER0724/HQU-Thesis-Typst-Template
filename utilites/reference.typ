#import "./basic-style.typ": *
#import "@preview/pointless-size:0.1.1": zh

// 参考文献
#let reference-content(file_path) = {
  set text(font: "SimHei")
  heading(level: 1, numbering: none)[参考文献]

  set text(font: ("Times New Roman", "SimSun"), size: zh(5)) // 五号字
  set par(leading: 1em)

  // 隐藏引用所有参考文献，但不显示引用标记
  {
    set text(size: 0pt)
    []
  }

  {
    v(-0.25em)
    bibliography("../" + file_path, title: none, style: "gb-7714-2005-numeric")
  }
}

#let bib_cite(..names) = {
  for name in names.pos() {
    cite(name)
  }
}
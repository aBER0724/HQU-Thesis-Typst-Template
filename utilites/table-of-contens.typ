#import "./basic-style.typ": *
#import "@preview/pointless-size:0.1.1": zh

// 目录生成函数
#let table-of-contents() = {
  show:_static_page_header_style.with(title: [目#h(2em)录])
  show: _static_page_footer_style
  v(2.775em)
  set align(center)
  text(font: ("Times New Roman", "SimHei"), size: zh(3))[目#h(2em)录]
  v(-0.15em)

  // 设置目录条目格式
  show outline.entry: it => {
    // 使用link函数包裹内容，使其可点击跳转
    link(it.element.location(), {
      if it.level == 1 {
        show regex("[0-9]+"): text.with(font: "Arial")
        box(
          width: 100%,
          [
            #grid(
              columns: (auto, 1fr, auto),
              {
                // 显示一级标题的序号和内容
                let section-num = counter(heading).at(it.element.location()).first()
                v(0.75em)
                text(font: ("Times New Roman", "SimHei"), size: zh(-4))[ // 四号字体
                  #if it.element.body != [参考文献] and it.element.body != [致#h(2em)谢] {
                    [第#numbering("一", section-num)章 #h(0.5em) #it.element.body]
                  } else {
                    [#it.element.body]
                  }
                ]
              },
              align(bottom)[#box(width: 100%, repeat[#text(font: "SimHei",size: zh(-4))[.#h(-3pt)]])],
              {
                let page-num = counter(page).at(it.element.location()).first()
                v(0.75em)
                text(font: "Times New Roman", size: zh(-4))[#(page-num - 3)]
              },
            )
          ],
        )
      } else {
        box(
          width: 100%,
          [
            #grid(
              columns: (auto, 1fr, auto),
              {
                // 显示二级及以下标题的序号和内容
                let section-nums = counter(heading).at(it.element.location())
                let nums-str = if section-nums.len() >= 2 {
                  numbering("1.1", ..section-nums)
                } else {
                  ""
                }
                // 添加缩进，根据级别计算
                let indent-amount = (it.level - 1) * 2
                (
                  h(indent-amount * 0.5em) + text(font: ("Times New Roman", "SimSun"), size: zh(-4))[#nums-str #h(0.25em) #it.element.body]
                )
              },
              align(bottom)[#box(width: 100%, repeat[#text(font: "SimSun", )[.#h(-2.5pt)]])],
              {
                let page-num = counter(page).at(it.element.location()).first()
                text(font: "Times New Roman", size: zh(-4))[#(page-num - 3)]
              },
            )
          ],
        )
      }
    })
  }

  // 目录样式设置
  show outline: outline => {
    block(
      spacing: 2em,
      {
        set par(leading: 1.25em)
        outline
      },
    )
  }

  // 生成不带标题的目录
  show: outline(title: none)
}

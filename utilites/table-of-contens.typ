#import "./basic-style.typ": *
#import "@preview/pointless-size:0.1.1": zh

// 目录生成函数
#let table-of-contents() = {
  show:_static_page_header_style.with(title: [目#h(2em)录])
  show: _static_page_footer_style
  v(2em)
  set align(center)
  text(font: ("Times New Roman", "SimHei"), size: zh(3))[目#h(2em)录]

  // 设置章节编号格式
  set heading(
    numbering: (..nums) => {
      if nums.pos().len() == 1 {
        // 一级标题
        "第" + numbering("一", nums.pos().at(0)) + "章" + h(0.5em)
      } else if nums.pos().len() > 1 {
        // 二级及以下标题
        numbering("1.1", ..nums.pos()) + h(0.25em)
      }
    },
  )

  // 设置目录条目格式
  show outline.entry: it => {
    set text(font: ("Times New Roman", "SimSun"), size: zh(-4)) // 小四号字体

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
              text(font: ("Times New Roman", "SimHei"), size: zh(4))[ // 四号字体
                #if it.element.body != [参考文献] and it.element.body != [致#h(2em)谢] {
                  [第#numbering("一", section-num)章 #h(0.5em) #it.element.body]
                } else {
                  [#it.element.body]
                }
              ]
            },
            align(center + horizon)[#box(width: 100%, repeat[#text(font: "SimHei")[.#h(-3pt)]])],
            {
              let page-num = counter(page).at(it.element.location()).first()
              // 前言部分使用罗马数字
              if page-num <= 5 {
                let roman-numeral = numbering("I", page-num - 2)
                text(font: "Times New Roman", size: zh(5))[#roman-numeral]
              } else {
                // 正文部分使用阿拉伯数字
                text(font: "Times New Roman", size: zh(5))[#(page-num - 5)]
              }
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
                h(indent-amount * 0.5em)
                  + text(font: ("Times New Roman", "SimSun"))[#nums-str #h(0.25em) #it.element.body]
              )
            },
            align(center + horizon)[#box(width: 100%, repeat[.])],
            {
              let page-num = counter(page).at(it.element.location()).first()
              text(font: "Times New Roman")[#(page-num - 5)]
            },
          )
        ],
      )
    }
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

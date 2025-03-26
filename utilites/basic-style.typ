#import "@preview/cuti:0.3.0": show-cn-fakebold
#import "@preview/pointless-size:0.1.1": zh

// 页眉样式函数空实现
#let _page_header_style(title) = { }

// 页脚样式，居中显示阿拉伯数字页码
#let _page_footer_style(body) = {
  set page(
    footer: context {
      v(-1.1em)
      set align(center)
      set text(font: "Times New Roman", size: zh(5))
      let page-num = counter(page).get().first()
      text(font: "Times New Roman", size: zh(5))[#(page-num - 3)]
    },
  )
  body
}

// 静态页脚样式，居中显示罗马数字页码
#let _static_page_footer_style(body) = {
  set page(
    footer: context {
      v(-1.255em)
      set align(center)
      set text(font: "Times New Roman", size: zh(5))
      counter(page).display("I")
    },
  )
  body
}

// 页眉样式：奇数页显示章节名，偶数页显示论文标题
#let _page_header_style(title: "", body) = {
  set page(
    paper: "a4",
    margin: (top: 3.8cm, bottom: 3.8cm, left: 3.2cm, right: 3.2cm),
    header-ascent: 12%, // 增大该值使页眉下移
    header: context {
      let page-number = counter(page).get().first()
      if page-number >= 2 {
        let headings = query(heading.where(level: 1))

        let current-heading = none

        for hdg in headings {
          let hdg-page = counter(page).at(hdg.location()).first()
          if hdg-page <= page-number {
            current-heading = hdg
          } else {
            break
          }
        }
        if current-heading != none {
          // 获取当前章节的编号
          let heading-number = counter(heading).at(current-heading.location()).first()

          // 显示章节标题 "第X章 章节名称"
          set text(font: "SimSun", size: zh(5))
          align(center)[
            #if current-heading.body == [参考文献] {
              current-heading.body
              v(-8pt)
            } else if current-heading.body == [致#h(2em)谢] {
              current-heading.body
              v(-12pt)
            } else {
              "第" + numbering("一", heading-number) + "章 " + h(0.5em) + current-heading.body
              v(-8pt)
            }
          ]
        }
        line(length: 100%, stroke: 0.5pt)
      }
    },
  )

  body
}

// 静态页眉样式，居中显示标题
#let _static_page_header_style(title: "", body) = {
  set page(
    header: context {
      set text(font: "SimSun", size: zh(5))
      set align(center)
      [#title]
      v(-6pt)
      line(length: 100%, stroke: 0.5pt)
    },
  )
  body
}

// 设置基本字体样式 小四号宋体
#let _basic_font_style(body) = {
  set text(
    font: ("Times New Roman", "SimSun"),
    size: zh(-4), // 小四号字体
    lang: "zh", // 主要语言为中文
  )

  body
}

// 设置段落样式 1.5倍行距 首行缩进2字符
#let _basic_par_style(body) = {
  set par(
    justify: true,
    leading: 1.1em, // 1.5倍行距
    first-line-indent: 2em, // 首行缩进2字符
    spacing: 1em,
  )
  body
}

// 设置标题和章节样式
#let _basic_heading_style(body) = {
  // 设置章节编号格式
  set heading(
    numbering: (..nums) => {
      if nums.pos().len() == 1 {
        // 一级标题：第X章
        "第" + numbering("一", nums.pos().at(0)) + "章" + h(0.5em)
      } else if nums.pos().len() > 1 {
        // 二级及以下标题：数字编号格式
        numbering("1.1", ..nums.pos()) + h(0.75em)
      }
    },
  )

  // 一级标题格式：三号黑体居中
  show heading.where(level: 1): it => {
    pagebreak()
    set text(size: zh(3))

    set align(center)
    show regex("[0-9]+"): text.with(font: "Arial")
    v(1.155em)

    if it.body == [参考文献] {
      v(1.75em)
      it
    } else if it.body == [致#h(2em)谢] {
      v(0.725em)
      it
    } else {
      show: show-cn-fakebold
      [*#it*]
    }
    v(1em)
    par(leading: 1em)[#text(size: 0.0em)[#h(0.0em)]]
    v(-1.225em)
  }

  // 二级标题格式：四号黑体左对齐
  show heading.where(level: 2): it => {
    show: show-cn-fakebold
    set text(size: zh(4))
    set align(left)
    show regex("[0-9]+"): text.with(font: "Arial")
    v(0.3em)
    it
    par(leading: 1em)[#text(size: 0.0em)[#h(0.0em)]]
  }

  // 三级标题格式：小四号黑体左对齐
  show heading.where(level: 3): it => {
    show: show-cn-fakebold
    set text(size: zh(-4))
    set align(left)
    show regex("[0-9]+"): text.with(font: "Arial")
    it
    par(leading: 1em)[#text(size: 0.0em)[#h(0.0em)]]
  }

  body
}

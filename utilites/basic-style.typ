#import "@preview/cuti:0.3.0": show-cn-fakebold
#import "@preview/pointless-size:0.1.1": zh

// redact 函数：用等长的 'X' 替换内容（如果启用）
#let redact(body, enabled: false) = { // 移除 fill 和 height 参数
  if enabled {
    context {
      // 1. 确保 body 是 content 类型
      let body-content = if type(body) == str {[#body]} else {body}
      
      // 2. 测量原始内容的渲染宽度
      let body-width = measure(body-content).width
      
      // 3. 测量单个 'X' 在当前上下文的宽度
      let x-width = measure(text("X")).width
      
      // 4. 计算需要多少个 'X' 来匹配宽度 (避免除以零)
      let num-x = if x-width > 0pt {
        // 四舍五入到最接近的整数个 'X' (使用 calc 模块)
        calc.abs(calc.round(body-width / x-width))
      } else {
        1 // 如果 'X' 宽度为零，默认显示 1 个
      }

      // 5. 确保至少显示一个 'X' (使用 calc 模块)
      let final-num-x = int(calc.max(1, num-x))

      // 6. 生成并返回 'X' 字符串
      text("X" * final-num-x)
    }
  } else {
    // 如果未启用，确保返回的是 content 类型
    if type(body) == str {[#body]} else {body}
  }
}

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
      if page-num > 3 {
        text(font: "Times New Roman", size: zh(5))[#(page-num - 4)]
      }
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

#let _page_header_style(title: "", body) = {
  set page(
    paper: "a4",
    margin: (top: 3.8cm, bottom: 3.8cm, left: 3.2cm, right: 3.2cm),
    header-ascent: 12%,
    header: context {
      let page-number = counter(page).get().first()
      if page-number >= 3 {  // 从第三页开始显示页眉[^1]
        if calc.odd(page-number) {  // 奇数页显示一级标题[^2]
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
            let heading-number = counter(heading).at(current-heading.location()).first()
            set text(font: "SimSun", size: zh(5))
            align(center)[
              第#numbering("一", heading-number)章#h(0.5em)#current-heading.body
              #v(-8pt)
            ]
          }
        } else {  // 偶数页显示论文题目[^3]
          set text(font: "SimSun", size: zh(5))
          align(center)[
            #title
            #v(-8pt)
          ]
        }
        line(length: 100%, stroke: 0.5pt)
      }
    }
  )
  body
}


// 静态页眉样式，居中显示标题
#let _static_page_header_style(title: "", body) = {
  set page(
    header: context {
      set text(font: ("Times New Roman","SimSun"), size: zh(5))
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

// 设置代码块样式
#let _code_block_style(body) = {
  show raw.where(block: true): block => {
    set text(font: "SimHei", size: zh(-4))
    set align(left)
    set par(first-line-indent: 0em)
    block
  }
  
  body
}

#import "@preview/cuti:0.3.0": show-cn-fakebold
#import "@preview/tablex:0.0.9": gridx, hlinex, vlinex, colspanx, rowspanx
#import "@preview/pointless-size:0.1.1": zh

// 封面页
#let cover-page(
  title: "", // 论文标题
  author: "", // 作者
  student-id: "", // 学号
  department: "", // 学院名称
  major: "", // 专业名称
  session: "", // 届别
  supervisor: "", // 指导教师
  date: none, // 日期
  is-coop: false, // 是否校企合作项目
  ) = {
  set page(margin: (top: 3.8cm, bottom: 3.4cm, left: 3.2cm, right: 3.2cm))
  align(center)[
    #v(-1em)

    // 添加校企合作选项，放在右上角
    #place(
      top + right,
      dy: -4em,
      dx: 0em,
      [#text(font: "STkaiti")[校企合作：]
        #if is-coop {
          text(font: "STkaiti")[是]
          text(font: "Wingdings 2")[R]
          text(font: "STkaiti")[否 #sym.square]
        } else {
          text(font: "STkaiti")[是 #sym.square]
          text(font: "STkaiti")[否]
          text(font: "Wingdings 2", size: 13pt, baseline: 1.5pt)[R]
        }
      ],
    )
    #show: show-cn-fakebold
    #text(font: "STkaiti", size: zh("-0"))[*华侨大学*]
    #v(-1cm)
    #text(font: "STkaiti", size: zh("-0"))[*本科毕业论文*]
    #v(-1em)
    #image("../assets/校徽与中英文标准字中轴组合.png", width: 3.06cm)
    #v(1em)

    // 论文题目信息
    #gridx(
      columns: (2.44cm, 11.77cm),
      rows: 4em,
      align: (center, center),
      // [#text(font: "Microsoft YaHei", size: 22pt,  weight: 900)[题目：]], [#text(font: "Microsoft YaHei", size: 22pt,  weight: 900)[#title]],
      [#text(font: "Microsoft YaHei", size: 22pt, weight: 900)[#v(1em)题目：]],
      [#v(1em)#text(font: "Microsoft YaHei", size: 22pt, weight: 900)[#title]],
      hlinex(start: 1, stroke: 0.5pt),
      [#text(font: "Microsoft YaHei", size: 22pt, weight: 900)[]],
      hlinex(start: 1, stroke: 0.5pt),
    )
    #v(3em)

    // 学生信息表格
    #set text(size: zh(3))
    #gridx(
      columns: (3.49cm, 8.75cm),
      rows: 1.1cm,
      align: (center + bottom),
      [*学#h(2em)院*],
      [*#department*],
      hlinex(start: 1),
      [*专#h(2em)业*],
      [*#major*],
      hlinex(start: 1),
      [*届#h(2em)别*],
      [#text(font: ("Times New Roman", "SimSun"), size: zh(3), weight: "bold")[#session] #text(
          font: "SimSun",
          size: zh(3),
          stroke: 0.5pt,
        )[届]],
      hlinex(start: 1),
      [*学#h(2em)号*],
      [#text(font: "Times New Roman", size: zh(3), weight: "bold")[#student-id]],
      hlinex(start: 1),
      [*姓#h(2em)名*],
      [*#author*],
      hlinex(start: 1),
      [*指导教师*],
      [*#supervisor*],
      hlinex(start: 1),
    )
    #v(2em)

    // 页脚日期信息
    #v(-0.5em)
    #text(size: zh(4))[*华侨大学教务处印制*]
    #v(0.25em)
    #if date != none {
      text(size: zh(4))[#date.split("年").at(0)*年*#date.split("年").at(1).split("月").at(0)*月*]
    }
  ]

  pagebreak()
  counter(page).update(0)
  pagebreak()

  counter(page).update(2)
}